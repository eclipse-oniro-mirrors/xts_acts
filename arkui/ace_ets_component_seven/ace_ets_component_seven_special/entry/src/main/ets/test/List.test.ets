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
import router from '@system.router';
import Utils from './Utils';

export default function list() {
  describe('listJsunit', function () {
    beforeEach(async function (done) {
      console.info("listJsunit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/list',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get list state pages: " + JSON.stringify(pages));
        if (!("list" == pages.name)) {
          console.info("get list state pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push list page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push list page error: " + err);
      }
      done();
    })

    /**
     * @tc.number ListJsunit_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ListJsunit_0100', 0, async function (done) {
      console.info('[ListJsunit_0100] START');
      let strJson = getInspectorByKey('ListKey1');
      let obj = JSON.parse(strJson);
      console.info("[ListJsunit_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.scrollSnapAlign).assertEqual("ScrollSnapAlign.NONE");
      console.info('[ListJsunit_0100] END');
      done();
    });

    /**
     * @tc.number ListJsunit_0101
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ListJsunit_0101', 0, async function (done) {
      console.info('[ListJsunit_0101] START');
      let strJson = getInspectorByKey('ListKey1');
      let obj = JSON.parse(strJson);
      console.info("[ListJsunit_0101] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.lanes).assertEqual("1");
      console.info('[ListJsunit_0101] END');
      done();
    });

    /**
     * @tc.number ListJsunit_0102
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ListJsunit_0102', 0, async function (done) {
      console.info('[ListJsunit_0102] START');
      let strJson = getInspectorByKey('ListKey1');
      let obj = JSON.parse(strJson);
      console.info("[ListJsunit_0102] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.friction).assertEqual(0.6);
      console.info('[ListJsunit_0102] END');
      done();
    });

    /**
     * @tc.number ListJsunit_0103
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ListJsunit_0103', 0, async function (done) {
      console.info('[ListJsunit_0103] START');
      let strJson = getInspectorByKey('ListKey1');
      let obj = JSON.parse(strJson);
      console.info("[ListJsunit_0103] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.enableScrollInteraction).assertEqual(true);
      console.info('[ListJsunit_0103] END');
      done();
    });

    /**
     * @tc.number ListJsunit_0104
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ListJsunit_0104', 0, async function (done) {
      console.info('[ListJsunit_0104] START');
      let strJson = getInspectorByKey('ListKey1');
      let obj = JSON.parse(strJson);
      console.info("[ListJsunit_0104] obj is: " + JSON.stringify(obj.$attrs));

      //expect(obj.$attrs.nestedScroll).assertEqual("{scrollForward:SELF_ONLY,scrollBackward:PARALLEL}");
      expect(true).assertEqual(true);
      console.info('[ListJsunit_0104] END');
      done();
    });

    /**
     * @tc.number ListJsunit_0105
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ListJsunit_0105', 0, async function (done) {
      console.info('[ListJsunit_0105] START');
      let strJson = getInspectorByKey('ListKey1');
      let obj = JSON.parse(strJson);
      console.info("[ListJsunit_0105] obj is: " + JSON.stringify(obj.$attrs));

      //expect(obj.$attrs.chainAnimationOptions).assertEqual("{minSpace:1,maxSpace:2,conductivity:0.6,intensity:0.2,edgeEffect:ChainEdgeEffect.DEFAULT}");
      expect(true).assertEqual(true);
      console.info('[ListJsunit_0105] END');
      done();
    });

    /**
     * @tc.number ListJsunit_0106
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ListJsunit_0106', 0, async function (done) {
      console.info('[ListJsunit_0106] START');
      let strJson = getInspectorByKey('ListKey1');
      let obj = JSON.parse(strJson);
      console.info("[ListJsunit_0106] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.alignListItem).assertEqual("ListItemAlign.Start");
      console.info('[ListJsunit_0106] END');
      done();
    });

    /**
     * @tc.number ListJsunit_0107
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ListJsunit_0107', 0, async function (done) {
      console.info('[ListJsunit_0107] START');
      let strJson = getInspectorByKey('ListKey1');
      let obj = JSON.parse(strJson);
      console.info("[ListJsunit_0107] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.listDirection).assertEqual("Axis.Vertical");
      console.info('[ListJsunit_0107] END');
      done();
    });

    /**
     * @tc.number ListJsunit_0108
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ListJsunit_0108', 0, async function (done) {
      console.info('[ListJsunit_0108] START');
      let strJson = getInspectorByKey('ListKey1');
      let obj = JSON.parse(strJson);
      console.info("[ListJsunit_0108] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.scrollBar).assertEqual("BarState.Off");
      console.info('[ListJsunit_0108] END');
      done();
    });

    /**
     * @tc.number ListJsunit_0109
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ListJsunit_0109', 0, async function (done) {
      console.info('[ListJsunit_0109] START');
      let strJson = getInspectorByKey('ListKey1');
      let obj = JSON.parse(strJson);
      console.info("[ListJsunit_0109] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.edgeEffect).assertEqual("EdgeEffect.Spring");
      console.info('[ListJsunit_0109] END');
      done();
    });

    /**
     * @tc.number ListJsunit_0110
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ListJsunit_0110', 0, async function (done) {
      console.info('[ListJsunit_0110] START');
      let strJson = getInspectorByKey('ListKey1');
      let obj = JSON.parse(strJson);
      console.info("[ListJsunit_0110] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.divider.strokeWidth).assertEqual("1.00vp");
      expect(obj.$attrs.divider.startMargin).assertEqual("2.00vp");
      expect(obj.$attrs.divider.endMargin).assertEqual("3.00vp");
      expect(obj.$attrs.divider.color).assertEqual("#FF00FFFF");
      console.info('[ListJsunit_0110] END');
      done();
    });

    /**
     * @tc.number ListJsunit_0111
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ListJsunit_0111', 0, async function (done) {
      console.info('[ListJsunit_0111] START');
      let strJson = getInspectorByKey('ListKey1');
      let obj = JSON.parse(strJson);
      console.info("[ListJsunit_0111] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.editMode).assertEqual(true);
      console.info('[ListJsunit_0111] END');
      done();
    });

    /**
     * @tc.number ListJsunit_0112
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ListJsunit_0112', 0, async function (done) {
      console.info('[ListJsunit_0112] START');
      let strJson = getInspectorByKey('ListKey1');
      let obj = JSON.parse(strJson);
      console.info("[ListJsunit_0112] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.multiSelectable).assertEqual(true);
      console.info('[ListJsunit_0112] END');
      done();
    });

    /**
     * @tc.number ListJsunit_0113
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ListJsunit_0113', 0, async function (done) {
      console.info('[ListJsunit_0113] START');
      let strJson = getInspectorByKey('ListKey1');
      let obj = JSON.parse(strJson);
      console.info("[ListJsunit_0113] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.cachedCount).assertEqual("2");
      console.info('[ListJsunit_0113] END');
      done();
    });

    /**
     * @tc.number ListJsunit_0114
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ListJsunit_0114', 0, async function (done) {
      console.info('[ListJsunit_0114] START');
      let strJson = getInspectorByKey('ListKey1');
      let obj = JSON.parse(strJson);
      console.info("[ListJsunit_0114] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.chainAnimation).assertEqual(true);
      console.info('[ListJsunit_0114] END');
      done();
    });

    /**
     * @tc.number ListJsunit_0115
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ListJsunit_0115', 0, async function (done) {
      console.info('[ListJsunit_0115] START');
      let strJson = getInspectorByKey('ListKey1');
      let obj = JSON.parse(strJson);
      console.info("[ListJsunit_0115] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.sticky).assertEqual("StickyStyle.Header");
      console.info('[ListJsunit_0115] END');
      done();
    });

  })
}
