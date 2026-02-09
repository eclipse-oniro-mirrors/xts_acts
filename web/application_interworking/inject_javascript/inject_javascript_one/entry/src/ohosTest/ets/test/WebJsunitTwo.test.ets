/*
 * Copyright (c) 2022~2023 Huawei Device Co., Ltd.
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

import { beforeAll, afterEach, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();

let emitKey = "emitRegisterJavaScriptProxy";

export default function webJsunitTwo() {
  describe('webJsunitTwoTest', () => {
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "testability/pages/webtwo"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webtwo state success ' + JSON.stringify(pages));
        if (!("webtwo" == pages.name)) {
          console.info('get webtwo state success ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info('push webtwo page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webtwo error: ' + err);
      }
      await driver.waitForComponent(ON.id("webtwocomponent"), 10000);
      done()
    });

    /**
     * @tc.name   RegisterJavaScriptProxy
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_013
     * @tc.desc   RegisterJavaScriptProxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RegisterJavaScriptProxy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitRegisterJavaScriptProxy", 172610);
      Utils.registerEvent("RegisterJavaScriptProxy", 'Web', 172620, done);
      await Utils.waitAndClickComponent(driver, 'webtwocomponent');
    })
    /**
     * @tc.name   DeleteJavaScriptRegister
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_014
     * @tc.desc   DeleteJavaScriptRegister
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DeleteJavaScriptRegister', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitDeleteJavaScriptRegister", 172610);
      Utils.registerEvent("DeleteJavaScriptRegister", "17100008", 172630, done);
      await Utils.waitAndClickComponent(driver, 'webtwocomponent');
    })
    /**
     * @tc.name   JsMessExtGetString
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_039
     * @tc.desc   JsMessExtGetString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('JsMessExtGetString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitJsMessExtGetString", 172610);
      Utils.registerEvent("JsMessExtGetString", "result type:string", 172640, done);
      await Utils.waitAndClickComponent(driver, 'webtwocomponent');
    })
    /**
     * @tc.name   JsMessExtGetNum
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_040
     * @tc.desc   JsMessExtGetNum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('JsMessExtGetNum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitJsMessExtGetNum", 172610);
      Utils.registerEvent("JsMessExtGetNum", "result type:number", 172650, done);
      await Utils.waitAndClickComponent(driver, 'webtwocomponent');
    })
    /**
     * @tc.name   JsMessExtGetBoo
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_041
     * @tc.desc   JsMessExtGetBoo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('JsMessExtGetBoo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitJsMessExtGetBoo", 172610);
      Utils.registerEvent("JsMessExtGetBoo", "result type:boolean", 172660, done);
      await Utils.waitAndClickComponent(driver, 'webtwocomponent');
    })
    /**
     * @tc.name   JsMessExtGetArrayBuffer
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_042
     * @tc.desc   JsMessExtGetArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('JsMessExtGetArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitJsMessExtGetArrayBuffer", 172610);
      Utils.registerEvent("JsMessExtGetArrayBuffer", "result type:object", 172670, done);
      await Utils.waitAndClickComponent(driver, 'webtwocomponent');
    })
    /**
     * @tc.name   JsMessExtGetArray
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_043
     * @tc.desc   JsMessExtGetArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('JsMessExtGetArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitJsMessExtGetArray", 172610);
      Utils.registerEvent("JsMessExtGetArray", "result type:object0", 172680, done);
      await Utils.waitAndClickComponent(driver, 'webtwocomponent');
    })
    /**
     * @tc.name   WebMessExtSetString
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_044
     * @tc.desc   WebMessExtSetString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WebMessExtSetString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebMessExtSetString", 172610);
      let result = "String:helloFromEts";
      Utils.registerEvent("WebMessExtSetString", JSON.stringify(result), 172700, done);
      await Utils.waitAndClickComponent(driver, 'webtwocomponent');
    })
    /**
     * @tc.name   WebMessExtGetString
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_045
     * @tc.desc   WebMessExtGetString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WebMessExtGetString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebMessExtGetString", 172610);
      Utils.registerEvent("WebMessExtGetString", "result type:string", 172690, done);
      await Utils.waitAndClickComponent(driver, 'webtwocomponent');
    })
    /**
     * @tc.name   WebMessExtSetNumber
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_046
     * @tc.desc   WebMessExtSetNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WebMessExtSetNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebMessExtSetNumber", 172610);
      let result = "Number:1";
      Utils.registerEvent("WebMessExtSetNumber", JSON.stringify(result), 172710, done);
      await Utils.waitAndClickComponent(driver, 'webtwocomponent');
    })
    /**
     * @tc.name   WebMessExtGetNumber
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_047
     * @tc.desc   WebMessExtGetNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WebMessExtGetNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebMessExtGetNumber", 172610);
      Utils.registerEvent("WebMessExtGetNumber", "result type:number0", 172720, done);
      await Utils.waitAndClickComponent(driver, 'webtwocomponent');
    })
    /**
     * @tc.name   WebMessExtSetBoolean
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_048
     * @tc.desc   WebMessExtSetBoolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WebMessExtSetBoolean', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebMessExtSetBoolean", 172610);
      let result = "Boolean:true";
      Utils.registerEvent("WebMessExtSetBoolean", JSON.stringify(result), 172730, done);
      await Utils.waitAndClickComponent(driver, 'webtwocomponent');
    })
    /**
     * @tc.name   WebMessExtGetBoolean
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_049
     * @tc.desc   WebMessExtGetBoolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WebMessExtGetBoolean', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebMessExtGetBoolean", 172610);
      Utils.registerEvent("WebMessExtGetBoolean", "result type:boolean", 172740, done);
      await Utils.waitAndClickComponent(driver, 'webtwocomponent');
    })
    /**
     * @tc.name   WebMessExtSetArray
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_050
     * @tc.desc   WebMessExtSetArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WebMessExtSetArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebMessExtSetArray", 172610);
      let result = "Array len:1, value:apple";
      Utils.registerEvent("WebMessExtSetArray", JSON.stringify(result), 172750, done);
      await Utils.waitAndClickComponent(driver, 'webtwocomponent');
    })
    /**
     * @tc.name   WebMessExtGetArray
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_051
     * @tc.desc   WebMessExtGetArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WebMessExtGetArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebMessExtGetArray", 172610);
      Utils.registerEvent("WebMessExtGetArray", "result type:object", 172760, done);
      await Utils.waitAndClickComponent(driver, 'webtwocomponent');
    })
    /**
     * @tc.name   WebMessExtSetArrayBuffer
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_052
     * @tc.desc   WebMessExtSetArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WebMessExtSetArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebMessExtSetArrayBuffer", 172610);
      let result = "ArrayBuffer:8";
      Utils.registerEvent("WebMessExtSetArrayBuffer", JSON.stringify(result), 172770, done);
      await Utils.waitAndClickComponent(driver, 'webtwocomponent');
    })
    /**
     * @tc.name   WebMessExtGetArrayBuffer
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_053
     * @tc.desc   WebMessExtGetArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WebMessExtGetArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebMessExtGetArrayBuffer", 172610);
      Utils.registerEvent("WebMessExtGetArrayBuffer", "result getArrayBuffer byteLength:8", 172780, done);
      await Utils.waitAndClickComponent(driver, 'webtwocomponent');
    })
    /**
     * @tc.name   WebMessExtSetError
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_054
     * @tc.desc   WebMessExtSetError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WebMessExtSetError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebMessExtSetError", 172610);
      let result = "Error:SyntaxError, msg:";
      Utils.registerEvent("WebMessExtSetError", JSON.stringify(result), 172790, done);
      await Utils.waitAndClickComponent(driver, 'webtwocomponent');
    })
    /**
     * @tc.name   WebMessExtGetError
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_055
     * @tc.desc   WebMessExtGetError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WebMessExtGetError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebMessExtGetError", 172610);
      Utils.registerEvent("WebMessExtGetError", "result type:object", 172800, done);
      await Utils.waitAndClickComponent(driver, 'webtwocomponent');
    })
  })
}
