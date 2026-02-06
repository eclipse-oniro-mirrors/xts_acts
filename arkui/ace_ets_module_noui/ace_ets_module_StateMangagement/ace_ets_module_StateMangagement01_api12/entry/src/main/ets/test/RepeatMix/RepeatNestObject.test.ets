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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
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

export default function RepeatNestObject() {
  describe('RepeatNestObject', () => {
    beforeEach(async (done: Function) => {
      console.info("RepeatNestObject beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RepeatMix/RepeatNestObject",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RepeatNestObject state pages:" + JSON.stringify(pages));
        if (!("RepeatNestObject" == pages.name)) {
          console.info("get RepeatNestObject pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RepeatNestObject page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RepeatNestObject page error:" + err);
      }
      console.info("RepeatNestObject beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RepeatNestObject after each called");
    });

    /**
     * @tc.number RepeatNestObject_001
     * @tc.name RepeatNestObject_001
     * @tc.desc Test RepeatNestObject component
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('RepeatNestObject_001', Level.LEVEL0, async (done: Function) => {
      console.info('[RepeatNestObject_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();

      let strJson = getInspectorByKey('repeat1_one_0');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RepeatNestObject_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('outerList Item: 0');
      console.info('[RepeatNestObject_001] END');

      let strJson1 = getInspectorByKey('repeat2_two_0');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[RepeatNestObject_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('innerList Item:0');
      console.info('[RepeatNestObject_001] END');

      let btn: Component = await driver.findComponent(ON.id('Button1'));
      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson2 = getInspectorByKey('repeat1_one_1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[RepeatNestObject_001] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('outerList Item: 1');
      console.info('[RepeatNestObject_001] END');

      let strJson3 = getInspectorByKey('repeat2_two_1');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[RepeatNestObject_001] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.content).assertEqual('innerList Item:97');
      console.info('[RepeatNestObject_001] END');
      done();
    });
  })
}
