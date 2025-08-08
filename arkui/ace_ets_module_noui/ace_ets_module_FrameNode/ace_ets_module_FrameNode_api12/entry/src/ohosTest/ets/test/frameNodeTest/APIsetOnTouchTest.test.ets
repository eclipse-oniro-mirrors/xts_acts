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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
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
export default function APIsetOnTouchTest() {
  describe('APIsetOnTouchTest', () => {
    beforeEach(async (done: Function) => {
      console.info("APIsetOnTouchTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/frameNode/APIsetOnTouch",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get APIsetOnTouchTest state pages: " + JSON.stringify(pages));
        if (!("APIsetOnTouch" == pages.name)) {
          console.info("get APIsetOnTouchTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push APIsetOnTouchTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APIsetOnTouchTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number frameNode
     * @tc.name APIsetOnTouchTest_0100
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */


    it('APIsetOnTouchTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('APIsetOnTouchTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('APIsetOnTouchText01'));
      await button1.longClick();
      await CommonFunc.sleep(2000);
      let button2 = await driver.findComponent(ON.id('APIsetOnTouchText02'));
      await button2.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('APIsetOnTouchText02');
      let obj:ESObject = JSON.parse(strJson);
      console.info("[APIsetOnTouchTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('setOnTouch');
      console.info('[APIsetOnTouchTest_0100] END');
      done();
    });
  })
}