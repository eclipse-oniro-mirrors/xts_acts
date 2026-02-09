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
export default function RichEditorLineMetrics021() {
  describe('RichEditorLineMetrics021', () => {
    beforeAll(() => {
       console.info("RichEditorOnWillChange001 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditorLineMetrics021 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorLineMetrics/RichEditorLineMetrics021',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorLineMetrics021 state pages: " + JSON.stringify(pages));
        if (!("RichEditorLineMetrics021" == pages.name)) {
          console.info("get RichEditorLineMetrics021 state pages.name: " + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorLineMetrics021 success");
        }
      } catch (err) {
        console.error("push RichEditorLineMetrics021 page error: " + err);
        expect().assertFail();
      }
    });

    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_static_0026
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_static_0026
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_static_0026
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_static_0026', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_static_0026 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('RichEditorLineMetrics021')) as Promise<Component>);
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      driver.triggerKey(KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      driver.triggerKey(KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      driver.triggerKey(KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);

      let lineMetricsWill = await (driver.findComponent(ON.id('lineMetricsWill')) as Promise<Component>);
      let lineMetricsWillText = await lineMetricsWill.getText();
      await CommonFunc.sleep(500);
      expect(lineMetricsWillText).assertEqual('lineMetricsWill{"left":24,"width":26.207916259765625,"ascent":22.27199935913086,"height":28,"descent":5.855999946594238,"baseline":34.14400100708008,"endIndex":2,"topHeight":12,"lineNumber":0,"runMetrics":{},"startIndex":0}');

      let lineMetricsDid = await (driver.findComponent(ON.id('lineMetricsDid')) as Promise<Component>);
      let lineMetricsDidText = await lineMetricsDid.getText();
      await CommonFunc.sleep(500);
      expect(lineMetricsDidText).assertEqual('lineMetricsDid:{"left":24,"width":26.207916259765625,"ascent":22.27199935913086,"height":28,"descent":5.855999946594238,"baseline":34.14400100708008,"endIndex":2,"topHeight":12,"lineNumber":0,"runMetrics":{},"startIndex":0}');
      done();
    });

  })
}


