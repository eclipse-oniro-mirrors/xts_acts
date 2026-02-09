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

export default function LifeCycle0050TestJsunit() {
  describe('LifeCycle0050TestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("LifeCycle0050TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/lifecycle/LifeCycle0050",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LifeCycle0050TestJsunit state pages:" + JSON.stringify(pages));
        if (!("LifeCycle0050" == pages.name)) {
          console.info("get LifeCycle0050TestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LifeCycle0050TestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LifeCycle0050TestJsunit page error:" + err);
      }
      console.info("LifeCycle0050TestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LifeCycle0050TestJsunit after each called");
    });

    /**
     * @tc.name   LifeCycle0050TestJsunit_001
     * @tc.number LifeCycle0050TestJsunit_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LifeCycle0050TestJsunit_001', Level.LEVEL0, async (done: Function) => {
      console.info('[LifeCycle0050TestJsunit_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btnLifeCycle0050Change"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tvLifeCycle0050Parent');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LifeCycle0050TestJsunit_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('ParentDidBuild');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('tvLifeCycle0050Sub');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[LifeCycle0050TestJsunit_001] component obj is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('SubDidBuild');
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('tvLifeCycle0050Son');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[LifeCycle0050TestJsunit_001] component obj is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('SonDidBuild');
      console.info('[LifeCycle0050TestJsunit_001] END');
      done();
    });
  })
}
