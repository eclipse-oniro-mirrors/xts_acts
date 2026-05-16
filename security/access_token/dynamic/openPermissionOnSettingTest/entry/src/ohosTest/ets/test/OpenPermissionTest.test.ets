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

import { describe, beforeAll, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import bundleManager from '@ohos.bundle.bundleManager'
import { abilityAccessCtrl, common, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { UiDriver, BY, Driver, ON } from "@ohos.UiTest";
import Utils from './Utils';

let tokenID = 0;
const ERR_PARAM_ERROR = 401;

export default function OpenPermissionTest() {
  describe('OpenPermissionTest', () => {
    console.info('##########start AccessTokenTest');
    beforeAll(async (done: Function) => {
      let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      console.info('AccessTokenTest bundleFlags is: ' + bundleFlags);
      try {
        bundleManager.getBundleInfoForSelf(bundleFlags).then((data) => {
          console.info('AccessTokenTest data is: ' + JSON.stringify(data));
          tokenID = data.appInfo.accessTokenId;
          console.info('AccessTokenTest tokenID is: ' + data.appInfo.accessTokenId);
          done();
        }).catch((err: BusinessError) => {
          console.error('AccessTokenTest getBundleInfoForSelf err is: ' + err.code);
        })
      } catch (error) {
        console.error('AccessTokenTest getBundleInfoForSelf error is: ' + error.code)
      }
    })
    afterEach(() => {
    })


    /**
     * @tc.name   Test_openPermissionOnSetting_0100
     * @tc.number Test_openPermissionOnSetting_0100
     * @tc.desc   openPermissionOnSetting Permissions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_openPermissionOnSetting_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_openPermissionOnSetting_0100 start ");
      let atManager = abilityAccessCtrl.createAtManager();
      let context: Context = getContext(globalThis) as common.UIAbilityContext;
      try {
        atManager.openPermissionOnSetting(context, 'ohos.permission.CAMERA').then((data: abilityAccessCtrl.SelectedResult) => {
          console.info('Test_openPermissionOnSetting_0100 data:' + data);
          done();
        }).catch((err: BusinessError) => {
          console.error('Test_openPermissionOnSetting_0100 err.code:' + JSON.stringify(err));
          expect(err.code).assertEqual(12100014);
          done();
        });
      } catch (error) {
        console.info('Test_openPermissionOnSetting_0100 error.code: ' + error.code);
        expect(error.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_openPermissionOnSetting_0200
     * @tc.number Test_openPermissionOnSetting_0200
     * @tc.desc   openPermissionOnSetting Permissions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_openPermissionOnSetting_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_openPermissionOnSetting_0200 start ");
      let atManager = abilityAccessCtrl.createAtManager();
      let context: Context = getContext(globalThis) as common.UIAbilityContext;
      try {
        atManager.openPermissionOnSetting(context, 'ohos.permission.CUSTOM_SCREEN_RECORDING').then((data: abilityAccessCtrl.SelectedResult) => {
          console.info('Test_openPermissionOnSetting_0200 data:' + data);
          done();
        }).catch((err: BusinessError) => {
          console.error('Test_openPermissionOnSetting_0200 err.code:' + JSON.stringify(err));
          expect(err.code).assertEqual(12100001);
          done();
        });
      } catch (error) {
        console.info('Test_openPermissionOnSetting_0200 error.code: ' + error.code);
        expect(error.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_openPermissionOnSetting_0300
     * @tc.number Test_openPermissionOnSetting_0300
     * @tc.desc   openPermissionOnSetting with result REJECTED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_openPermissionOnSetting_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_openPermissionOnSetting_0300 start ");
      let atManager = abilityAccessCtrl.createAtManager();
      let context: Context = getContext(globalThis) as common.UIAbilityContext;
      let type = abilityAccessCtrl.SwitchType.LOCATION;
      try {
        atManager.openPermissionOnSetting(context, 'ohos.permission.HOOK_KEY_EVENT').then((data: abilityAccessCtrl.SelectedResult) => {
          console.info('Test_openPermissionOnSetting_0300 data:' + data);
          expect(data).assertEqual(abilityAccessCtrl.SelectedResult.REJECTED);
          done();
        }).catch((err: BusinessError) => {
          console.error('Test_openPermissionOnSetting_0300 err.code:' + JSON.stringify(err));
          expect(err.code).assertEqual(12100001);
          done();
        });
        await Utils.msSleep(2000);
        let driver = Driver.create();
        console.info("Test_openPermissionOnSetting_0300 come in driverFn");
        let button = await driver.findComponent(ON.text("不允许"));
        await Utils.msSleep(1000);
        await button.click();
        console.info("Test_openPermissionOnSetting_0300 click over");
      } catch (error) {
        console.info('Test_openPermissionOnSetting_0300 error.code: ' + error.code);
        expect(error.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_openPermissionOnSetting_0400
     * @tc.number Test_openPermissionOnSetting_0400
     * @tc.desc   openPermissionOnSetting with result OPENED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_openPermissionOnSetting_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_openPermissionOnSetting_0400 start ");
      let atManager = abilityAccessCtrl.createAtManager();
      let context: Context = getContext(globalThis) as common.UIAbilityContext;
      let type = abilityAccessCtrl.SwitchType.LOCATION;
      try {
        atManager.openPermissionOnSetting(context, 'ohos.permission.HOOK_KEY_EVENT').then((data: abilityAccessCtrl.SelectedResult) => {
          console.info('Test_openPermissionOnSetting_0400 data:' + data);
          expect(data).assertEqual(abilityAccessCtrl.SelectedResult.OPENED);
          done();
        }).catch((err: BusinessError) => {
          console.error('Test_openPermissionOnSetting_0400 err.code:' + JSON.stringify(err));
          expect(err.code).assertEqual(12100001);
          done();
        });
        await Utils.msSleep(2000);
        let driver = Driver.create();
        console.info("Test_openPermissionOnSetting_0400 come in driverFn");
        let button = await driver.findComponent(ON.text("前往设置"));
        await Utils.msSleep(1000);
        await button.click();
        console.info("Test_openPermissionOnSetting_0400 click over");
      } catch (error) {
        console.info('Test_openPermissionOnSetting_0400 error.code: ' + error.code);
        expect(error.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_openPermissionOnSetting_0500
     * @tc.number Test_openPermissionOnSetting_0500
     * @tc.desc   openPermissionOnSetting context is null, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_openPermissionOnSetting_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_openPermissionOnSetting_0500 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let testContext: common.UIAbilityContext | null = null;
      try {
        atManager.openPermissionOnSetting(testContext, 'ohos.permission.CAMERA').then((data: abilityAccessCtrl.SelectedResult) => {
          console.info('Test_openPermissionOnSetting_0500 data:' + data);
          expect(false).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error('Test_openPermissionOnSetting_0500 err.code:' + JSON.stringify(err));
          expect(err.code).assertEqual(ERR_PARAM_ERROR);
          done();
        });
      } catch (error) {
        console.error('Test_openPermissionOnSetting_0500 error.code: ' + error.code);
        expect(error.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_openPermissionOnSetting_0600
     * @tc.number Test_openPermissionOnSetting_0600
     * @tc.desc   openPermissionOnSetting context is undefined, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_openPermissionOnSetting_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_openPermissionOnSetting_0600 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let testContext: common.UIAbilityContext | undefined = undefined;
      try {
        atManager.openPermissionOnSetting(testContext, 'ohos.permission.CAMERA').then((data: abilityAccessCtrl.SelectedResult) => {
          console.info('Test_openPermissionOnSetting_0600 data:' + data);
          expect(false).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error('Test_openPermissionOnSetting_0600 err.code:' + JSON.stringify(err));
          expect(err.code).assertEqual(ERR_PARAM_ERROR);
          done();
        });
      } catch (error) {
        console.error('Test_openPermissionOnSetting_0600 error.code: ' + error.code);
        expect(error.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_openPermissionOnSetting_0700
     * @tc.number Test_openPermissionOnSetting_0700
     * @tc.desc   openPermissionOnSetting permission is null, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_openPermissionOnSetting_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_openPermissionOnSetting_0700 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let context: Context = getContext(globalThis) as common.UIAbilityContext;
      let testPermission: Permissions | null = null;
      try {
        atManager.openPermissionOnSetting(context, testPermission).then((data: abilityAccessCtrl.SelectedResult) => {
          console.info('Test_openPermissionOnSetting_0700 data:' + data);
          expect(false).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error('Test_openPermissionOnSetting_0700 err.code:' + JSON.stringify(err));
          expect(err.code).assertEqual(ERR_PARAM_ERROR);
          done();
        });
      } catch (error) {
        console.error('Test_openPermissionOnSetting_0700 error.code: ' + error.code);
        expect(error.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_openPermissionOnSetting_0800
     * @tc.number Test_openPermissionOnSetting_0800
     * @tc.desc   openPermissionOnSetting permission is undefined, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_openPermissionOnSetting_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_openPermissionOnSetting_0800 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let context: Context = getContext(globalThis) as common.UIAbilityContext;
      let testPermission: Permissions | undefined = undefined;
      try {
        atManager.openPermissionOnSetting(context, testPermission).then((data: abilityAccessCtrl.SelectedResult) => {
          console.info('Test_openPermissionOnSetting_0800 data:' + data);
          expect(false).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error('Test_openPermissionOnSetting_0800 err.code:' + JSON.stringify(err));
          expect(err.code).assertEqual(ERR_PARAM_ERROR);
          done();
        });
      } catch (error) {
        console.error('Test_openPermissionOnSetting_0800 error.code: ' + error.code);
        expect(error.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })
  })
}  