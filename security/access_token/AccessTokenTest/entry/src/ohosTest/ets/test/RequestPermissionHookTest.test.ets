/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permission and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { abilityAccessCtrl, PermissionRequestResult, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import Utils from './Utils';
import { util } from '@kit.ArkTS';

let permissionName: Permissions = "ohos.permission.DISTRIBUTED_DATASYNC";

export default function RequestPermissionHookTest() {
  describe('RequestPermissionHookTest', () => {
    console.info('##########start RequestPermissionHookTest');
    /**
     * @tc.name   Test_requestPermissionsFromUser_hook_001
     * @tc.number Test_requestPermissionsFromUser_hook_001
     * @tc.desc   Test hook requestPermissionsFromUser.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_requestPermissionsFromUser_hook_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_requestPermissionsFromUser_hook_001 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let hookPermission: Permissions = '' as Permissions;
      let testContext: Context = getContext(globalThis) as common.UIAbilityContext;
      let testPermissionList: Array<Permissions> = [permissionName];
      try {
        util.Aspect.addBefore(atManager.constructor, 'requestPermissionsFromUser', false,
          (instance: abilityAccessCtrl.AtManager, context: Context, permissionList: Array<Permissions>) => {
            console.info("Test_requestPermissionsFromUser_hook_001 hook " + permissionList[0]);
            hookPermission = permissionList[0];
          })
        atManager.requestPermissionsFromUser(testContext, testPermissionList, (err: BusinessError, data: PermissionRequestResult) => {
        });
        await Utils.sleep(1000);
        expect(hookPermission).assertEqual(permissionName);
        done();
      } catch (err) {
        console.error(`Test_requestPermissionsFromUser_hook_001 catch parameter type error, code->${err.code} message->${err.message}`);
        expect(true).assertFail();
        done();
      }
    })
    /**
     * @tc.name   Test_requestPermissionOnSetting_hook_001
     * @tc.number Test_requestPermissionOnSetting_hook_001
     * @tc.desc   Test hook requestPermissionOnSetting.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_requestPermissionOnSetting_hook_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_requestPermissionOnSetting_hook_001 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let hookPermission: Permissions = '' as Permissions;
      let testContext: Context = getContext(globalThis) as common.UIAbilityContext;
      let testPermissionList: Array<Permissions> = [permissionName];
      try {
        util.Aspect.addBefore(atManager.constructor, 'requestPermissionOnSetting', false,
          (instance: abilityAccessCtrl.AtManager, context: Context, permissionList: Array<Permissions>) => {
            console.info("Test_requestPermissionOnSetting_hook_001 hook " + permissionList[0]);
            hookPermission = permissionList[0];
          })
        atManager.requestPermissionOnSetting(testContext, testPermissionList).then((data: Array<abilityAccessCtrl.GrantStatus>):void => {
        });
        await Utils.sleep(1000);
        expect(hookPermission).assertEqual(permissionName);
        done();
      } catch (err) {
        console.error(`Test_requestPermissionOnSetting_hook_001 catch parameter type error, code->${err.code} message->${err.message}`);
        expect(true).assertFail();
        done();
      }
    })

    console.info('##########end RequestPermissionFromUserTest');
  })
}
