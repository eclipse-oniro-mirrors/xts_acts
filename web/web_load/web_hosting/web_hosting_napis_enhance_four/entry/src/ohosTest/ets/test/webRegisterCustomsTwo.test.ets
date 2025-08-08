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

  describe('webRegisterCustomsTwo', () => {
      
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
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0500
     * @tc.name       : testWebServiceWorker_SetSchemeHandler
     * @tc.desc       : test WebServiceWorker_SetSchemeHandler
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWebServiceWorker_SetSchemeHandler', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebServiceWorker_SetSchemeHandler PASS');
        
        Utils.emitEvent("emitWebServiceWorker_SetSchemeHandler", 10)
        await Utils.sleep(1000);
        Utils.registerEvent("testWebServiceWorker_SetSchemeHandler", true, 7756, done);
        sendEventByKey('webHostingButton', 10, '');
    })
    

  })
}
