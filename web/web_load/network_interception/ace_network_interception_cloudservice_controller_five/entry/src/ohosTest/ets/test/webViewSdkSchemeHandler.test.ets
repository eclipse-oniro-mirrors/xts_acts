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
import { waitForExist } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = ''
const  driver = Driver.create();
export default function ActsAceWebViewSdkSchemeHandler() {
  describe('ActsAceWebViewSdkSchemeHandler', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewSdkSchemeHandler',
        }
        
        try {
            router.clear();
            let pages = router.getState();
            console.info("get webViewSdkSchemeHandler state success " + JSON.stringify(pages));
            if (!("webViewSdkSchemeHandler" == pages.name)) {
                console.info("get webViewSdkSchemeHandler state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
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
        done();
    })
    /**
     * @tc.name   testWebViewSdkSchemeHandler_getHeader
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_getHeader_API_0001
     * @tc.desc   test SdkSchemeHandler_getHeader
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_getHeader', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_getHeader"
      Utils.emitEvent(emitKey, 142301);
      Utils.registerBaseEvent("testWebViewSdkSchemeHandler_getHeader", true, 142110, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent('webViewSdkSchemeHandler',driver);
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandler_getRequestUrl
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_getRequestUrl_API_0001
     * @tc.desc   test SdkSchemeHandler_getRequestUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_getRequestUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_getRequestUrl"
      Utils.emitEvent(emitKey, 142301);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_getRequestUrl", true, 142120, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webViewSdkSchemeHandler',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
    /**
     * @tc.name   testWebViewSdkSchemeHandler_getRequestMethod
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_getRequestMethod_API_0001
     * @tc.desc   test SdkSchemeHandler_getRequestMethod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_getRequestMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_getRequestMethod"
      Utils.emitEvent(emitKey, 142301);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_getRequestMethod", true, 142130, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webViewSdkSchemeHandler',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })


    /**
     * @tc.name   testWebViewSdkSchemeHandler_getReferrer
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_getReferrer_API_0001
     * @tc.desc   test SdkSchemeHandler_getReferrer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_getReferrer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_getReferrer"
     Utils.emitEvent(emitKey, 142301);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_getReferrer", true, 142140, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webViewSdkSchemeHandler',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
    /**
     * @tc.name   testWebViewSdkSchemeHandler_isMainFrame
     * @tc.number SUB_ACE_WEB_isMainFrame_API_0001
     * @tc.desc   test isMainFrame
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_isMainFrame', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_isMainFrame"
     Utils.emitEvent(emitKey, 142301);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_isMainFrame", true, 142150, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webViewSdkSchemeHandler',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandler_hasGesture
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_hasGesture_API_0001
     * @tc.desc   test SdkSchemeHandler_hasGesture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_hasGesture', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_hasGesture"
     Utils.emitEvent(emitKey, 142301);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_hasGesture", true, 142160, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webViewSdkSchemeHandler',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
    /**
     * @tc.name   testWebViewSdkSchemeHandler_constructor
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_constructor_API_0001
     * @tc.desc   test SdkSchemeHandler_constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_constructor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_constructor"
     Utils.emitEvent(emitKey, 142301);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_constructor", true, 142170, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webViewSdkSchemeHandler',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
    /**
     * @tc.name   testWebViewSdkSchemeHandler_setUrl
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_setUrl_API_0001
     * @tc.desc   test SdkSchemeHandler_setUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_setUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_setUrl"
     Utils.emitEvent(emitKey, 142301);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_setUrl", true, 142180, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webViewSdkSchemeHandler',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
    /**
     * @tc.name   testWebViewSdkSchemeHandler_getUrl
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_getUrl_API_0001
     * @tc.desc   test SdkSchemeHandler_getUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_getUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_getUrl"
     Utils.emitEvent(emitKey, 142301);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_getUrl", true, 142190, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webViewSdkSchemeHandler',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
    /**
     * @tc.name   testWebViewSdkSchemeHandler_setStatus
     * @tc.number SUB_ACE_WEB_setStatus_API_0001
     * @tc.desc   test SdkSchemeHandler_setStatus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_setStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_setStatus"
     Utils.emitEvent(emitKey, 142301);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_setStatus", true, 142200, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webViewSdkSchemeHandler',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandler_getStatus
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_getStatus_API_0001
     * @tc.desc   test SdkSchemeHandler_getStatus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_getStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_getStatus"
      Utils.emitEvent(emitKey, 142301);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_getStatus", true, 142210, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webViewSdkSchemeHandler',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
    /**
     * @tc.name   testWebViewSdkSchemeHandler_setStatusText
     * @tc.number SUB_ACE_WEBSchemeHandler_setStatusText_API_0001
     * @tc.desc   test SdkSchemeHandler_setStatusText
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_setStatusText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_setStatusText"
      Utils.emitEvent(emitKey, 142301);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_setStatusText", true, 142220, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webViewSdkSchemeHandler',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
    /**
     * @tc.name   testWebViewSdkSchemeHandler_getStatusText
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_getStatusText_API_0001
     * @tc.desc   test SdkSchemeHandler_getStatusText
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_getStatusText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_getStatusText"
      Utils.emitEvent(emitKey, 142301);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_getStatusText", true, 142230, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webViewSdkSchemeHandler',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
    /**
     * @tc.name   testWebViewSdkSchemeHandler_setMimeType
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_setMimeType_API_0001
     * @tc.desc   test SdkSchemeHandler_setMimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_setMimeType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_setMimeType"
      Utils.emitEvent(emitKey, 142301);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_setMimeType", true, 142240, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webViewSdkSchemeHandler',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandler_getMimeType
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_getMimeType_API_0001
     * @tc.desc   test SdkSchemeHandler_getMimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_getMimeType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_getMimeType"
      Utils.emitEvent(emitKey, 142301);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_getMimeType", true, 142250, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webViewSdkSchemeHandler',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
    /**
     * @tc.name   testWebViewSdkSchemeHandler_setEncoding
     * @tc.number SUB_ACE_WEB_setEncoding_API_0001
     * @tc.desc   test SdkSchemeHandler_setEncoding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_setEncoding', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_setEncoding"
      Utils.emitEvent(emitKey, 142301);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_setEncoding", true, 142260, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webViewSdkSchemeHandler',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandler_getEncoding
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_getEncoding_API_0001
     * @tc.desc   test SdkSchemeHandler_getEncoding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_getEncoding', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_getEncoding"
      Utils.emitEvent(emitKey, 142301);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_getEncoding", true, 142270, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webViewSdkSchemeHandler',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
    /**
     * @tc.name   testWebViewSdkSchemeHandler_setHeaderByName_overwrite_true
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_setHeaderByName_overwrite_true_API_0001
     * @tc.desc   test SdkSchemeHandler_setHeaderByName_overwrite_true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_setHeaderByName_overwrite_true', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_setHeaderByName"
      Utils.emitEvent(emitKey, 142301);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_setHeaderByName", true, 142280, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webViewSdkSchemeHandler',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandler_setHeaderByName_overwrite_false
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_setHeaderByName_overwrite_false_API_0001
     * @tc.desc   test _setHeaderByName_overwrite_false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_setHeaderByName_overwrite_false', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_setHeaderByName"
      Utils.emitEvent(emitKey, 142301);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_setHeaderByName", true, 142290, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webViewSdkSchemeHandler',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })


    /**
     * @tc.name   testWebViewSdkSchemeHandler_getHeaderByName
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_getHeaderByName_API_0001
     * @tc.desc   test SdkSchemeHandler_getHeaderByName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_getHeaderByName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_getHeaderByName"
      Utils.emitEvent(emitKey, 142301);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_getHeaderByName", true, 142300, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webViewSdkSchemeHandler',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
    /**
     * @tc.name   testWebViewSdkSchemeHandler_didReceiveResponse
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didReceiveResponse_API_0001
     * @tc.desc   test SdkSchemeHandler_didReceiveResponse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_didReceiveResponse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_didReceiveResponse"
      Utils.emitEvent(emitKey, 142301);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_didReceiveResponse", true, 142310, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webViewSdkSchemeHandler',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
    /**
     * @tc.name   testWebViewSdkSchemeHandler_didReceiveResponseBody
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didReceiveResponseBody_API_0001
     * @tc.desc   test didReceiveResponseBody
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_didReceiveResponseBody', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_didReceiveResponseBody"
      Utils.emitEvent(emitKey, 142301);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_didReceiveResponseBody", true, 142320, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webViewSdkSchemeHandler',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
    /**
     * @tc.name   testWebViewSdkSchemeHandler_didFinish
     * @tc.number SUB_ACE_WEB_getFrameUrl_didFinish_API_0001
     * @tc.desc   test SchemeHandler_didFinish
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_didFinish', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_didFinish"
      Utils.emitEvent(emitKey, 142301);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_didFinish", true, 142330, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webViewSdkSchemeHandler',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
    /**
     * @tc.name   testWebViewSdkSchemeHandler_didFail
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0001
     * @tc.desc   test didFail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_didFail', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_didFail"
      Utils.emitEvent(emitKey, 142301);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_didFail", true, 142340, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webViewSdkSchemeHandler',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandler_onRequestStart
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_onRequestStart_API_0001
     * @tc.desc   test SdkSchemeHandler_onRequestStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_onRequestStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_onRequestStart"
      Utils.emitEvent(emitKey, 142301);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_onRequestStart", true, 142350, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webViewSdkSchemeHandler',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
    /**
     * @tc.name   testWebViewSdkSchemeHandler_onRequestStop
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_onRequestStop_API_0001
     * @tc.desc   test onRequestStop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_onRequestStop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandler_onRequestStop"
      Utils.emitEvent(emitKey, 142301);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandler_onRequestStop", true, 142360, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webViewSdkSchemeHandler',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
  })
}
