/**
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
import {describe, beforeEach, afterEach, it, expect, beforeAll, TestType, Size, Level } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import { waitAndClickComponent, waitForComponent } from './WaitTest.test';
import Utils from './Utils';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import wifiMg from '@ohos.wifiManager';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();
export default function WebViewOnFirstScreenPaintCase() {
  describe('WebViewOnFirstScreenPaintTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewOnFirstScreenPaint',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewOnFirstScreenPaint state success " + JSON.stringify(pages));
        if (!("WebViewOnFirstScreenPaint" == pages.name)) {
          console.info("get WebViewOnFirstScreenPaint state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewOnFirstScreenPaint page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewOnFirstScreenPaint page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebViewOnFirstScreenPaintButton"), 10000);
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
        if (data.chload >= 800 || data.rssi <= -80) {
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
     * @tc.name   testOnFirstScreenPaint001
     * @tc.number SUB_WEB_SCREENSHOTTING_0100
     * @tc.desc   onFirstScreenPaint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL1
     */
    it('testOnFirstScreenPaint001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnFirstScreenPaint001", 152069)
      Utils.registerEvent("testOnFirstScreenPaint001", "resource://rawfile/4stiaozhuangbaidu.html", 20260131, done);
      waitAndClickComponent('WebViewOnFirstScreenPaintButton',driver);
    })


    /**
     * @tc.name   testOnFirstScreenPaint002
     * @tc.number SUB_WEB_SCREENSHOTTING_0200
     * @tc.desc   onFirstScreenPaint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL1
     */
    it('testOnFirstScreenPaint002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnFirstScreenPaint002", 152069)
      Utils.registerEvent("testOnFirstScreenPaint002", true, 20260132, done);
      waitAndClickComponent('WebViewOnFirstScreenPaintButton',driver);
    })

    /**
     * @tc.name   testOnFirstScreenPaint003
     * @tc.number SUB_WEB_SCREENSHOTTING_0300
     * @tc.desc   onFirstScreenPaint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL1
     */
    it('testOnFirstScreenPaint003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnFirstScreenPaint003", 152069)
      Utils.registerEvent("testOnFirstScreenPaint003", true, 20260133, done);
      waitAndClickComponent('WebViewOnFirstScreenPaintButton',driver);
    })
  })
}