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

export default function webViewNativeMediaPlayerHandler3() {
  describe('ActsAceWebViewMediaPlayerHandler3', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'MainAbility/pages/webViewNativeMediaPlayerHandler3',
      }

      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webViewNativeMediaPlayerHandler3 state success " + JSON.stringify(pages));
        if (!("webViewNativeMediaPlayerHandler3" == pages.name)) {
          console.info("get webViewNativeMediaPlayerHandler3 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push webViewNativeMediaPlayerHandler3 state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewNativeMediaPlayerHandler3 page error:" + err);
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
         *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0022
         *@tc.name testWebViewNativeMediaPlayerSetPlayRate
         *@tc.desc test NativeMediaPlayerVSetPlayRate
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewNativeMediaPlayerUpdateRect_1', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerUpdateRect_1"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerUpdateRect_1", true, 1821,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler3', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0023
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerUpdateRect_2', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerUpdateRect_2"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerUpdateRect_2", true, 1822,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler3', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0006
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerSetPlayRateNegative1', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSetPlayRateNegative1"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerSetPlayRateNegative1", true, 1805,
        done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webViewNativeMediaPlayerRateHandler3', 10, '');
    })


    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0002
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerSetPlayRate2', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSetPlayRate2"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerSetPlayRate2", true, 1801,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler3', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0003
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerSetPlayRate2_handleRateChange', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSetPlayRate2_handleRateChange"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerSetPlayRate2_handleRateChange", true, 1802,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler3', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0004
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerSetPlayRate3', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSetPlayRate3"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerSetPlayRate3", true, 1803,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler3', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0005
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerSetPlayRate3_handleRateChange', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSetPlayRate3_handleRateChange"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerSetPlayRate3_handleRateChange", true, 1804,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler3', 10, '');
    })
    
    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0001
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerSetPlayRate10', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSetPlayRate10"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerSetPlayRate10", true, 1800,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler3', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0007
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerSetPlayRate1_point_2', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSetPlayRate1_point_2"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerSetPlayRate1_point_2", true, 1806,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler3', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0008
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerSetPlayRate1_point_2_handleRateChange', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSetPlayRate1_point_2_handleRateChange"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerSetPlayRate1_point_2_handleRateChange", true, 1807,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler3', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0013
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerPreloadAuto', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerPreloadAuto"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerPreloadAuto", true, 1812,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler3', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0014
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerTimeUpdate', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerTimeUpdate"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerTimeUpdate", true, 1813,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler3', 10, '');
    })

    /*
    *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0016
    *@tc.name testWebViewNativeMediaPlayerSetPlayRate
    *@tc.desc test NativeMediaPlayerVSetPlayRate
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewNativeMediaPlayerFormatError', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerFormatError"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerFormatError", true, 1815,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler3', 10, '');
    })

    /*
    *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0017
    *@tc.name testWebViewNativeMediaPlayerSetPlayRate
    *@tc.desc test NativeMediaPlayerVSetPlayRate
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewNativeMediaPlayerNetError', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerNetError"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerNetError", true, 1816,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler3', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0018
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerDecodeError', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerDecodeError"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerDecodeError", true, 1817,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler3', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0020
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerNetworkStateIdle', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerNetworkStateIdle"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerNetworkStateIdle", true, 1819,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler3', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0019
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerNetworkStateLoading', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerNetworkStateLoading"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerNetworkStateLoading", true, 1818,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler3', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0021
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerNetworkStateError', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerNetworkStateError"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerNetworkStateError", true, 1820,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler3', 10, '');
    })



    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0027
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerReadyState_2', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerReadyState_2"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerReadyState_2", true, 1826,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler3', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0028
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerReadyState_3', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerReadyState_3"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerReadyState_3", true, 1827,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler3', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0024
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerUpdateRect_3', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerUpdateRect_3"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerUpdateRect_3", true, 1823,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler3', 10, '');
    })
    /*
      *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0029
      *@tc.name testWebViewNativeMediaPlayerSetPlayRate
      *@tc.desc test NativeMediaPlayerVSetPlayRate
      *@tc.size MediumTest
      *@tc.type Function
      *@tc.level 1
      */
    it('testWebViewNativeMediaPlayerReadyState_4', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerReadyState_4"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerReadyState_4", true, 1828,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler3', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0025
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerUpdateRect_4', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerUpdateRect_4"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerUpdateRect_4", true, 1824,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler3', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0026
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerReadyState_1', 0, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerReadyState_1"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerReadyState_1", true, 1825,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewNativeMediaPlayerRateHandler3', 10, '');
    })


  })
}
