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

export default function Monitor_NullTest() {
  describe('Monitor_Null', () => {
    beforeEach(async (done: Function) => {
      console.info("Monitor_Null setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Monitor/Monitor_Null",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("Monitor_Null" == pages.name)) {
          console.info("get Monitor_Null pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Monitor_Null page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Monitor_Null page error:" + err);
      }
      console.info("Monitor_Null beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Monitor_Null after each called");
    });

    /**
     * @tc.name   Monitor_Null_001
     * @tc.number Monitor_Null_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Monitor_Null_001', Level.LEVEL0, async (done: Function) => {
      console.info('[Monitor_Null_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text_1 = await (await driver.findComponent(ON.id('Monitor_Null_001'))).getText();
      console.info("[Monitor_Null_001] component text_1: " + text_1);
      await CommonFunc.sleep(1000);
      expect(text_1).assertEqual('null')
      await CommonFunc.sleep(1000);
      console.info('[Monitor_Null_001] END');
      done();
    });

  })
}
