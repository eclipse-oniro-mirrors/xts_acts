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
import { afterEach, beforeAll, beforeEach, expect, describe, it , TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForExist } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let driver = Driver.create();


export default function webJsunitTwo() {
  describe('ActsAceWebDevTwoTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webTwo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webTwo state success " + JSON.stringify(pages));
        if (!("IndexOthers" == pages.name)) {
          console.info("get webTwo state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webTwo page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webTwo page error: " + err);
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id("webTwoButton"),10000);
      console.log("waitForComponent webTwoButton==>");
      done()
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
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
     * @tc.number     : SUB_WEB_GETPROGRESS_API_0100
     * @tc.name       : testWebviewGetProgress001
     * @tc.desc       : test onPageBegin getProgress
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testWebviewGetProgress001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebviewGetProgress001", 140011);
      let isReturn = false;
      Utils.registerBaseEvent("testWebviewGetProgress001", true, 140020, ()=>{isReturn = true},
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("webTwoButton",driver)
      await waitForExist(()=>isReturn, "testOnBeforeUnloadIsReloadFalse", true,1000);
      done();
    })
    /*
     * @tc.number     : SUB_WEB_GETPROGRESS_API_0200
     * @tc.name       : testWebviewGetProgress002
     * @tc.desc       : test onPageEnd getProgress
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testWebviewGetProgress002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebviewGetProgress002", 140011);
      let isReturn = false;
      Utils.registerBaseEvent("testWebviewGetProgress002", true, 140030, ()=>{isReturn = true},
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("webTwoButton",driver)
      await waitForExist(()=>isReturn, "testOnBeforeUnloadIsReloadFalse", true,1000);
      done();
    })
    /*
     * @tc.number     : SUB_WEB_GETPROGRESS_API_0300
     * @tc.name       : testWebviewGetProgress003
     * @tc.desc       : test onProgressChange getProgress
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testWebviewGetProgress003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebviewGetProgress003", 140011);
      let isReturn = false;
      Utils.registerBaseEvent("testWebviewGetProgress003", true, 140040, ()=>{isReturn = true},
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("webTwoButton",driver)
      await waitForExist(()=>isReturn, "testOnBeforeUnloadIsReloadFalse", true,1000);
      done();
    })
    /*
     * @tc.number     : SUB_WEB_GETPROGRESS_API_0400
     * @tc.name       : testWebviewGetProgress004
     * @tc.desc       : test onControllerAttached getProgress
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testWebviewGetProgress004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebviewGetProgress004", 140011);
      let isReturn = false;
      Utils.registerBaseEvent("testWebviewGetProgress004", true, 140050, ()=>{isReturn = true},
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("webTwoButton",driver)
      await waitForExist(()=>isReturn, "testOnBeforeUnloadIsReloadFalse", true,1000);
      done();
    })
    /*
     * @tc.number     : SUB_WEB_GETPROGRESS_API_0500
     * @tc.name       : testWebviewGetProgress005
     * @tc.desc       : test onPageVisible getProgress
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testWebviewGetProgress005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebviewGetProgress005", 140011);
      let isReturn = false;
      Utils.registerBaseEvent("testWebviewGetProgress005", true, 140060, ()=>{isReturn = true},
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("webTwoButton",driver)
      await waitForExist(()=>isReturn, "testOnBeforeUnloadIsReloadFalse", true,1000);
      done();
    })
    /*
     * @tc.number     : SUB_WEB_GETPROGRESS_API_0600
     * @tc.name       : testWebviewGetProgress006
     * @tc.desc       : test onDisAppear getProgress
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testWebviewGetProgress006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebviewGetProgress006", 140011);
      let isReturn = false;
      Utils.registerBaseEvent("testWebviewGetProgress006", true, 140070, ()=>{isReturn = true},
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("webTwoButton",driver)
      await waitForExist(()=>isReturn, "testOnBeforeUnloadIsReloadFalse", true,1000);
      done();
    })
  })
}
