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
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 113550;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webCookieManagerErrorCode() {

  describe('WebCookieManagerErrorCodeTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webCookieManagerErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webCookieManagerErrorCode state success " + JSON.stringify(pages));
        if (!("webCookieManagerErrorCode" == pages.name)) {
          console.info("get webCookieManagerErrorCode state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webCookieManagerErrorCode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webCookieManagerErrorCode page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebCookieManagerErrorCodeButton"), 10000);
      console.log("waitForComponent WebCookieManagerErrorCodeButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webCookieManagerErrorCode beforeEach start");
      done();
    })

    /**
     * @tc.name   testGetCookieError001
     * @tc.number SUB_WEB_ERRORCODE_GETCOOKIE_0100
     * @tc.desc   test getCookie error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetCookieError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetCookieError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetCookieError001", '17100002', 113560, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testGetCookieError002
     * @tc.number SUB_WEB_ERRORCODE_GETCOOKIE_0200
     * @tc.desc   test getCookie error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetCookieError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetCookieError002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetCookieError002", '17100002', 113570, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testGetCookieError003
     * @tc.number SUB_WEB_ERRORCODE_GETCOOKIE_0300
     * @tc.desc   test getCookie error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetCookieError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetCookieError003", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetCookieError003", '17100002', 113580, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testGetCookieError004
     * @tc.number SUB_WEB_ERRORCODE_GETCOOKIE_0400
     * @tc.desc   test getCookie error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetCookieError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetCookieError004", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetCookieError004", '17100002', 113590, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testSetCookieError001
     * @tc.number SUB_WEB_ERRORCODE_SETCOOKIE_0100
     * @tc.desc   test setCookie error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetCookieError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testSetCookieError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSetCookieError001", '17100002', 113600, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testSetCookieError002
     * @tc.number SUB_WEB_ERRORCODE_SETCOOKIE_0200
     * @tc.desc   test setCookie error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetCookieError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testSetCookieError002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSetCookieError002", '17100002', 113610, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testSetCookieError003
     * @tc.number SUB_WEB_ERRORCODE_SETCOOKIE_0300
     * @tc.desc   test setCookie error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetCookieError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testSetCookieError003", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSetCookieError003", '17100002', 113620, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testSetCookieError004
     * @tc.number SUB_WEB_ERRORCODE_SETCOOKIE_0400
     * @tc.desc   test setCookie error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetCookieError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testSetCookieError004", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSetCookieError004", '17100005', 113630, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testSetCookieError005
     * @tc.number SUB_WEB_ERRORCODE_SETCOOKIE_0500
     * @tc.desc   test setCookie error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetCookieError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testSetCookieError005", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSetCookieError005", '17100005', 113640, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testFetchCookieSync001
     * @tc.number SUB_WEB_ERRORCODE_FETCHCOOKIESYNC_0100
     * @tc.desc   test fetchCookieSync error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookieSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testFetchCookieSync001", '17100002', 113650, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testFetchCookieSync002
     * @tc.number SUB_WEB_ERRORCODE_FETCHCOOKIESYNC_0200
     * @tc.desc   test fetchCookieSync error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookieSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testFetchCookieSync002", '17100002', 113660, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testFetchCookieSync003
     * @tc.number SUB_WEB_ERRORCODE_FETCHCOOKIESYNC_0300
     * @tc.desc   test fetchCookieSync error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookieSync003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync003", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testFetchCookieSync003", '17100002', 113670, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testFetchCookieSync004
     * @tc.number SUB_WEB_ERRORCODE_FETCHCOOKIESYNC_0400
     * @tc.desc   test fetchCookieSync error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookieSync004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync004", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testFetchCookieSync004", '17100002', 113680, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testFetchCookie001
     * @tc.number SUB_WEB_ERRORCODE_FETCHCOOKIE_0100
     * @tc.desc   test fetchCookie error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookie001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testFetchCookie001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testFetchCookie001", '17100002URL error. No valid cookie found for the specified URL.', 113690, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testFetchCookie002
     * @tc.number SUB_WEB_ERRORCODE_FETCHCOOKIE_0200
     * @tc.desc   test fetchCookie error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookie002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testFetchCookie002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testFetchCookie002", '17100002URL error. No valid cookie found for the specified URL.', 113700, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testFetchCookie003
     * @tc.number SUB_WEB_ERRORCODE_FETCHCOOKIE_0300
     * @tc.desc   test fetchCookie error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookie003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testFetchCookie003", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testFetchCookie003", '17100002URL error. No valid cookie found for the specified URL.', 113710, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testFetchCookie004
     * @tc.number SUB_WEB_ERRORCODE_FETCHCOOKIE_0400
     * @tc.desc   test fetchCookie error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookie004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testFetchCookie004", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testFetchCookie004", '17100002URL error. No valid cookie found for the specified URL.', 113720, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testFetchCookie005
     * @tc.number SUB_WEB_ERRORCODE_FETCHCOOKIE_0500
     * @tc.desc   test fetchCookie error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookie005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testFetchCookie005", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testFetchCookie005", '17100002URL error. No valid cookie found for the specified URL.', 113730, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testFetchCookie006
     * @tc.number SUB_WEB_ERRORCODE_FETCHCOOKIE_0600
     * @tc.desc   test fetchCookie error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookie006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testFetchCookie006", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testFetchCookie006", '17100002URL error. No valid cookie found for the specified URL.', 113740, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testFetchCookie007
     * @tc.number SUB_WEB_ERRORCODE_FETCHCOOKIE_0700
     * @tc.desc   test fetchCookie error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookie007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testFetchCookie007", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testFetchCookie007", '17100002URL error. No valid cookie found for the specified URL.', 113750, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testFetchCookie008
     * @tc.number SUB_WEB_ERRORCODE_FETCHCOOKIE_0800
     * @tc.desc   test fetchCookie error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookie008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testFetchCookie008", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testFetchCookie008", '17100002URL error. No valid cookie found for the specified URL.', 113760, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testConfigCookieSync001
     * @tc.number SUB_WEB_ERRORCODE_CONFIGCOOKIESYNC_0100
     * @tc.desc   test configCookieSync error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testConfigCookieSync001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testConfigCookieSync001", '17100002', 113770, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testConfigCookieSync002
     * @tc.number SUB_WEB_ERRORCODE_CONFIGCOOKIESYNC_0200
     * @tc.desc   test configCookieSync error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testConfigCookieSync002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testConfigCookieSync002", '17100002', 113780, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testConfigCookieSync003
     * @tc.number SUB_WEB_ERRORCODE_CONFIGCOOKIESYNC_0300
     * @tc.desc   test configCookieSync error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testConfigCookieSync003", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testConfigCookieSync003", '17100002', 113790, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testConfigCookieSync004
     * @tc.number SUB_WEB_ERRORCODE_CONFIGCOOKIESYNC_0400
     * @tc.desc   test configCookieSync error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testConfigCookieSync004", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testConfigCookieSync004", '17100002', 113800, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testConfigCookieSync005
     * @tc.number SUB_WEB_ERRORCODE_CONFIGCOOKIESYNC_0500
     * @tc.desc   test configCookieSync error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testConfigCookieSync005", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testConfigCookieSync005", '17100005', 113810, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testConfigCookie001
     * @tc.number SUB_WEB_ERRORCODE_CONFIGCOOKIE_0100
     * @tc.desc   test configCookie error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookie001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testConfigCookie001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testConfigCookie001", '17100002URL error. No valid cookie found for the specified URL.', 113820, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testConfigCookie002
     * @tc.number SUB_WEB_ERRORCODE_CONFIGCOOKIE_0200
     * @tc.desc   test configCookie error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookie002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testConfigCookie002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testConfigCookie002", '17100002URL error. No valid cookie found for the specified URL.', 113830, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testConfigCookie003
     * @tc.number SUB_WEB_ERRORCODE_CONFIGCOOKIE_0300
     * @tc.desc   test configCookie error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookie003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testConfigCookie003", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testConfigCookie003", '17100002URL error. No valid cookie found for the specified URL.', 113840, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testConfigCookie004
     * @tc.number SUB_WEB_ERRORCODE_CONFIGCOOKIE_0400
     * @tc.desc   test configCookie error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookie004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testConfigCookie004", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testConfigCookie004", '17100002URL error. No valid cookie found for the specified URL.', 113850, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testConfigCookie005
     * @tc.number SUB_WEB_ERRORCODE_CONFIGCOOKIE_0500
     * @tc.desc   test configCookie error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookie005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testConfigCookie005", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testConfigCookie005", '17100005', 113860, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testConfigCookie006
     * @tc.number SUB_WEB_ERRORCODE_CONFIGCOOKIE_0600
     * @tc.desc   test configCookie error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookie006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testConfigCookie006", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testConfigCookie006", '17100002URL error. No valid cookie found for the specified URL.', 113870, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testConfigCookie007
     * @tc.number SUB_WEB_ERRORCODE_CONFIGCOOKIE_0700
     * @tc.desc   test configCookie error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookie007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testConfigCookie007", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testConfigCookie007", '17100002URL error. No valid cookie found for the specified URL.', 113880, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testConfigCookie008
     * @tc.number SUB_WEB_ERRORCODE_CONFIGCOOKIE_0800
     * @tc.desc   test configCookie error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookie008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testConfigCookie008", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testConfigCookie008", '17100002URL error. No valid cookie found for the specified URL.', 113890, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testConfigCookie009
     * @tc.number SUB_WEB_ERRORCODE_CONFIGCOOKIE_0900
     * @tc.desc   test configCookie error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookie009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testConfigCookie009", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testConfigCookie009", '17100002URL error. No valid cookie found for the specified URL.', 113900, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testConfigCookie010
     * @tc.number SUB_WEB_ERRORCODE_CONFIGCOOKIE_1000
     * @tc.desc   test configCookie error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookie010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testConfigCookie010", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testConfigCookie010", '17100005', 113910, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })
  })
}