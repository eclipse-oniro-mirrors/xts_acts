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
import time

# @tc.number: STD-SECURITY-0107
# @tc.name: testSystemCoreInternetPermission
# @tc.desc: 【STD-SECURITY-0107】禁止 APL 级别为 system core 的系统服务拥有联网权限。
class testSystemCoreInternetPermission(TestCase):

    def __init__(self, controllers):
        self.TAG = self.__class__.__name__
        super().__init__(self.TAG, controllers)

    def setup(self):
        Step("Setup")

    def process(self):
        Step("Process")
        networkPermission = 'ohos.permission.INTERNET'
        errorList = []
        systemcore = []
        initFileList = self.device1.execute_shell_command("ls /system/etc/init").strip().split()
        for initFile in initFileList:
            if initFile.endswith('.cfg'):
                cfgInfo = self.device1.execute_shell_command("cat /system/etc/init/" + initFile).strip()
                time.sleep(0.5)
                cfgInfoObj = json.loads(cfgInfo)
                if 'services' not in cfgInfoObj:
                    continue
                for service in cfgInfoObj['services']:
                    if 'apl' in service and service['apl'] == 'system_core':
                        self.log.info(initFile)
                        systemcore.append(initFile)
                        if 'permission' in service:
                            saPermissionList = service['permission']
                            if networkPermission in saPermissionList:
                                errorList.append(initFile + ' has internet permission')
        if len(errorList) != 0:
            self.log.info('These system core service can not have internet permission. errorList: [' + ', '.join(errorList) + ']')
            assert False

    def teardown(self):
        Step("Teardown")