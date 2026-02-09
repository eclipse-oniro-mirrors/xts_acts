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
import CommonFunc, { RectValue } from '../../../MainAbility/common/Common';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  UiDirection,
  MouseButton
} from '@ohos.UiTest';

export default function list_ListInitialIndex1Test() {
  describe('List_ListInitialIndex1Test', () => {
    beforeEach(async (done: Function) => {
      console.info("List_ListInitialIndexTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_initialIndex/List_ListInitialIndex1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get List_ListInitialIndex1 state pages:" + JSON.stringify(pages));
        if (!("List_ListInitialIndex1" == pages.name)) {
          console.info("get List_ListInitialIndex1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push List_ListInitialIndex1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push List_ListInitialIndex1 page error:" + err);
      }
      console.info("List_ListInitialIndexTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("List_ListInitialIndex1Test after each called");
    });
    /**
     * @tc.name   testListInitialIndexToTwoWithOneLane
     * @tc.number SUB_ACE_LIST_LISTINITIALINDEX_0100
     * @tc.desc   the InitialIndex of list set to 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testListInitialIndexToTwoWithOneLane',  Level.LEVEL0, async (done: Function) => {
      console.info('[testListInitialIndexToTwoWithOneLane] START');
      let firstListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex1_1');
      let secondListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex1_2');
      let thirdListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex1_3');
      let fourthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex1_4');
      let fifthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex1_5');
      let sixthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex1_6');
      let seventhListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex1_7');
      let eighthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex1_8');
      let ninthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex1_9');
      let tenthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex1_10');
      let eleventhListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex1_11');
      let twelfthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex1_12');
      let listContainer: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex1_Container01');
      let listContainerStrJson = getInspectorByKey('List_ListInitialIndex1_Container01');
      expect(JSON.parse(listContainerStrJson).$type).assertEqual('List');

      expect(Math.abs(Math.floor(firstListItem.right - firstListItem.left) - vp2px(0)) <= 1).assertTrue();
      expect(Math.abs(Math.floor(firstListItem.bottom - firstListItem.top) - vp2px(0)) <= 1).assertTrue();

      expect(Math.abs(Math.floor(secondListItem.right - secondListItem.left) - vp2px(0)) <= 1).assertTrue();
      expect(Math.abs(Math.floor(secondListItem.bottom - secondListItem.top) - vp2px(0)) <= 1).assertTrue();

      expect(Math.abs(thirdListItem.top - listContainer.top) <= 1).assertTrue();
      expect(Math.abs(thirdListItem.left - listContainer.left) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdListItem.right - thirdListItem.left) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdListItem.bottom - thirdListItem.top) - Math.round(vp2px(100))) <= 1).assertTrue();

      expect(Math.abs(Math.floor(fourthListItem.top - thirdListItem.bottom - vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(fourthListItem.left - listContainer.left) <= 1).assertTrue();
      expect(Math.abs(Math.round(fourthListItem.right - fourthListItem.left) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(fourthListItem.bottom - fourthListItem.top) - Math.round(vp2px(100))) <= 1).assertTrue();

      expect(Math.abs(Math.floor(fifthListItem.top - fourthListItem.bottom - vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(fifthListItem.left - listContainer.left) <= 1).assertTrue();
      expect(Math.abs(Math.round(fifthListItem.right - fifthListItem.left) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(fifthListItem.bottom - fifthListItem.top) - Math.round(vp2px(100))) <= 1).assertTrue();

      expect(Math.abs(Math.floor(sixthListItem.top - fifthListItem.bottom - vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(sixthListItem.left - listContainer.left) <= 1).assertTrue();
      expect(Math.abs(Math.round(sixthListItem.right - sixthListItem.left) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(sixthListItem.bottom - sixthListItem.top) - Math.round(vp2px(100))) <= 1).assertTrue();

      expect(Math.abs(Math.floor(seventhListItem.top - sixthListItem.bottom - vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(seventhListItem.left - listContainer.left) <= 1).assertTrue();
      expect(Math.abs(Math.round(seventhListItem.right - seventhListItem.left) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(seventhListItem.bottom - seventhListItem.top) - Math.round(vp2px(100))) <= 1).assertTrue();

      expect(Math.round(eighthListItem.right - eighthListItem.left)).assertEqual(Math.round(vp2px(0)));
      expect(Math.round(eighthListItem.bottom - eighthListItem.top)).assertEqual(Math.round(vp2px(0)));

      expect(Math.round(ninthListItem.right - ninthListItem.left)).assertEqual(Math.round(vp2px(0)));
      expect(Math.round(ninthListItem.bottom - ninthListItem.top)).assertEqual(Math.round(vp2px(0)));

      expect(Math.round(tenthListItem.right - tenthListItem.left)).assertEqual(Math.round(vp2px(0)));
      expect(Math.round(tenthListItem.bottom - tenthListItem.top)).assertEqual(Math.round(vp2px(0)));

      expect(Math.round(eleventhListItem.right - eleventhListItem.left)).assertEqual(vp2px(0));
      expect(Math.round(eleventhListItem.bottom - eleventhListItem.top)).assertEqual(vp2px(0));

      expect(Math.round(twelfthListItem.right - twelfthListItem.left)).assertEqual(vp2px(0));
      expect(Math.round(twelfthListItem.bottom - twelfthListItem.top)).assertEqual(vp2px(0));

      let driver = Driver.create();
      await driver.swipe(Math.round(globalThis.winLeft + thirdListItem.left + ((thirdListItem.right - thirdListItem.left) / 2)),
        Math.round(globalThis.winTop + thirdListItem.bottom), Math.round(globalThis.winLeft + fifthListItem.left + (fifthListItem.right - fifthListItem.left) / 2),
        Math.round(globalThis.winTop + fifthListItem.bottom));
      await CommonFunc.sleep(2000);
      firstListItem = CommonFunc.getComponentRect('List_ListInitialIndex1_1');
      secondListItem = CommonFunc.getComponentRect('List_ListInitialIndex1_2');
      listContainer = CommonFunc.getComponentRect('List_ListInitialIndex1_Container01');
      expect(Math.abs(firstListItem.top - listContainer.top) <= 1).assertTrue();
      expect(Math.abs(firstListItem.left - listContainer.left) <= 1).assertTrue();
      expect(Math.abs(Math.round(firstListItem.right - firstListItem.left) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(firstListItem.bottom - firstListItem.top) - Math.round(vp2px(100))) <= 1).assertTrue();

      expect(Math.abs(Math.floor(secondListItem.top - firstListItem.bottom - vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(secondListItem.left - listContainer.left) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondListItem.right - secondListItem.left) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondListItem.bottom - secondListItem.top) - Math.round(vp2px(100))) <= 1).assertTrue();
      console.info('[testListInitialIndexToTwoWithOneLane] END');
      done();
    });
  })
}
