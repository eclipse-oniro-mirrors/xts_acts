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
let emitKey = ''

export default function ActsAceWebViewSdkSchemeHandlerEnhanced() {
  describe('ActsAceWebViewSdkSchemeHandlerEnhanced', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'MainAbility/pages/webViewSdkSchemeHandlerEnhanced',
        }
        
        try {
            await Utils.sleep(1000)
            router.clear();
            let pages = router.getState();
            console.info("get webViewSdkSchemeHandlerEnhanced state success " + JSON.stringify(pages));
            if (!("webViewSdkSchemeHandlerEnhanced" == pages.name)) {
                console.info("get webViewSdkSchemeHandlerEnhanced state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                await Utils.sleep(1000);
                console.info("push webViewSdkSchemeHandlerEnhanced state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewSdkSchemeHandlerEnhanced page error:" + err);
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
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_setUrl_null_API_0001
     *@tc.name testWebViewSdkSchemeHandler_SdkSchemeHandler_setUrl_null
     *@tc.desc test SdkSchemeHandler_setUrl_null
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_setUrl_null', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_setUrl_null"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_setUrl_null", true, 1539, done);
      sendEventByKey('webViewSdkSchemeHandlerEnhanced', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_isChunked_false_API_0001
     *@tc.name testWebViewSdkSchemeHandler_SdkSchemeHandler_isChunked_false
     *@tc.desc test SdkSchemeHandler_isChunked_false
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_isChunked_false', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_isChunked_false"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_isChunked_false", true, 1536, done);
      sendEventByKey('webViewSdkSchemeHandlerEnhanced', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_isEof_false_API_0001
     *@tc.name testWebViewSdkSchemeHandler_SdkSchemeHandler_isEof_false
     *@tc.desc test SdkSchemeHandler_isEof_false
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_isEof_false', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_isEof_false"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_isEof_false", true, 1537, done);
      sendEventByKey('webViewSdkSchemeHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_isInMemory_false_API_0001
     *@tc.name testWebViewSdkSchemeHandler_SdkSchemeHandler_isInMemory_false
     *@tc.desc test SdkSchemeHandler_isInMemory_false
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_isInMemory_false', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_isInMemory_false"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_isInMemory_false", true, 1538, done);
      sendEventByKey('webViewSdkSchemeHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_mainFrame_false_API_0001
     *@tc.name testWebViewSdkSchemeHandler_SdkSchemeHandler_isInMemory_false
     *@tc.desc test SdkSchemeHandler_isInMemory_false
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_isMainFrame_false', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_isMainFrame_false"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_isMainFrame_false", true, 1541, done);
      sendEventByKey('webViewSdkSchemeHandlerEnhanced', 10, '');
    })

  })
}
