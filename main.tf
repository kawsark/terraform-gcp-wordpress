# Example instantiation for terraform-gcp-compute-instance as a module for Wordpress
# Using the startup-script Apache HTTPD server and Mysql are installed as systemd services

variable "gcp_credentials" {
  description = "Contents of GCP service account .json file"
}

module "gcp-wordpress-server" {
  source = "github.com/kawsark/terraform-gcp-compute-instance"
  labels  = {
    environment = "production"
    app = "wordpress"
    ttl = "8760h"
    owner = "kitchen3n-at-gmail-dot-com"
  } 
  
  gcp_credentials="${var.gcp_credentials}"
  gcp_project = "kitchen3n-wordpress"
  gcp_region = "us-east1"
  instance_name = "kitchen3n-wordpress-server"
  startup_script_file_path = "centos-lamp.sh"
  image = "centos-cloud/centos-7"
  machine_type = "n1-standard-4"
  os_pd_ssd_size = "40"
}
