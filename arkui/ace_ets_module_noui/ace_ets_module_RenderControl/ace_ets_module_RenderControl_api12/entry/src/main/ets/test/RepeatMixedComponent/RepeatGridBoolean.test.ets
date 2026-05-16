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


export default function RepeatGridBoolean() {
  describe('RepeatGridBoolean', () => {
    beforeEach(async (done: Function) => {
      console.info("RepeatGridBoolean beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RepeatMixedComponent/RepeatGridBoolean",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RepeatGridBoolean state pages:" + JSON.stringify(pages));
        if (!("RepeatGridBoolean" == pages.name)) {
          console.info("get RepeatGridBoolean pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RepeatGridBoolean page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RepeatGridBoolean page error:" + err);
      }
      console.info("RepeatGridBoolean beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RepeatGridBoolean after each called");
    });

    /**
     * @tc.name   RepeatGridBoolean_001
     * @tc.number RepeatGridBoolean_001
     * @tc.desc   Test RepeatGridBoolean component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RepeatGridBoolean_001', Level.LEVEL0, async (done: Function) => {
      console.info('[RepeatGridBoolean_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();

      let strJson = getInspectorByKey('Text1_GB2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RepeatGridBoolean_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('true index:2:0');
      console.info('[RepeatGridBoolean_001] END');
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('Text2_GB2');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[RepeatGridBoolean_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('true index:2:0');
      console.info('[RepeatGridBoolean_001] END');
      await CommonFunc.sleep(1000);

      let btn: Component = await driver.findComponent(ON.id('Button1_GB'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson2 = getInspectorByKey('Text1_GB9');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[RepeatGridBoolean_001] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('false index:9:0');
      console.info('[RepeatGridBoolean_001] END');
      await CommonFunc.sleep(1000);

      let btn1: Component = await driver.findComponent(ON.id('Button2_GB'));
      await btn1.click();
      await CommonFunc.sleep(1000);

      let strJson3 = getInspectorByKey('Text1_GB9');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[RepeatGridBoolean_001] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.content).assertEqual('false index:9:100');
      console.info('[RepeatGridBoolean_001] END');
      done();
    });
  })
}
