/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function RichEditorOnWillChange001() {
  describe('RichEditorOnWillChange001', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorOnWillChange001 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorOnWillChange/RichEditorOnWillChange001',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorOnWillChange001 state pages: " + JSON.stringify(pages));
        if (!("RichEditorOnWillChange001" == pages.name)) {
          console.info("get RichEditorOnWillChange001 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(4000);
          console.info("push RichEditorOnWillChange001 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorOnWillChange001 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0021
     * @tc.name SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0021
     * @tc.desc SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0021 test
     * @tc.level Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0021', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0021 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('rich_struct'));
      await CommonFunc.sleep(1000);

      let add_emoji = await driver.findComponent(ON.id('add_emoji'));
      add_emoji.click();
      await CommonFunc.sleep(1000);

      let replacedSpans_callback = await driver.findComponent(ON.id('replacedSpans_callback'));
      let replaceText = await replacedSpans_callback.getText();

      let onDidChange = await driver.findComponent(ON.id('onDidChange_callback'));
      let didText = await onDidChange.getText();

      let onWillChange_rangeBefore = await driver.findComponent(ON.id('onWillChange_rangeBefore'));
      let onWillBeforeText = await onWillChange_rangeBefore.getText();
      await CommonFunc.sleep(500);

      let onDidChange_rangeBefore = await driver.findComponent(ON.id('onDidChange_rangeBefore'));
      let onDidBeforeText = await onDidChange_rangeBefore.getText();
      await CommonFunc.sleep(500);

      let emoji_length = await driver.findComponent(ON.id('rangeAfter_emoji'));
      let length = await emoji_length.getText();
      await CommonFunc.sleep(500);

      expect(replaceText).assertEqual('replacedSpans_callback:true');
      expect(didText).assertEqual('onDidChange_callback:true');
      expect(onWillBeforeText.indexOf('{"start":0,"end":0}') > 0).assertEqual(true);
      expect(onDidBeforeText.indexOf('{"start":0,"end":0}') > 0).assertEqual(true);
      expect(length).assertEqual('rangeAfter_emoji:{"start":0,"end":2}');

      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);

      //KEYCODE_DEL
      await driver.triggerKey(2055);
      await CommonFunc.sleep(500);

      let replacedSpansCallback = await driver.findComponent(ON.id('replacedSpansCallback'));
      let replacedSpans = await replacedSpansCallback.getText();
      await CommonFunc.sleep(500);

      onWillBeforeText = await onWillChange_rangeBefore.getText();
      await CommonFunc.sleep(500);
      onDidBeforeText = await onDidChange_rangeBefore.getText();
      await CommonFunc.sleep(500);

      expect(onWillBeforeText.indexOf('{"start":0,"end":2}') > 0).assertEqual(true);
      expect(onDidBeforeText.indexOf('{"start":0,"end":2}') > 0).assertEqual(true);

      expect(replacedSpans.indexOf('[]') > 0).assertEqual(true);

      done();
    });
  })
}


