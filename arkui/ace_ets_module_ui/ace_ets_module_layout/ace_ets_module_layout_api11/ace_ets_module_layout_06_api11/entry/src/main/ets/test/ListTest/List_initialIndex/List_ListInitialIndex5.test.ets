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

export default function list_ListInitialIndex5Test() {
  describe('List_ListInitialIndex5Test', () => {
    beforeEach(async (done: Function) => {
      console.info("List_ListInitialIndex5Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_initialIndex/List_ListInitialIndex5',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get List_ListInitialIndex5 state pages:" + JSON.stringify(pages));
        if (!("List_ListInitialIndex5" == pages.name)) {
          console.info("get List_ListInitialIndex5 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push List_ListInitialIndex5 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push List_ListInitialIndex5 page error:" + err);
      }
      console.info("List_ListInitialIndex5Test beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("List_ListInitialIndex5Test after each called");
    });
    /**
     * @tc.name   testListInitialIndexToTwelveWithTwoLane
     * @tc.number SUB_ACE_LIST_LISTINITIALINDEX_0500
     * @tc.desc   the InitialIndex of list set to 12,the lanes of list set to 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testListInitialIndexToTwelveWithTwoLane',  Level.LEVEL0, async (done: Function) => {
      console.info('[testListInitialIndexToTwelveWithTwoLane] START');
      let firstListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex5_1');
      let secondListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex5_2');
      let thirdListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex5_3');
      let fourthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex5_4');
      let fifthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex5_5');
      let sixthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex5_6');
      let seventhListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex5_7');
      let eighthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex5_8');
      let ninthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex5_9');
      let tenthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex5_10');
      let eleventhListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex5_11');
      let twelfthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex5_12');
      let listContainer: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex5_Container01');
      let listContainerStrJson = getInspectorByKey('List_ListInitialIndex5_Container01');
      
      let listContainer_width = listContainer.right - listContainer.left
      let listContainer_height = listContainer.bottom - listContainer.top
      console.info('[testListInitialIndexToTwelveWithTwoLane] listContainer_width: ' + listContainer_width);
      console.info('[testListInitialIndexToTwelveWithTwoLane] listContainer_height: ' + listContainer_height);

      expect(JSON.parse(listContainerStrJson).$type).assertEqual('List');

      expect(Math.abs(firstListItem.top - listContainer.top) <= 1).assertTrue();
      expect(Math.abs(firstListItem.left - listContainer.left) <= 1).assertTrue();
      expect(Math.abs(Math.round(firstListItem.right - firstListItem.left) - Math.round(listContainer_width*0.3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(firstListItem.bottom - firstListItem.top) - Math.round(listContainer_height*0.12)) <= 1).assertTrue();

      expect(Math.abs(secondListItem.top - listContainer.top) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondListItem.left - firstListItem.right) - Math.round(listContainer_width*0.2)) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondListItem.right - secondListItem.left) - Math.round(listContainer_width*0.3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondListItem.bottom - secondListItem.top) - Math.round(listContainer_height*0.12)) <= 1).assertTrue();

      expect(Math.abs(Math.round(thirdListItem.top - firstListItem.bottom) - Math.round(listContainer_height*0.1)) <= 1).assertTrue();
      expect(Math.abs(thirdListItem.left - listContainer.left) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdListItem.right - thirdListItem.left) - Math.round(listContainer_width*0.3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdListItem.bottom - thirdListItem.top) - Math.round(listContainer_height*0.12)) <= 1).assertTrue();

      expect(Math.abs(Math.round(fourthListItem.top - secondListItem.bottom) - Math.round(listContainer_height*0.1)) <= 1).assertTrue();
      expect(Math.abs(Math.round(fourthListItem.left - thirdListItem.right) - Math.round(listContainer_width*0.2)) <= 1).assertTrue();
      expect(Math.abs(Math.round(fourthListItem.right - fourthListItem.left) - Math.round(listContainer_width*0.3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(fourthListItem.bottom - fourthListItem.top) - Math.round(listContainer_height*0.12)) <= 1).assertTrue();

      expect(Math.abs(Math.round(fifthListItem.top - thirdListItem.bottom) - Math.round(listContainer_height*0.1)) <= 1).assertTrue();
      expect(Math.abs(fifthListItem.left - listContainer.left) <= 1).assertTrue();
      expect(Math.abs(Math.round(fifthListItem.right - fifthListItem.left) - Math.round(listContainer_width*0.3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(fifthListItem.bottom - fifthListItem.top) - Math.round(listContainer_height*0.12)) <= 1).assertTrue();

      expect(Math.abs(Math.round(sixthListItem.top - fourthListItem.bottom) - Math.round(listContainer_height*0.1)) <= 1).assertTrue();
      expect(Math.abs(Math.round(sixthListItem.left - fifthListItem.right) - Math.round(listContainer_width*0.2)) <= 1).assertTrue();
      expect(Math.abs(Math.round(sixthListItem.right - sixthListItem.left) - Math.round(listContainer_width*0.3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(sixthListItem.bottom - sixthListItem.top) - Math.round(listContainer_height*0.12)) <= 1).assertTrue();

      expect(Math.abs(Math.round(seventhListItem.top - fifthListItem.bottom) - Math.round(listContainer_height*0.1)) <= 1).assertTrue();
      expect(Math.abs(seventhListItem.left - listContainer.left) <= 1).assertTrue();
      expect(Math.abs(Math.round(seventhListItem.right - seventhListItem.left) - Math.round(listContainer_width*0.3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(seventhListItem.bottom - seventhListItem.top) - Math.round(listContainer_height*0.12)) <= 1).assertTrue();

      expect(Math.abs(Math.round(eighthListItem.top - sixthListItem.bottom) - Math.round(listContainer_height*0.1)) <= 1).assertTrue();
      expect(Math.abs(Math.round(eighthListItem.left - seventhListItem.right) - Math.round(listContainer_width*0.2)) <= 1).assertTrue();
      expect(Math.abs(Math.round(eighthListItem.right - eighthListItem.left) - Math.round(listContainer_width*0.3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(eighthListItem.bottom - eighthListItem.top) - Math.round(listContainer_height*0.12)) <= 1).assertTrue();

      expect(Math.abs(Math.round(ninthListItem.top - seventhListItem.bottom) - Math.round(listContainer_height*0.1)) <= 1).assertTrue();
      expect(Math.abs(ninthListItem.left - listContainer.left) <= 1).assertTrue();
      expect(Math.abs(Math.round(ninthListItem.right - ninthListItem.left) - Math.round(listContainer_width*0.3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(ninthListItem.bottom - ninthListItem.top) - Math.round(listContainer_height*0.12)) <= 1).assertTrue();

      expect(Math.abs(Math.round(tenthListItem.top - eighthListItem.bottom) - Math.round(listContainer_height*0.1)) <= 1).assertTrue();
      expect(Math.abs(Math.round(tenthListItem.left - ninthListItem.right) - Math.round(listContainer_width*0.2)) <= 1).assertTrue();
      expect(Math.abs(Math.round(tenthListItem.right - tenthListItem.left) - Math.round(listContainer_width*0.3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(tenthListItem.bottom - tenthListItem.top) - Math.round(listContainer_height*0.12)) <= 1).assertTrue();

      expect(Math.abs(Math.round(eleventhListItem.right - eleventhListItem.left) - vp2px(0)) <= 1).assertTrue();
      expect(Math.abs(Math.round(eleventhListItem.bottom - eleventhListItem.top) - vp2px(0)) <= 1).assertTrue();

      expect(Math.abs(Math.round(twelfthListItem.right - twelfthListItem.left) - vp2px(0)) <= 1).assertTrue();
      expect(Math.abs(Math.round(twelfthListItem.bottom - twelfthListItem.top) - vp2px(0)) <= 1).assertTrue();


      let driver = Driver.create();
      await driver.swipe(Math.round(globalThis.winLeft + listContainer.left + listContainer_width / 2),
        Math.round(globalThis.winTop + listContainer.bottom - listContainer_height / 6), Math.round(globalThis.winLeft + listContainer.left + listContainer_width / 2),
        Math.round(globalThis.winTop + listContainer.top + listContainer_height / 6));

      ninthListItem = CommonFunc.getComponentRect('List_ListInitialIndex5_9');
      tenthListItem = CommonFunc.getComponentRect('List_ListInitialIndex5_10');
      eleventhListItem = CommonFunc.getComponentRect('List_ListInitialIndex5_11');
      twelfthListItem = CommonFunc.getComponentRect('List_ListInitialIndex5_12');

      expect(Math.abs(Math.round(eleventhListItem.top - ninthListItem.bottom) - Math.round(listContainer_height*0.1)) <= 1).assertTrue();
      expect(Math.abs(eleventhListItem.left - listContainer.left) <= 1).assertTrue();
      expect(Math.abs(Math.round(eleventhListItem.right - eleventhListItem.left) - Math.round(listContainer_width*0.3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(eleventhListItem.bottom - eleventhListItem.top) - Math.round(listContainer_height*0.12)) <= 1).assertTrue();

      expect(Math.abs(Math.round(twelfthListItem.top - tenthListItem.bottom) - Math.round(listContainer_height*0.1)) <= 1).assertTrue();
      expect(Math.abs(Math.round(twelfthListItem.left - eleventhListItem.right) - Math.round(listContainer_width*0.2)) <= 1).assertTrue();
      expect(Math.abs(Math.round(twelfthListItem.right - twelfthListItem.left) - Math.round(listContainer_width*0.3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(twelfthListItem.bottom - twelfthListItem.top) - Math.round(listContainer_height*0.12)) <= 1).assertTrue();
      console.info('[testListInitialIndexToTwelveWithTwoLane] END');
      done();
    });
  })
}
