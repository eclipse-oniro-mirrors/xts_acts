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
     * @tc.name   testWebNapiLoadDataSuccess
     * @tc.number SUB_WEB_NET_NAPI_LoadData_0100
     * @tc.desc   test OH_NativeArkWeb_LoadData() SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
        expect(true).assertEqual(false);
        done();
      }
    })

    /**
     * @tc.name   testWebNapiLoadDataNotInit
     * @tc.number SUB_WEB_NET_NAPI_LoadData_0200
     * @tc.desc   test OH_NativeArkWeb_LoadData() not init
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiLoadDataNotInit', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>testWebNapiLoadDataNotInit start====");
        let result: number = nativeInterface.loadData("web1211", 1);
        console.info("====>testWebNapiLoadDataNotInit result====", result);
        expect(result).assertEqual(TEST_ARKWEB_INIT_ERROR);
        done();
      } catch (err) {
        console.error("====>testWebNapiLoadDataNotInit catch err: " + err);
        expect(true).assertEqual(false);
        done();
      }
    })

    /**
     * @tc.name   testWebNapiLoadDataNoData
     * @tc.number SUB_WEB_NET_NAPI_LoadData_0300
     * @tc.desc   test OH_NativeArkWeb_LoadData()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiLoadDataNoData', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
      try {
        console.info("====>testWebNapiLoadDataNoData start====");
        let result: number = nativeInterface.loadData("web1211", 2);
        console.info("====>testWebNapiLoadDataNoData result====", result);
        expect(result).assertEqual(TEST_ARKWEB_SUCCESS);
        console.info("====>testWebNapiLoadDataNoData stop====");
        done();
      } catch (err) {
        console.error("====>testWebNapiLoadDataNoData catch err: " + err);
        expect(true).assertEqual(false);
        done();
      }
    })

    /**
     * @tc.name   testWebNapiLoadDataNoType
     * @tc.number SUB_WEB_NET_NAPI_LoadData_0400
     * @tc.desc   test OH_NativeArkWeb_LoadData()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiLoadDataNoType', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiLoadDataNoType start====");
          let result: number = nativeInterface.loadData("web1211", 3);
          console.info("====>testWebNapiLoadDataNoType result====", result);
          expect(result).assertEqual(TEST_ARKWEB_SUCCESS);
          console.info("====>testWebNapiLoadDataNoType stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiLoadDataNoType catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiLoadDataNoEncode
     * @tc.number SUB_WEB_NET_NAPI_LoadData_0500
     * @tc.desc   test OH_NativeArkWeb_LoadData()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiLoadDataNoEncode', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiLoadDataNoEncode start====");
          let result: number = nativeInterface.loadData("web1211", 4);
          console.info("====>testWebNapiLoadDataNoEncode result====", result);
          expect(result).assertEqual(TEST_ARKWEB_SUCCESS);
          console.info("====>testWebNapiLoadDataNoEncode stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiLoadDataNoType catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiGetBlanklessInfoSuccess
     * @tc.number SUB_WEB_NET_NAPI_BlankInfo_0100
     * @tc.desc   test OH_NativeArkWeb_SetBlanklessLoadingWithKey()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiGetBlanklessInfoSuccess', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiGetBlanklessInfoSuccess start====");
          let result: number = nativeInterface.GetBlanklessInfo('web1211', 0);
          expect([0, 801]).assertContain(result);
          console.info("====>testWebNapiGetBlanklessInfoSuccess stop====", result);
          done();
        } catch (err) {
          console.error("====>testWebNapiGetBlanklessInfoSuccess catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiGetBlanklessInfoNewkey
     * @tc.number SUB_WEB_NET_NAPI_BlankInfo_0200
     * @tc.desc   test OH_NativeArkWeb_GetBlanklessInfoWithKey()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiGetBlanklessInfoNewkey', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiGetBlanklessInfoNewkey start====");
          let result: number = nativeInterface.GetBlanklessInfo('web1211', 1);
          expect([0, 801]).assertContain(result);
          console.info("====>testWebNapiGetBlanklessInfoNewkey stop====", result);
          done();
        } catch (err) {
          console.error("====>testWebNapiGetBlanklessInfoNewkey catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiGetBlanklessInfoNullkey
     * @tc.number SUB_WEB_NET_NAPI_BlankInfo_0300
     * @tc.desc   test OH_NativeArkWeb_GetBlanklessInfoWithKey()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiGetBlanklessInfoNullkey', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiGetBlanklessInfoNullkey start====");
          let result: number = nativeInterface.GetBlanklessInfo('web1211', 2);
          expect([-2, 801]).assertContain(result);
          console.info("====>testWebNapiGetBlanklessInfoNullkey stop====", result);
          done();
        } catch (err) {
          console.error("====>testWebNapiGetBlanklessInfoNullkey catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiGetBlanklessInfoNullWeb
     * @tc.number SUB_WEB_NET_NAPI_BlankInfo_0400
     * @tc.desc   test OH_NativeArkWeb_GetBlanklessInfoWithKey()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiGetBlanklessInfoNullWeb', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiGetBlanklessInfoNullWeb start====");
          let result: number = nativeInterface.GetBlanklessInfo('web1211', 3);
          expect([-3, 801]).assertContain(result);
          console.info("====>testWebNapiGetBlanklessInfoNullWeb stop====", result);
          done();
        } catch (err) {
          console.error("====>testWebNapiGetBlanklessInfoNullWeb catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiSetBlanklessInfoNotInit
     * @tc.number SUB_WEB_NET_NAPI_BlankInfo_0500
     * @tc.desc   test OH_NativeArkWeb_SetBlanklessLoadingWithKey()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiSetBlanklessInfoNotInit', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiSetBlanklessInfoNotInit start====");
          let result: number = nativeInterface.SetBlanklessInfo('web1211', 0);
          expect([-3, 801]).assertContain(result);
          console.info("====>testWebNapiSetBlanklessInfoNotInit stop====", result);
          done();
        } catch (err) {
          console.error("====>testWebNapiSetBlanklessInfoNotInit catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiSetBlanklessInfoSuccess
     * @tc.number SUB_WEB_NET_NAPI_BlankInfo_0600
     * @tc.desc   test OH_NativeArkWeb_SetBlanklessLoadingWithKey()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiSetBlanklessInfoSuccess', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiSetBlanklessInfoSuccess start====");
          let result: number = nativeInterface.SetBlanklessInfo('web1211', 1);
          // timeout -1?
          expect([0, -5, 801]).assertContain(result);
          console.info("====>testWebNapiSetBlanklessInfoSuccess stop====", result);
          done();
        } catch (err) {
          console.error("====>testWebNapiSetBlanklessInfoSuccess catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiSetBlanklessInfoNokey
     * @tc.number SUB_WEB_NET_NAPI_BlankInfo_0700
     * @tc.desc   test OH_NativeArkWeb_SetBlanklessLoadingWithKey()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiSetBlanklessInfoNokey', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiSetBlanklessInfoNokey start====");
          let result: number = nativeInterface.SetBlanklessInfo('web1211', 2);
          expect([801,-4,-5]).assertContain(result);
          console.info("====>testWebNapiSetBlanklessInfoNokey stop====", result);
          done();
        } catch (err) {
          console.error("====>testWebNapiSetBlanklessInfoNokey catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiSetBlanklessInfoTrue
     * @tc.number SUB_WEB_NET_NAPI_BlankInfo_0800
     * @tc.desc   test OH_NativeArkWeb_SetBlanklessLoadingWithKey()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiSetBlanklessInfoTrue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiSetBlanklessInfoTrue start====");
          let result: number = nativeInterface.SetBlanklessInfo('web1211', 3);
          expect([0, -5, 801]).assertContain(result);
          console.info("====>testWebNapiSetBlanklessInfoTrue stop====", result);
          done();
        } catch (err) {
          console.error("====>testWebNapiSetBlanklessInfoTrue catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiSetBlanklessInfoNullWeb
     * @tc.number SUB_WEB_NET_NAPI_BlankInfo_0900
     * @tc.desc   test OH_NativeArkWeb_SetBlanklessLoadingWithKey()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiSetBlanklessInfoNullWeb', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiSetBlanklessInfoNullWeb start====");
          let result: number = nativeInterface.SetBlanklessInfo('web1211', 4);
          expect([-3, 801]).assertContain(result);
          console.info("====>testWebNapiSetBlanklessInfoNullWeb stop====", result);
          done();
        } catch (err) {
          console.error("====>testWebNapiSetBlanklessInfoNullWeb catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiSetBlanklessInfoNullKey
     * @tc.number SUB_WEB_NET_NAPI_BlankInfo_1000
     * @tc.desc   test OH_NativeArkWeb_SetBlanklessLoadingWithKey()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiSetBlanklessInfoNullKey', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiSetBlanklessInfoNullKey start====");
          let result: number = nativeInterface.SetBlanklessInfo('web1211', 5);
          expect([-2, 801]).assertContain(result);
          console.info("====>testWebNapiSetBlanklessInfoNullKey stop====", result);
          done();
        } catch (err) {
          console.error("====>testWebNapiSetBlanklessInfoNullKey catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiJSBridgeDataCallback
     * @tc.number SUB_WEB_NET_NAPI_JSBridgeData_0100
     * @tc.desc   test ArkWeb_JavaScriptBridgeData and ArkWeb_OnJavaScriptCallback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiJSBridgeCallbackNullUser
     * @tc.number SUB_WEB_NET_NAPI_JSBridgeData_0200
     * @tc.desc   test ArkWeb_JavaScriptBridgeData and ArkWeb_OnJavaScriptCallback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiJSBridgeCallbackNullData
     * @tc.number SUB_WEB_NET_NAPI_JSBridgeData_0300
     * @tc.desc   test ArkWeb_JavaScriptBridgeData and ArkWeb_OnJavaScriptCallback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiJSBridgeCallbackNullWeb
     * @tc.number SUB_WEB_NET_NAPI_JSBridgeData_0400
     * @tc.desc   test ArkWeb_JavaScriptBridgeData and ArkWeb_OnJavaScriptCallback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiJSBridgeProxyData
     * @tc.number SUB_WEB_NET_NAPI_JSBridgeProxy_0100
     * @tc.desc   test ArkWeb_JavaScriptBridgeData and ArkWeb_OnJavaScriptProxyCallback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiJSBridgeProxyDataLen
     * @tc.number SUB_WEB_NET_NAPI_JSBridgeProxy_0200
     * @tc.desc   test ArkWeb_JavaScriptBridgeData and ArkWeb_OnJavaScriptProxyCallback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiJSBridgeProxyNullData
     * @tc.number SUB_WEB_NET_NAPI_JSBridgeProxy_0300
     * @tc.desc   test ArkWeb_JavaScriptBridgeData and ArkWeb_OnJavaScriptProxyCallback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiJSBridgeProxyNullUser
     * @tc.number SUB_WEB_NET_NAPI_JSBridgeProxy_0400
     * @tc.desc   test ArkWeb_JavaScriptBridgeData and ArkWeb_OnJavaScriptProxyCallback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiJSBridgeProxyNullWeb
     * @tc.number SUB_WEB_NET_NAPI_JSBridgeProxy_0500
     * @tc.desc   test ArkWeb_JavaScriptBridgeData and ArkWeb_OnJavaScriptProxyCallback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiWebMsgTypeEnumNone
     * @tc.number SUB_Web_Napi_WebMsgTypeTest_0100
     * @tc.desc   test ArkWeb_WebMessageType ARKWEB_NONE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiWebMsgTypeEnumNone', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiWebMsgTypeEnumNone start====");
          let result: number = nativeInterface.WebMsgType(0);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiWebMsgTypeEnumNone stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiWebMsgTypeEnumNone catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiWebMsgTypeEnumString
     * @tc.number SUB_Web_Napi_WebMsgTypeTest_0200
     * @tc.desc   test ArkWeb_WebMessageType ARKWEB_STRING
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiWebMsgTypeEnumString', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiWebMsgTypeEnumString start====");
          let result: number = nativeInterface.WebMsgType(1);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiWebMsgTypeEnumString stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiWebMsgTypeEnumString catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiWebMsgTypeEnumBuffer
     * @tc.number SUB_Web_Napi_WebMsgTypeTest_0300
     * @tc.desc   test ArkWeb_WebMessageType ARKWEB_BUFFER
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiWebMsgTypeEnumBuffer', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiWebMsgTypeEnumBuffer start====");
          let result: number = nativeInterface.WebMsgType(2);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiWebMsgTypeEnumBuffer stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiWebMsgTypeEnumBuffer catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiWebMsgApiSize
     * @tc.number SUB_Web_Napi_WebMsgApiTest_0100
     * @tc.desc   test ArkWeb_WebMessageAPI interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiWebMsgApiSize', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiWebMsgApiSize start====");
          let result: number = nativeInterface.WebMsgAPI(0);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiWebMsgApiSize stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiWebMsgApiSize catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiWebMsgApiCreate
     * @tc.number SUB_Web_Napi_WebMsgApiTest_0200
     * @tc.desc   test ArkWeb_WebMessageAPI interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiWebMsgApiCreate', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiWebMsgApiCreate start====");
          let result: number = nativeInterface.WebMsgAPI(1);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiWebMsgApiCreate stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiWebMsgApiCreate catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiWebMsgApiDestroy
     * @tc.number SUB_Web_Napi_WebMsgApiTest_0300
     * @tc.desc   test ArkWeb_WebMessageAPI interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiWebMsgApiDestroy', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiWebMsgApiDestroy start====");
          let result: number = nativeInterface.WebMsgAPI(2);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiWebMsgApiDestroy stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiWebMsgApiDestroy catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiWebMsgApiSetType
     * @tc.number SUB_Web_Napi_WebMsgApiTest_0400
     * @tc.desc   test ArkWeb_WebMessageAPI interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiWebMsgApiSetType', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiWebMsgApiSetType start====");
          let result: number = nativeInterface.WebMsgAPI(3);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiWebMsgApiSetType stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiWebMsgApiSetType catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiWebMsgApiGetType
     * @tc.number SUB_Web_Napi_WebMsgApiTest_0500
     * @tc.desc   test ArkWeb_WebMessageAPI interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiWebMsgApiGetType', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiWebMsgApiGetType start====");
          let result: number = nativeInterface.WebMsgAPI(4);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiWebMsgApiGetType stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiWebMsgApiGetType catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiWebMsgApiSetData
     * @tc.number SUB_Web_Napi_WebMsgApiTest_0600
     * @tc.desc   test ArkWeb_WebMessageAPI interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiWebMsgApiSetData', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiWebMsgApiSetData start====");
          let result: number = nativeInterface.WebMsgAPI(5);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiWebMsgApiSetData stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiWebMsgApiSetData catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiWebMsgApiGetData
     * @tc.number SUB_Web_Napi_WebMsgApiTest_0700
     * @tc.desc   test ArkWeb_WebMessageAPI interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiWebMsgApiGetData', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiWebMsgApiGetData start====");
          let result: number = nativeInterface.WebMsgAPI(6);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiWebMsgApiGetData stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiWebMsgApiGetData catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiWebJSValueApiSize
     * @tc.number SUB_Web_Napi_WebJSValueApiTest_0100
     * @tc.desc   test ArkWeb_JavaScriptValueAPI interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiWebJSValueApiSize', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiWebJSValueApiSize start====");
          let result: number = nativeInterface.WebJSValueAPI(0);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiWebJSValueApiSize stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiWebJSValueApiSize catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiWebJSValueApiCreate
     * @tc.number SUB_Web_Napi_WebJSValueApiTest_0200
     * @tc.desc   test ArkWeb_JavaScriptValueAPI interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiWebJSValueApiCreate', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiWebJSValueApiCreate start====");
          let result: number = nativeInterface.WebJSValueAPI(1);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiWebJSValueApiCreate stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiWebJSValueApiCreate catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiWebJSValueEnumNone
     * @tc.number SUB_Web_Napi_WebJSValue_0100
     * @tc.desc   test ArkWeb_JavaScriptValueType ARKWEB_JAVASCRIPT_NONE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiWebJSValueEnumNone', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiWebJSValueEnumNone start====");
          let result: number = nativeInterface.WebJSValueType(0);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiWebJSValueEnumNone stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiWebJSValueEnumNone catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiWebJSValueEnumString
     * @tc.number SUB_Web_Napi_WebJSValue_0200
     * @tc.desc   test ArkWeb_JavaScriptValueType ARKWEB_JAVASCRIPT_STRING
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiWebJSValueEnumString', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiWebJSValueEnumString start====");
          let result: number = nativeInterface.WebJSValueType(1);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiWebJSValueEnumString stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiWebJSValueEnumString catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiWebJSValueEnumBool
     * @tc.number SUB_Web_Napi_WebJSValue_0300
     * @tc.desc   test ArkWeb_JavaScriptValueType ARKWEB_JAVASCRIPT_BOOL
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiWebJSValueEnumBool', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiWebJSValueEnumBool start====");
          let result: number = nativeInterface.WebJSValueType(2);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiWebJSValueEnumBool stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiWebJSValueEnumBool catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiControllerAPISize
     * @tc.number SUB_Web_Napi_WebCtrlAPI_0100
     * @tc.desc   test ArkWeb_ControllerAPI interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiControllerAPISize', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiControllerAPISize start====");
          let result: number = nativeInterface.WebControllerAPI(0);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiControllerAPISize stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiControllerAPISize catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiControllerAPIRunJS
     * @tc.number SUB_Web_Napi_WebCtrlAPI_0200
     * @tc.desc   test ArkWeb_ControllerAPI interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiControllerAPIRunJS', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiControllerAPIRunJS start====");
          let result: number = nativeInterface.WebControllerAPI(1);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiControllerAPIRunJS stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiControllerAPIRunJS catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiControllerRegJSProxy
     * @tc.number SUB_Web_Napi_WebCtrlAPI_0300
     * @tc.desc   test ArkWeb_ControllerAPI interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiControllerRegJSProxy', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiControllerRegJSProxy start====");
          let result: number = nativeInterface.WebControllerAPI(2);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiControllerRegJSProxy stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiControllerRegJSProxy catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiControllerDelJSProxy
     * @tc.number SUB_Web_Napi_WebCtrlAPI_0400
     * @tc.desc   test ArkWeb_ControllerAPI interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiControllerDelJSProxy', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiControllerDelJSProxy start====");
          let result: number = nativeInterface.WebControllerAPI(3);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiControllerDelJSProxy stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiControllerRegJSProxy catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiControllerRefresh
     * @tc.number SUB_Web_Napi_WebCtrlAPI_0500
     * @tc.desc   test ArkWeb_ControllerAPI interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiControllerRefresh', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiControllerRefresh start====");
          let result: number = nativeInterface.WebControllerAPI(4);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiControllerRefresh stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiControllerRefresh catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiControllerRegAsyncJSProxy
     * @tc.number SUB_Web_Napi_WebCtrlAPI_0600
     * @tc.desc   test ArkWeb_ControllerAPI interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiControllerRegAsyncJSProxy', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiControllerRegAsyncJSProxy start====");
          let result: number = nativeInterface.WebControllerAPI(5);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiControllerRegAsyncJSProxy stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiControllerRegAsyncJSProxy catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiControllerCreateWebMsgPort
     * @tc.number SUB_Web_Napi_WebCtrlAPI_0700
     * @tc.desc   test ArkWeb_ControllerAPI interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiControllerCreateWebMsgPort', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiControllerCreateWebMsgPort start====");
          let result: number = nativeInterface.WebControllerAPI(6);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiControllerCreateWebMsgPort stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiControllerCreateWebMsgPort catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiControllerDestroyWebMsgPort
     * @tc.number SUB_Web_Napi_WebCtrlAPI_0800
     * @tc.desc   test ArkWeb_ControllerAPI interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiControllerDestroyWebMsgPort', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiControllerDestroyWebMsgPort start====");
          let result: number = nativeInterface.WebControllerAPI(7);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiControllerDestroyWebMsgPort stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiControllerDestroyWebMsgPort catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiControllerPostWebMsg
     * @tc.number SUB_Web_Napi_WebCtrlAPI_0900
     * @tc.desc   test ArkWeb_ControllerAPI interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiControllerPostWebMsg', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiControllerPostWebMsg start====");
          let result: number = nativeInterface.WebControllerAPI(8);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiControllerPostWebMsg stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiControllerPostWebMsg catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiControllerGetLast
     * @tc.number SUB_Web_Napi_WebCtrlAPI_1000
     * @tc.desc   test ArkWeb_ControllerAPI interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiControllerGetLast', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiControllerGetLast start====");
          let result: number = nativeInterface.WebControllerAPI(9);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiControllerGetLast stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiControllerGetLast catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiControllerRegJSProxyEX
     * @tc.number SUB_Web_Napi_WebCtrlAPI_1100
     * @tc.desc   test ArkWeb_ControllerAPI interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiControllerRegJSProxyEX', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiControllerRegJSProxyEX start====");
          let result: number = nativeInterface.WebControllerAPI(10);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiControllerRegJSProxyEX stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiControllerRegJSProxyEX catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiControllerRegAsyncJSProxyEX
     * @tc.number SUB_Web_Napi_WebCtrlAPI_1200
     * @tc.desc   test ArkWeb_ControllerAPI interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiControllerRegAsyncJSProxyEX', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiControllerRegAsyncJSProxyEX start====");
          let result: number = nativeInterface.WebControllerAPI(11);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiControllerRegAsyncJSProxyEX stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiControllerRegAsyncJSProxyEX catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })

    /**
     * @tc.name   testWebNapiJSObjectSize
     * @tc.number SUB_Web_Napi_JSObject_0100
     * @tc.desc   test ArkWeb_JavaScriptObject interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiJSObjectSize', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiJSObjectSize start====");
          let result: number = nativeInterface.WebJSObject(0);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiJSObjectSize stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiJSObjectSize catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiJSObjectBuffer
     * @tc.number SUB_Web_Napi_JSObject_0200
     * @tc.desc   test ArkWeb_JavaScriptObject interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiJSObjectBuffer', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiJSObjectBuffer start====");
          let result: number = nativeInterface.WebJSObject(1);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiJSObjectBuffer stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiJSObjectBuffer catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiJSObjectCallback
     * @tc.number SUB_Web_Napi_JSObject_0300
     * @tc.desc   test ArkWeb_JavaScriptObject interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiJSObjectCallback', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiJSObjectCallback start====");
          let result: number = nativeInterface.WebJSObject(2);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiJSObjectCallback stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiJSObjectCallback catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiJSObjectUserData
     * @tc.number SUB_Web_Napi_JSObject_0400
     * @tc.desc   test ArkWeb_JavaScriptObject interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiJSObjectUserData', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiJSObjectUserData start====");
          let result: number = nativeInterface.WebJSObject(3);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiJSObjectUserData stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiJSObjectUserData catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiProxyMethodName
     * @tc.number SUB_Web_Napi_ProxyMethod_0100
     * @tc.desc   test ArkWeb_ProxyMethod struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiProxyMethodName', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiProxyMethodName start====");
          let result: number = nativeInterface.WebStructProxyMethod(0);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiProxyMethodName stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiProxyMethodName catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiProxyMethodCallback
     * @tc.number SUB_Web_Napi_ProxyMethod_0200
     * @tc.desc   test ArkWeb_ProxyMethod struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiProxyMethodCallback', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiProxyMethodCallback start====");
          let result: number = nativeInterface.WebStructProxyMethod(1);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiProxyMethodCallback stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiProxyMethodCallback catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiProxyMethodUserdata
     * @tc.number SUB_Web_Napi_ProxyMethod_0300
     * @tc.desc   test ArkWeb_ProxyMethod struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiProxyMethodUserdata', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiProxyMethodUserdata start====");
          let result: number = nativeInterface.WebStructProxyMethod(2);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiProxyMethodUserdata stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiProxyMethodUserdata catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiProxyMethodWithResultName
     * @tc.number SUB_Web_Napi_ProxyMethodWithResult_0100
     * @tc.desc   test ArkWeb_ProxyMethodWithResult struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiProxyMethodWithResultName', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiProxyMethodWithResultName start====");
          let result: number = nativeInterface.WebStructProxyMethodWithResult(0);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiProxyMethodWithResultName stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiProxyMethodWithResultName catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiProxyMethodWithResultCallback
     * @tc.number SUB_Web_Napi_ProxyMethodWithResult_0200
     * @tc.desc   test ArkWeb_ProxyMethodWithResult struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiProxyMethodWithResultCallback', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiProxyMethodWithResultCallback start====");
          let result: number = nativeInterface.WebStructProxyMethodWithResult(1);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiProxyMethodWithResultCallback stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiProxyMethodWithResultCallback catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiProxyMethodWithResultUserdata
     * @tc.number SUB_Web_Napi_ProxyMethodWithResult_0300
     * @tc.desc   test ArkWeb_ProxyMethodWithResult struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiProxyMethodWithResultUserdata', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiProxyMethodWithResultUserdata start====");
          let result: number = nativeInterface.WebStructProxyMethodWithResult(2);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiProxyMethodWithResultUserdata stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiProxyMethodWithResultUserdata catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiProxyObjectName
     * @tc.number SUB_Web_Napi_ProxyObject_0100
     * @tc.desc   test ArkWeb_ProxyObject struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiProxyObjectName', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiProxyObjectName start====");
          let result: number = nativeInterface.WebStructProxyObject(0);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiProxyObjectName stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiProxyObjectName catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiProxyObjectMethodList
     * @tc.number SUB_Web_Napi_ProxyObject_0200
     * @tc.desc   test ArkWeb_ProxyObject struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiProxyObjectMethodList', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiProxyObjectMethodList start====");
          let result: number = nativeInterface.WebStructProxyObject(1);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiProxyObjectMethodList stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiProxyObjectMethodList catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiProxyObjectSize
     * @tc.number SUB_Web_Napi_ProxyObject_0300
     * @tc.desc   test ArkWeb_ProxyObject struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiProxyObjectSize', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiProxyObjectSize start====");
          let result: number = nativeInterface.WebStructProxyObject(2);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiProxyObjectSize stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiProxyObjectSize catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiProxyObjectWithResultName
     * @tc.number SUB_Web_Napi_ProxyObjectWithResult_0100
     * @tc.desc   test ArkWeb_ProxyObject struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiProxyObjectWithResultName', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiProxyObjectWithResultName start====");
          let result: number = nativeInterface.WebStructProxyObjectWithResult(0);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiProxyObjectWithResultName stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiProxyObjectWithResultName catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiProxyObjectWithResultMethodList
     * @tc.number SUB_Web_Napi_ProxyObjectWithResult_0200
     * @tc.desc   test ArkWeb_ProxyObject struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiProxyObjectWithResultMethodList', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiProxyObjectWithResultMethodList start====");
          let result: number = nativeInterface.WebStructProxyObjectWithResult(1);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiProxyObjectWithResultMethodList stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiProxyObjectWithResultMethodList catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiProxyObjectWithResultSize
     * @tc.number SUB_Web_Napi_ProxyObjectWithResult_0300
     * @tc.desc   test ArkWeb_ProxyObject struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiProxyObjectWithResultSize', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiProxyObjectWithResultSize start====");
          let result: number = nativeInterface.WebStructProxyObjectWithResult(2);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiProxyObjectWithResultSize stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiProxyObjectWithResultSize catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiComponentAPISize
     * @tc.number SUB_Web_Napi_ComponentAPI_0100
     * @tc.desc   test ArkWeb_ComponentAPI struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiComponentAPISize', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiComponentAPISize start====");
          let result: number = nativeInterface.WebStructComponentAPI(0);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiComponentAPISize stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiComponentAPISize catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiComponentAPIAttached
     * @tc.number SUB_Web_Napi_ComponentAPI_0200
     * @tc.desc   test ArkWeb_ComponentAPI struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiComponentAPIAttached', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiComponentAPIAttached start====");
          let result: number = nativeInterface.WebStructComponentAPI(1);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiComponentAPIAttached stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiComponentAPIAttached catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiComponentAPIPageBegin
     * @tc.number SUB_Web_Napi_ComponentAPI_0300
     * @tc.desc   test ArkWeb_ComponentAPI struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiComponentAPIPageBegin', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiComponentAPIPageBegin start====");
          let result: number = nativeInterface.WebStructComponentAPI(2);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiComponentAPIPageBegin stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiComponentAPIPageBegin catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiComponentAPIPageEnd
     * @tc.number SUB_Web_Napi_ComponentAPI_0400
     * @tc.desc   test ArkWeb_ComponentAPI struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiComponentAPIPageEnd', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiComponentAPIPageEnd start====");
          let result: number = nativeInterface.WebStructComponentAPI(3);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiComponentAPIPageEnd stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiComponentAPIPageEnd catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiComponentAPIDestroy
     * @tc.number SUB_Web_Napi_ComponentAPI_0500
     * @tc.desc   test ArkWeb_ComponentAPI struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiComponentAPIDestroy', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiComponentAPIDestroy start====");
          let result: number = nativeInterface.WebStructComponentAPI(4);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiComponentAPIDestroy stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiComponentAPIDestroy catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiMessagePortAPISize
     * @tc.number SUB_Web_Napi_MessagePortAPI_0100
     * @tc.desc   test ArkWeb_WebMessagePortAPI struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiMessagePortAPISize', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiMessagePortAPISize start====");
          let result: number = nativeInterface.WebStructMessagePortAPI(0);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiMessagePortAPISize stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiMessagePortAPISize catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiMessagePortAPIPost
     * @tc.number SUB_Web_Napi_MessagePortAPI_0200
     * @tc.desc   test ArkWeb_WebMessagePortAPI struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiMessagePortAPIPost', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiMessagePortAPIPost start====");
          let result: number = nativeInterface.WebStructMessagePortAPI(1);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiMessagePortAPIPost stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiMessagePortAPIPost catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiMessagePortAPIClose
     * @tc.number SUB_Web_Napi_MessagePortAPI_0300
     * @tc.desc   test ArkWeb_WebMessagePortAPI struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiMessagePortAPIClose', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiMessagePortAPIClose start====");
          let result: number = nativeInterface.WebStructMessagePortAPI(2);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiMessagePortAPIClose stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiMessagePortAPIClose catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiMessagePortAPISetHandler
     * @tc.number SUB_Web_Napi_MessagePortAPI_0400
     * @tc.desc   test ArkWeb_WebMessagePortAPI struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiMessagePortAPISetHandler', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiMessagePortAPISetHandler start====");
          let result: number = nativeInterface.WebStructMessagePortAPI(3);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiMessagePortAPISetHandler stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiMessagePortAPISetHandler catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiCookieManagerAPISize
     * @tc.number SUB_Web_Napi_CookieManagerAPI_0100
     * @tc.desc   test ArkWeb_CookieManagerAPI struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiCookieManagerAPISize', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiCookieManagerAPISize start====");
          let result: number = nativeInterface.WebStructCookieManagerAPI(0);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiCookieManagerAPISize stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiCookieManagerAPISize catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiCookieManagerAPIFetch
     * @tc.number SUB_Web_Napi_CookieManagerAPI_0200
     * @tc.desc   test ArkWeb_CookieManagerAPI struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiCookieManagerAPIFetch', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiCookieManagerAPIFetch start====");
          let result: number = nativeInterface.WebStructCookieManagerAPI(1);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiCookieManagerAPIFetch stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiCookieManagerAPIFetch catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiCookieManagerAPIConfig
     * @tc.number SUB_Web_Napi_CookieManagerAPI_0300
     * @tc.desc   test ArkWeb_CookieManagerAPI struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiCookieManagerAPIConfig', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiCookieManagerAPIConfig start====");
          let result: number = nativeInterface.WebStructCookieManagerAPI(2);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiCookieManagerAPIConfig stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiCookieManagerAPIConfig catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiCookieManagerAPIExist
     * @tc.number SUB_Web_Napi_CookieManagerAPI_0400
     * @tc.desc   test ArkWeb_CookieManagerAPI struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiCookieManagerAPIExist', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiCookieManagerAPIExist start====");
          let result: number = nativeInterface.WebStructCookieManagerAPI(3);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiCookieManagerAPIExist stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiCookieManagerAPIExist catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiCookieManagerAPIClearAll
     * @tc.number SUB_Web_Napi_CookieManagerAPI_0500
     * @tc.desc   test ArkWeb_CookieManagerAPI struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiCookieManagerAPIClearAll', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiCookieManagerAPIClearAll start====");
          let result: number = nativeInterface.WebStructCookieManagerAPI(4);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiCookieManagerAPIClearAll stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiCookieManagerAPIClearAll catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiCookieManagerAPIClearSession
     * @tc.number SUB_Web_Napi_CookieManagerAPI_0600
     * @tc.desc   test ArkWeb_CookieManagerAPI struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiCookieManagerAPIClearSession', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiCookieManagerAPIClearSession start====");
          let result: number = nativeInterface.WebStructCookieManagerAPI(5);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiCookieManagerAPIClearSession stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiCookieManagerAPIClearSession catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiJavaScriptValueAPISize
     * @tc.number SUB_Web_Napi_JavaScriptValueAPI_0100
     * @tc.desc   test ArkWeb_JavaScriptValueAPI struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiJavaScriptValueAPISize', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiJavaScriptValueAPISize start====");
          let result: number = nativeInterface.WebStructJavaScriptValueAPI(0);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiJavaScriptValueAPISize stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiJavaScriptValueAPISize catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiJavaScriptValueAPICreate
     * @tc.number SUB_Web_Napi_JavaScriptValueAPI_0200
     * @tc.desc   test ArkWeb_JavaScriptValueAPI struct interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiJavaScriptValueAPICreate', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiJavaScriptValueAPICreate start====");
          let result: number = nativeInterface.WebStructJavaScriptValueAPI(1);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiJavaScriptValueAPICreate stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiJavaScriptValueAPICreate catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiRegisterJSProxyNormal
     * @tc.number SUB_Web_Napi_RegisterJSProxy_0100
     * @tc.desc   test OH_NativeArkWeb_RegisterAsyncThreadJavaScriptProxy interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiRegisterJSProxyNormal', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiRegisterJSProxyNormal start====");
          let result: number = nativeInterface.WebRegisterJSProxy('web1211', 0);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiRegisterJSProxyNormal stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiRegisterJSProxyNormal catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiRegisterJSProxyPermissionNull
     * @tc.number SUB_Web_Napi_RegisterJSProxy_0200
     * @tc.desc   test OH_NativeArkWeb_RegisterAsyncThreadJavaScriptProxy interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiRegisterJSProxyPermissionNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiRegisterJSProxyPermissionNull start====");
          let result: number = nativeInterface.WebRegisterJSProxy('web1211', 1);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiRegisterJSProxyPermissionNull stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiRegisterJSProxyPermissionNull catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiRegisterJSProxyObjectNull
     * @tc.number SUB_Web_Napi_RegisterJSProxy_0300
     * @tc.desc   test OH_NativeArkWeb_RegisterAsyncThreadJavaScriptProxy interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiRegisterJSProxyObjectNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiRegisterJSProxyObjectNull start====");
          let result: number = nativeInterface.WebRegisterJSProxy('web1211', 2);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiRegisterJSProxyObjectNull stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiRegisterJSProxyObjectNull catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiRegisterJSProxyWebNameNew
     * @tc.number SUB_Web_Napi_RegisterJSProxy_0400
     * @tc.desc   test OH_NativeArkWeb_RegisterAsyncThreadJavaScriptProxy interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiRegisterJSProxyWebNameNew', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiRegisterJSProxyWebNameNew start====");
          let result: number = nativeInterface.WebRegisterJSProxy('web1211', 3);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiRegisterJSProxyWebNameNew stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiRegisterJSProxyWebNameNew catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiRegisterJSProxyMethodSize0
     * @tc.number SUB_Web_Napi_RegisterJSProxy_0500
     * @tc.desc   test OH_NativeArkWeb_RegisterAsyncThreadJavaScriptProxy interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiRegisterJSProxyMethodSize0', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiRegisterJSProxyMethodSize0 start====");
          let result: number = nativeInterface.WebRegisterJSProxy('web1211', 4);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiRegisterJSProxyMethodSize0 stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiRegisterJSProxyMethodSize0 catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiClearBlankLessCache0
     * @tc.number SUB_Web_Napi_ClearBlankLessCache_0100
     * @tc.desc   test OH_NativeArkWeb_ClearBlanklessLoadingCache interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiClearBlankLessCache0', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiClearBlankLessCache0 start====");
          let result: number = nativeInterface.WebClearBlankCache(0);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiClearBlankLessCache0 stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiClearBlankLessCache0 catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiClearBlankLessCacheNormal
     * @tc.number SUB_Web_Napi_ClearBlankLessCache_0200
     * @tc.desc   test OH_NativeArkWeb_ClearBlanklessLoadingCache interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiClearBlankLessCacheNormal', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiClearBlankLessCacheNormal start====");
          let result: number = nativeInterface.WebClearBlankCache(1);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiClearBlankLessCacheNormal stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiClearBlankLessCacheNormal catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiClearBlankLessCacheSize100
     * @tc.number SUB_Web_Napi_ClearBlankLessCache_0300
     * @tc.desc   test OH_NativeArkWeb_ClearBlanklessLoadingCache interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiClearBlankLessCacheSize100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiClearBlankLessCacheSize100 start====");
          let result: number = nativeInterface.WebClearBlankCache(2);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiClearBlankLessCacheSize100 stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiClearBlankLessCacheSize100 catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiClearBlankLessCacheSize101
     * @tc.number SUB_Web_Napi_ClearBlankLessCache_0400
     * @tc.desc   test OH_NativeArkWeb_ClearBlanklessLoadingCache interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiClearBlankLessCacheSize101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiClearBlankLessCacheSize101 start====");
          let result: number = nativeInterface.WebClearBlankCache(3);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiClearBlankLessCacheSize101 stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiClearBlankLessCacheSize101 catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiClearBlankLessCacheNullKey
     * @tc.number SUB_Web_Napi_ClearBlankLessCache_0500
     * @tc.desc   test OH_NativeArkWeb_ClearBlanklessLoadingCache interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiClearBlankLessCacheNullKey', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiClearBlankLessCacheNullKey start====");
          let result: number = nativeInterface.WebClearBlankCache(4);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiClearBlankLessCacheNullKey stop====");
          done();
        } catch (err) {
          console.error("====>testWebNapiClearBlankLessCacheNullKey catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiSetBlankCacheCap0
     * @tc.number SUB_Web_Napi_SetBlankCacheCap_0100
     * @tc.desc   test OH_NativeArkWeb_SetBlanklessLoadingCacheCapacity interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiSetBlankCacheCap0', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiSetBlankCacheCap0 start====");
          let result: number = nativeInterface.WebSetBlankCacheCap(0);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiSetBlankCacheCap0 stop====", result);
          done();
        } catch (err) {
          console.error("====>testWebNapiSetBlankCacheCap0 catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiSetBlankCacheCap100
     * @tc.number SUB_Web_Napi_SetBlankCacheCap_0200
     * @tc.desc   test OH_NativeArkWeb_SetBlanklessLoadingCacheCapacity interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiSetBlankCacheCap100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiSetBlankCacheCap100 start====");
          let result: number = nativeInterface.WebSetBlankCacheCap(1);
          expect([0, 100]).assertContain(result);
          console.info("====>testWebNapiSetBlankCacheCap100 stop====", result);
          done();
        } catch (err) {
          console.error("====>testWebNapiSetBlankCacheCap100 catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiSetBlankCacheCapBigger
     * @tc.number SUB_Web_Napi_SetBlankCacheCap_0300
     * @tc.desc   test OH_NativeArkWeb_SetBlanklessLoadingCacheCapacity interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiSetBlankCacheCapBigger', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiSetBlankCacheCapBigger start====");
          let result: number = nativeInterface.WebSetBlankCacheCap(2);
          expect([0, 100]).assertContain(result);
          console.info("====>testWebNapiSetBlankCacheCapBigger stop====", result);
          done();
        } catch (err) {
          console.error("====>testWebNapiSetBlankCacheCapBigger catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiSetBlankCacheCapSmaller
     * @tc.number SUB_Web_Napi_SetBlankCacheCap_0400
     * @tc.desc   test OH_NativeArkWeb_SetBlanklessLoadingCacheCapacity interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiSetBlankCacheCapSmaller', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiSetBlankCacheCapSmaller start====");
          let result: number = nativeInterface.WebSetBlankCacheCap(3);
          expect([0, 100]).assertContain(result);
          console.info("====>testWebNapiSetBlankCacheCapSmaller stop====", result);
          done();
        } catch (err) {
          console.error("====>testWebNapiSetBlankCacheCapSmaller catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiSetBlankCacheCapDefault
     * @tc.number SUB_Web_Napi_SetBlankCacheCap_0500
     * @tc.desc   test OH_NativeArkWeb_SetBlanklessLoadingCacheCapacity interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiSetBlankCacheCapDefault', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiSetBlankCacheCapDefault start====");
          let result: number = nativeInterface.WebSetBlankCacheCap(4);
          expect([0, 30]).assertContain(result);
          console.info("====>testWebNapiSetBlankCacheCapDefault stop====", result);
          done();
        } catch (err) {
          console.error("====>testWebNapiSetBlankCacheCapDefault catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiSaveCookieSyncSuccess
     * @tc.number SUB_Web_Napi_SaveCookieSync_0100
     * @tc.desc   test OH_ArkWebCookieManager_SaveCookieSync interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiSaveCookieSyncSuccess', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiSaveCookieSyncSuccess start====");
          let result: number = nativeInterface.WebSaveCookieSync(0);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiSaveCookieSyncSuccess stop====", result);
          done();
        } catch (err) {
          console.error("====>testWebNapiSaveCookieSyncSuccess catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiSaveCookieSyncUninitCookieManager
     * @tc.number SUB_Web_Napi_SaveCookieSync_0200
     * @tc.desc   test OH_ArkWebCookieManager_SaveCookieSync interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiSaveCookieSyncUninitCookieManager', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiSaveCookieSyncUninitCookieManager start====");
          let result: number = nativeInterface.WebSaveCookieSync(1);
          // expect(result).assertEqual(0);
          console.info("====>testWebNapiSaveCookieSyncUninitCookieManager stop====", result);
          done();
        } catch (err) {
          console.error("====>testWebNapiSaveCookieSyncUninitCookieManager catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiSaveCookieAsyncSuccess
     * @tc.number SUB_Web_Napi_SaveCookieAsync_0100
     * @tc.desc   test OH_ArkWebCookieManager_SaveCookieAsync interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiSaveCookieAsyncSuccess', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiSaveCookieAsyncSuccess start====");
          let result: number = nativeInterface.WebSaveCookieAsync(0);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiSaveCookieAsyncSuccess stop====", result);
          done();
        } catch (err) {
          console.error("====>testWebNapiSaveCookieAsyncSuccess catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testWebNapiSaveCookieAsyncNullCallback
     * @tc.number SUB_Web_Napi_SaveCookieAsync_0200
     * @tc.desc   test OH_ArkWebCookieManager_SaveCookieAsync interface
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testWebNapiSaveCookieAsyncNullCallback', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          console.info("====>testWebNapiSaveCookieAsyncNullCallback start====");
          let result: number = nativeInterface.WebSaveCookieAsync(1);
          expect(result).assertEqual(0);
          console.info("====>testWebNapiSaveCookieAsyncNullCallback stop====", result);
          done();
        } catch (err) {
          console.error("====>testWebNapiSaveCookieAsyncNullCallback catch err: " + err);
          expect(true).assertEqual(false);
          done();
        }
      })
    /**
     * @tc.name   testNativeArkWebSetActiveWebEngineVersion0100
     * @tc.number SUB_OH_NativeArkWeb_SetActiveWebEngineVersion_SYSTEM_DEFAULT
     * @tc.desc   test SUB_OH_NativeArkWeb_SetActiveWebEngineVersion_SYSTEM_DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNativeArkWebSetActiveWebEngineVersion0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_OH_NativeArkWeb_SetActiveWebEngineVersion_SYSTEM_DEFAULT start====");
        let result: number = nativeInterface.SetActiveWebEngineVersionSystemDefault();
        console.info("====>SUB_OH_NativeArkWeb_SetActiveWebEngineVersion_SYSTEM_DEFAULT result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>SUB_OH_NativeArkWeb_SetActiveWebEngineVersion_SYSTEM_DEFAULT catch err: " + err);
        expect(false).assertEqual(0);
      }
    })
    /**
     * @tc.name   testNativeArkWebSetActiveWebEngineVersion0200
     * @tc.number SUB_OH_NativeArkWeb_SetActiveWebEngineVersion_ARKWEB_M114
     * @tc.desc   test SUB_OH_NativeArkWeb_SetActiveWebEngineVersion_ARKWEB_M114
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNativeArkWebSetActiveWebEngineVersion0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_OH_NativeArkWeb_SetActiveWebEngineVersion_ARKWEB_M114 start====");
        let result: number = nativeInterface.SetActiveWebEngineVersionArkwebM114();
        console.info("====>SUB_OH_NativeArkWeb_SetActiveWebEngineVersion_ARKWEB_M114 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>SUB_OH_NativeArkWeb_SetActiveWebEngineVersion_ARKWEB_M114 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })
    /**
     * @tc.name   testNativeArkWebSetActiveWebEngineVersion0300
     * @tc.number SUB_OH_NativeArkWeb_SetActiveWebEngineVersion_ARKWEB_M132
     * @tc.desc   test SUB_OH_NativeArkWeb_SetActiveWebEngineVersion_ARKWEB_M132
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNativeArkWebSetActiveWebEngineVersion0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_OH_NativeArkWeb_SetActiveWebEngineVersion_ARKWEB_M132 start====");
        let result: number = nativeInterface.SetActiveWebEngineVersionArkwebM132();
        console.info("====>SUB_OH_NativeArkWeb_SetActiveWebEngineVersion_ARKWEB_M132 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>SUB_OH_NativeArkWeb_SetActiveWebEngineVersion_ARKWEB_M132 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })
  })
}