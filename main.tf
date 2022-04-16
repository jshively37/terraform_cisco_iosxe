terraform {
  required_providers {
    iosxe = {
      source  = "CiscoDevNet/iosxe"
      version = "0.1.1"
    }
  }
}

provider "iosxe" {
  host            = var.url
  device_username = var.username
  device_password = var.password
  request_timeout = 30
  insecure        = true
}

resource "iosxe_rest" "get_interfaces" {
  method  = "GET"
  path    = "/data/ietf-interfaces:interfaces"
  payload = ""
}

resource "iosxe_rest" "create_interfaces" {
  method = "POST"
  path   = "/data/ietf-interfaces:interfaces"
  payload = jsonencode(
    {
      "ietf-interfaces:interface" : {
        "name" : "Loopback115",
        "description" : "Added with Terraform",
        "type" : "iana-if-type:softwareLoopback",
        "ietf-ip:ipv4" : {
          "address" : [
            {
              "ip" : "172.16.111.1",
              "netmask" : "255.255.255.0"
            }
          ]
        }
      }
    }
  )
}

# resource "iosxe_rest" "update_interface" {
#   method = "PUT"
#   path   = "/data/ietf-interfaces:interfaces/interface=Loopback115"
#   payload = jsonencode(
#     {
#       "ietf-interfaces:interface" : {
#         "name" : "Loopback115",
#         "description" : "Put with Terraform - Update address",
#         "type" : "iana-if-type:softwareLoopback",
#         "ietf-ip:ipv4" : {
#           "address" : [
#             {
#               "ip" : "172.16.111.2",
#               "netmask" : "255.255.255.0"
#             }
#           ]
#         }
#       }
#     }
#   )
# }

# resource "iosxe_rest" "delete_interface" {
#   method = "DELETE"
#   path   = "/data/ietf-interfaces:interfaces/interface=Loopback115"
# }
