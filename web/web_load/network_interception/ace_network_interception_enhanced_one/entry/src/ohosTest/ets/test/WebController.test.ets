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
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const EVENT_ID_SET_EIMIT_KEY = 142016;
const driver = Driver.create();

export default function webController() {

  describe('WebControllerTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webController',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webController state success " + JSON.stringify(pages));
        if (!("webController" == pages.name)) {
          console.info("get webController state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webController page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webController page error: " + err);
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
      console.info("webController beforeEach start");
      done();
    })


    /**
     * @tc.name   testStop001
     * @tc.number SUB_WEB_STOP_0100
     * @tc.desc   test stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStop001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testStop001", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("testStop001", true, 142026, done);
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
    })
    /**
     * @tc.name   testLoadUrlWithHeaderErrorCode01
     * @tc.number SUB_WEB_LOADURL_HEADER_ERROR_API_0100
     * @tc.desc   test loadUrl with header null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoadUrlWithHeaderErrorCode01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitLoadUrlWithHeaderErrorCode01", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerBaseEvent("testLoadUrlWithHeaderErrorCode01", 401, 2025110602,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
    })
    /**
     * @tc.name   testLoadUrlWithHeaderErrorCode02
     * @tc.number SUB_WEB_LOADURL_HEADER_ERROR_API_0200
     * @tc.desc   test loadUrl with header undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoadUrlWithHeaderErrorCode02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitLoadUrlWithHeaderErrorCode02", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerBaseEvent("testLoadUrlWithHeaderErrorCode02", 401, 2025110603,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
    })

  })
}
