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


export default function RichEditorDoubleClick001() {
  describe('RichEditorDoubleClick001', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorDoubleClick/RichEditorDoubleClick001',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorDoubleClick001 state pages: " + JSON.stringify(pages));
        if (!("RichEditorDoubleClick001" == pages.name)) {
          console.info("get RichEditorDoubleClick001 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorDoubleClick001 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorDoubleClick001 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_002
     * @tc.name  : Test the RichEditor doubleClick event
     * @tc.desc  : Test the RichEditor doubleClick event by double clicking on a textSpan with line breaks displayed on a single line
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_002', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_002 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorDoubleClick001'));
      let getBounds = await rich.getBounds();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 30, getBounds.top + 20);
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 65, getBounds.top + 30);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 65, getBounds.top + 30);
      await CommonFunc.sleep(100);
      let message = await driver.findComponent(ON.id('message'));
      let messageText = await message.getText();
      await CommonFunc.sleep(1000);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      await driver.click(getBounds.left + 30, getBounds.top + 70);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 30, getBounds.top + 70);
      await CommonFunc.sleep(100);
      messageText = await message.getText();
      await CommonFunc.sleep(1000);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      done();
    });
    
  })
}


