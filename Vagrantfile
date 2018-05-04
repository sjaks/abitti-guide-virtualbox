# xrtli@github - Modified version for Äänekosken lukio high school
# Initually made by digabi@github / YTL

VAGRANTFILE_API_VERSION = "2"

def get_amount_of_cpus_and_system_ram
  # Give VM (host memory - 1.5 GB) & all but 1 cpu (logical) cores
  host = RbConfig::CONFIG['host_os']

  cpus = 2
  mem = 4000 # 8 gigs too much for our laptops :(

  begin
    if host =~ /darwin/
      cpus = `sysctl -n hw.logicalcpu_max`.to_i
      mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024
    elsif host =~ /linux/
      cpus = `lscpu -p | awk -F',' '!/^#/{print $1}'| sort -u | wc -l`.to_i
      mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024
    elsif host =~ /mswin|mingw|cygwin/
      cpus = `wmic cpu Get NumberOfLogicalProcessors`.split[1].to_i
      mem = `wmic computersystem Get TotalPhysicalMemory`.split[1].to_i / 1024 / 1024
    end
  rescue
  end
  [[cpus - 1, 2].max, [mem - 1536, 6144].max]
end

cpus, mem = get_amount_of_cpus_and_system_ram()
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.boot_timeout = 300
  config.vm.box = "digabi/ktp-qa"

  # Change this to point to a vagrant metadata file
  config.vm.box_url = "https://www.xrt.li/mirror/abitti/metadata.json"
  config.vm.provider :virtualbox do |vb|
    vb.name = "Virtuaalinen KTP (AANEKOSKI)"
    vb.gui = true
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--cpus", cpus]
    vb.customize ["modifyvm", :id, "--memory", mem]
    vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
    vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
    vb.customize ["modifyvm", :id, "--vram", 24]
  end

  config.vm.synced_folder '~/ktp-jako', '/media/usb1', id: 'media_usb1'
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.network "public_network", :adapter=>1, auto_config: false
end
