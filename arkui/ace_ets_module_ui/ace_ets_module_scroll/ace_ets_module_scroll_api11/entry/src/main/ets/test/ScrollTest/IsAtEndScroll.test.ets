/**
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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function IsAtEndScroll() {
  describe('IsAtEndScroll', () => {
    beforeEach(async (done: Function) => {
      console.info("IsAtEndScroll beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/IsAtEndScroll",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get IsAtEndScroll state pages:" + JSON.stringify(pages));
        if (!("IsAtEndScroll" == pages.name)) {
          console.info("get IsAtEndScroll pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push IsAtEndScroll page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push IsAtEndScroll page error:" + err);
      }
      console.info("IsAtEndScroll beforeEach end");
      done();
    });

    /**
     * @tc.number    IsAtEndScroll_001
     * @tc.name      IsAtEndScroll_0100
     * @tc.desc      False,The component hasn't scrolled to the bottom yet.
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('IsAtEndScroll_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[IsAtEndScroll_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('isAtEnd_get'));
      await btn.click();
      console.info("[IsAtEndScroll_0100] Click isAtEnd_get false.");
      await CommonFunc.sleep(1500);
      console.info("[IsAtEndScroll_0100] isAtEnd: " + AppStorage.get('isAtEnd'));
      expect(AppStorage.get('isAtEnd')).assertEqual(false);
      AppStorage.delete('isAtEnd')
      done();
    });

    /**
     * @tc.number    IsAtEndScroll_002
     * @tc.name      IsAtEndScroll_0200
     * @tc.desc      True,The component has scrolled to the bottom.
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('IsAtEndScroll_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[IsAtEndScroll_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_scroll: Component = await driver.findComponent(ON.id('isAtEnd_scroll'));
      await btn_scroll.click();
      await CommonFunc.sleep(1500);
      let btn: Component = await driver.findComponent(ON.id('isAtEnd_get'));
      await btn.click();
      console.info("[IsAtEndScroll_0200] Click isAtEnd_get true.");
      await CommonFunc.sleep(1500);
      console.info("[IsAtEndScroll_0200] isAtEnd: " + AppStorage.get('isAtEnd'));
      expect(AppStorage.get('isAtEnd')).assertEqual(true);
      AppStorage.delete('isAtEnd')
      done();
    });
  })
}