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
import Utils from './Utils.test';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 111670;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "";

export default function webViewContJsMessageExtReturnError() {
  describe('ActsAceWebDevWebViewContJsMessageExtReturnErrorTest', () => {
     beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewContJsMessageExtReturnError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webViewContJsMessageExtReturnError state success ' + JSON.stringify(pages));
        if (!("WebViewContJsMessageExtReturnError" == pages.name)) {
          console.info('get webViewContJsMessageExtReturnError state success ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info('push webViewContJsMessageExtReturnError page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webViewContJsMessageExtReturnError page error: ' + err);
      }
      await driver.waitForComponent(ON.id("webViewContJsMessageExtReturnError"), 10000);
      console.log('waitForComponent webViewContJsMessageExtReturnError');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webViewContJsMessageExtReturnError beforeEach start');
      done();
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_1000
    * @tc.name       testJsMessageExtGetStringError
    * @tc.desc       test interface of JsMessageExt getString with unmatched type
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testJsMessageExtGetStringError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitJsMessageExtGetStringError";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testJsMessageExtGetStringError", "17100014", 111680, null);
      Utils.registerEvent("testJsMessageExtGetStringError", "The type and value of the message do not match.", 111690, done);
      await Utils.waitAndClickComponent(driver, "webViewContJsMessageExtReturnError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_1100
    * @tc.name       testJsMessageExtGetNumberError
    * @tc.desc       test interface of JsMessageExt getNumber with unmatched type
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testJsMessageExtGetNumberError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitJsMessageExtGetNumberError";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testJsMessageExtGetNumberError", "17100014", 111700, null);
      Utils.registerEvent("testJsMessageExtGetNumberError", "The type and value of the message do not match.", 111710, done);
      await Utils.waitAndClickComponent(driver, "webViewContJsMessageExtReturnError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_1200
    * @tc.name       testJsMessageExtGetBooleanError
    * @tc.desc       test interface of JsMessageExt getBoolean with unmatched type
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testJsMessageExtGetBooleanError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitJsMessageExtGetBooleanError";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testJsMessageExtGetBooleanError", "17100014", 111720, null);
      Utils.registerEvent("testJsMessageExtGetBooleanError", "The type and value of the message do not match.", 111730, done);
      await Utils.waitAndClickComponent(driver, "webViewContJsMessageExtReturnError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_1300
    * @tc.name       testJsMessageExtGetArrayBufferError
    * @tc.desc       test interface of JsMessageExt getArrayBuffer with unmatched type
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testJsMessageExtGetArrayBufferError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitJsMessageExtGetArrayBufferError";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testJsMessageExtGetArrayBufferError", "17100014", 111740, null);
      Utils.registerEvent("testJsMessageExtGetArrayBufferError", "The type and value of the message do not match.", 111750, done);
      await Utils.waitAndClickComponent(driver, "webViewContJsMessageExtReturnError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_1400
    * @tc.name       testJsMessageExtGetArrayError
    * @tc.desc       test interface of JsMessageExt getArray with unmatched type
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testJsMessageExtGetArrayError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitJsMessageExtGetArrayError";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testJsMessageExtGetArrayError", "17100014", 111760, null);
      Utils.registerEvent("testJsMessageExtGetArrayError", "The type and value of the message do not match.", 111770, done);
      await Utils.waitAndClickComponent(driver, "webViewContJsMessageExtReturnError");
    })
  })
}