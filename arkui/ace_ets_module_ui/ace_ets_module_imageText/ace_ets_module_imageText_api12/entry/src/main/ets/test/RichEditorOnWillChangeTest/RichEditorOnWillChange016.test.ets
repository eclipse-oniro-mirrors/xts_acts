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
import { KeyCode } from '@kit.InputKit';

export default function RichEditorOnWillChange016() {
  describe('RichEditorOnWillChange016', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorOnWillChange016 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorOnWillChange/RichEditorOnWillChange016',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorOnWillChange016 state pages: " + JSON.stringify(pages));
        if (!("RichEditorOnWillChange016" == pages.name)) {
          console.info("get RichEditorOnWillChange016 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorOnWillChange016 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorOnWillChange016 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0008
     * @tc.name  : Test the RichEditor onWillChange callback
     * @tc.desc  : Revoke the input text content and then restore it to test RichEditor on WillChange callback
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0008', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0008 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorOnWillChange016'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      driver.triggerKey(KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      driver.triggerKey(KeyCode.KEYCODE_B);
      await CommonFunc.sleep(500);

      //撤销输入
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_Z);
      await CommonFunc.sleep(500);

      let onDidChange_rangeBefore = await driver.findComponent(ON.id('onDidChange_rangeBefore'));
      let onDidBefore = await onDidChange_rangeBefore.getText();
      await CommonFunc.sleep(500);
      expect(onDidBefore).assertEqual('onDidChange rangeBefore:{"start":1,"end":2}');
      let replacedSpansCallback = await driver.findComponent(ON.id('replacedSpansCallback'));
      let replaceCall = await replacedSpansCallback.getText();
      await CommonFunc.sleep(500);
      expect(replaceCall).assertContain('replacedSpans Callback:[]');
      let ondid_rangeAfter = await driver.findComponent(ON.id('ondid_rangeAfter'));
      let ondidRangeAfter = await ondid_rangeAfter.getText();
      await CommonFunc.sleep(500);
      expect(ondidRangeAfter).assertEqual('ondid rangeAfter:{"start":1,"end":1}');

      //还原输入
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_Y);
      await CommonFunc.sleep(500);

      replaceCall = await replacedSpansCallback.getText();
      await CommonFunc.sleep(500);
      expect(replaceCall).assertContain('"value":"ab"');

      onDidBefore = await onDidChange_rangeBefore.getText();
      await CommonFunc.sleep(500);
      expect(onDidBefore).assertEqual('onDidChange rangeBefore:{"start":1,"end":1}');

      ondidRangeAfter = await ondid_rangeAfter.getText();
      await CommonFunc.sleep(500);
      expect(ondidRangeAfter).assertEqual('ondid rangeAfter:{"start":1,"end":2}');

      done();
    });

  })
}


