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

# @tc.number: G-SOFTWARE-0500
# @tc.name: testInstallSignedHap
# @tc.desc: 【G-SOFTWARE-0500】必须能够安装由 OpenHarmony 打包工具和签名工具生成的 hap/hsp/hqf 包；
#            禁止修改打包工具中包管理默认配置规则。
class testInstallSignedHap(TestCase):

    def __init__(self, controllers):
        self.TAG = self.__class__.__name__
        super().__init__(self.TAG, controllers)

    def setup(self):
        Step("Setup")

    def process(self):
        Step("Process")
        errorList = []
        installHapResult = self.device1.execute_shell_command("bm install -p /data/local/tmp/signed.hap")
        if 'install bundle successfully' not in installHapResult.strip():
            errorList.append('install hap failed')
        installHspResult = self.device1.execute_shell_command("bm install -p /data/local/tmp/signed.hsp")
        if 'install bundle successfully' not in installHspResult.strip():
            errorList.append('install hsp failed')
        installHqfResult = self.device1.execute_shell_command("bm quickfix -a -f /data/local/tmp/signed.hqf")
        if 'apply quickfix succeed' not in installHqfResult.strip():
            errorList.append('install hqf failed')
        if len(errorList) > 0:
            self.log.info('errorList: [' + ', '.join(errorList) + ']')
            assert False

    def teardown(self):
        Step("Teardown")