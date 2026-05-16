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

export default function RichEditorPreventDefault002() {
  describe('RichEditorPreventDefault002', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorPreventDefault002 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorPreventDefault/RichEditorPreventDefault002',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorPreventDefault002 state pages: " + JSON.stringify(pages));
        if (!("RichEditorPreventDefault002" == pages.name)) {
          console.info("get RichEditorPreventDefault002 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorPreventDefault002 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorPreventDefault002 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_0003
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_0003
     * @tc.desc   Set the onClick event with an image or text, do call preventDefault, doubleClick on the image or text to test RichEditor PreventDefault
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_0003',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_0003 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorPreventDefault002'));
      let getBounds = await rich.getBounds();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 30, getBounds.top + 30);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 30, getBounds.top + 30);
      await CommonFunc.sleep(100);
      let callNum = await driver.findComponent(ON.id('callNum'));
      let callNumText = await callNum.getText();
      await CommonFunc.sleep(500);
      expect(callNumText).assertContain('callNum');
      done();
    });

  })
}


