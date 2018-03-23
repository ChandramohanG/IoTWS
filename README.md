# IoTWS

Work In Progress..

<a href="https://azuredeploy.net/?repository=https://github.com/chandramohanG/IoTWS" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

<a href="http://old.armviz.io/#/?load=https://raw.githubusercontent.com/ChandramohanG/IoTWS/master/azuredeploy.json" target="_blank">
  <img src="http://armviz.io/visualizebutton.png"/>
</a>


## Summary: ##
-------
Please go through IoTWateringSystem.docx and TechDesign.pptx. Estimates.xlsx has the cost estimates for this proposed infrastructure.

Use Deploy to Azure to deploy the infrastructure. 

## Parameters: ##

* iotHubName 			- Name of the IoT Hub
 
* IoTManagementAppPlanName	- Web Portal App Service Plan Name

* IoTManagementAppName		- Web Portal Web Site Name

* IoTManagementAppPlanSkuName: 	- App Service SKU 		Recommended: S3 

* ioTHub_skuName:			- ioTHub Plan: 		Recommended: S3 

* capacityUnits:			- ioTHub Unit		Recommended: 4

* Streamingjobname		- Stream Analytics Job Name

* Storageeuropedata_name	- Storage for Europe region data

* StorageUSdata_name		- Storage for US region data

* Storagegeneraldata_name	- Storage for General data

* UserandReferenceData_name	- Storage for user and reference data

Note:
	Storage Parameters should be unique and in lower case.

Manual config changes: 
	Once deployed, need to create the storage containers manaully and provide shared access key of the storage key to the streaming Analytics storage outputs.

Afer these changes and starting the Stream Analytics, we can use simulator to feed the data and test the solution.


IoT Watering System: The idea is that a farmer will have a number of water pumps on their farm that ensures that there is a steady flow of water for irrigation or livestock. As the farms can be quite vast, especially in places like Australia, the system will allow the farmer to monitor that all water pumps are working successfully or provide a notification when they are malfunctioning.



