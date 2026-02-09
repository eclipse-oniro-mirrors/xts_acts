/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function OnTextSelectionChangeTest() {
  describe('OnTextSelectionChangeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("OnTextSelectionChangeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/onTextSelectionChange',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OnTextSelectionChangeTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("onTextSelectionChange" == pages.name)) {
          console.info("get OnTextSelectionChangeTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push OnTextSelectionChangeTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OnTextSelectionChangeTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("OnTextSelectionChangeTest after each called");
    });

    /**
     * @tc.name   OnTextSelectionChangeTest_0010
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_ONTEXTSELECTIONCHANGE_0010
     * @tc.desc   test Text OnTextSelectionChange: Mouse box selection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OnTextSelectionChangeTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[OnTextSelectionChangeTest_0010] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let textRect = CommonFunc.getComponentRectOnScreen('OnTextSelectionChange_text');
      let clickX1 = Math.round(textRect.left + 2)
      let clickX2 = Math.round(textRect.right - 2)
      let clickX3 = Math.round(textRect.right + 10)
      let clickY = Math.round((textRect.bottom + textRect.top)/2)
      await driver.mouseDrag({ x: clickX1, y: clickY },{ x: clickX2, y: clickY }, 600);
      await CommonFunc.sleep(1000);
      console.info('[OnTextSelectionChangeTest_0010] get1: ' + AppStorage.get('OnTextSelectionChange'));
      expect(AppStorage.get('OnTextSelectionChange')).assertEqual('start:0,end:11');
      await driver.mouseClick({ x: clickX3, y: clickY }, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(1000);
      console.info('[OnTextSelectionChangeTest_0010] get2: ' + AppStorage.get('OnTextSelectionChange'));
      expect(AppStorage.get('OnTextSelectionChange')).assertEqual('start:-1,end:-1');
      console.info("[OnTextSelectionChangeTest_0010] END");
      done();
    });

    /**
     * @tc.name   OnTextSelectionChangeTest_0020
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_ONTEXTSELECTIONCHANGE_0020
     * @tc.desc   test Text OnTextSelectionChange: Press shift and arrow keys to select
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OnTextSelectionChangeTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[OnTextSelectionChangeTest_0020] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      // 点击tab键(2049),Text控件获焦
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      // 点击shift键(2047)+向右方向键(2015)
      await driver.triggerCombineKeys(2047, 2015);
      await driver.triggerCombineKeys(2047, 2015);
      await driver.triggerCombineKeys(2047, 2015);
      await driver.triggerCombineKeys(2047, 2015);
      await CommonFunc.sleep(500);
      console.info('[OnTextSelectionChangeTest_0020] get1: ' + AppStorage.get('OnTextSelectionChange'));
      expect(AppStorage.get('OnTextSelectionChange')).assertEqual('start:3,end:11');
      let textRect = CommonFunc.getComponentRectOnScreen('OnTextSelectionChange_text');
      let clickX = Math.round((textRect.left + textRect.right)/2)
      let clickY = Math.round(textRect.bottom - 10)
      // 鼠标左键点击文本外，文本取消选中
      await driver.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(1000);
      console.info('[OnTextSelectionChangeTest_0020] get2: ' + AppStorage.get('OnTextSelectionChange'));
      expect(AppStorage.get('OnTextSelectionChange')).assertEqual('start:-1,end:-1');
      console.info("[OnTextSelectionChangeTest_0020] END");
      done();
    });

    /**
     * @tc.name   OnTextSelectionChangeTest_0030
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_ONTEXTSELECTIONCHANGE_0030
     * @tc.desc   test Text OnTextSelectionChange: Shortcut key shift and mouse selection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OnTextSelectionChangeTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[OnTextSelectionChangeTest_0030] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      console.info('[OnTextSelectionChangeTest_0030] get1: ' + AppStorage.get('OnTextSelectionChange'));
      expect(AppStorage.get('OnTextSelectionChange')).assertEqual('start:3,end:8');
      let textRect = CommonFunc.getComponentRectOnScreen('OnTextSelectionChange_text');
      let clickX = Math.round(textRect.right + 10)
      let clickY = Math.round((textRect.bottom + textRect.top)/2)
      await driver.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(1000);
      console.info('[OnTextSelectionChangeTest_0030] get2: ' +
      AppStorage.get('OnTextSelectionChange'));
      expect(AppStorage.get('OnTextSelectionChange')).assertEqual('start:-1,end:-1');
      console.info("[OnTextSelectionChangeTest_0030] END");
      done();
    });
  })
}