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

export default function list_ListInitialIndex2Test() {
  describe('List_ListInitialIndex2Test', () => {
    beforeEach(async (done: Function) => {
      console.info("List_ListInitialIndex2Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_initialIndex/List_ListInitialIndex2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get List_ListInitialIndex2 state pages:" + JSON.stringify(pages));
        if (!("List_ListInitialIndex2" == pages.name)) {
          console.info("get List_ListInitialIndex2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push List_ListInitialIndex2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push List_ListInitialIndex2 page error:" + err);
      }
      console.info("List_ListInitialIndex2Test beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("List_ListInitialIndex2 after each called");
    });
    /**
     * @tc.number SUB_ACE_LIST_LISTINITIALINDEX_0200
     * @tc.name testListInitialIndexToZeroWithOneLane
     * @tc.desc the InitialIndex of list set to 0
     */
    it('testListInitialIndexToZeroWithOneLane', 0, async (done: Function) => {
      console.info('[testListInitialIndexToZeroWithOneLane] START');
      let firstListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex2_1');
      let secondListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex2_2');
      let thirdListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex2_3');
      let fourthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex2_4');
      let fifthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex2_5');
      let sixthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex2_6');
      let seventhListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex2_7');
      let eighthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex2_8');
      let ninthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex2_9');
      let tenthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex2_10');
      let eleventhListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex2_11');
      let twelfthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex2_12');
      let listContainer: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex2_Container01');
      let listContainerStrJson = getInspectorByKey('List_ListInitialIndex2_Container01');

      expect(JSON.parse(listContainerStrJson).$type).assertEqual('List');

      expect(firstListItem.top).assertEqual(firstListItem.top);
      expect(firstListItem.left).assertEqual(listContainer.left);
      expect(Math.round(firstListItem.right - firstListItem.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(firstListItem.bottom - firstListItem.top)).assertEqual(Math.round(vp2px(100)));

      expect(Math.round(secondListItem.top - firstListItem.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(secondListItem.left).assertEqual(listContainer.left);
      expect(Math.round(secondListItem.right - secondListItem.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(secondListItem.bottom - secondListItem.top)).assertEqual(Math.round(vp2px(100)));

      expect(Math.round(thirdListItem.top - secondListItem.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(thirdListItem.left).assertEqual(listContainer.left);
      expect(Math.round(thirdListItem.right - thirdListItem.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(thirdListItem.bottom - thirdListItem.top)).assertEqual(Math.round(vp2px(100)));

      expect(Math.round(fourthListItem.top - thirdListItem.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(fourthListItem.left).assertEqual(listContainer.left);
      expect(Math.round(fourthListItem.right - fourthListItem.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(fourthListItem.bottom - fourthListItem.top)).assertEqual(Math.round(vp2px(100)));

      expect(Math.round(fifthListItem.top - fourthListItem.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(fifthListItem.left).assertEqual(listContainer.left);
      expect(Math.round(fifthListItem.right - fifthListItem.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(fifthListItem.bottom - fifthListItem.top)).assertEqual(Math.round(vp2px(100)));

      expect(Math.round(sixthListItem.right - sixthListItem.left)).assertEqual(vp2px(0));
      expect(Math.round(sixthListItem.bottom - sixthListItem.top)).assertEqual(vp2px(0));

      expect(Math.round(seventhListItem.right - seventhListItem.left)).assertEqual(vp2px(0));
      expect(Math.round(seventhListItem.bottom - seventhListItem.top)).assertEqual(vp2px(0));

      expect(Math.round(eighthListItem.right - eighthListItem.left)).assertEqual(vp2px(0));
      expect(Math.round(eighthListItem.bottom - eighthListItem.top)).assertEqual(vp2px(0));

      expect(Math.round(ninthListItem.right - ninthListItem.left)).assertEqual(vp2px(0));
      expect(Math.round(ninthListItem.bottom - ninthListItem.top)).assertEqual(vp2px(0));

      expect(Math.round(tenthListItem.right - tenthListItem.left)).assertEqual(vp2px(0));
      expect(Math.round(tenthListItem.bottom - tenthListItem.top)).assertEqual(vp2px(0));

      expect(Math.round(eleventhListItem.right - eleventhListItem.left)).assertEqual(vp2px(0));
      expect(Math.round(eleventhListItem.bottom - eleventhListItem.top)).assertEqual(vp2px(0));

      expect(Math.round(twelfthListItem.right - twelfthListItem.left)).assertEqual(vp2px(0));
      expect(Math.round(twelfthListItem.bottom - twelfthListItem.top)).assertEqual(vp2px(0));

      let driver = Driver.create();
      await driver.swipe(Math.round(globalThis.winLeft + fourthListItem.left + ((fourthListItem.right - fourthListItem.left) / 2)),
         Math.round(globalThis.winTop +fourthListItem.bottom), Math.round(globalThis.winLeft + firstListItem.left + (firstListItem.right - firstListItem.left) / 2),
        Math.round(globalThis.winTop + firstListItem.bottom));
      await CommonFunc.sleep(2000);
      fifthListItem = CommonFunc.getComponentRect('List_ListInitialIndex2_5');
      sixthListItem = CommonFunc.getComponentRect('List_ListInitialIndex2_6');
      seventhListItem = CommonFunc.getComponentRect('List_ListInitialIndex2_7');
      listContainer = CommonFunc.getComponentRect('List_ListInitialIndex2_Container01');

      expect(Math.round(sixthListItem.top - fifthListItem.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(sixthListItem.left).assertEqual(listContainer.left);
      expect(Math.round(sixthListItem.right - sixthListItem.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(sixthListItem.bottom - sixthListItem.top)).assertEqual(Math.round(vp2px(100)));

      expect(Math.round(seventhListItem.top - sixthListItem.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(seventhListItem.left).assertEqual(listContainer.left);
      expect(Math.round(seventhListItem.right - seventhListItem.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(seventhListItem.bottom - seventhListItem.top)).assertEqual(Math.round(vp2px(100)));
      console.info('[testListInitialIndexToZeroWithOneLane] END');
      done();
    });
  })
}
