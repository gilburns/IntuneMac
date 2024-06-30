## Managing Chrome Browser Settings

It seems like it should be really trivial for Microsoft to add a Settings Catalog configuration for Google Chrome for Mac. The settings keys, for the most part are exactly the same as Edge. (After all, Edge is built on Chromium.) But, they have not added it yet. So, for now, the **Templates -> Preference File** option works well.  

### Managed Bookmarks included in the Chrome example:  
![Chrome Bookmarks](https://github.com/gilburns/IntuneMac/blob/main/Configuration/Google%20Chrome/Google%20Chrome%20Managed%20Bookmarks.png "Chrome Bookmarks")    


Google Chrome policies keys:  
[https://chromeenterprise.google/policies/](https://chromeenterprise.google/policies/)  

One thing to watch out for when consulting the Chrome policy key documentation is nearly all (probably all) of the Mac plist examples contain invalid formatting and key values.  

The [Extension Settings](https://chromeenterprise.google/policies/#ExtensionSettings) is a good example of this problem: (Abbreviated here for clarity)

Invalid Google Example (for the override_update_url key):  
```	<key>ExtensionSettings</key>  
	<dict>  
		<key>ghijklmnopabcdefghijklmnopabcdef</key>  
		<dict>  
			<key>installation_mode</key>  
			<string>force_installed</string>  
			<key>override_update_url</key>  
			<boolean>true</boolean>  
			<key>update_url</key>  
			<string>https://example.com/update_url</string>  
		</dict>  
	</dict>
```  
  
Valid plist (Notice how the boolean is represented in a valid Mac plist):  
```	 <key>ExtensionSettings</key>  
	<dict>  
		<key>ghijklmnopabcdefghijklmnopabcdef</key>  
		<dict>  
			<key>installation_mode</key>  
			<string>force_installed</string>  
			<key>override_update_url</key>  
			<true/>  
			<key>update_url</key>  
			<string>https://example.com/update_url</string>  
		</dict>  
	</dict>  
```  

If you use the Google examples, just be aware that they didn't proof their examples in a real world. Proceed with caution.    
  
  
Google Chrome Update Policies:  
[https://support.google.com/chrome/a/answer/7591084?hl=en&ref_topic=9023245&sjid=1363281359496227844-NC](https://support.google.com/chrome/a/answer/7591084?hl=en&ref_topic=9023245&sjid=1363281359496227844-NC)

Mac documentation:  
[https://support.google.com/chrome/a/topic/7590800?sjid=1363281359496227844-NC](https://support.google.com/chrome/a/topic/7590800?sjid=1363281359496227844-NC)

Review MDM settings applied to the Chrome browser:  
[chrome://policy/](chrome://policy/)

Intune documentation on working with preference files:  
[https://learn.microsoft.com/en-us/mem/intune/configuration/preference-file-settings-macos](https://learn.microsoft.com/en-us/mem/intune/configuration/preference-file-settings-macos)
