/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import {describe, beforeEach, it, beforeAll, TestType, Size, Level, expect } from "@ohos/hypium";
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

const EVENT_ID_SET_EMIT_KEY = 202070;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewONHttpErrorReceive() {
  describe('ActsAceWebDevWebViewONHttpErrorReceiveTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewONHttpErrorReceive',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewONHttpErrorReceive state success " + JSON.stringify(pages));
        if (!("webViewONHttpErrorReceive" == pages.name)) {
          console.info("get webViewONHttpErrorReceive state success " + JSON.stringify(pages.name));
          await router.push(options);
          console.info("push webViewONHttpErrorReceive page success");
        }
      } catch (err) {
        console.error("push webViewONHttpErrorReceive page error: " + err);
      }
      await driver.waitForComponent(ON.id("onErrorReceive03"), 10000);
      console.log("waitForComponent onErrorReceive03");
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
      console.info("webViewONHttpErrorReceive beforeEach start");
      done();
    })

    /**
     * @tc.name   testOnHttpErrorReceiveFixedUserAgent
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORRECV_API_0100
     * @tc.desc   test interface of onHttpErrorReceive with parameter fixed userAgent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnHttpErrorReceiveFixedUserAgent',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("emitOnHttpErrorReceiveFixedUserAgent", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent","http://1.1.1.123/index.html",202080,null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent",true,202090,null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent",false,202100,null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent",false,202110,null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent","GET",202120,null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent",'""',202130,null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent","utf-8",202140,null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent","text/html",202150,null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent",403,202160,null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent","Forbidden",202170,null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent","User-Agent",202180,null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent","Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88 Mobile Safari/537.36",202190,null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent","X-Frame-Options",202200,null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent","SAMEORIGIN",202210,null);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent","Direct IP access not allowed | Cloudflare",202220,done);
      await Utils.waitAndClickComponent(driver, "webViewONHttpErrorReceive");
    })
  })
}