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
import {describe, beforeEach, afterEach, it, expect, beforeAll, TestType, Size, Level } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
// import router from '@system.router';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck

export default function webViewGetCertificate() {
  describe('ActsAceWebDevWebViewGetCertificateTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewGetCertificate',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewGetCertificate state success " + JSON.stringify(pages));
        if (!("webViewGetCertificate" == pages.name)) {
          console.info("get webViewGetCertificate state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push webViewGetCertificate page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewGetCertificate page error: " + err);
      }
      await driver.waitForComponent(ON.id("webViewGetCertificate"), 10000);
      console.log("waitForComponent webViewGetCertificate");
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
      console.info("webViewGetCertificate beforeEach start");
      done();
    })

    /**
     * @tc.name   testGetCertificateCallback
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWCERTIFICATE_API_0100
     * @tc.desc   test interface of getCertificate with callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCertificateCallback',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done:Function) =>{
      Utils.emitEvent("emitGetCertificateCallback", 161010)
      Utils.registerEvent("testGetCertificateCallback",true,161020,done);
      await Utils.waitAndClickComponent(driver, "webViewGetCertificate");
    })

    /**
     * @tc.name   testGetCertificateCallback01
     * @tc.number SUB_ACE_BASIC_ETS_TESTGETCERTIFICATECALLBACK_API_0100
     * @tc.desc   test interface of getCertificate with callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCertificateCallback01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done:Function) =>{
      Utils.emitEvent("emitGetCertificateCallback01", 161010)
      Utils.registerEvent("testGetCertificateCallback01",true,20251028,done);
      await Utils.waitAndClickComponent(driver, "webViewGetCertificate");
    })

    /**
     * @tc.name   testGetCertificatePromise
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWCERTIFICATE_API_0200
     * @tc.desc   test interface of getCertificate with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCertificatePromise',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done:Function) =>{
      Utils.emitEvent("emitGetCertificatePromise", 161010)
      Utils.registerEvent("testGetCertificatePromise",true,161030,done);
      await Utils.waitAndClickComponent(driver, "webViewGetCertificate");
    })

    /**
     * @tc.name   testGetCertificatePromise01
     * @tc.number SUB_ACE_BASIC_ETS_TESTGETCERTIFICATEPROMISE_API_0100
     * @tc.desc   test interface of getCertificate with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCertificatePromise01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done:Function) =>{
      Utils.emitEvent("emitGetCertificatePromise01", 161010)
      Utils.registerEvent("testGetCertificatePromise01",true,20251029,done);
      await Utils.waitAndClickComponent(driver, "webViewGetCertificate");
    })

    /**
     * @tc.name   testGetCertificateCallbackReturnArrayEqual0
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWCERTIFICATE_API_0300
     * @tc.desc   test interface of getCertificate with callback return array length equal 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetCertificateCallbackReturnArrayEqual0',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done:Function) =>{
      Utils.emitEvent("testGetCertificateCallbackReturnArrayEqual0", 161010)
      Utils.registerBaseEvent('testGetCertificateCallbackReturnArrayEqual0', 0, 25102122, done, (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(0)
        })
      await Utils.waitAndClickComponent(driver, "webViewGetCertificate");
    })

    /**
     * @tc.name   testGetCertificateCallbackReturnArrayLarger0
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWCERTIFICATE_API_0400
     * @tc.desc   test interface of getCertificate with callback return array length larger 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetCertificateCallbackReturnArrayLarger0',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done:Function) =>{
      Utils.emitEvent("testGetCertificateCallbackReturnArrayLarger0", 161010)
      Utils.registerBaseEvent('testGetCertificateCallbackReturnArrayLarger0', 0, 25102121, done, (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertLarger(0)
        })
      await Utils.waitAndClickComponent(driver, "webViewGetCertificate");
    })

    /**
     * @tc.name   testGetCertificatePromiseReturnArrayEqual0
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWCERTIFICATE_API_0500
     * @tc.desc   test interface of getCertificate with promise return array length equal 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetCertificatePromiseReturnArrayEqual0',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done:Function) =>{
      Utils.emitEvent("testGetCertificatePromiseReturnArrayEqual0", 161010)
      Utils.registerBaseEvent('testGetCertificatePromiseReturnArrayEqual0', 0, 2510219, done, (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(0)
        })
      await Utils.waitAndClickComponent(driver, "webViewGetCertificate");
    })

    /**
     * @tc.name   testGetCertificatePromiseReturnArrayLarger0
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWCERTIFICATE_API_0600
     * @tc.desc   test interface of getCertificate with promise return array length larger 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetCertificatePromiseReturnArrayLarger0',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done:Function) =>{
      Utils.emitEvent("testGetCertificatePromiseReturnArrayLarger0", 161010)
      Utils.registerBaseEvent('testGetCertificatePromiseReturnArrayLarger0', 0, 25102118, done, (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertLarger(0)
        })
      await Utils.waitAndClickComponent(driver, "webViewGetCertificate");
    })



  })
}