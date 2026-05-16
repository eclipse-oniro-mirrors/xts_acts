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

# @tc.number: G-HARDWARE-0100
# @tc.name: testSDCardMount
# @tc.desc: 【G-HARDWARE-0100】外部可拆卸存储必须通过 mount 方式安装到系统特定目录，
#            例如 SDCard 必须被 mount 成/mnt/external/***/。
class testSDCardMount(TestCase):

    def __init__(self, controllers):
        self.TAG = self.__class__.__name__
        super().__init__(self.TAG, controllers)

    def setup(self):
        Step("Setup")
            
    def process(self):
        Step("Process")
        mountResult = self.device1.execute_shell_command("df -h")
        mountList = mountResult.splitlines()
        sdCardList = []
        for mountItem in mountList:
            if '/mnt/data/external' in mountItem:
                sdCardList.append(mountItem.split()[0])
                rmountResult = self.device1.execute_shell_command("umount " + mountItem.split()[-1])
        if len(sdCardList) != 0:
            mountResult = self.device1.execute_shell_command("df -h")
            for sdCardItem in sdCardList:
                assert sdCardItem not in mountResult
            rebootResult = self.device1.execute_shell_command("reboot")
            mountResult = self.device1.execute_shell_command("df -h")
            self.log.info(mountResult)
            assert mountResult.count('/mnt/data/external') == len(sdCardList)

    def teardown(self):
        Step("Teardown")