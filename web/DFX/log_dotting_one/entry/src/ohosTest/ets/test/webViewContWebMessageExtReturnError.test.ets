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
import { describe, beforeEach, it, beforeAll, TestType, Size, Level } from "@ohos/hypium";
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 112210;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = "";

export default function webViewContWebMessageExtReturnError() {
  describe('ActsAceWebDevWebViewContWebMessageExtReturnErrorTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewContWebMessageExtReturnError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewContWebMessageExtReturnError state success " + JSON.stringify(pages));
        if (!("webViewContWebMessageExtReturnError" == pages.name)) {
          console.info("get webViewContWebMessageExtReturnError state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push webViewContWebMessageExtReturnError page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewContWebMessageExtReturnError page error: " + err);
      }
      await driver.waitForComponent(ON.id("webViewContWebMessageExtReturnError"), 10000);
      console.log("waitForComponent webViewContWebMessageExtReturnError");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewContWebMessageExtReturnError beforeEach start");
      done();
    })

    /**
     * @tc.name   testWebMessageExtGetStringError
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_1500
     * @tc.desc   test interface of WebMessageExt getString with unmatched type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebMessageExtGetStringError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebMessageExtGetStringError";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExtGetStringError", "17100014", 112220, null);
      Utils.registerEvent("testWebMessageExtGetStringError", "The type and value of the message do not match.", 112230, done);
      await Utils.waitAndClickComponent(driver, "webViewContWebMessageExtReturnError");
    })
    /**
     * @tc.name   testWebMessageExtGetNumberError
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_1600
     * @tc.desc   test interface of WebMessageExt getNumber with unmatched type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebMessageExtGetNumberError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebMessageExtGetNumberError";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExtGetNumberError", "17100014", 112240, null);
      Utils.registerEvent("testWebMessageExtGetNumberError", "The type and value of the message do not match.", 112250, done);
      await Utils.waitAndClickComponent(driver, "webViewContWebMessageExtReturnError");
    })
    /**
     * @tc.name   testWebMessageExtGetBooleanError
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_1700
     * @tc.desc   test interface of WebMessageExt getBoolean with unmatched type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebMessageExtGetBooleanError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebMessageExtGetBooleanError";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExtGetBooleanError", "17100014", 112260, null);
      Utils.registerEvent("testWebMessageExtGetBooleanError", "The type and value of the message do not match.", 112270, done);
      await Utils.waitAndClickComponent(driver, "webViewContWebMessageExtReturnError");
    })
    /**
     * @tc.name   testWebMessageExtGetArrayBufferError
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_1800
     * @tc.desc   test interface of WebMessageExt getArrayBuffer with unmatched type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebMessageExtGetArrayBufferError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebMessageExtGetArrayBufferError";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExtGetArrayBufferError", "17100014", 112280, null);
      Utils.registerEvent("testWebMessageExtGetArrayBufferError", "The type and value of the message do not match.", 112290, done);
      await Utils.waitAndClickComponent(driver, "webViewContWebMessageExtReturnError");
    })
    /**
     * @tc.name   testWebMessageExtGetArrayError
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_1900
     * @tc.desc   test interface of WebMessageExt getArray with unmatched type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebMessageExtGetArrayError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebMessageExtGetArrayError";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExtGetArrayError", "17100014", 112300, null);
      Utils.registerEvent("testWebMessageExtGetArrayError", "The type and value of the message do not match.", 112310, done);
      await Utils.waitAndClickComponent(driver, "webViewContWebMessageExtReturnError");
    })
    /**
     * @tc.name   testWebMessageExtGetErrorError
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_2000
     * @tc.desc   test interface of WebMessageExt getError with unmatched type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebMessageExtGetErrorError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebMessageExtGetErrorError";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExtGetErrorError", "17100014", 112320, null);
      Utils.registerEvent("testWebMessageExtGetErrorError", "The type and value of the message do not match.", 112330, done);
      await Utils.waitAndClickComponent(driver, "webViewContWebMessageExtReturnError");
    })
  })
}