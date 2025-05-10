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

# @tc.number: STD-TOOLS-0100
# @tc.name: testSupportHdc
# @tc.desc: 【STD-TOOLS-0100】必须支持使用 hdc 设备连接器提供的命令行和通信协议与设备进行交互。
class testSupportHdc(TestCase):
    def __init__(self, controllers):
        self.TAG = self.__class__.__name__
        super().__init__(self.TAG, controllers)

    def setup(self):
        Step("Setup")

    def process(self):
        Step("Process")
        deviceSn = self.device1.device_sn
        assert deviceSn != None and deviceSn != '' 

    def teardown(self):
        Step("Teardown")