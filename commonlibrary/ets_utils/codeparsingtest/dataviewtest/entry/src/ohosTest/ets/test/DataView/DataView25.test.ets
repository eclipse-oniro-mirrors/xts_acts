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

export default function DataView25Test() {
  describe('DataView25Test', () => {
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
     * @tc.name   DataView25Test001
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_0100
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(16);
      const view1 = new DataView(buffer1);
      expect(view1.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   DataView25Test002
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_0200
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer2 = new ArrayBuffer(20);
      const view2 = new DataView(buffer2, 5);
      expect(view2.byteOffset).assertEqual(5);
    });

    /**
     * @tc.name   DataView25Test003
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_0300
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer3 = new ArrayBuffer(30);
      const view3 = new DataView(buffer3, 10, 15);
      expect(view3.byteOffset).assertEqual(10);
    });

    /**
     * @tc.name   DataView25Test004
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_0400
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer4 = new ArrayBuffer(2);
      const view4 = new DataView(buffer4, 0);
      expect(view4.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   DataView25Test005
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_0500
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer5 = new ArrayBuffer(5);
      const view5 = new DataView(buffer5, 1);
      expect(view5.byteOffset).assertEqual(1);
    });

    /**
     * @tc.name   DataView25Test006
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_0600
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer6 = new ArrayBuffer(10);
      const view6 = new DataView(buffer6, 3, 6);
      expect(view6.byteOffset).assertEqual(3);
    });

    /**
     * @tc.name   DataView25Test007
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_0700
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer7 = new ArrayBuffer(100);
      const view7 = new DataView(buffer7, 50);
      expect(view7.byteOffset).assertEqual(50);
    });

    /**
     * @tc.name   DataView25Test008
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_0800
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer8 = new ArrayBuffer(7);
      const view8 = new DataView(buffer8, 6, 1);
      expect(view8.byteOffset).assertEqual(6);
    });

    /**
     * @tc.name   DataView25Test009
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_0900
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer9 = new ArrayBuffer(1);
      const view9 = new DataView(buffer9);
      expect(view9.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   DataView25Test010
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_1000
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer10 = new ArrayBuffer(1000);
      const view10 = new DataView(buffer10, 999, 1);
      expect(view10.byteOffset).assertEqual(999);
    });

    /**
     * @tc.name   DataView25Test011
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_1100
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer11 = new ArrayBuffer(50);
      const view11 = new DataView(buffer11, 25, 20);
      expect(view11.byteOffset).assertEqual(25);
    });

    /**
     * @tc.name   DataView25Test012
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_1200
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer12 = new ArrayBuffer(8);
      const view12 = new DataView(buffer12, 2);
      expect(view12.byteOffset).assertEqual(2);
    });

    /**
     * @tc.name   DataView25Test013
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_1300
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer13 = new ArrayBuffer(15);
      const view13 = new DataView(buffer13, 7, 8);
      expect(view13.byteOffset).assertEqual(7);
    });

    /**
     * @tc.name   DataView25Test014
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_1400
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer14 = new ArrayBuffer(3);
      const view14 = new DataView(buffer14, 0, 0);
      expect(view14.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   DataView25Test015
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_1500
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer15 = new ArrayBuffer(20);
      const view15 = new DataView(buffer15, 10, 10);
      expect(view15.byteOffset).assertEqual(10);
    });

    /**
     * @tc.name   DataView25Test016
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_1600
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer16 = new ArrayBuffer(4);
      const view16 = new DataView(buffer16, 1, 3);
      expect(view16.byteOffset).assertEqual(1);
    });

    /**
     * @tc.name   DataView25Test017
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_1700
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer17 = new ArrayBuffer(6);
      const view17 = new DataView(buffer17, 4, 2);
      expect(view17.byteOffset).assertEqual(4);
    });

    /**
     * @tc.name   DataView25Test018
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_1800
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer18 = new ArrayBuffer(9);
      const view18 = new DataView(buffer18, 5);
      expect(view18.byteOffset).assertEqual(5);
    });

    /**
     * @tc.name   DataView25Test019
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_1900
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer19 = new ArrayBuffer(12);
      const view19 = new DataView(buffer19, 8, 3);
      expect(view19.byteOffset).assertEqual(8);
    });

    /**
     * @tc.name   DataView25Test020
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_2000
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer20 = new ArrayBuffer(10000);
      const view20 = new DataView(buffer20, 5000);
      expect(view20.byteOffset).assertEqual(5000);
    });

    /**
     * @tc.name   DataView25Test021
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_2100
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer21 = new ArrayBuffer(5);
      const view21 = new DataView(buffer21, 0, 5);
      expect(view21.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   DataView25Test022
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_2200
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer22 = new ArrayBuffer(7);
      const view22 = new DataView(buffer22, 2, 4);
      expect(view22.byteOffset).assertEqual(2);
    });

    /**
     * @tc.name   DataView25Test023
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_2300
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer23 = new ArrayBuffer(30);
      const view23 = new DataView(buffer23, 15, 15);
      expect(view23.byteOffset).assertEqual(15);
    });

    /**
     * @tc.name   DataView25Test024
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_2400
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer24 = new ArrayBuffer(1);
      const view24 = new DataView(buffer24, 0, 1);
      expect(view24.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   DataView25Test025
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_2500
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer25 = new ArrayBuffer(8);
      const view25 = new DataView(buffer25, 6);
      expect(view25.byteOffset).assertEqual(6);
    });

    /**
     * @tc.name   DataView25Test026
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_2600
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer26 = new ArrayBuffer(16);
      const view26 = new DataView(buffer26, 12, 4);
      expect(view26.byteOffset).assertEqual(12);
    });

    /**
     * @tc.name   DataView25Test027
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_2700
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer27 = new ArrayBuffer(25);
      const view27 = new DataView(buffer27, 10);
      expect(view27.byteOffset).assertEqual(10);
    });

    /**
     * @tc.name   DataView25Test028
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_2800
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer28 = new ArrayBuffer(40);
      const view28 = new DataView(buffer28, 22, 18);
      expect(view28.byteOffset).assertEqual(22);
    });

    /**
     * @tc.name   DataView25Test029
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_2900
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer29 = new ArrayBuffer(10);
      const view29 = new DataView(buffer29, 9, 1);
      expect(view29.byteOffset).assertEqual(9);
    });

    /**
     * @tc.name   DataView25Test030
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_3000
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer30 = new ArrayBuffer(500);
      const view30 = new DataView(buffer30, 200, 300);
      expect(view30.byteOffset).assertEqual(200);
    });

    /**
     * @tc.name   DataView25Test031
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_3100
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer31 = new ArrayBuffer(6);
      const view31 = new DataView(buffer31, 0, 3);
      expect(view31.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   DataView25Test032
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_3200
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer32 = new ArrayBuffer(14);
      const view32 = new DataView(buffer32, 3, 11);
      expect(view32.byteOffset).assertEqual(3);
    });

    /**
     * @tc.name   DataView25Test033
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_3300
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer33 = new ArrayBuffer(8);
      const view33 = new DataView(buffer33, 8, 0);
      expect(view33.byteOffset).assertEqual(8);
    });

    /**
     * @tc.name   DataView25Test034
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_3400
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer34 = new ArrayBuffer(13);
      const view34 = new DataView(buffer34, 4);
      expect(view34.byteOffset).assertEqual(4);
    });

    /**
     * @tc.name   DataView25Test035
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_3500
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer35 = new ArrayBuffer(17);
      const view35 = new DataView(buffer35, 8, 9);
      expect(view35.byteOffset).assertEqual(8);
    });

    /**
     * @tc.name   DataView25Test036
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_3600
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer36 = new ArrayBuffer(32);
      const view36 = new DataView(buffer36, 10, 22);
      expect(view36.byteOffset).assertEqual(10);
    });

    /**
     * @tc.name   DataView25Test037
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_3700
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer37 = new ArrayBuffer(64);
      const view37 = new DataView(buffer37, 32);
      expect(view37.byteOffset).assertEqual(32);
    });

    /**
     * @tc.name   DataView25Test038
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_3800
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer38 = new ArrayBuffer(9);
      const view38 = new DataView(buffer38, 0, 9);
      expect(view38.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   DataView25Test039
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_3900
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer39 = new ArrayBuffer(21);
      const view39 = new DataView(buffer39, 7, 14);
      expect(view39.byteOffset).assertEqual(7);
    });

    /**
     * @tc.name   DataView25Test040
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_4000
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer40 = new ArrayBuffer(45);
      const view40 = new DataView(buffer40, 15);
      expect(view40.byteOffset).assertEqual(15);
    });

    /**
     * @tc.name   DataView25Test041
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_4100
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer41 = new ArrayBuffer(100000);
      const view41 = new DataView(buffer41, 12345);
      expect(view41.byteOffset).assertEqual(12345);
    });

    /**
     * @tc.name   DataView25Test042
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_4200
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer42 = new ArrayBuffer(5);
      const view42 = new DataView(buffer42, 3, 2);
      expect(view42.byteOffset).assertEqual(3);
    });

    /**
     * @tc.name   DataView25Test043
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_4300
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer43 = new ArrayBuffer(8);
      const view43 = new DataView(buffer43, 4, 4);
      expect(view43.byteOffset).assertEqual(4);
    });

    /**
     * @tc.name   DataView25Test044
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_4400
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer44 = new ArrayBuffer(12);
      const view44 = new DataView(buffer44, 9, 3);
      expect(view44.byteOffset).assertEqual(9);
    });

    /**
     * @tc.name   DataView25Test045
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_4500
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer45 = new ArrayBuffer(256);
      const view45 = new DataView(buffer45, 128);
      expect(view45.byteOffset).assertEqual(128);
    });

    /**
     * @tc.name   DataView25Test046
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_4600
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer46 = new ArrayBuffer(7);
      const view46 = new DataView(buffer46, 1, 5);
      expect(view46.byteOffset).assertEqual(1);
    });

    /**
     * @tc.name   DataView25Test047
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_4700
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer47 = new ArrayBuffer(19);
      const view47 = new DataView(buffer47, 10);
      expect(view47.byteOffset).assertEqual(10);
    });

    /**
     * @tc.name   DataView25Test048
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_4800
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer48 = new ArrayBuffer(30);
      const view48 = new DataView(buffer48, 20, 10);
      expect(view48.byteOffset).assertEqual(20);
    });

    /**
     * @tc.name   DataView25Test049
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_4900
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer49 = new ArrayBuffer(6);
      const view49 = new DataView(buffer49, 2, 4);
      expect(view49.byteOffset).assertEqual(2);
    });

    /**
     * @tc.name   DataView25Test050
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_5000
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer50 = new ArrayBuffer(1001);
      const view50 = new DataView(buffer50, 500, 501);
      expect(view50.byteOffset).assertEqual(500);
    });

    /**
     * @tc.name   DataView25Test051
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_5100
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer51 = new ArrayBuffer(4);
      const view51 = new DataView(buffer51, 0, 0);
      expect(view51.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   DataView25Test052
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_5200
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer52 = new ArrayBuffer(16);
      const view52 = new DataView(buffer52, 15, 1);
      expect(view52.byteOffset).assertEqual(15);

    });

    /**
     * @tc.name   DataView25Test053
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_5300
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer53 = new ArrayBuffer(22);
      const view53 = new DataView(buffer53, 6, 16);
      expect(view53.byteOffset).assertEqual(6);

    });

    /**
     * @tc.name   DataView25Test054
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_5400
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer54 = new ArrayBuffer(50);
      const view54 = new DataView(buffer54, 30, 20);
      expect(view54.byteOffset).assertEqual(30);

    });

    /**
     * @tc.name   DataView25Test055
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_5500
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer55 = new ArrayBuffer(99);
      const view55 = new DataView(buffer55, 33);
      expect(view55.byteOffset).assertEqual(33);
    });

    /**
     * @tc.name   DataView25Test056
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_5600
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer56 = new ArrayBuffer(88);
      const view56 = new DataView(buffer56, 44, 44);
      expect(view56.byteOffset).assertEqual(44);
    });

    /**
     * @tc.name   DataView25Test057
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_5700
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer57 = new ArrayBuffer(3);
      const view57 = new DataView(buffer57, 2, 1);
      expect(view57.byteOffset).assertEqual(2);
    });

    /**
     * @tc.name   DataView25Test058
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_5800
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer58 = new ArrayBuffer(64);
      const view58 = new DataView(buffer58, 0, 64);
      expect(view58.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   DataView25Test059
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_5900
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer59 = new ArrayBuffer(100);
      const view59 = new DataView(buffer59, 99, 1);
      expect(view59.byteOffset).assertEqual(99);
    });

    /**
     * @tc.name   DataView25Test060
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_6000
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer60 = new ArrayBuffer(14);
      const view60 = new DataView(buffer60, 5, 9);
      expect(view60.byteOffset).assertEqual(5);
    });

    /**
     * @tc.name   DataView25Test061
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_6100
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer61 = new ArrayBuffer(200);
      const view61 = new DataView(buffer61, 150, 50);
      expect(view61.byteOffset).assertEqual(150);
    });

    /**
     * @tc.name   DataView25Test062
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_6200
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer62 = new ArrayBuffer(77);
      const view62 = new DataView(buffer62, 22, 55);
      expect(view62.byteOffset).assertEqual(22);
    });
    /**
     * @tc.name   DataView25Test063
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_6300
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer63 = new ArrayBuffer(1);
      const view63 = new DataView(buffer63, 0, 0);
      expect(view63.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   DataView25Test064
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_6400
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer64 = new ArrayBuffer(50);
      const view64_1 = new DataView(buffer64, 10);
      const view64_2 = new DataView(buffer64, 30);
      expect(view64_1.byteOffset).assertEqual(10);
      expect(view64_2.byteOffset).assertEqual(30);
    });

    /**
     * @tc.name   DataView25Test065
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_6500
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer65 = new ArrayBuffer(12);
      const view65 = new DataView(buffer65, 1, 11);
      expect(view65.byteOffset).assertEqual(1);
    });

    /**
     * @tc.name   DataView25Test066
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_6600
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer66 = new ArrayBuffer(1000000);
      const view66 = new DataView(buffer66, 987654);
      expect(view66.byteOffset).assertEqual(987654);
    });

    /**
     * @tc.name   DataView25Test067
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_6700
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer67 = new ArrayBuffer(18);
      const view67 = new DataView(buffer67, 5, 13);
      expect(view67.byteOffset).assertEqual(5);
    });

    /**
     * @tc.name   DataView25Test068
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_6800
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer68 = new ArrayBuffer(23);
      const view68 = new DataView(buffer68, 7);
      expect(view68.byteOffset).assertEqual(7);
    });

    /**
     * @tc.name   DataView25Test069
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_6900
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer69 = new ArrayBuffer(30);
      const view69 = new DataView(buffer69, 0, 10);
      expect(view69.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   DataView25Test070
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_7000
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer70 = new ArrayBuffer(9);
      const view70 = new DataView(buffer70, 4, 5);
      expect(view70.byteOffset).assertEqual(4);
    });

    /**
     * @tc.name   DataView25Test071
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_7100
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer71 = new ArrayBuffer(17);
      const view71 = new DataView(buffer71, 0, 17);
      expect(view71.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   DataView25Test072
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_7200
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer72 = new ArrayBuffer(25);
      const view72 = new DataView(buffer72, 12, 13);
      expect(view72.byteOffset).assertEqual(12);
    });

    /**
     * @tc.name   DataView25Test073
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_7300
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer73 = new ArrayBuffer(40);
      const view73 = new DataView(buffer73, 39, 1);
      expect(view73.byteOffset).assertEqual(39);
    });

    /**
     * @tc.name   DataView25Test074
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_7400
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer74 = new ArrayBuffer(60);
      const view74 = new DataView(buffer74, 20, 20);
      expect(view74.byteOffset).assertEqual(20);
    });

    /**
     * @tc.name   DataView25Test075
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_7500
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer75 = new ArrayBuffer(3);
      const view75 = new DataView(buffer75, 1, 2);
      expect(view75.byteOffset).assertEqual(1);

    });

    /**
     * @tc.name   DataView25Test076
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_7600
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer76 = new ArrayBuffer(100000);
      const view76 = new DataView(buffer76, 1);
      expect(view76.byteOffset).assertEqual(1);
    });

    /**
     * @tc.name   DataView25Test077
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_7700
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer77 = new ArrayBuffer(14);
      const view77 = new DataView(buffer77, 8, 5);
      expect(view77.byteOffset).assertEqual(8);
    });

    /**
     * @tc.name   DataView25Test078
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_7800
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer78 = new ArrayBuffer(21);
      const view78 = new DataView(buffer78, 0, 0);
      expect(view78.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   DataView25Test079
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_7900
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer79 = new ArrayBuffer(33);
      const view79 = new DataView(buffer79, 11, 22);
      expect(view79.byteOffset).assertEqual(11);
    });

    /**
     * @tc.name   DataView25Test080
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_8000
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer80 = new ArrayBuffer(5000);
      const view80 = new DataView(buffer80, 4999, 1);
      expect(view80.byteOffset).assertEqual(4999);
    });

    /**
     * @tc.name   DataView25Test081
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_8100
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer81 = new ArrayBuffer(7);
      const view81 = new DataView(buffer81, 3, 4);
      expect(view81.byteOffset).assertEqual(3);
    });

    /**
     * @tc.name   DataView25Test082
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_8200
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer82 = new ArrayBuffer(19);
      const view82 = new DataView(buffer82, 6, 10);
      expect(view82.byteOffset).assertEqual(6);

    });

    /**
     * @tc.name   DataView25Test083
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_8300
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer83 = new ArrayBuffer(28);
      const view83 = new DataView(buffer83, 14);
      expect(view83.byteOffset).assertEqual(14);
    });

    /**
     * @tc.name   DataView25Test084
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_8400
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer84 = new ArrayBuffer(999);
      const view84 = new DataView(buffer84, 333);
      expect(view84.byteOffset).assertEqual(333);
    });

    /**
     * @tc.name   DataView25Test085
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_8500
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer85 = new ArrayBuffer(5);
      const view85 = new DataView(buffer85, 0, 3);
      expect(view85.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   DataView25Test086
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_8600
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer86 = new ArrayBuffer(16);
      const view86 = new DataView(buffer86, 10, 5);
      expect(view86.byteOffset).assertEqual(10);
    });

    /**
     * @tc.name   DataView25Test087
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_8700
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer87 = new ArrayBuffer(300);
      const view87 = new DataView(buffer87, 200, 100);
      expect(view87.byteOffset).assertEqual(200);
    });

    /**
     * @tc.name   DataView25Test088
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_8800
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer88 = new ArrayBuffer(8);
      const view88 = new DataView(buffer88, 2, 5);
      expect(view88.byteOffset).assertEqual(2);
    });

    /**
     * @tc.name   DataView25Test089
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_8900
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer89 = new ArrayBuffer(101);
      const view89 = new DataView(buffer89, 50, 51);
      expect(view89.byteOffset).assertEqual(50);
    });

    /**
     * @tc.name   DataView25Test090
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_9000
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer90 = new ArrayBuffer(4);
      const view90 = new DataView(buffer90, 2, 2);
      expect(view90.byteOffset).assertEqual(2);
    });

    /**
     * @tc.name   DataView25Test091
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_9100
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer91 = new ArrayBuffer(66);
      const view91 = new DataView(buffer91, 22, 44);
      expect(view91.byteOffset).assertEqual(22);
    });

    /**
     * @tc.name   DataView25Test092
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_9200
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer92 = new ArrayBuffer(10000000);
      const view92 = new DataView(buffer92, 5000000);
      expect(view92.byteOffset).assertEqual(5000000);
    });

    /**
     * @tc.name   DataView25Test093
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_9300
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer93 = new ArrayBuffer(13);
      const view93 = new DataView(buffer93, 12, 1);
      expect(view93.byteOffset).assertEqual(12);
    });

    /**
     * @tc.name   DataView25Test094
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_9400
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer94 = new ArrayBuffer(16);
      const view94 = new DataView(buffer94, 4, 12);
      expect(view94.byteOffset).assertEqual(4);
    });

    /**
     * @tc.name   DataView25Test095
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_9500
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer95 = new ArrayBuffer(11);
      const view95 = new DataView(buffer95, 3, 8);
      expect(view95.byteOffset).assertEqual(3);
    });

    /**
     * @tc.name   DataView25Test096
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_9600
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer96 = new ArrayBuffer(100000000);
      const view96 = new DataView(buffer96, 12345678);
      expect(view96.byteOffset).assertEqual(12345678);
    });

    /**
     * @tc.name   DataView25Test097
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_9700
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer97 = new ArrayBuffer(24);
      const view97 = new DataView(buffer97, 18, 6);
      expect(view97.byteOffset).assertEqual(18);
    });

    /**
     * @tc.name   DataView25Test098
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_9800
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer98 = new ArrayBuffer(5);
      const view98 = new DataView(buffer98, 0, 1);
      expect(view98.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   DataView25Test099
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_9900
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer99 = new ArrayBuffer(60);
      const view99_1 = new DataView(buffer99, 10);
      const view99_2 = new DataView(buffer99, 30);
      const view99_3 = new DataView(buffer99, 50);
      expect(view99_1.byteOffset).assertEqual(10);
      expect(view99_2.byteOffset).assertEqual(30);
      expect(view99_3.byteOffset).assertEqual(50);
    });

    /**
     * @tc.name   DataView25Test100
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_10000
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer100 = new ArrayBuffer(31);
      const view100 = new DataView(buffer100, 15, 16);
      expect(view100.byteOffset).assertEqual(15);
    });

    /**
     * @tc.name   DataView25Test101
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_10100
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer101 = new ArrayBuffer(64);
      const view101 = new DataView(buffer101, 0, 32);
      expect(view101.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   DataView25Test102
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_10200
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer102 = new ArrayBuffer(9);
      const view102 = new DataView(buffer102, 6, 3);
      expect(view102.byteOffset).assertEqual(6);
    });

    /**
     * @tc.name   DataView25Test103
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_10300
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer103 = new ArrayBuffer(1000000);
      const view103 = new DataView(buffer103, 999999, 1);
      expect(view103.byteOffset).assertEqual(999999);
    });

    /**
     * @tc.name   DataView25Test104
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_10400
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer104 = new ArrayBuffer(7);
      const view104 = new DataView(buffer104, 0, 0);
      expect(view104.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   DataView25Test105
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_10500
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer105 = new ArrayBuffer(28);
      const view105 = new DataView(buffer105, 7, 21);
      expect(view105.byteOffset).assertEqual(7);
    });

    /**
     * @tc.name   DataView25Test106
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_10600
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer106 = new ArrayBuffer(13);
      const view106 = new DataView(buffer106, 5);
      expect(view106.byteOffset).assertEqual(5);
    });

    /**
     * @tc.name   DataView25Test107
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_10700
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer107 = new ArrayBuffer(500);
      const view107 = new DataView(buffer107, 375, 125);
      expect(view107.byteOffset).assertEqual(375);

    });

    /**
     * @tc.name   DataView25Test108
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_10800
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer108 = new ArrayBuffer(4);
      const view108 = new DataView(buffer108, 1, 2);
      expect(view108.byteOffset).assertEqual(1);
    });

    /**
     * @tc.name   DataView25Test109
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_10900
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer109 = new ArrayBuffer(17);
      const view109 = new DataView(buffer109, 10, 7);
      expect(view109.byteOffset).assertEqual(10);
    });

    /**
     * @tc.name   DataView25Test110
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_11000
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer110 = new ArrayBuffer(1048576);
      const view110 = new DataView(buffer110, 524288);
      expect(view110.byteOffset).assertEqual(524288);
    });

    /**
     * @tc.name   DataView25Test111
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_11100
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer111 = new ArrayBuffer(6);
      const view111 = new DataView(buffer111, 3, 3);
      expect(view111.byteOffset).assertEqual(3);
    });

    /**
     * @tc.name   DataView25Test112
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_11200
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer112 = new ArrayBuffer(25);
      const view112 = new DataView(buffer112, 0, 25);
      expect(view112.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   DataView25Test113
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_11300
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer113 = new ArrayBuffer(33);
      const view113 = new DataView(buffer113, 22, 11);
      expect(view113.byteOffset).assertEqual(22);
    });

    /**
     * @tc.name   DataView25Test114
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_11400
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer114 = new ArrayBuffer(10);
      const view114 = new DataView(buffer114, 8, 2);
      expect(view114.byteOffset).assertEqual(8);
    });

    /**
     * @tc.name   DataView25Test115
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_11500
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer115 = new ArrayBuffer(1001);
      const view115 = new DataView(buffer115, 1, 1000);
      expect(view115.byteOffset).assertEqual(1);
    });

    /**
     * @tc.name   DataView25Test116
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_11600
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer116 = new ArrayBuffer(19);
      const view116 = new DataView(buffer116, 19, 0);
      expect(view116.byteOffset).assertEqual(19);

    });

    /**
     * @tc.name   DataView25Test117
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_11700
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer117 = new ArrayBuffer(8);
      const view117 = new DataView(buffer117, 5, 3);
      expect(view117.byteOffset).assertEqual(5);
    });

    /**
     * @tc.name   DataView25Test118
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_11800
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer118 = new ArrayBuffer(40);
      const view118 = new DataView(buffer118, 10, 20);
      expect(view118.byteOffset).assertEqual(10);
    });

    /**
     * @tc.name   DataView25Test119
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_11900
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer119 = new ArrayBuffer(123);
      const view119 = new DataView(buffer119, 45);
      expect(view119.byteOffset).assertEqual(45);
    });

    /**
     * @tc.name   DataView25Test120
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_12000
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer120 = new ArrayBuffer(50);
      const view120 = new DataView(buffer120, 0, 10);
      expect(view120.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   DataView25Test121
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_12100
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer121 = new ArrayBuffer(77);
      const view121 = new DataView(buffer121, 33, 44);
      expect(view121.byteOffset).assertEqual(33);
    });

    /**
     * @tc.name   DataView25Test122
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_12200
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer122 = new ArrayBuffer(2);
      const view122 = new DataView(buffer122, 1, 1);
      expect(view122.byteOffset).assertEqual(1);
    });

    /**
     * @tc.name   DataView25Test123
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_12300
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer123 = new ArrayBuffer(9999);
      const view123 = new DataView(buffer123, 1234, 8765);
      expect(view123.byteOffset).assertEqual(1234);
    });

    /**
     * @tc.name   DataView25Test124
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_12400
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer124 = new ArrayBuffer(15);
      const view124 = new DataView(buffer124, 6, 9);
      expect(view124.byteOffset).assertEqual(6);
    });

    /**
     * @tc.name   DataView25Test125
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_12500
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer125 = new ArrayBuffer(22);
      const view125 = new DataView(buffer125, 11, 11);
      expect(view125.byteOffset).assertEqual(11);
    });

    /**
     * @tc.name   DataView25Test126
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_12600
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer126 = new ArrayBuffer(262144);
      const view126 = new DataView(buffer126, 12345);
      expect(view126.byteOffset).assertEqual(12345);
    });

    /**
     * @tc.name   DataView25Test127
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_12700
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer127 = new ArrayBuffer(9);
      const view127 = new DataView(buffer127, 2, 7);
      expect(view127.byteOffset).assertEqual(2);
    });

    /**
     * @tc.name   DataView25Test128
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_12800
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer128 = new ArrayBuffer(5);
      const view128 = new DataView(buffer128, 4, 1);
      expect(view128.byteOffset).assertEqual(4);
    });

    /**
     * @tc.name   DataView25Test129
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_12900
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer129 = new ArrayBuffer(80);
      const view129_1 = new DataView(buffer129, 10);
      const view129_2 = new DataView(buffer129, 30);
      const view129_3 = new DataView(buffer129, 50);
      const view129_4 = new DataView(buffer129, 70);
      expect(view129_1.byteOffset).assertEqual(10);
      expect(view129_2.byteOffset).assertEqual(30);
      expect(view129_3.byteOffset).assertEqual(50);
      expect(view129_4.byteOffset).assertEqual(70);
    });

    /**
     * @tc.name   DataView25Test130
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_13000
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer130 = new ArrayBuffer(37);
      const view130 = new DataView(buffer130, 18, 19);
      expect(view130.byteOffset).assertEqual(18);
    });

    /**
     * @tc.name   DataView25Test131
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_13100
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer131 = new ArrayBuffer(128);
      const view131 = new DataView(buffer131, 64, 64);
      expect(view131.byteOffset).assertEqual(64);

    });

    /**
     * @tc.name   DataView25Test132
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_13200
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer132 = new ArrayBuffer(7);
      const view132 = new DataView(buffer132, 5, 2);
      expect(view132.byteOffset).assertEqual(5);
    });

    /**
     * @tc.name   DataView25Test133
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_13300
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer132 = new ArrayBuffer(7);
      const view132 = new DataView(buffer132, 5, 2);
      expect(view132.byteOffset).assertEqual(5);
    });

    /**
     * @tc.name   DataView25Test134
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_13400
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer134 = new ArrayBuffer(11);
      const view134 = new DataView(buffer134, 0, 0);
      expect(view134.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   DataView25Test135
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_13500
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer135 = new ArrayBuffer(30);
      const view135 = new DataView(buffer135, 6, 24);
      expect(view135.byteOffset).assertEqual(6);
    });

    /**
     * @tc.name   DataView25Test136
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_13600
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer136 = new ArrayBuffer(19);
      const view136 = new DataView(buffer136, 7);
      expect(view136.byteOffset).assertEqual(7);
    });

    /**
     * @tc.name   DataView25Test137
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_13700
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer137 = new ArrayBuffer(600);
      const view137 = new DataView(buffer137, 420, 180);
      expect(view137.byteOffset).assertEqual(420);
    });

    /**
     * @tc.name   DataView25Test138
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_13800
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer138 = new ArrayBuffer(6);
      const view138 = new DataView(buffer138, 2, 3);
      expect(view138.byteOffset).assertEqual(2);
    });

    /**
     * @tc.name   DataView25Test139
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_13900
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer139 = new ArrayBuffer(23);
      const view139 = new DataView(buffer139, 12, 11);
      expect(view139.byteOffset).assertEqual(12);
    });

    /**
     * @tc.name   DataView25Test140
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_14000
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer140 = new ArrayBuffer(16777216);
      const view140 = new DataView(buffer140, 1000000);
      expect(view140.byteOffset).assertEqual(1000000);
    });

    /**
     * @tc.name   DataView25Test141
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_14100
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer141 = new ArrayBuffer(8);
      const view141 = new DataView(buffer141, 4, 4);
      expect(view141.byteOffset).assertEqual(4);
    });

    /**
     * @tc.name   DataView25Test142
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_14200
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer142 = new ArrayBuffer(29);
      const view142 = new DataView(buffer142, 0, 29);
      expect(view142.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   DataView25Test143
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_14300
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer143 = new ArrayBuffer(44);
      const view143 = new DataView(buffer143, 33, 11);
      expect(view143.byteOffset).assertEqual(33);
    });

    /**
     * @tc.name   DataView25Test144
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_14400
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer144 = new ArrayBuffer(12);
      const view144 = new DataView(buffer144, 9, 3);
      expect(view144.byteOffset).assertEqual(9);
    });

    /**
     * @tc.name   DataView25Test145
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_14500
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer145 = new ArrayBuffer(1003);
      const view145 = new DataView(buffer145, 2, 1001);
      expect(view145.byteOffset).assertEqual(2);
    });

    /**
     * @tc.name   DataView25Test146
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_14600
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer146 = new ArrayBuffer(25);
      const view146 = new DataView(buffer146, 25, 0);
      expect(view146.byteOffset).assertEqual(25);
    });

    /**
     * @tc.name   DataView25Test147
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_14700
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer147 = new ArrayBuffer(9);
      const view147 = new DataView(buffer147, 6, 3);
      expect(view147.byteOffset).assertEqual(6);
    });

    /**
     * @tc.name   DataView25Test148
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_14800
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer148 = new ArrayBuffer(50);
      const view148 = new DataView(buffer148, 15, 20);
      expect(view148.byteOffset).assertEqual(15);
    });

    /**
     * @tc.name   DataView25Test149
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_14900
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer149 = new ArrayBuffer(150);
      const view149 = new DataView(buffer149, 50);
      expect(view149.byteOffset).assertEqual(50);
    });

    /**
     * @tc.name   DataView25Test150
     * @tc.number SUB_BUILTINS_DATAVIEW25_TEST_15000
     * @tc.desc   test DataView byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView25Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer150 = new ArrayBuffer(60);
      const view150 = new DataView(buffer150, 0, 12);
      expect(view150.byteOffset).assertEqual(0);
    });

  })
}