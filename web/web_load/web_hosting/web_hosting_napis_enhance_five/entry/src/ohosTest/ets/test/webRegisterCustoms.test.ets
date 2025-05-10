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
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';


export default function webviewApi() {

  describe('webRegisterCustoms', () => {
      
    beforeEach(async (done:Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(1000);
      console.info("web beforeEach start");
      done();
    })

    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0010
     * @tc.name       : testRegisterCustoms
     * @tc.desc       : test RegisterCustoms
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testRegisterCustoms', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testRegisterCustoms PASS');
        
        Utils.emitEvent("emitRegisterCustoms", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testRegisterCustoms", true, 7707, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0020
     * @tc.name       : testSetSchemeHandler
     * @tc.desc       : test SetSchemeHandler
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testSetSchemeHandler', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testSetSchemeHandler PASS');
        
        Utils.emitEvent("emitSetSchemeHandler", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testSetSchemeHandler", true, 7708, done);
        sendEventByKey('webHostingButton', 10, '');
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0030
     * @tc.name       : testClearSchemeHandlers
     * @tc.desc       : test ClearSchemeHandlers
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testClearSchemeHandlers', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testClearSchemeHandlers PASS');
        
        Utils.emitEvent("emitClearSchemeHandlers", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testClearSchemeHandlers", true, 7709, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0040
     * @tc.name       : testServiceWorkerClearSchemeHandlers
     * @tc.desc       : test ServiceWorkerClearSchemeHandlers
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testServiceWorkerClearSchemeHandlers', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testServiceWorkerClearSchemeHandlers PASS');
        
        Utils.emitEvent("emitServiceWorkerClearSchemeHandlers", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testServiceWorkerClearSchemeHandlers", true, 7710, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    
    
    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0050
     * @tc.name       : testDestroySchemeHandler
     * @tc.desc       : test DestroySchemeHandler
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testDestroySchemeHandler', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testDestroySchemeHandler PASS');
        
        Utils.emitEvent("emitDestroySchemeHandler", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testDestroySchemeHandler", true, 7711, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0362
     * @tc.name       : testWebResourceRequest_GetFrameUrl
     * @tc.desc       : test WebResourceRequest_GetFrameUrl
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWebResourceRequest_GetFrameUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_GetFrameUrl PASS');

      Utils.emitEvent("emitWebResourceRequest_GetFrameUrl", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWebResourceRequest_GetFrameUrl", true, 7744, done);
      sendEventByKey('webHostingButton', 10, '');
    })
    
  })
}
