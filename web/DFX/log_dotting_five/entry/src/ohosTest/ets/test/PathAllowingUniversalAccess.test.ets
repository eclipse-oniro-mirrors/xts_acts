/**
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
 * Licensed under * Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with * License.
 * You may obtain a copy of * License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under * License is is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { beforeAll, beforeEach, describe, it , expect, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import wifiMg from '@ohos.wifiManager';
import { Driver, ON } from '@ohos.UiTest';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();
export default function setPathAllowingUniversalAccessTest() {

  describe('PathAllowingUniversalAccess', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/PathAllowingUniversalAccess',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SetPathAllowingUniversalAccess state success " + JSON.stringify(pages));
        if (!("PathAllowingUniversalAccess" == pages.name)) {
          console.info("get SetPathAllowingUniversalAccess state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push SetPathAllowingUniversalAccess page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SetPathAllowingUniversalAccess page error: " + err);
      }
      await waitForComponent("setPathAllowingUniversalAccessButton");
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
          expect().message("======> WLAN Network error").assertFail();
          done();
        }
        if (data.chload >= 800 || data.rssi <= -80) {
          expect().message("======> WLAN Network error").assertFail();
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
     * @tc.name   testPathAllowingUniversalAccess001
     * @tc.number SUB_WEB_PATHALLOWINGUNIVERSALACCESS_0100
     * @tc.desc   test setPathAllowingUniversalAccess with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathAllowingUniversalAccess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let emitKey = 'testPathAllowingUniversalAccess001';
        let tcName = 'testPathAllowingUniversalAccess001';
        let isReturn = false;
        Utils.emitEvent(emitKey, 119060);
        Utils.registerEvent(tcName, '401', 119070, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "setPathAllowingUniversalAccessButton", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name   testPathAllowingUniversalAccess002
     * @tc.number SUB_WEB_PATHALLOWINGUNIVERSALACCESS_0200
     * @tc.desc   test setPathAllowingUniversalAccess with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathAllowingUniversalAccess002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let emitKey = 'testPathAllowingUniversalAccess002';
        let tcName = 'testPathAllowingUniversalAccess002';
        let isReturn = false;
        Utils.emitEvent(emitKey, 119060);
        Utils.registerEvent(tcName, '401', 119080, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "setPathAllowingUniversalAccessButton", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name   testPathAllowingUniversalAccess003
     * @tc.number SUB_WEB_PATHALLOWINGUNIVERSALACCESS_0300
     * @tc.desc   test setPathAllowingUniversalAccess with empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathAllowingUniversalAccess003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let emitKey = 'testPathAllowingUniversalAccess003';
        let tcName = 'testPathAllowingUniversalAccess003';
        let isReturn = false;
        Utils.emitEvent(emitKey, 119060);
        Utils.registerEvent(tcName, '17100003', 119090, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "setPathAllowingUniversalAccessButton", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

  })
}
