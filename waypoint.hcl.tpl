project = "{{ .ProjectName }}"

config {
  env = {
    "NAME" = dynamic("terraform-cloud", {
      organization = "{{ .TfcOrgName }}"
      workspace = "{{ .ProjectName }}"
      output = "name"
    })
  }
}

app "{{ .ProjectName }}-demo" {
  build {
    use "docker-pull" {
      image = "registry.services.demophoon.com/demophoon/wdt"
      tag = "latest"
    }
  }

  deploy {
    use "docker" {
      service_port = 80
    }
  }
}
