## Managing Settings Catalog configuration  

Settings Catalog settings can be managed in Intune using the **Settings Catalog** configuration.  

### Create new Settings Catalog configuration:  
Click the **Create** -> **New Policy** button.   

* For Profile type, select **Settings Catalog**. Then click the **Create** button.  
* Name your profile using a preferred naming standard and then click **Next**.  
* Click the **Add settings** button, to find the setting you desire to manage.  
* Confirm all your settings are present, then click the **Next** button.  
* Assign the profile to your appropriate device or user group.  
  
Detailed **Settings Catalog** instructions can be found here:  
[https://learn.microsoft.com/en-us/mem/intune/configuration/settings-catalog?tabs=sc-search-filter%2Csc-reporting#create-the-policy](https://learn.microsoft.com/en-us/mem/intune/configuration/settings-catalog?tabs=sc-search-filter%2Csc-reporting#create-the-policy)  
  
  
### Import Settings Catalog configuration:  
Click the **Create** -> **Import Policy** button.   

* Click **Browse for files**, or drag the json file to the drop zone.
* Name your profile using a preferred naming standard and optionally provide a description, then click **Save**.  
* Once it is saved, you then have the option to **View policy** or **close** the import panel.  
* Your policy is not scoped by default. You should review the newly imported policy and make sure the settings match what you expect.
* When you are satisfied with the settings, assign the profile to your appropriate device or user group.  

  
  
Intune documentation on working with settings catalog configuration:  
[https://learn.microsoft.com/en-us/mem/intune/configuration/settings-catalog](https://learn.microsoft.com/en-us/mem/intune/configuration/settings-catalog)  


For a list of the settings in the Settings Catalog, go to the IntunePMFiles / DeviceConfig GitHub repository (Covers all platforms):  
[https://github.com/IntunePMFiles/DeviceConfig](https://github.com/IntunePMFiles/DeviceConfig)  

Download the most recent Excel file and filter the list to see the platform(s) that you are interested in.  