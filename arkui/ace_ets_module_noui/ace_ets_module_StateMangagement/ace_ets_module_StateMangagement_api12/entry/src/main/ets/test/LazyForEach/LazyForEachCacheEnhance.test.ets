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
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function LazyForEachCacheEnhance() {
  describe('LazyForEachCacheEnhance', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LazyForEach/LazyForEachCacheEnhance',
      }
      try {
        router.clear();
        await CommonFunc.sleep(100);
        let pages = router.getState();
        console.info("get LazyForEachCacheEnhance state success " + JSON.stringify(pages));
        if (!("LazyForEachCacheEnhance" == pages.name)) {
          console.info("get LazyForEachCacheEnhance state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push LazyForEachCacheEnhance page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LazyForEachCacheEnhance page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(100);
    });

    afterEach(async () => {
      await CommonFunc.sleep(500);
      console.info("LazyForEachCacheEnhance after each called");
    });

    /**
     * @tc.number LazyForEachCacheEnhance_001
     * @tc.name LazyForEachCacheEnhance_001
     * @tc.desc Test LazyForEachCacheEnhance
     */
    it('LazyForEachCacheEnhance_001', Level.LEVEL1, async (done: Function) => {
      console.info('[LazyForEachCacheEnhance_001] START');      
      await CommonFunc.sleep(100);
      let driver: Driver = Driver.create();
      let scroll_1200_btn = await driver.findComponent(ON.id('scroll_1200'))
      for(let i = 0; i<50; i++){
        await scroll_1200_btn.click();
      }
      let count_text = await driver.findComponent(ON.id('reuse_count'));
      expect(parseInt(await count_text.getText())).assertLargerOrEqual(900);
      console.info('[LazyForEachCacheEnhance_001] END');
      done();
    });
  })
}