########################################################################################
# Powershell Script: Get domain user members and add to confluence-users group
# Editor: Nolan Ratu
# IN719
########################################################################################

Import-module ActiveDirectory

$Source_Group = "CN=Domain Users,CN=Users,DC=groupe,DC=sqrawler,DC=com"
$Destination_Group = "CN=confluence-users,CN=Users,DC=groupe,DC=sqrawler,DC=com"

$Target = Get-ADGroupMember -Identity $Source_Group -Recursive
foreach ($Person in $Target) {
	
	Add-ADGroupMember -Identity $Destination_Group -Members $Person.distinguishedName

}


