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
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
export default function ComputedTest() {
  describe('ComputedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ComputedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Computed/computed',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ComputedTest state pages: " + JSON.stringify(pages));
        if (!("computed" == pages.name)) {
          console.info("get ComputedTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ComputedTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ComputedTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    Computed
     * @tc.name      ComputedTest_0100
     * @tc.desc      api
     * @tc.level:    Level 0
     * @tc.type :    FUNC
     * @tc.size :    MEDIUM
     */
    it('ComputedTest_0100', 0, async (done: Function) => {
      console.info('ComputedTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('computedButton4'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('computedText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ComputedTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('world: hello world 20');

      button = await driver.findComponent(ON.id('computedButton1'));
      await button.click();
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('computedText');
      obj = JSON.parse(strJson);
      console.info("[ComputedTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('world01: hello world01 20');

      strJson = getInspectorByKey('computedText1');
      obj = JSON.parse(strJson);
      console.info("[ComputedTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('hello world01 20 222');

      button = await driver.findComponent(ON.id('computedButton2'));
      await button.click();
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('computedText3');
      obj = JSON.parse(strJson);
      console.info("[ComputedTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('25');

      button = await driver.findComponent(ON.id('computedButton3'));
      await button.click();
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('computedText2');
      obj = JSON.parse(strJson);
      console.info("[ComputedTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Tom1');

      strJson = getInspectorByKey('computedText3');
      obj = JSON.parse(strJson);
      console.info("[ComputedTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('250');

      console.info('[ComputedTest_0100] END');
      done();
    });
  })
}

