# Intune scripts for macOS

You can create shell scripts to extend device management capabilities in Intune.   

Script Details:  
* Shell scripts begin with #! and must be in a valid location such as #!/bin/sh or #!/usr/bin/env zsh.
* Command-line interpreters for the applicable shells are installed.
* Shell scripts require that the Microsoft Intune management agent is successfully installed on the macOS device. For more information, see Microsoft Intune management agent for macOS.
* Shell scripts run in parallel on devices as separate processes.
* Shell scripts that are run as the signed-in user will run for all currently signed-in user accounts on the device at the time of the run.
* An end user is required to sign in to the device to execute scripts running as a signed-in user.
* Root user privileges are required if the script requires making changes that a standard user account cannot.
* Shell scripts will attempt to run more frequently than the chosen script frequency for certain conditions, such as if the disk is full, if the storage location is tampered with, if the local cache is deleted, or if the Mac device restarts.
* Shell scripts that are running for longer than 60 minutes are stopped and reported as "failed".

    

### Add Scripts to Intune:  
![Scripts](https://github.com/gilburns/IntuneMac/blob/main/Scripts/Add%20Script.png "Add Scripts")    
    
### Scripts settings:  
![Scripts](https://github.com/gilburns/IntuneMac/blob/main/Scripts/Script%20additional%20settings.png "Add Scripts")    
    
    
Script Settings:  

* Frequency Options:
	- Not Configured (Run once)
	- Every 15 minutes
	- Every 30 minutes
	- Every 1 hour
	- Every 2 hours
	- Every 3 hours
	- Every 6 hours
	- Every 12 hours
	- Every 1 week
	- Every 2 weeks

* Retry Options:
	- Not Configured (No retries if it fails)
	- 1 time
	- 2 times
	- 3 times
	
    
    
Microsoft article about Shell Scripts:  
[https://learn.microsoft.com/en-us/mem/intune/apps/macos-shell-scripts](https://learn.microsoft.com/en-us/mem/intune/apps/macos-shell-scripts)



