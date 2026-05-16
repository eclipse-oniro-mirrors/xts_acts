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

const EVENT_ID_SET_EMIT_KEY = 111530;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = "";

export default function webViewContJavaScriptError() {
  describe('ActsAceWebDevWebViewContJavaScriptErrorTest', () => {
    beforeAll(async (done: Function) => {

      await driver.waitForComponent(ON.id("webViewContJavaScriptError"), 10000);
      console.log('waitForComponent webViewContJavaScriptError');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webViewContJavaScriptError beforeEach start');
      done();
    })

   /**
    * @tc.number   SUB_ACE_BASIC_ETS_WEBVIEWERROR_2600
    * @tc.name     testRegisterJavaScriptProxyInitErr
    * @tc.desc     test interface of registerJavaScriptProxy with not been associated with specific Web Components
    * @tc.size     MediumTest
    * @tc.type     Function
    * @tc.level    Level 0
    */
    it('testRegisterJavaScriptProxyInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitRegisterJavaScriptProxyInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testRegisterJavaScriptProxyInitErr", "17100001", 111540, null);
      Utils.registerEvent("testRegisterJavaScriptProxyInitErr", "Init error. The WebviewController must be associated with a Web component", 111550, done);
      await Utils.waitAndClickComponent(driver, "webViewContJavaScriptError");
    })
   /**
    * @tc.number   SUB_ACE_BASIC_ETS_WEBVIEWERROR_2700
    * @tc.name     testRunJavaScriptCallbackInitErr
    * @tc.desc     test interface of runJavaScript (callback) with not been associated with specific Web Components
    * @tc.size     MediumTest
    * @tc.type     Function
    * @tc.level    Level 0
    */
    it('testRunJavaScriptCallbackInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitRunJavaScriptCallbackInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testRunJavaScriptCallbackInitErr", "17100001", 111560, null);
      Utils.registerEvent("testRunJavaScriptCallbackInitErr", "Init error. The WebviewController must be associated with a Web component", 111570, done);
      await Utils.waitAndClickComponent(driver, "webViewContJavaScriptError");
    })
   /**
    * @tc.number   SUB_ACE_BASIC_ETS_WEBVIEWERROR_2800
    * @tc.name     testRunJavaScriptPromiseInitErr
    * @tc.desc     test interface of runJavaScript (promise) with not been associated with specific Web Components
    * @tc.size     MediumTest
    * @tc.type     Function
    * @tc.level    Level 0
    */
    it('testRunJavaScriptPromiseInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitRunJavaScriptPromiseInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testRunJavaScriptPromiseInitErr", "17100001", 111580, null);
      Utils.registerEvent("testRunJavaScriptPromiseInitErr", "Init error. The WebviewController must be associated with a Web component", 111590, done);
      await Utils.waitAndClickComponent(driver, "webViewContJavaScriptError");
    })
   /**
    * @tc.number   SUB_ACE_BASIC_ETS_WEBVIEWERROR_2900
    * @tc.name     testRunJavaScriptExtCallbackInitErr
    * @tc.desc     test interface of runJavaScriptExt (callback) with not been associated with specific Web Components
    * @tc.size     MediumTest
    * @tc.type     Function
    * @tc.level    Level 0
    */
    it('testRunJavaScriptExtCallbackInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitRunJavaScriptExtCallbackInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testRunJavaScriptExtCallbackInitErr", "17100001", 111600, null);
      Utils.registerEvent("testRunJavaScriptExtCallbackInitErr", "Init error. The WebviewController must be associated with a Web component", 111610, done);
      await Utils.waitAndClickComponent(driver, "webViewContJavaScriptError");
    })
   /**
    * @tc.number   SUB_ACE_BASIC_ETS_WEBVIEWERROR_3000
    * @tc.name     testRunJavaScriptExtPromiseInitErr
    * @tc.desc     test interface of runJavaScriptExt (promise) with not been associated with specific Web Components
    * @tc.size     MediumTest
    * @tc.type     Function
    * @tc.level    Level 0
    */
    it('testRunJavaScriptExtPromiseInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitRunJavaScriptExtPromiseInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testRunJavaScriptExtPromiseInitErr", "17100001", 111620, null);
      Utils.registerEvent("testRunJavaScriptExtPromiseInitErr", "Init error. The WebviewController must be associated with a Web component", 111630, done);
      await Utils.waitAndClickComponent(driver, "webViewContJavaScriptError");
    })
   /**
    * @tc.number   SUB_ACE_BASIC_ETS_WEBVIEWERROR_3100
    * @tc.name     testDeleteJavaScriptRegisterInitErr
    * @tc.desc     test interface of deleteJavaScriptRegister with not been associated with specific Web Components
    * @tc.size     MediumTest
    * @tc.type     Function
    * @tc.level    Level 0
    */
    it('testDeleteJavaScriptRegisterInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitDeleteJavaScriptRegisterInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testDeleteJavaScriptRegisterInitErr", "17100001", 111640, null);
      Utils.registerEvent("testDeleteJavaScriptRegisterInitErr", "Init error. The WebviewController must be associated with a Web component", 111650, done);
      await Utils.waitAndClickComponent(driver, "webViewContJavaScriptError");
    })
   /**
    * @tc.number   SUB_ACE_BASIC_ETS_WEBVIEWERROR_3200
    * @tc.name     testDeleteJavaScriptRegisterNameErr
    * @tc.desc     test interface of deleteJavaScriptRegister with not been registered name
    * @tc.size     MediumTest
    * @tc.type     Function
    * @tc.level    Level 0
    */
    it('testDeleteJavaScriptRegisterNameErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitDeleteJavaScriptRegisterNameErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testDeleteJavaScriptRegisterNameErr", "17100008", 111660, null);
      Utils.registerEvent("testDeleteJavaScriptRegisterNameErr", "Failed to delete JavaScriptProxy because it does not exist.", 111670, done);
      await Utils.waitAndClickComponent(driver, "webViewContJavaScriptError");
    })
  })
}