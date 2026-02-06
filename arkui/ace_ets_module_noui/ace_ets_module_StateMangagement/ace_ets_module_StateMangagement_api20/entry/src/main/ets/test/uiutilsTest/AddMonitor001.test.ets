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
import {UiComponent, Driver, Component, UiWindow, ON, UIElementInfo} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function AddMonitor001() {
  describe('AddMonitor001', () => {
    beforeEach(async (done: Function) => {
      console.info("AddMonitor001 setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/uiutils/AddMonitor001",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("AddMonitor001" == pages.name)) {
          console.info("get AddMonitor001 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AddMonitor001 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AddMonitor001 page error:" + err);
      }
      console.info("AddMonitor001 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("AddMonitor001 after each called");
    });

    /**
     * @tc.number    AddMonitor001_001
     * @tc.name      AddMonitor001_001
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('AddMonitor001_001', Level.LEVEL0, async (done: Function) => {
      console.info('[AddMonitor001_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('changeName01'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let text_1 = await (await driver.findComponent(ON.id('age01'))).getText();
      console.info("[AddMonitor001_001] component text_1: " + text_1);
      expect(text_1).assertEqual("1");
      await CommonFunc.sleep(1000);
      console.info('[AddMonitor001_001] END');
      done();
    });

  })
}