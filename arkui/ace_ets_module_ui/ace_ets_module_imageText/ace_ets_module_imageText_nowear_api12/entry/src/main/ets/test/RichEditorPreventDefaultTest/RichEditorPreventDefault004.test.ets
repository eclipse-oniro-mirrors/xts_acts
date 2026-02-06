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

export default function RichEditorPreventDefault004() {
  describe('RichEditorPreventDefault004', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorPreventDefault004 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorPreventDefault/RichEditorPreventDefault004',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorPreventDefault004 state pages: " + JSON.stringify(pages));
        if (!("RichEditorPreventDefault004" == pages.name)) {
          console.info("get RichEditorPreventDefault004 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(1000);
          console.info("push RichEditorPreventDefault004 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorPreventDefault004 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_0005
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_0005
     * @tc.desc  : Set the onLongPress event for images or text to test RichEditor PreventDefault
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_0005',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_0005 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorPreventDefault004'));
      let getBounds = await rich.getBounds();
      await CommonFunc.sleep(100);

      await driver.longClick(getBounds.left + 30, getBounds.top + 30);
      await CommonFunc.sleep(100);

      let callClick = await driver.findComponent(ON.id('callClick'));
      let callClickText = await callClick.getText();
      await CommonFunc.sleep(100);
      expect(callClickText).assertContain('callClick');

      let callLongPress = await driver.findComponent(ON.id('callLongPress'));
      let callLongPressText = await callLongPress.getText();
      await CommonFunc.sleep(100);
      expect(callLongPressText).assertContain('callLongPress');
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_X);
      await CommonFunc.sleep(500);
      await driver.longClick(getBounds.left + 30, getBounds.top + 30);
      await CommonFunc.sleep(100);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_V);
      await CommonFunc.sleep(500);

      let boundsCenter = await rich.getBoundsCenter();
      await CommonFunc.sleep(100);
      await driver.longClick(boundsCenter.x, boundsCenter.y);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_A);
      await CommonFunc.sleep(1000);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_C);
      await CommonFunc.sleep(1000);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_V);
      await CommonFunc.sleep(1000);
      done();
    });

  })
}


