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
const EVENT_ID_SET_EMIT_KEY = 362000;

let emitKey = ""

export default function webViewNativeMediaPlayerHandlerEnhancedSetMuted() {
  describe('ActsAceWebViewNativeMediaPlayerHandlerEnhancedSetMuted', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/WebViewNativeMediaPlayerHandlerEnhanced',
        }
        try {
            router.clear();
            let pages = router.getState();
            console.info("get webViewNativeMediaPlayerHandlerEnhanced state success " + JSON.stringify(pages));
            if (!("WebViewNativeMediaPlayerHandlerEnhanced" == pages.name)) {
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
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_4400
     * @tc.name testWebViewNativeMediaPlayerSetMutedTrue
     * @tc.desc test NativeMediaPlayerSetVolume0_SetMutedTrue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerSetMutedTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSetMutedTrue"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerSetMutedTrue", true, 362591, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let StartModel = await driver.findComponent(ON.id("webViewNativeMediaPlayerHandlerEnhanced"));
      await StartModel.click();
    })
    /**
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_4600
     * @tc.name testWebViewNativeMediaPlayerSetMutedTrue_handleMutedChange
     * @tc.desc test NativeMediaPlayerSetMutedTrue_handleMutedChanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerSetMutedTrue_handleMutedChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSetMutedTrue_handleMutedChange"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerSetMutedTrue_handleMutedChange", true, 362592, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /**
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_4500
     * @tc.name testWebViewNativeMediaPlayerSetMutedFalse
     * @tc.desc test NativeMediaPlayerSetMutedFalse_handleVolumeChange
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerSetMutedFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSetMutedFalse"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerSetMutedFalse", true, 362593, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /**
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_4700
     * @tc.name testWebViewNativeMediaPlayerSetMutedFalse_handleMutedChange
     * @tc.desc test NativeMediaPlayerSetMutedFalse_handleVolumeChange
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerSetMutedFalse_handleMutedChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSetMutedFalse_handleMutedChange"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerSetMutedFalse_handleMutedChange", true, 362594, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
  })
}
