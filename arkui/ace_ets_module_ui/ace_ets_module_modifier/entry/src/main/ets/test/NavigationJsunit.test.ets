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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
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
import { MessageManager, Callback } from '../MainAbility/utils/MessageManager';
import Utils from './Utils';

export default function navigationJsunit() {
  describe('navigationTest', () => {
    beforeEach(async (done: Function) => {
      console.info("NavigationJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/navigation',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationJsunit state pages: " + JSON.stringify(pages));
        if (!("navigation" == pages.name)) {
          console.info("get NavigationJsunit state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push NavigationJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number NavigationJsunit_1000
     * @tc.name Test the properties of components
     * @tc.desc Set minContentWidth values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('NavigationJsunit_1000', 0, async (done: Function) => {

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
     * @tc.name Test the properties of components
     * @tc.desc Set navBarWidthRange values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('NavigationJsunit_1001', 0, async (done: Function) => {

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
     * @tc.name Test the properties of components
     * @tc.desc Set navBarWidth values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('NavigationJsunit_1002', 0, async (done: Function) => {

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
     * @tc.name Test the properties of components
     * @tc.desc Set navBarPosition values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('NavigationJsunit_1003', 0, async (done: Function) => {

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
     * @tc.name Test the properties of components
     * @tc.desc Set mode values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('NavigationJsunit_1004', 0, async (done: Function) => {

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
     * @tc.name Test the properties of components
     * @tc.desc Set backButtonIcon values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('NavigationJsunit_1005', 0, async (done: Function) => {

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
     * @tc.name Test the properties of components
     * @tc.desc Set hideNavBar values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('NavigationJsunit_1006', 0, async (done: Function) => {

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
     * @tc.name Test the properties of components
     * @tc.desc Set hideTitleBar values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('NavigationJsunit_1007', 0, async (done: Function) => {

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
     * @tc.name Test the properties of components
     * @tc.desc Set subtitle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('NavigationJsunit_1008', 0, async (done: Function) => {

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
     * @tc.name Test the properties of components
     * @tc.desc Set hideBackButton values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('NavigationJsunit_1009', 0, async (done: Function) => {

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
     * @tc.name Test the properties of components
     * @tc.desc Set titleMode values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('NavigationJsunit_1010', 0, async (done: Function) => {

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
     * @tc.name Test the properties of components
     * @tc.desc Set hideToolBar values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('NavigationJsunit_1011', 0, async (done: Function) => {

      console.info('[NavigationJsunit_1011] START');
      let strJson = getInspectorByKey('navigation1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[NavigationJsunit_1011] component obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.hideToolBar).assertEqual(false);
      console.info('[NavigationJsunit_1011] END');
      done();
    });

    /**
     * @tc.number NavigationJsunit_1012
     * @tc.name Test the properties of components
     * @tc.desc Change minContentWidth values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('NavigationJsunit_1012', 0, async (done: Function) => {
      console.info('[NavigationJsunit_1012] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJson = getInspectorByKey('navigation1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[NavigationJsunit_1012] component obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.minContentWidth).assertEqual('20.00px');
      console.info('[NavigationJsunit_1012] END');
      done();
    });
  })
}
