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

export default function webViewNativeMediaPlayerHandlerEnhancedHandleVolume() {
  describe('ActsAceWebViewNativeMediaPlayerHandlerEnhancedHandleVolume', () => {
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
     * @tc.name   testWebViewNativeMediaPlayerSetVolume0_handleVolumeChange
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_3600
     * @tc.desc   test NativeMediaPlayerSetVolume0_handleVolumeChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewNativeMediaPlayerSetVolume0_handleVolumeChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSetVolume0_handleVolumeChange"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerSetVolume0_handleVolumeChange", true, 362300, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })

    /**
     * @tc.name   testWebViewNativeMediaPlayerSetVolume0_5
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_3900
     * @tc.desc   test NativeMediaPlayerSetVolume0_5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewNativeMediaPlayerSetVolume0_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSetVolume0_5"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerSetVolume0_5", true, 362310, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })

    /**
     * @tc.name   testWebViewNativeMediaPlayerSetVolume0_1_handleVolumeChange
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_3800
     * @tc.desc   test NativeMediaPlayerSetVolume0_1_handleVolumeChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewNativeMediaPlayerSetVolume0_1_handleVolumeChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSetVolume0_1_handleVolumeChange"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerSetVolume0_1_handleVolumeChange", true, 362320, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })


    /**
     * @tc.name   testWebViewNativeMediaPlayerSetVolume1
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_4100
     * @tc.desc   test NativeMediaPlayerSetVolume0_5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewNativeMediaPlayerSetVolume1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSetVolume1"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerSetVolume1", true, 362330, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /**
     * @tc.name   testWebViewNativeMediaPlayerSetVolume0_5_handleVolumeChange
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_4000
     * @tc.desc   test NativeMediaPlayerSetVolume0_5_handleVolumeChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewNativeMediaPlayerSetVolume0_5_handleVolumeChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSetVolume0_5_handleVolumeChange"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerSetVolume0_5_handleVolumeChange", true, 362340, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /**
     * @tc.name   testWebViewNativeMediaPlayerSetVolume1_handleVolumeChange
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_4200
     * @tc.desc   test NativeMediaPlayerSetVolume1_handleVolumeChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewNativeMediaPlayerSetVolume1_handleVolumeChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSetVolume1_handleVolumeChange"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerSetVolume1_handleVolumeChange", true, 362350, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /**
     * @tc.name   testWebViewNativeMediaPlayerSetVolume1_1
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_4300
     * @tc.desc   test NativeMediaPlayerSetVolume1_handleVolumeChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewNativeMediaPlayerSetVolume1_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitWebViewNativeMediaPlayerSetVolume1_1'
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerSetVolume1_1", true, 362360, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
  })
}
