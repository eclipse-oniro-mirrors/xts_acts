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
import { beforeAll, beforeEach, describe, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import hilog from '@ohos.hilog';

import testNapi from 'libentry.so';



export default function webviewApi() {

  describe('webNetHostingThree', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(1000);
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0001
    * @tc.name       : testWeb_GetNativeAPI
    * @tc.desc       : test Web_GetNativeAPI
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_GetNativeAPI', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_GetNativeAPI PASS');

      Utils.emitEvent("emitWeb_GetNativeAPI", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_GetNativeAPI", true, 1001, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0002
    * @tc.name       : testWeb_ReleaseString
    * @tc.desc       : test Web_ReleaseString
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_ReleaseString', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ReleaseString PASS');

      Utils.emitEvent("emitWeb_ReleaseString", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ReleaseString", true, 1002, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0003
    * @tc.name       : testWeb_ReleaseByteArray
    * @tc.desc       : test Web_ReleaseByteArray
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_ReleaseByteArray', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ReleaseByteArray PASS');

      Utils.emitEvent("emitWeb_ReleaseByteArray", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ReleaseByteArray", true, 1003, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0004
    * @tc.name       : testWebResourceRequest_DestroyHttpBodyStream
    * @tc.desc       : test WebResourceRequest_DestroyHttpBodyStream
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebResourceRequest_DestroyHttpBodyStream', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_DestroyHttpBodyStream PASS');

      Utils.emitEvent("emitWebResourceRequest_DestroyHttpBodyStream", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWebResourceRequest_DestroyHttpBodyStream", true, 1004, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0005
    * @tc.name       : testWebResponse_SetHeaderByName
    * @tc.desc       : test WebResponse_SetHeaderByName
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebResponse_SetHeaderByName', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetHeaderByName PASS');

      Utils.emitEvent("emitWebResponse_SetHeaderByName", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWebResponse_SetHeaderByName", true, 1005, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0006
    * @tc.name       : testWeb_SchemeHandler
    * @tc.desc       : test Web_SchemeHandler
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_SchemeHandler', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_SchemeHandler PASS');

      Utils.emitEvent("emitWeb_SchemeHandler", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_SchemeHandler", true, 1006, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0007
    * @tc.name       : testWeb_ResourceHandler
    * @tc.desc       : test Web_ResourceHandler
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_ResourceHandler', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ResourceHandler PASS');

      Utils.emitEvent("emitWeb_ResourceHandler", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ResourceHandler", true, 1007, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0008
    * @tc.name       : testWeb_Response
    * @tc.desc       : test Web_Response
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_Response', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_Response PASS');

      Utils.emitEvent("emitWeb_Response", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_Response", true, 1008, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0009
    * @tc.name       : testWeb_ResourceRequest
    * @tc.desc       : test Web_ResourceRequest
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_ResourceRequest', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ResourceRequest PASS');

      Utils.emitEvent("emitWeb_ResourceRequest", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ResourceRequest", true, 1009, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0010
    * @tc.name       : testWeb_RequestHeaderList
    * @tc.desc       : test Web_RequestHeaderList
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_RequestHeaderList', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_RequestHeaderList PASS');

      Utils.emitEvent("emitWeb_RequestHeaderList", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_RequestHeaderList", true, 1010, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0011
     * @tc.name       : testWeb_RequestHeaderList
     * @tc.desc       : test Web_RequestHeaderList
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeb_HttpBodyStream', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_HttpBodyStream PASS');

      Utils.emitEvent("emitWeb_HttpBodyStream", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_HttpBodyStream", true, 1011, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0012
     * @tc.name       : testWeb_HttpBodyStreamInitCallback
     * @tc.desc       : test Web_HttpBodyStreamInitCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeb_HttpBodyStreamInitCallback', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_HttpBodyStreamInitCallback PASS');

      Utils.emitEvent("emitWeb_HttpBodyStreamInitCallback", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_HttpBodyStreamInitCallback", true, 1012, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0013
     * @tc.name       : testWeb_HttpBodyStreamReadCallback
     * @tc.desc       : test Web_HttpBodyStreamReadCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeb_HttpBodyStreamReadCallback', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_HttpBodyStreamReadCallback PASS');

      Utils.emitEvent("emitWeb_HttpBodyStreamReadCallback", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_HttpBodyStreamReadCallback", true, 1013, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0014
     * @tc.name       : testWeb_GetNativeAPI_False
     * @tc.desc       : test Web_GetNativeAPI_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeb_GetNativeAPI_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_GetNativeAPI_False PASS');

      await Utils.sleep(1000);
      let result:number = testNapi.getNativeApiFalse()
      expect(0).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0015
     * @tc.name       : testWebRequestHeaderList_GetSize_False
     * @tc.desc       : test WebRequestHeaderList_GetSize_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebRequestHeaderList_GetSize_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebRequestHeaderList_GetSize_False PASS');

      await Utils.sleep(1000);
      let result:number = testNapi.requestHeaderListFalse()
      expect(-1).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0016
     * @tc.name       : testWebHttpBodyStream_SetUserDataFalse
     * @tc.desc       : test WebHttpBodyStream_SetUserDataFalse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebHttpBodyStream_SetUserDataFalse', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebHttpBodyStream_SetUserDataFalse PASS');

      await Utils.sleep(1000);
      let result:number = testNapi.httpBodyStreamSetUserDataFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0017
     * @tc.name       : testWebHttpBodyStream_SetReadCallback_False
     * @tc.desc       : test WebHttpBodyStream_SetReadCallback_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebHttpBodyStream_SetReadCallback_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebHttpBodyStream_SetReadCallback_False');

      await Utils.sleep(1000);
      let result:number = testNapi.httpBodyStreamSetReadCallbackFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0018
     * @tc.name       : testWebHttpBodyStream_Init_False
     * @tc.desc       : test WebHttpBodyStream_Init_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebHttpBodyStream_Init_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebHttpBodyStream_Init_False');

      await Utils.sleep(1000);
      let result:number = testNapi.httpBodyStreamInitFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0019
     * @tc.name       : testWebHttpBodyStream_IsChunked_False
     * @tc.desc       : test WebHttpBodyStream_IsChunked_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebHttpBodyStream_IsChunked_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebHttpBodyStream_IsChunked_False');

      await Utils.sleep(1000);
      let result:number = testNapi.httpBodyStreamIsChunkedFalse()
      expect(0).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0020
     * @tc.name       : testWebHttpBodyStream_IsEof_False
     * @tc.desc       : test WebHttpBodyStream_IsEof_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebHttpBodyStream_IsEof_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebHttpBodyStream_IsEof_False');

      await Utils.sleep(1000);
      let result:number = testNapi.httpBodyStreamIsEofFalse()
      expect(0).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0021
     * @tc.name       : testWebHttpBodyStream_IsInMemory_False
     * @tc.desc       : test WebHttpBodyStream_IsInMemory_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebHttpBodyStream_IsInMemory_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebHttpBodyStream_IsInMemory_False');

      await Utils.sleep(1000);
      let result:number = testNapi.httpBodyStreamIsInMemoryFalse()
      expect(0).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0022
     * @tc.name       : testWebResourceRequest_IsRedirect_False
     * @tc.desc       : test WebResourceRequest_IsRedirect_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResourceRequest_IsRedirect_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_IsRedirect_False');

      await Utils.sleep(1000);
      let result:number = testNapi.resourceRequestIsRedirectFalse()
      expect(0).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0023
     * @tc.name       : testWebResourceRequest_IsMainFrame_False
     * @tc.desc       : test WebResourceRequest_IsMainFrame_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResourceRequest_IsMainFrame_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_IsMainFrame_False');

      await Utils.sleep(1000);
      let result:number = testNapi.resourceRequestIsMainFrameFalse()
      expect(0).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0024
     * @tc.name       : testWebResourceRequest_HasGesture_False
     * @tc.desc       : test WebResourceRequest_HasGesture_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResourceRequest_HasGesture_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_HasGesture_False');

      await Utils.sleep(1000);
      let result:number = testNapi.resourceRequestHasGestureFalse()
      expect(0).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0025
     * @tc.name       : testWeb_RegisterCustomSchemes_True
     * @tc.desc       : test Web_RegisterCustomSchemes_True
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeb_RegisterCustomSchemes_True', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_RegisterCustomSchemes_True');

      await Utils.sleep(1000);
      let result:number = testNapi.registerCustomSchemesTrue()
      expect(0).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0026
     * @tc.name       : testWeb_RegisterCustomSchemes_INVALID
     * @tc.desc       : test Web_RegisterCustomSchemes_INVALID
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeb_RegisterCustomSchemes_INVALID', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_RegisterCustomSchemes_INVALID');

      await Utils.sleep(1000);
      let result:number = testNapi.registerCustomSchemesInvalid()
      expect(17100101).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0027
     * @tc.name       : testWeb_RegisterCustomSchemes_ERROR
     * @tc.desc       : test Web_RegisterCustomSchemes_ERROR
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeb_RegisterCustomSchemes_ERROR', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_RegisterCustomSchemes_ERROR');

      await Utils.sleep(1000);
      let result:number = testNapi.registerCustomSchemesError()
      expect(17100102).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0028
     * @tc.name       : testWebServiceWorker_SetSchemeHandler_False
     * @tc.desc       : test WebServiceWorker_SetSchemeHandler_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebServiceWorker_SetSchemeHandler_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebServiceWorker_SetSchemeHandler_False');

      await Utils.sleep(1000);
      let result:number = testNapi.serviceWorkerSetSchemeHandlerFalse()
      expect(0).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0029
     * @tc.name       : testWeb_SetSchemeHandler_False
     * @tc.desc       : test Web_SetSchemeHandler_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeb_SetSchemeHandler_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_SetSchemeHandler_False');

      await Utils.sleep(1000);
      let result:number = testNapi.setSchemeHandlerFalse()
      expect(0).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0030
     * @tc.name       : testWeb_ClearSchemeHandlers_False
     * @tc.desc       : test Web_ClearSchemeHandlers_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeb_ClearSchemeHandlers_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ClearSchemeHandlers_False');

      await Utils.sleep(1000);
      let result:number = testNapi.clearSchemeHandlersFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0031
     * @tc.name       : testWebSchemeHandler_SetUserData_False
     * @tc.desc       : test WebSchemeHandler_SetUserData_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebSchemeHandler_SetUserData_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebSchemeHandler_SetUserData_False');

      await Utils.sleep(1000);
      let result:number = testNapi.schemeHandlerSetUserDataFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0032
     * @tc.name       : testWebSchemeHandler_SetOnRequestStart_False
     * @tc.desc       : test WebSchemeHandler_SetOnRequestStart_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebSchemeHandler_SetOnRequestStart_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebSchemeHandler_SetOnRequestStart_False');

      await Utils.sleep(1000);
      let result:number = testNapi.setOnRequestStartFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0033
     * @tc.name       : testWebSchemeHandler_SetOnRequestStop_False
     * @tc.desc       : test WebSchemeHandler_SetOnRequestStop_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebSchemeHandler_SetOnRequestStop_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebSchemeHandler_SetOnRequestStop_False');

      await Utils.sleep(1000);
      let result:number = testNapi.setOnRequestStopFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0034
     * @tc.name       : testWebResponse_SetUrl_False
     * @tc.desc       : test WebResponse_SetUrl_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResponse_SetUrl_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetUrl_False');

      await Utils.sleep(1000);
      let result:number = testNapi.responseSetUrlFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0035
     * @tc.name       : testWebResponse_SetError_False
     * @tc.desc       : test WebResponse_SetError_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResponse_SetError_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetError_False');

      await Utils.sleep(1000);
      let result:number = testNapi.responseSetErrorFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0036
     * @tc.name       : testWebResponse_SetStatus_False
     * @tc.desc       : test WebResponse_SetStatus_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResponse_SetStatus_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetStatus_False');

      await Utils.sleep(1000);
      let result:number = testNapi.responseSetStatusFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0037
     * @tc.name       : testWebResponse_GetStatus_False
     * @tc.desc       : test WebResponse_GetStatus_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResponse_GetStatus_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_GetStatus_False');

      await Utils.sleep(1000);
      let result:number = testNapi.responseGetStatusFalse()
      expect(-1).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0038
     * @tc.name       : testWebResponse_SetStatusText_False
     * @tc.desc       : test WebResponse_SetStatusText_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResponse_SetStatusText_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetStatusText_False');

      await Utils.sleep(1000);
      let result:number = testNapi.responseSetStatusTextFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0039
     * @tc.name       : testWebResponse_SetMimeType_False
     * @tc.desc       : test WebResponse_SetMimeType_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResponse_SetMimeType_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetMimeType_False');

      await Utils.sleep(1000);
      let result:number = testNapi.responseSetMimeTypeFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0040
     * @tc.name       : testWebResponse_SetCharset_False
     * @tc.desc       : test WebResponse_SetCharset_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResponse_SetCharset_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetCharset_False');

      await Utils.sleep(1000);
      let result:number = testNapi.responseSetCharsetFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0041
     * @tc.name       : testWebResponse_SetHeaderByName_Name_NULL
     * @tc.desc       : test WebResponse_SetHeaderByName_Name_NULL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResponse_SetHeaderByName_Name_NULL', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetHeaderByName_Name_NULL');

      await Utils.sleep(1000);
      let result:number = testNapi.setHeaderByNameNameNull()
      expect(17100101).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0042
     * @tc.name       : testWebResponse_SetHeaderByName_Value_NULL
     * @tc.desc       : test WebResponse_SetHeaderByName_Value_NULL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResponse_SetHeaderByName_Value_NULL', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetHeaderByName_Value_NULL');

      await Utils.sleep(1000);
      let result:number = testNapi.setHeaderByNameValueNull()
      expect(17100101).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0043
     * @tc.name       : testWebResponse_SetHeaderByName_Overwrite_NULL
     * @tc.desc       : test WebResponse_SetHeaderByName_Overwrite_NULL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResponse_SetHeaderByName_Overwrite_NULL', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetHeaderByName_Overwrite_NULL');

      await Utils.sleep(1000);
      let result:number = testNapi.setHeaderByNameOverwriteNull()
      expect(0).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0044
     * @tc.name       : testWebResourceHandler_Destroy_False
     * @tc.desc       : test WebResourceHandler_Destroy_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResourceHandler_Destroy_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceHandler_Destroy_False');

      await Utils.sleep(1000);
      let result:number = testNapi.resourceHandlerDestroyFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0045
     * @tc.name       : testWebResourceHandler_DidReceiveResponse_False
     * @tc.desc       : test WebResourceHandler_DidReceiveResponse_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResourceHandler_DidReceiveResponse_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceHandler_DidReceiveResponse_False');

      await Utils.sleep(1000);
      let result:number = testNapi.didReceiveResponseFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0046
     * @tc.name       : testWebResourceHandler_DidReceiveData_False
     * @tc.desc       : test WebResourceHandler_DidReceiveData_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResourceHandler_DidReceiveData_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceHandler_DidReceiveData_False');

      await Utils.sleep(1000);
      let result:number = testNapi.didReceiveDataFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0047
     * @tc.name       : testWebResourceHandler_DidFinish_False
     * @tc.desc       : test WebResourceHandler_DidFinish_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResourceHandler_DidFinish_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceHandler_DidFinish_False');

      await Utils.sleep(1000);
      let result:number = testNapi.didFinishFalse()
      expect(17100101).assertEqual(result);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0048
     * @tc.name       : testWebResourceHandler_DidFailWithError_False
     * @tc.desc       : test WebResourceHandler_DidFailWithError_False
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResourceHandler_DidFailWithError_False', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceHandler_DidFailWithError_False');

      await Utils.sleep(1000);
      let result:number = testNapi.didFailWithErrorFalse()
      expect(17100101).assertEqual(result);
      done();
    })


  })
}
