/*
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

export default function webCookieManagerFetchCookieThree() {
  describe('WebCookieManagerFetchCookieThree', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebCookieManagerFetchCookieThree',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebCookieManagerFetchCookieThree state success ' + JSON.stringify(pages));
        if (!('WebCookieManagerFetchCookieThree' == pages.name)) {
          console.info('get WebCookieManagerFetchCookieThree state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebCookieManagerFetchCookieThree page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebCookieManagerFetchCookieThree page error: ' + err);
      }
      await driver.waitForComponent(ON.id('WebCookieManagerFetchCookieTestButton'), 10000);
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('WebCookieManagerFetchCookieThree beforeEach start');
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_6100
    * @tc.name       : testFetchCookie061
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie061', 136600)
      Utils.registerBaseEvent('testFetchCookie061', true, 136610, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie061');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_6200
    * @tc.name       : testFetchCookie062
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie062', 136600)
      Utils.registerBaseEvent('testFetchCookie062', true, 136620, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie062');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_6300
    * @tc.name       : testFetchCookie063
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie063', 136600)
      Utils.registerBaseEvent('testFetchCookie063', true, 136630, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie063');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_6400
    * @tc.name       : testFetchCookie064
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie064', 136600)
      Utils.registerBaseEvent('testFetchCookie064', true, 136640, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie064');
    })
  })
}
