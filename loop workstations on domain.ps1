$workstations = @("mkj555","mjc671")
For ($i=0; $i -lt $workstations.Length; $i++){
ping $workstations[$i]
}
Read-Host -Prompt “Press Enter to exit”