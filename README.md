# dnssec_live

This is a bash script to build a DNSSEC enabled recursive and caching DNS server.  
This script is free for personal use only.  It is not permitted for business use under any circumstances. 


How to build DNSSEC enabled live CD
===================================
*Requires an installed Arch linux system to work from!*

Start by booting into installed arch linux environment.   
Install anarchy linux or archlabs if you don't know what you are doing!

 #su   ----> make sure you do everything as root!

#pacman -Syu archiso

#cd ~

then download the install script:

#curl https://raw.githubusercontent.com/GinjaChris/dnssec_live/master/buildiso.sh -o ./buildiso.sh

make it executable:

#chmod +x ./buildiso.sh

run it:

#./buildiso.sh

If the build works, the iso will be output to ~/archlive/releng/out/archlinux-YYYY-MM-DD-x86_64.iso.  Will likely be around 600MB in size.


But what if I don't have an Arch linux system?
==============================================

An ISO will be available soon!


Booting & using
===============

- Start a VM and boot from the newly created ISO

- You will be auto-logged in to root account

- unbound DNS server will be running and configured for DNSSEC resolution

- The server should pick up an IP from dhcp.  If not, run "dhcpcd" or add a static IP address (i suggest using netctl).
Or set your DHCP server to always give out the same IP to the MAC address of your new VM.

- Point your clients to use the new server for DNS.  You may wish to modify your DHCP server to provide the new IP of your DNS server to your clients.

- We use a UK key layout by default

- There's no remote access enabled (SSH etc) by default

- https://wiki.archlinux.org/ is an excellent resource
