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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function APINodeContentTest() {
  describe('APINodeContentTest', () => {
    beforeEach(async (done: Function) => {
      console.info("APINodeContentTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/FrameNode/APINodeContent",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get APINodeContentTest state pages: " + JSON.stringify(pages));
        if (!("APINodeContent" == pages.name)) {
          console.info("get APINodeContentTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push APINodeContentTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APINodeContentTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   APINodeContentTest_0100
     * @tc.number APINodeContentTest_0100
     * @tc.desc   frameNode: APINodeContent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('APINodeContentTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('APINodeContentTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('APINodeContent_Button_AddToSlot'));
      await button.click();
      await CommonFunc.sleep(2000);
      let button2 = await driver.findComponent(ON.id('APINodeContent_Button_get'));
      await button2.click();
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('APINodeContent_Text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[APINodeContentTest_0100] component obj is: ",obj, obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('1');
      console.info('[APINodeContentTest_0100] END');
      done();
    });

    /**
     * @tc.name   APINodeContentTest_0200
     * @tc.number APINodeContentTest_0200
     * @tc.desc   frameNode: APINodeContent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('APINodeContentTest_0200', Level.LEVEL2, async (done: Function) => {
      console.info('APINodeContentTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('APINodeContent_Button_RemoveBack'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('APINodeContent_Button_RemoveBack'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let button3 = await driver.findComponent(ON.id('APINodeContent_Button_RemoveBack'));
      await button3.click();
      await CommonFunc.sleep(1000);
      let button9 = await driver.findComponent(ON.id('APINodeContent_Button_get'));
      await button9.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('APINodeContent_Text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[APINodeContentTest_0200] component obj is: ",obj, obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('0');
      await CommonFunc.sleep(500);
      let button4 = await driver.findComponent(ON.id('APINodeContent_Button_AddToSlot'));
      await button4.click();
      await CommonFunc.sleep(1000);
      let button5 = await driver.findComponent(ON.id('APINodeContent_Button_AddToSlot'));
      await button5.click();
      await CommonFunc.sleep(1000);
      let button8 = await driver.findComponent(ON.id('APINodeContent_Button_get'));
      await button8.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('APINodeContent_Text');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[APINodeContentTest_0200] component obj is: ",obj2, obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('2');
      console.info('[APINodeContentTest_0200] END');
      done();
    });
  })
}

