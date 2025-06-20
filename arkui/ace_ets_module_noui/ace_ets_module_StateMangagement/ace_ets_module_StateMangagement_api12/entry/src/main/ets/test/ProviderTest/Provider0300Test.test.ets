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
export default function Provider0300Test() {
  describe('Provider0300Test', () => {
    beforeEach(async (done: Function) => {
      console.info("Provider0300Test setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Provider/Provider0300",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Provider0300Test state pages:" + JSON.stringify(pages));
        if (!("Provider0300" == pages.name)) {
          console.info("get Provider0300Test pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Provider0300Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Provider0300Test page error:" + err);
      }
      console.info("Provider0300Test beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Provider0300Test after each called");
    });

    /**
     * @tc.number    Provider0300Test_001
     * @tc.name      Provider0300Test_001
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('Provider0300Test_001', 0, async (done: Function) => {
      console.info('[Provider0300Test_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btnProvider0300ChangeMsg"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvChildProvider0300Class'))
      console.info("[Provider0300Test_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('10');
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(getInspectorByKey('tvChildProvider0300Number'))
      console.info("[Provider0300Test_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('10');
      await CommonFunc.sleep(1000);
      let obj2: ESObject = JSON.parse(getInspectorByKey('tvChildProvider0300Boolean'))
      console.info("[Provider0300Test_001] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('true');
      await CommonFunc.sleep(1000);
      let obj3: ESObject = JSON.parse(getInspectorByKey('tvChildProvider0300String'))
      console.info("[Provider0300Test_001] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.content).assertEqual('helloworld');
      await CommonFunc.sleep(1000);
      let obj4: ESObject = JSON.parse(getInspectorByKey('tvChildProvider0300Object'))
      console.info("[Provider0300Test_001] component obj4 is: " + JSON.stringify(obj4));
      expect(obj4.$attrs.content).assertEqual('helloworld');
      await CommonFunc.sleep(1000);
      let obj5: ESObject = JSON.parse(getInspectorByKey('tvChildProvider0300Arr'))
      console.info("[Provider0300Test_001] component obj5 is: " + JSON.stringify(obj5));
      expect(obj5.$attrs.content).assertEqual('10');
      await CommonFunc.sleep(1000);
      let obj6: ESObject = JSON.parse(getInspectorByKey('tvChildProvider0300Date'))
      console.info("[Provider0300Test_001] component obj6 is: " + JSON.stringify(obj6));
      expect(obj6.$attrs.content).assertEqual('08:08:09 GMT+0800');
      await CommonFunc.sleep(1000);
      let obj7: ESObject = JSON.parse(getInspectorByKey('tvChildProvider0300Map'))
      console.info("[Provider0300Test_001] component obj7 is: " + JSON.stringify(obj7));
      expect(obj7.$attrs.content).assertEqual('100');
      await CommonFunc.sleep(1000);
      let obj8: ESObject = JSON.parse(getInspectorByKey('tvChildProvider0300Set'))
      console.info("[Provider0300Test_001] component obj8 is: " + JSON.stringify(obj8));
      expect(obj8.$attrs.content).assertEqual('0,1,2');
      await CommonFunc.sleep(1000);
      let obj9: ESObject = JSON.parse(getInspectorByKey('tvChildProvider0300Enum'))
      console.info("[Provider0300Test_001] component obj9 is: " + JSON.stringify(obj9));
      expect(obj9.$attrs.content).assertEqual('PB');
      console.info('[Provider0300Test_001] END');
      done();
    });
  })
}
