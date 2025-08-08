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
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
export default function Monitor1Jsunit() {
  describe('Monitor1Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("Monitor1Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ComponentV2/Monitor1",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Monitor1Jsunit state pages:" + JSON.stringify(pages));
        if (!("Monitor1" == pages.name)) {
          console.info("get Monitor1Jsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Monitor1Jsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Monitor1Jsunit page error:" + err);
      }
      console.info("Monitor1Jsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Monitor1Jsunit after each called");
    });

    /**
     * @tc.number    Monitor1Jsunit_001
     * @tc.name      Monitor1Jsunit_001
     * @tc.desc      Not decorated by decorator and decorated by @ Local
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('Monitor1Jsunit_001', Level.LEVEL0, async (done: Function) => {
      console.info('[Monitor1Jsunit_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("change_monitor_text"));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('null_mes');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[Monitor1Jsunit_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[Monitor1Jsunit_001] content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('Hello World');

      let strJson2 = getInspectorByKey('local_name');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[Monitor1Jsunit_001] component obj2 is: " + JSON.stringify(obj2));
      console.info("[Monitor1Jsunit_001] content: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual('Jack');
      console.info('[Monitor1Jsunit_001] END');
      done();
    });
  })
}
