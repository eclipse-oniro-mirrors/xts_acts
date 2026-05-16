/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

export default function CircleStrokeColorMetricsTest() {
  describe('CircleStrokeColorMetricsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("CircleStrokeColorMetricsTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Circle/CircleStrokeColorMetrics",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CircleStrokeColorMetrics state pages: " + JSON.stringify(pages));
        if (!("CircleStrokeColorMetrics" == pages.name)) {
          console.info("get CircleStrokeColorMetrics state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push CircleStrokeColorMetrics success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CircleStrokeColorMetrics page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   CircleStrokeColorMetricsTest_0100
     * @tc.number SUB_ARKUI_API_CircleStrokeColorMetricsTest_0100
     * @tc.desc   CanvasAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CircleStrokeColorMetricsTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[CircleStrokeColorMetricsTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id('ChangeCircleColorRed'));
      await button1.click();
      await Utils.sleep(2000)
      let button2 = await driver.findComponent(ON.id('ChangeCircleColorGreen'));
      await button2.click();
      await Utils.sleep(2000)
      let button3 = await driver.findComponent(ON.id('ChangeCircleColorBlue'));
      await button3.click();
      await Utils.sleep(2000)
      let button4 = await driver.findComponent(ON.id('ChangeCircleColorWhite'));
      await button4.click();
      await Utils.sleep(2000)  
      let button5 = await driver.findComponent(ON.id('ChangeCircleColorReduce'));
      await button5.click();
      await Utils.sleep(2000) 
      let button6 = await driver.findComponent(ON.id('ChangeCircleColorAdd'));
      await button6.click();
      await Utils.sleep(2000)

      let strJson1: string = getInspectorByKey('CircleStrokeColorMetrics1')
      expect(JSON.parse(strJson1).$type).assertEqual('Circle') 
      let strJson2: string = getInspectorByKey('CircleStrokeColorMetrics2')
      expect(JSON.parse(strJson2).$type).assertEqual('Circle') 
     
      console.info('[CanvasGradientCreateHDRColorTest_0100] END');
      done();
    });
  })
}

