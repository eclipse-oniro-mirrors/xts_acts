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
export default function waterFlowScroll() {
  describe('waterFlowScroll', () => {
    beforeEach(async (done: Function) => {
      console.info("waterFlowScroll beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/waterFlowCallback/waterFlowScroll",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get waterFlowScroll state pages:" + JSON.stringify(pages));
        if (!("waterFlowScroll" == pages.name)) {
          console.info("get waterFlowScroll pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push waterFlowScroll page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push waterFlowScroll page error:" + err);
      }
      console.info("waterFlowScroll beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("waterFlowScroll after each called");
    });

    /**
     * @tc.name   waterFlowScroll_001
     * @tc.number waterFlowScroll_001
     * @tc.desc   Describe the default layout mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('waterFlowScroll_001', Level.LEVEL2, async (done: Function) => {
      console.info('[waterFlowScroll_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('flow_scrollBy'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('scrollBy_yOffset');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[waterFlowScroll_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('yOffset: 200');
      console.info('[waterFlowScroll_001] END');
      done();
    });
  })
}
