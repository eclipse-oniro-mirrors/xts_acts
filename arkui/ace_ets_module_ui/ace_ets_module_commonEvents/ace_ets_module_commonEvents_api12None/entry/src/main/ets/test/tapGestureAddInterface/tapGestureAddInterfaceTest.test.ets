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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function tapGestureAddInterfaceTest() {
  describe('tapGestureAddInterfaceTest', () => {
    beforeEach(async (done: Function) => {
      console.info("tapGestureAddInterfaceTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/tapGestureAddInterface/tapgestures',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tapGestureAddInterfaceTest state pages:" + JSON.stringify(pages));
        if (!("tapgestures" == pages.name)) {
          console.info("get PapGestureAddInterfaceTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PapGestureAddInterfaceTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push  PapGestureAddInterfaceTest page error:" + err);
      }
      console.info("PapGestureAddInterfaceTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("PapGestureAddInterfaceTest  after each called");
    });

    /**
     * @tc.number
     * @tc.name      tapGestureAddInterfaceTest_0010
     * @tc.desc      api test response  double click in the distanceThreshold value
     * @tc.level:    Level
     * @tc.type :
     * @tc.size :
     */
    it('tapGestureAddInterfaceTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('tapGestureAddInterfaceTest_0010 START');
      await CommonFunc.sleep(150);
      let column1 = CommonFunc.getComponentRectOnScreen('interfaceTestKey');
      console.info('tapGestureAddInterfaceTest_0010 column1', column1.left, column1.top, column1.right, column1.bottom);
      let width = column1.right - column1.left;
      let height = column1.bottom - column1.top;
      console.info('tapGestureAddInterfaceTest_0010 column1 width = ' + width + ",height = " + height);
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('interfaceTestKey'));
      await driver.doubleClick(Math.round(column1.left + vp2px(10)),Math.round(column1.top + vp2px(10)));
      await CommonFunc.sleep(3000)
      let tt1 = getInspectorByKey('valueKey');
      let obj: ESObject = JSON.parse(tt1);
      console.info('SwipeGestureExample02Test_0010 obj $attrs content '+ obj.$attrs.content);
      // check the click event  whether response
      let dataE:ESObject = JSON.parse(obj.$attrs.content);
      expect(Math.abs(dataE.localX - 10) <= 1).assertTrue();
      expect(Math.abs(dataE.localY -10) <=1 ).assertTrue();

      // click the distanceThreshold range
      await driver.doubleClick(Math.round(column1.left + width/2 - vp2px(10)),Math.round(column1.top + vp2px(10)));
      await CommonFunc.sleep(4000)
      let tt2 = getInspectorByKey('valueKey');
      let obj2: ESObject = JSON.parse(tt2);
      console.info('tapGestureAddInterfaceTest_0010 obj2 $attrs content '+ obj2.$attrs.content)
       // check the click event  whether response
      let dataE2: ESObject = JSON.parse(obj2.$attrs.content);
      expect(Math.abs(dataE2.localX - 90) <= 1).assertTrue();
      expect(Math.abs(dataE2.localY - 10) <= 1).assertTrue();
      console.info('tapGestureAddInterfaceTest_0010 end');
      done();
    });

    /**
     * @tc.number
     * @tc.name      tapGestureAddInterfaceTest_0020
     * @tc.desc      api test response  double click out of the distanceThreshold value
     * @tc.level:    Level
     * @tc.type :
     * @tc.size :
     */
    it('tapGestureAddInterfaceTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('tapGestureAddInterfaceTest_0020 START');
      await CommonFunc.sleep(150);
      let column1 = CommonFunc.getComponentRectOnScreen('interfaceTestKey');
      console.info('tapGestureAddInterfaceTest_0010 column1', column1.left, column1.top, column1.right, column1.bottom);
      let width = column1.right - column1.left;
      let height = column1.bottom - column1.top;
      console.info('tapGestureAddInterfaceTest_0010 column1 width = ' + width + ",height = " + height);
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('interfaceTestKey'));
      await driver.doubleClick(Math.round(column1.left + vp2px(10)),Math.round(column1.top + vp2px(10)));
      await CommonFunc.sleep(3000)
      let tt1 = getInspectorByKey('valueKey');
      let obj: ESObject = JSON.parse(tt1);
      console.info('SwipeGestureExample02Test_0010 obj $attrs content '+ obj.$attrs.content);
      // check the click event  whether response
      let dataE:ESObject = JSON.parse(obj.$attrs.content);
      expect(Math.abs(dataE.localX - 10) <= 1).assertTrue();
      expect(Math.abs(dataE.localY - 10) <= 1).assertTrue();

      // swipe the distanceThreshold range
      await driver.swipe(Math.round(column1.left + vp2px(10)),Math.round(column1.top + vp2px(10)),Math.round(column1.left + vp2px(80)), Math.round(column1.top + vp2px(10)));
      await CommonFunc.sleep(3000)
      let tt2 = getInspectorByKey('valueKey');
      let obj2: ESObject = JSON.parse(tt2);
      console.info('tapGestureAddInterfaceTest_0020 obj2 $attrs content '+ obj2.$attrs.content)
      // check the click event  whether response
      let dataE2: ESObject = JSON.parse(obj2.$attrs.content);
      expect(Math.abs(dataE2.localX - 80) <= 1).assertTrue();
      expect(Math.abs(dataE2.localY - 10) <= 1).assertTrue();

       // swipe the distanceThreshold range
      await driver.swipe(Math.round(column1.left + vp2px(10)),Math.round(column1.top + vp2px(10)),Math.round(column1.left + vp2px(130)), Math.round(column1.top + vp2px(10)));
      await CommonFunc.sleep(3000)
      let tt3 = getInspectorByKey('valueKey');
      let obj3: ESObject = JSON.parse(tt3);
      console.info('tapGestureAddInterfaceTest_0020 obj3 $attrs content '+ obj3.$attrs.content)
      // check the click event  whether response
      let dataE3: ESObject = JSON.parse(obj3.$attrs.content);
      expect(Math.abs(dataE3.localX - 80) <= 1).assertTrue();
      expect(Math.abs(dataE3.localY - 10) <= 1).assertTrue();


      console.info('tapGestureAddInterfaceTest_0020 end');
      done();
    });

    /**
     * @tc.number
     * @tc.name      tapGestureAddInterfaceTest_0030
     * @tc.desc      api test response single click in the distanceThreshold value
     * @tc.level:    Level
     * @tc.type :
     * @tc.size :
     */
    it('tapGestureAddInterfaceTest_0030', Level.LEVEL0, async (done: Function) => {
      console.info('tapGestureAddInterfaceTest_0010 START');
      await CommonFunc.sleep(150);
      let column1 = CommonFunc.getComponentRectOnScreen('interfaceTestKey');
      console.info('tapGestureAddInterfaceTest_0010 column1', column1.left, column1.top, column1.right, column1.bottom);
      let width = column1.right - column1.left;
      let height = column1.bottom - column1.top;
      console.info('tapGestureAddInterfaceTest_0010 column1 width = ' + width + ",height = " + height);
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('interfaceTestKey'));
      await driver.click(Math.round(column1.left + vp2px(10)),Math.round(column1.top + vp2px(10)));
      await CommonFunc.sleep(3000)
      let tt1 = getInspectorByKey('valueKey');
      let obj: ESObject = JSON.parse(tt1);
      console.info('SwipeGestureExample02Test_0010 obj $attrs content '+ obj.$attrs.content);
      // check the click event  whether response
      let dataE:ESObject = JSON.parse(obj.$attrs.content);
      expect(Math.abs(dataE.localX - 10) <= 1).assertTrue();
      expect(Math.abs(dataE.localY - 10) <= 1).assertTrue();

      // click the distanceThreshold range
      await driver.click(Math.round(column1.left + width/2 - vp2px(10)),Math.round(column1.top + vp2px(10)));
      await CommonFunc.sleep(4000)
      let tt2 = getInspectorByKey('valueKey');
      let obj2: ESObject = JSON.parse(tt2);
      console.info('tapGestureAddInterfaceTest_0010 obj2 $attrs content '+ obj2.$attrs.content)
       // check the click event  whether response
      let dataE2: ESObject = JSON.parse(obj2.$attrs.content);
      expect(Math.abs(dataE2.localX - 90) <= 1).assertTrue();
      expect(Math.abs(dataE2.localY - 10) <= 1).assertTrue();
      console.info('tapGestureAddInterfaceTest_0010 end');
      done();
    });

    /**
     * @tc.number
     * @tc.name      tapGestureAddInterfaceTest_0040
     * @tc.desc      api test response single click out of the distanceThreshold value
     * @tc.level:    Level
     * @tc.type :
     * @tc.size :
     */
    it('tapGestureAddInterfaceTest_0040', Level.LEVEL0, async (done: Function) => {
      console.info('tapGestureAddInterfaceTest_0020 START');
      await CommonFunc.sleep(150);
      let column1 = CommonFunc.getComponentRectOnScreen('interfaceTestKey');
      console.info('tapGestureAddInterfaceTest_0010 column1', column1.left, column1.top, column1.right, column1.bottom);
      let width = column1.right - column1.left;
      let height = column1.bottom - column1.top;
      console.info('tapGestureAddInterfaceTest_0010 column1 width = ' + width + ",height = " + height);
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('interfaceTestKey'));
      await driver.click(Math.round(column1.left + vp2px(10)),Math.round(column1.top + vp2px(10)));
      await CommonFunc.sleep(3000)
      let tt1 = getInspectorByKey('valueKey');
      let obj: ESObject = JSON.parse(tt1);
      console.info('SwipeGestureExample02Test_0010 obj $attrs content '+ obj.$attrs.content);
      // check the click event  whether response
      let dataE:ESObject = JSON.parse(obj.$attrs.content);
      expect(Math.abs(dataE.localX - 10) <= 1).assertTrue();
      expect(Math.abs(dataE.localY - 10) <= 1).assertTrue();

      // swipe the distanceThreshold range
      await driver.swipe(Math.round(column1.left + vp2px(10)),Math.round(column1.top + vp2px(10)),Math.round(column1.left + vp2px(80)), Math.round(column1.top + vp2px(10)));
      await CommonFunc.sleep(3000)
      let tt2 = getInspectorByKey('valueKey');
      let obj2: ESObject = JSON.parse(tt2);
      console.info('tapGestureAddInterfaceTest_0020 obj2 $attrs content '+ obj2.$attrs.content)
      // check the click event  whether response
      let dataE2: ESObject = JSON.parse(obj2.$attrs.content);
      expect(Math.abs(dataE2.localX - 80) <= 1).assertTrue();
      expect(Math.abs(dataE2.localY - 10) <= 1).assertTrue();

       // swipe out of the distanceThreshold range
      await driver.swipe(Math.round(column1.left + vp2px(10)),Math.round(column1.top + vp2px(10)),Math.round(column1.left + vp2px(130)), Math.round(column1.top + vp2px(10)));
      await CommonFunc.sleep(3000)
      let tt3 = getInspectorByKey('valueKey');
      let obj3: ESObject = JSON.parse(tt3);
      console.info('tapGestureAddInterfaceTest_0020 obj3 $attrs content '+ obj3.$attrs.content)
      // check the click event  whether response
      let dataE3: ESObject = JSON.parse(obj3.$attrs.content);
      expect(Math.abs(dataE3.localX - 80) <= 1 ).assertTrue();
      expect(Math.abs(dataE3.localY - 10) <= 1).assertTrue();
      
      console.info('tapGestureAddInterfaceTest_0020 end');
      done();
    });


  })
}
