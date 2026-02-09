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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const EVENT_ID_SET_EIMIT_KEY = 142018;
const  driver = Driver.create();

export default function webOnLoadIntercept() {
  describe('WebOnLoadInterceptTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebOnLoadIntercept',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOnLoadIntercept state success " + JSON.stringify(pages));
        if (!("WebOnLoadIntercept" == pages.name)) {
          console.info("get WebOnLoadIntercept state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebOnLoadIntercept page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebOnLoadIntercept page error: " + err);
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
      console.info("web beforeEach start");
      done();
    })

    /**
     * @tc.name   testOnLoadIntercept001
     * @tc.number SUB_WEB_ONLOADINTERCEPT_0100
     * @tc.desc   test onLoadIntercept when return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnLoadIntercept001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnLoadIntercept001", EVENT_ID_SET_EIMIT_KEY)
      let isReturn1 = 0;
      let isReturn2 = 0;
      Utils.registerEvent("testOnLoadIntercept001", 'https://www.openharmony.cn/', 142028, () => {isReturn1 = 1});
      Utils.registerEvent("testOnLoadIntercept001", 'OpenAtom OpenHarmony', 142038, () => {isReturn2 = 1});
      await Utils.waitAndClickComponent(driver, "WebOnLoadInterceptTestButton");
      await Utils.waitForExist(() => isReturn1, 'emitOnLoadIntercept001_checkReturn1', 1);
      await Utils.waitForExist(() => isReturn2, 'emitOnLoadIntercept001_checkReturn2', 1);
      done();
    })

    /**
     * @tc.name   testOnLoadIntercept002
     * @tc.number SUB_WEB_ONLOADINTERCEPT_0200
     * @tc.desc   test onLoadIntercept when return true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnLoadIntercept002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnLoadIntercept002", EVENT_ID_SET_EIMIT_KEY)
      let isReturn1 = 0;
      let isReturn2 = 0;
      Utils.registerEvent("testOnLoadIntercept002", 'https://www.openharmony.cn/', 142048, () => {isReturn1 = 1})
      Utils.registerEvent("testOnLoadIntercept002", 'index', 142058, () => {isReturn2 = 1});
      await Utils.waitAndClickComponent(driver, "WebOnLoadInterceptTestButton");
      await Utils.waitForExist(() => isReturn1, 'emitOnLoadIntercept002_checkReturn1', 1);
      await Utils.waitForExist(() => isReturn2, 'emitOnLoadIntercept002_checkReturn2', 1);
      done();
    })
  })
}