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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager,Callback } from '../../MainAbility/common/MessageManager';
export default function ReuseV2Test0030() {
  describe('ReuseV2Test0030', () => {
    beforeEach(async (done: Function) => {
      console.info("ReuseV2Test0030 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ReuseV2/ReuseV20030",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("ReuseV20030" == pages.name)) {
          console.info("get ReuseV2Test0030 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ReuseV2Test0030 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ReuseV2Test0030 page error:" + err);
      }
      console.info("ReuseV2Test0030 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ReuseV2Test0030 after each called");
    });

    /**
     * @tc.number    ReuseV2Test0030
     * @tc.name      ReuseV2Test0030_001
     * @tc.desc      Persistently store UI related data
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('ReuseV2Test0030_001', 0, async (done: Function) => {
      console.info('[ReuseV2Test0030_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      for (let index = 0; index < 2; index++) {
        let btn: Component = await driver.findComponent(ON.id("btnReuseV20030Change"));
        await btn.click();
        await CommonFunc.sleep(1000);
      }
      let obj1: ESObject = JSON.parse(getInspectorByKey('tvChildReuseV20030'));
      console.info("[ReuseV2Test0030_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ReuseV2Test0030_001] obj1 content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('aboutToReuse');
      console.info('[ReuseV2Test0030_001] END');
      done();
    });
  })
}
