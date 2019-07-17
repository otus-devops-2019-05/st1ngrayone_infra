variable public_key_path {
  # Описание переменной
  description = "ssh key for provisioners"
}

variable zone {
  description = "zone for google compute instance app"
  default     = "*"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default = "reddit-db-base"
}
