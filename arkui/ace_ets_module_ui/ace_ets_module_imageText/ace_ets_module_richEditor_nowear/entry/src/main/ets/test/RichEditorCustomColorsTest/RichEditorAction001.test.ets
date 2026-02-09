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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
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
import { KeyCode } from "@kit.InputKit";


export default function RichEditorAction001() {
  describe('RichEditorAction001', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorCustomColors/RichEditorAction001',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorAction001 state pages: " + JSON.stringify(pages));
        if (!("RichEditorAction001" == pages.name)) {
          console.info("get RichEditorAction001 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3500);
          console.info("push RichEditorAction001 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorAction001 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0070_773
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0070_773
     * @tc.desc   Enter a single/text content and view the content of the onIMEInputComplete recovery content, verify the returned RichEditorTextSpanResult content results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0070_773',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0070_773 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorAction001'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      driver.triggerKey(KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_A, KeyCode.KEYCODE_B, KeyCode.KEYCODE_C);
      await CommonFunc.sleep(1000);

      let input_value = await driver.findComponent(ON.id('input_value'));
      let contentText = await input_value.getText();
      await CommonFunc.sleep(1000);
      expect(contentText).assertEqual('input_value:"aabc"');
      done();
    });

  })
}


