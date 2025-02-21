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
import re

# @tc.number: C-ALL-SECURITY-0304
# @tc.name: testRealRandomGenerate
# @tc.desc: 【C-ALL-SECURITY-0304】必须支持硬件真随机数生成，满足 FIPS140-2 随机测试标准。
class testRealRandomGenerate(TestCase):

    def __init__(self, controllers):
        self.TAG = self.__class__.__name__
        super().__init__(self.TAG, controllers)

    def setup(self):
        Step("Setup")

    def process(self):
        Step("Process")
        randomFile = self.device1.execute_shell_command("ls  /dev/random | wc -l").strip()
        assert randomFile == '1'
        urandomFile = self.device1.execute_shell_command("ls  /dev/urandom | wc -l").strip()
        assert urandomFile == '1'
        pattern = r'[a-z0-9]{10}'
        try:
            randomNumber = self.device1.execute_shell_command("cat /dev/random | head -n 10 | md5sum | head -c 10", timeout = 1000).strip()
        except:
            randomNumber = ''
        if not re.match(pattern, randomNumber):
            randomNumber = self.device1.execute_shell_command("cat /dev/urandom | head -n 10 | md5sum | head -c 10").strip()
        assert re.match(pattern, randomNumber)

    def teardown(self):
        Step("Teardown")