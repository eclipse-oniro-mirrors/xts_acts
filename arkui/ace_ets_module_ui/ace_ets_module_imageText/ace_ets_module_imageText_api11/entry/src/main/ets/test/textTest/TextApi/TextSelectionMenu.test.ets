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
import router from '@ohos.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import { Driver, ON ,MouseButton} from '@ohos.UiTest';
import CommonFunc from "../../../MainAbility/common/Common";

export default function TextSelectionMenu() {
  describe('TextSelectionMenu', () => {
    beforeEach(async (done: Function) => {
      console.info("TextSelectionMenu beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/TextApi/TextSelectionMenu',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextSelectionMenu state success " + JSON.stringify(pages));
        if (!("TextSelectionMenu" == pages.name)) {
          console.info("get TextSelectionMenu state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TextSelectionMenu page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextSelectionMenu page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextSelectionMenu after each called");
    });

    /*
       * @tc.number      TextSelectionMenu_001
       * @tc.name        TextSelectionMenu_001
       * @tc.desc        TextSelectionMenu RichEditorResponseType test
       * @tc.level       Level 2
       */
    it('TextSelectionMenu_001', 0, async (done: Function) => {
      console.info('[TextSelectionMenu_001] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text3 = CommonFunc.getComponentRectOnScreen('Text_bindSelectionMenu_test')
      let x: number = Math.floor(((text3.right-text3.left)*0.5+text3.left))
      let y: number = Math.floor(((text3.bottom-text3.top)*0.5+text3.top))
      await driver.mouseClick({ x: x, y: y}, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('textApi_text1_test');
      let obj: ESObject = JSON.parse(strJson);
      await CommonFunc.sleep(1000);
      console.info("[TextSelectionMenu_001] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('TextResponseType.RIGHT_CLICK');
      console.info('[TextSelectionMenu_001] END');
      done();

    });


    /*
    * @tc.number      TextSelectionMenu_002
    * @tc.name        TextSelectionMenu_002
    * @tc.desc        TextSelectionMenu RichEditorResponseType test
    * @tc.level       Level 2
    */
    it('TextSelectionMenu_002', 0, async (done: Function) => {
      console.info('[TextSelectionMenu_002] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let test4 = CommonFunc.getComponentRectOnScreen('text_TextResponseType')
      let x: number = Math.floor((test4.right-test4.left)*0.2+test4.left)
      let y: number = Math.floor((test4.bottom-test4.top)*0.5+test4.top)
      await driver.longClick(x, y)
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('textApi_text2');
      let obj: ESObject = JSON.parse(strJson);
      await CommonFunc.sleep(1000);
      console.info("[TextSelectionMenu_002] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('TextResponseType.LONG_PRESS');

      console.info('[TextSelectionMenu_002] END');
      done();

    });
  })
}


