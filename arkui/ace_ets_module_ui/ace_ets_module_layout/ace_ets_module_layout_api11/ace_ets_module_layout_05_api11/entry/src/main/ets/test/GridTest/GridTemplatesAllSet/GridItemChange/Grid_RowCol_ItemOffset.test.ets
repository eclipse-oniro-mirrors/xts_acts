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

export default function grid_RowCol_ItemOffsetTest() {
  describe('Grid_RowCol_ItemOffsetTest', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_RowCol_ItemOffsetTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridTemplatesAllSet/GridItemChange/Grid_RowCol_ItemOffset',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_RowCol_ItemOffset state pages:" + JSON.stringify(pages));
        if (!("Grid_RowCol_ItemOffset" == pages.name)) {
          console.info("get Grid_RowCol_ItemOffset state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_RowCol_ItemOffset page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_RowCol_ItemOffset page error:" + err);
      }
      console.info("Grid_RowCol_ItemOffsetTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Grid_RowCol_ItemOffsetTest after each called");
    });
    /**
     * @tc.number SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDITEMCHANGE_0400
     * @tc.name testGridRowColItemOffset
     * @tc.desc The second griditem set offset to {x:20,y:20}
     */
    it('testGridRowColItemOffset',  Level.LEVEL0, async (done: Function) => {
      console.info('[testGridRowColItemOffset] START');
      let secondGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemOffset02');
      let secondGridItemTop: number = secondGridItem.top;
      let secondGridItemLeft: number = secondGridItem.left;
      globalThis.value.message.notify({
        name: 'secondGridItemOffset', value: {
          x: 20, y: 20
        }
      });
      await CommonFunc.sleep(3000);
      let firstGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemOffset01');
      secondGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemOffset02');
      let thirdGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemOffset03');
      let fourthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemOffset04');
      let gridContainer: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemOffset_Container01');
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_ItemOffset_Container01');

      expect(JSON.parse(gridContainerStrJson).$type).assertEqual('Grid');

      expect(Math.abs(secondGridItem.left - secondGridItemLeft - vp2px(20)) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.top - secondGridItemTop - vp2px(20)) <= 1).assertTrue(); //offset {x:20,y:20}

      expect(Math.abs(firstGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.top - gridContainer.top) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.top - firstGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.left - thirdGridItem.right) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.top - thirdGridItem.top) <= 1).assertTrue();

      expect(Math.abs(firstGridItem.right - firstGridItem.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.bottom - firstGridItem.top - vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(secondGridItem.right - secondGridItem.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.bottom - secondGridItem.top - vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(thirdGridItem.right - thirdGridItem.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.bottom - thirdGridItem.top - vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(fourthGridItem.right - fourthGridItem.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.bottom - fourthGridItem.top - vp2px(150)) <= 1).assertTrue();

      console.info('[testGridRowColItemOffset] END');
      done();
    });
  })
}
