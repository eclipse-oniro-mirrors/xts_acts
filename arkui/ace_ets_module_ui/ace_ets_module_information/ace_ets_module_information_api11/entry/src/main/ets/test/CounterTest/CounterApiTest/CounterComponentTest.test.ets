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
import CommonFunc from "../../../MainAbility/common/Common";
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.information/MainAbility';

export default function CounterComponentTest() {
  describe('CounterComponentTest', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("CounterComponentTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Counter/CounterApi/CounterApi",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CounterComponentTest state pages:" + JSON.stringify(pages));
        if (!("CounterApi" == pages.name)) {
          console.info("get CounterComponentTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push CounterComponentTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CounterComponentTest page error:" + err);
      }
      console.info("CounterComponentTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("CounterComponentTest after each called");
    });

    /**
     * @tc.number    CounterComponentTest_001
     * @tc.name      testBack
     * @tc.desc      Return specified page by index value
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('CounterComponentTest_001', 0, async (done: Function) => {
      console.info('[CounterComponentTest_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btn"));
      await btn.click();
      await CommonFunc.sleep(1000);
      let type = getInspectorByKey('type');
      await CommonFunc.sleep(1000);
      expect(JSON.parse(type).$attrs.content).assertEqual('INLINE_DATE');
      console.info('[CounterComponentTest_001] END');
      done();
    });
  })
}
