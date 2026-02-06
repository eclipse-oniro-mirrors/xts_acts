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

export default function DataView20Test() {
  describe('DataView20Test', () => {
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
     * @tc.name   DataView20Test001
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_0100
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(1);
      const dataView1 = new DataView(buffer1);
      dataView1.setUint8(0, 123);
      expect(dataView1.getUint8(0)).assertEqual(123);
    });

    /**
     * @tc.name   DataView20Test002
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_0200
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer2 = new ArrayBuffer(4);
      const dataView2 = new DataView(buffer2);
      dataView2.setUint8(2, 255);
      expect(dataView2.getUint8(2)).assertEqual(255);
    });

    /**
     * @tc.name   DataView20Test003
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_0300
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer3 = new ArrayBuffer(2);
      const dataView3 = new DataView(buffer3);
      dataView3.setUint8(1, 300);
      expect(dataView3.getUint8(1)).assertEqual(44);
    });

    /**
     * @tc.name   DataView20Test004
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_0400
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer4 = new ArrayBuffer(1);
      const dataView4 = new DataView(buffer4);
      dataView4.setUint8(0, 0);
      expect(dataView4.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView20Test005
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_0500
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer5 = new ArrayBuffer(3);
      const dataView5 = new DataView(buffer5);
      dataView5.setUint8(2, 255);
      expect(dataView5.getUint8(2)).assertEqual(255);
    });

    /**
     * @tc.name   DataView20Test006
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_0600
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer6 = new ArrayBuffer(1);
      const dataView6 = new DataView(buffer6);
      dataView6.setUint8(0, 256);
      expect(dataView6.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView20Test007
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_0700
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer7 = new ArrayBuffer(1);
      const dataView7 = new DataView(buffer7);
      dataView7.setUint8(0, 257);
      expect(dataView7.getUint8(0)).assertEqual(1);
    });

    /**
     * @tc.name   DataView20Test008
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_0800
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer8 = new ArrayBuffer(1);
      const dataView8 = new DataView(buffer8);
      dataView8.setUint8(0, -1);
      expect(dataView8.getUint8(0)).assertEqual(255);
    });

    /**
     * @tc.name   DataView20Test009
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_0900
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer9 = new ArrayBuffer(1);
      const dataView9 = new DataView(buffer9);
      dataView9.setUint8(0, -2);
      expect(dataView9.getUint8(0)).assertEqual(254);
    });

    /**
     * @tc.name   DataView20Test010
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_1000
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer10 = new ArrayBuffer(1);
      const dataView10 = new DataView(buffer10);
      dataView10.setUint8(0, -256);
      expect(dataView10.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView20Test011
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_1100
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer11 = new ArrayBuffer(1);
      const dataView11 = new DataView(buffer11);
      dataView11.setUint8(0, -257);
      expect(dataView11.getUint8(0)).assertEqual(255);
    });

    /**
     * @tc.name   DataView20Test012
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_1200
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer12 = new ArrayBuffer(1);
      const dataView12 = new DataView(buffer12);
      dataView12.setUint8(0, 3.9);
      expect(dataView12.getUint8(0)).assertEqual(3);
    });

    /**
     * @tc.name   DataView20Test013
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_1300
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer13 = new ArrayBuffer(1);
      const dataView13 = new DataView(buffer13);
      dataView13.setUint8(0, 255.9);
      expect(dataView13.getUint8(0)).assertEqual(255);
    });

    /**
     * @tc.name   DataView20Test014
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_1400
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer14 = new ArrayBuffer(1);
      const dataView14 = new DataView(buffer14);
      dataView14.setUint8(0, 256.1);
      expect(dataView14.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView20Test015
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_1500
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer15 = new ArrayBuffer(1);
      const dataView15 = new DataView(buffer15);
      dataView15.setUint8(0, 100);
      dataView15.setUint8(0, 200);
      expect(dataView15.getUint8(0)).assertEqual(200);
    });

    /**
     * @tc.name   DataView20Test016
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_1600
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer16 = new ArrayBuffer(2);
      const dataView16 = new DataView(buffer16);
      dataView16.setUint8(0, 10);
      dataView16.setUint8(1, 20);
      expect(dataView16.getUint8(0)).assertEqual(10);
      expect(dataView16.getUint8(1)).assertEqual(20);
    });

    /**
     * @tc.name   DataView20Test017
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_1700
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer17 = new ArrayBuffer(1);
      const dataView17 = new DataView(buffer17);
      dataView17.setUint8(0, 128);
      expect(dataView17.getUint8(0)).assertEqual(128);
    });

    /**
     * @tc.name   DataView20Test018
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_1800
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer18 = new ArrayBuffer(5);
      const dataView18 = new DataView(buffer18);
      dataView18.setUint8(3, 67);
      expect(dataView18.getUint8(3)).assertEqual(67);
    });

    /**
     * @tc.name   DataView20Test019
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_1900
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer19 = new ArrayBuffer(1);
      const dataView19 = new DataView(buffer19);
      dataView19.setUint8(0, 127);
      expect(dataView19.getUint8(0)).assertEqual(127);
    });

    /**
     * @tc.name   DataView20Test020
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_2000
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer20 = new ArrayBuffer(2);
      const dataView20 = new DataView(buffer20);
      dataView20.setUint8(1, 33);
      expect(dataView20.getUint8(1)).assertEqual(33);
    });

    /**
     * @tc.name   DataView20Test021
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_2100
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer21 = new ArrayBuffer(1);
      const dataView21 = new DataView(buffer21);
      dataView21.setUint8(0, 1000);
      expect(dataView21.getUint8(0)).assertEqual(232);
    });

    /**
     * @tc.name   DataView20Test022
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_2200
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer22 = new ArrayBuffer(1);
      const dataView22 = new DataView(buffer22);
      dataView22.setUint8(0, -1000);
      expect(dataView22.getUint8(0)).assertEqual(24);
    });

    /**
     * @tc.name   DataView20Test023
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_2300
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer23 = new ArrayBuffer(1);
      const dataView23 = new DataView(buffer23);
      dataView23.setUint8(0, -5.2);
      expect(dataView23.getUint8(0)).assertEqual(251);
    });

    /**
     * @tc.name   DataView20Test024
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_2400
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer24 = new ArrayBuffer(1);
      const dv24_1 = new DataView(buffer24);
      const dv24_2 = new DataView(buffer24);
      dv24_1.setUint8(0, 50);
      expect(dv24_2.getUint8(0)).assertEqual(50);
    });

    /**
     * @tc.name   DataView20Test028
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_2800
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer28 = new ArrayBuffer(1);
      const dataView28 = new DataView(buffer28);
      dataView28.setUint8(0, NaN);
      expect(dataView28.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView20Test029
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_2900
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer29 = new ArrayBuffer(1);
      const dataView29 = new DataView(buffer29);
      dataView29.setUint8(0, Infinity);
      expect(dataView29.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView20Test032
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_3200
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer32 = new ArrayBuffer(4);
      const dataView32 = new DataView(buffer32);
      dataView32.setUint8(0, 1);
      dataView32.setUint8(1, 2);
      dataView32.setUint8(2, 3);
      dataView32.setUint8(3, 4);
      expect(dataView32.getUint8(0)).assertEqual(1);
      expect(dataView32.getUint8(1)).assertEqual(2);
      expect(dataView32.getUint8(2)).assertEqual(3);
      expect(dataView32.getUint8(3)).assertEqual(4);

    });

    /**
     * @tc.name   DataView20Test036
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_3600
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer36 = new ArrayBuffer(10);
      const dataView36 = new DataView(buffer36);
      dataView36.setUint8(5, 123);
      expect(dataView36.getUint8(5)).assertEqual(123);
    });

    /**
     * @tc.name   DataView20Test040
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_4000
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer40 = new ArrayBuffer(1);
      const dataView40 = new DataView(buffer40);
      dataView40.setUint8(0, 255);
      dataView40.setUint8(0, 0);
      expect(dataView40.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView20Test043
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_4300
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer43 = new ArrayBuffer(6);
      const dataView43 = new DataView(buffer43);
      dataView43.setUint8(4, 64);
      expect(dataView43.getUint8(4)).assertEqual(64);
      expect(dataView43.getUint8(3)).assertEqual(0);
    });

    /**
     * @tc.name   DataView20Test044
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_4400
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer44 = new ArrayBuffer(1);
      const dataView44 = new DataView(buffer44);
      dataView44.setUint8(0, -0);
      expect(dataView44.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView20Test045
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_4500
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer45 = new ArrayBuffer(1);
      const dataView45 = new DataView(buffer45);
      dataView45.setUint8(0, 1.0);
      expect(dataView45.getUint8(0)).assertEqual(1);
    });

    /**
     * @tc.name   DataView20Test046
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_4600
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer46 = new ArrayBuffer(7);
      const dataView46 = new DataView(buffer46);
      dataView46.setUint8(6, 199);
      expect(dataView46.getUint8(6)).assertEqual(199);
    });

    /**
     * @tc.name   DataView20Test048
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_4800
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer48 = new ArrayBuffer(1);
      const dataView48 = new DataView(buffer48);
      dataView48.setUint8(0, 10);
      dataView48.setUint8(0, 20);
      dataView48.setUint8(0, 30);
      expect(dataView48.getUint8(0)).assertEqual(30);
    });

    /**
     * @tc.name   DataView20Test049
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_4900
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer49 = new ArrayBuffer(1);
      const dataView49 = new DataView(buffer49);
      dataView49.setUint8(0, -300);
      expect(dataView49.getUint8(0)).assertEqual(212);
    });

    /**
     * @tc.name   DataView20Test050
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_5000
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer50 = new ArrayBuffer(1);
      const dataView50 = new DataView(buffer50);
      dataView50.setUint8(0, 512);
      expect(dataView50.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView20Test051
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_5100
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer51 = new ArrayBuffer(2);
      const dataView51 = new DataView(buffer51);
      dataView51.setUint8(1, 55);
      dataView51.setUint8(0, 66);
      expect(dataView51.getUint8(0)).assertEqual(66);
      expect(dataView51.getUint8(1)).assertEqual(55);
    });

    /**
     * @tc.name   DataView20Test054
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_5400
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer54 = new ArrayBuffer(2);
      const dataView54 = new DataView(buffer54);
      dataView54.setUint8(1, 200);
      expect(dataView54.getUint8(0)).assertEqual(0);
      expect(dataView54.getUint8(1)).assertEqual(200);
    });

    /**
     * @tc.name   DataView20Test055
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_5500
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer55 = new ArrayBuffer(1);
      const dataView55 = new DataView(buffer55);
      dataView55.setUint8(0, -128);
      expect(dataView55.getUint8(0)).assertEqual(128);
    });

    /**
     * @tc.name   DataView20Test056
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_5600
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer56 = new ArrayBuffer(1);
      const dataView56 = new DataView(buffer56);
      dataView56.setUint8(0, 3000);
      expect(dataView56.getUint8(0)).assertEqual(184);
    });

    /**
     * @tc.name   DataView20Test057
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_5700
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer57 = new ArrayBuffer(1);
      const dataView57 = new DataView(buffer57);
      dataView57.setUint8(0, 77);
      const val57 = dataView57.getUint8(0);
      expect(val57).assertEqual(77);
    });

    /**
     * @tc.name   DataView20Test058
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_5800
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer58 = new ArrayBuffer(1);
      const dataView58 = new DataView(buffer58);
      dataView58.setUint8(0, -0.1);
      expect(dataView58.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView20Test059
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_5900
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer59 = new ArrayBuffer(5);
      const dataView59 = new DataView(buffer59);
      dataView59.setUint8(4, 111);
      expect(dataView59.getUint8(4)).assertEqual(111);
    });

    /**
     * @tc.name   DataView20Test060
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_6000
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer60 = new ArrayBuffer(1);
      const dataView60 = new DataView(buffer60);
      dataView60.setUint8(0, 255.0001);
      expect(dataView60.getUint8(0)).assertEqual(255);
    });

    /**
     * @tc.name   DataView20Test061
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_6100
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer61 = new ArrayBuffer(1);
      const dataView61 = new DataView(buffer61);
      dataView61.setUint8(0, -255.9);
      expect(dataView61.getUint8(0)).assertEqual(1);
    });

    /**
     * @tc.name   DataView20Test062
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_6200
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer62 = new ArrayBuffer(3);
      const dv62_1 = new DataView(buffer62, 0, 3);
      const dv62_2 = new DataView(buffer62, 1, 2);
      dv62_1.setUint8(1, 99);
      expect(dv62_2.getUint8(0)).assertEqual(99);
    });
    /**
     * @tc.name   DataView20Test063
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_6300
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer63 = new ArrayBuffer(10);
      const dataView63 = new DataView(buffer63, 2, 5);
      dataView63.setUint8(1, 88);
      expect(new DataView(buffer63).getUint8(3)).assertEqual(88);
    });

    /**
     * @tc.name   DataView20Test064
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_6400
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer64 = new ArrayBuffer(1);
      const dataView64 = new DataView(buffer64);
      dataView64.setUint8(0, Number.MAX_SAFE_INTEGER);
      expect(dataView64.getUint8(0)).assertEqual(255);
    });

    /**
     * @tc.name   DataView20Test065
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_6500
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer65 = new ArrayBuffer(1);
      const dataView65 = new DataView(buffer65);
      dataView65.setUint8(0, Number.MIN_SAFE_INTEGER);
      expect(dataView65.getUint8(0)).assertEqual(1);
    });

    /**
     * @tc.name   DataView20Test069
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_6900
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer69 = new ArrayBuffer(3);
      const dataView69 = new DataView(buffer69);
      dataView69.setUint8(0, 10);
      dataView69.setUint8(1, 20);
      dataView69.setUint8(2, 30);
      dataView69.setUint8(1, 25);
      expect(dataView69.getUint8(1)).assertEqual(25);
      expect(dataView69.getUint8(0)).assertEqual(10);
    });

    /**
     * @tc.name   DataView20Test070
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_7000
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer70 = new ArrayBuffer(10);
      const dataView70 = new DataView(buffer70, 5);
      dataView70.setUint8(0, 155);
      expect(new DataView(buffer70).getUint8(5)).assertEqual(155);
    });

    /**
     * @tc.name   DataView20Test071
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_7100
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer71 = new ArrayBuffer(1);
      const dataView71 = new DataView(buffer71);
      dataView71.setUint8(0, -3.9);
      expect(dataView71.getUint8(0)).assertEqual(253);
    });

    /**
     * @tc.name   DataView20Test072
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_7200
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer72 = new ArrayBuffer(100);
      const dataView72 = new DataView(buffer72);
      dataView72.setUint8(99, 255);
      expect(dataView72.getUint8(99)).assertEqual(255);
    });

    /**
     * @tc.name   DataView20Test074
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_7400
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer74 = new ArrayBuffer(20);
      const dataView74 = new DataView(buffer74, 10, 5);
      dataView74.setUint8(3, 77);
      expect(new DataView(buffer74).getUint8(13)).assertEqual(77);
    });

    /**
     * @tc.name   DataView20Test076
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_7600
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer76 = new ArrayBuffer(4);
      const dv76_1 = new DataView(buffer76);
      dv76_1.setUint8(2, 99);
      const dv76_2 = new DataView(buffer76, 2, 2);
      expect(dv76_2.getUint8(0)).assertEqual(99);
    });

    /**
     * @tc.name   DataView20Test077
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_7700
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer77 = new ArrayBuffer(1);
      const dataView77 = new DataView(buffer77);
      dataView77.setUint8(0, 1e3);
      expect(dataView77.getUint8(0)).assertEqual(232);
    });

    /**
     * @tc.name   DataView20Test078
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_7800
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer78 = new ArrayBuffer(5);
      const originalByteLength = buffer78.byteLength;
      const dataView78 = new DataView(buffer78);
      dataView78.setUint8(2, 123);
      expect(buffer78.byteLength).assertEqual(originalByteLength);
    });

    /**
     * @tc.name   DataView20Test079
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_7900
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer79 = new ArrayBuffer(1);
      const dataView79 = new DataView(buffer79);
      dataView79.setUint8(0, -1e3);
      expect(dataView79.getUint8(0)).assertEqual(24);
    });

    /**
     * @tc.name   DataView20Test080
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_8000
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer80 = new ArrayBuffer(10);
      const dataView80 = new DataView(buffer80, 0, 3);
      dataView80.setUint8(2, 188);
      expect(dataView80.getUint8(2)).assertEqual(188);
    });

    /**
     * @tc.name   DataView20Test084
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_8400
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer84 = new ArrayBuffer(3);
      const dataView84 = new DataView(buffer84);
      dataView84.setUint8(1, 66);
      const uint8Arr84 = new Uint8Array(buffer84);
      expect(uint8Arr84[1]).assertEqual(66);
    });

    /**
     * @tc.name   DataView20Test086
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_8600
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer86 = new ArrayBuffer(4);
      const dv86_1 = new DataView(buffer86, 0, 4);
      const dv86_2 = new DataView(buffer86, 2, 2);
      dv86_1.setUint8(2, 200);
      expect(dv86_2.getUint8(0)).assertEqual(200);
    });

    /**
     * @tc.name   DataView20Test087
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_8700
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer87 = new ArrayBuffer(1);
      const dataView87 = new DataView(buffer87);
      dataView87.setUint8(0, -1);
      expect(dataView87.getUint8(0)).assertEqual(255);

    });

    /**
     * @tc.name   DataView20Test089
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_8900
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer89 = new ArrayBuffer(1);
      const dataView89 = new DataView(buffer89);
      dataView89.setUint8(0, 50);
      dataView89.setUint8(0, 50);
      expect(dataView89.getUint8(0)).assertEqual(50);
    });

    /**
     * @tc.name   DataView20Test091
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_9100
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer91 = new ArrayBuffer(10);
      const dataView91 = new DataView(buffer91, 5);
      dataView91.setUint8(0, 123);
      expect(new DataView(buffer91).getUint8(5)).assertEqual(123);
    });

    /**
     * @tc.name   DataView20Test092
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_9200
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer92 = new ArrayBuffer(1);
      const dataView92 = new DataView(buffer92);
      dataView92.setUint8(0, 255.999);
      expect(dataView92.getUint8(0)).assertEqual(255);
    });

    /**
     * @tc.name   DataView20Test094
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_9400
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer94 = new ArrayBuffer(10);
      const dataView94 = new DataView(buffer94, 2);
      dataView94.setUint8(1, 45);
      expect(new DataView(buffer94).getUint8(3)).assertEqual(45);
    });

    /**
     * @tc.name   DataView20Test095
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_9500
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer95 = new ArrayBuffer(1);
      const dataView95 = new DataView(buffer95);
      dataView95.setUint8(0, Number.EPSILON);
      expect(dataView95.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView20Test096
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_9600
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer96 = new ArrayBuffer(5);
      const dataView96 = new DataView(buffer96, 3, 1);
      dataView96.setUint8(0, 177);
      expect(dataView96.getUint8(0)).assertEqual(177);
    });

    /**
     * @tc.name   DataView20Test097
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_9700
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer97 = new ArrayBuffer(1);
      const dataView97 = new DataView(buffer97);
      dataView97.setUint8(0, -Number.EPSILON);
      expect(dataView97.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView20Test098
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_9800
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer98 = new ArrayBuffer(2);
      const dv98_1 = new DataView(buffer98);
      const dv98_2 = new DataView(buffer98);
      dv98_1.setUint8(1, 99);
      expect(dv98_2.getUint8(1)).assertEqual(99);
    });

    /**
     * @tc.name   DataView20Test102
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_10200
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer102 = new ArrayBuffer(1000);
      const dataView102 = new DataView(buffer102);
      dataView102.setUint8(500, 123);
      expect(dataView102.getUint8(500)).assertEqual(123);
    });

    /**
     * @tc.name   DataView20Test104
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_10400
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer104 = new ArrayBuffer(10);
      const dataView104 = new DataView(buffer104, 3);
      dataView104.setUint8(2, 67);
      expect(new DataView(buffer104).getUint8(5)).assertEqual(67);
    });

    /**
     * @tc.name   DataView20Test105
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_10500
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer105 = new ArrayBuffer(1);
      const dataView105 = new DataView(buffer105);
      dataView105.setUint8(0, Math.PI);
      expect(dataView105.getUint8(0)).assertEqual(3);
    });

    /**
     * @tc.name   DataView20Test106
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_10600
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer106 = new ArrayBuffer(1);
      const dataView106 = new DataView(buffer106);
      dataView106.setUint8(0, 255);
      dataView106.setUint8(0, 0);
      expect(dataView106.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView20Test107
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_10700
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer107 = new ArrayBuffer(1);
      const dataView107 = new DataView(buffer107);
      dataView107.setUint8(0, Math.E);
      expect(dataView107.getUint8(0)).assertEqual(2);

    });

    /**
     * @tc.name   DataView20Test108
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_10800
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer108 = new ArrayBuffer(5);
      const dv108_1 = new DataView(buffer108);
      const dv108_2 = new DataView(buffer108, 2, 3);
      const dv108_3 = new DataView(buffer108, 0, 5);
      dv108_1.setUint8(2, 155);
      expect(dv108_2.getUint8(0)).assertEqual(155);
      expect(dv108_3.getUint8(2)).assertEqual(155);
    });

    /**
     * @tc.name   DataView20Test110
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_11000
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer110 = new ArrayBuffer(10);
      const dataView110 = new DataView(buffer110, 0, 5);
      dataView110.setUint8(4, 210);
      expect(dataView110.getUint8(4)).assertEqual(210);
    });

    /**
     * @tc.name   DataView20Test112
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_11200
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer112 = new ArrayBuffer(1);
      const dataView112 = new DataView(buffer112);
      dataView112.setUint8(0, 1);
      const uint8Arr112 = new Uint8Array(buffer112);
      expect(uint8Arr112[0]).assertEqual(1);
    });

    /**
     * @tc.name   DataView20Test114
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_11400
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer114 = new ArrayBuffer(10);
      const dataView114 = new DataView(buffer114, 2, 3); // 覆盖2-4
      dataView114.setUint8(2, 88); // 视图偏移2 → 缓冲区4
      expect(new DataView(buffer114).getUint8(4)).assertEqual(88);
    });

    /**
     * @tc.name   DataView20Test118
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_11800
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer118 = new ArrayBuffer(5);
      const dataView118 = new DataView(buffer118);
      dataView118.setUint8(0, 10);
      dataView118.setUint8(1, 20);
      dataView118.setUint8(2, 30);
      dataView118.setUint8(3, 40);
      dataView118.setUint8(4, 50);
      expect(dataView118.getUint8(0)).assertEqual(10);
      expect(dataView118.getUint8(1)).assertEqual(20);
      expect(dataView118.getUint8(2)).assertEqual(30);
      expect(dataView118.getUint8(3)).assertEqual(40);
      expect(dataView118.getUint8(4)).assertEqual(50);
    });

    /**
     * @tc.name   DataView20Test122
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_12200
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer122 = new ArrayBuffer(3);
      const dataView122 = new DataView(buffer122);
      dataView122.setUint8(2, 3);
      dataView122.setUint8(1, 2);
      dataView122.setUint8(0, 1);
      expect(dataView122.getUint8(0)).assertEqual(1);
      expect(dataView122.getUint8(1)).assertEqual(2);
      expect(dataView122.getUint8(2)).assertEqual(3);
    });

    /**
     * @tc.name   DataView20Test123
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_12300
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer123 = new ArrayBuffer(1);
      const dataView123 = new DataView(buffer123);
      dataView123.setUint8(0, -Infinity);
      expect(dataView123.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView20Test134
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_13400
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer134 = new ArrayBuffer(2);
      const dataView134 = new DataView(buffer134);
      dataView134.setUint8(0, 0x12);
      dataView134.setUint8(1, 0x34);
      const uint16Arr134 = new Uint16Array(buffer134);
      expect(uint16Arr134[0]).assertEqual(13330);
    });

    /**
     * @tc.name   DataView20Test135
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_13500
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer135 = new ArrayBuffer(1);
      const dataView135 = new DataView(buffer135);
      dataView135.setUint8(0, 128.5);
      expect(dataView135.getUint8(0)).assertEqual(128);
    });

    /**
     * @tc.name   DataView20Test136
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_13600
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer136 = new ArrayBuffer(1);
      const dataView136 = new DataView(buffer136);
      dataView136.setUint8(0, -128.5);
      expect(dataView136.getUint8(0)).assertEqual(128);
    });

    /**
     * @tc.name   DataView20Test137
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_13700
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer137 = new ArrayBuffer(10);
      const dataView137 = new DataView(buffer137, 4, 5);
      dataView137.setUint8(3, 99);
      expect(new DataView(buffer137).getUint8(7)).assertEqual(99);
    });

    /**
     * @tc.name   DataView20Test141
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_14100
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer141 = new ArrayBuffer(1);
      const dataView141 = new DataView(buffer141);
      dataView141.setUint8(0, (() => 50)());
      expect(dataView141.getUint8(0)).assertEqual(50);
    });

    /**
     * @tc.name   DataView20Test142
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_14200
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer142 = new ArrayBuffer(1);
      const dataView142 = new DataView(buffer142);
      dataView142.setUint8(0, (() => -30)());
      expect(dataView142.getUint8(0)).assertEqual(226);
    });

    /**
     * @tc.name   DataView20Test143
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_14300
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer143 = new ArrayBuffer(5);
      const dataView143 = new DataView(buffer143, 1, 3);
      dataView143.setUint8(1, 66);
      expect(new DataView(buffer143).getUint8(0)).assertEqual(0);
      expect(new DataView(buffer143).getUint8(4)).assertEqual(0);
    });

    /**
     * @tc.name   DataView20Test147
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_14700
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer147 = new ArrayBuffer(4);
      const dv147_1 = new DataView(buffer147, 0, 2);
      const dv147_2 = new DataView(buffer147, 2, 2);
      dv147_1.setUint8(1, 100);
      dv147_2.setUint8(0, 200);
      expect(dv147_1.getUint8(1)).assertEqual(100);
      expect(dv147_2.getUint8(0)).assertEqual(200);
    });

    /**
     * @tc.name   DataView20Test149
     * @tc.number SUB_BUILTINS_DATAVIEW20_TEST_14900
     * @tc.desc   test DataView setUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView20Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer149 = new ArrayBuffer(1);
      const dataView149 = new DataView(buffer149);
      dataView149.setUint8(0, 255);
      expect(dataView149.getUint8(0)).assertEqual(255);

    });

  })
}