project = "hello-test"

config {
  env = {
    "NAME" = dynamic("terraform-cloud", {
      organization = "brittslittlesliceofheaven"
      workspace = "hello2"
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

app "hello2-demo" {
  build {
    use "docker" { }
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

