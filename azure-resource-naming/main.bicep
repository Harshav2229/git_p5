@description('Azure region for the resources')
param location string = 'centralindia'

@description('Environment name')
@allowed([
  'dev'
  'test'
  'prod'
])
param environment string = 'dev'

@description('Project name')
param projectName string = 'azurenaming'

@description('Resource instance number')
param instanceNumber string = '01'

var vnetName = 'vnet-' + projectName + '-' + environment + '-' + location + '-' + instanceNumber
var subnetName = 'snet-' + projectName + '-' + environment + '-' + location + '-' + instanceNumber
var nsgName = 'nsg-' + projectName + '-' + environment + '-' + location + '-' + instanceNumber

resource vnet 'Microsoft.Network/virtualNetworks@2024-01-01' = {
  name: vnetName
  location: location
  tags: {
    Project: projectName
    Environment: environment
    ManagedBy: 'Bicep'
    Purpose: 'ResourceNamingDemo'
  }
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}

resource nsg 'Microsoft.Network/networkSecurityGroups@2024-01-01' = {
  name: nsgName
  location: location
  tags: {
    Project: projectName
    Environment: environment
    ManagedBy: 'Bicep'
    Purpose: 'ResourceNamingDemo'
  }
  properties: {
    securityRules: [
      {
        name: 'Allow-HTTPS'
        properties: {
          priority: 100
          access: 'Allow'
          direction: 'Inbound'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '443'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
        }
      }
    ]
  }
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2024-01-01' = {
  parent: vnet
  name: subnetName
  properties: {
    addressPrefix: '10.0.1.0/24'
    networkSecurityGroup: {
      id: nsg.id
    }
  }
}

output virtualNetworkName string = vnet.name
output subnetName string = subnet.name
output networkSecurityGroupName string = nsg.name