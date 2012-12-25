#
# Cookbook Name:: homely_mutt
# Recipe:: default
#
# Copyright (C) 2012 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

cb_name = cookbook_name
user_home = ENV['HOME']
for_user = ENV['SUDO_USER']

packages = ['mutt', 'offlineimap', 'msmtp']
email = node['homely_mutt']['email']
fname = node[cb_name]['fname']
lname = node[cb_name]['lname']
account = "#{fname}#{lname}"
node.set['mutt']['notmuch'] = TRUE
node.set['homebrew']['run_as'] = ENV['SUDO_USER']

packages.each do |pack|

  case pack
  when 'offlineimap'
    package pack

    #TODO: research other valid configs and separate to another cookbook.
    template "#{user_home}/.#{pack}rc" do
      source "#{pack}rc.erb"
      owner for_user
      variables(
        :nametrans_local => node[cb_name]['nametrans_local'].to_hash,
        :email => email,
        :fname => fname,
        :lname => lname
      )
    end
    template "#{user_home}/.mutt/offlineimap.py" do
      source "offlineimap.py.erb"
      owner for_user
      variables(
        :user_home => user_home,
        :user => for_user
      )
    end
  when 'mutt'
    # TODO: let the mutt cookbook handle many accounts per node.
    node.set['mutt']['account'] = "#{fname}-#{account}.com"
    node.set['mutt']['msmtp_account'] = account
    node.set['mutt']['email'] = email
    include_recipe "mutt"
  when 'msmtp'
    package pack

    # TODO: perhaps we shouldn't use .mutt as a crap bucket for everything.
    cookbook_file "#{user_home}/.mutt/Equifax_Secure_CA.cert" do
      owner for_user
    end

    # TODO: research other valid configurations for msmtp so we can separate.
    template "#{user_home}/.msmtprc" do
      source "msmtprc.erb"
      owner for_user
      variables(
        :account => account,
        :email => email
      )
    end
  end
end
