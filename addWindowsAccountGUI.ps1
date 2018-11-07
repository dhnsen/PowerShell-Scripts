Add-Type -assembly System.Windows.Forms
$main_form = New-Object System.Windows.Forms.Form
$main_form.Text ='Add Account'

$main_form.Width = 300

$main_form.Height = 200
$main_form.AutoSize = $true


$WorkstationLabel = New-Object System.Windows.Forms.Label
$WorkstationLabel.Text = "Workstation ID"
$WorkstationLabel.Location  = New-Object System.Drawing.Point(5,15)
$WorkstationLabel.AutoSize = $true
$main_form.Controls.Add($WorkstationLabel)

$WorkstationTextBox = New-Object System.Windows.Forms.TextBox
$WorkstationTextBox.Location  = New-Object System.Drawing.Point(90,15)
$WorkstationTextBox.AutoSize = $true
$main_form.Controls.Add($WorkstationTextBox)

$AccountLabel = New-Object System.Windows.Forms.Label
$AccountLabel.Text = "Account Name"
$AccountLabel.Location  = New-Object System.Drawing.Point(5,40)
$AccountLabel.AutoSize = $true
$main_form.Controls.Add($AccountLabel)

$AccountTextBox = New-Object System.Windows.Forms.TextBox
$AccountTextBox.Location  = New-Object System.Drawing.Point(90,40)
$AccountTextBox.AutoSize = $true
$main_form.Controls.Add($AccountTextBox)

$PasswordLabel = New-Object System.Windows.Forms.Label
$PasswordLabel.Text = "Password"
$PasswordLabel.Location  = New-Object System.Drawing.Point(5,65)
$PasswordLabel.AutoSize = $true
$main_form.Controls.Add($PasswordLabel)

$PasswordTextBox = New-Object System.Windows.Forms.TextBox
$PasswordTextBox.Location  = New-Object System.Drawing.Point(90,65)
$PasswordTextBox.AutoSize = $true
$main_form.Controls.Add($PasswordTextBox)

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(60,105)
$Button.Size = New-Object System.Drawing.Size(120,23)
$Button.Text = "Add Account"
$main_form.Controls.Add($Button)

$StatusLabel = New-Object System.Windows.Forms.Label
$StatusLabel.Text = "status..."
$StatusLabel.Location  = New-Object System.Drawing.Point(20,140)
$StatusLabel.AutoSize = $true
$main_form.Controls.Add($StatusLabel)

$Button.Add_Click(
{
$StatusLabel.Text = "Attempting to connect"
Start-Sleep -seconds 2
enter-pssession -computername $WorkstationTextBox.Text
$StatusLabel.Text = "Attempting to add account"
$Password = ConvertTo-SecureString -String $PasswordTextBox.Text -AsPlainText -Force
New-LocalUser -Name AccountTextBox.Text -Password $Password -PasswordNeverExpires
Start-Sleep -seconds 2
$StatusLabel.Text = "closing connection"
Start-Sleep -seconds 2
$StatusLabel.Text = "Procedure complete. Check for errors"
}
)

$main_form.ShowDialog()




