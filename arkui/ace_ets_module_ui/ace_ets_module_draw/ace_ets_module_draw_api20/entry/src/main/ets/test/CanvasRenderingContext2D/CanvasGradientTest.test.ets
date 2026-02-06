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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function CanvasGradientTest() {
  describe('CanvasGradientTest', () => {
    beforeEach(async (done: Function) => {
      console.info("CanvasGradientTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CanvasRenderingContext2D/CanvasGradientPage",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CanvasGradientTest state pages: " + JSON.stringify(pages));
        if (!("CanvasGradientTest" == pages.name)) {
          console.info("get CanvasGradientTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push CanvasGradientTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CanvasGradientTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   CanvasGradientTest_0100
     * @tc.number CanvasGradientTest_0100
     * @tc.desc   CanvasGradient support p3 color gamut
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CanvasGradientTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[CanvasGradientTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('CanvasGradientPage_fillStyle'));
      await button.click();
      await CommonFunc.sleep(500)

      button = await driver.findComponent(ON.id('CanvasGradientPage_strokeStyle'));
      await button.click();
      await CommonFunc.sleep(500)

      button = await driver.findComponent(ON.id('CanvasGradientPage_color_null'));
      await button.click();
      await CommonFunc.sleep(500)

      button = await driver.findComponent(ON.id('CanvasGradientPage_color_undefined'));
      await button.click();
      await CommonFunc.sleep(500)

      button = await driver.findComponent(ON.id('CanvasGradientPage_offset_null'));
      await button.click();
      await CommonFunc.sleep(500)

      button = await driver.findComponent(ON.id('CanvasGradientPage_offset_undefined'));
      await button.click();
      await CommonFunc.sleep(500)

      button = await driver.findComponent(ON.id('CanvasGradientPage_offset_positive_15'));
      await button.click();
      await CommonFunc.sleep(500)

      button = await driver.findComponent(ON.id('CanvasGradientPage_offset_negativa_1'));
      await button.click();
      await CommonFunc.sleep(500)

      let strJson = getInspectorByKey('CanvasGradientPage_Canvas');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[CanvasGradientTest_0100] type is: " + JSON.stringify(obj.$type));
      expect(obj.$type).assertEqual('Canvas');

      console.info('[CanvasGradientTest_0100] END');
      done();
    });
  })
}

