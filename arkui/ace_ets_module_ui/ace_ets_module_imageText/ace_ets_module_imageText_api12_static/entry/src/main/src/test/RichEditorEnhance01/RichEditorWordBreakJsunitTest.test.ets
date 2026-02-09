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
export default function RichEditorWordBreakJsunitTest() {
  describe('RichEditorWordBreakJsunitTest', () => {
    beforeAll(() => {
       console.info("RichEditorOnWillChange001 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditorWordBreakJsunitTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEnhance01/RichEditorWordBreak',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorWordBreakJsunitTest state pages:" + JSON.stringify(pages));
        if (!("RichEditorWordBreak" == pages.name)) {
          console.info("get RichEditorWordBreakJsunitTest pages.name:" + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
          console.info("push RichEditorWordBreakJsunitTest page result");
        }
      } catch (err) {
        console.error("push RichEditorWordBreakJsunitTest page error:" + err);
      }
      console.info("RichEditorWordBreakJsunitTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      let driver = Driver.create();
      await driver.delayMs(1000)
      console.info("RichEditorWordBreakJsunitTest after each called");
    });

    
    /**
     * @tc.number   RichEditorWordBreakJsunitTest_static_0100
     * @tc.name     RichEditorWordBreakJsunitTest_static_0100
     * @tc.desc     RichEditorWordBreakJsunitTest_static_0100
     * @tc.level   Level.LEVEL0
     */
    it('RichEditorWordBreakJsunitTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[RichEditorWordBreakJsunitTest_static_0100] START');
      let driver = Driver.create();
      await driver.delayMs(1000)

      let GetParagraphsButtonCon = await (driver.findComponent(ON.id("RichEditorWordBreak_getParagraphs")) as Promise<Component>);
      await GetParagraphsButtonCon.click()
      await driver.delayMs(2000)

      let RichEditorWordBreakCon = await (driver.findComponent(ON.id("RichEditorWordBreakValue_BREAK_WORD")) as Promise<Component>);
      expect(RichEditorWordBreakCon != null).assertTrue();

      console.info('[RichEditorWordBreakJsunitTest_static_0100] END');
      done();
    });

    
    /**
     * @tc.number   RichEditorWordBreakJsunitTest_static_0200
     * @tc.name     RichEditorWordBreakJsunitTest_static_0200
     * @tc.desc     RichEditorWordBreakJsunitTest_static_0200
     * @tc.level   Level.LEVEL0
     */
    it('RichEditorWordBreakJsunitTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[RichEditorWordBreakJsunitTest_static_0200] START');
      let driver = Driver.create();
      await driver.delayMs(1000)

      let ButtonCon = await (driver.findComponent(ON.id("RichEditorWordBreak_NORMAL")) as Promise<Component>);
      await ButtonCon.click()
      await driver.delayMs(2000)

      let GetParagraphsButtonCon = await (driver.findComponent(ON.id("RichEditorWordBreak_getParagraphs")) as Promise<Component>);
      await GetParagraphsButtonCon.click()
      await driver.delayMs(2000)

      let RichEditorWordBreakCon = await (driver.findComponent(ON.id("RichEditorWordBreakValue_NORMAL")) as Promise<Component>);
      expect(RichEditorWordBreakCon != null).assertTrue();

      console.info('[RichEditorWordBreakJsunitTest_static_0200] END');
      done();
    });

    
    /**
     * @tc.number   RichEditorWordBreakJsunitTest_static_0300
     * @tc.name     RichEditorWordBreakJsunitTest_static_0300
     * @tc.desc     RichEditorWordBreakJsunitTest_static_0300
     * @tc.level   Level.LEVEL0
     */
    it('RichEditorWordBreakJsunitTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[RichEditorWordBreakJsunitTest_static_0300] START');
      let driver = Driver.create();
      await driver.delayMs(1000)

      let ButtonCon = await (driver.findComponent(ON.id("RichEditorWordBreak_BREAK_ALL")) as Promise<Component>);
      await ButtonCon.click()
      await driver.delayMs(2000)

      let GetParagraphsButtonCon = await (driver.findComponent(ON.id("RichEditorWordBreak_getParagraphs")) as Promise<Component>);
      await GetParagraphsButtonCon.click()
      await driver.delayMs(2000)

      let RichEditorWordBreakCon = await (driver.findComponent(ON.id("RichEditorWordBreakValue_BREAK_ALL")) as Promise<Component>);
      expect(RichEditorWordBreakCon != null).assertTrue();

      console.info('[RichEditorWordBreakJsunitTest_static_0300] END');
      done();
    });
  })
}