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

class StaticViewCreator124 {
  static create() {
    const buffer = new ArrayBuffer(22);
    return new DataView(buffer, 6, 10);
  }
}

export default function DataView23Test() {
  describe('DataView23Test', () => {
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
     * @tc.name   DataView23Test001
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_0100
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(16);
      const dv1 = new DataView(buffer1);
      expect(dv1.buffer).assertEqual(buffer1);
    });

    /**
     * @tc.name   DataView23Test002
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_0200
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer2 = new ArrayBuffer(8);
      const dv2 = new DataView(buffer2);
      expect(dv2.buffer).assertEqual(buffer2);
    });

    /**
     * @tc.name   DataView23Test003
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_0300
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer3 = new ArrayBuffer(32);
      const dv3 = new DataView(buffer3, 4, 12);
      expect(dv3.buffer).assertEqual(buffer3);
    });

    /**
     * @tc.name   DataView23Test004
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_0400
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer4 = new ArrayBuffer(0);
      const dataView4 = new DataView(buffer4);
      expect(dataView4.buffer).assertEqual(buffer4);
    });

    /**
     * @tc.name   DataView23Test005
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_0500
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer5 = new ArrayBuffer(1024);
      const dataView5 = new DataView(buffer5, 512, 256);
      expect(dataView5.buffer).assertEqual(buffer5);
    });

    /**
     * @tc.name   DataView23Test006
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_0600
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer6 = new ArrayBuffer(64);
      const dataView6_1 = new DataView(buffer6, 0, 16);
      const dataView6_2 = new DataView(buffer6, 16, 32);
      const dataView6_3 = new DataView(buffer6, 48, 16);
      expect(dataView6_1.buffer).assertEqual(buffer6);
      expect(dataView6_2.buffer).assertEqual(buffer6);
      expect(dataView6_3.buffer).assertEqual(buffer6);
    });

    /**
     * @tc.name   DataView23Test007
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_0700
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer7 = new ArrayBuffer(32);
      const dataView7 = new DataView(buffer7, 32, 0);
      expect(dataView7.buffer).assertEqual(buffer7);
    });

    /**
     * @tc.name   DataView23Test008
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_0800
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const typedArray8 = new Uint16Array(8);
      const buffer8 = typedArray8.buffer;
      const dataView8 = new DataView(buffer8);
      expect(dataView8.buffer).assertEqual(buffer8);
    });

    /**
     * @tc.name   DataView23Test009
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_0900
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer9 = new ArrayBuffer(16);
      const dataView9 = new DataView(buffer9);
      const typedArray9 = new Float32Array(buffer9);
      typedArray9[0] = 3.14;
      expect(dataView9.buffer).assertEqual(buffer9);
    });

    /**
     * @tc.name   DataView23Test010
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_1000
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer10 = new ArrayBuffer(0);
      const dataView10_1 = new DataView(buffer10);
      const dataView10_2 = new DataView(buffer10, 0, 0);
      expect(dataView10_1.buffer).assertEqual(dataView10_2.buffer);
    });

    /**
     * @tc.name   DataView23Test011
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_1100
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer11 = new ArrayBuffer(24);
      const dataView11 = new DataView(buffer11, 0, buffer11.byteLength);
      expect(dataView11.buffer).assertEqual(buffer11);
    });

    /**
     * @tc.name   DataView23Test013
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_1300
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer13Original = new ArrayBuffer(100);
      const buffer13Sliced = buffer13Original.slice(20, 50);
      const dataView13 = new DataView(buffer13Sliced);
      expect(dataView13.buffer).assertEqual(buffer13Sliced);
    });

    /**
     * @tc.name   DataView23Test014
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_1400
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer14A = new ArrayBuffer(16);
      const buffer14B = new ArrayBuffer(16);
      const dataView14 = new DataView(buffer14A);
      expect(dataView14.buffer === buffer14B).assertEqual(false);
    });

    /**
     * @tc.name   DataView23Test016
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_1600
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer16 = new ArrayBuffer(56);
      const dataView16_1 = new DataView(buffer16);
      const dataView16_2 = new DataView(buffer16);
      expect(dataView16_1.buffer).assertEqual(dataView16_2.buffer);
    });

    /**
     * @tc.name   DataView23Test017
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_1700
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const typedArray17 = Uint8Array.from([1, 2, 3, 4]);
      const buffer17 = typedArray17.buffer;
      const dataView17 = new DataView(buffer17, 1, 2);
      expect(dataView17.buffer).assertEqual(buffer17);
    });

    /**
     * @tc.name   DataView23Test018
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_1800
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer18 = new ArrayBuffer(8);
      const dataView18 = new DataView(buffer18);
      dataView18.setInt32(0, 12345);
      expect(dataView18.buffer).assertEqual(buffer18);
    });

    /**
     * @tc.name   DataView23Test019
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_1900
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer19 = new ArrayBuffer(1024 * 1024);
      const dataView19 = new DataView(buffer19, 512 * 1024, 256 * 1024);
      expect(dataView19.buffer).assertEqual(buffer19);
    });

    /**
     * @tc.name   DataView23Test020
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_2000
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer20 = new ArrayBuffer(64);
      const dataView20 = new DataView(buffer20, 32, 16);
      expect(dataView20.buffer).assertEqual(buffer20);
    });

    /**
     * @tc.name   DataView23Test021
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_2100
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer21 = new ArrayBuffer(48);
      const dataView21_1 = new DataView(buffer21);
      const dataView21_2 = new DataView(dataView21_1.buffer, 16, 24);
      expect(dataView21_2.buffer).assertEqual(buffer21);
    });

    /**
     * @tc.name   DataView23Test022
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_2200
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer21 = new ArrayBuffer(48);
      const dataView21_1 = new DataView(buffer21);
      const dataView21_2 = new DataView(dataView21_1.buffer, 16, 24);
      expect(dataView21_2.buffer).assertEqual(buffer21);
    });

    /**
     * @tc.name   DataView23Test023
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_2300
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer23A = new ArrayBuffer(12);
      const buffer23B = new ArrayBuffer(12);
      const dataView23A = new DataView(buffer23A);
      const dataView23B = new DataView(buffer23B);
      expect(dataView23A.buffer === dataView23B.buffer).assertEqual(false);
    });

    /**
     * @tc.name   DataView23Test024
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_2400
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer24 = new ArrayBuffer(20);
      const dataView24 = new DataView(buffer24, 15, 5);
      expect(dataView24.buffer).assertEqual(buffer24);
    });

    /**
     * @tc.name   DataView23Test025
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_2500
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer25Original = new ArrayBuffer(50);
      const buffer25Copy = buffer25Original.slice(0);
      const dataView25 = new DataView(buffer25Copy);
      expect(dataView25.buffer).assertEqual(buffer25Copy);
    });

    /**
     * @tc.name   DataView23Test027
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_2700
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer27 = new ArrayBuffer(100);
      const dataView27_1 = new DataView(buffer27, 0, 1);
      const dataView27_2 = new DataView(buffer27, 99, 1);
      const dataView27_3 = new DataView(buffer27, 50, 50);
      expect(dataView27_1.buffer).assertEqual(buffer27);
      expect(dataView27_2.buffer).assertEqual(buffer27);
      expect(dataView27_3.buffer).assertEqual(buffer27);
    });

    /**
     * @tc.name   DataView23Test028
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_2800
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer28 = new ArrayBuffer(8);
      const dataView28 = new DataView(buffer28);
      expect(dataView28.buffer instanceof ArrayBuffer).assertEqual(true);
    });

    /**
     * @tc.name   DataView23Test029
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_2900
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer29 = new ArrayBuffer(16);
      const sameAsBuffer29 = buffer29;
      const dataView29 = new DataView(buffer29);
      expect(dataView29.buffer).assertEqual(sameAsBuffer29);
    });

    /**
     * @tc.name   DataView23Test030
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_3000
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer30 = new ArrayBuffer(24);
      const dataView30 = new DataView(buffer30);
      expect(dataView30.buffer === dataView30.buffer).assertEqual(true);
    });

    /**
     * @tc.name   DataView23Test031
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_3100
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const typedArray31 = new Uint32Array(5);
      const buffer31 = typedArray31.buffer;
      const dataView31 = new DataView(buffer31, 4, 12);
      expect(dataView31.buffer).assertEqual(buffer31);
    });

    /**
     * @tc.name   DataView23Test032
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_3200
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emptyBuffer32 = new ArrayBuffer(0);
      const dataView32 = new DataView(emptyBuffer32, 0, 0);
      expect(dataView32.buffer).assertEqual(emptyBuffer32);
    });

    /**
     * @tc.name   DataView23Test033
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_3300
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer33 = new ArrayBuffer(1000);
      const dataView33 = new DataView(buffer33, 990, 10);
      expect(dataView33.buffer).assertEqual(buffer33);
    });

    /**
     * @tc.name   DataView23Test034
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_3400
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int8Array34 = new Int8Array([-1, 2, -3]);
      const buffer34 = int8Array34.buffer;
      const dataView34 = new DataView(buffer34, 1, 1);
      expect(dataView34.buffer).assertEqual(buffer34);
    });

    /**
     * @tc.name   DataView23Test035
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_3500
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer35 = new ArrayBuffer(1);
      const dataView35 = new DataView(buffer35);
      expect(dataView35.buffer).assertEqual(buffer35);
    });

    /**
     * @tc.name   DataView23Test036
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_3600
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer36 = new ArrayBuffer(10);
      const dataView36 = new DataView(buffer36);
      const slicedBuffer36 = buffer36.slice(0);
      expect(dataView36.buffer === slicedBuffer36).assertEqual(false);
    });

    /**
     * @tc.name   DataView23Test037
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_3700
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const float64Array37 = new Float64Array([3.14, 2.718]);
      const buffer37 = float64Array37.buffer;
      const dataView37 = new DataView(buffer37, 8, 8);
      expect(dataView37.buffer).assertEqual(buffer37);
    });

    /**
     * @tc.name   DataView23Test039
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_3900
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer39 = new ArrayBuffer(24);
      const dataView39 = new DataView(buffer39, 0, 24);
      expect(dataView39.buffer).assertEqual(buffer39);

    });

    /**
     * @tc.name   DataView23Test040
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_4000
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer40A = new ArrayBuffer(4);
      new Uint8Array(buffer40A).set([1, 2, 3, 4]);
      const buffer40B = new ArrayBuffer(4);
      new Uint8Array(buffer40B).set([1, 2, 3, 4]);
      const dataView40 = new DataView(buffer40A);
      expect(dataView40.buffer === buffer40B).assertEqual(false);
    });

    /**
     * @tc.name   DataView23Test042
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_4200
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer42 = new ArrayBuffer(18);
      const dataView42 = new DataView(buffer42, 0, 0);
      expect(dataView42.buffer).assertEqual(buffer42);
    });

    /**
     * @tc.name   DataView23Test043
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_4300
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bigIntArray43 = new BigInt64Array([-123n, 456n]);
      const buffer43 = bigIntArray43.buffer;
      const dataView43 = new DataView(buffer43);
      expect(dataView43.buffer).assertEqual(buffer43);
    });

    /**
     * @tc.name   DataView23Test044
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_4400
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer44 = new ArrayBuffer(7);
      const dataView44 = new DataView(buffer44, 3, 2);
      expect(dataView44.buffer.byteLength).assertEqual(7);
    });

    /**
     * @tc.name   DataView23Test045
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_4500
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer45 = new ArrayBuffer(20);
      const dataView45_1 = new DataView(buffer45);
      const dataView45_2 = new DataView(buffer45);
      dataView45_1.setUint8(0, 0xFF);
      expect(dataView45_2.buffer).assertEqual(buffer45);
    });

    /**
     * @tc.name   DataView23Test046
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_4600
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer46 = new ArrayBuffer(5);
      const dataView46 = new DataView(buffer46);
      expect(typeof dataView46.buffer === 'string').assertEqual(false);
    });

    /**
     * @tc.name   DataView23Test047
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_4700
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const mockBuffer47 = new Uint8Array([10, 20, 30]).buffer;
      const dataView47 = new DataView(mockBuffer47);
      expect(dataView47.buffer).assertEqual(mockBuffer47);
    });

    /**
     * @tc.name   DataView23Test049
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_4900
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer49 = new ArrayBuffer(2);
      const dataView49 = new DataView(buffer49, 1, 1);
      expect(dataView49.buffer).assertEqual(buffer49);
    });

    /**
     * @tc.name   DataView23Test050
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_5000
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer50 = new ArrayBuffer(11);
      const dataView50 = new DataView(buffer50);
      expect(dataView50.buffer === dataView50.buffer).assertEqual(true);
    });

    /**
     * @tc.name   DataView23Test051
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_5100
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer50 = new ArrayBuffer(11);
      const dataView50 = new DataView(buffer50);
      expect(dataView50.buffer === dataView50.buffer).assertEqual(true);
    });

    /**
     * @tc.name   DataView23Test052
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_5200
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dataView52 = (() => {
        const buffer = new ArrayBuffer(28);
        return new DataView(buffer, 4, 20);
      })();
      const buffer52 = dataView52.buffer;
      expect(dataView52.buffer).assertEqual(buffer52);
    });

    /**
     * @tc.name   DataView23Test053
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_5300
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer53 = new ArrayBuffer(20);
      const dataView53 = new DataView(buffer53, 15, 5);
      expect(dataView53.buffer).assertEqual(buffer53);
    });

    /**
     * @tc.name   DataView23Test054
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_5400
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const clampedArray54 = new Uint8ClampedArray([256, -1]);
      const buffer54 = clampedArray54.buffer;
      const dataView54 = new DataView(buffer54);
      expect(dataView54.buffer).assertEqual(buffer54);
    });

    /**
     * @tc.name   DataView23Test055
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_5500
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer55 = new ArrayBuffer(6);
      const dataView55 = new DataView(buffer55);
      expect(dataView55.buffer === null).assertEqual(false);
    });

    /**
     * @tc.name   DataView23Test056
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_5600
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView23Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const typedArray56 = Array.from([10, 20, 30], (x: int) => x);
    //   const buffer56 = new Uint16Array(typedArray56).buffer;
    //   const dataView56 = new DataView(buffer56);
    //   expect(dataView56.buffer).assertEqual(buffer56);
    // });

    /**
     * @tc.name   DataView23Test057
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_5700
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer57 = new ArrayBuffer(30);
      const dataView57 = new DataView(buffer57, 5, 20);
      expect(dataView57.buffer.byteLength).assertEqual(buffer57.byteLength);
    });

    /**
     * @tc.name   DataView23Test058
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_5800
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer58 = new ArrayBuffer(40);
      const dataView58_1 = new DataView(buffer58);
      const dataView58_2 = new DataView(dataView58_1.buffer, 10, 10);
      const dataView58_3 = new DataView(dataView58_2.buffer, 5, 5);
      expect(dataView58_3.buffer).assertEqual(buffer58);
    });

    /**
     * @tc.name   DataView23Test059
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_5900
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer59 = new ArrayBuffer(8);
      const dataView59 = new DataView(buffer59);
      JSON.stringify(dataView59.buffer);
      expect(dataView59.buffer).assertEqual(buffer59);
    });

    /**
     * @tc.name   DataView23Test060
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_6000
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const largeOffset60 = 1024 * 1024;
      const buffer60 = new ArrayBuffer(largeOffset60 + 100);
      const dataView60 = new DataView(buffer60, largeOffset60, 50);
      expect(dataView60.buffer).assertEqual(buffer60);
    });

    /**
     * @tc.name   DataView23Test061
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_6100
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer61 = new ArrayBuffer(12);
      const dataView61 = new DataView(buffer61);
      expect(Array.isArray(dataView61.buffer)).assertEqual(false);
    });

    /**
     * @tc.name   DataView23Test062
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_6200
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer62Original = new ArrayBuffer(50);
      const dataView62Original = new DataView(buffer62Original);
      const buffer62Sliced = dataView62Original.buffer.slice(10, 30);
      const dataView62Sliced = new DataView(buffer62Sliced);
      expect(dataView62Sliced.buffer).assertEqual(buffer62Sliced);
    });
    /**
     * @tc.name   DataView23Test063
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_6300
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int16Array63 = new Int16Array([-123, 456]);
      const buffer63 = int16Array63.buffer;
      const dataView63 = new DataView(buffer63, 2, 2);
      expect(dataView63.buffer).assertEqual(buffer63);
    });

    /**
     * @tc.name   DataView23Test064
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_6400
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer64 = new ArrayBuffer(5);
      const dataView64 = new DataView(buffer64);
      expect(dataView64.buffer instanceof Object && !(dataView64.buffer instanceof ArrayBuffer)).assertEqual(false);

    });

    /**
     * @tc.name   DataView23Test065
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_6500
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const outerTyped65 = new Uint32Array(4);
      const innerTyped65 = new Float32Array(outerTyped65.buffer);
      const dataView65 = new DataView(innerTyped65.buffer);
      expect(dataView65.buffer).assertEqual(outerTyped65.buffer);
    });

    /**
     * @tc.name   DataView23Test066
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_6600
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emptyBuffer66 = new ArrayBuffer(0);
      const dataView66 = new DataView(emptyBuffer66);
      expect(dataView66.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   DataView23Test067
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_6700
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer67 = new ArrayBuffer(20);
      const dataView67_1 = new DataView(buffer67, 0, 10);
      const dataView67_2 = new DataView(buffer67, 10, 0);
      expect(dataView67_2.buffer).assertEqual(buffer67);
    });

    /**
     * @tc.name   DataView23Test068
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_6800
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer68 = new ArrayBuffer(30);
      const dataView68_1 = new DataView(buffer68);
      const dataView68_2 = new DataView(dataView68_1.buffer, 10, 15);
      expect(dataView68_2.buffer).assertEqual(buffer68);
    });

    /**
     * @tc.name   DataView23Test070
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_7000
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bigBuffer70 = new ArrayBuffer(2 * 1024 * 1024);
      const dataView70 = new DataView(bigBuffer70, 1024 * 1024, 512 * 1024);
      expect(dataView70.buffer).assertEqual(bigBuffer70);
    });

    /**
     * @tc.name   DataView23Test072
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_7200
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalInt32_72 = new Int32Array(10);
      const slicedBuffer72 = originalInt32_72.buffer.slice(8, 24);
      const dataView72 = new DataView(slicedBuffer72);
      expect(dataView72.buffer).assertEqual(slicedBuffer72);
    });

    /**
     * @tc.name   DataView23Test073
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_7300
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer73 = new ArrayBuffer(6);
      const dataView73 = new DataView(buffer73);
      expect(typeof dataView73.buffer === 'function').assertEqual(false);
    });

    /**
     * @tc.name   DataView23Test074
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_7400
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer74 = new ArrayBuffer(40);
      const dataView74_1 = new DataView(buffer74, 0, 20);
      const dataView74_2 = new DataView(buffer74, 20, 20);
      expect(dataView74_1.buffer === dataView74_2.buffer).assertEqual(true);
    });

    /**
     * @tc.name   DataView23Test075
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_7500
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const mappedTyped75 = new Uint8Array([1, 2, 3]).map(x => x * 2);
      const buffer75 = mappedTyped75.buffer;
      const dataView75 = new DataView(buffer75);
      expect(dataView75.buffer).assertEqual(buffer75);
    });

    /**
     * @tc.name   DataView23Test077
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_7700
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer77 = new ArrayBuffer(9);
      const sameBuffer77 = buffer77;
      const dataView77 = new DataView(buffer77);
      expect(dataView77.buffer === sameBuffer77).assertEqual(true);
    });

    /**
     * @tc.name   DataView23Test078
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_7800
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint16Array78 = new Uint16Array([0x1234, 0x5678]);
      const buffer78 = uint16Array78.buffer;
      const dataView78 = new DataView(buffer78);
      uint16Array78[0] = 0xFFFF; // 修改内容
      expect(dataView78.buffer).assertEqual(buffer78);
    });

    /**
     * @tc.name   DataView23Test079
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_7900
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const tinyBuffer79 = new ArrayBuffer(3);
      const dataView79 = new DataView(tinyBuffer79, 1, 2);
      expect(dataView79.buffer).assertEqual(tinyBuffer79);
    });

    /**
     * @tc.name   DataView23Test080
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_8000
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer80 = new ArrayBuffer(7);
      const dataView80 = new DataView(buffer80);
      dataView80.buffer.toString();
      expect(dataView80.buffer).assertEqual(buffer80);
    });

    /**
     * @tc.name   DataView23Test081
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_8100
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const rootBuffer81 = new ArrayBuffer(50);
      const level1View81 = new DataView(rootBuffer81, 10, 30);
      const level2View81 = new DataView(level1View81.buffer, 5, 20);
      const level3View81 = new DataView(level2View81.buffer, 5, 10);
      expect(level3View81.buffer).assertEqual(rootBuffer81);
    });

    /**
     * @tc.name   DataView23Test082
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_8200
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer82 = new ArrayBuffer(11);
      const dataView82 = new DataView(buffer82);
      expect(typeof dataView82.buffer === 'symbol').assertEqual(false);
    });

    /**
     * @tc.name   DataView23Test083
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_8300
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalBuffer83 = new ArrayBuffer(100);
      const sliced83 = originalBuffer83.slice(30, 70);
      const dataView83 = new DataView(sliced83, 10, 20);
      expect(dataView83.buffer).assertEqual(sliced83);
    });

    /**
     * @tc.name   DataView23Test084
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_8400
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer84 = new ArrayBuffer(16);
      const dataView84 = new DataView(buffer84);
      const bufferArray84 = [dataView84.buffer];
      expect(dataView84.buffer).assertEqual(bufferArray84[0]);
    });

    /**
     * @tc.name   DataView23Test085
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_8500
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const float32Array85 = new Float32Array([1.1, 2.2, 3.3]);
      const buffer85 = float32Array85.buffer;
      const dataView85 = new DataView(buffer85, 4, 8);
      expect(dataView85.buffer).assertEqual(buffer85);
    });

    /**
     * @tc.name   DataView23Test086
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_8600
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer86 = new ArrayBuffer(25);
      const dataView86 = new DataView(buffer86, 5, 15);
      expect(dataView86.buffer.byteLength === buffer86.byteLength).assertEqual(true);
    });

    /**
     * @tc.name   DataView23Test088
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_8800
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bigUintArray88 = new BigUint64Array([1234567890123456789n]);
      const buffer88 = bigUintArray88.buffer;
      const dataView88 = new DataView(buffer88);
      expect(dataView88.buffer).assertEqual(buffer88);
    });

    /**
     * @tc.name   DataView23Test089
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_8900
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer89 = new ArrayBuffer(4);
      const dataView89 = new DataView(buffer89);
      expect(typeof dataView89.buffer === 'boolean').assertEqual(false);
    });

    /**
     * @tc.name   DataView23Test090
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_9000
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sharedBuffer90 = new ArrayBuffer(30);
      const view90_1 = new DataView(sharedBuffer90);
      const view90_2 = new DataView(sharedBuffer90, 10, 10);
      new Uint8Array(sharedBuffer90).fill(0xFF);
      expect(view90_1.buffer === view90_2.buffer).assertEqual(true);
    });

    /**
     * @tc.name   DataView23Test091
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_9100
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const filledTyped91 = new Uint32Array(5).fill(0xDEADBEEF);
      const buffer91 = filledTyped91.buffer;
      const dataView91 = new DataView(buffer91, 8, 8);
      expect(dataView91.buffer).assertEqual(buffer91);
    });

    /**
     * @tc.name   DataView23Test092
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_9200
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer92 = new ArrayBuffer(8);
      const dataView92 = new DataView(buffer92);
      expect(typeof dataView92.buffer).assertEqual('object');
    });

    /**
     * @tc.name   DataView23Test093
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_9300
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int32Array93 = new Int32Array([100, 200, 300, 400]);
      const subArray93 = int32Array93.subarray(1, 3);
      const buffer93 = subArray93.buffer;
      const dataView93 = new DataView(buffer93, 4, 4);
      expect(dataView93.buffer).assertEqual(buffer93);
    });

    /**
     * @tc.name   DataView23Test096
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_9600
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emptyTyped96 = new Uint16Array(0);
      const buffer96 = emptyTyped96.buffer;
      const dataView96 = new DataView(buffer96);
      expect(dataView96.buffer).assertEqual(buffer96);
    });

    /**
     * @tc.name   DataView23Test097
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_9700
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const rootBuffer97 = new ArrayBuffer(32);
      const layer1Typed97 = new Uint8Array(rootBuffer97);
      const layer2Typed97 = new Uint32Array(layer1Typed97.buffer);
      const dataView97 = new DataView(layer2Typed97.buffer, 8, 16);
      expect(dataView97.buffer).assertEqual(rootBuffer97);
    });

    /**
     * @tc.name   DataView23Test098
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_9800
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer98 = new ArrayBuffer(10);
      const dataView98 = new DataView(buffer98);
      expect(ArrayBuffer.isView(new Uint8Array(dataView98.buffer))).assertEqual(true);
    });

    /**
     * @tc.name   DataView23Test099
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_9900
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer99 = new ArrayBuffer(4);
      const dataView99 = new DataView(buffer99);
      dataView99.setInt32(0, 0x12345678, false);
      expect(dataView99.buffer).assertEqual(buffer99);
    });

    /**
     * @tc.name   DataView23Test100
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_10000
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer100 = new ArrayBuffer(15);
      const dataView100_1 = new DataView(buffer100);
      const dataView100_2 = new DataView(dataView100_1.buffer, buffer100.byteLength, 0);
      expect(dataView100_2.buffer).assertEqual(buffer100);
    });

    /**
     * @tc.name   DataView23Test102
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_10200
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer102 = new ArrayBuffer(8);
      new Uint8Array(buffer102).fill(0xFF);
      const dataView102 = new DataView(buffer102, 2, 4);
      expect(dataView102.buffer).assertEqual(buffer102);
    });

    /**
     * @tc.name   DataView23Test103
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_10300
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer103 = new ArrayBuffer(6);
      const dataView103 = new DataView(buffer103);
      expect(typeof dataView103.buffer === 'number').assertEqual(false);
    });

    /**
     * @tc.name   DataView23Test104
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_10400
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer104 = new ArrayBuffer(30);
      const dataView104 = new DataView(buffer104, 10, 10);
      expect(dataView104.buffer.byteLength).assertEqual(30);
    });

    /**
     * @tc.name   DataView23Test106
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_10600
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalUint8_106 = new Uint8Array([1, 2, 3, 4, 5]);
      const filtered106 = originalUint8_106.filter(x => x > 2);
      const buffer106 = filtered106.buffer;
      const dataView106 = new DataView(buffer106);
      expect(dataView106.buffer).assertEqual(buffer106);
    });

    /**
     * @tc.name   DataView23Test108
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_10800
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const smallBuffer108 = new ArrayBuffer(5);
      const dataView108 = new DataView(smallBuffer108, 2, 2);
      expect(dataView108.buffer).assertEqual(smallBuffer108);
    });

    /**
     * @tc.name   DataView23Test110
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_11000
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sharedBuffer110 = new ArrayBuffer(16);
      const view110_1 = new DataView(sharedBuffer110);
      const view110_2 = new DataView(sharedBuffer110);
      view110_1.setUint16(0, 0xABCD);
      expect(view110_2.buffer).assertEqual(sharedBuffer110);
    });

    /**
     * @tc.name   DataView23Test111
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_11100
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int16Original111 = new Int16Array([-1, -2, -3]);
      const mapped111 = int16Original111.map(x => x * -1);
      const buffer111 = mapped111.buffer;
      const dataView111 = new DataView(buffer111, 2, 2);
      expect(dataView111.buffer).assertEqual(buffer111);
    });

    /**
     * @tc.name   DataView23Test112
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_11200
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer112 = new ArrayBuffer(7);
      const dataView112 = new DataView(buffer112);
      expect(dataView112.buffer instanceof Date).assertEqual(false);
    });

    /**
     * @tc.name   DataView23Test113
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_11300
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalBuffer113 = new ArrayBuffer(20);
      const emptySlice113 = originalBuffer113.slice(0, 0);
      const dataView113 = new DataView(emptySlice113);
      expect(dataView113.buffer).assertEqual(emptySlice113);
    });

    /**
     * @tc.name   DataView23Test115
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_11500
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const float64Array115 = new Float64Array([1.23, 4.56, 7.89]);
      const buffer115 = float64Array115.buffer;
      const dataView115 = new DataView(buffer115, 16, 8);
      expect(dataView115.buffer).assertEqual(buffer115);
    });

    /**
     * @tc.name   DataView23Test118
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_11800
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bigInt64Array118 = new BigInt64Array([-9876543210n, 1234567890n]);
      const buffer118 = bigInt64Array118.buffer;
      const dataView118 = new DataView(buffer118, 8, 8);
      expect(dataView118.buffer).assertEqual(buffer118);
    });

    /**
     * @tc.name   DataView23Test119
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_11900
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer119 = new ArrayBuffer(5);
      const dataView119 = new DataView(buffer119);
      expect(dataView119.buffer instanceof RegExp).assertEqual(false);
    });

    /**
     * @tc.name   DataView23Test120
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_12000
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer120 = new ArrayBuffer(30);
      let view120 = new DataView(buffer120);
      const originalViewBuffer120 = view120.buffer;
      view120 = new DataView(new ArrayBuffer(10));
      expect(originalViewBuffer120).assertEqual(buffer120);
    });

    /**
     * @tc.name   DataView23Test121
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_12100
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const clampedArray121 = new Uint8ClampedArray([300, -50]);
      const buffer121 = clampedArray121.buffer;
      const dataView121 = new DataView(buffer121);
      expect(dataView121.buffer).assertEqual(buffer121);
    });

    /**
     * @tc.name   DataView23Test124
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_12400
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dataView124 = StaticViewCreator124.create();
      const originalBuffer124 = dataView124.buffer;
      expect(dataView124.buffer).assertEqual(originalBuffer124);
    });

    /**
     * @tc.name   DataView23Test126
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_12600
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const rootBuffer126 = new ArrayBuffer(40);
      const dataView126_1 = new DataView(rootBuffer126, 5, 30);
      const typedArray126 = new Uint16Array(dataView126_1.buffer, 10, 5);
      const dataView126_2 = new DataView(typedArray126.buffer, 2, 8);
      expect(dataView126_2.buffer).assertEqual(rootBuffer126);

    });

    /**
     * @tc.name   DataView23Test128
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_12800
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const smallBuffer128 = new ArrayBuffer(4);
      const dataView128 = new DataView(smallBuffer128, 1, 2);
      expect(dataView128.buffer).assertEqual(smallBuffer128);
    });

    /**
     * @tc.name   DataView23Test129
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_12900
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bigUintArray129 = new BigUint64Array([123n, 456n, 789n]);
      const subBigUint129 = bigUintArray129.subarray(0, 2);
      const buffer129 = subBigUint129.buffer;
      const dataView129 = new DataView(buffer129, 8, 8);
      expect(dataView129.buffer).assertEqual(buffer129);

    });

    /**
     * @tc.name   DataView23Test131
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_13100
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint8Array131 = new Uint8Array(5).fill(0x10);
      const mapped131 = uint8Array131.map(x => x + 0x05);
      const buffer131 = mapped131.buffer;
      const dataView131 = new DataView(buffer131);
      expect(dataView131.buffer).assertEqual(buffer131);
    });

    /**
     * @tc.name   DataView23Test132
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_13200
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer132 = new ArrayBuffer(10);
      const dataView132 = new DataView(buffer132);
      const weakSet132 = new WeakSet<ArrayBuffer>();
      weakSet132.add(dataView132.buffer);
      expect(weakSet132.has(buffer132)).assertEqual(true);
    });

    /**
     * @tc.name   DataView23Test133
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_13300
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sharedBuffer133 = new ArrayBuffer(16);
      new Uint8Array(sharedBuffer133).set([0x01, 0x02, 0x03, 0x04]);
      const floatView133 = new Float32Array(sharedBuffer133, 4, 3);
      const dataView133 = new DataView(floatView133.buffer);
      expect(dataView133.buffer).assertEqual(sharedBuffer133);
    });

    /**
     * @tc.name   DataView23Test134
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_13400
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer134 = new ArrayBuffer(20);
      const dataView134 = new DataView(buffer134, 10, 5);
      expect(dataView134.buffer).assertEqual(buffer134);
    });

    /**
     * @tc.name   DataView23Test135
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_13500
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const createView135 = () => {
        const buffer = new ArrayBuffer(18);
        return new DataView(buffer, 2, 14);
      };
      const dataView135 = createView135();
      const buffer135 = dataView135.buffer;
      expect(dataView135.buffer).assertEqual(buffer135);
    });

    /**
     * @tc.name   DataView23Test136
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_13600
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalBuffer136 = new ArrayBuffer(50);
      const midSlice136 = originalBuffer136.slice(15, 35);
      const dataView136 = new DataView(midSlice136, 5, 15);
      expect(dataView136.buffer).assertEqual(midSlice136);
    });

    /**
     * @tc.name   DataView23Test137
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_13700
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint32Array137 = new Uint32Array([10, 20, 30, 40]);
      const found137 = uint32Array137.find(x => x > 20);
      const buffer137 = uint32Array137.buffer;
      const dataView137 = new DataView(buffer137, 8, 4);
      expect(dataView137.buffer).assertEqual(buffer137);
    });

    /**
     * @tc.name   DataView23Test138
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_13800
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer138 = new ArrayBuffer(7);
      const dataView138 = new DataView(buffer138);
      expect(dataView138.buffer instanceof Error).assertEqual(false);
    });

    /**
     * @tc.name   DataView23Test141
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_14100
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let closureBuffer141 = new ArrayBuffer(16);
      const dataView141 = new DataView(closureBuffer141);
      closureBuffer141 = new ArrayBuffer(8);
      expect(dataView141.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.name   DataView23Test142
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_14200
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const float32Array142 = new Float32Array([1.1, 2.2, 3.3]);
      const entries142 = Array.from(float32Array142.entries());
      const buffer142 = float32Array142.buffer;
      const dataView142 = new DataView(buffer142, 4, 4);
      expect(dataView142.buffer).assertEqual(buffer142);
    });

    /**
     * @tc.name   DataView23Test144
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_14400
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emptyTyped144 = new Int16Array(0);
      const emptySub144 = emptyTyped144.subarray(0, 0);
      const buffer144 = emptySub144.buffer;
      const dataView144 = new DataView(buffer144);
      expect(dataView144.buffer).assertEqual(buffer144);
    });

    /**
     * @tc.name   DataView23Test146
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_14600
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int16Array146 = new Int16Array([-10, -20, -30]);
      const allNegative146 = int16Array146.every(x => x < 0);
      const buffer146 = int16Array146.buffer;
      const dataView146 = new DataView(buffer146, 2, 2);
      expect(dataView146.buffer).assertEqual(buffer146);
    });

    /**
     * @tc.name   DataView23Test148
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_14800
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dynamicLength148 = 10 + 5;
      const buffer148 = new ArrayBuffer(dynamicLength148);
      const dataView148 = new DataView(buffer148, 3, 7);
      expect(dataView148.buffer).assertEqual(buffer148);
    });

    /**
     * @tc.name   DataView23Test149
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_14900
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint8Array149 = new Uint8Array([1, 2, 3, 4, 5]);
      uint8Array149.copyWithin(0, 3);
      const buffer149 = uint8Array149.buffer;
      const dataView149 = new DataView(buffer149);
      expect(dataView149.buffer).assertEqual(buffer149);
    });

    /**
     * @tc.name   DataView23Test150
     * @tc.number SUB_BUILTINS_DATAVIEW23_TEST_15000
     * @tc.desc   test DataView buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView23Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer150 = new ArrayBuffer(8);
      const dataView150 = new DataView(buffer150);
      const stringified150 = JSON.stringify(dataView150.buffer);
      expect(stringified150 === '[object ArrayBuffer]').assertEqual(false);

    });

  })
}