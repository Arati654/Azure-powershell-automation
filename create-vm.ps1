# Variables
$resourceGroup = "ProjectNew"
$location = "EastUS"
$vmName = "PSAutoVM"
$credential = Get-Credential

# Create Resource Group
New-AzResourceGroup -Name $resourceGroup -Location $location

# Create the VM
New-AzVm `
  -ResourceGroupName $resourceGroup `
  -Name $vmName `
  -Location $location `
  -VirtualNetworkName "${vmName}VNET" `
  -SubnetName "${vmName}Subnet" `
  -SecurityGroupName "${vmName}NSG" `
  -PublicIpAddressName "${vmName}PublicIP" `
  -Credential $credential `
  -ImageName "Win2019Datacenter" `
  -OpenPorts 80,3389 `
