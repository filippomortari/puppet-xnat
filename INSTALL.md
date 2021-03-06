Installation instructions
=========================

*Some steps may not be required on existing systems.*  
*For Scientific Linux the Fedora steps can be followed.* 

 - Log in as root
 - Create two new users: useradd xnat and useradd tomcat
 - Remove existing OpenJDK java packages: 
   - `rpm -qa | grep jdk` (run `apt-get rpm` on Ubuntu if not installed)
   - Remove the openjdk packages in that list. The first part is sufficient e.g. java-1.6.0-openjdk
   - Ubuntu: this is not required on Ubuntu as this supports a special program that can selected the correct Java version automatically.
 - Install rubygems
   - Ubuntu: `apt-get install ruby`
   - Fedora: `yum install rubygems`
   - RedHat: 
     - for below: replace the 7s with 6s or 5s if that is the installed RedHat version. Replace x86_64 with i386 for systems with a 32-bit instruction set.
     - `yum-config-manager --enable rhel-7-server-optional-rpms` (run `yum install yum-utils` if not installed)
     - check if rhel-7-server-optional-rpms is shown in yum repolist
     - if not, probably subscription-manager should be used: subscription-manager repos --enable=rhel-7-server-optional-rpms
     - `yum install rubygems` (confirm any required keys)
 - Install puppet
   - Fedora: `yum install puppet`
   - Ubuntu: `apt-get install puppet`
   - RedHat: 
     - for below: replace the 7s with 6s or 5s if that is the installed RedHat version. Replace x86_64 with i386 for systems with a 32-bit instruction set.
     - `sudo rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm`
     - Install puppet: `yum install puppet` (confirm any required keys)
 - Install other packages: `yum install wget git mercurial` (confirm any required keys)
 - Update the operating system (if preferred): `yum update`
 - Retrieve the puppet repository: `git clone https://github.com/jopasserat/puppet-xnat /etc/puppet/modules/xnat` (space after puppet-xnat)
 - Run install script (also runs Puppet script). `sh /etc/puppet/modules/xnat/preinstall.sh`

Notes:
------

 - The output of the puppet script can be found in /puppet.out for debugging any problems (should not occur)
 - The complete installation can take up to an hour depending on internet/computer speed. 
 - For security reasons we advice to use XNAT only using an https/SSL connection. Instructions can be found here: http://tomcat.apache.org/tomcat-6.0-doc/ssl-howto.html.
 - When XNAT is installed for the first time, an configuration window is opened when browsing to the machine web ip/address (login is admin/admin). Configure all settings. Note: you should provide the directories in which the image data should be stored. This is already configured by the puppet script, but make sure these directories have sufficient disk space available.

Known issues with installation (but rare):
------------------------------------------

 - Sometimes tomcat does not shutdown properly and therefore multiple instances are running. If the website is not reachable, check with `ps aux | grep java` if multiple tomcat instances are running. If this is the cast, kill the processes with `kill -9 [PID from ps aux]` and restart tomcat with `sh /usr/share/tomcat7/bin/startup.sh` . After about a minute the website should be reachable.
 - The installation script automatically detects the ip address of the installation machine. In some situations this does not work properly. If you cannot access the website, you can manually configure the ip-address in */usr/share/tomcat7/webapps/ROOT/WEB-INF/conf/InstanceSettings.xml* on line 3. Furthermore, if it still does not work, you can set the org.restlet.autoWire param-value on false in */usr/share/tomcat7/webapps/ROOT/WEB-INF/web.xml* on line 40.

