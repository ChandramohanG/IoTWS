
# This script need to be run after the Infrastructure was created using ARM template

Login-AzureRmAccount

Set-AzureRmContext -Subscription 'Windows Azure MSDN - Visual Studio Ultimate'


# Variables
$resourceGroupName = "RG_IoTRM"

# Proivde the storage account name for storing data for Europe region, ex. europedatastorage1
$europeStorageaccountname = "europedatastorage1" 

# Proivde the storage account name for storing data for US region ex. usdatastorage1
$USRegionstorageaccountname = "usdatastorage1" 

# Proivde the storage account name for storing data for any other regions ex. generaldatastorage1
$generastorageaccountname = "generaldatastorage1" 


$storageAccount = Get-AzureRmStorageAccount -ResourceGroupName $resourceGroupName -Name $europeStorageaccountname

# Set the name of the storage account and the SKU name. 
$storageAccountName = "testpshstorage11"
$skuName = "Standard_LRS"

# Create the storage account.
$storageAccount = New-AzureRmStorageAccount -ResourceGroupName $resourceGroupName `
  -Name $storageAccountName `
  -Location WestEurope `
  -SkuName $skuName

Set-AzureRmCurrentStorageAccount -StorageAccountName $storageAccountName -ResourceGroupName $resourceGroupName
New-AzureStorageContainer -Name "containerdata" -Permission 


# Container creation for Europe Region storage account.. 
$key = Get-AzureRmStorageAccountKey -ResourceGroupName $resourceGroupName -Name europedatastorage1| Select-Object -First 1 -ExpandProperty Value
$ctx = New-AzureStorageContext -StorageAccountName europedatastorage1 -StorageAccountKey $key

New-AzureStorageContainer -Context $storageAccount.Context -Name "container4data" -Permission Blob -Verbose

Set-AzureRmStorageAccount -ResourceGroupName $resourceGroupName  -AccountName $europeStorageaccountname -AccessTier Cool

#Remove-AzureStorageContainer -Name container4data -Context $ctx

# Container creation for Europe Region storage account.. 
$ctx = New-AzureStorageContext -StorageAccountName $USRegionstorageaccountname -StorageAccountKey (Get-AzureRmStorageAccountKey -ResourceGroupName $resourceGroupName -Name $USRegionstorageaccountname | Select-Object -First 1 -ExpandProperty Value)
New-AzureStorageContainer -Context $ctx -Name "container4data"  -Permission Container

# Container creation for Europe Region storage account.. 
$ctx = New-AzureStorageContext -StorageAccountName $generastorageaccountname -StorageAccountKey (Get-AzureRmStorageAccountKey -ResourceGroupName $resourceGroupName -Name $generastorageaccountname | Select-Object -First 1 -ExpandProperty Value)
New-AzureStorageContainer -Context $ctx -Name "container4data" -Permission Container

