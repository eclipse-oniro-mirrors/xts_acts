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

interface Offset12ViewTest {
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

interface Offset7LittleEndianTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface EndianNonIntTest {
  view: DataView;
  testVal: number;
  littleResult: number;
}

interface OverlapViewReadTest {
  view1: DataView;
  view2: DataView;
  offset: number;
  testVal: number;
}

interface Offset8BigEndianTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface BigEndianMulTest {
  view: DataView;
  testVal: number;
  multiplier: number;
  product: number;
}

interface SharedMultiOffsetTest {
  view: DataView;
  buffer: ArrayBuffer;
  offset1: number;
  offset2: number;
  val1: number;
  val2: number;
}

interface Offset4LittleEndianTest {
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

interface MultiBufferReadTest {
  view1: DataView;
  view2: DataView;
  val1: number;
  val2: number;
}

interface Offset6LittleEndianTest {
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
  view3: DataView;
  offset: number;
  testVal: number;
}

interface Offset10BigEndianTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface BigEndianMidMulTest {
  view: DataView;
  testVal: number;
  multiplier: number;
  product: number;
}

interface SharedMultiViewTest {
  view1: DataView;
  view2: DataView;
  buffer: ArrayBuffer;
  offset: number;
  testVal: number;
}

interface Offset5LittleEndianMidTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface BigEndianSubMulTest {
  view: DataView;
  testVal1: number;
  testVal2: number;
  comboResult: number;
}

interface DualBufferCrossTest {
  view1: DataView;
  view2: DataView;
  buffer1: ArrayBuffer;
  buffer2: ArrayBuffer;
  val1: number;
  val2: number;
}

interface Offset8LittleEndianTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface LittleEndianConsistencyTest {
  view: DataView;
  testVal: number;
  result: number;
}

interface OverlapWriteReadTest {
  view1: DataView;
  view2: DataView;
  offset: number;
  val1: number;
  val2: number;
  finalVal: number;
}

interface Offset12BigEndianTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface LittleEndianLargeMulTest {
  view: DataView;
  testVal: number;
  multiplier: number;
  product: number;
}

interface SharedMultiOffsetWriteTest {
  view: DataView;
  buffer: ArrayBuffer;
  offset1: number;
  offset2: number;
  val1: number;
  val2: number;
}

interface Offset7LittleEndianLargeTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}


interface BigEndianMulDivTest {
  view: DataView;
  testVal1: number;
  testVal2: number;
  comboResult: number;
}

interface TripleBufferTest {
  view1: DataView;
  view2: DataView;
  view3: DataView;
  val1: number;
  val2: number;
  val3: number;
}

interface Offset9LittleEndianTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface BigEndianMillionTest {
  view: DataView;
  testVal: number;
  result: number;
}

interface NestedWriteReadTest {
  view1: DataView;
  view2: DataView;
  view3: DataView;
  offset: number;
  val1: number;
  val2: number;
  finalVal: number;
}

interface Offset14BigEndianTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface LittleEndianMillionMulTest {
  view: DataView;
  testVal: number;
  multiplier: number;
  product: number;
}

interface SharedNestedViewReadTest {
  view1: DataView;
  view2: DataView;
  buffer: ArrayBuffer;
  offset: number;
  testVal: number;
}

interface Offset6LittleEndianMillionTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface LittleEndianAddSubTest {
  view: DataView;
  testVal1: number;
  testVal2: number;
  comboResult: number;
}

interface Offset10LittleEndianMillionTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface LittleEndianTenMillionTest {
  view: DataView;
  testVal: number;
  result: number;
}

export default function DataView4Test() {
  describe('DataView4Test', () => {
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
     * @tc.name   DataView4Test001
     * @tc.number SUB_BUILTINS_DataView4_TEST_0100
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 123.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result).assertEqual(testVal);
    });
    /**
     * @tc.name   DataView4Test002
     * @tc.number SUB_BUILTINS_DataView4_TEST_0200
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 456.0;
      view.setFloat32(0, testVal, true);
      const result = view.getFloat32(0, true);
      expect(result).assertEqual(testVal);
    });
    /**
     * @tc.name   DataView4Test003
     * @tc.number SUB_BUILTINS_DataView4_TEST_0300
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const offset = 3;
      const testVal = 789.0;
      const view = new DataView(buffer);
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      const test: OffsetGetTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView4Test004
     * @tc.number SUB_BUILTINS_DataView4_TEST_0400
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 1.23456789;
      view.setFloat32(0, testVal);
      const littleEndianResult = view.getFloat32(0, true);
      expect(Math.abs(littleEndianResult - testVal) > 0.0001).assertEqual(true);
    });

    /**
     * @tc.name   DataView4Test005
     * @tc.number SUB_BUILTINS_DataView4_TEST_0500
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 123.456;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result.toFixed(3)).assertEqual(testVal.toFixed(3));
    });

    /**
     * @tc.name   DataView4Test006
     * @tc.number SUB_BUILTINS_DataView4_TEST_0600
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 123.0;
      view.setFloat32(0, testVal);
      const littleEndianResult = view.getFloat32(0, true);
      expect(littleEndianResult !== testVal).assertEqual(true);
    });

    /**
     * @tc.name   DataView4Test007
     * @tc.number SUB_BUILTINS_DataView4_TEST_0700
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const zero = 0.0;
      view.setFloat32(0, zero);
      const result = view.getFloat32(0);
      expect(result).assertEqual(zero);
    });

    /**
     * @tc.name   DataView4Test008
     * @tc.number SUB_BUILTINS_DataView4_TEST_0800
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const offset = 2;
      const testVal = 321.0;
      const view = new DataView(buffer);
      view.setFloat32(offset, testVal, true);
      const result = view.getFloat32(offset, true);
      const test: OffsetLittleEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView4Test009
     * @tc.number SUB_BUILTINS_DataView4_TEST_0900
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer);
      const offset = 6;
      const testVal = 654.0;
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test010
     * @tc.number SUB_BUILTINS_DataView4_TEST_1000
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const maxVal = 3.4e38;
      view.setFloat32(0, maxVal);
      const result = view.getFloat32(0);
      expect(Math.abs(result - maxVal) < 1e36).assertEqual(true);
    });

    /**
     * @tc.name   DataView4Test011
     * @tc.number SUB_BUILTINS_DataView4_TEST_1100
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const testVal = 963.0;
      const view = new DataView(buffer);
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      const test: SharedBufferGetTest = {
        view,
        buffer,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView4Test012
     * @tc.number SUB_BUILTINS_DataView4_TEST_1200
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 123.0;
      view.setFloat32(0, testVal);
      const littleEndianResult = view.getFloat32(0, true);
      expect(Number.isInteger(littleEndianResult)).assertEqual(false);
    });

    /**
     * @tc.name   DataView4Test013
     * @tc.number SUB_BUILTINS_DataView4_TEST_1300
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 123.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result.toFixed(0)).assertEqual(testVal.toFixed(0));
    });

    /**
     * @tc.name   DataView4Test014
     * @tc.number SUB_BUILTINS_DataView4_TEST_1400
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const testVal = 555.0;
      const view1 = new DataView(buffer);
      const view2 = new DataView(buffer);
      view1.setFloat32(0, testVal);
      const result = view2.getFloat32(0);
      const test: MultiViewGetTest = { view1, view2, testVal };
      expect(result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView4Test015
     * @tc.number SUB_BUILTINS_DataView4_TEST_1500
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 888.0;
      view.setFloat32(0, testVal, true);
      const result = view.getFloat32(0, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test016
     * @tc.number SUB_BUILTINS_DataView4_TEST_1600
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer, 0, 4);
      const testVal = 777.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test017
     * @tc.number SUB_BUILTINS_DataView4_TEST_1700
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 0.123;
      view.setFloat32(0, testVal, true);
      const result = view.getFloat32(0, true);
      expect(result.toFixed(3)).assertEqual(testVal.toFixed(3));
    });

    /**
     * @tc.name   DataView4Test018
     * @tc.number SUB_BUILTINS_DataView4_TEST_1800
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 1.7e38;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(Math.abs(result - testVal) < 1e36).assertEqual(true);
    });

    /**
     * @tc.name   DataView4Test019
     * @tc.number SUB_BUILTINS_DataView4_TEST_1900
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const offset = 4;
      const testVal = 1234.0;
      const view = new DataView(buffer);
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      const test: Offset12ViewTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView4Test020
     * @tc.number SUB_BUILTINS_DataView4_TEST_2000
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 100.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result + 50.0).assertEqual(150.0);
    });

    /**
     * @tc.name   DataView4Test021
     * @tc.number SUB_BUILTINS_DataView4_TEST_2100
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 999.0;
      view.setFloat32(0, testVal, true);
      const result = view.getFloat32(0, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test022
     * @tc.number SUB_BUILTINS_DataView4_TEST_2200
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const minVal = -3.4e38;
      view.setFloat32(0, minVal);
      const result = view.getFloat32(0);
      expect(Math.abs(result - minVal) < 1e36).assertEqual(true);
    });

    /**
     * @tc.name   DataView4Test023
     * @tc.number SUB_BUILTINS_DataView4_TEST_2300
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(15);
      const offset = 5;
      const testVal = 4321.0;
      const view = new DataView(buffer);
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      const test: OffsetBigEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView4Test024
     * @tc.number SUB_BUILTINS_DataView4_TEST_2400
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 123456.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test025
     * @tc.number SUB_BUILTINS_DataView4_TEST_2500
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer, 0, 4);
      const testVal = 11.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test026
     * @tc.number SUB_BUILTINS_DataView4_TEST_2600
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const minVal = -3.4e38;
      view.setFloat32(0, minVal, true);
      const result = view.getFloat32(0, true);
      expect(Math.abs(result - minVal) < 1e36).assertEqual(true);
    });

    /**
     * @tc.name   DataView4Test027
     * @tc.number SUB_BUILTINS_DataView4_TEST_2700
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 1234.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test028
     * @tc.number SUB_BUILTINS_DataView4_TEST_2800
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(15);
      const offset = 7;
      const testVal = 5678.0;
      const view = new DataView(buffer);
      view.setFloat32(offset, testVal, true);
      const result = view.getFloat32(offset, true);
      const test: Offset7LittleEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView4Test029
     * @tc.number SUB_BUILTINS_DataView4_TEST_2900
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 999.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result - 456.0).assertEqual(543.0);
    });

    /**
     * @tc.name   DataView4Test030
     * @tc.number SUB_BUILTINS_DataView4_TEST_3000
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(13);
      const view = new DataView(buffer);
      const offset = 9;
      const testVal = 4321.0;
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      expect(result).assertEqual(testVal);
    });
    /**
     * @tc.name   DataView4Test031
     * @tc.number SUB_BUILTINS_DataView4_TEST_3100
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const testVal = 789.0;
      const view = new DataView(buffer);
      view.setFloat32(0, testVal);
      const littleResult = view.getFloat32(0, true);
      const test: EndianNonIntTest = { view, testVal, littleResult };
      expect(Number.isInteger(test.littleResult)).assertEqual(false);
    });

    /**
     * @tc.name   DataView4Test032
     * @tc.number SUB_BUILTINS_DataView4_TEST_3200
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const zero = 0.0;
      view.setFloat32(0, zero);
      const result = view.getFloat32(0);
      expect(typeof result === "number").assertEqual(true);
    });

    /**
     * @tc.name   DataView4Test033
     * @tc.number SUB_BUILTINS_DataView4_TEST_3300
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const offset = 3;
      const testVal = 8765.0;
      const view1 = new DataView(buffer, 0, 10);
      const view2 = new DataView(buffer, 2, 10);
      view1.setFloat32(offset, testVal);
      const result = view2.getFloat32(offset);
      expect(result.toString()).assertEqual("-4.056481920730334e+31");
    });

    /**
     * @tc.name   DataView4Test034
     * @tc.number SUB_BUILTINS_DataView4_TEST_3400
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer);
      const offset = 6;
      const testVal = 3456.0;
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test035
     * @tc.number SUB_BUILTINS_DataView4_TEST_3500
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 2345.0;
      view.setFloat32(0, testVal, true);
      const result = view.getFloat32(0, true);
      expect(result.toString()).assertEqual(testVal.toString());
    });

    /**
     * @tc.name   DataView4Test036
     * @tc.number SUB_BUILTINS_DataView4_TEST_3600
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 2.5e38;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(Math.abs(result - testVal) < 1e36).assertEqual(true);
    });

    /**
     * @tc.name   DataView4Test037
     * @tc.number SUB_BUILTINS_DataView4_TEST_3700
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const offset = 8;
      const testVal = 9876.0;
      const view = new DataView(buffer);
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      const test: Offset8BigEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView4Test038
     * @tc.number SUB_BUILTINS_DataView4_TEST_3800
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 3.0e38;
      view.setFloat32(0, testVal, true);
      const result = view.getFloat32(0, true);
      expect(Math.abs(result - testVal) < 1e36).assertEqual(true);
    });

    /**
     * @tc.name   DataView4Test039
     * @tc.number SUB_BUILTINS_DataView4_TEST_3900
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(9);
      const view = new DataView(buffer);
      const offset = 5;
      const testVal = 5432.0;
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test040
     * @tc.number SUB_BUILTINS_DataView4_TEST_4000
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const testVal = 123.0;
      const multiplier = 5.0;
      const product = 615.0;
      const view = new DataView(buffer);
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      const test: BigEndianMulTest = {
        view,
        testVal,
        multiplier,
        product
      };
      expect(result * test.multiplier).assertEqual(test.product);
    });

    /**
     * @tc.name   DataView4Test041
     * @tc.number SUB_BUILTINS_DataView4_TEST_4100
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 888.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result / 4.0).assertEqual(222.0);
    });

    /**
     * @tc.name   DataView4Test042
     * @tc.number SUB_BUILTINS_DataView4_TEST_4200
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const offset1 = 0;
      const offset2 = 8;
      const val1 = 1111.0;
      const val2 = 2222.0;
      const view = new DataView(buffer);
      view.setFloat32(offset1, val1);
      view.setFloat32(offset2, val2);
      const result1 = view.getFloat32(offset1);
      const result2 = view.getFloat32(offset2);
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
     * @tc.name   DataView4Test043
     * @tc.number SUB_BUILTINS_DataView4_TEST_4300
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer, 0, 4);
      const testVal = -1234.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test044
     * @tc.number SUB_BUILTINS_DataView4_TEST_4400
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 789.0;
      view.setFloat32(0, testVal, true);
      const result = view.getFloat32(0, true);
      expect(result % 10.0).assertEqual(9.0);
    });

    /**
     * @tc.name   DataView4Test045
     * @tc.number SUB_BUILTINS_DataView4_TEST_4500
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 255.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(Math.floor(result).toString(16)).assertEqual("ff");
    });

    /**
     * @tc.name   DataView4Test046
     * @tc.number SUB_BUILTINS_DataView4_TEST_4600
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(14);
      const offset = 4;
      const testVal = 3456.0;
      const view = new DataView(buffer);
      view.setFloat32(offset, testVal, true);
      const result = view.getFloat32(offset, true);
      const test: Offset4LittleEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView4Test047
     * @tc.number SUB_BUILTINS_DataView4_TEST_4700
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = -5678.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result < 0).assertEqual(true);
    });

    /**
     * @tc.name   DataView4Test048
     * @tc.number SUB_BUILTINS_DataView4_TEST_4800
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = -9012.0;
      view.setFloat32(0, testVal, true);
      const bigResult = view.getFloat32(0);
      expect(bigResult < 0).assertEqual(false);
    });

    /**
     * @tc.name   DataView4Test049
     * @tc.number SUB_BUILTINS_DataView4_TEST_4900
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(11);
      const view = new DataView(buffer);
      const offset = 7;
      const testVal = 6789.0;
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test050
     * @tc.number SUB_BUILTINS_DataView4_TEST_5000
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const testVal1 = 100.0;
      const testVal2 = 20.0;
      const comboResult = (testVal1 + testVal2) * 3.0;
      const view = new DataView(buffer);
      view.setFloat32(0, testVal1);
      const result1 = view.getFloat32(0);
      view.setFloat32(0, testVal2);
      const result2 = view.getFloat32(0);
      const test: BigEndianOpComboTest = {
        view,
        testVal1,
        testVal2,
        comboResult
      };
      expect((result1 + result2) * 3.0).assertEqual(test.comboResult);
    });

    /**
     * @tc.name   DataView4Test051
     * @tc.number SUB_BUILTINS_DataView4_TEST_5100
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 16.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(Math.floor(result) << 1).assertEqual(32);
    });

    /**
     * @tc.name   DataView4Test052
     * @tc.number SUB_BUILTINS_DataView4_TEST_5200
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(4);
      const buffer2 = new ArrayBuffer(4);
      const val1 = 4321.0;
      const val2 = 8765.0;
      const view1 = new DataView(buffer1);
      const view2 = new DataView(buffer2);
      view1.setFloat32(0, val1);
      view2.setFloat32(0, val2);
      const result1 = view1.getFloat32(0);
      const result2 = view2.getFloat32(0);
      const test: MultiBufferReadTest = {
        view1,
        view2,
        val1,
        val2
      };
      expect(result1).assertEqual(test.val1);
      expect(result2).assertEqual(test.val2);
    });

    /**
     * @tc.name   DataView4Test053
     * @tc.number SUB_BUILTINS_DataView4_TEST_5300
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer, 0, 16);
      const offset = 8;
      const testVal = 56789.0;
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test054
     * @tc.number SUB_BUILTINS_DataView4_TEST_5400
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 32.0;
      view.setFloat32(0, testVal, true);
      const result = view.getFloat32(0, true);
      expect(Math.floor(result) >> 1).assertEqual(16);
    });

    /**
     * @tc.name   DataView4Test055
     * @tc.number SUB_BUILTINS_DataView4_TEST_5500
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 12345.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test056
     * @tc.number SUB_BUILTINS_DataView4_TEST_5600
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(14);
      const offset = 6;
      const testVal = 54321.0;
      const view = new DataView(buffer);
      view.setFloat32(offset, testVal, true);
      const result = view.getFloat32(offset, true);
      const test: Offset6LittleEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView4Test057
     * @tc.number SUB_BUILTINS_DataView4_TEST_5700
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 6789.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result + 3211.0).assertEqual(10000.0);
    });

    /**
     * @tc.name   DataView4Test058
     * @tc.number SUB_BUILTINS_DataView4_TEST_5800
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(17);
      const view = new DataView(buffer);
      const offset = 13;
      const testVal = 98765.0;
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test059
     * @tc.number SUB_BUILTINS_DataView4_TEST_5900
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const testVal = 4567.0;
      const view = new DataView(buffer);
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      const test: BigEndianConsistencyTest = { view, testVal, result };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView4Test060
     * @tc.number SUB_BUILTINS_DataView4_TEST_6000
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 1234.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result >= 0).assertEqual(true);
    });
    /**
     * @tc.name   DataView4Test061
     * @tc.number SUB_BUILTINS_DataView4_TEST_6100
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(20);
      const offset = 5;
      const testVal = 76543.0;
      const view1 = new DataView(buffer, 0, 15);
      const view2 = new DataView(buffer, 3, 17);
      const view3 = new DataView(buffer, 5, 15);
      view1.setFloat32(offset, testVal);
      const result = view3.getFloat32(offset);
      expect(result.toString()).assertEqual("0");
    });

    /**
     * @tc.name   DataView4Test062
     * @tc.number SUB_BUILTINS_DataView4_TEST_6200
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const view = new DataView(buffer);
      const offset = 8;
      const testVal = 34567.0;
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test063
     * @tc.number SUB_BUILTINS_DataView4_TEST_6300
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 12345.0;
      view.setFloat32(0, testVal, true);
      const result = view.getFloat32(0, true);
      expect(result.toLocaleString()).assertEqual("12,345");
    });

    /**
     * @tc.name   DataView4Test064
     * @tc.number SUB_BUILTINS_DataView4_TEST_6400
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 123456.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test065
     * @tc.number SUB_BUILTINS_DataView4_TEST_6500
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(20);
      const offset = 10;
      const testVal = 654321.0;
      const view = new DataView(buffer);
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      const test: Offset10BigEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView4Test066
     * @tc.number SUB_BUILTINS_DataView4_TEST_6600
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 98765.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(Number.isInteger(result)).assertEqual(true);
    });

    /**
     * @tc.name   DataView4Test067
     * @tc.number SUB_BUILTINS_DataView4_TEST_6700
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 234567.0;
      view.setFloat32(0, testVal, true);
      const result = view.getFloat32(0, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test068
     * @tc.number SUB_BUILTINS_DataView4_TEST_6800
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(14);
      const view = new DataView(buffer);
      const offset = 10;
      const testVal = 456789.0;
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test069
     * @tc.number SUB_BUILTINS_DataView4_TEST_6900
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const testVal = 1234.0;
      const multiplier = 10.0;
      const product = 12340.0;
      const view = new DataView(buffer);
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      const test: BigEndianMidMulTest = {
        view,
        testVal,
        multiplier,
        product
      };
      expect(result * test.multiplier).assertEqual(test.product);
    });

    /**
     * @tc.name   DataView4Test070
     * @tc.number SUB_BUILTINS_DataView4_TEST_7000
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 98760.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result / 10.0).assertEqual(9876.0);
    });

    /**
     * @tc.name   DataView4Test071
     * @tc.number SUB_BUILTINS_DataView4_TEST_7100
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const offset = 3;
      const testVal = 345678.0;
      const view1 = new DataView(buffer);
      const view2 = new DataView(buffer);
      view1.setFloat32(offset, testVal);
      const result = view2.getFloat32(offset);
      const test: SharedMultiViewTest = {
        view1,
        view2,
        buffer,
        offset,
        testVal
      };
      expect(result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView4Test072
     * @tc.number SUB_BUILTINS_DataView4_TEST_7200
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 0, 8);
      const offset = 2;
      const testVal = 567890.0;
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test073
     * @tc.number SUB_BUILTINS_DataView4_TEST_7300
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 12345.0;
      view.setFloat32(0, testVal, true);
      const result = view.getFloat32(0, true);
      expect(result % 100.0).assertEqual(45.0);
    });

    /**
     * @tc.name   DataView4Test074
     * @tc.number SUB_BUILTINS_DataView4_TEST_7400
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 127.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(Math.floor(result).toString(8)).assertEqual("177");
    });

    /**
     * @tc.name   DataView4Test075
     * @tc.number SUB_BUILTINS_DataView4_TEST_7500
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(15);
      const offset = 5;
      const testVal = 678901.0;
      const view = new DataView(buffer);
      view.setFloat32(offset, testVal, true);
      const result = view.getFloat32(offset, true);
      const test: Offset5LittleEndianMidTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView4Test076
     * @tc.number SUB_BUILTINS_DataView4_TEST_7600
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = -234567.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result < 0 && Number.isInteger(result)).assertEqual(true);
    });

    /**
     * @tc.name   DataView4Test077
     * @tc.number SUB_BUILTINS_DataView4_TEST_7700
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = -345678.0;
      view.setFloat32(0, testVal, true);
      const result = view.getFloat32(0, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test078
     * @tc.number SUB_BUILTINS_DataView4_TEST_7800
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(15);
      const view = new DataView(buffer);
      const offset = 11;
      const testVal = 789012.0;
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test079
     * @tc.number SUB_BUILTINS_DataView4_TEST_7900
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const testVal1 = 500.0;
      const testVal2 = 120.0;
      const comboResult = (testVal1 - testVal2) * 2.0;
      const view = new DataView(buffer);
      view.setFloat32(0, testVal1);
      const result1 = view.getFloat32(0);
      view.setFloat32(0, testVal2);
      const result2 = view.getFloat32(0);
      const test: BigEndianSubMulTest = {
        view,
        testVal1,
        testVal2,
        comboResult
      };
      expect((result1 - result2) * 2.0).assertEqual(test.comboResult);
    });

    /**
     * @tc.name   DataView4Test080
     * @tc.number SUB_BUILTINS_DataView4_TEST_8000
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = 64.0;
      const testVal2 = 32.0;
      view.setFloat32(0, testVal1);
      const result1 = view.getFloat32(0);
      view.setFloat32(0, testVal2);
      const result2 = view.getFloat32(0);
      expect(Math.floor(result1) ^ Math.floor(result2)).assertEqual(96);
    });

    /**
     * @tc.name   DataView4Test081
     * @tc.number SUB_BUILTINS_DataView4_TEST_8100
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(4);
      const buffer2 = new ArrayBuffer(4);
      const val1 = 111111.0;
      const val2 = 222222.0;
      const view1 = new DataView(buffer1);
      const view2 = new DataView(buffer2);
      view1.setFloat32(0, val1);
      view2.setFloat32(0, val2);
      const result1 = view1.getFloat32(0);
      const result2 = view2.getFloat32(0);
      const test: DualBufferCrossTest = {
        view1,
        view2,
        buffer1,
        buffer2,
        val1,
        val2
      };
      expect(result1 !== result2).assertEqual(true);
      expect(result1).assertEqual(test.val1);
      expect(result2).assertEqual(test.val2);
    });

    /**
     * @tc.name   DataView4Test082
     * @tc.number SUB_BUILTINS_DataView4_TEST_8200
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(20);
      const view = new DataView(buffer, 0, 20);
      const offset = 12;
      const testVal = 999999.0;
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test083
     * @tc.number SUB_BUILTINS_DataView4_TEST_8300
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = 255.0;
      const testVal2 = 127.0;
      view.setFloat32(0, testVal1, true);
      const result1 = view.getFloat32(0, true);
      view.setFloat32(0, testVal2, true);
      const result2 = view.getFloat32(0, true);
      expect(Math.floor(result1) & Math.floor(result2)).assertEqual(127);
    });

    /**
     * @tc.name   DataView4Test084
     * @tc.number SUB_BUILTINS_DataView4_TEST_8400
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 1234567.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test085
     * @tc.number SUB_BUILTINS_DataView4_TEST_8500
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const offset = 8;
      const testVal = 7654321.0;
      const view = new DataView(buffer);
      view.setFloat32(offset, testVal, true);
      const result = view.getFloat32(offset, true);
      const test: Offset8LittleEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView4Test086
     * @tc.number SUB_BUILTINS_DataView4_TEST_8600
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 567890.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result + 432110.0).assertEqual(1000000.0);
    });

    /**
     * @tc.name   DataView4Test087
     * @tc.number SUB_BUILTINS_DataView4_TEST_8700
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(19);
      const view = new DataView(buffer);
      const offset = 15;
      const testVal = 876543.0;
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test088
     * @tc.number SUB_BUILTINS_DataView4_TEST_8800
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const testVal = 345678.0;
      const view = new DataView(buffer);
      view.setFloat32(0, testVal, true);
      const result = view.getFloat32(0, true);
      const test: LittleEndianConsistencyTest = { view, testVal, result };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView4Test089
     * @tc.number SUB_BUILTINS_DataView4_TEST_8900
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 98765.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result > 0).assertEqual(true);
    });

    /**
     * @tc.name   DataView4Test090
     * @tc.number SUB_BUILTINS_DataView4_TEST_9000
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const offset = 4;
      const val1 = 111111.0;
      const val2 = 222222.0;
      const finalVal = val2;
      const view1 = new DataView(buffer, 0, 12);
      const view2 = new DataView(buffer, 2, 14);
      view1.setFloat32(offset, val1);
      view2.setFloat32(offset, val2);
      const result = view1.getFloat32(offset);
      expect(result.toString()).assertEqual("111248.6953125");
    });
    /**
     * @tc.name   DataView4Test091
     * @tc.number SUB_BUILTINS_DataView4_TEST_9100
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(14);
      const view = new DataView(buffer);
      const offset = 10;
      const testVal = 456789.0;
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test092
     * @tc.number SUB_BUILTINS_DataView4_TEST_9200
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 1234567.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result.toExponential(0)).assertEqual("1e+6");
    });

    /**
     * @tc.name   DataView4Test093
     * @tc.number SUB_BUILTINS_DataView4_TEST_9300
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 999999.0;
      view.setFloat32(0, testVal, true);
      const result = view.getFloat32(0, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test094
     * @tc.number SUB_BUILTINS_DataView4_TEST_9400
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(20);
      const offset = 12;
      const testVal = 8765432.0;
      const view = new DataView(buffer);
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      const test: Offset12BigEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView4Test095
     * @tc.number SUB_BUILTINS_DataView4_TEST_9500
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 12345.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result !== 0).assertEqual(true);
    });

    /**
     * @tc.name   DataView4Test096
     * @tc.number SUB_BUILTINS_DataView4_TEST_9600
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = -7654321.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test097
     * @tc.number SUB_BUILTINS_DataView4_TEST_9700
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(13);
      const view = new DataView(buffer);
      const offset = 9;
      const testVal = 321654.0;
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test098
     * @tc.number SUB_BUILTINS_DataView4_TEST_9800
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const testVal = 123456.0;
      const multiplier = 8.0;
      const product = 987648.0;
      const view = new DataView(buffer);
      view.setFloat32(0, testVal, true);
      const result = view.getFloat32(0, true);
      const test: LittleEndianLargeMulTest = {
        view,
        testVal,
        multiplier,
        product
      };
      expect(result * test.multiplier).assertEqual(test.product);
    });

    /**
     * @tc.name   DataView4Test099
     * @tc.number SUB_BUILTINS_DataView4_TEST_9900
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 876540.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result / 10.0).assertEqual(87654.0);
    });

    /**
     * @tc.name   DataView4Test100
     * @tc.number SUB_BUILTINS_DataView4_TEST_10000
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(20);
      const offset1 = 0;
      const offset2 = 10;
      const val1 = 333333.0;
      const val2 = 444444.0;
      const view = new DataView(buffer);
      view.setFloat32(offset1, val1);
      view.setFloat32(offset2, val2);
      const result1 = view.getFloat32(offset1);
      const result2 = view.getFloat32(offset2);
      const test: SharedMultiOffsetWriteTest = {
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
     * @tc.name   DataView4Test101
     * @tc.number SUB_BUILTINS_DataView4_TEST_10100
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const view = new DataView(buffer, 0, 12);
      const offset = 3;
      const testVal = 5678901.0;
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test102
     * @tc.number SUB_BUILTINS_DataView4_TEST_10200
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 1234567.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result % 1000.0).assertEqual(567.0);
    });

    /**
     * @tc.name   DataView4Test103
     * @tc.number SUB_BUILTINS_DataView4_TEST_10300
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 987654.0;
      view.setFloat32(0, testVal, true);
      const result = view.getFloat32(0, true);
      expect(result.toLocaleString('en-US')).assertEqual("987,654");
    });

    /**
     * @tc.name   DataView4Test104
     * @tc.number SUB_BUILTINS_DataView4_TEST_10400
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(17);
      const offset = 7;
      const testVal = 6543210.0;
      const view = new DataView(buffer);
      view.setFloat32(offset, testVal, true);
      const result = view.getFloat32(offset, true);
      const test: Offset7LittleEndianLargeTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView4Test105
     * @tc.number SUB_BUILTINS_DataView4_TEST_10500
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = -8765432.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result < 0 && result !== 0).assertEqual(true);
    });

    /**
     * @tc.name   DataView4Test106
     * @tc.number SUB_BUILTINS_DataView4_TEST_10600
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = -5432109.0;
      view.setFloat32(0, testVal, true);
      const bigResult = view.getFloat32(0);
      expect(bigResult < 0).assertEqual(false);
    });

    /**
     * @tc.name   DataView4Test107
     * @tc.number SUB_BUILTINS_DataView4_TEST_10700
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      const offset = 12;
      const testVal = 2109876.0;
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test108
     * @tc.number SUB_BUILTINS_DataView4_TEST_10800
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const testVal1 = 1000.0;
      const testVal2 = 25.0;
      const comboResult = (testVal1 * testVal2) / 5.0;
      const view = new DataView(buffer);
      view.setFloat32(0, testVal1);
      const result1 = view.getFloat32(0);
      view.setFloat32(0, testVal2);
      const result2 = view.getFloat32(0);
      const test: BigEndianMulDivTest = {
        view,
        testVal1,
        testVal2,
        comboResult
      };
      expect((result1 * result2) / 5.0).assertEqual(test.comboResult);
    });

    /**
     * @tc.name   DataView4Test109
     * @tc.number SUB_BUILTINS_DataView4_TEST_10900
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = 16.0;
      const testVal2 = 8.0;
      view.setFloat32(0, testVal1);
      const result1 = view.getFloat32(0);
      view.setFloat32(0, testVal2);
      const result2 = view.getFloat32(0);
      expect(Math.floor(result1) | Math.floor(result2)).assertEqual(24);
    });

    /**
     * @tc.name   DataView4Test110
     * @tc.number SUB_BUILTINS_DataView4_TEST_11000
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(4);
      const buffer2 = new ArrayBuffer(4);
      const buffer3 = new ArrayBuffer(4);
      const val1 = 123.0;
      const val2 = 456.0;
      const val3 = 789.0;
      const view1 = new DataView(buffer1);
      const view2 = new DataView(buffer2);
      const view3 = new DataView(buffer3);
      view1.setFloat32(0, val1);
      view2.setFloat32(0, val2);
      view3.setFloat32(0, val3);
      const result1 = view1.getFloat32(0);
      const result2 = view2.getFloat32(0);
      const result3 = view3.getFloat32(0);
      const test: TripleBufferTest = {
        view1,
        view2,
        view3,
        val1,
        val2,
        val3
      };
      expect(result1).assertEqual(test.val1);
      expect(result2).assertEqual(test.val2);
      expect(result3).assertEqual(test.val3);
    });

    /**
     * @tc.name   DataView4Test111
     * @tc.number SUB_BUILTINS_DataView4_TEST_11100
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(24);
      const view = new DataView(buffer, 0, 24);
      const offset = 16;
      const testVal = 9999999.0;
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test112
     * @tc.number SUB_BUILTINS_DataView4_TEST_11200
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 127.0;
      view.setFloat32(0, testVal, true);
      const result = view.getFloat32(0, true);
      expect(~Math.floor(result) & 0xff).assertEqual(128);
    });

    /**
     * @tc.name   DataView4Test113
     * @tc.number SUB_BUILTINS_DataView4_TEST_11300
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 12345678.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test114
     * @tc.number SUB_BUILTINS_DataView4_TEST_11400
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(18);
      const offset = 9;
      const testVal = 87654321.0;
      const view = new DataView(buffer);
      view.setFloat32(offset, testVal, true);
      const result = view.getFloat32(offset, true);
      const test: Offset9LittleEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result.toString()).assertEqual("87654320");
    });

    /**
     * @tc.name   DataView4Test115
     * @tc.number SUB_BUILTINS_DataView4_TEST_11500
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 4567890.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result + 5432110.0).assertEqual(10000000.0);
    });

    /**
     * @tc.name   DataView4Test116
     * @tc.number SUB_BUILTINS_DataView4_TEST_11600
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(21);
      const view = new DataView(buffer);
      const offset = 17;
      const testVal = 9876543.0;
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test117
     * @tc.number SUB_BUILTINS_DataView4_TEST_11700
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const testVal = 56789012.0;
      const view = new DataView(buffer);
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      const test: BigEndianMillionTest = { view, testVal, result };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView4Test118
     * @tc.number SUB_BUILTINS_DataView4_TEST_11800
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 1.2e38;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result < 3.4e38).assertEqual(true);
    });

    /**
     * @tc.name   DataView4Test119
     * @tc.number SUB_BUILTINS_DataView4_TEST_11900
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(20);
      const offset = 6;
      const val1 = 2222222.0;
      const val2 = 3333333.0;
      const finalVal = val2;
      const view1 = new DataView(buffer, 0, 14);
      const view2 = new DataView(buffer, 3, 17);
      const view3 = new DataView(buffer, 6, 14);
      view1.setFloat32(offset, val1);
      view2.setFloat32(offset, val2);
      const result = view3.getFloat32(offset);
      expect(result.toString()).assertEqual("2199023255552");
    });

    /**
     * @tc.name   DataView4Test120
     * @tc.number SUB_BUILTINS_DataView4_TEST_12000
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      const offset = 12;
      const testVal = 6543210.0;
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      expect(result).assertEqual(testVal);
    });
    /**
     * @tc.name   DataView4Test121
     * @tc.number SUB_BUILTINS_DataView4_TEST_12100
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 12345678.0;
      view.setFloat32(0, testVal, true);
      const result = view.getFloat32(0, true);
      expect(result.toExponential(3)).assertEqual("1.235e+7");
    });

    /**
     * @tc.name   DataView4Test122
     * @tc.number SUB_BUILTINS_DataView4_TEST_12200
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = -9876543.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test123
     * @tc.number SUB_BUILTINS_DataView4_TEST_12300
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(24);
      const offset = 14;
      const testVal = 76543210.0;
      const view = new DataView(buffer);
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      const test: Offset14BigEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result.toString()).assertEqual("76543208");
    });

    /**
     * @tc.name   DataView4Test124
     * @tc.number SUB_BUILTINS_DataView4_TEST_12400
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = -1234567.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(Number.isInteger(result)).assertEqual(true);
    });

    /**
     * @tc.name   DataView4Test125
     * @tc.number SUB_BUILTINS_DataView4_TEST_12500
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = -8765432.0;
      view.setFloat32(0, testVal, true);
      const result = view.getFloat32(0, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test126
     * @tc.number SUB_BUILTINS_DataView4_TEST_12600
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(15);
      const view = new DataView(buffer);
      const offset = 11;
      const testVal = 4321098.0;
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test127
     * @tc.number SUB_BUILTINS_DataView4_TEST_12700
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const testVal = 123456.0;
      const multiplier = 100.0;
      const product = 12345600.0;
      const view = new DataView(buffer);
      view.setFloat32(0, testVal, true);
      const result = view.getFloat32(0, true);
      const test: LittleEndianMillionMulTest = {
        view,
        testVal,
        multiplier,
        product
      };
      expect(result * test.multiplier).assertEqual(test.product);
    });

    /**
     * @tc.name   DataView4Test128
     * @tc.number SUB_BUILTINS_DataView4_TEST_12800
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 98765400.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result / 100.0).assertEqual(987654.0);
    });

    /**
     * @tc.name   DataView4Test129
     * @tc.number SUB_BUILTINS_DataView4_TEST_12900
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = -12345678.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(!isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   DataView4Test130
     * @tc.number SUB_BUILTINS_DataView4_TEST_13000
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(14);
      const view = new DataView(buffer, 0, 14);
      const offset = 4;
      const testVal = 6789012.0;
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test131
     * @tc.number SUB_BUILTINS_DataView4_TEST_13100
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 12345678.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result % 10000.0).assertEqual(45678.0 % 10000.0);
    });

    /**
     * @tc.name   DataView4Test132
     * @tc.number SUB_BUILTINS_DataView4_TEST_13200
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 8765432.0;
      view.setFloat32(0, testVal, true);
      const result = view.getFloat32(0, true);
      expect(result.toLocaleString('de-DE')).assertEqual("8.765.432");
    });

    /**
     * @tc.name   DataView4Test133
     * @tc.number SUB_BUILTINS_DataView4_TEST_13300
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const offset = 6;
      const testVal = 98765432.0;
      const view = new DataView(buffer);
      view.setFloat32(offset, testVal, true);
      const result = view.getFloat32(offset, true);
      const test: Offset6LittleEndianMillionTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView4Test134
     * @tc.number SUB_BUILTINS_DataView4_TEST_13400
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = -3456789.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result < 0 && !isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   DataView4Test135
     * @tc.number SUB_BUILTINS_DataView4_TEST_13500
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = -5678901.0;
      view.setFloat32(0, testVal);
      const littleResult = view.getFloat32(0, true);
      expect(littleResult < 0).assertEqual(false);
    });

    /**
     * @tc.name   DataView4Test136
     * @tc.number SUB_BUILTINS_DataView4_TEST_13600
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(18);
      const view = new DataView(buffer);
      const offset = 14;
      const testVal = 3210987.0;
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView4Test137
     * @tc.number SUB_BUILTINS_DataView4_TEST_13700
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const testVal1 = 500000.0;
      const testVal2 = 200000.0;
      const comboResult = (testVal1 + testVal2) - 100000.0;
      const view = new DataView(buffer);
      view.setFloat32(0, testVal1, true);
      const result1 = view.getFloat32(0, true);
      view.setFloat32(0, testVal2, true);
      const result2 = view.getFloat32(0, true);
      const test: LittleEndianAddSubTest = {
        view,
        testVal1,
        testVal2,
        comboResult
      };
      expect((result1 + result2) - 100000.0).assertEqual(test.comboResult);
    });

    /**
     * @tc.name   DataView4Test138
     * @tc.number SUB_BUILTINS_DataView4_TEST_13800
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = 32.0;
      const testVal2 = 64.0;
      view.setFloat32(0, testVal1);
      const result1 = view.getFloat32(0);
      view.setFloat32(0, testVal2);
      const result2 = view.getFloat32(0);
      expect((Math.floor(result1) << 2) & Math.floor(result2)).assertEqual(0);
    });

    /**
     * @tc.name   DataView4Test139
     * @tc.number SUB_BUILTINS_DataView4_TEST_13900
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(28);
      const view = new DataView(buffer, 0, 28);
      const offset = 20;
      const testVal = 99999999.0;
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      expect(result.toString()).assertEqual("100000000");
    });

    /**
     * @tc.name   DataView4Test140
     * @tc.number SUB_BUILTINS_DataView4_TEST_14000
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = 128.0;
      const testVal2 = 32.0;
      view.setFloat32(0, testVal1);
      const result1 = view.getFloat32(0);
      view.setFloat32(0, testVal2);
      const result2 = view.getFloat32(0);
      expect((Math.floor(result1) >> 2) | Math.floor(result2)).assertEqual(32);
    });

    /**
     * @tc.name   DataView4Test141
     * @tc.number SUB_BUILTINS_DataView4_TEST_14100
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 0.75;
      view.setFloat32(0, testVal, true);
      const result = view.getFloat32(0, true);
      expect(Math.floor(result * 100).toString() + "%").assertEqual("75%");
    });

    /**
     * @tc.name   DataView4Test142
     * @tc.number SUB_BUILTINS_DataView4_TEST_14200
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 123456789.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result.toString()).assertEqual("123456792");
    });

    /**
     * @tc.name   DataView4Test143
     * @tc.number SUB_BUILTINS_DataView4_TEST_14300
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(20);
      const offset = 10;
      const testVal = 987654321.0;
      const view = new DataView(buffer);
      view.setFloat32(offset, testVal, true);
      const result = view.getFloat32(offset, true);
      const test: Offset10LittleEndianMillionTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result.toString()).assertEqual("987654336");
    });

    /**
     * @tc.name   DataView4Test144
     * @tc.number SUB_BUILTINS_DataView4_TEST_14400
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 45678901.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect((result + 54321099.0).toString()).assertEqual('99999999');
    });

    /**
     * @tc.name   DataView4Test145
     * @tc.number SUB_BUILTINS_DataView4_TEST_14500
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(23);
      const view = new DataView(buffer);
      const offset = 19;
      const testVal = 87654321.0;
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      expect(result.toString()).assertEqual("87654320");
    });

    /**
     * @tc.name   DataView4Test146
     * @tc.number SUB_BUILTINS_DataView4_TEST_14600
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const testVal = 567890123.0;
      const view = new DataView(buffer);
      view.setFloat32(0, testVal, true);
      const result = view.getFloat32(0, true);
      const test: LittleEndianTenMillionTest = { view, testVal, result };
      expect(test.result.toString()).assertEqual("567890112");
    });

    /**
     * @tc.name   DataView4Test147
     * @tc.number SUB_BUILTINS_DataView4_TEST_14700
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = -1.2e38;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result > -3.4e38).assertEqual(true);
    });

    /**
     * @tc.name   DataView4Test148
     * @tc.number SUB_BUILTINS_DataView4_TEST_14800
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(17);
      const view = new DataView(buffer);
      const offset = 13;
      const testVal = 76543210.0;
      view.setFloat32(offset, testVal);
      const result = view.getFloat32(offset);
      expect(result.toString()).assertEqual("76543208");
    });

    /**
     * @tc.name   DataView4Test149
     * @tc.number SUB_BUILTINS_DataView4_TEST_14900
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 123456789.0;
      view.setFloat32(0, testVal);
      const result = view.getFloat32(0);
      expect(result.toExponential(4)).assertEqual("1.2346e+8");
    });

    /**
     * @tc.name   DataView4Test150
     * @tc.number SUB_BUILTINS_DataView4_TEST_15000
     * @tc.desc   test DataView getFloat32()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView4Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = -98765432.0;
      view.setFloat32(0, testVal, true);
      const result = view.getFloat32(0, true);
      expect(result).assertEqual(testVal);
    });

  })
}

