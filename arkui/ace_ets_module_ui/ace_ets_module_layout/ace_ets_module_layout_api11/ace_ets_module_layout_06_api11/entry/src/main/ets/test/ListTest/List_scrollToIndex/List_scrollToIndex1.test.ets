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

export default function List_scrollToIndex1() {
  describe('List_scrollToIndex1', () => {
    beforeEach(async (done: Function) => {
      console.info("List_scrollToIndex1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/List_scrollToIndex/List_scrollToIndex1",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get List_scrollToIndex1 state pages:" + JSON.stringify(pages));
        if (!("List_scrollToIndex1" == pages.name)) {
          console.info("get List_scrollToIndex1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push List_scrollToIndex1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push List_scrollToIndex1 page error:" + err);
      }
      console.info("List_scrollToIndex1 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.back()
      console.info("List_scrollToIndex1 after each called");
    });

    /**
     * @tc.name   List_scrollToIndex1_0100
     * @tc.number SUB_ACE_TS_COMPONENT_SR000I6TL2_014
     * @tc.desc   scrollToIndex align is not set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('List_scrollToIndex1_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[List_scrollToIndex1_0100] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('List_scrollToIndex1_to5'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let List: RectValue = CommonFunc.getComponentRect('List_scrollToIndex1_List');
      let ListItem: RectValue = CommonFunc.getComponentRect('List_scrollToIndex1_ListItem5');
      expect(Math.abs(ListItem.top - List.top) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem.bottom) - Math.round(List.top + vp2px(40))) <= 1).assertTrue();
      console.info('[List_scrollToIndex1_0100] END');
      done();
    });

  })
}