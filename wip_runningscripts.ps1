
# Login
Login-AzureRmAccount

Set-AzureRmContext -Subscription 'Windows Azure MSDN - Visual Studio Ultimate'

$resourceGroupName = "RG_IoTMonitor"
$resourceGroupLocation = "West Europe"
$IoTHubName = "IoTMonitoring"
$inputName ="iotdata"

New-AzureRmResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation

New-AzureRmIotHub -ResourceGroupName $resourceGroupName -Name $IoTHubName -SkuName "F1" -Location $resourceGroupLocation  

Get-AzureRmIotHub -ResourceGroupName RG_IoTMonitor  

#Get-AzureRmStreamAnalyticsInput -ResourceGroupName RG_IoT

#New-AzureRmResourceGroupDeployment  -ResourceGroupName RG_IoTMonitor -DeploymentDebugLogLevel All `
#  -TemplateFile F:\GitCode\IoTWateringSystem\azuredeploy.json -TemplateParameterFile F:\GitCode\IoTWateringSystem\azuredeploy.parameter.json 
