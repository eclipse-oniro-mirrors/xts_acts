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

  describe('webRegisterCustomsTwo', () => {
      
    beforeEach(async (done:Function) => {
      await Utils.sleep(1000);
      console.info("web beforeEach start");
      done();
    })

    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0500
     * @tc.name       : testWebServiceWorker_SetSchemeHandler0500
     * @tc.desc       : test WebServiceWorker_SetSchemeHandler
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebServiceWorker_SetSchemeHandler', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebServiceWorker_SetSchemeHandler PASS');
        
        Utils.emitEvent("emitWebServiceWorker_SetSchemeHandler", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebServiceWorker_SetSchemeHandler", true, 7756, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0510
     * @tc.name       : testWebSchemeHandler_SetOnRequestStart0510
     * @tc.desc       : test WebSchemeHandler_SetOnRequestStart
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebSchemeHandler_SetOnRequestStart', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebSchemeHandler_SetOnRequestStart PASS');
        
        Utils.emitEvent("emitWebSchemeHandler_SetOnRequestStart", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebSchemeHandler_SetOnRequestStart", true, 7757, done);
        sendEventByKey('webHostingButton', 10, '');
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0520
     * @tc.name       : testWebSchemeHandler_SetOnRequestStop0520
     * @tc.desc       : test WebSchemeHandler_SetOnRequestStop
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebSchemeHandler_SetOnRequestStop', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebSchemeHandler_SetOnRequestStop PASS');
        
        Utils.emitEvent("emitWebSchemeHandler_SetOnRequestStop", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebSchemeHandler_SetOnRequestStop", true, 7758, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0530
     * @tc.name       : testWeb_ReleaseByteArray0530
     * @tc.desc       : test Web_ReleaseByteArray
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeb_ReleaseByteArray', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ReleaseByteArray PASS');
        
        Utils.emitEvent("emitWeb_ReleaseByteArray", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWeb_ReleaseByteArray", true, 7759, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0540
     * @tc.name       : testWeb_ReleaseString0540
     * @tc.desc       : test Web_ReleaseString
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeb_ReleaseString', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ReleaseString PASS');
        
        Utils.emitEvent("emitWeb_ReleaseString", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWeb_ReleaseString", true, 7760, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0550
     * @tc.name       : testWeb_DestroyResponse0550
     * @tc.desc       : test Web_DestroyResponse
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeb_DestroyResponse', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_DestroyResponse PASS');
        
        Utils.emitEvent("emitWeb_DestroyResponse", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWeb_DestroyResponse", true, 7761, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0560
     * @tc.name       : testWeb_CreateSchemeHandler0560
     * @tc.desc       : test Web_CreateSchemeHandler
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeb_CreateSchemeHandler', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_CreateSchemeHandler PASS');
        
        Utils.emitEvent("emitWeb_CreateSchemeHandler", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWeb_CreateSchemeHandler", true, 7762, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0570
     * @tc.name       : testWebResourceRequest_GetRequestHeaders0570
     * @tc.desc       : test WebResourceRequest_GetRequestHeaders
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebResourceRequest_GetRequestHeaders', 0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_GetRequestHeaders PASS');
        
        Utils.emitEvent("emitWebResourceRequest_GetRequestHeaders", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebResourceRequest_GetRequestHeaders", true, 7763, done);
        sendEventByKey('webHostingButton', 10, '');
    })    
  })
}
