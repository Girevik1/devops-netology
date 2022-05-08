#!/usr/bin/env python3

import os
import sys

path = sys.argv[1]
bash_command = [f'cd {path}', "git status"]
result_os = os.popen(' && '.join(bash_command)).read()
for result in result_os.split('\n'):
    if result.find('modified') != -1:
        prepare_result = result.replace('\tmodified:   ', '')
        print(path + '/' + prepare_result)
