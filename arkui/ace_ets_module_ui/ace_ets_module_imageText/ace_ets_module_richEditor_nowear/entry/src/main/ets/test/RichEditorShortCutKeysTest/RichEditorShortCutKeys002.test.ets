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

export default function RichEditorShortCutKeys002() {
  describe('RichEditorShortCutKeys002', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorShortCutKeys002 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorShortCutKeys/RichEditorShortCutKeys002',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorShortCutKeys002 state pages: " + JSON.stringify(pages));
        if (!("RichEditorShortCutKeys002" == pages.name)) {
          console.info("get RichEditorShortCutKeys002 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorShortCutKeys002 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorShortCutKeys002 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0001
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0001
     * @tc.desc   Single line text, HOME (Fn+left arrow) Move the cursor to the beginning of the line to test RichEditor shortCutKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0001',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0001 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorShortCutKeys002'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      driver.triggerKey(KeyCode.KEYCODE_MOVE_HOME);
      await CommonFunc.sleep(1000);

      let get_position = await driver.findComponent(ON.id('get_position'));
      await get_position.click();
      await CommonFunc.sleep(500);

      let positionNum = await driver.findComponent(ON.id('positionNum'));
      let positionNumText = await positionNum.getText();
      await CommonFunc.sleep(500);
      expect(positionNumText).assertEqual('positionNum:0');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0003
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0003
     * @tc.desc   Single line text, END (Fn+right arrow) cursor moved to the end of the line to test RichEditor shortCutKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0003',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0003 START');
      let driver = Driver.create();

      driver.triggerKey(KeyCode.KEYCODE_MOVE_END);
      await CommonFunc.sleep(1000);

      let get_position = await driver.findComponent(ON.id('get_position'));
      await get_position.click();
      await CommonFunc.sleep(500);

      let positionNum = await driver.findComponent(ON.id('positionNum'));
      let positionNumText = await positionNum.getText();
      await CommonFunc.sleep(500);
      expect(positionNumText).assertEqual('positionNum:5');
      done();
    });

  })
}


