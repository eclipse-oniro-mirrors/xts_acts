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

export default function RichEditorOnSelectionChange018() {
  describe('RichEditorOnSelectionChange018', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorOnSelectionChange018 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorOnSelectionChange/RichEditorOnSelectionChange018',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorOnSelectionChange018 state pages: " + JSON.stringify(pages));
        if (!("RichEditorOnSelectionChange018" == pages.name)) {
          console.info("get RichEditorOnSelectionChange018 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorOnSelectionChange018 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorOnSelectionChange018 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONSELECTIONCHANGE_0160
     * @tc.name  : Test the RichEditor OnSelectionChange
     * @tc.desc  : Test RichEditor OnSelection Change by selecting and replacing certain content
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONSELECTIONCHANGE_0160',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONSELECTIONCHANGE_0160 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('rich_struct'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      let select = await driver.findComponent(ON.id('select'));
      await select.click();
      await CommonFunc.sleep(1000);

      driver.triggerKey(KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);

      driver.triggerKey(KeyCode.KEYCODE_B);
      await CommonFunc.sleep(500);

      let message = await driver.findComponent(ON.id('message'));
      let messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertEqual('message:{"start":4,"end":4}');

      let onSelectCallBack = await driver.findComponent(ON.id('onSelectCallBack'));
      let onSelectCallBackText = await onSelectCallBack.getText();
      await CommonFunc.sleep(500);
      expect(onSelectCallBackText).assertEqual('onSelectCallBack:true');

      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONSELECTIONCHANGE_0120
     * @tc.name  : Test the RichEditor OnSelectionChange
     * @tc.desc  : After highlighting the controller, click on another position in the text to turn the controller into a cursor to test RichEditor OnSelectionChange
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONSELECTIONCHANGE_0120',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONSELECTIONCHANGE_0120 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('rich_struct'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      let select = await driver.findComponent(ON.id('select'));
      await select.click();
      await CommonFunc.sleep(1000);

      let message = await driver.findComponent(ON.id('message'));
      let messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertEqual('message:{"start":2,"end":4}');

      let onSelectCallBack = await driver.findComponent(ON.id('onSelectCallBack'));
      let onSelectCallBackText = await onSelectCallBack.getText();
      await CommonFunc.sleep(500);
      expect(onSelectCallBackText).assertEqual('onSelectCallBack:true');

      let setCaretOffset = await driver.findComponent(ON.id('setCaretOffset'));
      await setCaretOffset.click();
      await CommonFunc.sleep(1000);

      messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertEqual('message:{"start":1,"end":1}');

      done();
    });

  })
}


