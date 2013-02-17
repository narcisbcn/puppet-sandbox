# == Class: mirrors::yum
#
# This class installs the Puppet Labs YUM repository.
#
# === Parameters
#
# === Actions
#
# - Install puppetlabs repository
# - Perform initial sync to update package database
#
# === Requires
#
# === Sample Usage
#
#   class { 'mirrors::yum': }
#
class mirrors::yum {

   # Get major Version
   $mver = split($operatingsystemrelease, '[.]')

   yumrepo { 'puppetlabs':
      descr          => "Puppet Labs Packages for EL ${mver[0]}",
      baseurl        => "http://yum.puppetlabs.com/el/${mver[0]}/products/\$basearch",
      gpgkey         => "http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs",
      gpgcheck       => "1",
      enabled        => "1",
   }

   yumrepo { 'puppetlabs-deps':
      descr          => "Puppet Labs Dependencies for EL ${mver[0]}",
      baseurl        => "http://yum.puppetlabs.com/el/${mver[0]}/dependencies/\$basearch",
      gpgkey         => "http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs",
      gpgcheck       => "1",
      enabled        => "1",
   }

}
