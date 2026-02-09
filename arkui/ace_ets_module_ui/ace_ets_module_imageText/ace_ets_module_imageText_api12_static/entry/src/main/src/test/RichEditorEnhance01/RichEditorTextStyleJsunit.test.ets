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
export default function RichEditorTextStyleJsunit() {
  describe('RichEditorTextStyleJsunit', () => {
    beforeAll(() => {
       console.info("RichEditorOnWillChange001 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditorTextStyleJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEnhance01/RichEditor_TextStyle',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorTextStyleJsunit state pages:" + JSON.stringify(pages));
        if (!("RichEditor_TextStyle" == pages.name)) {
          console.info("get RichEditorTextStyleJsunit pages.name:" + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
          console.info("push RichEditorTextStyleJsunit page result");
        }
      } catch (err) {
        console.error("push RichEditorTextStyleJsunit page error:" + err);
      }
      console.info("RichEditorTextStyleJsunit beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      let driver = Driver.create();
      await driver.delayMs(1000)
      console.info("RichEditorTextStyleJsunit after each called");
    });

    
    /**
     * @tc.number   RichEditorTextStyleJsunit_static_0100
     * @tc.name     RichEditorTextStyleJsunit_static_0100
     * @tc.desc     RichEditorTextStyleJsunit_static_0100
     * @tc.level   Level.LEVEL0
     */
    it('RichEditorTextStyleJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[RichEditorTextStyleJsunit_static_0100] START');
      let driver = Driver.create();
      await driver.delayMs(1000)

      let AddLineHeightBut = await (driver.findComponent(ON.id("addLineHeightBut")) as Promise<Component>);
      await AddLineHeightBut.click()
      await driver.delayMs(2000)

      let RichEditorTextStyleGetSpansBtn = await (driver.findComponent(ON.id("RichEditorTextStyle_GetSpansBtn")) as Promise<Component>);
      await RichEditorTextStyleGetSpansBtn.click()
      await driver.delayMs(2000)

      let StyleLineHeightValue = await (driver.findComponent(ON.id("StyleLineHeight_100")) as Promise<Component | null>);
      expect(StyleLineHeightValue == null).assertTrue();

      console.info('[RichEditorTextStyleJsunit_static_0100] END');
      done();
    });

    
    /**
     * @tc.number   RichEditorTextStyleJsunit_static_0200
     * @tc.name     RichEditorTextStyleJsunit_static_0200
     * @tc.desc     RichEditorTextStyleJsunit_static_0200
     * @tc.level   Level.LEVEL0
     */
    it('RichEditorTextStyleJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[RichEditorTextStyleJsunit_static_0200] START');
      let driver = Driver.create();
      await driver.delayMs(1000)

      let AddLetterSpacingBtn = await (driver.findComponent(ON.id("addLetterSpacing")) as Promise<Component>);
      await AddLetterSpacingBtn.click()
      await driver.delayMs(2000)

      let RichEditorTextStyleGetSpansBtn = await (driver.findComponent(ON.id("RichEditorTextStyle_GetSpansBtn")) as Promise<Component>);
      await RichEditorTextStyleGetSpansBtn.click()
      await driver.delayMs(2000)

      let StyleLineHeightValue = await (driver.findComponent(ON.id("StyleLetterSpacing_40")) as Promise<Component | null>);
      expect(StyleLineHeightValue == null).assertTrue();

      console.info('[RichEditorTextStyleJsunit_static_0200] END');
      done();
    });
  })
}