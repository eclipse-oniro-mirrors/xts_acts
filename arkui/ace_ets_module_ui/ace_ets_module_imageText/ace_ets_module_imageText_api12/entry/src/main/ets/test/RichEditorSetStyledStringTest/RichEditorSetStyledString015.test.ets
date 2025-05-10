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

export default function RichEditorSetStyledString015() {
  describe('RichEditorSetStyledString015', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorSetStyledString015 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorSetStyledString/RichEditorSetStyledString015',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorSetStyledString015 state pages: " + JSON.stringify(pages));
        if (!("RichEditorSetStyledString015" == pages.name)) {
          console.info("get RichEditorSetStyledString015 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorSetStyledString015 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorSetStyledString015 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0043
     * @tc.name  : Test the RichEditor setStyledString
     * @tc.desc  : Verify that attribute strings support setCaret0ffset to test RichEditor setStyledString
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0043', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0043 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorSetStyledString015'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y);
      await CommonFunc.sleep(500);
      let image_top = await driver.findComponent(ON.id('image_top'));
      await image_top.click();
      await CommonFunc.sleep(500);
      let get_care = await driver.findComponent(ON.id('get_care'));
      await get_care.click();
      await CommonFunc.sleep(500);
      let careNum = await driver.findComponent(ON.id('careNum'));
      let careNumText = await careNum.getText();
      await CommonFunc.sleep(500);
      expect(careNumText).assertContain('careNum:5');
      let set_care = await driver.findComponent(ON.id('set_care'));
      await set_care.click();
      await CommonFunc.sleep(500);
      await get_care.click();
      await CommonFunc.sleep(500);
      careNumText = await careNum.getText();
      await CommonFunc.sleep(500);
      expect(careNumText).assertContain('careNum:2');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0045
     * @tc.name  : Test the RichEditor setStyledString
     * @tc.desc  : Verify that attribute strings support setTypingstyle to test RichEditor setStyledString
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0045', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0045 START');
      let driver = Driver.create();
      let setTypingStyle = await driver.findComponent(ON.id('setTypingStyle'));
      await setTypingStyle.click();
      await CommonFunc.sleep(500);
      driver.triggerKey(KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      let getTypingStyle = await driver.findComponent(ON.id('getTypingStyle'));
      await getTypingStyle.click();
      await CommonFunc.sleep(500);
      let textStyle = await driver.findComponent(ON.id('textStyle'));
      let textStyleText = await textStyle.getText();
      await CommonFunc.sleep(500);
      expect(textStyleText).assertContain('"fontColor":"#FF0000FF"');
      expect(textStyleText).assertContain('"fontFamily":"MiSans-Bold"');
      expect(textStyleText).assertContain('"fontFeature":""');
      expect(textStyleText).assertContain('"fontSize":50');
      expect(textStyleText).assertContain('"fontStyle":1');
      expect(textStyleText).assertContain('"fontWeight":13');
      expect(textStyleText).assertContain('"decoration":{"type":1,"color":"#FF008000"}');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0044
     * @tc.name  : Test the RichEditor setStyledString
     * @tc.desc  : Verify that attribute strings support getTypingStyle to test RichEditor setStyledString
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0044', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0044 START');
      let driver = Driver.create();
      driver.triggerKey(KeyCode.KEYCODE_C);
      await CommonFunc.sleep(500);
      driver.triggerKey(KeyCode.KEYCODE_D);
      await CommonFunc.sleep(500);
      let getTypingStyle = await driver.findComponent(ON.id('getTypingStyle'));
      await getTypingStyle.click();
      await CommonFunc.sleep(500);
      let textStyle = await driver.findComponent(ON.id('textStyle'));
      let textStyleText = await textStyle.getText();
      await CommonFunc.sleep(500);
      expect(textStyleText).assertContain('"fontColor":"#FF0000FF"');
      expect(textStyleText).assertContain('"fontFamily":"MiSans-Bold"');
      expect(textStyleText).assertContain('"fontFeature":""');
      expect(textStyleText).assertContain('"fontSize":50');
      expect(textStyleText).assertContain('"fontStyle":1');
      expect(textStyleText).assertContain('"fontWeight":13');
      expect(textStyleText).assertContain('"decoration":{"type":1,"color":"#FF008000"}');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0046
     * @tc.name  : Test the RichEditor setStyledString
     * @tc.desc  : Verify that attribute strings support closeSelectionMenu to test RichEditor setStyledString
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0046', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0046 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorSetStyledString015'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.longClick(getBounds.x, getBounds.y);
      await CommonFunc.sleep(500);
      let close_menu = await driver.findComponent(ON.id('close_menu'));
      await close_menu.click();
      await CommonFunc.sleep(500);
      let selectAll = await driver.findComponent(ON.text('全选'));
      await CommonFunc.sleep(500);
      expect(selectAll).assertNull();
      done();
    });
  })
}


