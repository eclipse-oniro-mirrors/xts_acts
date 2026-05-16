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
import { describe, beforeEach, it, TestType, Size, Level, beforeAll } from "@ohos/hypium";
import Utils from './Utils.test';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 111780;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "";

export default function webViewContMessageError() {
  describe('ActsAceWebDevWebViewContMessageErrorTest', () => {
    beforeAll(async (done: Function) => {
      await driver.waitForComponent(ON.id("webViewContMessageError"), 10000);
      console.log('waitForComponent webViewContMessageError');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webViewContMessageError beforeEach start');
      done();
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWCONTMESSAGEERROR_0100
    * @tc.name       testPostMessageInitErr
    * @tc.desc       test interface of postMessage with not been associated with specific Web Components
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testPostMessageInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitPostMessageInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPostMessageInitErr", "17100001", 111790, null);
      Utils.registerEvent("testPostMessageInitErr", "Init error. The WebviewController must be associated with a Web component", 111800, done);
      await Utils.waitAndClickComponent(driver, "webViewContMessageError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWCONTMESSAGEERROR_0200
    * @tc.name       testPostMessageEventPortClose
    * @tc.desc       test interface of postMessageEvent with WebMessagePort been closed by ets
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testPostMessageEventPortClose', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitPostMessageEventUnPortErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPostMessageEventPortClose", "17100010", 111810, null);
      Utils.registerEvent("testPostMessageEventPortClose", "Failed to post messages through the port.", 111820, done);
      await Utils.waitAndClickComponent(driver, "webViewContMessageError");
    })

    /**
     * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWCONTMESSAGEERROR_0300
     * @tc.name       testPostMessageFirstEmpty
     * @tc.desc       test interface of postMessage with not been associated with specific Web Components
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testPostMessageFirstEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitPostMessageFirstEmpty";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPostMessageFirstEmpty", "17100001", 111820, done);
      await Utils.waitAndClickComponent(driver, "webViewContMessageError");
    })

    /**
     * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWCONTMESSAGEERROR_0400
     * @tc.name       testPostMessageFirstNull
     * @tc.desc       test interface of postMessage with not been associated with specific Web Components
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testPostMessageFirstNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitPostMessageFirstNull";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPostMessageFirstNull", "401", 111830, done);
      await Utils.waitAndClickComponent(driver, "webViewContMessageError");
    })

    /**
     * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWCONTMESSAGEERROR_0500
     * @tc.name       testPostMessageFirstUndefined
     * @tc.desc       test interface of postMessage with not been associated with specific Web Components
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testPostMessageFirstUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitPostMessageFirstUndefined";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPostMessageFirstUndefined", "401", 111840, done);
      await Utils.waitAndClickComponent(driver, "webViewContMessageError");
    })

    /**
     * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWCONTMESSAGEERROR_0600
     * @tc.name       testPostMessageSecondNull
     * @tc.desc       test interface of postMessage with not been associated with specific Web Components
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testPostMessageSecondNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitPostMessageSecondNull";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPostMessageSecondNull", "401", 111850, done);
      await Utils.waitAndClickComponent(driver, "webViewContMessageError");
    })

    /**
     * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWCONTMESSAGEERROR_0700
     * @tc.name       testPostMessageSecondUndefined
     * @tc.desc       test interface of postMessage with not been associated with specific Web Components
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testPostMessageSecondUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitPostMessageSecondUndefined";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPostMessageSecondUndefined", "401", 111860, done);
      await Utils.waitAndClickComponent(driver, "webViewContMessageError");
    })

    /**
     * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWCONTMESSAGEERROR_0800
     * @tc.name       testPostMessageSecondEmptyArray
     * @tc.desc       test interface of postMessage with not been associated with specific Web Components
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testPostMessageSecondEmptyArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitPostMessageSecondEmptyArray";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPostMessageSecondEmptyArray", "401", 111870, done);
      await Utils.waitAndClickComponent(driver, "webViewContMessageError");
    })

    /**
     * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWCONTMESSAGEERROR_0900
     * @tc.name       testPostMessageThirdEmpty
     * @tc.desc       test interface of postMessage with not been associated with specific Web Components
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testPostMessageThirdEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitPostMessageThirdEmpty";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPostMessageThirdEmpty", "17100001", 111880, done);
      await Utils.waitAndClickComponent(driver, "webViewContMessageError");
    })

    /**
     * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWCONTMESSAGEERROR_1000
     * @tc.name       testPostMessageThirdNull
     * @tc.desc       test interface of postMessage with not been associated with specific Web Components
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testPostMessageThirdNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitPostMessageThirdNull";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPostMessageThirdNull", "17100001", 111890, done);
      await Utils.waitAndClickComponent(driver, "webViewContMessageError");
    })

    /**
     * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWCONTMESSAGEERROR_1100
     * @tc.name       testPostMessageThirdUndefined
     * @tc.desc       test interface of postMessage with not been associated with specific Web Components
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testPostMessageThirdUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitPostMessageThirdUndefined";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPostMessageThirdUndefined", "17100001", 111900, done);
      await Utils.waitAndClickComponent(driver, "webViewContMessageError");
    })
  })
}