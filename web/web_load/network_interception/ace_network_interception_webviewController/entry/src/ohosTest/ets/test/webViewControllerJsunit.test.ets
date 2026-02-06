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

import { describe, beforeEach, afterEach, it, expect , TestType, Size, Level } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

let emitKey = "emitpageDown";
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const EVENT_ID_SET_EIMIT_KEY = 142500;
const driver = Driver.create();

export default function webViewControllerJsunit() {
  describe('ActsAceWebDevWebViewControllerTest',  () => {
    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await driver.waitForComponent(ON.id("ActsAceWebDevWebViewControllerTest"),10000)
      console.info("web beforeEach start");
      done();
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_API_0400
     *tc.name testPageDown
     *tc.desc Go pageDown
     */
    it('testPageDown',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("testPageDown", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerEvent("testPageDown",true,142510,() =>{isReturn = 1});
      await Utils.waitAndClickComponent(driver, "webcomponent");
      await Utils.waitForExist(()=>isReturn, "testPageDown_checkReturn", 1, 1000);
      done();
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWCONTROLLERJSUNIT_API_1101
     *tc.name testSetNetworkAvailable
     *tc.desc test for setNetworkAvailable
     */
    it('testSetNetworkAvailable',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("testSetNetworkAvailable", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerEvent("testSetNetworkAvailable",false,142520,() =>{isReturn = 1});
      await Utils.waitAndClickComponent(driver, "webcomponent");
      await Utils.waitForExist(()=>isReturn, "testSetNetworkAvailable_checkReturn", 1, 1000);
      done();
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_1200
     *tc.name testSetNetworkAvailableAgain
     *tc.desc test for setNetworkAvailable again
     */
    it('testSetNetworkAvailableAgain',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("testSetNetworkAvailableAgain", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerEvent("emitSetNetworkAvailableAgain",true,142530,() =>{isReturn = 1});
      await Utils.waitAndClickComponent(driver, "webcomponent");
      await Utils.waitForExist(()=>isReturn, "testSetNetworkAvailableAgain_checkReturn", 1, 1000);
      done();
    })
  })
}
