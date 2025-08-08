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

export default function grid_RowCol_ItemContentSizeTest() {
  describe('Grid_RowCol_ItemContentSizeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_RowCol_ItemContentSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridTemplatesAllSet/GridItemChange/Grid_RowCol_ItemContentSize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_RowCol_ItemContentSize state pages:" + JSON.stringify(pages));
        if (!("Grid_RowCol_ItemContentSize" == pages.name)) {
          console.info("get Grid_RowCol_ItemContentSize state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_RowCol_ItemContentSize page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_RowCol_ItemContentSize page error:" + err);
      }
      console.info("Grid_RowCol_ItemContentSizeTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Grid_RowCol_ItemContentSizeTest after each called");
    });
    /**
     * @tc.number SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDITEMCHANGE_0900
     * @tc.name testGridRowColItemContentSize
     * @tc.desc The second griditem set width to '50%',height to '50%'
     */
    it('testGridRowColItemContentSize',  Level.LEVEL0, async (done: Function) => {
      console.info('[testGridRowColItemContentSize] START');
      globalThis.value.message.notify({
        name: 'secondGridItemContentHeight', value: '50%'
      });
      globalThis.value.message.notify({
        name: 'secondGridItemContentWidth', value: '50%'
      });
      await CommonFunc.sleep(3000);
      let firstGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemContentSize01');
      let secondGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemContentSize02');
      let secondGridItemText: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemContentSize_Text02');
      let thirdGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemContentSize03');
      let fourthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemContentSize04');
      let gridContainer: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemContentSize_Container01');
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_ItemContentSize_Container01');

      expect(JSON.parse(gridContainerStrJson).$type).assertEqual('Grid');

      expect(Math.round(secondGridItemText.right - secondGridItemText.left) - Math.round(vp2px(75)) <= 1).assertTrue();
      expect(Math.round(secondGridItemText.bottom - secondGridItemText.top) - Math.round(vp2px(75)) <= 1).assertTrue();
      expect(Math.round(secondGridItemText.left - secondGridItem.left) - Math.round(secondGridItem.right -
      secondGridItemText.right) <= 1).assertTrue();
      expect(Math.round(secondGridItemText.top - secondGridItem.top) - Math.round(secondGridItem.bottom -
      secondGridItemText.bottom) <= 1).assertTrue();

      expect(firstGridItem.left - gridContainer.left <= 1).assertTrue();
      expect(firstGridItem.top - gridContainer.top <= 1).assertTrue();
      expect(secondGridItem.left - firstGridItem.right <= 1).assertTrue();
      expect(secondGridItem.top - gridContainer.top <= 1).assertTrue();
      expect(thirdGridItem.left - gridContainer.left <= 1).assertTrue();
      expect(thirdGridItem.top - firstGridItem.bottom <= 1).assertTrue();
      expect(fourthGridItem.left - thirdGridItem.right <= 1).assertTrue();
      expect(fourthGridItem.top - thirdGridItem.top <= 1).assertTrue();

      expect(Math.round(firstGridItem.right - firstGridItem.left) - Math.round(vp2px(150)) <= 1).assertTrue();
      expect(Math.round(firstGridItem.bottom - firstGridItem.top) - Math.round(vp2px(150)) <= 1).assertTrue();

      expect(Math.round(secondGridItem.right - secondGridItem.left) - Math.round(vp2px(150)) <= 1).assertTrue();
      expect(Math.round(secondGridItem.bottom - secondGridItem.top) - Math.round(vp2px(150)) <= 1).assertTrue();

      expect(Math.round(thirdGridItem.right - thirdGridItem.left) - Math.round(vp2px(150)) <= 1).assertTrue();
      expect(Math.round(thirdGridItem.bottom - thirdGridItem.top) - Math.round(vp2px(150)) <= 1).assertTrue();

      expect(Math.round(fourthGridItem.right - fourthGridItem.left) - Math.round(vp2px(150)) <= 1).assertTrue();
      expect(Math.round(fourthGridItem.bottom - fourthGridItem.top) - Math.round(vp2px(150)) <= 1).assertTrue();

      console.info('[testGridRowColItemContentSize] END');
      done();
    });
  })
}
