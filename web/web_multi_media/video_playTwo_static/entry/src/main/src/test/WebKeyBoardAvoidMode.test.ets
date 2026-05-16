/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext:common.UIAbilityContext;

export default function WebKeyBoardAvoidModeTest() {
    describe('WebKeyBoardAvoidModeTest', (): void => {
      beforeAll(async (): Promise<void> => {
        await Utils.msSleep(3000);
        console.log("App start")
      });

      beforeEach(async () => {
        await Utils.msSleep(5000);
        console.info("componentLifeCycleTestOne beforeEach start");
      })
    /**
     * @tc.name   testWebKeyBoardAvoidModeStatic01
     * @tc.number SUB_WEB_WEBKEYBOARDAVOIDMODE_01001
     * @tc.desc   WebKeyBoardAvoidMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebKeyBoardAvoidModeStatic01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitWebKeyBoardAvoidMode01", 10);
      await Utils.msSleep(2000)
      let driver = Driver.create();
      await Utils.msSleep(2000)
      let buttonOne = await driver.findComponent(ON.text('input'));
      if (buttonOne != null) {
        await buttonOne.click();
      }
      await Utils.msSleep(2000)
      Utils.registerEvent("emitWebKeyBoardAvoidMode01", true, 20251211, done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('webKeyBoardAvoidModeButton',10,'');
      await Utils.msSleep(2000)
      done();
    })
    /**
     * @tc.name   testNativeEmbedOptionsStatic002
     * @tc.number SUB_WEB_NativeEmbedOptions_02002
     * @tc.desc   test NativeEmbedOptions null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeEmbedOptionsStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("nativeEmbedOptionsNull", 10)
      Utils.registerEvent('testNativeEmbedOptionsStatic001', "success", 20251212, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMediaPlayGestureAccessTestButton', 10, '');
      await Utils.msSleep(3000);
      done()
    })
  })
}


