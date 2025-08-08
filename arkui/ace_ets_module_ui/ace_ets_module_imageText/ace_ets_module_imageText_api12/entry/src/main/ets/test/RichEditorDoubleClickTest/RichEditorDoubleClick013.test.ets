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
import { uiAppearance } from '@kit.ArkUI'
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


export default function RichEditorDoubleClick013() {
  describe('RichEditorDoubleClick013', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorDoubleClick/RichEditorDoubleClick013',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorDoubleClick013 state pages: " + JSON.stringify(pages));
        if (!("RichEditorDoubleClick013" == pages.name)) {
          console.info("get RichEditorDoubleClick013 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorDoubleClick013 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorDoubleClick013 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_018
     * @tc.name  : Test the RichEditor doubleClick event
     * @tc.desc  : After double clicking with the mouse to select, trigger the addTextCpan, setTypingStyle, or deleteSpam functions to test the RichEditor doubleClick event
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_018', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_018 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorDoubleClick013'));
      let getBounds = await rich.getBounds();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 50, getBounds.top + 20);
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 110, getBounds.top + 20);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 110, getBounds.top + 20);
      await CommonFunc.sleep(100);
      let message = await driver.findComponent(ON.id('message'));
      let messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      let addTextSpan = await driver.findComponent(ON.id('addTextSpan'));
      await addTextSpan.click();
      await CommonFunc.sleep(500);
      messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      await driver.click(getBounds.left + 110, getBounds.top + 20);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 110, getBounds.top + 20);
      await CommonFunc.sleep(100);
      messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      let setTypingStyle = await driver.findComponent(ON.id('setTypingStyle'));
      await setTypingStyle.click();
      await CommonFunc.sleep(500);
      messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      let deleteSpans = await driver.findComponent(ON.id('deleteSpans'));
      await deleteSpans.click();
      await CommonFunc.sleep(500);
      messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      done();
    });

  })
}


