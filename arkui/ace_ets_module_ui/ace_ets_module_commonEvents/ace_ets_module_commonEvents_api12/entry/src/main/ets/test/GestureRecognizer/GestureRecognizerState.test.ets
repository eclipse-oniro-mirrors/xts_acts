/*
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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function GestureRecognizerState() {
  describe('GestureRecognizerState', () => {
    beforeEach(async (done: Function) => {
      console.info("GestureRecognizerState beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureRecognizer/GestureRecognizerState',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GestureRecognizerState state pages:" + JSON.stringify(pages));
        if (!("GestureRecognizerState" == pages.name)) {
          console.info("get GestureRecognizerState pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GestureRecognizerState page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GestureRecognizerState page error:" + err);
      }
      console.info("GestureRecognizerState beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("GestureRecognizerState after each called");
    });


    /**
     * @tc.number    GestureRecognizerState_0100
     * @tc.name      GestureRecognizerState_0100
     * @tc.desc      Test GestureRecognizerState
     * @tc.level     Level 2
     */
    it('GestureRecognizerState_0100', Level.LEVEL0, async (done: Function) => {
      console.info('GestureRecognizerState_0100 START');
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('GestureRecognizerState_text');
      let obj1: ESObject = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[GestureRecognizerState_0100] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('GestureRecognizerState');

      console.info('GestureRecognizerState_0100 END');
      done();
    });



  })
}