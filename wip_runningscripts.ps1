
# Login
Login-AzureRmAccount

Set-AzureRmContext -Subscription 'Windows Azure MSDN - Visual Studio Ultimate'

$resourceGroupName = "RG_IoTMonitor"
$resourceGroupLocation = "West Europe"
$IoTHubName = "IoTMonitoring"
$inputName ="iotdata"

New-AzureRmResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation

New-AzureRmIotHub -ResourceGroupName $resourceGroupName -Name $IoTHubName -SkuName "S1" -Location $resourceGroupLocation

Get-AzureRmIotHub -ResourceGroupName RG_IoTMonitor  

#Get-AzureRmStreamAnalyticsInput -ResourceGroupName RG_IoT

New-AzureRmResourceGroupDeployment  -ResourceGroupName RG_IoTMonitor -DeploymentDebugLogLevel All `
  -TemplateFile F:\GitCode\IoTWateringSystem\azuredeploy.json -TemplateParameterFile F:\GitCode\IoTWateringSystem\azuredeploy.parameter.json 


#S2 Standard is recommended
$webappname="iOTManagementApp"
New-AzureRmAppServicePlan -Name $webappname -Location $resourceGroupLocation -ResourceGroupName $resourceGroupName -Tier Free

New-AzureRmWebApp -Name $webappname -Location 'West Europe' -AppServicePlan $webappname -ResourceGroupName $resourceGroupName

New-AzureRmStreamAnalyticsJob -Name "StreamAnalyticsJob" -File F:\GitCode\IoTWateringSystem\streamjob.json -ResourceGroupName $resourceGroupName


                    {
                      "properties": {
                        "type": "Stream",
                        "datasource": {
                          "type": "Microsoft.Devices/IotHubs",
                          "properties": {
                            "iotHubNamespace": "IoTMonitoring",
                            "sharedAccessPolicyName": "iothubowner",
                            "endpoint": "messages/events"
                          }
                        },
                        "serialization": {
                          "type": "Json",
                          "properties": {
                            "encoding": "UTF8"
                          }
                        },
                        "etag": "daaf57ed-043e-45f0-92f5-c1915c3acd6c"
                      },
                      "id": "/subscriptions/6bff6c5c-be29-427b-a26d-dbecde768418/resourceGroups/RG_IOT/providers/Microsoft.StreamAnalytics/streamingjobs/StreamAnalytics/inputs/iotdata",
                      "name": "iotdata",
                      "type": "Microsoft.StreamAnalytics/streamingjobs/inputs"
                    }