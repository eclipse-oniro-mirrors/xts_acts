/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from "../../../hypium/index";
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';

let testAbilityContext:common.UIAbilityContext;

export default function screenCapture() {

  describe('ScreenCapture', (): void => {
    beforeEach(async (): Promise<void> => {
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          console.log("onAbilityCreate end")
        },
      }, (err: BusinessError | null) : void => {
        if (err != null ) {
          console.log("-----" + err.code)
        }
        console.log("BusinessError  end")
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.screencapturetest.static")
      await Utils.msSleep(5000)
      console.log("qyh beforeEach end,%s", "Succeed!")
    })

    /**
     * @tc.name   testScreenCaptureConfigGetOriginStatic001
     * @tc.number SUB_WEB_SCREENCAPTURECONFIGGETORIGIN_0100
     * @tc.desc   test ScreenCaptureConfigGetOrigin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScreenCaptureConfigGetOriginStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitScreenCaptureConfigGetOrigin001", 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testScreenCaptureConfigGetOriginStatic001", true, 4202, done);
      await Utils.msSleep(3000);
      inspector.sendEventByKey('ScreenCaptureConfig', 10, '');
      await Utils.msSleep(20000);
      done();
    })
  })
}
