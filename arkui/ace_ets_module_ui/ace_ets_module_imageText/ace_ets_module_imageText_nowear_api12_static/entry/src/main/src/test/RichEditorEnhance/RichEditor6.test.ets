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


export default function RichEditor6() {
  describe('RichEditor6', () => {
    beforeAll(() => {
      console.info("RichEditor6 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api12.static", "EntryAbility");

    });
    beforeEach(async (): Promise<void> => {
      console.info("RichEditor6 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEnhance/RichEditor6',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RichEditor6 state pages:" + JSON.stringify(pages));
        if (!("RichEditor6" == pages.name)) {
          console.info("get RichEditor6 pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await UtilsTest.msSleep(2000);
          // console.info("push RichEditor6 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditor6 page error:" + err);
      }
      console.info("RichEditor6 beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      let driver = Driver.create();
      await driver.delayMs(1000)
      console.info("RichEditor6 after each called");
    });
    
    
/**
     * @tc.number   RichEditor6_static_0100
     * @tc.name     RichEditor6_static_0100
     * @tc.desc     RichEditor6_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('RichEditor6_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Test stop
      console.info('[RichEditor6_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000)
      let RichEditorGetAttribute = await driver.findComponent(ON.id("RichEditor01"));
      await CommonFunc.sleep(500)
      await (RichEditorGetAttribute?.inputText('123') as Promise<void>)
      await CommonFunc.sleep(500)


        let OnEditingChange = await driver.findComponent(ON.id("OnEditingChange"));
        await CommonFunc.sleep(500)
        let IsEditing = await driver.findComponent(ON.id("IsEditing"));
        await CommonFunc.sleep(500)
        let OnEditingChangeText = await (OnEditingChange?.getText() as Promise<String>)
        await CommonFunc.sleep(500)
        let IsEditingText = await (IsEditing?.getText() as Promise<String>)
        await CommonFunc.sleep(500)
        expect(OnEditingChangeText).assertContain("true")
        expect(IsEditingText).assertContain("true")

      await (RichEditorGetAttribute?.clearText() as Promise<void>)
      await CommonFunc.sleep(500)
      console.info('[RichEditor6_0100] END');
      done();
    });
    
    
    
/**
     * @tc.number   RichEditor6_static_0200
     * @tc.name     RichEditor6_static_0200
     * @tc.desc     RichEditor6_static_0200
     * @tc.level    Level.LEVEL2
     */
    it('RichEditor6_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Test stop
      console.info('[RichEditor6_0200] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000)
      let RichEditorGetAttribute = await driver.findComponent(ON.id("RichEditor01"));
      await CommonFunc.sleep(500)
      await (RichEditorGetAttribute?.inputText('abc') as Promise<void>)
      await CommonFunc.sleep(500)
	    await driver.triggerKey(2047)
      await CommonFunc.sleep(500)
      let GetStopEditing = await driver.findComponent(ON.id("StopEditing"));
      await CommonFunc.sleep(500)
      await (GetStopEditing?.click() as Promise<void>)
      await CommonFunc.sleep(500)


        let OnEditingChange = await driver.findComponent(ON.id("OnEditingChange"));
        await CommonFunc.sleep(500)
        let IsEditing = await driver.findComponent(ON.id("IsEditing"));
        await CommonFunc.sleep(500)
        let OnEditingChangeText = await (OnEditingChange?.getText() as Promise<String>)
        await CommonFunc.sleep(500)
        let IsEditingText = await (IsEditing?.getText() as Promise<String>)
        await CommonFunc.sleep(500)
        expect(OnEditingChangeText).assertContain("false")
        expect(IsEditingText).assertContain("false")

      console.info('[RichEditor6_0200] END');
      done();
    });
  })
}
