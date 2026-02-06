/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, UIElementInfo} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ConsumeDefault0240() {
  describe('ConsumeDefault0240', () => {
    beforeEach(async (done: Function) => {
      console.info("ConsumeDefault0240 setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/consume/ConsumeDefault0240",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("ConsumeDefault0240" == pages.name)) {
          console.info("get ConsumeDefault0240 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ConsumeDefault0240 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ConsumeDefault0240 page error:" + err);
      }
      console.info("ConsumeDefault0240 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ConsumeDefault0240 after each called");
    });

    /**
     * @tc.number    ConsumeDefault0240_001
     * @tc.name      ConsumeDefault0240_001
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('ConsumeDefault0240_001', Level.LEVEL0, async (done: Function) => {
      console.info('[ConsumeDefault0240_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let text_1 = await (await driver.findComponent(ON.id('length01'))).getText();
      let text_2 = await (await driver.findComponent(ON.id('length02'))).getText();
      console.info("[ConsumeDefault0240_001] component text_1: " + text_1 + ",text_2:" + text_2);
      let text_3 = await (await driver.findComponent(ON.id('resourceColor01'))).getText();
      let text_4 = await (await driver.findComponent(ON.id('resourceColor02'))).getText();
      console.info("[ConsumeDefault0240_001] component text_3: " + text_3 + ",text_4:" + text_4);
      let text_5 = await (await driver.findComponent(ON.id('rescourStr01'))).getText();
      let text_6 = await (await driver.findComponent(ON.id('rescourStr02'))).getText();
      console.info("[ConsumeDefault0240_001] component text_5: " + text_5 + ",text_6:" + text_6);
      let text_7 = await (await driver.findComponent(ON.id('null01'))).getText();
      let text_8 = await (await driver.findComponent(ON.id('null02'))).getText();
      console.info("[ConsumeDefault0240_001] component text_7: " + text_7 + ",text_8:" + text_8);
      let text_9 = await (await driver.findComponent(ON.id('undefined01'))).getText();
      let text_10 = await (await driver.findComponent(ON.id('undefined02'))).getText();
      console.info("[ConsumeDefault0240_001] component text_9: " + text_9 + ",text_10:" + text_10);
      expect(text_1).assertEqual(text_2);
      expect(text_3).assertEqual(text_4);
      expect(text_5).assertEqual(text_6);
      expect(text_7).assertEqual(text_8);
      expect(text_9).assertEqual(text_10);
      await CommonFunc.sleep(1000);
      console.info('[ConsumeDefault0240_001] END');
      done();
    });
    /**
     * @tc.number    ConsumeDefault0240_002
     * @tc.name      ConsumeDefault0240_002
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('ConsumeDefault0240_002', Level.LEVEL0, async (done: Function) => {
      console.info('[ConsumeDefault0240_002] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let text_11 = await (await driver.findComponent(ON.id('enum01'))).getText();
      let text_12 = await (await driver.findComponent(ON.id('enum02'))).getText();
      console.info("[ConsumeDefault0240_002] component text_11: " + text_11 + ",text_12:" + text_12);
      let text_13 = await (await driver.findComponent(ON.id('object01'))).getText();
      let text_14 = await (await driver.findComponent(ON.id('object02'))).getText();
      console.info("[ConsumeDefault0240_002] component text_13: " + text_13 + ",text_14:" + text_14);
      let text_15 = await (await driver.findComponent(ON.id('class01'))).getText();
      let text_16 = await (await driver.findComponent(ON.id('class02'))).getText();
      console.info("[ConsumeDefault0240_002] component text_15: " + text_15 + ",text_16:" + text_16);
      let text_17 = await (await driver.findComponent(ON.id('string01'))).getText();
      let text_18 = await (await driver.findComponent(ON.id('string02'))).getText();
      console.info("[ConsumeDefault0240_002] component text_17: " + text_17 + ",text_18:" + text_18);
      let text_19 = await (await driver.findComponent(ON.id('number01'))).getText();
      let text_20 = await (await driver.findComponent(ON.id('number02'))).getText();
      console.info("[ConsumeDefault0240_002] component text_19: " + text_19 + ",text_20:" + text_20);
      let text_21 = await (await driver.findComponent(ON.id('boolean01'))).getText();
      let text_22 = await (await driver.findComponent(ON.id('boolean02'))).getText();
      console.info("[ConsumeDefault0240_002] component text_21: " + text_21 + ",text_22:" + text_22);
      let text_23 = await (await driver.findComponent(ON.id('interface01'))).getText();
      let text_24 = await (await driver.findComponent(ON.id('interface02'))).getText();
      console.info("[ConsumeDefault0240_002] component text_23: " + text_23 + ",text_24:" + text_24);
      let text_25 = await (await driver.findComponent(ON.id('numberArray01'))).getText();
      let text_26 = await (await driver.findComponent(ON.id('numberArray02'))).getText();
      console.info("[ConsumeDefault0240_002] component text_25: " + text_25 + ",text_26:" + text_26);
      let text_27 = await (await driver.findComponent(ON.id('objectArray01'))).getText();
      let text_28 = await (await driver.findComponent(ON.id('objectArray02'))).getText();
      console.info("[ConsumeDefault0240_002] component text_27: " + text_27 + ",text_28:" + text_28);
      expect(text_11).assertEqual(text_12);
      expect(text_13).assertEqual(text_14);
      expect(text_15).assertEqual(text_16);
      expect(text_17).assertEqual(text_18);
      expect(text_19).assertEqual(text_20);
      expect(text_21).assertEqual(text_22);
      expect(text_23).assertEqual(text_24);
      expect(text_25).assertEqual(text_26);
      expect(text_27).assertEqual(text_28);
      await CommonFunc.sleep(1000);
      console.info('[ConsumeDefault0240_002] END');
      done();
    });

    /**
     * @tc.number    ConsumeDefault0240_003
     * @tc.name      ConsumeDefault0240_003
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('ConsumeDefault0240_003', Level.LEVEL0, async (done: Function) => {
      console.info('[ConsumeDefault0240_003] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let text_31 = await (await driver.findComponent(ON.id('set01'))).getText();
      let text_32 = await (await driver.findComponent(ON.id('set02'))).getText();
      console.info("[ConsumeDefault0240_003] component text_31: " + text_31 + ",text_32:" + text_32);
      let text_33 = await (await driver.findComponent(ON.id('map01'))).getText();
      let text_34 = await (await driver.findComponent(ON.id('map02'))).getText();
      console.info("[ConsumeDefault0240_003] component text_33: " + text_33 + ",text_34:" + text_34);
      expect(text_31).assertEqual(text_32);
      expect(text_33).assertEqual(text_34);
      await CommonFunc.sleep(1000);
      console.info('[ConsumeDefault0240_003] END');
      done();
    });
  })
}