/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 113340;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function jsMessageExtErrorCode() {

  describe('JsMessageExtErrorCodeTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/jsMessageExtErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get jsMessageExtErrorCode state success " + JSON.stringify(pages));
        if (!("jsMessageExtErrorCode" == pages.name)) {
          console.info("get jsMessageExtErrorCode state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push jsMessageExtErrorCode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push jsMessageExtErrorCode page error: " + err);
      }
      await driver.waitForComponent(ON.id("JsMessageExtErrorCodeButton"), 10000);
      console.log("waitForComponent JsMessageExtErrorCodeButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    /**
     * @tc.name   testJsMessageExtGetStringError001
     * @tc.number SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETSTRING_0100
     * @tc.desc   test JsMessageExtGetString error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsMessageExtGetStringError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetStringError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testJsMessageExtGetStringError001", '17100014', 113350, done);
      await Utils.waitAndClickComponent(driver, "JsMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testJsMessageExtGetStringError002
     * @tc.number SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETSTRING_0200
     * @tc.desc   test JsMessageExtGetString error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsMessageExtGetStringError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetStringError002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testJsMessageExtGetStringError002", '17100014', 113360, done);
      await Utils.waitAndClickComponent(driver, "JsMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testJsMessageExtGetStringError003
     * @tc.number SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETSTRING_0300
     * @tc.desc   test JsMessageExtGetString error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsMessageExtGetStringError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetStringError003", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testJsMessageExtGetStringError003", '17100014', 113370, done);
      await Utils.waitAndClickComponent(driver, "JsMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testJsMessageExtGetStringError004
     * @tc.number SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETSTRING_0400
     * @tc.desc   test JsMessageExtGetString error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsMessageExtGetStringError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetStringError004", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testJsMessageExtGetStringError004", '17100014', 113380, done);
      await Utils.waitAndClickComponent(driver, "JsMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testJsMessageExtGetNumberError001
     * @tc.number SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETNUMBER_0100
     * @tc.desc   test JsMessageExtGetString error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsMessageExtGetNumberError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetNumberError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testJsMessageExtGetNumberError001", '17100014', 113390, done);
      await Utils.waitAndClickComponent(driver, "JsMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testJsMessageExtGetNumberError002
     * @tc.number SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETNUMBER_0200
     * @tc.desc   test JsMessageExtGetString error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsMessageExtGetNumberError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetNumberError002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testJsMessageExtGetNumberError002", '17100014', 113400, done);
      await Utils.waitAndClickComponent(driver, "JsMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testJsMessageExtGetNumberError003
     * @tc.number SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETNUMBER_0300
     * @tc.desc   test JsMessageExtGetString error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsMessageExtGetNumberError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetNumberError003", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testJsMessageExtGetNumberError003", '17100014', 113410, done);
      await Utils.waitAndClickComponent(driver, "JsMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testJsMessageExtGetNumberError004
     * @tc.number SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETNUMBER_0400
     * @tc.desc   test JsMessageExtGetString error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsMessageExtGetNumberError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetNumberError004", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testJsMessageExtGetNumberError004", '17100014', 113420, done);
      await Utils.waitAndClickComponent(driver, "JsMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testJsMessageExtGetBooleanError001
     * @tc.number SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETBOOLEAN_0100
     * @tc.desc   test JsMessageExtGetBoolean error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsMessageExtGetBooleanError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetBooleanError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testJsMessageExtGetBooleanError001", '17100014', 113430, done);
      await Utils.waitAndClickComponent(driver, "JsMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testJsMessageExtGetBooleanError002
     * @tc.number SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETBOOLEAN_0200
     * @tc.desc   test JsMessageExtGetBoolean error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsMessageExtGetBooleanError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetBooleanError002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testJsMessageExtGetBooleanError002", '17100014', 113440, done);
      await Utils.waitAndClickComponent(driver, "JsMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testJsMessageExtGetBooleanError003
     * @tc.number SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETBOOLEAN_0300
     * @tc.desc   test JsMessageExtGetBoolean error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsMessageExtGetBooleanError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetBooleanError003", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testJsMessageExtGetBooleanError003", '17100014', 113450, done);
      await Utils.waitAndClickComponent(driver, "JsMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testJsMessageExtGetBooleanError004
     * @tc.number SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETBOOLEAN_0400
     * @tc.desc   test JsMessageExtGetBoolean error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsMessageExtGetBooleanError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetBooleanError004", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testJsMessageExtGetBooleanError004", '17100014', 113460, done);
      await Utils.waitAndClickComponent(driver, "JsMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testJsMessageExtGetArrayBufferError001
     * @tc.number SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAYBUFFER_0100
     * @tc.desc   test JsMessageExtGetArrayBuffer error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsMessageExtGetArrayBufferError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetArrayBufferError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testJsMessageExtGetArrayBufferError001", '17100014', 113470, done);
      await Utils.waitAndClickComponent(driver, "JsMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testJsMessageExtGetArrayBufferError002
     * @tc.number SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAYBUFFER_0200
     * @tc.desc   test JsMessageExtGetArrayBuffer error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsMessageExtGetArrayBufferError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetArrayBufferError002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testJsMessageExtGetArrayBufferError002", '17100014', 113480, done);
      await Utils.waitAndClickComponent(driver, "JsMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testJsMessageExtGetArrayBufferError003
     * @tc.number SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAYBUFFER_0300
     * @tc.desc   test JsMessageExtGetArrayBuffer error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsMessageExtGetArrayBufferError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetArrayBufferError003", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testJsMessageExtGetArrayBufferError003", '17100014', 113490, done);
      await Utils.waitAndClickComponent(driver, "JsMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testJsMessageExtGetArrayBufferError004
     * @tc.number SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAYBUFFER_0400
     * @tc.desc   test JsMessageExtGetArrayBuffer error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsMessageExtGetArrayBufferError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetArrayBufferError004", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testJsMessageExtGetArrayBufferError004", '17100014', 113500, done);
      await Utils.waitAndClickComponent(driver, "JsMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testJsMessageExtGetArrayError001
     * @tc.number SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAY_0100
     * @tc.desc   test JsMessageExtGetArray error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsMessageExtGetArrayError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetArrayError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testJsMessageExtGetArrayError001", '17100014', 113510, done);
      await Utils.waitAndClickComponent(driver, "JsMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testJsMessageExtGetArrayError002
     * @tc.number SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAY_0200
     * @tc.desc   test JsMessageExtGetArray error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsMessageExtGetArrayError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetArrayError002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testJsMessageExtGetArrayError002", '17100014', 113520, done);
      await Utils.waitAndClickComponent(driver, "JsMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testJsMessageExtGetArrayError003
     * @tc.number SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAY_0300
     * @tc.desc   test JsMessageExtGetArray error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsMessageExtGetArrayError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetArrayError003", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testJsMessageExtGetArrayError003", '17100014', 113530, done);
      await Utils.waitAndClickComponent(driver, "JsMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testJsMessageExtGetArrayError004
     * @tc.number SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAY_0400
     * @tc.desc   test JsMessageExtGetArray error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsMessageExtGetArrayError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetArrayError004", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testJsMessageExtGetArrayError004", '17100014', 113540, done);
      await Utils.waitAndClickComponent(driver, "JsMessageExtErrorCodeButton");
    })
  })
}