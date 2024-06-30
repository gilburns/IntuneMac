# Custom attributes for macOS

You can create custom attribute which enable you to collect custom properties from managed macOS device using shell scripts. These are functionally equivalent to Jamf Extension Attribute.
  
Details:  
* The shell script must echo the attribute to be reported and the data type of the output must match the data type of attribute in the custom attribute profile.  
* The result returned by the shell script must be 20KB or less.  
* When using Date type attributes, ensure that the shell script returns dates in ISO-8601 format.  
    
    
Microsoft article about Custom Attributes:  
[https://learn.microsoft.com/en-us/mem/intune/apps/macos-shell-scripts#custom-attributes-for-macos](https://learn.microsoft.com/en-us/mem/intune/apps/macos-shell-scripts#custom-attributes-for-macos)



