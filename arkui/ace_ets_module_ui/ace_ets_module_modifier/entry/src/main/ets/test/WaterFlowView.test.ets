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
import Utils from './Utils';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'

export default function waterFlowView() {
  describe('waterFlowTest', () => {
    beforeEach(async (done: Function) => {
      console.info("waterFlowViewJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/waterFlowView',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get WaterFlowView state pages: " + JSON.stringify(pages));
        if (!("waterFlowView" == pages.name)) {
          console.info("get WaterFlowView state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push WaterFlowView page error: " + err);
      }
      done();
    });

    /**
     * @tc.number waterFlowViewJsunit_0200
     * @tc.name Test the properties of components
     * @tc.desc Set friction values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('waterFlowViewJsunit_0200', 0, async (done: Function) => {
      console.info('[waterFlowViewJsunit_0200] START');
      let strJson = getInspectorByKey('WaterFlowKey1');
      let obj = JSON.parse(strJson);
      console.info("[waterFlowViewJsunit_0200] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.friction).assertEqual(1);
      console.info('[waterFlowViewJsunit_0200] END');
      done();
    });

    /**
     * @tc.number waterFlowViewJsunit_0300
     * @tc.name Test the properties of components
     * @tc.desc Set enableScrollInteraction values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('waterFlowViewJsunit_0300', 0, async (done: Function) => {
      console.info('[waterFlowViewJsunit_0300] START');
      let strJson = getInspectorByKey('WaterFlowKey1');
      let obj = JSON.parse(strJson);
      console.info("[waterFlowViewJsunit_0300] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.enableScrollInteraction).assertEqual(true);
      console.info('[waterFlowViewJsunit_0300] END');
      done();
    });

    /**
     * @tc.number waterFlowViewJsunit_0400
     * @tc.name Test the properties of components
     * @tc.desc Set columnsTemplate values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('waterFlowViewJsunit_0400', 0, async (done: Function) => {
      console.info('[waterFlowViewJsunit_0400] START');
      let strJson = getInspectorByKey('WaterFlowKey1');
      let obj = JSON.parse(strJson);
      console.info("[waterFlowViewJsunit_0400] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.columnsTemplate).assertEqual("1fr 1fr 1fr 1fr");
      console.info('[waterFlowViewJsunit_0400] END');
      done();
    });

    /**
     * @tc.number waterFlowViewJsunit_0500
     * @tc.name Test the properties of components
     * @tc.desc Set itemConstraintSize values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('waterFlowViewJsunit_0500', 0, async (done: Function) => {
      console.info('[waterFlowViewJsunit_0500] START');
      let strJson = getInspectorByKey('WaterFlowKey1');
      let obj = JSON.parse(strJson);
      console.info("[waterFlowViewJsunit_0500] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.itemConstraintSize)
        .assertEqual('{"minWidth":"1.00vp","minHeight":"1.00vp","maxWidth":"10.00vp","maxHeight":"10.00vp"}');
      console.info('[waterFlowViewJsunit_0500] END');
      done();
    });

    /**
     * @tc.number waterFlowViewJsunit_0600
     * @tc.name Test the properties of components
     * @tc.desc Set columnsGap values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('waterFlowViewJsunit_0600', 0, async (done: Function) => {
      console.info('[waterFlowViewJsunit_0600] START');
      let strJson = getInspectorByKey('WaterFlowKey1');
      let obj = JSON.parse(strJson);
      console.info("[waterFlowViewJsunit_0600] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.columnsGap).assertEqual("1.00vp");
      console.info('[waterFlowViewJsunit_0600] END');
      done();
    });

    /**
     * @tc.number waterFlowViewJsunit_0700
     * @tc.name Test the properties of components
     * @tc.desc Set rowsTemplate values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('waterFlowViewJsunit_0700', 0, async (done: Function) => {
      console.info('[waterFlowViewJsunit_0700] START');
      let strJson = getInspectorByKey('WaterFlowKey1');
      let obj = JSON.parse(strJson);
      console.info("[waterFlowViewJsunit_0700] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.rowsTemplate).assertEqual("1fr 1fr 1fr 1fr");
      console.info('[waterFlowViewJsunit_0700] END');
      done();
    });

    /**
     * @tc.number waterFlowViewJsunit_0800
     * @tc.name Test the properties of components
     * @tc.desc Set rowsGap values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('waterFlowViewJsunit_0800', 0, async (done: Function) => {
      console.info('[waterFlowViewJsunit_0800] START');
      let strJson = getInspectorByKey('WaterFlowKey1');
      let obj = JSON.parse(strJson);
      console.info("[waterFlowViewJsunit_0800] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.rowsGap).assertEqual("1.00vp");
      console.info('[waterFlowViewJsunit_0800] END');
      done();
    });

    /**
     * @tc.number waterFlowViewJsunit_0900
     * @tc.name Test the properties of components
     * @tc.desc Set layoutDirection values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('waterFlowViewJsunit_0900', 0, async (done: Function) => {
      console.info('[waterFlowViewJsunit_0900] START');
      let strJson = getInspectorByKey('WaterFlowKey1');
      let obj = JSON.parse(strJson);
      console.info("[waterFlowViewJsunit_0900] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs['layoutDirection ']).assertEqual("FlexDirection.Column");
      console.info('[waterFlowViewJsunit_0900] END');
      done();
    });

    /**
     * @tc.number waterFlowViewJsunit_1000
     * @tc.name Test the properties of components
     * @tc.desc Change columnsGap values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('waterFlowViewJsunit_1000', 0, async (done: Function) => {
      console.info('waterFlowViewJsunit_1000 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)
      let strJsonNew = getInspectorByKey('WaterFlowKey1');
      let objNew = JSON.parse(strJsonNew);
      console.info("waterFlowViewJsunit_1000 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.columnsGap).assertEqual('2.00vp');
      console.info('waterFlowViewJsunit_1000 END');
      done();
    });
  })
}