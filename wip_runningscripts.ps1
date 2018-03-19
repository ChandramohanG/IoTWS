
# Login
Login-AzureRmAccount

Set-AzureRmContext -Subscription 'Windows Azure MSDN - Visual Studio Ultimate'

$resourceGroupName = "RG_IoTMonitor"
$resourceGroupLocation = "West Europe"
$IoTHubName = "IoTMonitoring"
$inputName ="iotdata"

New-AzureRmResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation

Set-AzureRmResourceGroup -Name $resourceGroupName -Tag @{Department="IoT"}

New-AzureRmIotHub -ResourceGroupName $resourceGroupName -Name "iotmonitor" -SkuName "F1" -Location $resourceGroupLocation  


Get-AzureRmIotHub -ResourceGroupName RG_IoTMonitor  

Get-AzureRmStreamAnalyticsInput -ResourceGroupName RG_IoT
