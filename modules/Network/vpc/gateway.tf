# IGW
resource "aws_internet_gateway" "this" {
  for_each = { for _map in var.vpc : _map.vpc_name => _map if lookup(_map, "aws_internet_gateway", false) }
  vpc_id   = aws_vpc.this[each.value.vpc_name].id

  tags = {
    Name = format(
      "%s-%s-%s-igw",
      var.company,
      var.env,
      each.value.service
    )
    Env  = var.env
    Type = "igw"
  }

}

resource "aws_nat_gateway" "this" {
  for_each      = { for _map in var.nat_create : _map.index => _map }
  allocation_id = aws_eip.this[each.value.index].id
  subnet_id     = aws_subnet.this[each.value.sub_index].id

  tags = {
    Name = format(
      "%s-%s-%s-%s",
      var.company,
      var.env,
      each.value.service,
      each.value.index
    )
    Env            = var.env
    Type           = each.value.type
    NetworkBoudary = each.value.networkboudary
  }

  depends_on = [aws_eip.this]
}

resource "aws_eip" "this" {
  for_each = { for _map in var.nat_create : _map.index => _map }
  domain   = "vpc"

  tags = {
    Name = format(
      "%s-%s-%s-%s-eip",
      var.company,
      var.env,
      each.value.service,
      each.value.type
    )
    Env            = var.env
    Type           = "eip"
    NetworkBoudary = each.value.networkboudary
  }
}


