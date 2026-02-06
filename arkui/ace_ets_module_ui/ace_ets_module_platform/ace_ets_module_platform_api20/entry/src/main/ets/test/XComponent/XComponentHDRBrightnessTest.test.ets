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

 import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function XComponentHDRBrightnessTest() {
  describe('XComponentHDRBrightnessTest', () => {
    beforeEach(async (done: Function) => {
      console.info("XComponentHDRBrightness beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/XComponent/XComponentHDRBrightnessPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get XComponentHDRBrightness state pages:" + JSON.stringify(pages));
        if (!("XComponentHDRBrightnessPage" == pages.name)) {
          console.info("get XComponentHDRBrightness pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push XComponentHDRBrightness page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push XComponentHDRBrightness page error:" + err);
      }
      console.info("XComponentHDRBrightness beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("XComponentHDRBrightness after each called");
    });
/**
     * @tc.number    XComponentHDRBrightness_0100
     * @tc.name      XComponentHDRBrightness_0100
     * @tc.desc      Test XComponentHDRBrightness
     * @tc.level     Level 2
     */
    it('XComponentHDRBrightness_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[XComponentHDRBrightness_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('hdrBrightness_xcomponent');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[XComponentHDRBrightness_0100] component obj is: " + obj.$attrs.hdrBrightness);
      expect(obj.$attrs.hdrBrightness).assertEqual('0.000000');

      // change hdrBrightness 0.5
      let button = await driver.findComponent(ON.id('hdrBrightness_bth'));
      await button.click();
      await CommonFunc.sleep(500);
      strJson = getInspectorByKey('hdrBrightness_xcomponent');
      obj = JSON.parse(strJson);
      console.info("[XComponentHDRBrightness_0100] component obj is: " + obj.$attrs.hdrBrightness);
      expect(obj.$attrs.hdrBrightness).assertEqual('0.500000');

      // change hdrBrightness 1.0
      button = await driver.findComponent(ON.id('hdrBrightness_bth'));
      await button.click();
      await CommonFunc.sleep(500);
      strJson = getInspectorByKey('hdrBrightness_xcomponent');
      obj = JSON.parse(strJson);
      console.info("[XComponentHDRBrightness_0100] component obj is: " + obj.$attrs.hdrBrightness);
      expect(obj.$attrs.hdrBrightness).assertEqual('1.000000');

      // change hdrBrightness -0.5
      button = await driver.findComponent(ON.id('hdrBrightness_bth'));
      await button.click();
      await CommonFunc.sleep(500);
      strJson = getInspectorByKey('hdrBrightness_xcomponent');
      obj = JSON.parse(strJson);
      console.info("[XComponentHDRBrightness_0100] component obj is: " + obj.$attrs.hdrBrightness);
      expect(obj.$attrs.hdrBrightness).assertEqual('0.000000');

      // change hdrBrightness 1.5
      button = await driver.findComponent(ON.id('hdrBrightness_bth'));
      await button.click();
      await CommonFunc.sleep(500);
      strJson = getInspectorByKey('hdrBrightness_xcomponent');
      obj = JSON.parse(strJson);
      console.info("[XComponentHDRBrightness_0100] component obj is: " + obj.$attrs.hdrBrightness);
      expect(obj.$attrs.hdrBrightness).assertEqual('1.000000');

      // change hdrBrightness null
      button = await driver.findComponent(ON.id('hdrBrightness_bth'));
      await button.click();
      await CommonFunc.sleep(500);
      strJson = getInspectorByKey('hdrBrightness_xcomponent');
      obj = JSON.parse(strJson);
      console.info("[XComponentHDRBrightness_0100] component obj is: " + obj.$attrs.hdrBrightness);
      expect(obj.$attrs.hdrBrightness).assertEqual('1.000000');

      // change hdrBrightness undefined
      button = await driver.findComponent(ON.id('hdrBrightness_bth'));
      await button.click();
      await CommonFunc.sleep(500);
      strJson = getInspectorByKey('hdrBrightness_xcomponent');
      obj = JSON.parse(strJson);
      console.info("[XComponentHDRBrightness_0100] component obj is: " + obj.$attrs.hdrBrightness);
      expect(obj.$attrs.hdrBrightness).assertEqual('1.000000');

      console.info('[XComponentHDRBrightness_0100] END');
      done();
    });
  })
}