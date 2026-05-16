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

export default function requestFromUserServicePopStaticTest() {
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  let atManager = abilityAccessCtrl.createAtManager();
  describe("requestFromUserServicePopStaticTest", (): void => {
    hilog.info(domain, tag, '##########start requestFromUserServicePopStaticTest');
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
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.requestFromUserServicePopTest.static")
      await Utils.msSleep(2000)
      try {
        await Utils.msSleep(2000)
      } catch (err) {
        hilog.info(domain, tag, 'err.code - '+ err.code);
      }
      hilog.info(domain, tag, 'beforeAll end');
    })

    /**
     * @tc.name   Test_requestFromUserServicePop_001
     * @tc.number Test_requestFromUserServicePop_001
     * @tc.desc   test requestPermissionsFromUser with invalid permissionList.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_requestFromUserServicePop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, tag, "Test_requestFromUserServicePop_001 start");
      let permission: Permissions = "ohos.permission.APP_TRACKING_CONSENT" as Permissions;
      let permissionList: Array<Permissions> = new Array<Permissions>(permission);
      if (testAbilityContext) {
        try {
          atManager.requestPermissionsFromUser(testAbilityContext!, permissionList).then((data: PermissionRequestResult): void => {
            hilog.info(domain, tag, `Test_requestPermissionsFromUser_003 data ${data} `);
            expect(data.permissions.length).assertEqual(permissionList.length);
            expect(data.authResults[0]).assertEqual(0);
            expect(data.dialogShownResults?.[0]).assertTrue();
            done();
          }).catch((error: Error): void => {
            hilog.info(domain, tag, `Test_requestFromUserServicePop_001 error ${error.code}  ${error.message}`);
            expect(false).assertTrue();
            done();
          });

        } catch (error) {
          hilog.info(domain, tag, `Test_requestFromUserServicePop_001 catch err ${error.code}  ${error.message}`);
          expect(false).assertTrue();
          done();
        }
      }
    })

   

  })
  hilog.info(domain, tag, 'abilityTest end');
}