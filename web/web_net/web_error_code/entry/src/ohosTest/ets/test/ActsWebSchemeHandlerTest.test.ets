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

import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@kit.TestKit';
import Utils from './UtilsTest.test';
import webCode from 'libweberrorcodetest.so'

let driver = Driver.create();

export default function ActsWebSchemeHandlerTest() {
  describe('ActsWebSchemeHandlerTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/Index',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebArkWebHttpBodyStream state success " + JSON.stringify(pages));
        if (!("WebConfigCookieSync" == pages.name)) {
          console.info("get WebArkWebHttpBodyStream state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebArkWebHttpBodyStream page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebArkWebHttpBodyStream page error: " + err);
      }
      await driver.waitForComponent(ON.id("ArkWebHttpBodyStreamTest"),10000);
      console.log("waitForComponent ArkWebHttpBodyStreamTest==>");
      done()
    });

    /**
     * @tc.name   testArkWebSchemeOptionNone
     * @tc.number SUB_WEB_CUSTOM_SCHEME_OPTION_0100
     * @tc.desc   test ArkWeb_CustomSchemeOption OH_ARKWEB_SCHEME_OPTION_NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSchemeOptionNone', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webRegisterCustomSchemes("OH_ARKWEB_SCHEME_OPTION_NONE");
        console.info("====>testArkWebSchemeOptionNone result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSchemeOptionNone catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebSchemeOptionSecure
     * @tc.number SUB_WEB_CUSTOM_SCHEME_OPTION_0200
     * @tc.desc   test ArkWeb_CustomSchemeOption ARKWEB_SCHEME_OPTION_SECURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSchemeOptionSecure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webRegisterCustomSchemes("ARKWEB_SCHEME_OPTION_SECURE");
        console.info("====>testArkWebSchemeOptionSecure result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSchemeOptionSecure catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebSchemeOptionCodeCacheEnabled
     * @tc.number SUB_WEB_CUSTOM_SCHEME_OPTION_0300
     * @tc.desc   test ArkWeb_CustomSchemeOption ARKWEB_SCHEME_OPTION_CODE_CACHE_ENABLED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSchemeOptionCodeCacheEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webRegisterCustomSchemes("ARKWEB_SCHEME_OPTION_CODE_CACHE_ENABLED");
        console.info("====>testArkWebSchemeOptionCodeCacheEnabled result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSchemeOptionCodeCacheEnabled catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebResourceRequestSetUserDataOK
     * @tc.number SUB_WEB_SCHEME_HANDLER_0100
     * @tc.desc   test ArkWebResourceRequest_SetUserData return ARKWEB_NET_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResourceRequestSetUserDataOK', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webSchemeHandlerProcess("OH_ArkWebResourceRequest_SetUserData", "ARKWEB_NET_OK");
        console.info("====>testArkWebResourceRequestSetUserDataOK result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResourceRequestSetUserDataOK catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebResourceRequestSetUserDataInvalidParam
     * @tc.number SUB_WEB_SCHEME_HANDLER_0200
     * @tc.desc   test ArkWebResourceRequest_SetUserData return ARKWEB_INVALID_PARAM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResourceRequestSetUserDataInvalidParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webSchemeHandlerProcess("OH_ArkWebResourceRequest_SetUserData", "ARKWEB_INVALID_PARAM");
        console.info("====>testArkWebResourceRequestSetUserDataInvalidParam result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResourceRequestSetUserDataInvalidParam catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebResourceBodyStreamSetUserDataOK
     * @tc.number SUB_WEB_SCHEME_HANDLER_0300
     * @tc.desc   test OH_ArkWebHttpBodyStream_SetUserData return ARKWEB_NET_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResourceBodyStreamSetUserDataOK', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webSchemeHandlerProcess("OH_ArkWebHttpBodyStream_SetUserData", "ARKWEB_NET_OK");
        console.info("====>testArkWebResourceBodyStreamSetUserDataOK result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResourceBodyStreamSetUserDataOK catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebResourceBodyStreamSetUserDataInvalidParam
     * @tc.number SUB_WEB_SCHEME_HANDLER_0400
     * @tc.desc   test OH_ArkWebHttpBodyStream_SetUserData return ARKWEB_INVALID_PARAM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResourceBodyStreamSetUserDataInvalidParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webSchemeHandlerProcess("OH_ArkWebHttpBodyStream_SetUserData", "ARKWEB_INVALID_PARAM");
        console.info("====>testArkWebResourceBodyStreamSetUserDataInvalidParam result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResourceBodyStreamSetUserDataInvalidParam catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebHttpBodyStreamSetReadCallbackOK
     * @tc.number SUB_WEB_SCHEME_HANDLER_0500
     * @tc.desc   test OH_ArkWebHttpBodyStream_SetReadCallback return ARKWEB_NET_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebHttpBodyStreamSetReadCallbackOK', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        Utils.emitEvent("OH_ArkWebHttpBodyStream_SetAsyncReadCallback001", 825)
        Utils.registerBaseEvent("testOH_ArkWebHttpBodyStream_SetAsyncReadCallback001", 1, 20250825, done, (backData: events_emitter.EventData, expected: Object) => {
          console.error("====>OH_ArkWebHttpBodyStream_SetAsyncReadCallback001 ACTION: " + backData?.data?.ACTION);
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
        sendEventByKey('ArkWebHttpBodyStreamTest', 10, '');
        done();
      } catch (err) {
        console.error("====>OH_ArkWebHttpBodyStream_SetAsyncReadCallback001 catch err: " + err);
        expect(0).assertEqual(1);
      }
    })

    /**
     * @tc.name   testArkWebHttpBodyStreamSetReadCallbackInvalidParam
     * @tc.number SUB_WEB_SCHEME_HANDLER_0600
     * @tc.desc   test OH_ArkWebHttpBodyStream_SetReadCallback return ARKWEB_INVALID_PARAM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebHttpBodyStreamSetReadCallbackInvalidParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webSchemeHandlerProcess("OH_ArkWebHttpBodyStream_SetReadCallback", "ARKWEB_INVALID_PARAM");
        console.info("====>testArkWebHttpBodyStreamSetReadCallbackInvalidParam result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebHttpBodyStreamSetReadCallbackInvalidParam catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebHttpBodyStream_SetAsyncReadCallbackOK
     * @tc.number SUB_WEB_SCHEME_HANDLER_0700
     * @tc.desc   test OH_ArkWebHttpBodyStream_SetAsyncReadCallback return ARKWEB_NET_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebHttpBodyStream_SetAsyncReadCallbackOK', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webSchemeHandlerProcess("OH_ArkWebHttpBodyStream_SetAsyncReadCallback", "ARKWEB_NET_OK");
        console.info("====>testArkWebHttpBodyStream_SetAsyncReadCallbackOK result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebHttpBodyStream_SetAsyncReadCallbackOK catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebHttpBodyStream_SetAsyncReadCallbackInvalidParam
     * @tc.number SUB_WEB_SCHEME_HANDLER_0800
     * @tc.desc   test OH_ArkWebHttpBodyStream_SetAsyncReadCallback return ARKWEB_INVALID_PARAM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebHttpBodyStream_SetAsyncReadCallbackInvalidParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webSchemeHandlerProcess("OH_ArkWebHttpBodyStream_SetAsyncReadCallback", "ARKWEB_INVALID_PARAM");
        console.info("====>testArkWebHttpBodyStream_SetAsyncReadCallbackInvalidParam result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebHttpBodyStream_SetAsyncReadCallbackInvalidParam catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebHttpBodyStreamInitOK
     * @tc.number SUB_WEB_SCHEME_HANDLER_0900
     * @tc.desc   test OH_ArkWebHttpBodyStream_Init return ARKWEB_NET_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebHttpBodyStreamInitOK', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webSchemeHandlerProcess("OH_ArkWebHttpBodyStream_Init", "ARKWEB_NET_OK");
        console.info("====>testArkWebHttpBodyStreamInitOK result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebHttpBodyStreamInitOK catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebHttpBodyStreamInitInvalidParam
     * @tc.number SUB_WEB_SCHEME_HANDLER_1000
     * @tc.desc   test OH_ArkWebHttpBodyStream_Init return ARKWEB_INVALID_PARAM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebHttpBodyStreamInitInvalidParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webSchemeHandlerProcess("OH_ArkWebHttpBodyStream_Init", "ARKWEB_INVALID_PARAM");
        console.info("====>testArkWebHttpBodyStreamInitInvalidParam result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebHttpBodyStreamInitInvalidParam catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebHttpBodyStreamAsyncRead
     * @tc.number SUB_WEB_SCHEME_HANDLER_1100
     * @tc.desc   test OH_ArkWebHttpBodyStream_AsyncRead
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebHttpBodyStreamAsyncRead', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webSchemeHandlerProcess("OH_ArkWebHttpBodyStream_AsyncRead", "API");
        console.info("====>testArkWebHttpBodyStreamAsyncRead result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebHttpBodyStreamAsyncRead catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebResourceRequestDestroyOK
     * @tc.number SUB_WEB_SCHEME_HANDLER_1200
     * @tc.desc   test OH_ArkWebResourceRequest_Destroy return ARKWEB_NET_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResourceRequestDestroyOK', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webSchemeHandlerProcess("OH_ArkWebResourceRequest_Destroy", "ARKWEB_NET_OK");
        console.info("====>testArkWebResourceRequestDestroyOK result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResourceRequestDestroyOK catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebResourceRequestDestroyInvalidParam
     * @tc.number SUB_WEB_SCHEME_HANDLER_1300
     * @tc.desc   test OH_ArkWebResourceRequest_Destroy return ARKWEB_INVALID_PARAM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResourceRequestDestroyInvalidParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webSchemeHandlerProcess("OH_ArkWebResourceRequest_Destroy", "ARKWEB_INVALID_PARAM");
        console.info("====>testArkWebResourceRequestDestroyInvalidParam result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResourceRequestDestroyInvalidParam catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebRegisterCustomSchemesOK
     * @tc.number SUB_WEB_SCHEME_HANDLER_1400
     * @tc.desc   test OH_ArkWebResourceRequest_Destroy return ARKWEB_NET_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebRegisterCustomSchemesOK', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webSchemeHandlerProcess("OH_ArkWeb_RegisterCustomSchemes", "ARKWEB_NET_OK");
        console.info("====>testArkWebRegisterCustomSchemesOK result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebRegisterCustomSchemesOK catch err: " + err);
      }
    })

    /**
     * @tc.name   OH_ArkWebResourceHandler_Destroy0101
     * @tc.number OH_ArkWebResourceHandler_Destroy0101
     * @tc.desc   test OH_ArkWebResourceHandler_Destroy return ARKWEB_NET_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OH_ArkWebResourceHandler_Destroy0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webSchemeHandlerProcess("OH_ArkWebResourceHandler_Destroy", "ARKWEB_NET_OK");
        console.info("====>OH_ArkWebResourceHandler_Destroy0101 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>OH_ArkWebResourceHandler_Destroy0101 catch err: " + err);
      }
    })

    /**
     * @tc.name   OH_ArkWebResourceHandler_DidReceiveResponse0101
     * @tc.number OH_ArkWebResourceHandler_DidReceiveResponse0101
     * @tc.desc   test OH_ArkWebResourceHandler_DidReceiveResponse return ARKWEB_NET_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OH_ArkWebResourceHandler_DidReceiveResponse0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webSchemeHandlerProcess("OH_ArkWebResourceHandler_DidReceiveResponse", "ARKWEB_NET_OK");
        console.info("====>OH_ArkWebResourceHandler_DidReceiveResponse0101 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>OH_ArkWebResourceHandler_DidReceiveResponse0101 catch err: " + err);
      }
    })

    /**
     * @tc.name   OH_ArkWebResourceHandler_DidReceiveData0101
     * @tc.number OH_ArkWebResourceHandler_DidReceiveData0101
     * @tc.desc   test OH_ArkWebResourceHandler_DidReceiveResponse return ARKWEB_NET_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OH_ArkWebResourceHandler_DidReceiveData0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webSchemeHandlerProcess("OH_ArkWebResourceHandler_DidReceiveResponse", "ARKWEB_NET_OK");
        console.info("====>OH_ArkWebResourceHandler_DidReceiveData0101 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>OH_ArkWebResourceHandler_DidReceiveData0101 catch err: " + err);
      }
    })

    /**
     * @tc.name   OH_ArkWebResourceHandler_DidFinish0101
     * @tc.number OH_ArkWebResourceHandler_DidFinish0101
     * @tc.desc   test OH_ArkWebResourceHandler_DidFinish return ARKWEB_NET_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OH_ArkWebResourceHandler_DidFinish0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webSchemeHandlerProcess("OH_ArkWebResourceHandler_DidFinish", "ARKWEB_NET_OK");
        console.info("====>OH_ArkWebResourceHandler_DidFinish0101 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>OH_ArkWebResourceHandler_DidFinish0101 catch err: " + err);
      }
    })

    /**
     * @tc.name   OH_ArkWebResourceHandler_DidFailWithError0101
     * @tc.number OH_ArkWebResourceHandler_DidFailWithError0101
     * @tc.desc   test OH_ArkWebResourceHandler_DidFailWithError return ARKWEB_NET_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OH_ArkWebResourceHandler_DidFailWithError0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webSchemeHandlerProcess("OH_ArkWebResourceHandler_DidFailWithError", "ARKWEB_NET_OK");
        console.info("====>OH_ArkWebResourceHandler_DidFailWithError0101 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>OH_ArkWebResourceHandler_DidFailWithError0101 catch err: " + err);
      }
    })

    /**
     * @tc.name   OH_ArkWebResourceHandler_DidFailWithErrorV20101
     * @tc.number OH_ArkWebResourceHandler_DidFailWithErrorV20101
     * @tc.desc   test OH_ArkWebResourceHandler_DidFailWithErrorV2 return ARKWEB_NET_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OH_ArkWebResourceHandler_DidFailWithErrorV20101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webSchemeHandlerProcess("OH_ArkWebResourceHandler_DidFailWithErrorV2", "ARKWEB_NET_OK");
        console.info("====>OH_ArkWebResourceHandler_DidFailWithErrorV20101 result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>OH_ArkWebResourceHandler_DidFailWithErrorV20101 catch err: " + err);
      }
    })
  })
}