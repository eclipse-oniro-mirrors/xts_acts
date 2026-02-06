/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import { waitForComponents } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
export default function webViewNativeMediaPlayerHandler() {
  describe('ActsAceWebViewNativeMediaPlayerHandler', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/webViewNativeMediaPlayerHandler',
      }

      try {
        router.clear();
        let pages = router.getState();
        if (!("webViewNativeMediaPlayerHandler" == pages.name)) {
          let result = await router.pushUrl(options);
          console.info("push webViewNativeMediaPlayerHandler state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewNativeMediaPlayerHandler page error:" + err);
      }
      await waitForComponents("webViewNativeMediaPlayerHandler");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewNativeMediaPlayerHandler beforeEach start");
      done();
    })

    /**
     * @tc.name   testWebViewNativeMediaPlayerHandlePlaybackRateChanged
     * @tc.number SUB_ACE_WEB_handlePlaybackRateChanged_API_0001
     * @tc.desc   test handlePlaybackRateChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewNativeMediaPlayerHandlePlaybackRateChanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let emitKey = "emitWebViewNativeMediaPlayerHandlePlaybackRateChanged";
        Utils.emitEvent(emitKey, 300200)
        Utils.registerBaseEvent("testWebViewNativeMediaPlayerHandlePlaybackRateChanged", true, 300250, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
        sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
      })

    /**
     * @tc.name   testWebViewNativeMediaPlayerHandleTimeUpdate
     * @tc.number SUB_ACE_WEB_handleTimeUpdate_API_0002
     * @tc.desc   test handleTimeUpdate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewNativeMediaPlayerHandleTimeUpdate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandleTimeUpdate";
      Utils.emitEvent(emitKey, 300200)
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerHandleTimeUpdate", true, 300210, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })

    /**
     * @tc.name   testWebViewNativeMediaPlayerHandleBufferedEndTimeChanged
     * @tc.number SUB_ACE_WEB_handleBufferedEndTimeChanged_API_0003
     * @tc.desc   test handleBufferedEndTimeChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewNativeMediaPlayerHandleBufferedEndTimeChanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandleBufferedEndTimeChanged";
      Utils.emitEvent(emitKey, 300200)
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerHandleBufferedEndTimeChanged", true, 300220, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })

    /**
     * @tc.name   testWebViewNativeMediaPlayerHandleDurationChanged
     * @tc.number SUB_ACE_WEB_handleDurationChanged_API_0004
     * @tc.desc   test handleDurationChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewNativeMediaPlayerHandleDurationChanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandleDurationChanged";
      Utils.emitEvent(emitKey, 300200)
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerHandleDurationChanged", true, 300230, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })

    /**
     * @tc.name   testWebViewNativeMediaPlayerHandleVideoSizeChanged
     * @tc.number SUB_ACE_WEB_handleVideoSizeChanged_API_0005
     * @tc.desc   test handleVideoSizeChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewNativeMediaPlayerHandleVideoSizeChanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandleVideoSizeChanged";
      Utils.emitEvent(emitKey, 300200)
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerHandleVideoSizeChanged", true, 300240, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })

    /**
     * @tc.name   testWebViewNativeMediaPlayerHandleSeeking
     * @tc.number SUB_ACE_WEB_handleSeeking_API_0006
     * @tc.desc   test handleSeeking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewNativeMediaPlayerHandleSeeking', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandleSeeking";
      Utils.emitEvent(emitKey, 300200)
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerHandleSeeking", true, 300320, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })

    /**
     * @tc.name   testWebViewNativeMediaPlayerHandleSeekFinished
     * @tc.number SUB_ACE_WEB_handleSeekFinished_API_0007
     * @tc.desc   test handleSeekFinished
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewNativeMediaPlayerHandleSeekFinished', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandleSeekFinished";
      Utils.emitEvent(emitKey, 300200)
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerHandleSeekFinished", true, 300260, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })

    /**
     * @tc.name   testWebViewNativeMediaPlayerHandleVolumeChanged
     * @tc.number SUB_ACE_WEB_handleVolumeChanged_API_0008
     * @tc.desc   test handleVolumeChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewNativeMediaPlayerHandleVolumeChanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandleVolumeChanged";
      Utils.emitEvent(emitKey, 300200)
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerHandleVolumeChanged", true, 300270, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })


    /**
     * @tc.name   testWebViewNativeMediaPlayerHandleEnded
     * @tc.number SUB_ACE_WEB_handleEnded_API_0009
     * @tc.desc   test handleEnded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewNativeMediaPlayerHandleEnded', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandleEnded";
      Utils.emitEvent(emitKey, 300200)
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerHandleEnded", true, 300280, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })

    /**
     * @tc.name   testWebViewNativeMediaPlayerHandleError
     * @tc.number SUB_ACE_WEB_handleError_API_0009
     * @tc.desc   test handleError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewNativeMediaPlayerHandleError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandleError";
      Utils.emitEvent(emitKey, 300200)
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerHandleError", true, 300290, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })


    /**
     * @tc.name   testWebViewNativeMediaSetSeekTwo
     * @tc.number SUB_ACE_WEB_seek_API_0002
     * @tc.desc   test seek
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewNativeMediaSetSeekTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = "emitWebViewNativeVideoSetSeek";
      Utils.emitEvent(emitKey,300200)
      Utils.registerBaseEvent("testWebViewNativeMediaSetSeek", true, 300330, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })


    /**
     * @tc.name   testWebViewNativeMediaSetVolumeTwo
     * @tc.number SUB_ACE_WEB_setVolume_API_0002
     * @tc.desc   test setVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewNativeMediaSetVolumeTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaSetVolume";
      Utils.emitEvent(emitKey, 300200)
      Utils.registerBaseEvent("testWebViewNativeMediaSetVolume", true, 300340, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })

    /**
     * @tc.name   testWebViewNativeMediaMediaInfoTwo
     * @tc.number SUB_ACE_WEB_mediaInfo_API_0002
     * @tc.desc   test embedID,mediaType,mediaSrcList,surfaceInfo,controlsShown,controlList,posterUrl,preload,attributes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewNativeMediaMediaInfoTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey="emitWebViewNativeMediaMediaInfo"
      Utils.emitEvent(emitKey,300200)
      Utils.registerBaseEvent("testWebViewNativeMediaMediaInfo", true, 300350, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })
  })
}
