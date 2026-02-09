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
import { beforeAll, beforeEach, describe, it, TestType, Size, Level, expect } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

const EVENT_ID_SET_EMIT_KEY = 201590;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webONHttpErrorRecvExampleIsReady() {
  describe('ActsAceWebDevWebONHttpErrorRecvExampleIsReadyTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webONHttpErrorRecvExampleIsReady',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webONHttpErrorRecvExampleIsReady state success " + JSON.stringify(pages));
        if (!("webONHttpErrorRecvExampleIsReady" == pages.name)) {
          console.info("get webONHttpErrorRecvExampleIsReady state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push webONHttpErrorRecvExampleIsReady page success");
        }
      } catch (err) {
        console.error("push webONHttpErrorRecvExampleIsReady page error: " + err);
      }
      await driver.waitForComponent(ON.id("webONHttpErrorRecvExampleIsReady"), 10000);
      console.log("waitForComponent webONHttpErrorRecvExampleIsReady");
      done()
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
        if (data.chload >= 900 || data.rssi <= -80) {
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
      console.info("webONHttpErrorRecvExampleIsReady beforeEach start");
      done();
    })

    /**
     * @tc.name   testOnHttpErrorRecvExampleIsReadyFalseWebc
     * @tc.number SUB_ACE_BASIC_ETS_WEBERRORRECV_API_0400
     * @tc.desc   test interface of onHttpErrorReceive with parameter used by example but setResponseIsReady false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnHttpErrorRecvExampleIsReadyFalseWebc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnHttpErrorRecvExampleIsReadyFalseWebc", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testOnHttpErrorRecvExampleIsReadyFalseWebc", 403, 201600, () => { isReturn = 1 });
      Utils.registerEvent("testOnHttpErrorRecvExampleIsReadyFalseWebc", "", 201610, () => { isReturn = 2 });
      await Utils.waitAndClickComponent(driver, "webONHttpErrorRecvExampleIsReady");
      if (await Utils.waitForExist(() => isReturn, 'testOnHttpErrorRecvExampleIsReadyFalseWebc' + '_returnCheck', 2, 1000)) {
        done();
      }
    })
  })
}