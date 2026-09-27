# Azure Resource Naming and Governance

## Project Overview
A standardized approach for naming and organizing Microsoft Azure resources so they are easy to identify, manage, govern, and scale.

## Problem Statement
Inconsistent Azure resource names make cloud infrastructure difficult to identify and manage, especially as the number of resources and teams increases.

## Naming Convention
`<resource-type>-<project>-<environment>-<region>-<instance>`

Example: `vnet-azurenaming-dev-centralindia-01`

## Infrastructure as Code
The `main.bicep` template creates a Virtual Network, Subnet, Network Security Group, NSG/Subnet association, and standardized resource tags.

## Deployment
```bash
az login
az group create --name rg-azurenaming-dev-centralindia --location centralindia
az deployment group create --resource-group rg-azurenaming-dev-centralindia --template-file main.bicep
```

## Expected Resource Names
```text
rg-azurenaming-dev-centralindia
vnet-azurenaming-dev-centralindia-01
snet-azurenaming-dev-centralindia-01
nsg-azurenaming-dev-centralindia-01
```

## Governance
Azure Policy can be used alongside this deployment to audit or enforce organizational requirements such as allowed locations and required tags.

## Benefits
- Consistent resource identification
- Easier infrastructure management
- Improved governance
- Better environment separation
- Easier automation and scaling

## Safety
Do not commit Azure credentials, client secrets, passwords, access keys, connection strings, or other sensitive information to GitHub.