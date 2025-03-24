provider "aws" {
    region = "us-east-1"
  
}

resource "Aws_Instance" "my-Ec2"{

ami ="ami-0c55b159cbfafe1f0"
instance_type = "t2.micro"
key_name = "mykey"
security_group_Id ="sg-0c55b159cbfafe1f0"
}


variable "instances"{
type =map(string)
default={
instanceA= "t2.micro"
instanceB= "t2.small"
}
}

resource "Aws_instance" "My-Ec2" {


for_each =  var.instances
ami =   "ami-08b5b3a93ed654d19"      
key_name = "RevaT" 
instance_type = each.value
tags ={
Name = each.key
}


}


