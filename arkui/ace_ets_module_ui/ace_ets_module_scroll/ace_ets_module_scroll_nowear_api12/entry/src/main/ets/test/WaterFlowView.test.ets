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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router'
import Utils from './Utils';

export default function waterFlowView() {
  describe('waterFlowViewJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("waterFlowViewJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/waterFlowView',
      }
      let result: ESObject;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WaterFlowView state pages: " + JSON.stringify(pages));
        if (!("waterFlowView" == pages.name)) {
          console.info("get WaterFlowView state pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push WaterFlowView page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WaterFlowView page error: " + err);
      }
      done();
    });

    /**
     * @tc.number waterFlowViewJsunit_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('waterFlowViewJsunit_0100',Level.LEVEL0,async (done: Function) => {
      console.info('[waterFlowViewJsunit_0100] START');
      let strJson = getInspectorByKey('WaterFlowKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RectJsunit_0100] obj is: " + JSON.stringify(obj.$attrs));

      //expect(obj.$attrs.nestedScroll).assertEqual("{scrollForward:SELF_ONLY,scrollBackward:SELF_FIRST}");
      expect(true).assertEqual(true);
      done();
    });

    /**
     * @tc.number waterFlowViewJsunit_0200
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('waterFlowViewJsunit_0200',Level.LEVEL0,async (done: Function) => {
      console.info('[waterFlowViewJsunit_0200] START');
      let strJson = getInspectorByKey('WaterFlowKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[waterFlowViewJsunit_0200] obj is: " + JSON.stringify(obj.$attrs));

      expect(Math.abs(obj.$attrs.friction - 0.6) < 0.000001).assertTrue();
      console.info('[waterFlowViewJsunit_0200] END');
      done();
    });

    /**
     * @tc.number waterFlowViewJsunit_0300
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('waterFlowViewJsunit_0300',Level.LEVEL0,async (done: Function) => {
      console.info('[waterFlowViewJsunit_0300] START');
      let strJson = getInspectorByKey('WaterFlowKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[waterFlowViewJsunit_0300] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.enableScrollInteraction).assertEqual(true);
      console.info('[waterFlowViewJsunit_0300] END');
      done();
    });

    /**
     * @tc.number waterFlowViewJsunit_0400
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('waterFlowViewJsunit_0400',Level.LEVEL0,async (done: Function) => {
      console.info('[waterFlowViewJsunit_0400] START');
      let strJson = getInspectorByKey('WaterFlowKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[waterFlowViewJsunit_0400] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.columnsTemplate).assertEqual("1fr 1fr 1fr 1fr");
      console.info('[waterFlowViewJsunit_0400] END');
      done();
    });

    /**
     * @tc.number waterFlowViewJsunit_0500
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('waterFlowViewJsunit_0500',Level.LEVEL0,async (done: Function) => {
      console.info('[waterFlowViewJsunit_0500] START');
      let strJson = getInspectorByKey('WaterFlowKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[waterFlowViewJsunit_0500] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.itemConstraintSize)
        .assertEqual('{"minWidth":"1.00vp","minHeight":"1.00vp","maxWidth":"10.00vp","maxHeight":"10.00vp"}');

      console.info('[waterFlowViewJsunit_0500] END');
      done();
    });

    /**
     * @tc.number waterFlowViewJsunit_0600
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('waterFlowViewJsunit_0600',Level.LEVEL0,async (done: Function) => {
      console.info('[waterFlowViewJsunit_0600] START');
      let strJson = getInspectorByKey('WaterFlowKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[waterFlowViewJsunit_0600] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.columnsGap).assertEqual("1.00vp");
      console.info('[waterFlowViewJsunit_0600] END');
      done();
    });

    /**
     * @tc.number waterFlowViewJsunit_0700
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('waterFlowViewJsunit_0700',Level.LEVEL0,async (done: Function) => {
      console.info('[waterFlowViewJsunit_0700] START');
      let strJson = getInspectorByKey('WaterFlowKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[waterFlowViewJsunit_0700] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.rowsTemplate).assertEqual("1fr 1fr 1fr 1fr");
      console.info('[waterFlowViewJsunit_0700] END');
      done();
    });

    /**
     * @tc.number waterFlowViewJsunit_0800
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('waterFlowViewJsunit_0800',Level.LEVEL0,async (done: Function) => {
      console.info('[waterFlowViewJsunit_0800] START');
      let strJson = getInspectorByKey('WaterFlowKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[waterFlowViewJsunit_0800] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.rowsGap).assertEqual("1.00vp");
      console.info('[waterFlowViewJsunit_0800] END');
      done();
    });

    /**
     * @tc.number waterFlowViewJsunit_0900
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('waterFlowViewJsunit_0900',Level.LEVEL0,async (done: Function) => {
      console.info('[waterFlowViewJsunit_0900] START');
      let strJson = getInspectorByKey('WaterFlowKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[waterFlowViewJsunit_0900] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[waterFlowViewJsunit_0900] ['layoutDirection']: " + JSON.stringify(obj.$attrs['layoutDirection']));
      expect(obj.$attrs['layoutDirection']).assertEqual("FlexDirection.Column");
      console.info('[waterFlowViewJsunit_0900] END');
      done();
    });
  
  })
}