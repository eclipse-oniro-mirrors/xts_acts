/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export default function LazyForEachAboutToReuseUndefined() {
  describe('LazyForEachAboutToReuseUndefined', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LazyForEach/LazyForEachAboutToReuseUndefined',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get LazyForEachAboutToReuseUndefined state success " + JSON.stringify(pages));
        if (!("LazyForEachAboutToReuseUndefined" == pages.name)) {
          console.info("get LazyForEachAboutToReuseUndefined state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options)
          console.info("push LazyForEachAboutToReuseUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LazyForEachAboutToReuseUndefined page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LazyForEachAboutToReuseUndefined after each called");
    });

    /**
     * @tc.name   LazyForEachAboutToReuseUndefined_001
     * @tc.number LazyForEachAboutToReuseUndefined_001
     * @tc.desc   Test LazyForEachAboutToReuseUndefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LazyForEachAboutToReuseUndefined_001', Level.LEVEL1, async (done: Function) => {
      console.info('[LazyForEachAboutToReuseUndefined_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let operate_btn = await driver.findComponent(ON.id('LazyForEachAboutToReuseUndefined_operateData'))
      await operate_btn.click();
      console.info('[LazyForEachAboutToReuseUndefined_001] click LazyForEachAboutToReuseUndefined_operateData 1');
      await CommonFunc.sleep(1000);
      await operate_btn.click();
      console.info('[LazyForEachAboutToReuseUndefined_001] click LazyForEachAboutToReuseUndefined_operateData 2');
      await CommonFunc.sleep(1000);
      let info = await driver.findComponent(ON.id('Hello 1'));
      expect(await info.getText()).assertEqual('Hello 1');
      console.info('[LazyForEachAboutToReuseUndefined_001] END');
      done();
    });
  })
}
  