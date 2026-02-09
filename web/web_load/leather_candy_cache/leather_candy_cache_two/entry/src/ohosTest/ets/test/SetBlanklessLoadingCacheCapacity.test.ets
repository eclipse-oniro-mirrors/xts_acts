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
import { Driver, ON } from '@kit.TestKit';
import events_emitter from '@ohos.events.emitter';

const driver = Driver.create();

export default function setBlanklessLoadingCacheCapacityTest() {

  describe('setBlanklessLoadingCacheCapacityTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/SetBlanklessLoadingCacheCapacityTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get setBlanklessLoadingCacheCapacityTest state success ' + JSON.stringify(pages));
        if (!("setBlanklessLoadingCacheCapacityTest" == pages.name)) {
          console.info('get setBlanklessLoadingCacheCapacityTest state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push setBlanklessLoadingCacheCapacityTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push setBlanklessLoadingCacheCapacityTest page error: ' + err);
      }
      done();
    });

    /**
     * @tc.name   testsetBlanklessLoadingCacheCapacity001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_ SETBLANKLESSLOADINGCACHECAPACITYTEST_0100
     * @tc.desc   test setBlanklessLoadingCacheCapacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testsetBlanklessLoadingCacheCapacity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent("testsetBlanklessLoadingCacheCapacity001", 148201);
        Utils.registerBaseEvent("testsetBlanklessLoadingCacheCapacity001", 0, 148210, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('setBlanklessLoadingCacheCapacityTestButton', driver);
      })

    /**
     * @tc.name   testsetBlanklessLoadingCacheCapacity002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGCACHECAPACITYTEST_0200
     * @tc.desc   test setBlanklessLoadingCacheCapacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testsetBlanklessLoadingCacheCapacity002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent("testsetBlanklessLoadingCacheCapacity002", 148201);
        Utils.registerBaseEvent("testsetBlanklessLoadingCacheCapacity002", 0, 148220, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('setBlanklessLoadingCacheCapacityTestButton', driver);
      })
    /**
     * @tc.name   testsetBlanklessLoadingCacheCapacity003
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGCACHECAPACITYTEST_0300
     * @tc.desc   test setBlanklessLoadingCacheCapacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testsetBlanklessLoadingCacheCapacity003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent("testsetBlanklessLoadingCacheCapacity003", 148201);
        Utils.registerBaseEvent("testsetBlanklessLoadingCacheCapacity003", 50, 148230, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('setBlanklessLoadingCacheCapacityTestButton', driver);
      })
    /**
     * @tc.name   testsetBlanklessLoadingCacheCapacity004
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGCACHECAPACITYTEST_0400
     * @tc.desc   test setBlanklessLoadingCacheCapacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testsetBlanklessLoadingCacheCapacity004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent("testsetBlanklessLoadingCacheCapacity004", 148201);
        Utils.registerBaseEvent("testsetBlanklessLoadingCacheCapacity004", 100, 148240, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('setBlanklessLoadingCacheCapacityTestButton', driver);
      })
    /**
     * @tc.name   testsetBlanklessLoadingCacheCapacity005
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGCACHECAPACITYTEST_0500
     * @tc.desc   test setBlanklessLoadingCacheCapacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testsetBlanklessLoadingCacheCapacity005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent("testsetBlanklessLoadingCacheCapacity005", 148201);
        Utils.registerBaseEvent("testsetBlanklessLoadingCacheCapacity005", 401, 148250, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('setBlanklessLoadingCacheCapacityTestButton', driver);
      })
    /**
     * @tc.name   testsetBlanklessLoadingCacheCapacity006
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGCACHECAPACITYTEST_0600
     * @tc.desc   test setBlanklessLoadingCacheCapacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testsetBlanklessLoadingCacheCapacity006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent("testsetBlanklessLoadingCacheCapacity006", 148201);
        Utils.registerBaseEvent("testsetBlanklessLoadingCacheCapacity006", 100, 148260, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('setBlanklessLoadingCacheCapacityTestButton', driver);
      })
    /**
     * @tc.name   testsetBlanklessLoadingCacheCapacity007
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGCACHECAPACITYTEST_0700
     * @tc.desc   test setBlanklessLoadingCacheCapacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testsetBlanklessLoadingCacheCapacity007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent("testsetBlanklessLoadingCacheCapacity007", 148201);
        Utils.registerBaseEvent("testsetBlanklessLoadingCacheCapacity007", 0, 148270, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('setBlanklessLoadingCacheCapacityTestButton', driver);
      }) /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGCACHECAPACITYTEST_0800
    * @tc.name       : testsetBlanklessLoadingCacheCapacity008
    * @tc.desc       : test setBlanklessLoadingCacheCapacity
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    /**
     * @tc.name   testsetBlanklessLoadingCacheCapacity008
     * @tc.number testsetBlanklessLoadingCacheCapacity008
     * @tc.desc   testsetBlanklessLoadingCacheCapacity008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testsetBlanklessLoadingCacheCapacity008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent("testsetBlanklessLoadingCacheCapacity008", 148201);
        Utils.registerBaseEvent("testsetBlanklessLoadingCacheCapacity008", 50, 148280, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('setBlanklessLoadingCacheCapacityTestButton', driver);
      })
    /**
     * @tc.name   testsetBlanklessLoadingCacheCapacity009
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGCACHECAPACITYTEST_0900
     * @tc.desc   test setBlanklessLoadingCacheCapacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testsetBlanklessLoadingCacheCapacity009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent("testsetBlanklessLoadingCacheCapacity009", 148201);
        Utils.registerBaseEvent("testsetBlanklessLoadingCacheCapacity009", 100, 148290, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('setBlanklessLoadingCacheCapacityTestButton', driver);
      })
  })
}
