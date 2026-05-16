/**
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

import { describe, it, expect, TestType, Level, Size, beforeAll } from '@ohos/hypium'
import {Driver, PenKey, PenKeyOperation, PenMode, Point, TouchOptions,} from '@ohos.UiTest'
import hilog from '@ohos.hilog';

const waitUiReadyMs: number = 1000;
const TestTag = 'UiTest_TAG';
const AsyncErrorCode = 17000002;
const ParameterErrorCode = 17000007;
const ErrorCode17000005 = 17000005;

function sleep(nm: number) {
  return new Promise<void>((resolve: Function, reject: Function) => {
    setTimeout(resolve, nm);
  })
}

export default function uitestApi26ErrorTest() {
  describe('uitestApi26ErrorTest', () => {
    let driver: Driver
    beforeAll(async () => {
      driver = Driver.create()
      await driver.delayMs(1000)
    })

    /**
     * @tc.name   testDriverClickAtErrorConcurrentCallWithPressure
     * @tc.number SUB_testfwk_UITEST_CLICKAT_ERROR_0100
     * @tc.desc   Test clickAt with concurrent call, expecting error 17000002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtErrorConcurrentCallWithPressure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverClickAtErrorConcurrentCallWithPressure start`);
      const point: Point = { x: 100, y: 100 };
      const options: TouchOptions = { pressure: 0.5 };
      try {
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.clickAt(point, options);
        expect().assertFail();
      } catch (err) {
        console.log(`${TestTag}, testDriverClickAtErrorConcurrentCallWithPressure error: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 8);
      console.log(`${TestTag}, testDriverClickAtErrorConcurrentCallWithPressure end`);
    });

    /**
     * @tc.name   testDriverClickAtNullPoint
     * @tc.number SUB_testfwk_UITEST_CLICKAT_ERROR_0200
     * @tc.desc   Test clickAt with null point (should throw 17000007)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtNullPoint', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverClickAtNullPoint start`);
      try {
        await driver.clickAt(null, {pressure: 0.5});
        expect().assertFail();
      } catch (err) {
        console.log(`${TestTag}, testDriverClickAtNullPoint error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testDriverClickAtNullPoint end`);
    });

    /**
     * @tc.name   testDriverClickAtUndefinedPoint
     * @tc.number SUB_testfwk_UITEST_CLICKAT_ERROR_0300
     * @tc.desc   Test clickAt with undefined point (should throw 17000007)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtUndefinedPoint', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverClickAtUndefinedPoint start`);
      try {
        await driver.clickAt(undefined, {pressure: 0.5});
        expect().assertFail();
      } catch (err) {
        console.log(`${TestTag}, testDriverClickAtUndefinedPoint error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testDriverClickAtUndefinedPoint end`);
    });

     /**
       * @tc.name   testDriverClickAtErrorSpeedTooSmall
       * @tc.number SUB_testfwk_UITEST_CLICKAT_ERROR_0400
       * @tc.desc   Test clickAt with speed=199 (less than minimum 200), should throw 17000007
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('testDriverClickAtErrorSpeedTooSmall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverClickAtErrorSpeedTooSmall start`);
      const options: TouchOptions = { speed: 199 };
      try {
        await driver.clickAt({x: 100, y: 100}, options)
        expect().assertFail();
      } catch (err) {
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.log(`${TestTag}, testDriverClickAtErrorSpeedTooSmall end`);
    });

     /**
       * @tc.name   testDriverClickAtErrorSpeedTooLarge
       * @tc.number SUB_testfwk_UITEST_CLICKAT_ERROR_0500
       * @tc.desc   Test clickAt with speed=40001 (greater than maximum 40000), should throw 17000007
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('testDriverClickAtErrorSpeedTooLarge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverClickAtErrorSpeedTooLarge start`);
      const options: TouchOptions = { speed: 40001 };
      try {
        await driver.clickAt({x: 100, y: 100}, options)
        expect().assertFail();
      } catch (err) {
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.log(`${TestTag}, testDriverClickAtErrorSpeedTooLarge end`);
    });

     /**
      * @tc.name   testDriverClickAtErrorPressureTooSmall
      * @tc.number SUB_testfwk_UITEST_CLICKAT_ERROR_0600
      * @tc.desc   Test clickAt with pressure=-0.1 (less than minimum 0), should throw 17000007
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverClickAtErrorPressureTooSmall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverClickAtErrorPressureTooSmall start`);
      const point: Point = { x: 100, y: 100 };
      const options: TouchOptions = { pressure: -0.1 };
      try {
        await driver.clickAt(point, options)
        expect().assertFail();
      } catch (err) {
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.log(`${TestTag}, testDriverClickAtErrorPressureTooSmall end`);
    });

     /**
      * @tc.name   testDriverClickAtErrorPressureTooLarge
      * @tc.number SUB_testfwk_UITEST_CLICKAT_ERROR_0700
      * @tc.desc   Test clickAt with pressure=1.5 (greater than maximum 1), should throw 17000007
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverClickAtErrorPressureTooLarge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverClickAtErrorPressureTooLarge start`);
      const point: Point = { x: 100, y: 100 };
      const options: TouchOptions = { pressure: 1.5 };
      try {
        await driver.clickAt(point, options);
        expect().assertFail();
      } catch (err) {
        console.log(`${TestTag}, testDriverClickAtErrorPressureTooLarge error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testDriverClickAtErrorPressureTooLarge end`);
    });

     /**
      * @tc.name   testDriverClickAtUnsupportedDurationBelowMin
      * @tc.number SUB_testfwk_UITEST_CLICKAT_ERROR_0800
      * @tc.desc   Test clickAt with duration=1000 (below minimum 1500, not supported), should throw 17000007
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverClickAtUnsupportedDurationBelowMin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverClickAtUnsupportedDurationBelowMin start`);
      const point: Point = { x: 100, y: 100 };
      const options: TouchOptions = { duration: 1000 };
      try {
        await driver.clickAt(point, options)
        expect().assertFail();
      } catch (err) {
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.log(`${TestTag}, testDriverClickAtUnsupportedDurationBelowMin end`);
    });

     /**
      * @tc.name   testDriverClickAtUnsupportedDurationZero
      * @tc.number SUB_testfwk_UITEST_CLICKAT_ERROR_0900
      * @tc.desc   Test clickAt with duration=0 (zero value, not supported), should throw 17000007
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverClickAtUnsupportedDurationZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverClickAtUnsupportedDurationZero start`);
      const point: Point = { x: 100, y: 100 };
      const options: TouchOptions = { duration: 0 };
      try {
        await driver.clickAt(point, options)
        expect().assertFail();
      } catch (err) {
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.log(`${TestTag}, testDriverClickAtUnsupportedDurationZero end`);
    });

    /**
     * @tc.name   testDriverLongClickAtErrorDurationTooSmall
     * @tc.number SUB_testfwk_UITEST_LONGCLICKAT_ERROR_0100
     * @tc.desc   Test longClickAt with duration=1499 (less than minimum 1500), should throw 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtErrorDurationTooSmall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtErrorDurationTooSmall start`);
      const options: TouchOptions = { duration: 1499 };
      try {
        await driver.longClickAt({x: 100, y: 100}, options)
        expect().assertFail();
      } catch (err) {
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.log(`${TestTag}, testDriverLongClickAtErrorDurationTooSmall end`);
    });

    /**
     * @tc.name   testDriverLongClickAtErrorPressureTooSmall
     * @tc.number SUB_testfwk_UITEST_LONGCLICKAT_ERROR_0200
     * @tc.desc   Test longClickAt with pressure=-0.1 (less than minimum 0), should throw 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtErrorPressureTooSmall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtErrorPressureTooSmall start`);
      const options: TouchOptions = { pressure: -0.1 };
      try {
        await driver.longClickAt({x: 100, y: 100}, options)
        expect().assertFail();
      } catch (err) {
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.log(`${TestTag}, testDriverLongClickAtErrorPressureTooSmall end`);
    });

    /**
     * @tc.name   testDriverLongClickAtErrorPressureTooLarge
     * @tc.number SUB_testfwk_UITEST_LONGCLICKAT_ERROR_0300
     * @tc.desc   Test longClickAt with pressure=1.1 (greater than maximum 1), should throw 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtErrorPressureTooLarge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtErrorPressureTooLarge start`);
      const options: TouchOptions = { pressure: 1.1 };
      try {
        await driver.longClickAt({x: 100, y: 100}, options)
        expect().assertFail();
      } catch (err) {
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.log(`${TestTag}, testDriverLongClickAtErrorPressureTooLarge end`);
    });

    /**
     * @tc.name   testDriverLongClickAtErrorSpeedTooSmall
     * @tc.number SUB_testfwk_UITEST_LONGCLICKAT_ERROR_0400
     * @tc.desc   Test longClickAt with speed=199 (less than minimum 200), should throw 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtErrorSpeedTooSmall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtErrorSpeedTooSmall start`);
      const options: TouchOptions = { speed: 199 };
      try {
        await driver.longClickAt({x: 100, y: 100}, options)
        expect().assertFail();
      } catch (err) {
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.log(`${TestTag}, testDriverLongClickAtErrorSpeedTooSmall end`);
    });

    /**
     * @tc.name   testDriverLongClickAtErrorSpeedTooLarge
     * @tc.number SUB_testfwk_UITEST_LONGCLICKAT_ERROR_0500
     * @tc.desc   Test longClickAt with speed=40001 (greater than maximum 40000), should throw 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtErrorSpeedTooLarge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtErrorSpeedTooLarge start`);
      const options: TouchOptions = { speed: 40001 };
      try {
        await driver.longClickAt({x: 100, y: 100}, options)
        expect().assertFail();
      } catch (err) {
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.log(`${TestTag}, testDriverLongClickAtErrorSpeedTooLarge end`);
    });

    /**
     * @tc.name   testDriverLongClickAtErrorSpeedNegative
     * @tc.number SUB_testfwk_UITEST_LONGCLICKAT_ERROR_0600
     * @tc.desc   Test longClickAt with speed=-100 (negative), should throw 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtErrorSpeedNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtErrorSpeedNegative start`);
      const options: TouchOptions = { speed: -100 };
      try {
        await driver.longClickAt({x: 100, y: 100}, options)
        expect().assertFail();
      } catch (err) {
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.log(`${TestTag}, testDriverLongClickAtErrorSpeedNegative end`);
    });

    /**
     * @tc.name   testDriverLongClickAtPointNull
     * @tc.number SUB_testfwk_UITEST_LONGCLICKAT_ERROR_0700
     * @tc.desc   Test longClickAt with point = null, should throw error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtPointNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtPointNull start`);
      try {
        await driver.longClickAt(null, {speed: 500});
        expect().assertFail();
      } catch (err) {
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testDriverLongClickAtPointNull end`);
    });

    /**
     * @tc.name   testDriverLongClickAtPointUndefined
     * @tc.number SUB_testfwk_UITEST_LONGCLICKAT_ERROR_0800
     * @tc.desc   Test longClickAt with point = undefined, should throw error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtPointUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtPointUndefined start`);
      try {
        await driver.longClickAt(undefined, {speed: 500});
        expect().assertFail();
      } catch (err) {
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testDriverLongClickAtPointUndefined end`);
    });

    /**
     * @tc.name   testDriverLongClickAtConcurrentCallWithOptions
     * @tc.number SUB_testfwk_UITEST_LONGCLICKAT_ERROR_0900
     * @tc.desc   Test longClickAt concurrent call with options parameter, should throw 17000002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtConcurrentCallWithOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtConcurrentCallWithOptions start`);
      const point: Point = { x: 100, y: 100 };
      const options: TouchOptions = { pressure: 0.5 };
      try {
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.longClickAt(point, options);
        expect().assertFail();
      } catch (err) {
        console.log(`${TestTag}, testDriverLongClickAtConcurrentCallWithOptions error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 8);
      console.log(`${TestTag}, testDriverLongClickAtConcurrentCallWithOptions end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenSpeedNegative
     * @tc.number SUB_testfwk_UITEST_SWIPEBETWEEN_ERROR_0100
     * @tc.desc   Test swipeBetween with negative speed, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenSpeedNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenSpeedNegative start`);
      const options: TouchOptions = { speed: -1 };
      try {
        await driver.swipeBetween({x: 100, y: 100}, {x: 200, y: 200}, options)
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverSwipeBetweenSpeedNegative error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverSwipeBetweenSpeedNegative end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenPressureOutOfRangeLow
     * @tc.number SUB_testfwk_UITEST_SWIPEBETWEEN_ERROR_0200
     * @tc.desc   Test swipeBetween with pressure out of range (< 0), expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenPressureOutOfRangeLow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenPressureOutOfRangeLow start`);
      const options: TouchOptions = { pressure: -0.1 };
      try {
        await driver.swipeBetween({x: 100, y: 100}, {x: 200, y: 200}, options)
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverSwipeBetweenPressureOutOfRangeLow error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverSwipeBetweenPressureOutOfRangeLow end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenPressureOutOfRangeHigh
     * @tc.number SUB_testfwk_UITEST_SWIPEBETWEEN_ERROR_0300
     * @tc.desc   Test swipeBetween with pressure out of range (> 1), expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenPressureOutOfRangeHigh', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenPressureOutOfRangeHigh start`);
      const options: TouchOptions = { pressure: 1.1 };
      try {
        await driver.swipeBetween({x: 100, y: 100}, {x: 200, y: 200}, options)
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverSwipeBetweenPressureOutOfRangeHigh error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverSwipeBetweenPressureOutOfRangeHigh end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenDisplayIdDiff
     * @tc.number SUB_testfwk_UITEST_SWIPEBETWEEN_ERROR_0400
     * @tc.desc   Test swipeBetween with speed out of range (> 40000), expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenDisplayIdDiff', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenDisplayIdDiff start`);
      const options: TouchOptions = { speed: 800 };
      try {
        await driver.swipeBetween({x: 100, y: 100, displayId: 0}, {x: 200, y: 200, displayId: 1}, options)
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverSwipeBetweenDisplayIdDiff error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverSwipeBetweenDisplayIdDiff end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenConcurrentCall
     * @tc.number SUB_testfwk_UITEST_SWIPEBETWEEN_ERROR_0500
     * @tc.desc   Test swipeBetween with concurrent call, expecting error 17000002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenConcurrentCall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenConcurrentCall start`);
      const from: Point = { x: 100, y: 100 };
      const to: Point = { x: 200, y: 200 };
      const options: TouchOptions = { speed: 2000 };
      try {
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.swipeBetween(from, to, options);
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverSwipeBetweenConcurrentCall error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 8);
      console.info(`${TestTag}, testDriverSwipeBetweenConcurrentCall end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenNullFrom
     * @tc.number SUB_testfwk_UITEST_SWIPEBETWEEN_ERROR_0600
     * @tc.desc   Test swipeBetween with null from parameter, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenNullFrom', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverSwipeBetweenNullFrom start`);
      const to: Point = { x: 200, y: 200 };
      try {
        await driver.swipeBetween(null, to, {speed: 2000});
        expect().assertFail();
      } catch (err) {
        console.log(`${TestTag}, testDriverSwipeBetweenNullFrom error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testDriverSwipeBetweenNullFrom end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenUndefinedFrom
     * @tc.number SUB_testfwk_UITEST_SWIPEBETWEEN_ERROR_0700
     * @tc.desc   Test swipeBetween with undefined from parameter, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenUndefinedFrom', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverSwipeBetweenUndefinedFrom start`);
      const to: Point = { x: 200, y: 200 };
      try {
        await driver.swipeBetween(undefined, to, {speed: 2000});
        expect().assertFail();
      } catch (err) {
        console.log(`${TestTag}, testDriverSwipeBetweenUndefinedFrom error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testDriverSwipeBetweenUndefinedFrom end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenNullTo
     * @tc.number SUB_testfwk_UITEST_SWIPEBETWEEN_ERROR_0800
     * @tc.desc   Test swipeBetween with null to parameter, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenNullTo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverSwipeBetweenNullTo start`);
      const from: Point = { x: 100, y: 100 };
      try {
        await driver.swipeBetween(from, null, {speed: 2000});
        expect().assertFail();
      } catch (err) {
        console.log(`${TestTag}, testDriverSwipeBetweenNullTo error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testDriverSwipeBetweenNullTo end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenUndefinedTo
     * @tc.number SUB_testfwk_UITEST_SWIPEBETWEEN_ERROR_0900
     * @tc.desc   Test swipeBetween with undefined to parameter, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenUndefinedTo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverSwipeBetweenUndefinedTo start`);
      const from: Point = { x: 100, y: 100 };
      try {
        await driver.swipeBetween(from, undefined, {speed: 2000});
        expect().assertFail();
      } catch (err) {
        console.log(`${TestTag}, testDriverSwipeBetweenUndefinedTo error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testDriverSwipeBetweenUndefinedTo end`);
    });

    /**
     * @tc.name   testDriverDragBetweenConcurrentCalls
     * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_ERROR_0100
     * @tc.desc   Test dragBetween with concurrent call, expecting error 17000002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDragBetweenConcurrentCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenConcurrentCalls start`);
      try {
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        const options: TouchOptions = { duration: 1500 };
        await driver.dragBetween({x: 100, y: 200}, {x:200, y: 200}, options);
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverDragBetweenConcurrentCalls error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 8);
      console.info(`${TestTag}, testDriverDragBetweenConcurrentCalls end`);
    });

    /**
     * @tc.name   testDriverDragBetweenWithNegativeSpeed
     * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_ERROR_0200
     * @tc.desc   Test dragBetween with negative speed, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDragBetweenWithNegativeSpeed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithNegativeSpeed start`);
      const options: TouchOptions = { speed: -1 };
      try {
        await driver.dragBetween({x: 100, y: 100}, {x: 200, y: 200}, options)
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverDragBetweenWithNegativeSpeed error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverDragBetweenWithNegativeSpeed end`);
    });


    /**
     * @tc.name   testDriverDragBetweenWithDurationLessThanMin
     * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_ERROR_0300
     * @tc.desc   Test dragBetween with duration < 1500, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDragBetweenWithDurationLessThanMin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithDurationLessThanMin start`);
      const options: TouchOptions = { duration: 1000 };
      try {
        await driver.dragBetween({x: 100, y: 100}, {x: 200, y: 200}, options)
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverDragBetweenWithDurationLessThanMin error is ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverDragBetweenWithDurationLessThanMin end`);
    });

     /**
       * @tc.name   testDriverDragBetweenErrorSpeedTooLarge
       * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_ERROR_0700
       * @tc.desc   Test dragBetween with speed greater than 40000, expecting error 17000007
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       @tc.level  LEVEL3
       */
    it('testDriverDragBetweenErrorSpeedTooLarge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverDragBetweenErrorSpeedTooLarge start`);
      const from: Point = { x: 500, y: 1000 };
      const to: Point = { x: 500, y: 800 };
      const touchOptions: TouchOptions = { speed: 40001 };
      try {
        await driver.dragBetween(from, to, touchOptions);
      } catch (err) {
        console.log(`${TestTag}, testDriverDragBetweenErrorSpeedTooLarge error is: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testDriverDragBetweenErrorSpeedTooLarge end`);
    });

     /**
       * @tc.name   testDriverDragBetweenErrorSpeedTooSmall
       * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_ERROR_0800
       * @tc.desc   Test dragBetween with speed less than 200, expecting error 17000007
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('testDriverDragBetweenErrorSpeedTooSmall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverDragBetweenErrorSpeedTooSmall start`);
      const from: Point = { x: 500, y: 1000 };
      const to: Point = { x: 500, y: 800 };
      const touchOptions: TouchOptions = { speed: 199 };
      try {
        await driver.dragBetween(from, to, touchOptions);
      } catch (err) {
        console.log(`${TestTag}, testDriverDragBetweenErrorSpeedTooSmall error is: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testDriverDragBetweenErrorSpeedTooSmall end`);
    });

    /**
     * @tc.name   testDriverDragBetweenWithNegativePressure
     * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_ERROR_0400
     * @tc.desc   Test dragBetween with negative pressure, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDragBetweenWithNegativePressure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithNegativePressure start`);
      const options: TouchOptions = { pressure: -0.5 };
      try {
        await driver.dragBetween({x: 100, y: 100}, {x: 200, y: 200}, options)
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverDragBetweenWithNegativePressure error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverDragBetweenWithNegativePressure end`);
    });

    /**
     * @tc.name   testDriverDragBetweenWithPressureGreaterThanOne
     * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_ERROR_0500
     * @tc.desc   Test dragBetween with pressure > 1, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDragBetweenWithPressureGreaterThanOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithPressureGreaterThanOne start`);
      const options: TouchOptions = { pressure: 1.5 };
      try {
        await driver.dragBetween({x: 100, y: 100}, {x: 200, y: 200}, options)
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverDragBetweenWithPressureGreaterThanOne error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverDragBetweenWithPressureGreaterThanOne end`);
    });

    /**
     * @tc.name   testDriverDragBetweenDisplayIdDiff
     * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_ERROR_0600
     * @tc.desc   Test dragBetween displayId diff, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDragBetweenDisplayIdDiff', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenDisplayIdDiff start`);
      const options: TouchOptions = { speed: 800 };
      try {
        await driver.dragBetween({x: 100, y: 100, displayId: 0}, {x: 200, y: 200, displayId: 1}, options)
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverDragBetweenDisplayIdDiff error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverDragBetweenDisplayIdDiff end`);
    });

     /**
       * @tc.name   testDriverDragBetweenApi26FromNull
       * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_ERROR_0900
       * @tc.desc   Test dragBetween API 26.0 with from=null, expecting error 17000007
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('testDriverDragBetweenApi26FromNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenApi26FromNull start`);
      try {
        await driver.dragBetween(null, {x: 200, y: 200}, {speed: 3000})
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverDragBetweenApi26FromNull error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverDragBetweenApi26FromNull end`);
    });

     /**
       * @tc.name   testDriverDragBetweenApi26FromUndefined
       * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_ERROR_1000
       * @tc.desc   Test dragBetween API 26.0 with from=undefined, expecting error 17000007
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('testDriverDragBetweenApi26FromUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenApi26FromUndefined start`);
      try {
        await driver.dragBetween(undefined, {x: 200, y: 200}, {speed: 3000})
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverDragBetweenApi26FromUndefined error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverDragBetweenApi26FromUndefined end`);
    });

     /**
       * @tc.name   testDriverDragBetweenApi26FromNullNoOptions
       * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_ERROR_1100
       * @tc.desc   Test dragBetween API 26.0 with from=null and no options, expecting error 17000007
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       @tc.level  LEVEL3
       */
    it('testDriverDragBetweenApi26FromNullNoOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenApi26FromNullNoOptions start`);
      try {
        await driver.dragBetween(null, {x: 200, y: 200}, {speed: 600})
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverDragBetweenApi26FromNullNoOptions error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverDragBetweenApi26FromNullNoOptions end`);
    });

     /**
       * @tc.name   testDriverDragBetweenApi26FromUndefinedNoOptions
       * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_ERROR_1200
       * @tc.desc   Test dragBetween API 26.0 with from=undefined and no options, expecting error 17000007
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('testDriverDragBetweenApi26FromUndefinedNoOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenApi26FromUndefinedNoOptions start`);
      try {
        await driver.dragBetween(undefined, {x: 200, y: 200}, {speed: 600})
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverDragBetweenApi26FromUndefinedNoOptions error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverDragBetweenApi26FromUndefinedNoOptions end`);
    });

     /**
       * @tc.name   testDriverDragBetweenApi26ToNull
       * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_ERROR_1300
       * @tc.desc   Test dragBetween API 26.0 with to=null, expecting error 17000007
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('testDriverDragBetweenApi26ToNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenApi26ToNull start`);
      try {
        await driver.dragBetween({x: 100, y: 100}, null, {speed: 3000})
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverDragBetweenApi26ToNull error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverDragBetweenApi26ToNull end`);
    });

     /**
       * @tc.name   testDriverDragBetweenApi26ToUndefined
       * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_ERROR_1400
       * @tc.desc   Test dragBetween API 26.0 with to=undefined, expecting error 17000007
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       @tc.level  LEVEL3
       */
    it('testDriverDragBetweenApi26ToUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenApi26ToUndefined start`);
      try {
        await driver.dragBetween({x: 100, y: 100}, undefined, {speed: 3000})
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverDragBetweenApi26ToUndefined error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverDragBetweenApi26ToUndefined end`);
    });

     /**
       * @tc.name   testDriverDragBetweenApi26FromNullToNull
       * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_ERROR_1500
       * @tc.desc   Test dragBetween API 26.0 with from=null and to=null, expecting error 17000007
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('testDriverDragBetweenApi26FromNullToNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenApi26FromNullToNull start`);
      try {
        await driver.dragBetween(null, null, {speed: 3000})
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverDragBetweenApi26FromNullToNull error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverDragBetweenApi26FromNullToNull end`);
    });

     /**
       * @tc.name   testDriverDragBetweenApi26FromUndefinedToUndefined
       * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_ERROR_1600
       * @tc.desc   Test dragBetween API 26.0 with from=undefined and to=undefined, expecting error 17000007
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('testDriverDragBetweenApi26FromUndefinedToUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenApi26FromUndefinedToUndefined start`);
      try {
        await driver.dragBetween(undefined, undefined, {speed: 3000})
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverDragBetweenApi26FromUndefinedToUndefined error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverDragBetweenApi26FromUndefinedToUndefined end`);
    });

     /**
      * @tc.name   testDriverDragBetweenApi26ToNullNoOptions
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_ERROR_1700
      * @tc.desc   Test dragBetween API 26.0 with to=null and no options, expecting error 17000007
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenApi26ToNullNoOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenApi26ToNullNoOptions start`);
      try {
        await driver.dragBetween({x: 100, y: 100}, null)
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverDragBetweenApi26ToNullNoOptions error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverDragBetweenApi26ToNullNoOptions end`);
    });

     /**
      * @tc.name   testDriverDragBetweenApi26ToUndefinedNoOptions
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_ERROR_1800
      * @tc.desc   Test dragBetween API 26.0 with to=undefined and no options, expecting error 17000007
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenApi26ToUndefinedNoOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenApi26ToUndefinedNoOptions start`);
      try {
        await driver.dragBetween({x: 100, y: 100}, undefined)
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverDragBetweenApi26ToUndefinedNoOptions error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverDragBetweenApi26ToUndefinedNoOptions end`);
    });

     /**
      * @tc.name   testDriverDragBetweenApi26FromNullToUndefined
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_ERROR_1900
      * @tc.desc   Test dragBetween API 26.0 with from=null and to=undefined, expecting error 17000007
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenApi26FromNullToUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenApi26FromNullToUndefined start`);
      try {
        await driver.dragBetween(null, undefined, {speed: 3000})
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverDragBetweenApi26FromNullToUndefined error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverDragBetweenApi26FromNullToUndefined end`);
    });

     /**
      * @tc.name   testDriverDragBetweenApi26FromUndefinedToNull
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_ERROR_2000
      * @tc.desc   Test dragBetween API 26.0 with from=null and to=null and no options
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenApi26FromUndefinedToNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenApi26FromUndefinedToNull start`);
      try {
        await driver.dragBetween(undefined, null, {speed: 3000})
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverDragBetweenApi26FromUndefinedToNull error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverDragBetweenApi26FromUndefinedToNull end`);
    });

    /**
     * @tc.name   testDriverDumpLayoutErrorConcurrentCall
     * @tc.number SUB_testfwk_UITEST_DUMPLAYOUT_ERROR_0100
     * @tc.desc   Test dumpLayout with concurrent call, expecting error 17000002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDumpLayoutErrorConcurrentCall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverDumpLayoutErrorConcurrentCall start`);
      let savePath = '/data/storage/el2/base/cache/dump_layout_error_009.json'
      try {
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.dumpLayout(savePath, 0);
        expect().assertFail();
      } catch (err) {
        console.log(`${TestTag}, testDriverDumpLayoutErrorConcurrentCall error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 8);
      console.log(`${TestTag}, testDriverDumpLayoutErrorConcurrentCall end`);
    });

    /**
     * @tc.name   testDriverDumpLayoutErrorEmptyPath
     * @tc.number SUB_testfwk_UITEST_DUMPLAYOUT_ERROR_0200
     * @tc.desc   Test dumpLayout with empty savePath parameter, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDumpLayoutErrorEmptyPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverDumpLayoutErrorEmptyPath start`);
      const savePath: string = '';
      try {
        await driver.dumpLayout(savePath, 0);
        expect().assertFalse();
      } catch (err) {
        console.log(`${TestTag}, testDriverDumpLayoutErrorEmptyPath error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(17000007);
      }
      console.log(`${TestTag}, testDriverDumpLayoutErrorEmptyPath end`);
    });

    /**
     * @tc.name   testDriverDumpLayoutErrorInvalidPath
     * @tc.number SUB_testfwk_UITEST_DUMPLAYOUT_ERROR_0300
     * @tc.desc   Test dumpLayout with path outside sandbox, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDumpLayoutErrorInvalidPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverDumpLayoutErrorInvalidPath start`);
      const savePath: string = '/invalid/path/outside/sandbox.json';
      try {
        await driver.dumpLayout(savePath, 0);
        expect().assertFalse();
      } catch (err) {
        console.log(`${TestTag}, testDriverDumpLayoutErrorInvalidPath error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(17000007);
      }
      console.log(`${TestTag}, testDriverDumpLayoutErrorInvalidPath end`);
    });

    /**
     * @tc.name   testDriverDumpLayoutErrorNegativeDisplayId
     * @tc.number SUB_testfwk_UITEST_DUMPLAYOUT_ERROR_0400
     * @tc.desc   Test dumpLayout with negative displayId parameter, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDumpLayoutErrorNegativeDisplayId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverDumpLayoutErrorNegativeDisplayId start`);
      let savePath = '/data/storage/el2/base/cache/dump_layout_error_003.json'
      const displayId: number = -1;
      try {
        await driver.dumpLayout(savePath, displayId);
        expect().assertFalse();
      } catch (err) {
        console.log(`${TestTag}, testDriverDumpLayoutErrorNegativeDisplayId error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(17000007);
      }
      console.log(`${TestTag}, testDriverDumpLayoutErrorNegativeDisplayId end`);
    });

    /**
     * @tc.name   testDriverDumpLayoutErrorNullSavePath
     * @tc.number SUB_testfwk_UITEST_DUMPLAYOUT_ERROR_0500
     * @tc.desc   Test dumpLayout with null savePath parameter, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDumpLayoutErrorNullSavePath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverDumpLayoutErrorNullSavePath start`);
      const savePath: ESObject = null;
      try {
        await driver.dumpLayout(savePath, 0);
        expect().assertFalse();
      } catch (err) {
        console.log(`${TestTag}, testDriverDumpLayoutErrorNullSavePath error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(17000007);
      }
      console.log(`${TestTag}, testDriverDumpLayoutErrorNullSavePath end`);
    });

    /**
     * @tc.name   testDriverDumpLayoutErrorUndefinedSavePath
     * @tc.number SUB_testfwk_UITEST_DUMPLAYOUT_ERROR_0600
     * @tc.desc   Test dumpLayout with undefined savePath parameter, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDumpLayoutErrorUndefinedSavePath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverDumpLayoutErrorUndefinedSavePath start`);
      const savePath: ESObject = undefined;
      try {
        await driver.dumpLayout(savePath, 0);
        expect().assertFalse();
      } catch (err) {
        console.log(`${TestTag}, testDriverDumpLayoutErrorUndefinedSavePath error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(17000007);
      }
      console.log(`${TestTag}, testDriverDumpLayoutErrorUndefinedSavePath end`);
    });

    /**
     * @tc.name   testDriverMouseDragPressureMinimum
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_BOUNDARY_0500
     * @tc.desc   Test mouseDrag with minimum pressure value (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragPressureMinimum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragPressureMinimum start`);
      try {
        const touchOptions: TouchOptions = { pressure: 0 };
        await driver.mouseDrag({x: 100, y: 100}, {x: 100, y: 100}, touchOptions);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testDriverMouseDragPressureMinimum error is: ${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(17000007);
      }
      console.log(`${TestTag}, testDriverMouseDragPressureMinimum end`);
    });

    /**
     * @tc.name   testDriverMouseDragPressureMaximum
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_BOUNDARY_0400
     * @tc.desc   Test mouseDrag with maximum pressure value (1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragPressureMaximum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragPressureMaximum start`);
      const touchOptions: TouchOptions = { pressure: 1 };
      try {
        await driver.mouseDrag({x: 100, y: 100}, {x: 100, y: 100}, touchOptions);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testDriverMouseDragPressureMinimum error is: ${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(17000007);
      }
      console.log(`${TestTag}, testDriverMouseDragPressureMaximum end`);
    });

    /**
     * @tc.name   testDriverMouseDragErrorConcurrentCall
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_ERROR_0100
     * @tc.desc   Test mouseDrag with concurrent call, expecting error 17000002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragErrorConcurrentCall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragErrorConcurrentCall start`);
      const from: Point = { x: 500, y: 1000 };
      const to: Point = { x: 500, y: 800 };
      try {
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.mouseDrag(from, to, {speed: 600}, {key1: 0});
        expect().assertFail();
      } catch (err) {
        console.log(`${TestTag}, testDriverMouseDragErrorConcurrentCall error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 8);
      console.log(`${TestTag}, testDriverMouseDragErrorConcurrentCall end`);
    });

    /**
     * @tc.name   testDriverMouseDragErrorSpeedNegative
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_ERROR_0200
       @tc.desc   Test mouseDrag with negative speed, expecting error 17000002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragErrorSpeedNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragErrorSpeedNegative start`);
      const from: Point = { x: 500, y: 1000 };
      const to: Point = { x: 500, y: 800 };
      const touchOptions: TouchOptions = { speed: -100 };
      try {
        await driver.mouseDrag(from, to, touchOptions);
        expect().assertFail();
      } catch (err) {
        console.log(`${TestTag}, testDriverMouseDragErrorSpeedNegative error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testDriverMouseDragErrorSpeedNegative end`);
    });

    /**
     * @tc.name   testDriverMouseDragErrorDurationTooSmall
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_ERROR_0500
     @tc.desc   Test mouseDrag with duration less than 1500, expecting error 17000007
     @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     @tc.level  LEVEL3
     */
    it('testDriverMouseDragErrorDurationTooSmall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragErrorDurationTooSmall start`);
      const from: Point = { x: 500, y: 1000 };
      const to: Point = { x: 500, y: 800 };
      const touchOptions: TouchOptions = { duration: 1499 };
      try {
        await driver.mouseDrag(from, to, touchOptions);
        expect().assertFail();
      } catch (err) {
        console.log(`${TestTag}, testDriverMouseDragErrorDurationTooSmall error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testDriverMouseDragErrorDurationTooSmall end`);
    });

    /**
     * @tc.name   testDriverMouseDragErrorPressureTooSmall
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_ERROR_0600
     @tc.desc   Test mouseDrag with pressure greater than1, expecting error 17000007
     @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragErrorPressureTooSmall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragErrorPressureTooSmall start`);
      const from: Point = { x: 500, y: 1000 };
      const to: Point = { x: 500, y: 800 };
      const touchOptions: TouchOptions = { pressure: -0.1 };
      try {
        await driver.mouseDrag(from, to, touchOptions);
        expect().assertFail();
      } catch (err) {
        console.log(`${TestTag}, testDriverMouseDragErrorPressureTooSmall error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testDriverMouseDragErrorPressureTooSmall end`);
    });

    /**
     * @tc.name   testDriverMouseDragErrorPressureTooLarge
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_ERROR_0700
     * @tc.desc   Test mouseDrag with pressure greater than1, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragErrorPressureTooLarge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragErrorPressureTooLarge start`);
      const from: Point = { x: 500, y: 1000 };
      const to: Point = { x: 500, y: 800 };
      const touchOptions: TouchOptions = { pressure: 1.1 };
      try {
        await driver.mouseDrag(from, to, touchOptions);
        expect().assertFail();
      } catch (err) {
        console.log(`${TestTag}, testDriverMouseDragErrorPressureTooLarge error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testDriverMouseDragErrorPressureTooLarge end`);
    });

    /**
     * @tc.name   testDriverMouseDragErrorDisplayIdDiff
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_ERROR_0800
     * @tc.desc   Test mouseDrag with displayId diff
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     @tc.level  LEVEL3
     */
    it('testDriverMouseDragErrorDisplayIdDiff', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragErrorDisplayIdDiff start`);
      const from: Point = { x: 500, y: 1000, displayId: 0 };
      const to: Point = { x: 500, y: 800, displayId: 1 };
      const touchOptions: TouchOptions = { pressure: 1.0 };
      try {
        await driver.mouseDrag(from, to, touchOptions);
        expect().assertFail();
      } catch (err) {
        console.log(`${TestTag}, testDriverMouseDragErrorDisplayIdDiff error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testDriverMouseDragErrorDisplayIdDiff end`);
    });

    /**
     * @tc.name   testDriverMouseDragErrorNullFromPoint
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_ERROR_0900
     @tc.desc   Test mouseDrag with undefined from point
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragErrorNullFromPoint', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragErrorNullFromPoint start`);
      const from: ESObject = null;
      const to: Point = { x: 500, y: 800 };
      try {
        await driver.mouseDrag(from as Point, to, {speed: 600}, {key1: 0});
        expect().assertFail();
      } catch (err) {
        console.log(`${TestTag}, testDriverMouseDragErrorNullFromPoint error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testDriverMouseDragErrorNullFromPoint end`);
    });

    /**
     * @tc.name   testDriverMouseDragErrorUndefinedFromPoint
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_ERROR_1000
     * @tc.desc   Test mouseDrag with undefined from point, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragErrorUndefinedFromPoint', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragErrorUndefinedFromPoint start`);
      const from: ESObject = undefined;
      const to: Point = { x: 500, y: 800 };
      try {
        await driver.mouseDrag(from as Point, to, {speed: 600}, {key1: 0});
        expect().assertFail();
      } catch (err) {
        console.log(`${TestTag}, testDriverMouseDragErrorUndefinedFromPoint error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testDriverMouseDragErrorUndefinedFromPoint end`);
    });

    /**
     * @tc.name   testDriverMouseDragErrorNullToPoint
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_ERROR_1100
     @tc.desc   Test mouseDrag with null to point
     @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     @tc.level  LEVEL3
     */
    it('testDriverMouseDragErrorNullToPoint', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragErrorNullToPoint start`);
      const from: Point = { x: 500, y: 1000 };
      const to: ESObject = null;
      try {
        await driver.mouseDrag(from, to as Point, {speed: 600}, {key1: 0});
        expect().assertFail();
      } catch (err) {
        console.log(`${TestTag}, testDriverMouseDragErrorNullToPoint error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testDriverMouseDragErrorNullToPoint end`);
    });

    /**
     * @tc.name   testDriverMouseDragErrorUndefinedToPoint
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_ERROR_1200
     * @tc.desc   Test mouseDrag with undefined to point, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragErrorUndefinedToPoint', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragErrorUndefinedToPoint start`);
      const from: Point = { x: 500, y: 1000 };
      const to: ESObject = undefined;
      try {
        await driver.mouseDrag(from, to as Point, {speed: 600}, {key1: 0});
        expect().assertFail();
      } catch (err) {
        console.log(`${TestTag}, testDriverMouseDragErrorUndefinedToPoint error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testDriverMouseDragErrorUndefinedToPoint end`);
    });

    /**
     * @tc.name   testDriverTriggerPenKeyAirMouseWithoutPoint
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_ERROR_0100
     * @tc.desc   Test Driver.triggerPenKey with AIR_MOUSE mode without point in options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyAirMouseWithoutPoint', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyAirMouseWithoutPoint start');
      try {
        await driver.triggerPenKey(PenKey.AIR_MOUSE, PenMode.AIR_MOUSE, PenKeyOperation.CLICK, {});
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyAirMouseWithoutPoint error: ' + error.code);
        expect(error.code === ErrorCode17000005 || error.code === ParameterErrorCode).assertTrue();
      }
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyAirMouseWithoutPoint over');
    });

    /**
     * @tc.name   testDriverTriggerPenKeyAirMouseWithNullPoint
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_ERROR_0200
     * @tc.desc   Test Driver.triggerPenKey with AIR_MOUSE mode and null point in options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyAirMouseWithNullPoint', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyAirMouseWithNullPoint start');
      try {
        await driver.triggerPenKey(PenKey.AIR_MOUSE, PenMode.AIR_MOUSE, PenKeyOperation.CLICK, { point: null });
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyAirMouseWithNullPoint error: ' + error.code);
        expect(error.code === ErrorCode17000005 || error.code === ParameterErrorCode).assertTrue();
      }
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyAirMouseWithNullPoint over');
    });

    /**
     * @tc.name   testDriverTriggerPenKeyKeyNull
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_ERROR_0300
     * @tc.desc   Test Driver.triggerPenKey with null key parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyKeyNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyKeyNull start');
      try {
        await driver.triggerPenKey(null, PenMode.HANDWRITING, PenKeyOperation.CLICK);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyKeyNull error: ' + error.code);
        expect(error.code).assertEqual(ParameterErrorCode);
      }
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyKeyNull over');
    });

    /**
     * @tc.name   testDriverTriggerPenKeyModeNull
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_ERROR_0400
     * @tc.desc   Test Driver.triggerPenKey with null mode parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyModeNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyModeNull start');
      try {
        await driver.triggerPenKey(PenKey.HANDWRITING, null, PenKeyOperation.CLICK);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyModeNull error: ' + error.code);
        expect(error.code).assertEqual(ParameterErrorCode);
      }
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyModeNull over');
    });

    /**
     * @tc.name   testDriverTriggerPenKeyOperationNull
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_ERROR_0500
     * @tc.desc   Test Driver.triggerPenKey with null operation parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyOperationNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyOperationNull start');
      try {
        await driver.triggerPenKey(PenKey.HANDWRITING, PenMode.HANDWRITING, null);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyOperationNull error: ' + error.code);
        expect(error.code).assertEqual(ParameterErrorCode);
      }
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyOperationNull over');
    });

    /**
     * @tc.name   testDriverTriggerPenKeyKeyUndefined
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_ERROR_0600
     * @tc.desc   Test Driver.triggerPenKey with undefined key parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyKeyUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyKeyUndefined start');
      try {
        await driver.triggerPenKey(undefined, PenMode.HANDWRITING, PenKeyOperation.CLICK);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyKeyUndefined error: ' + error.code);
        expect(error.code).assertEqual(ParameterErrorCode);
      }
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyKeyUndefined over');
    });

    /**
     * @tc.name   testDriverTriggerPenKeyModeUndefined
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_ERROR_0700
     * @tc.desc   Test Driver.triggerPenKey with undefined mode parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyModeUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyModeUndefined start');
      try {
        await driver.triggerPenKey(PenKey.HANDWRITING, undefined, PenKeyOperation.CLICK);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyModeUndefined error: ' + error.code);
        expect(error.code).assertEqual(ParameterErrorCode);
      }
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyModeUndefined over');
    });

    /**
     * @tc.name   testDriverTriggerPenKeyOperationUndefined
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_ERROR_0800
     * @tc.desc   Test Driver.triggerPenKey with undefined operation parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyOperationUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyOperationUndefined start');
      try {
        await driver.triggerPenKey(PenKey.HANDWRITING, PenMode.HANDWRITING, undefined);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyOperationUndefined error: ' + error.code);
        expect(error.code).assertEqual(ParameterErrorCode);
      }
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyOperationUndefined over');
    });

    /**
     * @tc.name   testDriverTriggerPenKeyHandwritingClickOptionsNull
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_PARAM_0700
     * @tc.desc   Test Driver.triggerPenKey with HANDWRITING mode, HANDWRITING key, CLICK operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyHandwritingClickOptionsNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyHandwritingClickOptionsNull start');
      try {
        await driver.triggerPenKey(PenKey.HANDWRITING, PenMode.HANDWRITING, PenKeyOperation.CLICK, null);
        await driver.delayMs(500);
      } catch (error) {
        hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyHandwritingClickOptionsNull error: ' + error.code);
        expect(error.code).assertEqual(ErrorCode17000005)
      }
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyHandwritingClickOptionsNull over');
    });

    /**
     * @tc.name   testDriverTriggerPenKeyHandwritingClickOptionsUndefined
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_PARAM_0800
     * @tc.desc   Test Driver.triggerPenKey with HANDWRITING mode, HANDWRITING key, CLICK operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyHandwritingClickOptionsUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyHandwritingClickOptionsUndefined start');
      try {
        await driver.triggerPenKey(PenKey.HANDWRITING, PenMode.HANDWRITING, PenKeyOperation.CLICK, undefined);
        await driver.delayMs(500);
      } catch (error) {
        hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyHandwritingClickOptionsUndefined error: ' + error.code);
        expect(error.code).assertEqual(ErrorCode17000005)
      }
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyHandwritingClickOptionsUndefined over');
    });

    /**
     * @tc.name   testDriverTriggerPenKeyConcurrentCalls
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_ERROR_0900
     * @tc.desc   Test Driver.triggerPenKey with concurrent calls (should fail with 17000002)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyConcurrentCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyConcurrentCalls start');
      try {
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(300);
        await driver.triggerPenKey(PenKey.HANDWRITING, PenMode.HANDWRITING, PenKeyOperation.CLICK, {point: {x: 100, y: 100}});
        expect().assertFalse();
      } catch (err) {
        console.log(`${TestTag}, testDriverClickAtErrorConcurrentCallWithPressure error: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 8);
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyConcurrentCalls over');
    });


  })
}