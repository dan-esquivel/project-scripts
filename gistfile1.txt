#Create Path Variable
$CSVPath = Read-Host "Path to CSV"

#Import the CSV file into an array
$Ary_UserList = Import-CSV $CSVPath

#Loop - run actions for each user in the list
ForEach ($Obj_UserList in $Ary_UserList) {

#Set property to value in CSV under the header you want
    Set-ADUser $Obj_UserList.Username -UserPrincipalName $Obj_UserList.Email

#Output Results to Screen(For testing - uncomment to use)
    #Get-ADUser $Obj_UserList.Username
}