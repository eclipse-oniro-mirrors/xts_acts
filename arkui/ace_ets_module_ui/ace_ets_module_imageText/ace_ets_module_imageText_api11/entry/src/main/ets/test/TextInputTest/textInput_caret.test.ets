/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component,MouseButton, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function textInput_caret() {
  describe('textInput_caret', () => {
    beforeEach(async (done: Function) => {
      console.info("textInput_caret beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/textInput_caret',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInput_caret state pages: " + JSON.stringify(pages));
        if (!("search_caret" == pages.name)) {
          console.info("get textInput_caret state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push textInput_caret page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textInput_caret page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
      * @tc.number: SUB_ACE_UI_TEXT_NEWINTERFACE_0320
      * @tc.name  : textInput_caret_001
      * @tc.desc  : Use mouse click to get CaretOffset
      * @tc.level : Level 3
      */
    it('textInput_caret_001', Level.LEVEL3, async (done: Function) => {

      console.info('[textInput_caret_001] START');
      let driver = Driver.create();
      await driver.mouseClick({x:300, y:200}, MouseButton.MOUSE_BUTTON_LEFT);
      console.info('mouse click success');
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
	  await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('inputGetCaret'));
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('textInput_caret_001 click success');
      let strJson1 = getInspectorByKey('inputCaretText');
      let obj1: ESObject = JSON.parse(strJson1);
      expect(obj1.$attrs.content).assertEqual('5');

      console.info('[textInput_caret_001] END');
      done();
    });
  })
}
