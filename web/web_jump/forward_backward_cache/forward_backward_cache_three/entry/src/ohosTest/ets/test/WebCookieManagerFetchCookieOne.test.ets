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

export default function webCookieManagerFetchCookieOne() {
  describe('WebCookieManagerFetchCookieOne', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebCookieManagerFetchCookieOne',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebCookieManagerFetchCookieOne state success ' + JSON.stringify(pages));
        if (!('WebCookieManagerFetchCookieOne' == pages.name)) {
          console.info('get WebCookieManagerFetchCookieOne state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebCookieManagerFetchCookieOne page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebCookieManagerFetchCookieOne page error: ' + err);
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
      console.info('WebCookieManagerFetchCookieOne beforeEach start');
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_0100
    * @tc.name       : testFetchCookie001
    * @tc.desc       : test fetchCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie001', 135900)
      Utils.registerBaseEvent('testFetchCookie001', 'a=b', 135910, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie001');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_0200
    * @tc.name       : testFetchCookie002
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie002', 135900)
      Utils.registerBaseEvent('testFetchCookie002', 'a=c', 135920, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie002');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_0300
    * @tc.name       : testFetchCookie003
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie003', 135900)
      Utils.registerBaseEvent('testFetchCookie003', 'a=d', 135930, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie003');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_0400
    * @tc.name       : testFetchCookie004
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie004', 135900)
      Utils.registerBaseEvent('testFetchCookie004', 'a=e', 135940, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie004');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_0500
    * @tc.name       : testFetchCookie005
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie005', 135900)
      Utils.registerBaseEvent('testFetchCookie005', true, 135950, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie005');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_0600
    * @tc.name       : testFetchCookie006
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie006', 135900)
      Utils.registerBaseEvent('testFetchCookie006', true, 135960, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie006');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_0700
    * @tc.name       : testFetchCookie007
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie007', 135900)
      Utils.registerBaseEvent('testFetchCookie007', true, 135970, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie007');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_0800
    * @tc.name       : testFetchCookie008
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie008', 135900)
      Utils.registerBaseEvent('testFetchCookie008', true, 135980, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie008');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_0900
    * @tc.name       : testFetchCookie009
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie009', 135900)
      Utils.registerBaseEvent('testFetchCookie009', true, 135990, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie009');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_1000
    * @tc.name       : testFetchCookie010
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie010', 135900)
      Utils.registerBaseEvent('testFetchCookie010', true, 136000, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie010');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_1100
    * @tc.name       : testFetchCookie011
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie011', 135900)
      Utils.registerBaseEvent('testFetchCookie011', true, 136010, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie011');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_1200
    * @tc.name       : testFetchCookie012
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie012', 135900)
      Utils.registerBaseEvent('testFetchCookie012', true, 136020, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie012');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_1300
    * @tc.name       : testFetchCookie013
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie013', 135900)
      Utils.registerBaseEvent('testFetchCookie013', true, 136030, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie013');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_1400
    * @tc.name       : testFetchCookie014
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie014', 135900)
      Utils.registerBaseEvent('testFetchCookie014', true, 136040, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie014');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_1500
    * @tc.name       : testFetchCookie015
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie015', 135900)
      Utils.registerBaseEvent('testFetchCookie015', true, 136050, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie015');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_1600
    * @tc.name       : testFetchCookie016
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie016', 135900)
      Utils.registerBaseEvent('testFetchCookie016', true, 136060, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie016');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_1700
    * @tc.name       : testFetchCookie017
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie017', 135900)
      Utils.registerBaseEvent('testFetchCookie017', true, 136070, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie017');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_1800
    * @tc.name       : testFetchCookie018
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie018', 135900)
      Utils.registerBaseEvent('testFetchCookie018', true, 136080, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie018');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_1900
    * @tc.name       : testFetchCookie019
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie019', 135900)
      Utils.registerBaseEvent('testFetchCookie019', true, 136090, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie019');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_2000
    * @tc.name       : testFetchCookie020
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie020', 135900)
      Utils.registerBaseEvent('testFetchCookie020', true, 136100, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie020');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_2100
    * @tc.name       : testFetchCookie021
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie021', 135900)
      Utils.registerBaseEvent('testFetchCookie021', true, 136110, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie021');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_2200
    * @tc.name       : testFetchCookie022
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie022', 135900)
      Utils.registerBaseEvent('testFetchCookie022', true, 136120, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie022');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_2300
    * @tc.name       : testFetchCookie023
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie023', 135900)
      Utils.registerBaseEvent('testFetchCookie023', true, 136130, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie023');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_2400
    * @tc.name       : testFetchCookie024
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie024', 135900)
      Utils.registerBaseEvent('testFetchCookie024', true, 136140, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie024');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_2500
    * @tc.name       : testFetchCookie025
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie025', 135900)
      Utils.registerBaseEvent('testFetchCookie025', true, 136150, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie025');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_2600
    * @tc.name       : testFetchCookie026
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie026', 135900)
      Utils.registerBaseEvent('testFetchCookie026', true, 136160, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie026');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_2700
    * @tc.name       : testFetchCookie027
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie027', 135900)
      Utils.registerBaseEvent('testFetchCookie027', true, 136170, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie027');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_2800
    * @tc.name       : testFetchCookie028
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie028', 135900)
      Utils.registerBaseEvent('testFetchCookie028', true, 136180, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie028');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_2900
    * @tc.name       : testFetchCookie029
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie029', 135900)
      Utils.registerBaseEvent('testFetchCookie029', true, 136190, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie029');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_3000
    * @tc.name       : testFetchCookie030
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie030', 135900)
      Utils.registerBaseEvent('testFetchCookie030', true, 136200, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie030');
    })
  })
}
