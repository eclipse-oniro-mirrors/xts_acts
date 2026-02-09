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
import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { Driver, ON } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

const driver = Driver.create();
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebSafeBrowsing() {
  describe('ActsAceWebSafeBrowsing', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/webSafeBrowsing',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webSafeBrowsing state success " + JSON.stringify(pages));
        if (!("webSafeBrowsing" == pages.name)) {
          console.info("get webSafeBrowsing state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webSafeBrowsing state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webSafeBrowsing page error:" + err);
      }
      await driver.waitForComponent(ON.id("webSafeBrowsing"), 10000);
      console.log("waitForComponent webSafeBrowsing");
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
      done();
    })



    /**
     * @tc.name   testEnableSafeBrowsingTrue
     * @tc.number SUB_ACE_WEB_SAFEBROWSING_API_0001
     * @tc.desc   test EnableSafeBrowsingTrue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableSafeBrowsingTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitEnableSafeBrowsingTrue"
      Utils.emitEvent(emitKey, 160740);
      Utils.registerEvent("testEnableSafeBrowsingTrue", true, 160750, done);
      await Utils.waitAndClickComponent(driver, 'webSafeBrowsing');
    })

    /**
     * @tc.name   testEnableSafeBrowsingFalse
     * @tc.number SUB_ACE_WEB_SAFEBROWSING_API_0002
     * @tc.desc   test EnableSafeBrowsingFalse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableSafeBrowsingFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitEnableSafeBrowsingFalse"
      Utils.emitEvent(emitKey, 160740);
      Utils.registerEvent("testEnableSafeBrowsingFalse", true, 160760, done);
      await Utils.waitAndClickComponent(driver, 'webSafeBrowsing');
    })

    /**
     * @tc.name   testIsSafeBrowsingEnabledTrue
     * @tc.number SUB_ACE_WEB_SAFEBROWSING_API_0003
     * @tc.desc   test IsSafeBrowsingEnabledTrue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSafeBrowsingEnabledTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitIsSafeBrowsingEnabledTrue"
      Utils.emitEvent(emitKey, 160740);
      Utils.registerEvent("testIsSafeBrowsingEnabledTrue", true, 160770, done);
      await Utils.waitAndClickComponent(driver, 'webSafeBrowsing');
    })

    /**
     * @tc.name   testIsSafeBrowsingEnabledFalse
     * @tc.number SUB_ACE_WEB_SAFEBROWSING_API_0004
     * @tc.desc   test IsSafeBrowsingEnabledFalse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSafeBrowsingEnabledFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitIsSafeBrowsingEnabledFalse"
      Utils.emitEvent(emitKey, 160740);
      Utils.registerEvent("testIsSafeBrowsingEnabledFalse", true, 160780, done);
      await Utils.waitAndClickComponent(driver, 'webSafeBrowsing');
    })

  })
}
