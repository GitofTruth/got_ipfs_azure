az vm show -d -g $1 -n $2 --query publicIps -o tsv
