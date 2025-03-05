resource "aws_instance" "instance" {
  ami                    = data.aws_ami.centos.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.launch-wizard-6.id]

  tags = {
    Name = local.name
  }
}

resource "null_resource" "provisioner" {
  count=var.provisioner ? 1:0
  depends_on = [aws_instance.instance, aws_route53_record.records]
  provisioner "remote-exec" {

    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = aws_instance.instance.private_ip
    }

    inline = [
      "rm -rf roboshop-shell",
      "git clone https://github.com/RajasekharDevo/roboshop-shell",
      "cd roboshop-shell",
      "sudo bash ${var.component_name}.sh ${var.password}"

    ]
  }
}


resource "aws_route53_record" "records" {
  zone_id  = "Z07633651VJKTEQ867N3J"
  name     = "${var.component_name}-dev.rajasekhar72.store"
  type     = "A"
  ttl      = 30
  records  = [aws_instance.instance.private_ip]
  # The lifecycle argument is useful if you need to ensure the new record is created first.
  lifecycle {
    create_before_destroy = true
  }

}
