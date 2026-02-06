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
let emitKey = ''
const EVENT_ID_SET_EMIT_KEY = 362000;

export default function webViewNativeMediaPlayerHandlerEnhancedHandleCallback() {
  describe('ActsAceWebViewNativeMediaPlayerHandlerEnhancedHandleCallback', () => {
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
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_2200
     *@tc.name testWebViewNativeMediaPlayerPostUrl
     *@tc.desc test NativeMediaPlayerSetVolumeMediaPlayer_postUrl
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerPostUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerPostUrl"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerPostUrl", true, 362120, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /**
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_0800
     *@tc.name testWebViewNativeMediaPlayerMediaListSource
     *@tc.desc test NativeMediaPlayermediaSrcList_source
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerMediaListSource', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerMediaListSource"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerMediaListSource", true, 362130, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })

    /**
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_0900
     *@tc.name testWebViewNativeMediaPlayerMediaListFormat
     *@tc.desc test NativeMediaPlayerSetVolume0_mediaSrcList_format
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerMediaListFormat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerMediaListFormat"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerMediaListFormat", true, 362140, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /**
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_1000
     *@tc.name testWebViewNativeMediaPlayerSurfaceInfoId
     *@tc.desc test NativeMediaPlayerSetVolume0_surfaceInfo_id
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerSurfaceInfoId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSurfaceInfoId"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerSurfaceInfoId", true, 362150, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /**
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_1100
     *@tc.name testWebViewNativeMediaPlayerSurfaceInfoRect
     *@tc.desc test NativeMediaPlayerSetVolume0_SurfaceInfoRect
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */

    it('testWebViewNativeMediaPlayerSurfaceInfoRect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSurfaceInfoRect"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerSurfaceInfoRect", true, 362160, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /**
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_1200
     *@tc.name testWebViewNativeMediaPlayer_controlShownTrue
     *@tc.desc test NativeMediaPlayer_controlShownTrue
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayer_controlShownTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerControlShownTrue"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerControlShownTrue", true, 362170, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /**
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_1300
     *@tc.name testWebViewNativeMediaPlayerControlShownFalse
     *@tc.desc test NativeMediaPlayerControlShownFalse
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerControlShownFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerControlShownFalse"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerControlShownFalse", true, 362180, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /**
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_1400
     *@tc.name testWebViewNativeMediaPlayerControlListNodownload
     *@tc.desc test NativeMediaPlayerSetVolume0_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerControlListNodownload', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerControlListNodownload"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerControlListNodownload", true, 362190, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /**
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_1500
     *@tc.name testWebViewNativeMediaPlayerControlListNofullscreen
     *@tc.desc test NativeMediaPlayerSetVolume0_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerControlListNofullscreen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerControlListNofullscreen"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerControlListNofullscreen", true, 362200, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /**
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_1600
     *@tc.name testWebViewNativeMediaPlayerNoremoteplayback
     *@tc.desc test NativeMediaPlayer_noremoteplayback
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerNoremoteplayback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerNoremoteplayback"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerNoremoteplayback", true, 362210, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /**
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_1700
     *@tc.name testWebViewNativeMediaPlayerNodownloadNoremoteplaybackNoremoteplayback
     *@tc.desc test NativeMediaPlayerSetVolume0_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerNodownloadNoremoteplaybackNoremoteplayback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerNodownloadNoremoteplaybackNoremoteplayback"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerNodownloadNoremoteplaybackNoremoteplayback", true, 362220, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /**
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_1800
     *@tc.name testWebViewNativeMediaPlayerMutedTrue
     *@tc.desc test NativeMediaPlayerSetVolume0_muted_true
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerMutedTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerMutedTrue"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerMutedTrue", true, 362230, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /**
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_1900
     *@tc.name testWebViewNativeMediaPlayerMutedFalse
     *@tc.desc test NativeMediaPlayerSetVolume0_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerMutedFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerMutedFalse"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerMutedFalse", true, 362240, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /**
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_2000
     *@tc.name testWebViewNativeMediaPlayerHeaders
     *@tc.desc test NativeMediaPlayerSetVolume0_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerHeaders', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerHeaders"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerHeaders", true, 362250, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })

    /**
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_2100
     *@tc.name testWebViewNativeMediaPlayerAttributes
     *@tc.desc test NativeMediaPlayerSetVolume0_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerAttributes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerAttributes"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerAttributes", true, 362260, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })

    /**
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_2300
     *@tc.name testWebViewNativeMediaPlayerPreloadNone
     *@tc.desc test NativeMediaPlayerSetVolume0_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerPreloadNone', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerPreloadNone"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerPreloadNone", true, 362270, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })

    /**
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_2400
     *@tc.name testWebViewNativeMediaPlayerPreloadMetadata
     *@tc.desc test NativeMediaPlayerSetVolume0_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerPreloadMetadata', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerPreloadMetadata"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerPreloadMetadata", true, 362280, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })

    /**
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_2500
     *@tc.name testWebViewNativeMediaPlayerPreloadAuto
     *@tc.desc test NativeMediaPlayerSetVolume0_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerPreloadAuto', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerPreloadAuto"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewNativeMediaPlayerPreloadAuto", true, 362290, done);
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
  })
}
