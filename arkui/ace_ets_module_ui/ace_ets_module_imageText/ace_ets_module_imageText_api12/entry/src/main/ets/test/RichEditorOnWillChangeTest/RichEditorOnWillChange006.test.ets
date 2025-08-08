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

export default function RichEditorOnWillChange006() {
  describe('RichEditorOnWillChange006', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorOnWillChange006 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorOnWillChange/RichEditorOnWillChange006',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorOnWillChange006 state pages: " + JSON.stringify(pages));
        if (!("RichEditorOnWillChange006" == pages.name)) {
          console.info("get RichEditorOnWillChange006 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorOnWillChange006 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorOnWillChange006 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0004
     * @tc.name  : Test the RichEditor onWillChange callback
     * @tc.desc  : When the return value of onWillChange is true, select the content of some components and enter text to test the RichEditor onWillChange callback
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0004', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0004 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('rich_struct'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      await driver.triggerKey(KeyCode.KEYCODE_B);
      await CommonFunc.sleep(500);

      let onWillChange = await driver.findComponent(ON.id('onWillChange_callback'));
      let onWillText = await onWillChange.getText();

      let replacedSpans_callback = await driver.findComponent(ON.id('replacedSpans_callback'));
      let replaceText = await replacedSpans_callback.getText();

      let onDidChange = await driver.findComponent(ON.id('onDidChange_callback'));
      let didText = await onDidChange.getText();
      await CommonFunc.sleep(500);

      expect(onWillText).assertEqual('onWillChange_callback:true');
      expect(replaceText).assertEqual('replacedSpans_callback:true');
      expect(didText).assertEqual('onDidChange_callback:true');

      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      let selectAll = await driver.findComponent(ON.text('全选'))
      await selectAll?.click();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);

      let range_text = await driver.findComponent(ON.id('range_text'));
      let rangeText = await range_text.getText();
      await CommonFunc.sleep(500);
      // rangeBefore rangeAfter
      expect(rangeText).assertEqual('range_text:{"start":0,"end":2}{"start":0,"end":1}');

      let replace_text = await driver.findComponent(ON.id('replace_text'));
      let replaceSpanText = await replace_text.getText();
      await CommonFunc.sleep(500);
      expect(replaceSpanText).assertEqual('replace_text:a');
      done();
    });

  })
}


