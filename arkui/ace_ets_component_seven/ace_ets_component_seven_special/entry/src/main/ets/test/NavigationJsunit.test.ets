/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import router from '@ohos.router'
import { UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import { MessageManager, Callback } from '../MainAbility/utils/MessageManager';

export default function navigationJsunit() {
  describe('NavigationJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("NavigationJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/navigation',
      }
      let result: ESObject;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationJsunit state pages: " + JSON.stringify(pages));
        if (!("navigation" == pages.name)) {
          console.info("get NavigationJsunit state pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);

          console.info("push NavigationJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavigationJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number NavigationJsunit_1000
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('NavigationJsunit_1000', Level.LEVEL0, async (done: Function) => {
      console.info('[NavigationJsunit_1000] START');
      let strJson = getInspectorByKey('navigation1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[NavigationJsunit_1000] component obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.minContentWidth).assertEqual('10.00px');
      console.info('[NavigationJsunit_1000] END');
      done();
    });

    /**
     * @tc.number NavigationJsunit_1001
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('NavigationJsunit_1001', Level.LEVEL0, async (done: Function) => {
     
      console.info('[NavigationJsunit_1001] START');
      let strJson = getInspectorByKey('navigation1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[NavigationJsunit_1001] component obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.navBarWidthRange).assertEqual("300.00vp, 800.00vp");
      console.info('[NavigationJsunit_1001] END');
      done();
    });

    /**
     * @tc.number NavigationJsunit_1002
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('NavigationJsunit_1002', Level.LEVEL0, async (done: Function) => {
     
      console.info('[NavigationJsunit_1002] START');
      let strJson = getInspectorByKey('navigation1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[NavigationJsunit_1002] component obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.navBarWidth).assertEqual('120.00vp');
      console.info('[NavigationJsunit_1002] END');
      done();
    });

    /**
     * @tc.number NavigationJsunit_1003
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('NavigationJsunit_1003', Level.LEVEL0, async (done: Function) => {
     
      console.info('[NavigationJsunit_1003] START');
      let strJson = getInspectorByKey('navigation1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[NavigationJsunit_1003] component obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.navBarPosition).assertEqual('NavBarPosition.Start');
      console.info('[NavigationJsunit_1003] END');
      done();
    });

    /**
     * @tc.number NavigationJsunit_1004
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('NavigationJsunit_1004', Level.LEVEL0, async (done: Function) => {
     
      console.info('[NavigationJsunit_1004] START');
      let strJson = getInspectorByKey('navigation1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[NavigationJsunit_1004] component obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.mode).assertEqual('NavigationMode.SPLIT');
      console.info('[NavigationJsunit_1004] END');
      done();
    });

    /**
     * @tc.number NavigationJsunit_1005
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('NavigationJsunit_1005', Level.LEVEL0, async (done: Function) => {
     
      console.info('[NavigationJsunit_1005] START');
      let strJson = getInspectorByKey('navigation1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[NavigationJsunit_1005] component obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.backButtonIcon).assertEqual('resources/base/media/icon.png');
      console.info('[NavigationJsunit_1005] END');
      done();
    });

    /**
     * @tc.number NavigationJsunit_1006
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('NavigationJsunit_1006', Level.LEVEL0, async (done: Function) => {
     
      console.info('[NavigationJsunit_1006] START');
      let strJson = getInspectorByKey('navigation1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[NavigationJsunit_1006] component obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.hideNavBar).assertEqual(false);
      console.info('[NavigationJsunit_1006] END');
      done();
    });

    /**
     * @tc.number NavigationJsunit_1007
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('NavigationJsunit_1007', Level.LEVEL0, async (done: Function) => {
     
      console.info('[NavigationJsunit_1007] START');
      let strJson = getInspectorByKey('navigation1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[NavigationJsunit_1007] component obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.hideTitleBar).assertEqual(false);
      console.info('[NavigationJsunit_1007] END');
      done();
    });

    /**
     * @tc.number NavigationJsunit_1008
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('NavigationJsunit_1008', Level.LEVEL0, async (done: Function) => {
      console.info('[NavigationJsunit_1008] START');
      let strJson = getInspectorByKey('navigation1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[NavigationJsunit_1008] component obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.subtitle).assertEqual('test');
      console.info('[NavigationJsunit_1008] END');
      done();
    });

    /**
     * @tc.number NavigationJsunit_1009
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('NavigationJsunit_1009', Level.LEVEL0, async (done: Function) => {
     
      console.info('[NavigationJsunit_1009] START');
      let strJson = getInspectorByKey('navigation1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[NavigationJsunit_1009] component obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.hideBackButton).assertEqual(false);
      console.info('[NavigationJsunit_1009] END');
      done();
    });

    /**
     * @tc.number NavigationJsunit_1010
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('NavigationJsunit_1010', Level.LEVEL0, async (done: Function) => {
     
      console.info('[NavigationJsunit_1010] START');
      let strJson = getInspectorByKey('navigation1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[NavigationJsunit_1010] component obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.titleMode).assertEqual('NavigationTitleMode.Free');
      console.info('[NavigationJsunit_1010] END');
      done();
    });

    /**
     * @tc.number NavigationJsunit_1011
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('NavigationJsunit_1011', Level.LEVEL0, async (done: Function) => {
     
      console.info('[NavigationJsunit_1011] START');
      let strJson = getInspectorByKey('navigation1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[NavigationJsunit_1011] component obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.hideToolBar).assertEqual(false);
      console.info('[NavigationJsunit_1011] END');
      done();
    });
  })
}
