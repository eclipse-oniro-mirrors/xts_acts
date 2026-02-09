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

export default function Grid_RowCol_Gap() {
  describe('Grid_RowCol_GapTest', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_RowCol_GapTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/GridTemplatesAllSet/GridChange/Grid_RowCol_Gap",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_RowCol_Gap state pages:" + JSON.stringify(pages));
        if (!("Grid_RowCol_Gap" == pages.name)) {
          console.info("get Grid_RowCol_Gap pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_RowCol_Gap page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_RowCol_Gap page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Grid_RowCol_GapTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_RowCol_Gap after each called")
    });
    /**
     * @tc.name   testGridColGap
     * @tc.number SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDCHANGE_0600
     * @tc.desc   Add columnGap,Grid is divided into 4 equal parts, 4 components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGridColGap',  Level.LEVEL0, async (done: Function) => {
      console.info('[testGridColGap] START');
      await CommonFunc.sleep(3000);
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_Gap_01');
      expect(JSON.parse(gridContainerStrJson).$type).assertEqual('Grid');
      let Grid_RowCol_Gap_011: RectValue = CommonFunc.getComponentRect('Grid_RowCol_Gap_011');
      let Grid_RowCol_Gap_012: RectValue = CommonFunc.getComponentRect('Grid_RowCol_Gap_012');
      let Grid_RowCol_Gap_013: RectValue = CommonFunc.getComponentRect('Grid_RowCol_Gap_013');
      let Grid_RowCol_Gap_014: RectValue = CommonFunc.getComponentRect('Grid_RowCol_Gap_014');
      let Grid_RowCol_Gap_01: RectValue = CommonFunc.getComponentRect('Grid_RowCol_Gap_01');
      expect(Math.abs(Grid_RowCol_Gap_011.left - Grid_RowCol_Gap_01.left) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_013.left - Grid_RowCol_Gap_01.left) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_Gap_012.left - Grid_RowCol_Gap_011.right - vp2px(5)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_014.left - Grid_RowCol_Gap_013.right - vp2px(5)) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_Gap_012.right - Grid_RowCol_Gap_01.right) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_014.right - Grid_RowCol_Gap_01.right) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_Gap_011.top - Grid_RowCol_Gap_01.top) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_012.top - Grid_RowCol_Gap_01.top) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_Gap_011.bottom - Grid_RowCol_Gap_013.top) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_012.bottom - Grid_RowCol_Gap_014.top) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_Gap_013.bottom - Grid_RowCol_Gap_01.bottom) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_014.bottom - Grid_RowCol_Gap_01.bottom) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_Gap_011.right - Grid_RowCol_Gap_013.right) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_012.right - Grid_RowCol_Gap_014.right) <= 1).assertTrue();

      expect(Math.abs((Grid_RowCol_Gap_011.right - Grid_RowCol_Gap_011.left -
      vp2px(147.5)) * 100 / 100) <= 1).assertTrue();
      expect(Math.abs((Grid_RowCol_Gap_012.right - Grid_RowCol_Gap_012.left -
      vp2px(147.5))) * 100 / 100 <= 1).assertTrue();
      expect(Math.abs((Grid_RowCol_Gap_013.right - Grid_RowCol_Gap_013.left -
      vp2px(147.5))) * 100 / 100 <= 1).assertTrue();
      expect(Math.abs((Grid_RowCol_Gap_014.right - Grid_RowCol_Gap_014.left -
      vp2px(147.5))) * 100 / 100 <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_Gap_011.bottom - Grid_RowCol_Gap_011.top - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_012.bottom - Grid_RowCol_Gap_012.top - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_013.bottom - Grid_RowCol_Gap_013.top - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_014.bottom - Grid_RowCol_Gap_014.top - vp2px(150)) <= 1).assertTrue();
      console.info('[testGridColGap] END');
      done();
    });
    /**
     * @tc.name   testGridRowGap
     * @tc.number SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDCHANGE_0700
     * @tc.desc   Add rowGap,Grid is divided into 4 equal parts, 4 components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGridRowGap',  Level.LEVEL0, async (done: Function) => {
      console.info('[testGridRowGap] START');
      globalThis.value.message.notify({
        name: 'addColumnGap', value: 0
      });
      globalThis.value.message.notify({
        name: 'addRowGap', value: 5
      });
      await CommonFunc.sleep(3000);
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_Gap_01');

      expect(JSON.parse(gridContainerStrJson).$type).assertEqual('Grid');
      let Grid_RowCol_Gap_011: RectValue = CommonFunc.getComponentRect('Grid_RowCol_Gap_011');
      let Grid_RowCol_Gap_012: RectValue = CommonFunc.getComponentRect('Grid_RowCol_Gap_012');
      let Grid_RowCol_Gap_013: RectValue = CommonFunc.getComponentRect('Grid_RowCol_Gap_013');
      let Grid_RowCol_Gap_014: RectValue = CommonFunc.getComponentRect('Grid_RowCol_Gap_014');
      let Grid_RowCol_Gap_01: RectValue = CommonFunc.getComponentRect('Grid_RowCol_Gap_01');
      expect(Math.abs(Grid_RowCol_Gap_011.left - Grid_RowCol_Gap_01.left) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_013.left - Grid_RowCol_Gap_01.left) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_Gap_011.right - Grid_RowCol_Gap_012.left) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_013.right - Grid_RowCol_Gap_014.left) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_Gap_012.right - Grid_RowCol_Gap_014.right) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_012.right - Grid_RowCol_Gap_01.right) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_Gap_011.top - Grid_RowCol_Gap_01.top) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_011.top - Grid_RowCol_Gap_012.top) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_Gap_013.bottom - Grid_RowCol_Gap_01.bottom) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_014.bottom - Grid_RowCol_Gap_01.bottom) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_Gap_013.top - Grid_RowCol_Gap_014.top) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_011.bottom - Grid_RowCol_Gap_012.bottom) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_Gap_013.top - Grid_RowCol_Gap_011.bottom - vp2px(5)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_014.top - Grid_RowCol_Gap_012.bottom - vp2px(5)) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_Gap_011.right - Grid_RowCol_Gap_011.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_012.right - Grid_RowCol_Gap_012.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_013.right - Grid_RowCol_Gap_013.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_014.right - Grid_RowCol_Gap_014.left - vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_Gap_011.bottom - Grid_RowCol_Gap_011.top - vp2px(147.5)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_012.bottom - Grid_RowCol_Gap_012.top - vp2px(147.5)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_013.bottom - Grid_RowCol_Gap_013.top - vp2px(147.5)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_014.bottom - Grid_RowCol_Gap_014.top - vp2px(147.5)) <= 1).assertTrue();
      console.info('[testGridRowGap] END');
      done();
    });
    /**
     * @tc.name   testGridRowColGap
     * @tc.number SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDCHANGE_0800
     * @tc.desc   Add columnGap and rowGap,Grid is divided into 4 equal parts, 4 components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGridRowColGap',  Level.LEVEL0, async (done: Function) => {
      console.info('[testGridRowColGap] START');
      globalThis.value.message.notify({
        name: 'addColumnGap', value: 5
      });
      globalThis.value.message.notify({
        name: 'addRowGap', value: 5
      });
      await CommonFunc.sleep(3000);
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_Gap_01');

      expect(JSON.parse(gridContainerStrJson).$type).assertEqual('Grid');
      let Grid_RowCol_Gap_011: RectValue = CommonFunc.getComponentRect('Grid_RowCol_Gap_011');
      let Grid_RowCol_Gap_012: RectValue = CommonFunc.getComponentRect('Grid_RowCol_Gap_012');
      let Grid_RowCol_Gap_013: RectValue = CommonFunc.getComponentRect('Grid_RowCol_Gap_013');
      let Grid_RowCol_Gap_014: RectValue = CommonFunc.getComponentRect('Grid_RowCol_Gap_014');
      let Grid_RowCol_Gap_01: RectValue = CommonFunc.getComponentRect('Grid_RowCol_Gap_01');
      expect(Math.abs(Grid_RowCol_Gap_011.left - Grid_RowCol_Gap_01.left) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_013.left - Grid_RowCol_Gap_01.left) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_Gap_012.right - Grid_RowCol_Gap_014.right) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_012.right - Grid_RowCol_Gap_01.right) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_Gap_011.top - Grid_RowCol_Gap_01.top) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_011.top - Grid_RowCol_Gap_012.top) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_Gap_013.bottom - Grid_RowCol_Gap_01.bottom) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_014.bottom - Grid_RowCol_Gap_01.bottom) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_Gap_013.top - Grid_RowCol_Gap_014.top) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_011.bottom - Grid_RowCol_Gap_012.bottom) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_Gap_013.top - Grid_RowCol_Gap_011.bottom - vp2px(5)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_014.top - Grid_RowCol_Gap_012.bottom - vp2px(5)) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_Gap_012.left - Grid_RowCol_Gap_011.right - vp2px(5)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_Gap_014.left - Grid_RowCol_Gap_013.right - vp2px(5)) <= 1).assertTrue();

      expect(Math.abs((Grid_RowCol_Gap_011.right - Grid_RowCol_Gap_011.left -
      vp2px(147.5)) * 100 / 100) <= 1).assertTrue();
      expect(Math.abs((Grid_RowCol_Gap_012.right - Grid_RowCol_Gap_012.left -
      vp2px(147.5))) * 100 / 100 <= 1).assertTrue();
      expect(Math.abs((Grid_RowCol_Gap_013.right - Grid_RowCol_Gap_013.left -
      vp2px(147.5))) * 100 / 100 <= 1).assertTrue();
      expect(Math.abs((Grid_RowCol_Gap_014.right - Grid_RowCol_Gap_014.left -
      vp2px(147.5))) * 100 / 100 <= 1).assertTrue();

      expect(Math.abs((Grid_RowCol_Gap_011.bottom - Grid_RowCol_Gap_011.top -
      vp2px(147.5)) * 100 / 100) <= 1).assertTrue();
      expect(Math.abs((Grid_RowCol_Gap_012.bottom - Grid_RowCol_Gap_012.top -
      vp2px(147.5))) * 100 / 100 <= 1).assertTrue();
      expect(Math.abs((Grid_RowCol_Gap_013.bottom - Grid_RowCol_Gap_013.top -
      vp2px(147.5))) * 100 / 100 <= 1).assertTrue();
      expect(Math.abs((Grid_RowCol_Gap_014.bottom - Grid_RowCol_Gap_014.top -
      vp2px(147.5))) * 100 / 100 <= 1).assertTrue();
      console.info('[testGridRowColGap] END');
      done();
    });
  })
}
