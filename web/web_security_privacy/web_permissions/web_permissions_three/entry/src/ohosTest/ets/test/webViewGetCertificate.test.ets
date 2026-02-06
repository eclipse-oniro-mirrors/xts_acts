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
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewGetCertificate beforeEach start");
      done();
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWCERTIFICATE_API_0100
     *tc.name testGetCertificateCallback
     *tc.desc test interface of getCertificate with callback
     */
    it('testGetCertificateCallback',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done:Function) =>{
      Utils.emitEvent("emitGetCertificateCallback", 161010)
      Utils.registerEvent("testGetCertificateCallback",true,161020,done);
      await Utils.waitAndClickComponent(driver, "webViewGetCertificate");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWCERTIFICATE_API_0200
     *tc.name testGetCertificatePromise
     *tc.desc test interface of getCertificate with promise
     */
    it('testGetCertificatePromise',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done:Function) =>{
      Utils.emitEvent("emitGetCertificatePromise", 161010)
      Utils.registerEvent("testGetCertificatePromise",true,161030,done);
      await Utils.waitAndClickComponent(driver, "webViewGetCertificate");
    })
  })
}