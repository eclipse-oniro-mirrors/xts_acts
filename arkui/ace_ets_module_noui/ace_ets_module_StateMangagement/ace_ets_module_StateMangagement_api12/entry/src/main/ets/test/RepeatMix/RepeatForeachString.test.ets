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

export default function RepeatForeachString() {
  describe('RepeatForeachString', () => {
    beforeEach(async (done: Function) => {
      console.info("RepeatForeachString beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RepeatMix/RepeatForeachString",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RepeatForeachString state pages:" + JSON.stringify(pages));
        if (!("RepeatForeachString" == pages.name)) {
          console.info("get RepeatForeachString pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RepeatForeachString page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RepeatForeachString page error:" + err);
      }
      console.info("RepeatForeachString beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RepeatForeachString after each called");
    });

    /**
     * @tc.number RepeatForeachString_001
     * @tc.name RepeatForeachString_001
     * @tc.desc Test RepeatForeachString component
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('RepeatForeachString_001', Level.LEVEL0, async (done: Function) => {
      console.info('[RepeatForeachString_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();

      let strJson = getInspectorByKey('repeat1_S5');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RepeatForeachString_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('string5');
      console.info('[RepeatForeachString_001] END');

      let strJson1 = getInspectorByKey('foreach1_S5');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[RepeatForeachString_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual(' MyString1');
      console.info('[RepeatForeachString_001] END');

      let btn1: Component = await driver.findComponent(ON.id('changeBtn'));
      await btn1.click();
      await CommonFunc.sleep(1000);

      let strJson2 = getInspectorByKey('repeat1_S5');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[RepeatForeachString._001] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('999');
      console.info('[RepeatForeachString._001] END');

      let strJson3 = getInspectorByKey('foreach1_S5');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[RepeatForeachString._001] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.content).assertEqual(' newString');
      console.info('[RepeatForeachString._001] END');
      done();
    });
  })
}
