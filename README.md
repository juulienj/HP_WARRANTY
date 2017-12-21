# HP WARRANTY

This Powershell script made for great sysadmin who wants to automate the HP Warranty details. 

This script use the HP CSS API : https://developers.hp.com/

## Getting Started

### Prerequisites

What things you need to do before : 

* Have a HP Developper account (subscribe at https://developers.hp.com)
* Create new HP app from HP Developer portal


### Installing

Call the script with this command : 

```
. "PATH_TO_YOUR_FUNCTIONS\FunctionHPW.ps1"
```

And you can call date details with :  

```
$getInfo = Get-War
$endDate = (Get-Date $getInfo.endDate -Format 'dd/MM/yyyy')
$startDate = (Get-Date $getInfo.startDate -Format 'dd/MM/yyyy')
```

You can format the date by add -Format argument.

## Authors

* **Julien J.** - [Portfolio](https://julienj.fr)
