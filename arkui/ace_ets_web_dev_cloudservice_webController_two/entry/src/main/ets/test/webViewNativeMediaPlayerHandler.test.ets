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
import { afterEach, beforeAll, beforeEach, describe, it, expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
// @ts-nocheck
export default function webViewNativeMediaPlayerHandler() {
  describe('ActsAceWebViewNativeMediaPlayerHandler', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'MainAbility/pages/webViewNativeMediaPlayerHandler',
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
        await Utils.sleep(2000);
      console.info("webViewNativeMediaPlayerHandler beforeEach start");
      done();
    })
    
    /*
     *@tc.number SUB_ACE_WEB_handlePlaybackRateChanged_API_0001
     *@tc.name testWebViewNativeMediaPlayerHandlePlaybackRateChanged0001
     *@tc.desc test handlePlaybackRateChanged
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerHandlePlaybackRateChanged', 0, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandlePlaybackRateChanged";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewNativeMediaPlayerHandlePlaybackRateChanged", true, 1304, done);
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })
    
    /*
     *@tc.number SUB_ACE_WEB_handleTimeUpdate_API_0002
     *@tc.name testWebViewNativeMediaPlayerHandleTimeUpdate0002
     *@tc.desc test handleTimeUpdate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerHandleTimeUpdate', 0, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandleTimeUpdate";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleTimeUpdate", true, 1300, done);
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })
    
    /*
     *@tc.number SUB_ACE_WEB_handleBufferedEndTimeChanged_API_0003
     *@tc.name testWebViewNativeMediaPlayerHandleBufferedEndTimeChanged0003
     *@tc.desc test handleBufferedEndTimeChanged
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerHandleBufferedEndTimeChanged', 0, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandleBufferedEndTimeChanged";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleBufferedEndTimeChanged", true, 1301, done);
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })
    
    /*
     *@tc.number SUB_ACE_WEB_handleDurationChanged_API_0004
     *@tc.name testWebViewNativeMediaPlayerHandleDurationChanged0004
     *@tc.desc test handleDurationChanged
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerHandleDurationChanged', 0, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandleDurationChanged";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleDurationChanged", true, 1302, done);
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })
    
    /*
     *@tc.number SUB_ACE_WEB_handleVideoSizeChanged_API_0005
     *@tc.name testWebViewNativeMediaPlayerHandleVideoSizeChanged0005
     *@tc.desc test handleVideoSizeChanged
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerHandleVideoSizeChanged', 0, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandleVideoSizeChanged";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleVideoSizeChanged", true, 1303, done);
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })
    
    /*
     *@tc.number SUB_ACE_WEB_handleSeeking_API_0006
     *@tc.name testWebViewNativeMediaPlayerHandleSeeking0006
     *@tc.desc test handleSeeking
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerHandleSeeking', 0, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandleSeeking";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleSeeking", true, 1305, done);
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })
    
    /*
     *@tc.number SUB_ACE_WEB_handleSeekFinished_API_0007
     *@tc.name testWebViewNativeMediaPlayerHandleSeekFinished0007
     *@tc.desc test handleSeekFinished
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerHandleSeekFinished', 0, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandleSeekFinished";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleSeekFinished", true, 1306, done);
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })
    
    /*
     *@tc.number SUB_ACE_WEB_handleVolumeChanged_API_0008
     *@tc.name testWebViewNativeMediaPlayerHandleVolumeChanged0008
     *@tc.desc test handleVolumeChanged
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerHandleVolumeChanged', 0, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandleVolumeChanged";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleVolumeChanged", true, 1307, done);
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })
    
    /*
     *@tc.number SUB_ACE_WEB_handleEnded_API_0009
     *@tc.name testWebViewNativeMediaPlayerHandleEnded0009
     *@tc.desc test handleEnded
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerHandleEnded', 0, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandleEnded";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleEnded", true, 1308, done);
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })
    
    /*
     *@tc.number SUB_ACE_WEB_handleError_API_0009
     *@tc.name testWebViewNativeMediaPlayerHandleError0009
     *@tc.desc test handleError
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerHandleError', 0, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerHandleError";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleError", true, 1309, done);
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_seek_API_0001
     *@tc.name testWebViewNativeMediaSetSeek
     *@tc.desc test seek
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaSetSeek', 0, async (done: Function) => {
      let emitKey = "emitWebViewNativeVideoSetSeek";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewNativeMediaSetSeek", true, 1293, done);
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_setVolume_API_0001
     *@tc.name testWebViewNativeMediaSetVolume
     *@tc.desc test setVolume
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaSetVolume', 0, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaSetVolume";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewNativeMediaSetVolume", true, 1290, done);
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_mediaInfo_API_0001
     *@tc.name testWebViewNativeMediaMediaInfo
     *@tc.desc test embedID,mediaType,mediaSrcList,surfaceInfo,controlsShown,controlList,posterUrl,preload,attributes
     *@tc.type Function
     *@tc.size MediumTest
     *@tc.level 1
     */
    it('testWebViewNativeMediaMediaInfo', 0, async (done: Function) => {
      let emitKey="emitWebViewNativeMediaMediaInfo"
      Utils.emitEvent(emitKey,10)
      Utils.registerEvent("testWebViewNativeMediaMediaInfo", true, 1289, done);
      sendEventByKey('webViewNativeMediaPlayerHandler', 10, '');
    })
  })
}
