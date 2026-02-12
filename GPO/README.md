## In this section, we will set some GPOs.

What is a GPO (Group Policy Objects)

- Its a set of rules that is affected to OUs (Organisiational Units), and there are two types :
	- Computer 
	- User

And for each one, we have policies or reference, and its depends on the GPO that we wanna create, as an example :

- Enforce a strong password with > 14 caracters
- Disable plug in a usb
- disallowed him to reach control panel

- Tool that we used in server : *Group Policy Management Service*


-> Difference between user policy and computer policy :

- user policy, whatever machine this user uses, the policies applied to him.
- computer policy, whoever this user uses this computer, the same policies will be applied to this computer.

gpupdate /force : why? to force the application of the polcies

Policies stock in SYSVOL. (read-only by all domain object)

Hands-on build GPO:

1- Account Locker to against brute force :
<img width="1920" height="1080" alt="Honeypot STEPS" src="/images/GPOs/account locker.png" />

2- Password policy configue :
<img width="1920" height="1080" alt="Honeypot STEPS" src="/images/GPOs/password.png" />

3- Restrict Control Panel :
<img width="1920" height="1080" alt="Honeypot STEPS" src="/images/GPOs/restrictControlPanel.png" />

**Test:**

### In the enumeration section we will test a brute force and we will see if this policy work as well as we expected.
<img width="1920" height="1080" alt="Honeypot STEPS" src="/images/GPOs/test1.png" />
## Sharing permissions

1 - share the folder
2 - set permissions

- We create a shared folder in the ADDC01 and we named it : *data*

We set sharing permission :
- Bakr Mamouni the only one who can read-only this file

<img width="1920" height="1080" alt="Honeypot STEPS" src="/images/GPOs/permissions.png" />

**Test:**

- We log in as Outhmane Mamouni and we try to access it :

<img width="1920" height="1080" alt="Honeypot STEPS" src="/images/GPOs/test.png" />

- Now we gave bakr the permission to write, and outhmane read-only :

<img width="1920" height="1080" alt="Honeypot STEPS" src="/images/GPOs/test_edit_file.png" />

**best practices:** no full control to user

RBAC? permissios applied to groups


## NTFS Permissions - Security

NTFS and fat32 are file systems ( defines how data is stored on a disk and how permissions are handled )
- fat32 useless for ad
- NTFS modern windows file system desgined for security

format : FAT32 -> NTFS

why NTFS?

- secure

- disk quota ( FSRM - file server ressource manager ), extensions allowed and disallowed

- shadow copy ( snapshot of disk )


- What is security permission in folders?

- select principal 
- disable  inheritance
- allow or deny permissions



## Shadow copy :
- snpashot for the partition ( periodycally )

## Map Network drive :

- we can do it from gpo -> create a gpo -> drive maps add or from the user desktop

<img width="1920" height="1080" alt="Honeypot STEPS" src="/images/GPOs/networkmaps.png" />

- and if we log in with Outhmane's Account :

<img width="1920" height="1080" alt="Honeypot STEPS" src="/images/GPOs/test_edit_file.png" />
