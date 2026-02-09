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

export default function ProvideConsume0020TestJsunit() {
  describe('ProvideConsume0020TestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("ProvideConsume0020TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Provide/ProvideConsume0020",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ProvideConsume0020TestJsunit state pages:" + JSON.stringify(pages));
        if (!("ProvideConsume0020" == pages.name)) {
          console.info("get ProvideConsume0020TestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ProvideConsume0020TestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ProvideConsume0020TestJsunit page error:" + err);
      }
      console.info("ProvideConsume0020TestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ProvideConsume0020TestJsunit after each called");
    });

    /**
     * @tc.name   ProvideConsume0020TestJsunit_001
     * @tc.number ProvideConsume0020TestJsunit_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ProvideConsume0020TestJsunit_001', Level.LEVEL0, async (done: Function) => {
      console.info('[ProvideConsume0020TestJsunit_001] START');
      await CommonFunc.sleep(2000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvClass'))
      console.info("[ProvideConsume0020TestJsunit_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('0');
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(getInspectorByKey('tvNumber'))
      console.info("[ProvideConsume0020TestJsunit_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('0');
      await CommonFunc.sleep(1000);
      let obj2: ESObject = JSON.parse(getInspectorByKey('tvBoolean'))
      console.info("[ProvideConsume0020TestJsunit_001] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('false');
      await CommonFunc.sleep(1000);
      let obj3: ESObject = JSON.parse(getInspectorByKey('tvString'))
      console.info("[ProvideConsume0020TestJsunit_001] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.content).assertEqual('hello');
      await CommonFunc.sleep(1000);
      let obj4: ESObject = JSON.parse(getInspectorByKey('tvObject'))
      console.info("[ProvideConsume0020TestJsunit_001] component obj4 is: " + JSON.stringify(obj4));
      expect(obj4.$attrs.content).assertEqual('hello');
      await CommonFunc.sleep(1000);
      let obj5: ESObject = JSON.parse(getInspectorByKey('tvArr'))
      console.info("[ProvideConsume0020TestJsunit_001] component obj5 is: " + JSON.stringify(obj5));
      expect(obj5.$attrs.content).assertEqual('1');
      await CommonFunc.sleep(1000);
      let obj6: ESObject = JSON.parse(getInspectorByKey('tvEnum'))
      console.info("[ProvideConsume0020TestJsunit_001] component obj6 is: " + JSON.stringify(obj6));
      expect(obj6.$attrs.content).assertEqual('PA');
      console.info('[ProvideConsume0020TestJsunit_001] END');
      done();
    });
  })
}
