## Microsoft Edge Browser CIS Settings

Microsoft has a [Settings Catalog](https://learn.microsoft.com/en-us/mem/intune/configuration/settings-catalog?tabs=sc-search-filter%2Csc-reporting) configuration available for Edge. I recommend using that for the configuration that it currently supports.  

Settings Catalog settings can be managed in Intune using the **Settings Catalog** configuration.  

The [Center for Internet Security](https://www.cisecurity.org) provides secure configuration guidelines developed for [Microsoft Web Browsers](https://www.cisecurity.org/benchmark/microsoft_internet_explorer).  

I have configured two **Settings Catalog** configurations that largely implement their recommendations for Microsoft Edge. A few of the recommendations they provide are not currently supported on the Mac configuration, but most are.  

Level 1 configurations are provided in one file. Level 2 configuration build on top of level 1 and are provided in a separate configuration file. So, to achieve level 2, both configurations should be applied to machines.  
    
    
Detailed instructions for creating **Settings Catalog** configuration can be found here:  
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

    
Common Tasks using the Settings Catalog:  
[https://learn.microsoft.com/en-us/mem/intune/configuration/settings-catalog-common-features](https://learn.microsoft.com/en-us/mem/intune/configuration/settings-catalog-common-features)  
    
For a list of the settings in the Settings Catalog, go to the IntunePMFiles / DeviceConfig GitHub repository (Covers all platforms):  
[https://github.com/IntunePMFiles/DeviceConfig](https://github.com/IntunePMFiles/DeviceConfig)  

Download the most recent Excel file and filter the list to see the platform(s) that you are interested in.  