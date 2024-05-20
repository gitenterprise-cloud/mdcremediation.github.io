SUB_IDS=$(az account list --query "[? state=='Enabled'].id" -o tsv)
for sub in $SUB_IDS
do
	az role assignment list --scope "/subscriptions/$sub" --query "[].{Name:principalName,Type:principalType,Role:roleDefinitionName,Scope:scope,LastUpdate:updatedOn}"
done
