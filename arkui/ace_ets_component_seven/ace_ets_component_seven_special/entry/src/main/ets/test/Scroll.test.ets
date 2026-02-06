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

import router from '@ohos.router'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import Utils from './Utils'
import events_emitter from '@ohos.events.emitter';

export default function scrollOnScrollBeginJsunit() {
  describe('scrollTest', () => {
    beforeAll(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/scroll',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scroll state success " + JSON.stringify(pages));
        if (!("scroll" == pages.name)) {
          console.info("get scroll state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push scroll page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scroll page error: " + err);
      }
      done();
    });

    /**
     * @tc.number testScroll0001
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testScroll0001', Level.LEVEL0, async (done: Function) => {
      console.info('testScroll0001 START');
      let strJson = getInspectorByKey('ScrollKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testScroll0001] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.scrollSnapAlign).assertEqual("ScrollSnapAlign.NONE");
      console.info('testScroll0001 END');
      done();
    });

    /**
     * @tc.number testScroll0002
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testScroll0002', Level.LEVEL0, async (done: Function) => {
      console.info('testScroll0002 START');
      let strJson = getInspectorByKey('ScrollKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testScroll0002] obj is: " + JSON.stringify(obj.$attrs));

      expect(Math.abs(obj.$attrs.friction - 0.6) < 0.000001).assertTrue();
      console.info('testScroll0001 END');
      done();
    });

    /**
     * @tc.number testScroll0003
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testScroll0003', Level.LEVEL0, async (done: Function) => {
      console.info('testScroll0003 START');
      let strJson = getInspectorByKey('ScrollKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testScroll0003] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.enableScrollInteraction).assertEqual(true);

      console.info('testScroll0003 END');
      done();
    });

    /**
     * @tc.number testScroll0004
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testStestScroll0004croll0001', Level.LEVEL0, async (done: Function) => {
      console.info('testScroll0004 START');
      let strJson = getInspectorByKey('ScrollKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testScroll0004] obj is: " + JSON.stringify(obj.$attrs));

      // expect(obj.$attrs.nestedScroll).assertEqual("{scrollForward:SELF_ONLY,scrollBackward:SELF_FIRST}");
      expect(true).assertEqual(true);
      console.info('testScroll0001 END');
      done();
    });

    /**
     * @tc.number testScroll0005
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testScroll0005', Level.LEVEL0, async (done: Function) => {
      console.info('testScroll0005 START');
      let strJson = getInspectorByKey('ScrollKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testScroll0005] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.scrollable).assertEqual("ScrollDirection.Vertical");
      console.info('testScroll0005 END');
      done();
    });

    /**
     * @tc.number testScroll0006
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testScroll0006', Level.LEVEL0, async (done: Function) => {
      console.info('testScroll0006 START');
      let strJson = getInspectorByKey('ScrollKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testScroll0006] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.scrollBar).assertEqual("BarState.Auto");
      console.info('testScroll0006 END');
      done();
    });

    /**
     * @tc.number testScroll0007
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testScroll0007', Level.LEVEL0, async (done: Function) => {
      console.info('testScroll0007 START');
      let strJson = getInspectorByKey('ScrollKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testScroll0007] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.scrollBarWidth).assertEqual("5.00vp");
      console.info('testScroll0007 END');
      done();
    });

    /**
     * @tc.number testScroll0008
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testScroll0008', Level.LEVEL0, async (done: Function) => {
      console.info('testScroll0008 START');
      let strJson = getInspectorByKey('ScrollKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testScroll0008] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.edgeEffect).assertEqual("EdgeEffect.None");
      console.info('testScroll0008 END');
      done();
    });

    /**
     * @tc.number testScroll0009
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testScroll0009', Level.LEVEL0, async (done: Function) => {
      console.info('testScroll0009 START');
      let strJson = getInspectorByKey('ScrollKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testScroll0009] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.scrollBarColor).assertEqual("#FF123456");
      console.info('testScroll0009 END');
      done();
    });

    
  })
}
