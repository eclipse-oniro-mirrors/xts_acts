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

import { afterEach, beforeAll, beforeEach, expect, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver } from '@kit.TestKit';
import { waitForExist } from './WaitTest.test';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();
export default function webAttributeTest() {

  describe('WebAttributeTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebAttributeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebAttributeTest state success " + JSON.stringify(pages));
        if (!("WebAttributeTest" == pages.name)) {
          console.info("get WebAttributeTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebAttributeTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebAttributeTest page error: " + err);
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
      console.info("web beforeEach start");
      done();
    })


    /**
     * @tc.name   testOnPageEnd001
     * @tc.number SUB_WEB_ONPAGEEND_0100
     * @tc.desc   test onPageEnd normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnPageEnd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnPageEnd001", 141401)
      let isReturn = false;
      Utils.registerEvent("testOnPageEnd001", "resource://rawfile/second.html", 141410, ()=>{isReturn = true});
      Utils.waitAndClickComponent("WebAttributeTestButton",driver)
      await waitForExist(()=>isReturn, "emitOnPageEnd001", true,1000);
      done();
    })

    /**
     * @tc.name   testOnPageEnd002
     * @tc.number SUB_WEB_ONPAGEEND_0200
     * @tc.desc   test onPageEnd with iframe
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnPageEnd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnPageEnd002", 141401)
      let isReturn = false;
      Utils.registerEvent("testOnPageEnd002", "resource://rawfile/iframe.html", 141420, ()=>{isReturn = true});
      Utils.waitAndClickComponent("WebAttributeTestButton",driver)
      await waitForExist(()=>isReturn, "testOnPageEnd002", true,1000);
      done();
    })

    /**
     * @tc.name   testOnPageBegin001
     * @tc.number SUB_WEB_ONPAGEBEGIN_0100
     * @tc.desc   test onPageBegin normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnPageBegin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnPageBegin001", 141401)
      let isReturn = false;
      Utils.registerEvent("testOnPageBegin001", "resource://rawfile/second.html", 141430, ()=>{isReturn = true});
      Utils.waitAndClickComponent("WebAttributeTestButton",driver)
      await waitForExist(()=>isReturn, "testOnPageBegin001", true,1000);
      done();
    })

    /**
     * @tc.name   testOnPageBegin002
     * @tc.number SUB_WEB_ONPAGEBEGIN_0200
     * @tc.desc   test onPageBegin with iframe
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnPageBegin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnPageBegin002", 141401)
      let isReturn = false;
      Utils.registerEvent("testOnPageBegin002", "resource://rawfile/iframe.html", 141440, ()=>{isReturn = true});
      Utils.waitAndClickComponent("WebAttributeTestButton",driver)
      await waitForExist(()=>isReturn, "testOnPageBegin002", true,1000);
      done();
    })

    /**
     * @tc.name   testOnProgressChange001
     * @tc.number SUB_WEB_ONPROGRESSCHANGE_0100
     * @tc.desc   test onProgressChange normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnProgressChange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnProgressChange001", 141401)
      let isReturn = false;
      Utils.registerEvent("testOnProgressChange001", "100", 141450, ()=>{isReturn = true});
      Utils.waitAndClickComponent("WebAttributeTestButton",driver)
      await waitForExist(()=>isReturn, "testOnProgressChange001", true,1000);
      done();
    })
  })
}
