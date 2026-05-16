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

import { afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver: Driver = Driver.create();

export default function webCookieManagerConfigCookieSync() {
  describe('WebCookieManagerConfigCookieSyncTestSuite', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebCookieManagerConfigCookieSync',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebCookieManagerConfigCookieSync state success ' + JSON.stringify(pages));
        if (!('WebCookieManagerConfigCookieSync' == pages.name)) {
          console.info('get WebCookieManagerConfigCookieSync state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebCookieManagerConfigCookieSync page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebCookieManagerConfigCookieSync page error: ' + err);
      }
      await driver.waitForComponent(ON.id('WebCookieManagerConfigCookieSyncTestButton'), 10000);
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('WebCookieManagerConfigCookieSync beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('WebCookieManagerConfigCookieSyncTestSuite afterEach start');
      console.info('WebCookieManagerConfigCookieSyncTestSuite afterEach end');
      done();
    })

    /**
     * @tc.name   testConfigCookieSyncUrlEmpty001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_URL_EMPTY_0100
     * @tc.desc   test configCookieSync with empty url parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSyncUrlEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncUrlEmpty001', 135550)
        Utils.registerEvent('testConfigCookieSyncUrlEmpty001', 17100002, 135560, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncUrlEmpty001');
      })

    /**
     * @tc.name   testConfigCookieSyncValueEmpty002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_VALUE_EMPTY_0200
     * @tc.desc   test configCookieSync with empty value parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSyncValueEmpty002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncValueEmpty002', 135550)
        Utils.registerEvent('testConfigCookieSyncValueEmpty002', 17100005, 135570, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncValueEmpty002');
      })

    /**
     * @tc.name   testConfigCookieSyncUrlAndValueEmpty003
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_URL_AND_VALUE_EMPTY_0300
     * @tc.desc   test configCookieSync with both url and value empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSyncUrlAndValueEmpty003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncUrlAndValueEmpty003', 135550)
        Utils.registerEvent('testConfigCookieSyncUrlAndValueEmpty003',  17100002, 135580, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncUrlAndValueEmpty003');
      })

    /**
     * @tc.name   testConfigCookieSyncUrlInvalid004
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_URL_INVALID_0400
     * @tc.desc   test configCookieSync with invalid url (error code 17100002)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSyncUrlInvalid004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncUrlInvalid004', 135550)
        Utils.registerEvent('testConfigCookieSyncUrlInvalid004', 17100002, 135590, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncUrlInvalid004');
      })

    /**
     * @tc.name   testConfigCookieSyncValueInvalid005
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_VALUE_INVALID_0500
     * @tc.desc   test configCookieSync with invalid value (error code 17100005)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSyncValueInvalid005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncValueInvalid005', 135550)
        Utils.registerEvent('testConfigCookieSyncValueInvalid005', 17100005, 135600, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncValueInvalid005');
      })

    /**
     * @tc.name   testConfigCookieSyncIncognitoTrue006
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_INCOGNITO_TRUE_0100
     * @tc.desc   test configCookieSync with incognito = true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConfigCookieSyncIncognitoTrue006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncIncognitoTrue006', 135550)
        Utils.registerEvent('testConfigCookieSyncIncognitoTrue006', 'test_cookie=test_value', 135610, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncIncognitoTrue006');
      })

    /**
     * @tc.name   testConfigCookieSyncIncognitoFalse007
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_INCOGNITO_FALSE_0200
     * @tc.desc   test configCookieSync with incognito = false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConfigCookieSyncIncognitoFalse007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncIncognitoFalse007', 135550)
        Utils.registerEvent('testConfigCookieSyncIncognitoFalse007', 'session_id=abc123', 135620, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncIncognitoFalse007');
      })

    /**
     * @tc.name   testConfigCookieSyncIncognitoUndefined008
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_INCOGNITO_UNDEFINED_0300
     * @tc.desc   test configCookieSync with incognito = undefined (default behavior)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConfigCookieSyncIncognitoUndefined008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncIncognitoUndefined008', 135550)
        Utils.registerEvent('testConfigCookieSyncIncognitoUndefined008', 'user_id=user123', 135630, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncIncognitoUndefined008');
      })

    /**
     * @tc.name   testConfigCookieSyncValidParams009
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_VALID_PARAMS_0100
     * @tc.desc   test configCookieSync with valid url, value, and incognito parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieSyncValidParams009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncValidParams009', 135550)
        Utils.registerEvent('testConfigCookieSyncValidParams009', 'preference=dark_mode', 135640, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncValidParams009');
      })

    /**
     * @tc.name   testConfigCookieSyncMultipleCalls010
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_MULTIPLE_CALLS_0200
     * @tc.desc   test configCookieSync with multiple calls (cookies separated by "; ")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConfigCookieSyncMultipleCalls010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncMultipleCalls010', 135550)
        Utils.registerEvent('testConfigCookieSyncMultipleCalls010', 'cookie1=value1', 135650, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncMultipleCalls010');
      })

    /**
     * @tc.name   testConfigCookieSyncSecureAttribute011
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_SECURE_ATTRIBUTE_0300
     * @tc.desc   test configCookieSync with Secure attribute (requires https://)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConfigCookieSyncSecureAttribute011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncSecureAttribute011', 135550)
        Utils.registerEvent('testConfigCookieSyncSecureAttribute011', 'token=secret', 135660, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncSecureAttribute011');
      })

    /**
     * @tc.name   testConfigCookieSyncMaxAgeAttribute012
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_MAXAGE_ATTRIBUTE_0400
     * @tc.desc   test configCookieSync with Max-Age attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConfigCookieSyncMaxAgeAttribute012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncMaxAgeAttribute012', 135550)
        Utils.registerEvent('testConfigCookieSyncMaxAgeAttribute012', 'session=xyz', 135670, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncMaxAgeAttribute012');
      })

    /**
     * @tc.name   testConfigCookieSyncDomainAttribute013
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_DOMAIN_ATTRIBUTE_0500
     * @tc.desc   test configCookieSync with Domain attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConfigCookieSyncDomainAttribute013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncDomainAttribute013', 135550)
        Utils.registerEvent('testConfigCookieSyncDomainAttribute013', 'uid=user123', 135680, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncDomainAttribute013');
      })

    /**
     * @tc.name   testConfigCookieSyncPathAttribute014
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_PATH_ATTRIBUTE_0600
     * @tc.desc   test configCookieSync with Path attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConfigCookieSyncPathAttribute014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncPathAttribute014', 135550)
        Utils.registerEvent('testConfigCookieSyncPathAttribute014', '', 135690, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncPathAttribute014');
      })

    /**
     * @tc.name   testConfigCookieSyncSameSiteAttribute015
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_SAMESITE_ATTRIBUTE_0700
     * @tc.desc   test configCookieSync with SameSite attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConfigCookieSyncSameSiteAttribute015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncSameSiteAttribute015', 135550)
        Utils.registerEvent('testConfigCookieSyncSameSiteAttribute015', 'csrf_token=token', 135700, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncSameSiteAttribute015');
      })

    /**
     * @tc.name   testConfigCookieSyncUrlWithPort016
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_URL_WITH_PORT_0800
     * @tc.desc   test configCookieSync with URL containing port number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConfigCookieSyncUrlWithPort016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncUrlWithPort016', 135550)
        Utils.registerEvent('testConfigCookieSyncUrlWithPort016', 'port_test=value8080', 135710, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncUrlWithPort016');
      })

    /**
     * @tc.name   testConfigCookieSyncSpecialCharacters017
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_SPECIAL_CHARACTERS_0900
     * @tc.desc   test configCookieSync with special characters in value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSyncSpecialCharacters017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncSpecialCharacters017', 135550)
        Utils.registerEvent('testConfigCookieSyncSpecialCharacters017', 'data=encoded%20value%20test', 135720, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncSpecialCharacters017');
      })

    /**
     * @tc.name   testConfigCookieSyncLongUrl018
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_LONG_URL_1000
     * @tc.desc   test configCookieSync with long URL (boundary test)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSyncLongUrl018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncLongUrl018', 135550)
        Utils.registerEvent('testConfigCookieSyncLongUrl018', 0, 135730, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncLongUrl018');
      })

    /**
     * @tc.name   testConfigCookieSyncLongValue019
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_LONG_VALUE_1100
     * @tc.desc   test configCookieSync with long value (boundary test)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSyncLongValue019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncLongValue019', 135550)
        Utils.registerEvent('testConfigCookieSyncLongValue019', 17100005, 135740, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncLongValue019');
      })

    /**
     * @tc.name   testConfigCookieSyncHttpOnly020
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_HTTPONLY_1200
     * @tc.desc   test configCookieSync with HttpOnly attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConfigCookieSyncHttpOnly020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncHttpOnly020', 135550)
        Utils.registerEvent('testConfigCookieSyncHttpOnly020', 'auth_ticket=xyz123', 135750, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncHttpOnly020');
      })

    /**
     * @tc.name   testConfigCookieSyncExpiresAttribute021
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_EXPIRES_ATTRIBUTE_1300
     * @tc.desc   test configCookieSync with Expires attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConfigCookieSyncExpiresAttribute021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncExpiresAttribute021', 135550)
        Utils.registerEvent('testConfigCookieSyncExpiresAttribute021', '', 135760, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncExpiresAttribute021');
      })

    /**
     * @tc.name   testConfigCookieSyncErrorCode401022
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_ERROR_CODE_401_1400
     * @tc.desc   test configCookieSync error code 401 (parameter error)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConfigCookieSyncErrorCode401022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncErrorCode401022', 135550)
        Utils.registerEvent('testConfigCookieSyncErrorCode401022', 17100002, 135770, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncErrorCode401022');
      })

    /**
     * @tc.name   testConfigCookieSyncErrorCode17100002023
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_ERROR_CODE_17100002_1500
     * @tc.desc   test configCookieSync error code 17100002 (URL error)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConfigCookieSyncErrorCode17100002023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncErrorCode17100002023', 135550)
        Utils.registerEvent('testConfigCookieSyncErrorCode17100002023', 17100002, 135780, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncErrorCode17100002023');
      })

    /**
      * @tc.name   testConfigCookieSyncErrorCode17100005024
      * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_ERROR_CODE_17100005_1600
      * @tc.desc   test configCookieSync error code 17100005 (invalid cookie value)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testConfigCookieSyncErrorCode17100005024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncErrorCode17100005024', 135550)
        Utils.registerEvent('testConfigCookieSyncErrorCode17100005024', 17100005, 135790, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncErrorCode17100005024');
      })

    /**
      * @tc.name   testConfigCookieSyncUrlNull025
      * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_URL_NULL_1700
      * @tc.desc   test configCookieSync with null url parameter
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
    it('testConfigCookieSyncUrlNull025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncUrlNull025', 135550)
        Utils.registerEvent('testConfigCookieSyncUrlNull025', 401, 135800, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncUrlNull025');
      })

    /**
      * @tc.name   testConfigCookieSyncUrlUndefined026
      * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_URL_UNDEFINED_1800
      * @tc.desc   test configCookieSync with undefined url parameter
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
    it('testConfigCookieSyncUrlUndefined026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncUrlUndefined026', 135550)
        Utils.registerEvent('testConfigCookieSyncUrlUndefined026', 401, 135810, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncUrlUndefined026');
      })

    /**
      * @tc.name   testConfigCookieSyncValueNull027
      * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_VALUE_NULL_1900
      * @tc.desc   test configCookieSync with null value parameter
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
    it('testConfigCookieSyncValueNull027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncValueNull027', 135550)
        Utils.registerEvent('testConfigCookieSyncValueNull027', 401, 135820, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncValueNull027');
      })

    /**
      * @tc.name   testConfigCookieSyncValueUndefined028
      * @tc.number SUB_WEB_WEBCOOKIEMANAGER_CONFIGCOOKIESYNC_VALUE_UNDEFINED_2000
      * @tc.desc   test configCookieSync with undefined value parameter
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
    it('testConfigCookieSyncValueUndefined028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        Utils.emitEvent('testConfigCookieSyncValueUndefined028', 135550)
        Utils.registerEvent('testConfigCookieSyncValueUndefined028', 401, 135830, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerConfigCookieSyncTestButton', 'testConfigCookieSyncValueUndefined028');
      })
  })
}
