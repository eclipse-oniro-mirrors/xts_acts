
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
import CommonFunc from '../../../MainAbility/common/Common';
import { UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection,
  WindowMode, PointerMatrix, UiDirection, MouseButton } from '@ohos.UiTest';
export default function list_ListInitialIndex1Test() {
  describe('List_ListInitialIndex1Test', function () {
    beforeEach(async function (done) {
      console.info("List_ListInitialIndexTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/List/List_initialIndex/List_ListInitialIndex1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get List_ListInitialIndex1 state pages:" + JSON.stringify(pages));
        if (!("List_ListInitialIndex1" == pages.name)) {
          console.info("get List_ListInitialIndex1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push List_ListInitialIndex1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push List_ListInitialIndex1 page error:" + err);
      }
      console.info("List_ListInitialIndexTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("List_ListInitialIndex1Test after each called");
    });
    /**
     * @tc.number    SUB_ACE_LIST_LISTINITIALINDEX_0100
     * @tc.name      testListInitialIndexToTwoWithOneLane
     * @tc.desc      the InitialIndex of list set to 2
     */
    it('testListInitialIndexToTwoWithOneLane', 0, async function (done) {
      console.info('[testListInitialIndexToTwoWithOneLane] START');
      let firstListItem = CommonFunc.getComponentRect('List_ListInitialIndex1_1');
      let secondListItem = CommonFunc.getComponentRect('List_ListInitialIndex1_2');
      let thirdListItem = CommonFunc.getComponentRect('List_ListInitialIndex1_3');
      let fourthListItem = CommonFunc.getComponentRect('List_ListInitialIndex1_4');
      let fifthListItem = CommonFunc.getComponentRect('List_ListInitialIndex1_5');
      let sixthListItem = CommonFunc.getComponentRect('List_ListInitialIndex1_6');
      let seventhListItem = CommonFunc.getComponentRect('List_ListInitialIndex1_7');
      let eighthListItem = CommonFunc.getComponentRect('List_ListInitialIndex1_8');
      let ninthListItem = CommonFunc.getComponentRect('List_ListInitialIndex1_9');
      let tenthListItem = CommonFunc.getComponentRect('List_ListInitialIndex1_10');
      let eleventhListItem = CommonFunc.getComponentRect('List_ListInitialIndex1_11');
      let twelfthListItem = CommonFunc.getComponentRect('List_ListInitialIndex1_12');
      let listContainer = CommonFunc.getComponentRect('List_ListInitialIndex1_Container01');
      let listContainerStrJson = getInspectorByKey('List_ListInitialIndex1_Container01');
      let listContainerObj = JSON.parse(listContainerStrJson);
      expect(listContainerObj.$type).assertEqual('List');

      expect(Math.round(firstListItem.right - firstListItem.left)).assertEqual(Math.round(vp2px(0)));
      expect(Math.round(firstListItem.bottom - firstListItem.top)).assertEqual(Math.round(vp2px(0)));

      expect(Math.round(secondListItem.right - secondListItem.left)).assertEqual(Math.round(vp2px(0)));
      expect(Math.round(secondListItem.bottom - secondListItem.top)).assertEqual(Math.round(vp2px(0)));

      expect(thirdListItem.top).assertEqual(listContainer.top);
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

      expect(Math.round(sixthListItem.top - fifthListItem.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(sixthListItem.left).assertEqual(listContainer.left);
      expect(Math.round(sixthListItem.right - sixthListItem.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(sixthListItem.bottom - sixthListItem.top)).assertEqual(Math.round(vp2px(100)));

      expect(Math.round(seventhListItem.top - sixthListItem.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(seventhListItem.left).assertEqual(listContainer.left);
      expect(Math.round(seventhListItem.right - seventhListItem.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(seventhListItem.bottom - seventhListItem.top)).assertEqual(Math.round(vp2px(100)));

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

      let driver = await Driver.create();
      await driver.swipe(Math.round(thirdListItem.left + ((thirdListItem.right - thirdListItem.left) / 2)),
      Math.round(thirdListItem.bottom), Math.round(fifthListItem.left + (fifthListItem.right - fifthListItem.left) / 2),
      Math.round(fifthListItem.bottom));
      await CommonFunc.sleep(2000);
      firstListItem = CommonFunc.getComponentRect('List_ListInitialIndex1_1');
      secondListItem = CommonFunc.getComponentRect('List_ListInitialIndex1_2');
      listContainer = CommonFunc.getComponentRect('List_ListInitialIndex1_Container01');
      expect(firstListItem.top).assertEqual(listContainer.top);
      expect(firstListItem.left).assertEqual(listContainer.left);
      expect(Math.round(firstListItem.right - firstListItem.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(firstListItem.bottom - firstListItem.top)).assertEqual(Math.round(vp2px(100)));

      expect(Math.round(secondListItem.top - firstListItem.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(secondListItem.left).assertEqual(listContainer.left);
      expect(Math.round(secondListItem.right - secondListItem.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(secondListItem.bottom - secondListItem.top)).assertEqual(Math.round(vp2px(100)));
      console.info('[testListInitialIndexToTwoWithOneLane] END');
      done();
    });
  })
}
