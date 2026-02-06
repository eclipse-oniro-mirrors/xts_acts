/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';
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

export default function listItem_SizeChange() {

  describe('ListItem_SizeChangeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ListItem_SizeChange beforeEach called");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_Space/ListItemChange/ListItem_SizeChange',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get ListItem_SizeChange state pages:" + JSON.stringify(pages));
        if (!("ListItem_SizeChange" == pages.name)) {
          console.info("get ListItem_SizeChange state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push ListItem_SizeChange page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListItem_SizeChange page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ListItem_SizeChange afterEach called");
    });

    /**
     * @tc.name   testListItemSizeChangeHeight120Width300
     * @tc.number SUB_ACE_LIST_LISTITEM_SIZECHANGE_TEST_0100
     * @tc.desc   The ListItem subcomponent changes the width 300 and height 120 attributes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testListItemSizeChangeHeight120Width300',  Level.LEVEL0, async (done: Function) => {
      console.info('new testListItemSizeChangeHeight120Width300 START');
      globalThis.value.message.notify({
        name: 'height', value: 120
      })
      globalThis.value.message.notify({
        name: 'width', value: 300
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ListItemSizeChange1');

      expect(JSON.parse(strJson).$type).assertEqual('List');
      let locationText1: RectValue = CommonFunc.getComponentRect('ListItemTest1');
      let locationText2: RectValue = CommonFunc.getComponentRect('ListItemTest2');
      let locationText3: RectValue = CommonFunc.getComponentRect('ListItemTest3');
      let locationText4: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      let locationList: RectValue = CommonFunc.getComponentRect('ListItemSizeChange1');
      let left = locationList.left;
      let top = locationList.top;
      let right = locationList.right;
      let bottom = locationList.bottom;
      expect(Math.abs(Math.round(locationText1.left - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.left - locationText3.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText3.left - locationText4.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText4.left - locationList.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText1.top - locationList.top)) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText1.right - locationText1.left) - Math.round(vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText1.bottom - locationText1.top) - Math.round(vp2px(120))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.right - locationText2.left) - Math.round(vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.bottom - locationText2.top) - Math.round(vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.right - locationText3.left) - Math.round(vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.bottom - locationText3.top) - Math.round(vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.right - locationText4.left) - Math.round(vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.bottom - locationText4.top) - Math.round(vp2px(100))) <= 1).assertTrue();
	  
	  expect(Math.abs(Math.round(locationText2.top - locationText1.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.top - locationText2.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.top - locationText3.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationList.bottom - locationText4.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
	 
	  expect(Math.abs(Math.round(locationList.right - locationList.left) - Math.round(vp2px(350))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationList.bottom - locationList.top) - Math.round(vp2px(500))) <= 1).assertTrue();
	  
      let driver = Driver.create();
      await driver.swipe(Math.round(globalThis.winLeft + left + (right -left)/2), Math.round((bottom-top)/2 + top + globalThis.winTop), Math.round(globalThis.winLeft + left + (right -left)/2), Math.round(top + globalThis.winTop));
      let locationText4Again: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      expect(Math.floor(Math.abs(locationText4.top - locationText4Again.top)) <= 1).assertTrue();
      console.info('new testListItemSizeChangeHeight120Width300 END');
      done();
    });

    /**
     * @tc.name   testListItemSizeChangeHeight160Width300
     * @tc.number SUB_ACE_LIST_LISTITEM_SIZECHANGE_TEST_0200
     * @tc.desc   The ListItem subcomponent changes the width 300 and height 160 attributes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testListItemSizeChangeHeight160Width300',  Level.LEVEL0, async (done: Function) => {
      console.info('new testListItemSizeChangeHeight160Width300 START');
      globalThis.value.message.notify({
        name: 'height', value: 160
      })
      globalThis.value.message.notify({
        name: 'width', value: 300
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ListItemSizeChange1');

      expect(JSON.parse(strJson).$type).assertEqual('List');
      let locationText1: RectValue = CommonFunc.getComponentRect('ListItemTest1');
      let locationText2: RectValue = CommonFunc.getComponentRect('ListItemTest2');
      let locationText3: RectValue = CommonFunc.getComponentRect('ListItemTest3');
      let locationText4: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      let locationList: RectValue = CommonFunc.getComponentRect('ListItemSizeChange1');
      let left = locationList.left;
      let top = locationList.top;
      let right = locationList.right;
      let bottom = locationList.bottom;
      expect(Math.abs(Math.round(locationText1.left - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.left - locationText3.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText3.left - locationText4.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText4.left - locationList.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText1.top - locationList.top)) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText1.right - locationText1.left) - Math.round(vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText1.bottom - locationText1.top) - Math.round(vp2px(160))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.right - locationText2.left) - Math.round(vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.bottom - locationText2.top) - Math.round(vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.right - locationText3.left) - Math.round(vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.bottom - locationText3.top) - Math.round(vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.right - locationText4.left) - Math.round(vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.bottom - locationText4.top) - Math.round(vp2px(100))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText2.top - locationText1.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.top - locationText2.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.top - locationText3.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.bottom - locationList.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationList.right - locationList.left) - Math.round(vp2px(350))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationList.bottom - locationList.top) - Math.round(vp2px(500))) <= 1).assertTrue();
      let driver = Driver.create();
      await driver.swipe(Math.round(globalThis.winLeft + left + (right -left)/2), Math.round((bottom-top)*0.4 + top + globalThis.winTop), Math.round(globalThis.winLeft + left + (right -left)/2), Math.round(top + globalThis.winTop));
      await CommonFunc.sleep(3000);
      let locationText4Again: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      expect(Math.floor(Math.abs(locationText4Again.bottom - locationList.bottom)) <= 1).assertTrue();
      console.info('new testListItemSizeChangeHeight160Width300 END');
      done();
    });

    /**
     * @tc.name   testListItemSizeChangeHeight100Width100
     * @tc.number SUB_ACE_LIST_LISTITEM_SIZECHANGE_TEST_0300
     * @tc.desc   The ListItem subcomponent changes the width 100 and height 100 attributes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testListItemSizeChangeHeight100Width100',  Level.LEVEL0, async (done: Function) => {
      console.info('new testListItemSizeChangeHeight100Width100 START');
      globalThis.value.message.notify({
        name: 'height', value: 100
      })
      globalThis.value.message.notify({
        name: 'width', value: 100
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ListItemSizeChange1');

      expect(JSON.parse(strJson).$type).assertEqual('List');
      let locationText1: RectValue = CommonFunc.getComponentRect('ListItemTest1');
      let locationText2: RectValue = CommonFunc.getComponentRect('ListItemTest2');
      let locationText3: RectValue = CommonFunc.getComponentRect('ListItemTest3');
      let locationText4: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      let locationList: RectValue = CommonFunc.getComponentRect('ListItemSizeChange1');
      let left = locationList.left;
      let top = locationList.top;
      let right = locationList.right;
      let bottom = locationList.bottom;
     
      expect(Math.abs(Math.round(locationText1.left - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.left - locationText3.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText3.left - locationText4.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText4.left - locationList.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText1.top - locationList.top)) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText1.right - locationText1.left) - Math.round(vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText1.bottom - locationText1.top) - Math.round(vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.right - locationText2.left) - Math.round(vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.bottom - locationText2.top) - Math.round(vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.right - locationText3.left) - Math.round(vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.bottom - locationText3.top) - Math.round(vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.right - locationText4.left) - Math.round(vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.bottom - locationText4.top) - Math.round(vp2px(100))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText2.top - locationText1.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.top - locationText2.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.top - locationText3.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationList.bottom - locationText4.bottom) - Math.round(vp2px(40))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationList.right - locationList.left) - Math.round(vp2px(350))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationList.bottom - locationList.top) - Math.round(vp2px(500))) <= 1).assertTrue();
      let driver = Driver.create();
      await driver.swipe(Math.round(globalThis.winLeft + left + (right -left)/2), Math.round((bottom-top)/2 + top + globalThis.winTop), Math.round(globalThis.winLeft + left + (right -left)/2), Math.round(top + globalThis.winTop));
      await CommonFunc.sleep(2000);
      let locationText4Again: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      expect(Math.floor(Math.abs(locationText4.top - locationText4Again.top)) <= 1).assertTrue();
      console.info('new testListItemSizeChangeHeight100Width100 END');
      done();
    });

    /**
     * @tc.name   testListItemSizeChangeHeight100Width380
     * @tc.number SUB_ACE_LIST_LISTITEM_SIZECHANGE_TEST_0400
     * @tc.desc   The ListItem subcomponent changes the width 380 and height 100 attributes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testListItemSizeChangeHeight100Width380',  Level.LEVEL0, async (done: Function) => {
      console.info('new testListItemSizeChangeHeight100Width380 START');
      globalThis.value.message.notify({
        name: 'height', value: 100
      })
      globalThis.value.message.notify({
        name: 'width', value: 380
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ListItemSizeChange1');

      expect(JSON.parse(strJson).$type).assertEqual('List');
      let locationText1: RectValue = CommonFunc.getComponentRect('ListItemTest1');
      let locationText2: RectValue = CommonFunc.getComponentRect('ListItemTest2');
      let locationText3: RectValue = CommonFunc.getComponentRect('ListItemTest3');
      let locationText4: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      let locationList: RectValue = CommonFunc.getComponentRect('ListItemSizeChange1');
      let left = locationList.left;
      let top = locationList.top;
      let right = locationList.right;
      let bottom = locationList.bottom;
      expect(Math.abs(Math.round(locationText1.left - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.left - locationText3.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText3.left - locationText4.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText4.left - locationList.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText1.top - locationList.top)) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText1.right - locationText1.left) - Math.round(vp2px(380))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText1.bottom - locationText1.top) - Math.round(vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.right - locationText2.left) - Math.round(vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.bottom - locationText2.top) - Math.round(vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.right - locationText3.left) - Math.round(vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.bottom - locationText3.top) - Math.round(vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.right - locationText4.left) - Math.round(vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.bottom - locationText4.top) - Math.round(vp2px(100))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText2.top - locationText1.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.top - locationText2.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.top - locationText3.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationList.bottom - locationText4.bottom) - Math.round(vp2px(40))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationList.right - locationList.left) - Math.round(vp2px(350))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationList.bottom - locationList.top) - Math.round(vp2px(500))) <= 1).assertTrue();
      let driver = Driver.create();
      await driver.swipe(Math.round(globalThis.winLeft + left + (right -left)/2), Math.round((bottom-top)/2 + top + globalThis.winTop), Math.round(globalThis.winLeft + left + (right -left)/2), Math.round(top + globalThis.winTop ));
      await CommonFunc.sleep(2000);
      let locationText4Again: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      expect(Math.floor(Math.abs(locationText4.top - locationText4Again.top)) <= 1).assertTrue();
      console.info('new testListItemSizeChangeHeight100Width380 END');
      done();
    });

    /**
     * @tc.name   testListItemSizeChangeHeight160Width380
     * @tc.number SUB_ACE_LIST_LISTITEM_SIZECHANGE_TEST_0500
     * @tc.desc   The ListItem subcomponent changes the width 380 and height 100 attributes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testListItemSizeChangeHeight160Width380',  Level.LEVEL0, async (done: Function) => {
      console.info('new testListItemSizeChangeHeight160Width380 START');
      globalThis.value.message.notify({
        name: 'height', value: 160
      })
      globalThis.value.message.notify({
        name: 'width', value: 380
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ListItemSizeChange1');

      expect(JSON.parse(strJson).$type).assertEqual('List');
      let locationText1: RectValue = CommonFunc.getComponentRect('ListItemTest1');
      let locationText2: RectValue = CommonFunc.getComponentRect('ListItemTest2');
      let locationText3: RectValue = CommonFunc.getComponentRect('ListItemTest3');
      let locationText4: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      let locationList: RectValue = CommonFunc.getComponentRect('ListItemSizeChange1');
      let left = locationList.left;
      let top = locationList.top;
      let right = locationList.right;
      let bottom = locationList.bottom;
      expect(Math.abs(Math.round(locationText1.left - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.left - locationText3.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText3.left - locationText4.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText4.left - locationList.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText1.top - locationList.top)) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText1.right - locationText1.left) - Math.round(vp2px(380))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText1.bottom - locationText1.top) - Math.round(vp2px(160))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.right - locationText2.left) - Math.round(vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.bottom - locationText2.top) - Math.round(vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.right - locationText3.left) - Math.round(vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.bottom - locationText3.top) - Math.round(vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.right - locationText4.left) - Math.round(vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.bottom - locationText4.top) - Math.round(vp2px(100))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText2.top - locationText1.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.top - locationText2.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.top - locationText3.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.bottom - locationList.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationList.right - locationList.left) - Math.round(vp2px(350))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationList.bottom - locationList.top) - Math.round(vp2px(500))) <= 1).assertTrue();
      let driver = Driver.create();
      await driver.swipe(Math.round(globalThis.winLeft + left + (right -left)/2), Math.round((bottom-top)*0.4 + top + globalThis.winTop), Math.round( globalThis.winLeft + left + (right -left)/2), Math.round(top + globalThis.winTop ));
      await CommonFunc.sleep(3000);
      let locationText4Again: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      expect(Math.floor(Math.abs(locationText4Again.bottom - locationList.bottom)) <= 1).assertTrue();
      console.info('new testListItemSizeChangeHeight160Width380 END');
      done();
    });
  })
}