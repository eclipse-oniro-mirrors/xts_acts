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

export default function Param1Jsunit() {
  describe('Param1Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("Param1Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ComponentV2/Param1",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Param1Jsunit state pages:" + JSON.stringify(pages));
        if (!("Param1" == pages.name)) {
          console.info("get Param1Jsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Param1Jsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Param1Jsunit page error:" + err);
      }
      console.info("Param1Jsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Param1Jsunit after each called");
    });

    /**
     * @tc.name   Param1Jsunit_001
     * @tc.number Param1Jsunit_001
     * @tc.desc   @Param has no local initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Param1Jsunit_001', Level.LEVEL0, async (done: Function) => {
      console.info('[Param1Jsunit_001] START');
      let strJson1 = getInspectorByKey('param_local');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[Param1Jsunit_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[Param1Jsunit_001] content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('Local 0');

      let strJson2 = getInspectorByKey('param_count');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[Param1Jsunit_001] component obj2 is: " + JSON.stringify(obj2));
      console.info("[Param1Jsunit_001] content: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual('Param 0');
      console.info('[Param1Jsunit_001] END');
      done();
    });

    /**
     * @tc.name   Param1Jsunit_002
     * @tc.number Param1Jsunit_002
     * @tc.desc   @Param has no local initial value, click to modify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Param1Jsunit_002', Level.LEVEL0, async (done: Function) => {
      console.info('[Param1Jsunit_002] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("param_null"));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('param_local');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[Param1Jsunit_002] component obj1 is: " + JSON.stringify(obj1));
      console.info("[Param1Jsunit_002] content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('Local 1');

      let strJson2 = getInspectorByKey('param_count');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[Param1Jsunit_002] component obj2 is: " + JSON.stringify(obj2));
      console.info("[Param1Jsunit_002] content: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual('Param 1');
      console.info('[Param1Jsunit_002] END');
      done();
    });
  })
}
