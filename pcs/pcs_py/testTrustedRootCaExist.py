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
from PermissionUtils import PermissionUtils

# @tc.number: C-ALL-SOFTWARE-1702
# @tc.name: testTrustedRootCaExist
# @tc.desc: 【C-ALL-SOFTWARE-1702】禁止从未知来源安装应用，必须预置对应用来源合法性校验的根证书。
class testTrustedRootCaExist(TestCase):

    def __init__(self, controllers):
        self.TAG = self.__class__.__name__
        super().__init__(self.TAG, controllers)

    def setup(self):
        Step("Setup")

    def process(self):
        Step("Process")
        rootCa = self.device1.execute_shell_command("ls /system/etc/security/trusted_root_ca.json | wc -l").strip()
        assert rootCa == '1'

    def teardown(self):
        Step("Teardown")