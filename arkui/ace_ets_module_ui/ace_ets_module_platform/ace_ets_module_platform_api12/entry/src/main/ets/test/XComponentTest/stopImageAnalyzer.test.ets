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


export default function stopImageAnalyzerJsunit() {
  describe('stopImageAnalyzerJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("stopImageAnalyzer beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/XComponent/stopImageAnalyzer",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stopImageAnalyzer state pages: " + JSON.stringify(pages));
        if (!("stopImageAnalyzer" == pages.name)) {
          console.info("get stopImageAnalyzer state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push stopImageAnalyzer success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stopImageAnalyzer page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number startImageAnalyzerTest_0010
     * @tc.name startImageAnalyzerTest_0010
     * @tc.desc Xcomponent: get the api of startImageAnalyzer
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('startImageAnalyzerTest_0010', 0, async (done: Function) => {
      console.info('startImageAnalyzerTest_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('startImageAnalyzer_button'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('startImageAnalyzer_text');
      console.info("[startImageAnalyzerTest_0010] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('startImageAnalyzer succ');
      console.info('[startImageAnalyzerTest_0010] END');
      done();
    });

    /**
     * @tc.number stopImageAnalyzerTest_0020
     * @tc.name stopImageAnalyzerTest_0020
     * @tc.desc Xcomponent: get the api of stopImageAnalyzer
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('stopImageAnalyzerTest_0020', 0, async (done: Function) => {
      console.info('stopImageAnalyzerTest_0020 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('startImageAnalyzer_button'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let button2 = await driver.findComponent(ON.id('stopImageAnalyzer_button'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stopImageAnalyzer_text');
      console.info("[stopImageAnalyzerTest_0020] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('stopImageAnalyzer succ');
      console.info('[stopImageAnalyzerTest_0020] END');
      done();
    });
  })
}

