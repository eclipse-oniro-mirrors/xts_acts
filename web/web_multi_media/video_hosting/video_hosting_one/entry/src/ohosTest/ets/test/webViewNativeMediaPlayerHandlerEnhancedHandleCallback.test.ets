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
// @ts-nocheck
let emitKey = ''

export default function webViewNativeMediaPlayerHandlerEnhancedHandleCallback() {
  describe('ActsAceWebViewNativeMediaPlayerHandlerEnhancedHandleCallback', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewNativeMediaPlayerHandlerEnhanced',
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
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_2200
     *@tc.name testWebViewNativeMediaPlayerPostUrl
     *@tc.desc test NativeMediaPlayerSetVolumeMediaPlayer_postUrl
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerPostUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerPostUrl"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerPostUrl", true, 1573,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_0800
     *@tc.name testWebViewNativeMediaPlayerMediaListSource
     *@tc.desc test NativeMediaPlayermediaSrcList_source
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */

    it('testWebViewNativeMediaPlayerMediaListSource', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerMediaListSource"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerMediaListSource", true, 1574,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_0900
     *@tc.name testWebViewNativeMediaPlayerMediaListFormat
     *@tc.desc test NativeMediaPlayerSetVolume0_mediaSrcList_format
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */

    it('testWebViewNativeMediaPlayerMediaListFormat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerMediaListFormat"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerMediaListFormat", true, 1575,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_1000
     *@tc.name testWebViewNativeMediaPlayerSurfaceInfoId
     *@tc.desc test NativeMediaPlayerSetVolume0_surfaceInfo_id
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */

    it('testWebViewNativeMediaPlayerSurfaceInfoId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSurfaceInfoId"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerSurfaceInfoId", true, 1576,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_1100
     *@tc.name testWebViewNativeMediaPlayerSurfaceInfoRect
     *@tc.desc test NativeMediaPlayerSetVolume0_SurfaceInfoRect
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */

    it('testWebViewNativeMediaPlayerSurfaceInfoRect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSurfaceInfoRect"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerSurfaceInfoRect", true, 1577,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_1200
     *@tc.name testWebViewNativeMediaPlayer_controlShownTrue
     *@tc.desc test NativeMediaPlayer_controlShownTrue
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */

    it('testWebViewNativeMediaPlayer_controlShownTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerControlShownTrue"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerControlShownTrue", true, 1578,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_1300
     *@tc.name testWebViewNativeMediaPlayerControlShownFalse
     *@tc.desc test NativeMediaPlayerControlShownFalse
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */

    it('testWebViewNativeMediaPlayerControlShownFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerControlShownFalse"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerControlShownFalse", true, 1579,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_1400
     *@tc.name testWebViewNativeMediaPlayerControlListNodownload
     *@tc.desc test NativeMediaPlayerSetVolume0_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */

    it('testWebViewNativeMediaPlayerControlListNodownload', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerControlListNodownload"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerControlListNodownload", true, 1580,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_1500
     *@tc.name testWebViewNativeMediaPlayerControlListNofullscreen
     *@tc.desc test NativeMediaPlayerSetVolume0_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */

    it('testWebViewNativeMediaPlayerControlListNofullscreen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerControlListNofullscreen"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerControlListNofullscreen", true, 1581,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_1600
     *@tc.name testWebViewNativeMediaPlayerNoremoteplayback
     *@tc.desc test NativeMediaPlayer_noremoteplayback
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */

    it('testWebViewNativeMediaPlayerNoremoteplayback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerNoremoteplayback"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerNoremoteplayback", true, 1582,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_1700
     *@tc.name testWebViewNativeMediaPlayerNodownloadNoremoteplaybackNoremoteplayback
     *@tc.desc test NativeMediaPlayerSetVolume0_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */

    it('testWebViewNativeMediaPlayerNodownloadNoremoteplaybackNoremoteplayback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerNodownloadNoremoteplaybackNoremoteplayback"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerNodownloadNoremoteplaybackNoremoteplayback", true, 1583,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_1800
     *@tc.name testWebViewNativeMediaPlayerMutedTrue
     *@tc.desc test NativeMediaPlayerSetVolume0_muted_true
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */

    it('testWebViewNativeMediaPlayerMutedTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerMutedTrue"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerMutedTrue", true, 1584,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_1900
     *@tc.name testWebViewNativeMediaPlayerMutedFalse
     *@tc.desc test NativeMediaPlayerSetVolume0_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */

    it('testWebViewNativeMediaPlayerMutedFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerMutedFalse"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerMutedFalse", true, 1585,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_2000
     *@tc.name testWebViewNativeMediaPlayerHeaders
     *@tc.desc test NativeMediaPlayerSetVolume0_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */

    it('testWebViewNativeMediaPlayerHeaders', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerHeaders"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerHeaders", true, 1586,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_2100
     *@tc.name testWebViewNativeMediaPlayerAttributes
     *@tc.desc test NativeMediaPlayerSetVolume0_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */

    it('testWebViewNativeMediaPlayerAttributes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerAttributes"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerAttributes", true, 1587,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_2300
     *@tc.name testWebViewNativeMediaPlayerPreloadNone
     *@tc.desc test NativeMediaPlayerSetVolume0_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */

    it('testWebViewNativeMediaPlayerPreloadNone', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerPreloadNone"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerPreloadNone", true, 1588,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_2400
     *@tc.name testWebViewNativeMediaPlayerPreloadMetadata
     *@tc.desc test NativeMediaPlayerSetVolume0_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */

    it('testWebViewNativeMediaPlayerPreloadMetadata', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerPreloadMetadata"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerPreloadMetadata", true, 1589,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_2500
     *@tc.name testWebViewNativeMediaPlayerPreloadAuto
     *@tc.desc test NativeMediaPlayerSetVolume0_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */

    it('testWebViewNativeMediaPlayerPreloadAuto', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerPreloadAuto"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerPreloadAuto", true, 1590,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
  })
}
