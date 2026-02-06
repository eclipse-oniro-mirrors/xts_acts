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

export default function webCookieManagerFetchCookieSyncOne() {
  describe('WebCookieManagerFetchCookieSyncOne', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebCookieManagerFetchCookieSyncOne',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebCookieManagerFetchCookieSyncOne state success ' + JSON.stringify(pages));
        if (!('WebCookieManagerFetchCookieSyncOne' == pages.name)) {
          console.info('get WebCookieManagerFetchCookieSyncOne state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebCookieManagerFetchCookieSyncOne page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebCookieManagerFetchCookieSyncOne page error: ' + err);
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
      console.info('WebCookieManagerFetchCookieSyncOne beforeEach start');
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_0100
    * @tc.name       : testFetchCookieSync001
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testFetchCookieSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync001', 136750)
      Utils.registerBaseEvent('testFetchCookieSync001', 'a=b', 136760, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync001');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_0200
    * @tc.name       : testFetchCookieSync002
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync002', 136750)
      Utils.registerBaseEvent('testFetchCookieSync002', 'a=c', 136770, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync002');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_0300
    * @tc.name       : testFetchCookieSync003
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync003', 136750)
      Utils.registerBaseEvent('testFetchCookieSync003', 'a=d', 136780, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync003');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_0400
    * @tc.name       : testFetchCookieSync004
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync004', 136750)
      Utils.registerBaseEvent('testFetchCookieSync004', 'a=e', 136790, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync004');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_0500
    * @tc.name       : testFetchCookieSync005
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync005', 136750)
      Utils.registerBaseEvent('testFetchCookieSync005', true, 136800, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync005');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_0600
    * @tc.name       : testFetchCookieSync006
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync006', 136750)
      Utils.registerBaseEvent('testFetchCookieSync006', true, 136810, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync006');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_0700
    * @tc.name       : testFetchCookieSync007
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync007', 136750)
      Utils.registerBaseEvent('testFetchCookieSync007', true, 136820, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync007');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_0800
    * @tc.name       : testFetchCookieSync008
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync008', 136750)
      Utils.registerBaseEvent('testFetchCookieSync008', true, 136830, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync008');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_0900
    * @tc.name       : testFetchCookieSync009
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync009', 136750)
      Utils.registerBaseEvent('testFetchCookieSync009', true, 136840, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync009');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_1000
    * @tc.name       : testFetchCookieSync010
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync010', 136750)
      Utils.registerBaseEvent('testFetchCookieSync010', true, 136850, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync010');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_1100
    * @tc.name       : testFetchCookieSync011
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync011', 136750)
      Utils.registerBaseEvent('testFetchCookieSync011', true, 136860, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync011');
    })


    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_1200
    * @tc.name       : testFetchCookieSync012
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync012', 136750)
      Utils.registerBaseEvent('testFetchCookieSync012', true, 136870, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync012');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_1300
    * @tc.name       : testFetchCookieSync013
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync013', 136750)
      Utils.registerBaseEvent('testFetchCookieSync013', true, 136880, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync013');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_1400
    * @tc.name       : testFetchCookieSync014
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync014', 136750)
      Utils.registerBaseEvent('testFetchCookieSync014', true, 136890, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync014');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_1500
    * @tc.name       : testFetchCookieSync015
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync015', 136750)
      Utils.registerBaseEvent('testFetchCookieSync015', true, 136900, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync015');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_1600
    * @tc.name       : testFetchCookieSync016
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync016', 136750)
      Utils.registerBaseEvent('testFetchCookieSync016', true, 136910, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync016');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_1700
    * @tc.name       : testFetchCookieSync017
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync017', 136750)
      Utils.registerBaseEvent('testFetchCookieSync017', true, 136920, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync017');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_1800
    * @tc.name       : testFetchCookieSync018
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync018', 136750)
      Utils.registerBaseEvent('testFetchCookieSync018', true, 136930, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync018');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_1900
    * @tc.name       : testFetchCookieSync019
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync019', 136750)
      Utils.registerBaseEvent('testFetchCookieSync019', true, 136940, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync019');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_2000
    * @tc.name       : testFetchCookieSync020
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync020', 136750)
      Utils.registerBaseEvent('testFetchCookieSync020', true, 136950, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync020');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_2100
    * @tc.name       : testFetchCookieSync021
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync021', 136750)
      Utils.registerBaseEvent('testFetchCookieSync021', true, 136960, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync021');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_2200
    * @tc.name       : testFetchCookieSync022
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync022', 136750)
      Utils.registerBaseEvent('testFetchCookieSync022', true, 136970, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync022');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_2300
    * @tc.name       : testFetchCookieSync023
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync023', 136750)
      Utils.registerBaseEvent('testFetchCookieSync023', true, 136980, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync023');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_2400
    * @tc.name       : testFetchCookieSync024
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync024', 136750)
      Utils.registerBaseEvent('testFetchCookieSync024', true, 136990, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync024');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_2500
    * @tc.name       : testFetchCookieSync025
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync025', 136750)
      Utils.registerBaseEvent('testFetchCookieSync025', true, 137000, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync025');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_2600
    * @tc.name       : testFetchCookieSync026
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync026', 136750)
      Utils.registerBaseEvent('testFetchCookieSync026', true, 137010, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync026');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_2700
    * @tc.name       : testFetchCookieSync027
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync027', 136750)
      Utils.registerBaseEvent('testFetchCookieSync027', true, 137020, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync027');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_2800
    * @tc.name       : testFetchCookieSync028
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync028', 136750)
      Utils.registerBaseEvent('testFetchCookieSync028', true, 137030, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync028');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_2900
    * @tc.name       : testFetchCookieSync029
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync029', 136750)
      Utils.registerBaseEvent('testFetchCookieSync029', true, 137040, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync029');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_3000
    * @tc.name       : testFetchCookieSync030
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieSync030', 136750)
      Utils.registerBaseEvent('testFetchCookieSync030', true, 137050, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieSyncTestButton', 'testFetchCookieSync030');
    })
  })
}
