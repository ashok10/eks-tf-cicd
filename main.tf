module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.29"
  subnet_ids      = ["subnet-xxxx", "subnet-yyyy"] # Replace with your actual subnet IDs
  vpc_id          = "vpc-xxxx"                     # Replace with your VPC ID

  manage_aws_auth_configmap = true

  eks_managed_node_groups = {
    default = {
      desired_size = 2
      max_size     = 3
      min_size     = 1
      instance_types = ["t3.medium"]
    }
  }
}
