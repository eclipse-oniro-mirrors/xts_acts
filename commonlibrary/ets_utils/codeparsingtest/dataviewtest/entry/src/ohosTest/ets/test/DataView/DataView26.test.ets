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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function DataView26Test() {
  describe('DataView26Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_DATAVIEW_GETFLOAT32_STANDALONE_TEST_001
     * @tc.name GetFloat32BigEndianPositive1Test001
     * @tc.desc Verify getFloat32 reads 1.0 correctly in default big-endian mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetFloat32BigEndianPositive1Test001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {

        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setFloat32(0, 1.0, false);
        const readValue: number = dv.getFloat32(0);

        expect(readValue).assertEqual(1.0);
        expect(typeof readValue).assertEqual('number');
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETFLOAT32_STANDALONE_TEST_002
     * @tc.name GetFloat32LittleEndianPositive1Test002
     * @tc.desc Verify getFloat32 reads 1.0 correctly in little-endian mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetFloat32LittleEndianPositive1Test002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setFloat32(0, 1.0, true);
        const readValue: number = dv.getFloat32(0, true);

        expect(readValue).assertEqual(1.0);
        expect(typeof readValue).assertEqual('number');
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETFLOAT32_STANDALONE_TEST_003
     * @tc.name GetFloat32Offset0Value3Point14Test003
     * @tc.desc Verify getFloat32 reads 3.14 correctly at byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetFloat32Offset0Value3Point14Test003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const targetValue: number = 3.14;
        const buffer: ArrayBuffer = new ArrayBuffer(8);
        const dv: DataView = new DataView(buffer);
        dv.setFloat32(0, targetValue, false);
        const readValue: number = dv.getFloat32(0);

        expect(Math.abs(readValue - targetValue) < 0.0001).assertTrue();
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETFLOAT32_STANDALONE_TEST_004
     * @tc.name GetFloat32MaxValidOffsetValue2Point718Test004
     * @tc.desc Verify getFloat32 reads 2.718 correctly at max valid offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetFloat32MaxValidOffsetValue2Point718Test004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const targetValue: number = 2.718;
        const buffer: ArrayBuffer = new ArrayBuffer(7);
        const dv: DataView = new DataView(buffer);
        dv.setFloat32(3, targetValue, false);
        const readValue: number = dv.getFloat32(3);

        expect(Math.abs(readValue - targetValue) < 0.0001).assertTrue();
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETFLOAT32_STANDALONE_TEST_005
     * @tc.name GetFloat32PositiveInfinityTest005
     * @tc.desc Verify getFloat32 reads Infinity correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetFloat32PositiveInfinityTest005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setFloat32(0, Infinity, false);
        const readValue: number = dv.getFloat32(0);

        expect(readValue).assertEqual(Infinity);
        expect(typeof readValue).assertEqual('number');
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETFLOAT32_STANDALONE_TEST_006
     * @tc.name GetFloat32NegativeInfinityTest006
     * @tc.desc Verify getFloat32 reads -Infinity correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetFloat32NegativeInfinityTest006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setFloat32(0, -Infinity, false);
        const readValue: number = dv.getFloat32(0);

        expect(readValue).assertEqual(-Infinity);
        expect(typeof readValue).assertEqual('number');
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETFLOAT32_STANDALONE_TEST_007
     * @tc.name GetFloat32NaNValueTest007
     * @tc.desc Verify getFloat32 reads NaN correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetFloat32NaNValueTest007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setFloat32(0, NaN, false);
        const readValue: number = dv.getFloat32(0);

        expect(isNaN(readValue)).assertTrue();
        expect(typeof readValue).assertEqual('number');
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETFLOAT32_STANDALONE_TEST_008
     * @tc.name GetFloat32MinFiniteValueTest008
     * @tc.desc Verify getFloat32 reads minimum finite value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetFloat32MinFiniteValueTest008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const minFiniteValue: number = 1.401298464324817e-45;
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setFloat32(0, minFiniteValue, false);
        const readValue: number = dv.getFloat32(0);

        expect(Math.abs((readValue - minFiniteValue) / minFiniteValue) <= 1e-50).assertTrue();
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETFLOAT32_STANDALONE_TEST_009
     * @tc.name GetFloat32MaxFiniteValueTest009
     * @tc.desc Verify getFloat32 reads maximum finite value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetFloat32MaxFiniteValueTest009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const maxFiniteValue: number = 3.4028234663852886e+38;
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setFloat32(0, maxFiniteValue, false);
        const readValue: number = dv.getFloat32(0);

        // 极大值相对误差容忍：≤1e+33
        expect(Math.abs((readValue - maxFiniteValue) / maxFiniteValue) <= 1e+33).assertTrue();
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETFLOAT32_STANDALONE_TEST_010
     * @tc.name GetFloat32OutOfBoundsOffsetThrowTest010
     * @tc.desc Verify getFloat32 throws RangeError when offset is out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetFloat32OutOfBoundsOffsetThrowTest010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        let isRangeErrorThrown: boolean = false;
        let errorMessage: string = '';

        try {
          dv.getFloat32(1);
        } catch (e) {
          if (e instanceof RangeError) {
            isRangeErrorThrown = true;
            errorMessage = e.message;
          }
        }

        expect(isRangeErrorThrown).assertTrue();
      }
    );
    /**
     * @tc.number SUB_DATAVIEW_GETFLOAT64_STANDALONE_TEST_011
     * @tc.name GetFloat64BigEndianPositive1Test011
     * @tc.desc Verify getFloat64 reads 1.0 correctly in default big-endian mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetFloat64BigEndianPositive1Test011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const buffer: ArrayBuffer = new ArrayBuffer(8);
        const dv: DataView = new DataView(buffer);
        dv.setFloat64(0, 1.0, false);
        const readValue: number = dv.getFloat64(0);

        expect(readValue).assertEqual(1.0);
        expect(typeof readValue).assertEqual('number');
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETFLOAT64_STANDALONE_TEST_012
     * @tc.name GetFloat64LittleEndianPositive1Test012
     * @tc.desc Verify getFloat64 reads 1.0 correctly in little-endian mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetFloat64LittleEndianPositive1Test012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const buffer: ArrayBuffer = new ArrayBuffer(8);
        const dv: DataView = new DataView(buffer);
        dv.setFloat64(0, 1.0, true);
        const readValue: number = dv.getFloat64(0, true);

        expect(readValue).assertEqual(1.0);
        expect(typeof readValue).assertEqual('number');
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETFLOAT64_STANDALONE_TEST_013
     * @tc.name GetFloat64Offset0ValuePiTest013
     * @tc.desc Verify getFloat64 reads π (3.141592653589793) correctly at byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetFloat64Offset0ValuePiTest013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const targetValue: number = Math.PI;
        const buffer: ArrayBuffer = new ArrayBuffer(16);
        const dv: DataView = new DataView(buffer);
        dv.setFloat64(0, targetValue, false);
        const readValue: number = dv.getFloat64(0);

        expect(Math.abs(readValue - targetValue) < 1e-12).assertTrue();
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETFLOAT64_STANDALONE_TEST_014
     * @tc.name GetFloat64MaxValidOffsetValueEulerTest014
     * @tc.desc Verify getFloat64 reads e (2.718281828459045) correctly at max valid offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetFloat64MaxValidOffsetValueEulerTest014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const targetValue: number = Math.E;
        const buffer: ArrayBuffer = new ArrayBuffer(15);
        const dv: DataView = new DataView(buffer);
        dv.setFloat64(7, targetValue, false);
        const readValue: number = dv.getFloat64(7);

        expect(Math.abs(readValue - targetValue) < 1e-12).assertTrue();
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETFLOAT64_STANDALONE_TEST_015
     * @tc.name GetFloat64PositiveInfinityTest015
     * @tc.desc Verify getFloat64 reads Infinity correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetFloat64PositiveInfinityTest015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const buffer: ArrayBuffer = new ArrayBuffer(8);
        const dv: DataView = new DataView(buffer);
        dv.setFloat64(0, Infinity, false);
        const readValue: number = dv.getFloat64(0);

        expect(readValue).assertEqual(Infinity);
        expect(typeof readValue).assertEqual('number');
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETFLOAT64_STANDALONE_TEST_016
     * @tc.name GetFloat64NegativeInfinityTest016
     * @tc.desc Verify getFloat64 reads -Infinity correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetFloat64NegativeInfinityTest016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const buffer: ArrayBuffer = new ArrayBuffer(8);
        const dv: DataView = new DataView(buffer);
        dv.setFloat64(0, -Infinity, false);
        const readValue: number = dv.getFloat64(0);

        expect(readValue).assertEqual(-Infinity);
        expect(typeof readValue).assertEqual('number');
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETFLOAT64_STANDALONE_TEST_017
     * @tc.name GetFloat64NaNValueTest017
     * @tc.desc Verify getFloat64 reads NaN correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetFloat64NaNValueTest017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const buffer: ArrayBuffer = new ArrayBuffer(8);
        const dv: DataView = new DataView(buffer);
        dv.setFloat64(0, NaN, false);
        const readValue: number = dv.getFloat64(0);

        expect(isNaN(readValue)).assertTrue();
        expect(typeof readValue).assertEqual('number');
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETFLOAT64_STANDALONE_TEST_018
     * @tc.name GetFloat64MinFiniteValueTest018
     * @tc.desc Verify getFloat64 reads minimum finite value (2.2250738585072014e-308) correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetFloat64MinFiniteValueTest018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const minFiniteValue: number = 2.2250738585072014e-308;
        const buffer: ArrayBuffer = new ArrayBuffer(8);
        const dv: DataView = new DataView(buffer);
        dv.setFloat64(0, minFiniteValue, false);
        const readValue: number = dv.getFloat64(0);

        expect(Math.abs((readValue - minFiniteValue) / minFiniteValue) <= 1e-312).assertTrue();
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETFLOAT64_STANDALONE_TEST_019
     * @tc.name GetFloat64MaxFiniteValueTest019
     * @tc.desc Verify getFloat64 reads maximum finite value (1.7976931348623157e+308) correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetFloat64MaxFiniteValueTest019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const maxFiniteValue: number = 1.7976931348623157e+308;
        const buffer: ArrayBuffer = new ArrayBuffer(8);
        const dv: DataView = new DataView(buffer);
        dv.setFloat64(0, maxFiniteValue, false);
        const readValue: number = dv.getFloat64(0);

        expect(Math.abs((readValue - maxFiniteValue) / maxFiniteValue) <= 1e+303).assertTrue();
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETFLOAT64_STANDALONE_TEST_020
     * @tc.name GetFloat64OutOfBoundsOffsetThrowTest020
     * @tc.desc Verify getFloat64 throws RangeError when offset is out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetFloat64OutOfBoundsOffsetThrowTest020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const buffer: ArrayBuffer = new ArrayBuffer(8);
        const dv: DataView = new DataView(buffer);
        let isRangeErrorThrown: boolean = false;
        let errorMessage: string = '';

        try {
          dv.getFloat64(1);
        } catch (e) {
          if (e instanceof RangeError) {
            isRangeErrorThrown = true;
            errorMessage = e.message;
          }
        }

        expect(isRangeErrorThrown).assertTrue();
      }
    );
    /**
     * @tc.number SUB_DATAVIEW_GETINT8_STANDALONE_TEST_021
     * @tc.name GetInt8BasicPositiveValueTest021
     * @tc.desc Verify getInt8 reads positive value 10 correctly at byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetInt8BasicPositiveValueTest021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const buffer: ArrayBuffer = new ArrayBuffer(1);
        const dv: DataView = new DataView(buffer);
        dv.setInt8(0, 10);
        const readValue: number = dv.getInt8(0);

        expect(readValue).assertEqual(10);
        expect(typeof readValue).assertEqual('number');
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETINT8_STANDALONE_TEST_022
     * @tc.name GetInt8BasicNegativeValueTest022
     * @tc.desc Verify getInt8 reads negative value -50 correctly at byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetInt8BasicNegativeValueTest022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const buffer: ArrayBuffer = new ArrayBuffer(1);
        const dv: DataView = new DataView(buffer);
        dv.setInt8(0, -50);
        const readValue: number = dv.getInt8(0);

        expect(readValue).assertEqual(-50);
        expect(typeof readValue).assertEqual('number');
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETINT8_STANDALONE_TEST_023
     * @tc.name GetInt8MaxValueTest023
     * @tc.desc Verify getInt8 reads maximum value 127 correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetInt8MaxValueTest023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const maxInt8: number = 127;
        const buffer: ArrayBuffer = new ArrayBuffer(1);
        const dv: DataView = new DataView(buffer);
        dv.setInt8(0, maxInt8);
        const readValue: number = dv.getInt8(0);

        expect(readValue).assertEqual(maxInt8);
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETINT8_STANDALONE_TEST_024
     * @tc.name GetInt8MinValueTest024
     * @tc.desc Verify getInt8 reads minimum value -128 correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetInt8MinValueTest024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const minInt8: number = -128;
        const buffer: ArrayBuffer = new ArrayBuffer(1);
        const dv: DataView = new DataView(buffer);
        dv.setInt8(0, minInt8);
        const readValue: number = dv.getInt8(0);

        expect(readValue).assertEqual(minInt8);
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETINT8_STANDALONE_TEST_025
     * @tc.name GetInt8ZeroValueTest025
     * @tc.desc Verify getInt8 reads zero value 0 correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetInt8ZeroValueTest025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const buffer: ArrayBuffer = new ArrayBuffer(5);
        const dv: DataView = new DataView(buffer);
        dv.setInt8(2, 0);
        const readValue: number = dv.getInt8(2);

        expect(readValue).assertEqual(0);
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETINT8_STANDALONE_TEST_026
     * @tc.name GetInt8MaxValidOffsetTest026
     * @tc.desc Verify getInt8 reads value correctly at max valid offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetInt8MaxValidOffsetTest026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const targetValue: number = 88;
        const buffer: ArrayBuffer = new ArrayBuffer(10);
        const dv: DataView = new DataView(buffer);
        dv.setInt8(9, targetValue);
        const readValue: number = dv.getInt8(9);

        expect(readValue).assertEqual(targetValue);
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETINT8_STANDALONE_TEST_027
     * @tc.name GetInt8BinaryEncodingMaxTest027
     * @tc.desc Verify getInt8 parses binary encoding of 127 (0x7F) correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetInt8BinaryEncodingMaxTest027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const buffer: ArrayBuffer = new ArrayBuffer(1);
        const uint8Arr: Uint8Array = new Uint8Array(buffer);
        uint8Arr[0] = 0x7F;
        const dv: DataView = new DataView(buffer);
        const readValue: number = dv.getInt8(0);

        expect(readValue).assertEqual(127);
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETINT8_STANDALONE_TEST_028
     * @tc.name GetInt8BinaryEncodingMinTest028
     * @tc.desc Verify getInt8 parses binary encoding of -128 (0x80) correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetInt8BinaryEncodingMinTest028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const buffer: ArrayBuffer = new ArrayBuffer(1);
        const uint8Arr: Uint8Array = new Uint8Array(buffer);
        uint8Arr[0] = 0x80;
        const dv: DataView = new DataView(buffer);
        const readValue: number = dv.getInt8(0);

        expect(readValue).assertEqual(-128);
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETINT8_STANDALONE_TEST_029
     * @tc.name GetInt8CrossBufferSegmentTest029
     * @tc.desc Verify getInt8 reads value correctly across multi-byte buffer segments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetInt8CrossBufferSegmentTest029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const buffer: ArrayBuffer = new ArrayBuffer(6);
        const dv: DataView = new DataView(buffer);

        dv.setInt8(1, -10);
        dv.setInt8(3, 99);
        dv.setInt8(5, -120);

        expect(dv.getInt8(1)).assertEqual(-10);
        expect(dv.getInt8(3)).assertEqual(99);
        expect(dv.getInt8(5)).assertEqual(-120);
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETINT8_STANDALONE_TEST_030
     * @tc.name GetInt8OutOfBoundsOffsetThrowTest030
     * @tc.desc Verify getInt8 throws RangeError when offset is out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetInt8OutOfBoundsOffsetThrowTest030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const buffer: ArrayBuffer = new ArrayBuffer(3);
        const dv: DataView = new DataView(buffer);
        let isRangeErrorThrown: boolean = false;
        let errorMessage: string = '';

        try {
          dv.getInt8(3);
        } catch (e) {
          if (e instanceof RangeError) {
            isRangeErrorThrown = true;
            errorMessage = e.message;
          }
        }

        expect(isRangeErrorThrown).assertTrue();
      }
    );
    /**
     * @tc.number SUB_DATAVIEW_GETINT16_STANDALONE_TEST_031
     * @tc.name GetInt16BigEndianPositiveValueTest031
     * @tc.desc Verify getInt16 reads positive value 1000 correctly in default big-endian mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetInt16BigEndianPositiveValueTest031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const targetValue: number = 1000;
        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const dv: DataView = new DataView(buffer);
        dv.setInt16(0, targetValue, false);
        const readValue: number = dv.getInt16(0);

        expect(readValue).assertEqual(targetValue);
        expect(typeof readValue).assertEqual('number');
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETINT16_STANDALONE_TEST_032
     * @tc.name GetInt16LittleEndianPositiveValueTest032
     * @tc.desc Verify getInt16 reads positive value 1000 correctly in little-endian mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetInt16LittleEndianPositiveValueTest032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const targetValue: number = 1000;
        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const dv: DataView = new DataView(buffer);
        dv.setInt16(0, targetValue, true);
        const readValue: number = dv.getInt16(0, true);

        expect(readValue).assertEqual(targetValue);
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETINT16_STANDALONE_TEST_033
     * @tc.name GetInt16MaxValueTest033
     * @tc.desc Verify getInt16 reads maximum value 32767 correctly in big-endian mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetInt16MaxValueTest033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const maxInt16: number = 32767;
        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const dv: DataView = new DataView(buffer);
        dv.setInt16(0, maxInt16, false);
        const readValue: number = dv.getInt16(0);

        expect(readValue).assertEqual(maxInt16);
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETINT16_STANDALONE_TEST_034
     * @tc.name GetInt16MinValueTest034
     * @tc.desc Verify getInt16 reads minimum value -32768 correctly in big-endian mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetInt16MinValueTest034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const minInt16: number = -32768;
        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const dv: DataView = new DataView(buffer);
        dv.setInt16(0, minInt16, false);
        const readValue: number = dv.getInt16(0);

        expect(readValue).assertEqual(minInt16);
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETINT16_STANDALONE_TEST_035
     * @tc.name GetInt16ZeroValueLittleEndianTest035
     * @tc.desc Verify getInt16 reads zero value 0 correctly in little-endian mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetInt16ZeroValueLittleEndianTest035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const buffer: ArrayBuffer = new ArrayBuffer(6);
        const dv: DataView = new DataView(buffer);
        dv.setInt16(3, 0, true);
        const readValue: number = dv.getInt16(3, true);

        expect(readValue).assertEqual(0);
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETINT16_STANDALONE_TEST_036
     * @tc.name GetInt16MaxValidOffsetTest036
     * @tc.desc Verify getInt16 reads value correctly at max valid offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetInt16MaxValidOffsetTest036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const targetValue: number = -5000;
        const buffer: ArrayBuffer = new ArrayBuffer(7);
        const dv: DataView = new DataView(buffer);
        dv.setInt16(5, targetValue, false);
        const readValue: number = dv.getInt16(5);

        expect(readValue).assertEqual(targetValue);
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETINT16_STANDALONE_TEST_037
     * @tc.name GetInt16BigEndianNegativeValueTest037
     * @tc.desc Verify getInt16 reads negative value -20000 correctly in big-endian mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetInt16BigEndianNegativeValueTest037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const targetValue: number = -20000;
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setInt16(1, targetValue, false);
        const readValue: number = dv.getInt16(1);

        expect(readValue).assertEqual(targetValue);
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETINT16_STANDALONE_TEST_038
     * @tc.name GetInt16BinaryEncodingMaxTest038
     * @tc.desc Verify getInt16 parses binary encoding of 32767 (0x7FFF) correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetInt16BinaryEncodingMaxTest038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const uint8Arr: Uint8Array = new Uint8Array(buffer);
        uint8Arr[0] = 0x7F;
        uint8Arr[1] = 0xFF;
        const dv: DataView = new DataView(buffer);
        const readValue: number = dv.getInt16(0);

        expect(readValue).assertEqual(32767);
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETINT16_STANDALONE_TEST_039
     * @tc.name GetInt16BinaryEncodingMinTest039
     * @tc.desc Verify getInt16 parses binary encoding of -32768 (0x80 0x00) correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetInt16BinaryEncodingMinTest039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {

        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const uint8Arr: Uint8Array = new Uint8Array(buffer);
        uint8Arr[0] = 0x80;
        uint8Arr[1] = 0x00;
        const dv: DataView = new DataView(buffer);
        const readValue: number = dv.getInt16(0);

        expect(readValue).assertEqual(-32768);
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETINT16_STANDALONE_TEST_040
     * @tc.name GetInt16OutOfBoundsOffsetThrowTest040
     * @tc.desc Verify getInt16 throws RangeError when offset is out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'GetInt16OutOfBoundsOffsetThrowTest040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        let isRangeErrorThrown: boolean = false;
        let errorMessage: string = '';

        try {
          dv.getInt16(3);
        } catch (e) {
          if (e instanceof RangeError) {
            isRangeErrorThrown = true;
            errorMessage = e.message;
          }
        }

        expect(isRangeErrorThrown).assertTrue();
      }
    );

    /**
     * @tc.number SUB_DATAVIEW_GETINT32_STANDALONE_TEST_041
     * @tc.name GetInt32BigEndianPositiveTest041
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetInt32BigEndianPositiveTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const dv: DataView = new DataView(buffer);
      dv.setInt32(0, 123456, false);
      expect(dv.getInt32(0)).assertEqual(123456);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETINT32_STANDALONE_TEST_042
     * @tc.name GetInt32LittleEndianPositiveTest042
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetInt32LittleEndianPositiveTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const dv: DataView = new DataView(buffer);
      dv.setInt32(0, 123456, true);
      expect(dv.getInt32(0, true)).assertEqual(123456);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETINT32_STANDALONE_TEST_043
     * @tc.name GetInt32MaxValueTest043
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetInt32MaxValueTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const max: number = 2147483647;
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const dv: DataView = new DataView(buffer);
      dv.setInt32(0, max, false);
      expect(dv.getInt32(0)).assertEqual(max);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETINT32_STANDALONE_TEST_044
     * @tc.name GetInt32MinValueTest044
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetInt32MinValueTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const min: number = -2147483648;
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const dv: DataView = new DataView(buffer);
      dv.setInt32(0, min, false);
      expect(dv.getInt32(0)).assertEqual(min);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETINT32_STANDALONE_TEST_045
     * @tc.name GetInt32ZeroValueTest045
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetInt32ZeroValueTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      const dv: DataView = new DataView(buffer);
      dv.setInt32(3, 0, true);
      expect(dv.getInt32(3, true)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETINT32_STANDALONE_TEST_046
     * @tc.name GetInt32MaxValidOffsetTest046
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetInt32MaxValidOffsetTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const target: number = -987654321;
      const buffer: ArrayBuffer = new ArrayBuffer(9); // 最大有效偏移=5（9-4）
      const dv: DataView = new DataView(buffer);
      dv.setInt32(5, target, false);
      expect(dv.getInt32(5)).assertEqual(target);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETINT32_STANDALONE_TEST_047
     * @tc.name GetInt32BigEndianNegativeTest047
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetInt32BigEndianNegativeTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const target: number = -123456789;
      const buffer: ArrayBuffer = new ArrayBuffer(10);
      const dv: DataView = new DataView(buffer);
      dv.setInt32(2, target, false);
      expect(dv.getInt32(2)).assertEqual(target);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETINT32_STANDALONE_TEST_048
     * @tc.name GetInt32BinaryMaxTest048
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetInt32BinaryMaxTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const uint8Arr: Uint8Array = new Uint8Array(buffer);
      uint8Arr.set([0x7F, 0xFF, 0xFF, 0xFF]);
      const dv: DataView = new DataView(buffer);
      expect(dv.getInt32(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETINT32_STANDALONE_TEST_049
     * @tc.name GetInt32BinaryMinTest049
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetInt32BinaryMinTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const uint8Arr: Uint8Array = new Uint8Array(buffer);
      uint8Arr.set([0x80, 0x00, 0x00, 0x00]); // -2147483648的大端编码
      const dv: DataView = new DataView(buffer);
      expect(dv.getInt32(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETINT32_STANDALONE_TEST_050
     * @tc.name GetInt32OutOfBoundsTest050
     * @tc.desc test DataView RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetInt32OutOfBoundsTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(5);
      const dv: DataView = new DataView(buffer);
      let isError: boolean = false;
      try { dv.getInt32(2); }
      catch (e) { isError = e instanceof RangeError   }
      expect(isError).assertTrue();
    });
    /**
     * @tc.number SUB_DATAVIEW_GETUINT8_STANDALONE_TEST_051
     * @tc.name GetUint8BasicValueTest051
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint8BasicValueTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(1);
      const dv: DataView = new DataView(buffer);
      dv.setUint8(0, 100);
      expect(dv.getUint8(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETUINT8_STANDALONE_TEST_052
     * @tc.name GetUint8MaxValueTest052
     * @tc.desc test DataView255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint8MaxValueTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const max: number = 255;
      const buffer: ArrayBuffer = new ArrayBuffer(1);
      const dv: DataView = new DataView(buffer);
      dv.setUint8(0, max);
      expect(dv.getUint8(0)).assertEqual(max);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETUINT8_STANDALONE_TEST_053
     * @tc.name GetUint8MinValueTest053
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint8MinValueTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(5);
      const dv: DataView = new DataView(buffer);
      dv.setUint8(3, 0);
      expect(dv.getUint8(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETUINT8_STANDALONE_TEST_054
     * @tc.name GetUint8MidValueTest054
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint8MidValueTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      const dv: DataView = new DataView(buffer);
      dv.setUint8(1, 128);
      expect(dv.getUint8(1)).assertEqual(128);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETUINT8_STANDALONE_TEST_055
     * @tc.name GetUint8MaxValidOffsetTest055
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint8MaxValidOffsetTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      const dv: DataView = new DataView(buffer);
      dv.setUint8(7, 200); // 最大有效偏移=7（8-1）
      expect(dv.getUint8(7)).assertEqual(200);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETUINT8_STANDALONE_TEST_056
     * @tc.name GetUint8BinaryEncodingTest056
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint8BinaryEncodingTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(1);
      new Uint8Array(buffer)[0] = 0xAB;
      const dv: DataView = new DataView(buffer);
      expect(dv.getUint8(0)).assertEqual(171);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETUINT8_STANDALONE_TEST_057
     * @tc.name GetUint8MultiSegmentTest057
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint8MultiSegmentTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(6);
      const dv: DataView = new DataView(buffer);
      dv.setUint8(0, 10); dv.setUint8(2, 50); dv.setUint8(5, 250);
      expect(dv.getUint8(0)).assertEqual(10);
      expect(dv.getUint8(2)).assertEqual(50);
      expect(dv.getUint8(5)).assertEqual(250);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETUINT8_STANDALONE_TEST_058
     * @tc.name GetUint8EdgeValueTest058
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint8EdgeValueTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(2);
      const dv: DataView = new DataView(buffer);
      dv.setUint8(1, 1);
      expect(dv.getUint8(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETUINT8_STANDALONE_TEST_059
     * @tc.name GetUint8CrossBufferTest059
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint8CrossBufferTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const dv: DataView = new DataView(buffer);
      dv.setUint8(2, 0xFF);
      expect(dv.getUint8(2)).assertEqual(255);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETUINT8_STANDALONE_TEST_060
     * @tc.name GetUint8OutOfBoundsTest060
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint8OutOfBoundsTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      const dv: DataView = new DataView(buffer);
      let isError: boolean = false;
      try { dv.getUint8(3); }
      catch (e) { isError = e instanceof RangeError  }
      expect(isError).assertTrue();
    });
    /**
     * @tc.number SUB_DATAVIEW_GETUINT16_STANDALONE_TEST_061
     * @tc.name GetUint16BigEndianTest061
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint16BigEndianTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(2);
      const dv: DataView = new DataView(buffer);
      dv.setUint16(0, 12345, false);
      expect(dv.getUint16(0)).assertEqual(12345);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETUINT16_STANDALONE_TEST_062
     * @tc.name GetUint16LittleEndianTest062
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint16LittleEndianTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(2);
      const dv: DataView = new DataView(buffer);
      dv.setUint16(0, 12345, true);
      expect(dv.getUint16(0, true)).assertEqual(12345);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETUINT16_STANDALONE_TEST_063
     * @tc.name GetUint16MaxValueTest063
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint16MaxValueTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const max: number = 65535;
      const buffer: ArrayBuffer = new ArrayBuffer(2);
      const dv: DataView = new DataView(buffer);
      dv.setUint16(0, max, false);
      expect(dv.getUint16(0)).assertEqual(max);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETUINT16_STANDALONE_TEST_064
     * @tc.name GetUint16MinValueTest064
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint16MinValueTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(6);
      const dv: DataView = new DataView(buffer);
      dv.setUint16(3, 0, true);
      expect(dv.getUint16(3, true)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETUINT16_STANDALONE_TEST_065
     * @tc.name GetUint16MaxValidOffsetTest065
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint16MaxValidOffsetTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const target: number = 50000;
      const buffer: ArrayBuffer = new ArrayBuffer(7); // 最大有效偏移=5（7-2）
      const dv: DataView = new DataView(buffer);
      dv.setUint16(5, target, false);
      expect(dv.getUint16(5)).assertEqual(target);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETUINT16_STANDALONE_TEST_066
     * @tc.name GetUint16MidValueTest066
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint16MidValueTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const target: number = 32768;
      const buffer: ArrayBuffer = new ArrayBuffer(5);
      const dv: DataView = new DataView(buffer);
      dv.setUint16(1, target, false);
      expect(dv.getUint16(1)).assertEqual(target);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETUINT16_STANDALONE_TEST_067
     * @tc.name GetUint16BinaryMaxTest067
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint16BinaryMaxTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(2);
      new Uint8Array(buffer).set([0xFF, 0xFF]);
      const dv: DataView = new DataView(buffer);
      expect(dv.getUint16(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETUINT16_STANDALONE_TEST_068
     * @tc.name GetUint16BinaryMidTest068
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint16BinaryMidTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(2);
      new Uint8Array(buffer).set([0x12, 0x34]);
      const dv: DataView = new DataView(buffer);
      expect(dv.getUint16(0)).assertEqual(4660);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETUINT16_STANDALONE_TEST_069
     * @tc.name GetUint16LittleEndianMidTest069
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint16LittleEndianMidTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(2);
      new Uint8Array(buffer).set([0x34, 0x12]);
      const dv: DataView = new DataView(buffer);
      expect(dv.getUint16(0, true)).assertEqual(4660);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETUINT16_STANDALONE_TEST_070
     * @tc.name GetUint16OutOfBoundsTest070
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint16OutOfBoundsTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const dv: DataView = new DataView(buffer);
      let isError: boolean = false;
      try { dv.getUint16(3); }
      catch (e) { isError = e instanceof RangeError   }
      expect(isError).assertTrue();
    });
    /**
     * @tc.number SUB_DATAVIEW_GETUINT32_STANDALONE_TEST_071
     * @tc.name GetUint32BigEndianTest071
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint32BigEndianTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const dv: DataView = new DataView(buffer);
      dv.setUint32(0, 123456789, false);
      expect(dv.getUint32(0)).assertEqual(123456789);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETUINT32_STANDALONE_TEST_072
     * @tc.name GetUint32LittleEndianTest072
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint32LittleEndianTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const dv: DataView = new DataView(buffer);
      dv.setUint32(0, 123456789, true);
      expect(dv.getUint32(0, true)).assertEqual(123456789);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETUINT32_STANDALONE_TEST_073
     * @tc.name GetUint32MaxValueTest073
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint32MaxValueTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const max: number = 4294967295;
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const dv: DataView = new DataView(buffer);
      dv.setUint32(0, max, false);
      expect(dv.getUint32(0)).assertEqual(max);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETUINT32_STANDALONE_TEST_074
     * @tc.name GetUint32MinValueTest074
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint32MinValueTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      const dv: DataView = new DataView(buffer);
      dv.setUint32(3, 0, true);
      expect(dv.getUint32(3, true)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETUINT32_STANDALONE_TEST_075
     * @tc.name GetUint32MaxValidOffsetTest075
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint32MaxValidOffsetTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const target: number = 2000000000;
      const buffer: ArrayBuffer = new ArrayBuffer(9);
      const dv: DataView = new DataView(buffer);
      dv.setUint32(5, target, false);
      expect(dv.getUint32(5)).assertEqual(target);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETUINT32_STANDALONE_TEST_076
     * @tc.name GetUint32MidValueTest076
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint32MidValueTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const target: number = 2147483648;
      const buffer: ArrayBuffer = new ArrayBuffer(10);
      const dv: DataView = new DataView(buffer);
      dv.setUint32(2, target, false);
      expect(dv.getUint32(2)).assertEqual(target);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETUINT32_STANDALONE_TEST_077
     * @tc.name GetUint32BinaryMaxTest077
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint32BinaryMaxTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      new Uint8Array(buffer).set([0xFF, 0xFF, 0xFF, 0xFF]);
      const dv: DataView = new DataView(buffer);
      expect(dv.getUint32(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETUINT32_STANDALONE_TEST_078
     * @tc.name GetUint32BinaryMidTest078
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint32BinaryMidTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      new Uint8Array(buffer).set([0x12, 0x34, 0x56, 0x78]);
      const dv: DataView = new DataView(buffer);
      expect(dv.getUint32(0)).assertEqual(305419896);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETUINT32_STANDALONE_TEST_079
     * @tc.name GetUint32LittleEndianBinaryTest079
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint32LittleEndianBinaryTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      new Uint8Array(buffer).set([0x78, 0x56, 0x34, 0x12]);
      const dv: DataView = new DataView(buffer);
      expect(dv.getUint32(0, true)).assertEqual(305419896);
    });

    /**
     * @tc.number SUB_DATAVIEW_GETUINT32_STANDALONE_TEST_080
     * @tc.name GetUint32OutOfBoundsTest080
     * @tc.desc test DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('GetUint32OutOfBoundsTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(5);
      const dv: DataView = new DataView(buffer);
      let isError: boolean = false;
      try { dv.getUint32(2); }
      catch (e) { isError = e instanceof RangeError ; }
      expect(isError).assertTrue();
    });

  })
}