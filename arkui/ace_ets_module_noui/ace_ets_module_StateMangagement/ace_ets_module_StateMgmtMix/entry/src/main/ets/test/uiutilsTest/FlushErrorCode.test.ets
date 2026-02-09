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

export default function FlushErrorCode() {
  describe('FlushErrorCode', () => {
    beforeEach(async (done: Function) => {
      console.info("FlushErrorCode setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/uiutils/FlushErrorCode",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("FlushErrorCode" == pages.name)) {
          console.info("get FlushErrorCode pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FlushErrorCode page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlushErrorCode page error:" + err);
      }
      console.info("FlushErrorCode beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FlushErrorCode after each called");
    });

    /**
     * @tc.name   FlushErrorCode_001
     * @tc.number FlushErrorCode_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FlushErrorCode_001', Level.LEVEL1, async (done: Function) => {
      console.info('[FlushErrorCode_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('FlushErrorCode_006'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let text_1 = await (await driver.findComponent(ON.id('FlushErrorCode_001'))).getText();
      let text_2 = await (await driver.findComponent(ON.id('FlushErrorCode_002'))).getText();
      let text_3 = await (await driver.findComponent(ON.id('FlushErrorCode_003'))).getText();
      let text_4 = await (await driver.findComponent(ON.id('FlushErrorCode_004'))).getText();
      let text_5 = await (await driver.findComponent(ON.id('FlushErrorCode_005'))).getText();
      console.info("[FlushErrorCode_001] component text_1: " + text_1);
      console.info("[FlushErrorCode_001] component text_2: " + text_2);
      console.info("[FlushErrorCode_001] component text_3: " + text_3);
      console.info("[FlushErrorCode_001] component text_4: " + text_4);
      console.info("[FlushErrorCode_001] component text_5: " + text_5);
      await CommonFunc.sleep(1000);
      expect(text_1).assertEqual('1');
      expect(text_2).assertEqual('1');
      expect(text_3).assertEqual('1');
      expect(text_4).assertEqual('1');
      expect(text_5).assertEqual('1');
      await CommonFunc.sleep(1000);
      console.info('[FlushErrorCode_001] END');
      done();
    });

  })
}
