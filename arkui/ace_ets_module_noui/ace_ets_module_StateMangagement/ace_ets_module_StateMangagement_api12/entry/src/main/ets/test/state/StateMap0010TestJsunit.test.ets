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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
export default function StateMap0010TestJsunit() {
  describe('StateMap0010TestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("StateMap0010TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/state/StateMap0010",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StateMap0010TestJsunit state pages:" + JSON.stringify(pages));
        if (!("StateMap0010" == pages.name)) {
          console.info("get StateMap0010TestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StateMap0010TestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StateMap0010TestJsunit page error:" + err);
      }
      console.info("StateMap0010TestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("StateMap0010TestJsunit after each called");
    });

    /**
     * @tc.number    StateMap0010TestJsunit_001
     * @tc.name      StateMap0010TestJsunit_001
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('StateMap0010TestJsunit_001', 0, async (done: Function) => {
      console.info('[StateMap0010TestJsunit_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btnStateMap0010Set"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tvStateMap0010Title');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[StateMap0010TestJsunit_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('HelloWorld,ARKUI');
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id("btnStateMap0010Delete"));
      await CommonFunc.sleep(1000);
      await btn1.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('tvStateMap0010Title');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[StateMap0010TestJsunit_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('HelloWorld');
      await CommonFunc.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id("btnStateMap0010Clear"));
      await CommonFunc.sleep(1000);
      await btn2.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('tvStateMap0010Title');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[StateMap0010TestJsunit_001] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('Hello');
      console.info('[StateMap0010TestJsunit_001] END');
      done();
    });
  })
}
