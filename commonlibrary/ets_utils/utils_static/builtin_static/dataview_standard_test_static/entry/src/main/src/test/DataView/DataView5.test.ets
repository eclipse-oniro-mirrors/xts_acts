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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

interface OffsetGetTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface OffsetLittleEndianTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface SharedBufferGetTest {
  view: DataView;
  buffer: ArrayBuffer;
  testVal: number;
  result: number;
}

interface MultiViewGetTest {
  view1: DataView;
  view2: DataView;
  testVal: number;
}

interface Offset14ViewTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface OffsetBigEndianTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface BigEndianConsistencyTest {
  view: DataView;
  testVal: number;
  result: number;
}

interface NestedViewReadTest {
  view1: DataView;
  view2: DataView;
  offset: number;
  testVal: number;
}

interface LittleEndianDecimalTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface BigEndianPrecisionTest {
  view: DataView;
  testVal: number;
  result: number;
}

interface CrossViewReadTest {
  view1: DataView;
  view2: DataView;
  offset: number;
  testVal: number;
}

interface Offset5LittleEndianTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface SharedMultiViewTest {
  view1: DataView;
  view2: DataView;
  buffer: ArrayBuffer;
  testVal: number;
}

interface Offset3BigEndianTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface SeparateBufferReadTest {
  view1: DataView;
  view2: DataView;
  val1: number;
  val2: number;
}

interface Offset6LittleEndianLargeTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface Offset11LittleEndianTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface BigToLittleDecimalTest {
  view: DataView;
  testVal: number;
  bigResult: number;
  littleResult: number;
}

interface Offset7LittleEndianTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface Offset4BigEndianTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface SharedOffsetReadTest {
  view: DataView;
  buffer: ArrayBuffer;
  offset: number;
  testVal: number;
}

interface BigEndianLogTest {
  view: DataView;
  testVal: number;
  logResult: number;
}

interface CrossBufferTest {
  view1: DataView;
  view2: DataView;
  val1: number;
  val2: number;
}

interface Offset6BigEndianTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface Offset13LittleEndianTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface BigToLittleLargeTest {
  view: DataView;
  testVal: number;
  bigBits: string;
  littleBits: string;
}

interface OverlapViewTest {
  view1: DataView;
  view2: DataView;
  offset1: number;
  offset2: number;
  val1: number;
  val2: number;
}

interface BigEndianXorTest {
  view: DataView;
  testVal1: number;
  testVal2: number;
  xorResult: number;
}

interface SharedMultiOffsetTest {
  view: DataView;
  buffer: ArrayBuffer;
  offset1: number;
  offset2: number;
  val1: number;
  val2: number;
}

interface Offset3LittleEndianLargeTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface BigEndianPowerComboTest {
  view: DataView;
  testVal1: number;
  testVal2: number;
  comboResult: number;
}

interface MultiBufferTest {
  view1: DataView;
  view2: DataView;
  val1: number;
  val2: number;
}

interface Offset15LittleEndianTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface ZeroEndianConsistencyTest {
  view: DataView;
  zero: number;
  bigResult: number;
  littleResult: number;
}

interface NestedOverlapReadTest {
  view1: DataView;
  view2: DataView;
  view3: DataView;
  offset: number;
  testVal: number;
}

interface Offset5LittleEndianPosTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface BigEndianLargeMulTest {
  view: DataView;
  testVal: number;
  multiplier: number;
  product: number;
}

interface SharedNestedViewTest {
  view1: DataView;
  view2: DataView;
  buffer: ArrayBuffer;
  offset: number;
  testVal: number;
}

interface Offset6BigEndianPosTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface BigEndianOpComboTest {
  view: DataView;
  testVal1: number;
  testVal2: number;
  comboResult: number;
}

interface MultiBufferOpTest {
  view1: DataView;
  view2: DataView;
  val1: number;
  val2: number;
  opResult: number;
}

interface LittleEndianTrigComboTest {
  view: DataView;
  testVal1: number;
  testVal2: number;
  comboResult: number;
}

export default function DataView5Test() {
  describe('DataView5Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
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
     * @tc.name   DataView5Test001
     * @tc.number SUB_BUILTINS_DataView5_TEST_0100
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = Math.PI;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result).assertEqual(3.141592653589793);
    });
    /**
     * @tc.name   DataView5Test002
     * @tc.number SUB_BUILTINS_DataView5_TEST_0200
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = Math.E;
      view.setFloat64(0, testVal, true);
      const result = view.getFloat64(0, true);
      expect(result).assertEqual(2.718281828459045);
    });
    /**
     * @tc.name   DataView5Test003
     * @tc.number SUB_BUILTINS_DataView5_TEST_0300
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const offset = 3;
      const testVal = 123.456789;
      const view = new DataView(buffer);
      view.setFloat64(offset, testVal);
      const result = view.getFloat64(offset);
      const test: OffsetGetTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView5Test004
     * @tc.number SUB_BUILTINS_DataView5_TEST_0400
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const zero = 0.0;
      view.setFloat64(0, zero);
      const result = view.getFloat64(0);
      expect(result).assertEqual(zero);
    });

    /**
     * @tc.name   DataView5Test005
     * @tc.number SUB_BUILTINS_DataView5_TEST_0500
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(20);
      const offset = 4;
      const testVal = 987.654321;
      const view = new DataView(buffer);
      view.setFloat64(offset, testVal, true);
      const result = view.getFloat64(offset, true);
      const test: OffsetLittleEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView5Test006
     * @tc.number SUB_BUILTINS_DataView5_TEST_0600
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      const offset = 8;
      const testVal = 0.000123456789;
      view.setFloat64(offset, testVal);
      const result = view.getFloat64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test007
     * @tc.number SUB_BUILTINS_DataView5_TEST_0700
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const maxVal = Number.MAX_VALUE;
      view.setFloat64(0, maxVal);
      const result = view.getFloat64(0);
      expect(result).assertEqual(maxVal);
    });

    /**
     * @tc.name   DataView5Test008
     * @tc.number SUB_BUILTINS_DataView5_TEST_0800
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal = 56.7890123;
      const view = new DataView(buffer);
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      const test: SharedBufferGetTest = {
        view,
        buffer,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView5Test009
     * @tc.number SUB_BUILTINS_DataView5_TEST_0900
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1.23456789;
      view.setFloat64(0, testVal);
      const littleEndianResult = view.getFloat64(0, true);
      expect(littleEndianResult !== testVal).assertEqual(true);
    });

    /**
     * @tc.name   DataView5Test010
     * @tc.number SUB_BUILTINS_DataView5_TEST_1000
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1234.5678;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result.toFixed(4)).assertEqual("1234.5678");
    });

    /**
     * @tc.name   DataView5Test011
     * @tc.number SUB_BUILTINS_DataView5_TEST_1100
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal = 55.5555555;
      const view1 = new DataView(buffer);
      const view2 = new DataView(buffer);
      view1.setFloat64(0, testVal);
      const result = view2.getFloat64(0);
      const test: MultiViewGetTest = { view1, view2, testVal };
      expect(result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView5Test012
     * @tc.number SUB_BUILTINS_DataView5_TEST_1200
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 543.210987;
      view.setFloat64(0, testVal, true);
      const result = view.getFloat64(0, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test013
     * @tc.number SUB_BUILTINS_DataView5_TEST_1300
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 0, 8);
      const testVal = 0.123456789012345;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test014
     * @tc.number SUB_BUILTINS_DataView5_TEST_1400
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0.0000123456789;
      view.setFloat64(0, testVal, true);
      const result = view.getFloat64(0, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test015
     * @tc.number SUB_BUILTINS_DataView5_TEST_1500
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1.23456789e20;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test016
     * @tc.number SUB_BUILTINS_DataView5_TEST_1600
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(14);
      const offset = 6;
      const testVal = 12345.67890123;
      const view = new DataView(buffer);
      view.setFloat64(offset, testVal);
      const result = view.getFloat64(offset);
      const test: Offset14ViewTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView5Test017
     * @tc.number SUB_BUILTINS_DataView5_TEST_1700
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 100.5;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result + 50.5).assertEqual(151.0);
    });

    /**
     * @tc.name   DataView5Test018
     * @tc.number SUB_BUILTINS_DataView5_TEST_1800
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0.987654321;
      view.setFloat64(0, testVal, true);
      const result = view.getFloat64(0, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test019
     * @tc.number SUB_BUILTINS_DataView5_TEST_1900
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const minVal = Number.MIN_VALUE;
      view.setFloat64(0, minVal);
      const result = view.getFloat64(0);
      expect(result).assertEqual(minVal);
    });

    /**
     * @tc.name   DataView5Test020
     * @tc.number SUB_BUILTINS_DataView5_TEST_2000
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(20);
      const offset = 7;
      const testVal = 9876.54321098;
      const view = new DataView(buffer);
      view.setFloat64(offset, testVal);
      const result = view.getFloat64(offset);
      const test: OffsetBigEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView5Test021
     * @tc.number SUB_BUILTINS_DataView5_TEST_2100
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 123456789.0;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test022
     * @tc.number SUB_BUILTINS_DataView5_TEST_2200
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 0, 8);
      const testVal = 11.2233445566;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test023
     * @tc.number SUB_BUILTINS_DataView5_TEST_2300
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0.000123456;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result.toExponential(4)).assertEqual("1.2346e-4");
    });

    /**
     * @tc.name   DataView5Test024
     * @tc.number SUB_BUILTINS_DataView5_TEST_2400
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const minVal = Number.MIN_VALUE;
      view.setFloat64(0, minVal, true);
      const result = view.getFloat64(0, true);
      expect(result).assertEqual(minVal);
    });

    /**
     * @tc.name   DataView5Test025
     * @tc.number SUB_BUILTINS_DataView5_TEST_2500
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal = 456.78901234;
      const view = new DataView(buffer);
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      const test: BigEndianConsistencyTest = { view, testVal, result };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView5Test026
     * @tc.number SUB_BUILTINS_DataView5_TEST_2600
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1.234e-5;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result !== 0).assertEqual(true);
    });

    /**
     * @tc.name   DataView5Test027
     * @tc.number SUB_BUILTINS_DataView5_TEST_2700
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(24);
      const offset = 5;
      const testVal = 777.7777777;
      const view1 = new DataView(buffer, 0, 19);
      const view2 = new DataView(buffer, 3, 21);
      view1.setFloat64(offset, testVal);
      const result = view2.getFloat64(offset);
      expect(result.toString()).assertEqual("1.1745029543553454e-34");
    });

    /**
     * @tc.name   DataView5Test028
     * @tc.number SUB_BUILTINS_DataView5_TEST_2800
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const view = new DataView(buffer);
      const offset = 4;
      const testVal = 8765.43210987;
      view.setFloat64(offset, testVal);
      const result = view.getFloat64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test029
     * @tc.number SUB_BUILTINS_DataView5_TEST_2900
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 12.5;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result * 4).assertEqual(50.0);
    });

    /**
     * @tc.name   DataView5Test030
     * @tc.number SUB_BUILTINS_DataView5_TEST_3000
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 123456.78;
      view.setFloat64(0, testVal, true);
      const result = view.getFloat64(0, true);
      expect(result.toLocaleString('zh-CN')).assertEqual("123,456.78");
    });
    /**
     * @tc.name   DataView5Test031
     * @tc.number SUB_BUILTINS_DataView5_TEST_3100
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = Number.MAX_VALUE * 0.9;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test032
     * @tc.number SUB_BUILTINS_DataView5_TEST_3200
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(22);
      const offset = 9;
      const testVal = 0.000012345678901;
      const view = new DataView(buffer);
      view.setFloat64(offset, testVal, true);
      const result = view.getFloat64(offset, true);
      const test: LittleEndianDecimalTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView5Test033
     * @tc.number SUB_BUILTINS_DataView5_TEST_3300
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1000.0;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result / 25).assertEqual(40.0);
    });

    /**
     * @tc.name   DataView5Test034
     * @tc.number SUB_BUILTINS_DataView5_TEST_3400
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(20);
      const view = new DataView(buffer);
      const offset = 12;
      const testVal = 12345.6789012345;
      view.setFloat64(offset, testVal, true);
      const result = view.getFloat64(offset, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test035
     * @tc.number SUB_BUILTINS_DataView5_TEST_3500
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal = 0.1234567890123456789;
      const view = new DataView(buffer);
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      const test: BigEndianPrecisionTest = { view, testVal, result };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView5Test036
     * @tc.number SUB_BUILTINS_DataView5_TEST_3600
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const zero = 0.0;
      view.setFloat64(0, zero);
      const result = view.getFloat64(0);
      expect(result === zero).assertEqual(true);
    });

    /**
     * @tc.name   DataView5Test037
     * @tc.number SUB_BUILTINS_DataView5_TEST_3700
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(28);
      const offset = 6;
      const testVal = 999.999999999;
      const view1 = new DataView(buffer);
      const view2 = new DataView(buffer);
      view1.setFloat64(offset, testVal);
      const result = view2.getFloat64(offset);
      const test: CrossViewReadTest = {
        view1,
        view2,
        offset,
        testVal
      };
      expect(result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView5Test038
     * @tc.number SUB_BUILTINS_DataView5_TEST_3800
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(9);
      const view = new DataView(buffer);
      const offset = 1;
      const testVal = 54321.0987654321;
      view.setFloat64(offset, testVal);
      const result = view.getFloat64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test039
     * @tc.number SUB_BUILTINS_DataView5_TEST_3900
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = Number.MIN_VALUE * 10;
      view.setFloat64(0, testVal, true);
      const result = view.getFloat64(0, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test040
     * @tc.number SUB_BUILTINS_DataView5_TEST_4000
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 123.456789;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result.toFixed(6)).assertEqual("123.456789");
    });

    /**
     * @tc.name   DataView5Test041
     * @tc.number SUB_BUILTINS_DataView5_TEST_4100
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(18);
      const offset = 5;
      const testVal = 67890.12345678;
      const view = new DataView(buffer);
      view.setFloat64(offset, testVal, true);
      const result = view.getFloat64(offset, true);
      const test: Offset5LittleEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView5Test042
     * @tc.number SUB_BUILTINS_DataView5_TEST_4200
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = Math.SQRT2;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result).assertEqual(1.4142135623730951);
    });

    /**
     * @tc.name   DataView5Test043
     * @tc.number SUB_BUILTINS_DataView5_TEST_4300
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0.9876543210987654;
      view.setFloat64(0, testVal, true);
      const bigEndianResult = view.getFloat64(0);
      expect(bigEndianResult !== testVal).assertEqual(true);
    });

    /**
     * @tc.name   DataView5Test044
     * @tc.number SUB_BUILTINS_DataView5_TEST_4400
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1234567.89;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result.toLocaleString('en-US')).assertEqual("1,234,567.89");
    });

    /**
     * @tc.name   DataView5Test045
     * @tc.number SUB_BUILTINS_DataView5_TEST_4500
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal = 567.8901234;
      const view1 = new DataView(buffer);
      const view2 = new DataView(buffer);
      view1.setFloat64(0, testVal);
      const result = view2.getFloat64(0);
      const test: SharedMultiViewTest = {
        view1,
        view2,
        buffer,
        testVal
      };
      expect(result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView5Test046
     * @tc.number SUB_BUILTINS_DataView5_TEST_4600
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const zero = 0.0;
      view.setFloat64(0, zero, true);
      const result = view.getFloat64(0, true);
      expect(result).assertEqual(zero);
    });

    /**
     * @tc.name   DataView5Test047
     * @tc.number SUB_BUILTINS_DataView5_TEST_4700
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 0, 8);
      const maxVal = Number.MAX_VALUE;
      view.setFloat64(0, maxVal);
      const result = view.getFloat64(0);
      expect(result).assertEqual(maxVal);
    });

    /**
     * @tc.name   DataView5Test048
     * @tc.number SUB_BUILTINS_DataView5_TEST_4800
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const offset = 3;
      const testVal = 0.00123456789012;
      const view = new DataView(buffer);
      view.setFloat64(offset, testVal);
      const result = view.getFloat64(offset);
      const test: Offset3BigEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView5Test049
     * @tc.number SUB_BUILTINS_DataView5_TEST_4900
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 500.25;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result - 100.75).assertEqual(399.5);
    });

    /**
     * @tc.name   DataView5Test050
     * @tc.number SUB_BUILTINS_DataView5_TEST_5000
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1234.56789;
      view.setFloat64(0, testVal, true);
      const result = view.getFloat64(0, true);
      expect(result.toString()).assertEqual("1234.56789");
    });

    /**
     * @tc.name   DataView5Test051
     * @tc.number SUB_BUILTINS_DataView5_TEST_5100
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(15);
      const view = new DataView(buffer);
      const offset = 7;
      const testVal = 98765.432109876;
      view.setFloat64(offset, testVal);
      const result = view.getFloat64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test052
     * @tc.number SUB_BUILTINS_DataView5_TEST_5200
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1e300;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test053
     * @tc.number SUB_BUILTINS_DataView5_TEST_5300
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1.2345678901234567;
      view.setFloat64(0, testVal, true);
      const result = view.getFloat64(0, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test054
     * @tc.number SUB_BUILTINS_DataView5_TEST_5400
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0.125;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result * 8).assertEqual(1.0);
    });

    /**
     * @tc.name   DataView5Test055
     * @tc.number SUB_BUILTINS_DataView5_TEST_5500
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(8);
      const buffer2 = new ArrayBuffer(8);
      const val1 = 123.45;
      const val2 = 678.90;
      const view1 = new DataView(buffer1);
      const view2 = new DataView(buffer2);
      view1.setFloat64(0, val1);
      view2.setFloat64(0, val2);
      const result1 = view1.getFloat64(0);
      const result2 = view2.getFloat64(0);
      const test: SeparateBufferReadTest = {
        view1,
        view2,
        val1,
        val2
      };
      expect(result1).assertEqual(test.val1);
      expect(result2).assertEqual(test.val2);
    });

    /**
     * @tc.name   DataView5Test056
     * @tc.number SUB_BUILTINS_DataView5_TEST_5600
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 0, 8);
      const minVal = Number.MIN_VALUE;
      view.setFloat64(0, minVal);
      const result = view.getFloat64(0);
      expect(result).assertEqual(minVal);
    });

    /**
     * @tc.name   DataView5Test057
     * @tc.number SUB_BUILTINS_DataView5_TEST_5700
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = Math.E;
      view.setFloat64(0, testVal, true);
      const result = view.getFloat64(0, true);
      expect(result).assertEqual(2.718281828459045);
    });

    /**
     * @tc.name   DataView5Test058
     * @tc.number SUB_BUILTINS_DataView5_TEST_5800
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 123456.789;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result.toExponential(3)).assertEqual("1.235e+5");
    });

    /**
     * @tc.name   DataView5Test059
     * @tc.number SUB_BUILTINS_DataView5_TEST_5900
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(20);
      const offset = 6;
      const testVal = 9876543.2109876;
      const view = new DataView(buffer);
      view.setFloat64(offset, testVal, true);
      const result = view.getFloat64(offset, true);
      const test: Offset6LittleEndianLargeTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView5Test060
     * @tc.number SUB_BUILTINS_DataView5_TEST_6000
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 123456789.012345;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(isFinite(result)).assertEqual(true);
    });
    /**
     * @tc.name   DataView5Test061
     * @tc.number SUB_BUILTINS_DataView5_TEST_6100
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1.0;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test062
     * @tc.number SUB_BUILTINS_DataView5_TEST_6200
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(24);
      const offset = 11;
      const testVal = 12345678.90123456;
      const view = new DataView(buffer);
      view.setFloat64(offset, testVal, true);
      const result = view.getFloat64(offset, true);
      const test: Offset11LittleEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView5Test063
     * @tc.number SUB_BUILTINS_DataView5_TEST_6300
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 100.75;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result % 3).assertEqual(1.75);
    });

    /**
     * @tc.name   DataView5Test064
     * @tc.number SUB_BUILTINS_DataView5_TEST_6400
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer);
      const offset = 2;
      const testVal = 0.0012345678901234;
      view.setFloat64(offset, testVal);
      const result = view.getFloat64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test065
     * @tc.number SUB_BUILTINS_DataView5_TEST_6500
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal = 0.123456789012345;
      const view = new DataView(buffer);
      view.setFloat64(0, testVal);
      const bigResult = view.getFloat64(0);
      view.setFloat64(0, testVal, true);
      const littleResult = view.getFloat64(0, true);
      const test: BigToLittleDecimalTest = {
        view,
        testVal,
        bigResult,
        littleResult
      };
      expect(test.bigResult).assertEqual(test.testVal);
      expect(test.littleResult !== test.testVal).assertEqual(false);
    });

    /**
     * @tc.name   DataView5Test066
     * @tc.number SUB_BUILTINS_DataView5_TEST_6600
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 5.25;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result !== 0).assertEqual(true);
    });

    /**
     * @tc.name   DataView5Test067
     * @tc.number SUB_BUILTINS_DataView5_TEST_6700
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(32);
      const offset = 8;
      const testVal = 777.7777777777777;
      const view1 = new DataView(buffer, 0, 24);
      const view2 = new DataView(buffer, 4, 28);
      view1.setFloat64(offset, testVal);
      const result = view2.getFloat64(offset);
      expect(result.toString()).assertEqual("-3.649839970207916e+171");
    });

    /**
     * @tc.name   DataView5Test068
     * @tc.number SUB_BUILTINS_DataView5_TEST_6800
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(11);
      const view = new DataView(buffer);
      const offset = 3;
      const testVal = 9876.54321098765;
      view.setFloat64(offset, testVal);
      const result = view.getFloat64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test069
     * @tc.number SUB_BUILTINS_DataView5_TEST_6900
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1.0;
      view.setFloat64(0, testVal, true);
      const result = view.getFloat64(0, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test070
     * @tc.number SUB_BUILTINS_DataView5_TEST_7000
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0.000012345;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result.toExponential(4)).assertEqual("1.2345e-5");
    });

    /**
     * @tc.name   DataView5Test071
     * @tc.number SUB_BUILTINS_DataView5_TEST_7100
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(22);
      const offset = 7;
      const testVal = 6543.2109876543;
      const view = new DataView(buffer);
      view.setFloat64(offset, testVal, true);
      const result = view.getFloat64(offset, true);
      const test: Offset7LittleEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView5Test072
     * @tc.number SUB_BUILTINS_DataView5_TEST_7200
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 25.0;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(Math.sqrt(result)).assertEqual(5.0);
    });

    /**
     * @tc.name   DataView5Test073
     * @tc.number SUB_BUILTINS_DataView5_TEST_7300
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 123.456789;
      view.setFloat64(0, testVal, true);
      const bigEndianResult = view.getFloat64(0);
      expect(bigEndianResult !== testVal).assertEqual(true);
    });

    /**
     * @tc.name   DataView5Test074
     * @tc.number SUB_BUILTINS_DataView5_TEST_7400
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(20);
      const offset = 4;
      const testVal = 12345.6789012345;
      const view = new DataView(buffer);
      view.setFloat64(offset, testVal);
      const result = view.getFloat64(offset);
      const test: Offset4BigEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView5Test075
     * @tc.number SUB_BUILTINS_DataView5_TEST_7500
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const offset = 2;
      const testVal = 4321.0987654321;
      const view = new DataView(buffer);
      view.setFloat64(offset, testVal);
      const result = view.getFloat64(offset);
      const test: SharedOffsetReadTest = {
        view,
        buffer,
        offset,
        testVal
      };
      expect(result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView5Test076
     * @tc.number SUB_BUILTINS_DataView5_TEST_7600
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1.0;
      view.setFloat64(0, testVal, true);
      const result = view.getFloat64(0, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test077
     * @tc.number SUB_BUILTINS_DataView5_TEST_7700
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer, 0, 16);
      const offset = 8;
      const testVal = 111.222333444555;
      view.setFloat64(offset, testVal);
      const result = view.getFloat64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test078
     * @tc.number SUB_BUILTINS_DataView5_TEST_7800
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 2.0;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(Math.pow(result, 3)).assertEqual(8.0);
    });

    /**
     * @tc.name   DataView5Test079
     * @tc.number SUB_BUILTINS_DataView5_TEST_7900
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 987.654321;
      view.setFloat64(0, testVal, true);
      const result = view.getFloat64(0, true);
      expect(result.toFixed(3)).assertEqual("987.654");
    });

    /**
     * @tc.name   DataView5Test080
     * @tc.number SUB_BUILTINS_DataView5_TEST_8000
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 9007199254740.991;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test081
     * @tc.number SUB_BUILTINS_DataView5_TEST_8100
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = Number.MAX_VALUE * 0.5;
      view.setFloat64(0, testVal, true);
      const result = view.getFloat64(0, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test082
     * @tc.number SUB_BUILTINS_DataView5_TEST_8200
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(13);
      const view = new DataView(buffer);
      const offset = 5;
      const testVal = 56789.0123456789;
      view.setFloat64(offset, testVal);
      const result = view.getFloat64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test083
     * @tc.number SUB_BUILTINS_DataView5_TEST_8300
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal = 100.0;
      const logResult = Math.log10(testVal);
      const view = new DataView(buffer);
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      const test: BigEndianLogTest = { view, testVal, logResult };
      expect(Math.log10(result)).assertEqual(test.logResult);
    });

    /**
     * @tc.name   DataView5Test084
     * @tc.number SUB_BUILTINS_DataView5_TEST_8400
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = Math.PI / 2;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(Math.sin(result)).assertEqual(1.0);
    });

    /**
     * @tc.name   DataView5Test085
     * @tc.number SUB_BUILTINS_DataView5_TEST_8500
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(8);
      const buffer2 = new ArrayBuffer(8);
      const val1 = 111.11;
      const val2 = 222.22;
      const view1 = new DataView(buffer1);
      const view2 = new DataView(buffer2);
      view1.setFloat64(0, val1);
      view2.setFloat64(0, val2);
      const result1 = view1.getFloat64(0);
      const result2 = view2.getFloat64(0);
      const test: CrossBufferTest = {
        view1,
        view2,
        val1,
        val2
      };
      expect(result1).assertEqual(test.val1);
      expect(result2).assertEqual(test.val2);
    });

    /**
     * @tc.name   DataView5Test086
     * @tc.number SUB_BUILTINS_DataView5_TEST_8600
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 0, 8);
      const testVal = 1.0;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test087
     * @tc.number SUB_BUILTINS_DataView5_TEST_8700
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0;
      view.setFloat64(0, testVal, true);
      const result = view.getFloat64(0, true);
      expect(Math.cos(result)).assertEqual(1.0);
    });

    /**
     * @tc.name   DataView5Test088
     * @tc.number SUB_BUILTINS_DataView5_TEST_8800
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0.756;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result.toLocaleString(undefined, { style: 'percent', minimumFractionDigits: 2 })).assertEqual("75.60%");
    });

    /**
     * @tc.name   DataView5Test089
     * @tc.number SUB_BUILTINS_DataView5_TEST_8900
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(20);
      const offset = 6;
      const testVal = 98765.4321098765;
      const view = new DataView(buffer);
      view.setFloat64(offset, testVal);
      const result = view.getFloat64(offset);
      const test: Offset6BigEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView5Test090
     * @tc.number SUB_BUILTINS_DataView5_TEST_9000
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 123.45;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      const temp = result;
      const fakeModify = result + 10;
      expect(temp).assertEqual(testVal);
    });
    /**
     * @tc.name   DataView5Test091
     * @tc.number SUB_BUILTINS_DataView5_TEST_9100
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0.5;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test092
     * @tc.number SUB_BUILTINS_DataView5_TEST_9200
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(26);
      const offset = 13;
      const testVal = 123456789.01234567;
      const view = new DataView(buffer);
      view.setFloat64(offset, testVal, true);
      const result = view.getFloat64(offset, true);
      const test: Offset13LittleEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView5Test093
     * @tc.number SUB_BUILTINS_DataView5_TEST_9300
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 10.25;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result * 2 + 3.5).assertEqual(24.0);
    });

    /**
     * @tc.name   DataView5Test094
     * @tc.number SUB_BUILTINS_DataView5_TEST_9400
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(9);
      const view = new DataView(buffer);
      const offset = 1;
      const testVal = 65432.1098765432;
      view.setFloat64(offset, testVal);
      const result = view.getFloat64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test095
     * @tc.number SUB_BUILTINS_DataView5_TEST_9500
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal = Number.MAX_VALUE * 0.8;
      const view = new DataView(buffer);
      view.setFloat64(0, testVal);
      const bigBits = new Uint8Array(buffer).join(',');
      view.setFloat64(0, testVal, true);
      const littleBits = new Uint8Array(buffer).join(',');
      const test: BigToLittleLargeTest = {
        view,
        testVal,
        bigBits,
        littleBits
      };
      expect(test.bigBits !== test.littleBits).assertEqual(true);
    });

    /**
     * @tc.name   DataView5Test096
     * @tc.number SUB_BUILTINS_DataView5_TEST_9600
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 9007199254740990;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result < 9007199254740991).assertEqual(true);
    });

    /**
     * @tc.name   DataView5Test097
     * @tc.number SUB_BUILTINS_DataView5_TEST_9700
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(24);
      const offset1 = 0;
      const offset2 = 8;
      const val1 = 111.11;
      const val2 = 222.22;
      const view1 = new DataView(buffer, 0, 16);
      const view2 = new DataView(buffer, 8, 16);
      view1.setFloat64(offset1, val1);
      view2.setFloat64(offset2, val2);
      const result1 = view1.getFloat64(offset1);
      const result2 = view2.getFloat64(offset2);
      const test: OverlapViewTest = {
        view1,
        view2,
        offset1,
        offset2,
        val1,
        val2
      };
      expect(result1).assertEqual(test.val1);
      expect(result2).assertEqual(test.val2);
    });

    /**
     * @tc.name   DataView5Test098
     * @tc.number SUB_BUILTINS_DataView5_TEST_9800
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const view = new DataView(buffer);
      const offset = 4;
      const testVal = 0.00123456789012345;
      view.setFloat64(offset, testVal);
      const result = view.getFloat64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test099
     * @tc.number SUB_BUILTINS_DataView5_TEST_9900
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 7.3;
      view.setFloat64(0, testVal, true);
      const result = view.getFloat64(0, true);
      expect(result / 2).assertEqual(3.65);
    });

    /**
     * @tc.name   DataView5Test100
     * @tc.number SUB_BUILTINS_DataView5_TEST_10000
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 255.0;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(Math.floor(result).toString(8)).assertEqual("377");
    });

    /**
     * @tc.name   DataView5Test101
     * @tc.number SUB_BUILTINS_DataView5_TEST_10100
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(20);
      const offset = 6;
      const testVal = 987654.321098765;
      const view = new DataView(buffer);
      view.setFloat64(offset, testVal);
      const result = view.getFloat64(offset);
      const test: Offset6BigEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView5Test102
     * @tc.number SUB_BUILTINS_DataView5_TEST_10200
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1e308;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(typeof result === "number").assertEqual(true);
    });

    /**
     * @tc.name   DataView5Test103
     * @tc.number SUB_BUILTINS_DataView5_TEST_10300
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0.0000001234;
      view.setFloat64(0, testVal, true);
      const bigResult = view.getFloat64(0);
      expect(Math.abs(bigResult - testVal) > 0.00000001).assertEqual(true);
    });

    /**
     * @tc.name   DataView5Test104
     * @tc.number SUB_BUILTINS_DataView5_TEST_10400
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer);
      const offset = 2;
      const testVal = 123456.78901234;
      view.setFloat64(offset, testVal);
      const result = view.getFloat64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test105
     * @tc.number SUB_BUILTINS_DataView5_TEST_10500
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal1 = 123.0;
      const testVal2 = 456.0;
      const xorResult = Math.floor(testVal1) ^ Math.floor(testVal2);
      const view = new DataView(buffer);
      view.setFloat64(0, testVal1);
      const result1 = view.getFloat64(0);
      view.setFloat64(0, testVal2);
      const result2 = view.getFloat64(0);
      const test: BigEndianXorTest = {
        view,
        testVal1,
        testVal2,
        xorResult
      };
      expect(Math.floor(result1) ^ Math.floor(result2)).assertEqual(test.xorResult);
    });

    /**
     * @tc.name   DataView5Test106
     * @tc.number SUB_BUILTINS_DataView5_TEST_10600
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal1 = 255.0;
      const testVal2 = 127.0;
      view.setFloat64(0, testVal1);
      const result1 = view.getFloat64(0);
      view.setFloat64(0, testVal2);
      const result2 = view.getFloat64(0);
      expect(Math.floor(result1) & Math.floor(result2)).assertEqual(127);
    });

    /**
     * @tc.name   DataView5Test107
     * @tc.number SUB_BUILTINS_DataView5_TEST_10700
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(24);
      const offset1 = 0;
      const offset2 = 10;
      const val1 = 111.11;
      const val2 = 222.22;
      const view = new DataView(buffer);
      view.setFloat64(offset1, val1);
      view.setFloat64(offset2, val2);
      const result1 = view.getFloat64(offset1);
      const result2 = view.getFloat64(offset2);
      const test: SharedMultiOffsetTest = {
        view,
        buffer,
        offset1,
        offset2,
        val1,
        val2
      };
      expect(result1).assertEqual(test.val1);
      expect(result2).assertEqual(test.val2);
    });

    /**
     * @tc.name   DataView5Test108
     * @tc.number SUB_BUILTINS_DataView5_TEST_10800
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 0, 8);
      const testVal = 0.0;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test109
     * @tc.number SUB_BUILTINS_DataView5_TEST_10900
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal1 = 12.0;
      const testVal2 = 34.0;
      view.setFloat64(0, testVal1, true);
      const result1 = view.getFloat64(0, true);
      view.setFloat64(0, testVal2, true);
      const result2 = view.getFloat64(0, true);
      expect(Math.floor(result1) | Math.floor(result2)).assertEqual(46);
    });

    /**
     * @tc.name   DataView5Test110
     * @tc.number SUB_BUILTINS_DataView5_TEST_11000
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 123456.0;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(Math.floor(result).toString(36)).assertEqual("2n9c");
    });

    /**
     * @tc.name   DataView5Test111
     * @tc.number SUB_BUILTINS_DataView5_TEST_11100
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(18);
      const offset = 3;
      const testVal = 1234567.890123;
      const view = new DataView(buffer);
      view.setFloat64(offset, testVal, true);
      const result = view.getFloat64(offset, true);
      const test: Offset3LittleEndianLargeTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView5Test112
     * @tc.number SUB_BUILTINS_DataView5_TEST_11200
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 123.45;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      const temp = result;
      const fakeModify = result + 10;
      expect(temp).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test113
     * @tc.number SUB_BUILTINS_DataView5_TEST_11300
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0.0;
      view.setFloat64(0, testVal, true);
      const bigResult = view.getFloat64(0);
      expect(bigResult).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test114
     * @tc.number SUB_BUILTINS_DataView5_TEST_11400
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(13);
      const view = new DataView(buffer);
      const offset = 5;
      const testVal = 9876543.210987;
      view.setFloat64(offset, testVal);
      const result = view.getFloat64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test115
     * @tc.number SUB_BUILTINS_DataView5_TEST_11500
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal1 = 2.0;
      const testVal2 = 3.0;
      const comboResult = Math.pow(testVal1, testVal2) * 4;
      const view = new DataView(buffer);
      view.setFloat64(0, testVal1);
      const result1 = view.getFloat64(0);
      view.setFloat64(0, testVal2);
      const result2 = view.getFloat64(0);
      const test: BigEndianPowerComboTest = {
        view,
        testVal1,
        testVal2,
        comboResult
      };
      expect(Math.pow(result1, result2) * 4).assertEqual(test.comboResult);
    });

    /**
     * @tc.name   DataView5Test116
     * @tc.number SUB_BUILTINS_DataView5_TEST_11600
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 16.0;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(Math.floor(result) >> 2).assertEqual(4);
    });

    /**
     * @tc.name   DataView5Test117
     * @tc.number SUB_BUILTINS_DataView5_TEST_11700
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(8);
      const buffer2 = new ArrayBuffer(8);
      const val1 = 0.123;
      const val2 = 0.456;
      const view1 = new DataView(buffer1);
      const view2 = new DataView(buffer2);
      view1.setFloat64(0, val1);
      view2.setFloat64(0, val2);
      const result1 = view1.getFloat64(0);
      const result2 = view2.getFloat64(0);
      const test: MultiBufferTest = {
        view1,
        view2,
        val1,
        val2
      };
      expect(result1).assertEqual(test.val1);
      expect(result2).assertEqual(test.val2);
    });

    /**
     * @tc.name   DataView5Test118
     * @tc.number SUB_BUILTINS_DataView5_TEST_11800
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer, 0, 16);
      const maxVal = Number.MAX_VALUE;
      view.setFloat64(0, maxVal);
      const result = view.getFloat64(0);
      expect(result).assertEqual(maxVal);
    });

    /**
     * @tc.name   DataView5Test119
     * @tc.number SUB_BUILTINS_DataView5_TEST_11900
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 8.0;
      view.setFloat64(0, testVal, true);
      const result = view.getFloat64(0, true);
      expect(Math.floor(result) << 2).assertEqual(32);
    });

    /**
     * @tc.name   DataView5Test120
     * @tc.number SUB_BUILTINS_DataView5_TEST_12000
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1234.56;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result.toString()).assertEqual("1234.56");
    });
    /**
     * @tc.name   DataView5Test121
     * @tc.number SUB_BUILTINS_DataView5_TEST_12100
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1.234e-300;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test122
     * @tc.number SUB_BUILTINS_DataView5_TEST_12200
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(28);
      const offset = 15;
      const testVal = 987654321.09876543;
      const view = new DataView(buffer);
      view.setFloat64(offset, testVal, true);
      const result = view.getFloat64(offset, true);
      const test: Offset15LittleEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView5Test123
     * @tc.number SUB_BUILTINS_DataView5_TEST_12300
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 8.0;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(Math.cbrt(result)).assertEqual(2.0);
    });

    /**
     * @tc.name   DataView5Test124
     * @tc.number SUB_BUILTINS_DataView5_TEST_12400
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer);
      const offset = 2;
      const testVal = 3.4e-308;
      view.setFloat64(offset, testVal);
      const result = view.getFloat64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test125
     * @tc.number SUB_BUILTINS_DataView5_TEST_12500
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const zero = 0.0;
      const view = new DataView(buffer);
      view.setFloat64(0, zero);
      const bigResult = view.getFloat64(0);
      view.setFloat64(0, zero, true);
      const littleResult = view.getFloat64(0, true);
      const test: ZeroEndianConsistencyTest = {
        view,
        zero,
        bigResult,
        littleResult
      };
      expect(test.bigResult).assertEqual(test.zero);
      expect(test.littleResult).assertEqual(test.zero);
    });

    /**
     * @tc.name   DataView5Test126
     * @tc.number SUB_BUILTINS_DataView5_TEST_12600
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1e-307;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result > 1e-308).assertEqual(true);
    });

    /**
     * @tc.name   DataView5Test127
     * @tc.number SUB_BUILTINS_DataView5_TEST_12700
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(32);
      const offset = 10;
      const testVal = 888.8888888888888;
      const view1 = new DataView(buffer, 0, 22);
      const view2 = new DataView(buffer, 5, 27);
      const view3 = new DataView(buffer, 10, 22);
      view1.setFloat64(offset, testVal);
      const result = view3.getFloat64(offset);
      const test: NestedOverlapReadTest = {
        view1,
        view2,
        view3,
        offset,
        testVal
      };
      expect(result.toString()).assertEqual("0");
    });

    /**
     * @tc.name   DataView5Test128
     * @tc.number SUB_BUILTINS_DataView5_TEST_12800
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(15);
      const view = new DataView(buffer);
      const offset = 7;
      const testVal = 12345.67890123456;
      view.setFloat64(offset, testVal);
      const result = view.getFloat64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test129
     * @tc.number SUB_BUILTINS_DataView5_TEST_12900
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = Number.MAX_VALUE * 0.99;
      view.setFloat64(0, testVal, true);
      const result = view.getFloat64(0, true);
      expect(result - 1e290).assertEqual(testVal - 1e290);
    });

    /**
     * @tc.name   DataView5Test130
     * @tc.number SUB_BUILTINS_DataView5_TEST_13000
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0.1234567890123456789;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result.toPrecision(15)).assertEqual("0.123456789012346");
    });

    /**
     * @tc.name   DataView5Test131
     * @tc.number SUB_BUILTINS_DataView5_TEST_13100
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(23);
      const offset = 5;
      const testVal = 654321.0987654321;
      const view = new DataView(buffer);
      view.setFloat64(offset, testVal, true);
      const result = view.getFloat64(offset, true);
      const test: Offset5LittleEndianPosTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView5Test132
     * @tc.number SUB_BUILTINS_DataView5_TEST_13200
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 987.654;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      const temp = result;
      const fakeModify = result * 2;
      expect(temp).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test133
     * @tc.number SUB_BUILTINS_DataView5_TEST_13300
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = Number.MAX_VALUE * 0.95;
      view.setFloat64(0, testVal, true);
      const bigResult = view.getFloat64(0);
      expect(Math.abs(bigResult - testVal) < 1e290).assertEqual(false);
    });

    /**
     * @tc.name   DataView5Test134
     * @tc.number SUB_BUILTINS_DataView5_TEST_13400
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(11);
      const view = new DataView(buffer);
      const offset = 3;
      const testVal = 765432.109876543;
      view.setFloat64(offset, testVal);
      const result = view.getFloat64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test137
     * @tc.number SUB_BUILTINS_DataView5_TEST_13700
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = -9007199254740990.0;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result.toString()).assertEqual("-9007199254740990");
    });

    /**
     * @tc.name   DataView5Test138
     * @tc.number SUB_BUILTINS_DataView5_TEST_13800
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 0, 8);
      const maxVal = Number.MAX_VALUE;
      view.setFloat64(0, maxVal);
      const result = view.getFloat64(0);
      expect(result).assertEqual(maxVal);
    });

    /**
     * @tc.name   DataView5Test139
     * @tc.number SUB_BUILTINS_DataView5_TEST_13900
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 123.456;
      view.setFloat64(0, testVal, true);
      const result = view.getFloat64(0, true);
      expect(Math.round(result)).assertEqual(123);
    });

    /**
     * @tc.name   DataView5Test140
     * @tc.number SUB_BUILTINS_DataView5_TEST_14000
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 65535.0;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(Math.floor(result).toString(16)).assertEqual("ffff");
    });

    /**
     * @tc.name   DataView5Test141
     * @tc.number SUB_BUILTINS_DataView5_TEST_14100
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(22);
      const offset = 6;
      const testVal = 9876543.210987654;
      const view = new DataView(buffer);
      view.setFloat64(offset, testVal);
      const result = view.getFloat64(offset);
      const test: Offset6BigEndianPosTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView5Test142
     * @tc.number SUB_BUILTINS_DataView5_TEST_14200
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0.12345678901234567890123;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(Math.abs(result - testVal) < 1e-20).assertEqual(true);
    });

    /**
     * @tc.name   DataView5Test143
     * @tc.number SUB_BUILTINS_DataView5_TEST_14300
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1e300;
      view.setFloat64(0, testVal, true);
      const bigResult = view.getFloat64(0, true);
      expect(bigResult).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test144
     * @tc.number SUB_BUILTINS_DataView5_TEST_14400
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const view = new DataView(buffer);
      const offset = 4;
      const testVal = 12345678.90123456;
      view.setFloat64(offset, testVal);
      const result = view.getFloat64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView5Test145
     * @tc.number SUB_BUILTINS_DataView5_TEST_14500
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal1 = 100.0;
      const testVal2 = 25.0;
      const comboResult = (testVal1 + testVal2) * (testVal1 - testVal2) / testVal2;
      const view = new DataView(buffer);
      view.setFloat64(0, testVal1);
      const result1 = view.getFloat64(0);
      view.setFloat64(0, testVal2);
      const result2 = view.getFloat64(0);
      const test: BigEndianOpComboTest = {
        view,
        testVal1,
        testVal2,
        comboResult
      };
      expect((result1 + result2) * (result1 - result2) / result2).assertEqual(test.comboResult);
    });

    /**
     * @tc.name   DataView5Test147
     * @tc.number SUB_BUILTINS_DataView5_TEST_14700
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(8);
      const buffer2 = new ArrayBuffer(8);
      const val1 = 1234.56;
      const val2 = 789.01;
      const opResult = val1 * val2;
      const view1 = new DataView(buffer1);
      const view2 = new DataView(buffer2);
      view1.setFloat64(0, val1);
      view2.setFloat64(0, val2);
      const result1 = view1.getFloat64(0);
      const result2 = view2.getFloat64(0);
      const test: MultiBufferOpTest = {
        view1,
        view2,
        val1,
        val2,
        opResult
      };
      expect(result1 * result2).assertEqual(test.opResult);
    });

    /**
     * @tc.name   DataView5Test148
     * @tc.number SUB_BUILTINS_DataView5_TEST_14800
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer, 0, 16);
      const offset = 8;
      const maxVal = Number.MAX_VALUE;
      view.setFloat64(offset, maxVal);
      const result = view.getFloat64(offset);
      expect(result).assertEqual(maxVal);
    });

    /**
     * @tc.name   DataView5Test149
     * @tc.number SUB_BUILTINS_DataView5_TEST_14900
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal1 = Math.PI / 4;
      const testVal2 = 0.5;
      const comboResult = Math.sin(testVal1) + testVal2;
      const view = new DataView(buffer);
      view.setFloat64(0, testVal1, true);
      const result1 = view.getFloat64(0, true);
      view.setFloat64(0, testVal2, true);
      const result2 = view.getFloat64(0, true);
      const test: LittleEndianTrigComboTest = {
        view,
        testVal1,
        testVal2,
        comboResult
      };
      expect(Math.sin(result1) + result2).assertEqual(test.comboResult);
    });

    /**
     * @tc.name   DataView5Test150
     * @tc.number SUB_BUILTINS_DataView5_TEST_15000
     * @tc.desc   test DataView getFloat64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView5Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1234567.89;
      view.setFloat64(0, testVal);
      const result = view.getFloat64(0);
      expect(result.toLocaleString('ja-JP')).assertEqual("1,234,567.89");
    });


  })
}

