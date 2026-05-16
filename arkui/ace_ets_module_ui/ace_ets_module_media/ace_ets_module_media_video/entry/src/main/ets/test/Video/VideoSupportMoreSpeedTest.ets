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
 
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function VideoSupportMoreSpeedTest() {
  describe('VideoSupportMoreSpeedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("VideoSupportMoreSpeedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Video/VideoSupportMoreSpeed",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get VideoSupportMoreSpeed state pages: " + JSON.stringify(pages));
        if (!("VideoSupportMoreSpeed" == pages.name)) {
          console.info("get VideoSupportMoreSpeed state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push VideoSupportMoreSpeed success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push VideoSupportMoreSpeed page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   VideoSupportMoreSpeedTest_0100
     * @tc.number SUB_ARKUI_API_VideoSupportMoreSpeedTest_0100
     * @tc.desc   VideoAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VideoSupportMoreSpeedTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[VideoSupportMoreSpeedTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('VideoSupportMoreSpeedStart'));
      await button.click();
      await Utils.sleep(1000)

      let button1 = await driver.findComponent(ON.id('VideoSupportMoreSpeed_p_0.5'));
      await button1.click();
      await Utils.sleep(1000)
      let strJson1 = getInspectorByKey('VideoSupportMoreSpeedText');

      let button2 = await driver.findComponent(ON.id('VideoSupportMoreSpeed_p_1.5'));
      await button2.click();
      await Utils.sleep(1000)
      let strJson2 = getInspectorByKey('VideoSupportMoreSpeedText');

      let button3 = await driver.findComponent(ON.id('VideoSupportMoreSpeed_p_3'));
      await button3.click();
      await Utils.sleep(1000)
      let strJson3 = getInspectorByKey('VideoSupportMoreSpeedText');

      let button4 = await driver.findComponent(ON.id('VideoSupportMoreSpeed_p_0.25'));
      await button4.click();
      await Utils.sleep(1000)
      let strJson4 = getInspectorByKey('VideoSupportMoreSpeedText');

      let button5 = await driver.findComponent(ON.id('VideoSupportMoreSpeed_p_0.125'));
      await button5.click();
      await Utils.sleep(1000)
      let strJson5 = getInspectorByKey('VideoSupportMoreSpeedText');

      let button6 = await driver.findComponent(ON.id('VideoSupportMoreSpeed_n_0.5'));
      await button6.click();
      await Utils.sleep(1000)
      let strJson6 = getInspectorByKey('VideoSupportMoreSpeedText');

      let button7 = await driver.findComponent(ON.id('VideoSupportMoreSpeed_n_1.5'));
      await button7.click();
      await Utils.sleep(1000)
      let strJson7 = getInspectorByKey('VideoSupportMoreSpeedText');

      let button8 = await driver.findComponent(ON.id('VideoSupportMoreSpeed_n_3'));
      await button8.click();
      await Utils.sleep(1000)
      let strJson8 = getInspectorByKey('VideoSupportMoreSpeedText');

      let button9 = await driver.findComponent(ON.id('VideoSupportMoreSpeed_n_0.25'));
      await button9.click();
      await Utils.sleep(1000)
      let strJson9 = getInspectorByKey('VideoSupportMoreSpeedText');

      let button10 = await driver.findComponent(ON.id('VideoSupportMoreSpeed_n_0.125'));
      await button10.click();
      await Utils.sleep(1000)
      let strJson10 = getInspectorByKey('VideoSupportMoreSpeedText');

      let button11 = await driver.findComponent(ON.id('VideoSupportMoreSpeed_s_0.5'));
      await button11.click();
      await Utils.sleep(1000)
      let strJson11 = getInspectorByKey('VideoSupportMoreSpeedText');

      let button12 = await driver.findComponent(ON.id('VideoSupportMoreSpeed_s_1.5'));
      await button12.click();
      await Utils.sleep(1000)
      let strJson12 = getInspectorByKey('VideoSupportMoreSpeedText');

      let button13 = await driver.findComponent(ON.id('VideoSupportMoreSpeed_s_3'));
      await button13.click();
      await Utils.sleep(1000)
      let strJson13 = getInspectorByKey('VideoSupportMoreSpeedText');

      let button14 = await driver.findComponent(ON.id('VideoSupportMoreSpeed_s_0.25'));
      await button14.click();
      await Utils.sleep(1000)
      let strJson14 = getInspectorByKey('VideoSupportMoreSpeedText');

      let button15 = await driver.findComponent(ON.id('VideoSupportMoreSpeed_s_0.125'));
      await button15.click();
      await Utils.sleep(1000)
      let strJson15 = getInspectorByKey('VideoSupportMoreSpeedText');

      expect(JSON.parse(strJson1).$attrs.content).assertEqual('0.50');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('1.50');
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('3.00');
      expect(JSON.parse(strJson4).$attrs.content).assertEqual('0.25');
      expect(JSON.parse(strJson5).$attrs.content).assertEqual('0.125');
      expect(JSON.parse(strJson6).$attrs.content).assertEqual('0.5');
      expect(JSON.parse(strJson7).$attrs.content).assertEqual('1.5');
      expect(JSON.parse(strJson8).$attrs.content).assertEqual('3');
      expect(JSON.parse(strJson9).$attrs.content).assertEqual('0.25');
      expect(JSON.parse(strJson10).$attrs.content).assertEqual('0.125');
      expect(JSON.parse(strJson11).$attrs.content).assertEqual('0.5');
      expect(JSON.parse(strJson12).$attrs.content).assertEqual('1.5');
      expect(JSON.parse(strJson13).$attrs.content).assertEqual('3');
      expect(JSON.parse(strJson14).$attrs.content).assertEqual('0.25');
      expect(JSON.parse(strJson15).$attrs.content).assertEqual('0.125');

      console.info('[VideoSupportMoreSpeedTest_0100] END');
      done();
    });
  })
}
