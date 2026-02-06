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


interface OffsetLengthTest {
  view: DataView;
  length: number;
  offset: number;
}

interface SharedBufferTest {
  view1: DataView;
  view2: DataView;
}


interface WriteReadTest {
  view: DataView;
  writeVal: number;
  readVal: number;
}

interface SyncTest {
  view1: DataView;
  view2: DataView;
  syncVal: number;
}

interface IsolationTest {
  view1: DataView;
  view2: DataView;
  val1: number;
  val2: number;
}

interface EndianTest {
  view: DataView;
  value: number;
}

interface SharedBufferConstructorTest {
  view: DataView;
  bufferType: string;
}

interface OffsetBufferSyncTest {
  view: DataView;
  rawBufferView: DataView;
  testVal: number;
}

interface Float32WriteReadTest {
  view: DataView;
  floatVal: number;
}

interface BigInt64Test {
  view: DataView;
  bigIntVal: bigint;
}

interface MultiOffsetReadTest {
  view1: DataView;
  view2: DataView;
  val1: number;
  val2: number;
}

interface BigUint64Test {
  view: DataView;
  bigUintVal: bigint;
}

interface Float16WriteReadTest {
  view: DataView;
  floatVal: number;
}

interface CrossLengthReadTest {
  baseView: DataView;
  shortView: DataView;
  testVal: number;
}

interface ParallelWriteTest {
  viewA: DataView;
  viewB: DataView;
  valA: number;
  valB: number;
}

interface EndianInt16Test {
  view: DataView;
  value: number;
  bigEndianResult: number;
  littleEndianResult: number;
}

interface NestedOffsetTest {
  buffer: ArrayBuffer;
  view1: DataView;
  view2: DataView;
  testVal: number;
}

interface Float16BoundaryTest {
  view: DataView;
  minValue: number;
  maxValue: number;
}

interface SharedBufferCompatTest {
  view: DataView;
  isSharedBuffer: boolean;
}

interface OverlappingViewsTest {
  view1: DataView;
  view2: DataView;
  val1: number;
  val2: number;
}

interface Float64InfinityTest {
  view: DataView;
  positiveInf: number;
  negativeInf: number;
}

interface MixedTypeTest {
  view: DataView;
  intVal: number;
  floatVal: number;
  uintVal: number;
}

interface SplitReadTest {
  view16: DataView;
  view8: DataView;
  value: number;
  highByte: number;
  lowByte: number;
}

interface BigIntSplitReadTest {
  view64: DataView;
  view32: DataView;
  bigIntVal: bigint;
  high32: number;
  low32: number;
}

interface MixedTypeNoConflictTest {
  viewInt: DataView;
  viewFloat: DataView;
  viewUint: DataView;
  intVal: number;
  floatVal: number;
  uintVal: number;
}

interface SharedBufferWriteTest {
  view1: DataView;
  view2: DataView;
  sharedBuffer: SharedArrayBuffer;
  testVal: number;
}

interface NestedViewTest {
  baseView: DataView;
  nestedView: DataView;
  testVal: number;
}

interface LastWriteWinsTest {
  view1: DataView;
  view2: DataView;
  view3: DataView;
  val1: number;
  val2: number;
  val3: number;
}

interface MixedViewTypeTest {
  dataView: DataView;
  uint8Array: Uint8Array;
  testVal: number;
}

interface ContinuousViewsTest {
  view1: DataView;
  view2: DataView;
  val1: number;
  val2: number;
}

interface CrossOffsetReadTest {
  baseView: DataView;
  offsetView: DataView;
  testVal: number;
}

interface SequentialWriteTest {
  view: DataView;
  int8Val: number;
  uint16Val: number;
  float32Val: number;
}

interface FullBufferValidationTest {
  view: DataView;
  buffer: ArrayBuffer;
  values: number[];
}

interface MultiOffsetWriteTest {
  view1: DataView;
  view2: DataView;
  view3: DataView;
  val1: number;
  val2: number;
  val3: number;
}

interface Int16SplitReadTest {
  view16: DataView;
  view8: DataView;
  value: number;
  highByte: number;
  lowByte: number;
}

interface BufferIsolationTest {
  view1: DataView;
  view2: DataView;
  val1: number;
  val2: number;
}

interface OverlappingWriteTest {
  viewA: DataView;
  viewB: DataView;
  valA: number;
  valB: number;
}

interface Int32ToUint32Test {
  view: DataView;
  intVal: number;
  uintVal: number;
}

interface MixedTypeCrossWriteTest {
  view: DataView;
  uint8Val: number;
  int32Val: number;
  float64Val: number;
}

interface Float32PrecisionTest {
  view: DataView;
  originalVal: number;
  tolerance: number;
}

interface Uint16ToFloat32Test {
  view: DataView;
  uintVal: number;
  floatVal: number;
}

interface SeparateBufferTest {
  view1: DataView;
  view2: DataView;
  val1: number;
  val2: number;
}

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function DataView1Test() {
  describe('DataView1Test', () => {
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
     * @tc.name   DataView1Test001
     * @tc.number SUB_BUILTINS_DataView1_TEST_0100
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      expect(view.buffer.byteLength).assertEqual(8);
    });
    /**
     * @tc.name   DataView1Test002
     * @tc.number SUB_BUILTINS_DataView1_TEST_0200
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer, 3);
      expect(view.byteOffset).assertEqual(3);
    });
    /**
     * @tc.name   DataView1Test003
     * @tc.number SUB_BUILTINS_DataView1_TEST_0300
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer, 4, 6);
      const test: OffsetLengthTest = { view, length: view.byteLength, offset: view.byteOffset };
      expect(test.length).assertEqual(6);
      expect(test.offset).assertEqual(4);
    });

    /**
     * @tc.name   DataView1Test004
     * @tc.number SUB_BUILTINS_DataView1_TEST_0400
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const offset = 3;
      const view = new DataView(buffer, offset);
      expect(view.byteLength).assertEqual(10 - offset);
    });

    /**
     * @tc.name   DataView1Test005
     * @tc.number SUB_BUILTINS_DataView1_TEST_0500
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const view = new DataView(buffer, 0);
      expect(view.byteLength).assertEqual(buffer.byteLength);
    });

    /**
     * @tc.name   DataView1Test006
     * @tc.number SUB_BUILTINS_DataView1_TEST_0600
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const test: SharedBufferTest = {
        view1: new DataView(buffer),
        view2: new DataView(buffer)
      };
      expect(test.view1.buffer).assertEqual(test.view2.buffer);
    });

    /**
     * @tc.name   DataView1Test007
     * @tc.number SUB_BUILTINS_DataView1_TEST_0700
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(5);
      const view = new DataView(buffer, 5);
      expect(view.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   DataView1Test008
     * @tc.number SUB_BUILTINS_DataView1_TEST_0800
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 2, 4);
      const writeVal = 123;
      view.setInt16(0, writeVal);
      const test: WriteReadTest = { view, writeVal, readVal: view.getInt16(0) };
      expect(test.readVal).assertEqual(test.writeVal);
    });

    /**
     * @tc.name   DataView1Test009
     * @tc.number SUB_BUILTINS_DataView1_TEST_0900
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        new DataView(new ArrayBuffer(6), 7);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
        expect(error.message).assertContain("offset > bufferByteLength");
      }
    });

    /**
     * @tc.name   DataView1Test010
     * @tc.number SUB_BUILTINS_DataView1_TEST_1000
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        new DataView(new ArrayBuffer(10), 6, 5);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
        expect(error.message).assertContain("offset + viewByteLen > bufByteLen");
      }
    });

    /**
     * @tc.name   DataView1Test011
     * @tc.number SUB_BUILTINS_DataView1_TEST_1100
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 4, 0);
      expect(view.buffer instanceof ArrayBuffer).assertEqual(true);
    });

    /**
     * @tc.name   DataView1Test012
     * @tc.number SUB_BUILTINS_DataView1_TEST_1200
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const syncVal = 456;
      const test: SyncTest = {
        view1: new DataView(buffer),
        view2: new DataView(buffer),
        syncVal
      };
      test.view1.setInt32(0, syncVal);
      expect(test.view2.getInt32(0)).assertEqual(syncVal);
    });

    /**
     * @tc.name   DataView1Test013
     * @tc.number SUB_BUILTINS_DataView1_TEST_1300
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer, 0, 10);
      expect(view.byteLength).assertEqual(buffer.byteLength);
    });

    /**
     * @tc.name   DataView1Test014
     * @tc.number SUB_BUILTINS_DataView1_TEST_1400
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      view.setUint8(0, 10);
      view.setUint8(0, 20);
      expect(view.getUint8(0)).assertEqual(20);
    });

    /**
     * @tc.name   DataView1Test015
     * @tc.number SUB_BUILTINS_DataView1_TEST_1500
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(6);
      const view = new DataView(buffer);
      expect(view.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   DataView1Test016
     * @tc.number SUB_BUILTINS_DataView1_TEST_1600
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      expect(view.constructor).assertEqual(DataView);
    });

    /**
     * @tc.name   DataView1Test017
     * @tc.number SUB_BUILTINS_DataView1_TEST_1700
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(5);
      const view = new DataView(buffer, 2, 1);
      view.setUint8(0, 255);
      expect(view.getUint8(0)).assertEqual(255);
    });

    /**
     * @tc.name   DataView1Test018
     * @tc.number SUB_BUILTINS_DataView1_TEST_1800
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        new DataView(new ArrayBuffer(8), 2, -3);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
        expect(error.message).assertContain("integerIndex < 0 or integerIndex > SAFE_NUMBER");
      }
    });

    /**
     * @tc.name   DataView1Test019
     * @tc.number SUB_BUILTINS_DataView1_TEST_1900
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const val1 = 11;
      const val2 = 22;
      const test: IsolationTest = {
        view1: new DataView(buffer, 0, 3),
        view2: new DataView(buffer, 3, 3),
        val1,
        val2
      };
      test.view1.setInt8(0, val1);
      test.view2.setInt8(0, val2);
      expect(test.view1.getInt8(0)).assertEqual(val1);
      expect(test.view2.getInt8(0)).assertEqual(val2);
    });

    /**
     * @tc.name   DataView1Test020
     * @tc.number SUB_BUILTINS_DataView1_TEST_2000
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(0);
      const view = new DataView(buffer);
      expect(view.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   DataView1Test021
     * @tc.number SUB_BUILTINS_DataView1_TEST_2100
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer, 3.9);
      expect(view.byteOffset).assertEqual(3);
    });

    /**
     * @tc.name   DataView1Test022
     * @tc.number SUB_BUILTINS_DataView1_TEST_2200
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const value = 0x12345678;
      const test: EndianTest = { view: new DataView(buffer), value };
      test.view.setUint32(0, value);
      expect(test.view.getUint32(0)).assertEqual(value);
    });

    /**
     * @tc.name   DataView1Test023
     * @tc.number SUB_BUILTINS_DataView1_TEST_2300
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const value = 0x12345678;
      const view = new DataView(buffer);
      view.setUint32(0, value, true);
      expect(view.getUint32(0, true)).assertEqual(value);
    });

    /**
     * @tc.name   DataView1Test024
     * @tc.number SUB_BUILTINS_DataView1_TEST_2400
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new SharedArrayBuffer(8);
      const view = new DataView(buffer);
      const test: SharedBufferConstructorTest = {
        view,
        bufferType: view.buffer.constructor.name
      };
      expect(test.bufferType).assertEqual("SharedArrayBuffer");
    });

    /**
     * @tc.name   DataView1Test025
     * @tc.number SUB_BUILTINS_DataView1_TEST_2500
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer, 0, 5);
      view.setUint8(0, 0xFF);
      expect(view.getUint8(0)).assertEqual(0xFF);
    });

    /**
     * @tc.name   DataView1Test026
     * @tc.number SUB_BUILTINS_DataView1_TEST_2600
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal = 0x12;
      const test: OffsetBufferSyncTest = {
        view: new DataView(buffer, 2),
        rawBufferView: new DataView(buffer),
        testVal
      };
      test.view.setUint8(0, testVal);
      expect(test.rawBufferView.getUint8(2)).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView1Test027
     * @tc.number SUB_BUILTINS_DataView1_TEST_2700
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer, 0, 8);
      expect(view.byteLength).assertEqual(8);
    });

    /**
     * @tc.name   DataView1Test028
     * @tc.number SUB_BUILTINS_DataView1_TEST_2800
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(5);
      const view = new DataView(buffer, 0, 0);
      expect(view.byteLength).assertEqual(0);
      expect(view.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   DataView1Test029
     * @tc.number SUB_BUILTINS_DataView1_TEST_2900
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const floatVal = 3.14;
      const test: Float32WriteReadTest = {
        view: new DataView(buffer),
        floatVal
      };
      test.view.setFloat32(0, floatVal);
      expect(test.view.getFloat32(0)).assertClose(floatVal, 1);
    });

    /**
     * @tc.name   DataView1Test030
     * @tc.number SUB_BUILTINS_DataView1_TEST_3000
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view1 = new DataView(buffer, 0, 4);
      const view2 = new DataView(buffer, 0, 4);
      view1.setInt16(0, 100);
      view2.setInt16(0, 200);
      expect(view1.getInt16(0)).assertEqual(200);
    });
    /**
     * @tc.name   DataView1Test031
     * @tc.number SUB_BUILTINS_DataView1_TEST_3100
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer, 5);
      view.setUint8(0, 0xAB);
      expect(view.getUint8(0)).assertEqual(0xAB);
    });

    /**
     * @tc.name   DataView1Test032
     * @tc.number SUB_BUILTINS_DataView1_TEST_3200
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const bigIntVal = 9223372036854775807n;
      const test: BigInt64Test = {
        view: new DataView(buffer),
        bigIntVal
      };
      test.view.setBigInt64(0, bigIntVal);
      expect(test.view.getBigInt64(0)).assertEqual(bigIntVal);
    });

    /**
     * @tc.name   DataView1Test033
     * @tc.number SUB_BUILTINS_DataView1_TEST_3300
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer, 1, 1);
      view.setInt8(0, 128);
      expect(view.getInt8(0)).assertEqual(-128);
    });

    /**
     * @tc.name   DataView1Test034
     * @tc.number SUB_BUILTINS_DataView1_TEST_3400
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      view.setUint16(0, 0xFFFF);
      expect(view.getUint16(0)).assertEqual(0xFFFF);
    });

    /**
     * @tc.name   DataView1Test035
     * @tc.number SUB_BUILTINS_DataView1_TEST_3500
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const value = 0x12345678;
      view.setUint32(0, value);
      expect(view.getUint32(0)).assertEqual(value);
    });

    /**
     * @tc.name   DataView1Test036
     * @tc.number SUB_BUILTINS_DataView1_TEST_3600
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(6);
      const val1 = 0x01;
      const val2 = 0x02;
      const test: MultiOffsetReadTest = {
        view1: new DataView(buffer, 0, 3),
        view2: new DataView(buffer, 3, 3),
        val1,
        val2
      };
      test.view1.setUint8(0, val1);
      test.view2.setUint8(0, val2);
      expect(test.view1.getUint8(0)).assertEqual(val1);
      expect(test.view2.getUint8(0)).assertEqual(val2);
    });

    /**
     * @tc.name   DataView1Test037
     * @tc.number SUB_BUILTINS_DataView1_TEST_3700
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(3);
      const view = new DataView(buffer, 1, 1);
      view.setUint8(0, 255);
      expect(view.getUint8(0)).assertEqual(255);
    });

    /**
     * @tc.name   DataView1Test038
     * @tc.number SUB_BUILTINS_DataView1_TEST_3800
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const bigUintVal = 18446744073709551615n;
      const test: BigUint64Test = {
        view: new DataView(buffer),
        bigUintVal
      };
      test.view.setBigUint64(0, bigUintVal);
      expect(test.view.getBigUint64(0)).assertEqual(bigUintVal);
    });

    /**
     * @tc.name   DataView1Test039
     * @tc.number SUB_BUILTINS_DataView1_TEST_3900
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view1 = new DataView(buffer, 1, 3);
      const view2 = new DataView(buffer);
      view1.setUint8(0, 0xCD);
      expect(view2.getUint8(1)).assertEqual(0xCD);
    });

    /**
     * @tc.name   DataView1Test040
     * @tc.number SUB_BUILTINS_DataView1_TEST_4000
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const offset = 4;
      const view = new DataView(buffer, offset, 3);
      expect(view.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   DataView1Test041
     * @tc.number SUB_BUILTINS_DataView1_TEST_4100
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const floatVal = 1.5;
      const test: Float16WriteReadTest = {
        view: new DataView(buffer),
        floatVal
      };
      test.view.setFloat64(0, floatVal);
      expect(test.view.getFloat64(0)).assertClose(floatVal, 1);
    });

    /**
     * @tc.name   DataView1Test042
     * @tc.number SUB_BUILTINS_DataView1_TEST_4200
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(6);
      const view = new DataView(buffer, 0, 2);
      view.setUint8(0, 0x0A);
      const rawView = new DataView(buffer);
      rawView.setUint8(3, 0x0B);
      expect(view.getUint8(0)).assertEqual(0x0A);
    });

    /**
     * @tc.name   DataView1Test043
     * @tc.number SUB_BUILTINS_DataView1_TEST_4300
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(5);
      const view = new DataView(buffer, 4, 1);
      view.setUint8(0, 0x1F);
      expect(view.getUint8(0)).assertEqual(0x1F);
    });

    /**
     * @tc.name   DataView1Test044
     * @tc.number SUB_BUILTINS_DataView1_TEST_4400
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const negativeVal = -12345;
      view.setInt32(0, negativeVal);
      expect(view.getInt32(0)).assertEqual(negativeVal);
    });

    /**
     * @tc.name   DataView1Test045
     * @tc.number SUB_BUILTINS_DataView1_TEST_4500
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 0, 8);
      expect(view.byteLength).assertEqual(buffer.byteLength);
    });

    /**
     * @tc.name   DataView1Test046
     * @tc.number SUB_BUILTINS_DataView1_TEST_4600
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const testVal = 0x1234;
      const test: CrossLengthReadTest = {
        baseView: new DataView(buffer),
        shortView: new DataView(buffer, 0, 2),
        testVal
      };
      test.baseView.setUint16(0, testVal);
      expect(test.shortView.getUint16(0)).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView1Test047
     * @tc.number SUB_BUILTINS_DataView1_TEST_4700
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer, 3, 4);
      view.setInt16(0, 0xABCD);
      expect(view.getInt16(0)).assertEqual(-21555);
    });

    /**
     * @tc.name   DataView1Test048
     * @tc.number SUB_BUILTINS_DataView1_TEST_4800
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const floatVal = Math.PI;
      view.setFloat64(0, floatVal);
      expect(view.getFloat64(0)).assertClose(floatVal, 1);
    });

    /**
     * @tc.name   DataView1Test049
     * @tc.number SUB_BUILTINS_DataView1_TEST_4900
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const valA = 0x00FF;
      const valB = 0xFF00;
      const test: ParallelWriteTest = {
        viewA: new DataView(buffer, 0, 2),
        viewB: new DataView(buffer, 2, 2),
        valA,
        valB
      };
      test.viewA.setUint16(0, valA);
      test.viewB.setUint16(0, valB);
      expect(test.viewA.getUint16(0)).assertEqual(valA);
      expect(test.viewB.getUint16(0)).assertEqual(valB);
    });

    /**
     * @tc.name   DataView1Test050
     * @tc.number SUB_BUILTINS_DataView1_TEST_5000
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(6);
      const view = new DataView(buffer, 5, 1);
      view.setUint8(0, 0x7F);
      expect(view.getUint8(0)).assertEqual(0x7F);
    });

    /**
     * @tc.name   DataView1Test051
     * @tc.number SUB_BUILTINS_DataView1_TEST_5100
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const value = 0x1234;
      const test: EndianInt16Test = {
        view: new DataView(buffer),
        value,
        bigEndianResult: 0,
        littleEndianResult: 0
      };
      test.view.setInt16(0, value);
      test.bigEndianResult = test.view.getInt16(0);
      test.view.setInt16(0, value, true);
      test.littleEndianResult = test.view.getInt16(0, true);
      expect(test.bigEndianResult).assertEqual(value);
      expect(test.littleEndianResult).assertEqual(value);
    });

    /**
     * @tc.name   DataView1Test052
     * @tc.number SUB_BUILTINS_DataView1_TEST_5200
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const maxUint32 = 4294967295;
      view.setUint32(0, maxUint32);
      expect(view.getUint32(0)).assertEqual(maxUint32);
    });

    /**
     * @tc.name   DataView1Test053
     * @tc.number SUB_BUILTINS_DataView1_TEST_5300
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const testVal = 0xAB;
      const test: NestedOffsetTest = {
        buffer,
        view1: new DataView(buffer, 2, 6),
        view2: new DataView(buffer, 4, 4),
        testVal
      };
      test.view1.setUint8(2, testVal);
      expect(test.view2.getUint8(0)).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView1Test054
     * @tc.number SUB_BUILTINS_DataView1_TEST_5400
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(5);
      const view = new DataView(buffer, 0.0);
      expect(view.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   DataView1Test055
     * @tc.number SUB_BUILTINS_DataView1_TEST_5500
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const minInt64 = -9223372036854775808n;
      view.setBigInt64(0, minInt64);
      expect(view.getBigInt64(0)).assertEqual(minInt64);
    });

    /**
     * @tc.name   DataView1Test056
     * @tc.number SUB_BUILTINS_DataView1_TEST_5600
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer, 1, 3);
      view.setUint16(0, 0xABCD);
      const rawView = new DataView(buffer);
      expect(rawView.getUint16(1)).assertEqual(0xABCD);
    });

    /**
     * @tc.name   DataView1Test057
     * @tc.number SUB_BUILTINS_DataView1_TEST_5700
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      const minValue = 0.00006103515625;
      const maxValue = 65504;
      const test: Float16BoundaryTest = { view, minValue, maxValue };
      test.view.setFloat64(0, minValue);
      test.view.setFloat64(8, maxValue);
      expect(test.view.getFloat64(0)).assertClose(minValue, 1);
      expect(test.view.getFloat64(8)).assertClose(maxValue, 1);
    });

    /**
     * @tc.name   DataView1Test058
     * @tc.number SUB_BUILTINS_DataView1_TEST_5800
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(5);
      const view = new DataView(buffer, 2, 0.0);
      expect(view.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   DataView1Test059
     * @tc.number SUB_BUILTINS_DataView1_TEST_5900
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(6);
      const view = new DataView(buffer, 1, 4);
      view.setInt32(0, 0x12345678);
      expect(view.getInt32(0)).assertEqual(0x12345678);
    });

    /**
     * @tc.name   DataView1Test060
     * @tc.number SUB_BUILTINS_DataView1_TEST_6000
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(1);
      const view = new DataView(buffer);
      view.setUint8(0, 256);
      expect(view.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView1Test061
     * @tc.number SUB_BUILTINS_DataView1_TEST_6100
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new SharedArrayBuffer(8);
      const view = new DataView(buffer);
      const test: SharedBufferCompatTest = {
        view,
        isSharedBuffer: view.buffer instanceof SharedArrayBuffer
      };
      expect(test.isSharedBuffer).assertEqual(true);
    });

    /**
     * @tc.name   DataView1Test062
     * @tc.number SUB_BUILTINS_DataView1_TEST_6200
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      view.setFloat32(0, NaN);
      expect(isNaN(view.getFloat32(0))).assertEqual(true);
    });

    /**
     * @tc.name   DataView1Test063
     * @tc.number SUB_BUILTINS_DataView1_TEST_6300
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(5);
      const view = new DataView(buffer, 3, 2);
      view.setUint16(0, 0x1122);
      expect(view.getUint16(0)).assertEqual(0x1122);
    });

    /**
     * @tc.name   DataView1Test064
     * @tc.number SUB_BUILTINS_DataView1_TEST_6400
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const zero = 0n;
      view.setBigUint64(0, zero);
      expect(view.getBigUint64(0)).assertEqual(zero);
    });

    /**
     * @tc.name   DataView1Test065
     * @tc.number SUB_BUILTINS_DataView1_TEST_6500
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 0, 4);
      view.setInt16(0, 0xABCD);
      const rawView = new DataView(buffer);
      rawView.setUint8(5, 0xFF);
      expect(view.getInt16(0)).assertEqual(-21555);
    });

    /**
     * @tc.name   DataView1Test066
     * @tc.number SUB_BUILTINS_DataView1_TEST_6600
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(6);
      const val1 = 0x01;
      const val2 = 0x02;
      const test: OverlappingViewsTest = {
        view1: new DataView(buffer, 0, 3),
        view2: new DataView(buffer, 2, 3),
        val1,
        val2
      };
      test.view1.setUint8(0, val1);
      test.view2.setUint8(0, val2);
      expect(test.view1.getUint8(0)).assertEqual(val1);
      expect(test.view2.getUint8(0)).assertEqual(val2);
      expect(test.view1.getUint8(2)).assertEqual(val2);
    });

    /**
     * @tc.name   DataView1Test067
     * @tc.number SUB_BUILTINS_DataView1_TEST_6700
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const minInt16 = -32768;
      view.setInt16(0, minInt16);
      expect(view.getInt16(0)).assertEqual(minInt16);
    });

    /**
     * @tc.name   DataView1Test068
     * @tc.number SUB_BUILTINS_DataView1_TEST_6800
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      const positiveInf = Infinity;
      const negativeInf = -Infinity;
      const test: Float64InfinityTest = { view, positiveInf, negativeInf };
      test.view.setFloat64(0, positiveInf);
      test.view.setFloat64(8, negativeInf);
      expect(test.view.getFloat64(0)).assertEqual(positiveInf);
      expect(test.view.getFloat64(8)).assertEqual(negativeInf);
    });

    /**
     * @tc.name   DataView1Test069
     * @tc.number SUB_BUILTINS_DataView1_TEST_6900
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer, 4, 4);
      view.setUint32(0, 0x12345678);
      expect(view.getUint32(0)).assertEqual(0x12345678);
    });

    /**
     * @tc.name   DataView1Test070
     * @tc.number SUB_BUILTINS_DataView1_TEST_7000
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      view.setUint16(0, 0);
      expect(view.getUint16(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView1Test071
     * @tc.number SUB_BUILTINS_DataView1_TEST_7100
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const maxInt32 = 2147483647;
      view.setInt32(0, maxInt32);
      expect(view.getInt32(0)).assertEqual(maxInt32);
    });

    /**
     * @tc.name   DataView1Test072
     * @tc.number SUB_BUILTINS_DataView1_TEST_7200
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const value = 0x12345678;
      view.setUint32(0, value);
      const bigEndian = view.getUint32(0);
      expect(bigEndian).assertEqual(value);
    });

    /**
     * @tc.name   DataView1Test073
     * @tc.number SUB_BUILTINS_DataView1_TEST_7300
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer);
      const intVal = 123;
      const floatVal = 3.14;
      const uintVal = 255;
      const test: MixedTypeTest = {
        view,
        intVal,
        floatVal,
        uintVal
      };
      test.view.setInt16(0, intVal);
      test.view.setFloat32(2, floatVal);
      test.view.setUint8(6, uintVal);
      expect(test.view.getInt16(0)).assertEqual(intVal);
      expect(test.view.getFloat32(2)).assertClose(floatVal, 1);
      expect(test.view.getUint8(6)).assertEqual(uintVal);
    });

    /**
     * @tc.name   DataView1Test074
     * @tc.number SUB_BUILTINS_DataView1_TEST_7400
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(5);
      const view = new DataView(buffer, 0, 1);
      view.setUint8(0, 0x3F);
      expect(view.getUint8(0)).assertEqual(0x3F);
    });

    /**
     * @tc.name   DataView1Test075
     * @tc.number SUB_BUILTINS_DataView1_TEST_7500
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const value = 0xABCD;
      const highByte = (value >> 8) & 0xFF;
      const lowByte = value & 0xFF;
      const test: SplitReadTest = {
        view16: new DataView(buffer),
        view8: new DataView(buffer),
        value,
        highByte,
        lowByte
      };
      test.view16.setUint16(0, value);
      expect(test.view8.getUint8(0)).assertEqual(highByte);
      expect(test.view8.getUint8(1)).assertEqual(lowByte);
    });

    /**
     * @tc.name   DataView1Test076
     * @tc.number SUB_BUILTINS_DataView1_TEST_7600
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(7);
      const view = new DataView(buffer, 0, 6);
      expect(view.byteLength).assertEqual(6);
    });

    /**
     * @tc.name   DataView1Test077
     * @tc.number SUB_BUILTINS_DataView1_TEST_7700
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(6);
      const view1 = new DataView(buffer, 1, 4);
      const view2 = new DataView(buffer);
      view1.setUint8(0, 0xEF);
      expect(view2.getUint8(1)).assertEqual(0xEF);
    });

    /**
     * @tc.name   DataView1Test078
     * @tc.number SUB_BUILTINS_DataView1_TEST_7800
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const bigIntVal = 0x123456789ABCDEFn;
      const high32 = Number((bigIntVal >> 32n) & 0xFFFFFFFFn);
      const low32 = Number(bigIntVal & 0xFFFFFFFFn);
      const test: BigIntSplitReadTest = {
        view64: new DataView(buffer),
        view32: new DataView(buffer),
        bigIntVal,
        high32,
        low32
      };
      test.view64.setBigUint64(0, bigIntVal);
      expect(test.view32.getUint32(0)).assertEqual(high32);
      expect(test.view32.getUint32(4)).assertEqual(low32);
    });

    /**
     * @tc.name   DataView1Test079
     * @tc.number SUB_BUILTINS_DataView1_TEST_7900
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(5);
      const view = new DataView(buffer, 3, 0);
      expect(view.buffer).assertEqual(buffer);
    });

    /**
     * @tc.name   DataView1Test080
     * @tc.number SUB_BUILTINS_DataView1_TEST_8000
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(1);
      const view = new DataView(buffer);
      view.setInt8(0, 129);
      expect(view.getInt8(0)).assertEqual(-127);
    });

    /**
     * @tc.name   DataView1Test081
     * @tc.number SUB_BUILTINS_DataView1_TEST_8100
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const intVal = -456;
      const floatVal = 2.718;
      const uintVal = 199;

      const test: MixedTypeNoConflictTest = {
        viewInt: new DataView(buffer, 0, 4),
        viewFloat: new DataView(buffer, 4, 4),
        viewUint: new DataView(buffer, 8, 2),
        intVal,
        floatVal,
        uintVal
      };

      test.viewInt.setInt32(0, intVal);
      test.viewFloat.setFloat32(0, floatVal);
      test.viewUint.setUint16(0, uintVal);

      expect(test.viewInt.getInt32(0)).assertEqual(intVal);
      expect(test.viewFloat.getFloat32(0)).assertClose(floatVal, 1);
      expect(test.viewUint.getUint16(0)).assertEqual(uintVal);
    });

    /**
     * @tc.name   DataView1Test082
     * @tc.number SUB_BUILTINS_DataView1_TEST_8200
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sharedBuffer = new SharedArrayBuffer(4);
      const testVal = 0x11223344;
      const test: SharedBufferWriteTest = {
        view1: new DataView(sharedBuffer),
        view2: new DataView(sharedBuffer),
        sharedBuffer,
        testVal
      };
      test.view1.setUint32(0, testVal);
      expect(test.view2.getUint32(0)).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView1Test083
     * @tc.number SUB_BUILTINS_DataView1_TEST_8300
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(3);
      const viewShort = new DataView(buffer, 1, 1);
      const viewLong = new DataView(buffer);
      viewShort.setUint8(0, 0x4A);
      expect(viewLong.getUint8(1)).assertEqual(0x4A);
    });

    /**
     * @tc.name   DataView1Test084
     * @tc.number SUB_BUILTINS_DataView1_TEST_8400
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view32 = new DataView(buffer);
      const view16 = new DataView(buffer);
      const value = 0x12345678;
      view32.setUint32(0, value);
      expect(view16.getUint16(0)).assertEqual(0x1234);
      expect(view16.getUint16(2)).assertEqual(0x5678);
    });

    /**
     * @tc.name   DataView1Test085
     * @tc.number SUB_BUILTINS_DataView1_TEST_8500
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const testVal = 0x77;
      const test: NestedViewTest = {
        baseView: new DataView(buffer, 2, 4),
        nestedView: new DataView(buffer, 3, 2),
        testVal
      };
      test.baseView.setUint8(1, testVal);
      expect(test.nestedView.getUint8(0)).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView1Test086
     * @tc.number SUB_BUILTINS_DataView1_TEST_8600
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const viewBase = new DataView(buffer);
      const viewOffset = new DataView(buffer, 0);
      viewBase.setInt16(0, 0xFFFF);
      expect(viewOffset.getInt16(0)).assertEqual(-1);
    });

    /**
     * @tc.name   DataView1Test087
     * @tc.number SUB_BUILTINS_DataView1_TEST_8700
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(9);
      const offset = 3;
      const view = new DataView(buffer, offset);
      view.setUint16(0, 0xABCD);
      expect(view.getUint16(0)).assertEqual(0xABCD);
    });

    /**
     * @tc.name   DataView1Test088
     * @tc.number SUB_BUILTINS_DataView1_TEST_8800
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const val1 = 0x11;
      const val2 = 0x22;
      const val3 = 0x33;
      const test: LastWriteWinsTest = {
        view1: new DataView(buffer, 0, 1),
        view2: new DataView(buffer, 0, 1),
        view3: new DataView(buffer, 0, 1),
        val1,
        val2,
        val3
      };
      test.view1.setUint8(0, val1);
      test.view2.setUint8(0, val2);
      test.view3.setUint8(0, val3);
      expect(test.view1.getUint8(0)).assertEqual(val3);
    });

    /**
     * @tc.name   DataView1Test089
     * @tc.number SUB_BUILTINS_DataView1_TEST_8900
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      view.setInt16(0, 32768);
      expect(view.getInt16(0)).assertEqual(-32768);
    });

    /**
     * @tc.name   DataView1Test090
     * @tc.number SUB_BUILTINS_DataView1_TEST_9000
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(1);
      const view = new DataView(buffer);
      view.setUint8(0, Number(true));
      expect(view.getUint8(0)).assertEqual(1);
      view.setUint8(0, Number(false));
      expect(view.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView1Test091
     * @tc.number SUB_BUILTINS_DataView1_TEST_9100
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const testVal = 0x01020304;
      const test: MixedViewTypeTest = {
        dataView: new DataView(buffer),
        uint8Array: new Uint8Array(buffer),
        testVal
      };
      test.dataView.setUint32(0, testVal);
      expect(test.uint8Array[0]).assertEqual((testVal >> 24) & 0xFF);
      expect(test.uint8Array[3]).assertEqual(testVal & 0xFF);
    });

    /**
     * @tc.name   DataView1Test092
     * @tc.number SUB_BUILTINS_DataView1_TEST_9200
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(1);
      const view = new DataView(buffer);
      const negativeVal = -45;
      view.setInt8(0, negativeVal);
      expect(view.getInt8(0)).assertEqual(negativeVal);
    });

    /**
     * @tc.name   DataView1Test093
     * @tc.number SUB_BUILTINS_DataView1_TEST_9300
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(6);
      const val1 = 0x11;
      const val2 = 0x22;
      const test: ContinuousViewsTest = {
        view1: new DataView(buffer, 0, 3),
        view2: new DataView(buffer, 3, 3),
        val1,
        val2
      };
      test.view1.setUint8(2, val1);
      test.view2.setUint8(0, val2);
      expect(test.view1.getUint8(2)).assertEqual(val1);
      expect(test.view2.getUint8(0)).assertEqual(val2);
    });

    /**
     * @tc.name   DataView1Test094
     * @tc.number SUB_BUILTINS_DataView1_TEST_9400
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const floatVal = Math.E;
      view.setFloat64(0, floatVal);
      expect(view.getFloat64(0)).assertClose(floatVal, 1);
    });

    /**
     * @tc.name   DataView1Test095
     * @tc.number SUB_BUILTINS_DataView1_TEST_9500
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 0, 4);
      expect(view.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   DataView1Test096
     * @tc.number SUB_BUILTINS_DataView1_TEST_9600
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const testVal = 0x33;
      const test: CrossOffsetReadTest = {
        baseView: new DataView(buffer, 2, 6),
        offsetView: new DataView(buffer, 4, 4),
        testVal
      };
      test.baseView.setUint8(2, testVal);
      expect(test.offsetView.getUint8(0)).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView1Test097
     * @tc.number SUB_BUILTINS_DataView1_TEST_9700
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const maxUint16 = 65535;
      view.setUint16(0, maxUint16);
      expect(view.getUint16(0)).assertEqual(maxUint16);
    });

    /**
     * @tc.name   DataView1Test098
     * @tc.number SUB_BUILTINS_DataView1_TEST_9800
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(5);
      const view = new DataView(buffer, 2, 0);
      expect(view.buffer).assertEqual(buffer);
    });

    /**
     * @tc.name   DataView1Test099
     * @tc.number SUB_BUILTINS_DataView1_TEST_9900
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const value = -987654;
      view.setInt32(0, value, true);
      expect(view.getInt32(0, true)).assertEqual(value);
    });

    /**
     * @tc.name   DataView1Test100
     * @tc.number SUB_BUILTINS_DataView1_TEST_10000
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer, 7, 3);
      expect(view.byteOffset).assertEqual(7);
      expect(view.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   DataView1Test101
     * @tc.number SUB_BUILTINS_DataView1_TEST_10100
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(7);
      const view = new DataView(buffer);
      const int8Val = 127;
      const uint16Val = 0xABCD;
      const float32Val = 2.5;
      const test: SequentialWriteTest = {
        view,
        int8Val,
        uint16Val,
        float32Val
      };
      test.view.setInt8(0, int8Val);
      test.view.setUint16(1, uint16Val);
      test.view.setFloat32(3, float32Val);
      expect(test.view.getInt8(0)).assertEqual(int8Val);
      expect(test.view.getUint16(1)).assertEqual(uint16Val);
      expect(test.view.getFloat32(3)).assertClose(float32Val, 1);
    });

    /**
     * @tc.name   DataView1Test102
     * @tc.number SUB_BUILTINS_DataView1_TEST_10200
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const minInt32 = -2147483648;
      view.setInt32(0, minInt32);
      expect(view.getInt32(0)).assertEqual(minInt32);
    });

    /**
     * @tc.name   DataView1Test103
     * @tc.number SUB_BUILTINS_DataView1_TEST_10300
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      view.setUint32(0, 0x11223344);
      expect(view.getUint32(0)).assertEqual(0x11223344);
    });

    /**
     * @tc.name   DataView1Test104
     * @tc.number SUB_BUILTINS_DataView1_TEST_10400
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const value = -32767;
      view.setInt16(0, value);
      expect(view.getInt16(0)).assertEqual(value);
    });

    /**
     * @tc.name   DataView1Test105
     * @tc.number SUB_BUILTINS_DataView1_TEST_10500
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(3);
      const view = new DataView(buffer, 1, 1);
      view.setUint8(0, 0);
      expect(view.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView1Test106
     * @tc.number SUB_BUILTINS_DataView1_TEST_10600
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(3);
      const view = new DataView(buffer);
      const values = [0x01, 0x02, 0x03];
      const test: FullBufferValidationTest = { view, buffer, values };
      test.view.setUint8(0, values[0]);
      test.view.setUint8(1, values[1]);
      test.view.setUint8(2, values[2]);
      const rawView = new DataView(buffer);
      expect(rawView.getUint8(0)).assertEqual(values[0]);
      expect(rawView.getUint8(1)).assertEqual(values[1]);
      expect(rawView.getUint8(2)).assertEqual(values[2]);
    });

    /**
     * @tc.name   DataView1Test107
     * @tc.number SUB_BUILTINS_DataView1_TEST_10700
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      view.setFloat32(0, 0);
      expect(view.getFloat32(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView1Test108
     * @tc.number SUB_BUILTINS_DataView1_TEST_10800
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(9);
      const offset = 3;
      const view = new DataView(buffer, offset, 5);
      expect(view.byteLength).assertEqual(5);
    });

    /**
     * @tc.name   DataView1Test109
     * @tc.number SUB_BUILTINS_DataView1_TEST_10900
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const value = 0xDCBA;
      view.setUint16(0, value, true);
      expect(view.getUint16(0, true)).assertEqual(value);
    });

    /**
     * @tc.name   DataView1Test110
     * @tc.number SUB_BUILTINS_DataView1_TEST_11000
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new SharedArrayBuffer(1);
      const view = new DataView(buffer);
      const value = 67;
      view.setInt8(0, value);
      expect(view.getInt8(0)).assertEqual(value);
    });

    /**
     * @tc.name   DataView1Test111
     * @tc.number SUB_BUILTINS_DataView1_TEST_11100
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const val1 = 0x44;
      const val2 = 0x55;
      const val3 = 0x66;
      const test: MultiOffsetWriteTest = {
        view1: new DataView(buffer, 0, 2),
        view2: new DataView(buffer, 3, 2),
        view3: new DataView(buffer, 6, 2),
        val1,
        val2,
        val3
      };
      test.view1.setUint8(1, val1);
      test.view2.setUint8(0, val2);
      test.view3.setUint8(0, val3);
      expect(test.view1.getUint8(1)).assertEqual(val1);
      expect(test.view2.getUint8(0)).assertEqual(val2);
      expect(test.view3.getUint8(0)).assertEqual(val3);
    });

    /**
     * @tc.name   DataView1Test112
     * @tc.number SUB_BUILTINS_DataView1_TEST_11200
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      view.setUint32(0, 0);
      expect(view.getUint32(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView1Test113
     * @tc.number SUB_BUILTINS_DataView1_TEST_11300
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(6);
      const view = new DataView(buffer, 2, 2);
      const value = 0x1234;
      view.setUint16(0, value);
      expect(view.getUint16(0)).assertEqual(value);
    });

    /**
     * @tc.name   DataView1Test114
     * @tc.number SUB_BUILTINS_DataView1_TEST_11400
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const floatVal = 0.125;
      view.setFloat64(0, floatVal);
      expect(view.getFloat64(0)).assertEqual(floatVal);
    });

    /**
     * @tc.name   DataView1Test115
     * @tc.number SUB_BUILTINS_DataView1_TEST_11500
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(7);
      const view = new DataView(buffer, 1, 5);
      expect(view.byteOffset).assertEqual(1);
      expect(view.byteLength).assertEqual(5);
    });

    /**
     * @tc.name   DataView1Test116
     * @tc.number SUB_BUILTINS_DataView1_TEST_11600
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const value = -0x123;
      const highByte = (value >> 8) & 0xFF;
      const signedHighByte = highByte > 127 ? highByte - 256 : highByte;
      const lowByte = value & 0xFF;
      const signedLowByte = lowByte > 127 ? lowByte - 256 : lowByte;

      const test: Int16SplitReadTest = {
        view16: new DataView(buffer),
        view8: new DataView(buffer),
        value,
        highByte: signedHighByte,
        lowByte: signedLowByte
      };
      test.view16.setInt16(0, value);
      expect(test.view8.getInt8(0)).assertEqual(signedHighByte);
      expect(test.view8.getInt8(1)).assertEqual(signedLowByte);
    });

    /**
     * @tc.name   DataView1Test117
     * @tc.number SUB_BUILTINS_DataView1_TEST_11700
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(1);
      const view = new DataView(buffer);
      view.setUint8(0, 0);
      expect(view.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView1Test118
     * @tc.number SUB_BUILTINS_DataView1_TEST_11800
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(5);
      const view = new DataView(buffer, 1, 3);
      const values = [0x0A, 0x0B, 0x0C];
      view.setUint8(0, values[0]);
      view.setUint8(1, values[1]);
      view.setUint8(2, values[2]);
      expect(view.getUint8(0)).assertEqual(values[0]);
      expect(view.getUint8(1)).assertEqual(values[1]);
      expect(view.getUint8(2)).assertEqual(values[2]);
    });

    /**
     * @tc.name   DataView1Test119
     * @tc.number SUB_BUILTINS_DataView1_TEST_11900
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const floatVal = 1.732;
      view.setFloat32(0, floatVal, true);
      expect(view.getFloat32(0, true)).assertClose(floatVal, 1);
    });

    /**
     * @tc.name   DataView1Test120
     * @tc.number SUB_BUILTINS_DataView1_TEST_12000
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer, 4, 3);
      expect(view.byteOffset).assertEqual(4);
      expect(view.byteLength).assertEqual(3);
    });
    /**
     * @tc.name   DataView1Test121
     * @tc.number SUB_BUILTINS_DataView1_TEST_12100
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(2);
      const buffer2 = new ArrayBuffer(2);
      const val1 = 0xAA;
      const val2 = 0xBB;
      const test: BufferIsolationTest = {
        view1: new DataView(buffer1),
        view2: new DataView(buffer2),
        val1,
        val2
      };
      test.view1.setUint8(0, val1);
      test.view2.setUint8(0, val2);
      expect(test.view1.getUint8(0)).assertEqual(val1);
      expect(test.view2.getUint8(0)).assertEqual(val2);
    });

    /**
     * @tc.name   DataView1Test122
     * @tc.number SUB_BUILTINS_DataView1_TEST_12200
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(1);
      const view = new DataView(buffer);
      const maxUint8 = 255;
      view.setUint8(0, maxUint8);
      expect(view.getUint8(0)).assertEqual(maxUint8);
    });

    /**
     * @tc.name   DataView1Test123
     * @tc.number SUB_BUILTINS_DataView1_TEST_12300
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(5);
      const valA = 0xCC;
      const valB = 0xDD;
      const test: OverlappingWriteTest = {
        viewA: new DataView(buffer, 0, 3),
        viewB: new DataView(buffer, 2, 3),
        valA,
        valB
      };
      test.viewA.setUint8(2, valA);
      test.viewB.setUint8(0, valB);
      expect(test.viewA.getUint8(2)).assertEqual(valB);
      expect(test.viewB.getUint8(0)).assertEqual(valB);
    });

    /**
     * @tc.name   DataView1Test124
     * @tc.number SUB_BUILTINS_DataView1_TEST_12400
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const floatVal = 0.75;
      view.setFloat32(0, floatVal);
      expect(view.getFloat32(0)).assertEqual(floatVal);
    });

    /**
     * @tc.name   DataView1Test125
     * @tc.number SUB_BUILTINS_DataView1_TEST_12500
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer, 6, 4);
      expect(view.byteOffset).assertEqual(6);
      expect(view.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   DataView1Test126
     * @tc.number SUB_BUILTINS_DataView1_TEST_12600
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const intVal = -1;
      const uintVal = 4294967295;
      const test: Int32ToUint32Test = { view: new DataView(buffer), intVal, uintVal };
      test.view.setInt32(0, intVal);
      expect(test.view.getUint32(0)).assertEqual(uintVal);
    });

    /**
     * @tc.name   DataView1Test127
     * @tc.number SUB_BUILTINS_DataView1_TEST_12700
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      view.setInt16(0, 0);
      expect(view.getInt16(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView1Test128
     * @tc.number SUB_BUILTINS_DataView1_TEST_12800
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const value = 16384;
      view.setInt16(0, value, true);
      expect(view.getInt16(0, true)).assertEqual(value);
    });

    /**
     * @tc.name   DataView1Test129
     * @tc.number SUB_BUILTINS_DataView1_TEST_12900
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 5, 1);
      view.setUint8(0, 0xEE);
      expect(view.getUint8(0)).assertEqual(0xEE);
    });

    /**
     * @tc.name   DataView1Test130
     * @tc.number SUB_BUILTINS_DataView1_TEST_13000
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(13);
      const view = new DataView(buffer);
      const uint8Val = 0xFF;
      const int32Val = 123456;
      const float64Val = 1.2345;
      const test: MixedTypeCrossWriteTest = {
        view,
        uint8Val,
        int32Val,
        float64Val
      };
      test.view.setUint8(0, uint8Val);
      test.view.setInt32(1, int32Val);
      test.view.setFloat64(5, float64Val);
      expect(test.view.getUint8(0)).assertEqual(uint8Val);
      expect(test.view.getInt32(1)).assertEqual(int32Val);
      expect(test.view.getFloat64(5)).assertClose(float64Val, 1);
    });

    /**
     * @tc.name   DataView1Test131
     * @tc.number SUB_BUILTINS_DataView1_TEST_13100
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const maxUint32 = 4294967295;
      view.setUint32(0, maxUint32);
      expect(view.getUint32(0)).assertEqual(maxUint32);
    });

    /**
     * @tc.name   DataView1Test132
     * @tc.number SUB_BUILTINS_DataView1_TEST_13200
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const value = 0x11223344;
      view.setUint32(0, value);
      expect(view.getUint8(0)).assertEqual(0x11);
      expect(view.getUint8(3)).assertEqual(0x44);
    });

    /**
     * @tc.name   DataView1Test133
     * @tc.number SUB_BUILTINS_DataView1_TEST_13300
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const value = 987654321;
      view.setInt32(0, value);
      expect(view.getInt32(0)).assertEqual(value);
    });

    /**
     * @tc.name   DataView1Test134
     * @tc.number SUB_BUILTINS_DataView1_TEST_13400
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(7);
      const view = new DataView(buffer, 0, 6);
      expect(view.byteLength).assertEqual(6);
    });

    /**
     * @tc.name   DataView1Test135
     * @tc.number SUB_BUILTINS_DataView1_TEST_13500
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const originalVal = 0.1;
      const tolerance = 0.000001;
      const test: Float32PrecisionTest = { view: new DataView(buffer), originalVal, tolerance };
      test.view.setFloat32(0, originalVal);
      const readVal = test.view.getFloat32(0);
      expect(Math.abs(readVal - originalVal) < tolerance).assertEqual(true);
    });

    /**
     * @tc.name   DataView1Test136
     * @tc.number SUB_BUILTINS_DataView1_TEST_13600
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(1);
      const view = new DataView(buffer);
      view.setInt8(0, 0);
      expect(view.getInt8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView1Test137
     * @tc.number SUB_BUILTINS_DataView1_TEST_13700
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(9);
      const offset = 2;
      const view = new DataView(buffer, offset);
      const value = 0xABCD;
      view.setUint16(0, value);
      expect(view.getUint16(0)).assertEqual(value);
    });

    /**
     * @tc.name   DataView1Test138
     * @tc.number SUB_BUILTINS_DataView1_TEST_13800
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const value = 0x44332211;
      view.setUint32(0, value, true);
      expect(view.getUint32(0, true)).assertEqual(value);
    });

    /**
     * @tc.name   DataView1Test139
     * @tc.number SUB_BUILTINS_DataView1_TEST_13900
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new SharedArrayBuffer(2);
      const view = new DataView(buffer);
      const value = 0x789A;
      view.setUint16(0, value);
      expect(view.getUint16(0)).assertEqual(value);
    });

    /**
     * @tc.name   DataView1Test140
     * @tc.number SUB_BUILTINS_DataView1_TEST_14000
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setFloat64(0, 0);
      expect(view.getFloat64(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView1Test141
     * @tc.number SUB_BUILTINS_DataView1_TEST_14100
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 1, 4);
      const value = -456789;
      view.setInt32(0, value);
      expect(view.getInt32(0)).assertEqual(value);
    });

    /**
     * @tc.name   DataView1Test142
     * @tc.number SUB_BUILTINS_DataView1_TEST_14200
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const value = 0x9ABC;
      view.setUint16(0, value);
      expect(view.getUint16(0)).assertEqual(value);
    });

    /**
     * @tc.name   DataView1Test143
     * @tc.number SUB_BUILTINS_DataView1_TEST_14300
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer, 3, 5);
      expect(view.byteOffset).assertEqual(3);
      expect(view.byteLength).assertEqual(5);
    });

    /**
     * @tc.name   DataView1Test144
     * @tc.number SUB_BUILTINS_DataView1_TEST_14400
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const uintVal = 0x3F80;
      const floatVal = 1.0;
      const test: Uint16ToFloat32Test = { view: new DataView(buffer), uintVal, floatVal };
      test.view.setUint16(0, uintVal);
      test.view.setUint16(2, 0x0000);
      expect(test.view.getFloat32(0)).assertEqual(floatVal);
    });

    /**
     * @tc.name   DataView1Test145
     * @tc.number SUB_BUILTINS_DataView1_TEST_14500
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(1);
      const view = new DataView(buffer);
      view.setUint8(0, 0);
      expect(view.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView1Test146
     * @tc.number SUB_BUILTINS_DataView1_TEST_14600
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer, 1, 2);
      const val1 = 0x10;
      const val2 = 0x20;
      view.setUint8(0, val1);
      view.setUint8(1, val2);
      expect(view.getUint8(0)).assertEqual(val1);
      expect(view.getUint8(1)).assertEqual(val2);
    });

    /**
     * @tc.name   DataView1Test147
     * @tc.number SUB_BUILTINS_DataView1_TEST_14700
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const floatVal = 2.468;
      view.setFloat64(0, floatVal, true);
      expect(view.getFloat64(0, true)).assertClose(floatVal, 1);
    });

    /**
     * @tc.name   DataView1Test148
     * @tc.number SUB_BUILTINS_DataView1_TEST_14800
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const view = new DataView(buffer, 8, 4);
      const value = 0xABCD1234;
      view.setUint32(0, value);
      expect(view.getUint32(0)).assertEqual(value);
    });

    /**
     * @tc.name   DataView1Test149
     * @tc.number SUB_BUILTINS_DataView1_TEST_14900
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(4);
      const buffer2 = new ArrayBuffer(4);
      const val1 = 0xAAAA;
      const val2 = 0xBBBB;
      const test: SeparateBufferTest = {
        view1: new DataView(buffer1),
        view2: new DataView(buffer2),
        val1,
        val2
      };
      test.view1.setUint16(0, val1);
      test.view2.setUint16(0, val2);
      expect(test.view1.getUint16(0)).assertEqual(val1);
      expect(test.view2.getUint16(0)).assertEqual(val2);
    });

    /**
     * @tc.name   DataView1Test150
     * @tc.number SUB_BUILTINS_DataView1_TEST_15000
     * @tc.desc   test DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView1Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(1);
      const view = new DataView(buffer);
      const maxInt8 = 127;
      view.setInt8(0, maxInt8);
      expect(view.getInt8(0)).assertEqual(maxInt8);
    });

  })
}

