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

export default function RichEditorShortCutKeys023() {
  describe('RichEditorShortCutKeys023', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorShortCutKeys023 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorShortCutKeys/RichEditorShortCutKeys023',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorShortCutKeys023 state pages: " + JSON.stringify(pages));
        if (!("RichEditorShortCutKeys023" == pages.name)) {
          console.info("get RichEditorShortCutKeys023 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorShortCutKeys023 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorShortCutKeys023 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0035
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0035
     * @tc.desc  : Shortcut keys Ctrl+↑ go to the beginning of the paragraph to test RichEditor shortCutKeys
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0035',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0035 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorShortCutKeys023'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);
      let builder = await driver.findComponent(ON.id('builder'));
      await builder.click();
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_DPAD_UP);
      await CommonFunc.sleep(500);
      let getPosition = await driver.findComponent(ON.id('getPosition'));
      await getPosition.click();
      await CommonFunc.sleep(500);
      let carePosition = await driver.findComponent(ON.id('carePosition'));
      let carePositionText = await carePosition.getText();
      await CommonFunc.sleep(500);
      expect(carePositionText).assertContain('carePosition:8');
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_DPAD_UP);
      await CommonFunc.sleep(500);
      await getPosition.click();
      await CommonFunc.sleep(500);
      carePositionText = await carePosition.getText();
      await CommonFunc.sleep(500);
      expect(carePositionText).assertContain('carePosition:0');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0036
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0036
     * @tc.desc  : Shortcut keys Ctrl+↓ go to the end of the paragraph to test RichEditor shortCutKeys
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0036',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0036 START');
      let driver = Driver.create();

      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_DPAD_DOWN);
      await CommonFunc.sleep(500);
      let getPosition = await driver.findComponent(ON.id('getPosition'));
      await getPosition.click();
      await CommonFunc.sleep(500);
      let carePosition = await driver.findComponent(ON.id('carePosition'));
      let carePositionText = await carePosition.getText();
      await CommonFunc.sleep(500);
      expect(carePositionText).assertContain('carePosition:7');
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_DPAD_DOWN);
      await CommonFunc.sleep(500);
      await getPosition.click();
      await CommonFunc.sleep(500);
      carePositionText = await carePosition.getText();
      await CommonFunc.sleep(500);
      expect(carePositionText).assertContain('carePosition:13');
      done();
    });

  })
}


