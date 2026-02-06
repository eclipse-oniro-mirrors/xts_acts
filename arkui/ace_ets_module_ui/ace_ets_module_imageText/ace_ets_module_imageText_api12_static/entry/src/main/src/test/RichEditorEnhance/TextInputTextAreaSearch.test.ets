'use static';
/*
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

 import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index";
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import RectValue from '../../../ets/MainAbility/common/Rect';
import {MessageManager,Callback,Message} from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import { UIContext } from '@ohos.arkui.UIContext'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import text from "@ohos.graphics.text";
import {KeyCode} from '@ohos.multimodalInput.keyCode';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function TextInputTextAreaSearch() {
  describe('TextInputTextAreaSearch', () => {
    beforeAll(() => {
       console.info("RichEditorOnWillChange001 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("TextInputTextAreaSearch beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEnhance/TextInputTextAreaSearch',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get TextInputTextAreaSearch state pages:" + JSON.stringify(pages));
        if (!("TextInputTextAreaSearch" == pages.name)) {
          console.info("get TextInputTextAreaSearch pages.name:" + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
          console.info("push TextInputTextAreaSearch page result");
        }
      } catch (err) {
        console.error("push TextInputTextAreaSearch page error:" + err);
      }
      console.info("TextInputTextAreaSearch beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      let driver = Driver.create();
      await driver.delayMs(1000)
      console.info("TextInputTextAreaSearch after each called");
    });
    
    /**
     * @tc.number   TextInputTextAreaSearch_static_0100
     * @tc.name     TextInputTextAreaSearch_static_0100
     * @tc.desc     TextInputTextAreaSearch_static_0100
     * @tc.level   Level.LEVEL0
     */
    it('TextInputTextAreaSearch_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Test stop
      console.info('[TextInputTextAreaSearch_static_0100] START');
      let driver = Driver.create();
      await driver.delayMs(1000)
      
      let TextInput_supportAvoidance = await (driver.findComponent(ON.id("TextInput_supportAvoidance")) as Promise<Component>);
      let point1 = await TextInput_supportAvoidance.getBoundsCenter();
      await TextInput_supportAvoidance.click()
      await driver.delayMs(1000)
      let point2 = await TextInput_supportAvoidance.getBoundsCenter();
      expect(point1.y === point2.y).assertFalse()
      let supportAvoidance_stopEditing = await (driver.findComponent(ON.id("supportAvoidance_stopEditing")) as Promise<Component>);
      await supportAvoidance_stopEditing.click()
      console.info('[TextInputTextAreaSearch_static_0100] END');
      done();
    });

    
    /**
     * @tc.number   TextInputTextAreaSearch_static_0200
     * @tc.name     TextInputTextAreaSearch_static_0200
     * @tc.desc     TextInputTextAreaSearch_static_0200
     * @tc.level   Level.LEVEL0
     */
    it('TextInputTextAreaSearch_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Test stop
      console.info('[TextInputTextAreaSearch_static_0200] START');
      let driver = Driver.create();
      await driver.delayMs(1000)
      let TextArea_supportAvoidance = await (driver.findComponent(ON.id("TextArea_supportAvoidance")) as Promise<Component>);
      let point1 = await TextArea_supportAvoidance.getBoundsCenter();
      await TextArea_supportAvoidance.click()
      await driver.delayMs(1000)
      let point2 = await TextArea_supportAvoidance.getBoundsCenter();
      expect(point1.y === point2.y).assertFalse()
      let supportAvoidance_stopEditing = await (driver.findComponent(ON.id("supportAvoidance_stopEditing")) as Promise<Component>);
      await supportAvoidance_stopEditing.click()
      console.info('[TextInputTextAreaSearch_static_0200] END');
      done();
    });

    
    /**
     * @tc.number   TextInputTextAreaSearch_static_0300
     * @tc.name     TextInputTextAreaSearch_static_0300
     * @tc.desc     TextInputTextAreaSearch_static_0300
     * @tc.level   Level.LEVEL0
     */
    it('TextInputTextAreaSearch_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Test stop
      console.info('[TextInputTextAreaSearch_static_0300] START');
      let driver = Driver.create();
      await driver.delayMs(1000)
      let Search_supportAvoidance = await (driver.findComponent(ON.id("Search_supportAvoidance")) as Promise<Component>);
      let point1 = await Search_supportAvoidance.getBoundsCenter();
      await Search_supportAvoidance.click()
      await driver.delayMs(1000)
      let point2 = await Search_supportAvoidance.getBoundsCenter();
      expect(point1.y === point2.y).assertFalse()
      console.info('[TextInputTextAreaSearch_static_0300] END');
      done();
    });
    
  })
}
