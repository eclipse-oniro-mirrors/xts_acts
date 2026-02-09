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
import { Driver } from '@kit.TestKit';
import { waitForExist } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

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
     * @tc.name   testRegisterCustoms
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0010
     * @tc.desc   test RegisterCustoms
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegisterCustoms', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
      hilog.info(0x0000, 'testTag', '%{public}s', 'testRegisterCustoms PASS');
      Utils.emitEvent("emitRegisterCustoms", 147301)
      let isReturn = false;
      Utils.registerEvent("testRegisterCustoms", true, 147350, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'emitRegisterCustoms', true,1000);
      done();
    })
    
    /**
     * @tc.name   testSetSchemeHandler
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0020
     * @tc.desc   test SetSchemeHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetSchemeHandler', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
      hilog.info(0x0000, 'testTag', '%{public}s', 'testSetSchemeHandler PASS');
      Utils.emitEvent("emitSetSchemeHandler", 147301)
      let isReturn = false;
      Utils.registerEvent("testSetSchemeHandler", true, 147360, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'emitSetSchemeHandler', true,1000);
      done();
    })

    /**
     * @tc.name   testClearSchemeHandlers
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0030
     * @tc.desc   test ClearSchemeHandlers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearSchemeHandlers', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
      hilog.info(0x0000, 'testTag', '%{public}s', 'testClearSchemeHandlers PASS');
      Utils.emitEvent("emitClearSchemeHandlers", 147301)
      let isReturn = false;
      Utils.registerEvent("testClearSchemeHandlers", true, 147370, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'emitClearSchemeHandlers', true,1000);
      done();
    })
    
    /**
     * @tc.name   testServiceWorkerClearSchemeHandlers
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0040
     * @tc.desc   test ServiceWorkerClearSchemeHandlers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testServiceWorkerClearSchemeHandlers', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
      hilog.info(0x0000, 'testTag', '%{public}s', 'testServiceWorkerClearSchemeHandlers PASS');
      Utils.emitEvent("emitServiceWorkerClearSchemeHandlers", 147301)
      let isReturn = false;
      Utils.registerEvent("testServiceWorkerClearSchemeHandlers", true, 147380, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'emitServiceWorkerClearSchemeHandlers', true,1000);
      done();
    })
    
    
    /**
     * @tc.name   testDestroySchemeHandler
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0050
     * @tc.desc   test DestroySchemeHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDestroySchemeHandler', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
      hilog.info(0x0000, 'testTag', '%{public}s', 'testDestroySchemeHandler PASS');
      Utils.emitEvent("emitDestroySchemeHandler", 147301)
      let isReturn = false;
      Utils.registerEvent("testDestroySchemeHandler", true, 147390, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'emitDestroySchemeHandler', true,1000);
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

      Utils.emitEvent("emitWebResourceRequest_GetFrameUrl", 147301)
      let isReturn = false;
      Utils.registerEvent("testWebResourceRequest_GetFrameUrl", true, 147400, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'emitWebResourceRequest_GetFrameUrl', true,1000);
      done();
    })
    
  })
}
