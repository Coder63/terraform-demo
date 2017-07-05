resource "aws_launch_configuration" "App-lc" {
    name_prefix = "App-lc-"
    image_id = "ami-efd0428f"
    instance_type = "t2.micro"

    lifecycle {
        create_before_destroy = true
    }

    root_block_device {
        volume_type = "gp2"
        volume_size = "8"
    }
}

resource "aws_autoscaling_group" "agents" {
    availability_zones = ["us-west-2c"]
    name = "Agents"
    max_size = "3"
    min_size = "1"
    health_check_grace_period = 300
    health_check_type = "EC2"
    desired_capacity = 2
    force_delete = true
    launch_configuration = "${aws_launch_configuration.App-lc.name}"

    tag {
        key = "Name"
        value = "Agent Instance"
        propagate_at_launch = true
    }
}

resource "aws_autoscaling_policy" "agents-scale-up" {
    name = "agents-scale-up"
    scaling_adjustment = 1
    adjustment_type = "ChangeInCapacity"
    cooldown = 300
    autoscaling_group_name = "${aws_autoscaling_group.agents.name}"
}

resource "aws_autoscaling_policy" "agents-scale-down" {
    name = "agents-scale-down"
    scaling_adjustment = -1
    adjustment_type = "ChangeInCapacity"
    cooldown = 300
    autoscaling_group_name = "${aws_autoscaling_group.agents.name}"
}
