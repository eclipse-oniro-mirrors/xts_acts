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
import {describe, beforeEach, afterEach, it, expect, beforeAll, TestType, Size, Level } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
// import router from '@system.router';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

let driver = Driver.create();
const EVENT_ID_SET_EIMIT_KEY = 142501;

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = "emitOnsslerroreventreceive";
export default function webViewOnSslError() {
  describe('ActsAceWebDevWebViewOnSslErrorTest',  () => {
    beforeAll(async  (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewOnSslError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewOnSslError state success " + JSON.stringify(pages));
        if (!("webViewOnSslError" == pages.name)) {
          console.info("get webViewOnSslError state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await driver.waitForComponent(ON.id("ActsAceWebDevWebViewOnSslErrorTest"), 10000);
          console.info("push webViewOnSslError page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewOnSslError page error: " + err);
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
      await driver.waitForComponent(ON.id("ActsAceWebDevWebViewOnSslErrorTest"), 10000);
      console.info("webViewOnSslError beforeEach start");
      done();
    })

    /**
     * @tc.name   testOnsslerroreventreceive
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWPATR4_API_0100
     * @tc.desc   onsslerroreventreceive after load http://http.badssl.com/
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnsslerroreventreceive',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
      Utils.emitEvent("testOnsslerroreventreceive", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerEvent("testOnsslerroreventreceive",true,142511,() =>{isReturn = 1});
      await Utils.waitAndClickComponent(driver, "webViewOnSslError");
      await Utils.waitForExist(()=>isReturn, "testOnsslerroreventreceive_checkReturn", 1, 1000);
      done();
    })
  })
}