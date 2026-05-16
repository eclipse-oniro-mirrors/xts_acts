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
import Utils from '../../MainAbility/common/Utils';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function StartImageAnalyzerErrorCodeTest() {
  describe('StartImageAnalyzerErrorCodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("StartImageAnalyzerErrorCodeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CanvasRenderingContext2D/StartImageAnalyzerErrorCode",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StartImageAnalyzerErrorCodeTest state pages: " + JSON.stringify(pages));
        if (!("StartImageAnalyzerErrorCodeTest" == pages.name)) {
          console.info("get StartImageAnalyzerErrorCodeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StartImageAnalyzerErrorCodeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StartImageAnalyzerErrorCodeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   StartImageAnalyzerErrorCodeTest_0100
     * @tc.number StartImageAnalyzerErrorCodeTest_0100
     * @tc.desc   Error Code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StartImageAnalyzerErrorCodeTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[StartImageAnalyzerErrorCodeTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id('EnableButton1'));
      await button1.click();
      await Utils.sleep(2000)
      let button2 = await driver.findComponent(ON.id('StartButton1'));
      await button2.click();
      await Utils.sleep(2000)
     
      let strJson1 = getInspectorByKey('TextErrorCode1');
      console.info("[StartImageAnalyzerErrorCodeTest_0100] StartImageAnalyzerErrorCode1 is: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));

      
      let button3 = await driver.findComponent(ON.id('FlagButton1'));
      await button3.click();
      await Utils.sleep(2000)
      let button4 = await driver.findComponent(ON.id('StartButton1'));
      await button4.click();
      await Utils.sleep(2000)  
      let button5 = await driver.findComponent(ON.id('StartButton1'));
      await button5.click();
      await Utils.sleep(2000) 
     
      let strJson2 = getInspectorByKey('TextErrorCode1');
      console.info("[StartImageAnalyzerErrorCodeTest_0100] StartImageAnalyzerErrorCode2 is: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('110001');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('110002');

   
      console.info('[StartImageAnalyzerErrorCodeTest_0100] END');
      done();
    });
  })
}

