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
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import Utils from './Utils'
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'

export default function gridJsunit() {
  describe('gridTest', () => {
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
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push grid page error: " + err);
      }
      done();
    });

    /**
     * @tc.number GridJsunit_0100
     * @tc.name Test the properties of components
     * @tc.desc Set friction values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('GridJsunit_0100', 0, async (done: Function) => {
      console.info('[GridJsunit_0100] START');
      let strJson = getInspectorByKey('GridKey1');

      console.info("[GridJsunit_0100] JSON.parse(strJson) GridJsunit_0100 is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));

      expect(JSON.parse(strJson).$attrs.friction).assertEqual(1);
      console.info('[GridJsunit_0100] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0101
     * @tc.name Test the properties of components
     * @tc.desc Set enableScrollInteraction values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('GridJsunit_0101', 0, async (done: Function) => {
      console.info('[GridJsunit_0101] START');
      let strJson = getInspectorByKey('GridKey1');

      console.info("[GridJsunit_0101] JSON.parse(strJson) GridJsunit_0101 is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));

      expect(JSON.parse(strJson).$attrs.enableScrollInteraction).assertEqual(true);
      console.info('[GridJsunit_0101] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0103
     * @tc.name Test the properties of components
     * @tc.desc Set edgeEffect values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('GridJsunit_0103', 0, async (done: Function) => {
      console.info('[GridJsunit_0103] START');
      let strJson = getInspectorByKey('GridKey1');

      console.info("[GridJsunit_0103] JSON.parse(strJson) GridJsunit_0103 is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));

      expect(JSON.parse(strJson).$attrs.edgeEffect).assertEqual("EdgeEffect.Spring");
      console.info('[GridJsunit_0103] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0104
     * @tc.name Test the properties of components
     * @tc.desc Set rowsTemplate values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('GridJsunit_0104', 0, async (done: Function) => {
      console.info('[GridJsunit_0104] START');
      let strJson = getInspectorByKey('GridKey1');

      console.info("[GridJsunit_0104] JSON.parse(strJson) GridJsunit_0104 is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));

      expect(JSON.parse(strJson).$attrs.rowsTemplate).assertEqual("1fr 1fr 1fr 1fr 1fr");
      console.info('[GridJsunit_0104] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0105
     * @tc.name Test the properties of components
     * @tc.desc Set columnsTemplate values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('GridJsunit_0105', 0, async (done: Function) => {
      console.info('[GridJsunit_0105] START');
      let strJson = getInspectorByKey('GridKey1');

      console.info("[GridJsunit_0105] JSON.parse(strJson) GridJsunit_0105 is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));

      expect(JSON.parse(strJson).$attrs.columnsTemplate).assertEqual("1fr 1fr 1fr 1fr 1fr");
      console.info('[GridJsunit_0105] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0106
     * @tc.name Test the properties of components
     * @tc.desc Set columnsGap values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('GridJsunit_0106', 0, async (done: Function) => {
      console.info('[GridJsunit_0106] START');
      let strJson = getInspectorByKey('GridKey1');

      console.info("[GridJsunit_0106] JSON.parse(strJson) GridJsunit_0106 is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));
      expect(JSON.parse(strJson).$attrs.columnsGap).assertEqual("10.00vp");
      console.info('[GridJsunit_0106] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0107
     * @tc.name Test the properties of components
     * @tc.desc Set rowsGap values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('GridJsunit_0107', 0, async (done: Function) => {
      console.info('[GridJsunit_0107] START');
      let strJson = getInspectorByKey('GridKey1');

      console.info("[GridJsunit_0107] JSON.parse(strJson) GridJsunit_0107 is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));

      expect(JSON.parse(strJson).$attrs.rowsGap).assertEqual("10.00vp");
      console.info('[GridJsunit_0107] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0108
     * @tc.name Test the properties of components
     * @tc.desc Set scrollBarWidth values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('GridJsunit_0108', 0, async (done: Function) => {
      console.info('[GridJsunit_0108] START');
      let strJson = getInspectorByKey('GridKey1');

      console.info("[GridJsunit_0108] JSON.parse(strJson) GridJsunit_0108 is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));

      expect(JSON.parse(strJson).$attrs.scrollBarWidth).assertEqual("5.00vp");
      console.info('[GridJsunit_0108] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0109
     * @tc.name Test the properties of components
     * @tc.desc Set scrollBarColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('GridJsunit_0109', 0, async (done: Function) => {
      console.info('[GridJsunit_0109] START');
      let strJson = getInspectorByKey('GridKey1');

      console.info("[GridJsunit_0109] JSON.parse(strJson) GridJsunit_0109 is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));

      expect(JSON.parse(strJson).$attrs.scrollBarColor).assertEqual("#FFFFC0CB");
      console.info('[GridJsunit_0109] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0110
     * @tc.name Test the properties of components
     * @tc.desc Set scrollBar values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('GridJsunit_0110', 0, async (done: Function) => {
      console.info('[GridJsunit_0110] START');
      let strJson = getInspectorByKey('GridKey1');

      console.info("[GridJsunit_0110] JSON.parse(strJson) GridJsunit_0110 is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));

      expect(JSON.parse(strJson).$attrs.scrollBar).assertEqual("BarState.On");
      console.info('[GridJsunit_0110] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0111
     * @tc.name Test the properties of components
     * @tc.desc Set editMode values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('GridJsunit_0111', 0, async (done: Function) => {
      console.info('[GridJsunit_0111] START');
      let strJson = getInspectorByKey('GridKey1');

      console.info("[GridJsunit_0111] JSON.parse(strJson) GridJsunit_0111 is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));

      expect(JSON.parse(strJson).$attrs.editMode).assertEqual("true");
      console.info('[GridJsunit_0111] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0113
     * @tc.name Test the properties of components
     * @tc.desc Set multiSelectable values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('GridJsunit_0113', 0, async (done: Function) => {
      console.info('[GridJsunit_0113] START');
      let strJson = getInspectorByKey('GridKey1');

      console.info("[GridJsunit_0113] JSON.parse(strJson) GridJsunit_0113 is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));

      expect(JSON.parse(strJson).$attrs.multiSelectable).assertEqual("true");
      console.info('[GridJsunit_0113] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0114
     * @tc.name Test the properties of components
     * @tc.desc Set maxCount values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('GridJsunit_0114', 0, async (done: Function) => {
      console.info('[GridJsunit_0114] START');
      let strJson = getInspectorByKey('GridKey1');

      console.info("[GridJsunit_0114] JSON.parse(strJson) GridJsunit_0114 is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));

      expect(JSON.parse(strJson).$attrs.maxCount).assertEqual(10);
      console.info('[GridJsunit_0114] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0115
     * @tc.name Test the properties of components
     * @tc.desc Set minCount values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('GridJsunit_0115', 0, async (done: Function) => {
      console.info('[GridJsunit_0115] START');
      let strJson = getInspectorByKey('GridKey1');

      console.info("[GridJsunit_0115] JSON.parse(strJson) GridJsunit_0115 is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));

      expect(JSON.parse(strJson).$attrs.minCount).assertEqual(2);
      console.info('[GridJsunit_0115] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0116
     * @tc.name Test the properties of components
     * @tc.desc Set cellLength values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('GridJsunit_0116', 0, async (done: Function) => {
      console.info('[GridJsunit_0116] START');
      let strJson = getInspectorByKey('GridKey1');

      console.info("[GridJsunit_0116] JSON.parse(strJson) GridJsunit_0116 is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));

      expect(JSON.parse(strJson).$attrs.cellLength).assertEqual(12);
      console.info('[GridJsunit_0116] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0117
     * @tc.name Test the properties of components
     * @tc.desc Set layoutDirection values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('GridJsunit_0117', 0, async (done: Function) => {
      console.info('[GridJsunit_0117] START');
      let strJson = getInspectorByKey('GridKey1');

      console.info("[GridJsunit_0117] JSON.parse(strJson) GridJsunit_0117 is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));

      expect(JSON.parse(strJson).$attrs.layoutDirection).assertEqual("GridDirection.Row");
      console.info('[GridJsunit_0117] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0118
     * @tc.name Test the properties of components
     * @tc.desc Set supportAnimation values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('GridJsunit_0118', 0, async (done: Function) => {
      console.info('[GridJsunit_0118] START');
      let strJson = getInspectorByKey('GridKey1');

      console.info("[GridJsunit_0118] JSON.parse(strJson) GridJsunit_0118 is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));

      expect(JSON.parse(strJson).$attrs.supportAnimation).assertEqual("true");
      console.info('[GridJsunit_0118] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0120
     * @tc.name Test the properties of components
     * @tc.desc Set cachedCount values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('GridJsunit_0120', 0, async (done: Function) => {
      console.info('[GridJsunit_0120] START');
      let strJson = getInspectorByKey('GridKey1');

      console.info("[GridJsunit_0120] JSON.parse(strJson) GridJsunit_0120 is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));

      expect(JSON.parse(strJson).$attrs.cachedCount).assertEqual(1);
      console.info('[GridJsunit_0120] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0119
     * @tc.name Test the properties of components
     * @tc.desc Change rowsGap values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('GridJsunit_0119', 0, async (done: Function) => {
      console.info('GridJsunit_0119 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('GridKey1');
      console.info("GridJsunit_0119 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));
      expect(JSON.parse(strJsonNew).$attrs.rowsGap).assertEqual('5.00vp');
      console.info('GridJsunit_0119 END');
      done();
    });
  })
}
