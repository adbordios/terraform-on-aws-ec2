# Data source 1 - Get availability zone names
data "aws_availability_zones" "my_azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }

}

# Data source 2
data "aws_ec2_instance_type_offerings" "my_ins_type3" {
  for_each = toset(data.aws_availability_zones.my_azones.names)
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }

  filter {
    name   = "location"
    values = [each.key]
  }
  location_type = "availability-zone"
}

# Output 1
# Output all Availability Zones mapped to Supported INstance Types
output "output_v3_1" {
  value = {
    for az, details in data.aws_ec2_instance_type_offerings.my_ins_type3 : az => details.instance_types
  }
}

# Output 2
# Filtered Output: Exclude Unsupported Avaialbility Zones
output "output_v3_2" {
  value = {
    for az, details in data.aws_ec2_instance_type_offerings.my_ins_type3 :
    az => details.instance_types if length(details.instance_types) != 0
  }
}

# Output 3
# Filtered Output with Keys function: Get Keys from a Map
output "output_v3_3" {
  value = keys(
    {
      for az, details in data.aws_ec2_instance_type_offerings.my_ins_type3 :
      az => details.instance_types if length(details.instance_types) != 0
    }
  )
}

# Output 4
# Filtered Output with Keys function: Get Keys from a Map
output "output_v3_4" {
  value = keys(
    {
      for az, details in data.aws_ec2_instance_type_offerings.my_ins_type3 :
      az => details.instance_types if length(details.instance_types) != 0
    }
  )[0]
}
