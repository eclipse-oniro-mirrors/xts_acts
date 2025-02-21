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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/utils/Common';

export default function NO_ANIMATION_APITest() {
  describe('NO_ANIMATION_APITest', () => {
    beforeEach(async (done: Function) => {
      console.info("NO_ANIMATION_APITest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/AnimationMode_API/NO_ANIMATION",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NO_ANIMATION_APITest state pages: " + JSON.stringify(pages));
        if (!("ListMainChildren" == pages.name)) {
          console.info("get NO_ANIMATION_APITest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push NO_ANIMATION_APITest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NO_ANIMATION_APITest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number NO_ANIMATION
     * @tc.name NO_ANIMATION_APITest_0100
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('NO_ANIMATION_APITest_0100', 0, async (done: Function) => {
      console.info('NO_ANIMATION_APITest_0100 START');
      await CommonFunc.sleep(1000);
      let NO_ANIMATION = getInspectorByKey('NO_ANIMATION');
      console.info("[NO_ANIMATION_APITest_0100] Tabs animationMode attrs is: " +
      JSON.stringify(JSON.parse(NO_ANIMATION).$attrs));
      expect(JSON.parse(NO_ANIMATION).$attrs.animationMode).assertEqual('AnimationMode.NO_ANIMATION');
      console.info('[NO_ANIMATION_APITest_0100] END');
      done();
    });
  })
}