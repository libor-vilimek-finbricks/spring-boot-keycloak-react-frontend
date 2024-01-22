terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = ">= 4.0.0"
    }
  }
}

provider "keycloak" {
  client_id = "admin-cli"
  username  = "admin"
  password  = "admin"
  url       = "http://localhost:8081"
}

resource "keycloak_realm" "springreact" {
  realm             = "springreact"
  enabled           = true
  display_name      = "springreact"
  display_name_html = "<b>springreact</b>"
}

resource "keycloak_openid_client" "openid_client" {
  realm_id            = keycloak_realm.springreact.id
  client_id           = "springreact-openid"

  name                = "springreact-openid"
  enabled             = true

  access_type         = "PUBLIC"
  valid_redirect_uris = [
    "*"
  ]

  standard_flow_enabled = true
  direct_access_grants_enabled = true
}

resource "keycloak_user" "user_with_initial_password" {
  realm_id   = keycloak_realm.springreact.id
  username   = "springreact"
  enabled    = true

  first_name = "Spring"
  last_name  = "React"

  initial_password {
    value     = "springreact"
    temporary = false
  }
}
