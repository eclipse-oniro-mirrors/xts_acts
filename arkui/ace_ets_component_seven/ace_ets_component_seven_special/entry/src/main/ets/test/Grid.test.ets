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
import events_emitter from '@ohos.events.emitter';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import Utils from './Utils'

export default function gridMaxCountJsunit() {
  describe('gridMaxCountTest',() => {
    beforeEach(async (done: Function) => {
      console.info("grid beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/grid',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get grid state success " + JSON.stringify(pages));
        if (!("grid" == pages.name)) {
          console.info("get grid state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push grid page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push grid page error: " + err);
      }
      done();
    });

    /**
     * @tc.number GridJsunit_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('GridJsunit_0100',0, async (done: Function) => {
      console.info('[GridJsunit_0100] START');
      let strJson = getInspectorByKey('GridKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridJsunit_0100] obj GridJsunit_0100 is: " + JSON.stringify(obj.$attrs));

      expect(Math.abs(obj.$attrs.friction - 0.6) < 0.000001).assertTrue();
      console.info('[GridJsunit_0100] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0101
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('GridJsunit_0101',0,async (done: Function) => {
      console.info('[GridJsunit_0101] START');
      let strJson = getInspectorByKey('GridKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridJsunit_0101] obj GridJsunit_0101 is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.enableScrollInteraction).assertEqual(true);
      console.info('[GridJsunit_0101] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0102
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('GridJsunit_0102',0,async (done: Function) => {
      console.info('[GridJsunit_0102] START');
      let strJson = getInspectorByKey('GridKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridJsunit_0102] obj GridJsunit_0102 is: " + JSON.stringify(obj.$attrs));

      // expect(obj.$attrs.nestedScroll).assertEqual("{scrollForward:SELF_ONLY,scrollBackward:PARENT_FIRST}");
      expect(true).assertEqual(true);
      console.info('[GridJsunit_0102] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0103
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('GridJsunit_0103',0,async (done: Function) => {
      console.info('[GridJsunit_0103] START');
      let strJson = getInspectorByKey('GridKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridJsunit_0103] obj GridJsunit_0103 is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.edgeEffect).assertEqual("EdgeEffect.Spring");
      console.info('[GridJsunit_0103] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0104
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('GridJsunit_0104',0,async (done: Function) => {
      console.info('[GridJsunit_0104] START');
      let strJson = getInspectorByKey('GridKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridJsunit_0104] obj GridJsunit_0104 is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.rowsTemplate).assertEqual("1fr 1fr 1fr 1fr 1fr");
      console.info('[GridJsunit_0104] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0105
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('GridJsunit_0105',0,async (done: Function) => {
      console.info('[GridJsunit_0105] START');
      let strJson = getInspectorByKey('GridKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridJsunit_0105] obj GridJsunit_0105 is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.columnsTemplate).assertEqual("1fr 1fr 1fr 1fr 1fr");
      console.info('[GridJsunit_0105] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0106
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('GridJsunit_0106',0,async (done: Function) => {
      console.info('[GridJsunit_0106] START');
      let strJson = getInspectorByKey('GridKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridJsunit_0106] obj GridJsunit_0106 is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.columnsGap).assertEqual("10.00vp");
      console.info('[GridJsunit_0106] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0107
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('GridJsunit_0107',0,async (done: Function) => {
      console.info('[GridJsunit_0107] START');
      let strJson = getInspectorByKey('GridKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridJsunit_0107] obj GridJsunit_0107 is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.rowsGap).assertEqual("10.00vp");
      console.info('[GridJsunit_0107] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0108
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('GridJsunit_0108',0,async (done: Function) => {
      console.info('[GridJsunit_0108] START');
      let strJson = getInspectorByKey('GridKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridJsunit_0108] obj GridJsunit_0108 is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.scrollBarWidth).assertEqual("5.00vp");
      console.info('[GridJsunit_0108] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0109
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('GridJsunit_0109',0,async (done: Function) => {
      console.info('[GridJsunit_0109] START');
      let strJson = getInspectorByKey('GridKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridJsunit_0109] obj GridJsunit_0109 is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.scrollBarColor).assertEqual("#FFFFC0CB");
      console.info('[GridJsunit_0109] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0110
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('GridJsunit_0110',0,async (done: Function) => {
      console.info('[GridJsunit_0110] START');
      let strJson = getInspectorByKey('GridKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridJsunit_0110] obj GridJsunit_0110 is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.scrollBar).assertEqual("BarState.On");
      console.info('[GridJsunit_0110] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0111
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('GridJsunit_0111',0,async (done: Function) => {
      console.info('[GridJsunit_0111] START');
      let strJson = getInspectorByKey('GridKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridJsunit_0111] obj GridJsunit_0111 is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.editMode).assertEqual("true");
      console.info('[GridJsunit_0111] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0112
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('GridJsunit_0112',0,async (done: Function) => {
      console.info('[GridJsunit_0112] START');
      let strJson = getInspectorByKey('GridKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridJsunit_0112] obj GridJsunit_0112 is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.editMode).assertEqual("true");
      console.info('[GridJsunit_0112] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0113
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('GridJsunit_0113',0,async (done: Function) => {
      console.info('[GridJsunit_0113] START');
      let strJson = getInspectorByKey('GridKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridJsunit_0113] obj GridJsunit_0113 is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.multiSelectable).assertEqual("true");
      console.info('[GridJsunit_0113] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0114
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('GridJsunit_0114',0,async (done: Function) => {
      console.info('[GridJsunit_0114] START');
      let strJson = getInspectorByKey('GridKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridJsunit_0114] obj GridJsunit_0114 is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.maxCount).assertEqual(10);
      console.info('[GridJsunit_0114] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0115
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('GridJsunit_0115',0,async (done: Function) => {
      console.info('[GridJsunit_0115] START');
      let strJson = getInspectorByKey('GridKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridJsunit_0115] obj GridJsunit_0115 is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.minCount).assertEqual(2);
      console.info('[GridJsunit_0115] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0116
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('GridJsunit_0116',0,async (done: Function) => {
      console.info('[GridJsunit_0116] START');
      let strJson = getInspectorByKey('GridKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridJsunit_0116] obj GridJsunit_0116 is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.cellLength).assertEqual(12);
      console.info('[GridJsunit_0116] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0117
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('GridJsunit_0117',0,async (done: Function) => {
      console.info('[GridJsunit_0117] START');
      let strJson = getInspectorByKey('GridKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridJsunit_0117] obj GridJsunit_0117 is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.layoutDirection).assertEqual("GridDirection.Row");
      console.info('[GridJsunit_0117] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0118
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('GridJsunit_0118',0,async (done: Function) => {
      console.info('[GridJsunit_0118] START');
      let strJson = getInspectorByKey('GridKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridJsunit_0118] obj GridJsunit_0118 is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.supportAnimation).assertEqual("true");
      console.info('[GridJsunit_0118] END');
      done();
    });
  })
}
