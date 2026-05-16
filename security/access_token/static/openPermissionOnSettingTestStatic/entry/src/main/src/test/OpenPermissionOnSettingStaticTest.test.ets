/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { Permissions } from 'permissions';
import PermissionRequestResult from 'security.PermissionRequestResult';
import { BusinessError } from '@ohos.base'
import { Driver, ON } from '@ohos.UiTest'

let domain: int = 0x0000;
let tag: string = 'testTag';

let testAbilityContext: common.UIAbilityContext | undefined;
let tokenID: int;

const ERR_PARAM_ILLEGAL = 401;
const ERR_PARAM_INVALID = 12100001;

//Do NOT ALLOW/Prohibit/cancel ---- Both mean Prohibit
function clickRequest(driver: Driver, name: string): boolean {
  Utils.msSleep(2000).awaitSync()
  try {
    hilog.error(domain, tag, ` 11111111111111111111111 error, ${ JSON.stringify(name) }`);
    return (async (): Promise<boolean> => {
      let button = await driver.findComponent(ON.text(name));
      await Utils.msSleep(1000);
      if (button !== null) {
        hilog.error(domain, tag, ` 2222222222222222 error, ${ JSON.stringify(name) }`);
        await button.click();
        return true;
      }
      return false;
    })().awaitSync()
  } catch (error) {
    hilog.error(domain, tag, ` findcomponent error, ${ JSON.stringify(error) }`);
    return false;
  }
}

export default function openPermissionOnSettingStaticTest() {
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  let atManager = abilityAccessCtrl.createAtManager();
  describe("openPermissionOnSettingStaticTest", (): void => {
    hilog.info(domain, tag, '##########start requestPermissionsStaticTest');
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, 'beforeAll start');
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          if (abilitys.context) {
            testAbilityContext = abilitys.context;
            hilog.info(domain, tag, 'onAbilityCreate end');
          }
        },
      }, (err: BusinessError<void> | null) : void => {
        if (err?.code ) {
          hilog.info(domain, tag, 'err.code - '+ err?.code);
        }
        hilog.info(domain, tag, 'BusinessError end');
      });
      await Utils.msSleep(1000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.openPermissionOnSettingTest.static")
      await Utils.msSleep(2000)
      try {
        await Utils.msSleep(2000)
      } catch (err) {
        hilog.info(domain, tag, 'err.code - '+ err.code);
      }
      hilog.info(domain, tag, 'beforeAll end');
    })

    /**
     * @tc.name   Test_openPermissionOnSetting_001
     * @tc.number Test_openPermissionOnSetting_001
     * @tc.desc   test openPermissionOnSetting with user_grant permission, catch 12100014.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_openPermissionOnSetting_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, tag, "Test_openPermissionOnSetting_001 start");
      if (testAbilityContext) {
        try {
          atManager.openPermissionOnSetting(testAbilityContext!, 'ohos.permission.CAMERA').then((data: abilityAccessCtrl.SelectedResult): void => {
            hilog.info(domain, tag, 'Test_openPermissionOnSetting_001 data:' + data);
            done();
          }).catch((error: Error): void => {
            hilog.info(domain, tag, `Test_openPermissionOnSetting_001 error: ${error.code} ${error.message}`);
            expect(error.code).assertEqual(12100014);
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, `Test_openPermissionOnSetting_001 error: ${error.code} ${error.message}`);
          expect(error.code).assertEqual(401);
          done();
        }
      }
    })

    /**
     * @tc.name   Test_openPermissionOnSetting_002
     * @tc.number Test_openPermissionOnSetting_002
     * @tc.desc   test openPermissionOnSetting with not request permission, catch 12100001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_openPermissionOnSetting_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, tag, "Test_openPermissionOnSetting_002 start");
      if (testAbilityContext) {
        try {
          atManager.openPermissionOnSetting(testAbilityContext!, 'ohos.permission.CUSTOM_SCREEN_RECORDING').then((data: abilityAccessCtrl.SelectedResult): void => {
            hilog.info(domain, tag, 'Test_openPermissionOnSetting_002 data:' + data);
            done();
          }).catch((error: Error): void => {
            hilog.info(domain, tag, `Test_openPermissionOnSetting_002 error: ${error.code} ${error.message}`);
            expect(error.code).assertEqual(12100001);
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, `Test_openPermissionOnSetting_002 error: ${error.code} ${error.message}`);
          expect(error.code).assertEqual(401);
          done();
        }
      }
    })

    /**
     * @tc.name   Test_openPermissionOnSetting_003
     * @tc.number Test_openPermissionOnSetting_003
     * @tc.desc   test openPermissionOnSetting with "not allow", get REJECTED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_openPermissionOnSetting_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, tag, "Test_openPermissionOnSetting_003 start");
      if (testAbilityContext) {
        try {
          atManager.openPermissionOnSetting(testAbilityContext!, 'ohos.permission.HOOK_KEY_EVENT').then((data: abilityAccessCtrl.SelectedResult): void => {
            hilog.info(domain, tag, 'Test_openPermissionOnSetting_003 data:' + data);
            expect(data).assertEqual(abilityAccessCtrl.SelectedResult.REJECTED);
            done();
          }).catch((error: Error): void => {
            hilog.info(domain, tag, `Test_openPermissionOnSetting_003 error: ${error.code} ${error.message}`);
            expect(error.code).assertEqual(12100001);
            done();
          });
          await Utils.msSleep(2000);
          let driver: Driver = Driver.create();
          hilog.info(domain, tag, "Test_openPermissionOnSetting_003 come in driverFn");
          clickRequest(driver, '不允许');
          hilog.info(domain, tag, "Test_openPermissionOnSetting_003 click over");
        } catch (error) {
          hilog.info(domain, tag, `Test_openPermissionOnSetting_003 error: ${error.code} ${error.message}`);
          expect(error.code).assertEqual(401);
          done();
        }
      }
    })

    /**
     * @tc.name   Test_openPermissionOnSetting_004
     * @tc.number Test_openPermissionOnSetting_004
     * @tc.desc   test openPermissionOnSetting with "allow", get OPENED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_openPermissionOnSetting_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, tag, "Test_openPermissionOnSetting_004 start");
      if (testAbilityContext) {
        try {
          atManager.openPermissionOnSetting(testAbilityContext!, 'ohos.permission.HOOK_KEY_EVENT').then((data: abilityAccessCtrl.SelectedResult): void => {
            hilog.info(domain, tag, 'Test_openPermissionOnSetting_004 data:' + data);
            expect(data).assertEqual(abilityAccessCtrl.SelectedResult.OPENED);
            done();
          }).catch((error: Error): void => {
            hilog.info(domain, tag, `Test_openPermissionOnSetting_004 error: ${error.code} ${error.message}`);
            expect(error.code).assertEqual(12100001);
            done();
          });
          await Utils.msSleep(2000);
          let driver: Driver = Driver.create();
          hilog.info(domain, tag, "Test_openPermissionOnSetting_004 come in driverFn");
          clickRequest(driver, '前往设置');
          hilog.info(domain, tag, "Test_openPermissionOnSetting_004 click over");
        } catch (error) {
          hilog.info(domain, tag, `Test_openPermissionOnSetting_004 error: ${error.code} ${error.message}`);
          expect(error.code).assertEqual(401);
          done();
        }
      }
    })
    
  })
  hilog.info(domain, tag, 'abilityTest end');
}