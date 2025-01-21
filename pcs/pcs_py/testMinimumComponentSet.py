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
import json

# @tc.number: M-SOFTWARE-0102
# @tc.name: testMinimumComponentSet
# @tc.desc: 【M-SOFTWARE-0102】禁止删减 productdefine/common/base/mini_system.json 定义的最小系统部件集配置。
class testMinimumComponentSet(TestCase):

    def __init__(self, controllers):
        self.TAG = self.__class__.__name__
        super().__init__(self.TAG, controllers)

    def setup(self):
        Step("Setup")

    def process(self):
        Step("Process")
        deviceSysCapsStr = self.device1.execute_shell_command("cat /system/etc/param/syscap.para")
        deviceSysCapsList = sysCapUtils.getAllSysCaps(deviceSysCapsStr)
        with open('./resource/pcs/standard_system.json', 'r') as f:
            minimumComponentDatas = json.load(f)['components']
        minimumComponentSysCaps = []
        for minimumComponentData in minimumComponentDatas:
            componentSysCaps = minimumComponentData['syscap']
            for componentSysCap in componentSysCaps:
                minimumComponentSysCaps.append(componentSysCap)

        missingList = []
        for minimumComponentSysCap in minimumComponentSysCaps:
            if minimumComponentSysCap not in deviceSysCapsList:
                missingList.append(minimumComponentSysCap)
        if len(missingList) != 0:
            self.log.info('missingList: [' + ', '.join(missingList) + ']')
            assert False

    def teardown(self):
        Step("Teardown")