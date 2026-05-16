/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';

export default function editBadgeGrid() {
  describe('editBadgeGrid', () => {
    beforeEach(async (done: Function) => {
      console.info("editBadgeGrid beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/editBadgeGrid",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get editBadgeGrid state pages:" + JSON.stringify(pages));
        if (!("editBadgeGrid" == pages.name)) {
          console.info("get editBadgeGrid pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push editBadgeGrid page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push editBadgeGrid page error:" + err);
      }
      console.info("editBadgeGrid beforeEach end");
      done();
    });

    /**
     * @tc.name   editBadgeGrid_0100
     * @tc.number editBadgeGrid_0100
     * @tc.desc   Display the number of selected items using a digital badge.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('editBadgeGrid_0100', Level.LEVEL3, async (done: Function) => {
      console.info('[editBadgeGrid_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('grid_editBadge_1'));
      await btn1.click();
      await CommonFunc.sleep(300);
      let btn2: Component = await driver.findComponent(ON.id('grid_editBadge_4'));
      await btn2.click();
      await CommonFunc.sleep(300);
      await btn2.longClick();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('grid_editBadge_text');
      console.info("[editBadgeGrid_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual("numberBadge: 2");
      let btnMenu: Component = await driver.findComponent(ON.id('grid_editBadge_menu'));
      await btnMenu.click();
      await CommonFunc.sleep(1500);
      console.info('[editBadgeGrid_0100] END');
      done();
    });

    /**
     * @tc.name   editBadgeGrid_0200
     * @tc.number editBadgeGrid_0200
     * @tc.desc   Returning false means not displaying the badge.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('editBadgeGrid_0200', Level.LEVEL3, async (done: Function) => {
      console.info('[editBadgeGrid_0200] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('grid_editBadge_false_0'));
      await btn.longClick();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('grid_editBadge_false');
      console.info("[editBadgeGrid_0200] type: " + JSON.stringify(JSON.parse(strJson).$type));
      expect(JSON.parse(strJson).$type).assertEqual("Grid");
      let btnMenu: Component = await driver.findComponent(ON.id('grid_editBadge_menu'));
      await btnMenu.click();
      await CommonFunc.sleep(1500);
      console.info('[editBadgeGrid_0200] END');
      done();
    });
  })
}
