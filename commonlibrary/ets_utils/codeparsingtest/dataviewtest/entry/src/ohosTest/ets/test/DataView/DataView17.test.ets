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
import * as DataView17 from './DataView17';

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function DataView17Test() {
  describe('DataView17Test', () => {
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
     * @tc.name   DataView17Test001
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_0100
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(1);
      const dataView1 = new DataView(buffer1);
      dataView1.setInt8(0, 42);
      expect(dataView1.getInt8(0)).assertEqual(42);
    });

    /**
     * @tc.name   DataView17Test002
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_0200
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer2 = new ArrayBuffer(3);
      const dataView2 = new DataView(buffer2);
      dataView2.setInt8(2, -67);
      expect(dataView2.getInt8(2)).assertEqual(-67);
    });

    /**
     * @tc.name   DataView17Test003
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_0300
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer3 = new ArrayBuffer(2);
      const dataView3 = new DataView(buffer3);
      dataView3.setInt8(0, 127);
      dataView3.setInt8(1, -128);
      expect(dataView3.getInt8(0)).assertEqual(127);
      expect(dataView3.getInt8(1)).assertEqual(-128);
    });

    /**
     * @tc.name   DataView17Test004
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_0400
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer4 = new ArrayBuffer(1);
      const dataView4 = new DataView(buffer4);
      dataView4.setInt8(0, 0);
      expect(dataView4.getInt8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test005
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_0500
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer5 = new ArrayBuffer(10);
      const dataView5 = new DataView(buffer5);
      dataView5.setInt8(5, 33);
      expect(dataView5.getInt8(5)).assertEqual(33);
    });

    /**
     * @tc.name   DataView17Test006
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_0600
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer6 = new ArrayBuffer(1);
      const dataView6 = new DataView(buffer6);
      dataView6.setInt8(0, 128);
      expect(dataView6.getInt8(0)).assertEqual(-128);
    });

    /**
     * @tc.name   DataView17Test007
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_0700
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer7 = new ArrayBuffer(1);
      const dataView7 = new DataView(buffer7);
      dataView7.setInt8(0, -129);
      expect(dataView7.getInt8(0)).assertEqual(127);
    });

    /**
     * @tc.name   DataView17Test008
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_0800
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer8 = new ArrayBuffer(2);
      const dataView8 = new DataView(buffer8);
      dataView8.setInt8(0, -1);
      expect(dataView8.getInt8(0)).assertEqual(-1);
    });

    /**
     * @tc.name   DataView17Test009
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_0900
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer9 = new ArrayBuffer(2);
      const dataView9 = new DataView(buffer9);
      dataView9.setInt8(0, 5);
      dataView9.setInt8(1, -5);
      expect(dataView9.getInt8(0)).assertEqual(5);
      expect(dataView9.getInt8(1)).assertEqual(-5);
    });

    /**
     * @tc.name   DataView17Test010
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_1000
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer10 = new ArrayBuffer(5);
      const dataView10 = new DataView(buffer10);
      dataView10.setInt8(4, 67);
      expect(dataView10.getInt8(4)).assertEqual(67);
    });

    /**
     * @tc.name   DataView17Test011
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_1100
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer11 = new ArrayBuffer(1);
      const dataView11 = new DataView(buffer11);
      dataView11.setInt8(0, 255);
      expect(dataView11.getInt8(0)).assertEqual(-1);
    });

    /**
     * @tc.name   DataView17Test012
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_1200
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer12 = new ArrayBuffer(1);
      const dataView12 = new DataView(buffer12);
      dataView12.setInt8(0, -256);
      expect(dataView12.getInt8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test013
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_1300
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer13 = new ArrayBuffer(2);
      const dataView13 = new DataView(buffer13);
      dataView13.setInt8(0, 127);
      dataView13.setInt8(1, 127);
      expect(dataView13.getInt8(0)).assertEqual(127);
      expect(dataView13.getInt8(1)).assertEqual(127);
    });

    /**
     * @tc.name   DataView17Test014
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_1400
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer14 = new ArrayBuffer(1);
      const dataView14 = new DataView(buffer14);
      dataView14.setInt8(0, -128);
      expect(dataView14.getInt8(0)).assertEqual(-128);
    });

    /**
     * @tc.name   DataView17Test015
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_1500
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer15 = new ArrayBuffer(5);
      const dataView15 = new DataView(buffer15);
      dataView15.setInt8(3, -33);
      expect(dataView15.getInt8(3)).assertEqual(-33);
    });

    /**
     * @tc.name   DataView17Test016
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_1600
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer16 = new ArrayBuffer(1);
      const dataView16 = new DataView(buffer16);
      dataView16.setInt8(0, 64);
      dataView16.setInt8(0, -64);
      expect(dataView16.getInt8(0)).assertEqual(-64);

    });

    /**
     * @tc.name   DataView17Test017
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_1700
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer17 = new ArrayBuffer(100);
      const dataView17 = new DataView(buffer17);
      dataView17.setInt8(99, 88);
      expect(dataView17.getInt8(99)).assertEqual(88);
    });

    /**
     * @tc.name   DataView17Test018
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_1800
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer18 = new ArrayBuffer(3);
      const dataView18 = new DataView(buffer18);
      dataView18.setInt8(1, 1);
      expect(dataView18.getInt8(1)).assertEqual(1);
    });

    /**
     * @tc.name   DataView17Test019
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_1900
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer19 = new ArrayBuffer(1);
      const dataView19 = new DataView(buffer19);
      dataView19.setInt8(0, -127);
      expect(dataView19.getInt8(0)).assertEqual(-127);
    });

    /**
     * @tc.name   DataView17Test020
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_2000
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer20 = new ArrayBuffer(4);
      const dataView20 = new DataView(buffer20);
      dataView20.setInt8(2, 126);
      expect(dataView20.getInt8(2)).assertEqual(126);
    });

    /**
     * @tc.name   DataView17Test021
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_2100
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer21 = new ArrayBuffer(1);
      const dataView21 = new DataView(buffer21);
      dataView21.setInt8(0, 300);
      expect(dataView21.getInt8(0)).assertEqual(44);
    });

    /**
     * @tc.name   DataView17Test022
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_2200
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer22 = new ArrayBuffer(1);
      const dataView22 = new DataView(buffer22);
      dataView22.setInt8(0, -300);
      expect(dataView22.getInt8(0)).assertEqual(-44);
    });

    /**
     * @tc.name   DataView17Test023
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_2300
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer23 = new ArrayBuffer(5);
      const dataView23 = new DataView(buffer23);
      dataView23.setInt8(2, 0);
      expect(dataView23.getInt8(0)).assertEqual(0);
      expect(dataView23.getInt8(2)).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test024
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_2400
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer24 = new ArrayBuffer(3);
      const dataView24 = new DataView(buffer24);
      dataView24.setInt8(1, 10);
      dataView24.setInt8(0, 20);
      expect(dataView24.getInt8(0)).assertEqual(20);
      expect(dataView24.getInt8(1)).assertEqual(10);
    });

    /**
     * @tc.name   DataView17Test025
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_2500
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer25 = new ArrayBuffer(1);
      const dataView25 = new DataView(buffer25);
      dataView25.setInt8(0, -0);
      expect(dataView25.getInt8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test026
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_2600
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer26 = new ArrayBuffer(1);
      const dataView26 = new DataView(buffer26);
      dataView26.setInt8(0, 127);
      dataView26.setInt8(0, -128);
      expect(dataView26.getInt8(0)).assertEqual(-128);
    });

    /**
     * @tc.name   DataView17Test027
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_2700
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer27 = new ArrayBuffer(3);
      const dataView27 = new DataView(buffer27);
      dataView27.setInt8(0, -10);
      dataView27.setInt8(1, 20);
      dataView27.setInt8(2, -30);
      expect(dataView27.getInt8(0)).assertEqual(-10);
      expect(dataView27.getInt8(1)).assertEqual(20);
      expect(dataView27.getInt8(2)).assertEqual(-30);
    });

    /**
     * @tc.name   DataView17Test028
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_2800
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer28 = new ArrayBuffer(1);
      const dataView28 = new DataView(buffer28);
      dataView28.setInt8(0, 256);
      expect(dataView28.getInt8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test029
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_2900
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer29 = new ArrayBuffer(5);
      const dataView29 = new DataView(buffer29);
      dataView29.setInt8(4, 99);
      expect(dataView29.getInt8(4)).assertEqual(99);
    });

    /**
     * @tc.name   DataView17Test030
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_3000
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer30 = new ArrayBuffer(2);
      const dataView30 = new DataView(buffer30);
      dataView30.setInt8(1, -128);
      expect(dataView30.getInt8(1)).assertEqual(-128);
    });

    /**
     * @tc.name   DataView17Test031
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_3100
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer31 = new ArrayBuffer(4);
      const dataView31 = new DataView(buffer31);
      dataView31.setInt8(0, 1);
      dataView31.setInt8(1, 2);
      dataView31.setInt8(2, 3);
      dataView31.setInt8(3, 4);
      expect(dataView31.getInt8(0)).assertEqual(1);
      expect(dataView31.getInt8(2)).assertEqual(3);
    });

    /**
     * @tc.name   DataView17Test032
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_3200
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer32 = new ArrayBuffer(1);
      const dataView32 = new DataView(buffer32);
      dataView32.setInt8(0, 129);
      expect(dataView32.getInt8(0)).assertEqual(-127);
    });

    /**
     * @tc.name   DataView17Test033
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_3300
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer33 = new ArrayBuffer(3);
      const dataView33 = new DataView(buffer33);
      dataView33.setInt8(1, -60);
      expect(dataView33.getInt8(1)).assertEqual(-60);
    });

    /**
     * @tc.name   DataView17Test034
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_3400
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer34 = new ArrayBuffer(1);
      const dataView34 = new DataView(buffer34);
      dataView34.setInt8(0, 3.9);
      expect(dataView34.getInt8(0)).assertEqual(3);
    });

    /**
     * @tc.name   DataView17Test035
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_3500
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test035()).assertEqual(42);
    });

    /**
     * @tc.name   DataView17Test036
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_3600
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test036()).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test037
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_3700
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer37 = new ArrayBuffer(1);
      const dataView37 = new DataView(buffer37);
      dataView37.setInt8(0, Infinity);
      expect(dataView37.getInt8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test038
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_3800
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer38 = new ArrayBuffer(1);
      const dataView38 = new DataView(buffer38);
      dataView38.setInt8(0, 513);
      expect(dataView38.getInt8(0)).assertEqual(1);

    });

    /**
     * @tc.name   DataView17Test039
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_3900
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer39 = new ArrayBuffer(1);
      const dataView39 = new DataView(buffer39);
      dataView39.setInt8(0, -513);
      expect(dataView39.getInt8(0)).assertEqual(-1);
    });

    /**
     * @tc.name   DataView17Test040
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_4000
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer40 = new ArrayBuffer(1000);
      const dataView40 = new DataView(buffer40);
      dataView40.setInt8(999, -100);
      expect(dataView40.getInt8(999)).assertEqual(-100);
    });

    /**
     * @tc.name   DataView17Test041
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_4100
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer41 = new ArrayBuffer(4);
      const dataView41 = new DataView(buffer41);
      dataView41.setInt8(0, 10);
      dataView41.setInt8(1, 20);
      dataView41.setInt8(2, 30);
      dataView41.setInt8(3, 40);
      expect(dataView41.getInt8(1)).assertEqual(20);
      expect(dataView41.getInt8(3)).assertEqual(40);
    });

    /**
     * @tc.name   DataView17Test042
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_4200
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer42 = new ArrayBuffer(3);
      const dataView42 = new DataView(buffer42);
      dataView42.setInt8(1, 55);
      expect(dataView42.getInt8(0)).assertEqual(0);
      expect(dataView42.getInt8(2)).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test043
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_4300
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer43 = new ArrayBuffer(1);
      const dataView43 = new DataView(buffer43);
      dataView43.setInt8(0, 60);
      dataView43.setInt8(0, 300);
      expect(dataView43.getInt8(0)).assertEqual(44);
    });

    /**
     * @tc.name   DataView17Test044
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_4400
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer44 = new ArrayBuffer(1);
      const dataView44 = new DataView(buffer44);
      dataView44.setInt8(0, 383);
      expect(dataView44.getInt8(0)).assertEqual(127);
    });

    /**
     * @tc.name   DataView17Test045
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_4500
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer45 = new ArrayBuffer(1);
      const dataView45 = new DataView(buffer45);
      dataView45.setInt8(0, -130);
      expect(dataView45.getInt8(0)).assertEqual(126);
    });

    /**
     * @tc.name   DataView17Test046
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_4600
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test046()).assertEqual(1);
    });

    /**
     * @tc.name   DataView17Test047
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_4700
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test047()).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test048
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_4800
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test048()).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test049
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_4900
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test049()).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test050
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_5000
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test050()).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test051
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_5100
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer51a = new ArrayBuffer(1);
      const buffer51b = new ArrayBuffer(1);
      const dataView51a = new DataView(buffer51a);
      const dataView51b = new DataView(buffer51b);
      dataView51a.setInt8(0, 77);
      dataView51b.setInt8(0, -77);
      expect(dataView51a.getInt8(0)).assertEqual(77);
      expect(dataView51b.getInt8(0)).assertEqual(-77);
    });

    /**
     * @tc.name   DataView17Test052
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_5200
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer52 = new ArrayBuffer(2);
      const dataView52a = new DataView(buffer52);
      const dataView52b = new DataView(buffer52);
      dataView52a.setInt8(0, 99);
      dataView52b.setInt8(1, -99);
      expect(dataView52a.getInt8(1)).assertEqual(-99);
      expect(dataView52b.getInt8(0)).assertEqual(99);
    });

    /**
     * @tc.name   DataView17Test053
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_5300
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer53 = new ArrayBuffer(1);
      const dataView53 = new DataView(buffer53);
      dataView53.setInt8(0, -10);
      dataView53.setInt8(0, -20);
      dataView53.setInt8(0, -30);
      expect(dataView53.getInt8(0)).assertEqual(-30);
    });

    /**
     * @tc.name   DataView17Test054
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_5400
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer54 = new ArrayBuffer(10);
      const dataView54 = new DataView(buffer54);
      dataView54.setInt8(2, 12);
      dataView54.setInt8(7, -12);
      expect(dataView54.getInt8(2)).assertEqual(12);
      expect(dataView54.getInt8(7)).assertEqual(-12);
    });

    /**
     * @tc.name   DataView17Test055
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_5500
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer55 = new ArrayBuffer(1);
      const dataView55 = new DataView(buffer55);
      dataView55.setInt8(0, 64);
      dataView55.setInt8(0, -64);
      dataView55.setInt8(0, 64);
      expect(dataView55.getInt8(0)).assertEqual(64);
    });

    /**
     * @tc.name   DataView17Test056
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_5600
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer56 = new ArrayBuffer(1);
      const dataView56 = new DataView(buffer56);
      dataView56.setInt8(0, 510);
      expect(dataView56.getInt8(0)).assertEqual(-2);
    });

    /**
     * @tc.name   DataView17Test057
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_5700
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer57 = new ArrayBuffer(1);
      const dataView57 = new DataView(buffer57);
      dataView57.setInt8(0, -255);
      expect(dataView57.getInt8(0)).assertEqual(1);
    });

    /**
     * @tc.name   DataView17Test058
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_5800
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer58 = new ArrayBuffer(1);
      const dataView58 = new DataView(buffer58);
      dataView58.setInt8(0, 0);
      dataView58.setInt8(0, 127);
      dataView58.setInt8(0, -128);
      expect(dataView58.getInt8(0)).assertEqual(-128);

    });

    /**
     * @tc.name   DataView17Test059
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_5900
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer59 = new ArrayBuffer(2);
      const dataView59 = new DataView(buffer59);
      dataView59.setInt8(0, 200);
      dataView59.setInt8(1, 50);
      expect(dataView59.getInt8(0)).assertEqual(-56);
      expect(dataView59.getInt8(1)).assertEqual(50);
    });

    /**
     * @tc.name   DataView17Test060
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_6000
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test060()).assertEqual(-128);
    });

    /**
     * @tc.name   DataView17Test061
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_6100
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test061()).assertEqual(127);
    });

    /**
     * @tc.name   DataView17Test062
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_6200
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer62 = new ArrayBuffer(1);
      const dataView62 = new DataView(buffer62);
      dataView62.setInt8(0, -3.7);
      expect(dataView62.getInt8(0)).assertEqual(-3);

    });
    /**
     * @tc.name   DataView17Test063
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_6300
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer63 = new ArrayBuffer(1);
      const dataView63 = new DataView(buffer63);
      dataView63.setInt8(0, 127.9);
      expect(dataView63.getInt8(0)).assertEqual(127);
    });


    /**
     * @tc.name   DataView17Test065
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_6500
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test065()).assertEqual(66);
    });

    /**
     * @tc.name   DataView17Test066
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_6600
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer66 = new ArrayBuffer(1);
      const dataView66 = new DataView(buffer66);
      dataView66.setInt8(0, 257);
      expect(dataView66.getInt8(0)).assertEqual(1);
    });

    /**
     * @tc.name   DataView17Test067
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_6700
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer67 = new ArrayBuffer(1);
      const dataView67 = new DataView(buffer67);
      dataView67.setInt8(0, -384);
      expect(dataView67.getInt8(0)).assertEqual(-128);
    });

    /**
     * @tc.name   DataView17Test068
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_6800
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer68 = new ArrayBuffer(10000);
      const dataView68 = new DataView(buffer68);
      dataView68.setInt8(5000, -88);
      expect(dataView68.getInt8(5000)).assertEqual(-88);
    });

    /**
     * @tc.name   DataView17Test069
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_6900
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test069()).assertEqual(99);
    });

    /**
     * @tc.name   DataView17Test070
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_7000
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer70 = new ArrayBuffer(1);
      const dataView70 = new DataView(buffer70);
      dataView70.setInt8(0, NaN);
      expect(dataView70.getInt8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test071
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_7100
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer71 = new ArrayBuffer(1);
      const dataView71 = new DataView(buffer71);
      dataView71.setInt8(0, 10);
      dataView71.setInt8(0, 20);
      dataView71.setInt8(0, 30);
      expect(dataView71.getInt8(0)).assertEqual(30);
    });

    /**
     * @tc.name   DataView17Test072
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_7200
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer72 = new ArrayBuffer(4);
      const dataView72 = new DataView(buffer72);
      dataView72.setInt8(3, -127);
      expect(dataView72.getInt8(3)).assertEqual(-127);
    });

    /**
     * @tc.name   DataView17Test073
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_7300
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer73 = new ArrayBuffer(1);
      const dataView73 = new DataView(buffer73);
      dataView73.setInt8(0, 127.0);
      expect(dataView73.getInt8(0)).assertEqual(127);
    });

    /**
     * @tc.name   DataView17Test074
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_7400
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer74 = new ArrayBuffer(1);
      const dataView74 = new DataView(buffer74);
      dataView74.setInt8(0, -128.5);
      expect(dataView74.getInt8(0)).assertEqual(-128);
    });

    /**
     * @tc.name   DataView17Test075
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_7500
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer75 = new ArrayBuffer(500);
      const dataView75 = new DataView(buffer75);
      dataView75.setInt8(0, 1);
      dataView75.setInt8(499, -1);
      expect(dataView75.getInt8(0)).assertEqual(1);
      expect(dataView75.getInt8(499)).assertEqual(-1);
    });

    /**
     * @tc.name   DataView17Test076
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_7600
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test076()).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test077
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_7700
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer77 = new ArrayBuffer(1);
      const dataView77 = new DataView(buffer77);
      dataView77.setInt8(0, 255.9);
      expect(dataView77.getInt8(0)).assertEqual(-1);
    });

    /**
     * @tc.name   DataView17Test078
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_7800
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer78 = new ArrayBuffer(2);
      const viewA78 = new DataView(buffer78);
      const viewB78 = new DataView(buffer78);
      viewA78.setInt8(0, 50);
      viewB78.setInt8(1, -50);
      expect(viewA78.getInt8(1)).assertEqual(-50);
      expect(viewB78.getInt8(0)).assertEqual(50);
    });

    /**
     * @tc.name   DataView17Test079
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_7900
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer79 = new ArrayBuffer(2);
      const dataView79 = new DataView(buffer79);
      dataView79.setInt8(0, 1);
      dataView79.setInt8(1, -1);
      expect(dataView79.getInt8(0)).assertEqual(1);
      expect(dataView79.getInt8(1)).assertEqual(-1);
    });

    /**
     * @tc.name   DataView17Test080
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_8000
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer80 = new ArrayBuffer(1);
      const dataView80 = new DataView(buffer80);
      dataView80.setInt8(0, 65536);
      expect(dataView80.getInt8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test081
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_8100
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer81 = new ArrayBuffer(1);
      const dataView81 = new DataView(buffer81);
      dataView81.setInt8(0, -65536);
      expect(dataView81.getInt8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test082
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_8200
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test082()).assertEqual(100);
    });

    /**
     * @tc.name   DataView17Test083
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_8300
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer83 = new ArrayBuffer(5);
      const dataView83 = new DataView(buffer83);
      dataView83.setInt8(2, 77);
      expect(dataView83.getInt8(2)).assertEqual(77);
    });

    /**
     * @tc.name   DataView17Test084
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_8400
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test084()).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test085
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_8500
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer85 = new ArrayBuffer(1);
      const dataView85 = new DataView(buffer85);
      dataView85.setInt8(0, 895);
      expect(dataView85.getInt8(0)).assertEqual(127);
    });

    /**
     * @tc.name   DataView17Test086
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_8600
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer86 = new ArrayBuffer(1);
      const dataView86 = new DataView(buffer86);
      dataView86.setInt8(0, -640);
      expect(dataView86.getInt8(0)).assertEqual(-128);
    });

    /**
     * @tc.name   DataView17Test087
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_8700
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test087()).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test088
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_8800
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer88 = new ArrayBuffer(1);
      const dataView88 = new DataView(buffer88);
      dataView88.setInt8(0, Infinity); // 0
      dataView88.setInt8(0, -1);
      expect(dataView88.getInt8(0)).assertEqual(-1);
    });

    /**
     * @tc.name   DataView17Test089
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_8900
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer89 = new ArrayBuffer(1);
      const dataView89 = new DataView(buffer89);
      dataView89.setInt8(0, 45);
      dataView89.setInt8(0, 45);
      expect(dataView89.getInt8(0)).assertEqual(45);
    });

    /**
     * @tc.name   DataView17Test090
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_9000
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer90a = new ArrayBuffer(2);
      const buffer90b = new ArrayBuffer(3);
      const viewA90 = new DataView(buffer90a);
      const viewB90 = new DataView(buffer90b);
      viewA90.setInt8(1, -30);
      viewB90.setInt8(2, 30);
      expect(viewA90.getInt8(1)).assertEqual(-30);
      expect(viewB90.getInt8(2)).assertEqual(30);
    });

    /**
     * @tc.name   DataView17Test091
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_9100
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test091()).assertEqual(-45);
    });

    /**
     * @tc.name   DataView17Test092
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_9200
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer92 = new ArrayBuffer(3);
      const dataView92 = new DataView(buffer92);
      dataView92.setInt8(1, 255);
      expect(dataView92.getInt8(1)).assertEqual(-1);
    });

    /**
     * @tc.name   DataView17Test093
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_9300
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test093()).assertEqual(127);
    });

    /**
     * @tc.name   DataView17Test094
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_9400
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer94 = new ArrayBuffer(1);
      const dataView94 = new DataView(buffer94);
      dataView94.setInt8(0, 1);
      dataView94.setInt8(0, -1);
      dataView94.setInt8(0, 127);
      dataView94.setInt8(0, -128);
      dataView94.setInt8(0, 50);
      expect(dataView94.getInt8(0)).assertEqual(50);
    });

    /**
     * @tc.name   DataView17Test095
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_9500
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer95 = new ArrayBuffer(3);
      const dataView95 = new DataView(buffer95);
      dataView95.setInt8(0, 10);
      dataView95.setInt8(1, -20);
      dataView95.setInt8(2, 30);
      expect(dataView95.getInt8(0)).assertEqual(10);
      expect(dataView95.getInt8(1)).assertEqual(-20);
      expect(dataView95.getInt8(2)).assertEqual(30);
    });

    /**
     * @tc.name   DataView17Test096
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_9600
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test096()).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test097
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_9700
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test097()).assertEqual(89);
    });

    /**
     * @tc.name   DataView17Test100
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_10000
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer100 = new ArrayBuffer(1);
      const dataView100 = new DataView(buffer100);
      dataView100.setInt8(0, 1e2);
      expect(dataView100.getInt8(0)).assertEqual(100);
    });

    /**
     * @tc.name   DataView17Test101
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_10100
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer101 = new ArrayBuffer(1);
      const dataView101 = new DataView(buffer101);
      dataView101.setInt8(0, -1e2);
      expect(dataView101.getInt8(0)).assertEqual(-100);
    });

    /**
     * @tc.name   DataView17Test102
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_10200
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test102()).assertEqual(42);
    });

    /**
     * @tc.name   DataView17Test103
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_10300
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test103()).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test104
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_10400
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer104 = new ArrayBuffer(2);
      const dataView104 = new DataView(buffer104);
      dataView104.setInt8(0, 127);
      dataView104.setInt8(1, -128);
      expect(dataView104.getInt8(0)).assertEqual(127);
      expect(dataView104.getInt8(1)).assertEqual(-128);
    });

    /**
     * @tc.name   DataView17Test105
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_10500
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer105 = new ArrayBuffer(1);
      const dataView105 = new DataView(buffer105);
      dataView105.setInt8(0, 1000);
      expect(dataView105.getInt8(0)).assertEqual(-24);
    });

    /**
     * @tc.name   DataView17Test106
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_10600
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer106 = new ArrayBuffer(1);
      const dataView106 = new DataView(buffer106);
      dataView106.setInt8(0, -1000);
      expect(dataView106.getInt8(0)).assertEqual(24);
    });

    /**
     * @tc.name   DataView17Test107
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_10700
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test107()).assertEqual(12);
    });

    /**
     * @tc.name   DataView17Test108
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_10800
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test108()).assertEqual(-13);
    });

    /**
     * @tc.name   DataView17Test109
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_10900
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer109 = new ArrayBuffer(1);
      const dataView109 = new DataView(buffer109);
      dataView109.setInt8(0, -128);
      dataView109.setInt8(0, 127);
      expect(dataView109.getInt8(0)).assertEqual(127);
    });

    /**
     * @tc.name   DataView17Test110
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_11000
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer110 = new ArrayBuffer(4);
      const dataView110 = new DataView(buffer110);
      dataView110.setInt8(1, 5);
      dataView110.setInt8(3, -5);
      expect(dataView110.getInt8(0)).assertEqual(0);
      expect(dataView110.getInt8(2)).assertEqual(0);
      expect(dataView110.getInt8(1)).assertEqual(5);
      expect(dataView110.getInt8(3)).assertEqual(-5);
    });

    /**
     * @tc.name   DataView17Test111
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_11100
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer111 = new ArrayBuffer(1);
      const dataView111 = new DataView(buffer111);
      dataView111.setInt8(0, Number.MAX_SAFE_INTEGER);
      expect(dataView111.getInt8(0)).assertEqual(-1);
    });

    /**
     * @tc.name   DataView17Test112
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_11200
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer112 = new ArrayBuffer(1);
      const dataView112 = new DataView(buffer112);
      dataView112.setInt8(0, Number.MIN_SAFE_INTEGER);
      expect(dataView112.getInt8(0)).assertEqual(1);
    });

    /**
     * @tc.name   DataView17Test113
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_11300
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test113()).assertEqual(127);
    });

    /**
     * @tc.name   DataView17Test114
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_11400
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test114()).assertEqual(-128);
    });

    /**
     * @tc.name   DataView17Test115
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_11500
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer115 = new ArrayBuffer(2);
      const dataView115 = new DataView(buffer115);
      dataView115.setInt8(0, 10);
      dataView115.setInt8(0, 20);
      dataView115.setInt8(1, 30);
      expect(dataView115.getInt8(0)).assertEqual(20);
      expect(dataView115.getInt8(1)).assertEqual(30);
    });

    /**
     * @tc.name   DataView17Test116
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_11600
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer116 = new ArrayBuffer(1);
      const dataView116 = new DataView(buffer116);
      dataView116.setInt8(0, 1280);
      expect(dataView116.getInt8(0)).assertEqual(0);

    });

    /**
     * @tc.name   DataView17Test117
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_11700
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer117 = new ArrayBuffer(1);
      const dataView117 = new DataView(buffer117);
      dataView117.setInt8(0, -1280);
      expect(dataView117.getInt8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test118
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_11800
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer118 = new ArrayBuffer(1);
      const dataView118 = new DataView(buffer118);
      dataView118.setInt8(0, 0.5);
      expect(dataView118.getInt8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test119
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_11900
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer119 = new ArrayBuffer(1);
      const dataView119 = new DataView(buffer119);
      dataView119.setInt8(0, -0.5);
      expect(dataView119.getInt8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test120
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_12000
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer120 = new ArrayBuffer(1000);
      const dataView120 = new DataView(buffer120);
      dataView120.setInt8(500, -50);
      expect(dataView120.getInt8(500)).assertEqual(-50);
    });

    /**
     * @tc.name   DataView17Test121
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_12100
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test121()).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test122
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_12200
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer122 = new ArrayBuffer(1);
      const dataView122 = new DataView(buffer122);
      dataView122.setInt8(0, 639);
      expect(dataView122.getInt8(0)).assertEqual(127);
    });

    /**
     * @tc.name   DataView17Test123
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_12300
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer123 = new ArrayBuffer(1);
      const dataView123 = new DataView(buffer123);
      dataView123.setInt8(0, -640);
      expect(dataView123.getInt8(0)).assertEqual(-128);
    });

    /**
     * @tc.name   DataView17Test124
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_12400
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer124 = new ArrayBuffer(5);
      const dataView124 = new DataView(buffer124);
      dataView124.setInt8(0, 1);
      dataView124.setInt8(1, 2);
      dataView124.setInt8(0, 3);
      dataView124.setInt8(2, 4);
      dataView124.setInt8(1, 5);
      expect(dataView124.getInt8(0)).assertEqual(3);
      expect(dataView124.getInt8(1)).assertEqual(5);
      expect(dataView124.getInt8(2)).assertEqual(4);
    });

    /**
     * @tc.name   DataView17Test125
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_12500
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer125 = new ArrayBuffer(1);
      const dataView125 = new DataView(buffer125);
      dataView125.setInt8(0, 300);
      dataView125.setInt8(0, -300);
      dataView125.setInt8(0, 513);
      expect(dataView125.getInt8(0)).assertEqual(1);
    });

    /**
     * @tc.name   DataView17Test126
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_12600
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test126()).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test127
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_12700
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test127()).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test128
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_12800
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test128()).assertEqual(127);
    });

    /**
     * @tc.name   DataView17Test129
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_12900
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test129()).assertEqual(127);
    });

    /**
     * @tc.name   DataView17Test130
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_13000
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test130()).assertEqual(127);
    });

    /**
     * @tc.name   DataView17Test131
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_13100
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer131 = new ArrayBuffer(1);
      const dataView131 = new DataView(buffer131);
      dataView131.setInt8(0, 1e-5);
      expect(dataView131.getInt8(0)).assertEqual(0);

    });

    /**
     * @tc.name   DataView17Test132
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_13200
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer132 = new ArrayBuffer(1);
      const dataView132 = new DataView(buffer132);
      dataView132.setInt8(0, -1e-5);
      expect(dataView132.getInt8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test133
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_13300
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test133()).assertEqual(42);
    });

    /**
     * @tc.name   DataView17Test134
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_13400
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test134()).assertEqual(67);
    });

    /**
     * @tc.name   DataView17Test135
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_13500
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test135()).assertEqual(-40);
    });

    /**
     * @tc.name   DataView17Test136
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_13600
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer136 = new ArrayBuffer(1);
      const dataView136 = new DataView(buffer136);
      dataView136.setInt8(0, 1048576);
      expect(dataView136.getInt8(0)).assertEqual(0);

    });

    /**
     * @tc.name   DataView17Test137
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_13700
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer137 = new ArrayBuffer(1);
      const dataView137 = new DataView(buffer137);
      dataView137.setInt8(0, -1048576);
      expect(dataView137.getInt8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test138
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_13800
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test138()).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test139
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_13900
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test139()).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test140
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_14000
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer140 = new ArrayBuffer(1);
      const dataView140 = new DataView(buffer140);
      dataView140.setInt8(0, (() => -5)());
      expect(dataView140.getInt8(0)).assertEqual(-5);
    });

    /**
     * @tc.name   DataView17Test141
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_14100
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer141 = new ArrayBuffer(2);
      const viewA141 = new DataView(buffer141);
      const viewB141 = new DataView(buffer141);
      viewA141.setInt8(1, 99);
      expect(viewB141.getInt8(1)).assertEqual(99);
    });

    /**
     * @tc.name   DataView17Test142
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_14200
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test142()).assertEqual(64);
    });

    /**
     * @tc.name   DataView17Test143
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_14300
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test143()).assertEqual(0);
    });

    /**
     * @tc.name   DataView17Test144
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_14400
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test144()).assertEqual(-1);
    });

    /**
     * @tc.name   DataView17Test145
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_14500
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test145()).assertEqual(-128);
    });

    /**
     * @tc.name   DataView17Test146
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_14600
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test146()).assertEqual(-99);
    });

    /**
     * @tc.name   DataView17Test147
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_14700
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(DataView17.DataView17Test147()).assertEqual(-50);
    });

    /**
     * @tc.name   DataView17Test148
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_14800
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer148 = new ArrayBuffer(1);
      const dataView148 = new DataView(buffer148);
      dataView148.setInt8(0, 895);
      expect(dataView148.getInt8(0)).assertEqual(127);
    });

    /**
     * @tc.name   DataView17Test149
     * @tc.number SUB_BUILTINS_DATAVIEW17_TEST_14900
     * @tc.desc   test DataView setInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView17Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer149 = new ArrayBuffer(1);
      const dataView149 = new DataView(buffer149);
      dataView149.setInt8(0, -896);
      expect(dataView149.getInt8(0)).assertEqual(-128);
    });

  })
}