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
let emitKey = ""

export default function webViewNativeMediaPlayerHandlerEnhancedSetMuted() {
  describe('ActsAceWebViewNativeMediaPlayerHandlerEnhancedSetMuted', () => {
      
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
     *@tc.number SUB_ACE_WEB_SetVolume0_SetMutedTrue_API_0001
     *@tc.name testWebViewNativeMediaPlayerSetVolume0_SetMutedTrue
     *@tc.desc test NativeMediaPlayerSetVolume0_SetMutedTrue
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerSetMutedTrue', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSetMutedTrue"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerSetMutedTrue", true, 1591,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SetMutedTrue_handleMutedChanged_API_0001
     *@tc.name testWebViewNativeMediaPlayerSetMutedTrue_handleMutedChanged
     *@tc.desc test NativeMediaPlayerSetMutedTrue_handleMutedChanged
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerSetMutedTrue_handleMutedChange', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSetMutedTrue_handleMutedChange"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerSetMutedTrue_handleMutedChange", true, 1592,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SetMutedFalse_API_0001
     *@tc.name testWebViewNativeMediaPlayerSetMutedFalse_handleVolumeChange
     *@tc.desc test NativeMediaPlayerSetMutedFalse_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerSetMutedFalse', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSetMutedFalse"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerSetMutedFalse", true, 1593,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SetMutedFalse_API_0001
     *@tc.name testWebViewNativeMediaPlayerSetMutedFalse_handleVolumeChange
     *@tc.desc test NativeMediaPlayerSetMutedFalse_handleVolumeChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerSetMutedFalse_handleMutedChange', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSetMutedFalse_handleMutedChange"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerSetMutedFalse_handleMutedChange", true, 1594,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerHandlerEnhanced', 10, '');
    })
  })
}