## site.pp ##

# This file (./manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
# https://puppet.com/docs/puppet/latest/dirs_manifest.html
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition if you want to use it.

## Active Configurations ##

# Disable filebucket by default for all File resources:
# https://github.com/puppetlabs/docs-archive/blob/master/pe/2015.3/release_notes.markdown#filebucket-resource-no-longer-created-by-default
File { backup => false }

## Node Definitions ##

# The default node definition matches any node lacking a more specific node
# definition. If there are no other node definitions in this file, classes
# and resources declared in the default node definition will be included in
# every node's catalog.
#
# Note that node definitions in this file are merged with node data from the
# Puppet Enterprise console and External Node Classifiers (ENC's).
#
# For more on node definitions, see: https://puppet.com/docs/puppet/latest/lang_node_definitions.html
node default {
  #  include 'puppet_status_check'


  # class mymodule (
  #   Sensitive[String[1]] $somepass,
  # ) {
  #   ...
  # }
  #$somepass = lookup('mymodule::somepass')

  #notify { "somepass: ${somepass}": }
  #notify { "somepass.unwrap: ${somepass.unwrap}": }

  #file { '/tmp/testing':
  #  ensure    => file,
  #  content   => $somepass.unwrap,
  #  show_diff => false,
  #}
}

node 'osp-primary.garrett.rowell' {
  class { 'puppet_status_check':
    role                 => 'primary',
    indicator_exclusions => [
      'S0007', 'S0010', 'S0011',
      'S0017', 'S0027', 'S0029'
    ],
  }
}
