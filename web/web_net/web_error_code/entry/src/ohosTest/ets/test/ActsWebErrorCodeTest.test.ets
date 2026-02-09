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
     * @tc.name   testArkWebErrorCode0100
     * @tc.number SUB_OH_Web_Error_Code_0100
     * @tc.desc   test OH_Web_Error_Code Test Normal Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testArkWebErrorCode0200
     * @tc.number SUB_OH_Web_Error_Code_0200
     * @tc.desc   test OH_Web_Error_Code Test Normal Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testArkWebErrorCode0300
     * @tc.number SUB_OH_Web_Error_Code_0300
     * @tc.desc   test OH_Web_Error_Code Test UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testArkWebErrorCode0400
     * @tc.number SUB_OH_Web_Error_Code_0400
     * @tc.desc   test OH_Web_Error_Code Test ARKWEB_INVALID_PARAM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testArkWebErrorCode0500
     * @tc.number SUB_OH_Web_Error_Code_0500
     * @tc.desc   test OH_Web_Error_Code Test ARKWEB_SCHEME_REGISTER_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testArkWebErrorCode0600
     * @tc.number SUB_OH_Web_Error_Code_0600
     * @tc.desc   test OH_Web_Error_Code Test ARKWEB_INVALID_URL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testArkWebErrorCode0700
     * @tc.number SUB_OH_Web_Error_Code_0700
     * @tc.desc   test OH_Web_Error_Code Test ARKWEB_INVALID_COOKIE_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testArkWebErrorCode0800
     * @tc.number SUB_OH_Web_Error_Code_0800
     * @tc.desc   test OH_Web_Error_Code Test ARKWEB_LIBRARY_OPEN_FAILURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testArkWebErrorCode0900
     * @tc.number SUB_OH_Web_Error_Code_0900
     * @tc.desc   test OH_Web_Error_Code Test ARKWEB_LIBRARY_SYMBOL_NOT_FOUND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testArkWebErrorCode1000
     * @tc.number SUB_OH_Web_Error_Code_1000
     * @tc.desc   test OH_Web_Error_Code Test ARKWEB_COOKIE_MANAGER_NOT_INITIALIZED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrorCode1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrorCode1000 start====");
        let result: number = webCode.webErrorCookeManagerNotInitialized();
        console.info("====>testArkWebErrorCode1000 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrorCode1000 catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebBlanklessErrorCode100
     * @tc.number SUB_OH_BLANKLESS_Code_0100
     * @tc.desc   test OH_Web_Error_Code Test ARKWEB_BLANKLESS_SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testArkWebBlanklessErrorCode200
     * @tc.number SUB_OH_BLANKLESS_Code_0200
     * @tc.desc   test OH_Web_Error_Code Test ARKWEB_BLANKLESS_SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testArkWebBlanklessErrorCode300
     * @tc.number SUB_OH_BLANKLESS_Code_0300
     * @tc.desc   test OH_Web_Error_Code Test ARKWEB_BLANKLESS_ERR_INVALID_ARGS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testArkWebBlanklessErrorCode400
     * @tc.number SUB_OH_BLANKLESS_Code_0400
     * @tc.desc   test OH_Web_Error_Code Test ARKWEB_BLANKLESS_ERR_INVALID_ARGS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testArkWebBlanklessErrorCode500
     * @tc.number SUB_OH_BLANKLESS_Code_0500
     * @tc.desc   test OH_Web_Error_Code Test ARKWEB_BLANKLESS_ERR_INVALID_ARGS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testArkWebBlanklessErrorCode600
     * @tc.number SUB_OH_BLANKLESS_Code_0600
     * @tc.desc   test OH_Web_Error_Code Test ARKWEB_BLANKLESS_ERR_INVALID_ARGS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testArkWebBlanklessErrorCode700
     * @tc.number SUB_OH_BLANKLESS_Code_0700
     * @tc.desc   test OH_Web_Error_Code Test ARKWEB_BLANKLESS_ERR_DEVICE_NOT_SUPPORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testArkWebNativeAnyNativeAPI
     * @tc.number SUB_OH_WebAnyNativeAPI_100
     * @tc.desc   test ArkWeb_AnyNativeAPI Test size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testArkWebNativeCompent
     * @tc.number SUB_OH_NATIVE_APIVariantKind_100
     * @tc.desc   test ARKWEB_NATIVE_COMPONENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testArkWebNativeController
     * @tc.number SUB_OH_NATIVE_APIVariantKind_200
     * @tc.desc   test ARKWEB_NATIVE_CONTROLLER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testArkWebNativeWebMessagePort
     * @tc.number SUB_OH_NATIVE_APIVariantKind_300
     * @tc.desc   test ARKWEB_NATIVE_WEB_MESSAGE_PORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testArkWebNativeWebMessage
     * @tc.number SUB_OH_NATIVE_APIVariantKind_400
     * @tc.desc   test ARKWEB_NATIVE_WEB_MESSAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testArkWebNativeCookieManger
     * @tc.number SUB_OH_NATIVE_APIVariantKind_500
     * @tc.desc   test ARKWEB_NATIVE_COOKIE_MANAGER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testArkWebNativeJavascriptValue
     * @tc.number SUB_OH_NATIVE_APIVariantKind_600
     * @tc.desc   test ARKWEB_NATIVE_JAVASCRIPT_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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


    /**
     * @tc.name   testArkWebRegisterCustomSchemes0100
     * @tc.number SUB_OH_ArkWeb_RegisterCustomSchemes0100
     * @tc.desc   test SUB_OH_ArkWeb_RegisterCustomSchemes0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebRegisterCustomSchemes0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebRegisterCustomSchemes0100 start====");
        let result: number = webCode.OH_ArkWeb_RegisterCustomSchemes0100();
        console.info("====>testArkWebRegisterCustomSchemes0100 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebRegisterCustomSchemes0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebRegisterCustomSchemes0101
     * @tc.number SUB_OH_ArkWeb_RegisterCustomSchemes0101
     * @tc.desc   test SUB_OH_ArkWeb_RegisterCustomSchemes0101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebRegisterCustomSchemes0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebRegisterCustomSchemes0101 start====");
        let result: number = webCode.OH_ArkWeb_RegisterCustomSchemes0101();
        console.info("====>testArkWebRegisterCustomSchemes0101 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebRegisterCustomSchemes0101 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebServiceWorkerClearSchemeHandlers0100
     * @tc.number SUB_OH_ArkWebServiceWorker_ClearSchemeHandlers0100
     * @tc.desc   test SUB_OH_ArkWebServiceWorker_ClearSchemeHandlers0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebServiceWorkerClearSchemeHandlers0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebServiceWorkerClearSchemeHandlers0100 start====");
        let result: number = webCode.OH_ArkWebServiceWorker_ClearSchemeHandlers0100();
        console.info("====>testArkWebServiceWorkerClearSchemeHandlers0100 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebServiceWorkerClearSchemeHandlers0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebClearSchemeHandlers0100
     * @tc.number SUB_OH_ArkWeb_ClearSchemeHandlers0100
     * @tc.desc   test SUB_OH_ArkWeb_ClearSchemeHandlers0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebClearSchemeHandlers0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebClearSchemeHandlers0100 start====");
        let result: number = webCode.OH_ArkWeb_ClearSchemeHandlers0100();
        console.info("====>testArkWebClearSchemeHandlers0100 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebClearSchemeHandlers0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebClearSchemeHandlers0101
     * @tc.number SUB_OH_ArkWeb_ClearSchemeHandlers0101
     * @tc.desc   test SUB_OH_ArkWeb_ClearSchemeHandlers0101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebClearSchemeHandlers0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebClearSchemeHandlers0101 start====");
        let result: number = webCode.OH_ArkWeb_ClearSchemeHandlers0101();
        console.info("====>testArkWebClearSchemeHandlers0101 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebClearSchemeHandlers0101 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebSchemeHandlerSetUserData0100
     * @tc.number SUB_OH_ArkWebSchemeHandler_SetUserData0100
     * @tc.desc   test SUB_OH_ArkWebSchemeHandler_SetUserData0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSchemeHandlerSetUserData0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebSchemeHandlerSetUserData0100 start====");
        let result: number = webCode.OH_ArkWebSchemeHandler_SetUserData0100();
        console.info("====>testArkWebSchemeHandlerSetUserData0100 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSchemeHandlerSetUserData0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebSchemeHandlerSetUserData0101
     * @tc.number SUB_OH_ArkWebSchemeHandler_SetUserData0101
     * @tc.desc   test SUB_OH_ArkWebSchemeHandler_SetUserData0101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSchemeHandlerSetUserData0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebSchemeHandlerSetUserData0101 start====");
        let result: number = webCode.OH_ArkWebSchemeHandler_SetUserData0101();
        console.info("====>testArkWebSchemeHandlerSetUserData0101 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSchemeHandlerSetUserData0101 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebSchemeHandlerSetOnRequestStart0100
     * @tc.number SUB_OH_ArkWebSchemeHandler_SetOnRequestStart0100
     * @tc.desc   test ARKWEB_NATIVE_JAVASCRIPT_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSchemeHandlerSetOnRequestStart0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebSchemeHandlerSetOnRequestStart0100 start====");
        let result: number = webCode.OH_ArkWebSchemeHandler_SetOnRequestStart0100();
        console.info("====>testArkWebSchemeHandlerSetOnRequestStart0100 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSchemeHandlerSetOnRequestStart0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebSchemeHandlerSetOnRequestStart0101
     * @tc.number SUB_OH_ArkWebSchemeHandler_SetOnRequestStart0101
     * @tc.desc   test ARKWEB_NATIVE_JAVASCRIPT_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSchemeHandlerSetOnRequestStart0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebSchemeHandlerSetOnRequestStart0101 start====");
        let result: number = webCode.OH_ArkWebSchemeHandler_SetOnRequestStart0101();
        console.info("====>testArkWebSchemeHandlerSetOnRequestStart0101 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSchemeHandlerSetOnRequestStart0101 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebSchemeHandlerSetOnRequestStop0100
     * @tc.number SUB_OH_ArkWebSchemeHandler_SetOnRequestStop0100
     * @tc.desc   test ARKWEB_NATIVE_JAVASCRIPT_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSchemeHandlerSetOnRequestStop0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebSchemeHandlerSetOnRequestStop0100 start====");
        let result: number = webCode.OH_ArkWebSchemeHandler_SetOnRequestStop0100();
        console.info("====>testArkWebSchemeHandlerSetOnRequestStop0100 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSchemeHandlerSetOnRequestStop0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebSchemeHandlerSetOnRequestStop0101
     * @tc.number SUB_OH_ArkWebSchemeHandler_SetOnRequestStop0101
     * @tc.desc   test ARKWEB_NATIVE_JAVASCRIPT_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSchemeHandlerSetOnRequestStop0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebSchemeHandlerSetOnRequestStop0101 start====");
        let result: number = webCode.OH_ArkWebSchemeHandler_SetOnRequestStop0101();
        console.info("====>testArkWebSchemeHandlerSetOnRequestStop0101 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSchemeHandlerSetOnRequestStop0101 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebResponseSetUrl0100
     * @tc.number SUB_OH_ArkWebResponse_SetUrl0100
     * @tc.desc   test ARKWEB_NATIVE_JAVASCRIPT_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResponseSetUrl0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebResponseSetUrl0100 start====");
        let result: number = webCode.OH_ArkWebResponse_SetUrl0100();
        console.info("====>testArkWebResponseSetUrl0100 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResponseSetUrl0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebResponseSetUrl0101
     * @tc.number SUB_OH_ArkWebResponse_SetUrl0101
     * @tc.desc   test ARKWEB_NATIVE_JAVASCRIPT_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResponseSetUrl0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebResponseSetUrl0101 start====");
        let result: number = webCode.OH_ArkWebResponse_SetUrl0101();
        console.info("====>testArkWebResponseSetUrl0101 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResponseSetUrl0101 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebResponseSetError0100
     * @tc.number SUB_OH_ArkWebResponse_SetError0100
     * @tc.desc   test SUB_OH_ArkWebResponse_SetError0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResponseSetError0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebResponseSetError0100 start====");
        let result: number = webCode.OH_ArkWebResponse_SetError0100();
        console.info("====>testArkWebResponseSetError0100 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResponseSetError0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebResponseSetStatus0100
     * @tc.number SUB_OH_ArkWebResponse_SetStatus0100
     * @tc.desc   test SUB_OH_ArkWebResponse_SetStatus0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResponseSetStatus0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebResponseSetStatus0100 start====");
        let result: number = webCode.OH_ArkWebResponse_SetStatus0100();
        console.info("====>testArkWebResponseSetStatus0100 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResponseSetStatus0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebResponseSetStatus0101
     * @tc.number SUB_OH_ArkWebResponse_SetStatus0101
     * @tc.desc   test SUB_OH_ArkWebResponse_SetStatus0101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResponseSetStatus0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebResponseSetStatus0101 start====");
        let result: number = webCode.OH_ArkWebResponse_SetStatus0101();
        console.info("====>testArkWebResponseSetStatus0101 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResponseSetStatus0101 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebResponseSetStatusText0100
     * @tc.number SUB_OH_ArkWebResponse_SetStatusText0100
     * @tc.desc   test SUB_OH_ArkWebResponse_SetStatusText0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResponseSetStatusText0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebResponseSetStatusText0100 start====");
        let result: number = webCode.OH_ArkWebResponse_SetStatusText0100();
        console.info("====>testArkWebResponseSetStatusText0100 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResponseSetStatusText0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebResponseSetStatusText0101
     * @tc.number SUB_OH_ArkWebResponse_SetStatusText0101
     * @tc.desc   test SUB_OH_ArkWebResponse_SetStatusText0101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResponseSetStatusText0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebResponseSetStatusText0101 start====");
        let result: number = webCode.OH_ArkWebResponse_SetStatusText0101();
        console.info("====>testArkWebResponseSetStatusText0101 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResponseSetStatusText0101 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebResponseSetMimeType0100
     * @tc.number SUB_OH_ArkWebResponse_SetMimeType0100
     * @tc.desc   test SUB_OH_ArkWebResponse_SetMimeType0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResponseSetMimeType0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebResponseSetMimeType0100 start====");
        let result: number = webCode.OH_ArkWebResponse_SetMimeType0100();
        console.info("====>testArkWebResponseSetMimeType0100 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResponseSetMimeType0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebResponseSetMimeType0101
     * @tc.number SUB_OH_ArkWebResponse_SetMimeType0101
     * @tc.desc   test SUB_OH_ArkWebResponse_SetMimeType0101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResponseSetMimeType0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebResponseSetMimeType0101 start====");
        let result: number = webCode.OH_ArkWebResponse_SetMimeType0101();
        console.info("====>testArkWebResponseSetMimeType0101 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResponseSetMimeType0101 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebResponseSetCharset0100
     * @tc.number SUB_OH_ArkWebResponse_SetCharset0100
     * @tc.desc   test SUB_OH_ArkWebResponse_SetCharset0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResponseSetCharset0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebResponseSetCharset0100 start====");
        let result: number = webCode.OH_ArkWebResponse_SetCharset0100();
        console.info("====>testArkWebResponseSetCharset0100 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResponseSetCharset0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebResponseSetCharset0101
     * @tc.number SUB_OH_ArkWebResponse_SetCharset0101
     * @tc.desc   test SUB_OH_ArkWebResponse_SetCharset0101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResponseSetCharset0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebResponseSetCharset0101 start====");
        let result: number = webCode.OH_ArkWebResponse_SetCharset0101();
        console.info("====>testArkWebResponseSetCharset0101 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResponseSetCharset0101 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebResponseSetHeaderByName0100
     * @tc.number SUB_OH_ArkWebResponse_SetHeaderByName0100
     * @tc.desc   test SUB_OH_ArkWebResponse_SetHeaderByName0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResponseSetHeaderByName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebResponseSetHeaderByName0100 start====");
        let result: number = webCode.OH_ArkWebResponse_SetHeaderByName0100();
        console.info("====>testArkWebResponseSetHeaderByName0100 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResponseSetHeaderByName0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebResponseSetHeaderByName0101
     * @tc.number SUB_OH_ArkWebResponse_SetHeaderByName0101
     * @tc.desc   test SUB_OH_ArkWebResponse_SetHeaderByName0101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResponseSetHeaderByName0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebResponseSetHeaderByName0101 start====");
        let result: number = webCode.OH_ArkWebResponse_SetHeaderByName0101();
        console.info("====>testArkWebResponseSetHeaderByName0101 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResponseSetHeaderByName0101 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebResourceHandlerDestroy0100
     * @tc.number SUB_OH_ArkWebResourceHandler_Destroy0100
     * @tc.desc   test SUB_OH_ArkWebResourceHandler_Destroy0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResourceHandlerDestroy0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebResourceHandlerDestroy0100 start====");
        let result: number = webCode.OH_ArkWebResourceHandler_Destroy0100();
        console.info("====>testArkWebResourceHandlerDestroy0100 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResourceHandlerDestroy0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebResourceHandlerDidReceiveResponse0100
     * @tc.number SUB_OH_ArkWebResourceHandler_DidReceiveResponse0100
     * @tc.desc   test SUB_OH_ArkWebResourceHandler_DidReceiveResponse0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResourceHandlerDidReceiveResponse0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebResourceHandlerDidReceiveResponse0100 start====");
        let result: number = webCode.OH_ArkWebResourceHandler_DidReceiveResponse0100();
        console.info("====>testArkWebResourceHandlerDidReceiveResponse0100 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResourceHandlerDidReceiveResponse0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebResourceHandlerDidReceiveData0100
     * @tc.number SUB_OH_ArkWebResourceHandler_DidReceiveData0100
     * @tc.desc   test SUB_OH_ArkWebResourceHandler_DidReceiveData0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResourceHandlerDidReceiveData0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebResourceHandlerDidReceiveData0100 start====");
        let result: number = webCode.OH_ArkWebResourceHandler_DidReceiveData0100();
        console.info("====>testArkWebResourceHandlerDidReceiveData0100 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResourceHandlerDidReceiveData0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebResourceHandlerDidFinish0100
     * @tc.number SUB_OH_ArkWebResourceHandler_DidFinish0100
     * @tc.desc   test SUB_OH_ArkWebResourceHandler_DidFinish0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResourceHandlerDidFinish0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebResourceHandlerDidFinish0100 start====");
        let result: number = webCode.OH_ArkWebResourceHandler_DidFinish0100();
        console.info("====>testArkWebResourceHandlerDidFinish0100 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResourceHandlerDidFinish0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebResourceHandlerDidFailWithError0100
     * @tc.number SUB_OH_ArkWebResourceHandler_DidFailWithError0100
     * @tc.desc   test SUB_OH_ArkWebResourceHandler_DidFinish0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResourceHandlerDidFailWithError0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebResourceHandlerDidFailWithError0100 start====");
        let result: number = webCode.OH_ArkWebResourceHandler_DidFailWithError0100();
        console.info("====>testArkWebResourceHandlerDidFailWithError0100 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResourceHandlerDidFailWithError0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.name   testArkWebResourceHandlerDidFailWithErrorV20100
     * @tc.number SUB_OH_ArkWebResourceHandler_DidFailWithErrorV20100
     * @tc.desc   test SUB_OH_ArkWebResourceHandler_DidFinish0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResourceHandlerDidFailWithErrorV20100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebResourceHandlerDidFailWithErrorV20100 start====");
        let result: number = webCode.OH_ArkWebResourceHandler_DidFailWithErrorV20100();
        console.info("====>testArkWebResourceHandlerDidFailWithErrorV20100 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResourceHandlerDidFailWithErrorV20100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })
  })
}