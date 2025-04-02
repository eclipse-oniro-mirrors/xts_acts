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
export default function Link0100TestJsunit() {
  describe('Link0100TestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("Link0100TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/link/Link0100",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Link0100TestJsunit state pages:" + JSON.stringify(pages));
        if (!("Link0100" == pages.name)) {
          console.info("get Link0100TestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Link0100TestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Link0100TestJsunit page error:" + err);
      }
      console.info("Link0100TestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Link0100TestJsunit after each called");
    });

    /**
     * @tc.number    Link0100TestJsunit_001
     * @tc.name      Link0100TestJsunit_001
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('Link0100TestJsunit_001', 0, async (done: Function) => {
      console.info('[Link0100TestJsunit_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btnLink0100Add"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvLink0100Parent'))
      console.info("[Link0100TestJsunit_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('1');
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(getInspectorByKey('tvLink0100Child'))
      console.info("[Link0100TestJsunit_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('1');
      console.info('[Link0100TestJsunit_001] END');
      done();
    });
  })
}
