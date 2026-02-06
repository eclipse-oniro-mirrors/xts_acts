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

    /**
     * @tc.number   SUB_ACE_BASIC_ETS_WEBVIEWSETHTTPDNS_API_0100
     * @tc.name     testSetHttpDnsSecureOnlyExample
     * @tc.desc     test interface of sethttpdns with parameter SetHttpDnsSecureOnlyExample
     */
    it('testSetHttpDnsSecureOnlyExample',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{

      emitKey="emitSetHttpDnsSecureOnlyExample";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("emitSetHttpDnsSecureOnlyExample", "Example Domain",340010, done);
      let StartModel = await driver.findComponent(ON.id("webViewSetHttpDns"));
      await StartModel.click();
    })
    /**
     * @tc.number   SUB_ACE_BASIC_ETS_WEBVIEWSETHTTPDNS_API_0200
     * @tc.name     testSetHttpDnsSecureOnlyUserDefine
     * @tc.desc     test interface of sethttpdns with parameter SetHttpDnsSecureOnlyExample
     */
    it('testSetHttpDnsSecureOnlyUserDefine',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{

      emitKey="emitSetHttpDnsSecureOnlyUserDefine";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("SetHttpDnsSecureOnlyUserDefine", "success",340020, done);
      let StartModel = await driver.findComponent(ON.id("webViewSetHttpDns"));
      await StartModel.click();
    })
    /**
     * @tc.number   SUB_ACE_BASIC_ETS_WEBVIEWSETHTTPDNS_API_0300
     * @tc.name     testSetHttpDnsAutoExample
     * @tc.desc     test interface of sethttpdns with parameter SetHttpDnsSecureOnlyExample
     */
    it('testSetHttpDnsAutoExample',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitSetHttpDnsAutoExample";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("SetHttpDnsAutoExample", "Example Domain",340030, done);
      let StartModel = await driver.findComponent(ON.id("webViewSetHttpDns"));
      await StartModel.click();

    })
    /**
     * @tc.number   SUB_ACE_BASIC_ETS_WEBVIEWSETHTTPDNS_API_0400
     * @tc.name     testSetHttpDnsOffExample
     * @tc.desc     test interface of sethttpdns with parameter SetHttpDnsSecureOnlyExample
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