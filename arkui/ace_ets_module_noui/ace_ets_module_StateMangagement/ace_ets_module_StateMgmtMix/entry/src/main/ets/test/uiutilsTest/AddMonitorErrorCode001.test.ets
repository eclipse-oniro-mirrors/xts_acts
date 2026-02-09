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

export default function AddMonitorErrorCode001() {
  describe('AddMonitorErrorCode001', () => {
    beforeEach(async (done: Function) => {
      console.info("AddMonitorErrorCode001 setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/uiutils/AddMonitorErrorCode001",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("AddMonitorErrorCode001" == pages.name)) {
          console.info("get AddMonitorErrorCode001 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AddMonitorErrorCode001 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AddMonitorErrorCode001 page error:" + err);
      }
      console.info("AddMonitorErrorCode001 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("AddMonitorErrorCode001 after each called");
    });

    /**
     * @tc.name   AddMonitorErrorCode001_001
     * @tc.number AddMonitorErrorCode001_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AddMonitorErrorCode001_001', Level.LEVEL1, async (done: Function) => {
      console.info('[AddMonitorErrorCode001_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let text_1 = await (await driver.findComponent(ON.id('test1'))).getText();
      console.info("[AddMonitorErrorCode001_001] component text_1: " + text_1);
      expect(text_1).assertEqual("1");
      let text_2 = await (await driver.findComponent(ON.id('test2'))).getText();
      console.info("[AddMonitorErrorCode001_001] component text_2: " + text_2);
      expect(text_2).assertEqual("1");
      let btn: Component = await driver.findComponent(ON.id('btn01'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let text_3 = await (await driver.findComponent(ON.id('num1'))).getText();
      console.info("[AddMonitorErrorCode001_001] component text_3: " + text_3);
      expect(text_3).assertEqual("1");
      await CommonFunc.sleep(1000);
      console.info('[AddMonitorErrorCode001_001] END');
      done();
    });

    /**
     * @tc.name   AddMonitorErrorCode001_002
     * @tc.number AddMonitorErrorCode001_002
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AddMonitorErrorCode001_002', Level.LEVEL1, async (done: Function) => {
      console.info('[AddMonitorErrorCode001_002] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn02: Component = await driver.findComponent(ON.id('btn02'));
      await CommonFunc.sleep(1000);
      await btn02.click();
      await CommonFunc.sleep(1000);
      let num2 = await (await driver.findComponent(ON.id('num2'))).getText();
      console.info("[AddMonitorErrorCode001_002] component num2: " + num2);
      expect(num2).assertEqual("1");
      let btn03: Component = await driver.findComponent(ON.id('btn03'));
      await CommonFunc.sleep(1000);
      await btn03.click();
      await CommonFunc.sleep(1000);
      let num3 = await (await driver.findComponent(ON.id('num3'))).getText();
      console.info("[AddMonitorErrorCode001_002] component num3: " + num3);
      expect(num3).assertEqual("1");
      await CommonFunc.sleep(1000);
      let btn04: Component = await driver.findComponent(ON.id('btn04'));
      await CommonFunc.sleep(1000);
      await btn04.click();
      await CommonFunc.sleep(1000);
      let num4 = await (await driver.findComponent(ON.id('num4'))).getText();
      console.info("[AddMonitorErrorCode001_002] component num4: " + num3);
      expect(num4).assertEqual("1");
      await CommonFunc.sleep(1000);
      console.info('[AddMonitorErrorCode001_002] END');
      done();
    });

  })
}