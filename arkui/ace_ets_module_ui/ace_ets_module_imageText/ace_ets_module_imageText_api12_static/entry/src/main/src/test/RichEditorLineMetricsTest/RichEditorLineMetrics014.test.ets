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
export default function RichEditorLineMetrics014() {
  describe('RichEditorLineMetrics014', () => {
    beforeAll(() => {
       console.info("RichEditorOnWillChange001 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditorLineMetrics014 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorLineMetrics/RichEditorLineMetrics014',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorLineMetrics014 state pages: " + JSON.stringify(pages));
        if (!("RichEditorLineMetrics014" == pages.name)) {
          console.info("get RichEditorLineMetrics014 state pages.name: " + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorLineMetrics014 success");
        }
      } catch (err) {
        console.error("push RichEditorLineMetrics014 page error: " + err);
        expect().assertFail();
      }
    });

    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_static_0019
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_static_0019
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_static_0019
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_static_0019', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_static_0019 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('RichEditorLineMetrics014')) as Promise<Component>);
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      let getFirst = await (driver.findComponent(ON.id('getFirst')) as Promise<Component>);
      await getFirst.click();
      await CommonFunc.sleep(500);

      let lineMetrics = await (driver.findComponent(ON.id('lineMetrics')) as Promise<Component>);
      let lineMetricsText = await lineMetrics.getText();
      await CommonFunc.sleep(500);
      expect(lineMetricsText).assertEqual('lineMetrics:{"left":25,"width":183.33543395996094,"ascent":22.27199935913086,"height":28,"descent":5.855999946594238,"baseline":35.14400100708008,"endIndex":17,"topHeight":13,"lineNumber":0,"runMetrics":{},"startIndex":0}');
      done();
    });

  })
}


