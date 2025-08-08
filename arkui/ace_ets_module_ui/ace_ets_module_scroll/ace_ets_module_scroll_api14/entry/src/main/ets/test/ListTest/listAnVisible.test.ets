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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function listAnVisible() {
  describe('listAnVisible', () => {
    beforeEach(async (done: Function) => {
      console.info("listAnVisible beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/listAnVisible",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get listAnVisible state pages:" + JSON.stringify(pages));
        if (!("listAnVisible" == pages.name)) {
          console.info("get listAnVisible pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push listAnVisible page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listAnVisible page error:" + err);
      }
      console.info("listAnVisible beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("listAnVisible after each called");
    });

    /**
     * @tc.number    listAnVisible_001
     * @tc.name      listAnVisible_0100
     * @tc.desc      Set explicit and implicit for elements that are multiples of 3, and call the ScrollPage interface.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('listAnVisible_0100', 0, async (done: Function) => {
      console.info('[listAnVisible_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btnVisible: Component = await driver.findComponent(ON.id('list_visible_change'));
      await btnVisible.click();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('visible_anTrue'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('visible_last_index');
      console.info("[listAnVisible_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[listAnVisible_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('List: 6');
      console.info('[listAnVisible_0100] END');
      done();
    });
  })
}
