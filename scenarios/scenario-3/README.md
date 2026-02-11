# Attack : SMB relay

**What is SMB (Server message Block)?**

SMB is a network file-sharing protocol used in windows, it gives the ability to the clients to read/write files from a server.

Victim -> SMB Server
The attacker receives Client's request (MITM) and takes NTLM id, and thats how the attacker takes anautharised access to the server.

when NTLM is allowed, SMB signing is disabled, -> relay attacks can be possible

we use impacket-ntlmrelayx because its a traffic forwarder.

**relay attack** its an attack when the attacker forwards auth messages from victim to the service to gain nautharised access without knowing his creds.
 
**best practices:**
