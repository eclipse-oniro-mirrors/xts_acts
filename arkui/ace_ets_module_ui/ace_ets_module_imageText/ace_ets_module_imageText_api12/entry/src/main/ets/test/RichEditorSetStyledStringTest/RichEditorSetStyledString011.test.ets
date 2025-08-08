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

export default function RichEditorSetStyledString011() {
  describe('RichEditorSetStyledString011', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorSetStyledString011 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorSetStyledString/RichEditorSetStyledString011',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorSetStyledString011 state pages: " + JSON.stringify(pages));
        if (!("RichEditorSetStyledString011" == pages.name)) {
          console.info("get RichEditorSetStyledString011 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorSetStyledString011 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorSetStyledString011 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0024
     * @tc.name  : Test the RichEditor setStyledString
     * @tc.desc  : Verify property string support for onSelectionChange to test RichEditor onCopy
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0024', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0024 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorSetStyledString011'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y);
      await CommonFunc.sleep(1000);
      let image_top = await driver.findComponent(ON.id('image_top'));
      await image_top.click();
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_C);
      await CommonFunc.sleep(500);
      let onCopyCall = await driver.findComponent(ON.id('onCopyCall'));
      let onCopyCallText = await onCopyCall.getText();
      await CommonFunc.sleep(500);
      expect(onCopyCallText).assertContain('onCopyCall:true');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0021
     * @tc.name  : Test the RichEditor setStyledString
     * @tc.desc  : Verify property string support for onSelectionChange to test RichEditor onpaste
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0021', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0021 START');
      let driver = Driver.create();
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_V);
      await CommonFunc.sleep(500);
      let onPasteCall = await driver.findComponent(ON.id('onPasteCall'));
      let onPasteCallText = await onPasteCall.getText();
      await CommonFunc.sleep(500);
      expect(onPasteCallText).assertContain('onPasteCall:true');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0023
     * @tc.name  : Test the RichEditor setStyledString
     * @tc.desc  : Verify property string support for onSelectionChange to test RichEditor onCut
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0023', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0023 START');
      let driver = Driver.create();
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_X);
      await CommonFunc.sleep(500);
      let onCut = await driver.findComponent(ON.id('onCut'));
      let onCutText = await onCut.getText();
      await CommonFunc.sleep(500);
      expect(onCutText).assertContain('onCut:true');
      done();
    });
  })
}


