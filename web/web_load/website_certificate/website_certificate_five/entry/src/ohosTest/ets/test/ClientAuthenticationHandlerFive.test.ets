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

const EVENT_ID_SET_EMIT_KEY = 20260300;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function ClientAuthenticationHandlerFiveTest() {
  describe('ClientAuthenticationHandlerFiveTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "testability/pages/clientAuthenticationHandlerFive"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get clientAuthenticationHandlerFive state success " + JSON.stringify(pages));
        if (!("clientAuthenticationHandlerFive" == pages.name)) {
          console.info("get clientAuthenticationHandlerFive state success " + JSON.stringify(pages.name));
          await router.push(options);
          console.info("push clientAuthenticationHandlerFive page success");
        }
      } catch (err) {
        console.error("push clientAuthenticationHandlerFive page error: " + err);
      }
      await driver.waitForComponent(ON.id("clientAuthenticationHandlerFiveButton"), 10000);
      console.log("waitForComponent clientAuthenticationHandlerFiveButton");
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
      console.info("clientAuthenticationHandlerFive beforeEach start");
      done();
    })

    /**
     * @tc.name   testClientAuthenticationHandlerCancel001
     * @tc.number SUB_ACE_WEB_CLIENTAUTHTICATIONHANDLER_CANCEL_API_001
     * @tc.desc   test clientAuthenticationHandler cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClientAuthenticationHandlerCancel001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async  (done: Function) =>{
      Utils.emitEvent('emitClientAuthenticationHandlerCancel001', EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerBaseEvent('testClientAuthenticationHandlerCancel001', 'client.badssl.com', 26031041, ()=>{isReturn+=1;},
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.registerBaseEvent('testClientAuthenticationHandlerCancel001', 443, 26031042, ()=>{isReturn+= 1},
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.registerBaseEvent('testClientAuthenticationHandlerCancel001', true, 26031043, ()=>{isReturn+= 1},
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.registerBaseEvent('testClientAuthenticationHandlerCancel001', true, 26031044, ()=>{isReturn+= 1},
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.registerBaseEvent('testClientAuthenticationHandlerCancel001', 1, 26031045, ()=>{isReturn+= 1},
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('clientAuthenticationHandlerFiveButton', 10, '');
      if (await Utils.waitForExist(() => isReturn, 'testClientAuthenticationHandlerCancel001' + '_returnCheck', 5, 1000)) {
        done();
      }
    })

  })
}