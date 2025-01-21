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
import { describe, beforeEach, afterEach, it, expect, beforeAll } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.ets';
import router from '@system.router';

let emitKey = "emitGetCookieInitErr";

export default function webViewContCookieToGeoLocationError() {
  describe('ActsAceWebDevWebViewContCookieToGeoLocationErrorTest', () => {
    beforeAll(async (done: Function) => {
      let options = {
        uri: 'MainAbility/pages/webViewContCookieToGeoLocationError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewContCookieToGeoLocationError state success " + JSON.stringify(pages));
        if (!("webViewContCookieToGeoLocationError" == pages.name)) {
          console.info("get webViewContCookieToGeoLocationError state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webViewContCookieToGeoLocationError page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewContCookieToGeoLocationError page error: " + err);
      }
      done()
    }

    )
    ;
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("webViewContCookieToGeoLocationError beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("webViewContCookieToGeoLocationError afterEach start:" + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        }
        let backEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      done();
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_7700
     *tc.name testGetCookieInitErr
     *tc.desc test interface of getCookie with wrong format url
     */
    it('testGetCookieInitErr', 0, async (done: Function) => {
      emitKey = "emitSetCookieInitErr";
      Utils.registerEvent("testGetCookieInitErr", "17100002", 752, done);
      Utils.registerEvent("testGetCookieInitErr", "Invalid url", 753, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_7800
     *tc.name testSetCookieInitErr
     *tc.desc test interface of setCookie with wrong format url
     */
    it('testSetCookieInitErr', 0, async (done: Function) => {
      emitKey = "emitSetCookieValueErr";
      Utils.registerEvent("testSetCookieInitErr", "17100002", 754, done);
      Utils.registerEvent("testSetCookieInitErr", "Invalid url", 755, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_7900
     *tc.name testSetCookieValueErr
     *tc.desc test interface of setCookie with unsupported url value type
     */
    it('testSetCookieValueErr', 0, async (done: Function) => {
      emitKey = "emitDeleteOriginValueNullErr";
      Utils.registerEvent("testSetCookieValueErr", "17100005", 756, done);
      Utils.registerEvent("testSetCookieValueErr", "Invalid cookie value", 757, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_8000
     *tc.name testDeleteOriginValueNullErr
     *tc.desc test interface of deleteOrigin with origin null
     */
    it('testDeleteOriginValueNullErr', 0, async (done: Function) => {
      emitKey = "emitDeleteOriginValueIllegalErr";
      Utils.registerEvent("testDeleteOriginValueNullErr", "17100011", 758, done);
      Utils.registerEvent("testDeleteOriginValueNullErr", "Invalid origin", 759, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_8100
     *tc.name testDeleteOriginValueIllegalErr
     *tc.desc test interface of deleteOrigin with origin illegal
     */
    it('testDeleteOriginValueIllegalErr', 0, async (done: Function) => {
      emitKey = "emitDeleteOriginValueErr";
      Utils.registerEvent("testDeleteOriginValueIllegalErr", "17100011", 760, done);
      Utils.registerEvent("testDeleteOriginValueIllegalErr", "Invalid origin", 761, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_8200
     *tc.name testDeleteOriginValueErr
     *tc.desc test interface of deleteOrigin with origin wrong
     */
    it('testDeleteOriginValueErr', 0, async (done: Function) => {
      emitKey = "emitGetOriginsCallbackUnAPIErr";
      Utils.registerEvent("testDeleteOriginValueErr", "17100011", 762, done);
      Utils.registerEvent("testDeleteOriginValueErr", "Invalid origin", 763, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_8300
     *tc.name testGetOriginsCallbackUnAPIErr
     *tc.desc test interface of getOrigins (callback) with no using JS database API
     */
    it('testGetOriginsCallbackUnAPIErr', 0, async (done: Function) => {
      emitKey = "emitGetOriginsPromiseUnAPIErr";
      Utils.registerEvent("testGetOriginsCallbackUnAPIErr", 17100012, 764, done);
      Utils.registerEvent("testGetOriginsCallbackUnAPIErr", "Invalid web storage origin", 765, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_8400
     *tc.name testGetOriginsPromiseUnAPIErr
     *tc.desc test interface of getOrigins (promise) with no using JS database API
     */
    it('testGetOriginsPromiseUnAPIErr', 0, async (done: Function) => {
      emitKey = "emitGetOriginQuotaCallbackValueErr";
      Utils.registerEvent("testGetOriginsPromiseUnAPIErr", 17100012, 766, done);
      Utils.registerEvent("testGetOriginsPromiseUnAPIErr", "Invalid web storage origin", 767, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_8500
     *tc.name testGetOriginQuotaCallbackValueErr
     *tc.desc test interface of getOriginQuota (callback) with origin wrong
     */
    it('testGetOriginQuotaCallbackValueErr', 0, async (done: Function) => {
      emitKey = "emitGetOriginQuotaCallbackValueIllegalErr";
      Utils.registerEvent("testGetOriginQuotaCallbackValueErr", 17100011, 768, done);
      Utils.registerEvent("testGetOriginQuotaCallbackValueErr", "Invalid origin", 769, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_8600
     *tc.name testGetOriginQuotaCallbackValueIllegalErr
     *tc.desc test interface of getOriginQuota (callback) with origin illegal
     */
    it('testGetOriginQuotaCallbackValueIllegalErr', 0, async (done: Function) => {
      emitKey = "emitGetOriginQuotaCallbackValueNullErr";
      Utils.registerEvent("testGetOriginQuotaCallbackValueIllegalErr", 17100011, 770, done);
      Utils.registerEvent("testGetOriginQuotaCallbackValueIllegalErr", "Invalid origin", 771, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_8700
     *tc.name testGetOriginQuotaCallbackValueNullErr
     *tc.desc test interface of getOriginQuota (callback) with origin null
     */
    it('testGetOriginQuotaCallbackValueNullErr', 0, async (done: Function) => {
      emitKey = "emitGetOriginQuotaPromiseValueErr";
      Utils.registerEvent("testGetOriginQuotaCallbackValueNullErr", 17100011, 772, done);
      Utils.registerEvent("testGetOriginQuotaCallbackValueNullErr", "Invalid origin", 773, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_8800
     *tc.name testGetOriginQuotaPromiseValueErr
     *tc.desc test interface of getOriginQuota (promise) with origin wrong
     */
    it('testGetOriginQuotaPromiseValueErr', 0, async (done: Function) => {
      emitKey = "emitGetOriginQuotaPromiseValueIllegalErr";
      Utils.registerEvent("testGetOriginQuotaPromiseValueErr", 17100011, 774, done);
      Utils.registerEvent("testGetOriginQuotaPromiseValueErr", "Invalid origin", 775, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_8900
     *tc.name testGetOriginQuotaPromiseValueIllegalErr
     *tc.desc test interface of getOriginQuota (promise) with origin illegal
     */
    it('testGetOriginQuotaPromiseValueIllegalErr', 0, async (done: Function) => {
      emitKey = "emitGetOriginQuotaPromiseValueNullErr";
      Utils.registerEvent("testGetOriginQuotaPromiseValueIllegalErr", 17100011, 776, done);
      Utils.registerEvent("testGetOriginQuotaPromiseValueIllegalErr", "Invalid origin", 777, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_9000
     *tc.name testGetOriginQuotaPromiseValueNullErr
     *tc.desc test interface of getOriginQuota (promise) with origin null
     */
    it('testGetOriginQuotaPromiseValueNullErr', 0, async (done: Function) => {
      emitKey = "emitGetOriginUsageCallbackValueErr";
      Utils.registerEvent("testGetOriginQuotaPromiseValueNullErr", 17100011, 778, done);
      Utils.registerEvent("testGetOriginQuotaPromiseValueNullErr", "Invalid origin", 779, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_9100
     *tc.name testGetOriginUsageCallbackValueErr
     *tc.desc test interface of getOriginUsage (callback) with origin wrong
     */
    it('testGetOriginUsageCallbackValueErr', 0, async (done: Function) => {
      emitKey = "emitGetOriginUsageCallbackValueIllegalErr";
      Utils.registerEvent("testGetOriginUsageCallbackValueErr", 17100011, 780, done);
      Utils.registerEvent("testGetOriginUsageCallbackValueErr", "Invalid origin", 781, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_9200
     *tc.name testGetOriginUsageCallbackValueIllegalErr
     *tc.desc test interface of getOriginUsage (callback) with origin illegal
     */
    it('testGetOriginUsageCallbackValueIllegalErr', 0, async (done: Function) => {
      emitKey = "emitGetOriginUsageCallbackValueNullErr";
      Utils.registerEvent("testGetOriginUsageCallbackValueIllegalErr", 17100011, 782, done);
      Utils.registerEvent("testGetOriginUsageCallbackValueIllegalErr", "Invalid origin", 783, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_9300
     *tc.name testGetOriginUsageCallbackValueNullErr
     *tc.desc test interface of getOriginUsage (callback) with origin null
     */
    it('testGetOriginUsageCallbackValueNullErr', 0, async (done: Function) => {
      emitKey = "emitGetOriginUsagePromiseValueErr";
      Utils.registerEvent("testGetOriginUsageCallbackValueNullErr", 17100011, 784, done);
      Utils.registerEvent("testGetOriginUsageCallbackValueNullErr", "Invalid origin", 785, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_9400
     *tc.name testGetOriginUsagePromiseValueErr
     *tc.desc test interface of getOriginUsage (promise) with origin wrong
     */
    it('testGetOriginUsagePromiseValueErr', 0, async (done: Function) => {
      emitKey = "emitGetOriginUsagePromiseValueIllegalErr";
      Utils.registerEvent("testGetOriginUsagePromiseValueErr", 17100011, 786, done);
      Utils.registerEvent("testGetOriginUsagePromiseValueErr", "Invalid origin", 787, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_9500
     *tc.name testGetOriginUsagePromiseValueIllegalErr
     *tc.desc test interface of getOriginUsage (promise) with origin illegal
     */
    it('testGetOriginUsagePromiseValueIllegalErr', 0, async (done: Function) => {
      emitKey = "emitGetOriginUsagePromiseValueNullErr";
      Utils.registerEvent("testGetOriginUsagePromiseValueIllegalErr", 17100011, 788, done);
      Utils.registerEvent("testGetOriginUsagePromiseValueIllegalErr", "Invalid origin", 789, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_9600
     *tc.name testGetOriginUsagePromiseValueNullErr
     *tc.desc test interface of getOriginUsage (promise) with origin null
     */
    it('testGetOriginUsagePromiseValueNullErr', 0, async (done: Function) => {
      emitKey = "emitAllowGeolocationValueErr";
      Utils.registerEvent("testGetOriginUsagePromiseValueNullErr", 17100011, 790, done);
      Utils.registerEvent("testGetOriginUsagePromiseValueNullErr", "Invalid origin", 791, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_9700
     *tc.name testAllowGeolocationValueErr
     *tc.desc test interface of allowGeolocation with origin wrong
     */
    it('testAllowGeolocationValueErr', 0, async (done: Function) => {
      emitKey = "emitAllowGeolocationValueIllegalErr";
      Utils.registerEvent("testAllowGeolocationValueErr", "17100011", 792, done);
      Utils.registerEvent("testAllowGeolocationValueErr", "Invalid origin", 793, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_9800
     *tc.name testAllowGeolocationValueIllegalErr
     *tc.desc test interface of allowGeolocation with origin illegal
     */
    it('testAllowGeolocationValueIllegalErr', 0, async (done: Function) => {
      emitKey = "emitAllowGeolocationValueNullErr";
      Utils.registerEvent("testAllowGeolocationValueIllegalErr", "17100011", 794, done);
      Utils.registerEvent("testAllowGeolocationValueIllegalErr", "Invalid origin", 795, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_9900
     *tc.name testAllowGeolocationValueNullErr
     *tc.desc test interface of allowGeolocation with origin null
     */
    it('testAllowGeolocationValueNullErr', 0, async (done: Function) => {
      emitKey = "emitDeleteGeolocationValueErr";
      Utils.registerEvent("testAllowGeolocationValueNullErr", "17100011", 796, done);
      Utils.registerEvent("testAllowGeolocationValueNullErr", "Invalid origin", 797, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_0100
     *tc.name testDeleteGeolocationValueErr
     *tc.desc test interface of deleteGeolocation with origin wrong
     */
    it('testDeleteGeolocationValueErr', 0, async (done: Function) => {
      emitKey = "emitDeleteGeolocationValueIllegalErr";
      Utils.registerEvent("testDeleteGeolocationValueErr", "17100011", 798, done);
      Utils.registerEvent("testDeleteGeolocationValueErr", "Invalid origin", 799, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_0200
     *tc.name testDeleteGeolocationValueIllegalErr
     *tc.desc test interface of deleteGeolocation with origin illegal
     */
    it('testDeleteGeolocationValueIllegalErr', 0, async (done: Function) => {
      emitKey = "emitDeleteGeolocationValueNullErr";
      Utils.registerEvent("testDeleteGeolocationValueIllegalErr", "17100011", 800, done);
      Utils.registerEvent("testDeleteGeolocationValueIllegalErr", "Invalid origin", 801, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_0300
     *tc.name testDeleteGeolocationValueNullErr
     *tc.desc test interface of deleteGeolocation with origin null
     */
    it('testDeleteGeolocationValueNullErr', 0, async (done: Function) => {
      emitKey = "emitGetAccessibleGeolocationCallbackValueErr";
      Utils.registerEvent("testDeleteGeolocationValueNullErr", "17100011", 802, done);
      Utils.registerEvent("testDeleteGeolocationValueNullErr", "Invalid origin", 803, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_0400
     *tc.name testGetAccessibleGeolocationCallbackValueErr
     *tc.desc test interface of getAccessibleGeolocation (callback) with origin wrong
     */
    it('testGetAccessibleGeolocationCallbackValueErr', 0, async (done: Function) => {
      emitKey = "emitGetAccessibleGeolocationCallbackValueIllegalErr";
      Utils.registerEvent("testGetAccessibleGeolocationCallbackValueErr", 17100011, 804, done);
      Utils.registerEvent("testGetAccessibleGeolocationCallbackValueErr", "Invalid origin", 805, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_0500
     *tc.name testGetAccessibleGeolocationCallbackValueIllegalErr
     *tc.desc test interface of getAccessibleGeolocation (callback) with origin illegal
     */
    it('testGetAccessibleGeolocationCallbackValueIllegalErr', 0, async (done: Function) => {
      emitKey = "emitGetAccessibleGeolocationCallbackValueNullErr";
      Utils.registerEvent("testGetAccessibleGeolocationCallbackValueIllegalErr", 17100011, 806, done);
      Utils.registerEvent("testGetAccessibleGeolocationCallbackValueIllegalErr", "Invalid origin", 807, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_0600
     *tc.name testGetAccessibleGeolocationCallbackValueNullErr
     *tc.desc test interface of getAccessibleGeolocation (callback) with origin null
     */
    it('testGetAccessibleGeolocationCallbackValueNullErr', 0, async (done: Function) => {
      emitKey = "emitGetAccessibleGeolocationPromiseValueErr";
      Utils.registerEvent("testGetAccessibleGeolocationCallbackValueNullErr", 17100011, 808, done);
      Utils.registerEvent("testGetAccessibleGeolocationCallbackValueNullErr", "Invalid origin", 809, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_0700
     *tc.name testGetAccessibleGeolocationPromiseValueErr
     *tc.desc test interface of getAccessibleGeolocation (promise) with origin wrong
     */
    it('testGetAccessibleGeolocationPromiseValueErr', 0, async (done: Function) => {
      emitKey = "emitGetAccessibleGeolocationPromiseValueIllegalErr";
      Utils.registerEvent("testGetAccessibleGeolocationPromiseValueErr", 17100011, 810, done);
      Utils.registerEvent("testGetAccessibleGeolocationPromiseValueErr", "Invalid origin", 811, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_0800
     *tc.name testGetAccessibleGeolocationPromiseValueIllegalErr
     *tc.desc test interface of getAccessibleGeolocation (promise) with origin illegal
     */
    it('testGetAccessibleGeolocationPromiseValueIllegalErr', 0, async (done: Function) => {
      emitKey = "emitGetAccessibleGeolocationPromiseValueNullErr";
      Utils.registerEvent("testGetAccessibleGeolocationPromiseValueIllegalErr", 17100011, 812, done);
      Utils.registerEvent("testGetAccessibleGeolocationPromiseValueIllegalErr", "Invalid origin", 813, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_0900
     *tc.name testGetAccessibleGeolocationPromiseValueNullErr
     *tc.desc test interface of getAccessibleGeolocation (promise) with origin null
     */
    it('testGetAccessibleGeolocationPromiseValueNullErr', 0, async (done: Function) => {
      emitKey = "emitGetAccessibleGeolocationPromiseValueNullErr";
      Utils.registerEvent("testGetAccessibleGeolocationPromiseValueNullErr", 17100011, 814, done);
      Utils.registerEvent("testGetAccessibleGeolocationPromiseValueNullErr", "Invalid origin", 815, done);
      sendEventByKey('webViewContCookieToGeoLocationError', 10, '');
    })
  })
}