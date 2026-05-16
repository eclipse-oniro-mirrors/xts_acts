'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest} from "../Util.test"
import CommonFunc from "../../../ets/MainAbility/common/Common";
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function RichEditor4() {
  describe('RichEditor4', () => {
    beforeAll(() => {
      console.info("RichEditor4 beforeEach start");

      ;
      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api12.static", "EntryAbility");
      ;
    });
    beforeEach(async (): Promise<void> => {
      console.info("RichEditor4 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEnhance/RichEditor4',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RichEditor4 state pages:" + JSON.stringify(pages));
        if (!("RichEditor4" == pages.name)) {
          console.info("get RichEditor4 pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
          // console.info("push RichEditor4 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditor4 page error:" + err);
      }
      console.info("RichEditor4 beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      let driver = Driver.create();
      await driver.delayMs(1000)
      console.info("RichEditor4 after each called");
    });
    
    
/**
     * @tc.number   RichEditor4_static_0100
     * @tc.name     RichEditor4_static_0100
     * @tc.desc     RichEditor4_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('RichEditor4_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Test stop
      console.info('[RichEditor4_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000)
      let RichEditor_supportAvoidance = await driver.findComponent(ON.id("RichEditor_emoji"));
      await CommonFunc.sleep(500)
        let text1 = await (RichEditor_supportAvoidance?.getText() as Promise<String>)
        await CommonFunc.sleep(500)
        await (RichEditor_supportAvoidance?.click() as Promise<void>)
        await CommonFunc.sleep(500)
        await driver.triggerKey(2055)
        await CommonFunc.sleep(500)
        let text2 = await (RichEditor_supportAvoidance?.getText() as Promise<String>)
        await CommonFunc.sleep(500)
        expect(text1.length).assertLarger(text2.length);
        expect(text2.length).assertLarger(0);

      console.info('[RichEditor4_0100] END');
      done();
    });
  })
}
