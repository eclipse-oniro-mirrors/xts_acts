/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { beforeAll, beforeEach, describe, it , expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import webView from '@ohos.web.webview';
import wifiMg from '@ohos.wifiManager';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function rectEvent() {

  describe('rectEventTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/rectEvent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get rectEvent state success " + JSON.stringify(pages));
        if (!("rectEvent" == pages.name)) {
          console.info("get rectEvent state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push rectEvent page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push rectEvent page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      if(!wifiMg.isWifiActive()){
        console.info("======> wifi_test/enable wifi:" + wifiMg.enableWifi());
        await Utils.sleep(5000);
      }

      try {
        let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
        console.info("======> Internet WifiLinkedInfo : " + JSON.stringify(data));
        console.info("======> Internet speed : " + JSON.stringify(data.linkSpeed));
        console.info("======> Internet chload : " + JSON.stringify(data.chload));
        console.info("======> Internet rssi : " + JSON.stringify(data.rssi));

        if (data.connState == wifiMg.ConnState.CONNECTED) {
          console.info("======> WLAN connection established ");
        } else {
          expect().message("======> WLAN Network error").assertFail(); //方式一
          //throw new Error("======> WLAN Network error");//方式二
          done();
        }
        if (data.chload >= 900 || data.rssi <= -80) {
          expect().message("======> WLAN Network error").assertFail();//方式一
          //throw new Error("======> WLAN Network error");//方式二
          done();
        } else if (data.chload >= 500) {
          console.info("======> The internet connection is poor. ");
        }

      } catch (err) {
        console.info("======> getLinkedInfo promise failed, err :" + JSON.stringify(err));
        throw (err as Error);
        done();
      }
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    /**
     * @tc.name   rectEvent0100
     * @tc.number rectEvent0100
     * @tc.desc   test rectEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('rectEvent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("rectEvent0100", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("rectEvent0100", true, 202503222, done);
      sendEventByKey('surfaceInfoButton', 10, '');
    })


  })
}
