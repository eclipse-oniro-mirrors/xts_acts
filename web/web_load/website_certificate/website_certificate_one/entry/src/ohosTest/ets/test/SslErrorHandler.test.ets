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
          await Utils.sleep(2000);
          console.info("push sslErrorHandler page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push sslErrorHandler page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
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
      Utils.emitEvent("testOnSslErrorEventReceive001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnSslErrorEventReceive001", true, 30272, done);
      sendEventByKey('SslErrorHandlerButton', 10, '');
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
      Utils.emitEvent("testSslErrorHandlerHandleCancel001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSslErrorHandlerHandleCancel001", 0, 30271, done);
      sendEventByKey('SslErrorHandlerButton', 10, '');
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
      Utils.emitEvent("testSslErrorHandlerHandleConfirm001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSslErrorHandlerHandleConfirm001", true, 30270, done);
      sendEventByKey('SslErrorHandlerButton', 10, '');
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
      Utils.emitEvent("testClearSslCache001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testClearSslCache001", true, 100073, done);
      sendEventByKey('SslErrorHandlerButton', 10, '');
    })

  })
}
