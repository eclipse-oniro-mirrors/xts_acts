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

interface SharedBufferGetTest {
  view: DataView;
  buffer: SharedArrayBuffer;
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

interface LittleEndianLargeTest {
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
  offset: number;
  testVal: bigint;
}

interface Offset5LittleEndianTest {
  view: DataView;
  offset: number;
  testVal: bigint;
  result: bigint;
}

interface SharedMultiViewTest {
  view1: DataView;
  view2: DataView;
  buffer: SharedArrayBuffer;
  testVal: bigint;
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

interface BigToLittleLargeTest {
  view: DataView;
  testVal: bigint;
  bigResult: bigint;
  littleResult: bigint;
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

interface SharedOffsetReadTest {
  view: DataView;
  buffer: SharedArrayBuffer;
  offset: number;
  testVal: bigint;
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

interface BigToLittleBitTest {
  view: DataView;
  testVal: bigint;
  bigBits: string;
  littleBits: string;
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

interface SharedMultiOffsetTest {
  view: DataView;
  buffer: SharedArrayBuffer;
  offset1: number;
  offset2: number;
  val1: bigint;
  val2: bigint;
}

interface Offset3LittleEndianLargeTest {
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

interface Offset10LittleEndianTest {
  view: DataView;
  offset: number;
  testVal: bigint;
  result: bigint;
}

interface ZeroEndianConsistencyTest {
  view: DataView;
  zero: bigint;
  bigResult: bigint;
  littleResult: bigint;
}

interface NestedOverlapReadTest {
  view1: DataView;
  view2: DataView;
  view3: DataView;
  offset: number;
  testVal: bigint;
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

interface SharedNestedViewTest {
  view1: DataView;
  view2: DataView;
  buffer: SharedArrayBuffer;
  offset: number;
  testVal: bigint;
}

interface Offset6BigEndianPosTest {
  view: DataView;
  offset: number;
  testVal: bigint;
  result: bigint;
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

interface SharedMultiWriteReadTest {
  view1: DataView;
  view2: DataView;
  buffer: SharedArrayBuffer;
  offset: number;
  testVal: bigint;
}

interface Offset5BigEndianLargeTest {
  view: DataView;
  offset: number;
  testVal: bigint;
  result: bigint;
}

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function DataView3Test() {
  describe('DataView3Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      await sleep(30);
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   DataView3Test001
     * @tc.number SUB_BUILTINS_DataView3_TEST_0100
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 18446744073709551615n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result).assertEqual(testVal);
    });
    /**
     * @tc.name   DataView3Test002
     * @tc.number SUB_BUILTINS_DataView3_TEST_0200
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1234567890123456789n;
      view.setBigUint64(0, testVal, true);
      const result = view.getBigUint64(0, true);
      expect(result).assertEqual(testVal);
    });
    /**
     * @tc.name   DataView3Test003
     * @tc.number SUB_BUILTINS_DataView3_TEST_0300
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const offset = 3;
      const testVal = 987654321098765432n;
      const view = new DataView(buffer);
      view.setBigUint64(offset, testVal);
      const result = view.getBigUint64(offset);
      const test: OffsetGetTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView3Test004
     * @tc.number SUB_BUILTINS_DataView3_TEST_0400
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0x123456789ABCDEFn;
      view.setBigUint64(0, testVal);
      view.setBigUint64(0, testVal, true);
      const result = view.getBigUint64(0, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test005
     * @tc.number SUB_BUILTINS_DataView3_TEST_0500
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const zero = 0n;
      view.setBigUint64(0, zero);
      const result = view.getBigUint64(0);
      expect(result).assertEqual(zero);
    });

    /**
     * @tc.name   DataView3Test006
     * @tc.number SUB_BUILTINS_DataView3_TEST_0600
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const offset = 2;
      const testVal = 4567890123456789n;
      const view = new DataView(buffer);
      view.setBigUint64(offset, testVal, true);
      const result = view.getBigUint64(offset, true);
      const test: OffsetLittleEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView3Test007
     * @tc.number SUB_BUILTINS_DataView3_TEST_0700
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer);
      const offset = 2;
      const testVal = 0xABCDEF12345678n;
      view.setBigUint64(offset, testVal);
      const result = view.getBigUint64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test008
     * @tc.number SUB_BUILTINS_DataView3_TEST_0800
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const maxVal = 18446744073709551615n;
      view.setBigUint64(0, maxVal);
      const result = view.getBigUint64(0);
      expect(result).assertEqual(maxVal);
    });

    /**
     * @tc.name   DataView3Test009
     * @tc.number SUB_BUILTINS_DataView3_TEST_0900
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new SharedArrayBuffer(8);
      const testVal = 9876543210987654321n;
      const view = new DataView(buffer);
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      const test: SharedBufferGetTest = {
        view,
        buffer,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView3Test010
     * @tc.number SUB_BUILTINS_DataView3_TEST_1000
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0x1122334455667788n;
      view.setBigUint64(0, testVal);
      const littleEndianResult = view.getBigUint64(0, true);
      expect(littleEndianResult).assertEqual(0x8877665544332211n);
    });

    /**
     * @tc.name   DataView3Test011
     * @tc.number SUB_BUILTINS_DataView3_TEST_1100
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1234567890123456789n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result.toString()).assertEqual(testVal.toString());
    });

    /**
     * @tc.name   DataView3Test012
     * @tc.number SUB_BUILTINS_DataView3_TEST_1200
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal = 555555555555555555n;
      const view1 = new DataView(buffer);
      const view2 = new DataView(buffer);
      view1.setBigUint64(0, testVal);
      const result = view2.getBigUint64(0);
      const test: MultiViewGetTest = { view1, view2, testVal };
      expect(result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView3Test013
     * @tc.number SUB_BUILTINS_DataView3_TEST_1300
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 543210987654321n;
      view.setBigUint64(0, testVal, true);
      const result = view.getBigUint64(0, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test014
     * @tc.number SUB_BUILTINS_DataView3_TEST_1400
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 0, 8);
      const testVal = 0xDEADBEEFCAFEBABEn;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test015
     * @tc.number SUB_BUILTINS_DataView3_TEST_1500
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 987654321n;
      view.setBigUint64(0, testVal, true);
      const result = view.getBigUint64(0, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test016
     * @tc.number SUB_BUILTINS_DataView3_TEST_1600
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 18446744073709551600n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test017
     * @tc.number SUB_BUILTINS_DataView3_TEST_1700
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const offset = 4;
      const testVal = 0x1234567890ABCn;
      const view = new DataView(buffer);
      view.setBigUint64(offset, testVal);
      const result = view.getBigUint64(offset);
      const test: Offset12ViewTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView3Test018
     * @tc.number SUB_BUILTINS_DataView3_TEST_1800
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 100n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result + 50n).assertEqual(150n);
    });

    /**
     * @tc.name   DataView3Test019
     * @tc.number SUB_BUILTINS_DataView3_TEST_1900
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0xABCDEF123456n;
      view.setBigUint64(0, testVal, true);
      const result = view.getBigUint64(0, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test020
     * @tc.number SUB_BUILTINS_DataView3_TEST_2000
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const maxVal = 18446744073709551615n;
      view.setBigUint64(0, maxVal);
      const result = view.getBigUint64(0);
      expect(result).assertEqual(maxVal);
    });

    /**
     * @tc.name   DataView3Test021
     * @tc.number SUB_BUILTINS_DataView3_TEST_2100
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(15);
      const offset = 5;
      const testVal = 9876543210987n;
      const view = new DataView(buffer);
      view.setBigUint64(offset, testVal);
      const result = view.getBigUint64(offset);
      const test: OffsetBigEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView3Test022
     * @tc.number SUB_BUILTINS_DataView3_TEST_2200
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 123456789n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(Number(result)).assertEqual(123456789);
    });

    /**
     * @tc.name   DataView3Test023
     * @tc.number SUB_BUILTINS_DataView3_TEST_2300
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 0, 8);
      const testVal = 0x1122334455667788n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test024
     * @tc.number SUB_BUILTINS_DataView3_TEST_2400
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const maxVal = 18446744073709551615n;
      view.setBigUint64(0, maxVal, true);
      const result = view.getBigUint64(0, true);
      expect(result).assertEqual(maxVal);
    });

    /**
     * @tc.name   DataView3Test025
     * @tc.number SUB_BUILTINS_DataView3_TEST_2500
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 18446744073709551600n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test026
     * @tc.number SUB_BUILTINS_DataView3_TEST_2600
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(14);
      const offset = 4;
      const testVal = 9876543210123456789n;
      const view = new DataView(buffer);
      view.setBigUint64(offset, testVal, true);
      const result = view.getBigUint64(offset, true);
      const test: LittleEndianLargeTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView3Test027
     * @tc.number SUB_BUILTINS_DataView3_TEST_2700
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 12345n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result * 2n).assertEqual(24690n);
    });

    /**
     * @tc.name   DataView3Test028
     * @tc.number SUB_BUILTINS_DataView3_TEST_2800
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const view = new DataView(buffer);
      const offset = 4;
      const testVal = 0x76543210FEDCBA98n;
      view.setBigUint64(offset, testVal, true);
      const result = view.getBigUint64(offset, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test029
     * @tc.number SUB_BUILTINS_DataView3_TEST_2900
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal = 0x1A2B3C4D5E6F7A8Bn;
      const view = new DataView(buffer);
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      const test: BigEndianConsistencyTest = { view, testVal, result };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView3Test030
     * @tc.number SUB_BUILTINS_DataView3_TEST_3000
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const zero = 0n;
      view.setBigUint64(0, zero);
      const result = view.getBigUint64(0);
      expect(result === zero).assertEqual(true);
    });
    /**
     * @tc.name   DataView3Test031
     * @tc.number SUB_BUILTINS_DataView3_TEST_3100
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const offset = 2;
      const testVal = 999999999999999999n;
      const view1 = new DataView(buffer);
      const view2 = new DataView(buffer);
      view1.setBigUint64(offset, testVal);
      const result = view2.getBigUint64(offset);
      const test: CrossViewReadTest = {
        view1,
        view2,
        offset,
        testVal
      };
      expect(result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView3Test032
     * @tc.number SUB_BUILTINS_DataView3_TEST_3200
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(9);
      const view = new DataView(buffer);
      const offset = 1;
      const testVal = 0x876543210FEDCBA9n;
      view.setBigUint64(offset, testVal);
      const result = view.getBigUint64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test033
     * @tc.number SUB_BUILTINS_DataView3_TEST_3300
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 18446744073709551610n;
      view.setBigUint64(0, testVal, true);
      const result = view.getBigUint64(0, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test034
     * @tc.number SUB_BUILTINS_DataView3_TEST_3400
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0xDEADBEEFCAFEBABEn;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result.toString(16)).assertEqual("deadbeefcafebabe");
    });

    /**
     * @tc.name   DataView3Test035
     * @tc.number SUB_BUILTINS_DataView3_TEST_3500
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(15);
      const offset = 5;
      const testVal = 123456789012345n;
      const view = new DataView(buffer);
      view.setBigUint64(offset, testVal, true);
      const result = view.getBigUint64(offset, true);
      const test: Offset5LittleEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView3Test036
     * @tc.number SUB_BUILTINS_DataView3_TEST_3600
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0x1122334455667788n;
      view.setBigUint64(0, testVal, true);
      const bigEndianResult = view.getBigUint64(0);
      expect(bigEndianResult).assertEqual(0x8877665544332211n);
    });

    /**
     * @tc.name   DataView3Test037
     * @tc.number SUB_BUILTINS_DataView3_TEST_3700
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1000000000000n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result === 1000000000000n).assertEqual(true);
    });

    /**
     * @tc.name   DataView3Test038
     * @tc.number SUB_BUILTINS_DataView3_TEST_3800
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new SharedArrayBuffer(8);
      const testVal = 543210987654321098n;
      const view1 = new DataView(buffer);
      const view2 = new DataView(buffer);
      view1.setBigUint64(0, testVal);
      const result = view2.getBigUint64(0);
      const test: SharedMultiViewTest = {
        view1,
        view2,
        buffer,
        testVal
      };
      expect(result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView3Test039
     * @tc.number SUB_BUILTINS_DataView3_TEST_3900
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const zero = 0n;
      view.setBigUint64(0, zero, true);
      const result = view.getBigUint64(0, true);
      expect(result).assertEqual(zero);
    });

    /**
     * @tc.name   DataView3Test040
     * @tc.number SUB_BUILTINS_DataView3_TEST_4000
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 0, 8);
      const maxVal = 18446744073709551615n;
      view.setBigUint64(0, maxVal);
      const result = view.getBigUint64(0);
      expect(result).assertEqual(maxVal);
    });

    /**
     * @tc.name   DataView3Test041
     * @tc.number SUB_BUILTINS_DataView3_TEST_4100
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 500n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result - 100n).assertEqual(400n);
    });

    /**
     * @tc.name   DataView3Test042
     * @tc.number SUB_BUILTINS_DataView3_TEST_4200
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1234567890123456789n;
      view.setBigUint64(0, testVal, true);
      const result = view.getBigUint64(0, true);
      expect(result.toString(10)).assertEqual("1234567890123456789");
    });

    /**
     * @tc.name   DataView3Test043
     * @tc.number SUB_BUILTINS_DataView3_TEST_4300
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(14);
      const offset = 3;
      const testVal = 98765432101234n;
      const view = new DataView(buffer);
      view.setBigUint64(offset, testVal);
      const result = view.getBigUint64(offset);
      const test: Offset3BigEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView3Test044
     * @tc.number SUB_BUILTINS_DataView3_TEST_4400
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 9007199254740993n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(Number(result) === 9007199254740992).assertEqual(true);
    });

    /**
     * @tc.name   DataView3Test045
     * @tc.number SUB_BUILTINS_DataView3_TEST_4500
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0x9876543210FEDCBAn;
      view.setBigUint64(0, testVal, true);
      const result = view.getBigUint64(0, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test046
     * @tc.number SUB_BUILTINS_DataView3_TEST_4600
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(14);
      const view = new DataView(buffer);
      const offset = 6;
      const testVal = 0xABCDEF1234567890n;
      view.setBigUint64(offset, testVal);
      const result = view.getBigUint64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test047
     * @tc.number SUB_BUILTINS_DataView3_TEST_4700
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal = 1000n;
      const divisor = 25n;
      const quotient = 40n;
      const view = new DataView(buffer);
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      const test: BigEndianDivisionTest = {
        view,
        testVal,
        divisor,
        quotient
      };
      expect(result / divisor).assertEqual(test.quotient);
    });

    /**
     * @tc.name   DataView3Test048
     * @tc.number SUB_BUILTINS_DataView3_TEST_4800
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const zero = 0n;
      view.setBigUint64(0, zero);
      const result = view.getBigUint64(0);
      expect(result + 100n).assertEqual(100n);
    });

    /**
     * @tc.name   DataView3Test049
     * @tc.number SUB_BUILTINS_DataView3_TEST_4900
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(8);
      const buffer2 = new ArrayBuffer(8);
      const val1 = 123n;
      const val2 = 456n;
      const view1 = new DataView(buffer1);
      const view2 = new DataView(buffer2);
      view1.setBigUint64(0, val1);
      view2.setBigUint64(0, val2);
      const result1 = view1.getBigUint64(0);
      const result2 = view2.getBigUint64(0);
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
     * @tc.name   DataView3Test050
     * @tc.number SUB_BUILTINS_DataView3_TEST_5000
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 0, 8);
      const minVal = 0n;
      view.setBigUint64(0, minVal);
      const result = view.getBigUint64(0);
      expect(result).assertEqual(minVal);
    });

    /**
     * @tc.name   DataView3Test051
     * @tc.number SUB_BUILTINS_DataView3_TEST_5100
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 123456789n;
      view.setBigUint64(0, testVal, true);
      const result = view.getBigUint64(0, true);
      expect(result === 123456789n).assertEqual(true);
    });

    /**
     * @tc.name   DataView3Test052
     * @tc.number SUB_BUILTINS_DataView3_TEST_5200
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test053
     * @tc.number SUB_BUILTINS_DataView3_TEST_5300
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(14);
      const offset = 6;
      const testVal = 9876543210987654321n;
      const view = new DataView(buffer);
      view.setBigUint64(offset, testVal, true);
      const result = view.getBigUint64(offset, true);
      const test: Offset6LittleEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView3Test054
     * @tc.number SUB_BUILTINS_DataView3_TEST_5400
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 100n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result % 3n).assertEqual(1n);
    });

    /**
     * @tc.name   DataView3Test055
     * @tc.number SUB_BUILTINS_DataView3_TEST_5500
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer);
      const offset = 2;
      const testVal = 0x1234567890ABCDEFn;
      view.setBigUint64(offset, testVal);
      const result = view.getBigUint64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test056
     * @tc.number SUB_BUILTINS_DataView3_TEST_5600
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal = 0x1122334455667788n;
      const view = new DataView(buffer);
      view.setBigUint64(0, testVal);
      const bigResult = view.getBigUint64(0);
      view.setBigUint64(0, testVal, true);
      const littleResult = view.getBigUint64(0, true);
      const test: BigToLittleLargeTest = {
        view,
        testVal,
        bigResult,
        littleResult
      };
      expect(test.bigResult).assertEqual(test.testVal);
      expect(test.littleResult).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView3Test057
     * @tc.number SUB_BUILTINS_DataView3_TEST_5700
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 500n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result !== 0n).assertEqual(true);
    });

    /**
     * @tc.name   DataView3Test058
     * @tc.number SUB_BUILTINS_DataView3_TEST_5800
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const offset = 4;
      const testVal = 777777777777777777n;
      const view1 = new DataView(buffer, 0, 12);
      const view2 = new DataView(buffer, 2, 14);
      view1.setBigUint64(offset, testVal);
      const result = view2.getBigUint64(offset);
      expect(result.toString()).assertEqual("4090568784953278464");
    });

    /**
     * @tc.name   DataView3Test059
     * @tc.number SUB_BUILTINS_DataView3_TEST_5900
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(11);
      const view = new DataView(buffer);
      const offset = 3;
      const testVal = 0xFEDCBA9876543210n;
      view.setBigUint64(offset, testVal);
      const result = view.getBigUint64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test060
     * @tc.number SUB_BUILTINS_DataView3_TEST_6000
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1n;
      view.setBigUint64(0, testVal, true);
      const result = view.getBigUint64(0, true);
      expect(result).assertEqual(testVal);
    });
    /**
     * @tc.name   DataView3Test061
     * @tc.number SUB_BUILTINS_DataView3_TEST_6100
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 3n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result.toString(2)).assertEqual("11");
    });

    /**
     * @tc.name   DataView3Test062
     * @tc.number SUB_BUILTINS_DataView3_TEST_6200
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(15);
      const offset = 7;
      const testVal = 987654321012345n;
      const view = new DataView(buffer);
      view.setBigUint64(offset, testVal, true);
      const result = view.getBigUint64(offset, true);
      const test: Offset7LittleEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView3Test063
     * @tc.number SUB_BUILTINS_DataView3_TEST_6300
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0xABCDEF12345678n;
      view.setBigUint64(0, testVal, true);
      const bigEndianResult = view.getBigUint64(0);
      expect(bigEndianResult.toString()).assertEqual("8671175388485757696");
    });

    /**
     * @tc.name   DataView3Test064
     * @tc.number SUB_BUILTINS_DataView3_TEST_6400
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 10n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result << 2n).assertEqual(40n);
    });

    /**
     * @tc.name   DataView3Test065
     * @tc.number SUB_BUILTINS_DataView3_TEST_6500
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new SharedArrayBuffer(12);
      const offset = 2;
      const testVal = 432109876543210n;
      const view = new DataView(buffer);
      view.setBigUint64(offset, testVal);
      const result = view.getBigUint64(offset);
      const test: SharedOffsetReadTest = {
        view,
        buffer,
        offset,
        testVal
      };
      expect(result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView3Test066
     * @tc.number SUB_BUILTINS_DataView3_TEST_6600
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1n;
      view.setBigUint64(0, testVal, true);
      const result = view.getBigUint64(0, true);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test067
     * @tc.number SUB_BUILTINS_DataView3_TEST_6700
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer, 0, 16);
      const offset = 8;
      const testVal = 0x1122334455667788n;
      view.setBigUint64(offset, testVal);
      const result = view.getBigUint64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test068
     * @tc.number SUB_BUILTINS_DataView3_TEST_6800
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 80n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result >> 2n).assertEqual(20n);
    });

    /**
     * @tc.name   DataView3Test069
     * @tc.number SUB_BUILTINS_DataView3_TEST_6900
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 123456789n;
      view.setBigUint64(0, testVal, true);
      const result = view.getBigUint64(0, true);
      expect(result.toString()).assertEqual("123456789");
    });

    /**
     * @tc.name   DataView3Test070
     * @tc.number SUB_BUILTINS_DataView3_TEST_7000
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(14);
      const offset = 4;
      const testVal = 123456789012345n;
      const view = new DataView(buffer);
      view.setBigUint64(offset, testVal);
      const result = view.getBigUint64(offset);
      const test: Offset4BigEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView3Test071
     * @tc.number SUB_BUILTINS_DataView3_TEST_7100
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 9007199254740991n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(Number(result)).assertEqual(9007199254740991);
    });

    /**
     * @tc.name   DataView3Test072
     * @tc.number SUB_BUILTINS_DataView3_TEST_7200
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0x9876543210FEDCBA98n;
      view.setBigUint64(0, testVal, true);
      const result = view.getBigUint64(0, true);
      expect(result.toString()).assertEqual("8526495043095935640");
    });

    /**
     * @tc.name   DataView3Test073
     * @tc.number SUB_BUILTINS_DataView3_TEST_7300
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(13);
      const view = new DataView(buffer);
      const offset = 5;
      const testVal = 0xABCDEF1234567890n;
      view.setBigUint64(offset, testVal);
      const result = view.getBigUint64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test074
     * @tc.number SUB_BUILTINS_DataView3_TEST_7400
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal1 = 0b1010n;
      const testVal2 = 0b1100n;
      const xorResult = 0b0110n;
      const view = new DataView(buffer);
      view.setBigUint64(0, testVal1);
      const result1 = view.getBigUint64(0);
      view.setBigUint64(0, testVal2);
      const result2 = view.getBigUint64(0);
      const test: BigEndianXorTest = {
        view,
        testVal1,
        testVal2,
        xorResult
      };
      expect(result1 ^ result2).assertEqual(test.xorResult);
    });

    /**
     * @tc.name   DataView3Test075
     * @tc.number SUB_BUILTINS_DataView3_TEST_7500
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal1 = 0b1111n;
      const testVal2 = 0b1010n;
      view.setBigUint64(0, testVal1);
      const result1 = view.getBigUint64(0);
      view.setBigUint64(0, testVal2);
      const result2 = view.getBigUint64(0);
      expect(result1 & result2).assertEqual(0b1010n);
    });

    /**
     * @tc.name   DataView3Test076
     * @tc.number SUB_BUILTINS_DataView3_TEST_7600
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(8);
      const buffer2 = new ArrayBuffer(8);
      const val1 = 111n;
      const val2 = 222n;
      const view1 = new DataView(buffer1);
      const view2 = new DataView(buffer2);
      view1.setBigUint64(0, val1);
      view2.setBigUint64(0, val2);
      const result1 = view1.getBigUint64(0);
      const result2 = view2.getBigUint64(0);
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
     * @tc.name   DataView3Test077
     * @tc.number SUB_BUILTINS_DataView3_TEST_7700
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 0, 8);
      const testVal = 1n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test078
     * @tc.number SUB_BUILTINS_DataView3_TEST_7800
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal1 = 0b1000n;
      const testVal2 = 0b0010n;
      view.setBigUint64(0, testVal1, true);
      const result1 = view.getBigUint64(0, true);
      view.setBigUint64(0, testVal2, true);
      const result2 = view.getBigUint64(0, true);
      expect(result1 | result2).assertEqual(0b1010n);
    });

    /**
     * @tc.name   DataView3Test079
     * @tc.number SUB_BUILTINS_DataView3_TEST_7900
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 9007199254740991n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(Number(result)).assertEqual(9007199254740991);
    });

    /**
     * @tc.name   DataView3Test080
     * @tc.number SUB_BUILTINS_DataView3_TEST_8000
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result | 0b1111n).assertEqual(0b1111n);
    });

    /**
     * @tc.name   DataView3Test081
     * @tc.number SUB_BUILTINS_DataView3_TEST_8100
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const offset = 8;
      const testVal = 1234567890123456789n;
      const view = new DataView(buffer);
      view.setBigUint64(offset, testVal, true);
      const result = view.getBigUint64(offset, true);
      const test: Offset8LittleEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView3Test082
     * @tc.number SUB_BUILTINS_DataView3_TEST_8200
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0x1234n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result << 16n).assertEqual(0x12340000n);
    });

    /**
     * @tc.name   DataView3Test083
     * @tc.number SUB_BUILTINS_DataView3_TEST_8300
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(9);
      const view = new DataView(buffer);
      const offset = 1;
      const testVal = 0xABCDEF1234567890n;
      view.setBigUint64(offset, testVal);
      const result = view.getBigUint64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test084
     * @tc.number SUB_BUILTINS_DataView3_TEST_8400
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal = 0x1234n;
      const view = new DataView(buffer);
      view.setBigUint64(0, testVal);
      const bigResult = view.getBigUint64(0);
      view.setBigUint64(0, testVal, true);
      const littleResult = view.getBigUint64(0, true);
      const test: BigToLittleBitTest = {
        view,
        testVal,
        bigBits: bigResult.toString(2).padStart(64, '0'),
        littleBits: littleResult.toString(2).padStart(64, '0')
      };
      expect(test.bigBits !== test.littleBits).assertEqual(false);
    });

    /**
     * @tc.name   DataView3Test085
     * @tc.number SUB_BUILTINS_DataView3_TEST_8500
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 9007199254740991n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result).assertEqual(9007199254740991n);
    });

    /**
     * @tc.name   DataView3Test086
     * @tc.number SUB_BUILTINS_DataView3_TEST_8600
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const offset1 = 0;
      const offset2 = 0;
      const val1 = 0x1111n;
      const val2 = 0x2222n;
      const view1 = new DataView(buffer, 0, 8);
      const view2 = new DataView(buffer, 4, 8);
      view1.setBigUint64(offset1, val1);
      view2.setBigUint64(offset2, val2);
      const result1 = view1.getBigUint64(offset1);
      const result2 = view2.getBigUint64(offset2);
      expect(result1.toString()).assertEqual("0");
      expect(result2.toString()).assertEqual("8738");
    });

    /**
     * @tc.name   DataView3Test087
     * @tc.number SUB_BUILTINS_DataView3_TEST_8700
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const view = new DataView(buffer);
      const offset = 4;
      const testVal = 0x876543210FEDCBA9n;
      view.setBigUint64(offset, testVal);
      const result = view.getBigUint64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test088
     * @tc.number SUB_BUILTINS_DataView3_TEST_8800
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0x12345678n;
      view.setBigUint64(0, testVal, true);
      const result = view.getBigUint64(0, true);
      expect(result >> 8n).assertEqual(0x123456n);
    });

    /**
     * @tc.name   DataView3Test089
     * @tc.number SUB_BUILTINS_DataView3_TEST_8900
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 63n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result.toString(8)).assertEqual("77");
    });

    /**
     * @tc.name   DataView3Test090
     * @tc.number SUB_BUILTINS_DataView3_TEST_9000
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(14);
      const offset = 6;
      const testVal = 98765432101234n;
      const view = new DataView(buffer);
      view.setBigUint64(offset, testVal);
      const result = view.getBigUint64(offset);
      const test: Offset6BigEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });
    /**
     * @tc.name   DataView3Test091
     * @tc.number SUB_BUILTINS_DataView3_TEST_9100
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 9007199254740993n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(typeof result === "bigint").assertEqual(true);
    });

    /**
     * @tc.name   DataView3Test092
     * @tc.number SUB_BUILTINS_DataView3_TEST_9200
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0x11223344n;
      view.setBigUint64(0, testVal, true);
      const bigResult = view.getBigUint64(0);
      expect(bigResult.toString()).assertEqual("4914309074801131520");
    });

    /**
     * @tc.name   DataView3Test093
     * @tc.number SUB_BUILTINS_DataView3_TEST_9300
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer);
      const offset = 2;
      const testVal = 0xABCDEF1234567890n;
      view.setBigUint64(offset, testVal);
      const result = view.getBigUint64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test094
     * @tc.number SUB_BUILTINS_DataView3_TEST_9400
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal = 0x12345678n;
      const fullOne = 0xFFFFFFFFFFFFFFFFn;
      const view = new DataView(buffer);
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      const test: BigEndianFullXorTest = {
        view,
        testVal,
        fullOne,
        xorResult: result ^ fullOne
      };
      expect(test.xorResult).assertEqual(fullOne - test.testVal);
    });

    /**
     * @tc.name   DataView3Test095
     * @tc.number SUB_BUILTINS_DataView3_TEST_9500
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0x12345678n;
      const fullOne = 0xFFFFFFFFn;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result & fullOne).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test096
     * @tc.number SUB_BUILTINS_DataView3_TEST_9600
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new SharedArrayBuffer(16);
      const offset1 = 0;
      const offset2 = 8;
      const val1 = 0x1111n;
      const val2 = 0x2222n;
      const view = new DataView(buffer);
      view.setBigUint64(offset1, val1);
      view.setBigUint64(offset2, val2);
      const result1 = view.getBigUint64(offset1);
      const result2 = view.getBigUint64(offset2);
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
     * @tc.name   DataView3Test097
     * @tc.number SUB_BUILTINS_DataView3_TEST_9700
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 0, 8);
      const testVal = 0n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test098
     * @tc.number SUB_BUILTINS_DataView3_TEST_9800
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal1 = 0b1010n;
      const testVal2 = 0b1100n;
      view.setBigUint64(0, testVal1, true);
      const result1 = view.getBigUint64(0, true);
      view.setBigUint64(0, testVal2, true);
      const result2 = view.getBigUint64(0, true);
      expect(result1 ^ result2).assertEqual(0b0110n);
    });

    /**
     * @tc.name   DataView3Test099
     * @tc.number SUB_BUILTINS_DataView3_TEST_9900
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 123456n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result.toString(36)).assertEqual("2n9c");
    });

    /**
     * @tc.name   DataView3Test100
     * @tc.number SUB_BUILTINS_DataView3_TEST_10000
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(11);
      const offset = 3;
      const testVal = 1234567890123456n;
      const view = new DataView(buffer);
      view.setBigUint64(offset, testVal, true);
      const result = view.getBigUint64(offset, true);
      const test: Offset3LittleEndianLargeTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView3Test101
     * @tc.number SUB_BUILTINS_DataView3_TEST_10100
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 123n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      const temp = result;
      expect(temp).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test102
     * @tc.number SUB_BUILTINS_DataView3_TEST_10200
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0n;
      view.setBigUint64(0, testVal, true);
      const bigResult = view.getBigUint64(0);
      expect(bigResult).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test103
     * @tc.number SUB_BUILTINS_DataView3_TEST_10300
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(13);
      const view = new DataView(buffer);
      const offset = 5;
      const testVal = 0x1234567890ABCDEFn;
      view.setBigUint64(offset, testVal);
      const result = view.getBigUint64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test104
     * @tc.number SUB_BUILTINS_DataView3_TEST_10400
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal1 = 0b1000n;
      const testVal2 = 0b0010n;
      const orResult = 0b1010n;
      const view = new DataView(buffer);
      view.setBigUint64(0, testVal1);
      const result1 = view.getBigUint64(0);
      view.setBigUint64(0, testVal2);
      const result2 = view.getBigUint64(0);
      const test: BigEndianOrTest = {
        view,
        testVal1,
        testVal2,
        orResult
      };
      expect(result1 | result2).assertEqual(test.orResult);
    });

    /**
     * @tc.name   DataView3Test105
     * @tc.number SUB_BUILTINS_DataView3_TEST_10500
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0x12345678n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result >> 16n).assertEqual(0x1234n);
    });

    /**
     * @tc.name   DataView3Test106
     * @tc.number SUB_BUILTINS_DataView3_TEST_10600
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(8);
      const buffer2 = new ArrayBuffer(8);
      const val1 = 0xAAAAn;
      const val2 = 0xBBBBn;
      const view1 = new DataView(buffer1);
      const view2 = new DataView(buffer2);
      view1.setBigUint64(0, val1);
      view2.setBigUint64(0, val2);
      const result1 = view1.getBigUint64(0);
      const result2 = view2.getBigUint64(0);
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
     * @tc.name   DataView3Test107
     * @tc.number SUB_BUILTINS_DataView3_TEST_10700
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer, 0, 16);
      const maxVal = 18446744073709551615n;
      view.setBigUint64(0, maxVal);
      const result = view.getBigUint64(0);
      expect(result).assertEqual(maxVal);
    });

    /**
     * @tc.name   DataView3Test108
     * @tc.number SUB_BUILTINS_DataView3_TEST_10800
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0x12n;
      view.setBigUint64(0, testVal, true);
      const result = view.getBigUint64(0, true);
      expect(result << 4n).assertEqual(0x120n);
    });

    /**
     * @tc.name   DataView3Test109
     * @tc.number SUB_BUILTINS_DataView3_TEST_10900
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0x1234n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      const hex = result.toString(16).toUpperCase().padStart(16, '0');
      expect(hex).assertEqual("0000000000001234");
    });

    /**
     * @tc.name   DataView3Test110
     * @tc.number SUB_BUILTINS_DataView3_TEST_11000
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(18);
      const offset = 10;
      const testVal = 12345678901234567890n;
      const view = new DataView(buffer);
      view.setBigUint64(offset, testVal, true);
      const result = view.getBigUint64(offset, true);
      const test: Offset10LittleEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView3Test111
     * @tc.number SUB_BUILTINS_DataView3_TEST_11100
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer);
      const offset = 2;
      const testVal = 18446744073709551615n;
      view.setBigUint64(offset, testVal);
      const result = view.getBigUint64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test112
     * @tc.number SUB_BUILTINS_DataView3_TEST_11200
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const zero = 0n;
      const view = new DataView(buffer);
      view.setBigUint64(0, zero);
      const bigResult = view.getBigUint64(0);
      view.setBigUint64(0, zero, true);
      const littleResult = view.getBigUint64(0, true);
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
     * @tc.name   DataView3Test113
     * @tc.number SUB_BUILTINS_DataView3_TEST_11300
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 9007199254740990n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result < 9007199254740991n).assertEqual(true);
    });

    /**
     * @tc.name   DataView3Test114
     * @tc.number SUB_BUILTINS_DataView3_TEST_11400
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const offset = 4;
      const testVal = 888888888888888888n;
      const view1 = new DataView(buffer, 0, 12);
      const view3 = new DataView(buffer, 4, 12);
      view1.setBigUint64(offset, testVal);
      const result = view3.getBigUint64(offset);
      expect(result.toString()).assertEqual("2523016587426922496");
    });

    /**
     * @tc.name   DataView3Test115
     * @tc.number SUB_BUILTINS_DataView3_TEST_11500
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(15);
      const view = new DataView(buffer);
      const offset = 7;
      const testVal = 0x1234567890ABCDEFn;
      view.setBigUint64(offset, testVal);
      const result = view.getBigUint64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test116
     * @tc.number SUB_BUILTINS_DataView3_TEST_11600
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 18446744073709551614n;
      view.setBigUint64(0, testVal, true);
      const result = view.getBigUint64(0, true);
      expect(result + 1n).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.name   DataView3Test117
     * @tc.number SUB_BUILTINS_DataView3_TEST_11700
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(13);
      const offset = 5;
      const testVal = 9876543210123456n;
      const view = new DataView(buffer);
      view.setBigUint64(offset, testVal, true);
      const result = view.getBigUint64(offset, true);
      const test: Offset5LittleEndianPosTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView3Test118
     * @tc.number SUB_BUILTINS_DataView3_TEST_11800
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 18446744073709551614n;
      view.setBigUint64(0, testVal, true);
      const bigResult = view.getBigUint64(0);
      expect(bigResult).assertEqual(0xFEFFFFFFFFFFFFFFn);
    });

    /**
     * @tc.name   DataView3Test119
     * @tc.number SUB_BUILTINS_DataView3_TEST_11900
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(11);
      const view = new DataView(buffer);
      const offset = 3;
      const testVal = 0x876543210FEDCBA9n;
      view.setBigUint64(offset, testVal);
      const result = view.getBigUint64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test120
     * @tc.number SUB_BUILTINS_DataView3_TEST_12000
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal = 18446744073709551615n;
      const subtrahend = 100n;
      const difference = 18446744073709550615n;
      const view = new DataView(buffer);
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      const test: BigEndianLargeSubTest = {
        view,
        testVal,
        subtrahend,
        difference
      };
      expect((result - test.subtrahend).toString()).assertEqual("18446744073709551515");
    });
    /**
     * @tc.name   DataView3Test121
     * @tc.number SUB_BUILTINS_DataView3_TEST_12100
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 9223372036854775807n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result * 2n).assertEqual(18446744073709551614n);
    });

    /**
     * @tc.name   DataView3Test122
     * @tc.number SUB_BUILTINS_DataView3_TEST_12200
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 18446744073709551615n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result % 100n).assertEqual(15n);
    });

    /**
     * @tc.name   DataView3Test123
     * @tc.number SUB_BUILTINS_DataView3_TEST_12300
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 0, 8);
      const maxVal = 18446744073709551615n;
      view.setBigUint64(0, maxVal);
      const result = view.getBigUint64(0);
      expect(result).assertEqual(maxVal);
    });

    /**
     * @tc.name   DataView3Test124
     * @tc.number SUB_BUILTINS_DataView3_TEST_12400
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 18446744073709551614n;
      view.setBigUint64(0, testVal, true);
      const result = view.getBigUint64(0, true);
      expect(result / 2n).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.name   DataView3Test125
     * @tc.number SUB_BUILTINS_DataView3_TEST_12500
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(14);
      const offset = 6;
      const testVal = 1234567890123456n;
      const view = new DataView(buffer);
      view.setBigUint64(offset, testVal);
      const result = view.getBigUint64(offset);
      const test: Offset6BigEndianPosTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView3Test126
     * @tc.number SUB_BUILTINS_DataView3_TEST_12600
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 9007199254740993n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(Number(result)).assertEqual(9007199254740992);
    });

    /**
     * @tc.name   DataView3Test127
     * @tc.number SUB_BUILTINS_DataView3_TEST_12700
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0x123456789ABCDEFn;
      view.setBigUint64(0, testVal, true);
      const bigResult = view.getBigUint64(0, true);
      expect(bigResult).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test128
     * @tc.number SUB_BUILTINS_DataView3_TEST_12800
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const view = new DataView(buffer);
      const offset = 4;
      const testVal = -0xABCDEF123456789n;
      view.setBigUint64(offset, BigInt(Math.abs(Number(testVal))));
      const result = view.getBigUint64(offset);
      expect(result.toString()).assertEqual("773738363261118336");
    });

    /**
     * @tc.name   DataView3Test129
     * @tc.number SUB_BUILTINS_DataView3_TEST_12900
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 18446744073709551615n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result % 1000n).assertEqual(615n);
    });

    /**
     * @tc.name   DataView3Test130
     * @tc.number SUB_BUILTINS_DataView3_TEST_13000
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer, 0, 16);
      const offset = 8;
      const maxVal = 18446744073709551615n;
      view.setBigUint64(offset, maxVal);
      const result = view.getBigUint64(offset);
      expect(result).assertEqual(maxVal);
    });

    /**
     * @tc.name   DataView3Test131
     * @tc.number SUB_BUILTINS_DataView3_TEST_13100
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 987654321n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      const base36 = result.toString(36).padStart(8, '0');
      expect(base36).assertEqual("00gc0uy9");
    });

    /**
     * @tc.name   DataView3Test132
     * @tc.number SUB_BUILTINS_DataView3_TEST_13200
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(20);
      const offset = 12;
      const testVal = 12345678901234567890n;
      const view = new DataView(buffer);
      view.setBigUint64(offset, testVal, true);
      const result = view.getBigUint64(offset, true);
      const test: Offset12LittleEndianTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView3Test133
     * @tc.number SUB_BUILTINS_DataView3_TEST_13300
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(9);
      const view = new DataView(buffer);
      const offset = 1;
      const testVal = 18446744073709551615n;
      view.setBigUint64(offset, testVal);
      const result = view.getBigUint64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test134
     * @tc.number SUB_BUILTINS_DataView3_TEST_13400
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const one = 1n;
      const view = new DataView(buffer);
      view.setBigUint64(0, one);
      const bigResult = view.getBigUint64(0);
      view.setBigUint64(0, one, true);
      const littleResult = view.getBigUint64(0, true);
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
     * @tc.name   DataView3Test135
     * @tc.number SUB_BUILTINS_DataView3_TEST_13500
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result === testVal).assertEqual(true);
    });

    /**
     * @tc.name   DataView3Test136
     * @tc.number SUB_BUILTINS_DataView3_TEST_13600
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const offset = 2;
      const val1 = 0x1111n;
      const val2 = 0x2222n;
      const view1 = new DataView(buffer, 0, 10);
      const view2 = new DataView(buffer, 1, 11);
      view1.setBigUint64(offset, val1);
      view2.setBigUint64(offset, val2);
      const result = view1.getBigUint64(offset);
      expect(result.toString()).assertEqual("34");
    });

    /**
     * @tc.name   DataView3Test137
     * @tc.number SUB_BUILTINS_DataView3_TEST_13700
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const view = new DataView(buffer);
      const offset = 4;
      const testVal = 1n;
      view.setBigUint64(offset, testVal);
      const result = view.getBigUint64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test138
     * @tc.number SUB_BUILTINS_DataView3_TEST_13800
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 18446744073709551614n;
      view.setBigUint64(0, testVal, true);
      const result = view.getBigUint64(0, true);
      expect(result + 1n).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.name   DataView3Test139
     * @tc.number SUB_BUILTINS_DataView3_TEST_13900
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 255n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      const base8 = result.toString(8).padStart(10, '0');
      expect(base8).assertEqual("0000000377");
    });

    /**
     * @tc.name   DataView3Test140
     * @tc.number SUB_BUILTINS_DataView3_TEST_14000
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 123n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(typeof result === "bigint").assertEqual(true);
    });

    /**
     * @tc.name   DataView3Test141
     * @tc.number SUB_BUILTINS_DataView3_TEST_14100
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 0n;
      view.setBigUint64(0, testVal, true);
      const bigResult = view.getBigUint64(0);
      expect(bigResult).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test142
     * @tc.number SUB_BUILTINS_DataView3_TEST_14200
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(11);
      const view = new DataView(buffer);
      const offset = 3;
      const testVal = 0n;
      view.setBigUint64(offset, testVal);
      const result = view.getBigUint64(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test143
     * @tc.number SUB_BUILTINS_DataView3_TEST_14300
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 9223372036854775807n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result * 2n).assertEqual(18446744073709551614n);
    });

    /**
     * @tc.name   DataView3Test144
     * @tc.number SUB_BUILTINS_DataView3_TEST_14400
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new SharedArrayBuffer(16);
      const offset = 4;
      const testVal = 543210987654321n;
      const view1 = new DataView(buffer);
      const view2 = new DataView(buffer);
      view1.setBigUint64(offset, testVal);
      const result = view2.getBigUint64(offset);
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
     * @tc.name   DataView3Test145
     * @tc.number SUB_BUILTINS_DataView3_TEST_14500
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 0, 8);
      const testVal = 1n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView3Test146
     * @tc.number SUB_BUILTINS_DataView3_TEST_14600
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 18446744073709551614n;
      view.setBigUint64(0, testVal, true);
      const result = view.getBigUint64(0, true);
      expect(result / 2n).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.name   DataView3Test147
     * @tc.number SUB_BUILTINS_DataView3_TEST_14700
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(13);
      const offset = 5;
      const testVal = 9876543210123n;
      const view = new DataView(buffer);
      view.setBigUint64(offset, testVal);
      const result = view.getBigUint64(offset);
      const test: Offset5BigEndianLargeTest = {
        view,
        offset,
        testVal,
        result
      };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView3Test148
     * @tc.number SUB_BUILTINS_DataView3_TEST_14800
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 9007199254740991n;
      view.setBigUint64(0, testVal);
      const result = view.getBigUint64(0);
      expect(Number(result) === 9007199254740991).assertEqual(true);
    });

    /**
     * @tc.name   DataView3Test149
     * @tc.number SUB_BUILTINS_DataView3_TEST_14900
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const testVal = 1n;
      view.setBigUint64(0, testVal, true);
      const bigResult = view.getBigUint64(0);
      expect(bigResult.toString()).assertEqual("72057594037927936");
    });

    /**
     * @tc.name   DataView3Test150
     * @tc.number SUB_BUILTINS_DataView3_TEST_15000
     * @tc.desc   test DataView getBigUint64()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView3Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer);
      const offset = 2;
      const testVal = 1n;
      view.setBigUint64(offset, testVal);
      const result = view.getBigUint64(offset);
      expect(result).assertEqual(testVal);
    });

  })
}

