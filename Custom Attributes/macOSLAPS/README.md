# macOSLAPS Custom attributes for Intune
      
Three custom attributes available:  
* macOSLAPS - Current Password  
* macOSLAPS - Installed Version  
* macOSLAPS - Password Expiration Date  
    

Because of the way Intune collects custom attributes and runs script. I thought it best to add the password rotation and custom attribute inventory to the same script. That way, it reamins more in sync.   

Otherwise I believe it might get into a situation where the LAPS password was collected into inventory and then the separate rotation script would run shortly after and possibly have the password unknown until the next inventory collection.  

So the [macOSLAPS - Current Password](https://github.com/gilburns/IntuneMac/blob/main/Custom%20Attributes/macOSLAPS/macOSLAPS%20-%20Current%20Password.sh) script will start rotation if it hasn't started yet, update the password if it has reached the time to rotate, or simply collect the password if that is all that needs to happen. It also leaves a separate file behind for the [macOSLAPS - Password Expiration Date](https://github.com/gilburns/IntuneMac/blob/main/Custom%20Attributes/macOSLAPS/macOSLAPS%20-%20Password%20Expiration%20Date.sh) script to capture the next expiration date.

### Add Custom Attributes to Intune:  
![Custom Attributes](https://github.com/gilburns/IntuneMac/blob/main/Custom%20Attributes/Add%20Custom%20Attributes.png "Custom Attributes")    
    
    
    
Microsoft article about Custom Attributes:  
[https://learn.microsoft.com/en-us/mem/intune/apps/macos-shell-scripts#custom-attributes-for-macos](https://learn.microsoft.com/en-us/mem/intune/apps/macos-shell-scripts#custom-attributes-for-macos)



