/**
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { beforeAll, describe, beforeEach, afterEach, it, expect , TestType, Size, Level } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import wifiMg from '@ohos.wifiManager';
import router from '@ohos.router';
import { Driver } from '@kit.TestKit';
import { waitAndClickComponent, waitForComponent } from './WaitTest.test';
import { accessibility, config } from '@kit.AccessibilityKit';
const  driver: Driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webPageSnapshotTest() {
  describe('WebPageSnapshotTest',  () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebPageSnapshot',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebPageSnapshot state success " + JSON.stringify(pages));
        if (!("WebPageSnapshot" == pages.name)) {
          console.info("get WebPageSnapshot state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebPageSnapshot page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebPageSnapshot page error: " + err);
      }
      await waitForComponent("webWebPageSnapshot");
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
      console.info("WebPageSnapshot beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebPageSnapshot afterEach start");
      Utils.emitEvent('', 154090)
      console.info("WebPageSnapshot afterEach end");
      done();
    })

    /**
     * @tc.name   testWebPageSnapshot001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_WEBPAGESNAPSHOT_0100
     * @tc.desc   test webPageSnapshot with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebPageSnapshot001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let emitKey = 'testWebPageSnapshot001';
        let tcName = 'testWebPageSnapshot001';
        let isReturn = false;
        Utils.emitEvent(emitKey, 154080);
        Utils.registerEvent(tcName, true, 154210, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "webWebPageSnapshot", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name   testWebPageSnapshot002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_WEBPAGESNAPSHOT_0200
     * @tc.desc   test webPageSnapshot with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebPageSnapshot002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let emitKey = 'testWebPageSnapshot002';
        let tcName = 'testWebPageSnapshot002';
        let isReturn = false;
        Utils.emitEvent(emitKey, 154080);
        Utils.registerEvent(tcName, "null", 154100, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "webWebPageSnapshot", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name   testWebPageSnapshot003
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_WEBPAGESNAPSHOT_0300
     * @tc.desc   test webPageSnapshot with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebPageSnapshot003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let emitKey = 'testWebPageSnapshot003';
        let tcName = 'testWebPageSnapshot003';
        let isReturn = false;
        Utils.emitEvent(emitKey, 154080);
        Utils.registerEvent(tcName, "undefined", 154110, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "webWebPageSnapshot", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });
  })
}
