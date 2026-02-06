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
export default function RichEditorFontFeatureJsunit() {
  describe('RichEditorFontFeatureJsunit', () => {
    beforeAll(() => {
       console.info("RichEditorOnWillChange001 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditorFontFeatureJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEnhance01/RichEditorFontFeature',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorFontFeatureJsunit state pages:" + JSON.stringify(pages));
        if (!("RichEditorFontFeature" == pages.name)) {
          console.info("get RichEditorFontFeatureJsunit pages.name:" + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
          console.info("push RichEditorFontFeatureJsunit page result");
        }
      } catch (err) {
        console.error("push RichEditorFontFeatureJsunit page error:" + err);
      }
      console.info("RichEditorFontFeatureJsunit beforeEach end");
    });
    
    afterEach(async (): Promise<void> => {
      let driver = Driver.create();
      await driver.delayMs(1000)
      console.info("RichEditorFontFeatureJsunit after each called");
    });

    
    /**
     * @tc.number   RichEditorFontFeatureJsunit_static_0100
     * @tc.name     RichEditorFontFeatureJsunit_static_0100
     * @tc.desc     RichEditorFontFeatureJsunit_static_0100
     * @tc.level   Level.LEVEL0
     */
    it('RichEditorFontFeatureJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Test stop
      console.info('[RichEditorFontFeatureJsunit_static_0100] START');
      let driver = Driver.create();
      await driver.delayMs(1000)

      let  RichEditorFontFeatureUpdateBtn = await (driver.findComponent(ON.id("RichEditorFontFeature_UpdateBtn1")) as Promise<Component>);
      await RichEditorFontFeatureUpdateBtn.click()
      await driver.delayMs(2000)

      let RichEditorFontFeatureGetSpansBtn = await (driver.findComponent(ON.id("RichEditorFontFeature_GetSpansBtn")) as Promise<Component>);
      await RichEditorFontFeatureGetSpansBtn.click()
      await driver.delayMs(2000)

      let FontFeatureValueCon = await (driver.findComponent(ON.text("getSpansAPI")) as Promise<Component>);
      console.info("StyleLineHeightValue"+ JSON.stringify(FontFeatureValueCon))
      let FontFeatureValue = await FontFeatureValueCon.getId();
      console.info("RichEditorFontFeatureValue_"+ FontFeatureValue)
      await driver.delayMs(2000)
      expect(FontFeatureValue).assertEqual("RichEditorFontFeatureValue_\"subs\" 1")
      console.info('[RichEditorFontFeatureJsunit_static_0100] END');
      done();
    });

    
    /**
     * @tc.number   RichEditorFontFeatureJsunit_static_0200
     * @tc.name     RichEditorFontFeatureJsunit_static_0200
     * @tc.desc     RichEditorFontFeatureJsunit_static_0200
     * @tc.level   Level.LEVEL0
     */
    it('RichEditorFontFeatureJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Test stop
      console.info('[RichEditorFontFeatureJsunit_static_0200] START');
      let driver = Driver.create();
      await driver.delayMs(1000)

      let RichEditorFontFeatureUpdateBtn = await (driver.findComponent(ON.id("RichEditorFontFeature_UpdateBtn2")) as Promise<Component>);
      await RichEditorFontFeatureUpdateBtn.click()
      await driver.delayMs(2000)

      let RichEditorFontFeatureGetSpansBtn = await (driver.findComponent(ON.id("RichEditorFontFeature_GetSpansBtn")) as Promise<Component>);
      await RichEditorFontFeatureGetSpansBtn.click()
      await driver.delayMs(2000)

      let FontFeatureValueCon = await (driver.findComponent(ON.text("getSpansAPI")) as Promise<Component>);
      console.info("StyleLineHeightValue"+ JSON.stringify(FontFeatureValueCon))
      let FontFeatureValue = await FontFeatureValueCon.getId();
      console.info("RichEditorFontFeatureValue_"+ FontFeatureValue)
      await driver.delayMs(2000)
      expect(FontFeatureValue.split(" ").join("")).assertEqual("RichEditorFontFeatureValue_\"subs\"1,\"liga\"0")
      console.info('[RichEditorFontFeatureJsunit_static_0200] END');
      done();
    });
  })
}