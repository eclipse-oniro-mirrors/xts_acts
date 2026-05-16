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

import { describe, beforeEach, expect, it, beforeAll , TestType, Size, Level } from "@ohos/hypium";
import Utils from './Utils';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

const EVENT_ID_SET_EMIT_KEY = 20260305;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function ClientAuthenticationHandlerSixTest() {
  describe('ClientAuthenticationHandlerSixTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "testability/pages/clientAuthenticationHandlerSix"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get clientAuthenticationHandlerSix state success " + JSON.stringify(pages));
        if (!("clientAuthenticationHandlerSix" == pages.name)) {
          console.info("get clientAuthenticationHandlerSix state success " + JSON.stringify(pages.name));
          await router.push(options);
          console.info("push clientAuthenticationHandlerSix page success");
        }
      } catch (err) {
        console.error("push clientAuthenticationHandlerSix page error: " + err);
      }
      await driver.waitForComponent(ON.id("clientAuthenticationHandlerSixButton"), 10000);
      console.log("waitForComponent clientAuthenticationHandlerSixButton");
      done()
    });

    beforeEach(async  (done: Function) =>{
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
      console.info("clientAuthenticationHandlerSix beforeEach start");
      done();
    })

    /**
     * @tc.name   testClientAuthenticationHandlerIgnore001
     * @tc.number SUB_ACE_WEB_CLIENTAUTHTICATIONHANDLER_IGNORE_API_001
     * @tc.desc   test clientAuthenticationHandler ignore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClientAuthenticationHandlerIgnore001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async  (done: Function) =>{
      Utils.emitEvent('emitClientAuthenticationHandlerIgnore001', EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent('testClientAuthenticationHandlerIgnore001', 1, 26031046, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('clientAuthenticationHandlerSixButton', 10, '');
    })

  })
}