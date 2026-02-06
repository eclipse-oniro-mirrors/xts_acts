

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
import { afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponents } from './WaitTest.test';
import { Driver, ON } from '@kit.TestKit';


// @ts-nocheck
let emitKey = ""
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewNativeMediaPlayerHandler3() {
  describe('ActsAceWebViewMediaPlayerHandler3', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/webViewNativeMediaPlayerHandler3',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewNativeMediaPlayerHandler3 state success " + JSON.stringify(pages));
        if (!("webViewNativeMediaPlayerHandler3" == pages.name)) {
          console.info("get webViewNativeMediaPlayerHandler3 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webViewNativeMediaPlayerHandler3 state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewNativeMediaPlayerHandler3 page error:" + err);
      }
      await waitForComponents('webViewNativeMediaPlayerRateHandler3');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewNativeMediaPlayerHandler3',
      }
      await router.replaceUrl(options);
      done();
    })

    afterEach(async (done: Function) => {
      done();
    })
    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0022
     *@tc.name testWebViewNativeMediaPlayerUpdateRect_1
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerUpdateRect_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = "emitWebViewNativeMediaPlayerUpdateRect_1"
        Utils.emitEvent(emitKey, 132780);
        Utils.registerBaseEvent("testWebViewNativeMediaPlayerUpdateRect_1", true, 132790, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerRateHandler3')
      })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0023
     *@tc.name testWebViewNativeMediaPlayerUpdateRect_2
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerUpdateRect_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = "emitWebViewNativeMediaPlayerUpdateRect_2"
        Utils.emitEvent(emitKey, 132780);
        Utils.registerBaseEvent("testWebViewNativeMediaPlayerUpdateRect_2", true, 132800, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerRateHandler3')
      })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0006
     *@tc.name testWebViewNativeMediaPlayerSetPlayRateNegative1
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerSetPlayRateNegative1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = "emitWebViewNativeMediaPlayerSetPlayRateNegative1"
        Utils.emitEvent(emitKey, 132780);
        Utils.registerBaseEvent("testWebViewNativeMediaPlayerSetPlayRateNegative1", true, 132810,
          done,(backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerRateHandler3')
      })


    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0002
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate2
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerSetPlayRate2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = "emitWebViewNativeMediaPlayerSetPlayRate2"
        Utils.emitEvent(emitKey, 132780);
        Utils.registerBaseEvent("testWebViewNativeMediaPlayerSetPlayRate2", true, 132820,
          done,(backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerRateHandler3')
      })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0003
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate2_handleRateChange
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerSetPlayRate2_handleRateChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = "emitWebViewNativeMediaPlayerSetPlayRate2_handleRateChange"
        Utils.emitEvent(emitKey, 132780);
        Utils.registerBaseEvent("testWebViewNativeMediaPlayerSetPlayRate2_handleRateChange", true, 132830,
          done,(backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerRateHandler3')
      })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0004
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate3
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerSetPlayRate3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = "emitWebViewNativeMediaPlayerSetPlayRate3"
        Utils.emitEvent(emitKey, 132780);
        Utils.registerBaseEvent("testWebViewNativeMediaPlayerSetPlayRate3", true, 132850, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerRateHandler3')
      })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0005
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate3_handleRateChange
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerSetPlayRate3_handleRateChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = "emitWebViewNativeMediaPlayerSetPlayRate3_handleRateChange"
        Utils.emitEvent(emitKey, 132780);
        Utils.registerBaseEvent("testWebViewNativeMediaPlayerSetPlayRate3_handleRateChange", true, 132860, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerRateHandler3')
      })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0001
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate10
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerSetPlayRate10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = "emitWebViewNativeMediaPlayerSetPlayRate10"
        Utils.emitEvent(emitKey, 132780);
        Utils.registerBaseEvent("testWebViewNativeMediaPlayerSetPlayRate10", true, 132870, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerRateHandler3')
      })
    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0007
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate1_point_2
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerSetPlayRate1_point_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = "emitWebViewNativeMediaPlayerSetPlayRate1_point_2"
        Utils.emitEvent(emitKey, 132780);
        Utils.registerBaseEvent("testWebViewNativeMediaPlayerSetPlayRate1_point_2", true, 132880, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerRateHandler3')
      })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0008
     *@tc.name testWebViewNativeMediaPlayerSetPlayRate1_point_2_handleRateChange
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerSetPlayRate1_point_2_handleRateChange',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        emitKey = "emitWebViewNativeMediaPlayerSetPlayRate1_point_2_handleRateChange"
        Utils.emitEvent(emitKey, 132780);
        Utils.registerBaseEvent("testWebViewNativeMediaPlayerSetPlayRate1_point_2_handleRateChange", true, 132890, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerRateHandler3')
      })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0013
     *@tc.name testWebViewNativeMediaPlayerPreloadAuto02
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerPreloadAuto02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = "emitWebViewNativeMediaPlayerPreloadAuto"
        Utils.emitEvent(emitKey, 132780);
        Utils.registerBaseEvent("testWebViewNativeMediaPlayerPreloadAuto02", true, 132900, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerRateHandler3')
      })
    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0014
     *@tc.name testWebViewNativeMediaPlayerTimeUpdate
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerTimeUpdate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = "emitWebViewNativeMediaPlayerTimeUpdate"
        Utils.emitEvent(emitKey, 132780);
        Utils.registerBaseEvent("testWebViewNativeMediaPlayerTimeUpdate", true, 132910, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerRateHandler3')
      })

    /*
    *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0016
    *@tc.name testWebViewNativeMediaPlayerFormatError
    *@tc.desc test NativeMediaPlayerVSetPlayRate
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level Level 1
    */
    it('testWebViewNativeMediaPlayerFormatError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = "emitWebViewNativeMediaPlayerFormatError"
        Utils.emitEvent(emitKey, 132780);
        Utils.registerBaseEvent("testWebViewNativeMediaPlayerFormatError", true, 132920, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerRateHandler3')
      })

    /*
    *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0017
    *@tc.name testWebViewNativeMediaPlayerNetError
    *@tc.desc test NativeMediaPlayerVSetPlayRate
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level Level 1
    */
    it('testWebViewNativeMediaPlayerNetError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = "emitWebViewNativeMediaPlayerNetError"
        Utils.emitEvent(emitKey, 132780);
        Utils.registerBaseEvent("testWebViewNativeMediaPlayerNetError", true, 132930, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerRateHandler3')
      })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0018
     *@tc.name testWebViewNativeMediaPlayerDecodeError
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerDecodeError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = "emitWebViewNativeMediaPlayerDecodeError"
        Utils.emitEvent(emitKey, 132780);
        Utils.registerBaseEvent("testWebViewNativeMediaPlayerDecodeError", true, 132940, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerRateHandler3')
      })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0020
     *@tc.name testWebViewNativeMediaPlayerNetworkStateIdle
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 2
     */
    it('testWebViewNativeMediaPlayerNetworkStateIdle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        emitKey = "emitWebViewNativeMediaPlayerNetworkStateIdle"
        Utils.emitEvent(emitKey, 132780);
        Utils.registerBaseEvent("testWebViewNativeMediaPlayerNetworkStateIdle", true, 132950, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerRateHandler3')
      })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0019
     *@tc.name testWebViewNativeMediaPlayerNetworkStateLoading
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 2
     */
    it('testWebViewNativeMediaPlayerNetworkStateLoading', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        emitKey = "emitWebViewNativeMediaPlayerNetworkStateLoading"
        Utils.emitEvent(emitKey, 132780);
        Utils.registerBaseEvent("testWebViewNativeMediaPlayerNetworkStateLoading", true, 132960, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerRateHandler3')
      })
    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0021
     *@tc.name testWebViewNativeMediaPlayerNetworkStateError
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 2
     */
    it('testWebViewNativeMediaPlayerNetworkStateError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        emitKey = "emitWebViewNativeMediaPlayerNetworkStateError"
        Utils.emitEvent(emitKey, 132780);
        Utils.registerBaseEvent("testWebViewNativeMediaPlayerNetworkStateError", true, 132970, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerRateHandler3')
      })


    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0027
     *@tc.name testWebViewNativeMediaPlayerReadyState_2
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 2
     */
    it('testWebViewNativeMediaPlayerReadyState_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        emitKey = "emitWebViewNativeMediaPlayerReadyState_2"
        Utils.emitEvent(emitKey, 132780);
        Utils.registerBaseEvent("testWebViewNativeMediaPlayerReadyState_2", true, 132980, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerRateHandler3')
      })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0028
     *@tc.name testWebViewNativeMediaPlayerReadyState_3
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 2
     */
    it('testWebViewNativeMediaPlayerReadyState_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        emitKey = "emitWebViewNativeMediaPlayerReadyState_3"
        Utils.emitEvent(emitKey, 132780);
        Utils.registerBaseEvent("testWebViewNativeMediaPlayerReadyState_3", true, 132990, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerRateHandler3')
      })

    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0024
     *@tc.name testWebViewNativeMediaPlayerUpdateRect_3
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerUpdateRect_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = "emitWebViewNativeMediaPlayerUpdateRect_3"
        Utils.emitEvent(emitKey, 132780);
        Utils.registerBaseEvent("testWebViewNativeMediaPlayerUpdateRect_3", true, 132991, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerRateHandler3')
      })
    /*
      *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0029
      *@tc.name testWebViewNativeMediaPlayerReadyState_4
      *@tc.desc test NativeMediaPlayerVSetPlayRate
      *@tc.size MediumTest
      *@tc.type Function
      *@tc.level Level 2
      */
    it('testWebViewNativeMediaPlayerReadyState_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        emitKey = "emitWebViewNativeMediaPlayerReadyState_4"
        Utils.emitEvent(emitKey, 132780);
        Utils.registerBaseEvent("testWebViewNativeMediaPlayerReadyState_4", true, 132992, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerRateHandler3')
      })
    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0025
     *@tc.name testWebViewNativeMediaPlayerUpdateRect_4
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerUpdateRect_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = "emitWebViewNativeMediaPlayerUpdateRect_4"
        Utils.emitEvent(emitKey, 132780);
        Utils.registerBaseEvent("testWebViewNativeMediaPlayerUpdateRect_4", true, 132993, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerRateHandler3')
      })
    /*
     *@tc.number SUB_ACE_WEB_NativeMediaPlayerSetPlayRate_API_0026
     *@tc.name testWebViewNativeMediaPlayerReadyState_1
     *@tc.desc test NativeMediaPlayerVSetPlayRate
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 2
     */
    it('testWebViewNativeMediaPlayerReadyState_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        emitKey = "emitWebViewNativeMediaPlayerReadyState_1"
        Utils.emitEvent(emitKey, 132780);
        Utils.registerBaseEvent("testWebViewNativeMediaPlayerReadyState_1", true, 132994, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerRateHandler3')
      })


  })
}
