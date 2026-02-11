## Kerberost

In an active directory , all creds are stored in the domain controllers, and in auth we need to verify the user creds that is stored in DM and we use network protocols like NTLM or kerberost.

The default network protocol that we use in DM is kerberos.

Any user who log in into a services using kerberos will be assigned tickets

The process :

- user sends (username + timestamp) encrypted using a key from their passwd to the KDC

- KDC create and send back TGT

- when the user wants to acces to diff services, they will use TGT to ask theit KDC gor TGS
