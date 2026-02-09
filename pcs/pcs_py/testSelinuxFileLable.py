#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Copyright (c) 2024 Huawei Device Co., Ltd.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from devicetest.core.test_case import TestCase, Step
from PermissionUtils import PermissionUtils
import json

# @tc.number: STD-SECURITY-0200
# @tc.name: testSelinuxFileLable
# @tc.desc: 【STD-SECURITY-0200】特性应定义自己的文件标签，不应直接使用大分区（比如：system、chipset、data 分区等）默认的标签，否则必将造成权限过大。
class testSelinuxFileLable(TestCase):

    def __init__(self, controllers):
        self.TAG = self.__class__.__name__
        super().__init__(self.TAG, controllers)

    def setup(self):
        Step("Setup")

    def process(self):
        Step("Process")
        fileContextFile = self.device1.execute_shell_command("ls /system/etc/selinux/targeted/contexts/file_contexts | wc -l").strip()
        if fileContextFile != '1':
            self.log.info('selinux file configuration file not exist.')
            assert False
        defaultLabels = ['u:object_r:rootfs:s0', 'u:object_r:configfs:s0', 'u:object_r:data_file:s0', 
                         'u:object_r:dev_file:s0', 'u:object_r:vendor_file:s0', 'u:object_r:system_file:s0', 
                         'u:object_r:etc_file:s0', 'u:object_r:lib_file:s0', 'u:object_r:sys_file:s0']
        defaultDirectories = ['/', '/lost\+found', '/bin', '/chip_prod', '/init', '/chipset', '/mnt', '/proc', 
                              '/storage', '/sys_prod', '/cust', '/tmp', '/module_update', '/config', '/data(/.*)?', 
                              '/dev(/.*)?', '/vendor(/.*)?', '/eng_chipset(/.*)?', '/version', '/preload', 
                              '/cust(/.*)?', '/preload(/.*)?', '/version(/.*)?', '/system(/.*)?', '/eng_system(/.*)?' ,
                              '/etc(/.*)?', '/lib(/.*)?', '/lib64(/.*)?', '/sys']
        errorList = []
        fileContextFile = self.device1.execute_shell_command("cat /system/etc/selinux/targeted/contexts/file_contexts")
        for fileConfiguration in fileContextFile.splitlines():
            configuration = fileConfiguration.strip().split()
            if len(configuration) < 2:
                continue
            if configuration[1] in defaultLabels:
                filePath = configuration[0].rstrip('(/.*)?')
                if filePath.count('/') > 1:
                    errorList.append(configuration[0] + '  ' + configuration[1])
        if len(errorList) != 0:
            self.log.info('These file\'s lable is not allowed. errorList: [' + ', '.join(errorList) + ']')
            assert False

    def teardown(self):
        Step("Teardown")