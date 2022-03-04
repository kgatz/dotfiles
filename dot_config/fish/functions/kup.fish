function kup -d "Update Kubernetes configs"
    if test $argv[1] = "gcp" 
        __gcp
    else if test $argv[1] = "azure" 
        __azure
    else
        __azure
        __gcp
    end
end

function __azure
  [ -e ~/.kube/configs/azure.yaml ] && rm -- ~/.kube/configs/azure.yaml
  for id in (az account list | jq -r .[].id)
    echo $id
    set clusters (az aks list --subscription $id)
    for i in (seq 1 (echo $clusters | jq '. | length'))
      set i $i-1
      set name (echo $clusters | jq -r ".[$i] | .name")
      set rg (echo $clusters | jq -r ".[$i] | .resourceGroup")
      echo "$rg -- $name"
          az aks get-credentials --resource-group $rg --name $name --file ~/.kube/configs/azure.yaml --context "aks_$rg-$name" --only-show-errors --subscription $id
    end
  end
end

function __gcp
  [ -e ~/.kube/configs/gcp.yaml ] && rm -- ~/.kube/configs/gcp.yaml
  for id in (gcloud projects list --format=json | jq -r .[].projectId)
    echo $id
    set clusters  (gcloud container clusters list --project=$id --format=json)
    for i in (seq 1 (echo $clusters | jq '. | length'))
      set i $i-1 
      set name (echo $clusters | jq -r ".[$i] | .name")
      set zone (echo $clusters | jq -r ".[$i] | .zone")
      KUBECONFIG="~/.kube/configs/gcp.yaml" gcloud container clusters get-credentials $name --zone=$zone --project=$id --quiet
    end 
  end
end
