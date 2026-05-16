/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function LazyForEachReusableMemOptStrategyTest() {
  describe('LazyForEachReusableMemOptStrategyTest', () => {
    beforeEach(async (done: Function) => {
      console.info("LazyForEachReusableMemOptStrategyTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LazyForEach/LazyForEachReusableMemOptStrategy",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LazyForEachReusableMemOptStrategy state pages: " + JSON.stringify(pages));
        if (!("LazyForEachReusableMemOptStrategy" == pages.name)) {
          console.info("get LazyForEachReusableMemOptStrategy state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LazyForEachReusableMemOptStrategy success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LazyForEachReusableMemOptStrategy page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   LazyForEachReusableMemOptStrategyTest_0100
     * @tc.number SUB_ARKUI_API_LazyForEachReusableMemOptStrategyTest_0100
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('LazyForEachReusableMemOptStrategyTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[LazyForEachReusableMemOptStrategyTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id('changeLazyForEachScroller_30'));
      await button1.click();
      await CommonFunc.sleep(2000);

      expect(ReusableMemOptStrategy.DEFAULT).assertEqual(0);
      expect(ReusableMemOptStrategy.ENABLE_AUTO_CACHE_OPTIMIZATION).assertEqual(1);

      expect(LazyForEachMemOptStrategy.DEFAULT).assertEqual(0);
      expect(LazyForEachMemOptStrategy.ENABLE_AUTO_CACHE_OPTIMIZATION).assertEqual(1);
      
      console.info('[LazyForEachReusableMemOptStrategyTest_0100] END');
      done();
    });
  })
}

