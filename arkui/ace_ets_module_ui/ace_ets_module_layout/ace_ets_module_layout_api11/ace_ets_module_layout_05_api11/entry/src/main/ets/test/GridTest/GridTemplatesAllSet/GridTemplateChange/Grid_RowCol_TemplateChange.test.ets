/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';

export default function Grid_RowCol_TemplateChange() {
  describe('Grid_RowCol_TemplateChangeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_RowCol_TemplateChangeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/GridTemplatesAllSet/GridTemplateChange/Grid_RowCol_TemplateChange",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_RowCol_TemplateChange state pages:" + JSON.stringify(pages));
        if (!("Grid_RowCol_TemplateChange" == pages.name)) {
          console.info("get Grid_RowCol_TemplateChange pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_RowCol_TemplateChange page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_RowCol_TemplateChange page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Grid_RowCol_TemplateChangeTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_RowCol_TemplateChange after each called")
    });
    /**
     * @tc.name   testGridRowColTemplateChange01
     * @tc.number SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDTEMPLATECHANGE_0100
     * @tc.desc   Grid is divided into 4 equal parts, 4 components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGridRowColTemplateChange01',  Level.LEVEL0, async (done: Function) => {
      console.info('[testGridRowColTemplateChange01] START');
      await CommonFunc.sleep(1000);
      let gridContainerStrJson = getInspectorByKey('GridTemplateChange_Grid_01');

      expect(JSON.parse(gridContainerStrJson).$type).assertEqual('Grid');
      let GridTemplateChange_Grid_011: RectValue = CommonFunc.getComponentRect('GridTemplateChange_Grid_011');
      let GridTemplateChange_Grid_012: RectValue = CommonFunc.getComponentRect('GridTemplateChange_Grid_012');
      let GridTemplateChange_Grid_013: RectValue = CommonFunc.getComponentRect('GridTemplateChange_Grid_013');
      let GridTemplateChange_Grid_014: RectValue = CommonFunc.getComponentRect('GridTemplateChange_Grid_014');
      let GridTemplateChange_Grid_01: RectValue = CommonFunc.getComponentRect('GridTemplateChange_Grid_01');
      expect(Math.abs(GridTemplateChange_Grid_011.left - GridTemplateChange_Grid_01.left) <= 1).assertTrue();
      expect(Math.abs(GridTemplateChange_Grid_013.left - GridTemplateChange_Grid_01.left) <= 1).assertTrue();

      expect(Math.abs(GridTemplateChange_Grid_011.right - GridTemplateChange_Grid_012.left) <= 1).assertTrue();
      expect(Math.abs(GridTemplateChange_Grid_013.right - GridTemplateChange_Grid_014.left) <= 1).assertTrue();

      expect(Math.abs(GridTemplateChange_Grid_012.right - GridTemplateChange_Grid_01.right) <= 1).assertTrue();
      expect(Math.abs(GridTemplateChange_Grid_014.right - GridTemplateChange_Grid_01.right) <= 1).assertTrue();

      expect(Math.abs(GridTemplateChange_Grid_011.top - GridTemplateChange_Grid_01.top) <= 1).assertTrue();
      expect(Math.abs(GridTemplateChange_Grid_012.top - GridTemplateChange_Grid_01.top) <= 1).assertTrue();

      expect(Math.abs(GridTemplateChange_Grid_011.bottom - GridTemplateChange_Grid_013.top) <= 1).assertTrue();
      expect(Math.abs(GridTemplateChange_Grid_012.bottom - GridTemplateChange_Grid_014.top) <= 1).assertTrue();

      expect(Math.abs(GridTemplateChange_Grid_013.bottom - GridTemplateChange_Grid_01.bottom) <= 1).assertTrue();
      expect(Math.abs(GridTemplateChange_Grid_014.bottom - GridTemplateChange_Grid_01.bottom) <= 1).assertTrue();

      expect(Math.abs(GridTemplateChange_Grid_011.right - GridTemplateChange_Grid_011.left - vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs(GridTemplateChange_Grid_012.right - GridTemplateChange_Grid_012.left - vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs(GridTemplateChange_Grid_013.right - GridTemplateChange_Grid_013.left - vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs(GridTemplateChange_Grid_014.right - GridTemplateChange_Grid_014.left - vp2px(150)) <= 1)
        .assertTrue();

      expect(Math.abs(GridTemplateChange_Grid_011.bottom - GridTemplateChange_Grid_011.top - vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs(GridTemplateChange_Grid_012.bottom - GridTemplateChange_Grid_012.top - vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs(GridTemplateChange_Grid_013.bottom - GridTemplateChange_Grid_013.top - vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs(GridTemplateChange_Grid_014.bottom - GridTemplateChange_Grid_014.top - vp2px(150)) <= 1)
        .assertTrue();
      console.info('[testGridRowColTemplateChange01] END');
      done();
    });
    /**
     * @tc.name   testGridRowColTemplateChange02
     * @tc.number SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDTEMPLATECHANGE_0200
     * @tc.desc   Grid is divided into 9 equal parts, 4 components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGridRowColTemplateChange02',  Level.LEVEL0, async (done: Function) => {
      console.info('[testGridRowColTemplateChange02] START');
      globalThis.value.message.notify({
        name: 'testColumnsTemplate', value: "1fr 1fr 1fr"
      });
      globalThis.value.message.notify({
        name: 'testRowsTemplate', value: "1fr 1fr 1fr"
      });
      await CommonFunc.sleep(3000);
      let gridContainerStrJson = getInspectorByKey('GridTemplateChange_Grid_01');

      expect(JSON.parse(gridContainerStrJson).$type).assertEqual('Grid');
      let GridTemplateChange_Grid_011: RectValue = CommonFunc.getComponentRect('GridTemplateChange_Grid_011');
      let GridTemplateChange_Grid_012: RectValue = CommonFunc.getComponentRect('GridTemplateChange_Grid_012');
      let GridTemplateChange_Grid_013: RectValue = CommonFunc.getComponentRect('GridTemplateChange_Grid_013');
      let GridTemplateChange_Grid_014: RectValue = CommonFunc.getComponentRect('GridTemplateChange_Grid_014');
      let GridTemplateChange_Grid_01: RectValue = CommonFunc.getComponentRect('GridTemplateChange_Grid_01');
      expect(Math.abs(GridTemplateChange_Grid_011.left - GridTemplateChange_Grid_01.left) <= 1).assertTrue();
      expect(Math.abs(GridTemplateChange_Grid_014.left - GridTemplateChange_Grid_01.left) <= 1).assertTrue();

      expect(Math.abs(GridTemplateChange_Grid_011.right - GridTemplateChange_Grid_014.right) <= 1).assertTrue();
      expect(Math.abs(GridTemplateChange_Grid_011.right - GridTemplateChange_Grid_012.left) <= 1).assertTrue();
      expect(Math.abs(GridTemplateChange_Grid_012.right - GridTemplateChange_Grid_013.left) <= 1).assertTrue();
      expect(Math.abs(GridTemplateChange_Grid_013.right - GridTemplateChange_Grid_01.right) <= 1).assertTrue();

      expect(Math.abs(GridTemplateChange_Grid_011.top - GridTemplateChange_Grid_01.top) <= 1).assertTrue();
      expect(Math.abs(GridTemplateChange_Grid_011.top - GridTemplateChange_Grid_012.top) <= 1).assertTrue();
      expect(Math.abs(GridTemplateChange_Grid_011.top - GridTemplateChange_Grid_013.top) <= 1).assertTrue();

      expect(Math.abs(GridTemplateChange_Grid_011.bottom - GridTemplateChange_Grid_014.top) <= 1).assertTrue();
      expect(Math.abs(GridTemplateChange_Grid_011.bottom - GridTemplateChange_Grid_012.bottom) <= 1).assertTrue();
      expect(Math.abs(GridTemplateChange_Grid_011.bottom - GridTemplateChange_Grid_013.bottom) <= 1).assertTrue();

      expect(Math.abs(GridTemplateChange_Grid_011.right - GridTemplateChange_Grid_011.left - vp2px(100)) <= 1)
        .assertTrue();
      expect(Math.abs(GridTemplateChange_Grid_012.right - GridTemplateChange_Grid_012.left - vp2px(100)) <= 1)
        .assertTrue();
      expect(Math.abs(GridTemplateChange_Grid_013.right - GridTemplateChange_Grid_013.left - vp2px(100)) <= 1)
        .assertTrue();
      expect(Math.abs(GridTemplateChange_Grid_014.right - GridTemplateChange_Grid_014.left - vp2px(100)) <= 1)
        .assertTrue();

      expect(Math.abs(GridTemplateChange_Grid_011.bottom - GridTemplateChange_Grid_011.top - vp2px(100)) <= 1)
        .assertTrue();
      expect(Math.abs(GridTemplateChange_Grid_012.bottom - GridTemplateChange_Grid_012.top - vp2px(100)) <= 1)
        .assertTrue();
      expect(Math.abs(GridTemplateChange_Grid_013.bottom - GridTemplateChange_Grid_013.top - vp2px(100)) <= 1)
        .assertTrue();
      expect(Math.abs(GridTemplateChange_Grid_014.bottom - GridTemplateChange_Grid_014.top - vp2px(100)) <= 1)
        .assertTrue();
      console.info('[testGridRowColTemplateChange02] END');
      done();
    });

  })
}
