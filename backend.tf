terraform {
    backend "s3" {
      bucket = "sur-test-terra"
      key = "vpc_backup"
      region = "us-east-1"
    }
  
}