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


export default function LazyForEachVisibleAreaChange() {
  describe('LazyForEachVisibleAreaChange', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LazyForEach/LazyForEachVisibleAreaChange',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get LazyForEachVisibleAreaChange state success " + JSON.stringify(pages));
        if (!("LazyForEachVisibleAreaChange" == pages.name)) {
          console.info("get LazyForEachVisibleAreaChange state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push LazyForEachVisibleAreaChange page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LazyForEachVisibleAreaChange page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LazyForEachVisibleAreaChange after each called");
    });

    /**
     * @tc.name   LazyForEachVisibleAreaChange_001
     * @tc.number LazyForEachVisibleAreaChange_001
     * @tc.desc   Test LazyForEachVisibleAreaChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LazyForEachVisibleAreaChange_001', Level.LEVEL0, async (done: Function) => {
      console.info('[LazyForEachVisibleAreaChange_001] START');      
      await CommonFunc.sleep(500);
      let driver: Driver = Driver.create();
      let scroll_to_800_btn = await driver.findComponent(ON.id('scroll_to_800'))
      let scroll_to_1800_btn = await driver.findComponent(ON.id('scroll_to_1800'));
      await scroll_to_800_btn.click();
      await scroll_to_1800_btn.click();
      await CommonFunc.sleep(500);
      let count_text = await driver.findComponent(ON.id('text_visible_area_change_count'));
      expect(await count_text.getText()).assertEqual('2');
      console.info('[LazyForEachVisibleAreaChange_001] END');
      done();
    });
  })
}