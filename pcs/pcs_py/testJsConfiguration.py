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

# @tc.number: G-SOFTWARE-0600
# @tc.name: testJsConfiguration
# @tc.desc: 【G-SOFTWARE-0600】禁止修改 config.json 中 js 标签配置规则。
class testJsConfiguration(TestCase):

    def __init__(self, controllers):
        self.TAG = self.__class__.__name__
        super().__init__(self.TAG, controllers)

    def setup(self):
        Step("Setup")

    def process(self):
        Step("Process")
        installResult = self.device1.execute_shell_command("bm install -p /data/local/tmp/errorjs.hap")
        assert 'error: failed to install bundle' in installResult.strip()
        assert 'error: install parse profile missing prop' in installResult.strip()

    def teardown(self):
        Step("Teardown")