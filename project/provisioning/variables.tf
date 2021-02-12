variable "master_instance_type" {
	default = "t2.medium"
}

variable "master_instance_count" {
	default = 1
}

variable "node_instance_type" {
	default = "t2.medium"
}

variable "node_instance_count" {
	default = 1
}

variable "name" {
	type = string
}