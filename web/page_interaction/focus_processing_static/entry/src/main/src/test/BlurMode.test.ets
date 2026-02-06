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

import { expect, afterEach, beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../src/test/Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest';

let testAbilityContext:common.UIAbilityContext;
let emitKey = "blurMode01";

export default function webViewSrollableJsunit() {
  describe('blurOnKeyboardHideModeTest',  () =>{
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000)
      console.log("App start")
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          console.log("onAbilityCreate end")
        },
      }, (err : BusinessError | null) : void => {
        if (err != null ) {
          console.log("-----" + err.code)
        }
        console.log("BusinessError  end")
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.pageInteractionFour.test.static")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    beforeEach(async  () =>{
      await Utils.msSleep(2000);
      console.info("blurMode beforeEach start");
    })


    /**
     * @tc.name   blurModeStatic01
     * @tc.number SUB_ACE_BASIC_ETS_BLURONKEYBOARDHIDEMODE_API_001
     * @tc.desc   test blurMode01 interface when choose callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blurModeStatic01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000)
      Utils.emitEvent("blurMode01", 10)
      let driver = Driver.create();
      await Utils.msSleep(2000)
      let buttonOne = await driver.findComponent(ON.text('input'));
      if (buttonOne != null) {
        await buttonOne.click();
      }
      await Utils.msSleep(1000)
      let buttonTwo = await driver.findComponent(ON.id('KeyHideKbd'));
      await Utils.msSleep(1000)
      if (buttonTwo) {
        await buttonTwo.click()
      } else {
        await driver.click(671, 701);
      }
      Utils.registerEvent("blurMode01",true,20241133,done);
      await Utils.msSleep(2000)

      inspector.sendEventByKey('blurOnKeyboardHideMode01',10,'');
      await Utils.msSleep(2000)
      done();
    })


    /**
     * @tc.name   blurModeStatic02
     * @tc.number SUB_ACE_BASIC_ETS_BLURONKEYBOARDHIDEMODE_API_002
     * @tc.desc   test blurMode02 interface when choose callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('blurModeStatic02',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(3000)
      Utils.emitEvent("blurMode02", 10)
      let driver = Driver.create();
      await Utils.msSleep(3000)
      let buttonOne = await driver.findComponent(ON.text('input'));
      if (buttonOne != null) {
        await buttonOne.click();
      }
      await Utils.msSleep(3000)
      let buttonTwo = await driver.findComponent(ON.id('KeyHideKbd'));
      await Utils.msSleep(1000)
      if (buttonTwo) {
        await buttonTwo.click()
      } else {
        await driver.click(671, 701);
      }
      Utils.registerEvent("blurMode02",true,20241134,done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('blurOnKeyboardHideMode01',10,'');
      await Utils.msSleep(3000)
      done();
    })
  })
}
