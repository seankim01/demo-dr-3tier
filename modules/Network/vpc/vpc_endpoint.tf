# vpc endpoint
# resource "aws_vpc_endpoint" "edp_s3" {
#   vpc_id            = aws_vpc.vpc.id
#   vpc_endpoint_type = "Gateway"
#   service_name      = "com.amazonaws.ap-northeast-2.s3"

#   route_table_ids = [
#     aws_route_table.rt_pub.id
#   ]

#   tags = {
#     Name = "${var.company}-${var.env}-ep-s3"
#     Type = "ep"
#   }
# }
