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

export default function RichEditorShortCutKeys024() {
  describe('RichEditorShortCutKeys024', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorShortCutKeys024 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorShortCutKeys/RichEditorShortCutKeys024',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorShortCutKeys024 state pages: " + JSON.stringify(pages));
        if (!("RichEditorShortCutKeys024" == pages.name)) {
          console.info("get RichEditorShortCutKeys024 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorShortCutKeys024 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorShortCutKeys024 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0037
     * @tc.name  : Test the RichEditor shortCutKeys
     * @tc.desc  : Shortcut Ctrl+Home to go to the beginning of the document to test RichEditor shortCutKeys
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0037', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0037 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorShortCutKeys024'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      let builder = await driver.findComponent(ON.id('builder'));
      await builder.click();
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_MOVE_HOME);
      await CommonFunc.sleep(500);
      let getPosition = await driver.findComponent(ON.id('getPosition'));
      await getPosition.click();
      await CommonFunc.sleep(500);
      let carePosition = await driver.findComponent(ON.id('carePosition'));
      let carePositionText = await carePosition.getText();
      await CommonFunc.sleep(500);
      expect(carePositionText).assertContain('carePosition:0');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0038
     * @tc.name  : Test the RichEditor shortCutKeys
     * @tc.desc  : Shortcut Ctrl+End to go to the end of the document to test RichEditor shortCutKeys
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0038', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0038 START');
      let driver = Driver.create();
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_MOVE_END);
      await CommonFunc.sleep(500);
      let getPosition = await driver.findComponent(ON.id('getPosition'));
      await getPosition.click();
      await CommonFunc.sleep(500);
      let carePosition = await driver.findComponent(ON.id('carePosition'));
      let carePositionText = await carePosition.getText();
      await CommonFunc.sleep(500);
      expect(carePositionText).assertContain('carePosition:8');
      let setPosition = await driver.findComponent(ON.id('setPosition'));
      await setPosition.click();
      await CommonFunc.sleep(500);
      await getPosition.click();
      await CommonFunc.sleep(500);
      carePositionText = await carePosition.getText();
      await CommonFunc.sleep(500);
      expect(carePositionText).assertContain('carePosition:3');
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_MOVE_END);
      await CommonFunc.sleep(500);
      await getPosition.click();
      await CommonFunc.sleep(500);
      carePositionText = await carePosition.getText();
      await CommonFunc.sleep(500);
      expect(carePositionText).assertContain('carePosition:8');
      done();
    });

  })
}


