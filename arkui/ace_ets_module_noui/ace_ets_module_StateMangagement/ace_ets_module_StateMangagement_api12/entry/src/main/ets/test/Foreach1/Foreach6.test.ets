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
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function Foreach6() {
  describe('Foreach6', () => {
    beforeEach(async (done: Function) => {
      console.info("Foreach6 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Foreach1/Foreach6",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Foreach6 state pages:" + JSON.stringify(pages));
        if (!("Foreach6" == pages.name)) {
          console.info("get Foreach6 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Foreach6 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Foreach6 page error:" + err);
      }
      console.info("Foreach6 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Foreach6 after each called");
    });

    /**
     * @tc.number foreach6_001
     * @tc.name foreach6_001
     * @tc.desc Display data in foreach component.
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('foreach6_001', 0, async (done: Function) => {
      console.info('[foreach6_001] START');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('foreach2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[foreach6_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('tmp is even number:2');
      console.info('[foreach6_001] END');
      done();
    });

    /**
     * @tc.number foreach6_002
     * @tc.name foreach6_002
     * @tc.desc Display data in foreach component.
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('foreach6_002', 0, async (done: Function) => {
      console.info('[foreach6_002] START');
      await CommonFunc.sleep(1000);

      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('init_for_each'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id('for_each_1'));
      await btn1.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('foreach2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[foreach6_002] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('tmp is odd number:2');
      console.info('[foreach6_002] END');
      done();
    });
  })
}
