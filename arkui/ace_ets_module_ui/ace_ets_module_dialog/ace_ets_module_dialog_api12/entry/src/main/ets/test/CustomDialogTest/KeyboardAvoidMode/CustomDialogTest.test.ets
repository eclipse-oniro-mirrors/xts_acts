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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/common/Common';
export default function CustomDialogTest() {
  describe('CustomDialogTest', () => {
    beforeEach(async (done: Function) => {
      console.info("CustomDialogTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CustomDialog/KeyboardAvoidMode/CustomDialog",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CustomDialogTest state pages: " + JSON.stringify(pages));
        if (!("CustomDialog" == pages.name)) {
          console.info("get CustomDialogTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push CustomDialogTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CustomDialogTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    CustomDialogTest_0100
     * @tc.name      CustomDialogTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('CustomDialogTest_0100', 0, async (done: Function) => {
      console.info('CustomDialogTest_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1: Component = await driver.findComponent(ON.id('btn1'));
      await CommonFunc.sleep(1000);
      await btn1.click();
      await CommonFunc.sleep(2000);
      let text1 = getInspectorByKey('text1');
      await CommonFunc.sleep(1000);
      console.info("[CustomDialogTest_0100] getText is: " + JSON.stringify(text1));
      expect(JSON.parse(text1).$attrs.content).assertEqual('0');
      console.info('[CustomDialogTest_0100] END');
      done();
    });

    /**
     * @tc.number    CustomDialogTest_0200
     * @tc.name      CustomDialogTest_0200
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('CustomDialogTest_0200', 0, async (done: Function) => {
      console.info('CustomDialogTest_0200 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn2: Component = await driver.findComponent(ON.id('btn2'));
      await CommonFunc.sleep(1000);
      await btn2.click();
      await CommonFunc.sleep(2000);
      let text2 = getInspectorByKey('text2');
      await CommonFunc.sleep(1000);
      console.info("[CustomDialogTest_0200] getText is: " + JSON.stringify(text2));
      expect(JSON.parse(text2).$attrs.content).assertEqual('1');
      console.info('[CustomDialogTest_0200] END');
      done();
    });
  })
}