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

export default function RichEditorShortCutKeys004() {
  describe('RichEditorShortCutKeys004', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorShortCutKeys004 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorShortCutKeys/RichEditorShortCutKeys004',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorShortCutKeys004 state pages: " + JSON.stringify(pages));
        if (!("RichEditorShortCutKeys004" == pages.name)) {
          console.info("get RichEditorShortCutKeys004 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorShortCutKeys004 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorShortCutKeys004 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0007
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0007
     * @tc.desc  : Quick Shift+↓← → Select paragraph to test RichEditor shortCutKeys
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0007',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0007 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorShortCutKeys004'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_SHIFT_LEFT, KeyCode.KEYCODE_DPAD_LEFT);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_SHIFT_LEFT, KeyCode.KEYCODE_DPAD_LEFT);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_SHIFT_LEFT, KeyCode.KEYCODE_DPAD_UP);
      await CommonFunc.sleep(500);
      let selection = await driver.findComponent(ON.id('selection'));
      let selectionText = await selection.getText();
      await CommonFunc.sleep(500);
      expect(selectionText).assertContain('"start"');
      expect(selectionText).assertContain('"end"');
      let set_position = await driver.findComponent(ON.id('set_position'));
      await set_position.click();
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_SHIFT_LEFT, KeyCode.KEYCODE_DPAD_RIGHT);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_SHIFT_LEFT, KeyCode.KEYCODE_DPAD_RIGHT);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_SHIFT_LEFT, KeyCode.KEYCODE_DPAD_DOWN);
      await CommonFunc.sleep(500);
      selectionText = await selection.getText();
      await CommonFunc.sleep(500);
      expect(selectionText).assertContain('"start"');
      expect(selectionText).assertContain('"end"');
      driver.triggerKey(KeyCode.KEYCODE_DPAD_UP);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_SHIFT_LEFT, KeyCode.KEYCODE_DPAD_UP);
      await CommonFunc.sleep(500);
      let get_position = await driver.findComponent(ON.id('get_position'));
      await get_position.click();
      await CommonFunc.sleep(500);
      let positionNum = await driver.findComponent(ON.id('positionNum'));
      let positionNumText = await positionNum.getText();
      await CommonFunc.sleep(500);
      expect(positionNumText).assertEqual('positionNum:0');
      driver.triggerKey(KeyCode.KEYCODE_DPAD_DOWN);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_SHIFT_LEFT, KeyCode.KEYCODE_DPAD_DOWN);
      await CommonFunc.sleep(500);
      await get_position.click();
      await CommonFunc.sleep(500);
      positionNumText = await positionNum.getText();
      await CommonFunc.sleep(500);
      expect(positionNumText).assertEqual('positionNum:22');
      done();
    });

  })
}


