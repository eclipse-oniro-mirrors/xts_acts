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

export default function webViewNativeMediaPlayerHandlerEnhancedHandleCallback() {
  describe('ActsAceWebViewNativeMediaPlayerHandlerEnhancedHandleCallback', () => {
      
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
     *@tc.number SUB_ACE_WEB_MediaPlayer_postUrl_API_0001
     *@tc.name testWebViewNativeMediaPlayerMediaPlayer_postUrl
     *@tc.desc test NativeMediaPlayerSetVolumeMediaPlayer_postUrl
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerPostUrl', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerPostUrl"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerPostUrl", true, 1573,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_MediaPlayer_mediaSrcList_source_API_0001
     *@tc.name testWebViewNativeMediaPlayer_mediaSrcList_source
     *@tc.desc test NativeMediaPlayermediaSrcList_source
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */

    it('testWebViewNativeMediaPlayerMediaListSource', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerMediaListSource"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerMediaListSource", true, 1574,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_MediaPlayer_mediaSrcList_format_API_0001
     *@tc.name testWebViewNativeMediaPlayer_mediaSrcList_format
     *@tc.desc test NativeMediaPlayerSetVolume0_mediaSrcList_format
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */

    it('testWebViewNativeMediaPlayerMediaListFormat', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerMediaListFormat"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerMediaListFormat", true, 1575,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_MediaPlayer_surfaceInfo_id_API_0001
     *@tc.name testWebViewNativeMediaPlayer_surfaceInfo_id
     *@tc.desc test NativeMediaPlayerSetVolume0_surfaceInfo_id
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */

    it('testWebViewNativeMediaPlayerSurfaceInfoId', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSurfaceInfoId"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerSurfaceInfoId", true, 1576,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_MediaPlayer_surfaceInfo_rect_API_0001
     *@tc.name testWebViewNativeMediaPlayer_surfaceInfo_rect
     *@tc.desc test NativeMediaPlayerSetVolume0_SurfaceInfoRect
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */

    it('testWebViewNativeMediaPlayerSurfaceInfoRect', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSurfaceInfoRect"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerSurfaceInfoRect", true, 1577,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_MediaPlayer_controlShownTrue_API_0001
     *@tc.name testWebViewNativeMediaPlayer_controlShownTrue
     *@tc.desc test NativeMediaPlayer_controlShownTrue
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */

    it('testWebViewNativeMediaPlayer_controlShownTrue', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerControlShownTrue"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerControlShownTrue", true, 1578,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_MediaPlayer_controlShownFalse_API_0001
     *@tc.name testWebViewNativeMediaPlayerControlShownFalse
     *@tc.desc test NativeMediaPlayerControlShownFalse
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */

    it('testWebViewNativeMediaPlayerControlShownFalse', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerControlShownFalse"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerControlShownFalse", true, 1579,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_MediaPlayer_controlList_nodownload_API_0001
     *@tc.name testWebViewNativeMediaPlayer_mediaSrcList_format
     *@tc.desc test NativeMediaPlayerSetVolume0_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */

    it('testWebViewNativeMediaPlayerControlListNodownload', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerControlListNodownload"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerControlListNodownload", true, 1580,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_MediaPlayer_controlList_nofullscreen_API_0001
     *@tc.name testWebViewNativeMediaPlayer_mediaSrcList_format
     *@tc.desc test NativeMediaPlayerSetVolume0_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */

    it('testWebViewNativeMediaPlayerControlListNofullscreen', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerControlListNofullscreen"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerControlListNofullscreen", true, 1581,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_MediaPlayer_controlList_noremoteplayback_API_0001
     *@tc.name testWebViewNativeMediaPlayer_noremoteplayback
     *@tc.desc test NativeMediaPlayer_noremoteplayback
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */

    it('testWebViewNativeMediaPlayerNoremoteplayback', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerNoremoteplayback"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerNoremoteplayback", true, 1582,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_MediaPlayer_controlList_nodownload_nofullscreen_noremoteplayback_API_0001
     *@tc.name testWebViewNativeMediaPlayer_mediaSrcList_format
     *@tc.desc test NativeMediaPlayerSetVolume0_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */

    it('testWebViewNativeMediaPlayerNodownloadNoremoteplaybackNoremoteplayback', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerNodownloadNoremoteplaybackNoremoteplayback"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerNodownloadNoremoteplaybackNoremoteplayback", true, 1583,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_MediaPlayer_controlList_muted_true_API_0001
     *@tc.name testWebViewNativeMediaPlayer_mediaSrcList_muted_true
     *@tc.desc test NativeMediaPlayerSetVolume0_muted_true
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */

    it('testWebViewNativeMediaPlayerMutedTrue', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerMutedTrue"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerMutedTrue", true, 1584,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_MediaPlayer_controlList_muted_false_API_0001
     *@tc.name testWebViewNativeMediaPlayer_mediaSrcList_format
     *@tc.desc test NativeMediaPlayerSetVolume0_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */

    it('testWebViewNativeMediaPlayerMutedFalse', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerMutedFalse"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerMutedFalse", true, 1585,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_MediaPlayer_controlList_headers_API_0001
     *@tc.name testWebViewNativeMediaPlayer_mediaSrcList_format
     *@tc.desc test NativeMediaPlayerSetVolume0_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */

    it('testWebViewNativeMediaPlayerHeaders', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerHeaders"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerHeaders", true, 1586,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_MediaPlayer_controlList_attributes_API_0001
     *@tc.name testWebViewNativeMediaPlayer_mediaSrcList_format
     *@tc.desc test NativeMediaPlayerSetVolume0_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */

    it('testWebViewNativeMediaPlayerAttributes', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerAttributes"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerAttributes", true, 1587,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_MediaPlayer_controlList_preload_0_API_0001
     *@tc.name testWebViewNativeMediaPlayer_mediaSrcList_format
     *@tc.desc test NativeMediaPlayerSetVolume0_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */

    it('testWebViewNativeMediaPlayerPreloadNone', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerPreloadNone"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerPreloadNone", true, 1588,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_MediaPlayer_controlList_preload_1_API_0001
     *@tc.name testWebViewNativeMediaPlayer_mediaSrcList_format
     *@tc.desc test NativeMediaPlayerSetVolume0_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */

    it('testWebViewNativeMediaPlayerPreloadMetadata', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerPreloadMetadata"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerPreloadMetadata", true, 1589,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_MediaPlayer_controlList_preload_2_API_0001
     *@tc.name testWebViewNativeMediaPlayer_mediaSrcList_format
     *@tc.desc test NativeMediaPlayerSetVolume0_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */

    it('testWebViewNativeMediaPlayerPreloadAuto', 0, async (done: Function) => {
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