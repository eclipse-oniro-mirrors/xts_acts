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
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function LazyForEachMove() {
  describe('LazyForEachMove', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LazyForEach/LazyForEachMove',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get LazyForEachMove state success " + JSON.stringify(pages));
        if (!("LazyForEachMove" == pages.name)) {
          console.info("get LazyForEachMove state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push LazyForEachMove page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LazyForEachMove page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LazyForEachMove after each called");
    });

    /**
     * @tc.number LazyForEachMove_001
     * @tc.name LazyForEachMove
     * @tc.desc Test LazyForEachMove
     */
    it('LazyForEachMove_001', 0, async (done: Function) => {
      console.info('[LazyForEachMove_001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      
      let btn: Component = await driver.findComponent(ON.id('moveButton'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('repeat_move10');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LazyForEachMove_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Item10');
      console.info('[LazyForEachMove_001] END');

      let strJson1 = getInspectorByKey('lazyForeach_move10');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[LazyForEachMove_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('01move_0_1move');
      console.info('[LazyForEachMove_001] END');
      done();
    });
  })
}
  