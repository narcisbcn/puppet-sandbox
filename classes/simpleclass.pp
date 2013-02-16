# Class: simpleclass
#
# This class is just to do not leave empty classe directory otherwise puppet server complains
#
# === Parameters
#
# === Actions
#
# === Requires
#
# === Sample Usage
#
# class { 'simpleclass': }
#

class simpleclass {

  notify { 'It is simple class': }

} 
