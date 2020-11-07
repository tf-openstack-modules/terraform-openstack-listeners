variable "name" {
  type=string
  description="Human-readable name for the Listener. Does not have to be unique."
  default=""
}

variable "description" {
  type=string
  description="Human-readable description for the Listener."
  default=""
}

variable "protocol" {
  type=string
  description="The protocol - can either be TCP, HTTP, HTTPS, TERMINATED_HTTPS or UDP (supported only in Octavia). Changing this creates a new Listener."
}

variable "port" {
  type=number
  description="The port on which to listen for client traffic. Changing this creates a new Listener."
}

variable "timeout_client_data" {
  type=number
  description="The client inactivity timeout in milliseconds."
  default=50000
}

variable "timeout_tcp_inspect" {
  type=number
  description="The time in milliseconds, to wait for additional TCP packets for content inspection."
  default=0
}

variable "timeout_member_connect" {
  type=number
  description="The member connection timeout in milliseconds"
  default=5000
}

variable "timeout_member_data" {
  type=number
  description="The member inactivity timeout in milliseconds."
  default=5000
}

variable "connection_limit" {
  type=number
  description="The maximum number of connections allowed for the Listener."
  default=-1
}

variable "admin_state_up" {
  type=bool
  description="The administrative state of the Listener. A valid value is true (UP) or false (DOWN)."
  default=true
}

variable "lb_id" {
  type=string
  description="The load balancer on which to provision this Listener. Changing this creates a new Listener."
}

variable "insert_headers" {
  type=map(any)
  description="The list of key value pairs representing headers to insert into the request before it is sent to the backend members. Changing this updates the headers of the existing listener."
  default={
    X-Forwarded-For="false"
  }
}
variable "pools" {
  type=list(any)
  description="pool's list which uses this new listener"
}
