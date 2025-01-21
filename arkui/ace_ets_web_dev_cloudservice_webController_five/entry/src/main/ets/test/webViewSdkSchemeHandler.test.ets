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

export default function ActsAceWebViewSdkSchemeHandler() {
  describe('ActsAceWebViewSdkSchemeHandler', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'MainAbility/pages/webViewSdkSchemeHandler',
        }
        
        try {
            await Utils.sleep(1000)
            router.clear();
            let pages = router.getState();
            console.info("get webViewSdkSchemeHandler state success " + JSON.stringify(pages));
            if (!("webViewSdkSchemeHandler" == pages.name)) {
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
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_getHeader_API_0001
     *@tc.name testWebViewSdkSchemeHandler
     *@tc.desc test SdkSchemeHandler_getHeader
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_getHeader', 0, async (done: Function) => {
        emitKey = "emitWebViewSdkSchemeHandler_getHeader"
        Utils.emitEvent(emitKey, 10);
        Utils.registerEvent("testWebViewSdkSchemeHandler_getHeader", true, 1501, done);
        sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_getRequestUrl_API_0001
     *@tc.name testWebViewSdkSchemeHandler_getRequestUrl
     *@tc.desc test SdkSchemeHandler_getRequestUrl
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_getRequestUrl', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_getRequestUrl"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_getRequestUrl", true, 1502, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_getRequestMethod_API_0001
     *@tc.name testWebViewSdkSchemeHandler_getRequestMethod
     *@tc.desc test SdkSchemeHandler_getRequestMethod
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_getRequestMethod', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_getRequestMethod"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_getRequestMethod", true, 1503, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })


    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_getReferrer_API_0001
     *@tc.name testWebViewSdkSchemeHandler_getReferrer
     *@tc.desc test SdkSchemeHandler_getReferrer
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_getReferrer', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_getReferrer"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_getReferrer", true, 1504, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_isMainFrame_API_0001
     *@tc.name testWebViewSdkSchemeHandler_isMainFrame
     *@tc.desc test isMainFrame
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_isMainFrame', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_isMainFrame"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_isMainFrame", true, 1505, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_hasGesture_API_0001
     *@tc.name testWebViewSdkSchemeHandler_hasGesture
     *@tc.desc test SdkSchemeHandler_hasGesture
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_hasGesture', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_hasGesture"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_hasGesture", true, 1506, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_constructor_API_0001
     *@tc.name testWebViewSdkSchemeHandler_SdkSchemeHandler_constructor
     *@tc.desc test SdkSchemeHandler_constructor
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_constructor', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_constructor"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_constructor", true, 1513, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_setUrl_API_0001
     *@tc.name testWebViewSdkSchemeHandler_SdkSchemeHandler_setUrl
     *@tc.desc test SdkSchemeHandler_setUrl
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_setUrl', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_setUrl"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_setUrl", true, 1514, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_getUrl_API_0001
     *@tc.name testWebViewSdkSchemeHandler_getUrl
     *@tc.desc test SdkSchemeHandler_getUrl
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_getUrl', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_getUrl"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_getUrl", true, 1515, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_setNetErrorCode_API_0001
     *@tc.name testWebViewSdkSchemeHandler_setNetErrorCode
     *@tc.desc testWebViewSdkSchemeHandler_setNetErrorCode
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_setNetErrorCode', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_setNetErrorCode"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_setNetErrorCode", true, 1516, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_getNetErrorCode_API_0001
     *@tc.name testWebViewSdkSchemeHandler_SdkSchemeHandler_getNetErrorCode
     *@tc.desc test SdkSchemeHandler_getNetErrorCode
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_getNetErrorCode', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_getNetErrorCode"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_getNetErrorCode", true, 1517, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_setStatus_API_0001
     *@tc.name testWebViewSdkSchemeHandler_setStatus
     *@tc.desc test SdkSchemeHandler_setStatus
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_setStatus', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_setStatus"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_setStatus", true, 1518, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_getStatus_API_0001
     *@tc.name testWebViewSdkSchemeHandler_getStatus
     *@tc.desc test SdkSchemeHandler_getStatus
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_getStatus', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_getStatus"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_getStatus", true, 1519, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEBSchemeHandler_setStatusText_API_0001
     *@tc.name testWebViewSdkSchemeHandler_setStatusText
     *@tc.desc test SdkSchemeHandler_setStatusText
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_setStatusText', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_setStatusText"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_setStatusText", true, 1520, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_getStatusText_API_0001
     *@tc.name testWebViewSdkSchemeHandler_SdkSchemeHandler_getStatusText
     *@tc.desc test SdkSchemeHandler_getStatusText
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_getStatusText', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_getStatusText"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_getStatusText", true, 1521, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_setMimeType_API_0001
     *@tc.name testWebViewSdkSchemeHandler_SdkSchemeHandler_setMimeType
     *@tc.desc test SdkSchemeHandler_setMimeType
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_setMimeType', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_setMimeType"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_setMimeType", true, 1522, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_getMimeType_API_0001
     *@tc.name testWebViewSdkSchemeHandler_getMimeType
     *@tc.desc test SdkSchemeHandler_getMimeType
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_getMimeType', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_getMimeType"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_getMimeType", true, 1523, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_setEncoding_API_0001
     *@tc.name testWebViewSdkSchemeHandler_setEncoding
     *@tc.desc test SdkSchemeHandler_setEncoding
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_setEncoding', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_setEncoding"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_setEncoding", true, 1524, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_getEncoding_API_0001
     *@tc.name testWebViewSdkSchemeHandler
     *@tc.desc test SdkSchemeHandler_getEncoding
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_getEncoding', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_getEncoding"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_getEncoding", true, 1525, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_setHeaderByName_overwrite_true_API_0001
     *@tc.name testWebViewSdkSchemeHandler_SdkSchemeHandler_setHeaderByName_overwrite_true
     *@tc.desc test SdkSchemeHandler_setHeaderByName_overwrite_true
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_setHeaderByName_overwrite_true', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_setHeaderByName"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_setHeaderByName", true, 1526, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
 *@tc.number SUB_ACE_WEB_SdkSchemeHandler_setHeaderByName_overwrite_false_API_0001
 *@tc.name testWebViewSdkSchemeHandler_setHeaderByName_overwrite_false
 *@tc.desc test _setHeaderByName_overwrite_false
 *@tc.size MediumTest
 *@tc.type Function
 *@tc.level 1
 */
    it('testWebViewSdkSchemeHandler_setHeaderByName_overwrite_false', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_setHeaderByName"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_setHeaderByName", true, 1527, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })


    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_getHeaderByName_API_0001
     *@tc.name testWebViewSdkSchemeHandler_getHeaderByName
     *@tc.desc test SdkSchemeHandler_getHeaderByName
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_getHeaderByName', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_getHeaderByName"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_getHeaderByName", true, 1528, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didReceiveResponse_API_0001
     *@tc.name testWebViewSdkSchemeHandler_SdkSchemeHandler_didReceiveResponse
     *@tc.desc test SdkSchemeHandler_didReceiveResponse
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_didReceiveResponse', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_didReceiveResponse"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_didReceiveResponse", true, 1529, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didReceiveResponseBody_API_0001
     *@tc.name testWebViewSdkSchemeHandler_didReceiveResponseBody
     *@tc.desc test didReceiveResponseBody
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_didReceiveResponseBody', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_didReceiveResponseBody"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_didReceiveResponseBody", true, 1530, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_getFrameUrl_didFinish_API_0001
     *@tc.name testWebViewSdkSchemeHandler_didFinish
     *@tc.desc test SchemeHandler_didFinish
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_didFinish', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_didFinish"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_didFinish", true, 1531, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0001
     *@tc.name testWebViewSdkSchemeHandler_didFail
     *@tc.desc test didFail
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_didFail', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_didFail"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_didFail", true, 1532, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_onRequestStart_API_0001
     *@tc.name testWebViewSdkSchemeHandler_onRequestStart
     *@tc.desc test SdkSchemeHandler_onRequestStart
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_onRequestStart', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_onRequestStart"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_onRequestStart", true, 1533, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_onRequestStop_API_0001
     *@tc.name testWebViewSdkSchemeHandler_onRequestStop
     *@tc.desc test onRequestStop
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandler_onRequestStop', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_onRequestStop"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_onRequestStop", true, 1534, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })
  })
}
