

#!/bin/bash
sudo yum -y update

echo "Install Java JDK 8"
yum remove -y java
yum install -y java-1.8.0-openjdk

echo "Install Maven"
yum install -y maven 

echo "Install git"
yum install -y git

echo "Install Docker engine"
yum update -y
yum install docker -y
#sudo usermod -a -G docker jenkins
#sudo service docker start
sudo chkconfig docker on

echo "Install Jenkins"
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
#rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum install -y jenkins
sudo usermod -a -G docker jenkins
sudo chkconfig jenkins on
sudo service docker start
sudo service jenkins start

usermod --shell /bin/bash jenkins

cat <<EOF > /var/lib/jenkins/aws-june-2021.pem
-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAihLjKGnELnoBh/d+SYktpg/lZgIpPaQhUvV4grQbHtU23K47
WytVrq86LcSMDtD/ADaAarLFnNmuHktif4zwGzsKW42S1gQo8Ub7Ne9S6yxRraLU
oukVxuwqSMV67Ib3oLIVGFf14p+EKlQoPbRivedMEdUE3ImZ9YhbOWbLzW3Uomrk
NAaKPwrIeXpkIZ1pMxQp40ttmTbUUmyV35p8e/HnP7vsvEML/AGjc2V/iMO3IR4u
6gCcHeiJW6u1KABYobS54HmqSAk4M0OxpmiDnQ4xqqTKVQ04Ck/M4eNnVPqzy7XW
htvcoacmtU1NZnJWxuO6JUo2xz+sHrlb/CMyYQIDAQABAoIBAGeht3dssv+DOUT5
AINm/6klQzNmKdgHKa/fZ/0J+1UQCOZnq0tJYj0DbfJOFCVGvi5FuerblTCdvW8l
e59qhAicLrD6uJwDcUtu0DvyDdVPZVqi3WAM+/ha533JIvMGdjPZlbW4x2e5/HPc
yHtPudD5GoJD1StF6BV+q6GQwyTCywKjIeN10mZhVdz1EsOMGWfPCHcJiuAiilbA
WSx8vy4byAXxdNyCrdQOe1Ip5Di5aR814ZhOP34bNevVbRck+FHooCAzk+Dz8aMd
vYKezMAoJi15P2ek266LM5RscTbWIivU1gYPbZkffDx57KeH4IwO19FyLMKv6yri
6b7WSGUCgYEA6Fy+AQn/d6Iu6QT1t2LvR/hUjZ0Y81coDj7UZBSw5BaCDiM/d4Be
KKHV3xArsrpc6e0nJKNAkMgTe5ipFU1sB9OXaieNB2wu3e20CscbJM4PSdJWudL1
MbErZcZM9ZfQh8s11UabaLWm6DPAAB2XhbTShxEJzfXvNxqj859B7osCgYEAmB6m
4kloFBr37GRNN824vz8WMI7cdvMgGMXvk7hCoQP4BAc/6SmZBtpZUcXJMKkBKlPb
jn+v8rTF0f54CVQozjzFZJ52IZa5Pogo+yfpoYjcjgTI7P5qYgrvoRzo063rUBrs
PJZJ7+ILYov9vhvWyGkn5Yl51CTQyyUURmfBzEMCgYAmHiixRPGar4lggobImbtF
JDDCtnXEXZTdmWMANAC8uhCFvzSHJxDLO5k5KY7xl+7sFRJpyTorRhckHGwIaZYC
Rqy9JlXVVOLvVzJE3lrOk9sgMhg2DaxZhYXoATrYwxnbXPOs1BNkfwAtcWfa3P/h
WEN9Esd3+RNQB9fDfGm1dwKBgH6rJ3POhGgZfNDPRK1vFKPLuIJ+s34pPVTjnXd4
O6MwVtmj38gb510ZfL7m330xfdLtOSoTkUOc3AzcxL+f4Mq7N/NtMBkQFPjJELby
qUzlViK8QUN3Jsa1LI0QMZ/ydruhb42T58VkiO5qe8ROEi+XwK0WKOhKL8K5AYUO
6QVZAoGAKmjIEdlXHQIqeYQ0n0S/lRyYClkn3HmJHr7iTMr8cDvZsocNX1n476VB
ToPbmn72GIyxnunvXJgCetciUASHqIZtLWFVKFX/3Qyi5puJ21000af/FmmqCBZa
04FwHRQgqScpn0L9cub9bPFd3fU3g1R5a9WnhCcgaSQaDrLwSLI=
-----END RSA PRIVATE KEY-----

chmod 600 /root/aws-june-2021.pem
chmod 600 /var/lib/jenkins/aws-june-2021.pem
sudo chown -R jenkins:jenkins aws-june-2021.pem

mkdir /var/lib/jenkins/.ssh
ssh-keygen -q -t rsa -N '' -f /var/lib/jenkins/.ssh/id_rsa <<<y >/dev/null 2>&1
sudo chown -R jenkins:jenkins /var/lib/jenkins/.ssh
sudo chmod 600 /var/lib/jenkins/.ssh/authorized_keys


