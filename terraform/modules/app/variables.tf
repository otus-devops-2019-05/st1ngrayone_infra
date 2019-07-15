variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable zone {
  description = "zone for google compute instance app"
  default     = "*"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default = "reddit-app-base"
}

