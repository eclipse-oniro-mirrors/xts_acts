/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { afterEach, beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webCookieManagerConfigCookie() {

  describe('WebCookieManagerConfigCookieTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebCookieManagerConfigCookie',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebCookieManagerConfigCookie state success " + JSON.stringify(pages));
        if (!("WebCookieManagerConfigCookie" == pages.name)) {
          console.info("get WebCookieManagerConfigCookie state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebCookieManagerConfigCookie page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebCookieManagerConfigCookie page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebCookieManagerConfigCookie beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebCookieManagerConfigCookieTestSuite afterEach start");
      await Utils.sleep(2000);
      console.info("WebCookieManagerConfigCookieTestSuite afterEach end");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_CONFIGCOOKIESYNC_INCLUDEHTTPONLY_0100
    * @tc.name       : testConfigCookieSyncIncludeHttpOnly001
    * @tc.desc       : test configCookieSync param incognito true, includeHttpOnly false
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testConfigCookieSyncIncludeHttpOnly001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testConfigCookieSyncIncludeHttpOnly001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookieSyncIncludeHttpOnly001", 'id=123', 2025032201, done);
      sendEventByKey('WebCookieManagerConfigCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_CONFIGCOOKIESYNC_INCLUDEHTTPONLY_0200
    * @tc.name       : testConfigCookieSyncIncludeHttpOnly002
    * @tc.desc       : test configCookieSync param incognito false, includeHttpOnly false
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testConfigCookieSyncIncludeHttpOnly002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testConfigCookieSyncIncludeHttpOnly002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookieSyncIncludeHttpOnly002", 'name=alin', 2025032202, done);
      sendEventByKey('WebCookieManagerConfigCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_CONFIGCOOKIESYNC_INCLUDEHTTPONLY_0300
    * @tc.name       : testConfigCookieSyncIncludeHttpOnly003
    * @tc.desc       : test configCookieSync param incognito true, includeHttpOnly true
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testConfigCookieSyncIncludeHttpOnly003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testConfigCookieSyncIncludeHttpOnly003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookieSyncIncludeHttpOnly003", 'age=9', 2025032203, done);
      sendEventByKey('WebCookieManagerConfigCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_CONFIGCOOKIESYNC_INCLUDEHTTPONLY_0400
    * @tc.name       : testConfigCookieSyncIncludeHttpOnly004
    * @tc.desc       : test configCookieSync param incognito false, includeHttpOnly true
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testConfigCookieSyncIncludeHttpOnly004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testConfigCookieSyncIncludeHttpOnly004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookieSyncIncludeHttpOnly004", 'city=sh', 2025032204, done);
      sendEventByKey('WebCookieManagerConfigCookieTestButton', 10, '');
    })


    /*
    * @tc.number     : SUB_WEB_CONFIGCOOKIESYNC_INCLUDEHTTPONLY_ERROR_CODE_0500
    * @tc.name       : testConfigCookieSyncIncludeHttpOnlyErrorCode005
    * @tc.desc       : test configCookieSync param incognito true, includeHttpOnly true, error code 17100002
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testConfigCookieSyncIncludeHttpOnlyErrorCode005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testConfigCookieSyncIncludeHttpOnlyErrorCode005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookieSyncIncludeHttpOnlyErrorCode005", 17100002, 2025032205, done);
      sendEventByKey('WebCookieManagerConfigCookieTestButton', 10, '');
    })


    /*
    * @tc.number     : SUB_WEB_CONFIGCOOKIESYNC_INCLUDEHTTPONLY_ERROR_CODE_0600
    * @tc.name       : testConfigCookieSyncIncludeHttpOnlyErrorCode006
    * @tc.desc       : test configCookieSync param incognito true, includeHttpOnly true, error code 17100002
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testConfigCookieSyncIncludeHttpOnlyErrorCode006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testConfigCookieSyncIncludeHttpOnlyErrorCode006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookieSyncIncludeHttpOnlyErrorCode006", 17100005, 2025032206, done);
      sendEventByKey('WebCookieManagerConfigCookieTestButton', 10, '');
    })

    /*
       * @tc.number     : SUB_WEB_CONFIGCOOKIE_INCLUDEHTTPONLY_0100
       * @tc.name       : testConfigCookieIncludeHttpOnly001
       * @tc.desc       : test configCookie param incognito true, includeHttpOnly false
       * @tc.size       : MEDIUM
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testConfigCookieIncludeHttpOnly001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testConfigCookieIncludeHttpOnly001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookieIncludeHttpOnly001", 'id=123', 2025032207, done);
      sendEventByKey('WebCookieManagerConfigCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_CONFIGCOOKIE_INCLUDEHTTPONLY_0200
    * @tc.name       : testConfigCookieIncludeHttpOnly002
    * @tc.desc       : test configCookie param incognito false, includeHttpOnly false
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testConfigCookieIncludeHttpOnly002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testConfigCookieIncludeHttpOnly002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookieIncludeHttpOnly002", 'name=alin', 2025032208, done);
      sendEventByKey('WebCookieManagerConfigCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_CONFIGCOOKIE_INCLUDEHTTPONLY_0300
    * @tc.name       : testConfigCookieIncludeHttpOnly003
    * @tc.desc       : test configCookie param incognito true, includeHttpOnly true
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testConfigCookieIncludeHttpOnly003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testConfigCookieIncludeHttpOnly003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookieIncludeHttpOnly003", 'age=9', 2025032209, done);
      sendEventByKey('WebCookieManagerConfigCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_CONFIGCOOKIE_INCLUDEHTTPONLY_0400
    * @tc.name       : testConfigCookieIncludeHttpOnly004
    * @tc.desc       : test configCookie param incognito false, includeHttpOnly true
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testConfigCookieIncludeHttpOnly004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testConfigCookieIncludeHttpOnly004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookieIncludeHttpOnly004", 'city=sh', 2025032210, done);
      sendEventByKey('WebCookieManagerConfigCookieTestButton', 10, '');
    })


    /*
    * @tc.number     : SUB_WEB_CONFIGCOOKIE_INCLUDEHTTPONLY_ERROR_CODE_0500
    * @tc.name       : testConfigCookieIncludeHttpOnlyErrorCode005
    * @tc.desc       : test configCookie param incognito true, includeHttpOnly true,  errorCode 17100002
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testConfigCookieIncludeHttpOnlyErrorCode005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testConfigCookieIncludeHttpOnlyErrorCode005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookieIncludeHttpOnlyErrorCode005", 17100002, 2025032211, done);
      sendEventByKey('WebCookieManagerConfigCookieTestButton', 10, '');
    })


    /*
    * @tc.number     : SUB_WEB_CONFIGCOOKIE_INCLUDEHTTPONLY_ERROR_CODE_0600
    * @tc.name       : testConfigCookieIncludeHttpOnlyErrorCode006
    * @tc.desc       : test configCookie param incognito true, includeHttpOnly true, errorCode 17100005
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testConfigCookieIncludeHttpOnlyErrorCode006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testConfigCookieIncludeHttpOnlyErrorCode006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookieIncludeHttpOnlyErrorCode006", 17100005, 2025032212, done);
      sendEventByKey('WebCookieManagerConfigCookieTestButton', 10, '');
    })


    /*
    * @tc.number     : SUB_WEB_CONFIGCOOKIE_ERROR_CODE_0100
    * @tc.name       : testConfigCookieErrorCode001
    * @tc.desc       : test configCookie errorCode 17100002
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testConfigCookieErrorCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testConfigCookieErrorCode001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookieErrorCode001", 17100002, 2025032213, done);
      sendEventByKey('WebCookieManagerConfigCookieTestButton', 10, '');
    })


    /*
    * @tc.number     : SUB_WEB_CONFIGCOOKIE_ERROR_CODE_0200
    * @tc.name       : testConfigCookieErrorCode002
    * @tc.desc       : test configCookie errorCode 17100005
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testConfigCookieErrorCode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testConfigCookieErrorCode002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookieErrorCode002", 17100005, 2025032214, done);
      sendEventByKey('WebCookieManagerConfigCookieTestButton', 10, '');
    })


  })
}
