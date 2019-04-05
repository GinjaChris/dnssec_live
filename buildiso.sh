#read https://wiki.archlinux.org/index.php/archiso
cd ~ &&
mkdir -p ~/archlive &&
cp -r /usr/share/archiso/configs/releng/ archlive &&
cd ~/archlive/releng/ &&
echo "LANG=en_GB.UTF-8" >  airootfs/etc/locale.conf  &&
echo "DNSSEC-live" > airootfs/etc/hostname &&
#"packages.x86_64" is the packages that will be installed on the liveCD (in addition to everything in the "base" category)
curl https://raw.githubusercontent.com/GinjaChris/dnssec_live/master/packages.x86_64 -o ./packages.x86_64 &&
#this copies over the script that will run when the livecd boots
curl https://raw.githubusercontent.com/GinjaChris/dnssec_live/master/customize_airootfs.sh -o airootfs/root/customize_airootfs.sh &&
#set uk keymap
echo "KEYMAP=uk" > airootfs/etc/vconsole.conf &&
mkdir -p airootfs/etc/unbound &&
#add unbound config
curl https://raw.githubusercontent.com/GinjaChris/dnssec_live/master/unbound.conf -o airootfs/etc/unbound/unbound.conf  &&
#add pointers to root servers
curl https://www.internic.net/domain/named.cache -o airootfs/etc/unbound/root.hints &&
#add trust for root zone
curl https://raw.githubusercontent.com/GinjaChris/dnssec_live/master/trusted-key.key -o airootfs/etc/unbound/trusted-key.key &&
#set bootup files
curl https://raw.githubusercontent.com/GinjaChris/dnssec_live/master/ntt.png -o syslinux/splash.png &&
curl https://raw.githubusercontent.com/GinjaChris/dnssec_live/master/mkinitcpio.conf -o ./mkinitcpio.conf &&
curl https://raw.githubusercontent.com/GinjaChris/dnssec_live/master/archiso.cfg -o syslinux/archiso.cfg &&
curl https://raw.githubusercontent.com/GinjaChris/dnssec_live/master/archiso_head.cfg -o syslinux/archiso_head.cfg &&
curl https://raw.githubusercontent.com/GinjaChris/dnssec_live/master/archiso_sys.cfg -o syslinux/archiso_sys.cfg &&
curl https://raw.githubusercontent.com/GinjaChris/dnssec_live/master/syslinux.cfg -o syslinux/syslinux.cfg &&
rm syslinux/archiso_pxe.cfg &&
#this has an entry to use old device naming (like "eth0")
mkdir -p airootfs/etc/sysctl.d/ && 
echo "net.ifnames=0" > airootfs/etc/sysctl.d/99-sysctl.conf &&
rm airootfs/root/install.txt &&
sync && sleep 1 &&
#build the ISO using the official archiso build script!  This will take a while.....If anything goes wrong, or you make changes to any of the files and need to rebuild the ISO, do rm ~/archlive and start again 
./build.sh  -v 
