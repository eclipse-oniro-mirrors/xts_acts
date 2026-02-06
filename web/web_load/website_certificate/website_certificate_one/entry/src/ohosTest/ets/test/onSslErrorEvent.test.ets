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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 202520;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function onSslErrorEvent() {
  describe('WebonSslErrorEventTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/onSslErrorEvent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onSslErrorEvent state success " + JSON.stringify(pages));
        if (!("onSslErrorEvent" == pages.name)) {
          console.info("get onSslErrorEvent state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push onSslErrorEvent page success");
        }
      } catch (err) {
        console.error("push onSslErrorEvent page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebonSslErrorEventButton"), 10000);
      console.log("waitForComponent WebonSslErrorEventButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_SSlERROREVENT_0100
    * @tc.name        : testonSslErrorEvent001
    * @tc.desc        : test testonSslErrorEvent001 when start play audio
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testonSslErrorEvent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitonSslErrorEvent", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testonSslErrorEvent001", 1, 202530, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "WebonSslErrorEventButton");
      if (await Utils.waitForExist(() => isReturn, 'testonSslErrorEvent001' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
  })
}