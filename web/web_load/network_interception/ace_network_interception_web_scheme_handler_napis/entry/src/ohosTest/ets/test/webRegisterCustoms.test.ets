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
import { beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const EVENT_ID_SET_EIMIT_KEY = 142700;
const driver = Driver.create();

export default function webviewApi() {

  describe('webRegisterCustoms', () => {
      
    beforeEach(async (done:Function) => {
        config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })


    
    /**
     * @tc.name   testGetNativeAPI
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0060
     * @tc.desc   test GetNativeAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetNativeAPI', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testGetNativeAPI PASS');
        
        Utils.emitEvent("emitGetNativeAPI", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testGetNativeAPI", true, 142710, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })
    
    /**
     * @tc.name   testWebResourceRequest_GetUrl
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0070
     * @tc.desc   test WebResourceRequest_GetUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResourceRequest_GetUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_GetUrl PASS');
        
        Utils.emitEvent("emitWebResourceRequest_GetUrl", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWebResourceRequest_GetUrl", true, 142720, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })
    
    /**
     * @tc.name   testWebResourceRequest_GetMethod
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0080
     * @tc.desc   test WebResourceRequest_GetMethod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResourceRequest_GetMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_GetMethod PASS');
        
        Utils.emitEvent("emitWebResourceRequest_GetMethod", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWebResourceRequest_GetMethod", true, 142730, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })
    
    /**
     * @tc.name   testWebResourceRequest_GetHttpBodyStream
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0090
     * @tc.desc   test WebResourceRequest_GetHttpBodyStream
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResourceRequest_GetHttpBodyStream', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_GetHttpBodyStream PASS');
        
        Utils.emitEvent("emitWebResourceRequest_GetHttpBodyStream", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWebResourceRequest_GetHttpBodyStream", true, 142740, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })
    
    /**
     * @tc.name   testWebRequestHeaderList_GetSize
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0100
     * @tc.desc   test WebRequestHeaderList_GetSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebRequestHeaderList_GetSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebRequestHeaderList_GetSize PASS');
        
        Utils.emitEvent("emitWebRequestHeaderList_GetSize", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWebRequestHeaderList_GetSize", true, 142750, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })
    
    /**
     * @tc.name   testWebRequestHeaderList_GetHeader
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0110
     * @tc.desc   test WebRequestHeaderList_GetHeader
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebRequestHeaderList_GetHeader', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebRequestHeaderList_GetHeader PASS');
        
        Utils.emitEvent("emitWebRequestHeaderList_GetHeader", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWebRequestHeaderList_GetHeader", true, 142760, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })
    
    /**
     * @tc.name   testWebRequestHeaderList_Destroy
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0120
     * @tc.desc   test WebRequestHeaderList_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebRequestHeaderList_Destroy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebRequestHeaderList_Destroy PASS');
        
        Utils.emitEvent("emitWebRequestHeaderList_Destroy", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWebRequestHeaderList_Destroy", true, 142770, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })
    
    /**
     * @tc.name   testWebResourceRequest_HasGesture
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0130
     * @tc.desc   test WebResourceRequest_HasGesture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResourceRequest_HasGesture', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_HasGesture PASS');
        
        Utils.emitEvent("emitWebResourceRequest_HasGesture", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWebResourceRequest_HasGesture", true, 142780, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })
    
    /**
     * @tc.name   testWebResourceRequest_IsMainFrame
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0140
     * @tc.desc   test WebResourceRequest_IsMainFrame
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResourceRequest_IsMainFrame', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_IsMainFrame PASS');
        
        Utils.emitEvent("emitWebResourceRequest_IsMainFrame", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWebResourceRequest_IsMainFrame", true, 142790, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })
    
    /**
     * @tc.name   testWebResourceRequest_IsRedirect
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0150
     * @tc.desc   test WebResourceRequest_IsRedirect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResourceRequest_IsRedirect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_IsRedirect PASS');
        
        Utils.emitEvent("emitWebResourceRequest_IsRedirect", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWebResourceRequest_IsRedirect", true, 142701, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })
    
    /**
     * @tc.name   testWebSchemeHandler_GetUserData
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0160
     * @tc.desc   test WebSchemeHandler_GetUserData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebSchemeHandler_GetUserData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebSchemeHandler_GetUserData PASS');
        
        Utils.emitEvent("emitWebSchemeHandler_GetUserData", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWebSchemeHandler_GetUserData", true, 142711, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })
    
    /**
     * @tc.name   testWebSchemeHandler_SetUserData
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0170
     * @tc.desc   test WebSchemeHandler_SetUserData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebSchemeHandler_SetUserData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebSchemeHandler_SetUserData PASS');
        
        Utils.emitEvent("emitWebSchemeHandler_SetUserData", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWebSchemeHandler_SetUserData", true, 142721, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })
    
    /**
     * @tc.name   testWebResourceRequest_GetReferrer
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0180
     * @tc.desc   test WebResourceRequest_GetReferrer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResourceRequest_GetReferrer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_GetReferrer PASS');
        
        Utils.emitEvent("emitWebResourceRequest_GetReferrer", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWebResourceRequest_GetReferrer", true, 142731, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })
    
    /**
     * @tc.name   testWebResourceRequest_SetUserData
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0190
     * @tc.desc   test WebResourceRequest_SetUserData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResourceRequest_SetUserData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_SetUserData PASS');
        
        Utils.emitEvent("emitWebResourceRequest_SetUserData", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWebResourceRequest_SetUserData", true, 142741, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })
    
    /**
     * @tc.name   testWebResourceRequest_GetUserData
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0200
     * @tc.desc   test WebResourceRequest_GetUserData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResourceRequest_GetUserData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_GetUserData PASS');
        
        Utils.emitEvent("emitWebResourceRequest_GetUserData", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWebResourceRequest_GetUserData", true, 142751, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })
    
    /**
     * @tc.name   testWebResourceRequest_Destroy
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0210
     * @tc.desc   test WebResourceRequest_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResourceRequest_Destroy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_Destroy PASS');
        
        Utils.emitEvent("emitWebResourceRequest_Destroy", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWebResourceRequest_Destroy", true, 142761, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })
    
    /**
     * @tc.name   testWebResponse_GetUrl
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0220
     * @tc.desc   test WebResponse_GetUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResponse_GetUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_GetUrl PASS');
        
        Utils.emitEvent("emitWebResponse_GetUrl", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWebResponse_GetUrl", true, 142771, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })


    
    /**
     * @tc.name   testWebResponse_GetStatus
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0240
     * @tc.desc   test WebResponse_GetStatus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResponse_GetStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_GetStatus PASS');
        
        Utils.emitEvent("emitWebResponse_GetStatus", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWebResponse_GetStatus", true, 142781, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })
    
    /**
     * @tc.name   testWebResponse_GetStatusText
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0250
     * @tc.desc   test WebResponse_GetStatusText
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResponse_GetStatusText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_GetStatusText PASS');
        
        Utils.emitEvent("emitWebResponse_GetStatusText", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWebResponse_GetStatusText", true, 142791, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })
    
    /**
     * @tc.name   testWebResponse_GetMimeType
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0260
     * @tc.desc   test WebResponse_GetMimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResponse_GetMimeType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_GetMimeType PASS');
        
        Utils.emitEvent("emitWebResponse_GetMimeType", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWebResponse_GetMimeType", true, 142702, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })
    
    /**
     * @tc.name   testWebResponse_GetCharset
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0270
     * @tc.desc   test WebResponse_GetCharset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResponse_GetCharset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_GetCharset PASS');
        
        Utils.emitEvent("emitWebResponse_GetCharset", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWebResponse_GetCharset", true, 142712, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })
    
    /**
     * @tc.name   testWebResponse_GetHeaderByName
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0280
     * @tc.desc   test WebResponse_GetHeaderByName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResponse_GetHeaderByName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_GetHeaderByName PASS');
        
        Utils.emitEvent("emitWebResponse_GetHeaderByName", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWebResponse_GetHeaderByName", true, 142722, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })
    
    /**
     * @tc.name   testWebResponse_SetUrl
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0290
     * @tc.desc   test WebResponse_SetUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResponse_SetUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetUrl PASS');
        
        Utils.emitEvent("emitWebResponse_SetUrl", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWebResponse_SetUrl", true, 142732, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })

    
    /**
     * @tc.name   testWebResponse_SetStatus
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0310
     * @tc.desc   test WebResponse_SetStatus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResponse_SetStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetStatus PASS');
        
        Utils.emitEvent("emitWebResponse_SetStatus", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWebResponse_SetStatus", true, 142742, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })
    
    /**
     * @tc.name   testWebResponse_SetStatusText
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0320
     * @tc.desc   test WebResponse_SetStatusText
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResponse_SetStatusText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetStatusText PASS');
        
        Utils.emitEvent("emitWebResponse_SetStatusText", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWebResponse_SetStatusText", true, 142752, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })
    
    /**
     * @tc.name   testWebResponse_SetMimeType
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0330
     * @tc.desc   test WebResponse_SetMimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResponse_SetMimeType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetMimeType PASS');
        
        Utils.emitEvent("emitWebResponse_SetMimeType", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWebResponse_SetMimeType", true, 142762, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })
    
    /**
     * @tc.name   testWebResponse_SetCharset
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0340
     * @tc.desc   test WebResponse_SetCharset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResponse_SetCharset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetCharset PASS');
        
        Utils.emitEvent("emitWebResponse_SetCharset", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWebResponse_SetCharset", true, 142772, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })
    
    /**
     * @tc.name   testWebResponse_SetHeaderByName
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0350
     * @tc.desc   test WebResponse_SetHeaderByNmae
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResponse_SetHeaderByName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetHeaderByName PASS');
        
        Utils.emitEvent("emitWebResponse_SetHeaderByName", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWebResponse_SetHeaderByName", true, 142782, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })
    
    /**
     * @tc.name   testWeb_CreateResponse
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0360
     * @tc.desc   test Web_CreateResponse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWeb_CreateResponse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_CreateResponse PASS');
        
        Utils.emitEvent("emitWeb_CreateResponse", EVENT_ID_SET_EIMIT_KEY)
        let isReturn = 0;
        Utils.registerEvent("testWeb_CreateResponse", true, 142792, ()=> {isReturn = 1});
        await Utils.waitAndClickComponent(driver, "webHostingButton");
        await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
        done();
    })

    /**
     * @tc.name   testWebResourceRequest_GetResourceType
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0361
     * @tc.desc   test WebResourceRequest_GetResourceType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResourceRequest_GetResourceType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_GetResourceType PASS');

      Utils.emitEvent("emitWebResourceRequest_GetResourceType", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerEvent("testWebResourceRequest_GetResourceType", true, 142703, ()=> {isReturn = 1});
      await Utils.waitAndClickComponent(driver, "webHostingButton");
      await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
      done();
    })

    /**
     * @tc.name   testWebResourceRequest_GetFrameUrl
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0362
     * @tc.desc   test WebResourceRequest_GetFrameUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResourceRequest_GetFrameUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_GetFrameUrl PASS');

      Utils.emitEvent("emitWebResourceRequest_GetFrameUrl", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerEvent("testWebResourceRequest_GetFrameUrl", true, 142713, ()=> {isReturn = 1});
      await Utils.waitAndClickComponent(driver, "webHostingButton");
      await Utils.waitForExist(()=>isReturn, "testGetNativeAPI", 1, 1000);
      done();
    })
    
  })
}
