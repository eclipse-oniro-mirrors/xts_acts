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

const EVENT_ID_SET_EMIT_KEY = 202603;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function ClientAuthenticationHandlerConfirmTest() {
  describe('ClientAuthenticationHandlerConfirmTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "testability/pages/clientAuthenticationHandlerConfirm"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get clientAuthenticationHandlerConfirm state success " + JSON.stringify(pages));
        if (!("clientAuthenticationHandlerConfirm" == pages.name)) {
          console.info("get clientAuthenticationHandlerConfirm state success " + JSON.stringify(pages.name));
          await router.push(options);
          console.info("push clientAuthenticationHandlerConfirm page success");
        }
      } catch (err) {
        console.error("push clientAuthenticationHandlerConfirm page error: " + err);
      }
      await driver.waitForComponent(ON.id("clientAuthenticationHandlerConfirmButton"), 10000);
      console.log("waitForComponent clientAuthenticationHandlerConfirmButton");
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
      console.info("clientAuthenticationHandlerConfirm beforeEach start");
      done();
    })


    /**
     * @tc.name   testClientAuthenticationHandlerConfirmParameters01
     * @tc.number SUB_ACE_WEB_CLIENTAUTHTICATIONHANDLERCONFIRM_PARAMETERS_API_001
     * @tc.desc   test clientAuthenticationHandler confirm priKeyFile null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClientAuthenticationHandlerConfirmParameters01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async  (done: Function) =>{
      Utils.emitEvent('emitClientAuthenticationHandlerConfirmParameters01', EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent('testClientAuthenticationHandlerConfirmParameters01', 'no_error', 26031301, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('clientAuthenticationHandlerConfirmButton', 10, '');
    })
    /**
     * @tc.name   testClientAuthenticationHandlerConfirmParameters02
     * @tc.number SUB_ACE_WEB_CLIENTAUTHTICATIONHANDLERCONFIRM_PARAMETERS_API_002
     * @tc.desc   test clientAuthenticationHandler confirm priKeyFile undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClientAuthenticationHandlerConfirmParameters02',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async  (done: Function) =>{
      Utils.emitEvent('emitClientAuthenticationHandlerConfirmParameters02', EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent('testClientAuthenticationHandlerConfirmParameters02', 'no_error', 26031302, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('clientAuthenticationHandlerConfirmButton', 10, '');
    })
    /**
     * @tc.name   testClientAuthenticationHandlerConfirmParameters03
     * @tc.number SUB_ACE_WEB_CLIENTAUTHTICATIONHANDLERCONFIRM_PARAMETERS_API_003
     * @tc.desc   test clientAuthenticationHandler confirm priKeyFile empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClientAuthenticationHandlerConfirmParameters03',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async  (done: Function) =>{
      Utils.emitEvent('emitClientAuthenticationHandlerConfirmParameters03', EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent('testClientAuthenticationHandlerConfirmParameters03', -110, 26031303, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('clientAuthenticationHandlerConfirmButton', 10, '');
    })
    /**
     * @tc.name   testClientAuthenticationHandlerConfirmParameters04
     * @tc.number SUB_ACE_WEB_CLIENTAUTHTICATIONHANDLERCONFIRM_PARAMETERS_API_004
     * @tc.desc   test clientAuthenticationHandler confirm certChainFile null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClientAuthenticationHandlerConfirmParameters04',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async  (done: Function) =>{
      Utils.emitEvent('emitClientAuthenticationHandlerConfirmParameters04', EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent('testClientAuthenticationHandlerConfirmParameters04', 'no_error', 26031304, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('clientAuthenticationHandlerConfirmButton', 10, '');
    })
    /**
     * @tc.name   testClientAuthenticationHandlerConfirmParameters05
     * @tc.number SUB_ACE_WEB_CLIENTAUTHTICATIONHANDLERCONFIRM_PARAMETERS_API_005
     * @tc.desc   test clientAuthenticationHandler confirm certChainFile undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClientAuthenticationHandlerConfirmParameters05',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async  (done: Function) =>{
      Utils.emitEvent('emitClientAuthenticationHandlerConfirmParameters05', EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent('testClientAuthenticationHandlerConfirmParameters05', 'no_error', 26031305, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('clientAuthenticationHandlerConfirmButton', 10, '');
    })
    /**
     * @tc.name   testClientAuthenticationHandlerConfirmParameters06
     * @tc.number SUB_ACE_WEB_CLIENTAUTHTICATIONHANDLERCONFIRM_PARAMETERS_API_006
     * @tc.desc   test clientAuthenticationHandler confirm certChainFile empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClientAuthenticationHandlerConfirmParameters06',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async  (done: Function) =>{
      Utils.emitEvent('emitClientAuthenticationHandlerConfirmParameters06', EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent('testClientAuthenticationHandlerConfirmParameters06', -110, 26031306, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('clientAuthenticationHandlerConfirmButton', 10, '');
    })
    /**
     * @tc.name   testClientAuthenticationHandlerConfirmParameters07
     * @tc.number SUB_ACE_WEB_CLIENTAUTHTICATIONHANDLERCONFIRM_PARAMETERS_API_007
     * @tc.desc   test clientAuthenticationHandler confirm authUri null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClientAuthenticationHandlerConfirmParameters07',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async  (done: Function) =>{
      Utils.emitEvent('emitClientAuthenticationHandlerConfirmParameters07', EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent('testClientAuthenticationHandlerConfirmParameters07', 'no_error', 26031307, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('clientAuthenticationHandlerConfirmButton', 10, '');
    })
    /**
     * @tc.name   testClientAuthenticationHandlerConfirmParameters08
     * @tc.number SUB_ACE_WEB_CLIENTAUTHTICATIONHANDLERCONFIRM_PARAMETERS_API_008
     * @tc.desc   test clientAuthenticationHandler confirm authUri undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClientAuthenticationHandlerConfirmParameters08',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async  (done: Function) =>{
      Utils.emitEvent('emitClientAuthenticationHandlerConfirmParameters08', EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent('testClientAuthenticationHandlerConfirmParameters08', 'no_error', 26031308, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('clientAuthenticationHandlerConfirmButton', 10, '');
    })
    /**
     * @tc.name   testClientAuthenticationHandlerConfirmParameters09
     * @tc.number SUB_ACE_WEB_CLIENTAUTHTICATIONHANDLERCONFIRM_PARAMETERS_API_009
     * @tc.desc   test clientAuthenticationHandler confirm authUri empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClientAuthenticationHandlerConfirmParameters09',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async  (done: Function) =>{
      Utils.emitEvent('emitClientAuthenticationHandlerConfirmParameters09', EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent('testClientAuthenticationHandlerConfirmParameters09', -110, 26031309, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('clientAuthenticationHandlerConfirmButton', 10, '');
    })
    /**
     * @tc.name   testClientAuthenticationHandlerConfirmParameters10
     * @tc.number SUB_ACE_WEB_CLIENTAUTHTICATIONHANDLERCONFIRM_PARAMETERS_API_010
     * @tc.desc   test clientAuthenticationHandler confirm identity null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClientAuthenticationHandlerConfirmParameters10',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async  (done: Function) =>{
      Utils.emitEvent('emitClientAuthenticationHandlerConfirmParameters10', EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent('testClientAuthenticationHandlerConfirmParameters10', 'no_error', 26031310, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('clientAuthenticationHandlerConfirmButton', 10, '');
    })
    /**
     * @tc.name   testClientAuthenticationHandlerConfirmParameters11
     * @tc.number SUB_ACE_WEB_CLIENTAUTHTICATIONHANDLERCONFIRM_PARAMETERS_API_011
     * @tc.desc   test clientAuthenticationHandler confirm identity null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClientAuthenticationHandlerConfirmParameters11',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async  (done: Function) =>{
      Utils.emitEvent('emitClientAuthenticationHandlerConfirmParameters11', EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent('testClientAuthenticationHandlerConfirmParameters11', 'no_error', 26031311, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('clientAuthenticationHandlerConfirmButton', 10, '');
    })
    /**
     * @tc.name   testClientAuthenticationHandlerConfirmParameters12
     * @tc.number SUB_ACE_WEB_CLIENTAUTHTICATIONHANDLERCONFIRM_PARAMETERS_API_012
     * @tc.desc   test clientAuthenticationHandler confirm identity null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClientAuthenticationHandlerConfirmParameters12',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async  (done: Function) =>{
      Utils.emitEvent('emitClientAuthenticationHandlerConfirmParameters12', EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent('testClientAuthenticationHandlerConfirmParameters12', -110, 26031312, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('clientAuthenticationHandlerConfirmButton', 10, '');
    })

  })
}