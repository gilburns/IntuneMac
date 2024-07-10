## Managing Edge Browser Settings

Microsoft has a [Settings Catalog](https://learn.microsoft.com/en-us/mem/intune/configuration/settings-catalog?tabs=sc-search-filter%2Csc-reporting) configuration available for Edge. I recommend using that for the configuration that it currently supports. You can combine that configuration with a **Template -> Preference File** setting and both configurations are magically combined when applied to the Managed Preferences.  

The one setting that the Settings Catalog configuration is missing is the [Managed Favorites](https://learn.microsoft.com/en-us/DeployEdge/microsoft-edge-policies#managedfavorites) key. The file here has a fairly complex configuration as an example. It contains favorites along with favorites inside sub folders.

![Edge Favortes](https://github.com/gilburns/IntuneMac/blob/main/Configuration/Microsoft%20Edge%20Favorites/Microsoft%20Edge%20Favorites.png "Edge Favorites")  
  
    
Feel free to add any other keys to the Preference file that you want/need to manage. Just don't duplicate keys that you might be already managing in a Settings Catalog configuration.  

Microsoft Edge policies keys:  
[https://learn.microsoft.com/en-us/DeployEdge/microsoft-edge-policies](https://learn.microsoft.com/en-us/DeployEdge/microsoft-edge-policies)
    
Review MDM settings applied to the Edge browser:  
[edge://policy](edge://policy)
    
Intune documentation on configuring Edge with preference files:  
[https://learn.microsoft.com/en-us/deployedge/configure-microsoft-edge-on-mac](https://learn.microsoft.com/en-us/deployedge/configure-microsoft-edge-on-mac)
    
Intune documentation on working with preference files:  
[https://learn.microsoft.com/en-us/mem/intune/configuration/preference-file-settings-macos](https://learn.microsoft.com/en-us/mem/intune/configuration/preference-file-settings-macos)
