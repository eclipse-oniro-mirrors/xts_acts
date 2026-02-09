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
import { waitForAssert, waitForExist } from './WaitTest.test';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let driver = Driver.create();
const EVENT_ID_SET_EIMIT_KEY = 142400;

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
          // await Utils.sleep(2000);
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
      try {
        console.info('======> wifi_test/isWifiActive :' + wifiMg.isWifiActive());
        let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
        console.info('======> Internet WifiLinkedInfo : ' + JSON.stringify(data));
        console.info('======> Internet speed : ' + JSON.stringify(data.linkSpeed));
        console.info('======> Internet chload : ' + JSON.stringify(data.chload));
        console.info('======> Internet rssi : ' + JSON.stringify(data.rssi));
        if (data.connState == wifiMg.ConnState.CONNECTED) {
          console.info('======> WLAN connection established ');
        } else {
          expect().message('======> WLAN Network error').assertFail();
          done()
        }
        if (data.chload >= 800 || data.rssi <= -80) {
          expect().message('======> WLAN Network error').assertFail();
          done();
        } else if (data.chload >= 500) {
          console.info('======> The internet connection is poor. ');
        }
      } catch (err) {
        console.info('======> getLinkedInfo promise failed, err : ' + JSON.stringify(err));
        throw (err as Error);
        done();
      }
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      // await Utils.sleep(2000);
      console.info("getSurfaceId beforeEach start");
      done();
    })

    /**
     * @tc.name   emitSetUrlTrustList0100
     * @tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_0100
     * @tc.desc   SetUrlTrustList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitSetUrlTrustList0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList0100", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerBaseEvent("emitSetUrlTrustList0100", 1, 142410, ()=>{isReturn = 1}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "getSurfaceIdButton");
      await waitForExist(()=>isReturn, "emitSetUrlTrustList0100", 1, 1000)
      done();
    })

    /**
     * @tc.name   emitSetUrlTrustList0200
     * @tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_0200
     * @tc.desc   SetUrlTrustList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitSetUrlTrustList0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList0200", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerBaseEvent("emitSetUrlTrustList0200", 1, 142420, ()=>{isReturn = 1}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "getSurfaceIdButton");
      await waitForExist(()=>isReturn, "emitSetUrlTrustList0200", 1, 1000)
      done();
    })

    /**
     * @tc.name   emitSetUrlTrustList0300
     * @tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_0300
     * @tc.desc   SetUrlTrustList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitSetUrlTrustList0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList0300", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerBaseEvent("emitSetUrlTrustList0300", 1, 142430, ()=>{isReturn = 1}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "getSurfaceIdButton");
      await waitForExist(()=>isReturn, "emitSetUrlTrustList0300", 1, 1000)
      done();
    })

    /**
     * @tc.name   emitSetUrlTrustList0400
     * @tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_0400
     * @tc.desc   SetUrlTrustList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitSetUrlTrustList0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList0400", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerBaseEvent("emitSetUrlTrustList0400", 1, 142440, ()=>{isReturn = 1}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "getSurfaceIdButton");
      await waitForExist(()=>isReturn, "emitSetUrlTrustList0400", 1, 1000)
      done();
    })

    /**
     * @tc.name   emitSetUrlTrustList0500
     * @tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_0500
     * @tc.desc   SetUrlTrustList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitSetUrlTrustList0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList0500", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerBaseEvent("emitSetUrlTrustList0500", 1, 142450, ()=>{isReturn = 1}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "getSurfaceIdButton");
      await waitForExist(()=>isReturn, "emitSetUrlTrustList0500", 1, 1000)
      done();
    })

    /**
     * @tc.name   emitSetUrlTrustList0600
     * @tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_0600
     * @tc.desc   SetUrlTrustList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitSetUrlTrustList0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList0600", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerBaseEvent("emitSetUrlTrustList0600", 1, 142460, ()=>{isReturn = 1}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "getSurfaceIdButton");
      await waitForExist(()=>isReturn, "emitSetUrlTrustList0600", 1, 1000)
      done();
    })

    /**
     * @tc.name   emitSetUrlTrustList0700
     * @tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_0700
     * @tc.desc   SetUrlTrustList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitSetUrlTrustList0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList0700", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerBaseEvent("emitSetUrlTrustList0700", 1, 142470, ()=>{isReturn = 1}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "getSurfaceIdButton");
      await waitForExist(()=>isReturn, "emitSetUrlTrustList0700", 1, 1000)
      done();
    })

    /**
     * @tc.name   emitSetUrlTrustList0800
     * @tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_0800
     * @tc.desc   SetUrlTrustList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitSetUrlTrustList0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList0800", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerBaseEvent("emitSetUrlTrustList0800", "17100001", 142480, ()=>{isReturn = 1}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "getSurfaceIdButton");
      await waitForExist(()=>isReturn, "emitSetUrlTrustList0800", 1, 1000)
      done();
    })

    /**
     * @tc.name   emitSetUrlTrustList0900
     * @tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_0900
     * @tc.desc   SetUrlTrustList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitSetUrlTrustList0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList0900", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerBaseEvent("emitSetUrlTrustList0900", "Init error. The WebviewController must be associated with a Web component", 142490, ()=>{isReturn = 1}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "getSurfaceIdButton");
      await waitForExist(()=>isReturn, "emitSetUrlTrustList0900", 1, 1000)
      done();
    })

    /**
     * @tc.name   emitSetUrlTrustList1000
     * @tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_1000
     * @tc.desc   SetUrlTrustList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitSetUrlTrustList1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList1000", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerBaseEvent("emitSetUrlTrustList1000", "401", 142401, ()=>{isReturn = 1}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "getSurfaceIdButton");
      await waitForExist(()=>isReturn, "emitSetUrlTrustList1000", 1, 1000)
      done();
    })

    /**
     * @tc.name   emitSetUrlTrustList1100
     * @tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_1100
     * @tc.desc   SetUrlTrustList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitSetUrlTrustList1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList1100", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerBaseEvent("emitSetUrlTrustList1100", 1, 142411, ()=>{isReturn = 1}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "getSurfaceIdButton");
      await waitForExist(()=>isReturn, "emitSetUrlTrustList1100", 1, 1000)
      done();
    })

    /**
     * @tc.name   emitSetUrlTrustList1200
     * @tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_1200
     * @tc.desc   SetUrlTrustList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitSetUrlTrustList1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList1200", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerBaseEvent("emitSetUrlTrustList1200", 1, 142421, ()=>{isReturn = 1}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "getSurfaceIdButton");
      await waitForExist(()=>isReturn, "emitSetUrlTrustList1200", 1, 1000)
      done();
    })

    /**
     * @tc.name   emitSetUrlTrustList1300
     * @tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_1300
     * @tc.desc   SetUrlTrustList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitSetUrlTrustList1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList1300", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerBaseEvent("emitSetUrlTrustList1300", 1, 142431, ()=>{isReturn = 1}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "getSurfaceIdButton");
      await waitForExist(()=>isReturn, "emitSetUrlTrustList1300", 1, 1000)
      done();
    })

    /**
     * @tc.name   emitSetUrlTrustList1400
     * @tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_1400
     * @tc.desc   SetUrlTrustList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitSetUrlTrustList1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetUrlTrustList1400", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerBaseEvent("emitSetUrlTrustList1400", 1, 142441, ()=>{isReturn = 1}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "getSurfaceIdButton");
      await waitForExist(()=>isReturn, "emitSetUrlTrustList1400", 1, 1000)
      done();
    })
  })
}