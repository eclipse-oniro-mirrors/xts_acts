/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export default function blankLessInfoWithKeyTest() {

  describe('blankLessInfoWithKeyTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/BlankLessInfoWithKeyTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get blankLessInfoWithKeyTest state success ' + JSON.stringify(pages));
        if (!("blankLessInfoWithKeyTest" == pages.name)) {
          console.info('get blankLessInfoWithKeyTest state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push blankLessInfoWithKeyTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push blankLessInfoWithKeyTest page error: ' + err);
      }
      done()
    });
    /**
     * @tc.name   testblankLessInfoWithKey001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_BLANKLESSINFOWITHKEYTEST_0100
     * @tc.desc   test blankLessInfoWithKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testblankLessInfoWithKey001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testblankLessInfoWithKey001", 148001)
      Utils.registerBaseEvent("testblankLessInfoWithKey001", 0, 148010, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('blankLessInfoWithKeyTestButton', driver)
    })

    /**
     * @tc.name   testblankLessInfoWithKey002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_BLANKLESSINFOWITHKEYTEST_0200
     * @tc.desc   test blankLessInfoWithKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testblankLessInfoWithKey002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testblankLessInfoWithKey002", 148001)
      Utils.registerBaseEvent("testblankLessInfoWithKey002", -2, 148020, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('blankLessInfoWithKeyTestButton', driver)
    })
    /**
     * @tc.name   testblankLessInfoWithKey003
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_BLANKLESSINFOWITHKEYTEST_0300
     * @tc.desc   test blankLessInfoWithKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testblankLessInfoWithKey003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testblankLessInfoWithKey003", 148001);
      Utils.registerBaseEvent("testblankLessInfoWithKey003", -3, 148030, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('blankLessInfoWithKeyTestButton', driver);
    })

    /**
     * @tc.name   testblankLessInfoWithKey004
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_BLANKLESSINFOWITHKEYTEST_0400
     * @tc.desc   test blankLessInfoWithKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testblankLessInfoWithKey004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testblankLessInfoWithKey004", 148001);
      Utils.registerBaseEvent("testblankLessInfoWithKey004", 401, 148040, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('blankLessInfoWithKeyTestButton', driver)
    })
    /**
     * @tc.name   testblankLessInfoWithKey005
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_BLANKLESSINFOWITHKEYTEST_0500
     * @tc.desc   test blankLessInfoWithKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testblankLessInfoWithKey005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testblankLessInfoWithKey005", 148001);
      Utils.registerBaseEvent("testblankLessInfoWithKey005", -4, 148050, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('blankLessInfoWithKeyTestButton', driver);
    })
    /**
     * @tc.name   testblankLessInfoWithKey006
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_BLANKLESSINFOWITHKEYTEST_0600
     * @tc.desc   test blankLessInfoWithKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testblankLessInfoWithKey006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testblankLessInfoWithKey006", 148001);
      Utils.registerBaseEvent("testblankLessInfoWithKey006", -5, 148060, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('blankLessInfoWithKeyTestButton', driver);
    })
    /**
     * @tc.name   testblankLessInfoWithKey007
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_BLANKLESSINFOWITHKEYTEST_0700
     * @tc.desc   test blankLessInfoWithKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testblankLessInfoWithKey007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testblankLessInfoWithKey007", 148001);
      Utils.registerBaseEvent("testblankLessInfoWithKey007", 401, 148070, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('blankLessInfoWithKeyTestButton', driver);
    })
    /**
     * @tc.name   testblankLessInfoWithKey008
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_BLANKLESSINFOWITHKEYTEST_0800
     * @tc.desc   test blankLessInfoWithKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testblankLessInfoWithKey008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testblankLessInfoWithKey008", 148001);
      Utils.registerBaseEvent("testblankLessInfoWithKey008", 401, 148080, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('blankLessInfoWithKeyTestButton', driver);
    })
  })
}
