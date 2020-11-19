# Create listeners
resource "openstack_lb_listener_v2" "listener" {
  name            = var.name
  description     = var.description
  protocol        = var.protocol
  protocol_port   = var.port
  loadbalancer_id = var.lb_id
  timeout_client_data = var.timeout_client_data
  timeout_tcp_inspect = var.timeout_tcp_inspect
  timeout_member_connect = var.timeout_member_connect
  timeout_member_data = var.timeout_member_data
  connection_limit = var.connection_limit
  admin_state_up = var.admin_state_up
  insert_headers = var.insert_headers
}

module "pools" {
  source  = "app.terraform.io/Seedbox/pool/openstack"
  version = "1.0.1"
  count = length(var.pools)

  name = var.pools[count.index].name
  protocol = var.pools[count.index].protocol
  lb_method = var.pools[count.index].lb_method
  listener_id = openstack_lb_listener_v2.listener.id
  members = var.pools[count.index].members
}
