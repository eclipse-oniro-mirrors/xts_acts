/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { Component, Driver, ON } from '@kit.TestKit';
import events_emitter from '@ohos.events.emitter';

const driver = Driver.create();

export default function setBlanklessLoadingWithParamsTest() {

  describe('setBlanklessLoadingWithParamsTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/SetBlanklessLoadingWithParamsTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get setBlanklessLoadingWithParamsTest state success ' + JSON.stringify(pages));
        if (!("setBlanklessLoadingWithParamsTest" == pages.name)) {
          console.info('get setBlanklessLoadingWithParamsTest state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push setBlanklessLoadingWithParamsTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push setBlanklessLoadingWithParamsTest page error: ' + err);
      }
      done()
    });
    /**
     * @tc.name   testSetBlanklessLoadingWithParams001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_0100
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBlanklessLoadingWithParams001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetBlanklessLoadingWithParams001", 148501)
      Utils.registerBaseEvent("testSetBlanklessLoadingWithParams001", 0, 148510, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('setBlanklessLoadingWithParamsTestButton', driver)
    })
    /**
     * @tc.name   testSetBlanklessLoadingWithParams002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_0200
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBlanklessLoadingWithParams002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetBlanklessLoadingWithParams002", 148501)
      Utils.registerBaseEvent("testSetBlanklessLoadingWithParams002", -6, 148520, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('setBlanklessLoadingWithParamsTestButton', driver)
    })
    /**
     * @tc.name   testSetBlanklessLoadingWithParams003
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_0300
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBlanklessLoadingWithParams003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetBlanklessLoadingWithParams003", 148501)
      Utils.registerBaseEvent("testSetBlanklessLoadingWithParams003", -7, 148530, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('setBlanklessLoadingWithParamsTestButton', driver)
    })
    /**
     * @tc.name   testSetBlanklessLoadingWithParams004
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_0400
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBlanklessLoadingWithParams004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetBlanklessLoadingWithParams004", 148501)
      Utils.registerBaseEvent("testSetBlanklessLoadingWithParams004", 401, 148540, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('setBlanklessLoadingWithParamsTestButton', driver)
    })
    /**
     * @tc.name   testSetBlanklessLoadingWithParams005
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_0500
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBlanklessLoadingWithParams005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetBlanklessLoadingWithParams005", 148501)
      Utils.registerBaseEvent("testSetBlanklessLoadingWithParams005", 401, 148550, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('setBlanklessLoadingWithParamsTestButton', driver)
    })
    /**
     * @tc.name   testSetBlanklessLoadingWithParams006
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_0600
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBlanklessLoadingWithParams006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetBlanklessLoadingWithParams006", 148501)
      Utils.registerBaseEvent("testSetBlanklessLoadingWithParams006", 401, 148560, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('setBlanklessLoadingWithParamsTestButton', driver)
    })
    /**
     * @tc.name   testSetBlanklessLoadingWithParams007
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_0700
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBlanklessLoadingWithParams007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetBlanklessLoadingWithParams007", 148501)
      Utils.registerBaseEvent("testSetBlanklessLoadingWithParams007", 401, 148570, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('setBlanklessLoadingWithParamsTestButton', driver)
    })
    /**
     * @tc.name   testSetBlanklessLoadingWithParams008
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_0800
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBlanklessLoadingWithParams008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetBlanklessLoadingWithParams008", 148501)
      Utils.registerBaseEvent("testSetBlanklessLoadingWithParams008", 0, 148580, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('setBlanklessLoadingWithParamsTestButton', driver)
    })
    /**
     * @tc.name   testSetBlanklessLoadingWithParams009
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_0900
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBlanklessLoadingWithParams009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetBlanklessLoadingWithParams009", 148501)
      Utils.registerBaseEvent("testSetBlanklessLoadingWithParams009", -5, 148590, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('setBlanklessLoadingWithParamsTestButton', driver)
    })
    /**
     * @tc.name   testSetBlanklessLoadingWithParams010
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_1000
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBlanklessLoadingWithParams010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetBlanklessLoadingWithParams010", 148501)
      Utils.registerBaseEvent("testSetBlanklessLoadingWithParams010", -4, 148600, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('setBlanklessLoadingWithParamsTestButton', driver)
    })
    /**
     * @tc.name   testSetBlanklessLoadingWithParams011
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_1100
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBlanklessLoadingWithParams011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetBlanklessLoadingWithParams011", 148501)
      Utils.registerBaseEvent("testSetBlanklessLoadingWithParams011", -3, 148610, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('setBlanklessLoadingWithParamsTestButton', driver)
    })
    /**
     * @tc.name   testSetBlanklessLoadingWithParams012
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_1200
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBlanklessLoadingWithParams012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetBlanklessLoadingWithParams012", 148501)
      Utils.registerBaseEvent("testSetBlanklessLoadingWithParams012", -2, 148620, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('setBlanklessLoadingWithParamsTestButton', driver)
    })
    /**
     * @tc.name   testSetBlanklessLoadingWithParams013
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_1300
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBlanklessLoadingWithParams013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetBlanklessLoadingWithParams013", 148501)
      Utils.registerBaseEvent("testSetBlanklessLoadingWithParams013", 0, 148630, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('setBlanklessLoadingWithParamsTestButton', driver)
    })
    /**
     * @tc.name   testSetBlanklessLoadingWithParams014
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_1400
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBlanklessLoadingWithParams014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetBlanklessLoadingWithParams014", 148501)
      Utils.registerBaseEvent("testSetBlanklessLoadingWithParams014", 0, 148640, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('setBlanklessLoadingWithParamsTestButton', driver)
    })
    /**
     * @tc.name   testSetBlanklessLoadingWithParams015
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_1500
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBlanklessLoadingWithParams015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetBlanklessLoadingWithParams015", 148501)
      Utils.registerBaseEvent("testSetBlanklessLoadingWithParams015", -2, 148650, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('setBlanklessLoadingWithParamsTestButton', driver)
    })
    /**
     * @tc.name   testSetBlanklessLoadingWithParams016
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_1600
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBlanklessLoadingWithParams016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetBlanklessLoadingWithParams016", 148501)
      Utils.registerBaseEvent("testSetBlanklessLoadingWithParams016", 0, 148660, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('setBlanklessLoadingWithParamsTestButton', driver)
    })
    /**
     * @tc.name   testSetBlanklessLoadingWithParams017
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_1700
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBlanklessLoadingWithParams017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetBlanklessLoadingWithParams017", 148501)
      Utils.registerBaseEvent("testSetBlanklessLoadingWithParams017", -6, 148670, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('setBlanklessLoadingWithParamsTestButton', driver)
    })
    /**
     * @tc.name   testSetBlanklessLoadingWithParams018
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_1800
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBlanklessLoadingWithParams018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetBlanklessLoadingWithParams018", 148501)
      Utils.registerBaseEvent("testSetBlanklessLoadingWithParams018", -5, 148680, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('setBlanklessLoadingWithParamsTestButton', driver)
    })
    /**
     * @tc.name   testSetBlanklessLoadingWithParams019
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_1900
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBlanklessLoadingWithParams019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetBlanklessLoadingWithParams019", 148501)
      Utils.registerBaseEvent("testSetBlanklessLoadingWithParams019", -5, 148690, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('setBlanklessLoadingWithParamsTestButton', driver)
    })
    /**
     * @tc.name   testSetBlanklessLoadingWithParams020
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_2000
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBlanklessLoadingWithParams020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetBlanklessLoadingWithParams020", 148501)
      Utils.registerBaseEvent("testSetBlanklessLoadingWithParams020", -6, 148700, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('setBlanklessLoadingWithParamsTestButton', driver)
    })
    /**
     * @tc.name   testSetBlanklessLoadingWithParams021
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_2100
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBlanklessLoadingWithParams021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetBlanklessLoadingWithParams021", 148501)
      Utils.registerBaseEvent("testSetBlanklessLoadingWithParams021", -7, 148710, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('setBlanklessLoadingWithParamsTestButton', driver)
    })
    /**
     * @tc.name   testSetBlanklessLoadingWithParams022
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_2200
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBlanklessLoadingWithParams022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetBlanklessLoadingWithParams022", 148501)
      Utils.registerBaseEvent("testSetBlanklessLoadingWithParams022", true, 148720, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('setBlanklessLoadingWithParamsTestButton', driver)
    })
    /**
     * @tc.name   testSetBlanklessLoadingWithParams023
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_2300
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBlanklessLoadingWithParams023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetBlanklessLoadingWithParams023", 148501)
      Utils.registerBaseEvent("testSetBlanklessLoadingWithParams023", 0, 148730, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('setBlanklessLoadingWithParamsTestButton', driver)
    })
    /**
     * @tc.name   testSetBlanklessLoadingWithParams024
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_2400
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBlanklessLoadingWithParams024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetBlanklessLoadingWithParams024", 148501)
      Utils.registerBaseEvent("testSetBlanklessLoadingWithParams024", true, 148740, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('setBlanklessLoadingWithParamsTestButton', driver)
    })
    /**
     * @tc.name   testSetBlanklessLoadingWithParams025
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_2500
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBlanklessLoadingWithParams025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetBlanklessLoadingWithParams025", 148501)
      Utils.registerBaseEvent("testSetBlanklessLoadingWithParams025", -4, 148750, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('setBlanklessLoadingWithParamsTestButton', driver)
    })
  })
}
