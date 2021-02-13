# Configure Backend Droplets

A Virtual Private Cloud (VPC) is a private network interface for collections of DigitalOcean resources. VPC networks provide a more secure connection between resources because the network is inaccessible from the public internet and other VPC networks. Traffic within a VPC network doesn't count against bandwidth usage.

You can configure Droplets as internet gateways that let you access your VPC network from the internet. Gateways are commonly used to provide access to VPC networks from on-premise networks or applications while maintaining the isolation of the VPC network.

## Instructions
In order to run the script you need to know two things:
- The current droplet IP
- The gateway IP

You must ssh into your Gateway then your Backend Droplet or else your connection will drop during the execution of the shell script.

```md

sudo git pull remote
sudo chmod +x ./private_droplet/private_droplet.sh
./private_droplet/private_droplet.sh

```