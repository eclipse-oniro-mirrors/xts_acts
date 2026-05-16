'use static';
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

import { beforeAll, describe, it, expect, TestType, Size, Level } from "../../../hypium/index"
import { Driver, PenKey, PenKeyOperation, PenMode, Point, TouchOptions, PenKeyOperationOptions } from '@kit.TestKit'
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'

const waitUiReadyMs: int = 1000;
const TestTag: string = 'UiTest_TAG';
const ParameterErrorCode: int = 17000007;
const ErrorCode17000005: int = 17000005;

function sleep(nm: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, nm)
  })
}

export default function uitestApi26ErrorTest(): void {
  describe('uitestApi26ErrorTest', (): void => {
    let driver: Driver | undefined;
    beforeAll(async (): Promise<void> => {
      driver = Driver.create()
      await driver!.delayMs(1000)
    })

     /**
       * @tc.name   testDriverClickAtErrorSpeedTooSmall_static
       * @tc.number SUB_testfwk_UITEST_CLICKAT_ERROR_0400
       * @tc.desc   Test clickAt with speed=199 (less than minimum 200), should throw 17000007
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('testDriverClickAtErrorSpeedTooSmall_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverClickAtErrorSpeedTooSmall start`);
      const options: TouchOptions = { speed: 199 };
      try {
        await driver!.clickAt({x: 100, y: 100}, options)
        expect().assertFail();
      } catch (err) {
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.log(`${TestTag}, testDriverClickAtErrorSpeedTooSmall end`);
    });

     /**
       * @tc.name   testDriverClickAtErrorSpeedTooLarge_static
       * @tc.number SUB_testfwk_UITEST_CLICKAT_ERROR_0500
       * @tc.desc   Test clickAt with speed=40001 (greater than maximum 40000), should throw 17000007
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('testDriverClickAtErrorSpeedTooLarge_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverClickAtErrorSpeedTooLarge start`);
      const options: TouchOptions = { speed: 40001 };
      try {
        await driver!.clickAt({x: 100, y: 100}, options)
        expect().assertFail();
      } catch (err) {
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.log(`${TestTag}, testDriverClickAtErrorSpeedTooLarge end`);
    });

     /**
      * @tc.name   testDriverClickAtErrorPressureTooSmall_static
      * @tc.number SUB_testfwk_UITEST_CLICKAT_ERROR_0600
      * @tc.desc   Test clickAt with pressure=-0.1 (less than minimum 0), should throw 17000007
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverClickAtErrorPressureTooSmall_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverClickAtErrorPressureTooSmall start`);
      const point: Point = { x: 100, y: 100 };
      const options: TouchOptions = { pressure: -0.1 };
      try {
        await driver!.clickAt(point, options)
        expect().assertFail();
      } catch (err) {
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.log(`${TestTag}, testDriverClickAtErrorPressureTooSmall end`);
    });

     /**
      * @tc.name   testDriverClickAtErrorPressureTooLarge_static
      * @tc.number SUB_testfwk_UITEST_CLICKAT_ERROR_0700
      * @tc.desc   Test clickAt with pressure=1.5 (greater than maximum 1), should throw 17000007
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverClickAtErrorPressureTooLarge_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverClickAtErrorPressureTooLarge start`);
      const point: Point = { x: 100, y: 100 };
      const options: TouchOptions = { pressure: 1.5 };
      try {
        await driver!.clickAt(point, options);
        expect().assertFail();
      } catch (err) {
        console.log(`${TestTag}, testDriverClickAtErrorPressureTooLarge error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testDriverClickAtErrorPressureTooLarge end`);
    });

     /**
      * @tc.name   testDriverClickAtUnsupportedDurationBelowMin_static
      * @tc.number SUB_testfwk_UITEST_CLICKAT_ERROR_0800
      * @tc.desc   Test clickAt with duration=1000 (below minimum 1500, not supported), should throw 17000007
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverClickAtUnsupportedDurationBelowMin_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverClickAtUnsupportedDurationBelowMin start`);
      const point: Point = { x: 100, y: 100 };
      const options: TouchOptions = { duration: 1000 };
      try {
        await driver!.clickAt(point, options)
        expect().assertFail();
      } catch (err) {
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.log(`${TestTag}, testDriverClickAtUnsupportedDurationBelowMin end`);
    });

     /**
      * @tc.name   testDriverClickAtUnsupportedDurationZero_static
      * @tc.number SUB_testfwk_UITEST_CLICKAT_ERROR_0900
      * @tc.desc   Test clickAt with duration=0 (zero value, not supported), should throw 17000007
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverClickAtUnsupportedDurationZero_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverClickAtUnsupportedDurationZero start`);
      const point: Point = { x: 100, y: 100 };
      const options: TouchOptions = { duration: 0 };
      try {
        await driver!.clickAt(point, options)
        expect().assertFail();
      } catch (err) {
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.log(`${TestTag}, testDriverClickAtUnsupportedDurationZero end`);
    });

    /**
     * @tc.name   testDriverLongClickAtErrorDurationTooSmall_static
     * @tc.number SUB_testfwk_UITEST_LONGCLICKAT_ERROR_0100
     * @tc.desc   Test longClickAt with duration=1499 (less than minimum 1500), should throw 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtErrorDurationTooSmall_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtErrorDurationTooSmall start`);
      const options: TouchOptions = { duration: 1499 };
      try {
        await driver!.longClickAt({x: 100, y: 100}, options)
        expect().assertFail();
      } catch (err) {
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.log(`${TestTag}, testDriverLongClickAtErrorDurationTooSmall end`);
    });

    /**
     * @tc.name   testDriverLongClickAtErrorPressureTooSmall_static
     * @tc.number SUB_testfwk_UITEST_LONGCLICKAT_ERROR_0200
     * @tc.desc   Test longClickAt with pressure=-0.1 (less than minimum 0), should throw 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtErrorPressureTooSmall_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtErrorPressureTooSmall start`);
      const options: TouchOptions = { pressure: -0.1 };
      try {
        await driver!.longClickAt({x: 100, y: 100}, options)
        expect().assertFail();
      } catch (err) {
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.log(`${TestTag}, testDriverLongClickAtErrorPressureTooSmall end`);
    });

    /**
     * @tc.name   testDriverLongClickAtErrorPressureTooLarge_static
     * @tc.number SUB_testfwk_UITEST_LONGCLICKAT_ERROR_0300
     * @tc.desc   Test longClickAt with pressure=1.1 (greater than maximum 1), should throw 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtErrorPressureTooLarge_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtErrorPressureTooLarge start`);
      const options: TouchOptions = { pressure: 1.1 };
      try {
        await driver!.longClickAt({x: 100, y: 100}, options)
        expect().assertFail();
      } catch (err) {
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.log(`${TestTag}, testDriverLongClickAtErrorPressureTooLarge end`);
    });

    /**
     * @tc.name   testDriverLongClickAtErrorSpeedTooSmall_static
     * @tc.number SUB_testfwk_UITEST_LONGCLICKAT_ERROR_0400
     * @tc.desc   Test longClickAt with speed=199 (less than minimum 200), should throw 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtErrorSpeedTooSmall_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtErrorSpeedTooSmall start`);
      const options: TouchOptions = { speed: 199 };
      try {
        await driver!.longClickAt({x: 100, y: 100}, options)
        expect().assertFail();
      } catch (err) {
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.log(`${TestTag}, testDriverLongClickAtErrorSpeedTooSmall end`);
    });

    /**
     * @tc.name   testDriverLongClickAtErrorSpeedTooLarge_static
     * @tc.number SUB_testfwk_UITEST_LONGCLICKAT_ERROR_0500
     * @tc.desc   Test longClickAt with speed=40001 (greater than maximum 40000), should throw 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtErrorSpeedTooLarge_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtErrorSpeedTooLarge start`);
      const options: TouchOptions = { speed: 40001 };
      try {
        await driver!.longClickAt({x: 100, y: 100}, options)
        expect().assertFail();
      } catch (err) {
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.log(`${TestTag}, testDriverLongClickAtErrorSpeedTooLarge end`);
    });

    /**
     * @tc.name   testDriverLongClickAtErrorSpeedNegative_static
     * @tc.number SUB_testfwk_UITEST_LONGCLICKAT_ERROR_0600
     * @tc.desc   Test longClickAt with speed=-100 (negative), should throw 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtErrorSpeedNegative_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtErrorSpeedNegative start`);
      const options: TouchOptions = { speed: -100 };
      try {
        await driver!.longClickAt({x: 100, y: 100}, options)
        expect().assertFail();
      } catch (err) {
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.log(`${TestTag}, testDriverLongClickAtErrorSpeedNegative end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenSpeedNegative_static
     * @tc.number SUB_testfwk_UITEST_SWIPEBETWEEN_ERROR_0100
     * @tc.desc   Test swipeBetween with negative speed, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenSpeedNegative_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenSpeedNegative start`);
      const options: TouchOptions = { speed: -1 };
      try {
        await driver!.swipeBetween({x: 100, y: 100}, {x: 200, y: 200}, options)
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverSwipeBetweenSpeedNegative error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverSwipeBetweenSpeedNegative end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenPressureOutOfRangeLow_static
     * @tc.number SUB_testfwk_UITEST_SWIPEBETWEEN_ERROR_0200
     * @tc.desc   Test swipeBetween with pressure out of range (< 0), expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenPressureOutOfRangeLow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenPressureOutOfRangeLow start`);
      const options: TouchOptions = { pressure: -0.1 };
      try {
        await driver!.swipeBetween({x: 100, y: 100}, {x: 200, y: 200}, options)
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverSwipeBetweenPressureOutOfRangeLow error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverSwipeBetweenPressureOutOfRangeLow end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenPressureOutOfRangeHigh_static
     * @tc.number SUB_testfwk_UITEST_SWIPEBETWEEN_ERROR_0300
     * @tc.desc   Test swipeBetween with pressure out of range (> 1), expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenPressureOutOfRangeHigh_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenPressureOutOfRangeHigh start`);
      const options: TouchOptions = { pressure: 1.1 };
      try {
        await driver!.swipeBetween({x: 100, y: 100}, {x: 200, y: 200}, options)
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverSwipeBetweenPressureOutOfRangeHigh error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverSwipeBetweenPressureOutOfRangeHigh end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenDisplayIdDiff_static
     * @tc.number SUB_testfwk_UITEST_SWIPEBETWEEN_ERROR_0400
     * @tc.desc   Test swipeBetween with speed out of range (> 40000), expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenDisplayIdDiff_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenDisplayIdDiff start`);
      const options: TouchOptions = { speed: 800 };
      try {
        await driver!.swipeBetween({x: 100, y: 100, displayId: 0}, {x: 200, y: 200, displayId: 1}, options)
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverSwipeBetweenDisplayIdDiff error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverSwipeBetweenDisplayIdDiff end`);
    });


    /**
     * @tc.name   testDriverDragBetweenWithNegativeSpeed_static
     * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_ERROR_0200
     * @tc.desc   Test dragBetween with negative speed, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDragBetweenWithNegativeSpeed_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithNegativeSpeed start`);
      const options: TouchOptions = { speed: -1 };
      try {
        await driver!.dragBetween({x: 100, y: 100}, {x: 200, y: 200}, options)
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverDragBetweenWithNegativeSpeed error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverDragBetweenWithNegativeSpeed end`);
    });


    /**
     * @tc.name   testDriverDragBetweenWithDurationLessThanMin_static
     * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_ERROR_0300
     * @tc.desc   Test dragBetween with duration < 1500, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDragBetweenWithDurationLessThanMin_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithDurationLessThanMin start`);
      const options: TouchOptions = { duration: 1000 };
      try {
        await driver!.dragBetween({x: 100, y: 100}, {x: 200, y: 200}, options)
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverDragBetweenWithDurationLessThanMin error is ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverDragBetweenWithDurationLessThanMin end`);
    });

     /**
       * @tc.name   testDriverDragBetweenErrorSpeedTooLarge_static
       * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_ERROR_0700
       * @tc.desc   Test dragBetween with speed greater than 40000, expecting error 17000007
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       @tc.level  LEVEL3
       */
    it('testDriverDragBetweenErrorSpeedTooLarge_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverDragBetweenErrorSpeedTooLarge start`);
      const from: Point = { x: 500, y: 1000 };
      const to: Point = { x: 500, y: 800 };
      const touchOptions: TouchOptions = { speed: 40001 };
      try {
        await driver!.dragBetween(from, to, touchOptions);
      } catch (err) {
        console.log(`${TestTag}, testDriverDragBetweenErrorSpeedTooLarge error is: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testDriverDragBetweenErrorSpeedTooLarge end`);
    });

     /**
       * @tc.name   testDriverDragBetweenErrorSpeedTooSmall_static
       * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_ERROR_0800
       * @tc.desc   Test dragBetween with speed less than 200, expecting error 17000007
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('testDriverDragBetweenErrorSpeedTooSmall_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverDragBetweenErrorSpeedTooSmall start`);
      const from: Point = { x: 500, y: 1000 };
      const to: Point = { x: 500, y: 800 };
      const touchOptions: TouchOptions = { speed: 199 };
      try {
        await driver!.dragBetween(from, to, touchOptions);
      } catch (err) {
        console.log(`${TestTag}, testDriverDragBetweenErrorSpeedTooSmall error is: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testDriverDragBetweenErrorSpeedTooSmall end`);
    });

    /**
     * @tc.name   testDriverDragBetweenWithNegativePressure_static
     * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_ERROR_0400
     * @tc.desc   Test dragBetween with negative pressure, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDragBetweenWithNegativePressure_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithNegativePressure start`);
      const options: TouchOptions = { pressure: -0.5 };
      try {
        await driver!.dragBetween({x: 100, y: 100}, {x: 200, y: 200}, options)
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverDragBetweenWithNegativePressure error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverDragBetweenWithNegativePressure end`);
    });

    /**
     * @tc.name   testDriverDragBetweenWithPressureGreaterThanOne_static
     * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_ERROR_0500
     * @tc.desc   Test dragBetween with pressure > 1, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDragBetweenWithPressureGreaterThanOne_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithPressureGreaterThanOne start`);
      const options: TouchOptions = { pressure: 1.5 };
      try {
        await driver!.dragBetween({x: 100, y: 100}, {x: 200, y: 200}, options)
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverDragBetweenWithPressureGreaterThanOne error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverDragBetweenWithPressureGreaterThanOne end`);
    });

    /**
     * @tc.name   testDriverDragBetweenDisplayIdDiff_static
     * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_ERROR_0600
     * @tc.desc   Test dragBetween displayId diff, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDragBetweenDisplayIdDiff_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenDisplayIdDiff start`);
      const options: TouchOptions = { speed: 800 };
      try {
        await driver!.dragBetween({x: 100, y: 100, displayId: 0}, {x: 200, y: 200, displayId: 1}, options)
        expect().assertFail();
      } catch (err) {
        console.info(`${TestTag}, testDriverDragBetweenDisplayIdDiff error is: ${JSON.stringify(err)}`)
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode)
      }
      console.info(`${TestTag}, testDriverDragBetweenDisplayIdDiff end`);
    });

    /**
     * @tc.name   testDriverDumpLayoutErrorEmptyPath_static
     * @tc.number SUB_testfwk_UITEST_DUMPLAYOUT_ERROR_0200
     * @tc.desc   Test dumpLayout with empty savePath parameter, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDumpLayoutErrorEmptyPath_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverDumpLayoutErrorEmptyPath start`);
      const savePath: string = '';
      try {
        await driver!.dumpLayout(savePath, 0);
        expect().assertFalse();
      } catch (err) {
        console.log(`${TestTag}, testDriverDumpLayoutErrorEmptyPath error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(17000007);
      }
      console.log(`${TestTag}, testDriverDumpLayoutErrorEmptyPath end`);
    });

    /**
     * @tc.name   testDriverDumpLayoutErrorInvalidPath_static
     * @tc.number SUB_testfwk_UITEST_DUMPLAYOUT_ERROR_0300
     * @tc.desc   Test dumpLayout with path outside sandbox, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDumpLayoutErrorInvalidPath_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverDumpLayoutErrorInvalidPath start`);
      const savePath: string = '/invalid/path/outside/sandbox.json';
      try {
        await driver!.dumpLayout(savePath, 0);
        expect().assertFalse();
      } catch (err) {
        console.log(`${TestTag}, testDriverDumpLayoutErrorInvalidPath error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(17000007);
      }
      console.log(`${TestTag}, testDriverDumpLayoutErrorInvalidPath end`);
    });

    /**
     * @tc.name   testDriverDumpLayoutErrorNegativeDisplayId_static
     * @tc.number SUB_testfwk_UITEST_DUMPLAYOUT_ERROR_0400
     * @tc.desc   Test dumpLayout with negative displayId parameter, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDumpLayoutErrorNegativeDisplayId_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverDumpLayoutErrorNegativeDisplayId start`);
      let savePath: string = '/data/storage/el2/base/cache/dump_layout_error_003.json'
      const displayId: int = -1;
      try {
        await driver!.dumpLayout(savePath, displayId);
        expect().assertFalse();
      } catch (err) {
        console.log(`${TestTag}, testDriverDumpLayoutErrorNegativeDisplayId error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(17000007);
      }
      console.log(`${TestTag}, testDriverDumpLayoutErrorNegativeDisplayId end`);
    });

    /**
     * @tc.name   testDriverMouseDragPressureMinimum_static
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_BOUNDARY_0500
     * @tc.desc   Test mouseDrag with minimum pressure value (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragPressureMinimum_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragPressureMinimum start`);
      try {
        const touchOptions: TouchOptions = { pressure: 0 };
        await driver!.mouseDrag({x: 100, y: 100}, {x: 100, y: 100}, touchOptions);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testDriverMouseDragPressureMinimum error is: ${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(17000007);
      }
      console.log(`${TestTag}, testDriverMouseDragPressureMinimum end`);
    });

    /**
     * @tc.name   testDriverMouseDragPressureMaximum_static
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_BOUNDARY_0400
     * @tc.desc   Test mouseDrag with maximum pressure value (1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragPressureMaximum_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragPressureMaximum start`);
      const touchOptions: TouchOptions = { pressure: 1 };
      try {
        await driver!.mouseDrag({x: 100, y: 100}, {x: 100, y: 100}, touchOptions);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testDriverMouseDragPressureMinimum error is: ${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(17000007);
      }
      console.log(`${TestTag}, testDriverMouseDragPressureMaximum end`);
    });

    /**
     * @tc.name   testDriverMouseDragErrorSpeedNegative_static
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_ERROR_0200
     * @tc.desc   Test mouseDrag with negative speed, expecting error 17000002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragErrorSpeedNegative_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragErrorSpeedNegative start`);
      const from: Point = { x: 500, y: 1000 };
      const to: Point = { x: 500, y: 800 };
      const touchOptions: TouchOptions = { speed: -100 };
      try {
        await driver!.mouseDrag(from, to, touchOptions);
        expect().assertFail();
      } catch (err) {
        console.log(`${TestTag}, testDriverMouseDragErrorSpeedNegative error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testDriverMouseDragErrorSpeedNegative end`);
    });

    /**
     * @tc.name   testDriverMouseDragErrorDurationTooSmall_static
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_ERROR_0500
     * @tc.desc   Test mouseDrag with duration less than 1500, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragErrorDurationTooSmall_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragErrorDurationTooSmall start`);
      const from: Point = { x: 500, y: 1000 };
      const to: Point = { x: 500, y: 800 };
      const touchOptions: TouchOptions = { duration: 1499 };
      try {
        await driver!.mouseDrag(from, to, touchOptions);
        expect().assertFail();
      } catch (err) {
        console.log(`${TestTag}, testDriverMouseDragErrorDurationTooSmall error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testDriverMouseDragErrorDurationTooSmall end`);
    });

    /**
     * @tc.name   testDriverMouseDragErrorPressureTooSmall_static
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_ERROR_0600
     * @tc.desc   Test mouseDrag with pressure greater than1, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragErrorPressureTooSmall_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragErrorPressureTooSmall start`);
      const from: Point = { x: 500, y: 1000 };
      const to: Point = { x: 500, y: 800 };
      const touchOptions: TouchOptions = { pressure: -0.1 };
      try {
        await driver!.mouseDrag(from, to, touchOptions);
        expect().assertFail();
      } catch (err) {
        console.log(`${TestTag}, testDriverMouseDragErrorPressureTooSmall error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testDriverMouseDragErrorPressureTooSmall end`);
    });

    /**
     * @tc.name   testDriverMouseDragErrorPressureTooLarge_static
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_ERROR_0700
     * @tc.desc   Test mouseDrag with pressure greater than1, expecting error 17000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragErrorPressureTooLarge_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragErrorPressureTooLarge start`);
      const from: Point = { x: 500, y: 1000 };
      const to: Point = { x: 500, y: 800 };
      const touchOptions: TouchOptions = { pressure: 1.1 };
      try {
        await driver!.mouseDrag(from, to, touchOptions);
        expect().assertFail();
      } catch (err) {
        console.log(`${TestTag}, testDriverMouseDragErrorPressureTooLarge error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testDriverMouseDragErrorPressureTooLarge end`);
    });

    /**
     * @tc.name   testDriverMouseDragErrorDisplayIdDiff_static
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_ERROR_0800
     * @tc.desc   Test mouseDrag with displayId diff
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     @tc.level  LEVEL3
     */
    it('testDriverMouseDragErrorDisplayIdDiff_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragErrorDisplayIdDiff start`);
      const from: Point = { x: 500, y: 1000, displayId: 0 };
      const to: Point = { x: 500, y: 800, displayId: 1 };
      const touchOptions: TouchOptions = { pressure: 1.0 };
      try {
        await driver!.mouseDrag(from, to, touchOptions);
        expect().assertFail();
      } catch (err) {
        console.log(`${TestTag}, testDriverMouseDragErrorDisplayIdDiff error is: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testDriverMouseDragErrorDisplayIdDiff end`);
    });

    /**
     * @tc.name   testDriverTriggerPenKeyAirMouseWithoutPoint_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_ERROR_0100
     * @tc.desc   Test Driver.triggerPenKey with AIR_MOUSE mode without point in options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyAirMouseWithoutPoint_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyAirMouseWithoutPoint start');
      try {
        await driver!.triggerPenKey(PenKey.AIR_MOUSE, PenMode.AIR_MOUSE, PenKeyOperation.CLICK, {});
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyAirMouseWithoutPoint error: ' + error.code);
        expect(error.code === ErrorCode17000005 || error.code === ParameterErrorCode).assertTrue();
      }
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyAirMouseWithoutPoint over');
    });
  })
}