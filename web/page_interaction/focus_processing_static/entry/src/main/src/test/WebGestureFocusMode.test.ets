/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

export default function webGestureFocusModeJsunit() {
  describe('WebGestureFocusModeTest',  () =>{
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
     * @tc.name   testWebGestureFocusModeStatic00
     * @tc.number SUB_WEB_WEBGESTUREFOCUSMODE_0000
     * @tc.desc   test GestureFocusMode.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebGestureFocusModeStatic00',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000)
      Utils.emitEvent("testWebGestureFocusMode00", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebGestureFocusMode00",0,20260310,done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('WebGestureFocusModeButton',10,'');
      console.info(`testWebGestureFocusMode00 finish`);
      await Utils.msSleep(2000)
      done();
    })

    /**
     * @tc.name   testWebGestureFocusModeStatic01
     * @tc.number SUB_WEB_WEBGESTUREFOCUSMODE_0001
     * @tc.desc   test GestureFocusMode.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebGestureFocusModeStatic01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000)
      Utils.emitEvent("testWebGestureFocusMode01", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebGestureFocusMode01",1,20260311,done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('WebGestureFocusModeButton',10,'');
      console.info(`testWebGestureFocusMode01 finish`);
      await Utils.msSleep(2000)
      done();
    })

    /**
     * @tc.name   emitonSwitchNextPage
     * @tc.number SUB_WEB_WEBGESTUREFOCUSMODE_0002
     * @tc.desc   PAGE_REDIRECT.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('emitonSwitchNextPage',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitonSwitchNextPage', 10)
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebGestureFocusModeButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
  })
}
