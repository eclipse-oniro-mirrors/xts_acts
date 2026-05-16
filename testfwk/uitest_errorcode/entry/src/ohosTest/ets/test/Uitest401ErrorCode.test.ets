/**
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

import { describe, beforeAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver, Point, ComponentEventType, On } from '@ohos.UiTest'

const TestTag = 'testTag';
const ErrorCode = 401;

export default function abilityTest() {
  describe('uitest401', () => {
    let driver: Driver
    beforeAll(async (done: Function) => {
      driver = Driver.create()
      await driver.delayMs(1000)
      done()
    })

    /**
     * @tc.name   test_injectMultiPointerAction_401
     * @tc.number UiTest_uitest401_001
     * @tc.desc   injectMultiPointerAction 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_injectMultiPointerAction_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_injectMultiPointerAction_401 start`);
      try {
        await driver.injectMultiPointerAction(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_injectMultiPointerAction_401 pointers = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.injectMultiPointerAction(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_injectMultiPointerAction_401 pointers = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        await driver.injectMultiPointerAction(points);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_injectMultiPointerAction_401 pointers = [] error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, {x: 100, y: 100})
        await driver.injectMultiPointerAction(points, -1);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_injectMultiPointerAction_401 speed = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, test_injectMultiPointerAction_401 END`);
    })

    /**
     * @tc.name   test_PointerMatrix_401
     * @tc.number UiTest_uitest401_002
     * @tc.desc   create 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_PointerMatrix_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_PointerMatrix_401 start`);
      try {
        PointerMatrix.create(-1, 1);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_PointerMatrix_401 fingers = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        PointerMatrix.create(1, -1);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_PointerMatrix_401 steps = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(100, 1);
        await driver.injectMultiPointerAction(points);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_PointerMatrix_401 fingers = 100 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1500);
        await driver.injectMultiPointerAction(points);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_PointerMatrix_401 steps = 1500 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, test_PointerMatrix_401 END`);
    })

    /**
     * @tc.name   test_setPoint_401
     * @tc.number UiTest_uitest401_003
     * @tc.desc   setPoint 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setPoint_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_setPoint_401 start`);
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(1, 0, {x: 100, y: 100})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_setPoint_401 finger = 1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 1, {x: 100, y: 100})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_setPoint_401 steps = 1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, {x: -1, y: 100})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_setPoint_401 point.x = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, {x: 100, y: -1})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_setPoint_401 point.y = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, {x: 100, y: 100, displayId: -1})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_setPoint_401 point.displayId = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, test_setPoint_401 END`);
    })
    /**
     * @tc.name   test_swipe_401
     * @tc.number UiTest_uitest401_008
     * @tc.desc   swipe 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_swipe_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_swipe_401 start`);
      try {
        await driver.swipe(-1, 100, 100, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_swipe_401 startx = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(100, -1, 100, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_swipe_401 starty = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(100, 100, -1, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_swipe_401 endx = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(100, 100, 100, -1);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_swipe_401 endy = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(100, 100, 100, 100, -1);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_swipe_401 speed = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, test_swipe_401 END`);
    })
    /**
     * @tc.name   test_type_401
     * @tc.number UiTest_uitest401_009
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_type_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_type_401 start`);
      try {
        ON.type(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_type_401 type = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        ON.type(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_type_401 type = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, test_type_401 END`);
    })
  })
}