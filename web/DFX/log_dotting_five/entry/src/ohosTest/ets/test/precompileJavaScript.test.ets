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
import wifiMg from '@ohos.wifiManager';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function precompileJavaScriptTest() {

  describe('precompileJavaScriptTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/precompileJavaScriptTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get precompileJavaScriptTest state success " + JSON.stringify(pages));
        if (!("precompileJavaScriptTest" == pages.name)) {
          console.info("get precompileJavaScriptTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push precompileJavaScriptTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push precompileJavaScriptTest page error: " + err);
      }
      await waitForComponent("WebAttributeTestButton");
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
      console.info("precompileJavaScriptTest beforeEach start");
      done();
    })

    /**
     * @tc.name   testPrecompileJavaScript002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_0200
     * @tc.desc   test precompileJavaScript
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrecompileJavaScript002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript002", 120060)
      Utils.registerEvent("testPrecompileJavaScript002", -1, 120070, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /**
     * @tc.name   testPrecompileJavaScript003
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_0300
     * @tc.desc   test precompileJavaScript
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrecompileJavaScript003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript003", 120060)
      Utils.registerEvent("testPrecompileJavaScript003", -1, 120080, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /**
     * @tc.name   testPrecompileJavaScript004
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_0400
     * @tc.desc   test precompileJavaScript
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrecompileJavaScript004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript004", 120060)
      Utils.registerEvent("testPrecompileJavaScript004", -1, 120090, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /**
     * @tc.name   testPrecompileJavaScript007
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_0700
     * @tc.desc   test precompileJavaScript
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrecompileJavaScript007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript007", 120060)
      Utils.registerEvent("testPrecompileJavaScript007", 0, 120100, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /**
     * @tc.name   testPrecompileJavaScript008
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_0800
     * @tc.desc   test precompileJavaScript
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrecompileJavaScript008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript008", 120060)
      Utils.registerEvent("testPrecompileJavaScript008", 0, 120110, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /**
     * @tc.name   testPrecompileJavaScript009
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_0900
     * @tc.desc   test precompileJavaScript
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrecompileJavaScript009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript009", 120060)
      Utils.registerEvent("testPrecompileJavaScript009", "401", 120120, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /**
     * @tc.name   testPrecompileJavaScript010
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_1000
     * @tc.desc   test precompileJavaScript
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrecompileJavaScript010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript010", 120060)
      Utils.registerEvent("testPrecompileJavaScript010", "401", 120130, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /**
     * @tc.name   testPrecompileJavaScript012
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_1200
     * @tc.desc   test precompileJavaScript
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrecompileJavaScript012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript012", 120060)
      Utils.registerEvent("testPrecompileJavaScript012", 0, 120140, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /**
     * @tc.name   testPrecompileJavaScript013
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_1300
     * @tc.desc   test precompileJavaScript
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrecompileJavaScript013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript013", 120060)
      Utils.registerEvent("testPrecompileJavaScript013", 0, 120150, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /**
     * @tc.name   testPrecompileJavaScript014
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_1400
     * @tc.desc   test precompileJavaScript
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrecompileJavaScript014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript014", 120060)
      Utils.registerEvent("testPrecompileJavaScript014", 0, 120160, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /**
     * @tc.name   testPrecompileJavaScript015
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_1500
     * @tc.desc   test precompileJavaScript
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrecompileJavaScript015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript015", 120060)
      Utils.registerEvent("testPrecompileJavaScript015", 0, 120170, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /**
     * @tc.name   testPrecompileJavaScript016
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_1600
     * @tc.desc   test precompileJavaScript
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrecompileJavaScript016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript016", 120060)
      Utils.registerEvent("testPrecompileJavaScript016", 0, 120180, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /**
     * @tc.name   testPrecompileJavaScript017
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_1700
     * @tc.desc   test precompileJavaScript
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrecompileJavaScript017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript017", 120060)
      Utils.registerEvent("testPrecompileJavaScript017", 0, 120190, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /**
     * @tc.name   testPrecompileJavaScript018
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_1800
     * @tc.desc   test precompileJavaScript
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrecompileJavaScript018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript018", 120060)
      Utils.registerEvent("testPrecompileJavaScript018", 0, 120200, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /**
     * @tc.name   testPrecompileJavaScript019
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_1900
     * @tc.desc   test precompileJavaScript
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrecompileJavaScript019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript019", 120060)
      Utils.registerEvent("testPrecompileJavaScript019", -1, 120210, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
  })
}
