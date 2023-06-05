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

runner {
  enabled = true
  data_source "git" {
    url = "https://github.com/demophoon/terraform-brittcorp-trivial.git"
  }
}

app "{{ .ProjectName }}-demo" {
  build {
    use "docker" {  }
    registry {
      use "docker" {
        image = "registry.services.demophoon.com/demophoon/nginx-test"
        tag = gitrefpretty()
      }
    }
  }

  deploy {
    use "docker" {
      service_port = 80
    }
  }
}
