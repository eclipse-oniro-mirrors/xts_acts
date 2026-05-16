/**
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import { waitForComponent } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webCookieManager() {
  describe('WebCookieManagerTestSuite', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webCookieManager',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webCookieManager state success ' + JSON.stringify(pages));
        if (!('webCookieManager' == pages.name)) {
          console.info('get webCookieManager state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webCookieManager page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webCookieManager page error: ' + err);
      }
      await waitForComponent('WebCookieManagerButton');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webCookieManager beforeEach start');
      done();
    })

    /**
     * @tc.name   testSaveCookieAsync001
     * @tc.number SUB_WEB_SAVECOOKIEASYNC_0100
     * @tc.desc   test saveCookieAsync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSaveCookieAsync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testSaveCookieAsync001', 134750)
      Utils.registerEvent('testSaveCookieAsync001', 'done', 134760, done);
      sendEventByKey('WebCookieManagerButton', 10, '');
    })

    /**
     * @tc.name   testSaveCookieAsync002
     * @tc.number SUB_WEB_SAVECOOKIEASYNC_0200
     * @tc.desc   test saveCookieAsync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSaveCookieAsync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testSaveCookieAsync002', 134750)
      Utils.registerEvent('testSaveCookieAsync002', 'done', 134770, done);
      sendEventByKey('WebCookieManagerButton', 10, '');
    })

    /**
     * @tc.name   testIsCookieAllowed001
     * @tc.number SUB_WEB_ISCOOKIEALLOWED_0100
     * @tc.desc   test isCookieAllowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsCookieAllowed001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testIsCookieAllowed001', 134750)
      Utils.registerEvent('testIsCookieAllowed001', true, 134780, done);
      sendEventByKey('WebCookieManagerButton', 10, '');
    })

    /**
     * @tc.name   testIsCookieAllowed002
     * @tc.number SUB_WEB_ISCOOKIEALLOWED_0200
     * @tc.desc   test isCookieAllowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsCookieAllowed002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testIsCookieAllowed002', 134750)
      Utils.registerEvent('testIsCookieAllowed002', false, 134790, done);
      sendEventByKey('WebCookieManagerButton', 10, '');
    })

    /**
     * @tc.name   testIsThirdPartyCookieAllowed001
     * @tc.number SUB_WEB_ISTHIRDPARTYCOOKIEALLOWED_0100
     * @tc.desc   test isThirdPartyCookieAllowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsThirdPartyCookieAllowed001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testIsThirdPartyCookieAllowed001', 134750)
        Utils.registerEvent('testIsThirdPartyCookieAllowed001', true, 134800, done);
        sendEventByKey('WebCookieManagerButton', 10, '');
      })

    /**
     * @tc.name   testIsThirdPartyCookieAllowed002
     * @tc.number SUB_WEB_ISTHIRDPARTYCOOKIEALLOWED_0200
     * @tc.desc   test isThirdPartyCookieAllowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsThirdPartyCookieAllowed002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testIsThirdPartyCookieAllowed002', 134750)
        Utils.registerEvent('testIsThirdPartyCookieAllowed002', false, 134810, done);
        sendEventByKey('WebCookieManagerButton', 10, '');
      })

    /**
     * @tc.name   testExistCookie001
     * @tc.number SUB_WEB_EXISTCOOKIE_0100
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie001', 134750)
      Utils.registerEvent('testExistCookie001', true, 134820, done);
      sendEventByKey('WebCookieManagerButton', 10, '');
    })

    /**
     * @tc.name   testDeleteEntireCookie001
     * @tc.number SUB_WEB_DELETEENTIRECOOKIE_0100
     * @tc.desc   test deleteEntireCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeleteEntireCookie001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testDeleteEntireCookie001', 134750)
      Utils.registerEvent('testDeleteEntireCookie001', false, 134830, done);
      sendEventByKey('WebCookieManagerButton', 10, '');
    })

    /**
     * @tc.name   testPutAcceptCookieEnabled001
     * @tc.number SUB_WEB_PUTACCEPTCOOKIEENABLED_0100
     * @tc.desc   test putAcceptCookieEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPutAcceptCookieEnabled001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testPutAcceptCookieEnabled001', 134750)
      Utils.registerEvent('testPutAcceptCookieEnabled001', false, 134840, done);
      sendEventByKey('WebCookieManagerButton', 10, '');
    })

    /**
     * @tc.name   testPutAcceptThirdPartyCookieEnabled001
     * @tc.number SUB_WEB_PUTACCEPTTHIRDPARTYCOOKIEENABLED_0100
     * @tc.desc   test putAcceptThirdPartyCookieEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPutAcceptThirdPartyCookieEnabled001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testPutAcceptThirdPartyCookieEnabled001', 134750)
        await Utils.sleep(2000);
        Utils.registerEvent('testPutAcceptThirdPartyCookieEnabled001', false, 134850, done);
        sendEventByKey('WebCookieManagerButton', 10, '');
      })

    /**
     * @tc.name   testDeleteSessionCookie001
     * @tc.number SUB_WEB_DELETESESSIONCOOKIE_0100
     * @tc.desc   test deleteSessionCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeleteSessionCookie001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testDeleteSessionCookie001', 134750)
      Utils.registerEvent('testDeleteSessionCookie001', true, 134860, done);
      sendEventByKey('WebCookieManagerButton', 10, '');
    })

    /**
     * @tc.name   testGetCookie001
     * @tc.number SUB_WEB_GETCOOKIE_0100
     * @tc.desc   test getCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCookie001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testGetCookie001', 134750)
      Utils.registerEvent('testGetCookie001', 'a=b', 134870, done);
      sendEventByKey('WebCookieManagerButton', 10, '');
    })
  })
}
