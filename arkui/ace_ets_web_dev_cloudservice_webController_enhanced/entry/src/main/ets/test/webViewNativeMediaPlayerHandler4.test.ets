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

export default function webViewNativeMediaPlayerHandler4() {
  describe('ActsAceWebViewMediaPlayerHandler4', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'MainAbility/pages/webViewNativeMediaPlayerHandler4',
      }

      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webViewNativeMediaPlayerHandler4 state success " + JSON.stringify(pages));
        if (!("webViewNativeMediaPlayerHandler4" == pages.name)) {
          console.info("get webViewNativeMediaPlayerHandler4 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push webViewNativeMediaPlayerHandler4 state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewNativeMediaPlayerHandler4 page error:" + err);
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
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0009
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerHandleVideoSizeChange', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerHandleVideoSizeChange"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerHandleVideoSizeChange", true, 1808,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler4', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0015
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerBufferedEndTime', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerBufferedEndTime"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerBufferedEndTime", true, 1814,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler4', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0010
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerSeek500', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSeek500"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerSeek500", true, 1809,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler4', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0012
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerSeek20', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSeek20"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerSeek20", true, 1811,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler4', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0011
         *@tc.name testWebViewNativeMediaPlayerSetPlayRate
         *@tc.desc test NativeMediaPlayerVSetPlayRate
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewNativeMediaPlayerSeekNegative1', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSeekNegative1"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerSeekNegative1", true, 1810,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler4', 10, '');
    })



  })
}
