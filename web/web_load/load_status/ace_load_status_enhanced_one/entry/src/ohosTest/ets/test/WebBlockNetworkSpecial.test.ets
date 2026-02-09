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

import { beforeAll, beforeEach,afterEach, expect, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { Driver, ON } from '@kit.TestKit';
import { accessibility, config } from '@kit.AccessibilityKit';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let driver = Driver.create();
export default function WebBlockNetworkSpecial() {

  describe('WebBlockNetworkSpecial', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebBlockNetworkSpecial',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebBlockNetworkSpecial state success " + JSON.stringify(pages));
        if (!("WebBlockNetworkSpecial" == pages.name)) {
          console.info("get WebBlockNetworkSpecial state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebBlockNetworkSpecial page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebBlockNetworkSpecial page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebBlockNetworkSpecialButton"),10000);
      console.log("waitForComponent WebBlockNetworkSpecialButton click==>")
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
      console.info("WebBlockNetworkSpecial beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebBlockNetworkSpecial afterEach start");
      done();
    })

    /**
     * @tc.name   testWebBlockNetworkSetNull
     * @tc.number SUB_ACE_WEB_BLOCKNETWORK_NULL_API_0100
     * @tc.desc   test blockNetwork set null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebBlockNetworkSetNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitWebBlockNetworkSetNull', 152);
      Utils.registerBaseEvent('testWebBlockNetworkSetNull', true, 25112609, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebBlockNetworkSpecialButton', 10, '');
    })
    /**
     * @tc.name   testWebBlockNetworkSetUndefined
     * @tc.number SUB_ACE_WEB_BLOCKNETWORK_UNDEFINED_API_0100
     * @tc.desc   test blockNetwork set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebBlockNetworkSetUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitWebBlockNetworkSetUndefined', 152);
      Utils.registerBaseEvent('testWebBlockNetworkSetUndefined', true, 25112610, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebBlockNetworkSpecialButton', 10, '');
    })

  })
}
