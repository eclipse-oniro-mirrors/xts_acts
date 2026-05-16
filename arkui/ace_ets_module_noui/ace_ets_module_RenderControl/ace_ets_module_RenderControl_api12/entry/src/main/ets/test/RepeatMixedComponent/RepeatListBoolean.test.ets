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


export default function RepeatListBoolean() {
  describe('RepeatListBoolean', () => {
    beforeEach(async (done: Function) => {
      console.info("RepeatListBoolean beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RepeatMixedComponent/RepeatListBoolean",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RepeatListBoolean state pages:" + JSON.stringify(pages));
        if (!("RepeatListBoolean" == pages.name)) {
          console.info("get RepeatListBoolean pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RepeatListBoolean page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RepeatListBoolean page error:" + err);
      }
      console.info("RepeatListBoolean beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RepeatListBoolean after each called");
    });

    /**
     * @tc.name   RepeatListBoolean_001
     * @tc.number RepeatListBoolean_001
     * @tc.desc   Test RepeatListBoolean component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RepeatListBoolean_001', Level.LEVEL0, async (done: Function) => {
      console.info('[RepeatListBoolean_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();

      let strJson = getInspectorByKey('Text1_LB2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RepeatListBoolean_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('non vs true index:2:0');
      console.info('[RepeatListBoolean_001] END');

      let strJson1 = getInspectorByKey('Text2_LB2');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[RepeatListBoolean_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('has vs true index:2:0');
      console.info('[RepeatListBoolean_001] END');

      let btn: Component = await driver.findComponent(ON.id('Button1_LB'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson2 = getInspectorByKey('Text1_LB16');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[RepeatListBoolean_001] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('non vs true index:16:0');
      console.info('[RepeatListBoolean_001] END');

      let btn1: Component = await driver.findComponent(ON.id('Button2_LB'));
      await btn1.click();
      await CommonFunc.sleep(1000);

      let strJson3 = getInspectorByKey('Text1_LB16');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[RepeatListBoolean_001] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.content).assertEqual('non vs true index:16:100');
      console.info('[RepeatListBoolean_001] END');
      done();
    });
  })
}
