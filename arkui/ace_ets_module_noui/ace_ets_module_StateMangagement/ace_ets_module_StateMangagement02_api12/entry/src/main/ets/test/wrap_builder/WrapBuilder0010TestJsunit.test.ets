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

export default function WrapBuilder0010TestJsunit() {
  describe('WrapBuilder0010TestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("WrapBuilder0010TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/wrap_builder/WrapBuilder0010",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WrapBuilder0010TestJsunit state pages:" + JSON.stringify(pages));
        if (!("WrapBuilder0010" == pages.name)) {
          console.info("get WrapBuilder0010TestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push WrapBuilder0010TestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WrapBuilder0010TestJsunit page error:" + err);
      }
      console.info("WrapBuilder0010TestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("WrapBuilder0010TestJsunit after each called");
    });

    /**
     * @tc.name   WrapBuilder0010TestJsunit_001
     * @tc.number WrapBuilder0010TestJsunit_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WrapBuilder0010TestJsunit_001', Level.LEVEL0, async (done: Function) => {
      console.info('[WrapBuilder0010TestJsunit_001] START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('tvGlobalWrapBuilder0010');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[WrapBuilder0010TestJsunit_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('HelloWorld');
      console.info('[WrapBuilder0010TestJsunit_001] END');
      done();
    });
  })
}
