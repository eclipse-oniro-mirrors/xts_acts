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

export default function DataView14Test() {
  describe('DataView14Test', () => {
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
     * @tc.name   DataView14Test001
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_0100
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = 12345678901234567890n;
      view.setBigUint64(0, value, true); // littleEndian = true
      const result = new DataView(buffer).getBigUint64(0, true);
      expect(result).assertEqual(12345678901234567890n);
    });

    /**
     * @tc.name   DataView14Test002
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_0200
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = 0n;
      view.setBigUint64(0, value, false);
      const result = new DataView(buffer).getBigUint64(0, false);
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.name   DataView14Test003
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_0300
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const maxValue = 18446744073709551615n;
      view.setBigUint64(0, maxValue, true);
      const result = new DataView(buffer).getBigUint64(0, true);
      expect(result).assertEqual(maxValue);
    });

    /**
     * @tc.name   DataView14Test004
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_0400
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = 9876543210987654321n;
      view.setBigUint64(0, value, false);
      const result = new DataView(buffer).getBigUint64(0, false);
      expect(result).assertEqual(9876543210987654321n);
    });

    /**
     * @tc.name   DataView14Test005
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_0500
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(9);
      const view = new DataView(buffer);
      const value = 1000000000000000000n;
      view.setBigUint64(1, value, true);
      const result = new DataView(buffer).getBigUint64(1, true);
      expect(result).assertEqual(1000000000000000000n);
    });

    /**
     * @tc.name   DataView14Test006
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_0600
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(9);
      const view = new DataView(buffer);
      const value = 2000000000000000000n;
      view.setBigUint64(1, value, false);
      const result = new DataView(buffer).getBigUint64(1, false);
      expect(result).assertEqual(2000000000000000000n);
    });

    /**
     * @tc.name   DataView14Test007
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_0700
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setBigUint64(0, 1n, true);
      const result = new DataView(buffer).getBigUint64(0, true);
      expect(result).assertEqual(1n);
    });

    /**
     * @tc.name   DataView14Test008
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_0800
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = 18446744073709551610n;
      view.setBigUint64(0, value, true);
      const result = new DataView(buffer).getBigUint64(0, true);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test009
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_0900
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setBigUint64(0, 100n, true);
      view.setBigUint64(0, 200n, true);
      const result = new DataView(buffer).getBigUint64(0, true);
      expect(result).assertEqual(200n);
    });

    /**
     * @tc.name   DataView14Test010
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_1000
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigUint64(0, 123n, true);
      view.setBigUint64(8, 456n, true);
      const result1 = new DataView(buffer).getBigUint64(0, true);
      const result2 = new DataView(buffer).getBigUint64(8, true);
      expect(result1).assertEqual(123n);
      expect(result2).assertEqual(456n);
    });

    /**
     * @tc.name   DataView14Test011
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_1100
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigUint64(0, 999n, false);
      view.setBigUint64(8, 888n, false);
      const result1 = new DataView(buffer).getBigUint64(0, false);
      const result2 = new DataView(buffer).getBigUint64(8, false);
      expect(result1).assertEqual(999n);
      expect(result2).assertEqual(888n);
    });

    /**
     * @tc.name   DataView14Test012
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_1200
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = 2718281828459045235n;
      view.setBigUint64(0, value, true);
      const result = new DataView(buffer).getBigUint64(0, true);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test013
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_1300
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = 3141592653589793239n;
      view.setBigUint64(0, value, true);
      const result = new DataView(buffer).getBigUint64(0, true);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test014
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_1400
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = 1n << 60n;
      view.setBigUint64(0, value, true);
      const result = new DataView(buffer).getBigUint64(0, true);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test015
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_1500
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = (1n << 60n) - 1n;
      view.setBigUint64(0, value, true);
      const result = new DataView(buffer).getBigUint64(0, true);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test016
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_1600
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = 555n;
      view.setBigUint64(0, value, false);
      const result = new DataView(buffer).getBigUint64(0, false);
      expect(result).assertEqual(555n);
    });

    /**
     * @tc.name   DataView14Test017
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_1700
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(9);
      const view = new DataView(buffer);
      const value = 666n;
      view.setBigUint64(1, value, false);
      const result = new DataView(buffer).getBigUint64(1, false);
      expect(result).assertEqual(666n);
    });

    /**
     * @tc.name   DataView14Test018
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_1800
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const value = 0xFFFFFFFFFFFFFFFFn;
    //   view.setBigUint64(0, value, true);
    //   const result = new DataView(buffer).getBigUint64(0, true);
    //   expect(result).assertEqual(value);
    // });

    /**
     * @tc.name   DataView14Test019
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_1900
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const value = 0x8000000000000000n;
    //   view.setBigUint64(0, value, true);
    //   const result = new DataView(buffer).getBigUint64(0, true);
    //   expect(result).assertEqual(value);
    // });

    /**
     * @tc.name   DataView14Test020
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_2000
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const value = 0x0000000000000001n;
    //   view.setBigUint64(0, value, true);
    //   const result = new DataView(buffer).getBigUint64(0, true);
    //   expect(result).assertEqual(value);
    // });

    /**
     * @tc.name   DataView14Test021
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_2100
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const value = 0xAAAAAAAAAAAAAAAAn;
    //   view.setBigUint64(0, value, true);
    //   const result = new DataView(buffer).getBigUint64(0, true);
    //   expect(result).assertEqual(value);
    // });

    /**
     * @tc.name   DataView14Test022
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_2200
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const value = 0x5555555555555555n;
    //   view.setBigUint64(0, value, true);
    //   const result = new DataView(buffer).getBigUint64(0, true);
    //   expect(result).assertEqual(value);
    // });

    /**
     * @tc.name   DataView14Test023
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_2300
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = 1234567898765432109n;
      view.setBigUint64(0, value, true);
      const result = new DataView(buffer).getBigUint64(0, true);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test024
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_2400
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = 42n;
      view.setBigUint64(0, value, true);
      const result = new DataView(buffer).getBigUint64(0, true);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test025
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_2500
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   view.setBigUint64(0, 0x0123456789ABCDEFn, false);
    //   const bytes = new Uint8Array(buffer);
    //   expect(bytes[0]).assertEqual(0x01);
    //   expect(bytes[1]).assertEqual(0x23);
    //   expect(bytes[2]).assertEqual(0x45);
    //   expect(bytes[3]).assertEqual(0x67);
    //   expect(bytes[4]).assertEqual(0x89);
    //   expect(bytes[5]).assertEqual(0xAB);
    //   expect(bytes[6]).assertEqual(0xCD);
    //   expect(bytes[7]).assertEqual(0xEF);
    // });

    /**
     * @tc.name   DataView14Test026
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_2600
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   view.setBigUint64(0, 0x0123456789ABCDEFn, true);
    //   const bytes = new Uint8Array(buffer);
    //   expect(bytes[7]).assertEqual(0x01);
    //   expect(bytes[6]).assertEqual(0x23);
    //   expect(bytes[5]).assertEqual(0x45);
    //   expect(bytes[4]).assertEqual(0x67);
    //   expect(bytes[3]).assertEqual(0x89);
    //   expect(bytes[2]).assertEqual(0xAB);
    //   expect(bytes[1]).assertEqual(0xCD);
    //   expect(bytes[0]).assertEqual(0xEF);
    // });

    /**
     * @tc.name   DataView14Test027
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_2700
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setBigUint64(0, 9999n, true);
      const result = new DataView(buffer).getBigUint64(0, true);
      expect(result).assertEqual(9999n);
    });

    /**
     * @tc.name   DataView14Test028
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_2800
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = 8888n;
      view.setBigUint64(0, value);
      const result = new DataView(buffer).getBigUint64(0, true);
      expect(result).assertEqual(13268167452186902528n);
    });

    /**
     * @tc.name   DataView14Test029
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_2900
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = 7777n;
      view.setBigUint64(0, value, false);
      const result = new DataView(buffer).getBigUint64(0, false);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test030
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_3000
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view1 = new DataView(buffer);
      const view2 = new DataView(buffer);
      view1.setBigUint64(0, 654321n, true);
      const result = view2.getBigUint64(0, true);
      expect(result).assertEqual(654321n);
    });

    /**
     * @tc.name   DataView14Test031
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_3100
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer);
      const value = 123456789n;
      view.setBigUint64(2, value, true);
      const result = new DataView(buffer).getBigUint64(2, true);
      expect(result).assertEqual(123456789n);
    });

    /**
     * @tc.name   DataView14Test032
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_3200
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view = new DataView(buffer);
      const value = 987654321n;
      view.setBigUint64(2, value, false);
      const result = new DataView(buffer).getBigUint64(2, false);
      expect(result).assertEqual(987654321n);
    });

    /**
     * @tc.name   DataView14Test033
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_3300
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setBigUint64(0, 2n, true);
      const bytes = new Uint8Array(buffer);
      expect(bytes[0]).assertEqual(2);
      for (let i = 1; i < 8; i++) {
        expect(bytes[i]).assertEqual(0);
      }
    });

    /**
     * @tc.name   DataView14Test034
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_3400
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setBigUint64(0, 18446744073709551615n, false);
      const bytes = new Uint8Array(buffer);
      for (let i = 0; i < 8; i++) {
        expect(bytes[i]).assertEqual(0xFF);
      }
    });

    /**
     * @tc.name   DataView14Test035
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_3500
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setBigUint64(0, 18446744073709551615n, true);
      const bytes = new Uint8Array(buffer);
      for (let i = 0; i < 8; i++) {
        expect(bytes[i]).assertEqual(0xFF);
      }
    });

    /**
     * @tc.name   DataView14Test036
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_3600
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setBigUint64(0, 0n, false);
      const bytes = new Uint8Array(buffer);
      for (let i = 0; i < 8; i++) {
        expect(bytes[i]).assertEqual(0);
      }
    });

    /**
     * @tc.name   DataView14Test037
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_3700
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setBigUint64(0, 0n, true);
      const bytes = new Uint8Array(buffer);
      for (let i = 0; i < 8; i++) {
        expect(bytes[i]).assertEqual(0);
      }
    });

    /**
     * @tc.name   DataView14Test038
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_3800
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const uint8View = new Uint8Array(buffer);
      const dataView = new DataView(buffer);

      uint8View[0] = 1;
      uint8View[1] = 2;

      dataView.setBigUint64(8, 1234567890123456789n, true);

      expect(uint8View[0]).assertEqual(1);
      expect(uint8View[1]).assertEqual(2);
    });

    /**
     * @tc.name   DataView14Test039
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_3900
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(24);
      const view = new DataView(buffer);
      const values = [111n, 222n, 333n];
      view.setBigUint64(0, values[0], true);
      view.setBigUint64(8, values[1], true);
      view.setBigUint64(16, values[2], true);
      expect(view.getBigUint64(0, true)).assertEqual(values[0]);
      expect(view.getBigUint64(8, true)).assertEqual(values[1]);
      expect(view.getBigUint64(16, true)).assertEqual(values[2]);
    });

    /**
     * @tc.name   DataView14Test040
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_4000
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(24);
      const view = new DataView(buffer);
      const values = [444n, 555n, 666n];
      view.setBigUint64(0, values[0], false);
      view.setBigUint64(8, values[1], false);
      view.setBigUint64(16, values[2], false);
      expect(view.getBigUint64(0, false)).assertEqual(values[0]);
      expect(view.getBigUint64(8, false)).assertEqual(values[1]);
      expect(view.getBigUint64(16, false)).assertEqual(values[2]);
    });

    /**
     * @tc.name   DataView14Test041
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_4100
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = 7777777777777777777n;
      view.setBigUint64(0, value, true);
      const result = view.getBigUint64(0, true);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test042
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_4200
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const negativeBigInt = -1n;
      const expected = 18446744073709551615n;
      view.setBigUint64(0, negativeBigInt, true);
      const result = view.getBigUint64(0, true);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   DataView14Test043
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_4300
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = -2n;
      const expected = 18446744073709551614n;
      view.setBigUint64(0, value, true);
      const result = view.getBigUint64(0, true);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   DataView14Test044
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_4400
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = 2n**64n;
      const expected = 0n;
      view.setBigUint64(0, value, true);
      const result = view.getBigUint64(0, true);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   DataView14Test045
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_4500
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = 2n**64n + 1n;
      const expected = 1n;
      view.setBigUint64(0, value, true);
      const result = view.getBigUint64(0, true);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   DataView14Test046
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_4600
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = 1n << 63n;
      view.setBigUint64(0, value, true);
      const result = view.getBigUint64(0, true);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test047
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_4700
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = (1n << 63n) - 1n;
      view.setBigUint64(0, value, true);
      const result = view.getBigUint64(0, true);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test048
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_4800
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = 1n << 62n;
      view.setBigUint64(0, value, true);
      const result = view.getBigUint64(0, true);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test049
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_4900
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const value = 0xFFFFFFFFFFFFFFF0n;
    //   view.setBigUint64(0, value, true);
    //   const result = view.getBigUint64(0, true);
    //   expect(result).assertEqual(value);
    // });

    /**
     * @tc.name   DataView14Test050
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_5000
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const value = 0x00000000FFFFFFFFn;
    //   view.setBigUint64(0, value, true);
    //   const result = view.getBigUint64(0, true);
    //   expect(result).assertEqual(value);
    // });

    /**
     * @tc.name   DataView14Test051
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_5100
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const value = 0xFFFF000000000000n;
    //   view.setBigUint64(0, value, true);
    //   const result = view.getBigUint64(0, true);
    //   expect(result).assertEqual(value);
    // });

    /**
     * @tc.name   DataView14Test052
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_5200
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const value = 0x0100000000000000n;
    //   view.setBigUint64(0, value, false);
    //   const result = view.getBigUint64(0, false);
    //   expect(result).assertEqual(value);
    // });

    /**
     * @tc.name   DataView14Test053
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_5300
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(15);
      const view = new DataView(buffer);
      view.setBigUint64(7, 1n, true);
      const result = new DataView(buffer).getBigUint64(7, true);
      expect(result).assertEqual(1n);
    });

    /**
     * @tc.name   DataView14Test054
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_5400
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const dataView = new DataView(buffer);
    //   const uint8View = new Uint8Array(buffer);
    //   const value = 0x123456789ABCDEF0n;
    //   dataView.setBigUint64(0, value, true);
    //   let reconstructed = 0n;
    //   for (let i = 0; i < 8; i++) {
    //     reconstructed += BigInt(uint8View[i]) << (BigInt(i) * 8n);
    //   }
    //   expect(reconstructed).assertEqual(value);
    // });

    /**
     * @tc.name   DataView14Test055
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_5500
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const dataView = new DataView(buffer);
    //   const uint8View = new Uint8Array(buffer);
    //   const value = 0x123456789ABCDEF0n;
    //   dataView.setBigUint64(0, value, false);
    //   let reconstructed = 0n;
    //   for (let i = 0; i < 8; i++) {
    //     reconstructed = (reconstructed << 8n) + BigInt(uint8View[i]);
    //   }
    //   expect(reconstructed).assertEqual(value);
    // });

    /**
     * @tc.name   DataView14Test056
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_5600
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer, 4, 8);
      const value = 1234567890123456789n;
      view.setBigUint64(0, value, true);
      const result = new DataView(buffer).getBigUint64(4, true);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test057
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_5700
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const view = new DataView(buffer, 4, 8);
      const value = 9876543210987654321n;
      view.setBigUint64(0, value, true);
      const result = new DataView(buffer).getBigUint64(4, true);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test058
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_5800
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const value = 0xDEADBEEFCAFEBABEn;
    //   view.setBigUint64(0, value, true);
    //   const result = view.getBigUint64(0, true);
    //   expect(result).assertEqual(value);
    // });

    /**
     * @tc.name   DataView14Test059
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_5900
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = 314159265358979323n;
      view.setBigUint64(0, value, true);
      const result = view.getBigUint64(0, true);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test060
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_6000
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = 271828182845904523n;
      view.setBigUint64(0, value, true);
      const result = view.getBigUint64(0, true);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test061
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_6100
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const value = 0x1111111111111111n;
    //   view.setBigUint64(0, value, true);
    //   const result = view.getBigUint64(0, true);
    //   expect(result).assertEqual(value);
    // });

    /**
     * @tc.name   DataView14Test062
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_6200
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const value = 0x2222222222222222n;
    //   view.setBigUint64(0, value, false);
    //   const result = view.getBigUint64(0, false);
    //   expect(result).assertEqual(value);
    // });
    /**
     * @tc.name   DataView14Test063
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_6300
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(11);
      const view = new DataView(buffer);
      const value = 987654321n;
      view.setBigUint64(3, value, true);
      const result = new DataView(buffer).getBigUint64(3, true);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test064
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_6400
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(11);
      const view = new DataView(buffer);
      const value = 123456789n;
      view.setBigUint64(3, value, false);
      const result = new DataView(buffer).getBigUint64(3, false);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test065
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_6500
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const originalByteLength = view.byteLength;
      const originalBuffer = view.buffer;
      view.setBigUint64(0, 123n, true);
      expect(view.byteLength).assertEqual(originalByteLength);
      expect(view.buffer).assertEqual(originalBuffer);
    });

    /**
     * @tc.name   DataView14Test066
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_6600
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = 456n;
      view.setBigUint64(0, value, true);
      const slicedBuffer = buffer.slice(0, 8);
      const resultView = new DataView(slicedBuffer);
      const result = resultView.getBigUint64(0, true);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test067
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_6700
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const uint8View = new Uint8Array(buffer);
      const value = 789n;
      dataView.setBigUint64(0, value, true);
      const subarray = uint8View.subarray(0, 8);
      const resultView = new DataView(subarray.buffer, subarray.byteOffset, subarray.byteLength);
      const result = resultView.getBigUint64(0, true);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test068
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_6800
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const value = 0x0011223344556677n;
    //
    //   view.setBigUint64(0, value, true);
    //   const littleEndianBytes = Array.from(new Uint8Array(buffer));
    //   expect(littleEndianBytes[0]).assertEqual(0x77);
    //   expect(littleEndianBytes[1]).assertEqual(0x66);
    //   expect(littleEndianBytes[2]).assertEqual(0x55);
    //   expect(littleEndianBytes[3]).assertEqual(0x44);
    //   expect(littleEndianBytes[4]).assertEqual(0x33);
    //   expect(littleEndianBytes[5]).assertEqual(0x22);
    //   expect(littleEndianBytes[6]).assertEqual(0x11);
    //   expect(littleEndianBytes[7]).assertEqual(0x00);
    //
    //   view.setBigUint64(0, value, false);
    //   const bigEndianBytes = Array.from(new Uint8Array(buffer));
    //   expect(bigEndianBytes[0]).assertEqual(0x00);
    //   expect(bigEndianBytes[1]).assertEqual(0x11);
    //   expect(bigEndianBytes[2]).assertEqual(0x22);
    //   expect(bigEndianBytes[3]).assertEqual(0x33);
    //   expect(bigEndianBytes[4]).assertEqual(0x44);
    //   expect(bigEndianBytes[5]).assertEqual(0x55);
    //   expect(bigEndianBytes[6]).assertEqual(0x66);
    //   expect(bigEndianBytes[7]).assertEqual(0x77);
    // });

    /**
     * @tc.name   DataView14Test069
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_6900
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const uint8View = new Uint8Array(buffer);
    //   const dataView = new DataView(buffer);
    //
    //   uint8View.fill(0xFF);
    //
    //   dataView.setBigUint64(0, 0x12345678n, true);
    //
    //   expect(uint8View[0]).assertEqual(120);
    //   expect(uint8View[1]).assertEqual(86);
    //   expect(uint8View[2]).assertEqual(52);
    //   expect(uint8View[3]).assertEqual(18);
    //   expect(uint8View[4]).assertEqual(0);
    //   expect(uint8View[5]).assertEqual(0);
    //   expect(uint8View[6]).assertEqual(0);
    //   expect(uint8View[7]).assertEqual(0);
    // });

    /**
     * @tc.name   DataView14Test070
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_7000
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view1 = new DataView(buffer);
      const value = 1111111111111111111n;
      view1.setBigUint64(0, value, true);
      const view2 = new DataView(buffer);
      const result = view2.getBigUint64(0, true);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test071
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_7100
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const value = 0xAABBCCDDDDCCBBAAn;
    //   view.setBigUint64(0, value, true);
    //   const result = view.getBigUint64(0, true);
    //   expect(result).assertEqual(value);
    // });

    /**
     * @tc.name   DataView14Test072
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_7200
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = 18446744073709551557n;
      view.setBigUint64(0, value, true);
      const result = view.getBigUint64(0, true);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test073
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_7300
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = 1844674407370955161n;
      view.setBigUint64(0, value, false);
      const result = view.getBigUint64(0, false);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test075
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_7500
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(9);
    //   const view = new DataView(buffer);
    //   const value = 0xFFFFFFFFFFFFFFFFn;
    //   view.setBigUint64(1, value, true);
    //   const result = new DataView(buffer).getBigUint64(1, true);
    //   expect(result).assertEqual(value);
    // });

    /**
     * @tc.name   DataView14Test076
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_7600
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(9);
      const view = new DataView(buffer);
      const value = 0n;
      view.setBigUint64(1, value, false);
      const result = new DataView(buffer).getBigUint64(1, false);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test077
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_7700
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigUint64(0, 100n, true);
      expect(view.getBigUint64(0, true)).assertEqual(100n);
      view.setBigUint64(8, 200n, true);
      expect(view.getBigUint64(8, true)).assertEqual(200n);
      view.setBigUint64(0, 300n, true);
      expect(view.getBigUint64(0, true)).assertEqual(300n);
    });

    /**
     * @tc.name   DataView14Test078
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_7800
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = BigInt("9223372036854775807"); // 2^63 - 1
      view.setBigUint64(0, value, true);
      const result = view.getBigUint64(0, true);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test079
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_7900
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = BigInt(Number.MAX_SAFE_INTEGER) + 1n;
      view.setBigUint64(0, value, false);
      const result = view.getBigUint64(0, false);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test080
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_8000
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const dataView = new DataView(buffer);
    //   const uintValue = 0x3FF0000000000000n;
    //   dataView.setBigUint64(0, uintValue, false);
    //   const floatValue = dataView.getFloat64(0, false);
    //   expect(floatValue).assertEqual(1.0);
    // });

    /**
     * @tc.name   DataView14Test081
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_8100
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setBigUint64(0, 0n, true);
      const result = dataView.getBigInt64(0, true);
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.name   DataView14Test082
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_8200
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setBigUint64(0, 18446744073709551615n, true);
      const result = dataView.getBigInt64(0, true);
      expect(result).assertEqual(-1n);
    });

    /**
     * @tc.name   DataView14Test083
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_8300
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const unsignedValue = 1n << 63n;
      dataView.setBigUint64(0, unsignedValue, true);
      const signedResult = dataView.getBigInt64(0, true);
      const expectedSigned = -9223372036854775808n;
      expect(signedResult).assertEqual(expectedSigned);
    });

    /**
     * @tc.name   DataView14Test084
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_8400
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new ArrayBuffer(8);
      const view = new DataView(sab);
      const value = 5555555555555555555n;
      view.setBigUint64(0, value, true);
      const result = new DataView(sab).getBigUint64(0, true);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test085
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_8500
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = 6666666666666666666n;
      view.setBigUint64(0, value, true);

      const transferredView = new DataView(buffer);
      const result = transferredView.getBigUint64(0, true);
      expect(result).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test086
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_8600
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const signedEquivalent = -1234567890123456789n;
    //   const unsignedValue = signedEquivalent & 0xFFFFFFFFFFFFFFFFn;
    //   view.setBigUint64(0, unsignedValue, true);
    //   const result = view.getBigUint64(0, true);
    //   expect(result).assertEqual(unsignedValue);
    // });

    /**
     * @tc.name   DataView14Test087
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_8700
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const uint8View = new Uint8Array(buffer);
    //   const value = 0x123456789ABCDEF0n;
    //   view.setBigUint64(0, value, true);
    //
    //   let checksum = 0;
    //   for (const byte of uint8View) {
    //     checksum ^= byte;
    //   }
    //   const expectedChecksum = 0x12 ^ 0x34 ^ 0x56 ^ 0x78 ^ 0x9A ^ 0xBC ^ 0xDE ^ 0xF0;
    //   expect(checksum).assertEqual(expectedChecksum);
    // });

    /**
     * @tc.name   DataView14Test089
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_8900
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const dataView = new DataView(buffer);
    //   const uint8Array = new Uint8Array(buffer);
    //   const value = 0xCAFEBABEDEADBEEFn;
    //   dataView.setBigUint64(0, value, false);
    //
    //   expect(uint8Array[0]).assertEqual(0xCA);
    //   expect(uint8Array[7]).assertEqual(0xEF);
    // });

    /**
     * @tc.name   DataView14Test090
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_9000
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view1 = new DataView(buffer);
      const value = 8888888888888888888n;
      view1.setBigUint64(0, value, true);

      const view2 = new DataView(buffer);
      const view3 = new DataView(buffer, 0, 8);
      expect(view2.getBigUint64(0, true)).assertEqual(value);
      expect(view3.getBigUint64(0, true)).assertEqual(value);
    });

    /**
     * @tc.name   DataView14Test091
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_9100
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const originalValue = 0x123456789ABCDEF0n;
    //   const expectedBytesLittleEndian = new Uint8Array([0xF0, 0xDE, 0xBC, 0x9A, 0x78, 0x56, 0x34, 0x12]);
    //   view.setBigUint64(0, originalValue, true);
    //   const actualBytes = new Uint8Array(buffer);
    //   for (let i = 0; i < 8; i++) {
    //     expect(actualBytes[i]).assertEqual(expectedBytesLittleEndian[i]);
    //   }
    // });

    /**
     * @tc.name   DataView14Test092
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_9200
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const value = 0xAABBCCDDEEFF0011n;
    //   const expectedBytesBigEndian = new Uint8Array([0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF, 0x00, 0x11]);
    //   view.setBigUint64(0, value, false);
    //   const actualBytes = new Uint8Array(buffer);
    //   for (let i = 0; i < 8; i++) {
    //     expect(actualBytes[i]).assertEqual(expectedBytesBigEndian[i]);
    //   }
    // });

    /**
     * @tc.name   DataView14Test093
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_9300
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const value = 0x1020304050607080n;
    //   view.setBigUint64(0, value, true);
    //   const result = view.getBigUint64(0, true);
    //   expect(result).assertEqual(value);
    // });

    /**
     * @tc.name   DataView14Test094
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_9400
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(100);
    //   const view = new DataView(buffer);
    //   const value = 0x13579BDF2468ACE0n;
    //   view.setBigUint64(50, value, true);
    //   const result = new DataView(buffer).getBigUint64(50, true);
    //   expect(result).assertEqual(value);
    // });

    /**
     * @tc.name   DataView14Test095
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_9500
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const dataView = new DataView(buffer);
    //   const value = 0xDEADC0DE15BADB00n;
    //   dataView.setBigUint64(0, value, true);
    //   const uint8View = new Uint8Array(buffer);
    //   const expectedBytes = [0x00, 0xDB, 0xBA, 0x15, 0xDE, 0xC0, 0xAD, 0xDE];
    //   let index = 0;
    //   for (const byte of uint8View) {
    //     expect(byte).assertEqual(expectedBytes[index]);
    //     index++;
    //   }
    // });

    /**
     * @tc.name   DataView14Test096
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_9600
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const dataView = new DataView(buffer);
    //   const uint8View = new Uint8Array(buffer);
    //   const originalValue = 0x0123456789ABCDEFn;
    //
    //   dataView.setBigUint64(0, originalValue, true);
    //
    //   for (let i = 0; i < 8; i++) {
    //     const byte = (originalValue >> (BigInt(i) * 8n)) & 0xFFn;
    //     uint8View[i] = Number(byte);
    //   }
    //
    //   const result = dataView.getBigUint64(0, true);
    //   expect(result).assertEqual(originalValue);
    // });

    /**
     * @tc.name   DataView14Test098
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_9800
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = 9876543210987654321n;
      view.setBigUint64(0, value, true);
      expect(buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.name   DataView14Test099
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_9900
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView14Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const value = 1112223334445556666n;
      view.setBigUint64(0, value, true);
      expect(ArrayBuffer.isView(view)).assertEqual(true);
      expect(ArrayBuffer.isView(new Uint8Array(8))).assertEqual(true);
    });

    /**
     * @tc.name   DataView14Test100
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_10000
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(16);
    //   const mainView = new DataView(buffer);
    //   const offsetView = new DataView(buffer, 8);
    //   const value = 0x1234567812345678n;
    //   mainView.setBigUint64(8, value, true);
    //   const result = offsetView.getBigUint64(0, true);
    //   expect(result).assertEqual(value);
    // });

    /**
     * @tc.name   DataView14Test103
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_10300
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const uint8View = new Uint8Array(buffer);
    //   uint8View.set([0x43, 0x61, 0x66, 0xC3, 0xA9, 0x00, 0x00, 0x00]);
    //   const view = new DataView(buffer);
    //   const reconstructedValue = view.getBigUint64(0, true);
    //   const expectedValue = 0x000000A9C3666143n;
    //   expect(reconstructedValue).assertEqual(expectedValue);
    // });

    /**
     * @tc.name   DataView14Test104
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_10400
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(10);
    //   const view = new DataView(buffer);
    //   const value = 0x1122334455667788n;
    //   view.setBigUint64(1, value, true);
    //   const sliced = buffer.slice(1, 9);
    //   const resultView = new DataView(sliced);
    //   const result = resultView.getBigUint64(0, true);
    //   expect(result).assertEqual(value);
    // });

    /**
     * @tc.name   DataView14Test105
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_10500
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(16);
    //   const view = new DataView(buffer, 4, 8);
    //   const value = 0xABCDEF0123456789n;
    //   view.setBigUint64(0, value, true);
    //   expect(view.byteOffset).assertEqual(4);
    //   const result = new DataView(buffer).getBigUint64(4, true);
    //   expect(result).assertEqual(value);
    // });

    /**
     * @tc.name   DataView14Test106
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_10600
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const value = 0x9988776655443322n;
    //   view.setBigUint64(0, value, true);
    //   expect(view.buffer).assertEqual(buffer);
    // });

    /**
     * @tc.name   DataView14Test108
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_10800
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const value = 0x0F0F0F0F0F0F0F0Fn;
    //   view.setBigUint64(0, value, true);
    //   const props = Object.getOwnPropertyNames(view);
    //   expect(props.includes("byteLength")).assertEqual(false);
    //   expect(props.includes("byteOffset")).assertEqual(false);
    //   expect(props.includes("buffer")).assertEqual(false);
    // });

    /**
     * @tc.name   DataView14Test110
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_11000
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const value = 0x13579BDF2468ACE1n;
    //   view.setBigUint64(0, value, true);
    //   if (view) {
    //     const result = view.getBigUint64(0, true);
    //     expect(result).assertEqual(value);
    //   } else {
    //     throw new Error("DataView should be truthy");
    //   }
    // });

    /**
     * @tc.name   DataView14Test111
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_11100
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const value = 0x0102030405060708n;
    //   view.setBigUint64(0, value, true);
    //   expect(view instanceof DataView).assertEqual(true);
    //   expect(view instanceof Object).assertEqual(true);
    // });

    /**
     * @tc.name   DataView14Test114
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_11400
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const value = 0x0011223344556677n;
    //   view.setBigUint64(0, value, false);
    //   expect(view.constructor).assertEqual(DataView);
    // });

    /**
     * @tc.name   DataView14Test118
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_11800
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const value = 0x0F0F0F0F0F0F0F0Fn;
    //   view.setBigUint64(0, value, true);
    //   expect(DataView.length).assertEqual(1);
    // });

    /**
     * @tc.name   DataView14Test121
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_12100
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const value = 0x123456789ABCDEF1n;
    //   view.setBigUint64(0, value, true);
    //   const keys = Object.keys(view);
    //   expect(keys.length).assertEqual(0);
    // });

    /**
     * @tc.name   DataView14Test134
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_13400
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // // todo
    // it('DataView14Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const value = 0xEF123456789ABCDEn;
    //   view.setBigUint64(0, value, true);
    //   const newValue = 0xF123456789ABCDEFn;
    //   view.setBigUint64(0, newValue, true);
    //   expect(view.getBigUint64(0, true)).assertEqual(newValue);
    // });

    /**
     * @tc.name   DataView14Test135
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_13500
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const value = 0x1234567812345678n;
    //   view.setBigUint64(0, value, true);
    //   expect(DataView.name).assertEqual("DataView");
    // });

    /**
     * @tc.name   DataView14Test142
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_14200
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view1 = new DataView(buffer);
    //   const view2 = new DataView(buffer);
    //   const value = 0x89A456789A456789n;
    //   view1.setBigUint64(0, value, true);
    //   view2.setBigUint64(0, value, true);
    //   expect(view1 === view2).assertEqual(false); // 不同实例
    //   expect(view1 == view2).assertEqual(false);
    // });

    /**
     * @tc.name   DataView14Test143
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_14300
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer1 = new ArrayBuffer(8);
    //   const buffer2 = new ArrayBuffer(8);
    //   const view1 = new DataView(buffer1);
    //   const view2 = new DataView(buffer2);
    //   const value = 0x9A456789A456789An;
    //   view1.setBigUint64(0, value, true);
    //   view2.setBigUint64(0, value, true);
    //   // 比较 buffer 内容
    //   const bytes1 = new Uint8Array(buffer1);
    //   const bytes2 = new Uint8Array(buffer2);
    //   let equal = true;
    //   for (let i = 0; i < 8; i++) {
    //     if (bytes1[i] !== bytes2[i]) {
    //       equal = false;
    //       break;
    //     }
    //   }
    //   expect(equal).assertEqual(true);
    // });

    /**
     * @tc.name   DataView14Test144
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_14400
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const dataView = new DataView(buffer);
    //   const uint8View = new Uint8Array(buffer);
    //   const value = 0xA456789A456789ABn;
    //   dataView.setBigUint64(0, value, true);
    //   const doubled = Array.from(uint8View, byte => byte * 2);
    //   const expected = Array.from(uint8View).map(byte => byte * 2);
    //   expect(doubled).assertDeepEquals(expected);
    // });

    /**
     * @tc.name   DataView14Test145
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_14500
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const value = 0x456789A456789ABCn;
    //   view.setBigUint64(0, value, true);
    //   const arr = Array.of(1, 2, 3);
    //   expect(arr.length).assertEqual(3);
    // });

    /**
     * @tc.name   DataView14Test146
     * @tc.number SUB_BUILTINS_DATAVIEW14_TEST_14600
     * @tc.desc   test DataView setBigUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('DataView14Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const buffer = new ArrayBuffer(8);
    //   const view = new DataView(buffer);
    //   const value = 0x56789A456789ABCDn;
    //   view.setBigUint64(0, value, true);
    //   expect(Array.isArray([])).assertEqual(true);
    //   expect(Array.isArray(view)).assertEqual(false);
    // });

  })
}