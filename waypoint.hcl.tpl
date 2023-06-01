project = "{{ .ProjectName }}"

config {
  env = {
    "NAME" = dynamic("terraform-cloud", {
      organization = "{{ .TFCOrgName }}"
      workspace = "{{ .ProjectName }}"
      output = "name"
    })
  }
}

app "{{ .ProjectName }}-demo" {
  build {
    use "docker" {}
    registry {
      use "docker"
    }
  }

  deploy {
    use "docker" {
      service_port = 80
    }
  }
}
