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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const EVENT_ID_SET_EIMIT_KEY = 142015;
const driver = Driver.create();

export default function httpAuthHandler() {

  describe('HttpAuthHandlerTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/httpAuthHandler',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get httpAuthHandler state success " + JSON.stringify(pages));
        if (!("httpAuthHandler" == pages.name)) {
          console.info("get httpAuthHandler state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push httpAuthHandler page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push httpAuthHandler page error: " + err);
      }
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
      console.info("httpAuthHandler beforeEach start");
      done();
    })

    /**
     * @tc.name   testHttpAuthHandlerIsHttpAuthInfoSaved001
     * @tc.number SUB_WEB_HTTPAUTHHANDLER_ISHTTPAUTHINFOSAVED_0100
     * @tc.desc   test HttpAuthHandler isHttpAuthInfoSaved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHttpAuthHandlerIsHttpAuthInfoSaved001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testHttpAuthHandlerIsHttpAuthInfoSaved001", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerEvent("testHttpAuthHandlerIsHttpAuthInfoSaved001", false, 142045, () => {isReturn = 1});
      await Utils.waitAndClickComponent(driver, "HttpAuthHandlerButton");
      await Utils.waitForExist(()=>isReturn, "testHttpAuthHandlerIsHttpAuthInfoSaved001_checkReturn", 1);
      done();
    })


    /**
     * @tc.name   testHttpAuthHandlerCancel001
     * @tc.number SUB_WEB_HTTPAUTHHANDLER_CANCEL_0100
     * @tc.desc   test HttpAuthHandler cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHttpAuthHandlerCancel001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testHttpAuthHandlerCancel001", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerEvent("testHttpAuthHandlerCancel001", 401, 142025, () => {isReturn = 1});
      await Utils.waitAndClickComponent(driver, "HttpAuthHandlerButton");
      await Utils.waitForExist(()=>isReturn, "testHttpAuthHandlerCancel001_checkReturn", 1);
      done();
    })

    /**
     * @tc.name   testHttpAuthHandlerConfirm001
     * @tc.number SUB_WEB_HTTPAUTHHANDLER_CONFIRM_0100
     * @tc.desc   test HttpAuthHandler confirm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHttpAuthHandlerConfirm001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testHttpAuthHandlerConfirm001", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerEvent("testHttpAuthHandlerConfirm001", true, 142035, () => {isReturn = 1});
      await Utils.waitAndClickComponent(driver, "HttpAuthHandlerButton");
      await Utils.waitForExist(()=>isReturn, "testHttpAuthHandlerConfirm001_checkReturn", 1);
      done();
    })

    /**
     * @tc.name   testIsHttpAuthInfoSavedReturnTrue
     * @tc.number SUB_WEB_HTTPAUTHHANDLER_isHttpAuthInfoSaved_ReturnTrue
     * @tc.desc   test HttpAuthHandler isHttpAuthInfoSaved return true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsHttpAuthInfoSavedReturnTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testIsHttpAuthInfoSavedReturnTrue", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerBaseEvent("testIsHttpAuthInfoSavedReturnTrue", true, 142055, done,(backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "HttpAuthHandlerButton");
    })

  })
}
