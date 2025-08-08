/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

export default function UIContextOnIdle() {
    describe('UIContextOnIdle', () => {
      beforeEach(async (done: Function) => {
        console.info("UIContextOnIdle beforeEach start");
        let options: router.RouterOptions = {
          url: 'MainAbility/pages/OnIdle/onIdleTest',
        }
        try {
          router.clear();
          let pages = router.getState();
          console.info("get UIContextOnIdle state success " + JSON.stringify(pages));
          if (!("onIdleTest" == pages.name)) {
            console.info("get UIContextOnIdle state success " + JSON.stringify(pages.name));
            let result = await router.pushUrl(options);
            await CommonFunc.sleep(2000);
            console.info("push UIContextOnIdle page success " + JSON.stringify(result));
          }
        } catch (err) {
          console.error("push UIContextOnIdle page error: " + err);
        }
        done()
      });

    /**
     * @tc.number UIContextApi1_0100
     * @tc.name UIContextApi1_0100
     * @tc.desc test onIdle
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */

    it('onIdleTest_0100', 0, async (done: Function) => {
      console.info('UIContextApi1_0100 START');
      await CommonFunc.sleep(1000);

      let driver: Driver = Driver.create()
      let btn: Component = await driver.findComponent(ON.id("OnIdle"))
      await CommonFunc.sleep(1000);
      await btn.click()
      await CommonFunc.sleep(1000);
      await btn.click()
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey("OnIdleText"))
      console.info("UIContextApi1_0100 component obj is: " + JSON.stringify(obj))
      expect(obj.$attrs.content).assertEqual("OnIdle")
      done()
    });
  })
}
