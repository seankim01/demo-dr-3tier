ec2_create = [
  # {
  #   index                  = "ec2-bastion"
  #   ami                    = "ami-089cd96a3fed9a2e8" # Amazon Linux 2 AMI
  #   instance_type          = "t3.small"
  #   sub_index              = "dmz-pub-01a"   # subnet 변수 값을 넣어주세요
  #   sg_index               = ["bastion-ec2"] # 보안그룹 변수 값을 넣어주세요
  #   key_name               = "k8s-key"      # 본인 key로 바꾸세요.
  #   volume_size            = 20
  #   volume_type            = "gp3"
  #   eip_required           = true                           # eip 필요 시 에 기입
  #   user_data              = "userdata/example_userdata.sh" # user data 경로 기입
  #   instance_profile_index = "ssm"                          # ec2 롤 부여시 기입 현재 SSM Role만 부여
  #   eni_required           = false                          # private ip 따로 지정해서 사용 안할 시에 False

  #   network_boundary = "pub"
  #   purpose          = "bastion"
  #   service          = "dmz"
  #   region_az        = "apne1a"
  #   type             = "ec2"
  # },
  {
    index                  = "ec2-stadium0002"
    ami                    = "ami-089cd96a3fed9a2e8" # Amazon Linux 2 AMI
    instance_type          = "t3.large"
    sub_index              = "dmz-pri-01a"   # subnet 변수 값을 넣어주세요
    sg_index               = ["stadium-ec2"] # 보안그룹 변수 값을 넣어주세요
    key_name               = "k8s-key"      # 본인 key로 바꾸세요.
    volume_size            = 80
    volume_type            = "gp3"
    eip_required           = false
    user_data              = "userdata/example_userdata.sh" # user data 경로 기입
    instance_profile_index = "ssm"
    eni_required           = true             # private ip 따로 지정해서 사용 시에 true
    private_ips            = "192.168.205.72" # 사용할 private ip 기입

    network_boundary = "private"
    purpose          = "stadium0002"
    service          = "dmz"
    region_az        = "apne1a"
    type             = "ec2"
  },
  {
    index                  = "ec2-stadium0005"
    ami                    = "ami-089cd96a3fed9a2e8" # Amazon Linux 2 AMI
    instance_type          = "t3.large"
    sub_index              = "dmz-pri-01a"   # subnet 변수 값을 넣어주세요
    sg_index               = ["stadium-ec2"] # 보안그룹 변수 값을 넣어주세요
    key_name               = "k8s-key"      # 본인 key로 바꾸세요.
    volume_size            = 50
    volume_type            = "gp3"
    eip_required           = false
    user_data              = "userdata/example_userdata.sh" # user data 경로 기입
    instance_profile_index = "ssm"
    eni_required           = true             # private ip 따로 지정해서 사용 시에 true
    private_ips            = "192.168.205.69" # 사용할 private ip 기입

    network_boundary = "private"
    purpose          = "stadium0005"
    service          = "dmz"
    region_az        = "apne1a"
    type             = "ec2"
  },
  {
    index                  = "ec2-stadium0006"
    ami                    = "ami-089cd96a3fed9a2e8" # Amazon Linux 2 AMI
    instance_type          = "t3.large"
    sub_index              = "dmz-pri-01a"   # subnet 변수 값을 넣어주세요
    sg_index               = ["stadium-ec2"] # 보안그룹 변수 값을 넣어주세요
    key_name               = "k8s-key"      # 본인 key로 바꾸세요.
    volume_size            = 50
    volume_type            = "gp3"
    eip_required           = false
    user_data              = "userdata/example_userdata.sh" # user data 경로 기입
    instance_profile_index = "ssm"
    eni_required           = true             # private ip 따로 지정해서 사용 시에 true
    private_ips            = "192.168.205.70" # 사용할 private ip 기입

    network_boundary = "private"
    purpose          = "stadium0006"
    service          = "dmz"
    region_az        = "apne1a"
    type             = "ec2"
  },
  {
    index                  = "ec2-myapi0005"
    ami                    = "ami-089cd96a3fed9a2e8" # Amazon Linux 2 AMI
    instance_type          = "t3.large"
    sub_index              = "dmz-pri-01a" # subnet 변수 값을 넣어주세요
    sg_index               = ["myapi-ec2"] # 보안그룹 변수 값을 넣어주세요
    key_name               = "k8s-key"    # 본인 key로 바꾸세요.
    volume_size            = 150
    volume_type            = "gp3"
    eip_required           = false
    user_data              = "userdata/example_userdata.sh" # user data 경로 기입
    instance_profile_index = "ssm"
    eni_required           = true             # private ip 따로 지정해서 사용 시에 true
    private_ips            = "192.168.205.90" # 사용할 private ip 기입

    network_boundary = "private"
    purpose          = "myapi0005"
    service          = "dmz"
    region_az        = "apne1a"
    type             = "ec2"
  },
  {
    index                  = "ec2-mail0003"
    #ami                    = "ami-012c0640876552756" # 기존 (24년)            Microsoft Windows Server 2016 Base
    ami                    = "ami-08e3e1b2c5e29ba3a"  # 최신 (25년10월30일 기준) Microsoft Windows Server 2016 Base
    instance_type          = "t3.large"
    sub_index              = "dmz-pri-01a" # subnet 변수 값을 넣어주세요
    sg_index               = ["mail-ec2"]  # 보안그룹 변수 값을 넣어주세요
    key_name               = "k8s-key"    # 본인 key로 바꾸세요.
    volume_size            = 50
    volume_type            = "gp3"
    eip_required           = false
    user_data              = "userdata/example_userdata.sh" # user data 경로 기입
    instance_profile_index = "ssm"
    eni_required           = true             # private ip 따로 지정해서 사용 시에 true
    private_ips            = "192.168.205.76" # 사용할 private ip 기입

    network_boundary = "private"
    purpose          = "mail0003"
    service          = "dmz"
    region_az        = "apne1a"
    type             = "ec2"
  },
  {
    index                  = "ec2-batch00001"
    ami                    = "ami-089cd96a3fed9a2e8" # Amazon Linux 2 AMI
    instance_type          = "t3.large"
    sub_index              = "service-pri-service-01a" # subnet 변수 값을 넣어주세요
    sg_index               = ["service-ec2"]           # 보안그룹 변수 값을 넣어주세요
    key_name               = "k8s-key"                # 본인 key로 바꾸세요.
    volume_size            = 30
    volume_type            = "gp3"
    eip_required           = false
    user_data              = "userdata/example_userdata.sh" # user data 경로 기입
    instance_profile_index = "ssm"
    eni_required           = true             # private ip 따로 지정해서 사용 시에 true
    private_ips            = "192.168.204.38" # 사용할 private ip 기입

    network_boundary = "private"
    purpose          = "batch00001"
    service          = "service"
    region_az        = "apne1a"
    type             = "ec2"
  },
  {
    index                  = "ec2-banking0001"
    ami                    = "ami-089cd96a3fed9a2e8" # Amazon Linux 2 AMI
    instance_type          = "t3.large"
    sub_index              = "service-pri-service-01a" # subnet 변수 값을 넣어주세요
    sg_index               = ["service-ec2"]           # 보안그룹 변수 값을 넣어주세요
    key_name               = "k8s-key"                # 본인 key로 바꾸세요.
    volume_size            = 100
    volume_type            = "gp3"
    eip_required           = false
    user_data              = "userdata/example_userdata.sh" # user data 경로 기입
    instance_profile_index = "ssm"
    eni_required           = true             # private ip 따로 지정해서 사용 시에 true
    private_ips            = "192.168.204.59" # 사용할 private ip 기입

    network_boundary = "private"
    purpose          = "banking0001"
    service          = "service"
    region_az        = "apne1a"
    type             = "ec2"
  },
  {
    index                  = "ec2-banking0002"
    ami                    = "ami-089cd96a3fed9a2e8" # Amazon Linux 2 AMI
    instance_type          = "t3.large"
    sub_index              = "service-pri-service-01a" # subnet 변수 값을 넣어주세요
    sg_index               = ["service-ec2"]           # 보안그룹 변수 값을 넣어주세요
    key_name               = "k8s-key"                # 본인 key로 바꾸세요.
    volume_size            = 100
    volume_type            = "gp3"
    eip_required           = false
    user_data              = "userdata/example_userdata.sh" # user data 경로 기입
    instance_profile_index = "ssm"
    eni_required           = true             # private ip 따로 지정해서 사용 시에 true
    private_ips            = "192.168.204.58" # 사용할 private ip 기입

    network_boundary = "private"
    purpose          = "banking0002"
    service          = "service"
    region_az        = "apne1a"
    type             = "ec2"
  },
  {
    index                  = "ec2-runner0001"
    ami                    = "ami-089cd96a3fed9a2e8" # Amazon Linux 2 AMI
    instance_type          = "t3.xlarge"
    sub_index              = "service-pri-service-01a" # subnet 변수 값을 넣어주세요
    sg_index               = ["service-ec2"]           # 보안그룹 변수 값을 넣어주세요
    key_name               = "k8s-key"                # 본인 key로 바꾸세요.
    volume_size            = 60
    volume_type            = "gp3"
    eip_required           = false
    user_data              = "userdata/example_userdata.sh" # user data 경로 기입
    instance_profile_index = "ssm"
    eni_required           = true             # private ip 따로 지정해서 사용 시에 true
    private_ips            = "192.168.204.48" # 사용할 private ip 기입

    network_boundary = "private"
    purpose          = "runner0001"
    service          = "service"
    region_az        = "apne1a"
    type             = "ec2"
  },
  {
    index                  = "ec2-runner0002"
    ami                    = "ami-089cd96a3fed9a2e8" # Amazon Linux 2 AMI
    instance_type          = "t3.xlarge"
    sub_index              = "service-pri-service-01a" # subnet 변수 값을 넣어주세요
    sg_index               = ["service-ec2"]           # 보안그룹 변수 값을 넣어주세요
    key_name               = "k8s-key"                # 본인 key로 바꾸세요.
    volume_size            = 200
    volume_type            = "gp3"
    eip_required           = false
    user_data              = "userdata/example_userdata.sh" # user data 경로 기입
    instance_profile_index = "ssm"
    eni_required           = true             # private ip 따로 지정해서 사용 시에 true
    private_ips            = "192.168.204.49" # 사용할 private ip 기입

    network_boundary = "private"
    purpose          = "runner0002"
    service          = "service"
    region_az        = "apne1a"
    type             = "ec2"
  },
  {
    index                  = "ec2-preface0001"
    ami                    = "ami-089cd96a3fed9a2e8" # Amazon Linux 2 AMI
    instance_type          = "t3.2xlarge"
    sub_index              = "service-pri-service-01a" # subnet 변수 값을 넣어주세요
    sg_index               = ["service-ec2"]           # 보안그룹 변수 값을 넣어주세요
    key_name               = "k8s-key"                # 본인 key로 바꾸세요.
    volume_size            = 80
    volume_type            = "gp3"
    eip_required           = false
    user_data              = "userdata/example_userdata.sh" # user data 경로 기입
    instance_profile_index = "ssm"
    eni_required           = true             # private ip 따로 지정해서 사용 시에 true
    private_ips            = "192.168.204.32" # 사용할 private ip 기입

    network_boundary = "private"
    purpose          = "preface0001"
    service          = "service"
    region_az        = "apne1a"
    type             = "ec2"
  },
  {
    index                  = "ec2-preface0002"
    ami                    = "ami-089cd96a3fed9a2e8" # Amazon Linux 2 AMI
    instance_type          = "t3.small"
    sub_index              = "service-pri-service-01a" # subnet 변수 값을 넣어주세요
    sg_index               = ["service-ec2"]           # 보안그룹 변수 값을 넣어주세요
    key_name               = "k8s-key"                # 본인 key로 바꾸세요.
    volume_size            = 20
    volume_type            = "gp3"
    eip_required           = false
    user_data              = "userdata/example_userdata.sh" # user data 경로 기입
    instance_profile_index = "ssm"
    eni_required           = true             # private ip 따로 지정해서 사용 시에 true
    #private_ips            = "192.168.204.59" # 사용할 private ip 기입
    private_ips            = "192.168.204.60" # 사용할 private ip 기입    

    network_boundary = "private"
    purpose          = "preface0002"
    service          = "service"
    region_az        = "apne1a"
    type             = "ec2"
  },
  {
    index                  = "ec2-zeropay0001"
    ami                    = "ami-089cd96a3fed9a2e8" # Amazon Linux 2 AMI
    instance_type          = "t3.large"
    sub_index              = "service-pri-service-01a" # subnet 변수 값을 넣어주세요
    sg_index               = ["service-ec2"]           # 보안그룹 변수 값을 넣어주세요
    key_name               = "k8s-key"                # 본인 key로 바꾸세요.
    volume_size            = 60
    volume_type            = "gp3"
    eip_required           = false
    user_data              = "userdata/example_userdata.sh" # user data 경로 기입
    instance_profile_index = "ssm"
    eni_required           = true             # private ip 따로 지정해서 사용 시에 true
    private_ips            = "192.168.204.51" # 사용할 private ip 기입

    network_boundary = "private"
    purpose          = "zeropay0001"
    service          = "service"
    region_az        = "apne1a"
    type             = "ec2"
  },
  {
    index                  = "ec2-dugout0002"
    ami                    = "ami-089cd96a3fed9a2e8" # Amazon Linux 2 AMI
    instance_type          = "t3.2xlarge"
    sub_index              = "service-pri-service-02c" # subnet 변수 값을 넣어주세요
    sg_index               = ["service-ec2"]           # 보안그룹 변수 값을 넣어주세요
    key_name               = "k8s-key"                # 본인 key로 바꾸세요.
    volume_size            = 3700
    volume_type            = "gp3"
    eip_required           = false
    user_data              = "userdata/example_userdata.sh" # user data 경로 기입
    instance_profile_index = "ssm"
    eni_required           = true             # private ip 따로 지정해서 사용 시에 true
    private_ips            = "192.168.204.85" # 사용할 private ip 기입

    network_boundary = "private"
    purpose          = "dugout0002"
    service          = "service"
    region_az        = "apne2c"
    type             = "ec2"
  },
  {
    index                  = "ec2-mound0002"
    ami                    = "ami-089cd96a3fed9a2e8" # Amazon Linux 2 AMI
    instance_type          = "t3.2xlarge"
    sub_index              = "service-pri-service-02c" # subnet 변수 값을 넣어주세요
    sg_index               = ["service-ec2"]           # 보안그룹 변수 값을 넣어주세요
    key_name               = "k8s-key"                # 본인 key로 바꾸세요.
    volume_size            = 60
    volume_type            = "gp3"
    eip_required           = false
    user_data              = "userdata/example_userdata.sh" # user data 경로 기입
    instance_profile_index = "ssm"
    eni_required           = true             # private ip 따로 지정해서 사용 시에 true
    private_ips            = "192.168.204.86" # 사용할 private ip 기입

    network_boundary = "private"
    purpose          = "mound0002"
    service          = "service"
    region_az        = "apne2c"
    type             = "ec2"
  },
  {
    index                  = "ec2-moneyapi0001"
    ami                    = "ami-089cd96a3fed9a2e8" # Amazon Linux 2 AMI
    instance_type          = "t3.large"
    sub_index              = "service-pri-service-02c" # subnet 변수 값을 넣어주세요
    sg_index               = ["service-ec2"]           # 보안그룹 변수 값을 넣어주세요
    key_name               = "k8s-key"                # 본인 key로 바꾸세요.
    volume_size            = 120
    volume_type            = "gp3"
    eip_required           = false
    user_data              = "userdata/example_userdata.sh" # user data 경로 기입
    instance_profile_index = "ssm"
    eni_required           = true             # private ip 따로 지정해서 사용 시에 true
    private_ips            = "192.168.204.96" # 사용할 private ip 기입

    network_boundary = "private"
    purpose          = "moneyapi0001"
    service          = "service"
    region_az        = "apne2c"
    type             = "ec2"
  },
  {
    index                  = "ec2-cardapi0001"
    ami                    = "ami-089cd96a3fed9a2e8" # Amazon Linux 2 AMI
    instance_type          = "t3.large"
    sub_index              = "service-pri-service-02c" # subnet 변수 값을 넣어주세요
    sg_index               = ["service-ec2"]           # 보안그룹 변수 값을 넣어주세요
    key_name               = "k8s-key"                # 본인 key로 바꾸세요.
    volume_size            = 80
    volume_type            = "gp3"
    eip_required           = false
    user_data              = "userdata/example_userdata.sh" # user data 경로 기입
    instance_profile_index = "ssm"
    eni_required           = true             # private ip 따로 지정해서 사용 시에 true
    private_ips            = "192.168.204.98" # 사용할 private ip 기입

    network_boundary = "private"
    purpose          = "cardapi0001"
    service          = "service"
    region_az        = "apne2c"
    type             = "ec2"
  },
  {
    index                  = "ec2-myapi0003"
    ami                    = "ami-089cd96a3fed9a2e8" # Amazon Linux 2 AMI
    instance_type          = "t3.large"
    sub_index              = "service-pri-service-02c" # subnet 변수 값을 넣어주세요
    sg_index               = ["service-ec2"]           # 보안그룹 변수 값을 넣어주세요
    key_name               = "k8s-key"                # 본인 key로 바꾸세요.
    volume_size            = 150
    volume_type            = "gp3"
    eip_required           = false
    user_data              = "userdata/example_userdata.sh" # user data 경로 기입
    instance_profile_index = "ssm"
    eni_required           = true              # private ip 따로 지정해서 사용 시에 true
    private_ips            = "192.168.204.106" # 사용할 private ip 기입

    network_boundary = "private"
    purpose          = "myapi0003"
    service          = "service"
    region_az        = "apne2c"
    type             = "ec2"
  },
  {
    index                  = "ec2-ledger0003"
    ami                    = "ami-089cd96a3fed9a2e8" # Amazon Linux 2 AMI
    instance_type          = "t3.2xlarge"
    sub_index              = "service-pri-ledger-01a" # subnet 변수 값을 넣어주세요
    sg_index               = ["service-ec2"]          # 보안그룹 변수 값을 넣어주세요
    key_name               = "k8s-key"               # 본인 key로 바꾸세요.
    volume_size            = 50
    volume_type            = "gp3"
    eip_required           = false
    user_data              = "userdata/example_userdata.sh" # user data 경로 기입
    instance_profile_index = "ssm"
    eni_required           = true              # private ip 따로 지정해서 사용 시에 true
    private_ips            = "192.168.204.135" # 사용할 private ip 기입

    network_boundary = "private"
    purpose          = "ledger0003"
    service          = "service-ledger"
    region_az        = "apne1a"
    type             = "ec2"
  },
  {
    index                  = "ec2-ledger0004"
    ami                    = "ami-089cd96a3fed9a2e8" # Amazon Linux 2 AMI
    instance_type          = "t3.2xlarge"
    sub_index              = "service-pri-ledger-01a" # subnet 변수 값을 넣어주세요
    sg_index               = ["service-ec2"]          # 보안그룹 변수 값을 넣어주세요
    key_name               = "k8s-key"               # 본인 key로 바꾸세요.
    volume_size            = 60
    volume_type            = "gp3"
    eip_required           = false
    user_data              = "userdata/example_userdata.sh" # user data 경로 기입
    instance_profile_index = "ssm"
    eni_required           = true              # private ip 따로 지정해서 사용 시에 true
    private_ips            = "192.168.204.136" # 사용할 private ip 기입

    network_boundary = "private"
    purpose          = "ledger0004"
    service          = "service-ledger"
    region_az        = "apne1a"
    type             = "ec2"
  },
  {
    index                  = "ec2-deploy0001"
    ami                    = "ami-089cd96a3fed9a2e8" # Amazon Linux 2 AMI
    instance_type          = "t3.large"
    sub_index              = "service-pri-ledger-01a" # subnet 변수 값을 넣어주세요
    sg_index               = ["service-ec2"]          # 보안그룹 변수 값을 넣어주세요
    key_name               = "k8s-key"               # 본인 key로 바꾸세요.
    volume_size            = 200
    volume_type            = "gp3"
    eip_required           = false
    user_data              = "userdata/example_userdata.sh" # user data 경로 기입
    instance_profile_index = "ssm"
    eni_required           = true              # private ip 따로 지정해서 사용 시에 true
    private_ips            = "192.168.204.138" # 사용할 private ip 기입

    network_boundary = "private"
    purpose          = "deploy0001"
    service          = "service-ledger"
    region_az        = "apne1a"
    type             = "ec2"
  },
]

iam_create = [
  {
    index   = "ssm"
    purpose = "dmz"
  }
]

iam_policy_create = [

]

iam_policy_attach = [
  {
    index      = "dmz-attach"
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
    iam_index  = "ssm"
  }
]
