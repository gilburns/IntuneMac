## Managing Edge Browser Settings

Microsoft has a [Settings Catalog](https://learn.microsoft.com/en-us/mem/intune/configuration/settings-catalog?tabs=sc-search-filter%2Csc-reporting) configuration available for Edge. I recommend using that for the configuration that it currently supports. You can combine that configuration with a **Template -> Preference File** setting and both configurations are magically combined when applied to the Managed Preferences.  

The one setting that the Settings Catalog configuration is missing is the [Managed Favorites](https://learn.microsoft.com/en-us/DeployEdge/microsoft-edge-policies#managedfavorites) key. The file here has a fairly complex configuration as an example. It contains favorites along with favorites inside sub folders.

Feel free to add any other keys to the Preference file that you want/need to manage. Just don't duplicate keys that you might be already managing in a Settings Catalog configuration.  

Microsoft has not yet added Settings Catalog configuration for managing [EdgeUpdater](https://learn.microsoft.com/en-us/deployedge/microsoft-edge-edgeupdater-policies-mac). If you would like to manage it, the preference file here is an example of how to configure it. (Surprise, it is managed very similar to the Google Keystone updater for Chrome.)  

Microsoft Edge policies keys:  
[https://learn.microsoft.com/en-us/DeployEdge/microsoft-edge-policies](https://learn.microsoft.com/en-us/DeployEdge/microsoft-edge-policies)

Microsoft Edge Update Policies:  
[https://learn.microsoft.com/en-us/deployedge/microsoft-edge-edgeupdater-policies-mac](https://learn.microsoft.com/en-us/deployedge/microsoft-edge-edgeupdater-policies-mac)

macOS switches from Microsoft AutoUpdate to EdgeUpdater:  
[https://learn.microsoft.com/en-us/deployedge/edge-learnmore-edgeupdater-for-macos](https://learn.microsoft.com/en-us/deployedge/edge-learnmore-edgeupdater-for-macos)

Review MDM settings applied to the Edge browser:  
[edge://policy](edge://policy)

Intune documentation on configuring Edge with preference files:  
[https://learn.microsoft.com/en-us/deployedge/configure-microsoft-edge-on-mac](https://learn.microsoft.com/en-us/deployedge/configure-microsoft-edge-on-mac)

Intune documentation on working with preference files:  
[https://learn.microsoft.com/en-us/mem/intune/configuration/preference-file-settings-macos](https://learn.microsoft.com/en-us/mem/intune/configuration/preference-file-settings-macos)
