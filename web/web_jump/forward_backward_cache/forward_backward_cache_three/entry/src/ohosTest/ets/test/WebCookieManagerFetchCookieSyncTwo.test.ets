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

import { beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver: Driver = Driver.create();

export default function webCookieManagerFetchCookieSyncTwo() {
  describe('WebCookieManagerFetchCookieSyncTwo', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebCookieManagerFetchCookieSyncTwo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebCookieManagerFetchCookieSyncTwo state success ' + JSON.stringify(pages));
        if (!('WebCookieManagerFetchCookieSyncTwo' == pages.name)) {
          console.info('get WebCookieManagerFetchCookieSyncTwo state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebCookieManagerFetchCookieSyncTwo page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebCookieManagerFetchCookieSyncTwo page error: ' + err);
      }
      await driver.waitForComponent(ON.id('WebCookieManagerFetchCookieSyncTestButton'), 10000);
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('WebCookieManagerFetchCookieSyncTwo beforeEach start');
      done();
    })

    /**
     * @tc.name   testFetchCookieSync031
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_3100
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookieSync031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync031', 137100)
      Utils.registerBaseEvent('testFetchCookieSync031', true, 137110, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync031');
    })

    /**
     * @tc.name   testFetchCookieSync032
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_3200
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookieSync032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync032', 137100)
      Utils.registerBaseEvent('testFetchCookieSync032', true, 137120, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync032');
    })
  })
}
