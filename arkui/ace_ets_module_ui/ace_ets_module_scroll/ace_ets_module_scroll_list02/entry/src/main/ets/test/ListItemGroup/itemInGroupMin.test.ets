/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function itemInGroupMin() {
  describe('itemInGroupMin', () => {
    beforeEach(async (done: Function) => {
      console.info("itemInGroupMin beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ListItemGroup/itemInGroupMin',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get itemInGroupMin state pages:" + JSON.stringify(pages));
        if (!("itemInGroupMin" == pages.name)) {
          console.info("get itemInGroupMin pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push itemInGroupMin page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push itemInGroupMin page error:" + err);
      }
      console.info("itemInGroupMin beforeEach end");
      done();
    });
    /**
     * @tc.name   itemInGroupMin_0100
     * @tc.number itemInGroupMin_0100
     * @tc.desc   set List scrollToItemInGroup to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('itemInGroupMin_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[itemInGroupMin_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('itemInGroup_min');
      console.info("[itemInGroupMin_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[itemInGroupMin_0100] type: " + JSON.stringify(JSON.parse(strJson).$type));
      expect(JSON.parse(strJson).$type).assertEqual("List");

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('itemInGroup_negative'));
      await button.click();
      await CommonFunc.sleep(1500);
      let list = CommonFunc.getComponentRectOnScreen('itemInGroup_min');
      console.info("[itemInGroupMin_0100] list_top is: " + list.top);
      let listItem = CommonFunc.getComponentRectOnScreen('itemGroup_min_1');
      console.info("[itemInGroupMin_0100] listItem_top is: " + listItem.top);
      let header = CommonFunc.getComponentRectOnScreen('group_min_header');
      let headerH = header.bottom - header.top
      console.info("[itemInGroupMin_0100] headerH is: " + headerH);
      expect(Math.floor(Math.abs(listItem.top - list.top - headerH)) <= 1).assertTrue();
      console.info('[itemInGroupMin_0100] END');
      done();
    });

    /**
     * @tc.name   itemInGroupMin_0200
     * @tc.number itemInGroupMin_0200
     * @tc.desc   set List scrollToItemInGroup to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('itemInGroupMin_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[itemInGroupMin_0200] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('itemInGroup_min');
      console.info("[itemInGroupMin_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[itemInGroupMin_0200] type: " + JSON.stringify(JSON.parse(strJson).$type));
      expect(JSON.parse(strJson).$type).assertEqual("List");

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('itemInGroup_0'));
      await button.click();
      await CommonFunc.sleep(1500);
      let list = CommonFunc.getComponentRectOnScreen('itemInGroup_min');
      console.info("[itemInGroupMin_0200] list_top is: " + list.top);
      let listItem = CommonFunc.getComponentRectOnScreen('itemGroup_min_1');
      console.info("[itemInGroupMin_0200] listItem_top is: " + listItem.top);
      expect(Math.floor(Math.abs(listItem.top - list.top)) <= 1).assertTrue();
      console.info('[itemInGroupMin_0200] END');
      done();
    });
  })
}
