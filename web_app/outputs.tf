output "dns_name" {
  value = aws_elb.this.dns_name
}

#output "instance_public_ip" {
#  value = aws_instance.web_app.public_ip
#}
#
#output "app_bucket" {
#  value = aws_s3_bucket.web_app.bucket
#}
#
#resource "aws_route53_record" "www" {
#  name = "www.example.com"
#  zone_id = aws_route53_zone.main.zone_id
#  type = "A"
#  ttl = "300"
#  records = [web_app.public_ip]
#}
