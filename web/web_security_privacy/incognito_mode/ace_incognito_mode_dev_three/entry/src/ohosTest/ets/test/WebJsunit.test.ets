/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { beforeAll,afterEach, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest';
import { Driver, ON } from '@kit.TestKit';

const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "emitGetStoredGeolocation";

export default function webJsunit() {
  describe('ActsAceWebDevTest', () => {
    beforeAll(async  (done: Function) =>{
      await driver.waitForComponent(ON.id("webcomponent"), 10000);
      console.log("waitForComponent webcomponent");
      done();
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_036                                                                                                                                                               
     *tc.name GetStoredGeolocation                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('GetStoredGeolocation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.registerEvent("GetStoredGeolocation", "file:///", 160590, done);
      Utils.emitEvent("emitGetStoredGeolocation", 160580);
      await Utils.waitAndClickComponent(driver, "webcomponent");
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_037                                                                                                                                                           
     *tc.name SetHttpDnsSuccess                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('SetHttpDnsSuccess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.registerEvent("SetHttpDnsSuccess", 1, 160600, done);
      Utils.emitEvent("emitSetHttpDnsSuccess", 160580);
      await Utils.waitAndClickComponent(driver, "webcomponent");
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_038                                                                                                                                                           
     *tc.name GetAccessibleGeolocation                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('GetAccessibleGeolocation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.registerEvent("GetAccessibleGeolocation", true, 160610, done);
      Utils.emitEvent("emitGetAccessibleGeolocation", 160580);
      await Utils.waitAndClickComponent(driver, "webcomponent");
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_056                                                                                                                                                
     *tc.name GetAccessibleGeolocationPromise                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('GetAccessibleGeolocationPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.registerEvent("GetAccessibleGeolocationPromise", true, 160620, done);
      Utils.emitEvent("emitGetAccessibleGeolocationPromise", 160580);
      await Utils.waitAndClickComponent(driver, "webcomponent");
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_060                                                                                                                                                              
     *tc.name GetStoredGeolocationPromise                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('GetStoredGeolocationPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.registerEvent("GetStoredGeolocationPromise", "file:///", 160630, done);
      Utils.emitEvent("emitGetStoredGeolocationPromise", 160580);
      await Utils.waitAndClickComponent(driver, "webcomponent");
    })
  })
}
