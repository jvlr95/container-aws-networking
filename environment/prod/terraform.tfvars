project_name = "personal-vpc"
region       = "us-east-1"

vpc_cidr = "10.0.0.0/16"
vpc_additional_cidrs = [
  "100.64.0.0/16"
]

public_subnets = [
  {
    name              = "personal-vpc-public-1a"
    cidr              = "10.0.48.0/24"
    availability_zone = "us-east-1a"
  },
  {
    name              = "personal-vpc-public-1b"
    cidr              = "10.0.49.0/24"
    availability_zone = "us-east-1b"
  },
  {
    name              = "personal-vpc-public-1c"
    cidr              = "10.0.50.0/24"
    availability_zone = "us-east-1c"
  }
]

private_subnets = [
  // private subnets
  {
    name              = "personal-vpc-private-1a"
    cidr              = "10.0.0.0/20"
    availability_zone = "us-east-1a"
  },
  {
    name              = "personal-vpc-private-1b"
    cidr              = "10.0.16.0/20"
    availability_zone = "us-east-1b"
  },
  {
    name              = "personal-vpc-private-1c"
    cidr              = "10.0.32.0/20"
    availability_zone = "us-east-1c"
  },
  // pods subnets
  {
    name              = "eks-pods-1a"
    cidr              = "100.64.0.0/18"
    availability_zone = "us-east-1a"
  },
  {
    name              = "eks-pods-1b"
    cidr              = "100.64.64.0/18"
    availability_zone = "us-east-1b"
  },
  {
    name              = "eks-pods-1c"
    cidr              = "100.64.128.0/18"
    availability_zone = "us-east-1c"
  }
]

database_subnets = [
  {
    name              = "personal-vpc-database-1a"
    cidr              = "10.0.51.0/24"
    availability_zone = "us-east-1a"
  },
  {
    name              = "personal-vpc-database-1b"
    cidr              = "10.0.52.0/24"
    availability_zone = "us-east-1b"
  },
  {
    name              = "personal-vpc-database-1c"
    cidr              = "10.0.53.0/24"
    availability_zone = "us-east-1c"
  }
]