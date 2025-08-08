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
        await Utils.sleep(1000);
        router.clear();
        let pages = router.getState();
        if (!("webViewNativeMediaPlayerHandler" == pages.name)) {
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push webViewNativeMediaPlayerHandler state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewNativeMediaPlayerHandler page error:" + err);
      }
      done()
    });
      
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
        await Utils.sleep(2000);
      console.info("webViewNativeMediaPlayerHandler beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_ACE_WEB_handlePlaybackRateChanged_API_0001
    * @tc.name       : testWebViewNativeMediaPlayerHandlePlaybackRateChanged
    * @tc.desc       : test handlePlaybackRateChanged
    * @tc.size_t     : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testWebViewNativeMediaPlayerHandlePlaybackRateChanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandlePlaybackRateChanged";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewNativeMediaPlayerHandlePlaybackRateChanged", true, 1304, done);
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_handleTimeUpdate_API_0002
    * @tc.name       : testWebViewNativeMediaPlayerHandleTimeUpdate
    * @tc.desc       : test handleTimeUpdate
    * @tc.size_t     : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebViewNativeMediaPlayerHandleTimeUpdate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandleTimeUpdate";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleTimeUpdate", true, 1300, done);
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_handleBufferedEndTimeChanged_API_0003
    * @tc.name       : testWebViewNativeMediaPlayerHandleBufferedEndTimeChanged
    * @tc.desc       : test handleBufferedEndTimeChanged
    * @tc.size_t     : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebViewNativeMediaPlayerHandleBufferedEndTimeChanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandleBufferedEndTimeChanged";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleBufferedEndTimeChanged", true, 1301, done);
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_handleDurationChanged_API_0004
    * @tc.name       : testWebViewNativeMediaPlayerHandleDurationChanged
    * @tc.desc       : test handleDurationChanged
    * @tc.size_t     : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebViewNativeMediaPlayerHandleDurationChanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandleDurationChanged";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleDurationChanged", true, 1302, done);
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_handleVideoSizeChanged_API_0005
    * @tc.name       : testWebViewNativeMediaPlayerHandleVideoSizeChanged
    * @tc.desc       : test handleVideoSizeChanged
    * @tc.size_t     : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebViewNativeMediaPlayerHandleVideoSizeChanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandleVideoSizeChanged";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleVideoSizeChanged", true, 1303, done);
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_handleSeeking_API_0006
    * @tc.name       : testWebViewNativeMediaPlayerHandleSeeking
    * @tc.desc       : test handleSeeking
    * @tc.size_t     : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebViewNativeMediaPlayerHandleSeeking', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandleSeeking";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleSeeking", true, 1305, done);
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_handleSeekFinished_API_0007
    * @tc.name       : testWebViewNativeMediaPlayerHandleSeekFinished
    * @tc.desc       : test handleSeekFinished
    * @tc.size_t     : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebViewNativeMediaPlayerHandleSeekFinished', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandleSeekFinished";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleSeekFinished", true, 1306, done);
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_handleVolumeChanged_API_0008
    * @tc.name       : testWebViewNativeMediaPlayerHandleVolumeChanged
    * @tc.desc       : test handleVolumeChanged
    * @tc.size_t     : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebViewNativeMediaPlayerHandleVolumeChanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandleVolumeChanged";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleVolumeChanged", true, 1307, done);
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })


    /*
    * @tc.number     : SUB_ACE_WEB_handleEnded_API_0009
    * @tc.name       : testWebViewNativeMediaPlayerHandleEnded
    * @tc.desc       : test handleEnded
    * @tc.size_t     : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebViewNativeMediaPlayerHandleEnded', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandleEnded";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleEnded", true, 1308, done);
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })

    /*
     * @tc.number     : SUB_ACE_WEB_handleError_API_0009
     * @tc.name       : testWebViewNativeMediaPlayerHandleError
     * @tc.desc       : test handleError
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebViewNativeMediaPlayerHandleError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandleError";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleError", true, 1309, done);
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })


    /*
     * @tc.number     : SUB_ACE_WEB_seek_API_0002
     * @tc.name       : testWebViewNativeMediaSetSeekTwo
     * @tc.desc       : test seek
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebViewNativeMediaSetSeekTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = "emitWebViewNativeVideoSetSeek";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewNativeMediaSetSeek", true, 1293, done);
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })


    /*
     * @tc.number     : SUB_ACE_WEB_setVolume_API_0002
     * @tc.name       : testWebViewNativeMediaSetVolumeTwo
     * @tc.desc       : test setVolume
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebViewNativeMediaSetVolumeTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaSetVolume";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewNativeMediaSetVolume", true, 1290, done);
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })

    /*
     * @tc.number     : SUB_ACE_WEB_mediaInfo_API_0002
     * @tc.name       : testWebViewNativeMediaMediaInfoTwo
     * @tc.desc       : test embedID,mediaType,mediaSrcList,surfaceInfo,controlsShown,controlList,posterUrl,preload,attributes
     * @tc.size_t     : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWebViewNativeMediaMediaInfoTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey="emitWebViewNativeMediaMediaInfo"
      Utils.emitEvent(emitKey,10)
      Utils.registerEvent("testWebViewNativeMediaMediaInfo", true, 1289, done);
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })
  })
}
