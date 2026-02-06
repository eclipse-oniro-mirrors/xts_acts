/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "@ohos/hypium"
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
import Utils from '../Utils';
export default function APIFontPrimaryTest() {
  describe('APIFontPrimaryTest', () => {
    beforeEach(async (done: Function) => {
      console.info("themePageTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/theme/APIFontPrimary",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get APIFontPrimaryTest state pages: " + JSON.stringify(pages));
        if (!("APIFontPrimary" == pages.name)) {
          console.info("get APIFontPrimaryTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await Utils.sleep(2000);
          console.info("push APIFontPrimaryTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APIFontPrimaryTest page error: " + err);
        0
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await Utils.sleep(2000);
    });
    /**
     * @tc.name   APIFontPrimaryTest_0100
     * @tc.number api
     * @tc.desc   APIFontPrimaryTest_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIFontPrimaryTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('APIFontPrimaryTest_0100 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
      await button.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('APIFontPrimary_Text02');
      
      console.info("[APIFontPrimaryTest_0100] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[APIFontPrimaryTest_0100] component JSON.parse(strJson) is: " + JSON.parse(strJson).$attrs.content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('true');
      console.info('[APIFontPrimaryTest_0100] END');
      done();
    });
    /**
     * @tc.name   APIFontPrimaryTest_0200
     * @tc.number api
     * @tc.desc   APIFontPrimaryTest_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIFontPrimaryTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('APIFontPrimaryTest_0200 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
      await button.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('APIFontPrimary_Text03');
      
      console.info("[APIFontPrimaryTest_0200] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[APIFontPrimaryTest_0200] component JSON.parse(strJson) is: " + JSON.parse(strJson).$attrs.content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('true');
      console.info('[APIFontPrimaryTest_0200] END');
      done();
    });
    /**
     * @tc.name   APIFontPrimaryTest_0300
     * @tc.number api
     * @tc.desc   APIFontPrimaryTest_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIFontPrimaryTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('APIFontPrimaryTest_0300 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
      await button.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('APIFontPrimary_Text04');
      
      console.info("[APIFontPrimaryTest_0300] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[APIFontPrimaryTest_0300] component JSON.parse(strJson) is: " + JSON.parse(strJson).$attrs.content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('true');
      console.info('[APIFontPrimaryTest_0300] END');
      done();
    });
    /**
     * @tc.name   APIFontPrimaryTest_0400
     * @tc.number api
     * @tc.desc   APIFontPrimaryTest_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIFontPrimaryTest_0400', Level.LEVEL0, async (done: Function) => {
      console.info('APIFontPrimaryTest_0400 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
      await button.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('APIFontPrimary_Text05');
      
      console.info("[APIFontPrimaryTest_0400] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[APIFontPrimaryTest_0400] component JSON.parse(strJson) is: " + JSON.parse(strJson).$attrs.content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('true');
      console.info('[APIFontPrimaryTest_0400] END');
      done();
    });
    /**
     * @tc.name   APIFontPrimaryTest_0500
     * @tc.number api
     * @tc.desc   APIFontPrimaryTest_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIFontPrimaryTest_0500', Level.LEVEL0, async (done: Function) => {
      console.info('APIFontPrimaryTest_0500 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
      await button.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('APIFontPrimary_Text06');
      
      console.info("[APIFontPrimaryTest_0500] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[APIFontPrimaryTest_0500] component JSON.parse(strJson) is: " + JSON.parse(strJson).$attrs.content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('true');
      console.info('[APIFontPrimaryTest_0500] END');
      done();
    });
    /**
     * @tc.name   APIFontPrimaryTest_0600
     * @tc.number api
     * @tc.desc   APIFontPrimaryTest_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIFontPrimaryTest_0600', Level.LEVEL0, async (done: Function) => {
      console.info('APIFontPrimaryTest_0600 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
      await button.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('APIFontPrimary_Text07');
      
      console.info("[APIFontPrimaryTest_0600] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[APIFontPrimaryTest_0600] component JSON.parse(strJson) is: " + JSON.parse(strJson).$attrs.content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('true');
      console.info('[APIFontPrimaryTest_0600] END');
      done();
    });
    /**
     * @tc.name   APIFontPrimaryTest_0700
     * @tc.number api
     * @tc.desc   APIFontPrimaryTest_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIFontPrimaryTest_0700', Level.LEVEL0, async (done: Function) => {
      console.info('APIFontPrimaryTest_0700 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
      await button.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('APIFontPrimary_Text08');
      
      console.info("[APIFontPrimaryTest_0700] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[APIFontPrimaryTest_0700] component JSON.parse(strJson) is: " + JSON.parse(strJson).$attrs.content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('true');
      console.info('[APIFontPrimaryTest_0700] END');
      done();
    });
    /**
     * @tc.name   APIFontPrimaryTest_0800
     * @tc.number api
     * @tc.desc   APIFontPrimaryTest_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIFontPrimaryTest_0800', Level.LEVEL0, async (done: Function) => {
      console.info('APIFontPrimaryTest_0800 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
      await button.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('APIFontPrimary_Text09');
      
      console.info("[APIFontPrimaryTest_0800] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[APIFontPrimaryTest_0800] component JSON.parse(strJson) is: " + JSON.parse(strJson).$attrs.content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('true');
      console.info('[APIFontPrimaryTest_0800] END');
      done();
    });
    /**
     * @tc.name   APIFontPrimaryTest_0900
     * @tc.number api
     * @tc.desc   APIFontPrimaryTest_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIFontPrimaryTest_0900', Level.LEVEL0, async (done: Function) => {
      console.info('APIFontPrimaryTest_0900 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
      await button.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('APIFontPrimary_Text10');
      
      console.info("[APIFontPrimaryTest_0900] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[APIFontPrimaryTest_0900] component JSON.parse(strJson) is: " + JSON.parse(strJson).$attrs.content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('true');
      console.info('[APIFontPrimaryTest_0900] END');
      done();
    });
    /**
     * @tc.name   APIFontPrimaryTest_1000
     * @tc.number api
     * @tc.desc   APIFontPrimaryTest_1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIFontPrimaryTest_1000', Level.LEVEL0, async (done: Function) => {
      console.info('APIFontPrimaryTest_1000 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
      await button.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('APIFontPrimary_Text11');
      
      console.info("[APIFontPrimaryTest_1000] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[APIFontPrimaryTest_1000] component JSON.parse(strJson) is: " + JSON.parse(strJson).$attrs.content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('true');
      console.info('[APIFontPrimaryTest_1000] END');
      done();
    });
    /**
     * @tc.name   APIFontPrimaryTest_1100
     * @tc.number api
     * @tc.desc   APIFontPrimaryTest_1100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIFontPrimaryTest_1100', Level.LEVEL0, async (done: Function) => {
      console.info('APIFontPrimaryTest_1100 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
      await button.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('APIFontPrimary_Text12');
      
      console.info("[APIFontPrimaryTest_1100] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[APIFontPrimaryTest_1100] component JSON.parse(strJson) is: " + JSON.parse(strJson).$attrs.content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('true');
      console.info('[APIFontPrimaryTest_1100] END');
      done();
    });
    /**
     * @tc.name   APIFontPrimaryTest_1200
     * @tc.number api
     * @tc.desc   APIFontPrimaryTest_1200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIFontPrimaryTest_1200', Level.LEVEL0, async (done: Function) => {
      console.info('APIFontPrimaryTest_1200 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
      await button.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('APIFontPrimary_Text13');
      
      console.info("[APIFontPrimaryTest_1200] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[APIFontPrimaryTest_1200] component JSON.parse(strJson) is: " + JSON.parse(strJson).$attrs.content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('true');
      console.info('[APIFontPrimaryTest_1200] END');
      done();
    });
    /**
     * @tc.name   APIFontPrimaryTest_1300
     * @tc.number api
     * @tc.desc   APIFontPrimaryTest_1300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIFontPrimaryTest_1300', Level.LEVEL0, async (done: Function) => {
      console.info('APIFontPrimaryTest_1300 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
      await button.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('APIFontPrimary_Text14');
      
      console.info("[APIFontPrimaryTest_1300] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[APIFontPrimaryTest_1300] component JSON.parse(strJson) is: " + JSON.parse(strJson).$attrs.content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('true');
      console.info('[APIFontPrimaryTest_1300] END');
      done();
    });
    /**
     * @tc.name   APIFontPrimaryTest_1400
     * @tc.number api
     * @tc.desc   APIFontPrimaryTest_1400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIFontPrimaryTest_1400', Level.LEVEL0, async (done: Function) => {
      console.info('APIFontPrimaryTest_1400 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
      await button.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('APIFontPrimary_Text15');
      
      console.info("[APIFontPrimaryTest_1400] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[APIFontPrimaryTest_1400] component JSON.parse(strJson) is: " + JSON.parse(strJson).$attrs.content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('true');
      console.info('[APIFontPrimaryTest_1400] END');
      done();
    });
    /**
     * @tc.name   APIFontPrimaryTest_1500
     * @tc.number api
     * @tc.desc   APIFontPrimaryTest_1500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIFontPrimaryTest_1500', Level.LEVEL0, async (done: Function) => {
      console.info('APIFontPrimaryTest_1500 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
      await button.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('APIFontPrimary_Text16');
      
      console.info("[APIFontPrimaryTest_1500] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[APIFontPrimaryTest_1500] component JSON.parse(strJson) is: " + JSON.parse(strJson).$attrs.content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('true');
      console.info('[APIFontPrimaryTest_1500] END');
      done();
    });
  })
}