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

const EVENT_ID_SET_EMIT_KEY = 202540;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function sslErrorHandler() {

  describe('SslErrorHandlerTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/sslErrorHandler',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get sslErrorHandler state success " + JSON.stringify(pages));
        if (!("sslErrorHandler" == pages.name)) {
          console.info("get sslErrorHandler state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push sslErrorHandler page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push sslErrorHandler page error: " + err);
      }
      await driver.waitForComponent(ON.id("SslErrorHandlerButton"), 10000);
      console.log("waitForComponent SslErrorHandlerButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("sslErrorHandler beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ONSSLERROREVENTRECEIVE_0100
    * @tc.name       : testOnSslErrorEventReceive001
    * @tc.desc       : test onSslErrorEventReceive handleConfirm
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnSslErrorEventReceive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testOnSslErrorEventReceive001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testOnSslErrorEventReceive001", true, 202550, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "SslErrorHandlerButton");
      if (await Utils.waitForExist(() => isReturn, 'testOnSslErrorEventReceive001' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /*
    * @tc.number     : SUB_WEB_SSLERRORHANDLERHANDLECANCEL_0100
    * @tc.name       : testSslErrorHandlerHandleCancel001
    * @tc.desc       : test sslErrorHandler handleCancel
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSslErrorHandlerHandleCancel001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSslErrorHandlerHandleCancel001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testSslErrorHandlerHandleCancel001", 0, 202560, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "SslErrorHandlerButton");
      if (await Utils.waitForExist(() => isReturn, 'testSslErrorHandlerHandleCancel001' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /*
    * @tc.number     : SUB_WEB_SSLERRORHANDLERHANDLECONFIRM_0100
    * @tc.name       : testSslErrorHandlerHandleConfirm001
    * @tc.desc       : test sslErrorHandler handleConfirm
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSslErrorHandlerHandleConfirm001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSslErrorHandlerHandleConfirm001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testSslErrorHandlerHandleConfirm001", true, 202570, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "SslErrorHandlerButton");
      if (await Utils.waitForExist(() => isReturn, 'testSslErrorHandlerHandleConfirm001' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_CLEARSSLCACHE_0100
    * @tc.name       : testClearSslCache001
    * @tc.desc       : test clearSslCache
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testClearSslCache001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testClearSslCache001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testClearSslCache001", true, 202580, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "SslErrorHandlerButton");
      if (await Utils.waitForExist(() => isReturn, 'testClearSslCache001' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
  })
}