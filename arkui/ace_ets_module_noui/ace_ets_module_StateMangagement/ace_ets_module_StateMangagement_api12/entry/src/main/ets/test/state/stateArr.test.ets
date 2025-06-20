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
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function stateArr() {
  describe('stateArr', () => {

    beforeEach(async (done: Function) => {
      console.info("stateArr beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/state/stateArr",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stateArr state pages:" + JSON.stringify(pages));
        if (!("stateArr" == pages.name)) {
          console.info("get stateArr pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push stateArr page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stateArr page error:" + err);
      }
      console.info("stateArr beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("stateArr after each called");
    });

    /**
     * @tc.number StateArr0010TestJsunit_001
     * @tc.name StateArr0010TestJsunit_001
     * @tc.desc Test state array
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('StateArr0010TestJsunit_001', Level.LEVEL0, async (done: Function) => {
      console.info('[StateArr0010TestJsunit_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btnStateArr0010Set"));
      await CommonFunc.sleep(1000);
      console.info('[StateArr0010TestJsunit_001] START1');
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tvStateArr0010Title');
      console.info('[StateArr0010TestJsunit_001] START2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[StateArr0010TestJsunit_001] component obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('Hello[0,false,{"param":47}]');
      await CommonFunc.sleep(1000);
      console.info('[StateArr0010TestJsunit_001] START3');
      let btn1: Component = await driver.findComponent(ON.id("btnStateArr0010Delete"));
      await CommonFunc.sleep(1000);
      await btn1.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('tvStateArr0010Title');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[StateMap0010TestJsunit_001] component obj1 is: " + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('Hello[0,false]');
      await CommonFunc.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id("btnStateArr0010Clear"));
      await CommonFunc.sleep(1000);
      await btn2.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('tvStateArr0010Title');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[StateMap0010TestJsunit_001] component obj2 is: " + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('Hello[]');
      console.info('[StateArr0010TestJsunit_001] END');
      done();
    });
  })
}