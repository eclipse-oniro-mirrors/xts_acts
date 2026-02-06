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
import { UiComponent, Driver, Component, UiWindow, ON, UIElementInfo } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function RepeatTest0010() {
  describe('RepeatTest0010', () => {
    beforeEach(async (done: Function) => {
      console.info("RepeatTest0010 setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Repeat/Repeat0010",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("Repeat0010" == pages.name)) {
          console.info("get RepeatTest0010 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RepeatTest0010 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RepeatTest0010 page error:" + err);
      }
      console.info("RepeatTest0010 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RepeatTest0010 after each called");
    });

    /**
     * @tc.number RepeatTest0010_001
     * @tc.name RepeatTest0010_001
     * @tc.desc Frequently updating and modifying the values of parent components
     * @tc.level Level 3
     * @tc.type
     * @tc.size
     */
    it('RepeatTest0010_001', Level.LEVEL3, async (done: Function) => {
      console.info('[RepeatTest0010_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('toIndex[2]'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let text_1 = await (await driver.findComponent(ON.id('repeat0010_1'))).getText();
      let text_2 = await (await driver.findComponent(ON.id('repeat0010_2'))).getText();
      let display_status = await (await driver.findComponent(ON.id('display_status'))).getText();
      console.info("[RepeatTest0010_001] component text_1: " + text_1 + "text2:" + text_2 + "display_status: " +
        display_status);
      expect(text_1).assertEqual('img1');
      expect(text_2).assertEqual('img3');
      expect(display_status).assertEqual('Normal display');
      await CommonFunc.sleep(1000);
      console.info('[RepeatTest0010_001] END');
      done();
    });

  })
}
