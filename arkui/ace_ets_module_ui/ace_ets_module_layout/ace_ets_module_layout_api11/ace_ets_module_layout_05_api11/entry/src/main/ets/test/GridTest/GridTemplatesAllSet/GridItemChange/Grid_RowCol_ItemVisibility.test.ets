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

export default function grid_RowCol_ItemVisibilityTest() {
  describe('Grid_RowCol_ItemVisibilityTest', () => {
    beforeAll(async (done: Function) => {
      console.info("Grid_RowCol_ItemVisibilityTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridTemplatesAllSet/GridItemChange/Grid_RowCol_ItemVisibility',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_RowCol_ItemVisibility state pages:" + JSON.stringify(pages));
        if (!("Grid_RowCol_ItemVisibility" == pages.name)) {
          console.info("get Grid_RowCol_ItemVisibility state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_RowCol_ItemVisibility page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_RowCol_ItemVisibility page error:" + err);
      }
      console.info("Grid_RowCol_ItemVisibilityTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Grid_RowCol_ItemVisibilityTest after each called");
    });
    /**
     * @tc.number SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDITEMCHANGE_0600
     * @tc.name testGridRowColItemVisibilityNone
     * @tc.desc The second griditem set visibility to Visibility.None
     */
    it('testGridRowColItemVisibilityNone',  Level.LEVEL0, async (done: Function) => {
      console.info('[testGridRowColItemVisibilityNone] START');
      globalThis.value.message.notify({
        name: 'secondGridItemVisibility', value: Visibility.None
      });
      await CommonFunc.sleep(3000);
      let firstGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility01');
      let secondGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility02');
      let thirdGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility03');
      let fourthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility04');
      let gridContainer: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility_Container01');
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_ItemVisibility_Container01');

      expect(JSON.parse(gridContainerStrJson).$type).assertEqual('Grid');
      let secondGridItemStrJson = getInspectorByKey('Grid_RowCol_ItemVisibility02');
      expect(JSON.parse(secondGridItemStrJson).$attrs.visibility).assertEqual("Visibility.None");

      expect(Math.abs(firstGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.top - gridContainer.top) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.top - firstGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.left - thirdGridItem.right) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.top - thirdGridItem.top) <= 1).assertTrue();

      expect(Math.abs(firstGridItem.right - firstGridItem.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.bottom - firstGridItem.top - vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(thirdGridItem.right - thirdGridItem.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.bottom - thirdGridItem.top - vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(fourthGridItem.right - fourthGridItem.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.bottom - fourthGridItem.top - vp2px(150)) <= 1).assertTrue();

      console.info('[testGridRowColItemVisibilityNone] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDITEMCHANGE_0700
     * @tc.name testGridRowColItemVisibilityHidden
     * @tc.desc The second griditem set visibility to Visibility.Hidden
     */
    it('testGridRowColItemVisibilityHidden',  Level.LEVEL0, async (done: Function) => {
      console.info('[testGridRowColItemVisibilityHidden] START');
      globalThis.value.message.notify({
        name: 'secondGridItemVisibility', value: Visibility.Hidden
      });
      await CommonFunc.sleep(3000);
      let firstGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility01');
      let secondGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility02');
      let thirdGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility03');
      let fourthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility04');
      let gridContainer: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility_Container01');
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_ItemVisibility_Container01');

      expect(JSON.parse(gridContainerStrJson).$type).assertEqual('Grid');
      let secondGridItemStrJson = getInspectorByKey('Grid_RowCol_ItemVisibility02');
      expect(JSON.parse(secondGridItemStrJson).$attrs.visibility).assertEqual("Visibility.Hidden");

      expect(Math.abs(firstGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.top - gridContainer.top) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.top - firstGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.left - thirdGridItem.right) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.top - firstGridItem.bottom) <= 1).assertTrue();

      expect(Math.abs(firstGridItem.right - firstGridItem.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.bottom - firstGridItem.top - vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(secondGridItem.right - secondGridItem.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.bottom - secondGridItem.top - vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(thirdGridItem.right - thirdGridItem.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.bottom - thirdGridItem.top - vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(fourthGridItem.right - fourthGridItem.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.bottom - fourthGridItem.top - vp2px(150)) <= 1).assertTrue();

      console.info('[testGridRowColItemVisibilityHidden] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDITEMCHANGE_0800
     * @tc.name testGridRowColItemVisibilityVisible
     * @tc.desc The second griditem set visibility to Visibility.Visible
     */
    it('testGridRowColItemVisibilityVisible',  Level.LEVEL0, async (done: Function) => {
      console.info('[testGridRowColItemVisibilityVisible] START');
      globalThis.value.message.notify({
        name: 'secondGridItemVisibility', value: Visibility.Visible
      });
      await CommonFunc.sleep(3000);
      let firstGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility01');
      let secondGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility02');
      let thirdGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility03');
      let fourthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility04');
      let gridContainer: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility_Container01');
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_ItemVisibility_Container01');

      expect(JSON.parse(gridContainerStrJson).$type).assertEqual('Grid');
      let secondGridItemStrJson = getInspectorByKey('Grid_RowCol_ItemVisibility02');
      expect(JSON.parse(secondGridItemStrJson).$attrs.visibility).assertEqual("Visibility.Visible");

      expect(Math.abs(firstGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.top - gridContainer.top) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.left - firstGridItem.right) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.top - gridContainer.top) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.top - firstGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.left - thirdGridItem.right) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.top - firstGridItem.bottom) <= 1).assertTrue();

      expect(Math.abs(firstGridItem.right - firstGridItem.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.bottom - firstGridItem.top - vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(secondGridItem.right - secondGridItem.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.bottom - secondGridItem.top - vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(thirdGridItem.right - thirdGridItem.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.bottom - thirdGridItem.top - vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(fourthGridItem.right - fourthGridItem.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.bottom - fourthGridItem.top - vp2px(150)) <= 1).assertTrue();

      console.info('[testGridRowColItemVisibilityVisible] END');
      done();
    });
  })
}
