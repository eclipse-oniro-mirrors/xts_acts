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

import webCode from 'libweberrorcodetest.so'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

const TEST_ARKWEB_SUCCESS = 0;
const TEST_ARKWEB_INIT_ERROR = 17100001;
const TEST_ARKWEB_ERROR_UNKNOWN = 17100100;
const TEST_ARKWEB_INVALID_PARAM = 17100101;
const TEST_ARKWEB_SCHEME_REGISTER_FAILED = 17100102;
const TEST_ARKWEB_INVALID_URL = 17100103;
const TEST_ARKWEB_INVALID_COOKIE_VALUE = 17100104
const TEST_ARKWEB_LIBRARY_OPEN_FAILURE = 17100105;
const TEST_ARKWEB_LIBRARY_SYMBOL_NOT_FOUND = 17100106;
const TEST_ARKWEB_COOKIE_MANAGER_NOT_INITIALIZED = 17100107;

const TEST_ARKWEB_BLANKLESS_SUCCESS = 0;
const TEST_ARKWEB_BLANKLESS_ERR_UNKNOWN = -1;
const TEST_ARKWEB_BLANKLESS_ERR_INVALID_ARGS = -2;
const TEST_ARKWEB_BLANKLESS_ERR_CONTROLLER_NOT_INITED = -3;
const TEST_ARKWEB_BLANKLESS_ERR_KEY_NOT_MATCH = -4;
const TEST_ARKWEB_BLANKLESS_ERR_SIGNIFICANT_CHANGE = -5;
const TEST_ARKWEB_BLANKLESS_ERR_DEVICE_NOT_SUPPORT = 801;


export default function ActsWebErrorCodeTest() {
  describe('ActsWebErrorCodeTest', () => {
    /**
     * @tc.number  : SUB_OH_Web_Error_Code_0100
     * @tc.name    : testArkWebErrorCode0100
     * @tc.desc    : test OH_Web_Error_Code Test Normal Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkWebErrorCode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrorCode0100 start====");
        let result: number = webCode.webErrCodeSuccess();
        console.info("====>testArkWebErrorCode0100 result====", result);
        expect(result).assertEqual(TEST_ARKWEB_SUCCESS);
        done();
      } catch (err) {
        console.error("====>testArkWebErrorCode0100 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_OH_Web_Error_Code_0200
     * @tc.name    : testArkWebErrorCode0200
     * @tc.desc    : test OH_Web_Error_Code Test Normal Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkWebErrorCode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrorCode0200 start====");
        let result: number = webCode.webInitError();
        console.info("====>testArkWebErrorCode0200 result====", result);
        expect(result).assertEqual(TEST_ARKWEB_INIT_ERROR);
        done();
      } catch (err) {
        console.error("====>testArkWebErrorCode0200 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_OH_Web_Error_Code_0300
     * @tc.name    : testArkWebErrorCode0300
     * @tc.desc    : test OH_Web_Error_Code Test UNKNOWN
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkWebErrorCode0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrorCode0300 start====");
        let result: number = webCode.webErrorUnknow();
        console.info("====>testArkWebErrorCode0300 result====", result);
        expect(result).assertEqual(TEST_ARKWEB_ERROR_UNKNOWN);
        done();
      } catch (err) {
        console.error("====>testArkWebErrorCode0300 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_OH_Web_Error_Code_0400
     * @tc.name    : testArkWebErrorCode0400
     * @tc.desc    : test OH_Web_Error_Code Test ARKWEB_INVALID_PARAM
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkWebErrorCode0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrorCode0400 start====");
        let result: number = webCode.webErrorInvalidParam();
        console.info("====>testArkWebErrorCode0400 result====", result);
        expect(result).assertEqual(TEST_ARKWEB_INVALID_PARAM);
        done();
      } catch (err) {
        console.error("====>testArkWebErrorCode0400 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_OH_Web_Error_Code_0500
     * @tc.name    : testArkWebErrorCode0500
     * @tc.desc    : test OH_Web_Error_Code Test ARKWEB_SCHEME_REGISTER_FAILED
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkWebErrorCode0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrorCode0500 start====");
        let result: number = webCode.webErrorSchemeRegitsterFailed();
        console.info("====>testArkWebErrorCode0500 result====", result);
        expect(result).assertEqual(TEST_ARKWEB_SCHEME_REGISTER_FAILED);
        done();
      } catch (err) {
        console.error("====>testArkWebErrorCode0500 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_OH_Web_Error_Code_0600
     * @tc.name    : testArkWebErrorCode0600
     * @tc.desc    : test OH_Web_Error_Code Test ARKWEB_INVALID_URL
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkWebErrorCode0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrorCode0600 start====");
        let result: number = webCode.webErrorInvaledURL();
        console.info("====>testArkWebErrorCode0600 result====", result);
        expect(result).assertEqual(TEST_ARKWEB_INVALID_URL);
        done();
      } catch (err) {
        console.error("====>testArkWebErrorCode0600 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_OH_Web_Error_Code_0700
     * @tc.name    : testArkWebErrorCode0700
     * @tc.desc    : test OH_Web_Error_Code Test ARKWEB_INVALID_COOKIE_VALUE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkWebErrorCode0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrorCode0700 start====");
        let result: number = webCode.webErrorInvaledCookieValue();
        console.info("====>testArkWebErrorCode0700 result====", result);
        expect(result).assertEqual(TEST_ARKWEB_INVALID_COOKIE_VALUE);
        done();
      } catch (err) {
        console.error("====>testArkWebErrorCode0700 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_OH_Web_Error_Code_0800
     * @tc.name    : testArkWebErrorCode0800
     * @tc.desc    : test OH_Web_Error_Code Test ARKWEB_LIBRARY_OPEN_FAILURE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkWebErrorCode0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrorCode0800 start====");
        let result: number = webCode.webErrorLibraryOpenFailure();
        console.info("====>testArkWebErrorCode0800 result====", result);
        expect(result).assertEqual(TEST_ARKWEB_LIBRARY_OPEN_FAILURE);
        done();
      } catch (err) {
        console.error("====>testArkWebErrorCode0800 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_OH_Web_Error_Code_0900
     * @tc.name    : testArkWebErrorCode0900
     * @tc.desc    : test OH_Web_Error_Code Test ARKWEB_LIBRARY_SYMBOL_NOT_FOUND
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkWebErrorCode0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrorCode0900 start====");
        let result: number = webCode.webErrorLibraySymbolNotFound();
        console.info("====>testArkWebErrorCode0900 result====", result);
        expect(result).assertEqual(TEST_ARKWEB_LIBRARY_SYMBOL_NOT_FOUND);
        done();
      } catch (err) {
        console.error("====>testArkWebErrorCode0900 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_OH_Web_Error_Code_1000
     * @tc.name    : testArkWebErrorCode1000
     * @tc.desc    : test OH_Web_Error_Code Test ARKWEB_COOKIE_MANAGER_NOT_INITIALIZED
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkWebErrorCode1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrorCode1000 start====");
        let result: number = webCode.webErrorCookeManagerNotInitialized();
        console.info("====>testArkWebErrorCode1000 result====", result);
        expect(result).assertEqual(TEST_ARKWEB_COOKIE_MANAGER_NOT_INITIALIZED);
        done();
      } catch (err) {
        console.error("====>testArkWebErrorCode1000 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_OH_BLANKLESS_Code_0100
     * @tc.name    : testArkWebBlanklessErrorCode100
     * @tc.desc    : test OH_Web_Error_Code Test ARKWEB_BLANKLESS_SUCCESS
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkWebBlanklessErrorCode100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebBlanklessErrorCode100 start====");
        let result: number = webCode.webBlanklessSuccess();
        console.info("====>testArkWebBlanklessErrorCode100 result====", result);
        expect(result).assertEqual(TEST_ARKWEB_BLANKLESS_SUCCESS);
        done();
      } catch (err) {
        console.error("====>testArkWebBlanklessErrorCode100 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_OH_BLANKLESS_Code_0200
     * @tc.name    : testArkWebBlanklessErrorCode200
     * @tc.desc    : test OH_Web_Error_Code Test ARKWEB_BLANKLESS_SUCCESS
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkWebBlanklessErrorCode200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebBlanklessErrorCode200 start====");
        let result: number = webCode.webBlanklessErrUnknown();
        console.info("====>testArkWebBlanklessErrorCode200 result====", result);
        expect(result).assertEqual(TEST_ARKWEB_BLANKLESS_ERR_UNKNOWN);
        done();
      } catch (err) {
        console.error("====>testArkWebBlanklessErrorCode200 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_OH_BLANKLESS_Code_0300
     * @tc.name    : testArkWebBlanklessErrorCode300
     * @tc.desc    : test OH_Web_Error_Code Test ARKWEB_BLANKLESS_ERR_INVALID_ARGS
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkWebBlanklessErrorCode300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebBlanklessErrorCode300 start====");
        let result: number = webCode.webBlanklessErrInvalidArgs();
        console.info("====>testArkWebBlanklessErrorCode300 result====", result);
        expect(result).assertEqual(TEST_ARKWEB_BLANKLESS_ERR_INVALID_ARGS);
        done();
      } catch (err) {
        console.error("====>testArkWebBlanklessErrorCode300 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_OH_BLANKLESS_Code_0400
     * @tc.name    : testArkWebBlanklessErrorCode400
     * @tc.desc    : test OH_Web_Error_Code Test ARKWEB_BLANKLESS_ERR_INVALID_ARGS
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkWebBlanklessErrorCode400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebBlanklessErrorCode400 start====");
        let result: number = webCode.webBlanklessErrControllerNotInited();
        console.info("====>testArkWebBlanklessErrorCode400 result====", result);
        expect(result).assertEqual(TEST_ARKWEB_BLANKLESS_ERR_CONTROLLER_NOT_INITED);
        done();
      } catch (err) {
        console.error("====>testArkWebBlanklessErrorCode400 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_OH_BLANKLESS_Code_0500
     * @tc.name    : testArkWebBlanklessErrorCode500
     * @tc.desc    : test OH_Web_Error_Code Test ARKWEB_BLANKLESS_ERR_INVALID_ARGS
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkWebBlanklessErrorCode500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebBlanklessErrorCode500 start====");
        let result: number = webCode.webBlanklessErrKeyNotMatch();
        console.info("====>testArkWebBlanklessErrorCode500 result====", result);
        expect(result).assertEqual(TEST_ARKWEB_BLANKLESS_ERR_KEY_NOT_MATCH);
        done();
      } catch (err) {
        console.error("====>testArkWebBlanklessErrorCode500 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_OH_BLANKLESS_Code_0600
     * @tc.name    : testArkWebBlanklessErrorCode600
     * @tc.desc    : test OH_Web_Error_Code Test ARKWEB_BLANKLESS_ERR_INVALID_ARGS
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkWebBlanklessErrorCode600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebBlanklessErrorCode600 start====");
        let result: number = webCode.webBlanklessErrSignificantChange();
        console.info("====>testArkWebBlanklessErrorCode600 result====", result);
        expect(result).assertEqual(TEST_ARKWEB_BLANKLESS_ERR_SIGNIFICANT_CHANGE);
        done();
      } catch (err) {
        console.error("====>testArkWebBlanklessErrorCode600 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_OH_BLANKLESS_Code_0700
     * @tc.name    : testArkWebBlanklessErrorCode700
     * @tc.desc    : test OH_Web_Error_Code Test ARKWEB_BLANKLESS_ERR_DEVICE_NOT_SUPPORT
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkWebBlanklessErrorCode700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebBlanklessErrorCode700 start====");
        let result: number = webCode.webBlanklessDeviceNotSupport();
        console.info("====>testArkWebBlanklessErrorCode700 result====", result);
        expect(result).assertEqual(TEST_ARKWEB_BLANKLESS_ERR_DEVICE_NOT_SUPPORT);
        done();
      } catch (err) {
        console.error("====>testArkWebBlanklessErrorCode700 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_OH_WebAnyNativeAPI_100
     * @tc.name    : testArkWebNativeAnyNativeAPI
     * @tc.desc    : test ArkWeb_AnyNativeAPI Test size
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkWebNativeAnyNativeAPI', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebNativeAnyNativeAPI start====");
        let result: number = webCode.webAnyNativeAPI();
        console.info("====>testArkWebNativeAnyNativeAPI result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebNativeAnyNativeAPI catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_OH_NATIVE_APIVariantKind_100
     * @tc.name    : testArkWebNativeCompent
     * @tc.desc    : test ARKWEB_NATIVE_COMPONENT
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkWebNativeCompent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebNativeCompent start====");
        let result: number = webCode.webNativeComponent();
        console.info("====>testArkWebNativeCompent result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebNativeCompent catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_OH_NATIVE_APIVariantKind_200
     * @tc.name    : testArkWebNativeController
     * @tc.desc    : test ARKWEB_NATIVE_CONTROLLER
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkWebNativeController', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebNativeController start====");
        let result: number = webCode.webNativeController();
        console.info("====>testArkWebNativeController result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebNativeController catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_OH_NATIVE_APIVariantKind_300
     * @tc.name    : testArkWebNativeWebMessagePort
     * @tc.desc    : test ARKWEB_NATIVE_WEB_MESSAGE_PORT
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkWebNativeWebMessagePort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebNativeWebMessagePort start====");
        let result: number = webCode.webNativeWebMessagePort();
        console.info("====>testArkWebNativeWebMessagePort result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebNativeWebMessagePort catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_OH_NATIVE_APIVariantKind_400
     * @tc.name    : testArkWebNativeWebMessage
     * @tc.desc    : test ARKWEB_NATIVE_WEB_MESSAGE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkWebNativeWebMessage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebNativeWebMessage start====");
        let result: number = webCode.webNativeWebMessage();
        console.info("====>testArkWebNativeWebMessage result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebNativeWebMessage catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_OH_NATIVE_APIVariantKind_500
     * @tc.name    : testArkWebNativeCookieManger
     * @tc.desc    : test ARKWEB_NATIVE_COOKIE_MANAGER
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkWebNativeCookieManger', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebNativeCookieManger start====");
        let result: number = webCode.webNativeCookieManger();
        console.info("====>testArkWebNativeCookieManger result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebNativeCookieManger catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_OH_NATIVE_APIVariantKind_600
     * @tc.name    : testArkWebNativeJavascriptValue
     * @tc.desc    : test ARKWEB_NATIVE_JAVASCRIPT_VALUE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkWebNativeJavascriptValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebNativeJavascriptValue start====");
        let result: number = webCode.webNativeJavaScriptValue();
        console.info("====>testArkWebNativeJavascriptValue result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebNativeJavascriptValue catch err: " + err);
      }
    })
  })
}