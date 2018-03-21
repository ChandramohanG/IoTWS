

# This script need to be run after the Infrastructure was created using ARM template


# Variables
$resourceGroupName = "RG_IoTMonitor"

# Proivde the storage account name for storing data for Europe region, ex. europedatastorage1
$europeStorageaccountname = "europedatastorage1" 

# Proivde the storage account name for storing data for US region ex. usdatastorage1
$USRegionstorageaccountname = "usdatastorage1" 

# Proivde the storage account name for storing data for any other regions ex. generaldatastorage1
$generastorageaccountname = "generaldatastorage1" 


# Container creation for Europe Region storage account.. 
$ctx = New-AzureStorageContext -StorageAccountName $europeStorageaccountname -StorageAccountKey (Get-AzureRmStorageAccountKey -ResourceGroupName $resourceGroupName -Name $europeStorageaccountname | Select-Object -First 1 -ExpandProperty Value)
New-AzureStorageContainer -Context $ctx -Name "container4data"

# Container creation for Europe Region storage account.. 
$ctx = New-AzureStorageContext -StorageAccountName $USRegionstorageaccountname -StorageAccountKey (Get-AzureRmStorageAccountKey -ResourceGroupName $resourceGroupName -Name $USRegionstorageaccountname | Select-Object -First 1 -ExpandProperty Value)
New-AzureStorageContainer -Context $ctx -Name "container4data"

# Container creation for Europe Region storage account.. 
$ctx = New-AzureStorageContext -StorageAccountName $generastorageaccountname -StorageAccountKey (Get-AzureRmStorageAccountKey -ResourceGroupName $resourceGroupName -Name $generastorageaccountname | Select-Object -First 1 -ExpandProperty Value)
New-AzureStorageContainer -Context $ctx -Name "container4data"

