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
     * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_7700
     * @tc.name       testGetCookieInitErr
     * @tc.desc       test interface of getCookie with wrong format url
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testGetCookieInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetCookieInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetCookieInitErr", "17100002", 110020, null);
      Utils.registerEvent("testGetCookieInitErr", "URL error. No valid cookie found for the specified URL.", 110030, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_7800
    * @tc.name       testSetCookieInitErr
    * @tc.desc       test interface of setCookie with wrong format url
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testSetCookieInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitSetCookieInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSetCookieInitErr", "17100002", 110040, null);
      Utils.registerEvent("testSetCookieInitErr", "URL error. No valid cookie found for the specified URL.", 110050, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_7900
    * @tc.name       testSetCookieValueErr
    * @tc.desc       test interface of setCookie with unsupported url value type
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testSetCookieValueErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitSetCookieValueErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSetCookieValueErr", "17100005", 110060, null);
      Utils.registerEvent("testSetCookieValueErr", "The provided cookie value is invalid. It must follow the format specified in RFC 6265.", 110070, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_8000
    * @tc.name       testDeleteOriginValueNullErr
    * @tc.desc       test interface of deleteOrigin with origin null
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testDeleteOriginValueNullErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitDeleteOriginValueNullErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testDeleteOriginValueNullErr", "17100011", 110080, null);
      Utils.registerEvent("testDeleteOriginValueNullErr", "Invalid origin.The origin format must follow defined in RFC 6454.", 110090, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_8100
    * @tc.name       testDeleteOriginValueIllegalErr
    * @tc.desc       test interface of deleteOrigin with origin illegal
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testDeleteOriginValueIllegalErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitDeleteOriginValueIllegalErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testDeleteOriginValueIllegalErr", "17100011", 110100, null);
      Utils.registerEvent("testDeleteOriginValueIllegalErr", "Invalid origin.The origin format must follow defined in RFC 6454.", 110110, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_8200
    * @tc.name       testDeleteOriginValueErr
    * @tc.desc       test interface of deleteOrigin with origin wrong
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testDeleteOriginValueErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitDeleteOriginValueErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testDeleteOriginValueErr", "17100011", 110120, null);
      Utils.registerEvent("testDeleteOriginValueErr", "Invalid origin.The origin format must follow defined in RFC 6454.", 110130, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_8300
    * @tc.name       testGetOriginsCallbackUnAPIErr
    * @tc.desc       test interface of getOrigins (callback) with no using JS database API
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testGetOriginsCallbackUnAPIErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetOriginsCallbackUnAPIErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginsCallbackUnAPIErr", 17100012, 110140, null);
      Utils.registerEvent("testGetOriginsCallbackUnAPIErr", "Invalid web storage origin.The web storage origin is empty.", 110150, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_8400
    * @tc.name       testGetOriginsPromiseUnAPIErr
    * @tc.desc       test interface of getOrigins (promise) with no using JS database API
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testGetOriginsPromiseUnAPIErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetOriginsPromiseUnAPIErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginsPromiseUnAPIErr", 17100012, 110160, null);
      Utils.registerEvent("testGetOriginsPromiseUnAPIErr", "Invalid web storage origin.The web storage origin is empty.", 110170, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_8500
    * @tc.name       testGetOriginQuotaCallbackValueErr
    * @tc.desc       test interface of getOriginQuota (callback) with origin wrong
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testGetOriginQuotaCallbackValueErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetOriginQuotaCallbackValueErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginQuotaCallbackValueErr", 17100011, 110180, null);
      Utils.registerEvent("testGetOriginQuotaCallbackValueErr", "Invalid origin.The origin format must follow defined in RFC 6454.", 110190, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_8600
    * @tc.name       testGetOriginQuotaCallbackValueIllegalErr
    * @tc.desc       test interface of getOriginQuota (callback) with origin illegal
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testGetOriginQuotaCallbackValueIllegalErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetOriginQuotaCallbackValueIllegalErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginQuotaCallbackValueIllegalErr", 17100011, 110200, null);
      Utils.registerEvent("testGetOriginQuotaCallbackValueIllegalErr", "Invalid origin.The origin format must follow defined in RFC 6454.", 110210, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_8700
    * @tc.name       testGetOriginQuotaCallbackValueNullErr
    * @tc.desc       test interface of getOriginQuota (callback) with origin null
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testGetOriginQuotaCallbackValueNullErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetOriginQuotaCallbackValueNullErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginQuotaCallbackValueNullErr", 17100011, 110220, null);
      Utils.registerEvent("testGetOriginQuotaCallbackValueNullErr", "Invalid origin.The origin format must follow defined in RFC 6454.", 110230, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_8800
    * @tc.name       testGetOriginQuotaPromiseValueErr
    * @tc.desc       test interface of getOriginQuota (promise) with origin wrong
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testGetOriginQuotaPromiseValueErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetOriginQuotaPromiseValueErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginQuotaPromiseValueErr", 17100011, 110240, null);
      Utils.registerEvent("testGetOriginQuotaPromiseValueErr", "Invalid origin.The origin format must follow defined in RFC 6454.", 110250, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_8900
    * @tc.name       testGetOriginQuotaPromiseValueIllegalErr
    * @tc.desc       test interface of getOriginQuota (promise) with origin illegal
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testGetOriginQuotaPromiseValueIllegalErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetOriginQuotaPromiseValueIllegalErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginQuotaPromiseValueIllegalErr", 17100011, 110260, null);
      Utils.registerEvent("testGetOriginQuotaPromiseValueIllegalErr", "Invalid origin.The origin format must follow defined in RFC 6454.", 110270, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_9000
    * @tc.name       testGetOriginQuotaPromiseValueNullErr
    * @tc.desc       test interface of getOriginQuota (promise) with origin null
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testGetOriginQuotaPromiseValueNullErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetOriginQuotaPromiseValueNullErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginQuotaPromiseValueNullErr", 17100011, 110280, null);
      Utils.registerEvent("testGetOriginQuotaPromiseValueNullErr", "Invalid origin.The origin format must follow defined in RFC 6454.", 110290, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_9100
    * @tc.name       testGetOriginUsageCallbackValueErr
    * @tc.desc       test interface of getOriginUsage (callback) with origin wrong
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testGetOriginUsageCallbackValueErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetOriginUsageCallbackValueErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginUsageCallbackValueErr", 17100011, 110300, null);
      Utils.registerEvent("testGetOriginUsageCallbackValueErr", "Invalid origin.The origin format must follow defined in RFC 6454.", 110310, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_9200
    * @tc.name       testGetOriginUsageCallbackValueIllegalErr
    * @tc.desc       test interface of getOriginUsage (callback) with origin illegal
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testGetOriginUsageCallbackValueIllegalErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetOriginUsageCallbackValueIllegalErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginUsageCallbackValueIllegalErr", 17100011, 110320, null);
      Utils.registerEvent("testGetOriginUsageCallbackValueIllegalErr", "Invalid origin.The origin format must follow defined in RFC 6454.", 110330, done);
      Utils.waitAndClickComponent(driver, "webViewContCookieToGeoLocationError");
    })
  })
}