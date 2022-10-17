$ErrorActionPreference = 'SilentlyContinue'

Import-Module ActiveDirectory

Get-ADReplicationPartnerMetadata -Scope Forest -Partition * -ErrorAction SilentlyContinue | Format-Table -Property Server,PartnerType,Partner,LastReplicationAttempt,LastReplicationSuccess,LastReplicationResult,ConsecutiveReplicationFailures,LastChangeUsn,Partition
