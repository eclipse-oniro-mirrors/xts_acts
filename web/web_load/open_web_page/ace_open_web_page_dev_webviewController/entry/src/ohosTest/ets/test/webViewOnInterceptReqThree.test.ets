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

const EVENT_ID_SET_EMIT_KEY = 200480;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewOnInterceptReqThree() {
  describe('ActsAceWebDevWebViewOnInterceptReqThreeTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewOnInterceptReqThree',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewOnInterceptReqThree state success " + JSON.stringify(pages));
        if (!("webViewOnInterceptReqThree" == pages.name)) {
          console.info("get webViewOnInterceptReqThree state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push webViewOnInterceptReqThree page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewOnInterceptReqThree page error: " + err);
      }
      await driver.waitForComponent(ON.id("webViewOnInterceptReqThree"), 10000);
      console.log("waitForComponent webViewOnInterceptReqThree");
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
      console.info("webViewOnInterceptReqThree beforeEach start");
      done();
    })

    /**
     * @tc.name   testOnInterceptRequestThird
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWPATR2_API_0300
     * @tc.desc   onInterceptRequest with setting setresponsecede 404
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnInterceptRequestThird', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const emitKey = "emitOnInterceptRequestThird";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testOnInterceptRequestThird", 404, 200490, done);
      sendEventByKey('webViewOnInterceptReqThree', 10, '');
    })
  })
}