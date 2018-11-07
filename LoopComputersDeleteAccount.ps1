$accountName = ""
$workstations = @("m10000","m00001")
For ($i=0; $i -lt $workstations.Length; $i++){
Write-Output "Attempting to delete account on: " $workstations[$i]
enter-pssession -computername $workstations[$i]
net user $accountName /delete
exit-pssession
}
Read-Host -Prompt “Press Enter to exit”