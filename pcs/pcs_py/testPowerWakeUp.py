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
from sysCapUtils import sysCapUtils
import time

# @tc.number: C-STD-SOFTWARE-0401
# @tc.name: testPowerWakeUp
# @tc.desc: 【C-STD-SOFTWARE-0401】必须在用例明确执行设备进入不活跃状态的操作之后进入休眠状态。

class testPowerWakeUp(TestCase):

    def __init__(self, controllers):
        self.TAG = self.__class__.__name__
        super().__init__(self.TAG, controllers)

    def setup(self):
        Step("Setup")

    def process(self):
        Step("Process")
        state = ""
        suspendStr = self.device1.execute_shell_command("power-shell suspend")
        time.sleep(1)
        self.log.info('testPowerWakeUp power-shell suspend suspendStr is:' + suspendStr)
        assert 'SuspendDevice is called' in suspendStr
    def teardown(self):
        Step("Teardown")