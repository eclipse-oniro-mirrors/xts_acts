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
import CommonFunc from '../../MainAbility/common/Common';
export default function RenderNodeAttributeTest() {
  describe('RenderNodeAttributeTest', function () {
    beforeEach(async function (done) {
      console.info("RenderNodeAttributeTest beforeEach start");
      let options : router.RouterOptions = {
        url: "MainAbility/pages/renderNode/RenderNodeAttribute",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RenderNodeAttributeTest state pages: " + JSON.stringify(pages));
        if (!("RenderNodeAttribute" == pages.name)) {
          console.info("get RenderNodeAttributeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info("push RenderNodeAttributeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RenderNodeAttributeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    api
     * @tc.name      RenderNodeAttributeTest_0100
     * @tc.desc      borderWidth_left
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('RenderNodeAttributeTest_0100', 0, async function (done) {
      console.info('RenderNodeAttributeTest_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RenderNodeAttribute_borderWidth_left');
      let obj = JSON.parse(strJson);
      console.info("[RenderNodeAttributeTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('8');
      console.info('[RenderNodeAttributeTest_0100] END');
      done();
    });

    /**
     * @tc.number    api
     * @tc.name      RenderNodeAttributeTest_0200
     * @tc.desc      borderWidth_top
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('RenderNodeAttributeTest_0200', 0, async function (done) {
      console.info('RenderNodeAttributeTest_0200 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RenderNodeAttribute_borderWidth_top');
      let obj = JSON.parse(strJson);
      console.info("[RenderNodeAttributeTest_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('8');
      console.info('[RenderNodeAttributeTest_0200] END');
      done();
    });

    /**
     * @tc.number    api
     * @tc.name      RenderNodeAttributeTest_0300
     * @tc.desc      borderWidth_bottom
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('RenderNodeAttributeTest_0300', 0, async function (done) {
      console.info('RenderNodeAttributeTest_0300 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RenderNodeAttribute_borderWidth_bottom');
      let obj = JSON.parse(strJson);
      console.info("[RenderNodeAttributeTest_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('8');
      console.info('[RenderNodeAttributeTest_0300] END');
      done();
    });

    /**
     * @tc.number    api
     * @tc.name      RenderNodeAttributeTest_0400
     * @tc.desc      borderWidth_right
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('RenderNodeAttributeTest_0400', 0, async function (done) {
      console.info('RenderNodeAttributeTest_0400 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RenderNodeAttribute_borderWidth_right');
      let obj = JSON.parse(strJson);
      console.info("[RenderNodeAttributeTest_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('8');
      console.info('[RenderNodeAttributeTest_0400] END');
      done();
    });

    /**
     * @tc.number    api
     * @tc.name      RenderNodeAttributeTest_0500
     * @tc.desc      borderColor_left
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('RenderNodeAttributeTest_0500', 0, async function (done) {
      console.info('RenderNodeAttributeTest_0500 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RenderNodeAttribute_borderColor_left');
      let obj = JSON.parse(strJson);
      console.info("[RenderNodeAttributeTest_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('true');
      console.info('[RenderNodeAttributeTest_0500] END');
      done();
    });

    /**
     * @tc.number    api
     * @tc.name      RenderNodeAttributeTest_0600
     * @tc.desc      borderColor_right
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('RenderNodeAttributeTest_0600', 0, async function (done) {
      console.info('RenderNodeAttributeTest_0600 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RenderNodeAttribute_borderColor_right');
      let obj = JSON.parse(strJson);
      console.info("[RenderNodeAttributeTest_0600] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('true');
      console.info('[RenderNodeAttributeTest_0600] END');
      done();
    });

    /**
     * @tc.number    api
     * @tc.name      RenderNodeAttributeTest_0700
     * @tc.desc      borderColor_top
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('RenderNodeAttributeTest_0700', 0, async function (done) {
      console.info('RenderNodeAttributeTest_0700 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RenderNodeAttribute_borderColor_top');
      let obj = JSON.parse(strJson);
      console.info("[RenderNodeAttributeTest_0700] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('true');
      console.info('[RenderNodeAttributeTest_0700] END');
      done();
    });

    /**
     * @tc.number    api
     * @tc.name      RenderNodeAttributeTest_0800
     * @tc.desc      borderColor_bottom
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('RenderNodeAttributeTest_0800', 0, async function (done) {
      console.info('RenderNodeAttributeTest_0800 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RenderNodeAttribute_borderColor_bottom');
      let obj = JSON.parse(strJson);
      console.info("[RenderNodeAttributeTest_0800] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('true');
      console.info('[RenderNodeAttributeTest_0800] END');
      done();
    });

    /**
     * @tc.number    api
     * @tc.name      RenderNodeAttributeTest_0900
     * @tc.desc      borderStyle_left
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('RenderNodeAttributeTest_0900', 0, async function (done) {
      console.info('RenderNodeAttributeTest_0900 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RenderNodeAttribute_borderStyle_left');
      let obj = JSON.parse(strJson);
      console.info("[RenderNodeAttributeTest_0900] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('0');
      console.info('[RenderNodeAttributeTest_0900] END');
      done();
    });

    /**
     * @tc.number    api
     * @tc.name      RenderNodeAttributeTest_1000
     * @tc.desc      borderStyle_right
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('RenderNodeAttributeTest_1000', 0, async function (done) {
      console.info('RenderNodeAttributeTest_1000 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RenderNodeAttribute_borderStyle_right');
      let obj = JSON.parse(strJson);
      console.info("[RenderNodeAttributeTest_1000] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('1');
      console.info('[RenderNodeAttributeTest_1000] END');
      done();
    });

    /**
     * @tc.number    api
     * @tc.name      RenderNodeAttributeTest_1100
     * @tc.desc      borderStyle_top
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('RenderNodeAttributeTest_1100', 0, async function (done) {
      console.info('RenderNodeAttributeTest_1100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RenderNodeAttribute_borderStyle_top');
      let obj = JSON.parse(strJson);
      console.info("[RenderNodeAttributeTest_1100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('2');
      console.info('[RenderNodeAttributeTest_1100] END');
      done();
    });

    /**
     * @tc.number    api
     * @tc.name      RenderNodeAttributeTest_1200
     * @tc.desc      borderStyle_bottom
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('RenderNodeAttributeTest_1200', 0, async function (done) {
      console.info('RenderNodeAttributeTest_1200 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RenderNodeAttribute_borderStyle_bottom');
      let obj = JSON.parse(strJson);
      console.info("[RenderNodeAttributeTest_1200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('0');
      console.info('[RenderNodeAttributeTest_1200] END');
      done();
    });

    /**
     * @tc.number    api
     * @tc.name      RenderNodeAttributeTest_1300
     * @tc.desc      borderRadius_topRight
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('RenderNodeAttributeTest_1300', 0, async function (done) {
      console.info('RenderNodeAttributeTest_1300 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RenderNodeAttribute_borderRadius_topRight');
      let obj = JSON.parse(strJson);
      console.info("[RenderNodeAttributeTest_1300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('32');
      console.info('[RenderNodeAttributeTest_1300] END');
      done();
    });

    /**
     * @tc.number    api
     * @tc.name      RenderNodeAttributeTest_1400
     * @tc.desc      borderRadius_topLeft
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('RenderNodeAttributeTest_1400', 0, async function (done) {
      console.info('RenderNodeAttributeTest_1400 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RenderNodeAttribute_borderRadius_topLeft');
      let obj = JSON.parse(strJson);
      console.info("[RenderNodeAttributeTest_1400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('32');
      console.info('[RenderNodeAttributeTest_1400] END');
      done();
    });

    /**
     * @tc.number    api
     * @tc.name      RenderNodeAttributeTest_1500
     * @tc.desc      borderRadius_bottomLeft
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('RenderNodeAttributeTest_1500', 0, async function (done) {
      console.info('RenderNodeAttributeTest_1500 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RenderNodeAttribute_borderRadius_bottomLeft');
      let obj = JSON.parse(strJson);
      console.info("[RenderNodeAttributeTest_1500] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('32');
      console.info('[RenderNodeAttributeTest_1500] END');
      done();
    });

    /**
     * @tc.number    api
     * @tc.name      RenderNodeAttributeTest_1600
     * @tc.desc      borderRadius_bottomRight
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('RenderNodeAttributeTest_1600', 0, async function (done) {
      console.info('RenderNodeAttributeTest_1600 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RenderNodeAttribute_borderRadius_bottomRight');
      let obj = JSON.parse(strJson);
      console.info("[RenderNodeAttributeTest_1600] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('32');
      console.info('[RenderNodeAttributeTest_1600] END');
      done();
    });
  })
}

