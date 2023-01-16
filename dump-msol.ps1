####################################################################
#             Script for auditing MS Online resources              #
#                               v0.1                               #
#                Developed by Angel Yotov @ 2022                   #
####################################################################

Clear-Host
Write-Host "                                ,/." -ForegroundColor Blue
Write-Host "                          *###############" -ForegroundColor Blue
Write-Host "                        #####.         #####(" -ForegroundColor Blue
Write-Host "              #############               ####." -ForegroundColor Blue
Write-Host "            #####    ####                  *###" -ForegroundColor Blue
Write-Host "           ####              Azure          ####" -ForegroundColor Blue
Write-Host "        #######                            #######" -ForegroundColor Blue
Write-Host "     ######       Microsoft       Online      #####" -ForegroundColor Blue
Write-Host "    ####                                        ####" -ForegroundColor Blue
Write-Host "   .###                   Office 365              ###" -ForegroundColor Blue
Write-Host "   .###                                             ###" -ForegroundColor Blue
Write-Host "    ####   Script for auditing MS Online resources ###" -ForegroundColor Blue
Write-Host "     #####                                     #####*" -ForegroundColor Blue
Write-Host "       ###########################################" -ForegroundColor Blue
Write-Host ""
Write-Host "    Set-MsolCompanySettings -UsersPermissionToReadOtherUsersEnabled $false" -ForegroundColor Blue
Write-Host ""

Write-Host "Checking prerequisites for PowerShell modules availabilities ... " -NoNewline
If((Get-InstalledModule -Name "Az" -ErrorAction SilentlyContinue) -and (Get-InstalledModule -Name "MSOnline" -ErrorAction SilentlyContinue)) 
    {
    Write-Host  "OK!" -ForegroundColor Green
} else {
    Write-Host  "NOT OK!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Some PowerShell modules does not exists on the system!" -ForegroundColor Red
    Write-Host "To install MS Azure PowerShell cmdlets execute:" -NoNewline
    Write-Host " Install-Module Az" -ForegroundColor Yellow
    Write-Host "To install MS Azure Active Directory module execute:" -NoNewline
    Write-Host " Install-Module MSOnline" -ForegroundColor Yellow
    Write-Host ""
    Exit
}

Write-Host ""
Write-Host  "Please provide user credentials ... " -NoNewline -ForegroundColor Yellow
If($UserCredential -eq $null) {
    $UserCredential = Get-Credential -Message "Please enter user credentials that will be used for MS Online audit:"
}
If(!$UserCredential) {
    Write-Host "No credentials provided!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Exiting..." -ForegroundColor Yellow
    Exit
}
Write-Host "Thanks!" -ForegroundColor Green

Write-Host ""
Write-Host "Trying to connect to Office 365 ... "  -ForegroundColor Yellow -NoNewline 
try
{
    Connect-MsolService -Credential $UserCredential -ErrorAction Stop
}
 catch 
{
    Write-Host "Failed!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Exiting..." -ForegroundColor Yellow
    Exit
}

Write-Host "Success!" -ForegroundColor Green
Write-Host ""


Write-Host "Company Information:" -ForegroundColor Yellow
Write-Host "Tenant ID: "(Get-MSOLCompanyInformation).objectid.guid
Get-MsolCompanyInformation | Select-Object -Property DisplayName,PreferredLanguage,Country,CountryLetterCode,State,City,Street,TelephoneNumber,SelfServePasswordResetEnabled,UsersPermissionToCreateGroupsEnabled,UsersPermissionToCreateLOBAppsEnabled,UsersPermissionToReadOtherUsersEnabled,UsersPermissionToUserConsentToAppEnabled,PasswordSynchronizationEnabled


$authorizedSrvcInst = (Get-MsolCompanyInformation | Select-Object -Property AuthorizedServiceInstances).AuthorizedServiceInstances
Write-Host "Authorized Service Instances:" -ForegroundColor Yellow
$asi = "  -" + ([string]$authorizedSrvcInst).Replace(" ","`r`n  -")
$asi


Write-Host ""
Write-Host "All the SKUs for a company:" -ForegroundColor Yellow
Get-MsolAccountSku | Select-Object -Property AccountName,AccountSkuId,SkuPartNumber,ActiveUnits,ConsumedUnits,LockedOutUnits,SuspendedUnits,WarningUnits,SkuId | Format-Table


Write-Host ""
Write-Host "Getting service principals from Azure AD:" -ForegroundColor Yellow
Get-MsolServicePrincipal -All | Select-Object -Property DisplayName,AccountEnabled,ObjectId


Write-Host ""
Write-Host "Domain Information:" -ForegroundColor Yellow
Get-MsolDomain | Select-Object -Property Name,RootDomain,Status,IsDefault,IsInitial,Authentication,VerificationMethod,Capabilities | Format-Table


Write-Host ""
Write-Host "User Information:" -ForegroundColor Yellow
Get-MsolUser -All | Select-Object -Property Title,DisplayName,FirstName,LastName,UserPrincipalName,SignInName,@{Name="AlternateEmailAddresses";Expression={$_.AlternateEmailAddresses}},PhoneNumber,WhenCreated,LastPasswordChangeTimestamp,PasswordNeverExpires,StrongPasswordRequired,IsLicensed,@{n='Licenses';e={[string]($_.Licenses.AccountSkuId)}} | Format-Table


Write-Host ""
Write-Host "Group Information:" -ForegroundColor Yellow
Get-MsolGroup -All | Select-Object -Property DisplayName,Description,CommonName,EmailAddress,GroupType,IsSystem,ManagedBy,@{n='ProxyAddresses';e={[string]($_.ProxyAddresses)}} | Format-List


Write-Host ""
Write-Host "Get Roles:" -ForegroundColor Yellow
$roles = Get-MsolRole 
foreach ($role in $roles) {
    Write-Host ""$role.Name":" -ForegroundColor Yellow
    Get-MsolRoleMember -All -RoleObjectId $role.ObjectId
    Get-MsolScopedRoleMember -All -RoleObjectId $role.ObjectId
    Write-Host ""
}


Write-Host  "End!" -ForegroundColor Green
