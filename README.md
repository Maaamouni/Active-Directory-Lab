# Active Directory Lab

In this lab , I tried to make my own lab to test AD attacks, and in this repository will be updated and making attacks scenarios step by step and showing at the same time the logs in a SIEM tool (splunk).

## Architecture :
<img width="1920" height="1080" alt="Honeypot STEPS" src="/images/lab-archi.png" />
**Note: ** the address ip may change from scenario to scenario.

## Steps of configuration :
### Splunk server Configuration :
1 - Download Splunk Entreprise Edition from splunk.com
2 - Download Ubuntu server (.iso image)
3 - After Ubuntu Server Configuration : 
```
sudo apt install virtualbox-guest-additions-iso
sudo apt install virtualbox-guest-utils
```
4 - allow Folders Sharing, and add the Splunk .iso directory
5 - In ubuntu server :

```
cd ~
mkdir share
sudo mount -o groupe_name uid=1000,gid=1000 Splunk_Image_DIR share/
sudo dpkg -i splunk_file.deb
sudo -u splunk /opt/splunk/bin/splunk/ enable boot-start
```
6 - Check the server_ip:8000 and login with your credentials

### Machines Configuration

1 - Download The Splunk Universal Forwarder
2 - Add server_address:9997 for forwarding data
3 - Install Sysmon and configure it.
4 - Go to : C:\Program Files\SplunkUniversalForwarder/etc/local
5 - Add inputs.conf with this configuration :

```
[WinEventLog://Application]
index = endpoint
disabled = false

[WinEventLog://Security]
index = endpoint
disabled = false

[WinEventLog://System]
index = endpoint
disabled = false

[WinEventLog://Microsoft-Windows-Sysmon/Operational]
index = endpoint
disabled = false
renderXml = true

source = XmlWinEventLog:Microsoft-Windows-Sysmon/Operational

```
We do this configuration to collect all the logs from Event Viewer, in windows logs (Application, Secuirty and System)
**NOTE: ** this inputs.conf collect application,security,system and sysmon logs and forward it to Splunk Server.
6 - And Now your server is ready to recieve data from machines
## Automating creation of users, groups, machines using .ps1 scripts

## Attacks
Scenario 1 : [Brute Forcing with crowbar for RDP](https://github.com/Maaamouni/Active-Directory-Lab/tree/main/scenarios/scenario-1)
