variable "token" {
  type = string
}

variable "cloud_id" {
  type = string
}

variable "folder_id" {
  type = string
}

variable "zone" {
  type = string
}

variable "network" {
  type    = string
  default = "ya-network"
}

variable "subnet" {
  type    = string
  default = "ya-network"
}

variable "subnet_v4_cidr_blocks" {
  type = list(string)
  default = ["192.168.10.0/24"]
}

variable "nat" {
  type    = bool
  default = true
}

variable "image_family" {
  type = string
}

variable "name" {
  type = string
}

variable "hostname" {
  type = string
}

variable "cores" {
  type    = number
  default = 2
}

variable "memory" {
  type    = number
  default = 4
}

variable "disk_size" {
  type    = number
  default = 5
}

variable "disk_type" {
  type    = string
  default = "network-nvme"
}

variable "user_name" {
  default = ""
  type    = string
}


variable "timeout_create" {
  default = "10m"
}

variable "timeout_delete" {
  default = "10m"
}

variable "ssh_key_path" {
  default = ""
}

variable "s3_endpoint" {
  type = string
}

variable "s3_bucket" {
  type = string
}

variable "s3_region" {
  type = string
}

variable "s3_key" {
  // <путь_к_файлу_состояния_в_бакете>/<имя_файла_состояния>.tfstate
  type = string
}