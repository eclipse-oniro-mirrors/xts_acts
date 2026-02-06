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
export default function webMessageExt() {

  describe('webMessageExtTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webMessageExt',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webMessageExt state success " + JSON.stringify(pages));
        if (!("webMessageExt" == pages.name)) {
          console.info("get webMessageExt state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          console.info("push webMessageExt page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webMessageExt page error: " + err);
      }
      await waitForComponent("WebMessageExtButton");
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
      console.info("webMessageExt beforeEach start");
      done();
    })

    /**
     * @tc.name   testWebMessageExtSetType001
     * @tc.number SUB_WEB_WEBMESSAGEEXT_SETTYPE_0100
     * @tc.desc   test WebMessageExtSetType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebMessageExtSetType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType001", 119930)
      Utils.registerEvent("testWebMessageExtSetType001", '17100014', 119940, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /**
     * @tc.name   testWebMessageExtSetType002
     * @tc.number SUB_WEB_WEBMESSAGEEXT_SETTYPE_0200
     * @tc.desc   test WebMessageExtSetType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebMessageExtSetType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType002", 119930)
      Utils.registerEvent("testWebMessageExtSetType002", 1, 119950, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /**
     * @tc.name   testWebMessageExtSetType003
     * @tc.number SUB_WEB_WEBMESSAGEEXT_SETTYPE_0300
     * @tc.desc   test WebMessageExtSetType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebMessageExtSetType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType003", 119930)
      Utils.registerEvent("testWebMessageExtSetType003", 2, 119960, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /**
     * @tc.name   testWebMessageExtSetType004
     * @tc.number SUB_WEB_WEBMESSAGEEXT_SETTYPE_0400
     * @tc.desc   test WebMessageExtSetType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebMessageExtSetType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType004", 119930)
      Utils.registerEvent("testWebMessageExtSetType004", 3, 119970, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /**
     * @tc.name   testWebMessageExtSetType005
     * @tc.number SUB_WEB_WEBMESSAGEEXT_SETTYPE_0500
     * @tc.desc   test WebMessageExtSetType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebMessageExtSetType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType005", 119930)
      Utils.registerEvent("testWebMessageExtSetType005", 4, 119980, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /**
     * @tc.name   testWebMessageExtSetType006
     * @tc.number SUB_WEB_WEBMESSAGEEXT_SETTYPE_0600
     * @tc.desc   test WebMessageExtSetType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebMessageExtSetType006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType006", 119930)
      Utils.registerEvent("`testWebMessageExtSetType006`", 5, 119990, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /**
     * @tc.name   testWebMessageExtSetType007
     * @tc.number SUB_WEB_WEBMESSAGEEXT_SETTYPE_0700
     * @tc.desc   test WebMessageExtSetType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebMessageExtSetType007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType007", 119930)
      Utils.registerEvent("testWebMessageExtSetType007", 6, 120000, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })
  })
}
