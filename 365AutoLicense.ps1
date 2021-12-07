$AccountSkuId = "<customer>:ENTERPRISEPACK"
$UsageLocation = "US"
$AdminUsername = "<Admin User Account>"
$AdminPassword = "<Password>"
$SecurePassword = ConvertTo-SecureString $AdminPassword -AsPlainText -Force

$cred = New-Object System.Management.Automation.PSCredential $AdminUsername,$SecurePassword

Connect-MSOLService -Credential $cred

$LicenseOptions = New-MsolLicenseOptions -AccountSkuId $AccountSkuId
$UnlicensedUsers = Get-MSOLUser -UnlicensedUsersOnly -Synchronized

$UnlicensedUsers | ForEach-Object {
	Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation $UsageLocation
	Set-MsolUserLicense -UserPrincipalName $_.UserPrincipalName -AddLicenses $AccountSkuId -LicenseOptions $LicenseOptions
}
