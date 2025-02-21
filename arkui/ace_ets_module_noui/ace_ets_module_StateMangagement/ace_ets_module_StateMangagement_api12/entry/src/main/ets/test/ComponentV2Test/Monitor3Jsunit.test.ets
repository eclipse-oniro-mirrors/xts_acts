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
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
export default function Monitor3Jsunit() {
  describe('Monitor3Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("Monitor3Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ComponentV2/Monitor3",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Monitor3Jsunit state pages:" + JSON.stringify(pages));
        if (!("Monitor3" == pages.name)) {
          console.info("get Monitor3Jsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Monitor3Jsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Monitor3Jsunit page error:" + err);
      }
      console.info("Monitor3Jsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Monitor3Jsunit after each called");
    });

    /**
     * @tc.number    Monitor3Jsunit_001
     * @tc.name      Monitor3Jsunit_001
     * @tc.desc      Modified by @ Param, can be listened to
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('Monitor3Jsunit_001', 0, async (done: Function) => {
      console.info('[Monitor3Jsunit_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("param_btn"));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('param_mes');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Monitor3Jsunit_001] component obj is: " + JSON.stringify(obj));
      console.info("[Monitor3Jsunit_001] content: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('param: message change to Jack');
      console.info('[Monitor3Jsunit_001] END');
      done();
    });
  })
}
