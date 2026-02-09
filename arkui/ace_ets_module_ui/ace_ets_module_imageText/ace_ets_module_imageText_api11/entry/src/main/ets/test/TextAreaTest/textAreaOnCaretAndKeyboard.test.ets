/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import CommonFunc from '../../MainAbility/common/Common'
import { Driver, ON } from '@ohos.UiTest';

export default function textAreaOnCaretAndKeyboardTest() {
  describe('textAreaOnCaretAndKeyboardTest', () => {
    beforeAll(async () => {
      console.info("textAreaOnCaretAndKeyboardTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/textAreaOnCaretAndKeyboard',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textAreaOnCaretAndKeyboard state success " + JSON.stringify(pages));
        if (!("textAreaOnCaretAndKeyboard" == pages.name)) {
          console.info("get textArea state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push textAreaOnCaretAndKeyboard page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAreaOnCaretAndKeyboard page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textAreaOnCaretAndKeyboard after each called");
    });

    /**
     * @tc.name   textAreaOnCaretAndKeyboard001
     * @tc.number SUB_ACE_UI_TEAT_AREA_CARET_POSITION_0100
     * @tc.desc   input content and check caret position
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaOnCaretAndKeyboard001', Level.LEVEL1, async () => {
      console.info('textAreaOnCaretAndKeyboard001 START');
      let driver: Driver = Driver.create();
      let textAreaComponent = await driver.findComponent(ON.id('textAreaOnCaretAndKeyboard'));
      await textAreaComponent?.click();
      await CommonFunc.sleep(500);
	  await driver.triggerKey(2070);
	  await CommonFunc.sleep(1000);
      let buttonComponent = await driver.findComponent(ON.id('button'));
      await buttonComponent?.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('textAreaOnCaretAndKeyboard');
      await CommonFunc.sleep(300);
      console.info(`[textAreaOnCaretAndKeyboard001] strJson is:${strJson}`);
      let obj: ESObject = JSON.parse(strJson);
      await CommonFunc.sleep(500);
      expect(obj.$attrs.caretPosition).assertEqual('5');

      await textAreaComponent.inputText('hello world');
      await CommonFunc.sleep(500);
	  await driver.triggerKey(2070);
	  await CommonFunc.sleep(1000);
      await buttonComponent.click();
      await CommonFunc.sleep(500);
      let strJson2 = getInspectorByKey('textAreaOnCaretAndKeyboard');
      await CommonFunc.sleep(500);
      console.info(`[textAreaOnCaretAndKeyboard001] strJson2 is:${strJson2}`);
      let obj2: ESObject = JSON.parse(strJson2);
      await CommonFunc.sleep(500);
      expect(obj2.$attrs.caretPosition).assertEqual('8');
    });

    /**
     * @tc.name   textAreaOnCaretAndKeyboard002
     * @tc.number SUB_ACE_UI_TEAT_AREA_CARET_POSITION_0200
     * @tc.desc   set -1 and check caret position
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaOnCaretAndKeyboard002', Level.LEVEL1, async () => {
      console.info('textAreaOnCaretAndKeyboard002 START');
      let driver = Driver.create();
      let textAreaComponent = await driver.findComponent(ON.id('textAreaOnCaretAndKeyboard'));
      await textAreaComponent?.click();
      await CommonFunc.sleep(500);
	  await driver.triggerKey(2070);
	  await CommonFunc.sleep(1000);
      let buttonComponent = await driver.findComponent(ON.id('button_1'));
      await buttonComponent.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('textAreaOnCaretAndKeyboard');
      console.info(`[textAreaOnCaretAndKeyboard002] strJson is:${strJson}`);
      expect(JSON.parse(strJson).$attrs.caretPosition).assertEqual('0');
    });

  })
}