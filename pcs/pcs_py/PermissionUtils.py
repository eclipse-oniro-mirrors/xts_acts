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

import json
import time

class PermissionUtils:
    systemPermissionList = []
    userPermissionList = []

    def __init__(self):
        self.systemPermissionList.clear()
        self.userPermissionList.clear()
        self.getAllPermissions()

    def isInPermissionList(self, permission):
        return permission in self.permissionList

    def getAllPermissions(self):
        with open('./testcases/module.json', 'r') as f:
            permissionData = json.load(f)['module']['definePermissions']
        for permissionInfo in permissionData:
            if 'grantMode' in permissionInfo and permissionInfo['grantMode'] == 'system_grant':
                self.systemPermissionList.append(permissionInfo['name'])
            elif 'grantMode' in permissionInfo and permissionInfo['grantMode'] == 'user_grant':
                self.userPermissionList.append(permissionInfo['name'])

    def getDevicePermissionList(self, permissionBundleInfo):
        permissionBundleInfo = permissionBundleInfo[permissionBundleInfo.index('\n') + 1 :]
        time.sleep(1)
        permissionBundleInfoObj = json.loads(permissionBundleInfo)
        devicePermissions = []
        if 'defPermissions' in permissionBundleInfoObj:
            devicePermissions = permissionBundleInfoObj['defPermissions']
        return devicePermissions