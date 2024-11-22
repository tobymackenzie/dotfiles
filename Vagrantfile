Vagrant.require_version '>= 1.7.0'
Vagrant.configure(2) do |config|
	config.vm.define 'demo' do |demo|
		#-# latest ubuntu, see <https://app.vagrantup.com/ubuntu>
		# demo.vm.box = 'ubuntu/mantic64'
		demo.vm.box = 'ubuntu/jammy64'

		#==network
		#--access by this IP
		demo.vm.network 'private_network', ip: '192.168.56.12'
		#--connect to internet
		#-@ https://stackoverflow.com/a/18457420/1139122
		demo.vm.provider 'virtualbox' do |vb|
			vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
			vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
		end

		#==provision
		# demo.vm.provision 'shell', path: 'provision/init.sh', privileged: true
		demo.vm.provision 'shell', privileged: true, inline: <<-'INIT'
			date > /etc/_provisionDate
			apt update
			#--install managed apps.  others are installed by default: bash, git, screen, vim.  ignoring atom and svn, as they are on their way out
			apt install -y fish i3 lynx vim-gui-common w3m zsh
			#---need for i3
			apt install -y xinit
		INIT

		#==sync project folder
		demo.vm.synced_folder '.', '/home/vagrant/__/checkouts/dotfiles'
		#--disable syncing vagrant folder
		demo.vm.synced_folder '.', '/vagrant', disabled: true

		#==enable gui
		demo.vm.provider 'virtualbox' do |vb|
			vb.gui = true
		end
		#-! need to manually set display type to VMSVGA, 
		#-! must increase zoom in VB to make visible
		#-! cpu cap, cpu sometimes runs for no reason
	end
end
