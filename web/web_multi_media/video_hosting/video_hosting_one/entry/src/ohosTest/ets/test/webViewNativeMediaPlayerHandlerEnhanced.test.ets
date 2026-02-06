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
import { Driver, ON } from '@kit.TestKit';
// @ts-nocheck
const driver = Driver.create();

let emitKey = ""
const EVENT_ID_SET_EMIT_KEY = 362000;

export default function webViewNativeMediaPlayerHandlerEnhanced() {
  describe('ActsAceWebViewMediaPlayerHandlerEnhanced', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewNativeMediaPlayerHandlerEnhanced',
        }
        try {
            router.clear();
            let pages = router.getState();
            console.info("get webViewNativeMediaPlayerHandlerEnhanced state success " + JSON.stringify(pages));
            if (!("webViewNativeMediaPlayerHandlerEnhanced" == pages.name)) {
                console.info("get webViewNativeMediaPlayerHandlerEnhanced state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                console.info("push webViewNativeMediaPlayerHandlerEnhanced state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewNativeMediaPlayerHandlerEnhanced page error:" + err);
        }
        await driver.waitForComponent(ON.id("webViewNativeMediaPlayerHandlerEnhanced"), 10000);
        console.log("waitForComponent webViewNativeMediaPlayerHandlerEnhanced");
        done()
    });
    
    beforeEach(async (done: Function) => {
      done();
    })

    /**
     * @tc.name   testWebViewNativeMediaPlayerVideoMultiSource
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_2150
     * @tc.desc   test NativeMediaPlayerVideoMultiSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewNativeMediaPlayerVideoMultiSource', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerVideoMultiSource"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerShouldOverlayFalse", true, 362010, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })

    /**
     * @tc.name   testWebViewNativeMediaPlayerEnterFullScreen
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_6600
     * @tc.desc   test NativeMediaPlayerEnterFullScreen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewNativeMediaPlayerEnterFullScreen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        emitKey = "emitWebViewNativeMediaPlayerEnterFullScreen"
        Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent("testWebViewNativeMediaPlayerEnterFullScreen", true, 362020, done);
        sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })

    /**
     * @tc.name   testWebViewNativeMediaPlayerExitFullScreen
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_6800
     * @tc.desc   test NativeMediaPlayerExitFullScreen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewNativeMediaPlayerExitFullScreen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerExitFullScreen"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerExitFullScreen", true, 362030, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /**
     * @tc.name   testWebViewNativeMediaPlayerHandleErrorRelease
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_7000
     * @tc.desc   test NativeMediaPlayerHandleErrorRelease
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewNativeMediaPlayerHandleErrorRelease', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaHandleErrorRelease"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleErrorRelease", true, 362040, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })

    /**
     * @tc.name   testWebViewNativeMediaPlayerShouldOverlayFalse
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_0300
     * @tc.desc   test NativeMediaPlayerShouldOverlay_false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewNativeMediaPlayerShouldOverlayFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerShouldOverlayFalse"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerShouldOverlayFalse", true, 362050, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })

    /**
     * @tc.name   testWebViewNativeMediaPlayerHandleNetworkStateChangedIDLE
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_7500
     * @tc.desc   test NativeMediaPlayerShouldOverlay_false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewNativeMediaPlayerHandleNetworkStateChangedIDLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaHandleNetworkStateChangedIDLE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleNetworkStateChangedIDLE", true, 362060, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
  })
}
