variable "name" {
  type=string
}

variable "protocol" {
  type=string
}

variable "port" {
  type=number
}

variable "lb_id" {
  type=string
}

variable "pools" {
  type=list(object({
    name=string,
    protocol=string,
    lb_method=string,
    members=list(object({
      address=string,
      protocol_port=number,
      subnet_id=string
    }))
  }))
}