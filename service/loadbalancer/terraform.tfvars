lb_create = [
  {
    index                      = "ext-alb-01"
    name                       = "dmz-alb-ext"
    internal                   = false
    load_balancer_type         = "application"
    sg_index                   = ["ext-alb"]
    sub_index                  = ["dmz-pub-01a", "dmz-pub-02c"]
    enable_deletion_protection = false
  },
]
lb_listener_create = [
  {
    index    = "ext-alb-80"
    lb_index = "ext-alb-01"
    port     = "80"
    protocol = "HTTP"

    action = "redirect"

    redirect = {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  },
  {
    index        = "ext-alb-443"
    lb_index     = "ext-alb-01"
    port         = "443"
    protocol     = "HTTPS"
    acm_required = true

    ssl_policy      = "ELBSecurityPolicy-TLS13-1-2-2021-06"
    #certificate_arn = "arn:aws:acm:ap-northeast-2:730335492431:certificate/7d678e55-1eb1-4e84-b90f-c447bbd44cbb"  # 기존(24년)        변경 필요
    certificate_arn = "arn:aws:acm:ap-northeast-2:446805103418:certificate/8f97a371-e4fc-4393-befe-c348995f723f"   # 신규(25년10월30일) 변경 필요    

    action = "forward"
    target = "tg-stadium"

  },
]
lb_listener_rules_create = [
  {
    listener = "ext-alb-443"
    name     = "stadium"
    priority = 1

    action = "forward"
    target = "tg-stadium"

    conditions = [{
      #host_headers = ["stadium.fint.co.kr"]     # 기존(24년)        변경 필요
      host_headers = ["stadium.airbss.shop"]     # 신규(25년10월30일) 변경 필요   
      },
      # {
      #   path_patterns = ["/stadium/*"]
      # }
    ]
  },

]
tg_create = [
  {
    index     = "tg-stadium"
    name      = "tg-stadium"
    vpc_index = "fint-dr-dmz-vpc"
    port      = 80
    protocol  = "HTTP"
    target_id = ["ec2-stadium0002", "ec2-stadium0005", "ec2-stadium0006"]

    health_check = {
      path = "/"
    }

  },
]
