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
import { describe, beforeEach, afterEach, it, expect, beforeAll , TestType, Size, Level } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
// import router from '@system.router';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from "@kit.TestKit";

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = ""
let tcName = ""
const EVENT_ID_SET_SUITE_KEY = 184701;
let driver = Driver.create();

export default function webViewSrollToJsunit() {
  describe('ActsAceWebViewScrollToTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "testability/pages/webViewSrollToJsunit"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewScroll state success " + JSON.stringify(pages));
        if (!("webViewScrollTo" == pages.name)) {
          console.info("get webViewScrollTo state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await driver.waitForComponent(ON.id("webcomponentScrolTo"),10000);
          console.info("push webViewScrollTo page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewScrollTo page error: " + err);
      }
      done()
    });
    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewScrollTo beforeEach start");
      done();
    })

    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLTO_0100
     * tc.name testScrollToOne
     * tc.desc When calling the scrollTo interface, the x,y input parameters are negative
   */
    it('testScrollToOne',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollToOne';
      tcName = 'testScrollToOne'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, "[0,0]", 184710, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrolTo", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLTO_0200
     * tc.name testScrollToTwo
     * tc.desc When calling the scrollTo interface, the x input parameter is negative and the y input parameter is
     * positive, which is greater than the page height
    */
    it('testScrollToTwo',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollToTwo';
      tcName = 'testScrollToTwo'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184720, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrolTo", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLTO_0300
     * tc.name testScrollToThree
     * tc.desc When calling the scrollTo interface, the x input parameter is negative and the y input parameter is
     * positive, which is less than the page height
    */
    it('testScrollToThree',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollToThree';
      tcName = 'testScrollToThree'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, "[0,200]", 184730, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrolTo", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLTO_0400
     * tc.name testScrollToFour
     * tc.desc When calling the scrollTo interface, the y input parameter is negative and the x input parameter is
     * positive, which is less than the page length
    */
    it('testScrollToFour',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollToFour';
      tcName = 'testScrollToFour'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, "[200,0]", 184740, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrolTo", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLTO_0500
      * tc.name testScrollToFive
      * tc.desc When calling the scrollTo interface, the y input parameter is negative and the x input parameter is
      * positive, which is greater than the page length
   */
    it('testScrollToFive',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollToFive';
      tcName = 'testScrollToFive'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184750, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrolTo", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLTO_0600
     * tc.name testScrollToSix
     * tc.desc When calling the scrollTo interface, the y input parameter is a positive number and the x input parameter
     * is a positive number, both of which are less than the page height
   */
    it('testScrollToSix',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollToSix';
      tcName = 'testScrollToSix'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, "[200,200]", 184760, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrolTo", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLTO_0700
      * tc.name testScrollToSeven
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollToSeven',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollToSeven';
      tcName = 'testScrollToSeven'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184770, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrolTo", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
     /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLTO_0800
     * tc.name testScrollToEight
     * tc.desc When calling the scrollTo interface, the x,y input parameters are negative
   */
   it('testScrollToEight',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
     emitKey = 'emitScrollToEight';
     tcName = 'testScrollToEight'
     Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
     let isReturn = false;
     Utils.registerEvent(tcName, true, 184780, () => { isReturn = true });
     Utils.waitAndClickComponent(driver, "webcomponentScrolTo", tcName);
     await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
     done();
   })
   /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLTO_0900
     * tc.name testScrollToNine
     * tc.desc When calling the scrollTo interface, the x,y input parameters are negative
   */
   it('testScrollToNine',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
     emitKey = 'emitScrollToNine';
     tcName = 'testScrollToNine'
     Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
     let isReturn = false;
     Utils.registerEvent(tcName, true, 184790, () => { isReturn = true });
     Utils.waitAndClickComponent(driver, "webcomponentScrolTo", tcName);
     await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
     done();
  })
  /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLTO_1000
     * tc.name testScrollToTen
     * tc.desc When calling the scrollTo interface, the x,y input parameters are negative
   */
  it('testScrollToTen',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
    emitKey = 'emitScrollToTen';
    tcName = 'testScrollToTen'
    Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
    let isReturn = false;
    Utils.registerEvent(tcName, true, 184800, () => { isReturn = true });
    Utils.waitAndClickComponent(driver, "webcomponentScrolTo", tcName);
    await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
    done();
  })
  /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLTO_1100
     * tc.name testScrollToEleven
     * tc.desc When calling the scrollTo interface, the x,y input parameters are negative
   */
  it('testScrollToEleven',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
    emitKey = 'emitScrollToEleven';
    tcName = 'testScrollToEleven'
    Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
    let isReturn = false;
    Utils.registerEvent(tcName, true, 184810, () => { isReturn = true });
    Utils.waitAndClickComponent(driver, "webcomponentScrolTo", tcName);
    await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
    done();
  })

  })
}
