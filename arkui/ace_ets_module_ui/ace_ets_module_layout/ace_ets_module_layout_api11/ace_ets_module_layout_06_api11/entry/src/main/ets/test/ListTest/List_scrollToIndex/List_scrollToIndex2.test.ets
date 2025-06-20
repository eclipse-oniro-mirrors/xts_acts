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
import { Driver, ON } from '@ohos.UiTest';

export default function List_scrollToIndex2() {
  describe('List_scrollToIndex2', () => {
    beforeEach(async (done: Function) => {
      console.info("List_scrollToIndex2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/List_scrollToIndex/List_scrollToIndex2",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get List_scrollToIndex2 state pages:" + JSON.stringify(pages));
        if (!("List_scrollToIndex2" == pages.name)) {
          console.info("get List_scrollToIndex2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push List_scrollToIndex2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push List_scrollToIndex2 page error:" + err);
      }
      console.info("List_scrollToIndex2 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.back()
      console.info("List_scrollToIndex2 after each called");
    });


    /**
     * @tc.number SUB_ACE_TS_COMPONENT_SR000I6TL2_001
     * @tc.name List_scrollToIndex2_0100
     * @tc.desc The value of scrollToIndex is greater than the number of items
     */
    it('List_scrollToIndex2_0100', 0, async (done: Function) => {
      console.info('[List_scrollToIndex2_0100] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('List_scrollToIndex2_to20'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let List: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_List');
      let ListItem: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_ListItem0');
      expect(Math.abs(ListItem.top - List.top) <= 1).assertTrue();
      console.info('[List_scrollToIndex2_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_TS_COMPONENT_SR000I6TL2_004
     * @tc.name List_scrollToIndex2_0200
     * @tc.desc The value of scrollToIndex is smaller than the number of items, the value value is set to -3
     */
    it('List_scrollToIndex2_0200', 0, async (done: Function) => {
      console.info('[List_scrollToIndex2_0200] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('List_scrollToIndex2_to-3'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let List: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_List');
      let ListItem: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_ListItem0');
      expect(Math.abs(ListItem.top - List.top) <= 1).assertTrue();
      console.info('[List_scrollToIndex2_0200] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_TS_COMPONENT_SR000I6TL2_002
     * @tc.name List_scrollToIndex2_0300
     * @tc.desc The value of scrollToIndex is smaller than the number of items, the value value is set to 0
     */
    it('List_scrollToIndex2_0300', 0, async (done: Function) => {
      console.info('[List_scrollToIndex2_0300] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('List_scrollToIndex2_to0'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let List: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_List');
      let ListItem: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_ListItem0');
      expect(Math.abs(ListItem.top - List.top) <= 1).assertTrue();
      console.info('[List_scrollToIndex2_0300] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_TS_COMPONENT_SR000I6TL2_003
     * @tc.name List_scrollToIndex2_0400
     * @tc.desc The value of scrollToIndex is smaller than the number of items, the value value is set to 9
     */
    it('List_scrollToIndex2_0400', 0, async (done: Function) => {
      console.info('[List_scrollToIndex2_0400] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('List_scrollToIndex2_to9'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let List: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_List');
      let ListItem: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_ListItem9');
      expect(Math.abs(ListItem.bottom - List.bottom) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem.top) - Math.round(List.bottom - vp2px(40))) <= 1).assertTrue();
      console.info('[List_scrollToIndex2_0400] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_TS_COMPONENT_SR000I6TL2_011
     * @tc.name List_scrollToIndex2_0500
     * @tc.desc scrollToIndex sets ScrollAlign.AUTO
     */
    it('List_scrollToIndex2_0500', 0, async (done: Function) => {
      console.info('[List_scrollToIndex2_0500] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('List_scrollToIndex2_AUTO5'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let List: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_List');
      let ListItem: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_ListItem5');
      expect(Math.abs(ListItem.bottom - List.bottom) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem.top) - Math.round(List.bottom - vp2px(40))) <= 1).assertTrue();
      console.info('[List_scrollToIndex2_0500] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_TS_COMPONENT_SR000I6TL2_013
     * @tc.name List_scrollToIndex2_0600
     * @tc.desc scrollToIndex is set to ScrollAlign.AUTO, and the list item is not completely in the display area
     */
    it('List_scrollToIndex2_0600', 0, async (done: Function) => {
      console.info('[List_scrollToIndex2_0600] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('List_scrollToIndex2_AUTO4'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let List: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_List');
      let ListItem: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_ListItem4');
      expect(Math.abs(ListItem.bottom - List.bottom) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem.top) - Math.round(List.bottom - vp2px(40))) <= 1).assertTrue();
      console.info('[List_scrollToIndex2_0600] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_TS_COMPONENT_SR000I6TL2_012
     * @tc.name List_scrollToIndex2_0700
     * @tc.desc scrollToIndex sets ScrollAlign.AUTO, and the list item is completely in the display area
     */
    it('List_scrollToIndex2_0700', 0, async (done: Function) => {
      console.info('[List_scrollToIndex2_0700] START');
      let ListItem1: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_ListItem1');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('List_scrollToIndex2_AUTO1'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let ListItem2: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_ListItem1');
      expect(Math.abs(ListItem1.top - ListItem2.top) <= 1).assertTrue();
      console.info('[List_scrollToIndex2_0700] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_TS_COMPONENT_SR000I6TL2_009
     * @tc.name List_scrollToIndex2_0800
     * @tc.desc scrollToIndex sets ScrollAlign.CENTER
     */
    it('List_scrollToIndex2_0800', 0, async (done: Function) => {
      console.info('[List_scrollToIndex2_0800] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('List_scrollToIndex2_CENTER5'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let List: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_List');
      let ListItem: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_ListItem5');
      expect(Math.abs(Math.round(ListItem.top)-Math.round(List.top + (List.bottom - List.top) / 2 - (ListItem.bottom - ListItem.top) / 2))<=1).assertTrue();
     
      console.info('[List_scrollToIndex2_0800] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_TS_COMPONENT_SR000I6TL2_010
     * @tc.name List_scrollToIndex2_0900
     * @tc.desc scrollToIndex sets ScrollAlign.END
     */
    it('List_scrollToIndex2_0900', 0, async (done: Function) => {
      console.info('[List_scrollToIndex2_0900] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('List_scrollToIndex2_END5'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let List: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_List');
      let ListItem: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_ListItem5');
      expect(Math.abs(ListItem.bottom - List.bottom) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem.top) - Math.round(List.bottom - vp2px(40))) <= 1).assertTrue();
      console.info('[List_scrollToIndex2_0900] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_TS_COMPONENT_SR000I6TL2_008
     * @tc.name List_scrollToIndex2_1000
     * @tc.desc scrollToIndex sets ScrollAlign.START
     */
    it('List_scrollToIndex2_1000', 0, async (done: Function) => {
      console.info('[List_scrollToIndex2_1000] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('List_scrollToIndex2_START5'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let List: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_List');
      let ListItem: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_ListItem5');
      expect(Math.abs(ListItem.top - List.top) <= 1).assertTrue();
	  console.info('value1000' + ListItem.bottom +  List.top)
      expect(Math.abs(Math.round(ListItem.bottom) - Math.round(List.top + vp2px(40))) <= 1).assertTrue();
      console.info('[List_scrollToIndex2_1000] END');
      done();
    });

  })
}