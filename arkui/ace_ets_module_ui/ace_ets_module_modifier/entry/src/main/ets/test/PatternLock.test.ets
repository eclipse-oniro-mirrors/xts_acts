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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';

export default function patternLockJsunit() {
  describe('patternLockTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/patternLock',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get patternLock state success " + JSON.stringify(pages));
        if (!("patternLock" == pages.name)) {
          console.info("get patternLock state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(1000);
        }
      } catch (err) {
        console.error("push patternLock page error: " + err);
      }
      done();
    });

    /**
     * @tc.number patternLockTest_0001
     * @tc.name Test the properties of components
     * @tc.desc Set sideLength values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('patternLockTest_0001', Level.LEVEL0, async (done: Function) => {
      console.info('patternLockTest_0001 START');
      let strJsonNew = getInspectorByKey('patternLock');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("patternLockTest_0001 component  is: " + JSON.stringify(objNew.$attrs));

      expect(objNew.$attrs.sideLength).assertEqual("0.00vp");
      console.info('patternLockTest_0001 END');
      done();
    });

    /**
     * @tc.number patternLockTest_0002
     * @tc.name Test the properties of components
     * @tc.desc Set circleRadius values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('patternLockTest_0002', Level.LEVEL0, async (done: Function) => {
      console.info('patternLockTest_0002 START');
      let strJsonNew = getInspectorByKey('patternLock');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("patternLockTest_0002 component  is: " + JSON.stringify(objNew.$attrs));

      expect(objNew.$attrs.circleRadius).assertEqual("10.00vp");
      console.info('patternLockTest_0002 END');
      done();
    });

    /**
     * @tc.number patternLockTest_0003
     * @tc.name Test the properties of components
     * @tc.desc Set selectedColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('patternLockTest_0003', Level.LEVEL0, async (done: Function) => {
      console.info('patternLockTest_0003 START');
      let strJsonNew = getInspectorByKey('patternLock');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("patternLockTest_0003 component  is: " + JSON.stringify(objNew.$attrs));

      expect(objNew.$attrs.selectedColor).assertEqual("#FF123456");
      console.info('patternLockTest_0003 END');
      done();
    });

    /**
     * @tc.number patternLockTest_0004
     * @tc.name Test the properties of components
     * @tc.desc Set regularColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('patternLockTest_0004', Level.LEVEL0, async (done: Function) => {
      console.info('patternLockTest_0004 START');
      let strJsonNew = getInspectorByKey('patternLock');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("patternLockTest_0004 component  is: " + JSON.stringify(objNew.$attrs));

      expect(objNew.$attrs.regularColor).assertEqual("#FF123456");
      console.info('patternLockTest_0004 END');
      done();
    });

    /**
     * @tc.number patternLockTest_0005
     * @tc.name Test the properties of components
     * @tc.desc Set activeColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('patternLockTest_0005', Level.LEVEL0, async (done: Function) => {
      console.info('patternLockTest_0005 START');
      let strJsonNew = getInspectorByKey('patternLock');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("patternLockTest_0005 component  is: " + JSON.stringify(objNew.$attrs));

      expect(objNew.$attrs.activeColor).assertEqual("#FF123456");
      console.info('patternLockTest_0005 END');
      done();
    });

    /**
     * @tc.number patternLockTest_0006
     * @tc.name Test the properties of components
     * @tc.desc Set pathColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('patternLockTest_0006', Level.LEVEL0, async (done: Function) => {
      console.info('patternLockTest_0006 START');
      let strJsonNew = getInspectorByKey('patternLock');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("patternLockTest_0006 component  is: " + JSON.stringify(objNew.$attrs));

      expect(objNew.$attrs.pathColor).assertEqual("#FF123456");
      console.info('patternLockTest_0006 END');
      done();
    });

    /**
     * @tc.number patternLockTest_0007
     * @tc.name Test the properties of components
     * @tc.desc Set pathStrokeWidth values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('patternLockTest_0007', Level.LEVEL0, async (done: Function) => {
      console.info('patternLockTest_0007 START');
      let strJsonNew = getInspectorByKey('patternLock');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("patternLockTest_0007 component  is: " + JSON.stringify(objNew.$attrs));

      expect(objNew.$attrs.pathStrokeWidth).assertEqual("12.00vp");
      console.info('patternLockTest_0007 END');
      done();
    });

    /**
     * @tc.number patternLockTest_0008
     * @tc.name Test the properties of components
     * @tc.desc Set autoReset values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('patternLockTest_0008', Level.LEVEL0, async (done: Function) => {
      console.info('patternLockTest_0008 START');
      let strJsonNew = getInspectorByKey('patternLock');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("patternLockTest_0008 component  is: " + JSON.stringify(objNew.$attrs));

      expect(objNew.$attrs.autoReset).assertEqual("true");
      console.info('patternLockTest_0008 END');
      done();
    });

    /**
     * @tc.number patternLockTest_0009
     * @tc.name Test the properties of components
     * @tc.desc Change sideLength values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('patternLockTest_0009', Level.LEVEL0, async (done: Function) => {

      console.info('patternLockTest_0009 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('patternLock');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("patternLockTest_0009 component  is: " + JSON.stringify(objNew.$attrs));

      expect(objNew.$attrs.sideLength).assertEqual("0.00vp");
      console.info('patternLockTest_0009 END');
      done();
    });
  })
}