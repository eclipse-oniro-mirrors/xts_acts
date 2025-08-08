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
let emitKey = ""

export default function ActsAceWebViewSdkTestFrameUrl() {
  describe('ActsAceWebViewSdkTestFrameUrl', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewSdkTestFrameUrl',
        }
        
        try {
            await Utils.sleep(1000)
            router.clear();
            let pages = router.getState();
            console.info("get webViewSdkTestFrameUrl state success " + JSON.stringify(pages));
            if (!("webViewSdkTestFrameUrl" == pages.name)) {
                console.info("get webViewSdkTestFrameUrl state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                await Utils.sleep(1000);
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
        await Utils.sleep(2000);
        done();
    })

      afterEach(async (done: Function) => {
        try {
            let backData: events_emitter.EventData = {
                data: {
                    "ACTION": emitKey
                }
            }
            let backEvent : events_emitter.InnerEvent = {
                eventId: 10,
                priority: events_emitter.EventPriority.LOW
            }
            console.info("start send emitKey");
            events_emitter.emit(backEvent, backData);
        } catch (err) {
            console.error("emit emitKey error:" + JSON.stringify(err));
        }
        await Utils.sleep(1000);
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
        Utils.emitEvent(emitKey, 10);
        Utils.registerEvent("testWebViewSdkTestMainFrameUrl", true, 1535, done);
        sendEventByKey('webViewSdkTestFrameUrl', 10, '');
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
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkTestLoadUrlFrameUrl", true, 1537, done);
      sendEventByKey('webViewSdkTestFrameUrl', 10, '');
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
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkTestSubFrameUrl", true, 1538, done);
      sendEventByKey('webViewSdkTestFrameUrl', 10, '');
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
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkTestServiceWorkerFrameUrl", true, 1536, done);
      sendEventByKey('webViewSdkTestFrameUrl', 10, '');
    })
  })
}
