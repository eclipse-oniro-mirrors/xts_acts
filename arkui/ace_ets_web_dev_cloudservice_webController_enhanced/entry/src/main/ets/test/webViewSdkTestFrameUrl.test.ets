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
import { afterEach, beforeAll, beforeEach, describe, it, expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebViewSdkTestFrameUrl() {
  describe('ActsAceWebViewSdkTestFrameUrl', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'MainAbility/pages/webViewSdkTestFrameUrl',
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
     *@tc.number SUB_ACE_WEB_SdkTestMainFrameUrl_API_0001
     *@tc.name testWebViewSdkTestMainFrameUrl
     *@tc.desc test SdkTestMainFrameUrl
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkTestMainFrameUrl', 0, async (done: Function) => {
        emitKey = "emitWebViewSdkTestMainFrameUrl"
        Utils.emitEvent(emitKey, 10);
        Utils.registerEvent("testWebViewSdkTestMainFrameUrl", true, 1535, done);
        sendEventByKey('webViewSdkTestFrameUrl', 10, '');
    })


    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_getRequestMethod_API_0001
     *@tc.name testWebViewSdkSchemeHandler_getRequestMethod
     *@tc.desc test SdkSchemeHandler_getRequestMethod
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkTestLoadUrlFrameUrl', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkTestLoadUrlFrameUrl"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkTestLoadUrlFrameUrl", true, 1537, done);
      sendEventByKey('webViewSdkTestFrameUrl', 10, '');
    })


    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_getReferrer_API_0001
     *@tc.name testWebViewSdkSchemeHandler_getReferrer
     *@tc.desc test SdkSchemeHandler_getReferrer
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkTestSubFrameUrl', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkTestSubFrameUrl"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkTestSubFrameUrl", true, 1538, done);
      sendEventByKey('webViewSdkTestFrameUrl', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkTestServiceWorkerFrameUrl_API_0001
     *@tc.name testWebViewSdkTestMainFrameUrl
     *@tc.desc test SdkSchemeHandler_getRequestUrl
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkTestServiceWorkerFrameUrl', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkTestServiceWorkerFrameUrl"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkTestServiceWorkerFrameUrl", true, 1536, done);
      sendEventByKey('webViewSdkTestFrameUrl', 10, '');
    })
  })
}
