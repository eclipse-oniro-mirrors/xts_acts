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
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest} from "../Util.test"
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function RichEditor11() {
  describe('RichEditor11', () => {
    beforeAll( () => {
      console.info("RichEditor11 beforeEach start");

      ;
      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api12.static", "EntryAbility");
      ;
    });
    beforeEach(async (): Promise<void> => {
      console.info("RichEditor11 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEnhance/RichEditor11',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RichEditor11 state pages:" + JSON.stringify(pages));
        if (!("RichEditor11" == pages.name)) {
          console.info("get RichEditor11 pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
          // console.info("push RichEditor11 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditor11 page error:" + err);
      }
      console.info("RichEditor11 beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      let driver = Driver.create();
      await driver.delayMs(1000)
      console.info("RichEditor11 after each called");
    });
    
    
/**
     * @tc.number   RichEditor11_static_0100
     * @tc.name     RichEditor11_static_0100
     * @tc.desc     RichEditor11_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('RichEditor11_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Test stop
      console.info('[RichEditor11_static_0100] START');
      let driver = Driver.create();
      await driver.delayMs(1000)
      let RichEditor11_double = await driver.findComponent(ON.id("RichEditor11_double"));
      await driver.delayMs(500)
      await (RichEditor11_double?.longClick() as Promise<void>)
      await driver.delayMs(500)
      let getSelection = await driver.findComponent(ON.text("getSelection"));
      await driver.delayMs(500)
      await (getSelection?.click() as Promise<void>);
      await driver.delayMs(500)


        let RichEditor11_Text = await driver.findComponent(ON.id("RichEditor11_Text"));
        await driver.delayMs(500)
        let text = await (RichEditor11_Text?.getText() as Promise<String>);
        await driver.delayMs(500)
        expect(Number(text)).assertLarger(0)

      console.info('[RichEditor11_static_0100] END');
      done();
    });
  })
}
