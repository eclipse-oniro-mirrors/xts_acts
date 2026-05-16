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
import text from "@ohos.graphics.text";
import {KeyCode} from '@ohos.multimodalInput.keyCode';
import {UtilsTest,startAbility} from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function RichEditorOnWillChange001() {
  describe('RichEditorOnWillChange001', () => {
    beforeAll(() => {
      console.info("RichEditorOnWillChange001 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditorOnWillChange001 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorOnWillChange/RichEditorOnWillChange001',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorOnWillChange001 state pages: " + JSON.stringify(pages));
        if (!("RichEditorOnWillChange001" == pages.name)) {
          console.info("get RichEditorOnWillChange001 state pages.name: " + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(4000);
          console.info("push RichEditorOnWillChange001 success");
        }
      } catch (err) {
        console.error("push RichEditorOnWillChange001 page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_static_0021
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_static_0021
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_static_0021
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_static_0021', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_static_0021 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('rich_struct')) as Promise<Component>);
      await CommonFunc.sleep(1000);

      let add_emoji = await (driver.findComponent(ON.id('add_emoji')) as Promise<Component>);
      add_emoji.click();
      await CommonFunc.sleep(1000);

      let replacedSpans_callback = await (driver.findComponent(ON.id('replacedSpans_callback')) as Promise<Component>);
      let replaceText = await replacedSpans_callback.getText();

      let onDidChange = await (driver.findComponent(ON.id('onDidChange_callback')) as Promise<Component>);
      let didText = await onDidChange.getText();

      let onWillChange_rangeBefore = await (driver.findComponent(ON.id('onWillChange_rangeBefore')) as Promise<Component>);
      let onWillBeforeText = await onWillChange_rangeBefore.getText();
      await CommonFunc.sleep(500);

      let onDidChange_rangeBefore = await (driver.findComponent(ON.id('onDidChange_rangeBefore')) as Promise<Component>);
      let onDidBeforeText = await onDidChange_rangeBefore.getText();
      await CommonFunc.sleep(500);

      let emoji_length = await (driver.findComponent(ON.id('rangeAfter_emoji')) as Promise<Component>);
      let length = await emoji_length.getText();
      await CommonFunc.sleep(500);

      expect(replaceText).assertEqual('replacedSpans_callback:true');
      expect(didText).assertEqual('onDidChange_callback:true');
      expect(onWillBeforeText.indexOf('"start":0') > 0).assertEqual(true);
      expect(onWillBeforeText.indexOf('"end":0') > 0).assertEqual(true);

      expect(onDidBeforeText.indexOf('"start":0') > 0).assertEqual(true);
      expect(onDidBeforeText.indexOf('"end":0') > 0).assertEqual(true);
      expect(length).assertEqual('rangeAfter_emoji:{"end":2,"start":0}');

      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);

      //KEYCODE_DEL
      await driver.triggerKey(2055);
      await CommonFunc.sleep(500);

      let replacedSpansCallback = await (driver.findComponent(ON.id('replacedSpansCallback')) as Promise<Component>);
      let replacedSpans = await replacedSpansCallback.getText();
      await CommonFunc.sleep(500);

      onWillBeforeText = await onWillChange_rangeBefore.getText();
      await CommonFunc.sleep(500);
      onDidBeforeText = await onDidChange_rangeBefore.getText();
      await CommonFunc.sleep(500);

      expect(onWillBeforeText.indexOf('"start":0') > 0).assertEqual(true);
      expect(onWillBeforeText.indexOf('"end":2') > 0).assertEqual(true);

      expect(onDidBeforeText.indexOf('"start":0') > 0).assertEqual(true);
      expect(onDidBeforeText.indexOf('"end":2') > 0).assertEqual(true);

      expect(replacedSpans.indexOf('[]') > 0).assertEqual(true);

      done();
    });
  })
}


