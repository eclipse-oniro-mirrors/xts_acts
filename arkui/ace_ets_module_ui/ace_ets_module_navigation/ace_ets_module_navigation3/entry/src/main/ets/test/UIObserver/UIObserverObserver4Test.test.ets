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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function UIObserverObserver4Test() {
  describe('UIObserverObserver4Test', () => {
    beforeEach(async (done: Function) => {
      console.info("UIObserverObserver4Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIObserver/UIObserverObserver4Page',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get UIObserverObserver4Test state pages:" + JSON.stringify(pages));
        if (!("UIObserverObserver4Page" == pages.name)) {
          console.info("get UIObserverObserver4Test pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push UIObserverObserver4Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIObserverObserver4Test page error:" + err);
      }
      console.info("UIObserverObserver4Test beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   UIObserverObserver4Test_0100
     * @tc.number UIObserverObserver4Test_0100
     * @tc.desc   testNavigation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UIObserverObserver4Test_0100', Level.LEVEL2, async (done: Function) => {
      console.info('UIObserverObserver4Test_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id("UIObserverObserver4_btn_push"));
      await button.click();
      await CommonFunc.sleep(1000);

      await driver.pressBack();
      await CommonFunc.sleep(1000);

      button = await driver.findComponent(ON.id("UIObserverObserver4_btn_off"));
      await button.click();
      await CommonFunc.sleep(1000);

      button = await driver.findComponent(ON.id("UIObserverObserver4_btn_push"));
      await button.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('UIObserverObserver4Page_callBackFuncOnCount')).assertEqual(2);
      AppStorage.delete('UIObserverObserver4Page_callBackFuncOnCount')

      console.info('UIObserverObserver4Test_0100 END');
      done();
    });
  })
}