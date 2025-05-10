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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';

export default function grid_RowCol_ItemColumnStartEndTest() {
  describe('Grid_RowCol_ItemColumnStartEndTest', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_RowCol_ItemColumnStartEndTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridTemplatesAllSet/GridItemChange/Grid_RowCol_ItemColumnStartEnd',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_RowCol_ItemColumnStartEnd state pages:" + JSON.stringify(pages));
        if (!("Grid_RowCol_ItemColumnStartEnd" == pages.name)) {
          console.info("get Grid_RowCol_ItemColumnStartEnd state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_RowCol_ItemColumnStartEnd page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_RowCol_ItemColumnStartEnd page error:" + err);
      }
      console.info("Grid_RowCol_ItemColumnStartEndTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Grid_RowCol_ItemColumnStartEndTest after each called");
    });
    /**
     * @tc.number SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDITEMCHANGE_1200
     * @tc.name testGridRowColItemColumnStartToZeroEndToThree
     * @tc.desc The first griditem set columnStart to 0,columnEnd to 3
     */
    it('testGridRowColItemColumnStartToZeroEndToThree', 0, async (done: Function) => {
      console.info('[testGridRowColItemColumnStartToZeroEndToThree] START');
      globalThis.value.message.notify({
        name: 'ColumnStart', value: 0
      });
      globalThis.value.message.notify({
        name: 'ColumnEnd', value: 3
      });
      await CommonFunc.sleep(3000);
      let firstGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd1');
      let secondGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd2');
      let thirdGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd3');
      let fourthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd4');
      let fifthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd5');
      let sixthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd6');
      let seventhGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd7');
      let eighthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd8');
      let ninthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd9');
      let tenthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd10');
      let eleventhGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd11');
      let twelfthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd12');
      let thirteenthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd13');
      let gridContainer: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd_Container01');
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_ItemColumnStartEnd_Container01');

      expect(JSON.parse(gridContainerStrJson).$type).assertEqual('Grid');

      expect(Math.abs(firstGridItem.right - firstGridItem.left - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.bottom - firstGridItem.top - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.top - gridContainer.top) <= 1).assertTrue(); //firstGridItem

      expect(Math.abs(secondGridItem.right - secondGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.bottom - secondGridItem.top - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.top - firstGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.right - thirdGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.left - secondGridItem.right) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.top - secondGridItem.top) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.bottom - secondGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.right - fourthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.left - thirdGridItem.right) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.top - secondGridItem.top) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.bottom - secondGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(fifthGridItem.right - fifthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(fifthGridItem.left - fourthGridItem.right) <= 1).assertTrue();
      expect(Math.abs(fifthGridItem.right - gridContainer.right) <= 1).assertTrue();
      expect(Math.abs(fifthGridItem.top - secondGridItem.top) <= 1).assertTrue();
      expect(Math.abs(fifthGridItem.bottom - secondGridItem.bottom) <= 1).assertTrue(); //first row

      expect(Math.abs(sixthGridItem.right - sixthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(sixthGridItem.bottom - sixthGridItem.top - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(sixthGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(sixthGridItem.top - secondGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(seventhGridItem.right - seventhGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(seventhGridItem.left - sixthGridItem.right) <= 1).assertTrue();
      expect(Math.abs(seventhGridItem.top - sixthGridItem.top) <= 1).assertTrue();
      expect(Math.abs(seventhGridItem.bottom - sixthGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(eighthGridItem.right - eighthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(eighthGridItem.left - seventhGridItem.right) <= 1).assertTrue();
      expect(Math.abs(eighthGridItem.top - sixthGridItem.top) <= 1).assertTrue();
      expect(Math.abs(eighthGridItem.bottom - sixthGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(ninthGridItem.right - ninthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(ninthGridItem.left - eighthGridItem.right) <= 1).assertTrue();
      expect(Math.abs(ninthGridItem.top - sixthGridItem.top) <= 1).assertTrue();
      expect(Math.abs(ninthGridItem.bottom - sixthGridItem.bottom) <= 1).assertTrue();

      expect(Math.abs(tenthGridItem.right - tenthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(tenthGridItem.bottom - tenthGridItem.top - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(tenthGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(tenthGridItem.top - sixthGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(eleventhGridItem.right - eleventhGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(eleventhGridItem.left - tenthGridItem.right) <= 1).assertTrue();
      expect(Math.abs(eleventhGridItem.top - tenthGridItem.top) <= 1).assertTrue();
      expect(Math.abs(eleventhGridItem.bottom - tenthGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(twelfthGridItem.right - twelfthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(twelfthGridItem.left - eleventhGridItem.right) <= 1).assertTrue();
      expect(Math.abs(twelfthGridItem.top - tenthGridItem.top) <= 1).assertTrue();
      expect(Math.abs(twelfthGridItem.bottom - tenthGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(thirteenthGridItem.right - thirteenthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(thirteenthGridItem.left - twelfthGridItem.right) <= 1).assertTrue();
      expect(Math.abs(thirteenthGridItem.top - tenthGridItem.top) <= 1).assertTrue();
      expect(Math.abs(thirteenthGridItem.bottom - gridContainer.bottom) <= 1).assertTrue();
      console.info('[testGridRowColItemColumnStartToZeroEndToThree] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDITEMCHANGE_1300
     * @tc.name testGridRowColItemColumnStartToZeroEndToTwo
     * @tc.desc The first griditem set columnStart to 0,columnEnd to 2
     */
    it('testGridRowColItemColumnStartToZeroEndToTwo', 0, async (done: Function) => {
      console.info('[testGridRowColItemColumnStartToZeroEndToTwo] START');
      globalThis.value.message.notify({
        name: 'ColumnStart', value: 0
      });
      globalThis.value.message.notify({
        name: 'ColumnEnd', value: 2
      });
      await CommonFunc.sleep(3000);
      let firstGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd1');
      let secondGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd2');
      let thirdGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd3');
      let fourthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd4');
      let fifthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd5');
      let sixthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd6');
      let seventhGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd7');
      let eighthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd8');
      let ninthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd9');
      let tenthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd10');
      let eleventhGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd11');
      let twelfthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd12');
      let thirteenthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd13');
      let gridContainer: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd_Container01');
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_ItemColumnStartEnd_Container01');

      expect(JSON.parse(gridContainerStrJson).$type).assertEqual('Grid');

      expect(Math.abs(firstGridItem.right - firstGridItem.left - vp2px(225)) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.bottom - firstGridItem.top - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.top - gridContainer.top) <= 1).assertTrue(); //firstGridItem
      expect(Math.abs(secondGridItem.left - firstGridItem.right) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.right - gridContainer.right) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.top - gridContainer.top) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.bottom - firstGridItem.bottom) <= 1).assertTrue(); //first Row

      expect(Math.abs(thirdGridItem.right - thirdGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.bottom - thirdGridItem.top - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.top - firstGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.right - fourthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.left - thirdGridItem.right) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.top - thirdGridItem.top) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.bottom - thirdGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(fifthGridItem.right - fifthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(fifthGridItem.left - fourthGridItem.right) <= 1).assertTrue();
      expect(Math.abs(fifthGridItem.top - thirdGridItem.top) <= 1).assertTrue();
      expect(Math.abs(fifthGridItem.bottom - thirdGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(sixthGridItem.right - sixthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(sixthGridItem.left - fifthGridItem.right) <= 1).assertTrue();
      expect(Math.abs(sixthGridItem.right - gridContainer.right) <= 1).assertTrue();
      expect(Math.abs(sixthGridItem.top - thirdGridItem.top) <= 1).assertTrue();
      expect(Math.abs(sixthGridItem.bottom - thirdGridItem.bottom) <= 1).assertTrue(); //second row

      expect(Math.abs(seventhGridItem.right - seventhGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(seventhGridItem.bottom - seventhGridItem.top - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(seventhGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(seventhGridItem.top - thirdGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(eighthGridItem.right - eighthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(eighthGridItem.left - seventhGridItem.right) <= 1).assertTrue();
      expect(Math.abs(eighthGridItem.top - seventhGridItem.top) <= 1).assertTrue();
      expect(Math.abs(eighthGridItem.bottom - seventhGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(ninthGridItem.right - ninthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(ninthGridItem.left - eighthGridItem.right) <= 1).assertTrue();
      expect(Math.abs(ninthGridItem.top - seventhGridItem.top) <= 1).assertTrue();
      expect(Math.abs(ninthGridItem.bottom - seventhGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(tenthGridItem.right - tenthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(tenthGridItem.left - ninthGridItem.right) <= 1).assertTrue();
      expect(Math.abs(tenthGridItem.top - seventhGridItem.top) <= 1).assertTrue();
      expect(Math.abs(tenthGridItem.bottom - seventhGridItem.bottom) <= 1).assertTrue(); //third row

      expect(Math.abs(eleventhGridItem.right - eleventhGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(eleventhGridItem.bottom - eleventhGridItem.top - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(eleventhGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(eleventhGridItem.top - seventhGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(twelfthGridItem.right - twelfthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(twelfthGridItem.left - eleventhGridItem.right) <= 1).assertTrue();
      expect(Math.abs(twelfthGridItem.top - eleventhGridItem.top) <= 1).assertTrue();
      expect(Math.abs(twelfthGridItem.bottom - eleventhGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(thirteenthGridItem.right - thirteenthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(thirteenthGridItem.left - twelfthGridItem.right) <= 1).assertTrue();
      expect(Math.abs(thirteenthGridItem.top - eleventhGridItem.top) <= 1).assertTrue();
      expect(Math.abs(thirteenthGridItem.bottom - gridContainer.bottom) <= 1).assertTrue(); //fourth row
      console.info('[testGridRowColItemColumnStartToZeroEndToTwo] END');
      done();
    });
  })
}
