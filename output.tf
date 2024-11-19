
########################################################
### OUTPUT / RESUME ###
########################################################

output "AWS_REGION" {
  value = var.AVAILABLE_REGIONS[var.AWS_REGIONS_INDEX]
}


output "AWS_AZ" {
  value = "${var.AVAILABLE_REGIONS[var.AWS_REGIONS_INDEX]}a"
}

output "VPC_Name" {
  value = aws_vpc.VPC-Jenkins-JavaApp-CICD.tags.Name
}

output "VPC_CIDR" {
  value = aws_vpc.VPC-Jenkins-JavaApp-CICD.cidr_block
}

output "VPC_Public_Subnet" {
  value = "${aws_subnet.Public-Subnet-Jenkins-JavaApp-CICD.tags.Name} --> ${aws_subnet.Public-Subnet-Jenkins-JavaApp-CICD.cidr_block}"
}

output "VPC_Private_Subnet" {
  value = "${aws_subnet.Private-Subnet-Jenkins-JavaApp-CICD.tags.Name} --> ${aws_subnet.Private-Subnet-Jenkins-JavaApp-CICD.cidr_block}"
}

output "AMI_maven_jenkins_ansible" {
  value = var.ami[var.AVAILABLE_REGIONS[var.AWS_REGIONS_INDEX]].maven_jenkins_ansible
}

output "AMI_sonarqube" {
  value = var.ami[var.AVAILABLE_REGIONS[var.AWS_REGIONS_INDEX]].sonarqube
}

/* output "AMI_nexus" {
  value = var.ami[var.AVAILABLE_REGIONS[var.AWS_REGIONS_INDEX]].nexus
}
 */

/*
output "AMI_prometheus" {
  value = var.ami[var.AVAILABLE_REGIONS[var.AWS_REGIONS_INDEX]].prometheus
}

output "AMI_grafana" {
  value = var.ami[var.AVAILABLE_REGIONS[var.AWS_REGIONS_INDEX]].grafana
}

output "AMI_Env" {
  value = var.ami[var.AVAILABLE_REGIONS[var.AWS_REGIONS_INDEX]].env
}
*/

output "Instant_Type_maven_jenkins_ansible" {
  value = lookup(var.InstanceType, "maven_jenkins_ansible")
}

output "Instant_Type_Sonarqube" {
  value = lookup(var.InstanceType, "sonarqube")
}

/* output "Instant_Type_Nexus" {
  value = lookup(var.InstanceType, "nexus")
} */


/*
output "Instant_Type_Prometheus" {
  value = lookup(var.InstanceType, "prometheus")
}

output "Instant_Type_Grafana" {
  value = lookup(var.InstanceType, "grafana")
}

output "Instant_Type_Environment" {
  value = lookup(var.InstanceType, "env")
}
*/

output "Key_Pair_Name" {
  value = var.Key_Pair_Name
}
