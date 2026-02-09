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
let emitKey = "";
const EVENT_ID_SET_EMIT_KEY = 340000;
export default function webViewSetHttpDns() {
  describe('ActsAceWebDevWebViewSetHttpDnsTest',  () => {
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewSetHttpDns',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webViewSetHttpDns state success ' + JSON.stringify(pages));
        if (!("webViewSetHttpDns" == pages.name)) {
          console.info('get webViewSetHttpDns state success ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info('push webViewSetHttpDns page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webViewSetHttpDns page error: ' + err);
      }
      await driver.waitForComponent(ON.id("webViewSetHttpDns"), 10000);
      console.log('webViewSetHttpDns');
      done()
    })

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
        if (data.chload >= 800 || data.rssi <= -80) {
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
      done();
    })

    /**
     * @tc.name   testSetHttpDnsSecureOnlyExample
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWSETHTTPDNS_API_0100
     * @tc.desc   test interface of sethttpdns with parameter SetHttpDnsSecureOnlyExample
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetHttpDnsSecureOnlyExample',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{

      emitKey="emitSetHttpDnsSecureOnlyExample";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("emitSetHttpDnsSecureOnlyExample", "Example Domain",340010, done);
      let StartModel = await driver.findComponent(ON.id("webViewSetHttpDns"));
      await StartModel.click();
    })
    /**
     * @tc.name   testSetHttpDnsSecureOnlyUserDefine
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWSETHTTPDNS_API_0200
     * @tc.desc   test interface of sethttpdns with parameter SetHttpDnsSecureOnlyExample
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetHttpDnsSecureOnlyUserDefine',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{

      emitKey="emitSetHttpDnsSecureOnlyUserDefine";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("SetHttpDnsSecureOnlyUserDefine", "success",340020, done);
      let StartModel = await driver.findComponent(ON.id("webViewSetHttpDns"));
      await StartModel.click();
    })
    /**
     * @tc.name   testSetHttpDnsAutoExample
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWSETHTTPDNS_API_0300
     * @tc.desc   test interface of sethttpdns with parameter SetHttpDnsSecureOnlyExample
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetHttpDnsAutoExample',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitSetHttpDnsAutoExample";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("SetHttpDnsAutoExample", "Example Domain",340030, done);
      let StartModel = await driver.findComponent(ON.id("webViewSetHttpDns"));
      await StartModel.click();

    })
    /**
     * @tc.name   testSetHttpDnsOffExample
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWSETHTTPDNS_API_0400
     * @tc.desc   test interface of sethttpdns with parameter SetHttpDnsSecureOnlyExample
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetHttpDnsOffExample',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitSetHttpDnsOffExample";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("SetHttpDnsOffExample", "OpenAtom OpenHarmony",340040, done);
      let StartModel = await driver.findComponent(ON.id("webViewSetHttpDns"));
      await StartModel.click();
    })
  })
}