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

let emitKey = ""
let tcName = ""
const EVENT_ID_SET_SUITE_KEY = 184501;
let driver = Driver.create();
export default function webViewSrollByJsunit() {
  describe('ActsAceWebViewScrollByTest',  () =>{
    beforeAll(async  (done: Function) => {
      let options: router.RouterOptions = {
        url: "testability/pages/webViewSrollByJsunit"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewScroll state success " + JSON.stringify(pages));
        if (!("webViewScrollBy" == pages.name)) {
          console.info("get webViewScrollBy state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await driver.waitForComponent(ON.id("webcomponentScrollBy"),10000);
          console.info("push webViewScrollBy page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewScrollBy page error: " + err);
      }
      done()
    });
    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewScrollBy beforeEach start");
      done();
    })

    /**
     * @tc.name   testScrollByOne
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLBY_0100
     * @tc.desc   When calling the scrollTo interface, x=0 and the y input parameter is a positive number,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollByOne',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done:Function) =>{
      emitKey = 'emitScrollByOne';
      tcName = 'testScrollByOne'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184510, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollBy", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollByTwo
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLBY_0200
     * @tc.desc   When calling the scrollTo interface, x=0 and the y input parameter is a positive number,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollByTwo',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done:Function) =>{
      emitKey = 'emitScrollByTwo';
      tcName = 'testScrollByTwo'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184520, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollBy", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollByThree
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLBY_0300
     * @tc.desc   When calling the scrollTo interface, x=0 and the y input parameter is negative, which is half the
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollByThree',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done:Function) =>{
      emitKey = 'emitScrollByThree';
      tcName = 'testScrollByThree'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, "[0,0]", 184530, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollBy", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollByFour
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLBY_0400
     * @tc.desc   When calling the scrollTo interface, x=0 and the y input parameter is negative, exceeding the
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollByFour',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done:Function) =>{
      emitKey = 'emitScrollByFour';
      tcName = 'testScrollByFour'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, "[0,0]", 184540, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollBy", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollByFive
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLBY_0500
     * @tc.desc   When calling the scrollTo interface, y=0 and the x input parameter is a positive number, which is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollByFive',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done:Function) =>{
      emitKey = 'emitScrollByFive';
      tcName = 'testScrollByFive'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184550, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollBy", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollBySix
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLBY_0600
     * @tc.desc   When calling the scrollTo interface, y=0 and the x input parameter is positive, which is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollBySix',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done:Function) =>{
      emitKey = 'emitScrollBySix';
      tcName = 'testScrollBySix'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184560, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollBy", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollBySeven
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLBY_0700
     * @tc.desc   When calling the scrollTo interface, y=0 and the x input parameter is negative, which is greater
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollBySeven',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done:Function) =>{
      emitKey = 'emitScrollBySeven';
      tcName = 'testScrollBySeven'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, "[0,0]", 184570, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollBy", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollByEight
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLBY_0800
     * @tc.desc   When calling the scrollTo interface, y=0 and the x input parameter is negative, which is half the
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollByEight',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done:Function) =>{
      emitKey = 'emitScrollByEight';
      tcName = 'testScrollByEight'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, "[0,0]", 184580, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollBy", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollByNine
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLBY_0900
     * @tc.desc   When calling the scrollTo interface, the yx input parameter is a positive number, which is half
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollByNine',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done:Function) =>{
      emitKey = 'emitScrollByNine';
      tcName = 'testScrollByEight'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184590, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollBy", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollByTen
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLBY_1000
     * @tc.desc   When the scrollTo interface is called, the yx input parameter is a positive number, which exceeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollByTen',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done:Function) =>{
      emitKey = 'emitScrollByTen';
      tcName = 'testScrollByTen'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184600, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollBy", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollByEleven
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLBY_1100
     * @tc.desc   When calling the scrollTo interface, the yx input parameter is negative, which is half the width
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollByEleven',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done:Function) =>{
      emitKey = 'emitScrollByEleven';
      tcName = 'testScrollByEleven'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, "[0,0]", 184610, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollBy", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testScrollByTwelve
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLBY_1200
     * @tc.desc   When calling the scrollTo interface, the yx input parameter is negative, which exceeds the page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollByTwelve',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done:Function) =>{
      emitKey = 'emitScrollByTwelve';
      tcName = 'testScrollByTwelve'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, "[0,0]", 184620, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollBy", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
  })
}
