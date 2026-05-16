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


export default function RichEditorDoubleClick017() {
  describe('RichEditorDoubleClick017', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorDoubleClick/RichEditorDoubleClick017',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorDoubleClick017 state pages: " + JSON.stringify(pages));
        if (!("RichEditorDoubleClick017" == pages.name)) {
          console.info("get RichEditorDoubleClick017 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorDoubleClick017 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorDoubleClick017 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_024
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_024
     * @tc.desc   Double click AI recognition test using mouse gesture analogy: address, three word word, phone number to test RichEditor doubleClick event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_024',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_024 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorDoubleClick017'));
      let getBounds = await rich.getBounds();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 30, getBounds.top + 20);
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 110, getBounds.top + 20);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 110, getBounds.top + 20);
      await CommonFunc.sleep(500);
      let endPosition = await driver.findComponent(ON.id('endPosition'));
      let endPositionText = await endPosition.getText();
      await CommonFunc.sleep(500);
      expect(endPositionText).assertLarger(-1);
      await driver.click(getBounds.left + 40, getBounds.top + 46);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 40, getBounds.top + 46);
      await CommonFunc.sleep(500);
      endPositionText = await endPosition.getText();
      await CommonFunc.sleep(500);
      expect(endPositionText).assertLarger(-1);
      await driver.click(getBounds.left + 40, getBounds.top + 70);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 40, getBounds.top + 70);
      await CommonFunc.sleep(100);
      endPositionText = await endPosition.getText();
      await CommonFunc.sleep(500);
      expect(endPositionText).assertLarger(-1);
      done();
    });

  })
}


