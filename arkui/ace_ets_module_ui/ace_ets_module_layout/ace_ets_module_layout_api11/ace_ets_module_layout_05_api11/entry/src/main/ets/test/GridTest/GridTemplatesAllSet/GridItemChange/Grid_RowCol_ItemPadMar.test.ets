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

export default function grid_RowCol_ItemPadMarTest() {
  describe('Grid_RowCol_ItemPadMarTest', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_RowCol_ItemPadMarTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridTemplatesAllSet/GridItemChange/Grid_RowCol_ItemPadMar',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_RowCol_ItemPadMar state pages:" + JSON.stringify(pages));
        if (!("Grid_RowCol_ItemPadMar" == pages.name)) {
          console.info("get Grid_RowCol_ItemPadMar state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_RowCol_ItemPadMar page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_RowCol_ItemPadMar page error:" + err);
      }
      console.info("Grid_RowCol_ItemPadMarTest beforeEach end");
      done();
    });
    afterEach(async () => {
      globalThis.value.message.notify({
        name: 'secondGridItemPadding', value: 0
      });
      globalThis.value.message.notify({
        name: 'secondGridItemMargin', value: 0
      });
      await CommonFunc.sleep(1000);
      console.info("Grid_RowCol_ItemPadMarTest after each called");
    });
    /**
     * @tc.number SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDITEMCHANGE_0100
     * @tc.name testGridRowColItemMargin
     * @tc.desc The second griditem set margin to 10
     */
    it('testGridRowColItemMargin',  Level.LEVEL0, async (done: Function) => {
      console.info('[testGridRowColItemMargin] START');
      globalThis.value.message.notify({
        name: 'secondGridItemMargin', value: 10
      });
      await CommonFunc.sleep(3000);
      let firstGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar01');
      let secondGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar02');
      let secondText: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar_Text02');
      let thirdGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar03');
      let fourthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar04');
      let gridContainer: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar_Container01');
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_ItemPadMar_Container01');

      expect(JSON.parse(gridContainerStrJson).$type).assertEqual('Grid');

      expect(Math.abs(secondGridItem.left - firstGridItem.right - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.top - gridContainer.top - vp2px(10)) <= 1).assertTrue(); //margin = 10

      expect(Math.abs(secondGridItem.left - secondText.left) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.top - secondText.top) <= 1).assertTrue();

      expect(Math.abs(secondGridItem.right - secondGridItem.left -
        (secondText.right - secondText.left)) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.bottom - secondGridItem.top -
        (secondText.bottom - secondText.top)) <= 1).assertTrue();

      expect(Math.abs(firstGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.top - gridContainer.top) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.top - firstGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.left - thirdGridItem.right) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.top - thirdGridItem.top) <= 1).assertTrue();

      expect(Math.abs(firstGridItem.right - firstGridItem.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.bottom - firstGridItem.top - vp2px(150)) <= 1).assertTrue();

      let mar: number = secondGridItem.left - firstGridItem.right
      let marWid: number = fourthGridItem.right - fourthGridItem.left
      console.info(`[testGridRowColItemMargin] secondGridItem.right - secondGridItem.left=
        ${(secondGridItem.right - secondGridItem.left)}`);
      console.info(`[testGridRowColItemMargin] secondGridItem.left - firstGridItem.right=
        ${(secondGridItem.left - firstGridItem.right)}`);
      console.info(`[testGridRowColItemMargin] fourthGridItem.right - fourthGridItem.left=
        ${(fourthGridItem.right - fourthGridItem.left)}`);
      expect(Math.floor(Math.abs((secondGridItem.right - secondGridItem.left) - (marWid - 2*mar))) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondGridItem.bottom - secondGridItem.top) -
        Math.round(vp2px(130))) <= 1).assertTrue();

      expect(Math.abs(thirdGridItem.right - thirdGridItem.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.bottom - thirdGridItem.top - vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(fourthGridItem.right - fourthGridItem.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.bottom - fourthGridItem.top - vp2px(150)) <= 1).assertTrue();

      console.info('[testGridRowColItemMargin] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDITEMCHANGE_0200
     * @tc.name testGridRowColItemPadding
     * @tc.desc The second griditem set padding to 10
     */
    it('testGridRowColItemPadding',  Level.LEVEL0, async (done: Function) => {
      console.info('[testGridRowColItemPadding] START');
      globalThis.value.message.notify({
        name: 'secondGridItemPadding', value: 10
      });
      await CommonFunc.sleep(3000);
      let firstGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar01');
      let secondGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar02');
      let secondText: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar_Text02');
      let thirdGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar03');
      let fourthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar04');
      let gridContainer: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar_Container01');
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_ItemPadMar_Container01');

      expect(JSON.parse(gridContainerStrJson).$type).assertEqual('Grid');
      expect(Math.abs(secondText.left - secondGridItem.left - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs(secondText.top - secondGridItem.top - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.right - secondText.right - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.bottom - secondText.bottom - vp2px(10)) <= 1).assertTrue(); //padding = 10

      expect(Math.abs(firstGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.top - gridContainer.top) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.left - firstGridItem.right) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.top - gridContainer.top) <= 1).assertTrue();
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
      console.info('[testGridRowColItemPadding] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDITEMCHANGE_0300
     * @tc.name testGridRowColItemMarPad
     * @tc.desc The second griditem set padding to 10,margin to 10
     */
    it('testGridRowColItemMarPad',  Level.LEVEL0, async (done: Function) => {
      console.info('[testGridRowColItemMarPad] START');
      globalThis.value.message.notify({
        name: 'secondGridItemPadding', value: 10
      });
      globalThis.value.message.notify({
        name: 'secondGridItemMargin', value: 10
      });
      await CommonFunc.sleep(3000);
      let firstGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar01');
      let secondGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar02');
      let secondText: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar_Text02');
      let thirdGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar03');
      let fourthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar04');
      let gridContainer: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar_Container01');
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_ItemPadMar_Container01');

      expect(JSON.parse(gridContainerStrJson).$type).assertEqual('Grid');

      expect(Math.abs(secondGridItem.left - firstGridItem.right - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.top - gridContainer.top - vp2px(10)) <= 1).assertTrue(); //margin = 10

      expect(Math.abs(secondText.left - secondGridItem.left - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs(secondText.top - secondGridItem.top - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.right - secondText.right - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.bottom - secondText.bottom - vp2px(10)) <= 1).assertTrue(); //padding = 10

      expect(Math.abs(firstGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.top - gridContainer.top) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.top - firstGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.left - thirdGridItem.right) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.top - thirdGridItem.top) <= 1).assertTrue();

      expect(Math.abs(firstGridItem.right - firstGridItem.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.bottom - firstGridItem.top - vp2px(150)) <= 1).assertTrue();

      let mar: number = secondGridItem.left - firstGridItem.right
      let marWid: number = fourthGridItem.right - fourthGridItem.left
      console.info(`[testGridRowColItemMargin] secondGridItem.right - secondGridItem.left=
        ${(secondGridItem.right - secondGridItem.left)}`);
      console.info(`[testGridRowColItemMargin] secondGridItem.left - firstGridItem.right=
        ${(secondGridItem.left - firstGridItem.right)}`);
      console.info(`[testGridRowColItemMargin] fourthGridItem.right - fourthGridItem.left=
        ${(fourthGridItem.right - fourthGridItem.left)}`);
      expect(Math.floor(Math.abs((secondGridItem.right - secondGridItem.left) - (marWid - 2*mar))) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondGridItem.bottom - secondGridItem.top) -
        Math.round(vp2px(130))) <= 1).assertTrue();

      expect(Math.abs(thirdGridItem.right - thirdGridItem.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.bottom - thirdGridItem.top - vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(fourthGridItem.right - fourthGridItem.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.bottom - fourthGridItem.top - vp2px(150)) <= 1).assertTrue();

      console.info('[testGridRowColItemMarPad] END');
      done();
    });
  })
}
