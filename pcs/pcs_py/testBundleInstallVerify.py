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

# @tc.number: G-SOFTWARE-0501
# @tc.name: testBundleInstallVerify
# @tc.desc: 【G-SOFTWARE-0501】不应修改包管理服务对应用安装的校验规则，包括应用版本号升级校验、包名长度校验、
#            ExtensionAbility 类型校验、同应用内多 hap 包名/版本号/签名/包类型一致性校验规则。
class testBundleInstallVerify(TestCase):

    def __init__(self, controllers):
        self.TAG = self.__class__.__name__
        super().__init__(self.TAG, controllers)

    def setup(self):
        Step("Setup")
        
    def process(self):
        Step("Process")
        errorList = []
        errorList = self.versionCodeVerify(errorList)
        errorList = self.multipleHapsVerify(errorList)
        if len(errorList) > 0:
            self.log.info('errorList: [' + ', '.join(errorList) + ']')
            assert False

    def versionCodeVerify(self, errorList):
        installResult = self.device1.execute_shell_command("bm install -p /data/local/tmp/bundle_first.hap")
        if 'install bundle successfully' not in installResult.strip():
            errorList.append('install application failed')
            return errorList
        dumpResult = self.device1.execute_shell_command("bm dump -n com.pcs.software.bundle.first|grep '\"versionCode\": 1100000'|wc -l")
        if int(dumpResult.strip()) < 1:
            errorList.append('get version code failed')
            return errorList
        installResult = self.device1.execute_shell_command("bm install -p /data/local/tmp/bundle_second.hap")
        if 'error: install version downgrade' not in installResult.strip():
            errorList.append('version code downgrade verify failed')
            return errorList
        dumpResult = self.device1.execute_shell_command("bm dump -n com.pcs.software.bundle.first|grep '\"versionCode\": 1100000'|wc -l")
        if int(dumpResult.strip()) < 1:
            errorList.append('get version code failed')
            return errorList
        installResult = self.device1.execute_shell_command("bm install -p /data/local/tmp/bundle_third.hap")
        if 'install bundle successfully' not in installResult.strip():
            errorList.append('version code upgrade verify failed')
            return errorList
        dumpResult = self.device1.execute_shell_command("bm dump -n com.pcs.software.bundle.first|grep '\"versionCode\": 1200000'|wc -l")
        if int(dumpResult.strip()) < 1:
            errorList.append('get version code failed')
            return errorList
        return errorList
    
    def multipleHapsVerify(self, errorList):
        installResult = self.device1.execute_shell_command("bm install -p /data/local/tmp/bundle_fourth.hap")
        if 'install bundle successfully' not in installResult.strip():
            errorList.append('install application failed')
            return errorList
        installResult = self.device1.execute_shell_command("bm install -p /data/local/tmp/feature_first.hap")
        if 'install bundle successfully' not in installResult.strip():
            errorList.append('install multiple haps failed')
            return errorList
        installResult = self.device1.execute_shell_command("bm install -p /data/local/tmp/feature_second.hap")
        if 'error: install version not compatible' not in installResult.strip():
            errorList.append('install multiple haps versioncode verify failed')
            return errorList
        installResult = self.device1.execute_shell_command("bm install -p /data/local/tmp/feature_third.hap")
        if 'error: verify signature failed' not in installResult.strip():
            errorList.append('install multiple haps signature verify failed')
            return errorList
        return errorList

    def teardown(self):
        Step("Teardown")