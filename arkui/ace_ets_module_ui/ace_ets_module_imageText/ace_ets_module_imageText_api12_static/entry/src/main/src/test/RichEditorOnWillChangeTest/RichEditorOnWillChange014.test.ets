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
import {UtilsTest,startAbility} from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function RichEditorOnWillChange014() {
  describe('RichEditorOnWillChange014', () => {
    beforeAll(() => {
      console.info("RichEditorOnWillChange014 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditorOnWillChange014 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorOnWillChange/RichEditorOnWillChange014',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorOnWillChange014 state pages: " + JSON.stringify(pages));
        if (!("RichEditorOnWillChange014" == pages.name)) {
          console.info("get RichEditorOnWillChange014 state pages.name: " + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorOnWillChange014 success");
        }
      } catch (err) {
        console.error("push RichEditorOnWillChange014 page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_static_0007
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_static_0007
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_static_0007
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_static_0007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_static_0007 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('rich_struct')) as Promise<Component>);
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      let onWillChange = await (driver.findComponent(ON.id('onWillChange_callback')) as Promise<Component>);
      let onWillText = await onWillChange.getText();

      let replacedSpans_callback = await (driver.findComponent(ON.id('replacedSpans_callback')) as Promise<Component>);
      let replaceText = await replacedSpans_callback.getText();

      let onDidChange = await (driver.findComponent(ON.id('onDidChange_callback')) as Promise<Component>);
      let didText = await onDidChange.getText();
      await CommonFunc.sleep(500);

      expect(onWillText).assertEqual('onWillChange_callback:true');
      expect(replaceText).assertEqual('replacedSpans_callback:true');
      expect(didText).assertEqual('onDidChange_callback:true');


      await driver.triggerKey(KeyCode.KEYCODE_DEL);
      await CommonFunc.sleep(500);

      let onDidChange_rangeBefore = await (driver.findComponent(ON.id('onDidChange_rangeBefore')) as Promise<Component>);
      let onDidBefore = await onDidChange_rangeBefore.getText();
      await CommonFunc.sleep(500);
      expect(onDidBefore.indexOf('onDidChange rangeBefore:') == 0).assertEqual(true);
      expect(onDidBefore.indexOf('"start":5') > 0).assertEqual(true);
      expect(onDidBefore.indexOf('"end":6') > 0).assertEqual(true);

      let ondid_rangeAfter = await (driver.findComponent(ON.id('ondid_rangeAfter')) as Promise<Component>);
      let ondidRangeAfter = await ondid_rangeAfter.getText();
      await CommonFunc.sleep(500);
      expect(ondidRangeAfter.indexOf('ondid rangeAfter:') == 0).assertEqual(true);
      expect(ondidRangeAfter.indexOf('"start":5') > 0).assertEqual(true);
      expect(ondidRangeAfter.indexOf('"end":5') > 0).assertEqual(true);

      let replacedSpansCallback = await (driver.findComponent(ON.id('replacedSpansCallback')) as Promise<Component>);
      let replaceCall = await replacedSpansCallback.getText();
      await CommonFunc.sleep(500);
      expect(replaceCall).assertEqual('replacedSpans Callback:[]');

      //撤销删除
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_Z);
      await CommonFunc.sleep(500);

      onDidBefore = await onDidChange_rangeBefore.getText();
      await CommonFunc.sleep(500);
      expect(onDidBefore.indexOf('onDidChange rangeBefore:') == 0).assertEqual(true);
      expect(onDidBefore.indexOf('"start":5') > 0).assertEqual(true);
      expect(onDidBefore.indexOf('"end":5') > 0).assertEqual(true);

      ondidRangeAfter = await ondid_rangeAfter.getText();
      await CommonFunc.sleep(500);
      expect(ondidRangeAfter.indexOf('ondid rangeAfter:') == 0).assertEqual(true);
      expect(ondidRangeAfter.indexOf('"start":5') > 0).assertEqual(true);
      expect(ondidRangeAfter.indexOf('"end":6') > 0).assertEqual(true);

      replaceCall = await replacedSpansCallback.getText();
      await CommonFunc.sleep(500);
      expect(replaceCall.indexOf('"value":"ab"') > 0).assertEqual(true);
      //还原删除
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_Y);
      await CommonFunc.sleep(500);

      let int_callback_status = await (driver.findComponent(ON.id('int_callback_status')) as Promise<Component>);
      int_callback_status.click();
      await CommonFunc.sleep(500);

      onDidBefore = await onDidChange_rangeBefore.getText();
      await CommonFunc.sleep(500);
      expect(onDidBefore.indexOf('onDidChange rangeBefore:') == 0).assertEqual(true);
      expect(onDidBefore.indexOf('"start":5') > 0).assertEqual(true);
      expect(onDidBefore.indexOf('"end":6') > 0).assertEqual(true);

      ondidRangeAfter = await ondid_rangeAfter.getText();
      await CommonFunc.sleep(500);
      expect(ondidRangeAfter.indexOf('ondid rangeAfter:') == 0).assertEqual(true);
      expect(ondidRangeAfter.indexOf('"start":5') > 0).assertEqual(true);
      expect(ondidRangeAfter.indexOf('"end":5') > 0).assertEqual(true);

      replaceCall = await replacedSpansCallback.getText();
      await CommonFunc.sleep(500);
      expect(replaceCall).assertEqual('replacedSpans Callback:[]');

      done();
    });

  })
}


