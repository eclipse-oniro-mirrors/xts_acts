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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
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

export default function LazyForEachSingleNumber() {
  describe('LazyForEachSingleNumber', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LazyForEach/LazyForEachSingleNumber',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get LazyForEachSingleNumber state success " + JSON.stringify(pages));
        if (!("LazyForEachSingleNumber" == pages.name)) {
          console.info("get LazyForEachSingleNumber state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push LazyForEachSingleNumber page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LazyForEachSingleNumber page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LazyForEachSingleNumber after each called");
    });

    /**
     * @tc.number LazyForEachSingleNumber_001
     * @tc.name LazyForEachSingleNumber
     * @tc.desc Test LazyForEachSingleNumber
     */
    it('LazyForEachSingleNumber_001', Level.LEVEL0, async (done: Function) => {
      console.info('[LazyForEachSingleNumber_001] START');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('lazyForeach_singleN0');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LazyForEachSingleNumber_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('11111111');
      console.info('[LazyForEachSingleNumber_001] END');
      done();
    });
  })
}
  