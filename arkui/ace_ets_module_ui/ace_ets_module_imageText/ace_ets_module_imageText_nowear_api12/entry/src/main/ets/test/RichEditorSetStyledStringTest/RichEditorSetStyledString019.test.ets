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

export default function RichEditorSetStyledString019() {
  describe('RichEditorSetStyledString019', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorSetStyledString019 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorSetStyledString/RichEditorSetStyledString019',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorSetStyledString019 state pages: " + JSON.stringify(pages));
        if (!("RichEditorSetStyledString019" == pages.name)) {
          console.info("get RichEditorSetStyledString019 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorSetStyledString019 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorSetStyledString019 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0062
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0062
     * @tc.desc   Validate the textAlign attribute of the attribute string to test RichEditor setStyledString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0062',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0062 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorSetStyledString019'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y);
      await CommonFunc.sleep(1000);
      let get_paragraphStyle = await driver.findComponent(ON.id('get_paragraphStyle'));
      await get_paragraphStyle.click();
      await CommonFunc.sleep(500);
      let textAlign = await driver.findComponent(ON.id('textAlign'));
      let textAlignText = await textAlign.getText();
      await CommonFunc.sleep(500);
      expect(textAlignText).assertContain('textAlign:1');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0063
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0063
     * @tc.desc   Validate the textIndent attribute of the attribute string to test RichEditor setStyledString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0063',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0063 START');
      let driver = Driver.create();
      let textIndent = await driver.findComponent(ON.id('textIndent'));
      let textIndentText = await textIndent.getText();
      await CommonFunc.sleep(500);
      expect(textIndentText).assertContain('textIndent:15');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0071
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0071
     * @tc.desc   Verify that the attribute string supports the onEditingChange event to test RichEditor setStyledString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0071',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0071 START');
      let driver = Driver.create();
      let image_center = await driver.findComponent(ON.id('image_center'));
      await image_center.click();
      await CommonFunc.sleep(500);
      driver.triggerKey(KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      let isEditingCall = await driver.findComponent(ON.id('isEditingCall'));
      let isEditingCallText = await isEditingCall.getText();
      await CommonFunc.sleep(500);
      expect(isEditingCallText).assertContain('isEditingCall:true');
      done();
    });

  })
}


