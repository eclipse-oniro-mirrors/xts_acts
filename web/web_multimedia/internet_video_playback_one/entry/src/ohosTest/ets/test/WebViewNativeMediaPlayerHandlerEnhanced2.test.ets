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
import Utils from './Utils.test';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { Driver, ON } from '@kit.TestKit';
// @ts-nocheck
const driver = Driver.create();
let emitKey = ""
const EVENT_ID_SET_EMIT_KEY = 362000;

export default function webViewNativeMediaPlayerHandlerEnhanced2() {
  describe('ActsAceWebViewMediaPlayerHandlerEnhanced2', () => {
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/WebViewNativeMediaPlayerHandlerEnhanced',
        }
        try {
            await Utils.sleep(1000)
            router.clear();
            let pages = router.getState();
            console.info("get webViewNativeMediaPlayerHandlerEnhanced state success " + JSON.stringify(pages));
            if (!("WebViewNativeMediaPlayerHandlerEnhanced" == pages.name)) {
                console.info("get webViewNativeMediaPlayerHandlerEnhanced state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                await Utils.sleep(1000);
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
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_0400
     * @tc.name testWebViewNativeMediaPlayerEnableTrueShouldOverlayTrue
     * @tc.desc test NativeMediaPlayerEnableTrueShouldOverlayTrue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerEnableTrueShouldOverlayTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerEnableTrueShouldOverlayTrue"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerEnableTrueShouldOverlayTrue", true, 362070, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /**
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_0600
     * @tc.name testWebViewNativeMediaPlayerAudio
     * @tc.desc test NativeMediaPlayerAudio
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerAudio', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerAudio"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerAudio", true, 362080, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /**
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_0700
     * @tc.name testWebViewNativeMediaPlayerMediaSrcUrl
     * @tc.desc test NativeMediaPlayerMediaSrcUrl
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerMediaSrcUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerMediaSrcUrl"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerMediaSrcUrl", true, 362090, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /**
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_2600
     * @tc.name testWebViewNativeMediaPlayerHandleStatusChangedPause
     * @tc.desc test NativeMediaPlayerMediaSrcUrl
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerHandleStatusChangedPause', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerHandleStatusChangedPause"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerHandleStatusChangedPause", true, 362100, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /**
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_2700
     * @tc.name testWebViewNativeMediaPlayerHandleStatusChangedPlaying
     * @tc.desc test NativeMediaPlayerMediaSrcUrl
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerHandleStatusChangedPlaying', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerHandleStatusChangedPlaying"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerHandleStatusChangedPlaying", true, 362110, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
  })
}
