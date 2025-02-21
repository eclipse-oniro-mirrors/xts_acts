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

import { afterEach, beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function webCookieManagerErrorCode() {

  describe('WebCookieManagerErrorCodeTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/webCookieManagerErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webCookieManagerErrorCode state success " + JSON.stringify(pages));
        if (!("webCookieManagerErrorCode" == pages.name)) {
          console.info("get webCookieManagerErrorCode state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webCookieManagerErrorCode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webCookieManagerErrorCode page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      console.info("webCookieManagerErrorCode beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebCookieManagerErrorCodeTestSuite afterEach start");
      await Utils.sleep(2000);
      console.info("WebCookieManagerErrorCodeTestSuite afterEach end");
      done();
    })

    /*
     * @tc.number     : SUB_WEB_ERRORCODE_GETCOOKIE_0100
     * @tc.name       : testGetCookieError001
     * @tc.desc       : test getCookie error
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetCookieError001', 0, async (done: Function) => {
      Utils.emitEvent("testGetCookieError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetCookieError001", '17100002', 20070, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETCOOKIE_0200
    * @tc.name       : testGetCookieError002
    * @tc.desc       : test getCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetCookieError002', 0, async (done: Function) => {
      Utils.emitEvent("testGetCookieError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetCookieError002", '17100002', 20071, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETCOOKIE_0300
    * @tc.name       : testGetCookieError003
    * @tc.desc       : test getCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetCookieError003', 0, async (done: Function) => {
      Utils.emitEvent("testGetCookieError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetCookieError003", '17100002', 20072, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETCOOKIE_0400
    * @tc.name       : testGetCookieError004
    * @tc.desc       : test getCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetCookieError004', 0, async (done: Function) => {
      Utils.emitEvent("testGetCookieError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetCookieError004", '17100002', 20073, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_SETCOOKIE_0100
    * @tc.name       : testSetCookieError001
    * @tc.desc       : test setCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSetCookieError001', 0, async (done: Function) => {
      Utils.emitEvent("testSetCookieError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetCookieError001", '17100002', 20080, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_SETCOOKIE_0200
    * @tc.name       : testSetCookieError002
    * @tc.desc       : test setCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSetCookieError002', 0, async (done: Function) => {
      Utils.emitEvent("testSetCookieError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetCookieError002", '17100002', 20081, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_SETCOOKIE_0300
    * @tc.name       : testSetCookieError003
    * @tc.desc       : test setCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSetCookieError003', 0, async (done: Function) => {
      Utils.emitEvent("testSetCookieError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetCookieError003", '17100002', 20082, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_SETCOOKIE_0400
    * @tc.name       : testSetCookieError004
    * @tc.desc       : test setCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSetCookieError004', 0, async (done: Function) => {
      Utils.emitEvent("testSetCookieError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetCookieError004", '17100005', 20083, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_SETCOOKIE_0500
    * @tc.name       : testSetCookieError005
    * @tc.desc       : test setCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSetCookieError005', 0, async (done: Function) => {
      Utils.emitEvent("testSetCookieError005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetCookieError005", '17100005', 20084, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_FETCHCOOKIESYNC_0100
    * @tc.name       : testFetchCookieSync001
    * @tc.desc       : test fetchCookieSync error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testFetchCookieSync001', 0, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync001", '17100002', 5000, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_FETCHCOOKIESYNC_0200
    * @tc.name       : testFetchCookieSync002
    * @tc.desc       : test fetchCookieSync error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testFetchCookieSync002', 0, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync002", '17100002', 5001, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_FETCHCOOKIESYNC_0300
    * @tc.name       : testFetchCookieSync003
    * @tc.desc       : test fetchCookieSync error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testFetchCookieSync003', 0, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync003", '17100002', 5002, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_FETCHCOOKIESYNC_0400
    * @tc.name       : testFetchCookieSync004
    * @tc.desc       : test fetchCookieSync error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testFetchCookieSync004', 0, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync004", '17100002', 5003, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_FETCHCOOKIE_0100
    * @tc.name       : testFetchCookie001
    * @tc.desc       : test fetchCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testFetchCookie001', 0, async (done: Function) => {
      Utils.emitEvent("testFetchCookie001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie001", '17100002', 5004, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_FETCHCOOKIE_0200
    * @tc.name       : testFetchCookie002
    * @tc.desc       : test fetchCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testFetchCookie002', 0, async (done: Function) => {
      Utils.emitEvent("testFetchCookie002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie002", '17100002', 5005, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_FETCHCOOKIE_0300
    * @tc.name       : testFetchCookie003
    * @tc.desc       : test fetchCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testFetchCookie003', 0, async (done: Function) => {
      Utils.emitEvent("testFetchCookie003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie003", '17100002', 5006, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_FETCHCOOKIE_0400
    * @tc.name       : testFetchCookie004
    * @tc.desc       : test fetchCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testFetchCookie004', 0, async (done: Function) => {
      Utils.emitEvent("testFetchCookie004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie004", '17100002', 5007, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_FETCHCOOKIE_0500
    * @tc.name       : testFetchCookie005
    * @tc.desc       : test fetchCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testFetchCookie005', 0, async (done: Function) => {
      Utils.emitEvent("testFetchCookie005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie005", '17100002', 5008, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_FETCHCOOKIE_0600
    * @tc.name       : testFetchCookie006
    * @tc.desc       : test fetchCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testFetchCookie006', 0, async (done: Function) => {
      Utils.emitEvent("testFetchCookie006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie006", '17100002', 5009, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_FETCHCOOKIE_0700
    * @tc.name       : testFetchCookie007
    * @tc.desc       : test fetchCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testFetchCookie007', 0, async (done: Function) => {
      Utils.emitEvent("testFetchCookie007", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie007", '17100002', 5010, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_FETCHCOOKIE_0800
    * @tc.name       : testFetchCookie008
    * @tc.desc       : test fetchCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testFetchCookie008', 0, async (done: Function) => {
      Utils.emitEvent("testFetchCookie008", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie008", '17100002', 5011, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_CONFIGCOOKIESYNC_0100
    * @tc.name       : testConfigCookieSync001
    * @tc.desc       : test configCookieSync error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testConfigCookieSync001', 0, async (done: Function) => {
      Utils.emitEvent("testConfigCookieSync001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookieSync001", '17100002', 5012, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_CONFIGCOOKIESYNC_0200
    * @tc.name       : testConfigCookieSync002
    * @tc.desc       : test configCookieSync error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testConfigCookieSync002', 0, async (done: Function) => {
      Utils.emitEvent("testConfigCookieSync002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookieSync002", '17100002', 5013, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_CONFIGCOOKIESYNC_0300
    * @tc.name       : testConfigCookieSync003
    * @tc.desc       : test configCookieSync error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testConfigCookieSync003', 0, async (done: Function) => {
      Utils.emitEvent("testConfigCookieSync003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookieSync003", '17100002', 5014, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_CONFIGCOOKIESYNC_0400
    * @tc.name       : testConfigCookieSync004
    * @tc.desc       : test configCookieSync error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testConfigCookieSync004', 0, async (done: Function) => {
      Utils.emitEvent("testConfigCookieSync004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookieSync004", '17100002', 5015, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_CONFIGCOOKIESYNC_0500
    * @tc.name       : testConfigCookieSync005
    * @tc.desc       : test configCookieSync error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testConfigCookieSync005', 0, async (done: Function) => {
      Utils.emitEvent("testConfigCookieSync005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookieSync005", '17100005', 5016, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_CONFIGCOOKIE_0100
    * @tc.name       : testConfigCookie001
    * @tc.desc       : test configCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testConfigCookie001', 0, async (done: Function) => {
      Utils.emitEvent("testConfigCookie001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookie001", '17100002', 5017, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_CONFIGCOOKIE_0200
    * @tc.name       : testConfigCookie002
    * @tc.desc       : test configCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testConfigCookie002', 0, async (done: Function) => {
      Utils.emitEvent("testConfigCookie002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookie002", '17100002', 5018, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_CONFIGCOOKIE_0300
    * @tc.name       : testConfigCookie003
    * @tc.desc       : test configCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testConfigCookie003', 0, async (done: Function) => {
      Utils.emitEvent("testConfigCookie003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookie003", '17100002', 5019, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_CONFIGCOOKIE_0400
    * @tc.name       : testConfigCookie004
    * @tc.desc       : test configCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testConfigCookie004', 0, async (done: Function) => {
      Utils.emitEvent("testConfigCookie004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookie004", '17100002', 5020, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_CONFIGCOOKIE_0500
    * @tc.name       : testConfigCookie005
    * @tc.desc       : test configCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testConfigCookie005', 0, async (done: Function) => {
      Utils.emitEvent("testConfigCookie005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookie005", '17100005', 5021, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_CONFIGCOOKIE_0600
    * @tc.name       : testConfigCookie006
    * @tc.desc       : test configCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testConfigCookie006', 0, async (done: Function) => {
      Utils.emitEvent("testConfigCookie006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookie006", '17100002', 5022, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_CONFIGCOOKIE_0700
    * @tc.name       : testConfigCookie007
    * @tc.desc       : test configCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testConfigCookie007', 0, async (done: Function) => {
      Utils.emitEvent("testConfigCookie007", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookie007", '17100002', 5023, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_CONFIGCOOKIE_0800
    * @tc.name       : testConfigCookie008
    * @tc.desc       : test configCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testConfigCookie008', 0, async (done: Function) => {
      Utils.emitEvent("testConfigCookie008", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookie008", '17100002', 5024, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_CONFIGCOOKIE_0900
    * @tc.name       : testConfigCookie009
    * @tc.desc       : test configCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testConfigCookie009', 0, async (done: Function) => {
      Utils.emitEvent("testConfigCookie009", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookie009", '17100002', 5025, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_CONFIGCOOKIE_1000
    * @tc.name       : testConfigCookie010
    * @tc.desc       : test configCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testConfigCookie010', 0, async (done: Function) => {
      Utils.emitEvent("testConfigCookie010", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConfigCookie010", '17100005', 5026, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

  })
}
