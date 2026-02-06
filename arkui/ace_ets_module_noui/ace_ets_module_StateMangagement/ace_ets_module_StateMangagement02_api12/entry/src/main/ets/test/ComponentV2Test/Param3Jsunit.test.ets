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
export default function Param3Jsunit() {
  describe('Param3Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("Param3Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ComponentV2/Param3",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Param3Jsunit state pages:" + JSON.stringify(pages));
        if (!("Param3" == pages.name)) {
          console.info("get Param3Jsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Param3Jsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Param3Jsunit page error:" + err);
      }
      console.info("Param3Jsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Param3Jsunit after each called");
    });

    /**
     * @tc.number    Param3Jsunit_001
     * @tc.name      Param3Jsunit_001
     * @tc.desc      The @ Param variable passed from the parent component to the child component
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('Param3Jsunit_001', Level.LEVEL0, async (done: Function) => {
      console.info('[Param3Jsunit_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("object_change"));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('object_1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[Param3Jsunit_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[Param3Jsunit_001] content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('rawObject');

      let strJson2 = getInspectorByKey('object_2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[Param3Jsunit_001] component obj2 is: " + JSON.stringify(obj2));
      console.info("[Param3Jsunit_001] content: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual('new observedObject name');
      console.info('[Param3Jsunit_001] END');
      done();
    });
  })
}
