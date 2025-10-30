vpc = [
  {
    vpc_name             = "fint-dr-dmz-vpc"
    service              = "dmz"
    cidr_block           = "192.168.205.0/24"
    enable_dns_hostnames = true
    enable_dns_support   = true
    enable_ipv6          = false
    secondary_cidr_block = null
    aws_internet_gateway = true
    flowlog              = true # true or false
    flowlog_type         = "ALL"
  },
  {
    vpc_name             = "fint-dr-service-vpc"
    service              = "service"
    cidr_block           = "192.168.204.0/24"
    enable_dns_hostnames = true
    enable_dns_support   = true
    enable_ipv6          = false
    secondary_cidr_block = null
    aws_internet_gateway = false
    flowlog              = false # true or false
  },
]
subnet = [
  {
    name                    = "pub-01a"
    vpc_name                = "fint-dr-dmz-vpc"
    service                 = "dmz"
    zone                    = "ap-northeast-2a"
    cidr                    = "192.168.205.160/27"
    map_public_ip_on_launch = "true"
    position                = "dmz-public"
  },
  {
    name                    = "pub-02c"
    vpc_name                = "fint-dr-dmz-vpc"
    service                 = "dmz"
    zone                    = "ap-northeast-2c"
    cidr                    = "192.168.205.128/27"
    map_public_ip_on_launch = "true"
    position                = "dmz-public"
  },
  {
    name                    = "pri-01a"
    vpc_name                = "fint-dr-dmz-vpc"
    service                 = "dmz"
    zone                    = "ap-northeast-2a"
    cidr                    = "192.168.205.64/26"
    map_public_ip_on_launch = "false"
    position                = "dmz-private"
  },
  {
    name                    = "pri-02c"
    vpc_name                = "fint-dr-dmz-vpc"
    service                 = "dmz"
    zone                    = "ap-northeast-2c"
    cidr                    = "192.168.205.0/26"
    map_public_ip_on_launch = "false"
    position                = "dmz-private"
  },
  {
    name                    = "pri-tgw-01a"
    vpc_name                = "fint-dr-dmz-vpc"
    service                 = "dmz"
    zone                    = "ap-northeast-2a"
    cidr                    = "192.168.205.208/28"
    map_public_ip_on_launch = "false"
    position                = "dmz-private-tgw"
  },
  {
    name                    = "pri-tgw-02c"
    vpc_name                = "fint-dr-dmz-vpc"
    service                 = "dmz"
    zone                    = "ap-northeast-2c"
    cidr                    = "192.168.205.192/28"
    map_public_ip_on_launch = "false"
    position                = "dmz-private-tgw"
  },
  {
    name                    = "pri-service-01a"
    vpc_name                = "fint-dr-service-vpc"
    service                 = "service"
    zone                    = "ap-northeast-2a"
    cidr                    = "192.168.204.0/26"
    map_public_ip_on_launch = "false"
    position                = "service-private"
  },
  {
    name                    = "pri-service-02c"
    vpc_name                = "fint-dr-service-vpc"
    service                 = "service"
    zone                    = "ap-northeast-2c"
    cidr                    = "192.168.204.64/26"
    map_public_ip_on_launch = "false"
    position                = "service-private"
  },
  {
    name                    = "pri-ledger-01a"
    vpc_name                = "fint-dr-service-vpc"
    service                 = "service"
    zone                    = "ap-northeast-2a"
    cidr                    = "192.168.204.128/28"
    map_public_ip_on_launch = "false"
    position                = "service-private-ledger"
  },
  {
    name                    = "pri-ledger-02c"
    vpc_name                = "fint-dr-service-vpc"
    service                 = "service"
    zone                    = "ap-northeast-2c"
    cidr                    = "192.168.204.144/28"
    map_public_ip_on_launch = "false"
    position                = "service-private-ledger"
  },
  {
    name                    = "pri-tgw-01a"
    vpc_name                = "fint-dr-service-vpc"
    service                 = "service"
    zone                    = "ap-northeast-2a"
    cidr                    = "192.168.204.160/28"
    map_public_ip_on_launch = "false"
    position                = "service-private-tgw"
  },
  {
    name                    = "pri-tgw-02c"
    vpc_name                = "fint-dr-service-vpc"
    service                 = "service"
    zone                    = "ap-northeast-2c"
    cidr                    = "192.168.204.176/28"
    map_public_ip_on_launch = "false"
    position                = "service-private-tgw"
  }
]

nat_create = [
  {
    index          = "nat-pub-01a"
    service        = "dmz"
    type           = "nat"
    sub_index      = "dmz-pub-01a"
    networkboudary = "pub"
  },
]

tgw_create = [
  {
    name                            = "shared"
    amazon_side_asn                 = 64513
    default_route_table_association = "disable"
    default_route_table_propagation = "disable"
  }
]

tgw_att_create = [
  {
    name                                            = "dmz"
    sub_index                                       = ["dmz-pri-tgw-01a", "dmz-pri-tgw-02c"]
    vpc_name                                        = "fint-dr-dmz-vpc"
    tgw_name                                        = "shared"
    transit_gateway_default_route_table_association = false
  },
  {
    name                                            = "service"
    sub_index                                       = ["service-pri-tgw-01a", "service-pri-tgw-02c"]
    vpc_name                                        = "fint-dr-service-vpc"
    tgw_name                                        = "shared"
    transit_gateway_default_route_table_association = false
  },
]

tgw_rtb_create = [
  {
    name       = "dmz-rtb"
    tgw        = "shared"
    vpc_attach = "dmz"
  },
  {
    name       = "service-rtb"
    tgw        = "shared"
    vpc_attach = "service"
  },
]

tgw_rtb_association_create = [
  {
    name         = "dmz"
    rtb          = "dmz-rtb"
    tgw          = "shared"
    vpn_required = false
    tgw_att      = "dmz"
  },
  {
    name         = "service"
    rtb          = "service-rtb"
    tgw          = "shared"
    vpn_required = false
    tgw_att      = "service"
  },
  # {
  #   name         = "dmz-vpn"
  #   rtb          = "dmz-rtb"
  #   tgw          = "shared"
  #   vpn_required = true
  #   tgw_att      = "s2s-01"
  # },
]


tgw_route_create = [
  # {
  #   name                   = "dmz-vpn-4"
  #   destination_cidr_block = "192.168.4.0/24"
  #   vpn_required           = true
  #   tgw_rtb                = "dmz-rtb"
  #   tgw_att                = "s2s-01" # vpn 연결시 vpn으로 변경 s2s-01
  # },
  # {
  #   name                   = "dmz-vpn-5"
  #   destination_cidr_block = "192.168.5.0/24"
  #   vpn_required           = true
  #   tgw_rtb                = "dmz-rtb"
  #   tgw_att                = "s2s-01" # vpn 연결시 vpn으로 변경 s2s-01
  # },
  # {
  #   name                   = "dmz-vpn-2"
  #   destination_cidr_block = "192.168.2.0/24"
  #   vpn_required           = true
  #   tgw_rtb                = "dmz-rtb"
  #   tgw_att                = "s2s-01" # vpn 연결시 vpn으로 변경 s2s-01
  # },
  {
    name                   = "dmz-service"
    destination_cidr_block = "192.168.204.0/24"
    vpn_required           = false
    tgw_rtb                = "dmz-rtb"
    tgw_att                = "service"
  },
  {
    name                   = "service-dmz-all"
    destination_cidr_block = "0.0.0.0/0"
    vpn_required           = false
    tgw_rtb                = "service-rtb"
    tgw_att                = "dmz"
  },
]

# VPN 연결 확정 시 에  주석 해제
# cgw = [
#   {
#     index      = "cgw-01"
#     purpose    = "shared"
#     name       = "cgw-idc"
#     bgp_asn    = 65000
#     ip_address = "1.2.3.4" # FINT IDC VPN 장비 IP 
#     type       = "ipsec.1"
#   }
# ]
# vpn = [
#   {
#     index               = "s2s-01"
#     purpose             = "shared-vpn"
#     transit_gateway_id  = "shared"
#     customer_gateway_id = "cgw-01"
#     type                = "ipsec.1"
#     static_routes_only  = true
#   }
# ]

