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
export default function RichEditorLineMetrics012() {
  describe('RichEditorLineMetrics012', () => {
    beforeAll(() => {
       console.info("RichEditorOnWillChange001 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditorLineMetrics012 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorLineMetrics/RichEditorLineMetrics012',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorLineMetrics012 state pages: " + JSON.stringify(pages));
        if (!("RichEditorLineMetrics012" == pages.name)) {
          console.info("get RichEditorLineMetrics012 state pages.name: " + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorLineMetrics012 success");
        }
      } catch (err) {
        console.error("push RichEditorLineMetrics012 page error: " + err);
        expect().assertFail();
      }
    });

    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_static_0017
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_static_0017
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_static_0017
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_static_0017', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_static_0017 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('RichEditorLineMetrics012')) as Promise<Component>);
      let pointCenter = await rich.getBoundsCenter();
      await driver.longClick(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_X);
      await CommonFunc.sleep(500);
      let getFirst = await (driver.findComponent(ON.id('getFirst')) as Promise<Component>);
      await getFirst.click();
      await CommonFunc.sleep(500);
      let lineCount = await (driver.findComponent(ON.id('lineCount')) as Promise<Component>);
      let lineMetrics1Text = await lineCount.getText();
      expect(lineMetrics1Text).assertContain('lineCount:0');
      await CommonFunc.sleep(500);
      let lineMetrics2 = await (driver.findComponent(ON.id('lineMetrics2')) as Promise<Component>);
      let lineMetrics2Text = await lineMetrics2.getText();
      await CommonFunc.sleep(500);
      expect(lineMetrics2Text).assertEqual('lineMetrics(1):undefined');
      let pointCenter1 = await rich.getBoundsCenter();
      await driver.longClick(pointCenter1.x, pointCenter1.y);
      await CommonFunc.sleep(1000);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_V);
      await CommonFunc.sleep(500);
      await getFirst.click();
      await CommonFunc.sleep(500);
      lineMetrics1Text = await lineCount.getText();
      expect(lineMetrics1Text).assertContain('lineCount:2');
      await CommonFunc.sleep(500);
      lineMetrics2Text = await lineMetrics2.getText();
      await CommonFunc.sleep(500);
      expect(lineMetrics2Text).assertEqual('lineMetrics(1):{"left":10,"width":218.63937377929688,"ascent":22.27199935913086,"height":28,"descent":5.855999946594238,"baseline":60.14400100708008,"endIndex":38,"topHeight":38,"lineNumber":1,"runMetrics":{},"startIndex":21}');
      done();
    });

  })
}


