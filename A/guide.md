in order to make the transition between azure and aws we will first need to create the infrastructure:

instead of NSG - ACL

Networking:

VPC - for example: 10.0.0.0/24 - if I'm not mistaken this will open around 6000 posibilities,
it is the equivilent of annotating CIDR in the following manner:
10.0.255.255 (notice the last two 255 represent all options from 0-255,
for instance, 10.0.0.0/32 is somewhat equal to 10.0.0.8 - allowing 0-8 if I'm not mistaken)

10.0.0.26

frontend subnet - 10.0.0.10/28
backend subnet - 10.0.0.20/28

we also need a nat gateway, a subnet association and to connect the ec2 to each subnet using an nic?

can also explore the options using a tutorial or a beanstalk for good measure.

the final outcome is both private and public subnets.

by clicking vpc and more we are introduced with the new create vpc experience,

vpc -> subnets -> route tables (public & private) -> network connections- nat.
(dns resolution etc.)
10.0.0.0/16 (65,536 ips)
10.0.0.0/28 ( 16 ips )
10.0.0.1
10.0.0.2

10.0.0.0/27 (?)
10.0.0.0/28
10.0.0.16/28
