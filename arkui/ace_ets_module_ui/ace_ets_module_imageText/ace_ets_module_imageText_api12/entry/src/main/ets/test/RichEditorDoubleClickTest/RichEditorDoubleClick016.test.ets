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


export default function RichEditorDoubleClick016() {
  describe('RichEditorDoubleClick016', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorDoubleClick/RichEditorDoubleClick016',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorDoubleClick016 state pages: " + JSON.stringify(pages));
        if (!("RichEditorDoubleClick016" == pages.name)) {
          console.info("get RichEditorDoubleClick016 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(1500);
          console.info("push RichEditorDoubleClick016 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorDoubleClick016 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_025
     * @tc.name  : Test the RichEditor doubleClick event
     * @tc.desc  : Test the RichEditor doubleClick event by switching to portrait mode and double clicking with the mouse to select it
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_025', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_025 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorDoubleClick016'));
      await CommonFunc.sleep(500);
      let pointCenter = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(100);
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);
      let message = await driver.findComponent(ON.id('message'));
      let messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      // 点击复制避免changeOrientation被遮挡
      let copy = await driver.findComponent(ON.text('复制'));
      await copy?.click();
      await CommonFunc.sleep(500);
      let changeOrientation = await driver.findComponent(ON.id('changeOrientation'));
      await changeOrientation.click();
      await CommonFunc.sleep(1500);
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(100);
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);
      messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      // 点击复制避免changeOrientation被遮挡
      let copy1 = await driver.findComponent(ON.text('复制'));
      await copy1?.click();
      await CommonFunc.sleep(500);
      await changeOrientation.click();
      await CommonFunc.sleep(1500);
      done();
    });

  })
}


