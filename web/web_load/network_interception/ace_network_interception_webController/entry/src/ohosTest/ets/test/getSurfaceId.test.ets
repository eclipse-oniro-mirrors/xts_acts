/*
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
import { Driver, ON } from '@kit.TestKit';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let driver = Driver.create();

export default function getSurfaceId() {
  describe('getSurfaceId', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/getSurfaceId',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getSurfaceId state success " + JSON.stringify(pages));
        if (!("getSurfaceId" == pages.name)) {
          console.info("get getSurfaceId state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push getSurfaceId page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getSurfaceId page error: " + err);
      }
      await driver.waitForComponent(ON.id("getSurfaceIdButton"),10000);
      console.log("waitForComponent getSurfaceIdButton==>");
      done();
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("getSurfaceId beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("getSurfaceId afterEach start");
      await Utils.sleep(2000);
      done();
    })

     /*
     * @tc.number     : SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_0100
     * @tc.name       : emitSetUrlTrustList0100
     * @tc.desc       : SetUrlTrustList
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('emitSetUrlTrustList0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList0100", 728)
      Utils.registerBaseEvent("emitSetUrlTrustList0100", 1, 28931, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

     /*
     * @tc.number     : SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_0200
     * @tc.name       : emitSetUrlTrustList0200
     * @tc.desc       : SetUrlTrustList
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('emitSetUrlTrustList0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList0200", 728)
      Utils.registerBaseEvent("emitSetUrlTrustList0200", 1, 28932, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_0300
    * @tc.name       : emitSetUrlTrustList0300
    * @tc.desc       : SetUrlTrustList
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('emitSetUrlTrustList0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList0300", 728)
      Utils.registerBaseEvent("emitSetUrlTrustList0300", 1, 28933, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

     /*
     * @tc.number     : SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_0400
     * @tc.name       : emitSetUrlTrustList0400
     * @tc.desc       : SetUrlTrustList
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('emitSetUrlTrustList0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList0400", 728)
      Utils.registerBaseEvent("emitSetUrlTrustList0400", 1, 28934, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

     /*
     * @tc.number     : SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_0500
     * @tc.name       : emitSetUrlTrustList0500
     * @tc.desc       : SetUrlTrustList
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('emitSetUrlTrustList0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList0500", 728)
      Utils.registerBaseEvent("emitSetUrlTrustList0500", 1, 28935, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

     /*
     * @tc.number     : SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_0600
     * @tc.name       : emitSetUrlTrustList0600
     * @tc.desc       : SetUrlTrustList
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('emitSetUrlTrustList0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList0600", 728)
      Utils.registerBaseEvent("emitSetUrlTrustList0600", 1, 28936, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_0700
    * @tc.name       : emitSetUrlTrustList0700
    * @tc.desc       : SetUrlTrustList
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('emitSetUrlTrustList0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList0700", 728)
      Utils.registerBaseEvent("emitSetUrlTrustList0700", 1, 28937, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_0800
    * @tc.name       : emitSetUrlTrustList0800
    * @tc.desc       : SetUrlTrustList
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('emitSetUrlTrustList0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList0800", 728)
      Utils.registerBaseEvent("emitSetUrlTrustList0800", "17100001", 28940, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_0900
    * @tc.name       : emitSetUrlTrustList0900
    * @tc.desc       : SetUrlTrustList
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('emitSetUrlTrustList0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList0900", 728)
      Utils.registerBaseEvent("emitSetUrlTrustList0900", "Init error. The WebviewController must be associated with a Web component", 28941, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

    /*
     * @tc.number     : SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_1000
     * @tc.name       : emitSetUrlTrustList1000
     * @tc.desc       : SetUrlTrustList
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
    */
    it('emitSetUrlTrustList1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList1000", 728)
      Utils.registerBaseEvent("emitSetUrlTrustList1000", "401", 28942, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_1100
    * @tc.name       : emitSetUrlTrustList1100
    * @tc.desc       : SetUrlTrustList
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('emitSetUrlTrustList1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList1100", 728)
      Utils.registerBaseEvent("emitSetUrlTrustList1100", 1, 28943, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_1200
    * @tc.name       : emitSetUrlTrustList1200
    * @tc.desc       : SetUrlTrustList
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('emitSetUrlTrustList1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList1200", 728)
      Utils.registerBaseEvent("emitSetUrlTrustList1200", 1, 28944, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_1300
    * @tc.name       : emitSetUrlTrustList1300
    * @tc.desc       : SetUrlTrustList
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('emitSetUrlTrustList1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList1300", 728)
      Utils.registerBaseEvent("emitSetUrlTrustList1300", 3, 28945, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_1400
    * @tc.name       : emitSetUrlTrustList1400
    * @tc.desc       : SetUrlTrustList
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('emitSetUrlTrustList1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList1400", 728)
      Utils.registerBaseEvent("emitSetUrlTrustList1400", 3, 28946, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('getSurfaceIdButton', 10, '');
    })
  })
}