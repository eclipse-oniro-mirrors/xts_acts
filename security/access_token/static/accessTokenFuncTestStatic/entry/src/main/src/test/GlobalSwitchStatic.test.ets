/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, afterEach, it, expect, TestType, Size, Level} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { Permissions } from 'permissions';
import PermissionRequestResult from 'security.PermissionRequestResult';
import bundleManager from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext | undefined;
let tokenID: int;

const ERR_PARAM_ILLEGAL = 401;
const ERR_PARAM_INVALID = 12100001;
const ERR_SWITCH_OPEN = 12100013;

export default function GlobalSwitchStaticTest() {
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  let atManager = abilityAccessCtrl.createAtManager();
  describe("GlobalSwitchStaticTest", (): void => {
    hilog.info(domain, 'testTag', '##########start GlobalSwitchStaticTest');
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
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.accesstokentest.static")
      await Utils.msSleep(2000)
      try {
        
        await Utils.msSleep(2000)
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, 'err.code - '+ err.code);
      }
      hilog.info(domain, tag, 'beforeAll end');
    })

    afterEach((): void => {
    })
    
    /**
     * @tc.name   Test_requestGlobalSwitch_001
     * @tc.number Test_requestGlobalSwitch_001
     * @tc.desc   requestGlobalSwitch Permissions SwitchType.CAMERA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_requestGlobalSwitch_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_requestGlobalSwitch_001 start ");
      let type = abilityAccessCtrl.SwitchType.CAMERA;
      try {
        let flag = false;
        atManager.requestGlobalSwitch(testAbilityContext!, type).then((data: Boolean): void => {
          hilog.info(domain, tag, "Test_requestGlobalSwitch_001 data");
        }).catch((err: Error): void => {
          hilog.info(domain, tag, "Test_requestGlobalSwitch_001 err.code:" + JSON.stringify(err));
          if (flag = err.code == ERR_SWITCH_OPEN || err.code == ERR_PARAM_INVALID) {
            expect(flag).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, "Test_requestGlobalSwitch_001 error " + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   Test_requestGlobalSwitch_002
     * @tc.number Test_requestGlobalSwitch_002
     * @tc.desc   requestGlobalSwitch Permissions SwitchType.MICROPHONE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_requestGlobalSwitch_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_requestGlobalSwitch_002 start ");
      let type = abilityAccessCtrl.SwitchType.MICROPHONE;
      try {
        let flag = false;
        atManager.requestGlobalSwitch(testAbilityContext!, type).then((data: Boolean): void => {
          hilog.info(domain, tag, "Test_requestGlobalSwitch_002 data");
          expect(data).assertFalse();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, "Test_requestGlobalSwitch_002 err.code:" + JSON.stringify(err));
          if (flag = err.code == ERR_SWITCH_OPEN || err.code == ERR_PARAM_INVALID) {
            expect(flag).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, "Test_requestGlobalSwitch_002 error " + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   Test_requestGlobalSwitch_003
     * @tc.number Test_requestGlobalSwitch_003
     * @tc.desc   requestGlobalSwitch Permissions SwitchType.LOCATION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_requestGlobalSwitch_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_requestGlobalSwitch_003 start ");
      let type = abilityAccessCtrl.SwitchType.LOCATION;
      try {
        let flag = false;
        atManager.requestGlobalSwitch(testAbilityContext!, type).then((data: Boolean): void => {
          hilog.info(domain, tag, "Test_requestGlobalSwitch_003 data");
          expect(data).assertTrue();
          done();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, "Test_requestGlobalSwitch_003 err.code:" + JSON.stringify(err));
          if (flag = err.code == ERR_SWITCH_OPEN || err.code == ERR_PARAM_INVALID) {
            expect(flag).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });

        await Utils.msSleep(2000);
        let driver = Driver.create();
        hilog.info(domain, 'testTag', "Test_requestGlobalSwitch_003 come in driverFn ");
        let toggle = await driver.findComponent(ON.type("Toggle"));
        let button = await driver.findComponent(ON.text("确定"));
        if (toggle) {
          await toggle.click();
        }
        if (button) {
          await button.click();
        }
        
        hilog.info(domain, 'testTag', "Test_requestGlobalSwitch_003 click over");
        
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, "Test_requestGlobalSwitch_003 error " + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

  })
  hilog.info(domain, tag, '%{public}s', 'GlobalSwitchStaticTest end');

}