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
import { beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import hilog from '@ohos.hilog';
import { accessibility, config } from '@kit.AccessibilityKit';
import testNapi from 'libentry.so';
import { Driver } from '@kit.TestKit';
import { waitForExist } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const  driver = Driver.create();



export default function webviewApi() {

  describe('webNetHostingThree', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    /**
     * @tc.name   testWeb_GetNativeAPI
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0001
     * @tc.desc   test Web_GetNativeAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWeb_GetNativeAPI', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_GetNativeAPI PASS');

      Utils.emitEvent("emitWeb_GetNativeAPI", 147411)
      let isReturn = false;
      Utils.registerEvent("testWeb_GetNativeAPI", true, 147420, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webHostingButton",driver)
      await waitForExist(()=>isReturn, 'testWeb_GetNativeAPI', true,1000);
      done();
    })

    /**
     * @tc.name   testWeb_ReleaseString
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0002
     * @tc.desc   test Web_ReleaseString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWeb_ReleaseString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ReleaseString PASS');

      Utils.emitEvent("emitWeb_ReleaseString", 147411)
      let isReturn = false;
      Utils.registerEvent("testWeb_ReleaseString", true, 147430, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webHostingButton",driver)
      await waitForExist(()=>isReturn, 'testWeb_ReleaseString', true,1000);
      done();
    })

    /**
     * @tc.name   testWeb_ReleaseByteArray
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0003
     * @tc.desc   test Web_ReleaseByteArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWeb_ReleaseByteArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ReleaseByteArray PASS');

      Utils.emitEvent("emitWeb_ReleaseByteArray", 147411)
      let isReturn = false;
      Utils.registerEvent("testWeb_ReleaseByteArray", true, 147440, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webHostingButton",driver)
      await waitForExist(()=>isReturn, 'testWeb_ReleaseByteArray', true,1000);
      done();
    })

    /**
     * @tc.name   testWebResourceRequest_DestroyHttpBodyStream
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0004
     * @tc.desc   test WebResourceRequest_DestroyHttpBodyStream
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebResourceRequest_DestroyHttpBodyStream', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_DestroyHttpBodyStream PASS');

      Utils.emitEvent("emitWebResourceRequest_DestroyHttpBodyStream", 147411)
      let isReturn = false;
      Utils.registerEvent("testWebResourceRequest_DestroyHttpBodyStream", true, 147450, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webHostingButton",driver)
      await waitForExist(()=>isReturn, 'testWebResourceRequest_DestroyHttpBodyStream', true,1000);
      done();
    })

    /**
     * @tc.name   testWebResponse_SetHeaderByName
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0005
     * @tc.desc   test WebResponse_SetHeaderByName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebResponse_SetHeaderByName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetHeaderByName PASS');

      Utils.emitEvent("emitWebResponse_SetHeaderByName", 147411)
      let isReturn = false;
      Utils.registerEvent("testWebResponse_SetHeaderByName", true, 147460, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webHostingButton",driver)
      await waitForExist(()=>isReturn, 'testWebResponse_SetHeaderByName', true,1000);
      done();
    })

    /**
     * @tc.name   testWeb_SchemeHandler
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0006
     * @tc.desc   test Web_SchemeHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWeb_SchemeHandler', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_SchemeHandler PASS');

      Utils.emitEvent("emitWeb_SchemeHandler", 147411)
      let isReturn = false;
      Utils.registerEvent("testWeb_SchemeHandler", true, 147470, ()=>{isReturn = true});
     Utils.waitAndClickComponent("webHostingButton",driver)
      await waitForExist(()=>isReturn, 'testWeb_SchemeHandler', true,1000);
      done();
    })

    /**
     * @tc.name   testWeb_ResourceHandler
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0007
     * @tc.desc   test Web_ResourceHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWeb_ResourceHandler', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ResourceHandler PASS');

      Utils.emitEvent("emitWeb_ResourceHandler", 147411)
      let isReturn = false;
      Utils.registerEvent("testWeb_ResourceHandler", true, 147480, ()=>{isReturn = true});
     Utils.waitAndClickComponent("webHostingButton",driver)
     await waitForExist(()=>isReturn, 'testWeb_ResourceHandler', true,1000);
     done();
    })

    /**
     * @tc.name   testWeb_Response
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0008
     * @tc.desc   test Web_Response
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWeb_Response', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_Response PASS');

      Utils.emitEvent("emitWeb_Response", 147411)
      let isReturn = false;
      Utils.registerEvent("testWeb_Response", true, 147490, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webHostingButton",driver)
      await waitForExist(()=>isReturn, 'testWeb_Response', true,1000);
      done();
    })

    /**
     * @tc.name   testWeb_ResourceRequest
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0009
     * @tc.desc   test Web_ResourceRequest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWeb_ResourceRequest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ResourceRequest PASS');

      Utils.emitEvent("emitWeb_ResourceRequest", 147411)
      let isReturn = false;
      Utils.registerEvent("testWeb_ResourceRequest", true, 147500, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webHostingButton",driver)
      await waitForExist(()=>isReturn, 'testWeb_ResourceRequest', true,1000);
      done();
    })

    /**
     * @tc.name   testWeb_RequestHeaderList
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_0010
     * @tc.desc   test Web_RequestHeaderList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWeb_RequestHeaderList', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_RequestHeaderList PASS');

      Utils.emitEvent("emitWeb_RequestHeaderList", 147411)
      let isReturn = false;
      Utils.registerEvent("testWeb_RequestHeaderList", true, 147510, ()=>{isReturn = true});
       Utils.waitAndClickComponent("webHostingButton",driver)
      await waitForExist(()=>isReturn, 'testWeb_RequestHeaderList', true,1000);
      done();
    })

    /**
     * @tc.name   testWeb_HttpBodyStream
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0011
     * @tc.desc   test Web_RequestHeaderList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWeb_HttpBodyStream', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_HttpBodyStream PASS');

      Utils.emitEvent("emitWeb_HttpBodyStream", 147411)
      let isReturn = false;
      Utils.registerEvent("testWeb_HttpBodyStream", true, 147520, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webHostingButton",driver)
      await waitForExist(()=>isReturn, 'testWeb_HttpBodyStream', true,1000);
      done();
    })

    /**
     * @tc.name   testWeb_HttpBodyStreamInitCallback
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0012
     * @tc.desc   test Web_HttpBodyStreamInitCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWeb_HttpBodyStreamInitCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_HttpBodyStreamInitCallback PASS');

      Utils.emitEvent("emitWeb_HttpBodyStreamInitCallback", 147411)
      let isReturn = false;
      Utils.registerEvent("testWeb_HttpBodyStreamInitCallback", true, 147530, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webHostingButton",driver)
      await waitForExist(()=>isReturn, 'testWeb_HttpBodyStreamInitCallback', true,1000);
      done();
    })

    /**
     * @tc.name   testWeb_HttpBodyStreamReadCallback
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0013
     * @tc.desc   test Web_HttpBodyStreamReadCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWeb_HttpBodyStreamReadCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_HttpBodyStreamReadCallback PASS');

      Utils.emitEvent("emitWeb_HttpBodyStreamReadCallback", 147411)
      let isReturn = false;
      Utils.registerEvent("testWeb_HttpBodyStreamReadCallback", true, 147540, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webHostingButton",driver)
      await waitForExist(()=>isReturn, 'testWeb_HttpBodyStreamReadCallback', true,1000);
      done();
    })

    /**
     * @tc.name   testWeb_GetNativeAPI_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0014
     * @tc.desc   test Web_GetNativeAPI_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWeb_GetNativeAPI_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_GetNativeAPI_False PASS');
      let result:number = testNapi.getNativeApiFalse()
      expect(0).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebRequestHeaderList_GetSize_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0015
     * @tc.desc   test WebRequestHeaderList_GetSize_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebRequestHeaderList_GetSize_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebRequestHeaderList_GetSize_False PASS');
      let result:number = testNapi.requestHeaderListFalse()
      expect(-1).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebHttpBodyStream_SetUserDataFalse
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0016
     * @tc.desc   test WebHttpBodyStream_SetUserDataFalse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebHttpBodyStream_SetUserDataFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebHttpBodyStream_SetUserDataFalse PASS');
      let result:number = testNapi.httpBodyStreamSetUserDataFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebHttpBodyStream_SetReadCallback_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0017
     * @tc.desc   test WebHttpBodyStream_SetReadCallback_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebHttpBodyStream_SetReadCallback_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebHttpBodyStream_SetReadCallback_False');
      let result:number = testNapi.httpBodyStreamSetReadCallbackFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebHttpBodyStream_Init_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0018
     * @tc.desc   test WebHttpBodyStream_Init_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebHttpBodyStream_Init_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebHttpBodyStream_Init_False');
      let result:number = testNapi.httpBodyStreamInitFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebHttpBodyStream_IsChunked_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0019
     * @tc.desc   test WebHttpBodyStream_IsChunked_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebHttpBodyStream_IsChunked_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebHttpBodyStream_IsChunked_False');
      let result:number = testNapi.httpBodyStreamIsChunkedFalse()
      expect(0).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebHttpBodyStream_IsEof_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_0020
     * @tc.desc   test WebHttpBodyStream_IsEof_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebHttpBodyStream_IsEof_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebHttpBodyStream_IsEof_False');
      let result:number = testNapi.httpBodyStreamIsEofFalse()
      expect(0).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebHttpBodyStream_IsInMemory_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0021
     * @tc.desc   test WebHttpBodyStream_IsInMemory_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebHttpBodyStream_IsInMemory_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebHttpBodyStream_IsInMemory_False');
      let result:number = testNapi.httpBodyStreamIsInMemoryFalse()
      expect(0).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebResourceRequest_IsRedirect_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0022
     * @tc.desc   test WebResourceRequest_IsRedirect_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebResourceRequest_IsRedirect_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_IsRedirect_False');
      let result:number = testNapi.resourceRequestIsRedirectFalse()
      expect(0).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebResourceRequest_IsMainFrame_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0023
     * @tc.desc   test WebResourceRequest_IsMainFrame_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebResourceRequest_IsMainFrame_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_IsMainFrame_False');
      let result:number = testNapi.resourceRequestIsMainFrameFalse()
      expect(0).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebResourceRequest_HasGesture_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0024
     * @tc.desc   test WebResourceRequest_HasGesture_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebResourceRequest_HasGesture_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_HasGesture_False');
      let result:number = testNapi.resourceRequestHasGestureFalse()
      expect(0).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWeb_RegisterCustomSchemes_True
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0025
     * @tc.desc   test Web_RegisterCustomSchemes_True
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWeb_RegisterCustomSchemes_True', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_RegisterCustomSchemes_True');
      let result:number = testNapi.registerCustomSchemesTrue()
      expect(0).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWeb_RegisterCustomSchemes_INVALID
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0026
     * @tc.desc   test Web_RegisterCustomSchemes_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWeb_RegisterCustomSchemes_INVALID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_RegisterCustomSchemes_INVALID');
      let result:number = testNapi.registerCustomSchemesInvalid()
      expect(17100101).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWeb_RegisterCustomSchemes_ERROR
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0027
     * @tc.desc   test Web_RegisterCustomSchemes_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWeb_RegisterCustomSchemes_ERROR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_RegisterCustomSchemes_ERROR');
      let result:number = testNapi.registerCustomSchemesError()
      expect(17100102).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebServiceWorker_SetSchemeHandler_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0028
     * @tc.desc   test WebServiceWorker_SetSchemeHandler_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebServiceWorker_SetSchemeHandler_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebServiceWorker_SetSchemeHandler_False');
      let result:number = testNapi.serviceWorkerSetSchemeHandlerFalse()
      expect(0).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWeb_SetSchemeHandler_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0029
     * @tc.desc   test Web_SetSchemeHandler_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWeb_SetSchemeHandler_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_SetSchemeHandler_False');
      let result:number = testNapi.setSchemeHandlerFalse()
      expect(0).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWeb_ClearSchemeHandlers_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_0030
     * @tc.desc   test Web_ClearSchemeHandlers_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWeb_ClearSchemeHandlers_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ClearSchemeHandlers_False');
      let result:number = testNapi.clearSchemeHandlersFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebSchemeHandler_SetUserData_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0031
     * @tc.desc   test WebSchemeHandler_SetUserData_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSchemeHandler_SetUserData_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebSchemeHandler_SetUserData_False');
      let result:number = testNapi.schemeHandlerSetUserDataFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebSchemeHandler_SetOnRequestStart_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0032
     * @tc.desc   test WebSchemeHandler_SetOnRequestStart_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSchemeHandler_SetOnRequestStart_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebSchemeHandler_SetOnRequestStart_False');
      let result:number = testNapi.setOnRequestStartFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebSchemeHandler_SetOnRequestStop_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0033
     * @tc.desc   test WebSchemeHandler_SetOnRequestStop_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSchemeHandler_SetOnRequestStop_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebSchemeHandler_SetOnRequestStop_False');
      let result:number = testNapi.setOnRequestStopFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebResponse_SetUrl_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0034
     * @tc.desc   test WebResponse_SetUrl_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebResponse_SetUrl_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetUrl_False');
      let result:number = testNapi.responseSetUrlFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebResponse_SetError_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0035
     * @tc.desc   test WebResponse_SetError_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebResponse_SetError_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetError_False');
      let result:number = testNapi.responseSetErrorFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebResponse_SetStatus_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0036
     * @tc.desc   test WebResponse_SetStatus_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebResponse_SetStatus_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetStatus_False');
      let result:number = testNapi.responseSetStatusFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebResponse_GetStatus_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0037
     * @tc.desc   test WebResponse_GetStatus_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebResponse_GetStatus_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_GetStatus_False');
      let result:number = testNapi.responseGetStatusFalse()
      expect(-1).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebResponse_SetStatusText_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0038
     * @tc.desc   test WebResponse_SetStatusText_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebResponse_SetStatusText_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetStatusText_False');
      let result:number = testNapi.responseSetStatusTextFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebResponse_SetMimeType_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0039
     * @tc.desc   test WebResponse_SetMimeType_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebResponse_SetMimeType_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetMimeType_False');
      let result:number = testNapi.responseSetMimeTypeFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebResponse_SetCharset_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_0040
     * @tc.desc   test WebResponse_SetCharset_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebResponse_SetCharset_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetCharset_False');
      let result:number = testNapi.responseSetCharsetFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebResponse_SetHeaderByName_Name_NULL
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0041
     * @tc.desc   test WebResponse_SetHeaderByName_Name_NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebResponse_SetHeaderByName_Name_NULL', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetHeaderByName_Name_NULL');
      let result:number = testNapi.setHeaderByNameNameNull()
      expect(17100101).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebResponse_SetHeaderByName_Value_NULL
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0042
     * @tc.desc   test WebResponse_SetHeaderByName_Value_NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebResponse_SetHeaderByName_Value_NULL', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetHeaderByName_Value_NULL');
      let result:number = testNapi.setHeaderByNameValueNull()
      expect(17100101).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebResponse_SetHeaderByName_Overwrite_NULL
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0043
     * @tc.desc   test WebResponse_SetHeaderByName_Overwrite_NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebResponse_SetHeaderByName_Overwrite_NULL', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetHeaderByName_Overwrite_NULL');
      let result:number = testNapi.setHeaderByNameOverwriteNull()
      expect(0).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebResourceHandler_Destroy_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0044
     * @tc.desc   test WebResourceHandler_Destroy_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebResourceHandler_Destroy_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceHandler_Destroy_False');
      let result:number = testNapi.resourceHandlerDestroyFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebResourceHandler_DidReceiveResponse_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0045
     * @tc.desc   test WebResourceHandler_DidReceiveResponse_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebResourceHandler_DidReceiveResponse_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceHandler_DidReceiveResponse_False');
      let result:number = testNapi.didReceiveResponseFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebResourceHandler_DidReceiveData_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0046
     * @tc.desc   test WebResourceHandler_DidReceiveData_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebResourceHandler_DidReceiveData_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceHandler_DidReceiveData_False');
      let result:number = testNapi.didReceiveDataFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebResourceHandler_DidFinish_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0047
     * @tc.desc   test WebResourceHandler_DidFinish_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebResourceHandler_DidFinish_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceHandler_DidFinish_False');
      let result:number = testNapi.didFinishFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /**
     * @tc.name   testWebResourceHandler_DidFailWithError_False
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0048
     * @tc.desc   test WebResourceHandler_DidFailWithError_False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebResourceHandler_DidFailWithError_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceHandler_DidFailWithError_False');
      let result:number = testNapi.didFailWithErrorFalse()
      expect(17100101).assertEqual(result);
      done();
    })


  })
}
