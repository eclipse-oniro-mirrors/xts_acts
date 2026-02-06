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
import CommonFunc from '../../MainAbility/utils/Common';

export default function waterFlow2Jsunit() {
  describe('waterFlow2Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("waterFlow2Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/waterFlow2",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get waterFlow2Jsunit state pages:" + JSON.stringify(pages));
        if (!("waterFlow2" == pages.name)) {
          console.info("get waterFlow2Jsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push waterFlow2Jsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push waterFlow2Jsunit page error:" + err);
      }
      console.info("waterFlow2Jsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("waterFlow2Jsunit after each called");
    });

    /**
     * @tc.name   waterFlow2Jsunit_001
     * @tc.number waterFlow2Jsunit_001
     * @tc.desc   The WaterFlow component supports events
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('waterFlow2Jsunit_001', Level.LEVEL1, async (done: Function) => {
      console.info('[waterFlow2Jsunit_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1: Component = await driver.findComponent(ON.id("flow_layoutdir_2"));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id("flow_padding"));
      await btn2.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('water_padding');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[waterFlow2Jsunit_001] component obj is: " + JSON.stringify(obj));
      console.info("[waterFlow2Jsunit_001] layoutDirection: " + JSON.stringify(obj.$attrs.layoutDirection));
      console.info("[waterFlow2Jsunit_001] padding: " + JSON.stringify(obj.$attrs.padding));
      expect(obj.$attrs.padding).assertEqual('10.00vp');
      console.info('[waterFlow2Jsunit_001] END');
      done();
    });
  })
}
