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
import { beforeAll, beforeEach, describe, it , expect, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import wifiMg from '@ohos.wifiManager';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function setPathAllowingUniversalAccess() {

  describe('setPathAllowingUniversalAccess', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/setPathAllowingUniversalAccess',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get setPathAllowingUniversalAccess state success " + JSON.stringify(pages));
        if (!("webTwo" == pages.name)) {
          console.info("get setPathAllowingUniversalAccess state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          console.info("push setPathAllowingUniversalAccess page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push setPathAllowingUniversalAccess page error: " + err);
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
     * @tc.name   setPathAllowingUniversalAccess0200
     * @tc.number SUB_WEB_SETPATHALLOWINGUNIVERSALACCESS_0200
     * @tc.desc   test setPathAllowingUniversalAccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('setPathAllowingUniversalAccess0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("setPathAllowingUniversalAccess0200", 119030)
      Utils.registerEvent("setPathAllowingUniversalAccess0200", '401', 119040, done);
      sendEventByKey('setPathAllowingUniversalAccessButton', 10, '');
    })

    /**
     * @tc.name   setPathAllowingUniversalAccess0300
     * @tc.number SUB_WEB_SETPATHALLOWINGUNIVERSALACCESS_0300
     * @tc.desc   test setPathAllowingUniversalAccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('setPathAllowingUniversalAccess0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("setPathAllowingUniversalAccess0300", 119030)
      Utils.registerEvent("setPathAllowingUniversalAccess0300", '401', 119050, done);
      sendEventByKey('setPathAllowingUniversalAccessButton', 10, '');
    })

  })
}
