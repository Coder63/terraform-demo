resource "aws_cloudwatch_metric_alarm" "CPU-high" {
    alarm_name = "CPU-util-high-agents"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "CPUUtilization"
    namespace = "System/Linux"
    period = "300"
    statistic = "Average"
    threshold = "80"
    alarm_description = "This metric monitors ec2 CPU for high utilization on agent hosts"
    alarm_actions = [
        "${aws_autoscaling_policy.agents-scale-up.arn}"
    ]
    dimensions {
        AutoScalingGroupName = "${aws_autoscaling_group.agents.name}"
    }
}

resource "aws_cloudwatch_metric_alarm" "CPU-low" {
    alarm_name = "CPU-util-low-agents"
    comparison_operator = "LessThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "CPUUtilization"
    namespace = "System/Linux"
    period = "300"
    statistic = "Average"
    threshold = "40"
    alarm_description = "This metric monitors ec2 CPU for low utilization on agent hosts"
    alarm_actions = [
        "${aws_autoscaling_policy.agents-scale-down.arn}"
    ]
    dimensions {
        AutoScalingGroupName = "${aws_autoscaling_group.agents.name}"
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
