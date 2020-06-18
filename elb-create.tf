# Create a new load balancer
resource "aws_elb" "my-elb" {
  name               = "ranjan-terraform-elb"
  availability_zones = ["eu-west-2a", "eu-west-2b"]


  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }


  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

#  instances                   = ["${aws_instance.foo.id}"]
#  cross_zone_load_balancing   = true
#  idle_timeout                = 400
#  connection_draining         = true
#  connection_draining_timeout = 400

  tags = {
    Name = "ranjan-terraform-elb"
  }
}