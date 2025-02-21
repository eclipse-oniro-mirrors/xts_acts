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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from "../../../MainAbility/common/Common";

export default function RichEditorTest() {
  describe('RichEditorTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/RichEditor/RichEditor",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorTest state pages: " + JSON.stringify(pages));
        if (!("RichEditor" == pages.name)) {
          console.info("get RichEditorTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorTest page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
       * @tc.number: SUB_ACE_ArkUI_RichEditorTest_001
       * @tc.name  : RichEditorTest_001
       * @tc.desc  : set TextAlign to Start
       * @tc.level : Level 2
       */
    it('RichEditorTest_001', 0, async (done: Function) => {

      console.info('[RichEditorTest_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('RichEditor_Start'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('RichEditor_get'));
      await button1.click();
      console.info("RichEditorTest_001 click success");
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RichEditor_text');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichEditorTest_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('Start');

      console.info('[RichEditorTest_001] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_ArkUI_RichEditorTest_002
      * @tc.name  : RichEditorTest_002
      * @tc.desc  : set TextAlign to End
      * @tc.level : Level 2
      */
    it('RichEditorTest_002', 0, async (done: Function) => {

      console.info('[RichEditorTest_002] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('RichEditor_End'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('RichEditor_get'));
      await button1.click();
      console.info("RichEditorTest_002 click success");
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RichEditor_text');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichEditorTest_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('End');

      console.info('[RichEditorTest_002] END');
      done();
    });

    /* *
     * @tc.number: SUB_ACE_ArkUI_RichEditorTest_003
     * @tc.name  : RichEditorTest_003
     * @tc.desc  : set TextAlign to Center
     * @tc.level : Level 2
     */
    it('RichEditorTest_003', 0, async (done: Function) => {

      console.info('[RichEditorTest_003] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('RichEditor_Center'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('RichEditor_get'));
      await button1.click();
      console.info("RichEditorTest_003 click success");
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RichEditor_text');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichEditorTest_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('Center');

      console.info('[RichEditorTest_003] END');
      done();
    });




  })
}
