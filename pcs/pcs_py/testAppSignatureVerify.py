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
# @tc.name: testAppSignatureVerify
# @tc.desc: 【C-ALL-SOFTWARE-1700】必须对应用进行签名，用于应用完整性和来源验证。
#           【C-ALL-SOFTWARE-1701】在安装应用时，必须对应用的签名进行校验，确保应用来源可信和未被篡改；禁止安装签名校验失败的应用。
class testAppSignatureVerify(TestCase):

    def __init__(self, controllers):
        self.TAG = self.__class__.__name__
        super().__init__(self.TAG, controllers)

    def setup(self):
        Step("Setup")

    def process(self):
        Step("Process")
        installHapResult = self.device1.execute_shell_command("bm install -p /data/local/tmp/unsigned.hap")
        assert 'error: no signature file' in installHapResult.strip()
        bundleNames = self.device1.execute_shell_command("bm dump -a").strip()
        assert 'com.pcs.software.signedhap' not in bundleNames
        installHapResult = self.device1.execute_shell_command("bm install -p /data/local/tmp/signed.hap")
        assert 'install bundle successfully' in installHapResult.strip()
        bundleNames = self.device1.execute_shell_command("bm dump -a").strip()
        assert 'com.pcs.software.signedhap' in bundleNames

    def teardown(self):
        Step("Teardown")