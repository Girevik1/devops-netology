#!/usr/bin/env python3

import os

bash_command = [
    "cd /OpenServer/OSPanel/domains/devops-netology/04-script-02-py", "git status"]
result_os = os.popen(' && '.join(bash_command)).read()
#is_change = False
for result in result_os.split('\n'):
    if result.find('modified') != -1:
        prepare_result = result.replace('\tmodified:   ', '')
        print(os.path.abspath(prepare_result))
#        break
