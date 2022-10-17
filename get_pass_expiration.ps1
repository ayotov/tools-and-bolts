Import-Module ActiveDirectory

# specify target OU
$searchdom = "CN=Users,DC=domain,DC=com"

$users = Get-ADUser -Filter '(enabled -eq $true) -and (passwordNeverExpires -eq $false)' -searchbase $searchdom -Properties name,samaccountname,msDS-UserPasswordExpiryTimeComputed,passwordNeverExpires,pwdLastSet | Sort-Object 

$lst = $users | Select-Object Name,SamAccountName,@{name='Days before password expires';expression={
    $start = [datetime]::Today
    $end = [datetime]::FromFileTime($_.'msDS-UserPasswordExpiryTimeComputed')
    $ddd = (New-TimeSpan -start $start -end $end).days
    $ddd
}}

$lst | Sort-Object -Property 'Days before password expires'
