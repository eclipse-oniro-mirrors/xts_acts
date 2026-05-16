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

# @tc.number: STD-SECURITY-0104
# @tc.name: testPermissionName
# @tc.desc: 【STD-SECURITY-0104】新增自定义权限名不得以 ohos 开头。
class testPermissionName(TestCase):

    def __init__(self, controllers):
        self.TAG = self.__class__.__name__
        super().__init__(self.TAG, controllers)

    def setup(self):
        Step("Setup")

    def process(self):
        Step("Process")
        permissionBundleInfo = self.device1.execute_shell_command("bm dump -n ohos.global.systemres")
        permissionUtils = PermissionUtils()
        devicePermissionList = permissionUtils.getDevicePermissionList(permissionBundleInfo)
        errorList = []
        for permission in devicePermissionList:
            if permission.startswith('ohos') and permission not in permissionUtils.systemPermissionList and permission not in permissionUtils.userPermissionList:
                errorList.append(permission)
        if len(errorList) != 0:
            self.log.info('These permissions can not start with \'ohos\'. errorList: [' + ', '.join(errorList) + ']')
            assert False

    def teardown(self):
        Step("Teardown")