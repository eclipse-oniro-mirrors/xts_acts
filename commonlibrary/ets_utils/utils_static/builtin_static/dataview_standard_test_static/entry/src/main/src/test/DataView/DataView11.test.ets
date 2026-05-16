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

export default function DataView11Test() {
  describe('DataView11Test', () => {
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
     * @tc.name   DataView11Test001
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_0100
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new Uint8Array([0x00, 0x01]).buffer;
      const dataView1 = new DataView(buffer1);
      expect(dataView1.getUint16(0)).assertEqual(1);
    });

    /**
     * @tc.name   DataView11Test002
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_0200
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer2 = new Uint8Array([0x00, 0x01]).buffer;
      const dataView2 = new DataView(buffer2);
      expect(dataView2.getUint16(0, true)).assertEqual(256);
    });

    /**
     * @tc.name   DataView11Test003
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_0300
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer3 = new Uint8Array([0x11, 0x22, 0x33, 0x44]).buffer;
      const dataView3 = new DataView(buffer3);
      expect(dataView3.getUint16(1)).assertEqual(8755);
    });

    /**
     * @tc.name   DataView11Test004
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_0400
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer4 = new Uint8Array([0xFF, 0x00]).buffer;
      const dataView4 = new DataView(buffer4);
      expect(dataView4.getUint16(0)).assertEqual(65280);
    });

    /**
     * @tc.name   DataView11Test005
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_0500
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer5 = new Uint8Array([0x00, 0xFF]).buffer;
      const dataView5 = new DataView(buffer5);
      expect(dataView5.getUint16(0, true)).assertEqual(65280);
    });

    /**
     * @tc.name   DataView11Test006
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_0600
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer6 = new Uint8Array([0x00, 0x00, 0xAB, 0xCD]).buffer;
      const dataView6 = new DataView(buffer6);
      expect(dataView6.getUint16(2)).assertEqual(43981);
    });

    /**
     * @tc.name   DataView11Test007
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_0700
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer7 = new Uint8Array([0x00, 0x00, 0xCD, 0xAB]).buffer;
      const dataView7 = new DataView(buffer7);
      expect(dataView7.getUint16(2, true)).assertEqual(43981);
    });

    /**
     * @tc.name   DataView11Test008
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_0800
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer8 = new Uint8Array([0xFF, 0xFF]).buffer;
      const dataView8 = new DataView(buffer8);
      expect(dataView8.getUint16(0)).assertEqual(65535);
    });

    /**
     * @tc.name   DataView11Test009
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_0900
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer9 = new Uint8Array([0xFF, 0xFF]).buffer;
      const dataView9 = new DataView(buffer9);
      expect(dataView9.getUint16(0, true)).assertEqual(65535);
    });

    /**
     * @tc.name   DataView11Test010
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_1000
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer10 = new Uint8Array([0x11, 0x33, 0x44, 0x55]).buffer;
      const dataView10 = new DataView(buffer10);
      expect(dataView10.getUint16(1)).assertEqual(13124);
    });

    /**
     * @tc.name   DataView11Test011
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_1100
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer11 = new Uint8Array([0x11, 0x44, 0x33, 0x55]).buffer;
      const dataView11 = new DataView(buffer11);
      expect(dataView11.getUint16(1, true)).assertEqual(13124);
    });

    /**
     * @tc.name   DataView11Test012
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_1200
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer12 = new Uint8Array([0x00, 0xFF]).buffer;
      const dataView12 = new DataView(buffer12);
      expect(dataView12.getUint16(0)).assertEqual(255);
    });

    /**
     * @tc.name   DataView11Test013
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_1300
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer13 = new Uint8Array([0xFF, 0x00]).buffer;
      const dataView13 = new DataView(buffer13);
      expect(dataView13.getUint16(0, true)).assertEqual(255);
    });

    /**
     * @tc.name   DataView11Test014
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_1400
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer14 = new Uint8Array([0x11, 0x11]).buffer;
      const dataView14 = new DataView(buffer14);
      expect(dataView14.getUint16(0)).assertEqual(4369);
    });

    /**
     * @tc.name   DataView11Test015
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_1500
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer15 = new Uint8Array([0x11, 0x11]).buffer;
      const dataView15 = new DataView(buffer15);
      expect(dataView15.getUint16(0, true)).assertEqual(4369);
    });

    /**
     * @tc.name   DataView11Test016
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_1600
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer16 = new Uint8Array([0x00, 0x00, 0x00, 0x55, 0xAA]).buffer;
      const dataView16 = new DataView(buffer16);
      expect(dataView16.getUint16(3)).assertEqual(21930);
    });

    /**
     * @tc.name   DataView11Test017
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_1700
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer17 = new Uint8Array([0x00, 0x00, 0x00, 0xAA, 0x55]).buffer;
      const dataView17 = new DataView(buffer17);
      expect(dataView17.getUint16(3, true)).assertEqual(21930);
    });

    /**
     * @tc.name   DataView11Test018
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_1800
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer18 = new Uint8Array([0x00, 0x00]).buffer;
      const dataView18 = new DataView(buffer18);
      expect(dataView18.getUint16(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView11Test019
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_1900
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer19 = new Uint8Array([0x00, 0x00]).buffer;
      const dataView19 = new DataView(buffer19);
      expect(dataView19.getUint16(0, true)).assertEqual(0);
    });

    /**
     * @tc.name   DataView11Test020
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_2000
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer20 = new Uint8Array([0xAB, 0x01]).buffer;
      const dataView20 = new DataView(buffer20);
      expect(dataView20.getUint16(0)).assertEqual(43777);
    });

    /**
     * @tc.name   DataView11Test021
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_2100
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer21 = new Uint8Array([0xAB, 0x01]).buffer;
      const dataView21 = new DataView(buffer21);
      expect(dataView21.getUint16(0, true)).assertEqual(427);
    });

    /**
     * @tc.name   DataView11Test022
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_2200
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer22 = new Uint8Array([0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC]).buffer;
      const dataView22 = new DataView(buffer22);
      expect(dataView22.getUint16(2)).assertEqual(22136);
    });

    /**
     * @tc.name   DataView11Test023
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_2300
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer23 = new Uint8Array([0x12, 0x34, 0x78, 0x56, 0x9A, 0xBC]).buffer;
      const dataView23 = new DataView(buffer23);
      expect(dataView23.getUint16(2, true)).assertEqual(22136);
    });

    /**
     * @tc.name   DataView11Test024
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_2400
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer24 = new Uint8Array([0xFF, 0xFE]).buffer;
      const dataView24 = new DataView(buffer24);
      expect(dataView24.getUint16(0)).assertEqual(65534);
    });

    /**
     * @tc.name   DataView11Test025
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_2500
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer25 = new Uint8Array([0xFE, 0xFF]).buffer;
      const dataView25 = new DataView(buffer25);
      expect(dataView25.getUint16(0, true)).assertEqual(65534);
    });

    /**
     * @tc.name   DataView11Test026
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_2600
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer26 = new Uint8Array([0x01, 0x02, 0x03, 0x04]).buffer;
      const dataView26 = new DataView(buffer26);
      expect(dataView26.getUint16(1)).assertEqual(515);
    });

    /**
     * @tc.name   DataView11Test027
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_2700
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer27 = new Uint8Array([0x01, 0x03, 0x02, 0x04]).buffer;
      const dataView27 = new DataView(buffer27);
      expect(dataView27.getUint16(1, true)).assertEqual(515);
    });

    /**
     * @tc.name   DataView11Test028
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_2800
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer28 = new Uint8Array([0x80, 0x00]).buffer;
      const dataView28 = new DataView(buffer28);
      expect(dataView28.getUint16(0)).assertEqual(32768);
    });

    /**
     * @tc.name   DataView11Test029
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_2900
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer29 = new Uint8Array([0x00, 0x80]).buffer;
      const dataView29 = new DataView(buffer29);
      expect(dataView29.getUint16(0, true)).assertEqual(32768);
    });

    /**
     * @tc.name   DataView11Test030
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_3000
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer30 = new Uint8Array([0x1A, 0x2B]).buffer;
      const dataView30 = new DataView(buffer30);
      expect(dataView30.getUint16(0)).assertEqual(6699);
    });

    /**
     * @tc.name   DataView11Test031
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_3100
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer31 = new Uint8Array([0x2B, 0x1A]).buffer;
      const dataView31 = new DataView(buffer31);
      expect(dataView31.getUint16(0, true)).assertEqual(6699);
    });

    /**
     * @tc.name   DataView11Test032
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_3200
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer32 = new Uint8Array([0x00, 0x00, 0x00, 0x00, 0xCD, 0xEF]).buffer;
      const dataView32 = new DataView(buffer32);
      expect(dataView32.getUint16(4)).assertEqual(52719);
    });

    /**
     * @tc.name   DataView11Test033
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_3300
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer33 = new Uint8Array([0x00, 0x00, 0x00, 0x00, 0xEF, 0xCD]).buffer;
      const dataView33 = new DataView(buffer33);
      expect(dataView33.getUint16(4, true)).assertEqual(52719);
    });

    /**
     * @tc.name   DataView11Test034
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_3400
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer34 = new Uint8Array([0x0F, 0x0F]).buffer;
      const dataView34 = new DataView(buffer34);
      expect(dataView34.getUint16(0)).assertEqual(3855);
    });

    /**
     * @tc.name   DataView11Test035
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_3500
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer35 = new Uint8Array([0x0F, 0x0F]).buffer;
      const dataView35 = new DataView(buffer35);
      expect(dataView35.getUint16(0, true)).assertEqual(3855);
    });

    /**
     * @tc.name   DataView11Test036
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_3600
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer36 = new Uint8Array([0x11, 0x22, 0x33, 0x45, 0x67, 0x89]).buffer;
      const dataView36 = new DataView(buffer36);
      expect(dataView36.getUint16(3)).assertEqual(17767);
    });

    /**
     * @tc.name   DataView11Test037
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_3700
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer37 = new Uint8Array([0x11, 0x22, 0x33, 0x67, 0x45, 0x89]).buffer;
      const dataView37 = new DataView(buffer37);
      expect(dataView37.getUint16(3, true)).assertEqual(17767);
    });

    /**
     * @tc.name   DataView11Test038
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_3800
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer38 = new Uint8Array([0x03, 0xE8]).buffer;
      const dataView38 = new DataView(buffer38);
      expect(dataView38.getUint16(0)).assertEqual(1000);
    });

    /**
     * @tc.name   DataView11Test039
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_3900
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer39 = new Uint8Array([0xE8, 0x03]).buffer;
      const dataView39 = new DataView(buffer39);
      expect(dataView39.getUint16(0, true)).assertEqual(1000);
    });

    /**
     * @tc.name   DataView11Test040
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_4000
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer40 = new Uint8Array([0x00, 0x00, 0x00, 0x00, 0x00, 0x9A, 0xBC]).buffer;
      const dataView40 = new DataView(buffer40);
      expect(dataView40.getUint16(5)).assertEqual(39612);
    });

    /**
     * @tc.name   DataView11Test041
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_4100
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer41 = new Uint8Array([0x00, 0x00, 0x00, 0x00, 0x00, 0xBC, 0x9A]).buffer;
      const dataView41 = new DataView(buffer41);
      expect(dataView41.getUint16(5, true)).assertEqual(39612);

    });

    /**
     * @tc.name   DataView11Test042
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_4200
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer42 = new Uint8Array([0xF0, 0xF0]).buffer;
      const dataView42 = new DataView(buffer42);
      expect(dataView42.getUint16(0)).assertEqual(61680);
    });

    /**
     * @tc.name   DataView11Test043
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_4300
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer43 = new Uint8Array([0xF0, 0xF0]).buffer;
      const dataView43 = new DataView(buffer43);
      expect(dataView43.getUint16(0, true)).assertEqual(61680);
    });

    /**
     * @tc.name   DataView11Test044
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_4400
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer44 = new Uint8Array([0xAA, 0xBB, 0x23, 0x45, 0xCC, 0xDD]).buffer;
      const dataView44 = new DataView(buffer44);
      expect(dataView44.getUint16(2)).assertEqual(9029);
    });

    /**
     * @tc.name   DataView11Test045
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_4500
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer45 = new Uint8Array([0xAA, 0xBB, 0x45, 0x23, 0xCC, 0xDD]).buffer;
      const dataView45 = new DataView(buffer45);
      expect(dataView45.getUint16(2, true)).assertEqual(9029);
    });

    /**
     * @tc.name   DataView11Test046
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_4600
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer46 = new Uint8Array([0x07, 0xD0]).buffer;
      const dataView46 = new DataView(buffer46);
      expect(dataView46.getUint16(0)).assertEqual(2000);
    });

    /**
     * @tc.name   DataView11Test047
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_4700
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer47 = new Uint8Array([0xD0, 0x07]).buffer;
      const dataView47 = new DataView(buffer47);
      expect(dataView47.getUint16(0, true)).assertEqual(2000);
    });

    /**
     * @tc.name   DataView11Test048
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_4800
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer48 = new Uint8Array([0x12, 0x34, 0x56, 0x00, 0x67, 0x89, 0xAB]).buffer;
      const dataView48 = new DataView(buffer48);
      expect(dataView48.getUint16(4)).assertEqual(26505);
    });

    /**
     * @tc.name   DataView11Test049
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_4900
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer49 = new Uint8Array([0x12, 0x34, 0x56, 0x00, 0x89, 0x67, 0xAB]).buffer;
      const dataView49 = new DataView(buffer49);
      expect(dataView49.getUint16(4, true)).assertEqual(26505);
    });

    /**
     * @tc.name   DataView11Test050
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_5000
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer50 = new Uint8Array([0x00, 0x01]).buffer;
      const dataView50 = new DataView(buffer50);
      expect(dataView50.getUint16(0)).assertEqual(1);
    });

    /**
     * @tc.name   DataView11Test051
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_5100
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer51 = new Uint8Array([0x00, 0x01]).buffer;
      const dataView51 = new DataView(buffer51);
      expect(dataView51.getUint16(0, true)).assertEqual(256);
    });

    /**
     * @tc.name   DataView11Test052
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_5200
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer52 = new Uint8Array([0x44, 0x55, 0x66, 0x77]).buffer;
      const dataView52 = new DataView(buffer52);
      expect(dataView52.getUint16(1)).assertEqual(21862);
    });

    /**
     * @tc.name   DataView11Test053
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_5300
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer53 = new Uint8Array([0x44, 0x66, 0x55, 0x77]).buffer;
      const dataView53 = new DataView(buffer53);
      expect(dataView53.getUint16(1, true)).assertEqual(21862);
    });

    /**
     * @tc.name   DataView11Test054
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_5400
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer54 = new Uint8Array([0x7F, 0xFF]).buffer;
      const dataView54 = new DataView(buffer54);
      expect(dataView54.getUint16(0)).assertEqual(32767);
    });

    /**
     * @tc.name   DataView11Test055
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_5500
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer55 = new Uint8Array([0xFF, 0x7F]).buffer;
      const dataView55 = new DataView(buffer55);
      expect(dataView55.getUint16(0, true)).assertEqual(32767);
    });

    /**
     * @tc.name   DataView11Test056
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_5600
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer56 = new Uint8Array([0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xAB, 0xCD]).buffer;
      const dataView56 = new DataView(buffer56);
      expect(dataView56.getUint16(6)).assertEqual(43981);
    });

    /**
     * @tc.name   DataView11Test057
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_5700
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer57 = new Uint8Array([0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xCD, 0xAB]).buffer;
      const dataView57 = new DataView(buffer57);
      expect(dataView57.getUint16(6, true)).assertEqual(43981);
    });

    /**
     * @tc.name   DataView11Test058
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_5800
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer58 = new Uint8Array([0x10, 0x00]).buffer;
      const dataView58 = new DataView(buffer58);
      expect(dataView58.getUint16(0)).assertEqual(4096);
    });

    /**
     * @tc.name   DataView11Test059
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_5900
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer59 = new Uint8Array([0x00, 0x10]).buffer;
      const dataView59 = new DataView(buffer59);
      expect(dataView59.getUint16(0, true)).assertEqual(4096);
    });

    /**
     * @tc.name   DataView11Test060
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_6000
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer60 = new Uint8Array([0xCD, 0xEF, 0x89, 0xAB, 0xCD, 0xEF]).buffer;
      const dataView60 = new DataView(buffer60);
      expect(dataView60.getUint16(2)).assertEqual(35243);
    });

    /**
     * @tc.name   DataView11Test061
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_6100
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer61 = new Uint8Array([0xCD, 0xEF, 0xAB, 0x89, 0xCD, 0xEF]).buffer;
      const dataView61 = new DataView(buffer61);
      expect(dataView61.getUint16(2, true)).assertEqual(35243);
    });

    /**
     * @tc.name   DataView11Test062
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_6200
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer62 = new Uint8Array([0xFF, 0xFD]).buffer;
      const dataView62 = new DataView(buffer62);
      expect(dataView62.getUint16(0)).assertEqual(65533);
    });
    /**
     * @tc.name   DataView11Test063
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_6300
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer63 = new Uint8Array([0xFD, 0xFF]).buffer;
      const dataView63 = new DataView(buffer63);
      expect(dataView63.getUint16(0, true)).assertEqual(65533);
    });

    /**
     * @tc.name   DataView11Test064
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_6400
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer64 = new Uint8Array([0x34, 0x56]).buffer;
      const dataView64 = new DataView(buffer64);
      expect(dataView64.getUint16(0)).assertEqual(13398);
    });

    /**
     * @tc.name   DataView11Test065
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_6500
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer65 = new Uint8Array([0x56, 0x34]).buffer;
      const dataView65 = new DataView(buffer65);
      expect(dataView65.getUint16(0, true)).assertEqual(13398);
    });

    /**
     * @tc.name   DataView11Test066
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_6600
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer66 = new Uint8Array([0x11, 0x67, 0x89, 0x22]).buffer;
      const dataView66 = new DataView(buffer66);
      expect(dataView66.getUint16(1)).assertEqual(26505);
    });

    /**
     * @tc.name   DataView11Test067
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_6700
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer67 = new Uint8Array([0x11, 0x89, 0x67, 0x22]).buffer;
      const dataView67 = new DataView(buffer67);
      expect(dataView67.getUint16(1, true)).assertEqual(26505);
    });

    /**
     * @tc.name   DataView11Test068
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_6800
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer68 = new Uint8Array([0x0B, 0xB8]).buffer;
      const dataView68 = new DataView(buffer68);
      expect(dataView68.getUint16(0)).assertEqual(3000);
    });

    /**
     * @tc.name   DataView11Test069
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_6900
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer69 = new Uint8Array([0xB8, 0x0B]).buffer;
      const dataView69 = new DataView(buffer69);
      expect(dataView69.getUint16(0, true)).assertEqual(3000);
    });

    /**
     * @tc.name   DataView11Test070
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_7000
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer70 = new Uint8Array([0x00, 0x11, 0x22, 0xAB, 0xCD, 0x33]).buffer;
      const dataView70 = new DataView(buffer70);
      expect(dataView70.getUint16(3)).assertEqual(43981);
    });

    /**
     * @tc.name   DataView11Test071
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_7100
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer71 = new Uint8Array([0x00, 0x11, 0x22, 0xCD, 0xAB, 0x33]).buffer;
      const dataView71 = new DataView(buffer71);
      expect(dataView71.getUint16(3, true)).assertEqual(43981);
    });

    /**
     * @tc.name   DataView11Test072
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_7200
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer72 = new Uint8Array([0x45, 0x00]).buffer;
      const dataView72 = new DataView(buffer72);
      expect(dataView72.getUint16(0)).assertEqual(17664);
    });

    /**
     * @tc.name   DataView11Test073
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_7300
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer73 = new Uint8Array([0x00, 0x45]).buffer;
      const dataView73 = new DataView(buffer73);
      expect(dataView73.getUint16(0, true)).assertEqual(17664);
    });

    /**
     * @tc.name   DataView11Test074
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_7400
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer74 = new Uint8Array([0x55, 0x66, 0x78, 0x9A, 0xAA]).buffer;
      const dataView74 = new DataView(buffer74);
      expect(dataView74.getUint16(2)).assertEqual(30874);
    });

    /**
     * @tc.name   DataView11Test075
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_7500
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer75 = new Uint8Array([0x55, 0x66, 0x9A, 0x78, 0xAA]).buffer;
      const dataView75 = new DataView(buffer75);
      expect(dataView75.getUint16(2, true)).assertEqual(30874);
    });

    /**
     * @tc.name   DataView11Test076
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_7600
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer76 = new Uint8Array([0x0F, 0xA0]).buffer;
      const dataView76 = new DataView(buffer76);
      expect(dataView76.getUint16(0)).assertEqual(4000);
    });

    /**
     * @tc.name   DataView11Test077
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_7700
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer77 = new Uint8Array([0xA0, 0x0F]).buffer;
      const dataView77 = new DataView(buffer77);
      expect(dataView77.getUint16(0, true)).assertEqual(4000);
    });

    /**
     * @tc.name   DataView11Test078
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_7800
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer78 = new Uint8Array([0x12, 0x34, 0x56, 0x78, 0xBC, 0xDE]).buffer;
      const dataView78 = new DataView(buffer78);
      expect(dataView78.getUint16(4)).assertEqual(48350);
    });

    /**
     * @tc.name   DataView11Test079
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_7900
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer79 = new Uint8Array([0x12, 0x34, 0x56, 0x78, 0xDE, 0xBC]).buffer;
      const dataView79 = new DataView(buffer79);
      expect(dataView79.getUint16(4, true)).assertEqual(48350);
    });

    /**
     * @tc.name   DataView11Test080
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_8000
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer80 = new Uint8Array([0x00, 0x02]).buffer;
      const dataView80 = new DataView(buffer80);
      expect(dataView80.getUint16(0)).assertEqual(2);
    });

    /**
     * @tc.name   DataView11Test081
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_8100
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer81 = new Uint8Array([0x00, 0x02]).buffer;
      const dataView81 = new DataView(buffer81);
      expect(dataView81.getUint16(0, true)).assertEqual(512);
    });

    /**
     * @tc.name   DataView11Test082
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_8200
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer82 = new Uint8Array([0x88, 0x9A, 0xBC, 0xDD]).buffer;
      const dataView82 = new DataView(buffer82);
      expect(dataView82.getUint16(1)).assertEqual(39612);
    });

    /**
     * @tc.name   DataView11Test083
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_8300
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer83 = new Uint8Array([0x88, 0xBC, 0x9A, 0xDD]).buffer;
      const dataView83 = new DataView(buffer83);
      expect(dataView83.getUint16(1, true)).assertEqual(39612);
    });

    /**
     * @tc.name   DataView11Test084
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_8400
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer84 = new Uint8Array([0x13, 0x88]).buffer;
      const dataView84 = new DataView(buffer84);
      expect(dataView84.getUint16(0)).assertEqual(5000);
    });

    /**
     * @tc.name   DataView11Test085
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_8500
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer85 = new Uint8Array([0x88, 0x13]).buffer;
      const dataView85 = new DataView(buffer85);
      expect(dataView85.getUint16(0, true)).assertEqual(5000);
    });

    /**
     * @tc.name   DataView11Test086
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_8600
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer86 = new Uint8Array([0x00, 0x00, 0x00, 0x00, 0x00, 0xEF, 0x12]).buffer;
      const dataView86 = new DataView(buffer86);
      expect(dataView86.getUint16(5)).assertEqual(61202);
    });

    /**
     * @tc.name   DataView11Test087
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_8700
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer87 = new Uint8Array([0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0xEF]).buffer;
      const dataView87 = new DataView(buffer87);
      expect(dataView87.getUint16(5, true)).assertEqual(61202);
    });

    /**
     * @tc.name   DataView11Test088
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_8800
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer88 = new Uint8Array([0x22, 0x33]).buffer;
      const dataView88 = new DataView(buffer88);
      expect(dataView88.getUint16(0)).assertEqual(8755);
    });

    /**
     * @tc.name   DataView11Test089
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_8900
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer89 = new Uint8Array([0x33, 0x22]).buffer;
      const dataView89 = new DataView(buffer89);
      expect(dataView89.getUint16(0, true)).assertEqual(8755);
    });

    /**
     * @tc.name   DataView11Test090
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_9000
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer90 = new Uint8Array([0xAA, 0xBB, 0xCC, 0x34, 0xEF, 0xFF]).buffer;
      const dataView90 = new DataView(buffer90);
      expect(dataView90.getUint16(3)).assertEqual(13551);
    });

    /**
     * @tc.name   DataView11Test091
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_9100
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer91 = new Uint8Array([0xAA, 0xBB, 0xCC, 0xEF, 0x34, 0xFF]).buffer;
      const dataView91 = new DataView(buffer91);
      expect(dataView91.getUint16(3, true)).assertEqual(13551);
    });

    /**
     * @tc.name   DataView11Test092
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_9200
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer92 = new Uint8Array([0xEA, 0x60]).buffer;
      const dataView92 = new DataView(buffer92);
      expect(dataView92.getUint16(0)).assertEqual(60000);
    });

    /**
     * @tc.name   DataView11Test093
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_9300
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer93 = new Uint8Array([0x60, 0xEA]).buffer;
      const dataView93 = new DataView(buffer93);
      expect(dataView93.getUint16(0, true)).assertEqual(60000);
    });

    /**
     * @tc.name   DataView11Test094
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_9400
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer94 = new Uint8Array([0x00, 0x10]).buffer;
      const dataView94 = new DataView(buffer94);
      expect(dataView94.getUint16(0)).assertEqual(16);
    });

    /**
     * @tc.name   DataView11Test095
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_9500
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer95 = new Uint8Array([0x00, 0x10]).buffer;
      const dataView95 = new DataView(buffer95);
      expect(dataView95.getUint16(0, true)).assertEqual(4096);
    });

    /**
     * @tc.name   DataView11Test096
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_9600
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer96 = new Uint8Array([0x11, 0x22, 0x45, 0x67, 0x88]).buffer;
      const dataView96 = new DataView(buffer96);
      expect(dataView96.getUint16(2)).assertEqual(17767);
    });

    /**
     * @tc.name   DataView11Test097
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_9700
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer97 = new Uint8Array([0x11, 0x22, 0x67, 0x45, 0x88]).buffer;
      const dataView97 = new DataView(buffer97);
      expect(dataView97.getUint16(2, true)).assertEqual(17767);

    });

    /**
     * @tc.name   DataView11Test098
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_9800
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer98 = new Uint8Array([0x20, 0x00]).buffer;
      const dataView98 = new DataView(buffer98);
      expect(dataView98.getUint16(0)).assertEqual(8192);
    });

    /**
     * @tc.name   DataView11Test099
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_9900
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer99 = new Uint8Array([0x00, 0x20]).buffer;
      const dataView99 = new DataView(buffer99);
      expect(dataView99.getUint16(0, true)).assertEqual(8192);
    });

    /**
     * @tc.name   DataView11Test100
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_10000
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer100 = new Uint8Array([0x00, 0x00, 0x00, 0x00, 0x56, 0x78]).buffer;
      const dataView100 = new DataView(buffer100);
      expect(dataView100.getUint16(4)).assertEqual(22136);
    });

    /**
     * @tc.name   DataView11Test101
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_10100
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer101 = new Uint8Array([0x00, 0x00, 0x00, 0x00, 0x78, 0x56]).buffer;
      const dataView101 = new DataView(buffer101);
      expect(dataView101.getUint16(4, true)).assertEqual(22136);
    });

    /**
     * @tc.name   DataView11Test102
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_10200
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer102 = new Uint8Array([0x12, 0x34]).buffer;
      const dataView102 = new DataView(buffer102);
      expect(dataView102.getUint16(0)).assertEqual(4660);
    });

    /**
     * @tc.name   DataView11Test103
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_10300
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer103 = new Uint8Array([0x34, 0x12]).buffer;
      const dataView103 = new DataView(buffer103);
      expect(dataView103.getUint16(0, true)).assertEqual(4660);
    });

    /**
     * @tc.name   DataView11Test104
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_10400
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer104 = new Uint8Array([0x00, 0xAB, 0xCD, 0xFF]).buffer;
      const dataView104 = new DataView(buffer104);
      expect(dataView104.getUint16(1)).assertEqual(43981);
    });

    /**
     * @tc.name   DataView11Test105
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_10500
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer105 = new Uint8Array([0x00, 0xCD, 0xAB, 0xFF]).buffer;
      const dataView105 = new DataView(buffer105);
      expect(dataView105.getUint16(1, true)).assertEqual(43981);
    });

    /**
     * @tc.name   DataView11Test106
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_10600
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer106 = new Uint8Array([0x04, 0x00]).buffer;
      const dataView106 = new DataView(buffer106);
      expect(dataView106.getUint16(0)).assertEqual(1024);
    });

    /**
     * @tc.name   DataView11Test107
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_10700
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer107 = new Uint8Array([0x00, 0x04]).buffer;
      const dataView107 = new DataView(buffer107);
      expect(dataView107.getUint16(0, true)).assertEqual(1024);
    });

    /**
     * @tc.name   DataView11Test108
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_10800
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer108 = new Uint8Array([0xAA, 0xBB, 0xCC, 0x67, 0x89, 0xDD]).buffer;
      const dataView108 = new DataView(buffer108);
      expect(dataView108.getUint16(3)).assertEqual(26505);
    });

    /**
     * @tc.name   DataView11Test109
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_10900
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer109 = new Uint8Array([0xAA, 0xBB, 0xCC, 0x89, 0x67, 0xDD]).buffer;
      const dataView109 = new DataView(buffer109);
      expect(dataView109.getUint16(3, true)).assertEqual(26505);
    });

    /**
     * @tc.name   DataView11Test110
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_11000
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer110 = new Uint8Array([0x78, 0x90]).buffer;
      const dataView110 = new DataView(buffer110);
      expect(dataView110.getUint16(0)).assertEqual(30864);
    });

    /**
     * @tc.name   DataView11Test111
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_11100
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer111 = new Uint8Array([0x90, 0x78]).buffer;
      const dataView111 = new DataView(buffer111);
      expect(dataView111.getUint16(0, true)).assertEqual(30864);
    });

    /**
     * @tc.name   DataView11Test112
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_11200
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer111 = new Uint8Array([0x90, 0x78]).buffer;
      const dataView111 = new DataView(buffer111);
      expect(dataView111.getUint16(0, true)).assertEqual(30864);
    });

    /**
     * @tc.name   DataView11Test113
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_11300
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer113 = new Uint8Array([0x33, 0x44, 0xEF, 0x12, 0x55]).buffer;
      const dataView113 = new DataView(buffer113);
      expect(dataView113.getUint16(2, true)).assertEqual(4847);
    });

    /**
     * @tc.name   DataView11Test114
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_11400
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer114 = new Uint8Array([0x40, 0x00]).buffer;
      const dataView114 = new DataView(buffer114);
      expect(dataView114.getUint16(0)).assertEqual(16384);
    });

    /**
     * @tc.name   DataView11Test115
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_11500
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer115 = new Uint8Array([0x00, 0x40]).buffer;
      const dataView115 = new DataView(buffer115);
      expect(dataView115.getUint16(0, true)).assertEqual(16384);
    });

    /**
     * @tc.name   DataView11Test116
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_11600
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer116 = new Uint8Array([0x00, 0x00, 0x00, 0x00, 0x00, 0x89, 0xAB]).buffer;
      const dataView116 = new DataView(buffer116);
      expect(dataView116.getUint16(5)).assertEqual(35243);
    });

    /**
     * @tc.name   DataView11Test117
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_11700
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer117 = new Uint8Array([0x00, 0x00, 0x00, 0x00, 0x00, 0xAB, 0x89]).buffer;
      const dataView117 = new DataView(buffer117);
      expect(dataView117.getUint16(5, true)).assertEqual(35243);
    });

    /**
     * @tc.name   DataView11Test118
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_11800
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer118 = new Uint8Array([0x9A, 0xBC]).buffer;
      const dataView118 = new DataView(buffer118);
      expect(dataView118.getUint16(0)).assertEqual(39612);

    });

    /**
     * @tc.name   DataView11Test119
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_11900
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer119 = new Uint8Array([0xBC, 0x9A]).buffer;
      const dataView119 = new DataView(buffer119);
      expect(dataView119.getUint16(0, true)).assertEqual(39612);
    });

    /**
     * @tc.name   DataView11Test120
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_12000
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer120 = new Uint8Array([0x11, 0x23, 0x45, 0x66]).buffer;
      const dataView120 = new DataView(buffer120);
      expect(dataView120.getUint16(1)).assertEqual(9029);
    });

    /**
     * @tc.name   DataView11Test121
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_12100
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer121 = new Uint8Array([0x11, 0x45, 0x23, 0x66]).buffer;
      const dataView121 = new DataView(buffer121);
      expect(dataView121.getUint16(1, true)).assertEqual(9029);
    });

    /**
     * @tc.name   DataView11Test122
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_12200
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer122 = new Uint8Array([0x80, 0x00]).buffer;
      const dataView122 = new DataView(buffer122);
      expect(dataView122.getUint16(0)).assertEqual(32768);
    });

    /**
     * @tc.name   DataView11Test123
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_12300
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer123 = new Uint8Array([0x00, 0x80]).buffer;
      const dataView123 = new DataView(buffer123);
      expect(dataView123.getUint16(0, true)).assertEqual(32768);
    });

    /**
     * @tc.name   DataView11Test124
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_12400
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer124 = new Uint8Array([0x0A, 0x0B]).buffer;
      const dataView124 = new DataView(buffer124);
      expect(dataView124.getUint16(0)).assertEqual(2571);
    });

    /**
     * @tc.name   DataView11Test125
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_12500
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer125 = new Uint8Array([0x0B, 0x0A]).buffer;
      const dataView125 = new DataView(buffer125);
      expect(dataView125.getUint16(0, true)).assertEqual(2571);
    });

    /**
     * @tc.name   DataView11Test126
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_12600
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer126 = new Uint8Array([0x11, 0x22, 0xCD, 0x0E, 0x33]).buffer;
      const dataView126 = new DataView(buffer126);
      expect(dataView126.getUint16(2)).assertEqual(52494);
    });

    /**
     * @tc.name   DataView11Test127
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_12700
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer127 = new Uint8Array([0x11, 0x22, 0x0E, 0xCD, 0x33]).buffer;
      const dataView127 = new DataView(buffer127);
      expect(dataView127.getUint16(2, true)).assertEqual(52494);
    });

    /**
     * @tc.name   DataView11Test128
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_12800
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer128 = new Uint8Array([0x1B, 0x58]).buffer;
      const dataView128 = new DataView(buffer128);
      expect(dataView128.getUint16(0)).assertEqual(7000);
    });

    /**
     * @tc.name   DataView11Test129
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_12900
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer129 = new Uint8Array([0x58, 0x1B]).buffer;
      const dataView129 = new DataView(buffer129);
      expect(dataView129.getUint16(0, true)).assertEqual(7000);
    });

    /**
     * @tc.name   DataView11Test130
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_13000
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer130 = new Uint8Array([0x00, 0x00, 0x00, 0x00, 0x1F, 0x2E]).buffer;
      const dataView130 = new DataView(buffer130);
      expect(dataView130.getUint16(4)).assertEqual(7982);
    });

    /**
     * @tc.name   DataView11Test131
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_13100
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer131 = new Uint8Array([0x00, 0x00, 0x00, 0x00, 0x2E, 0x1F]).buffer;
      const dataView131 = new DataView(buffer131);
      expect(dataView131.getUint16(4, true)).assertEqual(7982);
    });

    /**
     * @tc.name   DataView11Test132
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_13200
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer132 = new Uint8Array([0x3C, 0x4D]).buffer;
      const dataView132 = new DataView(buffer132);
      expect(dataView132.getUint16(0)).assertEqual(15437);
    });

    /**
     * @tc.name   DataView11Test133
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_13300
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer133 = new Uint8Array([0x4D, 0x3C]).buffer;
      const dataView133 = new DataView(buffer133);
      expect(dataView133.getUint16(0, true)).assertEqual(15437);
    });

    /**
     * @tc.name   DataView11Test134
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_13400
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer134 = new Uint8Array([0xAA, 0x5E, 0x6F, 0xBB]).buffer;
      const dataView134 = new DataView(buffer134);
      expect(dataView134.getUint16(1)).assertEqual(24175);
    });

    /**
     * @tc.name   DataView11Test135
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_13500
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer135 = new Uint8Array([0xAA, 0x6F, 0x5E, 0xBB]).buffer;
      const dataView135 = new DataView(buffer135);
      expect(dataView135.getUint16(1, true)).assertEqual(24175);
    });

    /**
     * @tc.name   DataView11Test136
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_13600
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer136 = new Uint8Array([0x30, 0x39]).buffer;
      const dataView136 = new DataView(buffer136);
      expect(dataView136.getUint16(0)).assertEqual(12345);
    });

    /**
     * @tc.name   DataView11Test137
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_13700
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer137 = new Uint8Array([0x39, 0x30]).buffer;
      const dataView137 = new DataView(buffer137);
      expect(dataView137.getUint16(0, true)).assertEqual(12345);
    });

    /**
     * @tc.name   DataView11Test138
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_13800
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer138 = new Uint8Array([0x12, 0x34, 0x56, 0x7A, 0x8B, 0x9C]).buffer;
      const dataView138 = new DataView(buffer138);
      expect(dataView138.getUint16(3)).assertEqual(31371);
    });

    /**
     * @tc.name   DataView11Test139
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_13900
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer139 = new Uint8Array([0x12, 0x34, 0x56, 0x8B, 0x7A, 0x9C]).buffer;
      const dataView139 = new DataView(buffer139);
      expect(dataView139.getUint16(3, true)).assertEqual(31371);
    });

    /**
     * @tc.name   DataView11Test140
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_14000
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer140 = new Uint8Array([0x90, 0xAB]).buffer;
      const dataView140 = new DataView(buffer140);
      expect(dataView140.getUint16(0)).assertEqual(37035);
    });

    /**
     * @tc.name   DataView11Test141
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_14100
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer141 = new Uint8Array([0xAB, 0x90]).buffer;
      const dataView141 = new DataView(buffer141);
      expect(dataView141.getUint16(0, true)).assertEqual(37035);
    });

    /**
     * @tc.name   DataView11Test142
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_14200
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer142 = new Uint8Array([0xEE, 0xFF, 0xCD, 0x1D, 0x22]).buffer;
      const dataView142 = new DataView(buffer142);
      expect(dataView142.getUint16(2)).assertEqual(52509);
    });

    /**
     * @tc.name   DataView11Test143
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_14300
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer143 = new Uint8Array([0xEE, 0xFF, 0x1D, 0xCD, 0x22]).buffer;
      const dataView143 = new DataView(buffer143);
      expect(dataView143.getUint16(2, true)).assertEqual(52509);
    });

    /**
     * @tc.name   DataView11Test144
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_14400
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer144 = new Uint8Array([0x4E, 0x20]).buffer;
      const dataView144 = new DataView(buffer144);
      expect(dataView144.getUint16(0)).assertEqual(20000);
    });

    /**
     * @tc.name   DataView11Test145
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_14500
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer145 = new Uint8Array([0x20, 0x4E]).buffer;
      const dataView145 = new DataView(buffer145);
      expect(dataView145.getUint16(0, true)).assertEqual(20000);
    });

    /**
     * @tc.name   DataView11Test146
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_14600
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer146 = new Uint8Array([0x00, 0x00, 0x00, 0x00, 0x00, 0xEF, 0x3F]).buffer;
      const dataView146 = new DataView(buffer146);
      expect(dataView146.getUint16(5)).assertEqual(61247);
    });

    /**
     * @tc.name   DataView11Test147
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_14700
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer147 = new Uint8Array([0x00, 0x00, 0x00, 0x00, 0x00, 0x3F, 0xEF]).buffer;
      const dataView147 = new DataView(buffer147);
      expect(dataView147.getUint16(5, true)).assertEqual(61247);
    });

    /**
     * @tc.name   DataView11Test148
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_14800
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer148 = new Uint8Array([0x01, 0xFE]).buffer;
      const dataView148 = new DataView(buffer148);
      expect(dataView148.getUint16(0)).assertEqual(510);
    });

    /**
     * @tc.name   DataView11Test149
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_14900
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer149 = new Uint8Array([0xFE, 0x01]).buffer;
      const dataView149 = new DataView(buffer149);
      expect(dataView149.getUint16(0, true)).assertEqual(510);
    });

    /**
     * @tc.name   DataView11Test150
     * @tc.number SUB_BUILTINS_DATAVIEW11_TEST_15000
     * @tc.desc   test DataView getUint16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView11Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer150 = new Uint8Array([0x11, 0x23, 0xFF, 0x44]).buffer;
      const dataView150 = new DataView(buffer150);
      expect(dataView150.getUint16(1)).assertEqual(9215);
    });

  })
}