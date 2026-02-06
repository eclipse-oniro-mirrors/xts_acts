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
  testVal: bigint;
  result: bigint;
}

interface OffsetLittleEndianTest {
  view: DataView;
  offset: number;
  testVal: bigint;
  result: bigint;
}


interface MultiViewGetTest {
  view1: DataView;
  view2: DataView;
  testVal: bigint;
}

interface Offset12ViewTest {
  view: DataView;
  offset: number;
  testVal: bigint;
  result: bigint;
}

interface OffsetBigEndianTest {
  view: DataView;
  offset: number;
  testVal: bigint;
  result: bigint;
}

interface LittleEndianNegativeTest {
  view: DataView;
  offset: number;
  testVal: bigint;
  result: bigint;
}

interface BigEndianConsistencyTest {
  view: DataView;
  testVal: bigint;
  result: bigint;
}

interface CrossViewReadTest {
  view1: DataView;
  view2: DataView;
  offset1: number;
  offset2: number;
  testVal: bigint;
}

interface Offset5LittleEndianTest {
  view: DataView;
  offset: number;
  testVal: bigint;
  result: bigint;
}

interface Offset3BigEndianTest {
  view: DataView;
  offset: number;
  testVal: bigint;
  result: bigint;
}

interface BigEndianDivisionTest {
  view: DataView;
  testVal: bigint;
  divisor: bigint;
  quotient: bigint;
}

interface SeparateBufferReadTest {
  view1: DataView;
  view2: DataView;
  val1: bigint;
  val2: bigint;
}

interface Offset6LittleEndianTest {
  view: DataView;
  offset: number;
  testVal: bigint;
  result: bigint;
}

interface BigToLittleNegativeTest {
  view: DataView;
  testVal: bigint;
  bigEndianResult: bigint;
  littleEndianResult: bigint;
}

interface NestedViewReadTest {
  view1: DataView;
  view2: DataView;
  offset: number;
  testVal: bigint;
}

interface Offset7LittleEndianTest {
  view: DataView;
  offset: number;
  testVal: bigint;
  result: bigint;
}


interface Offset4BigEndianTest {
  view: DataView;
  offset: number;
  testVal: bigint;
  result: bigint;
}

interface BigEndianXorTest {
  view: DataView;
  testVal1: bigint;
  testVal2: bigint;
  xorResult: bigint;
}

interface CrossBufferTest {
  view1: DataView;
  view2: DataView;
  val1: bigint;
  val2: bigint;
}

interface Offset8LittleEndianTest {
  view: DataView;
  offset: number;
  testVal: bigint;
  result: bigint;
}

interface OverlapViewTest {
  view1: DataView;
  view2: DataView;
  offset1: number;
  offset2: number;
  val1: bigint;
  val2: bigint;
}

interface Offset6BigEndianTest {
  view: DataView;
  offset: number;
  testVal: bigint;
  result: bigint;
}

interface BigEndianFullXorTest {
  view: DataView;
  testVal: bigint;
  fullOne: bigint;
  xorResult: bigint;
}


interface Offset3LittleEndianNegTest {
  view: DataView;
  offset: number;
  testVal: bigint;
  result: bigint;
}

interface BigEndianOrTest {
  view: DataView;
  testVal1: bigint;
  testVal2: bigint;
  orResult: bigint;
}

interface MultiBufferTest {
  view1: DataView;
  view2: DataView;
  val1: bigint;
  val2: bigint;
}

interface Offset5LittleEndianPosTest {
  view: DataView;
  offset: number;
  testVal: bigint;
  result: bigint;
}

interface BigEndianLargeSubTest {
  view: DataView;
  testVal: bigint;
  subtrahend: bigint;
  difference: bigint;
}


interface Offset6BigEndianPosTest {
  view: DataView;
  offset: number;
  testVal: bigint;
  result: bigint;
}

interface MultiBufferOpTest {
  view1: DataView;
  view2: DataView;
  val1: bigint;
  val2: bigint;
  opResult: bigint;
}

interface LittleEndianBitComboTest {
  view: DataView;
  testVal1: bigint;
  testVal2: bigint;
  comboResult: bigint;
}

interface Offset12LittleEndianTest {
  view: DataView;
  offset: number;
  testVal: bigint;
  result: bigint;
}

interface OneEndianConsistencyTest {
  view: DataView;
  one: bigint;
  bigResult: bigint;
  littleResult: bigint;
}

interface OverlapWriteReadTest {
  view1: DataView;
  view2: DataView;
  offset: number;
  val1: bigint;
  val2: bigint;
  finalVal: bigint;
}

interface Offset6LittleEndianNegTest {
  view: DataView;
  offset: number;
  testVal: bigint;
  result: bigint;
}

interface BigEndianBoundarySubTest {
  view: DataView;
  testVal: bigint;
  subtrahend: bigint;
  difference: bigint;
}

interface SharedMultiWriteReadTest {
  view1: DataView;
  view2: DataView;
  buffer: ArrayBuffer;
  offset: number;
  testVal: bigint;
}

interface Offset5BigEndianNegTest {
  view: DataView;
  offset: number;
  testVal: bigint;
  result: bigint;
}

interface BigEndianBitAndShiftTest {
  view: DataView;
  testVal1: bigint;
  testVal2: bigint;
  comboResult: bigint;
}

interface MultiBufferIndepTest {
  view1: DataView;
  view2: DataView;
  val1: bigint;
  val2: bigint;
}

interface LittleEndianBitOrShiftTest {
  view: DataView;
  testVal1: bigint;
  testVal2: bigint;
  comboResult: bigint;
}

interface Offset14LittleEndianNegTest {
  view: DataView;
  offset: number;
  testVal: bigint;
  result: bigint;
}

interface Offset7LittleEndianPosTest {
  view: DataView;
  offset: number;
  testVal: bigint;
  result: bigint;
}

export default function DataView2Test() {
  describe('DataView2Test', () => {
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
     * @tc.name   DataView2Test001
     * @tc.number SUB_BUILTINS_DataView2_TEST_0100
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 9223372036854775807n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(result).assertEqual(testVal);
    });
    /**
     * @tc.name   DataView2Test002
     * @tc.number SUB_BUILTINS_DataView2_TEST_0200
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = -9223372036854775808n;
      view.setBigInt64(0, testVal, true);
      const result = view.getBigInt64(0, true);
      expect(result).assertEqual(testVal);
    });
    /**
     * @tc.name   DataView2Test003
     * @tc.number SUB_BUILTINS_DataView2_TEST_0300
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const offset = 2;
      const testVal = 1234567890123456789n;
      const view = new DataView(buffer);
      view.setBigInt64(offset, testVal);
      const result = view.getBigInt64(offset);
      const test: OffsetGetTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView2Test004
     * @tc.number SUB_BUILTINS_DataView2_TEST_0400
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const zero = 0n;
      view.setBigInt64(0, zero);
      const result = view.getBigInt64(0);
      expect(result).assertEqual(zero);
    });

    /**
     * @tc.name   DataView2Test005
     * @tc.number SUB_BUILTINS_DataView2_TEST_0500
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const offset = 3;
      const testVal = -1234567890n;
      const view = new DataView(buffer);
      view.setBigInt64(offset, testVal, true);
      const result = view.getBigInt64(offset, true);
      const test: OffsetLittleEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView2Test006
     * @tc.number SUB_BUILTINS_DataView2_TEST_0600
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(10);
    //   const view = new DataView(buffer);
    //   const offset = 2;
    //   const testVal = 0xABCDEF12345678n;
    //   view.setBigInt64(offset, testVal);
    //   const result = view.getBigInt64(offset);
    //   expect(result).assertEqual(testVal);
    // });

    /**
     * @tc.name   DataView2Test007
     * @tc.number SUB_BUILTINS_DataView2_TEST_0700
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const minVal = -9223372036854775808n;
      view.setBigInt64(0, minVal);
      const result = view.getBigInt64(0);
      expect(result).assertEqual(minVal);
    });

    /**
     * @tc.name   DataView2Test008
     * @tc.number SUB_BUILTINS_DataView2_TEST_0800
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 9223372036854775806n;
      view.setBigInt64(0, testVal, true);
      const result = view.getBigInt64(0, true);
      expect(result + 1n).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.name   DataView2Test009
     * @tc.number SUB_BUILTINS_DataView2_TEST_0900
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      try {
        view.getBigInt64(-1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
        expect(error.message).assertContain("");
      }
    });

    /**
     * @tc.name   DataView2Test010
     * @tc.number SUB_BUILTINS_DataView2_TEST_1000
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer);
      const offset = 3;
      try {
        view.getBigInt64(offset);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
        expect(error.message).assertContain("");
      }
    });

    /**
     * @tc.name   DataView2Test011
     * @tc.number SUB_BUILTINS_DataView2_TEST_1100
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1234567890123456789n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(result.toString()).assertEqual(testVal.toString());
    });

    /**
     * @tc.name   DataView2Test012
     * @tc.number SUB_BUILTINS_DataView2_TEST_1200
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal = 555555555555555555n;
      const view1 = new DataView(buffer);
      const view2 = new DataView(buffer);
      view1.setBigInt64(0, testVal);
      const result = view2.getBigInt64(0);
      const test: MultiViewGetTest = { view1, view2, testVal };
      expect(result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView2Test013
     * @tc.number SUB_BUILTINS_DataView2_TEST_1300
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = -543210987654321n;
      view.setBigInt64(0, testVal, true);
      const result = view.getBigInt64(0, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView2Test014
     * @tc.number SUB_BUILTINS_DataView2_TEST_1400
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer, 0, 8);
    //   const testVal = 0xDEADBEEFCAFEBABEn;
    //   view.setBigInt64(0, testVal);
    //   const result = view.getBigInt64(0);
    //   expect(result.toString()).assertEqual("-2401053089206453570");
    // });

    /**
     * @tc.name   DataView2Test015
     * @tc.number SUB_BUILTINS_DataView2_TEST_1500
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 987654321n;
      view.setBigInt64(0, testVal, true);
      const result = view.getBigInt64(0, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView2Test016
     * @tc.number SUB_BUILTINS_DataView2_TEST_1600
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = -123456n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView2Test017
     * @tc.number SUB_BUILTINS_DataView2_TEST_1700
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(12);
    //   const offset = 4;
    //   const testVal = 0x1234567890ABCn;
    //   const view = new DataView(buffer);
    //   view.setBigInt64(offset, testVal);
    //   const result = view.getBigInt64(offset);
    //   const test: Offset12ViewTest = {
    //     view,
    //     offset,
    //     testVal,
    //     result
    //   };
    //   expect(test.result).assertEqual(test.testVal);
    // });

    /**
     * @tc.name   DataView2Test018
     * @tc.number SUB_BUILTINS_DataView2_TEST_1800
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 100n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(result + 50n).assertEqual(150n);
    });

    /**
     * @tc.name   DataView2Test019
     * @tc.number SUB_BUILTINS_DataView2_TEST_1900
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const testVal = 0xABCDEF123456n;
    //   view.setBigInt64(0, testVal, true);
    //   const result = view.getBigInt64(0, true);
    //   expect(result).assertEqual(testVal);
    // });

    /**
     * @tc.name   DataView2Test020
     * @tc.number SUB_BUILTINS_DataView2_TEST_2000
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const maxVal = 9223372036854775807n;
      view.setBigInt64(0, maxVal);
      const result = view.getBigInt64(0);
      expect(result).assertEqual(maxVal);
    });

    /**
     * @tc.name   DataView2Test021
     * @tc.number SUB_BUILTINS_DataView2_TEST_2100
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(15);
      const offset = 5;
      const testVal = -9876543210987n;
      const view = new DataView(buffer);
      view.setBigInt64(offset, testVal);
      const result = view.getBigInt64(offset);
      const test: OffsetBigEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView2Test022
     * @tc.number SUB_BUILTINS_DataView2_TEST_2200
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 123456789n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(Number(result)).assertEqual(123456789);
    });

    /**
     * @tc.name   DataView2Test023
     * @tc.number SUB_BUILTINS_DataView2_TEST_2300
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer, 0, 8);
    //   const testVal = 0x1122334455667788n;
    //   view.setBigInt64(0, testVal);
    //   const result = view.getBigInt64(0);
    //   expect(result).assertEqual(testVal);
    // });

    /**
     * @tc.name   DataView2Test024
     * @tc.number SUB_BUILTINS_DataView2_TEST_2400
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const minVal = -9223372036854775808n;
      view.setBigInt64(0, minVal, true);
      const result = view.getBigInt64(0, true);
      expect(result).assertEqual(minVal);
    });

    /**
     * @tc.name   DataView2Test025
     * @tc.number SUB_BUILTINS_DataView2_TEST_2500
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 9223372036854775800n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView2Test026
     * @tc.number SUB_BUILTINS_DataView2_TEST_2600
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(14);
      const offset = 4;
      const testVal = -500000000000000n;
      const view = new DataView(buffer);
      view.setBigInt64(offset, testVal, true);
      const result = view.getBigInt64(offset, true);
      const test: LittleEndianNegativeTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView2Test027
     * @tc.number SUB_BUILTINS_DataView2_TEST_2700
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 12345n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(result * 2n).assertEqual(24690n);
    });

    /**
     * @tc.name   DataView2Test028
     * @tc.number SUB_BUILTINS_DataView2_TEST_2800
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(12);
    //   const view = new DataView(buffer);
    //   const offset = 4;
    //   const testVal = 0x76543210FEDCBA98n;
    //   view.setBigInt64(offset, testVal, true);
    //   const result = view.getBigInt64(offset, true);
    //   expect(result).assertEqual(testVal);
    // });

    /**
     * @tc.name   DataView2Test029
     * @tc.number SUB_BUILTINS_DataView2_TEST_2900
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const testVal = 0x1A2B3C4D5E6F7A8Bn;
    //   const view = new DataView(buffer);
    //   view.setBigInt64(0, testVal);
    //   const result = view.getBigInt64(0);
    //   const test: BigEndianConsistencyTest = { view, testVal, result };
    //   expect(test.result).assertEqual(test.testVal);
    // });

    /**
     * @tc.name   DataView2Test030
     * @tc.number SUB_BUILTINS_DataView2_TEST_3000
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const zero = 0n;
      view.setBigInt64(0, zero);
      const result = view.getBigInt64(0);
      expect(result === zero).assertEqual(true);
    });
    /**
     * @tc.name   DataView2Test031
     * @tc.number SUB_BUILTINS_DataView2_TEST_3100
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const offset1 = 2;
      const offset2 = 2;
      const testVal = 999999999999999999n;
      const view1 = new DataView(buffer);
      const view2 = new DataView(buffer);
      view1.setBigInt64(offset1, testVal);
      const result = view2.getBigInt64(offset2);
      const test: CrossViewReadTest = {
        view1,
        view2,
        offset1,
        offset2,
        testVal
      };
      expect(result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView2Test032
     * @tc.number SUB_BUILTINS_DataView2_TEST_3200
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(9);
    //   const view = new DataView(buffer);
    //   const offset = 1;
    //   const testVal = 0x876543210FEDCBA9n;
    //   view.setBigInt64(offset, testVal);
    //   const result = view.getBigInt64(offset);
    //   expect(result.toString()).assertEqual("-8690466096661279831");
    // });

    /**
     * @tc.name   DataView2Test033
     * @tc.number SUB_BUILTINS_DataView2_TEST_3300
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = -9223372036854775800n;
      view.setBigInt64(0, testVal, true);
      const result = view.getBigInt64(0, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView2Test034
     * @tc.number SUB_BUILTINS_DataView2_TEST_3400
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const testVal = 0xDEADBEEFCAFEBABEn;
    //   view.setBigInt64(0, testVal);
    //   const result = view.getBigInt64(0);
    //   expect(result.toString()).assertEqual("-2401053089206453570");
    // });

    /**
     * @tc.name   DataView2Test035
     * @tc.number SUB_BUILTINS_DataView2_TEST_3500
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(15);
      const offset = 5;
      const testVal = 123456789012345n;
      const view = new DataView(buffer);
      view.setBigInt64(offset, testVal, true);
      const result = view.getBigInt64(offset, true);
      const test: Offset5LittleEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView2Test036
     * @tc.number SUB_BUILTINS_DataView2_TEST_3600
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const zero = 0n;
      view.setBigInt64(0, zero, true);
      const result = view.getBigInt64(0, true);
      expect(result).assertEqual(zero);
    });

    /**
     * @tc.name   DataView2Test037
     * @tc.number SUB_BUILTINS_DataView2_TEST_3700
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1000000000000n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(result === 1000000000000n).assertEqual(true);
    });

    /**
     * @tc.name   DataView2Test038
     * @tc.number SUB_BUILTINS_DataView2_TEST_3800
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 123456n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      const base36 = result.toString(36).padStart(8, '0');
      expect(base36.toString()).assertEqual("00002n9c");
    });

    /**
     * @tc.name   DataView2Test039
     * @tc.number SUB_BUILTINS_DataView2_TEST_3900
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 0, 8);
      const maxVal = 9223372036854775807n;
      view.setBigInt64(0, maxVal);
      const result = view.getBigInt64(0);
      expect(result).assertEqual(maxVal);
    });

    /**
     * @tc.name   DataView2Test040
     * @tc.number SUB_BUILTINS_DataView2_TEST_4000
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = -500n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(result - 100n).assertEqual(-600n);
    });

    /**
     * @tc.name   DataView2Test041
     * @tc.number SUB_BUILTINS_DataView2_TEST_4100
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1234567890123456789n;
      view.setBigInt64(0, testVal, true);
      const result = view.getBigInt64(0, true);
      expect(result.toString(10)).assertEqual(testVal.toString(10));
    });

    /**
     * @tc.name   DataView2Test042
     * @tc.number SUB_BUILTINS_DataView2_TEST_4200
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(14);
      const offset = 3;
      const testVal = -12345678901234n;
      const view = new DataView(buffer);
      view.setBigInt64(offset, testVal);
      const result = view.getBigInt64(offset);
      const test: Offset3BigEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView2Test043
     * @tc.number SUB_BUILTINS_DataView2_TEST_4300
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const testVal = 0x9876543210FEDCBAn;
    //   view.setBigInt64(0, testVal, true);
    //   const result = view.getBigInt64(0, true);
    //   expect(result.toString()).assertEqual("-7460683158682411846");
    // });

    /**
     * @tc.name   DataView2Test044
     * @tc.number SUB_BUILTINS_DataView2_TEST_4400
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(14);
    //   const view = new DataView(buffer);
    //   const offset = 6;
    //   const testVal = 0xABCDEF1234567890n;
    //   view.setBigInt64(offset, testVal);
    //   const result = view.getBigInt64(offset);
    //   expect(result.toString()).assertEqual("-6066930261531658096");
    // });

    /**
     * @tc.name   DataView2Test045
     * @tc.number SUB_BUILTINS_DataView2_TEST_4500
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal = 1000n;
      const divisor = 25n;
      const quotient = 40n;
      const view = new DataView(buffer);
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      const test: BigEndianDivisionTest = {
        view,
        testVal,
        divisor,
        quotient
      };
      expect(result / divisor).assertEqual(test.quotient);
    });

    /**
     * @tc.name   DataView2Test046
     * @tc.number SUB_BUILTINS_DataView2_TEST_4600
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const zero = 0n;
      view.setBigInt64(0, zero);
      const result = view.getBigInt64(0);
      expect(result + 100n).assertEqual(100n);
    });

    /**
     * @tc.name   DataView2Test047
     * @tc.number SUB_BUILTINS_DataView2_TEST_4700
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(8);
      const buffer2 = new ArrayBuffer(8);
      const val1 = 123n;
      const val2 = 456n;
      const view1 = new DataView(buffer1);
      const view2 = new DataView(buffer2);
      view1.setBigInt64(0, val1);
      view2.setBigInt64(0, val2);
      const result1 = view1.getBigInt64(0);
      const result2 = view2.getBigInt64(0);
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
     * @tc.name   DataView2Test048
     * @tc.number SUB_BUILTINS_DataView2_TEST_4800
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 0, 8);
      const minVal = -9223372036854775808n;
      view.setBigInt64(0, minVal);
      const result = view.getBigInt64(0);
      expect(result).assertEqual(minVal);
    });

    /**
     * @tc.name   DataView2Test049
     * @tc.number SUB_BUILTINS_DataView2_TEST_4900
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 123456789n;
      view.setBigInt64(0, testVal, true);
      const result = view.getBigInt64(0, true);
      expect(result === 123456789n).assertEqual(true);
    });

    /**
     * @tc.name   DataView2Test050
     * @tc.number SUB_BUILTINS_DataView2_TEST_5000
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView2Test051
     * @tc.number SUB_BUILTINS_DataView2_TEST_5100
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(14);
      const offset = 6;
      const testVal = -9876543210n;
      const view = new DataView(buffer);
      view.setBigInt64(offset, testVal, true);
      const result = view.getBigInt64(offset, true);
      const test: Offset6LittleEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView2Test052
     * @tc.number SUB_BUILTINS_DataView2_TEST_5200
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 100n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(result % 3n).assertEqual(1n);
    });

    /**
     * @tc.name   DataView2Test053
     * @tc.number SUB_BUILTINS_DataView2_TEST_5300
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(10);
    //   const view = new DataView(buffer);
    //   const offset = 2;
    //   const testVal = 0x1234567890ABCDEFn;
    //   view.setBigInt64(offset, testVal);
    //   const result = view.getBigInt64(offset);
    //   expect(result).assertEqual(testVal);
    // });

    /**
     * @tc.name   DataView2Test054
     * @tc.number SUB_BUILTINS_DataView2_TEST_5400
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal = -123456789n;
      const view = new DataView(buffer);
      view.setBigInt64(0, testVal);
      const bigEndianResult = view.getBigInt64(0);
      const littleEndianResult = view.getBigInt64(0, true);
      const test: BigToLittleNegativeTest = {
        view,
        testVal,
        bigEndianResult,
        littleEndianResult
      };
      expect(test.bigEndianResult).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView2Test055
     * @tc.number SUB_BUILTINS_DataView2_TEST_5500
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 500n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(result !== 0n).assertEqual(true);
    });

    /**
     * @tc.name   DataView2Test056
     * @tc.number SUB_BUILTINS_DataView2_TEST_5600
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const offset = 4;
      const testVal = 777777777777777777n;
      const view1 = new DataView(buffer, 0, 12);
      const view2 = new DataView(buffer, 2, 14);
      view1.setBigInt64(offset, testVal);
      const result = view2.getBigInt64(offset);
      expect(result.toString()).assertEqual("4090568784953278464");
    });

    /**
     * @tc.name   DataView2Test057
     * @tc.number SUB_BUILTINS_DataView2_TEST_5700
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(11);
    //   const view = new DataView(buffer);
    //   const offset = 3;
    //   const testVal = 0xFEDCBA9876543210n;
    //   view.setBigInt64(offset, testVal);
    //   const result = view.getBigInt64(offset);
    //   expect(result.toString()).assertEqual("-81985529216486896");
    // });

    /**
     * @tc.name   DataView2Test058
     * @tc.number SUB_BUILTINS_DataView2_TEST_5800
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = -1n;
      view.setBigInt64(0, testVal, true);
      const result = view.getBigInt64(0, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView2Test059
     * @tc.number SUB_BUILTINS_DataView2_TEST_5900
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 3n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(result.toString(2)).assertEqual(testVal.toString(2));
    });

    /**
     * @tc.name   DataView2Test060
     * @tc.number SUB_BUILTINS_DataView2_TEST_6000
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(15);
      const offset = 7;
      const testVal = 987654321012345n;
      const view = new DataView(buffer);
      view.setBigInt64(offset, testVal, true);
      const result = view.getBigInt64(offset, true);
      const test: Offset7LittleEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });
    /**
     * @tc.name   DataView2Test061
     * @tc.number SUB_BUILTINS_DataView2_TEST_6100
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(15);
      const offset = 7;
      const testVal = 123456789012345n;
      const view = new DataView(buffer);
      view.setBigInt64(offset, testVal, true);
      const result = view.getBigInt64(offset, true);
      const test: Offset7LittleEndianPosTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView2Test062
     * @tc.number SUB_BUILTINS_DataView2_TEST_6200
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 10n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(result << 2n).assertEqual(40n);
    });

    /**
     * @tc.name   DataView2Test063
     * @tc.number SUB_BUILTINS_DataView2_TEST_6300
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = -1n;
      view.setBigInt64(0, testVal, true);
      const result = view.getBigInt64(0, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView2Test064
     * @tc.number SUB_BUILTINS_DataView2_TEST_6400
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(16);
    //   const view = new DataView(buffer, 0, 16);
    //   const offset = 8;
    //   const testVal = 0x1122334455667788n;
    //   view.setBigInt64(offset, testVal);
    //   const result = view.getBigInt64(offset);
    //   expect(result).assertEqual(testVal);
    // });

    /**
     * @tc.name   DataView2Test065
     * @tc.number SUB_BUILTINS_DataView2_TEST_6500
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 80n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(result >> 2n).assertEqual(20n);
    });

    /**
     * @tc.name   DataView2Test066
     * @tc.number SUB_BUILTINS_DataView2_TEST_6600
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 123456789n;
      view.setBigInt64(0, testVal, true);
      const result = view.getBigInt64(0, true);
      expect(result.toString()).assertEqual("123456789");
    });

    /**
     * @tc.name   DataView2Test067
     * @tc.number SUB_BUILTINS_DataView2_TEST_6700
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(14);
      const offset = 4;
      const testVal = 123456789012345n;
      const view = new DataView(buffer);
      view.setBigInt64(offset, testVal);
      const result = view.getBigInt64(offset);
      const test: Offset4BigEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView2Test068
     * @tc.number SUB_BUILTINS_DataView2_TEST_6800
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 9007199254740991n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(Number(result)).assertEqual(9007199254740991);
    });

    /**
     * @tc.name   DataView2Test069
     * @tc.number SUB_BUILTINS_DataView2_TEST_6900
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const testVal = -0xABCDEF123456n;
    //   view.setBigInt64(0, testVal, true);
    //   const result = view.getBigInt64(0, true);
    //   expect(result).assertEqual(testVal);
    // });

    /**
     * @tc.name   DataView2Test070
     * @tc.number SUB_BUILTINS_DataView2_TEST_7000
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(13);
    //   const view = new DataView(buffer);
    //   const offset = 5;
    //   const testVal = 0xABCDEF1234567890n;
    //   view.setBigInt64(offset, testVal);
    //   const result = view.getBigInt64(offset);
    //   expect(result.toString()).assertEqual("-6066930261531658096");
    // });

    /**
     * @tc.name   DataView2Test071
     * @tc.number SUB_BUILTINS_DataView2_TEST_7100
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const testVal1 = 0b1010n;
    //   const testVal2 = 0b1100n;
    //   const xorResult = 0b0110n;
    //   const view = new DataView(buffer);
    //   view.setBigInt64(0, testVal1);
    //   const result1 = view.getBigInt64(0);
    //   view.setBigInt64(0, testVal2);
    //   const result2 = view.getBigInt64(0);
    //   const test: BigEndianXorTest = {
    //     view,
    //     testVal1,
    //     testVal2,
    //     xorResult
    //   };
    //   expect(result1 ^ result2).assertEqual(test.xorResult);
    // });

    /**
     * @tc.name   DataView2Test072
     * @tc.number SUB_BUILTINS_DataView2_TEST_7200
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const testVal1 = 0b1111n;
    //   const testVal2 = 0b1010n;
    //   view.setBigInt64(0, testVal1);
    //   const result1 = view.getBigInt64(0);
    //   view.setBigInt64(0, testVal2);
    //   const result2 = view.getBigInt64(0);
    //   expect(result1 & result2).assertEqual(0b1010n);
    // });

    /**
     * @tc.name   DataView2Test073
     * @tc.number SUB_BUILTINS_DataView2_TEST_7300
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(8);
      const buffer2 = new ArrayBuffer(8);
      const val1 = 111n;
      const val2 = 222n;
      const view1 = new DataView(buffer1);
      const view2 = new DataView(buffer2);
      view1.setBigInt64(0, val1);
      view2.setBigInt64(0, val2);
      const result1 = view1.getBigInt64(0);
      const result2 = view2.getBigInt64(0);
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
     * @tc.name   DataView2Test074
     * @tc.number SUB_BUILTINS_DataView2_TEST_7400
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 0, 8);
      const testVal = -1n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView2Test075
     * @tc.number SUB_BUILTINS_DataView2_TEST_7500
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const testVal1 = 0b1000n;
    //   const testVal2 = 0b0010n;
    //   view.setBigInt64(0, testVal1, true);
    //   const result1 = view.getBigInt64(0, true);
    //   view.setBigInt64(0, testVal2, true);
    //   const result2 = view.getBigInt64(0, true);
    //   expect(result1 | result2).assertEqual(0b1010n);
    // });

    /**
     * @tc.name   DataView2Test076
     * @tc.number SUB_BUILTINS_DataView2_TEST_7600
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const testVal = 0n;
    //   view.setBigInt64(0, testVal);
    //   const result = view.getBigInt64(0);
    //   expect(result | 0b1111n).assertEqual(0b1111n);
    // });

    /**
     * @tc.name   DataView2Test077
     * @tc.number SUB_BUILTINS_DataView2_TEST_7700
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const offset = 8;
      const testVal = 1234567890123456789n;
      const view = new DataView(buffer);
      view.setBigInt64(offset, testVal, true);
      const result = view.getBigInt64(offset, true);
      const test: Offset8LittleEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView2Test078
     * @tc.number SUB_BUILTINS_DataView2_TEST_7800
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const testVal = 0x1234n;
    //   view.setBigInt64(0, testVal);
    //   const result = view.getBigInt64(0);
    //   expect(result << 16n).assertEqual(0x12340000n);
    // });

    /**
     * @tc.name   DataView2Test079
     * @tc.number SUB_BUILTINS_DataView2_TEST_7900
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(9);
    //   const view = new DataView(buffer);
    //   const offset = 1;
    //   const testVal = -0xABCDEF12345678n;
    //   view.setBigInt64(offset, testVal);
    //   const result = view.getBigInt64(offset);
    //   expect(result).assertEqual(testVal);
    // });

    /**
     * @tc.name   DataView2Test080
     * @tc.number SUB_BUILTINS_DataView2_TEST_8000
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 9007199254740991n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(result).assertEqual(9007199254740991n);
    });

    /**
     * @tc.name   DataView2Test081
     * @tc.number SUB_BUILTINS_DataView2_TEST_8100
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(12);
    //   const offset1 = 0;
    //   const offset2 = 0;
    //   const val1 = 0x1111n;
    //   const val2 = 0x2222n;
    //   const view1 = new DataView(buffer, 0, 8);
    //   const view2 = new DataView(buffer, 4, 8);
    //   view1.setBigInt64(offset1, val1);
    //   view2.setBigInt64(offset2, val2);
    //   const result1 = view1.getBigInt64(offset1);
    //   const result2 = view2.getBigInt64(offset2);
    //   expect(result1.toString()).assertEqual("0");
    //   expect(result2.toString()).assertEqual("8738");
    // });

    /**
     * @tc.name   DataView2Test082
     * @tc.number SUB_BUILTINS_DataView2_TEST_8200
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(12);
    //   const view = new DataView(buffer);
    //   const offset = 4;
    //   const testVal = 0x876543210FEDCBA9n;
    //   view.setBigInt64(offset, testVal);
    //   const result = view.getBigInt64(offset);
    //   expect(result.toString()).assertEqual("-8690466096661279831");
    // });

    /**
     * @tc.name   DataView2Test083
     * @tc.number SUB_BUILTINS_DataView2_TEST_8300
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const testVal = 0x12345678n;
    //   view.setBigInt64(0, testVal, true);
    //   const result = view.getBigInt64(0, true);
    //   expect(result >> 8n).assertEqual(0x123456n);
    // });

    /**
     * @tc.name   DataView2Test084
     * @tc.number SUB_BUILTINS_DataView2_TEST_8400
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 63n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(result.toString(8)).assertEqual("77");
    });

    /**
     * @tc.name   DataView2Test085
     * @tc.number SUB_BUILTINS_DataView2_TEST_8500
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(14);
      const offset = 6;
      const testVal = -98765432101234n;
      const view = new DataView(buffer);
      view.setBigInt64(offset, testVal);
      const result = view.getBigInt64(offset);
      const test: Offset6BigEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView2Test086
     * @tc.number SUB_BUILTINS_DataView2_TEST_8600
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(10);
    //   const view = new DataView(buffer);
    //   const offset = 2;
    //   const testVal = 0xABCDEF1234567890n;
    //   view.setBigInt64(offset, testVal);
    //   const result = view.getBigInt64(offset);
    //   expect(result.toString()).assertEqual("-6066930261531658096");
    // });

    /**
     * @tc.name   DataView2Test087
     * @tc.number SUB_BUILTINS_DataView2_TEST_8700
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const testVal = 0x12345678n;
    //   const fullOne = 0xFFFFFFFFFFFFFFFFn;
    //   const view = new DataView(buffer);
    //   view.setBigInt64(0, testVal);
    //   const result = view.getBigInt64(0);
    //   const test: BigEndianFullXorTest = {
    //     view,
    //     testVal,
    //     fullOne,
    //     xorResult: result ^ fullOne
    //   };
    //   expect(test.xorResult).assertEqual(fullOne - test.testVal);
    // });

    /**
     * @tc.name   DataView2Test088
     * @tc.number SUB_BUILTINS_DataView2_TEST_8800
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const testVal = 0x12345678n;
    //   const fullOne = 0xFFFFFFFFn;
    //   view.setBigInt64(0, testVal);
    //   const result = view.getBigInt64(0);
    //   expect(result & fullOne).assertEqual(testVal);
    // });

    /**
     * @tc.name   DataView2Test089
     * @tc.number SUB_BUILTINS_DataView2_TEST_8900
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 456n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(typeof result === "bigint").assertEqual(true);
    });

    /**
     * @tc.name   DataView2Test090
     * @tc.number SUB_BUILTINS_DataView2_TEST_9000
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 0, 8);
      const testVal = 0n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(result).assertEqual(testVal);
    });
    /**
     * @tc.name   DataView2Test091
     * @tc.number SUB_BUILTINS_DataView2_TEST_9100
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const testVal1 = 0b1010n;
    //   const testVal2 = 0b1100n;
    //   view.setBigInt64(0, testVal1, true);
    //   const result1 = view.getBigInt64(0, true);
    //   view.setBigInt64(0, testVal2, true);
    //   const result2 = view.getBigInt64(0, true);
    //   expect(result1 ^ result2).assertEqual(0b0110n);
    // });

    /**
     * @tc.name   DataView2Test092
     * @tc.number SUB_BUILTINS_DataView2_TEST_9200
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 123456n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(result.toString(36)).assertEqual("2n9c");
    });

    /**
     * @tc.name   DataView2Test093
     * @tc.number SUB_BUILTINS_DataView2_TEST_9300
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(11);
      const offset = 3;
      const testVal = -1234567890123n;
      const view = new DataView(buffer);
      view.setBigInt64(offset, testVal, true);
      const result = view.getBigInt64(offset, true);
      const test: Offset3LittleEndianNegTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView2Test094
     * @tc.number SUB_BUILTINS_DataView2_TEST_9400
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 123n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(typeof result).assertEqual("bigint");
    });

    /**
     * @tc.name   DataView2Test095
     * @tc.number SUB_BUILTINS_DataView2_TEST_9500
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0n;
      view.setBigInt64(0, testVal, true);
      const bigResult = view.getBigInt64(0);
      expect(bigResult).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView2Test096
     * @tc.number SUB_BUILTINS_DataView2_TEST_9600
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(13);
    //   const view = new DataView(buffer);
    //   const offset = 5;
    //   const testVal = -0x1234567890ABCn;
    //   view.setBigInt64(offset, testVal);
    //   const result = view.getBigInt64(offset);
    //   expect(result).assertEqual(testVal);
    // });

    /**
     * @tc.name   DataView2Test097
     * @tc.number SUB_BUILTINS_DataView2_TEST_9700
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const testVal1 = 0b1000n;
    //   const testVal2 = 0b0010n;
    //   const orResult = 0b1010n;
    //   const view = new DataView(buffer);
    //   view.setBigInt64(0, testVal1);
    //   const result1 = view.getBigInt64(0);
    //   view.setBigInt64(0, testVal2);
    //   const result2 = view.getBigInt64(0);
    //   const test: BigEndianOrTest = {
    //     view,
    //     testVal1,
    //     testVal2,
    //     orResult
    //   };
    //   expect(result1 | result2).assertEqual(test.orResult);
    // });

    /**
     * @tc.name   DataView2Test098
     * @tc.number SUB_BUILTINS_DataView2_TEST_9800
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const testVal = 0x12345678n;
    //   view.setBigInt64(0, testVal);
    //   const result = view.getBigInt64(0);
    //   expect(result >> 16n).assertEqual(0x1234n);
    // });

    /**
     * @tc.name   DataView2Test099
     * @tc.number SUB_BUILTINS_DataView2_TEST_9900
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer1 = new ArrayBuffer(8);
    //   const buffer2 = new ArrayBuffer(8);
    //   const val1 = 0xAAAAn;
    //   const val2 = 0xBBBBn;
    //   const view1 = new DataView(buffer1);
    //   const view2 = new DataView(buffer2);
    //   view1.setBigInt64(0, val1);
    //   view2.setBigInt64(0, val2);
    //   const result1 = view1.getBigInt64(0);
    //   const result2 = view2.getBigInt64(0);
    //   const test: MultiBufferTest = {
    //     view1,
    //     view2,
    //     val1,
    //     val2
    //   };
    //   expect(result1).assertEqual(test.val1);
    //   expect(result2).assertEqual(test.val2);
    // });

    /**
     * @tc.name   DataView2Test100
     * @tc.number SUB_BUILTINS_DataView2_TEST_10000
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer, 0, 16);
      const maxVal = 9223372036854775807n;
      view.setBigInt64(0, maxVal);
      const result = view.getBigInt64(0);
      expect(result).assertEqual(maxVal);
    });

    /**
     * @tc.name   DataView2Test101
     * @tc.number SUB_BUILTINS_DataView2_TEST_10100
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const testVal = 0x12n;
    //   view.setBigInt64(0, testVal, true);
    //   const result = view.getBigInt64(0, true);
    //   expect(result << 4n).assertEqual(0x120n);
    // });

    /**
     * @tc.name   DataView2Test102
     * @tc.number SUB_BUILTINS_DataView2_TEST_10200
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(13);
      const offset = 5;
      const testVal = 9876543210123456n;
      const view = new DataView(buffer);
      view.setBigInt64(offset, testVal, true);
      const result = view.getBigInt64(offset, true);
      const test: Offset5LittleEndianPosTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView2Test103
     * @tc.number SUB_BUILTINS_DataView2_TEST_10300
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(11);
    //   const view = new DataView(buffer);
    //   const offset = 3;
    //   const testVal = 0x876543210FEDCBA9n;
    //   view.setBigInt64(offset, testVal);
    //   const result = view.getBigInt64(offset);
    //   expect(result.toString()).assertEqual("-8690466096661279831");
    // });

    /**
     * @tc.name   DataView2Test104
     * @tc.number SUB_BUILTINS_DataView2_TEST_10400
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal = 9223372036854775807n;
      const subtrahend = 100n;
      const difference = 9223372036854775707n;
      const view = new DataView(buffer);
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      const test: BigEndianLargeSubTest = {
        view,
        testVal,
        subtrahend,
        difference
      };
      expect(result - test.subtrahend).assertEqual(test.difference);
    });

    /**
     * @tc.name   DataView2Test105
     * @tc.number SUB_BUILTINS_DataView2_TEST_10500
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1000000000000000n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(result * 1000n).assertEqual(1000000000000000000n);
    });

    /**
     * @tc.name   DataView2Test106
     * @tc.number SUB_BUILTINS_DataView2_TEST_10600
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 9223372036854775807n;
      view.setBigInt64(0, testVal, true);
      const bigResult = view.getBigInt64(0, true);
      expect(bigResult).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView2Test107
     * @tc.number SUB_BUILTINS_DataView2_TEST_10700
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 0, 8);
      const minVal = -9223372036854775808n;
      view.setBigInt64(0, minVal);
      const result = view.getBigInt64(0);
      expect(result).assertEqual(minVal);
    });

    /**
     * @tc.name   DataView2Test108
     * @tc.number SUB_BUILTINS_DataView2_TEST_10800
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 9223372036854775800n;
      view.setBigInt64(0, testVal, true);
      const result = view.getBigInt64(0, true);
      expect(result / 10n).assertEqual(922337203685477580n);
    });

    /**
     * @tc.name   DataView2Test109
     * @tc.number SUB_BUILTINS_DataView2_TEST_10900
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(14);
      const offset = 6;
      const testVal = 1234567890123456n;
      const view = new DataView(buffer);
      view.setBigInt64(offset, testVal);
      const result = view.getBigInt64(offset);
      const test: Offset6BigEndianPosTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView2Test110
     * @tc.number SUB_BUILTINS_DataView2_TEST_11000
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 9007199254740993n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(Number(result)).assertEqual(9007199254740992);
    });

    /**
     * @tc.name   DataView2Test111
     * @tc.number SUB_BUILTINS_DataView2_TEST_11100
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = -123456n;
      view.setBigInt64(0, testVal, true);
      const bigResult = view.getBigInt64(0);
      expect(bigResult < 0n).assertEqual(true);
    });

    /**
     * @tc.name   DataView2Test112
     * @tc.number SUB_BUILTINS_DataView2_TEST_11200
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(12);
    //   const view = new DataView(buffer);
    //   const offset = 4;
    //   const testVal = -0xABCDEF123456789n;
    //   view.setBigInt64(offset, testVal);
    //   const result = view.getBigInt64(offset);
    //   expect(result).assertEqual(testVal);
    // });

    /**
     * @tc.name   DataView2Test113
     * @tc.number SUB_BUILTINS_DataView2_TEST_11300
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 9223372036854775807n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(result % 1000n).assertEqual(807n);
    });

    /**
     * @tc.name   DataView2Test114
     * @tc.number SUB_BUILTINS_DataView2_TEST_11400
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(8);
      const buffer2 = new ArrayBuffer(8);
      const val1 = 123456n;
      const val2 = 789012n;
      const opResult = val1 + val2;
      const view1 = new DataView(buffer1);
      const view2 = new DataView(buffer2);
      view1.setBigInt64(0, val1);
      view2.setBigInt64(0, val2);
      const result1 = view1.getBigInt64(0);
      const result2 = view2.getBigInt64(0);
      const test: MultiBufferOpTest = {
        view1,
        view2,
        val1,
        val2,
        opResult
      };
      expect(result1 + result2).assertEqual(test.opResult);
    });

    /**
     * @tc.name   DataView2Test115
     * @tc.number SUB_BUILTINS_DataView2_TEST_11500
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer, 0, 16);
      const offset = 8;
      const minVal = -9223372036854775808n;
      view.setBigInt64(offset, minVal);
      const result = view.getBigInt64(offset);
      expect(result).assertEqual(minVal);
    });

    /**
     * @tc.name   DataView2Test116
     * @tc.number SUB_BUILTINS_DataView2_TEST_11600
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const testVal1 = 0b1001n;
    //   const testVal2 = 0b0110n;
    //   const comboResult = (testVal1 << 2n) ^ testVal2;
    //   const view = new DataView(buffer);
    //   view.setBigInt64(0, testVal1, true);
    //   const result1 = view.getBigInt64(0, true);
    //   view.setBigInt64(0, testVal2, true);
    //   const result2 = view.getBigInt64(0, true);
    //   const test: LittleEndianBitComboTest = {
    //     view,
    //     testVal1,
    //     testVal2,
    //     comboResult
    //   };
    //   expect((result1 << 2n) ^ result2).assertEqual(test.comboResult);
    // });

    /**
     * @tc.name   DataView2Test117
     * @tc.number SUB_BUILTINS_DataView2_TEST_11700
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 987654321n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(result.toString(36).toLowerCase()).assertEqual("gc0uy9");
    });

    /**
     * @tc.name   DataView2Test118
     * @tc.number SUB_BUILTINS_DataView2_TEST_11800
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(20);
      const offset = 12;
      const testVal = 1234567890123456789n;
      const view = new DataView(buffer);
      view.setBigInt64(offset, testVal, true);
      const result = view.getBigInt64(offset, true);
      const test: Offset12LittleEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView2Test119
     * @tc.number SUB_BUILTINS_DataView2_TEST_11900
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(9);
      const view = new DataView(buffer);
      const offset = 1;
      const testVal = 9223372036854775807n;
      view.setBigInt64(offset, testVal);
      const result = view.getBigInt64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView2Test120
     * @tc.number SUB_BUILTINS_DataView2_TEST_12000
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const one = 1n;
      const view = new DataView(buffer);
      view.setBigInt64(0, one);
      const bigResult = view.getBigInt64(0);
      view.setBigInt64(0, one, true);
      const littleResult = view.getBigInt64(0, true);
      const test: OneEndianConsistencyTest = {
        view,
        one,
        bigResult,
        littleResult
      };
      expect(test.bigResult).assertEqual(test.one);
      expect(test.littleResult).assertEqual(test.one);
    });
    /**
     * @tc.name   DataView2Test121
     * @tc.number SUB_BUILTINS_DataView2_TEST_12100
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(result === testVal).assertEqual(true);
    });

    /**
     * @tc.name   DataView2Test122
     * @tc.number SUB_BUILTINS_DataView2_TEST_12200
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(12);
    //   const offset = 2;
    //   const val1 = 0x1111n;
    //   const view1 = new DataView(buffer, 0, 10);
    //   view1.setBigInt64(offset, val1);
    //   const result = view1.getBigInt64(offset);
    //   expect(result.toString()).assertEqual("4369");
    // });

    /**
     * @tc.name   DataView2Test123
     * @tc.number SUB_BUILTINS_DataView2_TEST_12300
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const view = new DataView(buffer);
      const offset = 4;
      const testVal = 1n;
      view.setBigInt64(offset, testVal);
      const result = view.getBigInt64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView2Test124
     * @tc.number SUB_BUILTINS_DataView2_TEST_12400
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = -9223372036854775808n;
      view.setBigInt64(0, testVal, true);
      const result = view.getBigInt64(0, true);
      expect(result + 1n).assertEqual(-9223372036854775807n);
    });

    /**
     * @tc.name   DataView2Test125
     * @tc.number SUB_BUILTINS_DataView2_TEST_12500
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 255n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(result.toString(8)).assertEqual("377");
    });

    /**
     * @tc.name   DataView2Test126
     * @tc.number SUB_BUILTINS_DataView2_TEST_12600
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(14);
      const offset = 6;
      const testVal = -12345678901234n;
      const view = new DataView(buffer);
      view.setBigInt64(offset, testVal, true);
      const result = view.getBigInt64(offset, true);
      const test: Offset6LittleEndianNegTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView2Test127
     * @tc.number SUB_BUILTINS_DataView2_TEST_12700
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 123n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(typeof result === "bigint").assertEqual(true);
    });

    /**
     * @tc.name   DataView2Test128
     * @tc.number SUB_BUILTINS_DataView2_TEST_12800
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0n;
      view.setBigInt64(0, testVal, true);
      const bigResult = view.getBigInt64(0);
      expect(bigResult).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView2Test129
     * @tc.number SUB_BUILTINS_DataView2_TEST_12900
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(11);
      const view = new DataView(buffer);
      const offset = 3;
      const testVal = 0n;
      view.setBigInt64(offset, testVal);
      const result = view.getBigInt64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView2Test130
     * @tc.number SUB_BUILTINS_DataView2_TEST_13000
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal = -9223372036854775807n;
      const subtrahend = 1n;
      const difference = -9223372036854775808n;
      const view = new DataView(buffer);
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      const test: BigEndianBoundarySubTest = {
        view,
        testVal,
        subtrahend,
        difference
      };
      expect(result - test.subtrahend).assertEqual(test.difference);
    });

    /**
     * @tc.name   DataView2Test131
     * @tc.number SUB_BUILTINS_DataView2_TEST_13100
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 4611686018427387903n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(result * 2n).assertEqual(9223372036854775806n);
    });

    /**
     * @tc.name   DataView2Test132
     * @tc.number SUB_BUILTINS_DataView2_TEST_13200
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const offset = 4;
      const testVal = 543210987654321n;
      const view1 = new DataView(buffer);
      const view2 = new DataView(buffer);
      view1.setBigInt64(offset, testVal);
      const result = view2.getBigInt64(offset);
      const test: SharedMultiWriteReadTest = {
        view1,
        view2,
        buffer,
        offset,
        testVal
      };
      expect(result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView2Test133
     * @tc.number SUB_BUILTINS_DataView2_TEST_13300
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 0, 8);
      const testVal = -1n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView2Test134
     * @tc.number SUB_BUILTINS_DataView2_TEST_13400
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 9223372036854775806n;
      view.setBigInt64(0, testVal, true);
      const result = view.getBigInt64(0, true);
      expect(result / 2n).assertEqual(4611686018427387903n);
    });

    /**
     * @tc.name   DataView2Test135
     * @tc.number SUB_BUILTINS_DataView2_TEST_13500
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {

      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 15n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      const bits = result.toString(2).padStart(64, '0');
      expect(bits).assertEqual("0000000000000000000000000000000000000000000000000000000000001111");
    });

    /**
     * @tc.name   DataView2Test136
     * @tc.number SUB_BUILTINS_DataView2_TEST_13600
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(13);
      const offset = 5;
      const testVal = -9876543210123n;
      const view = new DataView(buffer);
      view.setBigInt64(offset, testVal);
      const result = view.getBigInt64(offset);
      const test: Offset5BigEndianNegTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView2Test137
     * @tc.number SUB_BUILTINS_DataView2_TEST_13700
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 9007199254740991n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(Number(result) === 9007199254740991).assertEqual(true);
    });

    /**
     * @tc.name   DataView2Test138
     * @tc.number SUB_BUILTINS_DataView2_TEST_13800
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = -1n;
      view.setBigInt64(0, testVal, true);
      const bigResult = view.getBigInt64(0);
      expect(bigResult < 0n).assertEqual(true);
    });

    /**
     * @tc.name   DataView2Test139
     * @tc.number SUB_BUILTINS_DataView2_TEST_13900
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer);
      const offset = 2;
      const testVal = -1n;
      view.setBigInt64(offset, testVal);
      const result = view.getBigInt64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView2Test140
     * @tc.number SUB_BUILTINS_DataView2_TEST_14000
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const testVal1 = 0b1100n;
    //   const testVal2 = 0b1010n;
    //   const comboResult = (testVal1 & testVal2) << 2n;
    //   const view = new DataView(buffer);
    //   view.setBigInt64(0, testVal1);
    //   const result1 = view.getBigInt64(0);
    //   view.setBigInt64(0, testVal2);
    //   const result2 = view.getBigInt64(0);
    //   const test: BigEndianBitAndShiftTest = {
    //     view,
    //     testVal1,
    //     testVal2,
    //     comboResult
    //   };
    //   expect((result1 & result2) << 2n).assertEqual(test.comboResult);
    // });

    /**
     * @tc.name   DataView2Test141
     * @tc.number SUB_BUILTINS_DataView2_TEST_14100
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = -9223372036854775808n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect((result % 1000n).toString()).assertEqual("-808");
    });

    /**
     * @tc.name   DataView2Test142
     * @tc.number SUB_BUILTINS_DataView2_TEST_14200
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(8);
      const buffer2 = new ArrayBuffer(8);
      const val1 = 123456n;
      const val2 = 789012n;
      const view1 = new DataView(buffer1);
      const view2 = new DataView(buffer2);
      view1.setBigInt64(0, val1);
      view2.setBigInt64(0, val2);
      const result1 = view1.getBigInt64(0);
      const result2 = view2.getBigInt64(0);
      const test: MultiBufferIndepTest = {
        view1,
        view2,
        val1,
        val2
      };
      expect(result1).assertEqual(test.val1);
      expect(result2).assertEqual(test.val2);
    });

    /**
     * @tc.name   DataView2Test143
     * @tc.number SUB_BUILTINS_DataView2_TEST_14300
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer, 0, 16);
      const offset = 8;
      const testVal = 1n;
      view.setBigInt64(offset, testVal);
      const result = view.getBigInt64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView2Test144
     * @tc.number SUB_BUILTINS_DataView2_TEST_14400
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const testVal1 = 0b1000n;
    //   const testVal2 = 0b0010n;
    //   const comboResult = (testVal1 | testVal2) >> 1n;
    //   const view = new DataView(buffer);
    //   view.setBigInt64(0, testVal1, true);
    //   const result1 = view.getBigInt64(0, true);
    //   view.setBigInt64(0, testVal2, true);
    //   const result2 = view.getBigInt64(0, true);
    //   const test: LittleEndianBitOrShiftTest = {
    //     view,
    //     testVal1,
    //     testVal2,
    //     comboResult
    //   };
    //   expect((result1 | result2) >> 1n).assertEqual(test.comboResult);
    // });

    /**
     * @tc.name   DataView2Test145
     * @tc.number SUB_BUILTINS_DataView2_TEST_14500
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer);
      const offset = 2;
      const testVal = 12345n;
      view.setBigInt64(offset, testVal);
      const result = view.getBigInt64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView2Test146
     * @tc.number SUB_BUILTINS_DataView2_TEST_14600
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView2Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const testVal = 0x1234n;
    //   view.setBigInt64(0, testVal);
    //   const result = view.getBigInt64(0);
    //   const hex = result.toString(16).padStart(16, '0');
    //   expect(hex).assertEqual("0000000000001234");
    // });

    /**
     * @tc.name   DataView2Test147
     * @tc.number SUB_BUILTINS_DataView2_TEST_14700
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(22);
      const offset = 14;
      const testVal = -9876543210123456n;
      const view = new DataView(buffer);
      view.setBigInt64(offset, testVal, true);
      const result = view.getBigInt64(offset, true);
      const test: Offset14LittleEndianNegTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView2Test148
     * @tc.number SUB_BUILTINS_DataView2_TEST_14800
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(13);
      const view = new DataView(buffer);
      const offset = 5;
      const testVal = -1n;
      view.setBigInt64(offset, testVal);
      const result = view.getBigInt64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView2Test149
     * @tc.number SUB_BUILTINS_DataView2_TEST_14900
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer);
      const offset = 2;
      const testVal = 9223372036854775807n;
      view.setBigInt64(offset, testVal);
      const result = view.getBigInt64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView2Test150
     * @tc.number SUB_BUILTINS_DataView2_TEST_15000
     * @tc.desc   test DataView getBigInt64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView2Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = -1n;
      view.setBigInt64(0, testVal);
      const result = view.getBigInt64(0);
      expect(result === testVal).assertEqual(true);
    });

  })
}

