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
export default function Observed0060TestJsunit() {
  describe('Observed0060TestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("Observed0060TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/observed_object/Observed0060",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Observed0060TestJsunit state pages:" + JSON.stringify(pages));
        if (!("Observed0060" == pages.name)) {
          console.info("get Observed0060TestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Observed0060TestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Observed0060TestJsunit page error:" + err);
      }
      console.info("Observed0060TestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Observed0060TestJsunit after each called");
    });

    /**
     * @tc.number    Observed0060TestJsunit_001
     * @tc.name      Observed0060TestJsunit_001
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('Observed0060TestJsunit_001', Level.LEVEL0, async (done: Function) => {
      console.info('[Observed0060TestJsunit_001] START');
      await CommonFunc.sleep(2000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvObserved0060ID'))
      console.info("[Observed0060TestJsunit] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('0');
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(getInspectorByKey('tvObserved0060String'))
      console.info("[Observed0060TestJsunit] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('Tom');
      await CommonFunc.sleep(1000);
      let obj2: ESObject = JSON.parse(getInspectorByKey('tvObserved0060Boolean'))
      console.info("[Observed0060TestJsunit] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('false');
      await CommonFunc.sleep(1000);
      let obj3: ESObject = JSON.parse(getInspectorByKey('tvObserved0060Class'))
      console.info("[Observed0060TestJsunit] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.content).assertEqual('Hello');
      await CommonFunc.sleep(1000);
      let obj4: ESObject = JSON.parse(getInspectorByKey('tvObserved0060Obj'))
      console.info("[Observed0060TestJsunit] component obj4 is: " + JSON.stringify(obj4));
      expect(obj4.$attrs.content).assertEqual('0');
      await CommonFunc.sleep(1000);
      let obj5: ESObject = JSON.parse(getInspectorByKey('tvObserved0060Enum'))
      console.info("[Observed0060TestJsunit] component obj5 is: " + JSON.stringify(obj5));
      expect(obj5.$attrs.content).assertEqual('A');
      await CommonFunc.sleep(1000);
      let obj6: ESObject = JSON.parse(getInspectorByKey('tvObserved0060Array'))
      console.info("[Observed0060TestJsunit] component obj6 is: " + JSON.stringify(obj6));
      expect(obj6.$attrs.content).assertEqual('a');
      let obj7: ESObject = JSON.parse(getInspectorByKey('tvObserved0060Map'))
      console.info("[Observed0060TestJsunit] component obj7 is: " + JSON.stringify(obj7));
      expect(obj7.$attrs.content).assertEqual('value');
      let obj8: ESObject = JSON.parse(getInspectorByKey('tvObserved0060Set'))
      console.info("[Observed0060TestJsunit] component obj8 is: " + JSON.stringify(obj8));
      expect(obj8.$attrs.content).assertEqual('0');
      let obj9: ESObject = JSON.parse(getInspectorByKey('tvObserved0060Date'))
      console.info("[Observed0060TestJsunit] component obj9 is: " + JSON.stringify(obj9));
      expect(obj9.$attrs.content).assertEqual('Tue Jan 02 2024 03:00:00 GMT+0800');
      let obj10: ESObject = JSON.parse(getInspectorByKey('tvObserved0060Null'))
      console.info("[Observed0060TestJsunit] component obj10 is: " + JSON.stringify(obj10));
      expect(obj10.$attrs.content).assertEqual('null');
      console.info('[Observed0060TestJsunit] END');
      done();
    });
  })
}
