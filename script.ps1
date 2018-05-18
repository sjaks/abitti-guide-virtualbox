# sjaks@GitHub
# Käynnistää virtuaalisen Abitti-palvelimen automatisoidusti
# Initiates a virtual Abitti server instance automatically

# Set environmental variables
$env:HOMEDRIVE="C:"
$env:HOMEPATH="\Users\" + $Env:USERNAME + "\"

# Save full home path to its own var
$FULLHOME = $env:HOMEDRIVE + $env:HOMEPATH

# Declare a full path to the ktp directory
$FULLPATH = $FULLHOME + "ktp"

# Create the ktp dir if it doesnt exist
if(!(Test-Path -Path $FULLPATH )){
  New-Item -ItemType directory -Path $FULLPATH
  echo ""
  echo "Luotiin ktp-kansio onnistuneesti!"
  echo "Ladataan VAGRANTFILE kohteesta www.abitti.fi..."
  
  # Set Vagrant file destination
  $VAGRANTPATH = $FULLPATH + "/Vagrantfile"
  
  # Download Vagrant file
  #Invoke-WebRequest -Uri "https://www.xrt.li/mirror/abitti/Vagrantfile" -OutFile $VAGRANTPATH
  Invoke-WebRequest -Uri "http://static.abitti.fi/usbimg/qa/vagrant/Vagrantfile" -OutFile $VAGRANTPATH
  
}

# Change to ktp
cd $FULLPATH

# Print out the full ktp path
echo ""
echo "Poluksi valittu:"
echo $FULLPATH
echo ""
echo ""

# Being in the ktp dir,
# set the ktp-jako dir relative path
$EXAMPATH = "..\ktp-jako"

# Create the exam ktp-jako dir if it doesnt exist
if(!(Test-Path -Path $EXAMPATH )){
  New-Item -ItemType directory -Path $EXAMPATH
  echo ""
  echo "Luotiin ktp-jako-kansio onnistuneesti!"
  echo ""
}

# Print out the exam dir path
echo ""
echo ""
echo "Etsitään kokeita hakemistosta:"
echo $EXAMPATH
echo ""
echo ""

echo "------- [ PALVELIMELLA OLEVAT KOKEET ] -------"

# List all the files inside of ktp-jako exam folder
Get-ChildItem -Path $EXAMPATH
echo ""
echo "Varmista, että koe on listattu yllä. Jatketaan automaattisesti..."

# Sleep for 2s to ensure the teacher sees
# the exam listing printed above
sleep(2)

# Initiate a vagrant session
vagrant up
