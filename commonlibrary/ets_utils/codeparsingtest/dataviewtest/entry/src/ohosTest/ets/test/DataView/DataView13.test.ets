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
import * as DataView13 from './DataView13';

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function DataView13Test() {
  describe('DataView13Test', () => {
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
     * @tc.name   DataView13Test001
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_0100
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(8);
      const dataView1 = new DataView(buffer1);
      const bigIntValue1 = 9223372036854775807n;
      dataView1.setBigInt64(0, bigIntValue1, true);
      expect(dataView1.getBigInt64(0, true)).assertEqual(bigIntValue1);
    });

    /**
     * @tc.name   DataView13Test002
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_0200
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer2 = new ArrayBuffer(8);
      const dataView2 = new DataView(buffer2);
      const bigIntValue2 = -9223372036854775808n;
      dataView2.setBigInt64(0, bigIntValue2, false);
      expect(dataView2.getBigInt64(0, false)).assertEqual(bigIntValue2);
    });

    /**
     * @tc.name   DataView13Test003
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_0300
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer3 = new ArrayBuffer(8);
      const dataView3 = new DataView(buffer3);
      const bigIntValue3 = 123456789012345n;
      dataView3.setBigInt64(0, bigIntValue3, true);
      expect(dataView3.getBigInt64(0, true)).assertEqual(bigIntValue3);
    });

    /**
     * @tc.name   DataView13Test004
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_0400
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer4 = new ArrayBuffer(8);
      const dataView4 = new DataView(buffer4);
      const bigIntValue4 = 0n;
      dataView4.setBigInt64(0, bigIntValue4, true);
      expect(dataView4.getBigInt64(0, true)).assertEqual(bigIntValue4);
    });

    /**
     * @tc.name   DataView13Test005
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_0500
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer5 = new ArrayBuffer(8);
      const dataView5 = new DataView(buffer5);
      const bigIntValue5 = -9223372036854775809n;
      dataView5.setBigInt64(0, bigIntValue5, true);
      expect(dataView5.getBigInt64(0)).assertEqual(-129n);
    });

    /**
     * @tc.name   DataView13Test006
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_0600
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer6 = new ArrayBuffer(8);
      const dataView6 = new DataView(buffer6);
      const bigIntValue6 = 9223372036854775808n;
      dataView6.setBigInt64(0, bigIntValue6, true);
      expect(dataView6.getBigInt64(0)).assertEqual(128n);
    });

    /**
     * @tc.name   DataView13Test007
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_0700
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer7 = new ArrayBuffer(8);
      const dataView7 = new DataView(buffer7);
      const bigIntValue7 = 42n;
      dataView7.setBigInt64(0, bigIntValue7, false);
      expect(dataView7.getBigInt64(0, false)).assertEqual(bigIntValue7);
    });

    /**
     * @tc.name   DataView13Test008
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_0800
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer8 = new ArrayBuffer(8);
      const dataView8 = new DataView(buffer8);
      const bigIntValue8 = -1n;
      dataView8.setBigInt64(0, bigIntValue8, true);
      expect(dataView8.getBigInt64(0, true)).assertEqual(bigIntValue8);
    });

    /**
     * @tc.name   DataView13Test009
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_0900
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer9 = new ArrayBuffer(16);
      const dataView9 = new DataView(buffer9);
      const bigIntValue9 = 100n;
      dataView9.setBigInt64(8, bigIntValue9, true);
      expect(dataView9.getBigInt64(8, true)).assertEqual(bigIntValue9);
    });

    /**
     * @tc.name   DataView13Test010
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_1000
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer10 = new ArrayBuffer(16);
      const dataView10 = new DataView(buffer10);
      const bigIntValue10 = 200n;
      dataView10.setBigInt64(0, bigIntValue10, true);
      expect(dataView10.getBigInt64(0, true)).assertEqual(bigIntValue10);
    });

    /**
     * @tc.name   DataView13Test011
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_1100
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer11 = new ArrayBuffer(16);
      const dataView11 = new DataView(buffer11);
      const bigIntValue11 = 300n;
      dataView11.setBigInt64(8, bigIntValue11, false);
      expect(dataView11.getBigInt64(8, false)).assertEqual(bigIntValue11);
    });

    /**
     * @tc.name   DataView13Test012
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_1200
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer12 = new ArrayBuffer(16);
      const dataView12 = new DataView(buffer12);
      const valA = 123n;
      const valB = -456n;
      dataView12.setBigInt64(0, valA, true);
      dataView12.setBigInt64(8, valB, false);
      expect(dataView12.getBigInt64(0, true)).assertEqual(valA);
      expect(dataView12.getBigInt64(8, false)).assertEqual(valB);
    });

    /**
     * @tc.name   DataView13Test013
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_1300
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer13 = new ArrayBuffer(8);
      const dataView13 = new DataView(buffer13);
      const bigIntValue13 = BigInt(Number.MAX_SAFE_INTEGER);
      dataView13.setBigInt64(0, bigIntValue13, true);
      expect(dataView13.getBigInt64(0, true)).assertEqual(bigIntValue13);
    });

    /**
     * @tc.name   DataView13Test014
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_1400
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer14 = new ArrayBuffer(8);
      const dataView14 = new DataView(buffer14);
      const bigIntValue14 = BigInt(Number.MIN_SAFE_INTEGER);
      dataView14.setBigInt64(0, bigIntValue14, false);
      expect(dataView14.getBigInt64(0, false)).assertEqual(bigIntValue14);
    });

    /**
     * @tc.name   DataView13Test015
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_1500
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer15 = new ArrayBuffer(8);
      const dataView15 = new DataView(buffer15);
      dataView15.setBigInt64(0, 10n, true);
      dataView15.setBigInt64(0, 20n, true);
      expect(dataView15.getBigInt64(0, true)).assertEqual(20n);
    });

    /**
     * @tc.name   DataView13Test016
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_1600
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer16 = new ArrayBuffer(8);
      const dataView16 = new DataView(buffer16);
      dataView16.setBigInt64(0, -50n, false);
      dataView16.setBigInt64(0, -100n, false);
      expect(dataView16.getBigInt64(0, false)).assertEqual(-100n);
    });

    /**
     * @tc.name   DataView13Test017
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_1700
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer17 = new ArrayBuffer(8);
      const dataView17 = new DataView(buffer17);
      const bigIntValue17 = 987654321098765n;
      dataView17.setBigInt64(0, bigIntValue17);
      expect(dataView17.getBigInt64(0)).assertEqual(bigIntValue17);
    });

    /**
     * @tc.name   DataView13Test018
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_1800
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer18 = new ArrayBuffer(16);
      const dataView18 = new DataView(buffer18);
      const bigIntValue18 = 111n;
      dataView18.setBigInt64(1, bigIntValue18, true);
      expect(dataView18.getBigInt64(1, true)).assertEqual(bigIntValue18);
    });

    /**
     * @tc.name   DataView13Test019
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_1900
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer19a = new ArrayBuffer(8);
      const buffer19b = new ArrayBuffer(8);
      const dataView19a = new DataView(buffer19a);
      const dataView19b = new DataView(buffer19b);
      const val19a = 555n;
      const val19b = 666n;
      dataView19a.setBigInt64(0, val19a, true);
      dataView19b.setBigInt64(0, val19b, true);
      expect(dataView19a.getBigInt64(0, true)).assertEqual(val19a);
      expect(dataView19b.getBigInt64(0, true)).assertEqual(val19b);
    });

    /**
     * @tc.name   DataView13Test020
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_2000
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer20 = new ArrayBuffer(8);
      const dataView20 = new DataView(buffer20);
      const bigIntValue20 = 1234567890123456789n;
      dataView20.setBigInt64(0, bigIntValue20, true);
      expect(dataView20.getBigInt64(0, true)).assertEqual(bigIntValue20);
    });

    /**
     * @tc.name   DataView13Test021
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_2100
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer21 = new ArrayBuffer(8);
      const dataView21 = new DataView(buffer21);
      const bigIntValue21 = -9876543210987654321n;
      dataView21.setBigInt64(0, bigIntValue21, false);
      expect(dataView21.getBigInt64(0, false)).assertEqual(8570200862721897295n);
    });

    /**
     * @tc.name   DataView13Test022
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_2200
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer22 = new ArrayBuffer(8);
      const dataView22 = new DataView(buffer22);
      const bigIntValue22 = 2n**63n - 1n; // 即 9223372036854775807n
      dataView22.setBigInt64(0, bigIntValue22, true);
      expect(dataView22.getBigInt64(0, true)).assertEqual(bigIntValue22);
    });

    /**
     * @tc.name   DataView13Test023
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_2300
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer23 = new ArrayBuffer(8);
      const dataView23 = new DataView(buffer23);
      const bigIntValue23 = -(2n**63n);
      dataView23.setBigInt64(0, bigIntValue23, false);
      expect(dataView23.getBigInt64(0, false)).assertEqual(bigIntValue23);
    });

    /**
     * @tc.name   DataView13Test024
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_2400
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer24 = new Uint8Array(8);
      const dataView24 = new DataView(buffer24.buffer);
      dataView24.setBigInt64(0, -1n, true);
      for (let i = 0; i < 8; i++) {
        expect(buffer24[i]).assertEqual(255);
      }
    });

    /**
     * @tc.name   DataView13Test025
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_2500
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer25 = new Uint8Array(8);
      const dataView25 = new DataView(buffer25.buffer);
      dataView25.setBigInt64(0, -1n, false);
      for (let i = 0; i < 8; i++) {
        expect(buffer25[i]).assertEqual(255);
      }
    });

    /**
     * @tc.name   DataView13Test026
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_2600
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer26 = new ArrayBuffer(8);
      const dataView26 = new DataView(buffer26);
      dataView26.setBigInt64(0, 1n, true);
      expect(dataView26.getBigInt64(0, true)).assertEqual(1n);
    });

    /**
     * @tc.name   DataView13Test027
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_2700
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer27 = new ArrayBuffer(8);
      const dataView27 = new DataView(buffer27);
      dataView27.setBigInt64(0, -2n, false);
      expect(dataView27.getBigInt64(0, false)).assertEqual(-2n);
    });

    /**
     * @tc.name   DataView13Test028
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_2800
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer28 = new ArrayBuffer(24);
      const dataView28 = new DataView(buffer28);
      dataView28.setBigInt64(0, 1000n, true);
      dataView28.setBigInt64(8, 2000n, false);
      dataView28.setBigInt64(16, -3000n, true);
      expect(dataView28.getBigInt64(0, true)).assertEqual(1000n);
      expect(dataView28.getBigInt64(8, false)).assertEqual(2000n);
      expect(dataView28.getBigInt64(16, true)).assertEqual(-3000n);
    });

    /**
     * @tc.name   DataView13Test029
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_2900
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer29 = new ArrayBuffer(8);
      const dataView29 = new DataView(buffer29);
      expect(dataView29.getBigInt64(0, true)).assertEqual(0n);
      dataView29.setBigInt64(0, 42n, true);
      expect(dataView29.getBigInt64(0, true)).assertEqual(42n);
    });

    /**
     * @tc.name   DataView13Test030
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_3000
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const buffer30 = new ArrayBuffer(8);
        const dataView30 = new DataView(buffer30);
        dataView30.setBigInt64(9, 100n, true);
        expect(false).assertEqual(true);
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.name   DataView13Test031
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_3100
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const buffer31 = new ArrayBuffer(8);
        const dataView31 = new DataView(buffer31);
        dataView31.setBigInt64(-1, 100n, true);
        expect(false).assertEqual(true);
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.name   DataView13Test032
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_3200
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const buffer32 = new ArrayBuffer(8);
        const dataView32 = new DataView(buffer32);
        dataView32.setBigInt64(0, 123n, true);
        expect(dataView32.getBigInt64(0, true)).assertEqual(123n);
      } catch (e) {
        expect(e.name).assertEqual(true);
      }
    });


    /**
     * @tc.name   DataView13Test035
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_3500
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer35 = new ArrayBuffer(8);
      const dataView35 = new DataView(buffer35);
      const bigIntValue35 = BigInt("9876543210");
      dataView35.setBigInt64(0, bigIntValue35, true);
      expect(dataView35.getBigInt64(0, true)).assertEqual(bigIntValue35);
    });

    /**
     * @tc.name   DataView13Test036
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_3600
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer36 = new ArrayBuffer(8);
      const dataView36 = new DataView(buffer36);
      dataView36.setBigInt64(0, 500n, true);
      const intView = new BigUint64Array(buffer36);
      intView[0] = 600n;
      expect(dataView36.getBigInt64(0, true)).assertEqual(600n);
    });

    /**
     * @tc.name   DataView13Test037
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_3700
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer37 = new ArrayBuffer(16);
      const dataView37 = new DataView(buffer37);
      for (let i = 0; i < 2; i++) {
        dataView37.setBigInt64(i * 8, BigInt(i + 1000), true);
      }
      expect(dataView37.getBigInt64(0, true)).assertEqual(1000n);
      expect(dataView37.getBigInt64(8, true)).assertEqual(1001n);
    });


    /**
     * @tc.name   DataView13Test039
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_3900
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer39 = new ArrayBuffer(8);
      const dataView39 = new DataView(buffer39);
      const floatValue = 123.999;
      const bigIntValue39 = BigInt(Math.floor(floatValue));
      dataView39.setBigInt64(0, bigIntValue39, false);
      expect(dataView39.getBigInt64(0, false)).assertEqual(bigIntValue39);
    });

    /**
     * @tc.name   DataView13Test040
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_4000
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer40 = new ArrayBuffer(8);
      const dataView40 = new DataView(buffer40);
      dataView40.setBigInt64(0, -1n, true);
      expect(dataView40.getBigInt64(0, true)).assertEqual(-1n);
    });

    /**
     * @tc.name   DataView13Test041
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_4100
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer41 = new ArrayBuffer(8);
      const dataView41 = new DataView(buffer41);
      const maxPositive = 9223372036854775807n;
      dataView41.setBigInt64(0, maxPositive, false);
      expect(dataView41.getBigInt64(0, false)).assertEqual(maxPositive);
    });

    /**
     * @tc.name   DataView13Test042
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_4200
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer42 = new ArrayBuffer(8);
      const dataView42 = new DataView(buffer42);
      const minNegative = -9223372036854775808n;
      dataView42.setBigInt64(0, minNegative, true);
      expect(dataView42.getBigInt64(0, true)).assertEqual(minNegative);
    });

    /**
     * @tc.name   DataView13Test043
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_4300
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer43 = new ArrayBuffer(16);
      const dataView43 = new DataView(buffer43);
      const value43 = 5000000000000000000n;
      dataView43.setBigInt64(1, value43, true);
      expect(dataView43.getBigInt64(1, true)).assertEqual(value43);
    });

    /**
     * @tc.name   DataView13Test044
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_4400
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer44 = new ArrayBuffer(16);
      const dataView44 = new DataView(buffer44);
      const value44 = -5000000000000000000n;
      dataView44.setBigInt64(1, value44, false);
      expect(dataView44.getBigInt64(1, false)).assertEqual(value44);
    });

    /**
     * @tc.name   DataView13Test045
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_4500
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer45 = new ArrayBuffer(24);
      const dataView45 = new DataView(buffer45);
      const commonValue = 123456789n;
      for (let offset = 0; offset < 24; offset += 8) {
        dataView45.setBigInt64(offset, commonValue, true);
      }
      for (let offset = 0; offset < 24; offset += 8) {
        expect(dataView45.getBigInt64(offset, true)).assertEqual(commonValue);
      }
    });

    /**
     * @tc.name   DataView13Test046
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_4600
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer46 = new ArrayBuffer(8);
      const dataView46 = new DataView(buffer46);
      const value46 = -987654321n;
      dataView46.setBigInt64(0, value46);
      expect(dataView46.getBigInt64(0)).assertEqual(value46);
    });

    /**
     * @tc.name   DataView13Test047
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_4700
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer47 = new ArrayBuffer(8);
      const dataView47 = new DataView(buffer47);
      dataView47.setBigInt64(0, 0n, true);
      expect(dataView47.getBigInt64(0, false)).assertEqual(0n);
    });

    /**
     * @tc.name   DataView13Test048
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_4800
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer48 = new ArrayBuffer(8);
      const dataView48 = new DataView(buffer48);
      dataView48.setBigInt64(0, -1n, true);
      expect(dataView48.getBigInt64(0, true)).assertEqual(-1n);
    });

    /**
     * @tc.name   DataView13Test049
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_4900
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer49 = new ArrayBuffer(8);
      const dataView49 = new DataView(buffer49);
      dataView49.setBigInt64(0, 1n, false);
      expect(dataView49.getBigInt64(0, false)).assertEqual(1n);
    });

    /**
     * @tc.name   DataView13Test050
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_5000
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer50 = new ArrayBuffer(16);
      const dataView50 = new DataView(buffer50, 8, 8);
      dataView50.setBigInt64(0, 100n, true);
      const checkView = new DataView(buffer50);
      expect(checkView.getBigInt64(8, true)).assertEqual(100n);
    });

    /**
     * @tc.name   DataView13Test051
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_5100
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer51 = new ArrayBuffer(16);
      const dataView51 = new DataView(buffer51, 0, 8);
      dataView51.setBigInt64(0, 200n, false);
      expect(dataView51.getBigInt64(0, false)).assertEqual(200n);
    });

    /**
     * @tc.name   DataView13Test052
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_5200
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const buffer52 = new ArrayBuffer(16);
        const dataView52 = new DataView(buffer52, 0, 8);
        dataView52.setBigInt64(1, 300n, true);
        expect(false).assertEqual(true);
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.name   DataView13Test053
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_5300
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer53 = new ArrayBuffer(8);
      const dataView53 = new DataView(buffer53);
      const originalValue = 0x0123456789ABCDEFn;
      dataView53.setBigInt64(0, originalValue, false);
      expect(dataView53.getBigInt64(0, false)).assertEqual(originalValue);

    });

    /**
     * @tc.name   DataView13Test054
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_5400
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer54 = new ArrayBuffer(8);
      const dataView54 = new DataView(buffer54);
      const negativeValue = -1000n;
      dataView54.setBigInt64(0, negativeValue, true);
      expect(dataView54.getBigInt64(0, true)).assertEqual(negativeValue);
    });

    /**
     * @tc.name   DataView13Test055
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_5500
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer55 = new ArrayBuffer(8);
      const dataView55 = new DataView(buffer55);
      const base = 1000000n;
      const calculated = base * 2n + 1n;
      dataView55.setBigInt64(0, calculated, false);
      expect(dataView55.getBigInt64(0, false)).assertEqual(calculated);
    });

    /**
     * @tc.name   DataView13Test056
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_5600
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer56 = new ArrayBuffer(8);
      const dataView56 = new DataView(buffer56);
      const shifted = 1n << 50n;
      dataView56.setBigInt64(0, shifted, true);
      expect(dataView56.getBigInt64(0, true)).assertEqual(shifted);
    });

    /**
     * @tc.name   DataView13Test057
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_5700
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer57 = new Uint8Array(16);
      const dataView57 = new DataView(buffer57.buffer);
      buffer57[7] = 255;
      dataView57.setBigInt64(8, 123456789012345n, true);
      expect(buffer57[7]).assertEqual(255);
    });

    /**
     * @tc.name   DataView13Test058
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_5800
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer58 = new Uint8Array(16);
      const dataView58 = new DataView(buffer58.buffer);
      buffer58[8] = 1;
      buffer58[15] = 255;
      dataView58.setBigInt64(0, 987654321098765n, false);
      for (let i = 8; i <= 15; i++) {
        if (i === 8) {
          expect(buffer58[i]).assertEqual(1);
        }
      }
    });

    /**
     * @tc.name   DataView13Test059
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_5900
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer59 = new ArrayBuffer(32);
      const dataView59 = new DataView(buffer59);
      const testValues = [10n, -20n, 30n, -40n];
      let offset = 0;
      for (const val of testValues) {
        dataView59.setBigInt64(offset, val, true);
        offset += 8;
      }
      offset = 0;
      for (const val of testValues) {
        expect(dataView59.getBigInt64(offset, true)).assertEqual(val);
        offset += 8;
      }
    });

    /**
     * @tc.name   DataView13Test060
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_6000
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer60 = new ArrayBuffer(8);
      const dataView60 = new DataView(buffer60);
      const writeValue = 777n;
      dataView60.setBigInt64(0, writeValue, true);
      const readValue = dataView60.getBigInt64(0, true);
      expect(readValue).assertEqual(writeValue);
    });

    /**
     * @tc.name   DataView13Test061
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_6100
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer61 = new ArrayBuffer(8);
      const dataView61 = new DataView(buffer61);
      dataView61.setBigInt64(0, 1234567890123456789n, false);
      expect(dataView61.getBigInt64(0, false)).assertEqual(1234567890123456789n);
    });

    /**
     * @tc.name   DataView13Test062
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_6200
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer62 = new ArrayBuffer(8);
      const dataView62 = new DataView(buffer62);
      dataView62.setBigInt64(0, -9876543210987654321n, true);
      expect(dataView62.getBigInt64(0, true)).assertEqual(8570200862721897295n);
    });
    /**
     * @tc.name   DataView13Test063
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_6300
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer63 = new ArrayBuffer(8);
      const dataView63 = new DataView(buffer63);
      const littleEndian = Math.random() > 0.5;
      const value63 = 555n;
      dataView63.setBigInt64(0, value63, littleEndian);
      expect(dataView63.getBigInt64(0, littleEndian)).assertEqual(value63);
    });

    /**
     * @tc.name   DataView13Test064
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_6400
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer64 = new ArrayBuffer(8);
      const dataView64 = new DataView(buffer64);
      dataView64.setBigInt64(0, 0n, true);
      expect(dataView64.getBigInt64(0, true)).assertEqual(0n);
    });

    /**
     * @tc.name   DataView13Test065
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_6500
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer65 = new ArrayBuffer(8);
      const dataView65 = new DataView(buffer65);
      const negativeWithHighBit = -1n << 63n;
      dataView65.setBigInt64(0, negativeWithHighBit, false);
      expect(dataView65.getBigInt64(0, false)).assertEqual(negativeWithHighBit);
    });

    /**
     * @tc.name   DataView13Test066
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_6600
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer66 = new ArrayBuffer(8);
      const dataView66 = new DataView(buffer66);
      const positiveMax = (1n << 63n) - 1n;
      dataView66.setBigInt64(0, positiveMax, true);
      expect(dataView66.getBigInt64(0, true)).assertEqual(positiveMax);
    });

    /**
     * @tc.name   DataView13Test067
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_6700
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer67 = new ArrayBuffer(16);
      const dataView67 = new DataView(buffer67);
      const valA = 111n;
      const valB = 222n;
      dataView67.setBigInt64(0, valA, true);
      dataView67.setBigInt64(8, valB, false);
      expect(dataView67.getBigInt64(0, true)).assertEqual(valA);
      expect(dataView67.getBigInt64(8, false)).assertEqual(valB);
    });

    /**
     * @tc.name   DataView13Test068
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_6800
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer68 = new ArrayBuffer(8);
      const dataView68 = new DataView(buffer68);
      const originalByteLength = dataView68.byteLength;
      dataView68.setBigInt64(0, 100n, true);
      expect(dataView68.byteLength).assertEqual(originalByteLength);
    });

    /**
     * @tc.name   DataView13Test069
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_6900
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer69 = new ArrayBuffer(8);
      const dataView69 = new DataView(buffer69);
      dataView69.setBigInt64(0, 200n, false);
      expect(dataView69.buffer).assertEqual(buffer69);
    });

    /**
     * @tc.name   DataView13Test070
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_7000
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const innerBuffer = new ArrayBuffer(16);
      const dataView70 = new DataView(innerBuffer, 8, 8);
      dataView70.setBigInt64(0, 300n, true);
      expect(dataView70.byteOffset).assertEqual(8);
    });

    /**
     * @tc.name   DataView13Test071
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_7100
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer71 = new ArrayBuffer(8);
      const dataView71 = new DataView(buffer71);
      const constructedBigInt = BigInt("123");
      dataView71.setBigInt64(0, constructedBigInt, true);
      expect(dataView71.getBigInt64(0, true)).assertEqual(123n);
    });

    /**
     * @tc.name   DataView13Test072
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_7200
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer72 = new ArrayBuffer(8);
      const dataView72 = new DataView(buffer72);
      const hexValue = 0xabcdef0123456789n;
      dataView72.setBigInt64(0, hexValue, false);
      expect(dataView72.getBigInt64(0, false)).assertEqual(-6066930334832433271n);
    });

    /**
     * @tc.name   DataView13Test073
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_7300
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer73 = new ArrayBuffer(8);
      const dataView73 = new DataView(buffer73);
      const binaryValue = 0b1010101010101010n;
      dataView73.setBigInt64(0, binaryValue, true);
      expect(dataView73.getBigInt64(0, true)).assertEqual(binaryValue);
    });

    /**
     * @tc.name   DataView13Test074
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_7400
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer74 = new ArrayBuffer(8);
      const dataView74 = new DataView(buffer74);
      dataView74.setBigInt64(0, -42n, true);
      expect(dataView74.getBigInt64(0, true)).assertEqual(-42n);
    });

    /**
     * @tc.name   DataView13Test075
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_7500
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer75 = new ArrayBuffer(8);
      const dataView75 = new DataView(buffer75);
      dataView75.setBigInt64(0, 42n, false);
      expect(dataView75.getBigInt64(0, false)).assertEqual(42n);
    });

    /**
     * @tc.name   DataView13Test081
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_8100
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer81 = new ArrayBuffer(8);
      const dataView81 = new DataView(buffer81);
      const value81 = (2n * 63n) - 1000n;
      dataView81.setBigInt64(0, value81, true);
      expect(dataView81.getBigInt64(0, true)).assertEqual(value81);
    });

    /**
     * @tc.name   DataView13Test082
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_8200
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer82 = new ArrayBuffer(8);
      const dataView82 = new DataView(buffer82);
      const value82 = (1000000000000000000n / 3n) * 3n;
      dataView82.setBigInt64(0, value82, false);
      expect(dataView82.getBigInt64(0, false)).assertEqual(value82);
    });

    /**
     * @tc.name   DataView13Test083
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_8300
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer83 = new ArrayBuffer(8);
      const dataView83 = new DataView(buffer83);
      const value83 = (-100n % 30n);
      dataView83.setBigInt64(0, value83, true);
      expect(dataView83.getBigInt64(0, true)).assertEqual(value83);
    });

    /**
     * @tc.name   DataView13Test084
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_8400
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer84 = new ArrayBuffer(8);
      const dataView84 = new DataView(buffer84);
      dataView84.setBigInt64(0, 500n, true);
      dataView84.setBigInt64(0, -500n, true);
      dataView84.setBigInt64(0, 500n, true);
      expect(dataView84.getBigInt64(0, true)).assertEqual(500n);
    });

    /**
     * @tc.name   DataView13Test085
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_8500
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer85 = new ArrayBuffer(16);
      const dataView85 = new DataView(buffer85);
      const value85 = 123456789012345n;
      dataView85.setBigInt64(2, value85, true);
      expect(dataView85.getBigInt64(2, true)).assertEqual(value85);
    });

    /**
     * @tc.name   DataView13Test086
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_8600
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer86 = new ArrayBuffer(16);
      const dataView86 = new DataView(buffer86);
      const value86 = -987654321098765n;
      dataView86.setBigInt64(3, value86, false);
      expect(dataView86.getBigInt64(3, false)).assertEqual(value86);
    });

    /**
     * @tc.name   DataView13Test087
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_8700
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer87 = new ArrayBuffer(16);
      const dataView87 = new DataView(buffer87);
      const value87 = 555555555555555n;
      dataView87.setBigInt64(4, value87, true);
      expect(dataView87.getBigInt64(4, true)).assertEqual(value87);
    });

    /**
     * @tc.name   DataView13Test088
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_8800
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer88 = new ArrayBuffer(16);
      const dataView88 = new DataView(buffer88);
      const value88 = -111111111111111n;
      dataView88.setBigInt64(5, value88, false);
      expect(dataView88.getBigInt64(5, false)).assertEqual(value88);
    });

    /**
     * @tc.name   DataView13Test089
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_8900
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer89 = new ArrayBuffer(16);
      const dataView89 = new DataView(buffer89);
      const value89 = 999999999999999n;
      dataView89.setBigInt64(6, value89, true);
      expect(dataView89.getBigInt64(6, true)).assertEqual(value89);
    });

    /**
     * @tc.name   DataView13Test090
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_9000
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer90 = new ArrayBuffer(16);
      const dataView90 = new DataView(buffer90);
      const value90 = -888888888888888n;
      dataView90.setBigInt64(7, value90, false);
      expect(dataView90.getBigInt64(7, false)).assertEqual(value90);
    });

    /**
     * @tc.name   DataView13Test091
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_9100
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer91 = new ArrayBuffer(8);
      const dataView91 = new DataView(buffer91);
      const value91 = 1234567890n;
      dataView91.setBigInt64(0, value91, false);
      expect(dataView91.getBigInt64(0, false)).assertEqual(value91);
    });

    /**
     * @tc.name   DataView13Test092
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_9200
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer92 = new ArrayBuffer(8);
      const dataView92 = new DataView(buffer92);
      const value92 = -9876543210n;
      dataView92.setBigInt64(0, value92, true);
      expect(dataView92.getBigInt64(0, true)).assertEqual(value92);
    });

    /**
     * @tc.name   DataView13Test093
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_9300
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer93 = new ArrayBuffer(8);
      const dataView93 = new DataView(buffer93);
      const originalLength = buffer93.byteLength;
      dataView93.setBigInt64(0, 100n, true);
      expect(buffer93.byteLength).assertEqual(originalLength);
    });

    /**
     * @tc.name   DataView13Test094
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_9400
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer94 = new ArrayBuffer(8);
      const dataView94 = new DataView(buffer94);
      const value94 = 0x12345678n | 0xABCDEF00n | 0x100000000n;
      dataView94.setBigInt64(0, value94, true);
      expect(dataView94.getBigInt64(0, true)).assertEqual(value94);
    });

    /**
     * @tc.name   DataView13Test095
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_9500
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer95 = new ArrayBuffer(8);
      const dataView95 = new DataView(buffer95);
      const value95 = 0xFFFFFFFFFFFFFFFFn & 0x00000000FFFFFFFFn;
      dataView95.setBigInt64(0, value95, false);
      expect(dataView95.getBigInt64(0, false)).assertEqual(value95);
    });

    /**
     * @tc.name   DataView13Test096
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_9600
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer96 = new ArrayBuffer(8);
      const dataView96 = new DataView(buffer96);
      const value96 = (0x1122334455667788n ^ 0x8877665544332211n);
      dataView96.setBigInt64(0, value96, true);
      expect(dataView96.getBigInt64(0, true)).assertEqual(-7397913281092561511n);
    });

    /**
     * @tc.name   DataView13Test097
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_9700
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer97 = new ArrayBuffer(8);
      const dataView97 = new DataView(buffer97);
      const value97 = (-1n << 60n);
      dataView97.setBigInt64(0, value97, false);
      expect(dataView97.getBigInt64(0, false)).assertEqual(value97);
    });

    /**
     * @tc.name   DataView13Test098
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_9800
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer98 = new ArrayBuffer(8);
      const dataView98 = new DataView(buffer98);
      const value98 = (0x8000000000000000n >> 1n);
      dataView98.setBigInt64(0, value98, true);
      expect(dataView98.getBigInt64(0, true)).assertEqual(value98);
    });

    /**
     * @tc.name   DataView13Test099
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_9900
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer99 = new ArrayBuffer(8);
      const dataView99 = new DataView(buffer99);
      const value99 = 9223372036854775808n;
      dataView99.setBigInt64(0, value99, true);
      expect(dataView99.getBigInt64(0)).assertEqual(128n);
    });

    /**
     * @tc.name   DataView13Test100
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_10000
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer100 = new ArrayBuffer(8);
      const dataView100 = new DataView(buffer100);
      const value100 = -9223372036854775809n;
      dataView100.setBigInt64(0, value100, false);
      expect(dataView100.getBigInt64(0)).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.name   DataView13Test101
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_10100
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer101 = new ArrayBuffer(8);
      const dataView101 = new DataView(buffer101);
      const strValue = "1234567890123456";
      const bigIntValue = BigInt(strValue);
      dataView101.setBigInt64(0, bigIntValue, true);
      expect(dataView101.getBigInt64(0, true)).assertEqual(bigIntValue);
    });

    /**
     * @tc.name   DataView13Test102
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_10200
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer102 = new ArrayBuffer(8);
      const dataView102 = new DataView(buffer102);
      const numValue = 987654321;
      const convertedBigInt = BigInt(numValue);
      dataView102.setBigInt64(0, convertedBigInt, false);
      expect(dataView102.getBigInt64(0, false)).assertEqual(convertedBigInt);
    });

    /**
     * @tc.name   DataView13Test103
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_10300
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer103 = new ArrayBuffer(16);
      const dataView103 = new DataView(buffer103, 4, 8);
      const originalByteLength = dataView103.byteLength;
      dataView103.setBigInt64(0, 100n, true);
      expect(dataView103.byteLength).assertEqual(originalByteLength);
    });

    /**
     * @tc.name   DataView13Test104
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_10400
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer104 = new ArrayBuffer(8);
      const dataView104 = new DataView(buffer104);
      const originalBuffer = dataView104.buffer;
      dataView104.setBigInt64(0, 200n, false);
      expect(dataView104.buffer).assertEqual(originalBuffer);
    });

    /**
     * @tc.name   DataView13Test105
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_10500
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer105 = new ArrayBuffer(16);
      const dataView105 = new DataView(buffer105);
      const value105 = 555n;
      dataView105.setBigInt64(8, value105, true);
      expect(dataView105.getBigInt64(8, true)).assertEqual(value105);
    });

    /**
     * @tc.name   DataView13Test106
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_10600
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const buffer106 = new ArrayBuffer(16);
        const dataView106 = new DataView(buffer106);
        dataView106.setBigInt64(9, 666n, true);
        expect(false).assertEqual(true);
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.name   DataView13Test107
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_10700
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer107 = new ArrayBuffer(8);
      const dataView107 = new DataView(buffer107);
      const powerValue = 2n**50n;
      dataView107.setBigInt64(0, powerValue, false);
      expect(dataView107.getBigInt64(0, false)).assertEqual(powerValue);
    });

    /**
     * @tc.name   DataView13Test108
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_10800
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer108 = new ArrayBuffer(8);
      const dataView108 = new DataView(buffer108);
      const minValue = -9223372036854775808n;
      const value108 = minValue + 100n;
      dataView108.setBigInt64(0, value108, true);
      expect(dataView108.getBigInt64(0, true)).assertEqual(value108);
    });

    /**
     * @tc.name   DataView13Test109
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_10900
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer109 = new ArrayBuffer(8);
      const dataView109 = new DataView(buffer109);
      const maxValue = 9223372036854775807n;
      const value109 = maxValue - 1000n;
      dataView109.setBigInt64(0, value109, false);
      expect(dataView109.getBigInt64(0, false)).assertEqual(value109);
    });

    /**
     * @tc.name   DataView13Test110
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_11000
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = DataView13.DataView13Test110()
      expect(result).assertEqual(100n);
    });

    /**
     * @tc.name   DataView13Test111
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_11100
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer111 = new ArrayBuffer(8);
      const dataView111 = new DataView(buffer111);
      const patternValue1 = 0x5555555555555555n;
      dataView111.setBigInt64(0, patternValue1, true);
      expect(dataView111.getBigInt64(0, true)).assertEqual(patternValue1);
    });

    /**
     * @tc.name   DataView13Test112
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_11200
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer112 = new ArrayBuffer(8);
      const dataView112 = new DataView(buffer112);
      const patternValue2 = 0xAAAAAAAAAAAAAAAAn;
      dataView112.setBigInt64(0, patternValue2, false);
      expect(dataView112.getBigInt64(0, false)).assertEqual(-6148914691236517206n);
    });

    /**
     * @tc.name   DataView13Test113
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_11300
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer113 = new ArrayBuffer(8);
      const dataView113 = new DataView(buffer113);
      const allOnes = 0xFFFFFFFFFFFFFFFFn;
      dataView113.setBigInt64(0, allOnes, true);
      expect(dataView113.getBigInt64(0, true)).assertEqual(-1n);
    });

    /**
     * @tc.name   DataView13Test114
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_11400
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer114 = new ArrayBuffer(8);
      const dataView114 = new DataView(buffer114);
      const highBitOnly = 0x8000000000000000n;
      dataView114.setBigInt64(0, highBitOnly, false);
      expect(dataView114.getBigInt64(0, false)).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.name   DataView13Test115
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_11500
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer115 = new ArrayBuffer(8);
      const dataView115 = new DataView(buffer115);
      const lowBitOnly = 1n;
      dataView115.setBigInt64(0, lowBitOnly, true);
      expect(dataView115.getBigInt64(0, true)).assertEqual(lowBitOnly);
    });

    /**
     * @tc.name   DataView13Test116
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_11600
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer116 = new ArrayBuffer(8);
      const dataView116 = new DataView(buffer116);
      const minInt64 = -9223372036854775808n;
      dataView116.setBigInt64(0, minInt64, false);
      expect(dataView116.getBigInt64(0, false)).assertEqual(minInt64);
    });

    /**
     * @tc.name   DataView13Test117
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_11700
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer117 = new ArrayBuffer(8);
      const dataView117 = new DataView(buffer117);
      const midBitValue = 0x0000000080000000n;
      dataView117.setBigInt64(0, midBitValue, true);
      expect(dataView117.getBigInt64(0, true)).assertEqual(midBitValue);
    });

    /**
     * @tc.name   DataView13Test118
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_11800
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer118 = new ArrayBuffer(8);
      const dataView118 = new DataView(buffer118);
      const truncated = BigInt.asIntN(64, 0x1234567890ABCDEF00n);
      dataView118.setBigInt64(0, truncated, false);
      expect(dataView118.getBigInt64(0, false)).assertEqual(truncated);
    });

    /**
     * @tc.name   DataView13Test119
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_11900
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer119 = new ArrayBuffer(8);
      const dataView119 = new DataView(buffer119);
      const value119 = (1000000000000000000n - 1n);
      dataView119.setBigInt64(0, value119, true);
      expect(dataView119.getBigInt64(0, true)).assertEqual(value119);
    });

    /**
     * @tc.name   DataView13Test120
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_12000
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer120 = new ArrayBuffer(8);
      const dataView120 = new DataView(buffer120);
      const value120 = (9223372036854775707n + 100n);
      dataView120.setBigInt64(0, value120, false);
      expect(dataView120.getBigInt64(0, false)).assertEqual(value120);
    });

    /**
     * @tc.name   DataView13Test121
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_12100
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer121 = new ArrayBuffer(8);
      const dataView121 = new DataView(buffer121, 0, 8);
      dataView121.setBigInt64(0, 123n, true);
      expect(dataView121.getBigInt64(0, true)).assertEqual(123n);
    });

    /**
     * @tc.name   DataView13Test122
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_12200
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer122 = new ArrayBuffer(16);
      const dataView122 = new DataView(buffer122, 0, 16);
      dataView122.setBigInt64(8, 456n, false);
      expect(dataView122.getBigInt64(8, false)).assertEqual(456n);
    });

    /**
     * @tc.name   DataView13Test123
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_12300
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const buffer123 = new ArrayBuffer(4);
        const dataView123 = new DataView(buffer123, 0, 4);
        dataView123.setBigInt64(0, 100n, true);
        expect(false).assertEqual(true);
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.name   DataView13Test124
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_12400
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const buffer124 = new ArrayBuffer(7);
        const dataView124 = new DataView(buffer124);
        dataView124.setBigInt64(0, 100n, false);
        expect(false).assertEqual(true);
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.name   DataView13Test125
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_12500
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer125 = new ArrayBuffer(8);
      const dataView125 = new DataView(buffer125);
      const unsignedMask = 0xFFFFFFFFFFFFFFFFn;
      const value125 = (0x8000000000000000n & unsignedMask);
      dataView125.setBigInt64(0, value125, true);
      expect(dataView125.getBigInt64(0, true)).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.name   DataView13Test126
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_12600
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer126 = new ArrayBuffer(8);
      const dataView126 = new DataView(buffer126);
      const zeroFromStr = BigInt("0");
      dataView126.setBigInt64(0, zeroFromStr, false);
      expect(dataView126.getBigInt64(0, false)).assertEqual(zeroFromStr);
    });

    /**
     * @tc.name   DataView13Test127
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_12700
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer127 = new ArrayBuffer(8);
      const dataView127 = new DataView(buffer127);
      const minusOne = BigInt("-1");
      dataView127.setBigInt64(0, minusOne, true);
      expect(dataView127.getBigInt64(0, true)).assertEqual(minusOne);
    });

    /**
     * @tc.name   DataView13Test128
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_12800
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer128 = new ArrayBuffer(8);
      const dataView128 = new DataView(buffer128);
      const octalValue = 0o1234567012345670n;
      dataView128.setBigInt64(0, octalValue, false);
      expect(dataView128.getBigInt64(0, false)).assertEqual(octalValue);
    });

    /**
     * @tc.name   DataView13Test129
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_12900
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer129 = new ArrayBuffer(8);
      const dataView129 = new DataView(buffer129);
      const binaryStrValue = 0b1010101010101010101010101010101010101010101010101010101010101010n;
      dataView129.setBigInt64(0, binaryStrValue, true);
      expect(dataView129.getBigInt64(0, true)).assertEqual(-6148914691236517206n);
    });

    /**
     * @tc.name   DataView13Test130
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_13000
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer130 = new ArrayBuffer(8);
      const dataView130 = new DataView(buffer130);
      const largeStr = "9223372036854775807";
      const largeBigInt = BigInt(largeStr);
      dataView130.setBigInt64(0, largeBigInt, false);
      expect(dataView130.getBigInt64(0, false)).assertEqual(largeBigInt);
    });

    /**
     * @tc.name   DataView13Test131
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_13100
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer131 = new ArrayBuffer(8);
      const dataView131 = new DataView(buffer131);
      const smallStr = "-9223372036854775808";
      const smallBigInt = BigInt(smallStr);
      dataView131.setBigInt64(0, smallBigInt, true);
      expect(dataView131.getBigInt64(0, true)).assertEqual(smallBigInt);
    });

    /**
     * @tc.name   DataView13Test132
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_13200
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer132 = new ArrayBuffer(8);
      const dataView132 = new DataView(buffer132);
      const paddedStr = "000000000000123";
      const paddedBigInt = BigInt(paddedStr);
      dataView132.setBigInt64(0, paddedBigInt, false);
      expect(dataView132.getBigInt64(0, false)).assertEqual(paddedBigInt);
    });

    /**
     * @tc.name   DataView13Test133
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_13300
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer133 = new ArrayBuffer(8);
      const dataView133 = new DataView(buffer133);
      const positiveStr = "+456";
      const positiveBigInt = BigInt(positiveStr);
      dataView133.setBigInt64(0, positiveBigInt, true);
      expect(dataView133.getBigInt64(0, true)).assertEqual(positiveBigInt);
    });

    /**
     * @tc.name   DataView13Test134
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_13400
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const buffer134 = new ArrayBuffer(8);
        const dataView134 = new DataView(buffer134);
        dataView134.setBigInt64(0, BigInt("invalid"), true);
        expect(false).assertEqual(true);
      } catch (e) {
        expect(e.name).assertEqual("SyntaxError");
      }
    });

    /**
     * @tc.name   DataView13Test135
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_13500
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer135 = new ArrayBuffer(8);
      const dataView135 = new DataView(buffer135);
      const hugeStr = "999999999999999999999999999999999999999";
      const hugeBigInt = BigInt(hugeStr);
      dataView135.setBigInt64(0, hugeBigInt, false);
      const readBack = dataView135.getBigInt64(0, false);
      expect(readBack === hugeBigInt).assertEqual(false);
    });

    /**
     * @tc.name   DataView13Test136
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_13600
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer136 = new ArrayBuffer(8);
      const dataView136 = new DataView(buffer136);
      const signedValue = -1n;
      dataView136.setBigInt64(0, signedValue, true);
      const unsignedInterpretation = dataView136.getBigUint64(0, true);
      expect(unsignedInterpretation).assertEqual(0xFFFFFFFFFFFFFFFFn);

    });

    /**
     * @tc.name   DataView13Test137
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_13700
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer137 = new ArrayBuffer(8);
      const dataView137 = new DataView(buffer137);
      const unsignedValue = 0xFFFFFFFFFFFFFFFFn;
      dataView137.setBigUint64(0, unsignedValue, false);
      const signedInterpretation = dataView137.getBigInt64(0, false);
      expect(signedInterpretation).assertEqual(-1n);
    });

    /**
     * @tc.name   DataView13Test138
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_13800
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer138 = new ArrayBuffer(8);
      const dataView138 = new DataView(buffer138);
      const floatNum = 123.999;
      const flooredBigInt = BigInt(Math.floor(floatNum));
      dataView138.setBigInt64(0, flooredBigInt, true);
      expect(dataView138.getBigInt64(0, true)).assertEqual(flooredBigInt);
    });

    /**
     * @tc.name   DataView13Test139
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_13900
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer139 = new ArrayBuffer(8);
      const dataView139 = new DataView(buffer139);
      const strNum = "789.123";
      const parsedBigInt = BigInt(parseInt(strNum, 10));
      dataView139.setBigInt64(0, parsedBigInt, false);
      expect(dataView139.getBigInt64(0, false)).assertEqual(parsedBigInt);
    });

    /**
     * @tc.name   DataView13Test140
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_14000
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer140 = new ArrayBuffer(8);
      const dataView140 = new DataView(buffer140);
      const baseValue = 100n;
      const calculatedFromTemplate = `${baseValue + 50n}`;
      const finalBigInt = BigInt(calculatedFromTemplate);
      dataView140.setBigInt64(0, finalBigInt, true);
      expect(dataView140.getBigInt64(0, true)).assertEqual(finalBigInt);
    });

    /**
     * @tc.name   DataView13Test141
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_14100
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer141 = new ArrayBuffer(32);
      const dataView141 = new DataView(buffer141);

      for (let i = 0; i < 4; i++) {
        dataView141.setBigInt64(i * 8, BigInt(i) + 100n, true);
      }

      for (let i = 0; i < 4; i++) {
        expect(dataView141.getBigInt64(i * 8, true)).assertEqual(BigInt(i) + 100n);
      }
    });

    /**
     * @tc.name   DataView13Test142
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_14200
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer142 = new ArrayBuffer(32);
      const dataView142 = new DataView(buffer142);
      let j = 3;
      while (j >= 0) {
        dataView142.setBigInt64(j * 8, BigInt(j) - 50n, false);
        j--;
      }

      j = 3;
      while (j >= 0) {
        expect(dataView142.getBigInt64(j * 8, false)).assertEqual(BigInt(j) - 50n)
        j--;
      }
    });

    /**
     * @tc.name   DataView13Test143
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_14300
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer143 = new ArrayBuffer(32);
      const dataView143 = new DataView(buffer143);
      const valuesToWrite = [10n, 20n, 30n, 40n];

      valuesToWrite.forEach((val, index) => {
        dataView143.setBigInt64(index * 8, val, true);
      });

      valuesToWrite.forEach((val, index) => {
        expect(dataView143.getBigInt64(index * 8, true)).assertEqual(val);
      });
    });

    /**
     * @tc.name   DataView13Test144
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_14400
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer144 = new ArrayBuffer(8);
      const dataView144 = new DataView(buffer144);
      const reduceArray = [1n, 2n, 3n, 4n, 5n];
      const reducedValue = reduceArray.reduce((acc, val) => acc + val, 0n);
      dataView144.setBigInt64(0, reducedValue, false);
      expect(dataView144.getBigInt64(0, false)).assertEqual(reducedValue);
    });

    /**
     * @tc.name   DataView13Test145
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_14500
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer145 = new ArrayBuffer(8);
      const dataView145 = new DataView(buffer145);
      const maxValue = 9223372036854775807n;
      const value145 = (100n > maxValue ? 100n : maxValue);
      dataView145.setBigInt64(0, value145, true);
      expect(dataView145.getBigInt64(0, true)).assertEqual(maxValue);
    });

    /**
     * @tc.name   DataView13Test146
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_14600
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer146 = new ArrayBuffer(8);
      const dataView146 = new DataView(buffer146);
      const minValue = -9223372036854775808n;
      const value146 = (-100n < minValue ? -100n : minValue);
      dataView146.setBigInt64(0, value146, false);
      expect(dataView146.getBigInt64(0, false)).assertEqual(minValue);
    });

    /**
     * @tc.name   DataView13Test147
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_14700
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer147 = new ArrayBuffer(8);
      const dataView147 = new DataView(buffer147);
      const condition = true;
      const value147 = condition ? 123n : 456n;
      dataView147.setBigInt64(0, value147, true);
      expect(dataView147.getBigInt64(0, true)).assertEqual(value147);
    });

    /**
     * @tc.name   DataView13Test148
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_14800
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer148 = new ArrayBuffer(8);
      const dataView148 = new DataView(buffer148);
      const value148 = (true && 789n);
      dataView148.setBigInt64(0, value148, false);
      expect(dataView148.getBigInt64(0, false)).assertEqual(789n);
    });

    /**
     * @tc.name   DataView13Test149
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_14900
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer149 = new ArrayBuffer(8);
      const dataView149 = new DataView(buffer149);
      const value149 = 321n;
      dataView149.setBigInt64(0, value149, true);
      expect(dataView149.getBigInt64(0, true)).assertEqual(321n);
    });

    /**
     * @tc.name   DataView13Test150
     * @tc.number SUB_BUILTINS_DATAVIEW13_TEST_15000
     * @tc.desc   test DataView setBigInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView13Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArrayBuffer = new ArrayBuffer(8);
      const buffer150 = originalArrayBuffer;
      const dataView150 = new DataView(buffer150);
      dataView150.setBigInt64(0, 100n, true);
      expect(buffer150).assertEqual(originalArrayBuffer);
    });

  })
}