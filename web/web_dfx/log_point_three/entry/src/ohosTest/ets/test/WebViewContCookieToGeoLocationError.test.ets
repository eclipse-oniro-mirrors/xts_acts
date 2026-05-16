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
import { describe, beforeEach, it, beforeAll , TestType, Size, Level } from "@ohos/hypium";
import Utils from './Utils.test';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const EVENT_ID_SET_EMIT_KEY = 110010;
const driver = Driver.create();
let emitKey = "";

export default function webViewContCookieToGeoLocationError() {
  describe('ActsAceWebDevWebViewContCookieToGeoLocationErrorTest', () => {
    beforeAll(async (done: Function) => {
      await driver.waitForComponent(ON.id("webViewContCookieToGeoLocationError"), 10000);
      console.log('waitForComponent webViewContCookieToGeoLocationError');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webViewContCookieToGeoLocationError beforeEach start');
      done();
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_9300
    * @tc.name       testGetOriginUsageCallbackValueNullErr
    * @tc.desc       test interface of getOriginUsage (callback) with origin null
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testGetOriginUsageCallbackValueNullErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetOriginUsageCallbackValueNullErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginUsageCallbackValueNullErr", 17100011, 110340, null);
      Utils.registerEvent("testGetOriginUsageCallbackValueNullErr", "Invalid origin.The origin format must follow defined in RFC 6454.", 110350, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_9400
    * @tc.name       testGetOriginUsagePromiseValueErr
    * @tc.desc       test interface of getOriginUsage (promise) with origin wrong
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testGetOriginUsagePromiseValueErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetOriginUsagePromiseValueErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginUsagePromiseValueErr", 17100011, 110360, null);
      Utils.registerEvent("testGetOriginUsagePromiseValueErr", "Invalid origin.The origin format must follow defined in RFC 6454.", 110370, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_9500
    * @tc.name       testGetOriginUsagePromiseValueIllegalErr
    * @tc.desc       test interface of getOriginUsage (promise) with origin illegal
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testGetOriginUsagePromiseValueIllegalErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetOriginUsagePromiseValueIllegalErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginUsagePromiseValueIllegalErr", 17100011, 110380, null);
      Utils.registerEvent("testGetOriginUsagePromiseValueIllegalErr", "Invalid origin.The origin format must follow defined in RFC 6454.", 110390, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_9600
    * @tc.name       testGetOriginUsagePromiseValueNullErr
    * @tc.desc       test interface of getOriginUsage (promise) with origin null
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testGetOriginUsagePromiseValueNullErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetOriginUsagePromiseValueNullErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginUsagePromiseValueNullErr", 17100011, 110400, null);
      Utils.registerEvent("testGetOriginUsagePromiseValueNullErr", "Invalid origin.The origin format must follow defined in RFC 6454.", 110410, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_9700
    * @tc.name       testAllowGeolocationValueErr
    * @tc.desc       test interface of allowGeolocation with origin wrong
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testAllowGeolocationValueErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitAllowGeolocationValueErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testAllowGeolocationValueErr", "17100011", 110420, null);
      Utils.registerEvent("testAllowGeolocationValueErr", "Invalid origin.The origin format must follow defined in RFC 6454.", 110430, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_9800
    * @tc.name       testAllowGeolocationValueIllegalErr
    * @tc.desc       test interface of allowGeolocation with origin illegal
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testAllowGeolocationValueIllegalErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitAllowGeolocationValueIllegalErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testAllowGeolocationValueIllegalErr", "17100011", 110440, null);
      Utils.registerEvent("testAllowGeolocationValueIllegalErr", "Invalid origin.The origin format must follow defined in RFC 6454.", 110450, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_9900
    * @tc.name       testAllowGeolocationValueNullErr
    * @tc.desc       test interface of allowGeolocation with origin null
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testAllowGeolocationValueNullErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitAllowGeolocationValueNullErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testAllowGeolocationValueNullErr", "17100011", 110460, null);
      Utils.registerEvent("testAllowGeolocationValueNullErr", "Invalid origin.The origin format must follow defined in RFC 6454.", 110470, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_0100
    * @tc.name       testDeleteGeolocationValueErr
    * @tc.desc       test interface of deleteGeolocation with origin wrong
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testDeleteGeolocationValueErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitDeleteGeolocationValueErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testDeleteGeolocationValueErr", "17100011", 110480, null);
      Utils.registerEvent("testDeleteGeolocationValueErr", "Invalid origin.The origin format must follow defined in RFC 6454.", 110490, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_0200
    * @tc.name       testDeleteGeolocationValueIllegalErr
    * @tc.desc       test interface of deleteGeolocation with origin illegal
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testDeleteGeolocationValueIllegalErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitDeleteGeolocationValueIllegalErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testDeleteGeolocationValueIllegalErr", "17100011", 110500, null);
      Utils.registerEvent("testDeleteGeolocationValueIllegalErr", "Invalid origin.The origin format must follow defined in RFC 6454.", 110510, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_0300
    * @tc.name       testDeleteGeolocationValueNullErr
    * @tc.desc       test interface of deleteGeolocation with origin null
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testDeleteGeolocationValueNullErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitDeleteGeolocationValueNullErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testDeleteGeolocationValueNullErr", "17100011", 110520, null);
      Utils.registerEvent("testDeleteGeolocationValueNullErr", "Invalid origin.The origin format must follow defined in RFC 6454.", 110530, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_0400
    * @tc.name       testGetAccessibleGeolocationCallbackValueErr
    * @tc.desc       test interface of getAccessibleGeolocation (callback) with origin wrong
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testGetAccessibleGeolocationCallbackValueErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetAccessibleGeolocationCallbackValueErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetAccessibleGeolocationCallbackValueErr", 17100011, 110540, null);
      Utils.registerEvent("testGetAccessibleGeolocationCallbackValueErr", "Invalid origin.The origin format must follow defined in RFC 6454.", 110550, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_0500
    * @tc.name       testGetAccessibleGeolocationCallbackValueIllegalErr
    * @tc.desc       test interface of getAccessibleGeolocation (callback) with origin illegal
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testGetAccessibleGeolocationCallbackValueIllegalErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetAccessibleGeolocationCallbackValueIllegalErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetAccessibleGeolocationCallbackValueIllegalErr", 17100011, 110560, null);
      Utils.registerEvent("testGetAccessibleGeolocationCallbackValueIllegalErr", "Invalid origin.The origin format must follow defined in RFC 6454.", 110570, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_0600
    * @tc.name       testGetAccessibleGeolocationCallbackValueNullErr
    * @tc.desc       test interface of getAccessibleGeolocation (callback) with origin null
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testGetAccessibleGeolocationCallbackValueNullErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetAccessibleGeolocationCallbackValueNullErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetAccessibleGeolocationCallbackValueNullErr", 17100011, 110580, null);
      Utils.registerEvent("testGetAccessibleGeolocationCallbackValueNullErr", "Invalid origin.The origin format must follow defined in RFC 6454.", 110590, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_0700
    * @tc.name       testGetAccessibleGeolocationPromiseValueErr
    * @tc.desc       test interface of getAccessibleGeolocation (promise) with origin wrong
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testGetAccessibleGeolocationPromiseValueErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetAccessibleGeolocationPromiseValueErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetAccessibleGeolocationPromiseValueErr", 17100011, 110600, null);
      Utils.registerEvent("testGetAccessibleGeolocationPromiseValueErr", "Invalid origin.The origin format must follow defined in RFC 6454.", 110610, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_0800
    * @tc.name       testGetAccessibleGeolocationPromiseValueIllegalErr
    * @tc.desc       test interface of getAccessibleGeolocation (promise) with origin illegal
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testGetAccessibleGeolocationPromiseValueIllegalErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetAccessibleGeolocationPromiseValueIllegalErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetAccessibleGeolocationPromiseValueIllegalErr", 17100011, 110620, null);
      Utils.registerEvent("testGetAccessibleGeolocationPromiseValueIllegalErr", "Invalid origin.The origin format must follow defined in RFC 6454.", 110630, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_0900
    * @tc.name       testGetAccessibleGeolocationPromiseValueNullErr
    * @tc.desc       test interface of getAccessibleGeolocation (promise) with origin null
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testGetAccessibleGeolocationPromiseValueNullErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetAccessibleGeolocationPromiseValueNullErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetAccessibleGeolocationPromiseValueNullErr", 17100011, 110640, null);
      Utils.registerEvent("testGetAccessibleGeolocationPromiseValueNullErr", "Invalid origin.The origin format must follow defined in RFC 6454.", 110650, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
  })
}