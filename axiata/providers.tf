terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.76.0"
    }
  }
}

provider "google" {
  project = "fluid-tuner-391713"
  region = "us-west4"
  credentials = "./key.json"
}