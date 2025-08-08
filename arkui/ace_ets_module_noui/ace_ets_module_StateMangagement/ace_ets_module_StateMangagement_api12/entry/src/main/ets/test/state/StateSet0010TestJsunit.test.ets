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
export default function StateSet0010TestJsunit() {
  describe('StateSet0010TestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("StateSet0010TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/state/StateSet0010",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StateSet0010TestJsunit state pages:" + JSON.stringify(pages));
        if (!("StateSet0010" == pages.name)) {
          console.info("get StateSet0010TestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StateSet0010TestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StateSet0010TestJsunit page error:" + err);
      }
      console.info("StateSet0010TestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("StateSet0010TestJsunit after each called");
    });

    /**
     * @tc.number    StateSet0010TestJsunit
     * @tc.name      StateSet0010TestJsunit
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('StateSet0010TestJsunit', Level.LEVEL0, async (done: Function) => {
      console.info('[StateSet0010TestJsunit] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btnStateSet0010Set"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tvStateSet0010Title');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[StateSet0010TestJsunit] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('HelloWorld,ARKUI');
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id("btnStateSet0010Delete"));
      await CommonFunc.sleep(1000);
      await btn1.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('tvStateSet0010Title');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[StateSet0010TestJsunit] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('HelloWorld');
      await CommonFunc.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id("btnStateSet0010Clear"));
      await CommonFunc.sleep(1000);
      await btn2.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('tvStateSet0010Title');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[StateSet0010TestJsunit] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('Hello');
      console.info('[StateSet0010TestJsunit] END');
      done();
    });
  })
}
