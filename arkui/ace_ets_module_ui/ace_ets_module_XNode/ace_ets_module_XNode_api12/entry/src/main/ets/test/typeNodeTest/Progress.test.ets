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
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function typeNodeProgressTest() {
  describe('typeNodeProgressTest', function () {
    beforeEach(async function (done) {
      console.info("ProgressTest beforeEach start");
      let options = {
        uri: "MainAbility/pages/typeNode/Progress",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ProgressTest state pages: " + JSON.stringify(pages));
        if (!("Progress" == pages.name)) {
          console.info("get ProgressTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ProgressTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ProgressTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    ProgressTest_0100
     * @tc.name      ProgressTest_0100
     * @tc.desc      TypedFrameNode: Progress
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ProgressTest_0100', 0, async function (done) {
      console.info('ProgressTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('TypeNode_Progress'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TypeNode_Progress');
      let obj = JSON.parse(strJson);
      console.info("[ProgressTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('Progress');
      console.info('[ProgressTest_0100] END');
      done();
    });

    /**
     * @tc.number    initializeTest_0200
     * @tc.name      initializeTest_0200
     * @tc.desc      TypedFrameNode: initialize
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('initializeTest_0200', 0, async function (done) {
      console.info('initializeTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('TypeNode_initialize'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TypeNode_initialize');
      let obj = JSON.parse(strJson);
      console.info("[initializeTest_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('{"top":{"unit":1,"value":10},"right":{"unit":1,"value":10},"bottom":{"unit":1,"value":10},"left":{"unit":1,"value":10}}');
      console.info('[initializeTest_0200] END');
      done();
    });

    /**
     * @tc.number    attributeTest_0300
     * @tc.name      attributeTest_0300
     * @tc.desc      TypedFrameNode: attribute
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('attributeTest_0300', 0, async function (done) {
      console.info('attributeTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('TypeNode_attribute'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TypeNode_attribute');
      let obj = JSON.parse(strJson);
      console.info("[attributeTest_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('{"top":{"unit":1,"value":5},"right":{"unit":1,"value":5},"bottom":{"unit":1,"value":5},"left":{"unit":1,"value":5}}');
      console.info('[attributeTest_0300] END');
      done();
    });
  })
}

