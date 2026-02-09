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

export default function grid_RowCol_ItemRowStartEndTest() {
  describe('Grid_RowCol_ItemRowStartEndTest', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_RowCol_ItemRowStartEndTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridTemplatesAllSet/GridItemChange/Grid_RowCol_ItemRowStartEnd',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_RowCol_ItemRowStartEnd state pages:" + JSON.stringify(pages));
        if (!("Grid_RowCol_ItemRowStartEnd" == pages.name)) {
          console.info("get Grid_RowCol_ItemRowStartEnd state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_RowCol_ItemRowStartEnd page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_RowCol_ItemRowStartEnd page error:" + err);
      }
      console.info("Grid_RowCol_ItemRowStartEndTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Grid_RowCol_ItemRowStartEndTest after each called");
    });
    /**
     * @tc.name   testGridRowColItemRowStartToZeroEndToThree
     * @tc.number SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDITEMCHANGE_1000
     * @tc.desc   The first griditem set rowStart to 0,rowEnd to 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGridRowColItemRowStartToZeroEndToThree',  Level.LEVEL0, async (done: Function) => {
      console.info('[testGridRowColItemRowStartToZeroEndToThree] START');
      globalThis.value.message.notify({
        name: 'RowStart', value: 0
      });
      globalThis.value.message.notify({
        name: 'RowEnd', value: 3
      });
      await CommonFunc.sleep(3000);
      let firstGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd1');
      let secondGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd2');
      let thirdGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd3');
      let fourthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd4');
      let fifthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd5');
      let sixthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd6');
      let seventhGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd7');
      let eighthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd8');
      let ninthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd9');
      let tenthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd10');
      let eleventhGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd11');
      let twelfthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd12');
      let thirteenthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd13');
      let gridContainer: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd_Container01');
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_ItemRowStartEnd_Container01');

      expect(JSON.parse(gridContainerStrJson).$type).assertEqual('Grid');

      expect(Math.abs(firstGridItem.right - firstGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.bottom - firstGridItem.top - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.top - gridContainer.top) <= 1).assertTrue();

      expect(Math.abs(secondGridItem.right - secondGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.bottom - secondGridItem.top - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.left - firstGridItem.right) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.top - firstGridItem.top) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.right - thirdGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.left - secondGridItem.right) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.top - firstGridItem.top) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.bottom - secondGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.right - fourthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.left - thirdGridItem.right) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.top - firstGridItem.top) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.bottom - secondGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.right - gridContainer.right) <= 1).assertTrue(); // first row

      expect(Math.abs(fifthGridItem.right - fifthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(fifthGridItem.bottom - fifthGridItem.top - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(fifthGridItem.left - firstGridItem.right) <= 1).assertTrue();
      expect(Math.abs(fifthGridItem.top - secondGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(sixthGridItem.right - sixthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(sixthGridItem.left - fifthGridItem.right) <= 1).assertTrue();
      expect(Math.abs(sixthGridItem.top - fifthGridItem.top) <= 1).assertTrue();
      expect(Math.abs(sixthGridItem.bottom - fifthGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(seventhGridItem.right - seventhGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(seventhGridItem.left - sixthGridItem.right) <= 1).assertTrue();
      expect(Math.abs(seventhGridItem.top - fifthGridItem.top) <= 1).assertTrue();
      expect(Math.abs(seventhGridItem.right - gridContainer.right) <= 1).assertTrue(); // second row

      expect(Math.abs(eighthGridItem.right - eighthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(eighthGridItem.bottom - eighthGridItem.top - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(eighthGridItem.left - firstGridItem.right) <= 1).assertTrue();
      expect(Math.abs(eighthGridItem.top - fifthGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(ninthGridItem.right - ninthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(ninthGridItem.left - eighthGridItem.right) <= 1).assertTrue();
      expect(Math.abs(ninthGridItem.top - eighthGridItem.top) <= 1).assertTrue();
      expect(Math.abs(ninthGridItem.bottom - eighthGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(tenthGridItem.right - tenthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(tenthGridItem.left - ninthGridItem.right) <= 1).assertTrue();
      expect(Math.abs(tenthGridItem.top - eighthGridItem.top) <= 1).assertTrue();
      expect(Math.abs(tenthGridItem.bottom - eighthGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(tenthGridItem.right - gridContainer.right) <= 1).assertTrue(); // third row

      expect(Math.abs(eleventhGridItem.right - eleventhGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(eleventhGridItem.bottom - eleventhGridItem.top - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(eleventhGridItem.left - firstGridItem.right) <= 1).assertTrue();
      expect(Math.abs(eleventhGridItem.top - eighthGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(eleventhGridItem.right - eleventhGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(twelfthGridItem.left - eleventhGridItem.right) <= 1).assertTrue();
      expect(Math.abs(twelfthGridItem.top - eleventhGridItem.top) <= 1).assertTrue();
      expect(Math.abs(twelfthGridItem.bottom - eleventhGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(thirteenthGridItem.left - twelfthGridItem.right) <= 1).assertTrue();
      expect(Math.abs(thirteenthGridItem.top - eleventhGridItem.top) <= 1).assertTrue();
      expect(Math.abs(thirteenthGridItem.right - gridContainer.right) <= 1).assertTrue();
      expect(Math.abs(thirteenthGridItem.bottom - gridContainer.bottom) <= 1).assertTrue(); // fourth row
      console.info('[testGridRowColItemRowStartToZeroEndToThree] END');
      done();
    });
    /**
     * @tc.name   testGridRowColItemRowStartToOneEndToThree
     * @tc.number SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDITEMCHANGE_1100
     * @tc.desc   The first griditem set rowStart to 1,rowEnd to 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGridRowColItemRowStartToOneEndToThree',  Level.LEVEL0, async (done: Function) => {
      console.info('[testGridRowColItemRowStartToOneEndToThree] START');
      globalThis.value.message.notify({
        name: 'RowStart', value: 1
      });
      globalThis.value.message.notify({
        name: 'RowEnd', value: 3
      });
      await CommonFunc.sleep(3000);
      let firstGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd1');
      let secondGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd2');
      let thirdGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd3');
      let fourthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd4');
      let fifthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd5');
      let sixthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd6');
      let seventhGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd7');
      let eighthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd8');
      let ninthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd9');
      let tenthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd10');
      let eleventhGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd11');
      let twelfthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd12');
      let thirteenthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd13');
      let gridContainer: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd_Container01');
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_ItemRowStartEnd_Container01');

      expect(JSON.parse(gridContainerStrJson).$type).assertEqual('Grid');

      expect(Math.abs(firstGridItem.right - firstGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.bottom - firstGridItem.top - vp2px(225)) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.top - gridContainer.top - vp2px(75)) <= 1).assertTrue(); //firstGridItem

      expect(Math.abs(secondGridItem.right - secondGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.bottom - secondGridItem.top - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.top - gridContainer.top) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.right - thirdGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.left - secondGridItem.right) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.top - secondGridItem.top) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.bottom - secondGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.right - fourthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.left - thirdGridItem.right) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.top - secondGridItem.top) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.bottom - secondGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(fifthGridItem.left - fourthGridItem.right) <= 1).assertTrue();
      expect(Math.abs(fifthGridItem.right - gridContainer.right) <= 1).assertTrue();
      expect(Math.abs(fifthGridItem.top - secondGridItem.top) <= 1).assertTrue();
      expect(Math.abs(fifthGridItem.bottom - secondGridItem.bottom) <= 1).assertTrue(); //first row

      expect(Math.abs(sixthGridItem.right - sixthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(sixthGridItem.bottom - sixthGridItem.top - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(sixthGridItem.left - firstGridItem.right) <= 1).assertTrue();
      expect(Math.abs(sixthGridItem.top - thirdGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(seventhGridItem.right - seventhGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(seventhGridItem.left - sixthGridItem.right) <= 1).assertTrue();
      expect(Math.abs(seventhGridItem.top - sixthGridItem.top) <= 1).assertTrue();
      expect(Math.abs(eighthGridItem.right - eighthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(eighthGridItem.left - seventhGridItem.right) <= 1).assertTrue();
      expect(Math.abs(eighthGridItem.top - sixthGridItem.top) <= 1).assertTrue();
      expect(Math.abs(eighthGridItem.bottom - sixthGridItem.bottom) <= 1).assertTrue(); //second row

      expect(Math.abs(ninthGridItem.right - ninthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(ninthGridItem.bottom - ninthGridItem.top - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(ninthGridItem.left - firstGridItem.right) <= 1).assertTrue();
      expect(Math.abs(ninthGridItem.top - sixthGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(tenthGridItem.right - tenthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(tenthGridItem.left - ninthGridItem.right) <= 1).assertTrue();
      expect(Math.abs(tenthGridItem.top - ninthGridItem.top) <= 1).assertTrue();
      expect(Math.abs(tenthGridItem.bottom - ninthGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(eleventhGridItem.right - eleventhGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(eleventhGridItem.left - tenthGridItem.right) <= 1).assertTrue();
      expect(Math.abs(eleventhGridItem.top - ninthGridItem.top) <= 1).assertTrue();
      expect(Math.abs(eleventhGridItem.bottom - ninthGridItem.bottom) <= 1).assertTrue(); //third row

      expect(Math.abs(twelfthGridItem.right - twelfthGridItem.left - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(twelfthGridItem.bottom - twelfthGridItem.top - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(twelfthGridItem.left - firstGridItem.right) <= 1).assertTrue();
      expect(Math.abs(twelfthGridItem.top - ninthGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(twelfthGridItem.bottom - gridContainer.bottom) <= 1).assertTrue();
      expect(Math.abs(thirteenthGridItem.left - twelfthGridItem.right) <= 1).assertTrue();
      expect(Math.abs(thirteenthGridItem.top - twelfthGridItem.top) <= 1).assertTrue();
      expect(Math.abs(gridContainer.right - thirteenthGridItem.right - vp2px(75)) <= 1).assertTrue();
      expect(Math.abs(thirteenthGridItem.bottom - gridContainer.bottom) <= 1).assertTrue(); // fourth row
      console.info('[testGridRowColItemRowStartToOneEndToThree] END');
      done();
    });
  })
}
