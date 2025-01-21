/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function webCookieManager() {

  describe('WebCookieManagerTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/webCookieManager',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webCookieManager state success " + JSON.stringify(pages));
        if (!("webCookieManager" == pages.name)) {
          console.info("get webCookieManager state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webCookieManager page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webCookieManager page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("webCookieManager beforeEach start");
      done();
    })


    /*
    * @tc.number     : SUB_WEB_SAVECOOKIEASYNC_0100
    * @tc.name       : testSaveCookieAsync001
    * @tc.desc       : test saveCookieAsync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSaveCookieAsync001', 0, async (done: Function) => {
      Utils.emitEvent("testSaveCookieAsync001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSaveCookieAsync001", "done", 30010, done);
      sendEventByKey('WebCookieManagerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_SAVECOOKIEASYNC_0200
    * @tc.name       : testSaveCookieAsync002
    * @tc.desc       : test saveCookieAsync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSaveCookieAsync002', 0, async (done: Function) => {
      Utils.emitEvent("testSaveCookieAsync002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSaveCookieAsync002", "done", 30011, done);
      sendEventByKey('WebCookieManagerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ISCOOKIEALLOWED_0100
    * @tc.name       : testIsCookieAllowed001
    * @tc.desc       : test isCookieAllowed
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testIsCookieAllowed001', 0, async (done: Function) => {
      Utils.emitEvent("testIsCookieAllowed001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testIsCookieAllowed001", true, 30015, done);
      sendEventByKey('WebCookieManagerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ISCOOKIEALLOWED_0200
    * @tc.name       : testIsCookieAllowed002
    * @tc.desc       : test isCookieAllowed
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testIsCookieAllowed002', 0, async (done: Function) => {
      Utils.emitEvent("testIsCookieAllowed002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testIsCookieAllowed002", false, 30016, done);
      sendEventByKey('WebCookieManagerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ISTHIRDPARTYCOOKIEALLOWED_0100
    * @tc.name       : testIsThirdPartyCookieAllowed001
    * @tc.desc       : test isThirdPartyCookieAllowed
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testIsThirdPartyCookieAllowed001', 0, async (done: Function) => {
      Utils.emitEvent("testIsThirdPartyCookieAllowed001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testIsThirdPartyCookieAllowed001", true, 30025, done);
      sendEventByKey('WebCookieManagerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ISTHIRDPARTYCOOKIEALLOWED_0200
    * @tc.name       : testIsThirdPartyCookieAllowed002
    * @tc.desc       : test isThirdPartyCookieAllowed
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testIsThirdPartyCookieAllowed002', 0, async (done: Function) => {
      Utils.emitEvent("testIsThirdPartyCookieAllowed002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testIsThirdPartyCookieAllowed002", false, 30026, done);
      sendEventByKey('WebCookieManagerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_EXISTCOOKIE_0100
    * @tc.name       : testExistCookie001
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie001', 0, async (done: Function) => {
      Utils.emitEvent("testExistCookie001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie001", true, 30030, done);
      sendEventByKey('WebCookieManagerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_DELETEENTIRECOOKIE_0100
    * @tc.name       : testDeleteEntireCookie001
    * @tc.desc       : test deleteEntireCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testDeleteEntireCookie001', 0, async (done: Function) => {
      Utils.emitEvent("testDeleteEntireCookie001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDeleteEntireCookie001", false, 30031, done);
      sendEventByKey('WebCookieManagerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_PUTACCEPTCOOKIEENABLED_0100
    * @tc.name       : testPutAcceptCookieEnabled001
    * @tc.desc       : test putAcceptCookieEnabled
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPutAcceptCookieEnabled001', 0, async (done: Function) => {
      Utils.emitEvent("testPutAcceptCookieEnabled001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPutAcceptCookieEnabled001", false, 30032, done);
      sendEventByKey('WebCookieManagerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_PUTACCEPTTHIRDPARTYCOOKIEENABLED_0100
    * @tc.name       : testPutAcceptThirdPartyCookieEnabled001
    * @tc.desc       : test putAcceptThirdPartyCookieEnabled
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPutAcceptThirdPartyCookieEnabled001', 0, async (done: Function) => {
      Utils.emitEvent("testPutAcceptThirdPartyCookieEnabled001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPutAcceptThirdPartyCookieEnabled001", false, 30033, done);
      sendEventByKey('WebCookieManagerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_DELETESESSIONCOOKIE_0100
    * @tc.name       : testDeleteSessionCookie001
    * @tc.desc       : test deleteSessionCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testDeleteSessionCookie001', 0, async (done: Function) => {
      Utils.emitEvent("testDeleteSessionCookie001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDeleteSessionCookie001", '', 30034, done);
      sendEventByKey('WebCookieManagerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_GETCOOKIE_0100
    * @tc.name       : testGetCookie001
    * @tc.desc       : test getCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetCookie001', 0, async (done: Function) => {
      Utils.emitEvent("testGetCookie001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetCookie001", 'a=b', 100019, done);
      sendEventByKey('WebCookieManagerButton', 10, '');
    })

  })
}
