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

export default function RichEditorOnSelectionChange009() {
  describe('RichEditorOnSelectionChange009', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorOnSelectionChange009 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorOnSelectionChange/RichEditorOnSelectionChange009',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorOnSelectionChange009 state pages: " + JSON.stringify(pages));
        if (!("RichEditorOnSelectionChange009" == pages.name)) {
          console.info("get RichEditorOnSelectionChange009 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorOnSelectionChange009 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorOnSelectionChange009 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONSELECTIONCHANGE_0070
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONSELECTIONCHANGE_0070
     * @tc.desc   Test RichEditor OnSelectionChange by changing cursor position with directional keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONSELECTIONCHANGE_0070',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONSELECTIONCHANGE_0070 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('rich_struct'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      let setCaretOffset = await driver.findComponent(ON.id('setCaretOffset'))
      await setCaretOffset?.click();
      await CommonFunc.sleep(500);

      driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await CommonFunc.sleep(500);
      driver.triggerKey(KeyCode.KEYCODE_DPAD_DOWN);
      await CommonFunc.sleep(500);
      driver.triggerKey(KeyCode.KEYCODE_DPAD_LEFT);
      await CommonFunc.sleep(500);
      driver.triggerKey(KeyCode.KEYCODE_DPAD_UP);
      await CommonFunc.sleep(500);
      let onSelectCallBack = await driver.findComponent(ON.id('onSelectCallBack'));
      let onSelectCallBackText = await onSelectCallBack.getText();
      await CommonFunc.sleep(500);
      expect(onSelectCallBackText).assertContain('onSelectCallBack');
      let message = await driver.findComponent(ON.id('message'));
      let messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      let setCaretOffset_end = await driver.findComponent(ON.id('setCaretOffset_end'))
      await setCaretOffset_end?.click();
      await CommonFunc.sleep(500);
      let set1 = await driver.findComponent(ON.id('set1'))
      await set1?.click();
      await CommonFunc.sleep(500);
      driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await CommonFunc.sleep(500);
      driver.triggerKey(KeyCode.KEYCODE_DPAD_DOWN);
      await CommonFunc.sleep(500);
      onSelectCallBackText = await onSelectCallBack.getText();
      await CommonFunc.sleep(500);
      expect(onSelectCallBackText).assertContain('onSelectCallBack');
      let setCaretOffset_begin = await driver.findComponent(ON.id('setCaretOffset_begin'))
      await setCaretOffset_begin?.click();
      await CommonFunc.sleep(500);
      await set1?.click();
      await CommonFunc.sleep(500);
      driver.triggerKey(KeyCode.KEYCODE_DPAD_LEFT);
      await CommonFunc.sleep(500);
      driver.triggerKey(KeyCode.KEYCODE_DPAD_UP);
      await CommonFunc.sleep(500);
      onSelectCallBackText = await onSelectCallBack.getText();
      await CommonFunc.sleep(500);
      expect(onSelectCallBackText).assertContain('onSelectCallBack');
      done();
    });

  })
}


