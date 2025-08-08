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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function groupAnVisible() {
  describe('groupAnVisible', () => {
    beforeEach(async (done: Function) => {
      console.info("groupAnVisible beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/groupAnVisible",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get groupAnVisible state pages:" + JSON.stringify(pages));
        if (!("groupAnVisible" == pages.name)) {
          console.info("get groupAnVisible pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push groupAnVisible page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push groupAnVisible page error:" + err);
      }
      console.info("groupAnVisible beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("groupAnVisible after each called");
    });

    /**
     * @tc.number    groupAnVisible_001
     * @tc.name      groupAnVisible_0100
     * @tc.desc      ListItemGroup sets explicit and implicit settings, and calls the ScrollPage interface.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('groupAnVisible_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[groupAnVisible_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btnVisible1: Component = await driver.findComponent(ON.id('group_visible_change'));
      await btnVisible1.click();
      await CommonFunc.sleep(1000);
      let btnVisible2: Component = await driver.findComponent(ON.id('listItem_visible_change'));
      await btnVisible2.click();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('visible_anTrue_group'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('group_visible_mess');
      console.info("[groupAnVisible_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[groupAnVisible_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('onScrollVisibleContentChange: 1');
      console.info('[groupAnVisible_0100] END');
      done();
    });
  })
}
