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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function waterFlow4Jsunit() {
  describe('waterFlow4Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("waterFlow4Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/waterFlow4",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get waterFlow4Jsunit state pages:" + JSON.stringify(pages));
        if (!("waterFlow4" == pages.name)) {
          console.info("get waterFlow4Jsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push waterFlow4Jsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push waterFlow4Jsunit page error:" + err);
      }
      console.info("waterFlow4Jsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("waterFlow4Jsunit after each called");
    });

    /**
     * @tc.name   waterFlow4Jsunit_001
     * @tc.number waterFlow4Jsunit_001
     * @tc.desc   Add and delete data to waterFlow component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('waterFlow4Jsunit_001', Level.LEVEL2, async (done: Function) => {
      console.info('[waterFlow4Jsunit_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1: Component = await driver.findComponent(ON.id("flow_delete_4"));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('flow_length_4');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[waterFlow4Jsunit_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[waterFlow4Jsunit_001] content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('length: 99');

      let btn2: Component = await driver.findComponent(ON.id("flow_add_4"));
      await btn2.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('flow_length_4');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[waterFlow4Jsunit_001] component obj2 is: " + JSON.stringify(obj2));
      console.info("[waterFlow4Jsunit_001] content: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual('length: 100');
      console.info('[waterFlow4Jsunit_001] END');
      done();
    });
  })
}
