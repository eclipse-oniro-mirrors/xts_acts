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

export default function RichEditorSetStyledString010() {
  describe('RichEditorSetStyledString010', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorSetStyledString010 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorSetStyledString/RichEditorSetStyledString010',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorSetStyledString010 state pages: " + JSON.stringify(pages));
        if (!("RichEditorSetStyledString010" == pages.name)) {
          console.info("get RichEditorSetStyledString010 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorSetStyledString010 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorSetStyledString010 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0020
     * @tc.name  : Test the RichEditor setStyledString
     * @tc.desc  : Call insertString to insert a string after the mixed content of text and text to test RichEditor setStyledString
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0020',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0020 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorSetStyledString010'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y );
      await CommonFunc.sleep(1000);
      let image_top = await driver.findComponent(ON.id('image_top'));
      await image_top.click();
      await CommonFunc.sleep(500);
      let get_length = await driver.findComponent(ON.id('get_length'));
      await get_length.click();
      await CommonFunc.sleep(500);
      let lengthStr = await driver.findComponent(ON.id('lengthStr'));
      let lengthStrText = await lengthStr.getText();
      await CommonFunc.sleep(500);
      expect(lengthStrText).assertContain('lengthStr:5');
      let add_text = await driver.findComponent(ON.id('add_text'));
      await add_text.click();
      await CommonFunc.sleep(500);
      await get_length.click();
      await CommonFunc.sleep(500);
      lengthStrText = await lengthStr.getText();
      await CommonFunc.sleep(500);
      expect(lengthStrText).assertContain('lengthStr:9');
      done();
    });
  })
}


