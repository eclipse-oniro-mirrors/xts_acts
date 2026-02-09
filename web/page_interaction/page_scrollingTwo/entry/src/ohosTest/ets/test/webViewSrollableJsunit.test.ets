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

import { describe, beforeEach, afterEach, it, expect, beforeAll , TestType, Size, Level } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
// import router from '@system.router';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from "@kit.TestKit";

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 182301;
let driver = Driver.create();
let emitKey = ""
let tcName = ""

export default function webViewSrollableJsunit() {
  describe('ActsAceWebViewScrollableTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "testability/pages/webViewSrollableJsunit"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewScroll state success " + JSON.stringify(pages));
        if (!("webViewScrollable" == pages.name)) {
          console.info("get webViewScrollable state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await driver.waitForComponent(ON.id("webcomponentScrollable"), 10000);
          console.info("push webViewScrollable page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewScrollable page error: " + err);
      }
      done()
    });
    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewScrollable beforeEach start");
      done();
    })

    /**
     * @tc.name   testScrollableOne
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0100
     * @tc.desc   When calling the scrollTo interface, the x,y input parameters are negative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableOne',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableOne';
      tcName = 'testScrollableOne'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, "[0,0]", 182310, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableTwo
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0200
     * @tc.desc   When calling the scrollTo interface, the x input parameter is negative and the y input parameter is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableTwo',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableTwo';
      tcName = 'testScrollableTwo'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, false, 182320, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableThree
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0300
     * @tc.desc   When calling the scrollTo interface, the x input parameter is negative and the y input parameter is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableThree',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableThree';
      tcName = 'testScrollableThree'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, "[0,0]", 182330, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableFour
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0400
     * @tc.desc   When calling the scrollTo interface, the y input parameter is negative and the x input parameter is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableFour',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableFour';
      tcName = 'testScrollableFour'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, "[0,0]", 182340, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableFive
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0500
     * @tc.desc   When calling the scrollTo interface, the y input parameter is negative and the x input parameter is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableFive',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableFive';
      tcName = 'testScrollableFive'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, false, 182350, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableSix
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0600
     * @tc.desc   When calling the scrollTo interface, the y input parameter is a positive number and the x input parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableSix',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableSix';
      tcName = 'testScrollableSix'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, "[0,0]", 182360, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableSeven
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0700
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableSeven',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableSeven';
      tcName = 'testScrollableSeven'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, false, 182370, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableEight
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0800
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableEight',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableEight';
      tcName = 'testScrollableEight'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182380, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableNine
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0900
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableNine',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableNine';
      tcName = 'testScrollableNine'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182390, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableTen
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1000
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableTen',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableTen';
      tcName = 'testScrollableTen'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182400, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableEleven
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1100
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableEleven',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableEleven';
      tcName = 'testScrollableEleven'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, false, 182410, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableTwelve
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1200
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableTwelve',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableTwelve';
      tcName = 'testScrollableTwelve'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182420, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableThirteen
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1300
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableThirteen',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableThirteen';
      tcName = 'testScrollableThirteen'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, "[200,200]", 182430, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableFourteen
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1400
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableFourteen',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableFourteen';
      tcName = 'testScrollableFourteen'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182440, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableFifteen
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1500
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableFifteen',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableFifteen';
      tcName = 'testScrollableFifteen'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182450, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableSixteen
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1600
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableSixteen',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableSixteen';
      tcName = 'testScrollableSixteen'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, false, 182460, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableSeventeen
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1700
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableSeventeen',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableSeventeen';
      tcName = 'testScrollableSeventeen'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182470, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableEighteen
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1800
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableEighteen',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableEighteen';
      tcName = 'testScrollableEighteen'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182480, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableNineteen
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1900
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableNineteen',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableNineteen';
      tcName = 'testScrollableNineteen'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182490, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableTwenty
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2000
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableTwenty',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableTwenty';
      tcName = 'testScrollableTwenty'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182500, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableTwentyOne
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2100
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableTwentyOne',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableTwentyOne';
      tcName = 'testScrollableTwentyOne'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182510, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableTwentyTwo
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2200
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableTwentyTwo',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableTwentyTwo';
      tcName = 'testScrollableTwentyTwo'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182520, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableTwentyThree
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2300
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableTwentyThree',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableTwentyThree';
      tcName = 'testScrollableTwentyThree'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182530, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableTwentyFour
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2400
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableTwentyFour',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableTwentyFour';
      tcName = 'testScrollableTwentyFour'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182540, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableTwentyFive
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2500
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableTwentyFive',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableTwentyFive';
      tcName = 'testScrollableTwentyFive'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182550, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableTwentySix
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2600
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableTwentySix',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableTwentySix';
      tcName = 'testScrollableTwentySix'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182560, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableTwentySeven
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2700
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableTwentySeven',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function)=>{
      emitKey = 'emitScrollableTwentySeven';
      tcName = 'testScrollableTwentySeven'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182570, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableTwentyEight
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2800
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableTwentyEight',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableTwentyEight';
      tcName = 'testScrollableTwentyEight'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182580, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableTwentyNine
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2900
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableTwentyNine',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableTwentyNine';
      tcName = 'testScrollableTwentyNine'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182590, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableThirty
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_3000
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableThirty',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableThirty';
      tcName = 'testScrollableThirty'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182600, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableThirtyOne
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_3100
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableThirtyOne',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableThirtyOne';
      tcName = 'testScrollableThirtyOne'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182610, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableThirtyTwo
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_3200
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableThirtyTwo',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableThirtyTwo';
      tcName = 'testScrollableThirtyTwo'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182620, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableThirtyThree
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_3300
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableThirtyThree',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableThirtyThree';
      tcName = 'testScrollableThirtyThree'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182630, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableThirtyFour
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_3400
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableThirtyFour',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableThirtyFour';
      tcName = 'testScrollableThirtyFour'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182640, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableThirtyFive
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_3500
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableThirtyFive',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableThirtyFive';
      tcName = 'testScrollableThirtyFive'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182650, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollableThirtySix
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_3600
     * @tc.desc   When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollableThirtySix',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitScrollableThirtySix';
      tcName = 'testScrollableThirtySix'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182660, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollable", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
  })
}
