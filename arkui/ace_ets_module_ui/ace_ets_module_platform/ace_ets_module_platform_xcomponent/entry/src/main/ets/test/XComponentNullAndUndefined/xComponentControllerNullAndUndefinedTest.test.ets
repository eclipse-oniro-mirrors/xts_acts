/*
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON, Component } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function xComponentControllerNullAndUndefinedTest() {
  describe('xComponentControllerNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("xComponentControllerNullAndUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/XComponentNullAndUndefined/XComponentControllerNullAndUndefined'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get xComponentControllerNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("XComponentControllerNullAndUndefined" == pages.name)) {
          console.info("get xComponentControllerNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push xComponentControllerNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push xComponentControllerNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("xComponentControllerNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   setXComponentSurfaceSizeNull001
     * @tc.number SUB_ARKUI_XCOMPONENT_SETSURFACESIZE_PARAM_001
     * @tc.desc   Test setXComponentSurfaceSize with value null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setXComponentSurfaceSizeNull001', Level.LEVEL0, async () => {
      console.info('[setXComponentSurfaceSizeNull001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll: Component = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnSetSurfaceSizeNull'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[setXComponentSurfaceSizeNull001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('setSurfaceSize null');
      console.info('[setXComponentSurfaceSizeNull001] END');
    });

    /**
     * @tc.name   setXComponentSurfaceSizeUndefined002
     * @tc.number SUB_ARKUI_XCOMPONENT_SETSURFACESIZE_PARAM_002
     * @tc.desc   Test setXComponentSurfaceSize with value undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setXComponentSurfaceSizeUndefined002', Level.LEVEL0, async () => {
      console.info('[setXComponentSurfaceSizeUndefined002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll: Component = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnSetSurfaceSizeUndefined'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[setXComponentSurfaceSizeUndefined002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('setSurfaceSize undefined');
      console.info('[setXComponentSurfaceSizeUndefined002] END');
    });

    /**
     * @tc.name   setXComponentSurfaceRectNull001
     * @tc.number SUB_ARKUI_XCOMPONENT_SETSURFACERECT_PARAM_001
     * @tc.desc   Test setXComponentSurfaceRect with rect null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setXComponentSurfaceRectNull001', Level.LEVEL0, async () => {
      console.info('[setXComponentSurfaceRectNull001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll: Component = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnSetSurfaceRectNull'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[setXComponentSurfaceRectNull001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('setSurfaceRect null');
      console.info('[setXComponentSurfaceRectNull001] END');
    });

    /**
     * @tc.name   setXComponentSurfaceRectUndefined002
     * @tc.number SUB_ARKUI_XCOMPONENT_SETSURFACERECT_PARAM_002
     * @tc.desc   Test setXComponentSurfaceRect with rect undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setXComponentSurfaceRectUndefined002', Level.LEVEL0, async () => {
      console.info('[setXComponentSurfaceRectUndefined002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll: Component = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnSetSurfaceRectUndefined'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[setXComponentSurfaceRectUndefined002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('setSurfaceRect undefined');
      console.info('[setXComponentSurfaceRectUndefined002] END');
    });

    /**
     * @tc.name   getXComponentSurfaceRectReturn001
     * @tc.number SUB_ARKUI_XCOMPONENT_GETSURFACERECT_RETURN_001
     * @tc.desc   Test getXComponentSurfaceRect return value, all properties should be covered.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getXComponentSurfaceRectReturn001', Level.LEVEL0, async () => {
      console.info('[getXComponentSurfaceRectReturn001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll: Component = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnGetSurfaceRect'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      let content: string = obj.$attrs.content;
      console.info("[getXComponentSurfaceRectReturn001] result is: " + content);

      expect(content).assertContain('offsetX');
      expect(content).assertContain('offsetY');
      expect(content).assertContain('width');
      expect(content).assertContain('height');
      console.info('[getXComponentSurfaceRectReturn001] END');
    });

    /**
     * @tc.name   setXComponentSurfaceRotationLockTrue001
     * @tc.number SUB_ARKUI_XCOMPONENT_SETSURFACEROTATION_PARAM_001
     * @tc.desc   Test setXComponentSurfaceRotation with lock true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setXComponentSurfaceRotationLockTrue001', Level.LEVEL0, async () => {
      console.info('[setXComponentSurfaceRotationLockTrue001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll: Component = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnSetSurfaceRotationLockTrue'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[setXComponentSurfaceRotationLockTrue001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('lock true');
      console.info('[setXComponentSurfaceRotationLockTrue001] END');
    });

    /**
     * @tc.name   setXComponentSurfaceRotationNull002
     * @tc.number SUB_ARKUI_XCOMPONENT_SETSURFACEROTATION_PARAM_002
     * @tc.desc   Test setXComponentSurfaceRotation with options null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setXComponentSurfaceRotationNull002', Level.LEVEL0, async () => {
      console.info('[setXComponentSurfaceRotationNull002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll: Component = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnSetSurfaceRotationNull'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[setXComponentSurfaceRotationNull002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Rotation null');
      console.info('[setXComponentSurfaceRotationNull002] END');
    });

    /**
     * @tc.name   setXComponentSurfaceRotationUndefined003
     * @tc.number SUB_ARKUI_XCOMPONENT_SETSURFACEROTATION_PARAM_003
     * @tc.desc   Test setXComponentSurfaceRotation with options undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setXComponentSurfaceRotationUndefined003', Level.LEVEL0, async () => {
      console.info('[setXComponentSurfaceRotationUndefined003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll: Component = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnSetSurfaceRotationUndefined'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[setXComponentSurfaceRotationUndefined003] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Rotation undefined');
      console.info('[setXComponentSurfaceRotationUndefined003] END');
    });

    /**
     * @tc.name   onSurfaceCreatedCallback001
     * @tc.number SUB_ARKUI_XCOMPONENT_ONSURFACECREATED_CALLBACK_001
     * @tc.desc   Test onSurfaceCreated callback is triggered and surfaceId is recorded.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onSurfaceCreatedCallback001', Level.LEVEL0, async () => {
      console.info('[onSurfaceCreatedCallback001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(2000);
      let scroll: Component = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnCheckOnSurfaceCreated'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[onSurfaceCreatedCallback001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('onSurfaceCreated called');
      console.info('[onSurfaceCreatedCallback001] END');
    });

    /**
     * @tc.name   onSurfaceChangedCallback001
     * @tc.number SUB_ARKUI_XCOMPONENT_ONSURFACECHANGED_CALLBACK_001
     * @tc.desc   Test onSurfaceChanged callback is triggered and rect properties are recorded.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onSurfaceChangedCallback001', Level.LEVEL0, async () => {
      console.info('[onSurfaceChangedCallback001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(2000);
      let scroll: Component = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnCheckOnSurfaceChanged'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[onSurfaceChangedCallback001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('onSurfaceChanged called');
      console.info('[onSurfaceChangedCallback001] END');
    });

    /**
     * @tc.name   onSurfaceDestroyedCallback001
     * @tc.number SUB_ARKUI_XCOMPONENT_ONSURFACEDESTROYED_CALLBACK_001
     * @tc.desc   Test onSurfaceDestroyed callback is triggered and surfaceId is recorded.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onSurfaceDestroyedCallback001', Level.LEVEL0, async () => {
      console.info('[onSurfaceDestroyedCallback001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(2000);
      let scroll: Component = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnCheckOnSurfaceDestroyed'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[onSurfaceDestroyedCallback001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('onSurfaceDestroyed not called');
      console.info('[onSurfaceDestroyedCallback001] END');
    });

    /**
     * @tc.name   startImageAnalyzerNull001
     * @tc.number SUB_ARKUI_XCOMPONENT_STARTIMAGEANALYZER_PARAM_001
     * @tc.desc   Test startImageAnalyzer with config null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('startImageAnalyzerNull001', Level.LEVEL0, async () => {
      console.info('[startImageAnalyzerNull001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll: Component = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnStartImageAnalyzerNull'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[startImageAnalyzerNull001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('onSurfaceDestroyed not called');
      console.info('[startImageAnalyzerNull001] END');
    });

    /**
     * @tc.name   startImageAnalyzerUndefined002
     * @tc.number SUB_ARKUI_XCOMPONENT_STARTIMAGEANALYZER_PARAM_002
     * @tc.desc   Test startImageAnalyzer with config undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('startImageAnalyzerUndefined002', Level.LEVEL0, async () => {
      console.info('[startImageAnalyzerUndefined002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll: Component = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnStartImageAnalyzerUndefined'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[startImageAnalyzerUndefined002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('onSurfaceDestroyed not called');
      console.info('[startImageAnalyzerUndefined002] END');
    });

    /**
     * @tc.name   unlockCanvasAndPostNull001
     * @tc.number SUB_ARKUI_XCOMPONENT_UNLOCKCANVAS_PARAM_001
     * @tc.desc   Test unlockCanvasAndPost with canvas null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unlockCanvasAndPostNull001', Level.LEVEL0, async () => {
      console.info('[unlockCanvasAndPostNull001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll: Component = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnUnlockCanvasNull'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[unlockCanvasAndPostNull001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('unlockCanvasAndPost null');
      console.info('[unlockCanvasAndPostNull001] END');
    });

    /**
     * @tc.name   unlockCanvasAndPostUndefined002
     * @tc.number SUB_ARKUI_XCOMPONENT_UNLOCKCANVAS_PARAM_002
     * @tc.desc   Test unlockCanvasAndPost with canvas undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unlockCanvasAndPostUndefined002', Level.LEVEL0, async () => {
      console.info('[unlockCanvasAndPostUndefined002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll: Component = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnUnlockCanvasUndefined'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[unlockCanvasAndPostUndefined002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('unlockCanvasAndPost undefined');
      console.info('[unlockCanvasAndPostUndefined002] END');
    });

    /**
     * @tc.name   setXComponentSurfaceConfigNull001
     * @tc.number SUB_ARKUI_XCOMPONENT_SETSURFACECONFIG_PARAM_001
     * @tc.desc   Test setXComponentSurfaceConfig with config null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setXComponentSurfaceConfigNull001', Level.LEVEL0, async () => {
      console.info('[setXComponentSurfaceConfigNull001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll: Component = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnSetSurfaceConfigNull'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[setXComponentSurfaceConfigNull001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('setSurfaceConfig null');
      console.info('[setXComponentSurfaceConfigNull001] END');
    });

    /**
     * @tc.name   setXComponentSurfaceConfigUndefined002
     * @tc.number SUB_ARKUI_XCOMPONENT_SETSURFACECONFIG_PARAM_002
     * @tc.desc   Test setXComponentSurfaceConfig with config undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setXComponentSurfaceConfigUndefined002', Level.LEVEL0, async () => {
      console.info('[setXComponentSurfaceConfigUndefined002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll: Component = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnSetSurfaceConfigUndefined'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[setXComponentSurfaceConfigUndefined002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('setSurfaceConfig undefined');
      console.info('[setXComponentSurfaceConfigUndefined002] END');
    });
  })
}
