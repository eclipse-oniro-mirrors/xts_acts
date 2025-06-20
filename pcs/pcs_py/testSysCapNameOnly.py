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

# @tc.number: G-SOFTWARE-0701
# @tc.name: testSysCapNameOnly
# @tc.desc: 【G-SOFTWARE-0701】每一个SystemCapability名称在OpenHarmony系统中唯一；
# 设备开发者自定义的SystemCapability不应与
# OpenHarmony系统定义的SystemCapability重名。
class testSysCapNameOnly(TestCase):

    def __init__(self, controllers):
        self.TAG = self.__class__.__name__
        super().__init__(self.TAG, controllers)

    def setup(self):
        Step("Setup")

    def process(self):
        Step("Process")
        sysCapsStr = self.device1.execute_shell_command("cat /system/etc/param/syscap.para")
        sysCapsList = sysCapUtils.getAllSysCaps(sysCapsStr)
        # SystemCapability名称在OpenHarmony系统中唯一。
        print(sysCapsList)
        assert len(sysCapsList) == len(set(sysCapsList))
    def teardown(self):
        Step("Teardown")