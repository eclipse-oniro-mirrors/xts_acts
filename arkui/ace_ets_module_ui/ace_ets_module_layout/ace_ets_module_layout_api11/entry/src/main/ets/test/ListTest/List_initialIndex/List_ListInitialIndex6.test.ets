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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
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

export default function list_ListInitialIndex6Test() {
  describe('List_ListInitialIndex6Test', () => {
    beforeEach(async (done: Function) => {
      console.info("List_ListInitialIndex6Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_initialIndex/List_ListInitialIndex6',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get List_ListInitialIndex6 state pages:" + JSON.stringify(pages));
        if (!("List_ListInitialIndex6" == pages.name)) {
          console.info("get List_ListInitialIndex6 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push List_ListInitialIndex6 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push List_ListInitialIndex6 page error:" + err);
      }
      console.info("List_ListInitialIndex6Test beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("List_ListInitialIndex6Test after each called");
    });
    /**
     * @tc.number SUB_ACE_LIST_LISTINITIALINDEX_0600
     * @tc.name testListInitialIndexToThreeWithTwoLane
     * @tc.desc set the InitialIndex of list to 3,the lanes of list to 2
     */
    it('testListInitialIndexToThreeWithTwoLane', 0, async (done: Function) => {
      console.info('[testListInitialIndexToThreeWithTwoLane] START');
      let firstListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex6_1');
      let secondListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex6_2');
      let thirdListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex6_3');
      let fourthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex6_4');
      let fifthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex6_5');
      let sixthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex6_6');
      let seventhListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex6_7');
      let eighthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex6_8');
      let ninthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex6_9');
      let tenthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex6_10');
      let eleventhListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex6_11');
      let twelfthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex6_12');
      let listContainer: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex6_Container01');
      let listContainerStrJson = getInspectorByKey('List_ListInitialIndex6_Container01');

      expect(JSON.parse(listContainerStrJson).$type).assertEqual('List');

      expect(Math.round(firstListItem.right - firstListItem.left)).assertEqual(vp2px(0));
      expect(Math.round(firstListItem.bottom - firstListItem.top)).assertEqual(vp2px(0));

      expect(Math.round(secondListItem.right - secondListItem.left)).assertEqual(vp2px(0));
      expect(Math.round(secondListItem.bottom - secondListItem.top)).assertEqual(vp2px(0));

      expect(thirdListItem.top).assertEqual(listContainer.top);
      expect(thirdListItem.left).assertEqual(listContainer.left);
      expect(Math.round(thirdListItem.right - thirdListItem.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(thirdListItem.bottom - thirdListItem.top)).assertEqual(Math.round(vp2px(100)));

      expect(thirdListItem.top).assertEqual(listContainer.top);
      expect(Math.round(fourthListItem.left - thirdListItem.right)).assertEqual(Math.round(vp2px(50)));
      expect(Math.round(fourthListItem.right - fourthListItem.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(fourthListItem.bottom - fourthListItem.top)).assertEqual(Math.round(vp2px(100)));

      expect(Math.round(fifthListItem.top - thirdListItem.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(fifthListItem.left).assertEqual(listContainer.left);
      expect(Math.round(fifthListItem.right - fifthListItem.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(fifthListItem.bottom - fifthListItem.top)).assertEqual(Math.round(vp2px(100)));

      expect(Math.round(sixthListItem.top - fourthListItem.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(sixthListItem.left - fifthListItem.right)).assertEqual(Math.round(vp2px(50)));
      expect(Math.round(sixthListItem.right - sixthListItem.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(sixthListItem.bottom - sixthListItem.top)).assertEqual(Math.round(vp2px(100)));

      expect(Math.round(seventhListItem.top - fifthListItem.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(seventhListItem.left).assertEqual(listContainer.left);
      expect(Math.round(seventhListItem.right - seventhListItem.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(seventhListItem.bottom - seventhListItem.top)).assertEqual(Math.round(vp2px(100)));

      expect(Math.round(eighthListItem.top - sixthListItem.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(eighthListItem.left - seventhListItem.right)).assertEqual(Math.round(vp2px(50)));
      expect(Math.round(eighthListItem.right - eighthListItem.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(eighthListItem.bottom - eighthListItem.top)).assertEqual(Math.round(vp2px(100)));

      expect(Math.round(ninthListItem.top - seventhListItem.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(ninthListItem.left).assertEqual(listContainer.left);
      expect(Math.round(ninthListItem.right - ninthListItem.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(ninthListItem.bottom - ninthListItem.top)).assertEqual(Math.round(vp2px(100)));

      expect(Math.round(tenthListItem.top - eighthListItem.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(tenthListItem.left - ninthListItem.right)).assertEqual(Math.round(vp2px(50)));
      expect(Math.round(tenthListItem.right - tenthListItem.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(tenthListItem.bottom - tenthListItem.top)).assertEqual(Math.round(vp2px(100)));

      expect(Math.round(eleventhListItem.top - ninthListItem.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(eleventhListItem.left).assertEqual(listContainer.left);
      expect(Math.round(eleventhListItem.right - eleventhListItem.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(eleventhListItem.bottom - eleventhListItem.top)).assertEqual(Math.round(vp2px(100)));

      expect(Math.round(twelfthListItem.top - tenthListItem.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(twelfthListItem.left - eleventhListItem.right)).assertEqual(Math.round(vp2px(50)));
      expect(Math.round(twelfthListItem.right - twelfthListItem.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(twelfthListItem.bottom - twelfthListItem.top)).assertEqual(Math.round(vp2px(100)));


      let driver = Driver.create();
      await driver.swipe(Math.round(globalThis.winLeft + thirdListItem.left + ((thirdListItem.right - thirdListItem.left) / 2)),
        Math.round(globalThis.winTop + thirdListItem.bottom), Math.round(globalThis.winLeft + fifthListItem.left + (fifthListItem.right - fifthListItem.left) / 2),
        Math.round(globalThis.winTop + fifthListItem.bottom));
      await CommonFunc.sleep(2000);
      firstListItem = CommonFunc.getComponentRect('List_ListInitialIndex6_1');
      secondListItem = CommonFunc.getComponentRect('List_ListInitialIndex6_2');

      expect(firstListItem.top).assertEqual(listContainer.top);
      expect(firstListItem.left).assertEqual(listContainer.left);
      expect(Math.round(firstListItem.right - firstListItem.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(firstListItem.bottom - firstListItem.top)).assertEqual(Math.round(vp2px(100)));

      expect(secondListItem.top).assertEqual(listContainer.top);
      expect(Math.round(secondListItem.left - firstListItem.right)).assertEqual(Math.round(vp2px(50)));
      expect(Math.round(secondListItem.right - secondListItem.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(secondListItem.bottom - secondListItem.top)).assertEqual(Math.round(vp2px(100)));
      console.info('[SUB_ACE_LIST_LISTINITIALINDEX_0600] END');
      done();
    });
  })
}
