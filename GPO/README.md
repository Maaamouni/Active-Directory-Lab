## in this section, we will set some GPOs.

What is a GPO (Group Policy Objects)

- Its a set of rules that is affected to some OU (Organisiational Unit), and there are two types :
	- Computer 
	- User
we can apply as well in our host machine , local policy

site policy 
domain , applying policy in a domain
and for each one, we have policies or reference, and its depends on the GPO that we wanna create, as an example :

- Enforce a strong password with > 14 caracters
- Disable plug in a usb
- disallowed him to reach control panel

tool used in server : Group Policy Management Service
and then we create some GPO.

Group policy applied to only users and computers.

difference between user policy and computer policy :

- user policy, whatever machine this user uses, the policies applied to him.
- computer policy, whoever this user uses this computer, the same policies will be applied to this computer.

gpupdate /force : why? to force the application of the polcies

Policies stock in SYSVOL. (read-only by all domain object)

Hands-on build GPO:

## Sharing permissions 

1 - share the folder
2 - set permissions

**best practices:** no full control to user

RBAC? permissios applied to groups


## NTFS Permissions - Security
??

NTFS and fat32 are file systems ( defines how data is stored on a disk and how permissions are handled )
- fat32 useless for ad
- NTFS modern windows file system desgined for security

format : FAT32 -> NTFS

why NTFS?

- secure

- disk quota ( FSRM - file server ressource manager ), extensions allowed and disallowed

- shadow copy ( snapshot of disk )


what is security permission in folders?
select principal 
disable  inheritance
allow or deny permissions


NTFS permissions vs Share permissions
-> real se here

## Shadow copy :
- snpashot for the partition ( periodycally )

## Map Network drive :

- we can do it from gpo -> create a gpo -> drive maps add or from the user desktop
