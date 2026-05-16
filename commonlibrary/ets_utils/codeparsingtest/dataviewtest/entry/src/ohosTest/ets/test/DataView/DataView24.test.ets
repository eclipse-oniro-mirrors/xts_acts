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

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function DataView24Test() {
  describe('DataView24Test', () => {
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
     * @tc.name   DataView24Test001
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_0100
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(8);
      const dv1 = new DataView(buffer1);
      expect(dv1.byteLength).assertEqual(8);
    });

    /**
     * @tc.name   DataView24Test002
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_0200
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer2 = new ArrayBuffer(20);
      const dv2 = new DataView(buffer2, 5, 10);
      expect(dv2.byteLength).assertEqual(10);
    });

    /**
     * @tc.name   DataView24Test003
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_0300
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer3 = new ArrayBuffer(15);
      const dv3 = new DataView(buffer3, 3);
      expect(dv3.byteLength).assertEqual(12);
    });

    /**
     * @tc.name   DataView24Test004
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_0400
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer4 = new ArrayBuffer(1);
      const dv4 = new DataView(buffer4);
      expect(dv4.byteLength).assertEqual(1);
    });

    /**
     * @tc.name   DataView24Test005
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_0500
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer5 = new ArrayBuffer(1);
      const dv5 = new DataView(buffer5, 0, 1);
      expect(dv5.byteLength).assertEqual(1);
    });

    /**
     * @tc.name   DataView24Test006
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_0600
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer6 = new ArrayBuffer(1);
      const dv6 = new DataView(buffer6, 0, 0);
      expect(dv6.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   DataView24Test007
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_0700
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer7 = new ArrayBuffer(5);
      const dv7 = new DataView(buffer7, 2, 3);
      expect(dv7.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   DataView24Test008
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_0800
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer8 = new ArrayBuffer(10);
      const dv8 = new DataView(buffer8, 3);
      expect(dv8.byteLength).assertEqual(7);
    });

    /**
     * @tc.name   DataView24Test009
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_0900
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer9 = new ArrayBuffer(20);
      const dv9 = new DataView(buffer9, 10, 5);
      expect(dv9.byteLength).assertEqual(5);
    });

    /**
     * @tc.name   DataView24Test010
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_1000
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer10 = new ArrayBuffer(100);
      const dv10 = new DataView(buffer10, 0, 100);
      expect(dv10.byteLength).assertEqual(100);
    });

    /**
     * @tc.name   DataView24Test011
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_1100
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer11 = new ArrayBuffer(100);
      const dv11 = new DataView(buffer11, 50, 40);
      expect(dv11.byteLength).assertEqual(40);
    });

    /**
     * @tc.name   DataView24Test012
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_1200
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer12 = new ArrayBuffer(16);
      const dv12 = new DataView(buffer12, 8, 8);
      expect(dv12.byteLength).assertEqual(8);
    });

    /**
     * @tc.name   DataView24Test013
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_1300
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer13 = new ArrayBuffer(3);
      const dv13 = new DataView(buffer13, 1, 2);
      expect(dv13.byteLength).assertEqual(2);
    });

    /**
     * @tc.name   DataView24Test014
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_1400
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer14 = new ArrayBuffer(7);
      const dv14 = new DataView(buffer14, 5);
      expect(dv14.byteLength).assertEqual(2);
    });

    /**
     * @tc.name   DataView24Test015
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_1500
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer15 = new ArrayBuffer(0);
      const dv15 = new DataView(buffer15);
      expect(dv15.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   DataView24Test016
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_1600
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer16 = new ArrayBuffer(0);
      const dv16 = new DataView(buffer16, 0, 0);
      expect(dv16.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   DataView24Test017
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_1700
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer17 = new ArrayBuffer(50);
      const dv17 = new DataView(buffer17, 25, 25);
      expect(dv17.byteLength).assertEqual(25);
    });

    /**
     * @tc.name   DataView24Test018
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_1800
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer18 = new ArrayBuffer(12);
      const dv18 = new DataView(buffer18, 0, 6);
      expect(dv18.byteLength).assertEqual(6);
    });

    /**
     * @tc.name   DataView24Test019
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_1900
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer19 = new ArrayBuffer(9);
      const dv19 = new DataView(buffer19, 4, 0);
      expect(dv19.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   DataView24Test020
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_2000
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer20 = new ArrayBuffer(15);
      const dv20 = new DataView(buffer20, 15);
      expect(dv20.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   DataView24Test021
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_2100
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer21 = new ArrayBuffer(22);
      const dv21 = new DataView(buffer21, 7, 10);
      expect(dv21.byteLength).assertEqual(10);
    });

    /**
     * @tc.name   DataView24Test022
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_2200
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer22 = new ArrayBuffer(30);
      const dv22 = new DataView(buffer22, 10, 15);
      expect(dv22.byteLength).assertEqual(15);
    });

    /**
     * @tc.name   DataView24Test023
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_2300
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer23 = new ArrayBuffer(4);
      const dv23 = new DataView(buffer23, 1, 3);
      expect(dv23.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   DataView24Test024
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_2400
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer24 = new ArrayBuffer(6);
      const dv24 = new DataView(buffer24, 2);
      expect(dv24.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   DataView24Test025
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_2500
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer25 = new ArrayBuffer(1000);
      const dv25 = new DataView(buffer25, 500, 500);
      expect(dv25.byteLength).assertEqual(500);
    });

    /**
     * @tc.name   DataView24Test026
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_2600
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer26 = new ArrayBuffer(8);
      const dv26 = new DataView(buffer26, 3, 4);
      expect(dv26.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   DataView24Test027
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_2700
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer27 = new ArrayBuffer(11);
      const dv27 = new DataView(buffer27, 0, 0);
      expect(dv27.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   DataView24Test028
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_2800
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer28 = new ArrayBuffer(14);
      const dv28 = new DataView(buffer28, 10, 4);
      expect(dv28.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   DataView24Test029
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_2900
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer29 = new ArrayBuffer(5);
      const dv29 = new DataView(buffer29, 3);
      expect(dv29.byteLength).assertEqual(2);
    });

    /**
     * @tc.name   DataView24Test030
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_3000
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer30 = new ArrayBuffer(256);
      const dv30 = new DataView(buffer30, 128, 64);
      expect(dv30.byteLength).assertEqual(64);
    });

    /**
     * @tc.name   DataView24Test031
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_3100
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer31 = new ArrayBuffer(7);
      const dv31 = new DataView(buffer31, 0, 7);
      expect(dv31.byteLength).assertEqual(7);
    });

    /**
     * @tc.name   DataView24Test032
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_3200
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer32 = new ArrayBuffer(9);
      const dv32 = new DataView(buffer32, 6, 3);
      expect(dv32.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   DataView24Test033
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_3300
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer33 = new ArrayBuffer(10);
      const dv33 = new DataView(buffer33, 9);
      expect(dv33.byteLength).assertEqual(1);
    });

    /**
     * @tc.name   DataView24Test034
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_3400
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer34 = new ArrayBuffer(2);
      const dv34 = new DataView(buffer34, 1, 1);
      expect(dv34.byteLength).assertEqual(1);
    });

    /**
     * @tc.name   DataView24Test035
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_3500
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer35 = new ArrayBuffer(3);
      const dv35 = new DataView(buffer35, 0, 1);
      expect(dv35.byteLength).assertEqual(1);
    });

    /**
     * @tc.name   DataView24Test036
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_3600
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer36 = new ArrayBuffer(10000);
      const dv36 = new DataView(buffer36, 5000, 5000);
      expect(dv36.byteLength).assertEqual(5000);
    });

    /**
     * @tc.name   DataView24Test037
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_3700
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer37 = new ArrayBuffer(5);
      const dv37 = new DataView(buffer37, 0, 0);
      expect(dv37.byteLength).assertEqual(0);

    });

    /**
     * @tc.name   DataView24Test038
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_3800
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer38 = new ArrayBuffer(6);
      const dv38 = new DataView(buffer38, 4, 2);
      expect(dv38.byteLength).assertEqual(2);
    });

    /**
     * @tc.name   DataView24Test039
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_3900
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer39 = new ArrayBuffer(9);
      const dv39 = new DataView(buffer39, 2, 5);
      expect(dv39.byteLength).assertEqual(5);
    });

    /**
     * @tc.name   DataView24Test040
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_4000
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer40 = new ArrayBuffer(17);
      const dv40 = new DataView(buffer40, 10);
      expect(dv40.byteLength).assertEqual(7);
    });

    /**
     * @tc.name   DataView24Test041
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_4100
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer41 = new ArrayBuffer(4);
      const dv41 = new DataView(buffer41, 3, 1);
      expect(dv41.byteLength).assertEqual(1);
    });

    /**
     * @tc.name   DataView24Test042
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_4200
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer42 = new ArrayBuffer(200);
      const dv42 = new DataView(buffer42, 150, 40);
      expect(dv42.byteLength).assertEqual(40);
    });

    /**
     * @tc.name   DataView24Test043
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_4300
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer43 = new ArrayBuffer(7);
      const dv43 = new DataView(buffer43, 0);
      expect(dv43.byteLength).assertEqual(7);
    });

    /**
     * @tc.name   DataView24Test044
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_4400
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer44 = new ArrayBuffer(12);
      const dv44 = new DataView(buffer44, 5, 6);
      expect(dv44.byteLength).assertEqual(6);
    });

    /**
     * @tc.name   DataView24Test045
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_4500
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer45 = new ArrayBuffer(30);
      const dv45 = new DataView(buffer45, 29);
      expect(dv45.byteLength).assertEqual(1);
    });

    /**
     * @tc.name   DataView24Test046
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_4600
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer46 = new ArrayBuffer(8);
      const dv46 = new DataView(buffer46, 0, 4);
      expect(dv46.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   DataView24Test047
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_4700
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer47 = new ArrayBuffer(15);
      const dv47 = new DataView(buffer47, 7, 7);
      expect(dv47.byteLength).assertEqual(7);
    });

    /**
     * @tc.name   DataView24Test048
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_4800
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer48 = new ArrayBuffer(1024);
      const dv48 = new DataView(buffer48, 512, 256);
      expect(dv48.byteLength).assertEqual(256);
    });

    /**
     * @tc.name   DataView24Test049
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_4900
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer49 = new ArrayBuffer(5);
      const dv49 = new DataView(buffer49, 2, 0);
      expect(dv49.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   DataView24Test050
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_5000
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer50 = new ArrayBuffer(6);
      const dv50 = new DataView(buffer50, 1);
      expect(dv50.byteLength).assertEqual(5);
    });

    /**
     * @tc.name   DataView24Test051
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_5100
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer51 = new ArrayBuffer(11);
      const dv51 = new DataView(buffer51, 3, 8);
      expect(dv51.byteLength).assertEqual(8);
    });

    /**
     * @tc.name   DataView24Test052
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_5200
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer52 = new ArrayBuffer(40);
      const dv52 = new DataView(buffer52, 10, 25);
      expect(dv52.byteLength).assertEqual(25);
    });

    /**
     * @tc.name   DataView24Test053
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_5300
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer53 = new ArrayBuffer(9);
      const dv53 = new DataView(buffer53, 0, 9);
      expect(dv53.byteLength).assertEqual(9);
    });

    /**
     * @tc.name   DataView24Test054
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_5400
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer54 = new ArrayBuffer(16);
      const dv54 = new DataView(buffer54, 12, 4);
      expect(dv54.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   DataView24Test055
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_5500
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer55 = new ArrayBuffer(7);
      const dv55 = new DataView(buffer55, 4);
      expect(dv55.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   DataView24Test056
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_5600
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer56 = new ArrayBuffer(25);
      const dv56 = new DataView(buffer56, 5, 15);
      expect(dv56.byteLength).assertEqual(15);
    });

    /**
     * @tc.name   DataView24Test057
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_5700
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer57 = new ArrayBuffer(3);
      const dv57 = new DataView(buffer57, 0, 2);
      expect(dv57.byteLength).assertEqual(2);
    });

    /**
     * @tc.name   DataView24Test058
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_5800
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer58 = new ArrayBuffer(100);
      const dv58 = new DataView(buffer58, 99, 1);
      expect(dv58.byteLength).assertEqual(1);
    });

    /**
     * @tc.name   DataView24Test059
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_5900
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer59 = new ArrayBuffer(8);
      const dv59 = new DataView(buffer59, 2, 5);
      expect(dv59.byteLength).assertEqual(5);
    });

    /**
     * @tc.name   DataView24Test060
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_6000
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer60 = new ArrayBuffer(14);
      const dv60 = new DataView(buffer60, 6);
      expect(dv60.byteLength).assertEqual(8);
    });

    /**
     * @tc.name   DataView24Test061
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_6100
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer61 = new ArrayBuffer(500);
      const dv61 = new DataView(buffer61, 200, 200);
      expect(dv61.byteLength).assertEqual(200);
    });

    /**
     * @tc.name   DataView24Test062
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_6200
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer62 = new ArrayBuffer(6);
      const dv62 = new DataView(buffer62, 3, 3);
      expect(dv62.byteLength).assertEqual(3);
    });
    /**
     * @tc.name   DataView24Test063
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_6300
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer63 = new ArrayBuffer(10);
      const dv63 = new DataView(buffer63, 5, 0);
      expect(dv63.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   DataView24Test064
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_6400
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer64 = new ArrayBuffer(13);
      const dv64 = new DataView(buffer64, 4, 6);
      expect(dv64.byteLength).assertEqual(6);
    });

    /**
     * @tc.name   DataView24Test065
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_6500
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer65 = new ArrayBuffer(7);
      const dv65 = new DataView(buffer65, 2);
      expect(dv65.byteLength).assertEqual(5);
    });

    /**
     * @tc.name   DataView24Test066
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_6600
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer66 = new ArrayBuffer(17);
      const dv66 = new DataView(buffer66, 0, 9);
      expect(dv66.byteLength).assertEqual(9);
    });

    /**
     * @tc.name   DataView24Test067
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_6700
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer67 = new ArrayBuffer(5);
      const dv67 = new DataView(buffer67, 1, 3);
      expect(dv67.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   DataView24Test068
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_6800
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer68 = new ArrayBuffer(23);
      const dv68 = new DataView(buffer68, 10, 10);
      expect(dv68.byteLength).assertEqual(10);
    });

    /**
     * @tc.name   DataView24Test069
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_6900
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer69 = new ArrayBuffer(4);
      const dv69 = new DataView(buffer69, 2, 2);
      expect(dv69.byteLength).assertEqual(2);
    });

    /**
     * @tc.name   DataView24Test070
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_7000
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer70 = new ArrayBuffer(9);
      const dv70 = new DataView(buffer70, 3, 5);
      expect(dv70.byteLength).assertEqual(5);
    });

    /**
     * @tc.name   DataView24Test071
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_7100
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer71 = new ArrayBuffer(12);
      const dv71 = new DataView(buffer71, 8);
      expect(dv71.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   DataView24Test072
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_7200
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer72 = new ArrayBuffer(19);
      const dv72 = new DataView(buffer72, 5, 12);
      expect(dv72.byteLength).assertEqual(12);
    });

    /**
     * @tc.name   DataView24Test073
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_7300
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer73 = new ArrayBuffer(2);
      const dv73 = new DataView(buffer73, 0, 1);
      expect(dv73.byteLength).assertEqual(1);
    });

    /**
     * @tc.name   DataView24Test074
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_7400
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer74 = new ArrayBuffer(6);
      const dv74 = new DataView(buffer74, 4, 1);
      expect(dv74.byteLength).assertEqual(1);
    });

    /**
     * @tc.name   DataView24Test075
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_7500
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer75 = new ArrayBuffer(25);
      const dv75 = new DataView(buffer75, 15, 9);
      expect(dv75.byteLength).assertEqual(9);
    });

    /**
     * @tc.name   DataView24Test076
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_7600
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer76 = new ArrayBuffer(31);
      const dv76 = new DataView(buffer76, 10);
      expect(dv76.byteLength).assertEqual(21);
    });

    /**
     * @tc.name   DataView24Test077
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_7700
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer77 = new ArrayBuffer(8);
      const dv77 = new DataView(buffer77, 5, 3);
      expect(dv77.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   DataView24Test078
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_7800
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer78 = new ArrayBuffer(10);
      const dv78 = new DataView(buffer78, 1, 8);
      expect(dv78.byteLength).assertEqual(8);
    });

    /**
     * @tc.name   DataView24Test079
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_7900
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer79 = new ArrayBuffer(14);
      const dv79 = new DataView(buffer79, 6, 7);
      expect(dv79.byteLength).assertEqual(7);
    });

    /**
     * @tc.name   DataView24Test080
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_8000
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer80 = new ArrayBuffer(29);
      const dv80 = new DataView(buffer80, 20, 8);
      expect(dv80.byteLength).assertEqual(8);
    });

    /**
     * @tc.name   DataView24Test081
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_8100
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer81 = new ArrayBuffer(3);
      const dv81 = new DataView(buffer81, 0, 2);
      expect(dv81.byteLength).assertEqual(2);
    });

    /**
     * @tc.name   DataView24Test082
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_8200
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer82 = new ArrayBuffer(20);
      const dv82 = new DataView(buffer82, 12, 7);
      expect(dv82.byteLength).assertEqual(7);
    });

    /**
     * @tc.name   DataView24Test083
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_8300
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer83 = new ArrayBuffer(16);
      const dv83 = new DataView(buffer83, 10);
      expect(dv83.byteLength).assertEqual(6);
    });

    /**
     * @tc.name   DataView24Test084
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_8400
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer84 = new ArrayBuffer(7);
      const dv84 = new DataView(buffer84, 5, 1);
      expect(dv84.byteLength).assertEqual(1);
    });

    /**
     * @tc.name   DataView24Test085
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_8500
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer85 = new ArrayBuffer(22);
      const dv85 = new DataView(buffer85, 3, 18);
      expect(dv85.byteLength).assertEqual(18);

    });

    /**
     * @tc.name   DataView24Test086
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_8600
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer86 = new ArrayBuffer(9);
      const dv86 = new DataView(buffer86, 0, 4);
      expect(dv86.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   DataView24Test087
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_8700
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer87 = new ArrayBuffer(37);
      const dv87 = new DataView(buffer87, 15, 20);
      expect(dv87.byteLength).assertEqual(20);
    });

    /**
     * @tc.name   DataView24Test088
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_8800
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer88 = new ArrayBuffer(5);
      const dv88 = new DataView(buffer88);
      expect(dv88.byteLength).assertEqual(5);
    });

    /**
     * @tc.name   DataView24Test089
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_8900
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer89 = new ArrayBuffer(12);
      const dv89 = new DataView(buffer89, 9, 3);
      expect(dv89.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   DataView24Test090
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_9000
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer90 = new ArrayBuffer(26);
      const dv90 = new DataView(buffer90, 8, 15);
      expect(dv90.byteLength).assertEqual(15);
    });

    /**
     * @tc.name   DataView24Test091
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_9100
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer91 = new ArrayBuffer(4);
      const dv91 = new DataView(buffer91, 1);
      expect(dv91.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   DataView24Test092
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_9200
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer92 = new ArrayBuffer(11);
      const dv92 = new DataView(buffer92, 7, 3);
      expect(dv92.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   DataView24Test093
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_9300
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer93 = new ArrayBuffer(100000);
      const dv93 = new DataView(buffer93, 45000, 10000);
      expect(dv93.byteLength).assertEqual(10000);
    });

    /**
     * @tc.name   DataView24Test094
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_9400
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer94 = new ArrayBuffer(1);
      const dv94 = new DataView(buffer94, 0, 1);
      expect(dv94.byteLength).assertEqual(1);
    });

    /**
     * @tc.name   DataView24Test095
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_9500
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer95 = new ArrayBuffer(1);
      const dv95 = new DataView(buffer95, 0, 0);
      expect(dv95.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   DataView24Test096
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_9600
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer96 = new ArrayBuffer(18);
      const dv96 = new DataView(buffer96, 5, 10);
      expect(dv96.byteLength).assertEqual(10);
    });

    /**
     * @tc.name   DataView24Test097
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_9700
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer97 = new ArrayBuffer(27);
      const dv97 = new DataView(buffer97, 10);
      expect(dv97.byteLength).assertEqual(17);
    });

    /**
     * @tc.name   DataView24Test098
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_9800
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer98 = new ArrayBuffer(32);
      const dv98 = new DataView(buffer98, 16, 8);
      expect(dv98.byteLength).assertEqual(8);
    });

    /**
     * @tc.name   DataView24Test099
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_9900
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer99 = new ArrayBuffer(5);
      const dv99 = new DataView(buffer99, 2, 2);
      expect(dv99.byteLength).assertEqual(2);
    });

    /**
     * @tc.name   DataView24Test100
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_10000
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer100 = new ArrayBuffer(24);
      const dv100 = new DataView(buffer100, 12, 12);
      expect(dv100.byteLength).assertEqual(12);
    });

    /**
     * @tc.name   DataView24Test101
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_10100
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer101 = new ArrayBuffer(7);
      const dv101 = new DataView(buffer101, 3);
      expect(dv101.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   DataView24Test102
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_10200
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer102 = new ArrayBuffer(10);
      const dv102 = new DataView(buffer102, 0, 5);
      expect(dv102.byteLength).assertEqual(5);
    });

    /**
     * @tc.name   DataView24Test103
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_10300
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer103 = new ArrayBuffer(33);
      const dv103 = new DataView(buffer103, 20, 10);
      expect(dv103.byteLength).assertEqual(10);
    });

    /**
     * @tc.name   DataView24Test104
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_10400
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer104 = new ArrayBuffer(4);
      const dv104 = new DataView(buffer104, 1, 2);
      expect(dv104.byteLength).assertEqual(2);
    });

    /**
     * @tc.name   DataView24Test105
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_10500
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer105 = new ArrayBuffer(19);
      const dv105 = new DataView(buffer105);
      expect(dv105.byteLength).assertEqual(19);
    });

    /**
     * @tc.name   DataView24Test106
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_10600
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer106 = new ArrayBuffer(6);
      const dv106 = new DataView(buffer106, 3, 2);
      expect(dv106.byteLength).assertEqual(2);
    });

    /**
     * @tc.name   DataView24Test107
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_10700
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer107 = new ArrayBuffer(25);
      const dv107 = new DataView(buffer107, 5, 15);
      expect(dv107.byteLength).assertEqual(15);
    });

    /**
     * @tc.name   DataView24Test108
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_10800
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer108 = new ArrayBuffer(9);
      const dv108 = new DataView(buffer108, 6);
      expect(dv108.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   DataView24Test109
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_10900
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer109 = new ArrayBuffer(16);
      const dv109 = new DataView(buffer109, 4, 10);
      expect(dv109.byteLength).assertEqual(10);
    });

    /**
     * @tc.name   DataView24Test110
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_11000
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer110 = new ArrayBuffer(5);
      const dv110 = new DataView(buffer110, 0, 3);
      expect(dv110.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   DataView24Test111
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_11100
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer111 = new ArrayBuffer(22);
      const dv111 = new DataView(buffer111, 15, 5);
      expect(dv111.byteLength).assertEqual(5);
    });

    /**
     * @tc.name   DataView24Test112
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_11200
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer112 = new ArrayBuffer(8);
      const dv112 = new DataView(buffer112, 2);
      expect(dv112.byteLength).assertEqual(6);
    });

    /**
     * @tc.name   DataView24Test113
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_11300
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer113 = new ArrayBuffer(13);
      const dv113 = new DataView(buffer113, 7, 5);
      expect(dv113.byteLength).assertEqual(5);
    });

    /**
     * @tc.name   DataView24Test114
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_11400
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer114 = new ArrayBuffer(3);
      const dv114 = new DataView(buffer114, 1, 1);
      expect(dv114.byteLength).assertEqual(1);
    });

    /**
     * @tc.name   DataView24Test115
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_11500
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer115 = new ArrayBuffer(20);
      const dv115 = new DataView(buffer115, 0, 0);
      expect(dv115.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   DataView24Test116
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_11600
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer116 = new ArrayBuffer(31);
      const dv116 = new DataView(buffer116, 15, 15);
      expect(dv116.byteLength).assertEqual(15);
    });

    /**
     * @tc.name   DataView24Test117
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_11700
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer117 = new ArrayBuffer(12);
      const dv117 = new DataView(buffer117, 8);
      expect(dv117.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   DataView24Test118
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_11800
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer118 = new ArrayBuffer(7);
      const dv118 = new DataView(buffer118, 0, 4);
      expect(dv118.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   DataView24Test119
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_11900
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer119 = new ArrayBuffer(26);
      const dv119 = new DataView(buffer119, 10, 12);
      expect(dv119.byteLength).assertEqual(12);
    });

    /**
     * @tc.name   DataView24Test120
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_12000
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer120 = new ArrayBuffer(9);
      const dv120 = new DataView(buffer120, 2, 6);
      expect(dv120.byteLength).assertEqual(6);
    });

    /**
     * @tc.name   DataView24Test121
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_12100
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer121 = new ArrayBuffer(1000);
      const dv121 = new DataView(buffer121, 300, 400);
      expect(dv121.byteLength).assertEqual(400);
    });

    /**
     * @tc.name   DataView24Test122
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_12200
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer122 = new ArrayBuffer(5);
      const dv122 = new DataView(buffer122, 4, 1);
      expect(dv122.byteLength).assertEqual(1);
    });

    /**
     * @tc.name   DataView24Test123
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_12300
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer123 = new ArrayBuffer(14);
      const dv123 = new DataView(buffer123, 5);
      expect(dv123.byteLength).assertEqual(9);
    });

    /**
     * @tc.name   DataView24Test124
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_12400
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer124 = new ArrayBuffer(64);
      const dv124 = new DataView(buffer124, 16, 32);
      expect(dv124.byteLength).assertEqual(32);
    });

    /**
     * @tc.name   DataView24Test125
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_12500
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer125 = new ArrayBuffer(43);
      const dv125 = new DataView(buffer125, 10);
      expect(dv125.byteLength).assertEqual(33);
    });

    /**
     * @tc.name   DataView24Test126
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_12600
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer126 = new ArrayBuffer(15);
      const dv126 = new DataView(buffer126, 5, 8);
      expect(dv126.byteLength).assertEqual(8);
    });

    /**
     * @tc.name   DataView24Test127
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_12700
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer127 = new ArrayBuffer(2);
      const dv127 = new DataView(buffer127, 1);
      expect(dv127.byteLength).assertEqual(1);
    });

    /**
     * @tc.name   DataView24Test128
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_12800
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer128 = new ArrayBuffer(128);
      const dv128 = new DataView(buffer128, 64, 32);
      expect(dv128.byteLength).assertEqual(32);
    });

    /**
     * @tc.name   DataView24Test129
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_12900
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer129 = new ArrayBuffer(7);
      const dv129 = new DataView(buffer129, 0, 0);
      expect(dv129.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   DataView24Test130
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_13000
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer130 = new ArrayBuffer(30);
      const dv130 = new DataView(buffer130, 12, 15);
      expect(dv130.byteLength).assertEqual(15);
    });

    /**
     * @tc.name   DataView24Test131
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_13100
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer131 = new ArrayBuffer(11);
      const dv131 = new DataView(buffer131, 8, 2);
      expect(dv131.byteLength).assertEqual(2);
    });

    /**
     * @tc.name   DataView24Test132
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_13200
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer132 = new ArrayBuffer(4);
      const dv132 = new DataView(buffer132, 0, 4);
      expect(dv132.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   DataView24Test133
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_13300
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer133 = new ArrayBuffer(50);
      const dv133 = new DataView(buffer133, 25);
      expect(dv133.byteLength).assertEqual(25);
    });

    /**
     * @tc.name   DataView24Test134
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_13400
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer134 = new ArrayBuffer(19);
      const dv134 = new DataView(buffer134, 5, 10);
      expect(dv134.byteLength).assertEqual(10);
    });

    /**
     * @tc.name   DataView24Test135
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_13500
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer135 = new ArrayBuffer(9);
      const dv135 = new DataView(buffer135, 3, 5);
      expect(dv135.byteLength).assertEqual(5);
    });

    /**
     * @tc.name   DataView24Test136
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_13600
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer136 = new ArrayBuffer(21);
      const dv136 = new DataView(buffer136, 14);
      expect(dv136.byteLength).assertEqual(7);
    });

    /**
     * @tc.name   DataView24Test137
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_13700
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer137 = new ArrayBuffer(6);
      const dv137 = new DataView(buffer137, 2, 3);
      expect(dv137.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   DataView24Test138
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_13800
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer138 = new ArrayBuffer(1000000);
      const dv138 = new DataView(buffer138, 100000, 500000);
      expect(dv138.byteLength).assertEqual(500000);
    });

    /**
     * @tc.name   DataView24Test139
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_13900
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer139 = new ArrayBuffer(5);
      const dv139 = new DataView(buffer139, 1, 0);
      expect(dv139.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   DataView24Test140
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_14000
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer140 = new ArrayBuffer(28);
      const dv140 = new DataView(buffer140, 8, 18);
      expect(dv140.byteLength).assertEqual(18);
    });

    /**
     * @tc.name   DataView24Test141
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_14100
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer141 = new ArrayBuffer(17);
      const dv141 = new DataView(buffer141, 10);
      expect(dv141.byteLength).assertEqual(7);
    });

    /**
     * @tc.name   DataView24Test142
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_14200
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer142 = new ArrayBuffer(8);
      const dv142 = new DataView(buffer142, 4, 4);
      expect(dv142.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   DataView24Test143
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_14300
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer143 = new ArrayBuffer(35);
      const dv143 = new DataView(buffer143, 15, 15);
      expect(dv143.byteLength).assertEqual(15);
    });

    /**
     * @tc.name   DataView24Test144
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_14400
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer144 = new ArrayBuffer(12);
      const dv144 = new DataView(buffer144, 9);
      expect(dv144.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   DataView24Test145
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_14500
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer145 = new ArrayBuffer(7);
      const dv145 = new DataView(buffer145, 2, 4);
      expect(dv145.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   DataView24Test146
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_14600
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer146 = new ArrayBuffer(24);
      const dv146 = new DataView(buffer146, 0, 12);
      expect(dv146.byteLength).assertEqual(12);
    });

    /**
     * @tc.name   DataView24Test147
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_14700
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer147 = new ArrayBuffer(47);
      const dv147 = new DataView(buffer147, 20, 25);
      expect(dv147.byteLength).assertEqual(25);
    });

    /**
     * @tc.name   DataView24Test148
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_14800
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer148 = new ArrayBuffer(3);
      const dv148 = new DataView(buffer148);
      expect(dv148.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   DataView24Test149
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_14900
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer149 = new ArrayBuffer(16);
      const dv149 = new DataView(buffer149, 10, 5);
      expect(dv149.byteLength).assertEqual(5);
    });

    /**
     * @tc.name   DataView24Test150
     * @tc.number SUB_BUILTINS_DATAVIEW24_TEST_15000
     * @tc.desc   test DataView byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView24Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer150 = new ArrayBuffer(50);
      const dv150 = new DataView(buffer150, 30);
      expect(dv150.byteLength).assertEqual(20);
    });

  })
}