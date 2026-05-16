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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/common/Common';
export default function TextAreaTest() {
  describe('TextAreaTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextAreaTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/TextAreaAPI/TextArea",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaTest state pages: " + JSON.stringify(pages));
        if (!("TextArea" == pages.name)) {
          console.info("get TextAreaTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TextAreaTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   TextAreaTest_0100
     * @tc.number TextArea
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextAreaTest_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('TextAreaTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('TextArea_5'));
      await button.click();
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await button.inputText("hello")
      await CommonFunc.sleep(2000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TextArea_1');
      let obj: ESObject = JSON.parse(strJson);
      let strJson1 = getInspectorByKey('TextArea_2');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[TextAreaTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('onWillInsert');
      expect(obj1.$attrs.content).assertEqual('onDidInsert');
      console.info('[TextAreaTest_0100] END');
      done();
    });
    /**
     * @tc.name   TextAreaTest_0200
     * @tc.number TextArea
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextAreaTest_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('TextAreaTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('TextArea_6'));
      await button.click();
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await button.clearText()
      await CommonFunc.sleep(3000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TextArea_3');
      let obj: ESObject = JSON.parse(strJson);
      let strJson1 = getInspectorByKey('TextArea_4');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[TextAreaTest_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('onWillDelete');
      expect(obj1.$attrs.content).assertEqual('onDidDelete');
      console.info('[TextAreaTest_0200] END');
      done();
    });
  })
}

