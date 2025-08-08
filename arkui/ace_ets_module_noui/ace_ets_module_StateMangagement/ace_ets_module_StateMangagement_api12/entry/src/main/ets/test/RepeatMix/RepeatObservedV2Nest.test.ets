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

export default function RepeatObservedV2Nest() {
  describe('RepeatObservedV2Nest', () => {
    beforeEach(async (done: Function) => {
      console.info("RepeatObservedV2Nest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RepeatMix/RepeatObservedV2Nest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RepeatObservedV2Nest state pages:" + JSON.stringify(pages));
        if (!("RepeatObservedV2Nest" == pages.name)) {
          console.info("get RepeatObservedV2Nest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RepeatObservedV2Nest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RepeatObservedV2Nest page error:" + err);
      }
      console.info("RepeatObservedV2Nest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RepeatObservedV2Nest after each called");
    });

    /**
     * @tc.number RepeatObservedV2Nest_001
     * @tc.name RepeatObservedV2Nest_001
     * @tc.desc Test RepeatObservedV2Nest component
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('RepeatObservedV2Nest_001', 0, async (done: Function) => {
      console.info('[RepeatObservedV2Nest_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1: Component = await driver.findComponent(ON.id('button2'));
      let strJson = getInspectorByKey('repeat1_V2N0');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RepeatObservedV2Nest_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('innerObject0');
      console.info('[RepeatObservedV2Nest_001] END');

      let strJson1 = getInspectorByKey('repeat1_V2N2');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[RepeatObservedV2Nest_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('innerObject2');
      console.info('[RepeatObservedV2Nest_001] END');

      await btn1.click();
      await CommonFunc.sleep(1000);

      let strJson3 = getInspectorByKey('repeat1_V2N2');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[RepeatObservedV2Nest_001] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.content).assertEqual('100');
      console.info('[RepeatObservedV2Nest_001] END');
      done();
    });
  })
}
