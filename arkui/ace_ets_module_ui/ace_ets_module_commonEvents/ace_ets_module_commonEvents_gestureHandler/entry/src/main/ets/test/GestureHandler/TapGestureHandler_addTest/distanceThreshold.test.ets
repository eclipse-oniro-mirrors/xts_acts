/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/common/Common';

export default function distanceThresholdTest() {

  describe('distanceThresholdTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureHandler/TapGestureHandler_add/distanceThreshold',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get distanceThreshold state pages: ' + JSON.stringify(pages));
        if (!('distanceThreshold' == pages.name)) {
          console.info('get distanceThreshold state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push distanceThreshold success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push distanceThreshold page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('distanceThreshold after each called');
    });

    /**
     * @tc.name   distanceThreshold_0010
     * @tc.number distanceThreshold_0010
     * @tc.desc   distanceThreshold value is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('distanceThreshold_0010', Level.LEVEL0, async (done: Function) => {
      console.info('distanceThreshold_0010 START');
      await CommonFunc.sleep(150);
      let column1 = CommonFunc.getComponentRectOnScreen('test_Column');
      console.info('distanceThreshold_0010 column1', column1.left, column1.top, column1.right, column1.bottom);
      let width = column1.right - column1.left;
      let height = column1.bottom - column1.top;
      console.info('distanceThreshold_0020 column1 width = ' + width + ',height = ' + height);
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('test_Column'));
      await driver.doubleClick(Math.round(column1.left + vp2px(8)),Math.round(column1.top + vp2px(8)));
      await CommonFunc.sleep(3000)
      let button1= await driver.findComponent(ON.id('onClick'));
      await button1.click();
      await CommonFunc.sleep(1000);
      //Switch the value of 'distanceThreshold'
      let button2 = await driver.findComponent(ON.id('onClick01'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let tt1 = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(tt1);
      console.info('distanceThreshold_0010 obj $attrs content '+ obj.$attrs.content);
      // check the click event  whether response
      let dataE:ESObject = JSON.parse(obj.$attrs.content);
      expect(Math.abs(dataE.localX - 8) <= 1).assertTrue();
      expect(Math.abs(dataE.localY -8) <=1 ).assertTrue();
      console.info('distanceThreshold_0010 end');
      done();
    });

    /**
     * @tc.name   distanceThreshold_0020
     * @tc.number distanceThreshold_0020
     * @tc.desc   distanceThreshold value is 200.55
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('distanceThreshold_0020', Level.LEVEL0, async (done: Function) => {
      console.info('distanceThreshold_0020 START');
      await CommonFunc.sleep(150);
      let column1 = CommonFunc.getComponentRectOnScreen('test_Column');
      console.info('distanceThreshold_0020 column1', column1.left, column1.top, column1.right, column1.bottom);
      let width = column1.right - column1.left;
      let height = column1.bottom - column1.top;
      console.info('distanceThreshold_0020 column1 width = ' + width + ',height = ' + height);
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('test_Column'));
      await driver.doubleClick(Math.round(column1.left + vp2px(11)),Math.round(column1.top + vp2px(11)));
      await CommonFunc.sleep(3000)
      let button1= await driver.findComponent(ON.id('onClick'));
      await button1.click();
      await CommonFunc.sleep(1000);
      //Switch the value of 'distanceThreshold'
      let button2 = await driver.findComponent(ON.id('onClick01'));
      await button2.click();
      await CommonFunc.sleep(500);
      let tt1 = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(tt1);
      console.info('distanceThreshold_0020 obj $attrs content '+ obj.$attrs.content);
      // check the click event  whether response
      let dataE:ESObject = JSON.parse(obj.$attrs.content);
      expect(Math.abs(dataE.localX - 11) <= 1).assertTrue();
      expect(Math.abs(dataE.localY -11) <=1 ).assertTrue();
      console.info('distanceThreshold_0020 end');
      done();
    });

    /**
     * @tc.name   distanceThreshold_0030
     * @tc.number distanceThreshold_0030
     * @tc.desc   distanceThreshold value is -100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('distanceThreshold_0030', Level.LEVEL1, async (done: Function) => {
      console.info('distanceThreshold_0030 START');
      await CommonFunc.sleep(150);
      let column1 = CommonFunc.getComponentRectOnScreen('test_Column');
      console.info('distanceThreshold_0030 column1', column1.left, column1.top, column1.right, column1.bottom);
      let width = column1.right - column1.left;
      let height = column1.bottom - column1.top;
      console.info('distanceThreshold_0030 column1 width = ' + width + ',height = ' + height);
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('test_Column'));
      await driver.doubleClick(Math.round(column1.left + vp2px(10)),Math.round(column1.top + vp2px(10)));
      await CommonFunc.sleep(3000)
      let button1= await driver.findComponent(ON.id('onClick'));
      await button1.click();
      await CommonFunc.sleep(1000);
      //Switch the value of 'distanceThreshold'
      let button2 = await driver.findComponent(ON.id('onClick01'));
      await button2.click();
      await CommonFunc.sleep(500);
      let tt1 = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(tt1);
      console.info('distanceThreshold_0030 obj $attrs content '+ obj.$attrs.content);
      // check the click event  whether response
      let dataE:ESObject = JSON.parse(obj.$attrs.content);
      expect(Math.abs(dataE.localX - 10) <= 1).assertTrue();
      expect(Math.abs(dataE.localY -10) <=1 ).assertTrue();
      console.info('distanceThreshold_0030 end');
      done();
    });

    /**
     * @tc.name   distanceThreshold_0040
     * @tc.number distanceThreshold_0040
     * @tc.desc   distanceThreshold value is NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('distanceThreshold_0040', Level.LEVEL1, async (done: Function) => {
      console.info('distanceThreshold_0040 START');
      await CommonFunc.sleep(150);
      let column1 = CommonFunc.getComponentRectOnScreen('test_Column');
      console.info('distanceThreshold_0040 column1', column1.left, column1.top, column1.right, column1.bottom);
      let width = column1.right - column1.left;
      let height = column1.bottom - column1.top;
      console.info('distanceThreshold_0020 column1 width = ' + width + ',height = ' + height);
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('test_Column'));
      await driver.doubleClick(Math.round(column1.left + vp2px(10)),Math.round(column1.top + vp2px(10)));
      await CommonFunc.sleep(3000)
      let button1= await driver.findComponent(ON.id('onClick'));
      await button1.click();
      await CommonFunc.sleep(1000);
      //Switch the value of 'distanceThreshold'
      let button2 = await driver.findComponent(ON.id('onClick01'));
      await button2.click();
      await CommonFunc.sleep(500);
      let tt1 = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(tt1);
      console.info('distanceThreshold_0040 obj $attrs content '+ obj.$attrs.content);
      // check the click event  whether response
      let dataE:ESObject = JSON.parse(obj.$attrs.content);
      expect(Math.abs(dataE.localX - 10) <= 1).assertTrue();
      expect(Math.abs(dataE.localY -10) <=1 ).assertTrue();
      console.info('distanceThreshold_0040 end');
      done();
    });

    /**
     * @tc.name   distanceThreshold_0050
     * @tc.number distanceThreshold_0050
     * @tc.desc   distanceThreshold value is Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('distanceThreshold_0050', Level.LEVEL1, async (done: Function) => {
      console.info('distanceThreshold_0050 START');
      await CommonFunc.sleep(150);
      let column1 = CommonFunc.getComponentRectOnScreen('test_Column');
      console.info('distanceThreshold_0050 column1', column1.left, column1.top, column1.right, column1.bottom);
      let width = column1.right - column1.left;
      let height = column1.bottom - column1.top;
      console.info('distanceThreshold_0020 column1 width = ' + width + ',height = ' + height);
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('test_Column'));
      await driver.doubleClick(Math.round(column1.left + vp2px(10)),Math.round(column1.top + vp2px(10)));
      await CommonFunc.sleep(3000)
      let button1= await driver.findComponent(ON.id('onClick'));
      await button1.click();
      await CommonFunc.sleep(1000);
      //Switch the value of 'distanceThreshold'
      let button2 = await driver.findComponent(ON.id('onClick01'));
      await button2.click();
      await CommonFunc.sleep(500);
      let tt1 = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(tt1);
      console.info('distanceThreshold_0050 obj $attrs content '+ obj.$attrs.content);
      // check the click event  whether response
      let dataE:ESObject = JSON.parse(obj.$attrs.content);
      expect(Math.abs(dataE.localX - 10) <= 1).assertTrue();
      expect(Math.abs(dataE.localY -10) <=1 ).assertTrue();
      console.info('distanceThreshold_0050 end');
      done();
    });
  })
}
