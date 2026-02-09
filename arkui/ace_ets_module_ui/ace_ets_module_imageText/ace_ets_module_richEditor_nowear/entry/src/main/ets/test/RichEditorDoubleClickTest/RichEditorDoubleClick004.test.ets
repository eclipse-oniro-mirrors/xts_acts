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


export default function RichEditorDoubleClick004() {
  describe('RichEditorDoubleClick004', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorDoubleClick/RichEditorDoubleClick004',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorDoubleClick004 state pages: " + JSON.stringify(pages));
        if (!("RichEditorDoubleClick004" == pages.name)) {
          console.info("get RichEditorDoubleClick004 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorDoubleClick004 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorDoubleClick004 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_004
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_004
     * @tc.desc   Test the RichEditor doubleClick event by double clicking the imagespan displayed on one line
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_004',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_004 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorDoubleClick004'));
      let getBounds = await rich.getBounds();
      let pointCenter = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 10, getBounds.top + 20);
      await CommonFunc.sleep(500);
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(100);
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);
      let message = await driver.findComponent(ON.id('message'));
      let messageText = await message.getText();
      await CommonFunc.sleep(1000);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(100);
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);
      messageText = await message.getText();
      await CommonFunc.sleep(1000);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      done();
    });
    
  })
}


