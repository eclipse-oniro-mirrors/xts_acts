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
import Utils from './Utils';
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
      console.log("waitForComponent webViewContMessageError");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewContMessageError beforeEach start");
      done();
    })

    /**
     * @tc.name   testPostMessageInitErr
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWCONTMESSAGEERROR_0100
     * @tc.desc   test interface of postMessage with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitPostMessageInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPostMessageInitErr", "17100001", 111790, null);
      Utils.registerEvent("testPostMessageInitErr", "Init error. The WebviewController must be associated with a Web component", 111800, done);
      await Utils.waitAndClickComponent(driver, "webViewContMessageError");
    })
    /**
     * @tc.name   testPostMessageEventPortClose
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWCONTMESSAGEERROR_0200
     * @tc.desc   test interface of postMessageEvent with WebMessagePort been closed by ets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageEventPortClose', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitPostMessageEventUnPortErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPostMessageEventPortClose", "17100010", 111810, null);
      Utils.registerEvent("testPostMessageEventPortClose", "Failed to post messages through the port.", 111820, done);
      await Utils.waitAndClickComponent(driver, "webViewContMessageError");
    })
  })
}