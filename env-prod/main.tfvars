components = {
  frontend = {
    name          = "frontend"
    instance_type = "t2.micro"
  }
  mongodb = {
    name          = "mongodb"
    instance_type = "t2.micro"
  }
  catalogue = {
    name          = "catalogue"
    instance_type = "t3.micro"
  }
  redis = {
    name          = "redis"
    instance_type = "t3.micro"
  }
  user = {
    name          = "user"
    instance_type = "t3.micro"
  }
  cart = {
    name          = "cart"
    instance_type = "t3.micro"
  }
  mysql = {
    name          = "mysql"
    instance_type = "t3.small"
  }
  shipping = {
    name          = "shipping"
    instance_type = "t3.medium"
  }
  rabbitmq = {
    name          = "rabbitmq"
    instance_type = "t2.micro"
  }
  payment = {
    name          = "payment"
    instance_type = "t3.micro"
  }
}
env = "prod"



















