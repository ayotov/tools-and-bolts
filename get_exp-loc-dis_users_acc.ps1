Import-Module ActiveDirectory

Write-Output "***********************************************************************"

Write-Output "List of locked accounts:"
Search-ADAccount -LockedOut -SearchScope Subtree | Format-Table -Property LockedOut,Enabled,Name,SamAccountName,LastLogonDate,DistinguishedName
# -Server parameter to specify DC

Write-Output "***********************************************************************"

Write-Output "List of expired accounts:"
Search-ADAccount -AccountExpired -SearchScope Subtree | Format-Table -Property Enabled,LockedOut,Name,SamAccountName,LastLogonDate,AccountExpirationDate,DistinguishedName

Write-Output "***********************************************************************"

Write-Output "List of disabled accounts:"
Search-ADAccount -AccountDisabled -SearchScope Subtree | Format-Table -Property Enabled,LockedOut,Name,SamAccountName,AccountExpirationDate,LastLogonDate

Write-Output "***********************************************************************"
