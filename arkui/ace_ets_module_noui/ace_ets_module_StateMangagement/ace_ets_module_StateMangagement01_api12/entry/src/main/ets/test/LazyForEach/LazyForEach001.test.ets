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

export default function LazyForEach001() {
  describe('LazyForEach001', () => {
    beforeEach(async (done: Function) => {
      console.info("LazyForEach001 setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LazyForEach/LazyForEach001",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("LazyForEach001" == pages.name)) {
          console.info("get LazyForEach001 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LazyForEach001 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LazyForEach001 page error:" + err);
      }
      console.info("LazyForEach001 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LazyForEach001 after each called");
    });

    /**
     * @tc.number    LazyForEach001_001
     * @tc.name      LazyForEach001_001
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('LazyForEach001_001', Level.LEVEL3, async (done: Function) => {
      console.info('[LazyForEach001_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('changeDate'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let text_1 = await (await driver.findComponent(ON.id('maxId'))).getText();
      console.info("[LazyForEach001_001] component text_1: " + text_1);
      let btn2: Component = await driver.findComponent(ON.id('sliding'));
      await CommonFunc.sleep(1000);
      await btn2.click();
      await CommonFunc.sleep(1000);
      let text_2 = await (await driver.findComponent(ON.id('maxId'))).getText();
      console.info("[LazyForEach001_001] component text_2: " + text_2);
      expect(Number(text_2)).assertEqual(Number(text_1));
      await CommonFunc.sleep(1000);
      console.info('[LazyForEach001_001] END');
      done();
    });
  })
}