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


export default function RepeatListNumber() {
  describe('RepeatListNumber', () => {
    beforeEach(async (done: Function) => {
      console.info("RepeatListNumber beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Repeat/RepeatListNumber",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RepeatListNumber state pages:" + JSON.stringify(pages));
        if (!("RepeatListNumber" == pages.name)) {
          console.info("get RepeatListNumber pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RepeatListNumber page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RepeatListNumber page error:" + err);
      }
      console.info("RepeatListNumber beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RepeatListNumber after each called");
    });

    /**
     * @tc.name   RepeatListNumber_001
     * @tc.number RepeatListNumber_001
     * @tc.desc   Test RepeatListNumber component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RepeatListNumber_001', Level.LEVEL0, async (done: Function) => {
      console.info('[RepeatListNumber_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();

      let strJson = getInspectorByKey('Text1_LN2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RepeatListNumber_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('non vs 2 index:2:0');
      console.info('[RepeatListNumber_001] END');

      let strJson1 = getInspectorByKey('Text2_LN2');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[RepeatListNumber_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('has vs 2 index:2:0');
      console.info('[RepeatListNumber_001] END');


      let btn: Component = await driver.findComponent(ON.id('Button1_LN'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson2 = getInspectorByKey('Text1_LN16');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[RepeatListNumber_001] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('non vs 16 index:16:0');
      console.info('[RepeatListNumber_001] END');

      let btn1: Component = await driver.findComponent(ON.id('Button2_LN'));
      await btn1.click();
      await CommonFunc.sleep(1000);

      let strJson3 = getInspectorByKey('Text1_LN16');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[RepeatListNumber_001] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.content).assertEqual('non vs 16 index:16:100');
      console.info('[RepeatListNumber_001] END');
      done();
    });
  })
}
