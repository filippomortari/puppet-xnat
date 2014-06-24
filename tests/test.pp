# Licensed to Biomedical Imaging Group Rotterdam under one or more contributor 
# license agreements. Biomedical Imaging Group Rotterdam licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

xnat::xnatapp { 'xnat-web-app-1':
  db_name => "xnat",
  db_username => "xnat",
  db_userpassword => "test123",
  system_user => "xnat",   # Cannot be changed (for now)
  instance_name => "ROOT", # Cannot be changed (for now) 
  archive_root => "/xnatdata",
  tomcat_web_user => "evast",
  tomcat_web_password => "test123",
  apache_mail_address => "xnat@localhost",
  xnat_version => "1.6.3",
  java_opts => "-Xms1024m -Xmx6144m -XX:MaxPermSize=256m",
  mail_server => "localhost",
  mail_port => 25,
  mail_username => "mailuser",
  mail_password => "mailpass",
  mail_admin => "admin@localhost",
  mail_subject => "XNAT"
}
