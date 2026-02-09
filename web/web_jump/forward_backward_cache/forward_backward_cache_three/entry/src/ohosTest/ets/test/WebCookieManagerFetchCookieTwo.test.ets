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

export default function webCookieManagerFetchCookieTwo() {
  describe('WebCookieManagerFetchCookieTwo', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebCookieManagerFetchCookieTwo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebCookieManagerFetchCookieTwo state success ' + JSON.stringify(pages));
        if (!('WebCookieManagerFetchCookieTwo' == pages.name)) {
          console.info('get WebCookieManagerFetchCookieTwo state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebCookieManagerFetchCookieTwo page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebCookieManagerFetchCookieTwo page error: ' + err);
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
      console.info('WebCookieManagerFetchCookieTwo beforeEach start');
      done();
    })

    /**
     * @tc.name   testFetchCookie031
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_3100
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie031', 136250)
      Utils.registerBaseEvent('testFetchCookie031', true, 136260, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie031');
    })

    /**
     * @tc.name   testFetchCookie032
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_3200
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie032', 136250)
      Utils.registerBaseEvent('testFetchCookie032', true, 136270, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie032');
    })

    /**
     * @tc.name   testFetchCookie033
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_3300
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie033', 136250)
      Utils.registerBaseEvent('testFetchCookie033', 'a=b', 136280, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie033');
    })

    /**
     * @tc.name   testFetchCookie034
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_3400
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie034', 136250)
      Utils.registerBaseEvent('testFetchCookie034', 'a=c', 136290, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie034');
    })

    /**
     * @tc.name   testFetchCookie035
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_3500
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie035', 136250)
      Utils.registerBaseEvent('testFetchCookie035', 'a=d', 136300, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie035');
    })

    /**
     * @tc.name   testFetchCookie036
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_3600
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie036', 136250)
      Utils.registerBaseEvent('testFetchCookie036', 'a=e', 136310, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie036');
    })

    /**
     * @tc.name   testFetchCookie037
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_3700
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie037', 136250)
      Utils.registerBaseEvent('testFetchCookie037', true, 136320, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie037');
    })

    /**
     * @tc.name   testFetchCookie038
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_3800
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie038', 136250)
      Utils.registerBaseEvent('testFetchCookie038', true, 136330, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie038');
    })

    /**
     * @tc.name   testFetchCookie039
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_3900
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie039', 136250)
      Utils.registerBaseEvent('testFetchCookie039', true, 136340, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie039');
    })

    /**
     * @tc.name   testFetchCookie040
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_4000
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie040', 136250)
      Utils.registerBaseEvent('testFetchCookie040', true, 136350, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie040');
    })

    /**
     * @tc.name   testFetchCookie041
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_4100
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie041', 136250)
      Utils.registerBaseEvent('testFetchCookie041', true, 136360, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie041');
    })

    /**
     * @tc.name   testFetchCookie042
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_4200
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie042', 136250)
      Utils.registerBaseEvent('testFetchCookie042', true, 136370, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie042');
    })

    /**
     * @tc.name   testFetchCookie043
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_4300
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie043', 136250)
      Utils.registerBaseEvent('testFetchCookie043', true, 136380, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie043');
    })

    /**
     * @tc.name   testFetchCookie044
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_4400
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie044', 136250)
      Utils.registerBaseEvent('testFetchCookie044', true, 136390, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie044');
    })

    /**
     * @tc.name   testFetchCookie045
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_4500
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie045', 136250)
      Utils.registerBaseEvent('testFetchCookie045', true, 136400, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie045');
    })

    /**
     * @tc.name   testFetchCookie046
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_4600
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie046', 136250)
      Utils.registerBaseEvent('testFetchCookie046', true, 136410, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie046');
    })

    /**
     * @tc.name   testFetchCookie047
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_4700
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie047', 136250)
      Utils.registerBaseEvent('testFetchCookie047', true, 136420, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie047');
    })

    /**
     * @tc.name   testFetchCookie048
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_4800
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie048', 136250)
      Utils.registerBaseEvent('testFetchCookie048', true, 136430, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie048');
    })

    /**
     * @tc.name   testFetchCookie049
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_4900
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie049', 136250)
      Utils.registerBaseEvent('testFetchCookie049', true, 136440, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie049');
    })

    /**
     * @tc.name   testFetchCookie050
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_5000
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie050', 136250)
      Utils.registerBaseEvent('testFetchCookie050', true, 136450, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie050');
    })

    /**
     * @tc.name   testFetchCookie051
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_5100
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie051', 136250)
      Utils.registerBaseEvent('testFetchCookie051', true, 136460, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie051');
    })

    /**
     * @tc.name   testFetchCookie052
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_5200
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie052', 136250)
      Utils.registerBaseEvent('testFetchCookie052', true, 136470, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie052');
    })

    /**
     * @tc.name   testFetchCookie053
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_5300
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie053', 136250)
      Utils.registerBaseEvent('testFetchCookie053', true, 136480, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie053');
    })

    /**
     * @tc.name   testFetchCookie054
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_5400
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie054', 136250)
      Utils.registerBaseEvent('testFetchCookie054', true, 136490, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie054');
    })

    /**
     * @tc.name   testFetchCookie055
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_5500
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie055', 136250)
      Utils.registerBaseEvent('testFetchCookie054', true, 136500, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie055');
    })

    /**
     * @tc.name   testFetchCookie056
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_5600
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie056', 136250)
      Utils.registerBaseEvent('testFetchCookie056', true, 136510, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie056');
    })

    /**
     * @tc.name   testFetchCookie057
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_5700
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie057', 136250)
      Utils.registerBaseEvent('testFetchCookie057', true, 136520, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie057');
    })

    /**
     * @tc.name   testFetchCookie058
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_5800
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie058', 136250)
      Utils.registerBaseEvent('testFetchCookie058', true, 136530, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie058');
    })

    /**
     * @tc.name   testFetchCookie059
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_5900
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie059', 136250)
      Utils.registerBaseEvent('testFetchCookie059', true, 136540, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie059');
    })

    /**
     * @tc.name   testFetchCookie060
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_6000
     * @tc.desc   test fetchCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookie060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookie060', 136250)
      Utils.registerBaseEvent('testFetchCookie060', true, 136550, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookie060');
    })
  })
}
