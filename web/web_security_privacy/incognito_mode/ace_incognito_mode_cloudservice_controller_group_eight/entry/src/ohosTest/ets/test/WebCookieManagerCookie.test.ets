/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Util';
import events_emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import router from '@ohos.router';
import { waitForComponent } from './WaitTest';
import { Driver,ON } from '@ohos.UiTest'
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let driver = Driver.create();
export default function ActsWebCookieManagerCookieTest() {

  describe('WebCookieManagerCookieTest', async () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebCookieManagerCookie',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebCookieManagerCookie state success ' + JSON.stringify(pages));
        if (!('testWebView_Geolocation' == pages.name)) {
          console.info('get index state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push index state success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push index page error:' + err);
      }
      await driver.waitForComponent(ON.id("WebCookieManagerCookieTest"), 10000);
      console.log("WebCookieManagerCookieTest");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebCookieManagerCookieTest beforeEach start");
      done();
    });


    /**
     * @tc.name   testIncognitoExistCookieSetUndefined
     * @tc.number SUB_ACE_WEB_INCOGNITO_EXISTCOOKIE_SetUndefined
     * @tc.desc   test ExistCookie set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIncognitoExistCookieSetUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testIncognitoExistCookieSetUndefined", 251121)
      Utils.registerBaseEvent('testIncognitoExistCookieSetUndefined', 'undefined', 25112401, done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "WebCookieManagerCookieTest");
    });

    /**
     * @tc.name   testIncognitoExistCookieSetNull
     * @tc.number SUB_ACE_WEB_INCOGNITO_EXISTCOOKIE_SetNull
     * @tc.desc   test ExistCookie set Null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIncognitoExistCookieSetNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testIncognitoExistCookieSetNull", 251121)
      Utils.registerBaseEvent('testIncognitoExistCookieSetNull', 'undefined', 25112402, done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "WebCookieManagerCookieTest");
    });


    /**
     * @tc.name   testIncognitoClearAllCookiesSyncSetUndefined
     * @tc.number SUB_ACE_WEB_INCOGNITO_CLEARALLCOOKIESSYNC_SetUndefined
     * @tc.desc   test ClearAllCookiesSync set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIncognitoClearAllCookiesSyncSetUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testIncognitoClearAllCookiesSyncSetUndefined", 251121)
      Utils.registerBaseEvent('testIncognitoClearAllCookiesSyncSetUndefined', 'ccs=bbc', 25112403, done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "WebCookieManagerCookieTest");
    });

    /**
     * @tc.name   testIncognitoClearAllCookiesSyncSetNull
     * @tc.number SUB_ACE_WEB_INCOGNITO_CLEARALLCOOKIESSYNC_SetNull
     * @tc.desc   test ClearAllCookiesSync set Null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIncognitoClearAllCookiesSyncSetNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testIncognitoClearAllCookiesSyncSetNull", 251121)
      Utils.registerBaseEvent('testIncognitoClearAllCookiesSyncSetNull', 'ccs=bbc', 25112404, done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "WebCookieManagerCookieTest");
    });

  });
}