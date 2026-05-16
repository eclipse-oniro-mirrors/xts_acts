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
import {UiComponent, Driver, Component, UiWindow, ON, UIElementInfo} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function PersistentTest0040() {
  describe('PersistentTest0040', () => {
    beforeEach(async (done: Function) => {
      console.info("PersistentTest0040 setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Zhuang/Persistent0040",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("Persistent0040" == pages.name)) {
          console.info("get PersistentTest0040 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PersistentTest0040 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PersistentTest0040 page error:" + err);
      }
      console.info("PersistentTest0040 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("PersistentTest0040 after each called");
    });

    /**
     * @tc.name   PersistentTest0040_001
     * @tc.number SUB_ACE_STATUSMANAGER_PERSISTENSTORAGE_INTERFACE_0040
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PersistentTest0040_001', Level.LEVEL0, async (done: Function) => {
      console.info('[PersistentTest0040_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnChangePS0040"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvPS0040'));
      console.info("[PersistentTest0040] component obj content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('value:HelloArkUI');
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id("btnDelPS0040"));
      await CommonFunc.sleep(1000);
      await btn1.click();
      console.info('[PersistentTest0040_001] END');
      done();
    });
  })
}
