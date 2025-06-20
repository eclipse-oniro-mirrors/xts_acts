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


export default function RichEditorThreeStrikes004() {
  describe('RichEditorThreeStrikes004', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorThreeStrikes/RichEditorThreeStrikes004',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorThreeStrikes004 state pages: " + JSON.stringify(pages));
        if (!("RichEditorThreeStrikes004" == pages.name)) {
          console.info("get RichEditorThreeStrikes004 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorThreeStrikes004 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorThreeStrikes004 page error: " + err);
        expect().assertFail();
      }
      done();
    });


    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_0011
     * @tc.name  : Test the RichEditor ThreeStrikes
     * @tc.desc  : Three mouse clicks to test RichEditor ThreeStripes
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_0011', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_0011 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorThreeStrikes004'));
      let getBounds = await rich.getBounds();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 40, getBounds.top + 30);
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 60, getBounds.top + 30);
      await CommonFunc.sleep(80);
      await driver.click(getBounds.left + 60, getBounds.top + 30);
      await CommonFunc.sleep(80);
      await driver.click(getBounds.left + 60, getBounds.top + 30);
      await CommonFunc.sleep(80);
      let message = await driver.findComponent(ON.id('message'));
      let messageText = await message.getText();
      await CommonFunc.sleep(1000);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_0012
     * @tc.name  : Test the RichEditor ThreeStrikes
     * @tc.desc  : Four hits to test RichEditor ThreeStripes
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 4
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_0012', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_0012 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorThreeStrikes004'));
      let getBounds = await rich.getBounds();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 90, getBounds.top + 30);
      await CommonFunc.sleep(1000);
      await driver.click(getBounds.left + 150, getBounds.top + 30);
      await CommonFunc.sleep(80);
      await driver.click(getBounds.left + 150, getBounds.top + 30);
      await CommonFunc.sleep(80);
      await driver.click(getBounds.left + 150, getBounds.top + 30);
      await CommonFunc.sleep(80);
      await driver.click(getBounds.left + 150, getBounds.top + 30);
      await CommonFunc.sleep(1000);
      let copy = await driver.findComponent(ON.text('复制'));
      if(copy){
        await copy.click();
      }
      await CommonFunc.sleep(1000);
      let message = await driver.findComponent(ON.id('message'));
      let messageText = await message.getText();
      await CommonFunc.sleep(1000);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      done();
    });

  })
}


