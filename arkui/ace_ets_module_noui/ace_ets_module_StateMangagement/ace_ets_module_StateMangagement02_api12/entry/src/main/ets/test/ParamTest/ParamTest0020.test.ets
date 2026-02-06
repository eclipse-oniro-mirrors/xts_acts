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
import {UiComponent, Driver, Component, UiWindow, ON, UIElementInfo} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ParamTest0020() {
  describe('ParamTest0020', () => {
    beforeEach(async (done: Function) => {
      console.info("ParamTest0020 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Param/Param0020",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("Param0020" == pages.name)) {
          console.info("get ParamTest0020 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ParamTest0020 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ParamTest0020 page error:" + err);
      }
      console.info("ParamTest0020 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ParamTest0020 after each called");
    });

    /**
     * @tc.number    SUB_ACE_TS_STATUSMANAGER_PARAM_0020
     * @tc.name      ParamTest0020_001
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('ParamTest0020_001', Level.LEVEL0, async (done: Function) => {
      console.info('[ParamTest0020_001] START');
      await CommonFunc.sleep(2000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvChildParam00201'));
      console.info("[ParamTest0020_001] component obj content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Tom');
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(getInspectorByKey('tvChildParam00202'));
      console.info("[ParamTest0020_001] component obj1 content is: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('10');
      await CommonFunc.sleep(1000);
      let obj2: ESObject = JSON.parse(getInspectorByKey('tvChildParam00203'));
      console.info("[ParamTest0020_001] component obj2 content is: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual('Tom');
      await CommonFunc.sleep(1000);
      let obj3: ESObject = JSON.parse(getInspectorByKey('tvChildParam00204'));
      console.info("[ParamTest0020_001] component obj3 content is: " + JSON.stringify(obj3.$attrs.content));
      expect(obj3.$attrs.content).assertEqual('true');
      await CommonFunc.sleep(1000);
      let obj4: ESObject = JSON.parse(getInspectorByKey('tvChildParam00205'));
      console.info("[ParamTest0020_001] component obj4 content is: " + JSON.stringify(obj4.$attrs.content));
      expect(obj4.$attrs.content).assertEqual('Tom');
      console.info('[ParamTest0020_001] END');
      await CommonFunc.sleep(1000);
      done();
    });
  })
}
