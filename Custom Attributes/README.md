# Custom attributes for macOS

You can create custom attribute which enable you to collect custom properties from managed macOS device using shell scripts. These are functionally equivalent to Jamf Extension Attributes.
  
Details:  
* The shell script must echo the attribute to be reported.  
* The data type of the output must match the data type of attribute in the custom attribute profile.  
* The result returned by the shell script must be 20KB or less.  
* Supported data types:
	- String
	- Integer
	- Date
* When using Date type attributes, ensure that the shell script returns dates in [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) format.  
    

### Add Custom Attributes to Intune:  
![Custom Attributes](https://github.com/gilburns/IntuneMac/blob/main/Custom%20Attributes/Add%20Custom%20Attributes.png "Custom Attributes")    
    
    
    
Microsoft article about Custom Attributes:  
[https://learn.microsoft.com/en-us/mem/intune/apps/macos-shell-scripts#custom-attributes-for-macos](https://learn.microsoft.com/en-us/mem/intune/apps/macos-shell-scripts#custom-attributes-for-macos)



