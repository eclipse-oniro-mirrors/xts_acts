/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';
const driver = Driver.create();
let testAbilityContext:common.UIAbilityContext;


export default function webViewWebViewErrorCode() {
    describe('ActsAceWebViewErrorCodeTest', (): void => {
      beforeAll(async (): Promise<void> => {
        await Utils.msSleep(2000)
        console.log("App start")
      });

      beforeEach(async () => {
        await Utils.msSleep(2000);
        console.info("web beforeEach start");
      })
    /**
     * @tc.name   emitGetPageOffsetErrorCodeStatic
     * @tc.number SUB_ACE_BASIC_ETS_GETPAGEOFFSETERRORCODE_0100
     * @tc.desc   emitGetPageOffsetErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitGetPageOffsetErrorCodeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitGetPageOffsetErrorCode", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("emitGetPageOffsetErrorCode", "801", 20250907, done);
      await Utils.msSleep(2000);
      Utils.registerEvent("emitGetPageOffsetErrorCode", "Capability not supported", 20250908, done);
      let button = await driver.findComponent(ON.id('webViewOthersErrorCode'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(2000);
      done()
    })
    /**
     * @tc.name   emitAvoidVisibleViewportBottomErrorCodeStatic
     * @tc.number SUB_ACE_BASIC_ETS_AVOIDVISIBLEVIEWPORTBOTTOMERRORCODE_0200
     * @tc.desc   emitAvoidVisibleViewportBottomErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitAvoidVisibleViewportBottomErrorCodeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitAvoidVisibleViewportBottomErrorCode", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("emitAvoidVisibleViewportBottomErrorCode", "801", 20250910, done);
      await Utils.msSleep(2000);
      Utils.registerEvent("emitAvoidVisibleViewportBottomErrorCode", "Capability not supported", 20250911, done);
      let button = await driver.findComponent(ON.id('webViewOthersErrorCode'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(2000);
      done()
    })
    /**
     * @tc.name   emitIsActiveWebEngineEvergreenStatic009
     * @tc.number SUB_ACE_BASIC_ETS_ISACTIVEWEBENGINEEVERGREEN_0900
     * @tc.desc   IsActiveWebEngineEvergreen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitIsActiveWebEngineEvergreenStatic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitIsActiveWebEngineEvergreen009', 10)
      Utils.registerEvent('emitIsActiveWebEngineEvergreen009', true, 20251226, done);
        let button = await driver.findComponent(ON.id('webViewOthersErrorCode'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(2000);
        done()
    })
  })
}