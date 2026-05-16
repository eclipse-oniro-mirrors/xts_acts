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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, 
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function LinkTest0090() {
  describe('LinkTest0090', () => {
    beforeEach(async (done: Function) => {
      console.info("LinkTest0090 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Link/Link0090",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("Link0090" == pages.name)) {
          console.info("get LinkTest0090 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LinkTest0090 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LinkTest0090 page error:" + err);
      }
      console.info("LinkTest0090 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LinkTest0090 after each called");
    });

    /**
     * @tc.name   LinkTest0090_001
     * @tc.number LinkTest0090_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LinkTest0090_001', Level.LEVEL1, async (done: Function) => {
      console.info('[LinkTest0090_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btnLink0090Change"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[1]
        .$children[0]
        .$children[0];
      console.info("[LinkTest0090_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('100');
      console.info('[LinkTest0090_001] END');
      done();
    });
  })
}
