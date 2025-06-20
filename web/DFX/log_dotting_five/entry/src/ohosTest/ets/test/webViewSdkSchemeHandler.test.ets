/**
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
import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = ''

export default function ActsAceWebViewSdkSchemeHandler() {
  describe('ActsAceWebViewSdkSchemeHandler', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewSdkSchemeHandler',
        }
        
        try {
            await Utils.sleep(1000)
            router.clear();
            let pages = router.getState();
            console.info("get webViewSdkSchemeHandler state success " + JSON.stringify(pages));
            if (!("webViewSdkSchemeHandler" == pages.name)) {
                console.info("get webViewSdkSchemeHandler state success " + JSON.stringify(pages.name));
                let result = await router.replaceUrl(options);
                await Utils.sleep(1000);
                console.info("push webViewSdkSchemeHandler state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewSdkSchemeHandler page error:" + err);
        }
        done()
    });
    
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
        await Utils.sleep(2000);
        done();
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_setNetErrorCode_API_0001
     *@tc.name testWebViewSdkSchemeHandler_setNetErrorCode
     *@tc.desc testWebViewSdkSchemeHandler_setNetErrorCode
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandler_setNetErrorCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_setNetErrorCode"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_setNetErrorCode", true, 1516, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_getNetErrorCode_API_0001
     *@tc.name testWebViewSdkSchemeHandler_getNetErrorCode
     *@tc.desc test SdkSchemeHandler_getNetErrorCode
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandler_getNetErrorCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_getNetErrorCode"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_getNetErrorCode", true, 1517, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })
  })
}
