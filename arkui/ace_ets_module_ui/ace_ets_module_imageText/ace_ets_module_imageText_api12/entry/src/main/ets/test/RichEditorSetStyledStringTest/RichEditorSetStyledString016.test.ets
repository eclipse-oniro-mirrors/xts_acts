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

export default function RichEditorSetStyledString016() {
  describe('RichEditorSetStyledString016', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorSetStyledString016 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorSetStyledString/RichEditorSetStyledString016',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorSetStyledString016 state pages: " + JSON.stringify(pages));
        if (!("RichEditorSetStyledString016" == pages.name)) {
          console.info("get RichEditorSetStyledString016 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorSetStyledString016 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorSetStyledString016 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0047
     * @tc.name  : Test the RichEditor setStyledString
     * @tc.desc  : Verify that attribute strings support setSelection to test RichEditor setStyledString
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0047', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0047 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorSetStyledString016'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y);
      await CommonFunc.sleep(500);
      let image_center = await driver.findComponent(ON.id('image_center'));
      await image_center.click();
      await CommonFunc.sleep(500);
      let getSelection = await driver.findComponent(ON.id('getSelection'));
      await getSelection.click();
      await CommonFunc.sleep(500);
      let content = await driver.findComponent(ON.id('content'));
      let contentText = await content.getText();
      await CommonFunc.sleep(500);
      expect(contentText).assertContain('content:start:5;end:5');
      let setSelection = await driver.findComponent(ON.id('setSelection'));
      await setSelection.click();
      await CommonFunc.sleep(500);
      done();
    });


    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0048
     * @tc.name  : Test the RichEditor setStyledString
     * @tc.desc  : Verify that attribute strings support getSelection to test RichEditor setStyledString
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0048', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0048 START');
      let driver = Driver.create();
      let getSelection = await driver.findComponent(ON.id('getSelection'));
      await getSelection.click();
      await CommonFunc.sleep(500);
      let content = await driver.findComponent(ON.id('content'));
      let contentText = await content.getText();
      await CommonFunc.sleep(500);
      expect(contentText).assertContain('content:start:0;end:5');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0049
     * @tc.name  : Test the RichEditor setStyledString
     * @tc.desc  : Verify that attribute strings support isEditing to test RichEditor setStyledString
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0049', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0049 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorSetStyledString016'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y);
      await CommonFunc.sleep(500);
      let isEditing = await driver.findComponent(ON.id('isEditing'));
      let isEditingText = await isEditing.getText();
      await CommonFunc.sleep(500);
      expect(isEditingText).assertContain('isEditing:true');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0050
     * @tc.name  : Test the RichEditor setStyledString
     * @tc.desc  : Verify that attribute strings support stopEditing to test RichEditor setStyledString
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0050', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0050 START');
      let driver = Driver.create();
      let stopEditing = await driver.findComponent(ON.id('stopEditing'));
      await stopEditing.click();
      await CommonFunc.sleep(500);
      let isEditing = await driver.findComponent(ON.id('isEditing'));
      let isEditingText = await isEditing.getText();
      await CommonFunc.sleep(500);
      expect(isEditingText).assertContain('isEditing:false');
      done();
    });
  })
}


