Vagrant.configure('2') do |config|
  config.vm.box = 'azure'

  # use local ssh key to connect to remote vagrant box
#config.ssh.private_key_path = '~/.ssh/id_rsa'
config.ssh.private_key_path = File.join(File.dirname(__FILE__), 'azure_private_key.id_rsa')
config.vm.provider :azure do |azure, override|


    # each of the below values will default to use the env vars named as below if not specified explicitly
    azure.tenant_id = '0fa6a79a-2963-453d-aa90-e806c46dbb0d'
    azure.client_id = '5a629059-b782-40de-9619-b4191d9f00d5'
    azure.client_secret = '57e50106-58dd-43c9-a1c7-b6c81c02ffe3'
    azure.subscription_id = '509ea6af-8c9f-47b3-a2d7-fce21072afba'
    azure.location="eastus"

    azure.vm_size ='Standard_D2s_v3'
  end

end

