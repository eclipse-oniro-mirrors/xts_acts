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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function CanvasParamsImageAnalyzerTest() {
  describe('CanvasParamsImageAnalyzerTest', () => {
    beforeEach(async (done: Function) => {
      console.info("CanvasParamsImageAnalyzerTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Canvas/CanvasParamsImageAnalyzerPage",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CanvasParamsImageAnalyzerTest state pages: " + JSON.stringify(pages));
        if (!("CanvasParamsImageAnalyzerTest" == pages.name)) {
          console.info("get CanvasParamsImageAnalyzerTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(1000);
          console.info("push CanvasParamsImageAnalyzerTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CanvasParamsImageAnalyzerTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   CanvasParamsImageAnalyzerTest_0100
     * @tc.number SUB_ARKUI_API_CanvasParamsImageAnalyzerTest_0100
     * @tc.desc   CanvasAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CanvasParamsImageAnalyzerTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('CanvasParamsImageAnalyzerTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('CanvasParamsImageAnalyzerPage_start'));
      await button.click();
      console.info('CanvasParamsImageAnalyzerTest_0100 start ImageAnalyzer');
      await CommonFunc.sleep(1000);

      button = await driver.findComponent(ON.id('CanvasParamsImageAnalyzerPage_stop'));
      await button.click();
      console.info('CanvasParamsImageAnalyzerTest_0100 stop ImageAnalyzer');
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('CanvasParamsImageAnalyzerPage_canvas');
      expect(JSON.parse(strJson).$type).assertEqual('Canvas');

      console.info('[CanvasParamsImageAnalyzerTest_0100] END');
      done();
    });
  })
}