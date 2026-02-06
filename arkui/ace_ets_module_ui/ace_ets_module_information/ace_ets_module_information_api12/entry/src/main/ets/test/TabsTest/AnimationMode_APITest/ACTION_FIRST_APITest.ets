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
import CommonFunc from '../../../MainAbility/common/Common';

export default function ACTION_FIRST_APITest() {
  describe('ACTION_FIRST_APITest', () => {
    beforeEach(async (done: Function) => {
      console.info("ACTION_FIRST_APITest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/AnimationMode_API/ACTION_FIRST",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ACTION_FIRST_APITest state pages: " + JSON.stringify(pages));
        if (!("ListMainChildren" == pages.name)) {
          console.info("get ACTION_FIRST_APITest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ACTION_FIRST_APITest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ACTION_FIRST_APITest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number ACTION_FIRST
     * @tc.name ACTION_FIRST_APITest_0100
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ACTION_FIRST_APITest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('ACTION_FIRST_APITest_0100 START');
      await CommonFunc.sleep(1000);
      let ACTION_FIRST = getInspectorByKey('ACTION_FIRST');
      console.info("[ACTION_FIRST_APITest_0100] Tabs animationMode attrs is: " +
      JSON.stringify(JSON.parse(ACTION_FIRST).$attrs));
      expect(JSON.parse(ACTION_FIRST).$attrs.animationMode).assertEqual('AnimationMode.ACTION_FIRST');
      console.info('[ACTION_FIRST_APITest_0100] END');
      done();
    });
  })
}