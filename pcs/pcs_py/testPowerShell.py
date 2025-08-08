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

# @tc.number: C-STD-SOFTWARE-0400
# @tc.name: testPowerShell
# @tc.desc: 【C-STD-SOFTWARE-0400】必须提供系统休眠,唤醒和低功耗管理能力。

class testPowerShell(TestCase):

    def __init__(self, controllers):
        self.TAG = self.__class__.__name__
        super().__init__(self.TAG, controllers)

    def setup(self):
        Step("Setup")

    def process(self):
        Step("Process")
        state = ""
        suspendStr = self.device1.execute_shell_command("power-shell suspend")
        self.log.info('testPowerShell power-shell suspend suspendStr is:' + suspendStr)
        assert 'SuspendDevice is called' in suspendStr
        wakeUpStr = self.device1.execute_shell_command("power-shell wakeup")
        self.log.info('testPowerShell power-shell wakeup  wakeUpStr is:' + wakeUpStr)
        time.sleep(1)
        assert 'WakeupDevice is called' in wakeUpStr
        time.sleep(1)
        setModeStr = self.device1.execute_shell_command("power-shell setmode 603")
        self.log.info('testPowerShell setmode 603 setModeStr is:' + setModeStr)
        time.sleep(1)
        assert 'Set Mode: 603' in setModeStr
    def teardown(self):
        Step("Teardown")