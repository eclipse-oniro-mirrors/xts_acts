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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../../MainAbility/common/Common';
export default function BlurStyleActivePolicy_ALWAYS_INACTIVE_APITest() {
  describe('BlurStyleActivePolicy_ALWAYS_INACTIVE_APITest', () => {
    beforeEach(async (done: Function) => {
      console.info("BlurStyleActivePolicy_ALWAYS_INACTIVE_APITest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Common/BackgroundEffect/BackgroundEffectOptions/BlurStyleActivePolicy_ALWAYS_INACTIVE",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get BlurStyleActivePolicy_ALWAYS_INACTIVE_APITest state pages: " + JSON.stringify(pages));
        if (!("ListMainChildren" == pages.name)) {
          console.info("get BlurStyleActivePolicy_ALWAYS_INACTIVE_APITest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push BlurStyleActivePolicy_ALWAYS_INACTIVE_APITest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push BlurStyleActivePolicy_ALWAYS_INACTIVE_APITest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    Policy
     * @tc.name      BlurStyleActivePolicy_ALWAYS_INACTIVE_APITest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('BlurStyleActivePolicy_ALWAYS_INACTIVE_APITest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('BlurStyleActivePolicy_ALWAYS_INACTIVE_APITest_0100 START');
      await CommonFunc.sleep(1000);
      let ALWAYS_INACTIVE = getInspectorByKey('ALWAYS_INACTIVE');
      console.info("[BlurStyleActivePolicy_ALWAYS_INACTIVE_APITest_0100] ALWAYS_INACTIVE attrs is: " + JSON.stringify(JSON.parse(ALWAYS_INACTIVE).$attrs));
      expect(JSON.parse(ALWAYS_INACTIVE).$attrs.backgroundEffect.options.policy).assertEqual('BlurStyleActivePolicy.ALWAYS_INACTIVE');
      console.info('[BlurStyleActivePolicy_ALWAYS_INACTIVE_APITest_0100] END');
      done();
    });
  })
}