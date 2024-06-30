## Managing MDM Settings with Intune

My two go-to configurations for Intune are the **Settings Catalog** or **Templates** -> **Preference File**.

Preference File settings can be managed in Intune using the **Templates** -> **Preference File** configuration.  
Settings Catalog settings can be managed in Intune using the **Settings Catalog** configuration.  

The [Preference Files](https://github.com/gilburns/IntuneMac/blob/main/Configuration/README-Preference%20File.md) that you create and upload into Intune are also portable and sharable as XML files.  	
    
    
The [Settings Catalog](https://github.com/gilburns/IntuneMac/blob/main/Configuration/README-Settings%20Catalog.md) files are easily exportable and importable from Intune in any browser. No fancy connection to the Graph API like most of the other configurations is required.  


If you are migrating from another MDM platform, a quick and dirty migration option would be to simply export all the mobileconfig files from the current MDM and import them as is directly into Intune as Custom configuration.  

The [Custom](https://github.com/gilburns/IntuneMac/blob/main/Configuration/README-Custom.md) files are standard Apple mobileconfig files.    
    
        
Manage your Mac configuration profiles in Intune here:
[https://intune.microsoft.com/#view/Microsoft_Intune_DeviceSettings/DevicesMacOsMenu/~/configuration](https://intune.microsoft.com/#view/Microsoft_Intune_DeviceSettings/DevicesMacOsMenu/~/configuration)  
