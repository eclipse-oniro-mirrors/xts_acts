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


export default function LazyForEachSingleString() {
  describe('LazyForEachSingleString', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LazyForEach/LazyForEachSingleString',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get LazyForEachSingleString state success " + JSON.stringify(pages));
        if (!("LazyForEachSingleString" == pages.name)) {
          console.info("get LazyForEachSingleString state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push LazyForEachSingleString page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LazyForEachSingleString page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LazyForEachSingleString after each called");
    });

    /**
     * @tc.name   LazyForEachSingleString_001
     * @tc.number LazyForEachSingleString_001
     * @tc.desc   Test LazyForEachSingleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LazyForEachSingleString_001', Level.LEVEL0, async (done: Function) => {
      console.info('[LazyForEachSingleString_001] START');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('lazyForeach_singleS0');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LazyForEachSingleString_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Math Science Chinese English');
      console.info('[LazyForEachSingleString_001] END');
      done();
    });
  })
}
  