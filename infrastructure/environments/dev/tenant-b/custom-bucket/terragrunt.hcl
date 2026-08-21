include "root" {
  path = find_in_parent_folders()
}

# EDGE CASE DEMO: Completely unique resource for tenant-b!
# Notice we DO NOT include "envcommon" here. We define the source module directly.
terraform {
  source = "tfr:///terraform-aws-modules/s3-bucket/aws?version=4.1.2"
}

inputs = {
  bucket = "ideal-foundation-custom-bucket-tenant-b-demo"
  acl    = "private"
  
  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}
