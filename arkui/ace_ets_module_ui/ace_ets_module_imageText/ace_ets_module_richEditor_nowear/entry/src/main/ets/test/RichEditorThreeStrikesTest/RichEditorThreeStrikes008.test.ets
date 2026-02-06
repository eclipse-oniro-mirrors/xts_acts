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


export default function RichEditorThreeStrikes008() {
  describe('RichEditorThreeStrikes008', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorThreeStrikes/RichEditorThreeStrikes008',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorThreeStrikes008 state pages: " + JSON.stringify(pages));
        if (!("RichEditorThreeStrikes008" == pages.name)) {
          console.info("get RichEditorThreeStrikes008 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorThreeStrikes008 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorThreeStrikes008 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_0018
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_0018
     * @tc.desc   Three clicks on long text to test RichEditor ThreeStripes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_0018',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_0018 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorThreeStrikes008'));
      let getBounds = await rich.getBounds();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 90, getBounds.top + 20);
      await CommonFunc.sleep(1000);
      await driver.click(getBounds.left + 150, getBounds.top + 50);
      await CommonFunc.sleep(80);
      await driver.click(getBounds.left + 150, getBounds.top + 50);
      await CommonFunc.sleep(80);
      await driver.click(getBounds.left + 150, getBounds.top + 50);
      await CommonFunc.sleep(80);
      let message = await driver.findComponent(ON.id('message'));
      let messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      done();
    });

  })
}


