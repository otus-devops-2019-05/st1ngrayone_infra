terraform {
	# Версия terraform
	required_version = "0.11.11"
}

provider "google" {
	# Версия провайдера
	version = "2.0.0"
	# ID проекта
	project = "central-cinema-244208"

	region = "europe-west-1"
}

resource "google_compute_instance" "app" {
	name = "reddit-app"
	machine_type = "g1-small"
	zone = "europe-west1-b"
	tags = ["reddit-app"]
	# определение загрузочного диска
	boot_disk {
		initialize_params {
		image = "reddit-base"
		}
	}
	# определение сетевого интерфейса
	network_interface {
		# сеть, к которой присоединить данный интерфейс
		network = "default"
		# использовать ephemeral IP для доступа из Интернет
		access_config {}
	}
	connection {
		type = "ssh"
		user = "root"
		agent = false
		# путь до приватного ключа
		private_key = "${file("~/.ssh/id_rsa")}"
	}

	provisioner "file" {
		source = "files/puma.service"
		destination = "/tmp/puma.service"
	}
	provisioner "remote-exec" {
		script = "files/deploy.sh"
	}
	metadata {
		# путь до публичного ключа
		ssh-keys = "root:${file("~/.ssh/id_rsa.pub")}"
	}

}

resource "google_compute_firewall" "firewall_puma" {
	name = "allow-puma-default"
	# Название сети, в которой действует правило
	network = "default"
	# Какой доступ разрешить
	allow {
		protocol = "tcp"
		ports = ["9292"]
	}
	# Каким адресам разрешаем доступ
	source_ranges = ["0.0.0.0/0"]
	# Правило применимо для инстансов с перечисленными тэгами
	target_tags = ["reddit-app"]
}

