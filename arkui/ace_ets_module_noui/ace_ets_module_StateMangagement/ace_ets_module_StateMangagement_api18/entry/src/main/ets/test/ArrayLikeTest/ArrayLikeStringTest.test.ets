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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect ,Level} from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent,  Component, UiWindow,Driver, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager,Callback } from '../../MainAbility/common/MessageManager';
export default function ArrayLikeStringTest() {
  describe('ArrayLikeStringTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ArrayLikeStringTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ArrayLike/ArrayLikeString",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("ArrayLikeString" == pages.name)) {
          console.info("get ArrayLikeStringTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ArrayLikeStringTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ArrayLikeStringTest page error:" + err);
      }
      console.info("ArrayLikeStringTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ArrayLikeStringTest after each called");
    });
    /**
     * @tc.number    ArrayLikeStringTest_001
     * @tc.name      ArrayLikeStringTest_001
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('ArrayLikeStringTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('[ArrayLikeStringTest_001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('TextString');
      let obj: ESObject = JSON.parse(strJson);
      let text1 = await driver.findComponent(ON.text('n2'))
      console.info("[ArrayLikeStringTest_001] component obj is: " + JSON.stringify(obj));
      expect(text1 != null).assertTrue()
      console.info('[ArrayLikeStringTest_001] END');
      done();
    });
  })
}