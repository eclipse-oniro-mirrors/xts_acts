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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 202690;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function webSslErrorTest() {

  describe('WebSslErrorTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebSslErrorTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebSslErrorTest state success " + JSON.stringify(pages));
        if (!("WebSslErrorTest" == pages.name)) {
          console.info("get WebSslErrorTest state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push WebSslErrorTest page success");
        }
      } catch (err) {
        console.error("push WebSslErrorTest page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebSslErrorTestButton"), 10000);
      console.log("waitForComponent WebSslErrorTestButton");
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
    * @tc.number     : SUB_WEB_SSLERRORDATEINVALID_0100
    * @tc.name       : testSslErrorDateInvalid001
    * @tc.desc       : test SslError DateInvalid
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSslErrorDateInvalid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitSslErrorDateInvalid", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testSslErrorDateInvalid001", SslError.DateInvalid, 202700, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "WebSslErrorTestButton");
      if (await Utils.waitForExist(() => isReturn, 'testSslErrorDateInvalid001' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /*
    * @tc.number     : SUB_WEB_SSLERRORUNTRUSTED_0100
    * @tc.name       : testSslErrorUntrusted001
    * @tc.desc       : test SslError Untrusted
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSslErrorUntrusted001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitSslErrorUntrusted", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testSslErrorUntrusted001", SslError.Untrusted, 202710, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "WebSslErrorTestButton");
      if (await Utils.waitForExist(() => isReturn, 'testSslErrorUntrusted001' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
  })
}