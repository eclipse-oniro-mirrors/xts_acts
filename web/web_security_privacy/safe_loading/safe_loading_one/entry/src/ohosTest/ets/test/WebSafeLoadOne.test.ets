/*
 * Copyright (c) 2022~2023 Huawei Device Co., Ltd.
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

import { afterEach, beforeEach,beforeAll, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { Driver, ON } from '@kit.TestKit';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();

let emitKey = "";

export default function WebSafeLoadOneTest() {
  describe('WebSafeLoadOneTest', () => {
      beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
          url: 'testability/pages/webSafeLoadOne',
        }

        try {
          router.clear();
          let pages = router.getState();
          console.info("get webSafeLoadOne state success " + JSON.stringify(pages));
          if (!("webSafeLoadOne" == pages.name)) {
            console.info("get webSafeLoadOne state success " + JSON.stringify(pages.name));
            let result = await router.pushUrl(options);
            console.info("push webSafeLoadOne state success " + JSON.stringify(result));
          }
        } catch (err) {
          console.error("push webSafeLoadOne page error:" + err);
        }
        await driver.waitForComponent(ON.id("webSafeLoadButton"), 10000);
        done()
      });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_057                                                                                                                                                
     *tc.name SetHttpDnsSuccessAuto                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('SetHttpDnsSuccessAuto', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetHttpDnsSuccessAuto", 160790);
      Utils.registerEvent("SetHttpDnsSuccessAuto", "Example Domain", 160800, done);
      await Utils.waitAndClickComponent(driver, 'webSafeLoadButton');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_058                                                                                                                                             
     *tc.name SetHttpDnsSuccessOff                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('SetHttpDnsSuccessOff', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetHttpDnsSuccessOff", 160790);
      Utils.registerEvent("SetHttpDnsSuccessOff", "Example Domain", 160810, done);
      await Utils.waitAndClickComponent(driver, 'webSafeLoadButton');
    })
    /* 
      *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_061                                                                                                                                                              
      *tc.name getCustomUserAgent                                                                                                                                                                                                                
      *tc.desic Save current page
      */
    it('GetCustomUserAgent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitGetCustomUserAgent", 160790);
      Utils.registerEvent("GetCustomUserAgent", "userAgent", 160820, done);
      await Utils.waitAndClickComponent(driver, 'webSafeLoadButton');
    })
  })
}
