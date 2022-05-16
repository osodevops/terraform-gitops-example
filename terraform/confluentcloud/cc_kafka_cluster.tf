resource "confluentcloud_service_account" "test_sa" {
  display_name = "test_sa"
  description = "description for test_sa"
}

resource "confluent_environment" "test-env" {
  display_name = "Development"
}

resource "confluent_kafka_cluster" "basic-cluster-on-aws" {
  display_name = "basic_kafka_cluster_on_aws"
  availability = "SINGLE_ZONE"
  cloud        = "AWS"
  region       = "us-west-2"
  basic {}

  environment {
    id = confluent_environment.test-env.id
  }
}