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

export default function RichEditorPreventDefault001() {
  describe('RichEditorPreventDefault001', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorPreventDefault001 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorPreventDefault/RichEditorPreventDefault001',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorPreventDefault001 state pages: " + JSON.stringify(pages));
        if (!("RichEditorPreventDefault001" == pages.name)) {
          console.info("get RichEditorPreventDefault001 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorPreventDefault001 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorPreventDefault001 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_0002
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_0002
     * @tc.desc  : Set the onClick event with an image or text, do not call preventDefault, click on the image or text to test RichEditor PreventDefault
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_0002',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_0002 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorPreventDefault001'));
      let getBounds = await rich.getBounds();
      await CommonFunc.sleep(500);

      await driver.click(getBounds.left + 30, getBounds.top + 30);
      await CommonFunc.sleep(1000);

      await driver.click(getBounds.left + 80, getBounds.top + 30);
      await CommonFunc.sleep(1000);

      let textCall = await driver.findComponent(ON.id('textCall'));
      let textCallText = await textCall.getText();
      await CommonFunc.sleep(500);
      expect(textCallText).assertContain('textCall');

      let imageCall = await driver.findComponent(ON.id('imageCall'));
      let imageCallText = await imageCall.getText();
      await CommonFunc.sleep(500);
      expect(imageCallText).assertContain('imageCall');
      done();
    });

  })
}


