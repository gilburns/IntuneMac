## Managing Custom mobileconfig File Settings

Custom mobileconfig File settings can be managed in Intune using the **Templates** -> **Custom** configuration.  
(These might be vendor provided mobileconfig files, mobileconfig files exported from another MDM solution, or ones that you created in some other management software.)  
    
Click the **Create** -> **New Policy** button.  

* For Profile type, select **Templates**, then select **Custom** from the list. Then click the **Create** button.  
* Name your profile using a preferred naming standard and then click **Next**.  
* Specify the **Custom configuration profile name**.  
* Specify the **Deployment channel**.  (Device or User)
* Select the **Configuration profile file** you want to use and click the **Next** button.  
* Assign the profile to your appropriate device or user group.  
  
  
  
### Intune Templates -> Custom import example:  
![Import Custom File](https://github.com/gilburns/IntuneMac/blob/main/Configuration/Custom%20File%20Configuration.png "Import Custom File")    
  
  
Intune documentation on working with preference files:  
[https://learn.microsoft.com/en-us/mem/intune/configuration/custom-settings-macos](https://learn.microsoft.com/en-us/mem/intune/configuration/custom-settings-macos)

To use a mobileconfig file that was exported from Jamf or some other MDM vendor, you must remove the certificate signing before you can import the file into Intune:  
    
Remove signing:  
```openssl smime -inform DER -verify -in "/path/to/signed.mobileconfig" -noverify -out "/path/to/unsigned.mobileconfig"```
