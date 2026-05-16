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

const EVENT_ID_SET_EMIT_KEY = 114630;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webMessageExtErrorCode() {
  describe('WebMessageExtErrorCodeTestSuite', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webMessageExtErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webMessageExtErrorCode state success " + JSON.stringify(pages));
        if (!("webMessageExtErrorCode" == pages.name)) {
          console.info("get webMessageExtErrorCode state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webMessageExtErrorCode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webMessageExtErrorCode page error: " + err);
      }
      await driver.waitForComponent(ON.id("webMessageExtErrorCodeButton"), 10000);
      console.log("waitForComponent webMessageExtErrorCodeButton");
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
     * @tc.name   testWebMessageExtGetStringError001
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETSTRING_0100
     * @tc.desc   test WebMessageExtGetString error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExtGetStringError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetStringError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExtGetStringError001", '17100014', 114640, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExtGetStringError002
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETSTRING_0200
     * @tc.desc   test WebMessageExtGetString error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExtGetStringError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetStringError002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExtGetStringError002", '17100014', 114650, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExtGetStringError003
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETSTRING_0300
     * @tc.desc   test WebMessageExtGetString error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExtGetStringError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetStringError003", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExtGetStringError003", '17100014', 114660, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExtGetStringError004
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETSTRING_0400
     * @tc.desc   test WebMessageExtGetString error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExtGetStringError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetStringError004", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExtGetStringError004", '17100014', 114670, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExtGetStringError005
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETSTRING_0500
     * @tc.desc   test WebMessageExtGetString error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExtGetStringError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetStringError005", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExtGetStringError005", '17100014', 114680, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExtGetNumberError001
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETNUMBER_0100
     * @tc.desc   test WebMessageExtGetNumber error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExtGetNumberError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetNumberError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExtGetNumberError001", '17100014', 114690, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExtGetNumberError002
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETNUMBER_0200
     * @tc.desc   test WebMessageExtGetNumber error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExtGetNumberError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetNumberError002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExtGetNumberError002", '17100014', 114700, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExtGetNumberError003
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETNUMBER_0300
     * @tc.desc   test WebMessageExtGetNumber error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExtGetNumberError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetNumberError003", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExtGetNumberError003", '17100014', 114710, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExtGetNumberError004
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETNUMBER_0400
     * @tc.desc   test WebMessageExtGetNumber error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExtGetNumberError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetNumberError004", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExtGetNumberError004", '17100014', 114720, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExtGetNumberError005
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETNUMBER_0500
     * @tc.desc   test WebMessageExtGetNumber error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExtGetNumberError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetNumberError005", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExtGetNumberError005", '17100014', 114730, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExtGetBooleanError001
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETBOOLEAN_0100
     * @tc.desc   test WebMessageExtGetNumber error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExtGetBooleanError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetBooleanError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExtGetBooleanError001", '17100014', 114740, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExtGetBooleanError002
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETBOOLEAN_0200
     * @tc.desc   test WebMessageExtGetNumber error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExtGetBooleanError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetBooleanError002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExtGetBooleanError002", '17100014', 114750, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExtGetBooleanError003
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETBOOLEAN_0300
     * @tc.desc   test WebMessageExtGetNumber error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExtGetBooleanError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetBooleanError003", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExtGetBooleanError003", '17100014', 114760, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExtGetBooleanError004
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETBOOLEAN_0400
     * @tc.desc   test WebMessageExtGetNumber error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExtGetBooleanError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetBooleanError004", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExtGetBooleanError004", '17100014', 114770, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExtGetBooleanError005
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETBOOLEAN_0500
     * @tc.desc   test WebMessageExtGetNumber error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExtGetBooleanError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetBooleanError005", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExtGetBooleanError005", '17100014', 114780, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExGetArrayBufferError001
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETARRAYBUFFER_0100
     * @tc.desc   test WebMessageExGetArrayBuffer error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExGetArrayBufferError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetArrayBufferError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExGetArrayBufferError001", '17100014', 114790, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExGetArrayBufferError002
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETARRAYBUFFER_0200
     * @tc.desc   test WebMessageExGetArrayBuffer error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExGetArrayBufferError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetArrayBufferError002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExGetArrayBufferError002", '17100014', 114800, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExGetArrayBufferError003
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETARRAYBUFFER_0300
     * @tc.desc   test WebMessageExGetArrayBuffer error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExGetArrayBufferError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetArrayBufferError003", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExGetArrayBufferError003", '17100014', 114810, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExGetArrayBufferError004
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETARRAYBUFFER_0400
     * @tc.desc   test WebMessageExGetArrayBuffer error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExGetArrayBufferError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetArrayBufferError004", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExGetArrayBufferError004", '17100014', 114820, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExGetArrayBufferError005
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETARRAYBUFFER_0500
     * @tc.desc   test WebMessageExGetArrayBuffer error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExGetArrayBufferError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetArrayBufferError005", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExGetArrayBufferError005", '17100014', 114830, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExGetArrayError001
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETARRAY_0100
     * @tc.desc   test WebMessageExGetArray error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExGetArrayError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetArrayError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExGetArrayError001", '17100014', 114840, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExGetArrayError002
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETARRAY_0200
     * @tc.desc   test WebMessageExGetArray error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExGetArrayError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetArrayError002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExGetArrayError002", '17100014', 114850, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExGetArrayError003
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETARRAY_0300
     * @tc.desc   test WebMessageExGetArray error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExGetArrayError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetArrayError003", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExGetArrayError003", '17100014', 114860, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExGetArrayError004
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETARRAY_0400
     * @tc.desc   test WebMessageExGetArray error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExGetArrayError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetArrayError004", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExGetArrayError004", '17100014', 114870, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExGetArrayError005
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETARRAY_0500
     * @tc.desc   test WebMessageExGetArray error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExGetArrayError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetArrayError005", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExGetArrayError005", '17100014', 114880, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })


    /**
     * @tc.name   testWebMessageExGetErrorError001
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETERROR_0100
     * @tc.desc   test WebMessageExGetArray error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExGetErrorError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetErrorError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExGetErrorError001", '17100014', 114890, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExGetErrorError002
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETERROR_0200
     * @tc.desc   test WebMessageExGetArray error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExGetErrorError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetErrorError002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExGetErrorError002", '17100014', 114900, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExGetErrorError003
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETERROR_0300
     * @tc.desc   test WebMessageExGetArray error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExGetErrorError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetErrorError003", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExGetErrorError003", '17100014', 114910, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExGetErrorError004
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETERROR_0400
     * @tc.desc   test WebMessageExGetArray error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExGetErrorError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetErrorError004", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExGetErrorError004", '17100014', 114920, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })

    /**
     * @tc.name   testWebMessageExGetErrorError005
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETERROR_0500
     * @tc.desc   test WebMessageExGetArray error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExGetErrorError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetErrorError005", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessageExGetErrorError005", '17100014', 114930, done);
      await Utils.waitAndClickComponent(driver, "webMessageExtErrorCodeButton");
    })
  })
}