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
import * as DataView18 from './DataView18';

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function DataView18Test() {
  describe('DataView18Test', () => {
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
     * @tc.name   DataView18Test001
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_0100
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(4);
      const dataView1 = new DataView(buffer1);
      dataView1.setInt16(0, 300, true);
      expect(dataView1.getInt16(0, true)).assertEqual(300);
    });

    /**
     * @tc.name   DataView18Test002
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_0200
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer2 = new ArrayBuffer(6);
      const dataView2 = new DataView(buffer2);
      dataView2.setInt16(2, -150, false);
      expect(dataView2.getInt16(2, false)).assertEqual(-150);
    });

    /**
     * @tc.name   DataView18Test003
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_0300
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer3 = new ArrayBuffer(4);
      const dataView3 = new DataView(buffer3);
      dataView3.setInt16(0, 65538, true);
      expect(dataView3.getInt16(0, true)).assertEqual(2);
    });

    /**
     * @tc.name   DataView18Test004
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_0400
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer4 = new ArrayBuffer(4);
      const dataView4 = new DataView(buffer4);
      dataView4.setInt16(0, -32768, true);
      expect(dataView4.getInt16(0, true)).assertEqual(-32768);
    });

    /**
     * @tc.name   DataView18Test005
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_0500
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer5 = new ArrayBuffer(4);
      const dataView5 = new DataView(buffer5);
      dataView5.setInt16(0, 32767, false);
      expect(dataView5.getInt16(0, false)).assertEqual(32767);
    });

    /**
     * @tc.name   DataView18Test006
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_0600
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer6 = new ArrayBuffer(4);
      const dataView6 = new DataView(buffer6);
      dataView6.setInt16(1, 0, true);
      expect(dataView6.getInt16(1, true)).assertEqual(0);
    });

    /**
     * @tc.name   DataView18Test007
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_0700
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer7 = new ArrayBuffer(4);
      const dataView7 = new DataView(buffer7);
      dataView7.setInt16(1, 0, false);
      expect(dataView7.getInt16(1, false)).assertEqual(0);
    });

    /**
     * @tc.name   DataView18Test008
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_0800
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer8 = new ArrayBuffer(6);
      const dataView8 = new DataView(buffer8);
      dataView8.setInt16(0, 1000, true);
      dataView8.setInt16(2, 2000, true);
      expect(dataView8.getInt16(0, true)).assertEqual(1000);
      expect(dataView8.getInt16(2, true)).assertEqual(2000);
    });

    /**
     * @tc.name   DataView18Test009
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_0900
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer9 = new ArrayBuffer(6);
      const dataView9 = new DataView(buffer9);
      dataView9.setInt16(0, 1000, false);
      dataView9.setInt16(2, 2000, false);
      expect(dataView9.getInt16(0, false)).assertEqual(1000);
      expect(dataView9.getInt16(2, false)).assertEqual(2000);
    });

    /**
     * @tc.name   DataView18Test010
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_1000
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer10 = new ArrayBuffer(4);
      const dataView10 = new DataView(buffer10);
      dataView10.setInt16(0, 500);
      expect(dataView10.getInt16(0, false)).assertEqual(500);
    });

    /**
     * @tc.name   DataView18Test011
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_1100
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer11 = new ArrayBuffer(4);
      const dataView11 = new DataView(buffer11);
      dataView11.setInt16(0, 750, false);
      expect(dataView11.getInt16(0, false)).assertEqual(750);
    });

    /**
     * @tc.name   DataView18Test012
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_1200
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer12 = new ArrayBuffer(4);
      const dataView12 = new DataView(buffer12);
      dataView12.setInt16(0, 750, true);
      expect(dataView12.getInt16(0, true)).assertEqual(750);
    });

    /**
     * @tc.name   DataView18Test013
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_1300
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer13 = new ArrayBuffer(4);
      const dataView13 = new DataView(buffer13);
      dataView13.setInt16(0, -1000, true);
      expect(dataView13.getInt16(0, true)).assertEqual(-1000);
    });

    /**
     * @tc.name   DataView18Test014
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_1400
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer14 = new ArrayBuffer(4);
      const dataView14 = new DataView(buffer14);
      dataView14.setInt16(0, -1000, false);
      expect(dataView14.getInt16(0, false)).assertEqual(-1000);
    });

    /**
     * @tc.name   DataView18Test015
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_1500
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer15 = new ArrayBuffer(8);
      const dataView15 = new DataView(buffer15);
      dataView15.setInt16(4, 4096, true);
      expect(dataView15.getInt16(4, true)).assertEqual(4096);
    });

    /**
     * @tc.name   DataView18Test016
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_1600
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer16 = new ArrayBuffer(8);
      const dataView16 = new DataView(buffer16);
      dataView16.setInt16(4, -4096, false);
      expect(dataView16.getInt16(4, false)).assertEqual(-4096);
    });

    /**
     * @tc.name   DataView18Test017
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_1700
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer17 = new ArrayBuffer(4);
      const dataView17 = new DataView(buffer17);
      dataView17.setInt16(0, -32768, true);
      expect(dataView17.getInt16(0, true)).assertEqual(-32768);
    });

    /**
     * @tc.name   DataView18Test018
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_1800
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer18 = new ArrayBuffer(4);
      const dataView18 = new DataView(buffer18);
      dataView18.setInt16(0, 32767, true);
      expect(dataView18.getInt16(0, true)).assertEqual(32767);
    });

    /**
     * @tc.name   DataView18Test019
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_1900
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer19 = new ArrayBuffer(4);
      const dataView19 = new DataView(buffer19);
      dataView19.setInt16(0, 100, true);
      dataView19.setInt16(0, 200, true); // 覆盖
      expect(dataView19.getInt16(0, true)).assertEqual(200);
    });

    /**
     * @tc.name   DataView18Test020
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_2000
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer20 = new ArrayBuffer(4);
      const dataView20 = new DataView(buffer20);
      dataView20.setInt16(0, 100, false);
      dataView20.setInt16(0, 200, false);
      expect(dataView20.getInt16(0, false)).assertEqual(200);
    });

    /**
     * @tc.name   DataView18Test021
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_2100
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer21 = new ArrayBuffer(4);
      const dataView21 = new DataView(buffer21);
      dataView21.setInt16(0, 32768, true);
      expect(dataView21.getInt16(0, true)).assertEqual(-32768);
    });

    /**
     * @tc.name   DataView18Test022
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_2200
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer22 = new ArrayBuffer(4);
      const dataView22 = new DataView(buffer22);
      dataView22.setInt16(0, -32769, true);
      expect(dataView22.getInt16(0, true)).assertEqual(32767);
    });

    /**
     * @tc.name   DataView18Test023
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_2300
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer23 = new ArrayBuffer(4);
      const dataView23 = new DataView(buffer23);
      dataView23.setInt16(0, 100000, true);
      expect(dataView23.getInt16(0, true)).assertEqual(-31072);
    });

    /**
     * @tc.name   DataView18Test024
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_2400
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer24 = new ArrayBuffer(4);
      const dataView24 = new DataView(buffer24);
      dataView24.setInt16(0, -100000, true);
      expect(dataView24.getInt16(0, true)).assertEqual(31072);
    });

    /**
     * @tc.name   DataView18Test025
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_2500
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer25 = new ArrayBuffer(8);
      const dataView25 = new DataView(buffer25);
      dataView25.setInt16(1, 100, true);
      dataView25.setInt16(3, 200, true);
      expect(dataView25.getInt16(1, true)).assertEqual(100);
      expect(dataView25.getInt16(3, true)).assertEqual(200);
    });

    /**
     * @tc.name   DataView18Test026
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_2600
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer26 = new ArrayBuffer(4);
      const dataView26 = new DataView(buffer26);
      dataView26.setInt16(0, 123.9, true);
      expect(dataView26.getInt16(0, true)).assertEqual(123);
    });

    /**
     * @tc.name   DataView18Test027
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_2700
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer27 = new ArrayBuffer(4);
      const dataView27 = new DataView(buffer27);
      dataView27.setInt16(0, -123.9, true);
      expect(dataView27.getInt16(0, true)).assertEqual(-123);
    });

    /**
     * @tc.name   DataView18Test028
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_2800
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer28 = new ArrayBuffer(2);
      const dataView28_le = new DataView(buffer28);
      const dataView28_be = new DataView(buffer28);
      const testValue = 0x1234;
      dataView28_le.setInt16(0, testValue, true);
      dataView28_be.setInt16(0, testValue, false);
      expect(dataView28_le.getInt16(0, true)).assertEqual(13330);
      expect(dataView28_be.getInt16(0, false)).assertEqual(4660);
    });

    /**
     * @tc.name   DataView18Test029
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_2900
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer29 = new ArrayBuffer(4);
      const dataView29 = new DataView(buffer29);
      dataView29.setInt16(0, Number.MAX_SAFE_INTEGER, true);
      expect(dataView29.getInt16(0, true)).assertEqual(9007199254740991 % 65536 > 32767 ?
        (9007199254740991 % 65536) - 65536 :
        9007199254740991 % 65536);
    });

    /**
     * @tc.name   DataView18Test030
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_3000
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer30 = new ArrayBuffer(4);
      const dataView30 = new DataView(buffer30);
      dataView30.setInt16(0, Number.MIN_SAFE_INTEGER, true);
      expect(dataView30.getInt16(0, true)).assertEqual(Number.MIN_SAFE_INTEGER % 65536 < -32768 ?
        (Number.MIN_SAFE_INTEGER % 65536) + 65536 :
        Number.MIN_SAFE_INTEGER % 65536);
    });

    /**
     * @tc.name   DataView18Test031
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_3100
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer31 = new ArrayBuffer(2);
      const dataView31 = new DataView(buffer31);
      dataView31.setInt16(0, 0);
      expect(dataView31.getInt16(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView18Test032
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_3200
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer32 = new ArrayBuffer(2);
      const dataView32 = new DataView(buffer32);
      dataView32.setInt16(0, -32768);
      expect(dataView32.getInt16(0)).assertEqual(-32768);
    });

    /**
     * @tc.name   DataView18Test033
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_3300
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer33 = new ArrayBuffer(2);
      const dataView33 = new DataView(buffer33);
      dataView33.setInt16(0, 32767);
      expect(dataView33.getInt16(0)).assertEqual(32767);
    });

    /**
     * @tc.name   DataView18Test034
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_3400
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer34 = new ArrayBuffer(2);
      const dataView34 = new DataView(buffer34);
      dataView34.setInt16(0, 0x1234, true);
      const uint8View34 = new Uint8Array(buffer34);
      expect(uint8View34[0]).assertEqual(0x34);
      expect(uint8View34[1]).assertEqual(0x12);
    });

    /**
     * @tc.name   DataView18Test035
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_3500
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer35 = new ArrayBuffer(2);
      const dataView35 = new DataView(buffer35);
      dataView35.setInt16(0, 0x1234, false);
      const uint8View35 = new Uint8Array(buffer35);
      expect(uint8View35[0]).assertEqual(0x12);
      expect(uint8View35[1]).assertEqual(0x34);
    });

    /**
     * @tc.name   DataView18Test036
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_3600
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer36 = new ArrayBuffer(2);
      const dataView36 = new DataView(buffer36);
      dataView36.setInt16(0, 10000, true);
      expect(dataView36.getInt16(0, true)).assertEqual(10000);
    });

    /**
     * @tc.name   DataView18Test037
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_3700
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer37 = new ArrayBuffer(2);
      const dataView37 = new DataView(buffer37);
      dataView37.setInt16(0, 10001, false);
      expect(dataView37.getInt16(0, false)).assertEqual(10001);
    });

    /**
     * @tc.name   DataView18Test038
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_3800
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test038()).assertEqual(0);
    });

    /**
     * @tc.name   DataView18Test039
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_3900
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test039()).assertEqual(0);
    });

    /**
     * @tc.name   DataView18Test040
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_4000
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test040()).assertEqual(1);
    });

    /**
     * @tc.name   DataView18Test041
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_4100
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test041()).assertEqual(0);
    });

    /**
     * @tc.name   DataView18Test042
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_4200
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test042()).assertEqual(456);
    });

    /**
     * @tc.name   DataView18Test043
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_4300
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test043()).assertEqual(-456);
    });

    /**
     * @tc.name   DataView18Test044
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_4400
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test044()).assertEqual(0);
    });

    /**
     * @tc.name   DataView18Test045
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_4500
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test045()).assertEqual(0);
    });

    /**
     * @tc.name   DataView18Test046
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_4600
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer46 = new ArrayBuffer(4);
      const dataView46 = new DataView(buffer46);
      dataView46.setInt16(2, 500, true);
      expect(dataView46.getInt16(2, true)).assertEqual(500);
    });

    /**
     * @tc.name   DataView18Test047
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_4700
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test047()).assertEqual(true);
    });

    /**
     * @tc.name   DataView18Test048
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_4800
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer48 = new ArrayBuffer(2);
      const dataView48 = new DataView(buffer48);
      dataView48.setInt16(0, 10, true);
      dataView48.setInt16(0, 20, true);
      dataView48.setInt16(0, 30, true);
      expect(dataView48.getInt16(0, true)).assertEqual(30);
    });

    /**
     * @tc.name   DataView18Test049
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_4900
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer49 = new ArrayBuffer(2);
      const dataView49 = new DataView(buffer49);
      dataView49.setInt16(0, 10, false);
      dataView49.setInt16(0, 20, false);
      dataView49.setInt16(0, 30, false);
      expect(dataView49.getInt16(0, false)).assertEqual(30);
    });

    /**
     * @tc.name   DataView18Test050
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_5000
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer50 = new ArrayBuffer(2);
      const dataView50 = new DataView(buffer50);
      dataView50.setInt16(0, Infinity, true);
      expect(dataView50.getInt16(0, true)).assertEqual(0);
    });

    /**
     * @tc.name   DataView18Test051
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_5100
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer51 = new ArrayBuffer(2);
      const dataView51 = new DataView(buffer51);
      dataView51.setInt16(0, -Infinity, true);
      expect(dataView51.getInt16(0, true)).assertEqual(0);
    });

    /**
     * @tc.name   DataView18Test052
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_5200
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer52 = new ArrayBuffer(2);
      const dataView52 = new DataView(buffer52);
      dataView52.setInt16(0, NaN, true);
      expect(dataView52.getInt16(0, true)).assertEqual(0);
    });

    /**
     * @tc.name   DataView18Test053
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_5300
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test053()).assertEqual(0);

    });

    /**
     * @tc.name   DataView18Test054
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_5400
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test054()).assertEqual(123);
    });

    /**
     * @tc.name   DataView18Test055
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_5500
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test055()).assertEqual(0);
    });

    /**
     * @tc.name   DataView18Test056
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_5600
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer56 = new ArrayBuffer(2);
      const dataView56 = new DataView(buffer56);
      dataView56.setInt16(0, -0, true);
      expect(dataView56.getInt16(0, true)).assertEqual(0);
    });

    /**
     * @tc.name   DataView18Test057
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_5700
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer57 = new ArrayBuffer(4);
      const dataView57 = new DataView(buffer57);
      new Uint8Array(buffer57)[0] = 255;
      dataView57.setInt16(1, 100, true);
      expect(new Uint8Array(buffer57)[0]).assertEqual(255);
    });

    /**
     * @tc.name   DataView18Test058
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_5800
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer58 = new ArrayBuffer(4);
      const dataView58 = new DataView(buffer58);
      new Uint8Array(buffer58)[3] = 255;
      dataView58.setInt16(1, 100, false);
      expect(new Uint8Array(buffer58)[3]).assertEqual(255);
    });

    /**
     * @tc.name   DataView18Test060
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_6000
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer60 = new ArrayBuffer(10);
      const dataView60 = new DataView(buffer60, 2, 6);
      dataView60.setInt16(0, 999, true);
      const checkView60 = new DataView(buffer60);
      expect(checkView60.getInt16(2, true)).assertEqual(999);
    });

    /**
     * @tc.name   DataView18Test061
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_6100
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer61 = new ArrayBuffer(10);
      const dataView61 = new DataView(buffer61, 3);
      dataView61.setInt16(1, 456, true);
      const checkView61 = new DataView(buffer61);
      expect(checkView61.getInt16(4, true)).assertEqual(456);
    });

    /**
     * @tc.name   DataView18Test062
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_6200
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer62 = new ArrayBuffer(2);
      const dataView62 = new DataView(buffer62);
      dataView62.setInt16(0, 70000, true);
      expect(dataView62.getInt16(0, true)).assertEqual(4464);
    });
    /**
     * @tc.name   DataView18Test063
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_6300
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer63 = new ArrayBuffer(2);
      const dataView63 = new DataView(buffer63);
      dataView63.setInt16(0, -70000, true);
      expect(dataView63.getInt16(0, true)).assertEqual(-4464);
    });

    /**
     * @tc.name   DataView18Test064
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_6400
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer64 = new ArrayBuffer(2);
      const dataView64 = new DataView(buffer64);
      dataView64.setInt16(0, 65536, true);
      expect(dataView64.getInt16(0, true)).assertEqual(0);

    });

    /**
     * @tc.name   DataView18Test065
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_6500
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer65 = new ArrayBuffer(2);
      const dataView65 = new DataView(buffer65);
      dataView65.setInt16(0, 65537, true);
      expect(dataView65.getInt16(0, true)).assertEqual(1);
    });

    /**
     * @tc.name   DataView18Test066
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_6600
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer66 = new ArrayBuffer(2);
      const dataView66 = new DataView(buffer66);
      dataView66.setInt16(0, -65536, true);
      expect(dataView66.getInt16(0, true)).assertEqual(0);
    });

    /**
     * @tc.name   DataView18Test067
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_6700
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer67 = new ArrayBuffer(2);
      const dataView67 = new DataView(buffer67);
      dataView67.setInt16(0, -65537, true);
      expect(dataView67.getInt16(0, true)).assertEqual(-1);
    });

    /**
     * @tc.name   DataView18Test068
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_6800
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer68 = new ArrayBuffer(2);
      const dataView68 = new DataView(buffer68);
      dataView68.setInt16(0, 1234, true);
      expect(dataView68.getInt16(0, true)).assertEqual(1234);
    });

    /**
     * @tc.name   DataView18Test069
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_6900
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test069()).assertEqual(true);
    });

    /**
     * @tc.name   DataView18Test070
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_7000
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test070()).assertEqual(true);
    });

    /**
     * @tc.name   DataView18Test071
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_7100
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer71 = new ArrayBuffer(4);
      const dataView71 = new DataView(buffer71);
      let error71 = null;
      try {
        dataView71.setInt16(1.5, 123, true);
      } catch (e) {
        error71 = e;
      }
      dataView71.setInt16(1.5, 123, true);
      expect(dataView71.getInt16(1, true)).assertEqual(123);
    });

    /**
     * @tc.name   DataView18Test072
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_7200
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer72 = new ArrayBuffer(2);
      const dataView72 = new DataView(buffer72);
      dataView72.setInt16(0, 1e3, true);
      expect(dataView72.getInt16(0, true)).assertEqual(1000);
    });

    /**
     * @tc.name   DataView18Test073
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_7300
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer73 = new ArrayBuffer(2);
      const dataView73 = new DataView(buffer73);
      dataView73.setInt16(0, 1e4, true);
      expect(dataView73.getInt16(0, true)).assertEqual(10000);
    });

    /**
     * @tc.name   DataView18Test074
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_7400
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer74 = new ArrayBuffer(2);
      const dataView74 = new DataView(buffer74);
      dataView74.setInt16(0, -1e3, true);
      expect(dataView74.getInt16(0, true)).assertEqual(-1000);
    });

    /**
     * @tc.name   DataView18Test075
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_7500
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer75 = new ArrayBuffer(2);
      const dataView75 = new DataView(buffer75);
      dataView75.setInt16(0, 0xFFFF, true);
      expect(dataView75.getInt16(0, true)).assertEqual(-1);
    });

    /**
     * @tc.name   DataView18Test076
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_7600
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer76 = new ArrayBuffer(2);
      const dataView76 = new DataView(buffer76);
      dataView76.setInt16(0, 0x8000, true);
      expect(dataView76.getInt16(0, true)).assertEqual(-32768);
    });

    /**
     * @tc.name   DataView18Test077
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_7700
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer77 = new ArrayBuffer(2);
      const dataView77 = new DataView(buffer77);
      dataView77.setInt16(0, 0o177777, true);
      expect(dataView77.getInt16(0, true)).assertEqual(-1);
    });

    /**
     * @tc.name   DataView18Test078
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_7800
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer78 = new ArrayBuffer(2);
      const dataView78 = new DataView(buffer78);
      dataView78.setInt16(0, 0b1111111111111111, true);
      expect(dataView78.getInt16(0, true)).assertEqual(-1);
    });

    /**
     * @tc.name   DataView18Test079
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_7900
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer79 = new ArrayBuffer(2);
      const dataView79 = new DataView(buffer79);
      dataView79.setInt16(0, 0b1000000000000000, true);
      expect(dataView79.getInt16(0, true)).assertEqual(-32768);
    });

    /**
     * @tc.name   DataView18Test080
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_8000
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer80 = new ArrayBuffer(2);
      const dv80a = new DataView(buffer80);
      const dv80b = new DataView(buffer80);
      dv80a.setInt16(0, 100, true);
      expect(dv80b.getInt16(0, true)).assertEqual(100);
    });

    /**
     * @tc.name   DataView18Test081
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_8100
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const f32Buffer81 = new ArrayBuffer(8);
      const f32View81 = new Float32Array(f32Buffer81);
      const dv81 = new DataView(f32Buffer81);
      f32View81[0] = 1.0;
      dv81.setInt16(0, 12345, true);
      expect(dv81.getInt16(0, true)).assertEqual(12345);
    });

    /**
     * @tc.name   DataView18Test082
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_8200
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer82 = new ArrayBuffer(8);
      const dv82 = new DataView(buffer82);
      dv82.setInt16(0, 100, true);
      dv82.setInt16(2, -200, true);
      dv82.setInt16(4, 300, true);
      dv82.setInt16(6, -400, true);
      expect(dv82.getInt16(0, true)).assertEqual(100);
      expect(dv82.getInt16(2, true)).assertEqual(-200);
      expect(dv82.getInt16(4, true)).assertEqual(300);
      expect(dv82.getInt16(6, true)).assertEqual(-400);
    });

    /**
     * @tc.name   DataView18Test083
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_8300
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer83 = new ArrayBuffer(8);
      const dv83 = new DataView(buffer83);
      dv83.setInt16(0, 100, false);
      dv83.setInt16(2, -200, false);
      dv83.setInt16(4, 300, false);
      dv83.setInt16(6, -400, false);
      expect(dv83.getInt16(0, false)).assertEqual(100);
      expect(dv83.getInt16(2, false)).assertEqual(-200);
      expect(dv83.getInt16(4, false)).assertEqual(300);
      expect(dv83.getInt16(6, false)).assertEqual(-400);
    });

    /**
     * @tc.name   DataView18Test084
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_8400
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer84 = new ArrayBuffer(2);
      const dv84 = new DataView(buffer84);
      const value84 = (123 << 8) | 45;
      dv84.setInt16(0, value84, false);
      expect(dv84.getInt16(0, false)).assertEqual(value84);
    });

    /**
     * @tc.name   DataView18Test085
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_8500
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer85 = new ArrayBuffer(2);
      const dv85 = new DataView(buffer85);
      dv85.setInt16(0, 0 - 32768, true);
      expect(dv85.getInt16(0, true)).assertEqual(-32768);
    });

    /**
     * @tc.name   DataView18Test086
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_8600
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test086()).assertEqual(0x12);
    });

    /**
     * @tc.name   DataView18Test087
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_8700
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test087()).assertEqual(0x34);
    });

    /**
     * @tc.name   DataView18Test088
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_8800
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test088()).assertEqual(0x34);
    });

    /**
     * @tc.name   DataView18Test089
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_8900
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test089()).assertEqual(0x34);
    });

    /**
     * @tc.name   DataView18Test090
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_9000
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer90 = new ArrayBuffer(2);
      const u8View90 = new Uint8Array(buffer90);
      u8View90[0] = 0xAB;
      u8View90[1] = 0xCD;
      const dv90 = new DataView(buffer90);
      expect(dv90.getUint16(0, false)).assertEqual((0xAB << 8) | 0xCD);
    });

    /**
     * @tc.name   DataView18Test091
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_9100
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer91 = new ArrayBuffer(2);
      const i8View91 = new Int8Array(buffer91);
      i8View91[0] = 0x12;
      i8View91[1] = 0x34;
      const dv91 = new DataView(buffer91);
      expect(dv91.getInt16(0, false)).assertEqual((0x12 << 8) | 0x34);
    });

    /**
     * @tc.name   DataView18Test092
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_9200
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer92 = new ArrayBuffer(2);
      const dv92 = new DataView(buffer92);
      dv92.setInt16(0, Math.pow(2, 15), true);
      expect(dv92.getInt16(0, true)).assertEqual(-32768);
    });

    /**
     * @tc.name   DataView18Test093
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_9300
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer93 = new ArrayBuffer(2);
      const dv93 = new DataView(buffer93);
      dv93.setInt16(0, Math.max(100, 200), true);
      expect(dv93.getInt16(0, true)).assertEqual(200);
    });

    /**
     * @tc.name   DataView18Test094
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_9400
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer94 = new ArrayBuffer(2);
      const dv94 = new DataView(buffer94);
      dv94.setInt16(0, Math.min(-100, -200), true);
      expect(dv94.getInt16(0, true)).assertEqual(-200);
    });

    /**
     * @tc.name   DataView18Test095
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_9500
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer95 = new ArrayBuffer(2);
      const dv95 = new DataView(buffer95);
      const value95 = (100 << 8) >> 8;
      dv95.setInt16(0, value95, true);
      expect(dv95.getInt16(0, true)).assertEqual(100);
    });

    /**
     * @tc.name   DataView18Test096
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_9600
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test096()).assertEqual(true);

    });

    /**
     * @tc.name   DataView18Test097
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_9700
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test097()).assertEqual(true);
    });

    /**
     * @tc.name   DataView18Test098
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_9800
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer98 = new ArrayBuffer(2);
      const dv98 = new DataView(buffer98);
      dv98.setInt16(NaN, 123, true);
      expect(dv98.getInt16(0, true)).assertEqual(123);
    });

    /**
     * @tc.name   DataView18Test099
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_9900
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test099()).assertEqual(456);
    });

    /**
     * @tc.name   DataView18Test100
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_10000
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test100()).assertEqual(789);
    });

    /**
     * @tc.name   DataView18Test101
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_10100
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test101()).assertEqual(123);
    });

    /**
     * @tc.name   DataView18Test102
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_10200
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer102 = new ArrayBuffer(1000);
      const dv102 = new DataView(buffer102);
      dv102.setInt16(998, 999, true);
      expect(dv102.getInt16(998, true)).assertEqual(999);
    });

    /**
     * @tc.name   DataView18Test103
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_10300
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer103 = new ArrayBuffer(10);
      const dv103 = new DataView(buffer103, 2, 6);
      dv103.setInt16(4, 555, true);
      const check103 = new DataView(buffer103);
      expect(check103.getInt16(6, true)).assertEqual(555);
    });

    /**
     * @tc.name   DataView18Test104
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_10400
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test104()).assertEqual(true);
    });

    /**
     * @tc.name   DataView18Test105
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_10500
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer105 = new ArrayBuffer(2);
      const dv105 = new DataView(buffer105);
      const value105 = 0x1234 ^ 0x0000;
      dv105.setInt16(0, value105, true);
      expect(dv105.getInt16(0, true)).assertEqual(0x1234);
    });

    /**
     * @tc.name   DataView18Test106
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_10600
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer106 = new ArrayBuffer(2);
      const dv106 = new DataView(buffer106);
      dv106.setInt16(0, -1, true);
      const u8_106 = new Uint8Array(buffer106);
      expect(u8_106[0]).assertEqual(0xFF);
      expect(u8_106[1]).assertEqual(0xFF);
    });

    /**
     * @tc.name   DataView18Test107
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_10700
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer107 = new ArrayBuffer(2);
      const dv107 = new DataView(buffer107);
      dv107.setInt16(0, -1, false);
      const u8_107 = new Uint8Array(buffer107);
      expect(u8_107[0]).assertEqual(0xFF);
      expect(u8_107[1]).assertEqual(0xFF);
    });

    /**
     * @tc.name   DataView18Test108
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_10800
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer108 = new ArrayBuffer(2);
      const dv108 = new DataView(buffer108);
      dv108.setInt16(0, (true && 500) || 0, true);
      expect(dv108.getInt16(0, true)).assertEqual(500);
    });

    /**
     * @tc.name   DataView18Test109
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_10900
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer109 = new ArrayBuffer(2);
      const dv109 = new DataView(buffer109);
      dv109.setInt16(0, (1 > 0) ? 600 : -600, true);
      expect(dv109.getInt16(0, true)).assertEqual(600);
    });

    /**
     * @tc.name   DataView18Test110
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_11000
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer110 = new ArrayBuffer(2);
      const dv110 = new DataView(buffer110);
      dv110.setInt16(0, 0x1234, true);
      expect(dv110.getInt16(0, false)).assertEqual(13330);
    });

    /**
     * @tc.name   DataView18Test111
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_11100
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer111 = new ArrayBuffer(2);
      const dv111 = new DataView(buffer111);
      dv111.setInt16(0, 30000 + 5000, true);
      expect(dv111.getInt16(0, true)).assertEqual(-30536);
    });

    /**
     * @tc.name   DataView18Test112
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_11200
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer112 = new ArrayBuffer(2);
      const dv112 = new DataView(buffer112);
      dv112.setInt16(0, 100 * 200, true);
      expect(dv112.getInt16(0, true)).assertEqual(20000);
    });

    /**
     * @tc.name   DataView18Test113
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_11300
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer113 = new ArrayBuffer(2);
      const dv113 = new DataView(buffer113);
      dv113.setInt16(0, 1000 / 4, true);
      expect(dv113.getInt16(0, true)).assertEqual(250);
    });

    /**
     * @tc.name   DataView18Test114
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_11400
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer114 = new ArrayBuffer(4);
      const dv114 = new DataView(buffer114);
      dv114.setInt16(1, 0xABCD, true);
      const u8_114 = new Uint8Array(buffer114);
      expect(u8_114[1]).assertEqual(0xCD);
      expect(u8_114[2]).assertEqual(0xAB);
    });

    /**
     * @tc.name   DataView18Test115
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_11500
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer115 = new ArrayBuffer(4);
      const dv115 = new DataView(buffer115);
      dv115.setInt16(0, 0xABCD, true);
      const u8_115 = new Uint8Array(buffer115);
      expect(u8_115[0]).assertEqual(0xCD);
      expect(u8_115[1]).assertEqual(0xAB);
    });

    /**
     * @tc.name   DataView18Test116
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_11600
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer116 = new ArrayBuffer(2);
      const dv116 = new DataView(buffer116);
      const recentValue = (Date.now() % 1000);
      dv116.setInt16(0, recentValue, true);
      expect(dv116.getInt16(0, true) >= 0).assertEqual(true);
    });

    /**
     * @tc.name   DataView18Test117
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_11700
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer117 = new ArrayBuffer(2);
      const dv117 = new DataView(buffer117);
      dv117.setInt16(0, 1000 - 200, true);
      expect(dv117.getInt16(0, true)).assertEqual(800);
    });

    /**
     * @tc.name   DataView18Test118
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_11800
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test118()).assertEqual(true);
    });

    /**
     * @tc.name   DataView18Test119
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_11900
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer119 = new ArrayBuffer(2);
      const dv119a = new DataView(buffer119);
      dv119a.setInt16(0, 888, true);
      const dv119b = new DataView(buffer119);
      expect(dv119b.getInt16(0, true)).assertEqual(888);
    });

    /**
     * @tc.name   DataView18Test120
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_12000
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer120 = new ArrayBuffer(6);
      const dv120 = new DataView(buffer120);
      new Uint8Array(buffer120).fill(255);
      dv120.setInt16(2, 0x1234, true);
      const bytes120 = new Uint8Array(buffer120);
      expect(bytes120[0]).assertEqual(255);
      expect(bytes120[4]).assertEqual(255);
      expect(bytes120[5]).assertEqual(255);
    });

    /**
     * @tc.name   DataView18Test121
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_12100
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const u16Buffer121 = new ArrayBuffer(4);
      const u16View121 = new Uint16Array(u16Buffer121);
      u16View121[0] = 0x5678;
      const dv121 = new DataView(u16Buffer121);
      expect(dv121.getInt16(0, false)).assertEqual(30806);
    });

    /**
     * @tc.name   DataView18Test122
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_12200
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer122 = new ArrayBuffer(2);
      const dv122 = new DataView(buffer122);
      dv122.setInt16(0, -500, true);
      const i16View122 = new Int16Array(buffer122);
      expect(i16View122[0]).assertEqual(-500);
    });

    /**
     * @tc.name   DataView18Test123
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_12300
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer123 = new ArrayBuffer(2);
      const dv123 = new DataView(buffer123);
      dv123.setInt16(0, 1000, true);
      const i16View123 = new Int16Array(buffer123);
      expect(i16View123[0]).assertEqual(1000);
    });

    /**
     * @tc.name   DataView18Test124
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_12400
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer124 = new ArrayBuffer(2);
      const dv124 = new DataView(buffer124);
      dv124.setInt16(0, 1000, false);
      const i16View124 = new Int16Array(buffer124);
      expect(i16View124.toString()).assertEqual("-6141");
    });

    /**
     * @tc.name   DataView18Test125
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_12500
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer125 = new ArrayBuffer(2);
      const dv125 = new DataView(buffer125);
      dv125.setInt16(0, 70000 % 65536, true);
      expect(dv125.getInt16(0, true)).assertEqual(4464);
    });

    /**
     * @tc.name   DataView18Test126
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_12600
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer126 = new ArrayBuffer(2);
      const dv126 = new DataView(buffer126);
      const val126 = ((-70000 % 65536) + 65536) % 65536;
      dv126.setInt16(0, -70000, true);
      expect(dv126.getInt16(0, true)).assertEqual(-4464);
    });

    /**
     * @tc.name   DataView18Test127
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_12700
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer127 = new ArrayBuffer(2);
      const dv127 = new DataView(buffer127);
      dv127.setInt16(0, 0x1234, true);
      dv127.setInt16(0, 0x1234, false);
      const u8_127 = new Uint8Array(buffer127);
      expect(u8_127[0]).assertEqual(0x12);
      expect(u8_127[1]).assertEqual(0x34);
    });

    /**
     * @tc.name   DataView18Test128
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_12800
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer128 = new ArrayBuffer(2);
      const dv128 = new DataView(buffer128);
      dv128.setInt16(0, Math.floor(123.9), true);
      expect(dv128.getInt16(0, true)).assertEqual(123);
    });

    /**
     * @tc.name   DataView18Test129
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_12900
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer129 = new ArrayBuffer(2);
      const dv129 = new DataView(buffer129);
      dv129.setInt16(0, Math.ceil(-123.9), true);
      expect(dv129.getInt16(0, true)).assertEqual(-123);
    });

    /**
     * @tc.name   DataView18Test130
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_13000
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test130()).assertEqual(0);
    });

    /**
     * @tc.name   DataView18Test131
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_13100
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test131()).assertEqual(0);
    });

    /**
     * @tc.name   DataView18Test132
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_13200
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test132()).assertEqual(0);
    });

    /**
     * @tc.name   DataView18Test133
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_13300
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test133()).assertEqual(123);
    });

    /**
     * @tc.name   DataView18Test134
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_13400
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer134 = new ArrayBuffer(10);
      const dv134 = new DataView(buffer134, 4, 5);
      expect(dv134.byteOffset).assertEqual(4);
      expect(dv134.byteLength).assertEqual(5);
      dv134.setInt16(0, 123, true);
      const check134 = new DataView(buffer134);
      expect(check134.getInt16(4, true)).assertEqual(123);
    });

    /**
     * @tc.name   DataView18Test135
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_13500
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const f64Buffer135 = new ArrayBuffer(8);
      const f64View135 = new Float64Array(f64Buffer135);
      const dv135 = new DataView(f64Buffer135);
      f64View135[0] = 3.14159;
      dv135.setInt16(0, 0xABCD, true);
      expect(dv135.getInt16(0, true)).assertEqual(-21555);
    });

    /**
     * @tc.name   DataView18Test136
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_13600
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer136 = new ArrayBuffer(2);
      const dv136 = new DataView(buffer136);
      const original136 = 0xFFFF;
      const masked136 = original136 & 0xFF00;
      dv136.setInt16(0, masked136, false);
      expect(dv136.getInt16(0, false)).assertEqual(-256);
    });

    /**
     * @tc.name   DataView18Test137
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_13700
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer137 = new ArrayBuffer(2);
      const dv137 = new DataView(buffer137);
      dv137.setInt16(0, 0xAABB, true);
      const u8_137 = new Uint8Array(buffer137);
      expect(u8_137[0]).assertEqual(0xBB);
      expect(u8_137[1]).assertEqual(0xAA);
    });

    /**
     * @tc.name   DataView18Test138
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_13800
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer138 = new ArrayBuffer(2);
      const dv138 = new DataView(buffer138);
      dv138.setInt16(0, 0xAABB, false);
      const u8_138 = new Uint8Array(buffer138);
      expect(u8_138[0]).assertEqual(0xAA);
      expect(u8_138[1]).assertEqual(0xBB);
    });

    /**
     * @tc.name   DataView18Test139
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_13900
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test139()).assertEqual(1);
    });

    /**
     * @tc.name   DataView18Test140
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_14000
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test140()).assertEqual(1);
    });

    /**
     * @tc.name   DataView18Test141
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_14100
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer141 = new ArrayBuffer(6);
      const dv141 = new DataView(buffer141);
      dv141.setInt16(0, 100, true);
      dv141.setInt16(4, 200, true);
      expect(dv141.getInt16(0, true)).assertEqual(100);
      expect(dv141.getInt16(4, true)).assertEqual(200);
    });

    /**
     * @tc.name   DataView18Test142
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_14200
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer142 = new ArrayBuffer(2);
      const dv142 = new DataView(buffer142);
      const hugeNum = Number.MAX_SAFE_INTEGER + 1;
      dv142.setInt16(0, hugeNum, true);
      const result142 = dv142.getInt16(0, true);
      expect(result142 >= -32768 && result142 <= 32767).assertEqual(true);
    });

    /**
     * @tc.name   DataView18Test143
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_14300
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test143()).assertEqual(0x34);
    });

    /**
     * @tc.name   DataView18Test144
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_14400
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test144()).assertEqual(0x34);
    });

    /**
     * @tc.name   DataView18Test145
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_14500
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test145()).assertEqual(true);
    });

    /**
     * @tc.name   DataView18Test146
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_14600
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test146()).assertEqual(true);
    });

    /**
     * @tc.name   DataView18Test147
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_14700
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test147()).assertEqual(true);
    });

    /**
     * @tc.name   DataView18Test148
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_14800
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test148()).assertEqual(true);
    });

    /**
     * @tc.name   DataView18Test149
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_14900
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test149()).assertEqual(456);
    });

    /**
     * @tc.name   DataView18Test150
     * @tc.number SUB_BUILTINS_DATAVIEW18_TEST_15000
     * @tc.desc   test DataView setInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView18Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView18.DataView18Test150()).assertEqual(-456);
    });

  })
}