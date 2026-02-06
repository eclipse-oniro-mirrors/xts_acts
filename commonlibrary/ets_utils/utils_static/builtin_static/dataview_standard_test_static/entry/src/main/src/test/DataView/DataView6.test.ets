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

interface MultiOffsetTest {
  view: DataView;
  offsets: int[];
  vals: int[];
}

interface MultiViewGetTest {
  view1: DataView;
  view2: DataView;
  offset: number;
  testVal: number;
}

interface NestedViewTest {
  view1: DataView;
  view2: DataView;
  offset: number;
  testVal: number;
}

interface MultiBufferTest {
  view1: DataView;
  view2: DataView;
  val1: number;
  val2: number;
}

interface Offset10ViewTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}
interface OverlapWriteTest {
  view1: DataView;
  view2: DataView;
  offset: number;
  val1: number;
  val2: number;
  finalVal: number;
}
interface MixedSignTest {
  view: DataView;
  offsets: int[];
  vals: int[];
}

interface SingleByteEndianTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface CrossViewReadTest {
  view1: DataView;
  view2: DataView;
  offset: number;
  testVal: number;
}

interface MixedOffsetReadWriteTest {
  view: DataView;
  writeOffsets: int[];
  readOffsets: int[];
  vals: int[];
}

interface MultiBufferCrossTest {
  view1: DataView;
  view2: DataView;
  val1: number;
  val2: number;
}

interface NestedViewWriteReadTest {
  view1: DataView;
  view2: DataView;
  view3: DataView;
  offset: number;
  testVal: number;
}

interface Offset12ViewTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface ViewOverflowTest {
  view: DataView;
  offset: number;
  testVal: number;
}

interface MultiBufferBatchTest {
  views: DataView[];
  vals: int[];
}

interface LargeBufferMultiOffsetTest {
  view: DataView;
  offsets: int[];
  vals: int[];
}
interface CrossViewWriteReadTest {
  view1: DataView;
  view2: DataView;
  offset: number;
  val1: number;
  val2: number;
  finalVal: number;
}

interface MultiBufferOpTest {
  view1: DataView;
  view2: DataView;
  val1: number;
  val2: number;
  opResult: number;
}

interface MixedOffsetOpTest {
  view: DataView;
  offsets: int[];
  vals: int[];
  opResult: int;
}

interface Offset20ViewTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface MultiBufferFormatTest {
  views: DataView[];
  vals: int[];
  formats: string[];
}

interface Offset15ViewTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface NestedViewOpTest {
  view1: DataView;
  view2: DataView;
  offset1: number;
  offset2: number;
  val1: number;
  val2: number;
  opResult: number;
}
interface SuperLargeBufferTest {
  view: DataView;
  offsets: int[];
  vals: int[];
}

interface CrossViewOverlapTest {
  view1: DataView;
  view2: DataView;
  view3: DataView;
  offset: number;
  vals: number[];
  finalVal: number;
}

interface MultiBufferLinkOpTest {
  views: DataView[];
  vals: int[];
  linkResult: int;
}

interface MultiOffsetComboOpTest {
  view: DataView;
  offsets: int[];
  vals: int[];
  comboResult: int;
}

interface Offset25ViewTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface MultiBufferFormatSummaryTest {
  views: DataView[];
  vals: int[];
  summary: string;
}

interface Offset18ViewTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface NestedViewFormatTest {
  view1: DataView;
  view2: DataView;
  offset: number;
  testVal: number;
  formatStr: string;
}

interface CrossViewBoundaryTest {
  view1: DataView;
  view2: DataView;
  offset: number;
  testVal: number;
}

interface MultiBufferBoundaryOpTest {
  views: DataView[];
  vals: int[];
  opResult: int;
}

interface NestedViewBoundaryTest {
  view1: DataView;
  view2: DataView;
  offset: number;
  testVal: number;
}

interface MultiOffsetBoundaryOpTest {
  view: DataView;
  offsets: int[];
  vals: int[];
  opResult: int;
}
interface Offset15ZeroTest {
  view: DataView;
  offset: number;
  testVal: number;
  result: number;
}

interface NestedViewBoundaryFormatTest {
  view1: DataView;
  view2: DataView;
  offset: number;
  testVal: number;
  formatStr: string;
}

export default function DataView6Test() {
  describe('DataView6Test', () => {
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
     * @tc.name   DataView6Test001
     * @tc.number SUB_BUILTINS_DataView6_TEST_0100
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 45;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(result).assertEqual(testVal);
    });
    /**
     * @tc.name   DataView6Test002
     * @tc.number SUB_BUILTINS_DataView6_TEST_0200
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = -67;
      view.setInt8(1, testVal);
      const result = view.getInt8(1);
      expect(result).assertEqual(testVal);
    });
    /**
     * @tc.name   DataView6Test003
     * @tc.number SUB_BUILTINS_DataView6_TEST_0300
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const offset = 3;
      const testVal = 92;
      const view = new DataView(buffer);
      view.setInt8(offset, testVal);
      const result = view.getInt8(offset);
      const test: OffsetGetTest = { view, offset, testVal, result };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView6Test004
     * @tc.number SUB_BUILTINS_DataView6_TEST_0400
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const maxVal = 127;
      view.setInt8(0, maxVal);
      const result = view.getInt8(0);
      expect(result).assertEqual(maxVal);
    });

    /**
     * @tc.name   DataView6Test005
     * @tc.number SUB_BUILTINS_DataView6_TEST_0500
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const minVal = -128;
      view.setInt8(1, minVal);
      const result = view.getInt8(1);
      expect(result).assertEqual(minVal);
    });

    /**
     * @tc.name   DataView6Test006
     * @tc.number SUB_BUILTINS_DataView6_TEST_0600
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(6);
      const offsets: int[] = [0, 2, 4];
      const vals: int[] = [11, -32, 78];
      const view = new DataView(buffer);
      offsets.forEach((offset: int, idx: int): void => view.setInt8(offset, vals[idx]));
      const results = offsets.map((offset: int): int => view.getInt8(offset));
      const test: MultiOffsetTest = { view, offsets, vals };
      expect(results.every((res, idx) => res === test.vals[idx])).assertEqual(true);
    });

    /**
     * @tc.name   DataView6Test007
     * @tc.number SUB_BUILTINS_DataView6_TEST_0700
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(3);
      const view = new DataView(buffer, 0, 3);
      const testVal = -99;
      view.setInt8(2, testVal);
      const result = view.getInt8(2);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView6Test008
     * @tc.number SUB_BUILTINS_DataView6_TEST_0800
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 56;
      view.setInt8(1, testVal);
      const result = view.getInt8(1);
      expect(result + 20).assertEqual(76);
    });

    /**
     * @tc.name   DataView6Test009
     * @tc.number SUB_BUILTINS_DataView6_TEST_0900
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const offset = 1;
      const testVal = -45;
      const view1 = new DataView(buffer);
      const view2 = new DataView(buffer);
      view1.setInt8(offset, testVal);
      const result = view2.getInt8(offset);
      const test: MultiViewGetTest = { view1, view2, offset, testVal };
      expect(result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView6Test010
     * @tc.number SUB_BUILTINS_DataView6_TEST_1000
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = -30;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(result - (-10)).assertEqual(-20);
    });

    /**
     * @tc.name   DataView6Test011
     * @tc.number SUB_BUILTINS_DataView6_TEST_1100
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(5);
      const view = new DataView(buffer);
      const offset = 4;
      const testVal = 67;
      view.setInt8(offset, testVal);
      const result = view.getInt8(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView6Test012
     * @tc.number SUB_BUILTINS_DataView6_TEST_1200
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(3);
      const view = new DataView(buffer);
      const zero = 0;
      view.setInt8(1, zero);
      const result = view.getInt8(1);
      expect(result).assertEqual(zero);
    });

    /**
     * @tc.name   DataView6Test013
     * @tc.number SUB_BUILTINS_DataView6_TEST_1300
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const offset = 2;
      const testVal = 89;
      const view1 = new DataView(buffer, 0, 6);
      const view2 = new DataView(buffer, 1, 7);
      view1.setInt8(offset, testVal);
      const result = view2.getInt8(offset);
      const test: NestedViewTest = { view1, view2, offset, testVal };
      expect(result.toString()).assertEqual("0");
    });

    /**
     * @tc.name   DataView6Test014
     * @tc.number SUB_BUILTINS_DataView6_TEST_1400
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 12;
      view.setInt8(3, testVal);
      const result = view.getInt8(3);
      expect(result * 5).assertEqual(60);
    });

    /**
     * @tc.name   DataView6Test015
     * @tc.number SUB_BUILTINS_DataView6_TEST_1500
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(5);
      const view = new DataView(buffer);
      const offset = 1;
      const testVal = -78;
      view.setInt8(offset, testVal);
      const result = view.getInt8(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView6Test016
     * @tc.number SUB_BUILTINS_DataView6_TEST_1600
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = 43;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(result > 0).assertEqual(true);
    });

    /**
     * @tc.name   DataView6Test017
     * @tc.number SUB_BUILTINS_DataView6_TEST_1700
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = -56;
      view.setInt8(1, testVal);
      const result = view.getInt8(1);
      expect(result < 0).assertEqual(true);
    });

    /**
     * @tc.name   DataView6Test018
     * @tc.number SUB_BUILTINS_DataView6_TEST_1800
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(2);
      const buffer2 = new ArrayBuffer(2);
      const val1 = 34;
      const val2 = -89;
      const view1 = new DataView(buffer1);
      const view2 = new DataView(buffer2);
      view1.setInt8(0, val1);
      view2.setInt8(1, val2);
      const result1 = view1.getInt8(0);
      const result2 = view2.getInt8(1);
      const test: MultiBufferTest = { view1, view2, val1, val2 };
      expect(result1).assertEqual(test.val1);
      expect(result2).assertEqual(test.val2);
    });

    /**
     * @tc.name   DataView6Test019
     * @tc.number SUB_BUILTINS_DataView6_TEST_1900
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = -40;
      view.setInt8(2, testVal);
      const result = view.getInt8(2);
      expect(result / 4).assertEqual(-10);
    });

    /**
     * @tc.name   DataView6Test020
     * @tc.number SUB_BUILTINS_DataView6_TEST_2000
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const offset = 4;
      const testVal = 99;
      const view = new DataView(buffer);
      view.setInt8(offset, testVal);
      const result = view.getInt8(offset);
      const test: Offset10ViewTest = { view, offset, testVal, result };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView6Test021
     * @tc.number SUB_BUILTINS_DataView6_TEST_2100
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = 126;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView6Test022
     * @tc.number SUB_BUILTINS_DataView6_TEST_2200
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = -127;
      view.setInt8(1, testVal);
      const result = view.getInt8(1);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView6Test023
     * @tc.number SUB_BUILTINS_DataView6_TEST_2300
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(6);
      const offset = 2;
      const val1 = 23;
      const val2 = 56;
      const view1 = new DataView(buffer, 0, 5);
      const view2 = new DataView(buffer, 1, 5);
      view1.setInt8(offset, val1);
      view2.setInt8(offset, val2);
      const result = view1.getInt8(offset);
      expect(result.toString()).assertEqual("23");
    });

    /**
     * @tc.name   DataView6Test024
     * @tc.number SUB_BUILTINS_DataView6_TEST_2400
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(3);
      const view = new DataView(buffer);
      const testVal = -37;
      view.setInt8(1, testVal);
      const result = view.getInt8(1);
      expect(result.toString()).assertEqual("-37");
    });

    /**
     * @tc.name   DataView6Test025
     * @tc.number SUB_BUILTINS_DataView6_TEST_2500
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const offset = 3;
      const testVal = 72;
      view.setInt8(offset, testVal);
      const result = view.getInt8(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView6Test026
     * @tc.number SUB_BUILTINS_DataView6_TEST_2600
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 49;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(result % 7).assertEqual(0);
    });

    /**
     * @tc.name   DataView6Test027
     * @tc.number SUB_BUILTINS_DataView6_TEST_2700
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const offsets: int[] = [0, 2, 5, 7];
      const vals: int[] = [15, -62, 101, -110];
      const view = new DataView(buffer);
      offsets.forEach((offset: int, idx: int): void => view.setInt8(offset, vals[idx]));
      const results = offsets.map((offset: int): int => view.getInt8(offset));
      const test: MixedSignTest = { view, offsets, vals };
      expect(results.every((res, idx) => res === test.vals[idx])).assertEqual(true);
    });

    /**
     * @tc.name   DataView6Test028
     * @tc.number SUB_BUILTINS_DataView6_TEST_2800
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(1);
      const view = new DataView(buffer, 0, 1);
      const testVal = 88;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView6Test029
     * @tc.number SUB_BUILTINS_DataView6_TEST_2900
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = 25;
      const testVal2 = 12;
      view.setInt8(0, testVal1);
      view.setInt8(1, testVal2);
      const result1 = view.getInt8(0);
      const result2 = view.getInt8(1);
      expect(result1 & result2).assertEqual(8);
    });

    /**
     * @tc.name   DataView6Test030
     * @tc.number SUB_BUILTINS_DataView6_TEST_3000
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = 25;
      const testVal2 = 12;
      view.setInt8(0, testVal1);
      view.setInt8(1, testVal2);
      const result1 = view.getInt8(0);
      const result2 = view.getInt8(1);
      expect(result1 | result2).assertEqual(29);
    });
    /**
     * @tc.name   DataView6Test031
     * @tc.number SUB_BUILTINS_DataView6_TEST_3100
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      const testVal = -83;
      view.setInt8(12, testVal);
      const result = view.getInt8(12);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView6Test032
     * @tc.number SUB_BUILTINS_DataView6_TEST_3200
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const offset = 5;
      const testVal = 64;
      const view = new DataView(buffer);
      view.setInt8(offset, testVal);
      const result = view.getInt8(offset);
      const test: SingleByteEndianTest = { view, offset, testVal, result };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView6Test033
     * @tc.number SUB_BUILTINS_DataView6_TEST_3300
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = 35;
      const testVal2 = -20;
      view.setInt8(0, testVal1);
      view.setInt8(1, testVal2);
      const result1 = view.getInt8(0);
      const result2 = view.getInt8(1);
      expect(result1 + result2).assertEqual(15);
    });

    /**
     * @tc.name   DataView6Test034
     * @tc.number SUB_BUILTINS_DataView6_TEST_3400
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer, 0, 10);
      const offsets: int[] = [1, 3, 6, 8];
      const vals: int[] = [-45, 72, -98, 105];
      offsets.forEach((offset: int, idx: int): void => view.setInt8(offset, vals[idx]));
      const results = offsets.map((offset: int): int => view.getInt8(offset));
      expect(results.every((res, idx) => res === vals[idx])).assertEqual(true);
    });

    /**
     * @tc.name   DataView6Test035
     * @tc.number SUB_BUILTINS_DataView6_TEST_3500
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = 110;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(result >= -128 && result <= 127).assertEqual(true);
    });

    /**
     * @tc.name   DataView6Test036
     * @tc.number SUB_BUILTINS_DataView6_TEST_3600
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const offset = 4;
      const testVal = -56;
      const view1 = new DataView(buffer, 0, 8);
      const view2 = new DataView(buffer, 2, 10);
      view1.setInt8(offset, testVal);
      const result = view2.getInt8(offset);
      expect(result.toString()).assertEqual("0");
    });

    /**
     * @tc.name   DataView6Test037
     * @tc.number SUB_BUILTINS_DataView6_TEST_3700
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = 120;
      const testVal2 = 30;
      view.setInt8(0, testVal1);
      view.setInt8(1, testVal2);
      const result1 = view.getInt8(0);
      const result2 = view.getInt8(1);
      expect(result1 - result2).assertEqual(90);
    });

    /**
     * @tc.name   DataView6Test038
     * @tc.number SUB_BUILTINS_DataView6_TEST_3800
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(7);
      const view = new DataView(buffer);
      const offset = 5;
      const testVal = -77;
      view.setInt8(offset, testVal);
      const result = view.getInt8(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView6Test039
     * @tc.number SUB_BUILTINS_DataView6_TEST_3900
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = 42;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(result.toString(2)).assertEqual("101010");
    });

    /**
     * @tc.name   DataView6Test040
     * @tc.number SUB_BUILTINS_DataView6_TEST_4000
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = -15;
      const testVal2 = -4;
      view.setInt8(0, testVal1);
      view.setInt8(1, testVal2);
      const result1 = view.getInt8(0);
      const result2 = view.getInt8(1);
      expect(result1 * result2).assertEqual(60);
    });

    /**
     * @tc.name   DataView6Test041
     * @tc.number SUB_BUILTINS_DataView6_TEST_4100
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(15);
      const writeOffsets: int[] = [2, 5, 9, 12];
      const readOffsets: int[] = [2, 5, 9, 12];
      const vals: int[] = [33, -66, 99, -120];
      const view = new DataView(buffer);
      writeOffsets.forEach((offset: int, idx: int): void => view.setInt8(offset, vals[idx]));
      const results = readOffsets.map((offset: int): int => view.getInt8(offset));
      const test: MixedOffsetReadWriteTest = { view, writeOffsets, readOffsets, vals };
      expect(results.every((res, idx) => res === test.vals[idx])).assertEqual(true);
    });

    /**
     * @tc.name   DataView6Test042
     * @tc.number SUB_BUILTINS_DataView6_TEST_4200
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(3);
      const view = new DataView(buffer);
      const zero = 0;
      view.setInt8(1, zero);
      const result = view.getInt8(1);
      expect(result + 50).assertEqual(50);
    });

    /**
     * @tc.name   DataView6Test043
     * @tc.number SUB_BUILTINS_DataView6_TEST_4300
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 1, 6);
      const testVal = 88;
      view.setInt8(3, testVal);
      const result = view.getInt8(3);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView6Test044
     * @tc.number SUB_BUILTINS_DataView6_TEST_4400
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = -84;
      view.setInt8(2, testVal);
      const result = view.getInt8(2);
      expect(result / 6).assertEqual(-14);
    });

    /**
     * @tc.name   DataView6Test045
     * @tc.number SUB_BUILTINS_DataView6_TEST_4500
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(3);
      const buffer2 = new ArrayBuffer(3);
      const val1 = 57;
      const val2 = -103;
      const view1 = new DataView(buffer1);
      const view2 = new DataView(buffer2);
      view1.setInt8(1, val1);
      view2.setInt8(1, val2);
      const result1 = view1.getInt8(1);
      const result2 = view2.getInt8(1);
      const test: MultiBufferCrossTest = { view1, view2, val1, val2 };
      expect(result1).assertEqual(test.val1);
      expect(result2).assertEqual(test.val2);
    });

    /**
     * @tc.name   DataView6Test046
     * @tc.number SUB_BUILTINS_DataView6_TEST_4600
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = 63;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(result.toString(8)).assertEqual("77");
    });

    /**
     * @tc.name   DataView6Test047
     * @tc.number SUB_BUILTINS_DataView6_TEST_4700
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(1);
      const view = new DataView(buffer, 0, 1);
      const testVal = -128;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView6Test048
     * @tc.number SUB_BUILTINS_DataView6_TEST_4800
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = -53;
      view.setInt8(1, testVal);
      const result = view.getInt8(1);
      expect(result % 7).assertEqual(-4);
    });

    /**
     * @tc.name   DataView6Test049
     * @tc.number SUB_BUILTINS_DataView6_TEST_4900
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(14);
      const offset = 6;
      const testVal = 76;
      const view1 = new DataView(buffer, 0, 10);
      const view2 = new DataView(buffer, 3, 11);
      const view3 = new DataView(buffer, 5, 9);
      view1.setInt8(offset, testVal);
      const result = view3.getInt8(offset);
      expect(result.toString()).assertEqual("0");
    });

    /**
     * @tc.name   DataView6Test050
     * @tc.number SUB_BUILTINS_DataView6_TEST_5000
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = 49;
      view.setInt8(1, testVal);
      const result = view.getInt8(1);
      expect(result !== 0).assertEqual(true);
    });

    /**
     * @tc.name   DataView6Test051
     * @tc.number SUB_BUILTINS_DataView6_TEST_5100
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      view.setInt8(0, 20);
      view.setInt8(0, -30);
      const result = view.getInt8(0);
      expect(result).assertEqual(-30);
    });

    /**
     * @tc.name   DataView6Test052
     * @tc.number SUB_BUILTINS_DataView6_TEST_5200
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = 27;
      const testVal2 = 13;
      view.setInt8(0, testVal1);
      view.setInt8(1, testVal2);
      const result1 = view.getInt8(0);
      const result2 = view.getInt8(1);
      expect(result1 ^ result2).assertEqual(22);
    });

    /**
     * @tc.name   DataView6Test053
     * @tc.number SUB_BUILTINS_DataView6_TEST_5300
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const offset = 7;
      const testVal = -91;
      const view = new DataView(buffer);
      view.setInt8(offset, testVal);
      const result = view.getInt8(offset);
      const test: Offset12ViewTest = { view, offset, testVal, result };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView6Test054
     * @tc.number SUB_BUILTINS_DataView6_TEST_5400
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = -31;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(result.toString(16)).assertEqual("-1f");
    });

    /**
     * @tc.name   DataView6Test055
     * @tc.number SUB_BUILTINS_DataView6_TEST_5500
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(9);
      const view = new DataView(buffer);
      const startOffset = 1;
      const vals = [10, -20, 30, -40, 50];
      vals.forEach((val, idx) => view.setInt8(startOffset + idx, val));
      const results = vals.map((_, idx) => view.getInt8(startOffset + idx));
      expect(results.every((res, idx) => res === vals[idx])).assertEqual(true);
    });

    /**
     * @tc.name   DataView6Test056
     * @tc.number SUB_BUILTINS_DataView6_TEST_5600
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 16;
      view.setInt8(2, testVal);
      const result = view.getInt8(2);
      expect(result << 2).assertEqual(64);
    });

    /**
     * @tc.name   DataView6Test057
     * @tc.number SUB_BUILTINS_DataView6_TEST_5700
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(6);
      const view = new DataView(buffer, 0, 6);
      const offset = 4;
      const testVal = 68;
      view.setInt8(offset, testVal);
      const result = view.getInt8(offset);

      const test: ViewOverflowTest = { view, offset, testVal };
      expect(result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView6Test058
     * @tc.number SUB_BUILTINS_DataView6_TEST_5800
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = -32;
      view.setInt8(3, testVal);
      const result = view.getInt8(3);
      expect(result >> 2).assertEqual(-8);
    });

    /**
     * @tc.name   DataView6Test059
     * @tc.number SUB_BUILTINS_DataView6_TEST_5900
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffers = [new ArrayBuffer(2), new ArrayBuffer(2), new ArrayBuffer(2)];
      const vals = [-44, 89, -112];
      const views = buffers.map((buf, idx) => {
        const view = new DataView(buf);
        view.setInt8(0, vals[idx]);
        return view;
      });
      const results = views.map((view, idx) => view.getInt8(0));
      const test: MultiBufferBatchTest = { views, vals };
      expect(results.every((res, idx) => res === test.vals[idx])).assertEqual(true);
    });

    /**
     * @tc.name   DataView6Test060
     * @tc.number SUB_BUILTINS_DataView6_TEST_6000
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = -79;
      view.setInt8(0, testVal);
      const result: number = view.getInt8(0);
      expect(result.toLocaleString('zh-CN')).assertEqual("-79");
    });
    /**
     * @tc.name   DataView6Test061
     * @tc.number SUB_BUILTINS_DataView6_TEST_6100
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = 25;
      const testVal2 = -10;
      view.setInt8(0, testVal1);
      view.setInt8(1, testVal2);
      const result1 = view.getInt8(0);
      const result2 = view.getInt8(1);
      expect((result1 + result2) * 2).assertEqual(30);
    });

    /**
     * @tc.name   DataView6Test062
     * @tc.number SUB_BUILTINS_DataView6_TEST_6200
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(20);
      const offsets: int[] = [1, 4, 8, 12, 17];
      const vals: int[] = [95, -63, 118, -105, 37];
      const view = new DataView(buffer);
      offsets.forEach((offset: int, idx: int): void => view.setInt8(offset, vals[idx]));
      const results = offsets.map((offset: int): int => view.getInt8(offset));
      const test: LargeBufferMultiOffsetTest = { view, offsets, vals };
      expect(results.every((res, idx) => res === test.vals[idx])).assertEqual(true);
    });

    /**
     * @tc.name   DataView6Test063
     * @tc.number SUB_BUILTINS_DataView6_TEST_6300
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = -82;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(Number.isInteger(result)).assertEqual(true);
    });

    /**
     * @tc.name   DataView6Test064
     * @tc.number SUB_BUILTINS_DataView6_TEST_6400
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view1 = new DataView(buffer, 0, 8);
      const view2 = new DataView(buffer, 2, 8);
      const testVal = 59;
      view1.setInt8(3, testVal);
      const result = view2.getFloat32(1);
      expect(view2.getInt8(1)).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView6Test065
     * @tc.number SUB_BUILTINS_DataView6_TEST_6500
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = 127;
      view.setInt8(0, testVal);
      const result: number = view.getInt8(0);
      expect(result.toExponential(0)).assertEqual("1e+2");
    });

    /**
     * @tc.name   DataView6Test066
     * @tc.number SUB_BUILTINS_DataView6_TEST_6600
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const offset = 5;
      const val1 = 41;
      const val2 = -73;
      const finalVal = val2;
      const view1 = new DataView(buffer, 0, 9);
      const view2 = new DataView(buffer, 3, 9);
      const view2LocalOffset = offset - 3;
      view1.setInt8(offset, val1);
      view2.setInt8(view2LocalOffset, val2);
      const result = view1.getInt8(offset);
      const test: CrossViewWriteReadTest = { view1, view2, offset, val1, val2, finalVal };
      expect(result).assertEqual(test.finalVal);
    });

    /**
     * @tc.name   DataView6Test067
     * @tc.number SUB_BUILTINS_DataView6_TEST_6700
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = -96;
      const testVal2 = 8;
      view.setInt8(0, testVal1);
      view.setInt8(1, testVal2);
      const result1 = view.getInt8(0);
      const result2 = view.getInt8(1);
      expect(result1 / result2).assertEqual(-12);
    });

    /**
     * @tc.name   DataView6Test068
     * @tc.number SUB_BUILTINS_DataView6_TEST_6800
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(9);
      const view = new DataView(buffer);
      const offset = 6;
      const testVal = 62;
      view.setInt8(offset, testVal);
      const result = view.getInt8(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView6Test069
     * @tc.number SUB_BUILTINS_DataView6_TEST_6900
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 35;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(~result & 0xff).assertEqual(220);
    });

    /**
     * @tc.name   DataView6Test070
     * @tc.number SUB_BUILTINS_DataView6_TEST_7000
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(2);
      const buffer2 = new ArrayBuffer(2);
      const val1 = 38;
      const val2 = -25;
      const opResult = val1 - val2;
      const view1 = new DataView(buffer1);
      const view2 = new DataView(buffer2);
      view1.setInt8(0, val1);
      view2.setInt8(0, val2);
      const result1 = view1.getInt8(0);
      const result2 = view2.getInt8(0);
      const test: MultiBufferOpTest = { view1, view2, val1, val2, opResult };
      expect(result1 - result2).assertEqual(test.opResult);
    });

    /**
     * @tc.name   DataView6Test071
     * @tc.number SUB_BUILTINS_DataView6_TEST_7100
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = -109;
      view.setInt8(0, testVal);
      const result: number = view.getInt8(0);
      expect(result.toLocaleString('en-US')).assertEqual("-109");
    });

    /**
     * @tc.name   DataView6Test072
     * @tc.number SUB_BUILTINS_DataView6_TEST_7200
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(1);
      const view = new DataView(buffer, 0, 1);
      view.setInt8(0, 29);
      view.setInt8(0, -51);
      const result = view.getInt8(0);
      expect(result).assertEqual(-51);
    });

    /**
     * @tc.name   DataView6Test073
     * @tc.number SUB_BUILTINS_DataView6_TEST_7300
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 74;
      view.setInt8(1, testVal);
      const result = view.getInt8(1);
      expect(result % 9).assertEqual(2);
    });

    /**
     * @tc.name   DataView6Test074
     * @tc.number SUB_BUILTINS_DataView6_TEST_7400
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const offsets: int[] = [0, 2, 4];
      const vals: int[] = [15, -20, 35];
      const opResult = vals[0] + vals[1] * vals[2];
      const view = new DataView(buffer);
      offsets.forEach((offset: int, idx: int): void => view.setInt8(offset, vals[idx]));
      const results = offsets.map((offset: int): int => view.getInt8(offset));
      const test: MixedOffsetOpTest = { view, offsets, vals, opResult };
      expect(results[0] + results[1] * results[2]).assertEqual(test.opResult);
    });

    /**
     * @tc.name   DataView6Test075
     * @tc.number SUB_BUILTINS_DataView6_TEST_7500
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = -47;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(!isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   DataView6Test076
     * @tc.number SUB_BUILTINS_DataView6_TEST_7600
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(15);
      const view = new DataView(buffer);
      const segment1 = [12, -34, 56];
      const segment2 = [-78, 90, -11];
      segment1.forEach((val, idx) => view.setInt8(idx, val));
      segment2.forEach((val, idx) => view.setInt8(8 + idx, val));
      const result1 = segment1.map((_, idx) => view.getInt8(idx));
      expect(result1.every((res, idx) => res === segment1[idx])).assertEqual(true);
    });

    /**
     * @tc.name   DataView6Test077
     * @tc.number SUB_BUILTINS_DataView6_TEST_7700
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = 23;
      const testVal2 = 19;
      view.setInt8(0, testVal1);
      view.setInt8(1, testVal2);
      const result1 = view.getInt8(0);
      const result2 = view.getInt8(1);
      expect(((result1 << 1) & result2).toString()).assertEqual("2");
    });

    /**
     * @tc.name   DataView6Test078
     * @tc.number SUB_BUILTINS_DataView6_TEST_7800
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(20);
      const offset = 10;
      const testVal = -85;
      const view = new DataView(buffer);
      view.setInt8(offset, testVal);
      const result = view.getInt8(offset);
      const test: Offset20ViewTest = { view, offset, testVal, result };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView6Test079
     * @tc.number SUB_BUILTINS_DataView6_TEST_7900
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = 94;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(result.toString(16).toUpperCase()).assertEqual("5E");
    });

    /**
     * @tc.name   DataView6Test080
     * @tc.number SUB_BUILTINS_DataView6_TEST_8000
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view1 = new DataView(buffer);
      const view2 = new DataView(buffer);
      const offsets: int[] = [1, 3, 5];
      const vals: int[] = [27, -49, 68];
      offsets.forEach((offset: int, idx: int): void => view1.setInt8(offset, vals[idx]));
      const results = offsets.map((offset: int): int => view2.getInt8(offset));
      const sum = results.reduce((acc, curr) => acc + curr, 0);
      expect(sum).assertEqual(46);
    });

    /**
     * @tc.name   DataView6Test081
     * @tc.number SUB_BUILTINS_DataView6_TEST_8100
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = -48;
      const testVal2 = 22;
      view.setInt8(0, testVal1);
      view.setInt8(1, testVal2);
      const result1 = view.getInt8(0);
      const result2 = view.getInt8(1);
      expect((result1 >> 2) | result2).assertEqual(-10);
    });

    /**
     * @tc.name   DataView6Test082
     * @tc.number SUB_BUILTINS_DataView6_TEST_8200
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(7);
      const view = new DataView(buffer, 0, 7);
      const testVal = -121;
      view.setInt8(6, testVal);
      const result = view.getInt8(6);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView6Test083
     * @tc.number SUB_BUILTINS_DataView6_TEST_8300
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffers = [new ArrayBuffer(2), new ArrayBuffer(2), new ArrayBuffer(2)];
      const vals = [36, -69, 112];
      const formats = ["100100", "-1000101", "1110000"];
      const views = buffers.map((buf, idx) => {
        const view = new DataView(buf);
        view.setInt8(0, vals[idx]);
        return view;
      });
      const results = views.map((view, idx) => view.getInt8(0).toString(2));
      const test: MultiBufferFormatTest = { views, vals, formats };
      expect(results.every((res, idx) => res === test.formats[idx])).assertEqual(true);
    });

    /**
     * @tc.name   DataView6Test084
     * @tc.number SUB_BUILTINS_DataView6_TEST_8400
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = 18;
      const testVal2 = -6;
      const testVal3 = 3;
      view.setInt8(0, testVal1);
      view.setInt8(1, testVal2);
      view.setInt8(2, testVal3);
      const result1 = view.getInt8(0);
      const result2 = view.getInt8(1);
      const result3 = view.getInt8(2);
      expect((result1 * result2) / result3).assertEqual(-36);
    });

    /**
     * @tc.name   DataView6Test085
     * @tc.number SUB_BUILTINS_DataView6_TEST_8500
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = -76;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(`数值：${result}`).assertEqual("数值：-76");
    });

    /**
     * @tc.name   DataView6Test086
     * @tc.number SUB_BUILTINS_DataView6_TEST_8600
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(15);
      const offset = 5;
      const testVal = 43;
      const view = new DataView(buffer);
      view.setInt8(offset, testVal);
      const result = view.getInt8(offset);
      const test: Offset15ViewTest = { view, offset, testVal, result };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView6Test087
     * @tc.number SUB_BUILTINS_DataView6_TEST_8700
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = 89;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(isFinite(result)).assertEqual(true);
    });

    /**
     * @tc.name   DataView6Test088
     * @tc.number SUB_BUILTINS_DataView6_TEST_8800
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const offset1 = 4;
      const offset2 = 7;
      const val1 = -31;
      const val2 = 52;
      const opResult = val1 * val2;

      const view1 = new DataView(buffer, 0, 10);
      const view2 = new DataView(buffer, 3, 9);

      const view2Offset1 = offset1 - 3;
      const view2Offset2 = offset2 - 3;

      view1.setInt8(offset1, val1);
      view1.setInt8(offset2, val2);

      const result1 = view2.getInt8(view2Offset1);
      const result2 = view2.getInt8(view2Offset2);

      const test: NestedViewOpTest = { view1, view2, offset1, offset2, val1, val2, opResult };
      expect(result1 * result2).assertEqual(test.opResult);
    });

    /**
     * @tc.name   DataView6Test089
     * @tc.number SUB_BUILTINS_DataView6_TEST_8900
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = 47;
      const testVal2 = 15;
      view.setInt8(0, testVal1);
      view.setInt8(1, testVal2);
      const result1 = view.getInt8(0);
      const result2 = view.getInt8(1);
      expect(((result1 ^ result2) << 3).toString()).assertEqual("256");
    });

    /**
     * @tc.name   DataView6Test090
     * @tc.number SUB_BUILTINS_DataView6_TEST_9000
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffers = [new ArrayBuffer(2), new ArrayBuffer(2), new ArrayBuffer(2)];
      const vals = [-23, 71, -94];
      const views = buffers.map((buf, idx) => {
        const view = new DataView(buf);
        view.setInt8(0, vals[idx]);
        return view;
      });
      const formatted = views.map((view, idx) =>
      `值${idx+1}：${view.getInt8(0)}（十六进制：${view.getInt8(0).toString(16)}）`
      );
      expect(formatted[0]).assertEqual("值1：-23（十六进制：-17）");
      expect(formatted[1]).assertEqual("值2：71（十六进制：47）");
      expect(formatted[2]).assertEqual("值3：-94（十六进制：-5e）");
    });
    /**
     * @tc.name   DataView6Test091
     * @tc.number SUB_BUILTINS_DataView6_TEST_9100
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(5);
      const view = new DataView(buffer);
      const testVal1 = 28;
      const testVal2 = -7;
      const testVal3 = 4;
      const testVal4 = 3;
      view.setInt8(0, testVal1);
      view.setInt8(1, testVal2);
      view.setInt8(2, testVal3);
      view.setInt8(3, testVal4);
      const results = [view.getInt8(0), view.getInt8(1), view.getInt8(2), view.getInt8(3)];
      expect(((results[0] + results[1]) * results[2]) / results[3]).assertEqual(28);
    });

    /**
     * @tc.name   DataView6Test092
     * @tc.number SUB_BUILTINS_DataView6_TEST_9200
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(30);
      const offsets: int[] = [2, 7, 13, 19, 25];
      const vals: int[] = [-115, 83, -57, 122, -39];
      const view = new DataView(buffer);
      offsets.forEach((offset: int, idx: int): void => view.setInt8(offset, vals[idx]));
      const results = offsets.map((offset: int): int => view.getInt8(offset));
      const test: SuperLargeBufferTest = { view, offsets, vals };
      expect(results.every((res, idx) => res === test.vals[idx])).assertEqual(true);
    });

    /**
     * @tc.name   DataView6Test093
     * @tc.number SUB_BUILTINS_DataView6_TEST_9300
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = -45;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      const binary = result.toString(2).padStart(8, '1');
      expect(binary).assertEqual("1-101101");
    });

    /**
     * @tc.name   DataView6Test094
     * @tc.number SUB_BUILTINS_DataView6_TEST_9400
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const view1 = new DataView(buffer, 0, 12);
      const view2 = new DataView(buffer, 4, 12);
      const offsets1: int[] = [1, 3, 5];
      const offsets2: int[] = [1, 3, 5];
      const vals = [19, -36, 61];
      offsets1.forEach((offset: int, idx: int): void => view1.setInt8(offset, vals[idx]));
      const results = offsets2.map((offset: int): int => view2.getInt8(offset));
      expect((results[0] + results[1] + results[2]).toString()).assertEqual("61");
    });

    /**
     * @tc.name   DataView6Test095
     * @tc.number SUB_BUILTINS_DataView6_TEST_9500
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = -128;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(result >= -128 && result <= 127).assertEqual(true);
    });

    /**
     * @tc.name   DataView6Test096
     * @tc.number SUB_BUILTINS_DataView6_TEST_9600
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(14);
      const offset = 6;
      const vals = [23, -51, 79];
      const finalVal = vals[2];
      const view1 = new DataView(buffer, 0, 10);
      const view2 = new DataView(buffer, 3, 11);
      const view3 = new DataView(buffer, 5, 9);
      view1.setInt8(offset, vals[0]);
      view2.setInt8(offset, vals[1]);
      view3.setInt8(offset, vals[2]);
      const result = view1.getInt8(offset);
      expect(result.toString()).assertEqual("23");
    });

    /**
     * @tc.name   DataView6Test097
     * @tc.number SUB_BUILTINS_DataView6_TEST_9700
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = 31;
      const testVal2 = 124;
      view.setInt8(0, testVal1);
      view.setInt8(1, testVal2);
      const result1 = view.getInt8(0);
      const result2 = view.getInt8(1);
      expect(((result1 << 2) ^ result2).toString()).assertEqual("0");
    });

    /**
     * @tc.name   DataView6Test098
     * @tc.number SUB_BUILTINS_DataView6_TEST_9800
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer);
      const offset = 6;
      const testVal = -89;
      view.setInt8(offset, testVal);
      const result = view.getInt8(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView6Test099
     * @tc.number SUB_BUILTINS_DataView6_TEST_9900
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = 127;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(`积分：${result} 点`).assertEqual("积分：127 点");
    });

    /**
     * @tc.name   DataView6Test100
     * @tc.number SUB_BUILTINS_DataView6_TEST_10000
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffers = [new ArrayBuffer(2), new ArrayBuffer(2), new ArrayBuffer(2)];
      const vals = [16, -24, 32];
      const linkResult = (vals[0] + vals[1]) * vals[2];
      const views = buffers.map((buf, idx) => {
        const view = new DataView(buf);
        view.setInt8(0, vals[idx]);
        return view;
      });
      const results = views.map(view => view.getInt8(0));
      const test: MultiBufferLinkOpTest = { views, vals, linkResult };
      expect((results[0] + results[1]) * results[2]).assertEqual(test.linkResult);
    });

    /**
     * @tc.name   DataView6Test101
     * @tc.number SUB_BUILTINS_DataView6_TEST_10100
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = 90;
      const testVal2 = -15;
      view.setInt8(0, testVal1);
      view.setInt8(1, testVal2);
      const result1 = view.getInt8(0);
      const result2 = view.getInt8(1);
      expect(result1 / result2).assertEqual(-6);
    });

    /**
     * @tc.name   DataView6Test102
     * @tc.number SUB_BUILTINS_DataView6_TEST_10200
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view1 = new DataView(buffer);
      const view2 = new DataView(buffer);
      view1.setInt8(0, 45);
      view1.setInt8(1, -67);
      expect(view2.getInt8(0)).assertEqual(45);
      expect(view2.getInt8(1)).assertEqual(-67);
    });

    /**
     * @tc.name   DataView6Test103
     * @tc.number SUB_BUILTINS_DataView6_TEST_10300
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = -72;
      view.setInt8(2, testVal);
      const result = view.getInt8(2);
      expect(result % 8).assertEqual(0);
    });

    /**
     * @tc.name   DataView6Test104
     * @tc.number SUB_BUILTINS_DataView6_TEST_10400
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(9);
      const offsets: int[] = [0, 2, 4, 6];
      const vals: int[] = [9, -18, 27, -36];
      const comboResult = vals[0] - vals[1] + vals[2] * vals[3];
      const view = new DataView(buffer);
      offsets.forEach((offset: int, idx: int): void => view.setInt8(offset, vals[idx]));
      const results = offsets.map((offset: int): int => view.getInt8(offset));
      const test: MultiOffsetComboOpTest = { view, offsets, vals, comboResult };
      expect(results[0] - results[1] + results[2] * results[3]).assertEqual(test.comboResult);
    });

    /**
     * @tc.name   DataView6Test105
     * @tc.number SUB_BUILTINS_DataView6_TEST_10500
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = -99;
      view.setInt8(0, testVal);
      const result: number = view.getInt8(0);
      expect(result.toExponential(3)).assertEqual("-9.900e+1");
    });

    /**
     * @tc.name   DataView6Test106
     * @tc.number SUB_BUILTINS_DataView6_TEST_10600
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = -60;
      const testVal2 = 45;
      view.setInt8(0, testVal1);
      view.setInt8(1, testVal2);
      const result1 = view.getInt8(0);
      const result2 = view.getInt8(1);
      expect(((result1 >> 3) & result2).toString()).assertEqual("40");
    });

    /**
     * @tc.name   DataView6Test107
     * @tc.number SUB_BUILTINS_DataView6_TEST_10700
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(25);
      const offset = 15;
      const testVal = 64;
      const view = new DataView(buffer);
      view.setInt8(offset, testVal);
      const result = view.getInt8(offset);
      const test: Offset25ViewTest = { view, offset, testVal, result };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView6Test108
     * @tc.number SUB_BUILTINS_DataView6_TEST_10800
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = 119;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(result.toString(8).toUpperCase()).assertEqual("167");
    });

    /**
     * @tc.name   DataView6Test109
     * @tc.number SUB_BUILTINS_DataView6_TEST_10900
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(14);
      const view1 = new DataView(buffer, 0, 10);
      const view2 = new DataView(buffer, 4, 10);
      const offsets1: int[] = [1, 3, 5];
      const offsets2: int[] = [1, 3, 5];
      const vals = [-17, 34, -51];
      offsets1.forEach((offset: int, idx: int): void => view1.setInt8(offset, vals[idx]));
      const results = offsets2.map((offset: int): int => view2.getInt8(offset));
      const product = results.reduce((acc, curr) => acc * curr, 1);
      expect(product.toString()).assertEqual("0");
    });

    /**
     * @tc.name   DataView6Test110
     * @tc.number SUB_BUILTINS_DataView6_TEST_11000
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = 59;
      const testVal2 = 87;
      view.setInt8(0, testVal1);
      view.setInt8(1, testVal2);
      const result1 = view.getInt8(0);
      const result2 = view.getInt8(1);
      expect(((result1 ^ result2) >> 1).toString()).assertEqual("54");
    });

    /**
     * @tc.name   DataView6Test111
     * @tc.number SUB_BUILTINS_DataView6_TEST_11100
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 0, 8);
      const testVal = -107;
      const offset = 6;
      view.setInt8(offset, testVal);
      const result = view.getInt8(offset);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView6Test112
     * @tc.number SUB_BUILTINS_DataView6_TEST_11200
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffers = [new ArrayBuffer(2), new ArrayBuffer(2), new ArrayBuffer(2)];
      const vals = [29, -58, 87];
      const summary = `正数：2个，负数：1个，总和：58`;
      const views = buffers.map((buf, idx) => {
        const view = new DataView(buf);
        view.setInt8(0, vals[idx]);
        return view;
      });
      const results = views.map(view => view.getInt8(0));
      const positiveCount = results.filter(res => res > 0).length;
      const negativeCount = results.filter(res => res < 0).length;
      const total = results.reduce((acc, curr) => acc + curr, 0);
      const test: MultiBufferFormatSummaryTest = { views, vals, summary };
      expect(`正数：${positiveCount}个，负数：${negativeCount}个，总和：${total}`).assertEqual(test.summary);
    });

    /**
     * @tc.name   DataView6Test113
     * @tc.number SUB_BUILTINS_DataView6_TEST_11300
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = 47;
      const testVal2 = 9;
      const testVal3 = 13;
      view.setInt8(0, testVal1);
      view.setInt8(1, testVal2);
      view.setInt8(2, testVal3);
      const results = [view.getInt8(0), view.getInt8(1), view.getInt8(2)];
      expect((results[0] % results[1] + results[2]).toString()).assertEqual("15");
    });

    /**
     * @tc.name   DataView6Test114
     * @tc.number SUB_BUILTINS_DataView6_TEST_11400
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = 63;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(`+${result.toString(2)}`).assertEqual("+111111");
    });

    /**
     * @tc.name   DataView6Test115
     * @tc.number SUB_BUILTINS_DataView6_TEST_11500
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(18);
      const offset = 8;
      const testVal = -73;
      const view = new DataView(buffer);
      view.setInt8(offset, testVal);
      const result = view.getInt8(offset);
      const test: Offset18ViewTest = { view, offset, testVal, result };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView6Test116
     * @tc.number SUB_BUILTINS_DataView6_TEST_11600
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = 53;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(Number.isInteger(result) && result !== 0).assertEqual(true);
    });

    /**
     * @tc.name   DataView6Test117
     * @tc.number SUB_BUILTINS_DataView6_TEST_11700
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const offset = 4;
      const testVal = -41;
      const formatStr = "值：0（二进制：11111110）";
      const view1 = new DataView(buffer, 0, 8);
      const view2 = new DataView(buffer, 2, 10);
      view1.setInt8(offset, testVal);
      const result = view2.getInt8(offset);
      const binary = result.toString(2).padStart(8, '1');
      const test: NestedViewFormatTest = { view1, view2, offset, testVal, formatStr };
      expect(`值：${result}（二进制：${binary}）`).assertEqual(test.formatStr);
    });

    /**
     * @tc.name   DataView6Test118
     * @tc.number SUB_BUILTINS_DataView6_TEST_11800
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = 21;
      const testVal2 = 38;
      view.setInt8(0, testVal1);
      view.setInt8(1, testVal2);
      const result1 = view.getInt8(0);
      const result2 = view.getInt8(1);
      expect(((result1 | result2) << 2).toString()).assertEqual("220");
    });

    /**
     * @tc.name   DataView6Test119
     * @tc.number SUB_BUILTINS_DataView6_TEST_11900
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffers = [new ArrayBuffer(2), new ArrayBuffer(2), new ArrayBuffer(2), new ArrayBuffer(2)];
      const vals = [-19, 38, -57, 76];
      const views = buffers.map((buf, idx) => {
        const view = new DataView(buf);
        view.setInt8(0, vals[idx]);
        return view;
      });
      const results = views.map((view): number => view.getInt8(0));
      const avg = results.reduce((acc, curr) => acc + curr, 0) / results.length;
      const formatted = `运算结果：总和=${results.reduce((a,b)=>a+b,0)}，平均值=${avg}，最大值=${Math.max(...results)}`;
      expect(formatted).assertEqual("运算结果：总和=38，平均值=9.5，最大值=76");
    });

    /**
     * @tc.name   DataView6Test120
     * @tc.number SUB_BUILTINS_DataView6_TEST_12000
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const minVal = -128;
      view.setInt8(0, minVal);
      const result = view.getInt8(0);
      expect(result + 10).assertEqual(-118);
    });
    /**
     * @tc.name   DataView6Test121
     * @tc.number SUB_BUILTINS_DataView6_TEST_12100
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const offset = 8;
      const testVal = 127;
      const view1 = new DataView(buffer, 0, 9);
      const view2 = new DataView(buffer, 1, 9);
      view1.setInt8(offset, testVal);
      const result = view2.getInt8(offset - 1);
      const test: CrossViewBoundaryTest = { view1, view2, offset, testVal };
      expect(result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView6Test122
     * @tc.number SUB_BUILTINS_DataView6_TEST_12200
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = 65;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      const leftShift = (result << 1) | (result >> 7);
      expect(leftShift & 0xff).assertEqual(130);
    });

    /**
     * @tc.name   DataView6Test123
     * @tc.number SUB_BUILTINS_DataView6_TEST_12300
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(15);
      const view = new DataView(buffer);
      const segmentOffset = 5;
      const segmentLength = 4;
      const testVal = -93;
      view.setInt8(segmentOffset + segmentLength - 1, testVal);
      const result = view.getInt8(segmentOffset + segmentLength - 1);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView6Test124
     * @tc.number SUB_BUILTINS_DataView6_TEST_12400
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = -128;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(result - 1 < -128).assertEqual(true);
    });

    /**
     * @tc.name   DataView6Test125
     * @tc.number SUB_BUILTINS_DataView6_TEST_12500
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffers = [new ArrayBuffer(2), new ArrayBuffer(2)];
      const vals = [-128, 127];
      const opResult = vals[0] + vals[1];
      const views = buffers.map((buf, idx) => {
        const view = new DataView(buf);
        view.setInt8(0, vals[idx]);
        return view;
      });
      const results = views.map(view => view.getInt8(0));
      const test: MultiBufferBoundaryOpTest = { views, vals, opResult };
      expect(results[0] + results[1]).assertEqual(test.opResult);
    });

    /**
     * @tc.name   DataView6Test126
     * @tc.number SUB_BUILTINS_DataView6_TEST_12600
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = 53;
      const testVal2 = 6;
      const testVal3 = 4;
      view.setInt8(0, testVal1);
      view.setInt8(1, testVal2);
      view.setInt8(2, testVal3);
      const results = [view.getInt8(0), view.getInt8(1), view.getInt8(2)];
      expect((results[0] % results[1]) * results[2]).assertEqual(20);
    });

    /**
     * @tc.name   DataView6Test127
     * @tc.number SUB_BUILTINS_DataView6_TEST_12700
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(1);
      const view = new DataView(buffer, 0, 1);
      const testVal = -128;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView6Test128
     * @tc.number SUB_BUILTINS_DataView6_TEST_12800
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = -47;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(`0x${result.toString(16).padStart(2, 'f')}`).assertEqual("0x-2f");
    });

    /**
     * @tc.name   DataView6Test129
     * @tc.number SUB_BUILTINS_DataView6_TEST_12900
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const offset = 6;
      const testVal = -127;
      const view1 = new DataView(buffer, 0, 8);
      const view2 = new DataView(buffer, 2, 6);
      view1.setInt8(offset, testVal);
      const result = view2.getInt8(offset - 2);
      const test: NestedViewBoundaryTest = { view1, view2, offset, testVal };
      expect(result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView6Test130
     * @tc.number SUB_BUILTINS_DataView6_TEST_13000
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = -128;
      const testVal2 = 8;
      view.setInt8(0, testVal1);
      view.setInt8(1, testVal2);
      const result1 = view.getInt8(0);
      const result2 = view.getInt8(1);
      expect(result1 / result2).assertEqual(-16);
    });

    /**
     * @tc.name   DataView6Test131
     * @tc.number SUB_BUILTINS_DataView6_TEST_13100
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal = -128;
      view.setInt8(1, testVal);
      const result = view.getInt8(1);
      expect(result % 7).assertEqual(-2);
    });

    /**
     * @tc.name   DataView6Test132
     * @tc.number SUB_BUILTINS_DataView6_TEST_13200
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const offsets: int[] = [1, 3, 5];
      const vals: int[] = [-128, 64, 127];
      const opResult = (vals[0] + vals[1]) * vals[2];
      const view = new DataView(buffer);
      offsets.forEach((offset: int, idx: int): void => view.setInt8(offset, vals[idx]));
      const results = offsets.map((offset: int): int => view.getInt8(offset));
      const test: MultiOffsetBoundaryOpTest = { view, offsets, vals, opResult };
      expect((results[0] + results[1]) * results[2]).assertEqual(test.opResult);
    });

    /**
     * @tc.name   DataView6Test133
     * @tc.number SUB_BUILTINS_DataView6_TEST_13300
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = -128;
      view.setInt8(0, testVal);
      const result: number = view.getInt8(0);
      expect(result.toExponential(2)).assertEqual("-1.28e+2");
    });

    /**
     * @tc.name   DataView6Test134
     * @tc.number SUB_BUILTINS_DataView6_TEST_13400
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const view = new DataView(buffer);
      const segment1 = [-128, -64, 0];
      const segment2 = [0, 64, 127];
      segment1.forEach((val, idx) => view.setInt8(idx, val));
      segment2.forEach((val, idx) => view.setInt8(3 + idx, val));
      view.setInt8(3, -32);
      const result1 = segment1.map((_, idx) => view.getInt8(idx));
      const result2 = segment2.map((_, idx) => view.getInt8(3 + idx));
      expect(JSON.stringify(result1)).assertEqual(JSON.stringify([-128, -64, 0]));
      expect(JSON.stringify(result2)).assertEqual(JSON.stringify([-32, 64, 127]));
    });

    /**
     * @tc.name   DataView6Test135
     * @tc.number SUB_BUILTINS_DataView6_TEST_13500
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = -128;
      const testVal2 = 63;
      view.setInt8(0, testVal1);
      view.setInt8(1, testVal2);
      const result1 = view.getInt8(0);
      const result2 = view.getInt8(1);
      expect(((result1 >> 1) ^ result2).toString()).assertEqual("-1");
    });

    /**
     * @tc.name   DataView6Test136
     * @tc.number SUB_BUILTINS_DataView6_TEST_13600
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = 63;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(`${((result as number / 127 * 100) as number).toFixed(0)}%`).assertEqual("50%");
    });

    /**
     * @tc.name   DataView6Test137
     * @tc.number SUB_BUILTINS_DataView6_TEST_13700
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(14);
      const view1 = new DataView(buffer, 0, 10);
      const view2 = new DataView(buffer, 4, 10);
      const offsets1: int[] = [1, 3, 5];
      const offsets2: int[] = [1, 3, 5];
      const vals = [-128, 0, 127];
      offsets1.forEach((offset: int, idx: int): void => view1.setInt8(offset, vals[idx]));
      const results = offsets2.map((offset: int): int => view2.getInt8(offset));
      const sum = results.reduce((acc, curr) => acc + curr, 0);
      expect(sum.toString()).assertEqual("127");
    });

    /**
     * @tc.name   DataView6Test138
     * @tc.number SUB_BUILTINS_DataView6_TEST_13800
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = 127;
      const testVal2 = -64;
      view.setInt8(0, testVal1);
      view.setInt8(1, testVal2);
      const result1 = view.getInt8(0);
      const result2 = view.getInt8(1);
      expect(((result1 | result2) >> 2).toString()).assertEqual("-1");
    });

    /**
     * @tc.name   DataView6Test139
     * @tc.number SUB_BUILTINS_DataView6_TEST_13900
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const view = new DataView(buffer, 0, 12);
      const testVal = -128;
      view.setInt8(5, testVal);
      const result = view.getInt8(5);
      expect(result).assertEqual(testVal);
    });

    /**
     * @tc.name   DataView6Test140
     * @tc.number SUB_BUILTINS_DataView6_TEST_14000
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(5);
      const view = new DataView(buffer);
      const testVal1 = -128;
      const testVal2 = 32;
      const testVal3 = 15;
      view.setInt8(0, testVal1);
      view.setInt8(1, testVal2);
      view.setInt8(2, testVal3);
      const results = [view.getInt8(0), view.getInt8(1), view.getInt8(2)];
      expect(((results[0] + results[1]) % results[2]).toString()).assertEqual("-6");
    });

    /**
     * @tc.name   DataView6Test141
     * @tc.number SUB_BUILTINS_DataView6_TEST_14100
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = 127;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(`8位有符号整数最大值：${result}（二进制：${result.toString(2)}）`).assertEqual("8位有符号整数最大值：127（二进制：1111111）");
    });

    /**
     * @tc.name   DataView6Test142
     * @tc.number SUB_BUILTINS_DataView6_TEST_14200
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(15);
      const offset = 7;
      const testVal = 0;
      const view = new DataView(buffer);
      view.setInt8(offset, testVal);
      const result = view.getInt8(offset);
      const test: Offset15ZeroTest = { view, offset, testVal, result };
      expect(test.result).assertEqual(test.testVal);
    });

    /**
     * @tc.name   DataView6Test143
     * @tc.number SUB_BUILTINS_DataView6_TEST_14300
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = 127;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(result + 1 > 127).assertEqual(true);
    });

    /**
     * @tc.name   DataView6Test144
     * @tc.number SUB_BUILTINS_DataView6_TEST_14400
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const offset = 4;
      const testVal = -128;
      const formatStr = "边界负值：0（十六进制：0x00）";
      const view1 = new DataView(buffer, 0, 8);
      const view2 = new DataView(buffer, 2, 10);
      view1.setInt8(offset, testVal);
      const result = view2.getInt8(offset);
      const hex = result.toString(16).padStart(2, '0');
      const test: NestedViewBoundaryFormatTest = { view1, view2, offset, testVal, formatStr };
      expect(`边界负值：${result}（十六进制：0x${hex}）`).assertEqual(test.formatStr);
    });

    /**
     * @tc.name   DataView6Test145
     * @tc.number SUB_BUILTINS_DataView6_TEST_14500
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const testVal1 = -128;
      const testVal2 = 127;
      const testVal3 = 64;
      view.setInt8(0, testVal1);
      view.setInt8(1, testVal2);
      view.setInt8(2, testVal3);
      const results = [view.getInt8(0), view.getInt8(1), view.getInt8(2)];
      expect((results[0] ^ results[1]) | results[2]).assertEqual(-1);
    });

    /**
     * @tc.name   DataView6Test146
     * @tc.number SUB_BUILTINS_DataView6_TEST_14600
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffers = [new ArrayBuffer(2), new ArrayBuffer(2), new ArrayBuffer(2), new ArrayBuffer(2)];
      const vals = [-128, -64, 64, 127];
      const views = buffers.map((buf, idx) => {
        const view = new DataView(buf);
        view.setInt8(0, vals[idx]);
        return view;
      });
      const results = views.map((view): number => view.getInt8(0));
      const formatted = `边界运算：最小值=${Math.min(...results)}，最大值=${Math.max(...results)}，总和=${results.reduce((a,b)=>a+b,0)}`;
      expect(formatted).assertEqual("边界运算：最小值=-128，最大值=127，总和=-1");
    });

    /**
     * @tc.name   DataView6Test147
     * @tc.number SUB_BUILTINS_DataView6_TEST_14700
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(5);
      const view = new DataView(buffer);
      const testVal1 = 35;
      const testVal2 = -12;
      const testVal3 = 8;
      view.setInt8(0, testVal1);
      view.setInt8(1, testVal2);
      view.setInt8(2, testVal3);
      const results = [view.getInt8(0), view.getInt8(1), view.getInt8(2)];
      expect((results[0] + results[1] * results[2] - 10).toString()).assertEqual("-71");
    });

    /**
     * @tc.name   DataView6Test148
     * @tc.number SUB_BUILTINS_DataView6_TEST_14800
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = -36;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      const binary = result.toString(2).padStart(8, result < 0 ? '1' : '0');
      expect(binary).assertEqual("1-100100");
    });

    /**
     * @tc.name   DataView6Test149
     * @tc.number SUB_BUILTINS_DataView6_TEST_14900
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(18);
      const view1 = new DataView(buffer, 0, 14);
      const view2 = new DataView(buffer, 5, 13);
      const offsets1: int[] = [2, 5, 8];
      const offsets2: int[] = [2, 5, 8];
      const vals = [-49, 73, -92];
      offsets1.forEach((offset: int, idx: int): void => view1.setInt8(offset, vals[idx]));
      const results = offsets2.map((offset: int, idx: int): int => view2.getInt8(offset - (idx === 2 ? 5 : 0)));
      expect((results[0] * results[1] + results[2]).toString()).assertEqual("-92");
    });

    /**
     * @tc.name   DataView6Test150
     * @tc.number SUB_BUILTINS_DataView6_TEST_15000
     * @tc.desc   test DataView getInt8()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView6Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      const testVal = -63;
      view.setInt8(0, testVal);
      const result = view.getInt8(0);
      expect(result > -128 && result < 127).assertEqual(true);
    });

  })
}

