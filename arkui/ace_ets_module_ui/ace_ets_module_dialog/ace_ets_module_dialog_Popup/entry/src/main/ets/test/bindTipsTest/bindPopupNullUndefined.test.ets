/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeEach, afterEach, it, expect, Level, Size, TestType } from '@ohos/hypium'
import router from '@ohos.router';
import { Driver, On, ON, Component, Point } from '@ohos.UiTest';
import CommonFunc from "../../MainAbility/common/Common";

export default function bindPopupNullUndefined() {
  describe('bindPopupNullUndefined', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindTips/bindPopupNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get bindPopupNullUndefined state success " + JSON.stringify(pages));
        if (!("bindPopupNullUndefined" == pages.name)) {
          console.info("get bindPopupNullUndefined state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push bindPopupNullUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push bindPopupNullUndefined page error: " + err);
      }
      done()
    });
    
    // ========== bindTips tests ==========
    /**
     * @tc.name   bindTipsNullUndefined_0100
     * @tc.number bindTipsNullUndefined_0100
     * @tc.desc   Test bindTips message property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindTipsNullUndefined_0100', Level.LEVEL1, async (done: Function) => {
      console.info('bindTipsNullUndefined_0100 START');
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('bindTips_message_null'));
      let center: Point = await button.getBoundsCenter();
      console.info("[bindTipsNullUndefined_0100] component obj is: " + JSON.stringify(center));
      await driver.mouseMoveTo(center);
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('bindTips_message_null');
      console.info("[bindTipsNullUndefined_0100] bindTips is: " + JSON.stringify(JSON.parse(strJson).$attrs.bindTips));
      expect(JSON.parse(strJson).$attrs.bindTips).assertEqual(undefined);
      await driver.mouseMoveTo({
        x: 0, y: 0
      });
      await CommonFunc.sleep(3000);
      console.info('[bindTipsNullUndefined_0100] END');
      done();
    });
    
    /**
     * @tc.name   bindTipsNullUndefined_0200
     * @tc.number bindTipsNullUndefined_0200
     * @tc.desc   Test bindTips message property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindTipsNullUndefined_0200', Level.LEVEL1, async (done: Function) => {
      console.info('bindTipsNullUndefined_0200 START');
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('bindTips_message_undefined'));
      let center: Point = await button.getBoundsCenter();
      console.info("[bindTipsNullUndefined_0200] component obj is: " + JSON.stringify(center));
      await driver.mouseMoveTo(center);
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('bindTips_message_undefined');
      console.info("[bindTipsNullUndefined_0200] bindTips is: " + JSON.stringify(JSON.parse(strJson).$attrs.bindTips));
      expect(JSON.parse(strJson).$attrs.bindTips).assertEqual(undefined);
      await driver.mouseMoveTo({
        x: 0, y: 0
      });
      await CommonFunc.sleep(3000);
      console.info('[bindTipsNullUndefined_0200] END');
      done();
    });

    /**
     * @tc.name   bindTipsNullUndefined_0300
     * @tc.number bindTipsNullUndefined_0300
     * @tc.desc   Test bindTips options property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindTipsNullUndefined_0300', Level.LEVEL1, async (done: Function) => {
      console.info('bindTipsNullUndefined_0300 START');
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('bindTips_options_null'));
      let center: Point = await button.getBoundsCenter();
      console.info("[bindTipsNullUndefined_0300] component obj is: " + JSON.stringify(center));
      await driver.mouseMoveTo(center);
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('bindTips_options_null');
      console.info("[bindTipsNullUndefined_0300] bindTips is: " + JSON.stringify(JSON.parse(strJson).$attrs.bindTips));
      expect(JSON.parse(strJson).$attrs.bindTips).assertEqual(undefined);
      await driver.mouseMoveTo({
        x: 0, y: 0
      });
      await CommonFunc.sleep(3000);
      console.info('[bindTipsNullUndefined_0300] END');
      done();
    });

    /**
     * @tc.name   bindTipsNullUndefined_0400
     * @tc.number bindTipsNullUndefined_0400
     * @tc.desc   Test bindTips options property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindTipsNullUndefined_0400', Level.LEVEL1, async (done: Function) => {
      console.info('bindTipsNullUndefined_0400 START');
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('bindTips_options_undefined'));
      let center: Point = await button.getBoundsCenter();
      console.info("[bindTipsNullUndefined_0400] component obj is: " + JSON.stringify(center));
      await driver.mouseMoveTo(center);
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('bindTips_options_undefined');
      console.info("[bindTipsNullUndefined_0400] bindTips is: " + JSON.stringify(JSON.parse(strJson).$attrs.bindTips));
      expect(JSON.parse(strJson).$attrs.bindTips).assertEqual(undefined);
      await driver.mouseMoveTo({
        x: 0, y: 0
      });
      await CommonFunc.sleep(3000);
      console.info('[bindTipsNullUndefined_0400] END');
      done();
    });
    
    /**
     * @tc.name   bindTipsNullUndefined_0500
     * @tc.number bindTipsNullUndefined_0500
     * @tc.desc   Test bindTips options enableArrow property with false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindTipsNullUndefined_0500', Level.LEVEL1, async (done: Function) => {
      console.info('bindTipsNullUndefined_0500 START');
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('bindTips_enableArrow_false'));
      let center: Point = await button.getBoundsCenter();
      console.info("[bindTipsNullUndefined_0500] component obj is: " + JSON.stringify(center));
      await driver.mouseMoveTo(center);
      await CommonFunc.sleep(2000);
      expect(!!button).assertTrue();
      await driver.mouseMoveTo({
        x: 0, y: 0
      });
      await CommonFunc.sleep(3000);
      console.info('[bindTipsNullUndefined_0500] END');
      done();
    });

    // ========== bindPopup tests ==========
    /**
     * @tc.name   bindPopupNullUndefined_0100
     * @tc.number bindPopupNullUndefined_0100
     * @tc.desc   Test bindPopup popup property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindPopupNullUndefined_0100', Level.LEVEL1, async (done: Function) => {
      console.info('bindPopupNullUndefined_0100 START');
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindPopup_popup_null'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson: string = getInspectorByKey('bindPopup_popup_null');
      console.info("[bindPopupNullUndefined_0100] bindTips is: " + JSON.stringify(JSON.parse(strJson).$attrs.bindPopup));
      expect(JSON.parse(strJson).$attrs.bindPopup).assertEqual(undefined);
      await CommonFunc.sleep(1000);
      console.info('[bindPopupNullUndefined_0100] END');
      done();
    });
    
    /**
     * @tc.name   bindPopupNullUndefined_0200
     * @tc.number bindPopupNullUndefined_0200
     * @tc.desc   Test bindPopup popup property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindPopupNullUndefined_0200', Level.LEVEL1, async (done: Function) => {
      console.info('bindPopupNullUndefined_0200 START');
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindPopup_popup_undefined'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson: string = getInspectorByKey('bindPopup_popup_undefined');
      console.info("[bindPopupNullUndefined_0200] bindPopup is: " + JSON.stringify(JSON.parse(strJson).$attrs.bindPopup));
      expect(JSON.parse(strJson).$attrs.bindPopup).assertEqual(undefined);
      await CommonFunc.sleep(1000);
      console.info('[bindPopupNullUndefined_0200] END');
      done();
    });
  })
}