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
import { describe, beforeEach, it, beforeAll, TestType, Size, Level, expect } from "@ohos/hypium";
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

const EVENT_ID_SET_EMIT_KEY = 200440;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewOnFirstContTwo() {
  describe('ActsAceWebDevWebViewOnFirstContTwoTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewOnFirstContTwo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewOnFirstContTwo state success " + JSON.stringify(pages));
        if (!("webViewOnFirstContTwo" == pages.name)) {
          console.info("get webViewOnFirstContTwo state success " + JSON.stringify(pages.name));
          await router.push(options);
          console.info("push webViewOnFirstContTwo page success");
        }
      } catch (err) {
        console.error("push webViewOnFirstContTwo page error: " + err);
      }
      await driver.waitForComponent(ON.id("webViewOnFirstContTwo"), 10000);
      console.log("waitForComponent webViewOnFirstContTwo");
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
      console.info("webViewOnFirstContTwo beforeEach start");
      done();
    })

    /**
     * @tc.name   testOnfirstcontentfulpaintvisibilitynone
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWPATR5_API_0200
     * @tc.desc   onfirstcontentfulpaint with web visibility none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnfirstcontentfulpaintvisibilitynone', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const emitKey = "emitNoneOnfirstcontentfulpaint";
        Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent("testOnfirstcontentfulpaintvisibilitynone", -1, 200450, done);
        await Utils.waitAndClickComponent(driver, "webViewOnFirstContTwo");
      })
  })
}