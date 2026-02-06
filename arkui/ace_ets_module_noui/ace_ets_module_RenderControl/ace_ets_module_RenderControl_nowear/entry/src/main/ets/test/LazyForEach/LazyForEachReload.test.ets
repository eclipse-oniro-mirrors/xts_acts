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

export default function LazyForEachReload() {
  describe('LazyForEachReload', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LazyForEach/LazyForEachReload',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get LazyForEachReload state success " + JSON.stringify(pages));
        if (!("LazyForEachReload" == pages.name)) {
          console.info("get LazyForEachReload state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push LazyForEachReload page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LazyForEachReload page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LazyForEachReload after each called");
    });

    /**
     * @tc.name   LazyForEachReload_001
     * @tc.number LazyForEachReload_001
     * @tc.desc   Test LazyForEachReload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LazyForEachReload_001', Level.LEVEL0, async (done: Function) => {
      console.info('[LazyForEachReload_001] START');      
      await CommonFunc.sleep(500);

      let driver: Driver = Driver.create();

      let reload_btn: Component = await driver.findComponent(ON.id('reload'));
      await reload_btn.click();
      await CommonFunc.sleep(500);
      let count_text = await driver.findComponent(ON.id('text_disappear_count'));
      expect(await count_text.getText()).assertEqual('12');
      console.info('[LazyForEachReload_001] END');
      done();
    });
  })
}
  