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
import { KeyCode } from '@kit.InputKit';

export default function RichEditorPreventDefault003() {
  describe('RichEditorPreventDefault003', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorPreventDefault003 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorPreventDefault/RichEditorPreventDefault003',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorPreventDefault003 state pages: " + JSON.stringify(pages));
        if (!("RichEditorPreventDefault003" == pages.name)) {
          console.info("get RichEditorPreventDefault003 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorPreventDefault003 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorPreventDefault003 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_0004
     * @tc.name  : Test the RichEditor PreventDefault
     * @tc.desc  : Set the onClick event for images or text, call preventDefault, select the content sheet, double-click to test RichEditor PreventDefault
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_0004',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_0004 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorPreventDefault003'));
      let getBounds = await rich.getBounds();
      await CommonFunc.sleep(500);

      await driver.click(getBounds.left + 30, getBounds.top + 30);
      await CommonFunc.sleep(1000);

      await driver.doubleClick(getBounds.left + 30, getBounds.top + 30);
      await CommonFunc.sleep(1000);

      let callNum = await driver.findComponent(ON.id('callNum'));
      let callNumText = await callNum.getText();
      await CommonFunc.sleep(500);
      expect(callNumText).assertContain('callNum');

      done();
    });

  })
}


