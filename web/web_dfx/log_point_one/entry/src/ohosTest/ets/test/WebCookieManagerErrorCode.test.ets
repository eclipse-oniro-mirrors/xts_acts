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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils.test';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 123201;
const driver = Driver.create();

export default function webCookieManagerErrorCode() {

  describe('WebCookieManagerErrorCodeTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebCookieManagerErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webCookieManagerErrorCode state success ' + JSON.stringify(pages));
        if (!("WebCookieManagerErrorCode" == pages.name)) {
          console.info('get webCookieManagerErrorCode state success ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await driver.waitForComponent(ON.id("WebCookieManagerErrorCodeButton"), 10000);
          console.info('push webCookieManagerErrorCode page success ');
        }
      } catch (err) {
        console.error('push webCookieManagerErrorCode page error: ' + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webCookieManagerErrorCode beforeEach start');
      done();
    })



    /**
    * @tc.number     SUB_WEB_ERRORCODE_FETCHCOOKIESYNC_INCOGNITO_0100
    * @tc.name       testFetchCookieSyncIncognitoError001
    * @tc.desc       test fetchCookieSync incognito error
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testFetchCookieSyncIncognitoError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSyncIncognitoError001", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testFetchCookieSyncIncognitoError001", '17100002', 123210, done);
      Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
    * @tc.number     SUB_WEB_ERRORCODE_CONFIGCOOKIESYNC_INCOGNITO_0100
    * @tc.name       testConfigCookieSyncIncognitoError001
    * @tc.desc       test configCookieSync incognito error
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testConfigCookieSyncIncognitoError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testConfigCookieSyncIncognitoError001", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testConfigCookieSyncIncognitoError001", '17100002', 123220, done);
      Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
    * @tc.number     SUB_WEB_ERRORCODE_CONFIGCOOKIESYNC_INCOGNITO_0200
    * @tc.name       testConfigCookieSyncIncognitoError002
    * @tc.desc       test configCookieSync incognito error
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testConfigCookieSyncIncognitoError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testConfigCookieSyncIncognitoError002", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testConfigCookieSyncIncognitoError002", '17100005', 123230, done);
      Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

  })
}
