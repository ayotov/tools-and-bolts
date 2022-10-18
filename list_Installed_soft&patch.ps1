# Software installed for All Users (machine)
$InstalledSoftware1 = Get-ChildItem "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall" 
# Software installed for Current User only
$InstalledSoftware2 = Get-ChildItem "HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall"

$InstalledSoftware = @()

foreach($obj in $InstalledSoftware1)
{    
    $myInstalledSoftware = New-Object -TypeName PSObject

    if ($obj.GetValue('DisplayName') -ne $null) 
    {    
        $myInstalledSoftware | Add-Member -MemberType NoteProperty -Name SoftwareName -Value $obj.GetValue('DisplayName')
        $myInstalledSoftware | Add-Member -MemberType NoteProperty -Name SoftwareVersion -Value $obj.GetValue('DisplayVersion')
        $myInstalledSoftware | Add-Member -MemberType NoteProperty -Name Publisher -Value $obj.GetValue('Publisher')
        $myInstalledSoftware | Add-Member -MemberType NoteProperty -Name Version -Value $obj.GetValue('Version')
        $myInstalledSoftware | Add-Member -MemberType NoteProperty -Name EstimatedSize -Value  $obj.GetValue('EstimatedSize')
        $myInstalledSoftware | Add-Member -MemberType NoteProperty -Name InstallDate -Value $obj.GetValue('InstallDate')
        $myInstalledSoftware | Add-Member -MemberType NoteProperty -Name InstallLocation -Value $obj.GetValue('InstallLocation')
        $myInstalledSoftware | Add-Member -MemberType NoteProperty -Name InstallSource -Value $obj.GetValue('InstallSource')
        $myInstalledSoftware | Add-Member -MemberType NoteProperty -Name ModifyPath -Value $obj.GetValue('ModifyPath')
        $myInstalledSoftware | Add-Member -MemberType NoteProperty -Name UninstallString -Value $obj.GetValue('UninstallString')

        $InstalledSoftware += $myInstalledSoftware
    }
    Remove-Variable myInstalledSoftware
}

foreach($obj in $InstalledSoftware2)
{
    $myInstalledSoftware = New-Object -TypeName PSObject

    if (($obj.GetValue('DisplayName') -ne $null) -and (!$InstalledSoftware.'SoftwareName'.Contains($obj.GetValue('DisplayName')))) 
    {
        $myInstalledSoftware | Add-Member -MemberType NoteProperty -Name SoftwareName -Value $obj.GetValue('DisplayName')
        $myInstalledSoftware | Add-Member -MemberType NoteProperty -Name SoftwareVersion -Value $obj.GetValue('DisplayVersion')
        $myInstalledSoftware | Add-Member -MemberType NoteProperty -Name Publisher -Value $obj.GetValue('Publisher')
        $myInstalledSoftware | Add-Member -MemberType NoteProperty -Name Version -Value $obj.GetValue('Version')
        $myInstalledSoftware | Add-Member -MemberType NoteProperty -Name EstimatedSize -Value  $obj.GetValue('EstimatedSize')
        $myInstalledSoftware | Add-Member -MemberType NoteProperty -Name InstallDate -Value $obj.GetValue('InstallDate')
        $myInstalledSoftware | Add-Member -MemberType NoteProperty -Name InstallLocation -Value $obj.GetValue('InstallLocation')
        $myInstalledSoftware | Add-Member -MemberType NoteProperty -Name InstallSource -Value $obj.GetValue('InstallSource')
        $myInstalledSoftware | Add-Member -MemberType NoteProperty -Name ModifyPath -Value $obj.GetValue('ModifyPath')
        $myInstalledSoftware | Add-Member -MemberType NoteProperty -Name UninstallString -Value $obj.GetValue('UninstallString')

        $InstalledSoftware += $myInstalledSoftware
    }
    Remove-Variable myInstalledSoftware
}

Write-Host ""
Write-Host "Installed software:"
Write-Host ""

$InstalledSoftware | Sort-Object -Property 'SoftwareName' | Format-Table -Property *

Remove-Variable InstalledSoftware

Write-Host ""
Write-Host "Installed security updates:"
Write-Host ""
Get-HotFix | Sort-Object -Property 'InstalledOn'
