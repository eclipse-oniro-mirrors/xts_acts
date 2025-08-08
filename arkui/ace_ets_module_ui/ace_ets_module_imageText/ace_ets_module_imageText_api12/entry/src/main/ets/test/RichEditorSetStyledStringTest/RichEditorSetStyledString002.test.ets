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

export default function RichEditorSetStyledString002() {
  describe('RichEditorSetStyledString002', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorSetStyledString002 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorSetStyledString/RichEditorSetStyledString002',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorSetStyledString002 state pages: " + JSON.stringify(pages));
        if (!("RichEditorSetStyledString002" == pages.name)) {
          console.info("get RichEditorSetStyledString002 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorSetStyledString002 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorSetStyledString002 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledStrin_000120
     * @tc.name  : Test the RichEditor setStyledString
     * @tc.desc  : Test RichEditor setStyledString by using 'equals' to determine if two attribute strings are equal for an image
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledStrin_000120', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledStrin_000120 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorSetStyledString002'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);

      await driver.click(getBounds.x, getBounds.y );
      await CommonFunc.sleep(1000);

      let add_image = await driver.findComponent(ON.id('add_image'));
      await add_image.click();
      await CommonFunc.sleep(500);
      let equals = await driver.findComponent(ON.id('equals'));
      await equals.click();
      await CommonFunc.sleep(500);
      let content = await driver.findComponent(ON.id('content'));
      let contentText = await content.getText();
      await CommonFunc.sleep(500);
      expect(contentText).assertContain('content:true');
      done();
    });

  })
}


