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

export default function list_SpaceChangeTest() {
  describe('list_SpaceChangeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("list_SpaceChangeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_SpaceChange/List_SpaceChange',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get List_SpaceChange state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get List_SpaceChange pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push List_SpaceChange page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push List_SpaceChange page error:" + err);
      }
      console.info("list_SpaceChangeTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("list_SpaceChangeTest after each called");
    });
    /**
     * @tc.number SUB_ACE_LIST_SPACECHANGE_0100
     * @tc.name testListSpaceChangeUnfill
     * @tc.desc set the space of list to 20
     */
    it('testListSpaceChangeUnfill',  Level.LEVEL0, async (done: Function) => {
      console.info('[testListSpaceChangeUnfill] START');
      globalThis.value.message.notify({
        name: 'Space', value: 20
      });
      await CommonFunc.sleep(1000);
      let firstListItem: RectValue = CommonFunc.getComponentRect('List_SpaceChange01');
      let secondListItem: RectValue = CommonFunc.getComponentRect('List_SpaceChange02');
      let thirdListItem: RectValue = CommonFunc.getComponentRect('List_SpaceChange03');
      let fourthListItem: RectValue = CommonFunc.getComponentRect('List_SpaceChange04');
      let listContainer: RectValue = CommonFunc.getComponentRect('List_SpaceChange_Container01');
      let listContainerStrJson = getInspectorByKey('List_SpaceChange_Container01');
      let listWidth: number = listContainer.right - listContainer.left;
      let listHeight: number = listContainer.bottom - listContainer.top;
      let listItemHeight: number = firstListItem.bottom - firstListItem.top;
      let listItemHeight2: number = secondListItem.bottom - secondListItem.top;

      expect(JSON.parse(listContainerStrJson).$type).assertEqual('List');

      expect(firstListItem.top).assertEqual(listContainer.top);
      expect(firstListItem.left).assertEqual(listContainer.left);
      expect(Math.abs(Math.round(firstListItem.right - firstListItem.left) - Math.round(listWidth * 0.4)) <= 1).assertTrue();
      expect(Math.abs(Math.round(firstListItem.bottom - firstListItem.top) - Math.round(listHeight * 0.18)) <= 1).assertTrue();

      expect(Math.abs(Math.round(secondListItem.top - firstListItem.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
      expect(secondListItem.left).assertEqual(listContainer.left);
      expect(Math.abs(Math.round(secondListItem.right - secondListItem.left) - Math.round(listWidth * 0.4)) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondListItem.bottom - secondListItem.top) - Math.round(listHeight * 0.18)) <= 1).assertTrue();

      expect(Math.abs(Math.round(thirdListItem.top - secondListItem.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
      expect(thirdListItem.left).assertEqual(listContainer.left);
      expect(Math.abs(Math.round(thirdListItem.right - thirdListItem.left) - Math.round(listWidth * 0.4)) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdListItem.bottom - thirdListItem.top) - Math.round(listHeight * 0.18)) <= 1).assertTrue();

      expect(Math.abs(Math.round(fourthListItem.top - thirdListItem.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
      expect(fourthListItem.left).assertEqual(listContainer.left);
      expect(Math.abs(Math.round(fourthListItem.right - fourthListItem.left) - Math.round(listWidth * 0.4)) <= 1).assertTrue();
      expect(Math.abs(Math.round(fourthListItem.bottom - fourthListItem.top) - Math.round(listHeight * 0.18)) <= 1).assertTrue();

      console.info(`[testListSpaceChangeUnfill](listContainer.bottom - fourthListItem.bottom)=
        ${(listContainer.bottom - fourthListItem.bottom)}`);
      console.info(`[testListSpaceChangeUnfill](listHeight - 2 * listItemHeight - 2 * listItemHeight2 - vp2px(60))=
        ${(listHeight - 2 * listItemHeight - 2 * listItemHeight2 - vp2px(60))}`);
      expect(Math.floor(Math.abs((listContainer.bottom - fourthListItem.bottom) - (listHeight - 2 * listItemHeight - 2 * listItemHeight2 - vp2px(60)))) <= 1).assertTrue();

      let driver = Driver.create();
      await driver.swipe(
        Math.round(globalThis.winLeft + fourthListItem.left + ((fourthListItem.right - fourthListItem.left) / 2)),
        Math.round(globalThis.winTop + fourthListItem.bottom),
        Math.round(globalThis.winLeft + thirdListItem.left + ((thirdListItem.right - thirdListItem.left) / 2)),
        Math.round(globalThis.winTop + thirdListItem.bottom));
      await CommonFunc.sleep(1000);

      fourthListItem = CommonFunc.getComponentRect('List_SpaceChange04');
      listContainer = CommonFunc.getComponentRect('List_SpaceChange_Container01');
      expect(Math.floor(Math.abs((listContainer.bottom - fourthListItem.bottom) - (listHeight - 2 * listItemHeight - 2 * listItemHeight2 - vp2px(60)))) <= 1).assertTrue();

      console.info('[testListSpaceChangeUnfill] END');

      // reset status
      globalThis.value.message.notify({
        name: 'Space', value: 0
      });
      await CommonFunc.sleep(2000);
      done();
    });
    /**
     * @tc.number SUB_ACE_LIST_SPACECHANGE_0200
     * @tc.name testListSpaceChangeFill
     * @tc.desc set the space of list to 40
     */
    it('testListSpaceChangeFill',  Level.LEVEL0, async (done: Function) => {
      console.info('[testListSpaceChangeFill] START');
      globalThis.value.message.notify({
        name: 'Space', value: 40
      });
      await CommonFunc.sleep(1000);
      let firstListItem: RectValue = CommonFunc.getComponentRect('List_SpaceChange01');
      let secondListItem: RectValue = CommonFunc.getComponentRect('List_SpaceChange02');
      let thirdListItem: RectValue = CommonFunc.getComponentRect('List_SpaceChange03');
      let fourthListItem: RectValue = CommonFunc.getComponentRect('List_SpaceChange04');
      let listContainer: RectValue = CommonFunc.getComponentRect('List_SpaceChange_Container01');
      let listContainerStrJson = getInspectorByKey('List_SpaceChange_Container01');
      let listWidth: number = listContainer.right - listContainer.left;
      let listHeight: number = listContainer.bottom - listContainer.top;
      let listItemHeight: number = firstListItem.bottom - firstListItem.top;
      let listItemHeight2: number = secondListItem.bottom - secondListItem.top;

      expect(JSON.parse(listContainerStrJson).$type).assertEqual('List');

      expect(firstListItem.top).assertEqual(listContainer.top);
      expect(firstListItem.left).assertEqual(listContainer.left);
      expect(Math.abs(Math.round(firstListItem.right - firstListItem.left) - Math.round(listWidth * 0.4)) <= 1).assertTrue();
      expect(Math.abs(Math.round(firstListItem.bottom - firstListItem.top) - Math.round(listHeight * 0.18)) <= 1).assertTrue();

      expect(Math.abs(Math.round(secondListItem.top - firstListItem.bottom) - Math.round(vp2px(40))) <= 1).assertTrue();
      expect(secondListItem.left).assertEqual(listContainer.left);
      expect(Math.abs(Math.round(secondListItem.right - secondListItem.left) - Math.round(listWidth * 0.4)) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondListItem.bottom - secondListItem.top) - Math.round(listHeight * 0.18)) <= 1).assertTrue();

      expect(Math.abs(Math.round(thirdListItem.top - secondListItem.bottom) - Math.round(vp2px(40))) <= 1).assertTrue();
      expect(thirdListItem.left).assertEqual(listContainer.left);
      expect(Math.abs(Math.round(thirdListItem.right - thirdListItem.left) - Math.round(listWidth * 0.4)) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdListItem.bottom - thirdListItem.top) - Math.round(listHeight * 0.18)) <= 1).assertTrue();

      expect(Math.abs(Math.round(fourthListItem.top - thirdListItem.bottom) - Math.round(vp2px(40))) <= 1).assertTrue();
      expect(fourthListItem.left).assertEqual(listContainer.left);
      expect(Math.abs(Math.round(fourthListItem.right - fourthListItem.left) - Math.round(listWidth * 0.4)) <= 1).assertTrue();
      expect(Math.abs(Math.round(fourthListItem.bottom - fourthListItem.top) - Math.round(listHeight * 0.18)) <= 1).assertTrue();

      console.info(`[testListSpaceChangeFill](listContainer.bottom - fourthListItem.bottom)=
        ${(listContainer.bottom - fourthListItem.bottom)}`);
      console.info(`[testListSpaceChangeFill](listHeight - 2 * listItemHeight - 2 * listItemHeight2 - vp2px(120))=
        ${(listHeight - 2 * listItemHeight - 2 * listItemHeight2 - vp2px(120))}`);
      expect(Math.floor(Math.abs((listContainer.bottom - fourthListItem.bottom) - (listHeight - 2 * listItemHeight - 2 * listItemHeight2 - vp2px(120)))) <= 1).assertTrue();

      let driver = Driver.create();
      await driver.swipe(
        Math.round(globalThis.winLeft + fourthListItem.left + ((fourthListItem.right - fourthListItem.left) / 2)),
        Math.round(globalThis.winTop + fourthListItem.bottom - 10),
        Math.round(globalThis.winLeft + thirdListItem.left + ((thirdListItem.right - thirdListItem.left) / 2)),
        Math.round(globalThis.winTop + thirdListItem.bottom));
      await CommonFunc.sleep(2000);

      fourthListItem = CommonFunc.getComponentRect('List_SpaceChange04');
      listContainer = CommonFunc.getComponentRect('List_SpaceChange_Container01');
      if (fourthListItem.bottom < listContainer.bottom ){
       expect(Math.floor(Math.abs((listContainer.bottom - fourthListItem.bottom) - (listHeight - 2 * listItemHeight - 2 * listItemHeight2 - vp2px(120)))) <= 1).assertTrue();
      } else {
       expect(listContainer.bottom <= fourthListItem.bottom).assertTrue();
      }

      console.info('[testListSpaceChangeFill] END');
      
      // reset status
      globalThis.value.message.notify({
        name: 'Space', value: 0
      });
      await CommonFunc.sleep(2000);
      done();
    });
    /**
     * @tc.number SUB_ACE_LIST_SPACECHANGE_0300
     * @tc.name testListSpaceChangeOverflow
     * @tc.desc set the space of list to 60
     */
    it('testListSpaceChangeOverflow',  Level.LEVEL0, async (done: Function) => {
      console.info('[testListSpaceChangeOverflow] START');
      globalThis.value.message.notify({
        name: 'Space', value: 60
      });
      await CommonFunc.sleep(1000);
      let firstListItem: RectValue = CommonFunc.getComponentRect('List_SpaceChange01');
      let secondListItem: RectValue = CommonFunc.getComponentRect('List_SpaceChange02');
      let thirdListItem: RectValue = CommonFunc.getComponentRect('List_SpaceChange03');
      let fourthListItem: RectValue = CommonFunc.getComponentRect('List_SpaceChange04');
      let listContainer: RectValue = CommonFunc.getComponentRect('List_SpaceChange_Container01');
      let listContainerStrJson = getInspectorByKey('List_SpaceChange_Container01');
      let listWidth: number = listContainer.right - listContainer.left;
      let listHeight: number = listContainer.bottom - listContainer.top;
      let listItemHeight: number = firstListItem.bottom - firstListItem.top;
      let listItemHeight2: number = secondListItem.bottom - secondListItem.top;

      expect(JSON.parse(listContainerStrJson).$type).assertEqual('List');

      expect(firstListItem.top).assertEqual(listContainer.top);
      expect(firstListItem.left).assertEqual(listContainer.left);
      expect(Math.abs(Math.round(firstListItem.right - firstListItem.left) - Math.round(listWidth * 0.4)) <= 1).assertTrue();
      expect(Math.abs(Math.round(firstListItem.bottom - firstListItem.top) - Math.round(listHeight * 0.18)) <= 1).assertTrue();

      expect(Math.abs(Math.round(secondListItem.top - firstListItem.bottom) - Math.round(vp2px(60))) <= 1).assertTrue();
      expect(secondListItem.left).assertEqual(listContainer.left);
      expect(Math.abs(Math.round(secondListItem.right - secondListItem.left) - Math.round(listWidth * 0.4)) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondListItem.bottom - secondListItem.top) - Math.round(listHeight * 0.18)) <= 1).assertTrue();

      expect(Math.abs(Math.round(thirdListItem.top - secondListItem.bottom) - Math.round(vp2px(60))) <= 1).assertTrue();
      expect(thirdListItem.left).assertEqual(listContainer.left);
      expect(Math.abs(Math.round(thirdListItem.right - thirdListItem.left) - Math.round(listWidth * 0.4)) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdListItem.bottom - thirdListItem.top) - Math.round(listHeight * 0.18)) <= 1).assertTrue();

      expect(Math.abs(Math.round(fourthListItem.top - thirdListItem.bottom) - Math.round(vp2px(60))) <= 1).assertTrue();
      expect(fourthListItem.left).assertEqual(listContainer.left);
      expect(Math.abs(Math.round(fourthListItem.right - fourthListItem.left) - Math.round(listWidth * 0.4)) <= 1).assertTrue();
      expect(Math.abs(Math.round(fourthListItem.bottom - fourthListItem.top) - Math.round(listHeight * 0.18)) <= 1).assertTrue();

      console.info(`[testListSpaceChangeOverflow](listContainer.bottom - fourthListItem.bottom)=
        ${(listContainer.bottom - fourthListItem.bottom)}`);
      console.info(`[testListSpaceChangeOverflow](listHeight - 2 * listItemHeight - 2 * listItemHeight2 - vp2px(180))=
        ${(listHeight - 2 * listItemHeight - 2 * listItemHeight2 - vp2px(180))}`);
      expect(Math.floor(Math.abs((listContainer.bottom - fourthListItem.bottom) - (listHeight - 2 * listItemHeight - 2 * listItemHeight2 - vp2px(180)))) <= 1).assertTrue();
      let driver = Driver.create();
      await driver.swipe(
        Math.round(globalThis.winLeft + thirdListItem.left + ((thirdListItem.right - thirdListItem.left) / 2)),
        Math.round(globalThis.winTop + thirdListItem.bottom),
        Math.round(globalThis.winLeft + secondListItem.left + ((secondListItem.right - secondListItem.left) / 2)),
        Math.round(globalThis.winTop + secondListItem.bottom));
      await CommonFunc.sleep(1000);
      fourthListItem = CommonFunc.getComponentRect('List_SpaceChange04');
      listContainer = CommonFunc.getComponentRect('List_SpaceChange_Container01');
      if (fourthListItem.bottom < listContainer.bottom ){
      expect(Math.floor(Math.abs((listContainer.bottom - fourthListItem.bottom) - (listHeight - 2 * listItemHeight - 2 * listItemHeight2 - vp2px(180)))) <= 1).assertTrue();
      } else {
       expect(listContainer.bottom <= fourthListItem.bottom).assertTrue();
      }
      console.info('[testListSpaceChangeOverflow] END');

      // reset status
      globalThis.value.message.notify({
        name: 'Space', value: 0
      });
      await CommonFunc.sleep(2000);
      done();
    });
  })
}