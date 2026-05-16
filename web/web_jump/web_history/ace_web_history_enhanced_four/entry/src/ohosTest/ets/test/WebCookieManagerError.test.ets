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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils.test';
import events_emitter from '@ohos.events.emitter';
import { expect } from '@ohos/hypium';
import { waitForComponent } from './WaitTest.test';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webCookieManagerError() {

  describe('webCookieManagerErrorTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webCookieManagerError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webCookieManagerError state success ' + JSON.stringify(pages));
        if (!('webCookieManagerError' == pages.name)) {
          console.info('get webCookieManagerError state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webCookieManagerError page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webCookieManagerError page error: ' + err);
      }
      await waitForComponent("webCookieManagerErrorButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webCookieManagerError beforeEach start');
      done();
    })

    /**
     * @tc.name   testGetCookieError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_001
     * @tc.desc   test getCookie with url null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetCookieError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetCookieError001', 134000);
      Utils.registerBaseEvent('testGetCookieError001', '401', 134011, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testGetCookieError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_002
     * @tc.desc   test getCookie with url undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetCookieError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetCookieError002', 134000);
      Utils.registerBaseEvent('testGetCookieError002', '401', 134012, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testGetCookieError003
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_003
     * @tc.desc   test getCookie with url empty string parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetCookieError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetCookieError003', 134000);
      Utils.registerBaseEvent('testGetCookieError003', '17100002', 134013, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testFetchCookieSyncError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_004
     * @tc.desc   test fetchCookieSync with url null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookieSyncError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitFetchCookieSyncError001', 134000);
      Utils.registerBaseEvent('testFetchCookieSyncError001', '401', 134014, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testFetchCookieSyncError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_005
     * @tc.desc   test fetchCookieSync with url undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookieSyncError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitFetchCookieSyncError002', 134000);
      Utils.registerBaseEvent('testFetchCookieSyncError002', '401', 134015, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })


    /**
     * @tc.name   testFetchCookiePromiseUrlError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_006
     * @tc.desc   test fetchCookie promise with url null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookiePromiseUrlError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitFetchCookiePromiseUrlError001', 134000);
      Utils.registerBaseEvent('testFetchCookiePromiseUrlError001', '401', 134016, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testFetchCookiePromiseUrlError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_007
     * @tc.desc   test fetchCookie promise with url undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookiePromiseUrlError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitFetchCookiePromiseUrlError002', 134000);
      Utils.registerBaseEvent('testFetchCookiePromiseUrlError002', '401', 134017, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })
    /**
     * @tc.name   testFetchCookieIncognitoPromiseError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_008
     * @tc.desc   test fetchCookie incognito promise with url null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookieIncognitoPromiseError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitFetchCookieIncognitoPromiseError001', 134000);
      Utils.registerBaseEvent('testFetchCookieIncognitoPromiseError001', '401', 134018, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testFetchCookieIncognitoPromiseError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_009
     * @tc.desc   test fetchCookie incognito promise with url undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookieIncognitoPromiseError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitFetchCookieIncognitoPromiseError002', 134000);
      Utils.registerBaseEvent('testFetchCookieIncognitoPromiseError002', '401', 134019, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })


    /**
     * @tc.name   testFetchCookieCallbackUrlError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_010
     * @tc.desc   test fetchCookie callback with url null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookieCallbackUrlError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitFetchCookieCallbackUrlError001', 134000);
      Utils.registerBaseEvent('testFetchCookieCallbackUrlError001', '401', 134020, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testFetchCookieCallbackUrlError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_011
     * @tc.desc   test fetchCookie callback with url undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookieCallbackUrlError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitFetchCookieCallbackUrlError002', 134000);
      Utils.registerBaseEvent('testFetchCookieCallbackUrlError002', '401', 134021, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })


    /**
     * @tc.name   testSetCookieUrlError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_012
     * @tc.desc   test setCookie with url null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetCookieUrlError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetCookieUrlError001', 134000);
      Utils.registerBaseEvent('testSetCookieUrlError001', '401', 134022, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testSetCookieUrlError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_013
     * @tc.desc   test setCookie with url undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetCookieUrlError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetCookieUrlError002', 134000);
      Utils.registerBaseEvent('testSetCookieUrlError002', '401', 134023, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testSetCookieUrlError003
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_014
     * @tc.desc   test setCookie with url empty string parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetCookieUrlError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetCookieUrlError003', 134000);
      Utils.registerBaseEvent('testSetCookieUrlError003', '17100002', 134024, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testSetCookieValueError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_015
     * @tc.desc   test setCookie with value null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetCookieValueError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetCookieValueError001', 134000);
      Utils.registerBaseEvent('testSetCookieValueError001', '401', 134025, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testSetCookieValueError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_016
     * @tc.desc   test setCookie with value undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetCookieValueError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetCookieValueError002', 134000);
      Utils.registerBaseEvent('testSetCookieValueError002', '401', 134026, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testSetCookieValueError003
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_017
     * @tc.desc   test setCookie with value empty string parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetCookieValueError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetCookieValueError003', 134000);
      Utils.registerBaseEvent('testSetCookieValueError003', '17100005', 134027, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testConfigCookieSyncUrlError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_018
     * @tc.desc   test configCookieSync with url null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSyncUrlError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieSyncUrlError001', 134000);
      Utils.registerBaseEvent('testConfigCookieSyncUrlError001', '401', 134028, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testConfigCookieSyncUrlError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_019
     * @tc.desc   test configCookieSync with url undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSyncUrlError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieSyncUrlError002', 134000);
      Utils.registerBaseEvent('testConfigCookieSyncUrlError002', '401', 134029, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testConfigCookieSyncUrlError003
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_020
     * @tc.desc   test configCookieSync with url empty string parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSyncUrlError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieSyncUrlError003', 134000);
      Utils.registerBaseEvent('testConfigCookieSyncUrlError003', '17100002', 134030, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testConfigCookieSyncValueError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_021
     * @tc.desc   test configCookieSync with value null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSyncValueError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieSyncValueError001', 134000);
      Utils.registerBaseEvent('testConfigCookieSyncValueError001', '401', 134031, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testConfigCookieSyncValueError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_022
     * @tc.desc   test configCookieSync with value undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSyncValueError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieSyncValueError002', 134000);
      Utils.registerBaseEvent('testConfigCookieSyncValueError002', '401', 134032, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })


    /**
     * @tc.name   testConfigCookiePromiseUrlError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_023
     * @tc.desc   test configCookie promise with url null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookiePromiseUrlError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookiePromiseUrlError001', 134000);
      Utils.registerBaseEvent('testConfigCookiePromiseUrlError001', '401', 134033, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })
    /**
     * @tc.name   testConfigCookiePromiseUrlError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_024
     * @tc.desc   test configCookie promise with url undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookiePromiseUrlError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookiePromiseUrlError002', 134000);
      Utils.registerBaseEvent('testConfigCookiePromiseUrlError002', '401', 134034, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })
    /**
     * @tc.name   testConfigCookiePromiseValueError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_025
     * @tc.desc   test configCookie promise with value null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookiePromiseValueError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookiePromiseValueError001', 134000);
      Utils.registerBaseEvent('testConfigCookiePromiseValueError001', '401', 134035, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })
    /**
     * @tc.name   testConfigCookiePromiseValueError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_026
     * @tc.desc   test configCookie promise with value undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookiePromiseValueError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookiePromiseValueError002', 134000);
      Utils.registerBaseEvent('testConfigCookiePromiseValueError002', '401', 134036, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })
    /**
     * @tc.name   testConfigCookiePromiseValueError003
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_027
     * @tc.desc   test configCookie promise with value empty parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookiePromiseValueError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookiePromiseValueError003', 134000);
      Utils.registerBaseEvent('testConfigCookiePromiseValueError003', 17100005, 134037, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })
    /**
     * @tc.name   testConfigCookieIncludeHttpOnlyUrlError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_028
     * @tc.desc   test configCookie includeHttpOnly with url null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieIncludeHttpOnlyUrlError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieIncludeHttpOnlyUrlError001', 134000);
      Utils.registerBaseEvent('testConfigCookieIncludeHttpOnlyUrlError001', '401', 134038, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })
    /**
     * @tc.name   testConfigCookieIncludeHttpOnlyUrlError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_029
     * @tc.desc   test configCookie includeHttpOnly with url undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieIncludeHttpOnlyUrlError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieIncludeHttpOnlyUrlError002', 134000);
      Utils.registerBaseEvent('testConfigCookieIncludeHttpOnlyUrlError002', '401', 134039, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })
    /**
     * @tc.name   testConfigCookieIncludeHttpOnlyUrlError003
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_030
     * @tc.desc   test configCookie includeHttpOnly with url empty parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieIncludeHttpOnlyUrlError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieIncludeHttpOnlyUrlError003', 134000);
      Utils.registerBaseEvent('testConfigCookieIncludeHttpOnlyUrlError003', 17100002, 134040, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testConfigCookieIncludeHttpOnlyValueError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_031
     * @tc.desc   test configCookie includeHttpOnly with value null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieIncludeHttpOnlyValueError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieIncludeHttpOnlyValueError001', 134000);
      Utils.registerBaseEvent('testConfigCookieIncludeHttpOnlyValueError001', '401', 134041, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })
    /**
     * @tc.name   testConfigCookieIncludeHttpOnlyValueError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_032
     * @tc.desc   test configCookie includeHttpOnly with value undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieIncludeHttpOnlyValueError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieIncludeHttpOnlyValueError002', 134000);
      Utils.registerBaseEvent('testConfigCookieIncludeHttpOnlyValueError002', '401', 134042, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })
    /**
     * @tc.name   testConfigCookieIncludeHttpOnlyValueError003
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_033
     * @tc.desc   test configCookie includeHttpOnly with value empty parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieIncludeHttpOnlyValueError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieIncludeHttpOnlyValueError003', 134000);
      Utils.registerBaseEvent('testConfigCookieIncludeHttpOnlyValueError003', 17100005, 134043, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testConfigCookieCallbackUrlError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_034
     * @tc.desc   test configCookie callback with url null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieCallbackUrlError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieCallbackUrlError001', 134000);
      Utils.registerBaseEvent('testConfigCookieCallbackUrlError001', '401', 134044, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })
    /**
     * @tc.name   testConfigCookieCallbackUrlError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_035
     * @tc.desc   test configCookie callback with url undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieCallbackUrlError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieCallbackUrlError002', 134000);
      Utils.registerBaseEvent('testConfigCookieCallbackUrlError002', '401', 134045, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })
    /**
     * @tc.name   testConfigCookieCallbackValueError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_036
     * @tc.desc   test configCookie callback with value null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieCallbackValueError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieCallbackValueError001', 134000);
      Utils.registerBaseEvent('testConfigCookieCallbackValueError001', '401', 134046, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })
    /**
     * @tc.name   testConfigCookieCallbackValueError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_037
     * @tc.desc   test configCookie callback with value undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieCallbackValueError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieCallbackValueError002', 134000);
      Utils.registerBaseEvent('testConfigCookieCallbackValueError002', '401', 134047, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })
    /**
     * @tc.name   testConfigCookieCallbackValueError003
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_038
     * @tc.desc   test configCookie callback with value empty parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieCallbackValueError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieCallbackValueError003', 134000);
      Utils.registerBaseEvent('testConfigCookieCallbackValueError003', 17100005, 134048, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })


  })
}
