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

import { beforeAll, beforeEach, expect, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();

export default function httpAuthHandlerThree() {

  describe('HttpAuthHandlerThreeTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/httpAuthHandlerThree',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get httpAuthHandlerThree state success " + JSON.stringify(pages));
        if (!("httpAuthHandlerThree" == pages.name)) {
          console.info("get httpAuthHandlerThree state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push httpAuthHandlerThree page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push httpAuthHandlerThree page error: " + err);
      }
      await driver.waitForComponent(ON.id("HttpAuthHandlerThreeButton"), 10000);
      console.log('HttpAuthHandlerThreeButton===>')
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
      console.info("httpAuthHandlerThree beforeEach start");
      done();
    })

    /**
     * @tc.name   testHttpAuthHandlerConfirmUserNameNull
     * @tc.number SUB_WEB_HTTPAUTHHANDLER_CONFIRM_USERNAME_SPECIAL_0100
     * @tc.desc   test HttpAuthHandler confirm userName null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpAuthHandlerConfirmUserNameNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitHttpAuthHandlerConfirmUserNameNull', 125);
      Utils.registerBaseEvent('testHttpAuthHandlerConfirmUserNameNull', false, 26031201,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('HttpAuthHandlerThreeButton', 10, '');
    })
    /**
     * @tc.name   testHttpAuthHandlerConfirmUserNameUndefined
     * @tc.number SUB_WEB_HTTPAUTHHANDLER_CONFIRM_USERNAME_SPECIAL_0200
     * @tc.desc   test HttpAuthHandler confirm userName undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpAuthHandlerConfirmUserNameUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitHttpAuthHandlerConfirmUserNameUndefined', 125);
      Utils.registerBaseEvent('testHttpAuthHandlerConfirmUserNameUndefined', false, 26031202,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('HttpAuthHandlerThreeButton', 10, '');
    })
    /**
     * @tc.name   testHttpAuthHandlerConfirmUserNameEmpty
     * @tc.number SUB_WEB_HTTPAUTHHANDLER_CONFIRM_USERNAME_SPECIAL_0300
     * @tc.desc   test HttpAuthHandler confirm userName empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpAuthHandlerConfirmUserNameEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitHttpAuthHandlerConfirmUserNameEmpty', 125);
      Utils.registerBaseEvent('testHttpAuthHandlerConfirmUserNameEmpty', true, 26031203,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('HttpAuthHandlerThreeButton', 10, '');
    })
    /**
     * @tc.name   testHttpAuthHandlerConfirmPasswordNull
     * @tc.number SUB_WEB_HTTPAUTHHANDLER_CONFIRM_PASSWORD_SPECIAL_0100
     * @tc.desc   test HttpAuthHandler confirm password null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpAuthHandlerConfirmPasswordNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitHttpAuthHandlerConfirmPasswordNull', 125);
      Utils.registerBaseEvent('testHttpAuthHandlerConfirmPasswordNull', false, 26031204,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('HttpAuthHandlerThreeButton', 10, '');
    })
    /**
     * @tc.name   testHttpAuthHandlerConfirmPasswordUndefined
     * @tc.number SUB_WEB_HTTPAUTHHANDLER_CONFIRM_PASSWORD_SPECIAL_0200
     * @tc.desc   test HttpAuthHandler confirm password undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpAuthHandlerConfirmPasswordUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitHttpAuthHandlerConfirmPasswordUndefined', 125);
      Utils.registerBaseEvent('testHttpAuthHandlerConfirmPasswordUndefined', false, 26031205,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('HttpAuthHandlerThreeButton', 10, '');
    })
    /**
     * @tc.name   testHttpAuthHandlerConfirmPasswordEmpty
     * @tc.number SUB_WEB_HTTPAUTHHANDLER_CONFIRM_PASSWORD_SPECIAL_0300
     * @tc.desc   test HttpAuthHandler confirm password empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpAuthHandlerConfirmPasswordEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitHttpAuthHandlerConfirmPasswordEmpty', 125);
      Utils.registerBaseEvent('testHttpAuthHandlerConfirmPasswordEmpty', true, 26031206,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('HttpAuthHandlerThreeButton', 10, '');
    })

  })
}
