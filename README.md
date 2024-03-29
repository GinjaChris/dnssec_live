***BROKEN!  Looks like Arch made some changes a while back that broke this.   I'll look into fixing it and maybe just have a downloadable ISO in the future.
In the meantime, don't use this!***

# dnssec_live

This is a bash script to build a DNSSEC enabled recursive and caching DNS server.  


How to build DNSSEC enabled live CD
===================================
*Requires an installed Arch linux system to work from!*

Start by booting into installed arch linux environment.   
Install anarchy linux or Manjaro linux if you don't know what you are doing!

Make sure you do everything as root:

#su   

#pacman -Syu archiso

#cd ~

then download the build script:

#curl https://raw.githubusercontent.com/GinjaChris/dnssec_live/master/buildiso.sh -o ./buildiso.sh

make it executable:

#chmod +x ./buildiso.sh

run it:

#./buildiso.sh

If the build works, the iso will be output to ~/archlive/releng/out/archlinux-YYYY-MM-DD-x86_64.iso.  Will likely be around 600MB in size.


But what if I don't have an installed Arch linux system?
========================================================

A pre-built DNSSEC_live ISO can be downloaded from https://www.dropbox.com/s/e3rl5uq4mpvyk2i/DNSSEC-live_v0.4.iso?dl=1

Run it in a VM.


Booting & using
===============

- Start a VM and boot from the newly created ISO.  No HDD required.

- You will be auto-logged in to root account.

- unbound DNS server will be running and configured for DNSSEC resolution.

- The server should pick up an IP from dhcp.  If not, run "dhcpcd" or add a static IP address (I suggest using netctl, see https://wiki.archlinux.org/index.php/Netctl).
Maybe set your DHCP server to always give out the same IP to the MAC address of your new VM.

- Point your clients to use the new server for DNS.  You may wish to modify your DHCP server to provide the new IP of your DNS server to your clients.

- Internet connectivity is required to destination port 53 UDP (and ideally TCP too) for DNS resolution.

- It is a live medium so if you reboot any changes you made are lost.  To avoid this, install to disk or take a snapshot.

- We use a UK key layout by default.

- There's no remote access enabled (SSH etc) by default.

- https://wiki.archlinux.org/ is an excellent resource.
