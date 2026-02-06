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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON, MouseButton } from '@ohos.UiTest';
let driver: Driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function webViewControllerPart2() {
  describe('WebOnNativeEmbedMouseEventTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebOnNativeEmbedMouseEvent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOnNativeEmbedMouseEvent state success " + JSON.stringify(pages));
        if (!("WebOnNativeEmbedMouseEvent" == pages.name)) {
          console.info("get WebOnNativeEmbedMouseEvent state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebOnNativeEmbedMouseEvent page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebOnNativeEmbedMouseEvent page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebOnNativeEmbedMouseButton"),10000);
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebOnNativeEmbedMouseEvent beforeEach start");
      done();
    })

   /**
    * @tc.name   testOnNativeEmbedMouseEvent001
    * @tc.number SUB_WEB_EMITONNATIVEEMBEDMOUSEEVENT_0100
    * @tc.desc   OnNativeEmbedMouseEvent
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it('testOnNativeEmbedMouseEvent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
    Utils.emitEvent("emitOnNativeEmbedMouseEvent001", 153530)
    Utils.registerEvent("testOnNativeEmbedMouseEvent001", true, 153540, done);
    await Utils.waitAndClickComponent(driver, 'WebOnNativeEmbedMouseButton', 'testOnNativeEmbedMouseEvent001');
    })
  })
}
