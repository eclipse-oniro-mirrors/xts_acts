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


export default function RichEditorThreeStrikes002() {
  describe('RichEditorThreeStrikes002', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorThreeStrikes/RichEditorThreeStrikes002',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorThreeStrikes002 state pages: " + JSON.stringify(pages));
        if (!("RichEditorThreeStrikes002" == pages.name)) {
          console.info("get RichEditorThreeStrikes002 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorThreeStrikes002 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorThreeStrikes002 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_0005
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_0005
     * @tc.desc  : Include space characters, line breaks, Chinese English Japanese Korean combination text, emojis, imageSpan, builderSpan, symbolSpan three hits to test RichEditor ThreeStripes
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_0005',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_0005 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorThreeStrikes002'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);
      let builder = await driver.findComponent(ON.id('builder'));
      await builder.click();
      await CommonFunc.sleep(500);
      let addBuilder = await driver.findComponent(ON.id('addBuilder'));
      await addBuilder.click();
      await CommonFunc.sleep(500);
      let getBounds = await rich.getBounds();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 50, getBounds.top + 30);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 50, getBounds.top + 30);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 50, getBounds.top + 30);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 50, getBounds.top + 30);
      await CommonFunc.sleep(100);
      let message = await driver.findComponent(ON.id('message'));
      let messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      await driver.click(getBounds.left + 160, getBounds.top + 30);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 160, getBounds.top + 30);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 160, getBounds.top + 30);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 160, getBounds.top + 30);
      await CommonFunc.sleep(100);
      messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      await driver.click(getBounds.left + 45, getBounds.top + 90);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 45, getBounds.top + 90);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 45, getBounds.top + 90);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 45, getBounds.top + 90);
      await CommonFunc.sleep(100);
      messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      await driver.click(getBounds.left + 80, getBounds.top + 90);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 80, getBounds.top + 90);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 80, getBounds.top + 90);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 80, getBounds.top + 90);
      await CommonFunc.sleep(100);
      messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      await driver.click(getBounds.left + 150, getBounds.top + 90);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 150, getBounds.top + 90);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 150, getBounds.top + 90);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 150, getBounds.top + 90);
      await CommonFunc.sleep(100);
      messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      await driver.click(getBounds.left + 200, getBounds.top + 90);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 200, getBounds.top + 90);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 200, getBounds.top + 90);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 200, getBounds.top + 90);
      await CommonFunc.sleep(100);
      messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      done();
    });

  })
}

