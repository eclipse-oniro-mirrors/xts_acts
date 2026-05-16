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
import { beforeAll, beforeEach, describe, it , TestType, expect, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitAndClickComponent, waitForComponent } from './WaitTest.test';
import wifiMg from '@ohos.wifiManager';
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webOnFirstMeaningfulPaint() {
  describe('WebOnFirstMeaningfulPaint', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebOnFirstMeaningfulPaint',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOnFirstMeaningfulPaint state success " + JSON.stringify(pages));
        if (!("WebOnFirstMeaningfulPaint" == pages.name)) {
          console.info("get WebOnFirstMeaningfulPaint state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebOnFirstMeaningfulPaint page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebOnFirstMeaningfulPaint page error: " + err);
      }
      await waitForComponent("getSurfaceIdButton");
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
      console.info("web beforeEach start");
      done();
    })

    /**
     * @tc.name   OnFirstMeaningfulPaint0100
     * @tc.number SUB_WEB_WEBONFIRSTMEANINGFULPAINT_0100
     * @tc.desc   test WebOnFirstMeaningfulPaint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OnFirstMeaningfulPaint0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("OnFirstMeaningfulPaint0100", 151990)
      Utils.registerEvent("OnFirstMeaningfulPaint0100", true, 152000, done);
      waitAndClickComponent('WebOnFirstMeaningfulPaint',driver);
    })

    /**
     * @tc.name   OnFirstMeaningfulPaint0200
     * @tc.number SUB_WEB_WEBONFIRSTMEANINGFULPAINT_0200
     * @tc.desc   test WebOnFirstMeaningfulPaint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OnFirstMeaningfulPaint0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("OnFirstMeaningfulPaint0200", 151990)
      Utils.registerEvent("OnFirstMeaningfulPaint0200", true, 152010, done);
      waitAndClickComponent('WebOnFirstMeaningfulPaint',driver);
    })
  })
}
