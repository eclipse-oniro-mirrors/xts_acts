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
export default function ProvideConsume0360TestJsunit() {
  describe('ProvideConsume0360TestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("ProvideConsume0360TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/provide_consume/ProvideConsume0360",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ProvideConsume0360TestJsunit state pages:" + JSON.stringify(pages));
        if (!("ProvideConsume0360" == pages.name)) {
          console.info("get ProvideConsume0360TestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ProvideConsume0360TestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ProvideConsume0360TestJsunit page error:" + err);
      }
      console.info("ProvideConsume0360TestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ProvideConsume0360TestJsunit after each called");
    });

    /**
     * @tc.number    ProvideConsume0360TestJsunit_001
     * @tc.name      ProvideConsume0360TestJsunit_001
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('ProvideConsume0360TestJsunit_001', Level.LEVEL0, async (done: Function) => {
      console.info('[ProvideConsume0360TestJsunit_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btnProvideConsume0360Change"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('btnProvideConsume0360Change'))
      console.info("[ProvideConsume0360TestJsunit_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.height=='8.00vp').assertTrue();
      console.info('[ProvideConsume0360TestJsunit_001] END');
      done();
    });
  })
}
