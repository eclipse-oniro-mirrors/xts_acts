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
export default function RepeatReusableMemOptStrategyTest() {
  describe('RepeatReusableMemOptStrategyTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RepeatReusableMemOptStrategyTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Repeat/RepeatReusableMemOptStrategy",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RepeatReusableMemOptStrategy state pages: " + JSON.stringify(pages));
        if (!("RepeatReusableMemOptStrategy" == pages.name)) {
          console.info("get RepeatReusableMemOptStrategy state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RepeatReusableMemOptStrategy success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RepeatReusableMemOptStrategy page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   RepeatReusableMemOptStrategyTest_0100
     * @tc.number SUB_ARKUI_API_RepeatReusableMemOptStrategyTest_0100
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RepeatReusableMemOptStrategyTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[RepeatReusableMemOptStrategyTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id('changeScroller_30'));
      await button1.click();
      await CommonFunc.sleep(2000);

      expect(RepeatMemOptStrategy.DEFAULT).assertEqual(0);
      expect(RepeatMemOptStrategy.ENABLE_AUTO_CACHE_OPTIMIZATION).assertEqual(1);

      expect(ReusableMemOptStrategy.DEFAULT).assertEqual(0);
      expect(ReusableMemOptStrategy.ENABLE_AUTO_CACHE_OPTIMIZATION).assertEqual(1);
      
      console.info('[RepeatReusableMemOptStrategyTest_0100] END');
      done();
    });
  })
}

