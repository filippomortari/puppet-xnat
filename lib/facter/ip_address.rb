# Licensed to BIGR, Erasmus MC under one or more contributor 
# license agreements. BIGR, Erasmus MC licenses this file
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

Facter.add("ip_address") do
  setcode do
    os_issue = `cat /etc/issue`
    if os_issue.include? "Fedora" or
       os_issue.include? "Scientific" or
       os_issue.include? "CentOS" then
      Facter::Util::Resolution.exec("ifconfig | grep -B 1 'inet addr:' | awk '/eth/{getline; print}' | cut -d: -f2 | awk '{print $1}'")
    else
      if os_issue.include? "Red Hat" then
        Facter::Util::Resolution.exec("ip addr | grep 'inet' | grep -v '127.0.0.1' | grep -v 'inet6' | cut -d: -f2 | awk '{print $2}' | awk -F'/' '{print $1}'")
      else
        Facter::Util::Resolution.exec("ifconfig | grep 'inet' | grep -v '127.0.0.1' | grep -v 'inet6' | cut -d: -f2 | awk '{print $1}'")
      end
    end
  end
end
