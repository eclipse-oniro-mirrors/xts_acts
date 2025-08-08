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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import nativeInterface from 'libnativeinterfacetest.so';

const TEST_ARKWEB_SUCCESS = 0;
const TEST_ARKWEB_INIT_ERROR = 17100001;
const TEST_ARKWEB_INVALID_PARAM = 17100101;
const TEST_ARKWEB_SCHEME_REGISTER_FAILED = 17100102;
const TEST_ARKWEB_INVALID_URL = 17100103;
const TEST_ARKWEB_INVALID_COOKIE_VALUE = 17100104
const TEST_ARKWEB_LIBRARY_OPEN_FAILURE = 17100105;
const TEST_ARKWEB_LIBRARY_SYMBOL_NOT_FOUND = 17100106;
const TEST_ARKWEB_COOKIE_MANAGER_NOT_INITIALIZED = 17100107;


export default function NativeInterfaceTest() {
  describe('NativeInterfaceTest', () => {
    beforeAll(async (done: Function) => {
      done()
    });

    beforeEach(async (done: Function) => {
      console.info("WebNapiLoadDataTest beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      done();
    })

    /**
     * @tc.number  : SUB_WEB_NET_NAPI_LoadData_0100
     * @tc.name    : testWebNapiLoadDataNotInit
     * @tc.desc    : test OH_NativeArkWeb_LoadData() not init
     * @tc.level   : Level2
     * @tc.size    : SMALLTEST
     * @tc.type    : Function
     */
    it('testWebNapiLoadDataNotInit', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>testWebNapiLoadDataNotInit start====");
        let result: number = nativeInterface.NativeArkWebLoadDataInitError();
        console.info("====>testWebNapiLoadDataNotInit result====", result);
        expect(result).assertEqual(TEST_ARKWEB_INIT_ERROR);
        done();
      } catch (err) {
        console.error("====>testWebNapiLoadDataNotInit catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_WEB_NET_NAPI_LoadData_0200
     * @tc.name    : testWebNapiLoadDataSuccess
     * @tc.desc    : test OH_NativeArkWeb_LoadData() SUCCESS
     * @tc.level   : Level2
     * @tc.size    : SMALLTEST
     * @tc.type    : Function
     */
    it('testWebNapiLoadDataSuccess', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>testWebNapiLoadDataSuccess start====");
        let result: number = nativeInterface.loadData("web1211", 0);
        console.info("====>testWebNapiLoadDataSuccess result====", result);
        expect(result).assertEqual(TEST_ARKWEB_SUCCESS);
        console.info("====>testWebNapiLoadDataSuccess stop====");
        done();
      } catch (err) {
        console.error("====>testWebNapiLoadDataSuccess catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_WEB_NET_NAPI_LoadData_0300
     * @tc.name    : testWebNapiLoadDataSymbolNotFound
     * @tc.desc    : test OH_NativeArkWeb_LoadData() ARKWEB_LIBRARY_SYMBOL_NOT_FOUND
     * @tc.level   : Level2
     * @tc.size    : SMALLTEST
     * @tc.type    : Function
     */
    it('testWebNapiLoadDataSymbolNotFound', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>testWebNapiLoadDataSymbolNotFound start====");
        let result: number = nativeInterface.loadData("web1211", 1);
        console.info("====>testWebNapiLoadDataSymbolNotFound result====", result);
        // expect(result).assertEqual(TEST_ARKWEB_LIBRARY_SYMBOL_NOT_FOUND);
        console.info("====>testWebNapiLoadDataSymbolNotFound stop====");
        done();
      } catch (err) {
        console.error("====>testWebNapiLoadDataSymbolNotFound catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_WEB_NET_NAPI_LoadData_0400
     * @tc.name    : testWebNapiLoadDataInvalidParam
     * @tc.desc    : test OH_NativeArkWeb_LoadData() ARKWEB_INVALID_PARAM
     * @tc.level   : Level2
     * @tc.size    : SMALLTEST
     * @tc.type    : Function
     */
    it('testWebNapiLoadDataInvalidParam', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>testWebNapiLoadDataInvalidParam start====");
        let result: number = nativeInterface.loadData("web1211", 2);
        console.info("====>testWebNapiLoadDataInvalidParam result====", result);
        // expect(result).assertEqual(0);
        console.info("====>testWebNapiLoadDataInvalidParam stop====");
        done();
      } catch (err) {
        console.error("====>testWebNapiLoadDataInvalidParam catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_WEB_NET_NAPI_BlankInfo_0100
     * @tc.name    : testWebNapiSetBlanklessInfoNotInit
     * @tc.desc    : test OH_NativeArkWeb_SetBlanklessLoadingWithKey()
     * @tc.level   : Level2
     * @tc.size    : SMALLTEST
     * @tc.type    : Function
     */
    it('testWebNapiSetBlanklessInfoNotInit', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiSetBlanklessInfoNotInit start====");
          let result: number = nativeInterface.SetBlanklessInfo('new', '0731');
          expect(result).assertEqual(0);
          console.info("====>testWebNapiSetBlanklessInfoNotInit stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiSetBlanklessInfoNotInit catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_WEB_NET_NAPI_BlankInfo_0200
     * @tc.name    : testWebNapiSetBlanklessInfoSuccess
     * @tc.desc    : test OH_NativeArkWeb_SetBlanklessLoadingWithKey()
     * @tc.level   : Level2
     * @tc.size    : SMALLTEST
     * @tc.type    : Function
     */
    it('testWebNapiSetBlanklessInfoSuccess', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiSetBlanklessInfoSuccess start====");
          let result: number = nativeInterface.SetBlanklessInfo('web1211', '0731');
          expect(result).assertEqual(0);
          console.info("====>testWebNapiSetBlanklessInfoSuccess stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiSetBlanklessInfoSuccess catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_WEB_NET_NAPI_BlankInfo_0300
     * @tc.name    : testWebNapiSetBlanklessInfoNokey
     * @tc.desc    : test OH_NativeArkWeb_SetBlanklessLoadingWithKey()
     * @tc.level   : Level2
     * @tc.size    : SMALLTEST
     * @tc.type    : Function
     */
    it('testWebNapiSetBlanklessInfoNokey', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiSetBlanklessInfoNokey start====");
          let result: number = nativeInterface.SetBlanklessInfo('web1211', 'xxxxxx');
          expect(result).assertEqual(0);
          console.info("====>testWebNapiSetBlanklessInfoNokey stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiSetBlanklessInfoNokey catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_WEB_NET_NAPI_BlankInfo_0400
     * @tc.name    : testWebNapiGetBlanklessInfo
     * @tc.desc    : test OH_NativeArkWeb_SetBlanklessLoadingWithKey()
     * @tc.level   : Level2
     * @tc.size    : SMALLTEST
     * @tc.type    : Function
     */
    it('testWebNapiGetBlanklessInfo', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiGetBlanklessInfo start====");
          nativeInterface.SetBlanklessInfo('web1211', '0731');
          let result: number = nativeInterface.GetBlanklessInfo('web1211', '0731');
          expect(result).assertEqual(0);
          console.info("====>testWebNapiGetBlanklessInfo stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiGetBlanklessInfo catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_WEB_NET_NAPI_JSBridgeData_0100
     * @tc.name    : testWebNapiJSBridgeDataCallback
     * @tc.desc    : test ArkWeb_JavaScriptBridgeData and ArkWeb_OnJavaScriptCallback
     * @tc.level   : Level2
     * @tc.size    : SMALLTEST
     * @tc.type    : Function
     */
    it('testWebNapiJSBridgeDataCallback', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiJSBridgeDataCallback start====");
          let result: number = nativeInterface.JSBridgeData(0);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiJSBridgeDataCallback stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiJSBridgeDataCallback catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_WEB_NET_NAPI_JSBridgeData_0200
     * @tc.name    : testWebNapiJSBridgeCallbackNullUser
     * @tc.desc    : test ArkWeb_JavaScriptBridgeData and ArkWeb_OnJavaScriptCallback
     * @tc.level   : Level2
     * @tc.size    : SMALLTEST
     * @tc.type    : Function
     */
    it('testWebNapiJSBridgeCallbackNullUser', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiJSBridgeCallbackNullUser start====");
          let result: number = nativeInterface.JSBridgeData(1);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiJSBridgeCallbackNullUser stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiJSBridgeCallbackNullUser catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_WEB_NET_NAPI_JSBridgeData_0300
     * @tc.name    : testWebNapiJSBridgeCallbackNullData
     * @tc.desc    : test ArkWeb_JavaScriptBridgeData and ArkWeb_OnJavaScriptCallback
     * @tc.level   : Level2
     * @tc.size    : SMALLTEST
     * @tc.type    : Function
     */
    it('testWebNapiJSBridgeCallbackNullData', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiJSBridgeCallbackNullData start====");
          let result: number = nativeInterface.JSBridgeData(2);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiJSBridgeCallbackNullData stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiJSBridgeCallbackNullData catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_WEB_NET_NAPI_JSBridgeData_0400
     * @tc.name    : testWebNapiJSBridgeCallbackNullWeb
     * @tc.desc    : test ArkWeb_JavaScriptBridgeData and ArkWeb_OnJavaScriptCallback
     * @tc.level   : Level2
     * @tc.size    : SMALLTEST
     * @tc.type    : Function
     */
    it('testWebNapiJSBridgeCallbackNullWeb', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiJSBridgeCallbackNullWeb start====");
          let result: number = nativeInterface.JSBridgeData(3);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiJSBridgeCallbackNullWeb stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiJSBridgeCallbackNullWeb catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_WEB_NET_NAPI_JSBridgeProxy_0100
     * @tc.name    : testWebNapiJSBridgeProxyData
     * @tc.desc    : test ArkWeb_JavaScriptBridgeData and ArkWeb_OnJavaScriptProxyCallback
     * @tc.level   : Level2
     * @tc.size    : SMALLTEST
     * @tc.type    : Function
     */
    it('testWebNapiJSBridgeProxyData', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiJSBridgeProxyData start====");
          let result: number = nativeInterface.JSBridgeProxyData(0);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiJSBridgeProxyData stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiJSBridgeProxyData catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_WEB_NET_NAPI_JSBridgeProxy_0200
     * @tc.name    : testWebNapiJSBridgeProxyDataLen
     * @tc.desc    : test ArkWeb_JavaScriptBridgeData and ArkWeb_OnJavaScriptProxyCallback
     * @tc.level   : Level2
     * @tc.size    : SMALLTEST
     * @tc.type    : Function
     */
    it('testWebNapiJSBridgeProxyDataLen', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiJSBridgeProxyData start====");
          let result: number = nativeInterface.JSBridgeProxyData(1);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiJSBridgeProxyData stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiJSBridgeProxyData catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_WEB_NET_NAPI_JSBridgeProxy_0300
     * @tc.name    : testWebNapiJSBridgeProxyNullData
     * @tc.desc    : test ArkWeb_JavaScriptBridgeData and ArkWeb_OnJavaScriptProxyCallback
     * @tc.level   : Level2
     * @tc.size    : SMALLTEST
     * @tc.type    : Function
     */
    it('testWebNapiJSBridgeProxyNullData', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiJSBridgeProxyNullData start====");
          let result: number = nativeInterface.JSBridgeProxyData(2);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiJSBridgeProxyNullData stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiJSBridgeProxyNullData catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_WEB_NET_NAPI_JSBridgeProxy_0400
     * @tc.name    : testWebNapiJSBridgeProxyNullUser
     * @tc.desc    : test ArkWeb_JavaScriptBridgeData and ArkWeb_OnJavaScriptProxyCallback
     * @tc.level   : Level2
     * @tc.size    : SMALLTEST
     * @tc.type    : Function
     */
    it('testWebNapiJSBridgeProxyNullUser', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiJSBridgeProxyNullUser start====");
          let result: number = nativeInterface.JSBridgeProxyData(3);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiJSBridgeProxyNullUser stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiJSBridgeProxyNullUser catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_WEB_NET_NAPI_JSBridgeProxy_0500
     * @tc.name    : testWebNapiJSBridgeProxyNullWeb
     * @tc.desc    : test ArkWeb_JavaScriptBridgeData and ArkWeb_OnJavaScriptProxyCallback
     * @tc.level   : Level2
     * @tc.size    : SMALLTEST
     * @tc.type    : Function
     */
    it('testWebNapiJSBridgeProxyNullWeb', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiJSBridgeProxyNullWeb start====");
          let result: number = nativeInterface.JSBridgeProxyData(4);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiJSBridgeProxyNullWeb stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiJSBridgeProxyNullWeb catch err: " + err);
        }
      })
  })
}