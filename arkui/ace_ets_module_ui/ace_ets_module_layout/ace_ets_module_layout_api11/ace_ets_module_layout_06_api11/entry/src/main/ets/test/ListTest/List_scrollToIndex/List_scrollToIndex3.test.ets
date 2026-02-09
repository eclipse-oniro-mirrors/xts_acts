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
import { Driver, ON } from '@ohos.UiTest';

export default function List_scrollToIndex3() {
  describe('List_scrollToIndex3', () => {
    beforeEach(async (done: Function) => {
      console.info("List_scrollToIndex3 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/List_scrollToIndex/List_scrollToIndex3",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get List_scrollToIndex3 state pages:" + JSON.stringify(pages));
        if (!("List_scrollToIndex3" == pages.name)) {
          console.info("get List_scrollToIndex3 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push List_scrollToIndex3 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push List_scrollToIndex3 page error:" + err);
      }
      console.info("List_scrollToIndex3 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.back()
      console.info("List_scrollToIndex3 after each called");
    });


    /**
     * @tc.name   List_scrollToIndex3_0100
     * @tc.number SUB_ACE_TS_COMPONENT_SR000I6TL2_016
     * @tc.desc   scrollToIndex sets visible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('List_scrollToIndex3_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[List_scrollToIndex3_0100] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('List_scrollToIndex3_visibility'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let List: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_List');
      let ListItemGroup: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_ListItemGroup');
      expect(Math.abs(ListItemGroup.top - List.top) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItemGroup.bottom) - Math.round(List.top + vp2px(40))) <= 1).assertTrue();
      console.info('[List_scrollToIndex3_0100] END');
      done();
    });

    /**
     * @tc.name   List_scrollToIndex3_0200
     * @tc.number SUB_ACE_TS_COMPONENT_SR000I6TL2_015
     * @tc.desc   The value of scrollToIndex is set to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('List_scrollToIndex3_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('[List_scrollToIndex3_0200] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('List_scrollToIndex3_START0'));
      await btn.click();
      await CommonFunc.sleep(500);

      let List: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_List');
      let ListItem1: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_ListItem1');
      expect(Math.abs(Math.round(ListItem1.top) - Math.round(List.top + vp2px(10))) <= 1).assertTrue();
      console.info('[List_scrollToIndex3_0200] START0 END');

      let btn2 = await driver.findComponent(ON.id('List_scrollToIndex3_CENTER0'));
      await btn2.click();
      await CommonFunc.sleep(500);
      let ListItem2: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_ListItem1');
      expect(Math.abs(Math.round(ListItem2.top) - Math.round(List.top + vp2px(10))) <= 1).assertTrue();
      console.info('[List_scrollToIndex3_0200] CENTER0 END');

      let btn3 = await driver.findComponent(ON.id('List_scrollToIndex3_END0'));
      await btn3.click();
      await CommonFunc.sleep(500);
      let ListItem3: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_ListItem1');
      expect(Math.abs(Math.round(ListItem3.top) - Math.round(List.top + vp2px(10))) <= 1).assertTrue();
      console.info('[List_scrollToIndex3_0200] END0 END');

      let btn4 = await driver.findComponent(ON.id('List_scrollToIndex3_AUTO0'));
      await btn4.click();
      await CommonFunc.sleep(500);
      let ListItem4: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_ListItem1');
      expect(Math.abs(Math.round(ListItem4.top) - Math.round(List.top + vp2px(10))) <= 1).assertTrue();
      console.info('[List_scrollToIndex3_0200] AUTO0 END');

      let btnVisibility = await driver.findComponent(ON.id('List_scrollToIndex3_visibility'));
      await btnVisibility.click();
      await CommonFunc.sleep(1000);

      let btn22 = await driver.findComponent(ON.id('List_scrollToIndex3_CENTER0'));
      await btn22.click();
      await CommonFunc.sleep(500);
      let ListItemGroup22: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_ListItemGroup');
      expect(Math.abs(ListItemGroup22.top - List.top) <= 1).assertTrue();
      console.info('[List_scrollToIndex3_0200] visibility CENTER0 END');

      let btn33 = await driver.findComponent(ON.id('List_scrollToIndex3_END0'));
      await btn33.click();
      await CommonFunc.sleep(500);
      let ListItemGroup33: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_ListItemGroup');
      expect(Math.abs(ListItemGroup33.top - List.top) <= 1).assertTrue();
      console.info('[List_scrollToIndex3_0200] visibility END0 END');

      let btn44 = await driver.findComponent(ON.id('List_scrollToIndex3_AUTO0'));
      await btn44.click();
      await CommonFunc.sleep(500);
      let ListItemGroup44: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_ListItemGroup');
      expect(Math.abs(ListItemGroup44.top - List.top) <= 1).assertTrue();
      console.info('[List_scrollToIndex3_0200] visibility AUTO0 END');

      let btnScrollBy200 = await driver.findComponent(ON.id('List_scrollToIndex3_scrollBy'));
      await btnScrollBy200.click();
      await CommonFunc.sleep(1000);

      let btn111 = await driver.findComponent(ON.id('List_scrollToIndex3_START0'));
      await btn111.click();
      await CommonFunc.sleep(1000);
      let ListItemGroup111: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_ListItemGroup');
      expect(Math.abs(ListItemGroup111.top - List.top) <= 1).assertTrue();
      console.info('[List_scrollToIndex3_0200] ScrollBy200 START0 END');

      let btn222 = await driver.findComponent(ON.id('List_scrollToIndex3_CENTER0'));
      await btn222.click();
      await CommonFunc.sleep(500);
      let ListItemGroup222: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_ListItemGroup');
      expect(Math.abs(ListItemGroup222.top - List.top) <= 1).assertTrue();
      console.info('[List_scrollToIndex3_0200] ScrollBy200 CENTER0 END');

      let btn333 = await driver.findComponent(ON.id('List_scrollToIndex3_END0'));
      await btn333.click();
      await CommonFunc.sleep(500);
      let ListItemGroup333: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_ListItemGroup');
      expect(Math.abs(ListItemGroup333.top - List.top) <= 1).assertTrue();
      console.info('[List_scrollToIndex3_0200] ScrollBy200 END0 END');

      let btn444 = await driver.findComponent(ON.id('List_scrollToIndex3_AUTO0'));
      await btn444.click();
      await CommonFunc.sleep(500);
      let ListItemGroup444: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_ListItemGroup');
      expect(Math.abs(ListItemGroup444.top - List.top) <= 1).assertTrue();
      console.info('[List_scrollToIndex3_0200] ScrollBy200 AUTO0 END');

      console.info('[List_scrollToIndex3_0200] END');
      done();
    });

  })
}