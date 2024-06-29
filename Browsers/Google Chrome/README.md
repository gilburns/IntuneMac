## Managing Chrome Browser Settings

It seems like it should be really trivial for Microsoft to add a Settings Catalog configuration for Google Chrome for Mac. The settings keys, for the most part are exactly the same. (After all, Edge is built on Chromium.) But, they have not added it yet. So, for now, the **Templates -> Preference File** option works well.  


Google Chrome policies keys:  
[https://chromeenterprise.google/policies/](https://chromeenterprise.google/policies/)  

One thing to watch out for when consulting the Chrome policy key documentation is nearly all (probably all) of the Mac plist examples contain invalid formatting and key names.  

The Extension Settings is a good example of this problem: (Abbreviated here for clarity)

Invalid Example:  
	`<key>ExtensionSettings</key>  
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
	</dict>`  
  
Valid plist:  
	`<key>ExtensionSettings</key>  
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
	</dict>`  
  

Google Chrome Update Policies:  
[https://support.google.com/chrome/a/answer/7591084?hl=en&ref_topic=9023245&sjid=1363281359496227844-NC](https://support.google.com/chrome/a/answer/7591084?hl=en&ref_topic=9023245&sjid=1363281359496227844-NC)

Mac documentation:  
[https://support.google.com/chrome/a/topic/7590800?sjid=1363281359496227844-NC](https://support.google.com/chrome/a/topic/7590800?sjid=1363281359496227844-NC)

Review MDM settings applied to the Chrome browser:  
[chrome://policy/](chrome://policy/)

Intune documentation on working with preference files:  
[https://learn.microsoft.com/en-us/mem/intune/configuration/preference-file-settings-macos](https://learn.microsoft.com/en-us/mem/intune/configuration/preference-file-settings-macos)
