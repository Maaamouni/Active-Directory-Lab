Set-ADAccountPassword sophie -Reset -NewPassword (Read-Host -AsSecureString -Prompt 'New Password') -Verbose
# to see the name of the domain controller 
(Get-CimInstance Win32_ComputerSystem).Domain

# To see the name of your laptop in case the access is denied
hostname

# List all users in AD
Get-ADUser -Filter *

# List all computers in AD
Get-ADComputer -Filter *

#List all groups
Get-ADGroup -Filter *

# have some details about a user
net user username /domain

# show env variables including userdomain and username
set




