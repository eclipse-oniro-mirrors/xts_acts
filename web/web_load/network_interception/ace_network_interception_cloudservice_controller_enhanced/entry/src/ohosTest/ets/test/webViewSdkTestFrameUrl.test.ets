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
import { Driver } from '@kit.TestKit';
import { waitForExist } from './WaitTest';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = ""
const  driver = Driver.create();
export default function ActsAceWebViewSdkTestFrameUrl() {
  describe('ActsAceWebViewSdkTestFrameUrl', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewSdkTestFrameUrl',
        }
        
        try {
            router.clear();
            let pages = router.getState();
            console.info("get webViewSdkTestFrameUrl state success " + JSON.stringify(pages));
            if (!("webViewSdkTestFrameUrl" == pages.name)) {
                console.info("get webViewSdkTestFrameUrl state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                console.info("push webViewSdkTestFrameUrl state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewSdkTestFrameUrl page error:" + err);
        }
        done()
    });
    
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
        done();
    })

    /*
     *@tc.number SUB_ACE_WEB_NET_FRAMEURL_0100
     *@tc.name testWebViewSdkTestMainFrameUrl
     *@tc.desc test SdkTestMainFrameUrl
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkTestMainFrameUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkTestMainFrameUrl"
      Utils.emitEvent(emitKey, 142011);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkTestMainFrameUrl", true, 142020, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webViewSdkTestFrameUrl",driver);
      await waitForExist(() => isReturn, "testWebViewSdkTestMainFrameUrl", true, 1000);
      done();
    })


    /*
     *@tc.number SUB_ACE_WEB_NET_FRAMEURL_0300
     *@tc.name testWebViewSdkTestLoadUrlFrameUrl
     *@tc.desc test SdkSchemeHandler_getRequestMethod
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkTestLoadUrlFrameUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkTestLoadUrlFrameUrl"
      Utils.emitEvent(emitKey, 142011);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkTestLoadUrlFrameUrl", true, 142030, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webViewSdkTestFrameUrl",driver);
      await waitForExist(() => isReturn, "emitWebViewSdkTestLoadUrlFrameUrl", true, 1000);
      done();
    })


    /*
     *@tc.number SUB_ACE_WEB_NET_FRAMEURL_0400
     *@tc.name testWebViewSdkTestSubFrameUrl
     *@tc.desc test SdkSchemeHandler_getReferrer
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkTestSubFrameUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkTestSubFrameUrl"
      Utils.emitEvent(emitKey, 142011);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkTestSubFrameUrl", true, 142040, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webViewSdkTestFrameUrl",driver);
      await waitForExist(() => isReturn, "testWebViewSdkTestSubFrameUrl", true, 1000);
      done();
    })

    /*
     *@tc.number SUB_ACE_WEB_NET_FRAMEURL_0200
     *@tc.name testWebViewSdkTestServiceWorkerFrameUrl
     *@tc.desc test SdkSchemeHandler_getRequestUrl
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkTestServiceWorkerFrameUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkTestServiceWorkerFrameUrl"
      Utils.emitEvent(emitKey, 142011);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkTestServiceWorkerFrameUrl", true, 142050, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webViewSdkTestFrameUrl",driver);
      await waitForExist(() => isReturn, "testWebViewSdkTestServiceWorkerFrameUrl", true, 1000);
      done();
    })
  })
}
