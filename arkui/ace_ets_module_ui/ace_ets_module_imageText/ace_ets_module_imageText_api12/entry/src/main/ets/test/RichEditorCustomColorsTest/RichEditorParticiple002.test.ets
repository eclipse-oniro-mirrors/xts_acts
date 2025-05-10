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


export default function RichEditorParticiple002() {
  describe('RichEditorParticiple002', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorCustomColors/RichEditorParticiple002',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorParticiple002 state pages: " + JSON.stringify(pages));
        if (!("RichEditorParticiple002" == pages.name)) {
          console.info("get RichEditorParticiple002 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorParticiple002 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorParticiple002 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.number: SUB_ACE_UI_AI_PARTICIPLE_0060
     * @tc.name  : Test the RichEditor content Click the result
     * @tc.desc  : Set the RichEditor hybrid text and click text to test the RichEditor content click the result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_AI_PARTICIPLE_0060', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_AI_PARTICIPLE_0060 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorParticiple002'));
      let getBounds = await rich.getBounds();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 70, getBounds.top + 30);
      await CommonFunc.sleep(100);
      let message = await driver.findComponent(ON.id('message'));
      let messageText = await message.getText();
      await CommonFunc.sleep(1000);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      await driver.click(getBounds.left + 78, getBounds.top + 30);
      await CommonFunc.sleep(100);
      messageText = await message.getText();
      await CommonFunc.sleep(1000);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      done();
    });
    
  })
}


