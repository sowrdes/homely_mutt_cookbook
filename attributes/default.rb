packages = ['mutt', 'offlineimap', 'msmtp']

packages.each do |pack|
  default['homely_mutt'][pack]['install_method'] = 'package'
end

default['homely_mutt']['fname'] = 'will'
default['homely_mutt']['lname'] = 'milton'
default['homely_mutt']['email'] = 'the@willmilton.com'

default['homely_mutt']['nametrans_local'] = {
  'drafts' => '[Gmail]/Drafts',
  'sent' => '[Gmail]/Sent Mail',
  'flagged' => '[Gmail]/Starred',
  'trash' => '[Gmail]/Trash',
  'archive' => '[Gmail]/All Mail'
}
