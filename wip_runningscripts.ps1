
# Login
Login-AzureRmAccount

Set-AzureRmContext -Subscription 'Windows Azure MSDN - Visual Studio Ultimate'

$resourceGroupName = "RG_IoT"
$resourceGroupLocation = "West Europe"

New-AzureRmResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation

