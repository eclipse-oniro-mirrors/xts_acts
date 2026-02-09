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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver } from '@kit.TestKit';
import { waitForExist } from './WaitTest.test';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();
export default function WebViewEnumAndSetWebController() {

  describe('WebViewEnumAndSetWebControllerTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewEnumAndSetWebController',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewEnumAndSetWebController state success " + JSON.stringify(pages));
        if (!("webTwo" == pages.name)) {
          console.info("get WebViewEnumAndSetWebController state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewEnumAndSetWebController page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewEnumAndSetWebController page error: " + err);
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
      console.info("web beforeEach start");
      done();
    })


    /**
     * @tc.name   testCacheMode002
     * @tc.number SUB_WEB_CACHEMODE_0200
     * @tc.desc   test cacheMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCacheMode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCacheModeOnly", 141711)
      let isReturn = false;
      Utils.registerEvent("testCacheMode002", "cacheError", 141740, ()=>{isReturn = true});
      Utils.waitAndClickComponent("buttonEnumAndSetWebController",driver)
      await waitForExist(()=>isReturn, "testCacheMode002", true,1000);
      done();
    })

    /**
     * @tc.name   testCacheMode001
     * @tc.number SUB_WEB_CACHEMODE_0100
     * @tc.desc   test CacheMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheMode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitCacheModeDefault", 141711)
      let isReturn = false;
      Utils.registerEvent("testCacheMode001", '"index"', 141750, ()=>{isReturn = true});
      Utils.waitAndClickComponent("buttonEnumAndSetWebController",driver)
      await waitForExist(()=>isReturn, "testCacheMode001", true,1000);
      done();
    })

    /**
     * @tc.name   testCacheMode003
     * @tc.number SUB_WEB_CACHEMODE_0300
     * @tc.desc   test CacheMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheMode003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitCacheModeOnline", 141711)
      let isReturn = false;
      Utils.registerEvent("testCacheMode003", true, 141760, ()=>{isReturn = true});
      Utils.waitAndClickComponent("buttonEnumAndSetWebController",driver)
      await waitForExist(()=>isReturn, "testCacheMode003", true,1000);
      done();
    })

    /**
     * @tc.name   testCacheMode004
     * @tc.number SUB_WEB_CACHEMODE_0400
     * @tc.desc   test CacheMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheMode004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitCacheModeNone", 141711)
      let isReturn = false;
      Utils.registerEvent("testCacheMode004", "Example Domain", 141770, ()=>{isReturn = true});
      Utils.waitAndClickComponent("buttonEnumAndSetWebController",driver)
      await waitForExist(()=>isReturn, "testCacheMode004", true,1000);
      done();
    })

  })
}
