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
const EVENT_ID_SET_EIMIT_KEY = 142600;
const driver = Driver.create();


export default function webviewApi() {

  describe('webRegisterCustomsTwo', () => {
      
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
     * @tc.name   testWebSchemeHandler_SetOnRequestStart
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0510
     * @tc.desc   test WebSchemeHandler_SetOnRequestStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebSchemeHandler_SetOnRequestStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebSchemeHandler_SetOnRequestStart PASS');
        
        Utils.emitEvent("emitWebSchemeHandler_SetOnRequestStart", EVENT_ID_SET_EIMIT_KEY)
        Utils.registerEvent("testWebSchemeHandler_SetOnRequestStart", true, 142610, done);
        Utils.waitAndClickComponent(driver, "webHostingButton");
    })

    /**
     * @tc.name   testWebSchemeHandler_SetOnRequestStop
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0520
     * @tc.desc   test WebSchemeHandler_SetOnRequestStop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebSchemeHandler_SetOnRequestStop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebSchemeHandler_SetOnRequestStop PASS');
        
        Utils.emitEvent("emitWebSchemeHandler_SetOnRequestStop", EVENT_ID_SET_EIMIT_KEY)
        Utils.registerEvent("testWebSchemeHandler_SetOnRequestStop", true, 142620, done);
        Utils.waitAndClickComponent(driver, "webHostingButton");
    })
    
    /**
     * @tc.name   testWeb_ReleaseByteArray
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0530
     * @tc.desc   test Web_ReleaseByteArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWeb_ReleaseByteArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ReleaseByteArray PASS');
        
        Utils.emitEvent("emitWeb_ReleaseByteArray", EVENT_ID_SET_EIMIT_KEY)
        Utils.registerEvent("testWeb_ReleaseByteArray", true, 142630, done);
        Utils.waitAndClickComponent(driver, "webHostingButton");
    })
    
    
    /**
     * @tc.name   testWeb_ReleaseString
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0540
     * @tc.desc   test Web_ReleaseString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWeb_ReleaseString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ReleaseString PASS');
        
        Utils.emitEvent("emitWeb_ReleaseString", EVENT_ID_SET_EIMIT_KEY)
        Utils.registerEvent("testWeb_ReleaseString", true, 142640, done);
        Utils.waitAndClickComponent(driver, "webHostingButton");
    })
    
    /**
     * @tc.name   testWeb_DestroyResponse
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0550
     * @tc.desc   test Web_DestroyResponse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWeb_DestroyResponse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_DestroyResponse PASS');
        
        Utils.emitEvent("emitWeb_DestroyResponse", EVENT_ID_SET_EIMIT_KEY)
        Utils.registerEvent("testWeb_DestroyResponse", true, 142650, done);
        Utils.waitAndClickComponent(driver, "webHostingButton");
    })
    
    /**
     * @tc.name   testWeb_CreateSchemeHandler
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0560
     * @tc.desc   test Web_CreateSchemeHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWeb_CreateSchemeHandler', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_CreateSchemeHandler PASS');
        
        Utils.emitEvent("emitWeb_CreateSchemeHandler", EVENT_ID_SET_EIMIT_KEY)
        Utils.registerEvent("testWeb_CreateSchemeHandler", true, 142660, done);
        Utils.waitAndClickComponent(driver, "webHostingButton");
    })
    
    /**
     * @tc.name   testWebResourceRequest_GetRequestHeaders
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0570
     * @tc.desc   test WebResourceRequest_GetRequestHeaders
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResourceRequest_GetRequestHeaders', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_GetRequestHeaders PASS');
        
        Utils.emitEvent("emitWebResourceRequest_GetRequestHeaders", EVENT_ID_SET_EIMIT_KEY)
        Utils.registerEvent("testWebResourceRequest_GetRequestHeaders", true, 142670, done);
        Utils.waitAndClickComponent(driver, "webHostingButton");
    })    
  })
}
