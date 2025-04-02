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

export default function webViewNativeMediaPlayerHandlerEnhanced() {
  describe('ActsAceWebViewMediaPlayerHandlerEnhanced', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'MainAbility/pages/webViewNativeMediaPlayerHandlerEnhanced',
        }
        
        try {
            await Utils.sleep(1000)
            router.clear();
            let pages = router.getState();
            console.info("get webViewNativeMediaPlayerHandlerEnhanced state success " + JSON.stringify(pages));
            if (!("webViewNativeMediaPlayerHandlerEnhanced" == pages.name)) {
                console.info("get webViewNativeMediaPlayerHandlerEnhanced state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                await Utils.sleep(1000);
                console.info("push webViewNativeMediaPlayerHandlerEnhanced state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewNativeMediaPlayerHandlerEnhanced page error:" + err);
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
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerVideoMultiSource_API_0001
     *@tc.name testWebViewNativeMediaPlayerVideoMultiSource
     *@tc.desc test NativeMediaPlayerVideoMultiSource
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerVideoMultiSource', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerVideoMultiSource"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewNativeMediaPlayerShouldOverlayFalse", true, 1540, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerEnterFullScreen_API_0001
     *@tc.name testWebViewNativeMediaPlayerEnterFullScreen
     *@tc.desc test NativeMediaPlayerEnterFullScreen
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerEnterFullScreen', 0, async (done: Function) => {
        emitKey = "emitWebViewNativeMediaPlayerEnterFullScreen"
        Utils.emitEvent(emitKey, 10);
        Utils.registerEvent("testWebViewNativeMediaPlayerEnterFullScreen", true, 1541, done);
        sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerExitFullScreen_API_0001
     *@tc.name testWebViewNativeMediaPlayerExitFullScreen
     *@tc.desc test NativeMediaPlayerExitFullScreen
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerExitFullScreen', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerExitFullScreen"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewNativeMediaPlayerExitFullScreen", true, 1542, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_HandleErrorRelease_API_0001
     *@tc.name testWebViewNativeMediaPlayerHandleErrorRelease
     *@tc.desc test NativeMediaPlayerHandleErrorRelease
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerHandleErrorRelease', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaHandleErrorRelease"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleErrorRelease", true, 1543, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerShouldOverlay_false_API_0001
     *@tc.name testWebViewNativeMediaPlayerShouldOverlay_false
     *@tc.desc test NativeMediaPlayerShouldOverlay_false
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerShouldOverlayFalse', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerShouldOverlayFalse"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewNativeMediaPlayerShouldOverlayFalse", true, 1544, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerShouldOverlay_false_API_0001
     *@tc.name testWebViewNativeMediaPlayerShouldOverlay_false
     *@tc.desc test NativeMediaPlayerShouldOverlay_false
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerHandleNetworkStateChangedIDLE', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaHandleNetworkStateChangedIDLE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleNetworkStateChangedIDLE", true, 1545, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
  })
}
