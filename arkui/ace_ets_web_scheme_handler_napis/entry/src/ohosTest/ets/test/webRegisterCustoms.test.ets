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
import { beforeEach, describe, it } from '@ohos/hypium';
import Utils from './Utils';


import { hilog } from '@kit.PerformanceAnalysisKit';

export default function webviewApi() {

  describe('webRegisterCustoms', () => {
      
    beforeEach(async (done:Function) => {
      await Utils.sleep(1000);
      console.info("web beforeEach start");
      done();
    })

    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0010
     * @tc.name       : testRegisterCustoms0010
     * @tc.desc       : test RegisterCustoms
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegisterCustoms', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testRegisterCustoms PASS');
        
        Utils.emitEvent("emitRegisterCustoms", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testRegisterCustoms", true, 7707, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0020
     * @tc.name       : testSetSchemeHandler0020
     * @tc.desc       : test SetSchemeHandler
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSetSchemeHandler', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testSetSchemeHandler PASS');
        
        Utils.emitEvent("emitSetSchemeHandler", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testSetSchemeHandler", true, 7708, done);
        sendEventByKey('webHostingButton', 10, '');
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0030
     * @tc.name       : testClearSchemeHandlers0030
     * @tc.desc       : test ClearSchemeHandlers
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testClearSchemeHandlers', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testClearSchemeHandlers PASS');
        
        Utils.emitEvent("emitClearSchemeHandlers", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testClearSchemeHandlers", true, 7709, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0040
     * @tc.name       : testServiceWorkerClearSchemeHandlers0040
     * @tc.desc       : test ServiceWorkerClearSchemeHandlers
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testServiceWorkerClearSchemeHandlers', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testServiceWorkerClearSchemeHandlers PASS');
        
        Utils.emitEvent("emitServiceWorkerClearSchemeHandlers", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testServiceWorkerClearSchemeHandlers", true, 7710, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0050
     * @tc.name       : testDestroySchemeHandler0050
     * @tc.desc       : test DestroySchemeHandler
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDestroySchemeHandler', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testDestroySchemeHandler PASS');
        
        Utils.emitEvent("emitDestroySchemeHandler", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testDestroySchemeHandler", true, 7711, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0060
     * @tc.name       : testGetNativeAPI0060
     * @tc.desc       : test GetNativeAPI
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetNativeAPI', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testGetNativeAPI PASS');
        
        Utils.emitEvent("emitGetNativeAPI", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testGetNativeAPI", true, 7712, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0070
     * @tc.name       : testWebResourceRequest_GetUrl0070
     * @tc.desc       : test WebResourceRequest_GetUrl
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResourceRequest_GetUrl', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_GetUrl PASS');
        
        Utils.emitEvent("emitWebResourceRequest_GetUrl", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebResourceRequest_GetUrl", true, 7713, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0080
     * @tc.name       : testWebResourceRequest_GetMethod0080
     * @tc.desc       : test WebResourceRequest_GetMethod
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResourceRequest_GetMethod', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_GetMethod PASS');
        
        Utils.emitEvent("emitWebResourceRequest_GetMethod", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebResourceRequest_GetMethod", true, 7714, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0090
     * @tc.name       : testWebResourceRequest_GetHttpBodyStream0090
     * @tc.desc       : test WebResourceRequest_GetHttpBodyStream
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResourceRequest_GetHttpBodyStream', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_GetHttpBodyStream PASS');
        
        Utils.emitEvent("emitWebResourceRequest_GetHttpBodyStream", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebResourceRequest_GetHttpBodyStream", true, 7715, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0100
     * @tc.name       : testWebRequestHeaderList_GetSize0100
     * @tc.desc       : test WebRequestHeaderList_GetSize
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebRequestHeaderList_GetSize', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebRequestHeaderList_GetSize PASS');
        
        Utils.emitEvent("emitWebRequestHeaderList_GetSize", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebRequestHeaderList_GetSize", true, 7716, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0110
     * @tc.name       : testWebRequestHeaderList_GetHeader0110
     * @tc.desc       : test WebRequestHeaderList_GetHeader
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebRequestHeaderList_GetHeader', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebRequestHeaderList_GetHeader PASS');
        
        Utils.emitEvent("emitWebRequestHeaderList_GetHeader", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebRequestHeaderList_GetHeader", true, 7717, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0120
     * @tc.name       : testWebRequestHeaderList_Destroy0120
     * @tc.desc       : test WebRequestHeaderList_Destroy
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebRequestHeaderList_Destroy', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebRequestHeaderList_Destroy PASS');
        
        Utils.emitEvent("emitWebRequestHeaderList_Destroy", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebRequestHeaderList_Destroy", true, 7718, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0130
     * @tc.name       : testWebResourceRequest_HasGesture0130
     * @tc.desc       : test WebResourceRequest_HasGesture
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResourceRequest_HasGesture', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_HasGesture PASS');
        
        Utils.emitEvent("emitWebResourceRequest_HasGesture", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebResourceRequest_HasGesture", true, 7719, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0140
     * @tc.name       : testWebResourceRequest_IsMainFrame0140
     * @tc.desc       : test WebResourceRequest_IsMainFrame
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResourceRequest_IsMainFrame', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_IsMainFrame PASS');
        
        Utils.emitEvent("emitWebResourceRequest_IsMainFrame", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebResourceRequest_IsMainFrame", true, 7720, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0150
     * @tc.name       : testWebResourceRequest_IsRedirect0150
     * @tc.desc       : test WebResourceRequest_IsRedirect
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResourceRequest_IsRedirect', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_IsRedirect PASS');
        
        Utils.emitEvent("emitWebResourceRequest_IsRedirect", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebResourceRequest_IsRedirect", true, 7721, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0160
     * @tc.name       : testWebSchemeHandler_GetUserData0160
     * @tc.desc       : test WebSchemeHandler_GetUserData
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebSchemeHandler_GetUserData', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebSchemeHandler_GetUserData PASS');
        
        Utils.emitEvent("emitWebSchemeHandler_GetUserData", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebSchemeHandler_GetUserData", true, 7722, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0170
     * @tc.name       : testWebSchemeHandler_SetUserData0170
     * @tc.desc       : test WebSchemeHandler_SetUserData
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebSchemeHandler_SetUserData', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebSchemeHandler_SetUserData PASS');
        
        Utils.emitEvent("emitWebSchemeHandler_SetUserData", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebSchemeHandler_SetUserData", true, 7723, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0180
     * @tc.name       : testWebResourceRequest_GetReferrer0180
     * @tc.desc       : test WebResourceRequest_GetReferrer
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResourceRequest_GetReferrer', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_GetReferrer PASS');
        
        Utils.emitEvent("emitWebResourceRequest_GetReferrer", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebResourceRequest_GetReferrer", true, 7724, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0190
     * @tc.name       : testWebResourceRequest_SetUserData0190
     * @tc.desc       : test WebResourceRequest_SetUserData
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResourceRequest_SetUserData', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_SetUserData PASS');
        
        Utils.emitEvent("emitWebResourceRequest_SetUserData", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebResourceRequest_SetUserData", true, 7725, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0200
     * @tc.name       : testWebResourceRequest_GetUserData0200
     * @tc.desc       : test WebResourceRequest_GetUserData
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResourceRequest_GetUserData', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_GetUserData PASS');
        
        Utils.emitEvent("emitWebResourceRequest_GetUserData", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebResourceRequest_GetUserData", true, 7726, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0210
     * @tc.name       : testWebResourceRequest_Destroy0210
     * @tc.desc       : test WebResourceRequest_Destroy
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResourceRequest_Destroy', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_Destroy PASS');
        
        Utils.emitEvent("emitWebResourceRequest_Destroy", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebResourceRequest_Destroy", true, 7727, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0220
     * @tc.name       : testWebResponse_GetUrl0220
     * @tc.desc       : test WebResponse_GetUrl
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResponse_GetUrl', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_GetUrl PASS');
        
        Utils.emitEvent("emitWebResponse_GetUrl", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebResponse_GetUrl", true, 7728, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0230
     * @tc.name       : testWebResponse_GetError0230
     * @tc.desc       : test WebResponse_GetError
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResponse_GetError', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_GetError PASS');
        
        Utils.emitEvent("emitWebResponse_GetError", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebResponse_GetError", true, 7729, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0240
     * @tc.name       : testWebResponse_GetStatus0240
     * @tc.desc       : test WebResponse_GetStatus
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResponse_GetStatus', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_GetStatus PASS');
        
        Utils.emitEvent("emitWebResponse_GetStatus", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebResponse_GetStatus", true, 7730, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0250
     * @tc.name       : testWebResponse_GetStatusText0250
     * @tc.desc       : test WebResponse_GetStatusText
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResponse_GetStatusText', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_GetStatusText PASS');
        
        Utils.emitEvent("emitWebResponse_GetStatusText", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebResponse_GetStatusText", true, 7731, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0260
     * @tc.name       : testWebResponse_GetMimeType0260
     * @tc.desc       : test WebResponse_GetMimeType
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResponse_GetMimeType', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_GetMimeType PASS');
        
        Utils.emitEvent("emitWebResponse_GetMimeType", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebResponse_GetMimeType", true, 7732, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0270
     * @tc.name       : testWebResponse_GetCharset0270
     * @tc.desc       : test WebResponse_GetCharset
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResponse_GetCharset', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_GetCharset PASS');
        
        Utils.emitEvent("emitWebResponse_GetCharset", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebResponse_GetCharset", true, 7733, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0280
     * @tc.name       : testWebResponse_GetHeaderByName0280
     * @tc.desc       : test WebResponse_GetHeaderByName
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResponse_GetHeaderByName', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_GetHeaderByName PASS');
        
        Utils.emitEvent("emitWebResponse_GetHeaderByName", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebResponse_GetHeaderByName", true, 7734, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0290
     * @tc.name       : testWebResponse_SetUrl0290
     * @tc.desc       : test WebResponse_SetUrl
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResponse_SetUrl', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetUrl PASS');
        
        Utils.emitEvent("emitWebResponse_SetUrl", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebResponse_SetUrl", true, 7735, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0300
     * @tc.name       : testWebResponse_SetError0300
     * @tc.desc       : test WebResponse_SetError
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResponse_SetError', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetError PASS');
        
        Utils.emitEvent("emitWebResponse_SetError", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebResponse_SetError", true, 7736, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0310
     * @tc.name       : testWebResponse_SetStatus0310
     * @tc.desc       : test WebResponse_SetStatus
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResponse_SetStatus', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetStatus PASS');
        
        Utils.emitEvent("emitWebResponse_SetStatus", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebResponse_SetStatus", true, 7737, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0320
     * @tc.name       : testWebResponse_SetStatusText0320
     * @tc.desc       : test WebResponse_SetStatusText
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResponse_SetStatusText', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetStatusText PASS');
        
        Utils.emitEvent("emitWebResponse_SetStatusText", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebResponse_SetStatusText", true, 7738, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0330
     * @tc.name       : testWebResponse_SetMimeType0330
     * @tc.desc       : test WebResponse_SetMimeType
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResponse_SetMimeType', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetMimeType PASS');
        
        Utils.emitEvent("emitWebResponse_SetMimeType", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebResponse_SetMimeType", true, 7739, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0340
     * @tc.name       : testWebResponse_SetCharset0340
     * @tc.desc       : test WebResponse_SetCharset
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResponse_SetCharset', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetCharset PASS');
        
        Utils.emitEvent("emitWebResponse_SetCharset", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebResponse_SetCharset", true, 7740, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0350
     * @tc.name       : testWebResponse_SetHeaderByNmae0350
     * @tc.desc       : test WebResponse_SetHeaderByNmae
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResponse_SetHeaderByName', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetHeaderByName PASS');
        
        Utils.emitEvent("emitWebResponse_SetHeaderByName", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebResponse_SetHeaderByName", true, 7741, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0360
     * @tc.name       : testWeb_CreateResponse0360
     * @tc.desc       : test Web_CreateResponse
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeb_CreateResponse', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_CreateResponse PASS');
        
        Utils.emitEvent("emitWeb_CreateResponse", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWeb_CreateResponse", true, 7742, done);
        sendEventByKey('webHostingButton', 10, '');
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0361
     * @tc.name       : testWebResourceRequest_GetResourceType
     * @tc.desc       : test WebResourceRequest_GetResourceType
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResourceRequest_GetResourceType', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_GetResourceType PASS');

      Utils.emitEvent("emitWebResourceRequest_GetResourceType", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWebResourceRequest_GetResourceType", true, 7743, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0362
     * @tc.name       : testWebResourceRequest_GetFrameUrl
     * @tc.desc       : test WebResourceRequest_GetFrameUrl
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResourceRequest_GetFrameUrl', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_GetFrameUrl PASS');

      Utils.emitEvent("emitWebResourceRequest_GetFrameUrl", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWebResourceRequest_GetFrameUrl", true, 7744, done);
      sendEventByKey('webHostingButton', 10, '');
    })
    
  })
}
