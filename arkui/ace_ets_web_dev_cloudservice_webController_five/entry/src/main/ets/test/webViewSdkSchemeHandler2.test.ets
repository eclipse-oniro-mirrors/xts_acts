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

export default function ActsAceWebViewSdkSchemeHandler2() {
  describe('ActsAceWebViewSdkSchemeHandler2', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'MainAbility/pages/webViewSdkSchemeHandler2',
        }
        
        try {
            await Utils.sleep(1000)
            router.clear();
            let pages = router.getState();
            console.info("get webViewSdkSchemeHandler state success " + JSON.stringify(pages));
            if (!("webViewSdkSchemeHandler2" == pages.name)) {
                console.info("get webViewSdkSchemeHandler state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                await Utils.sleep(1000);
                console.info("push webViewSdkSchemeHandler state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewSdkSchemeHandler page error:" + err);
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
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_getHttpBodyStream_API_0001
     *@tc.name testWebViewSdkSchemeHandler_SdkSchemeHandler_getHttpBodyStream
     *@tc.desc test SdkSchemeHandler_getHttpBodyStream
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_getHttpBodyStream', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_getHttpBodyStream"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_getHttpBodyStream", true, 1507, done);
      sendEventByKey('webViewSdkSchemeHandler2', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SchemeHandler_getSize_API_0001
     *@tc.name testWebViewSdkSchemeHandler_getSize
     *@tc.desc test SdkSchemeHandler_getSize
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_getSize', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_getSize"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_getSize", true, 1508, done);
      sendEventByKey('webViewSdkSchemeHandler2', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_getPosition_API_0001
     *@tc.name testWebViewSdkSchemeHandler_SdkSchemeHandler_getPosition
     *@tc.desc test SdkSchemeHandler_getPosition
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_getPosition', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_getPosition"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_getPosition", true, 1509, done);
      sendEventByKey('webViewSdkSchemeHandler2', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_isChunked_API_0001
     *@tc.name testWebViewSdkSchemeHandler_SdkSchemeHandler_isChunked
     *@tc.desc test SdkSchemeHandler_isChunked
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_isChunked', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_isChunked"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_isChunked", true, 1510, done);
      sendEventByKey('webViewSdkSchemeHandler2', 10, '');
    })


    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_isEof_API_0001
     *@tc.name testWebViewSdkSchemeHandler_SdkSchemeHandler_isEof
     *@tc.desc test SdkSchemeHandler_isEof
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_isEof', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_isEof"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_isEof", true, 1511, done);
      sendEventByKey('webViewSdkSchemeHandler2', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_isInMemory_API_0001
     *@tc.name testWebViewSdkSchemeHandler_SdkSchemeHandler_isInMemory
     *@tc.desc test SdkSchemeHandler_isInMemory
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_isInMemory', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_isInMemory"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_isInMemory", true, 1512, done);
      sendEventByKey('webViewSdkSchemeHandler2', 10, '');
    })
  })
}
