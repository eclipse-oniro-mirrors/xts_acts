/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import Utils from './Utils'
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest';

export default function rectJsunit() {
  describe('rectTest', () => {
    beforeAll(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/rect',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get rect state success " + JSON.stringify(pages));
        if (!("rect" == pages.name)) {
          console.info("get rect state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push rect page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   testrect_radiusHeight
     * @tc.number testrect_radiusHeight
     * @tc.desc   Set radiusHeight values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testrect_radiusHeight', Level.LEVEL0, async (done: Function) => {
      console.info('[testrect_radiusHeight] START');
      let strJson = getInspectorByKey('Rect1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testrect_radiusHeight] obj is : " + JSON.stringify(obj.$attrs));
      let strJson1 = getInspectorByKey('Rect11');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[testrect_radiusHeight] obj1 is : " + JSON.stringify(obj1.$attrs));
      //json返回值与设置值不统一，所以使用与原生返回做对比验证
      expect(obj.$attrs.radiusHeight).assertEqual(obj1.$attrs.radiusHeight);
      console.info('[testrect_radiusHeight] END');
      done();
    });

    /**
     * @tc.name   testrect_radius
     * @tc.number testrect_radius
     * @tc.desc   Set radius values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testrect_radius', Level.LEVEL0, async (done: Function) => {
      console.info('[testrect_radius] START');
      let strJson = getInspectorByKey('Rect2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testrect_radius] obj2 is : " + JSON.stringify(obj.$attrs));
      let strJson1 = getInspectorByKey('Rect22');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[testrect_radius] obj22 is : " + JSON.stringify(obj1.$attrs));
      //json返回值与设置值不统一，所以使用与原生返回做对比验证
      expect(obj.$attrs.radius).assertEqual(obj1.$attrs.radius);
      console.info('[testrect_radius] END');
      done();
    });

    /**
     * @tc.name   testrect_radiusWidth
     * @tc.number testrect_radiusWidth
     * @tc.desc   Set radiusWidth values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testrect_radiusWidth', Level.LEVEL0, async (done: Function) => {
      console.info('[testrect_radiusWidth] START');
      let strJson = getInspectorByKey('Rect3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testrect_radiusWidth] obj is : " + JSON.stringify(obj.$attrs));
      let strJson1 = getInspectorByKey('Rect33');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[testrect_radiusWidth] obj1 is : " + JSON.stringify(obj1.$attrs));
      //json返回值与设置值不统一，所以使用与原生返回做对比验证
      expect(obj.$attrs.radiusWidth).assertEqual(obj1.$attrs.radiusWidth);
      console.info('[testrect_radiusWidth] END');
      done();
    });

    /**
     * @tc.name   testrect__001
     * @tc.number testrect__001
     * @tc.desc   Change radiusHeight values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testrect__001', Level.LEVEL0, async (done: Function) => {
      console.info('testrect__001 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew1 = getInspectorByKey('Rect1');
      let objNew1: ESObject = JSON.parse(strJsonNew1);
      let strJsonNew3 = getInspectorByKey('Rect44');
      let objNew3: ESObject = JSON.parse(strJsonNew3);
      console.info("testrect__001 component objNew1  is: " + JSON.stringify(objNew1.$attrs));
      console.info("testrect__001 component objNew3  is: " + JSON.stringify(objNew3.$attrs));
      expect(objNew1.$attrs.radiusHeight).assertEqual(objNew3.$attrs.radiusHeight);
      console.info('testrect__001 END');
      done();
    });
  })
}
