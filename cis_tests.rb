control "cis-1-4-1" do
  impact 1.0
  title "1.4.1  Ensure permissions on bootloader config are configured"
  desc "Set the owner and group of grub.cfg stored in /boot/grub to the root user."
  describe command('stat -L -c "%u %g" /boot/grub/grub.cfg') do
    its('stdout') { should match '0 0' }
  end
end
control "cis-1-1-16" do
  impact 1.0
  title "1.1.16 Ensure noexec option set on /dev/shm partition"
  desc "The noexecmount option specifies that the filesystem cannot contain executable binaries."
  describe command('mount | grep /dev/shm') do
    its('stdout') { should include 'nosuid' }
  end
end
control 'sshd-10' do
  impact 1.0
  title 'Server: Specify protocol version 2'
  desc "Only SSH protocol version 2 connections should be permitted. Version 1 of the protocol contains security vulnerabilities. Don't use legacy insecure SSHv1 connections anymore."
  describe sshd_config do
    its('Protocol') { should eq('2') }
  end
end
control 'Checking-Eureka-server-port' do
  impact 1.0
  title 'Server: Confirm eureka server is running'
  desc "Check for eureka server port"
  describe port(8761) do
    it { should be_listening }
    its('protocols') {should include 'tcp'}
  end
end
control 'Check_User_Home' do
   describe os_env('HOME') do
     its('content') { should eq '/home/adminis' }
   end
end
