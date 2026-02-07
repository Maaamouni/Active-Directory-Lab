# Netbios and LLMNR Poisoning

1 - What is LLMNR?
- LLMNR(Local-Link Multicast Name Resolution) is a protocol designed to allow devices on a local network (works on the same subnet) to resolve hostnames without relying on a DNS server or when DNS fails.
This protocol is vulnerbale to spoofing so it is often disabled in entreprise environments.

2 - How is LLMNR vulnerable to AD?
- When a host failed in name resolution (DNS fails), it send a LLMNR query (multicast) to any device on the subnet, the attacker can listen to the upcoming queries and respond to them, and that can lead to anauthorized acces to AD env.

## the Attack :

- Responder tool :listens on a local net and abuses name-resolution protocols like : LLMNR - NBT-NS - mDNS ..
example : when a machine asks who is PC-01, reponders anwers : "I am".THATS IS SPOOFING.

**Steps :**

```
ipconfig
```
<img width="1920" height="1080" alt="Attack2 STEPS" src="/images/Scenario2/A2.png"/>
Select the target interface, in this case its : eth0.

```
sudo responder -I eth0 -dwv
```

<img width="1920" height="1080" alt="Attack2 STEPS" src="/images/Scenario2/A1.png"/>

- Once we catch the hash text, we should crack it using a crack tool like hashcat.

```
sudo hashcat -m 5600 hash.txt passwords.txt
```
<img width="1920" height="1080" alt="Attack2 STEPS" src="/images/Scenario2/A3.png"/>

explanation of NTLMv2: used in Windows Auth, when accessing SMG, LDAP, HTTP, its main purpose is to prove your identity

- In splunk, we can see this :
<img width="1920" height="1080" alt="Attack2 STEPS" src="/images/Scenario2/A5.png"/>

**Best Practices :**

- Disable LLMNR and NTBS-NS to rely only in DNS 

- Rely on proper DNS

- Strong password ( > 14 characters in length)
