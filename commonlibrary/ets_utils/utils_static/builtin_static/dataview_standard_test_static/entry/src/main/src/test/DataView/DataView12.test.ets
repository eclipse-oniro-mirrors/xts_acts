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

export default function DataView12Test() {
  describe('DataView12Test', () => {
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
     * @tc.name   DataView12Test001
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_0100
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(4);
      const view1 = new DataView(buffer1);
      view1.setUint8(0, 0x00);
      view1.setUint8(1, 0x00);
      view1.setUint8(2, 0x00);
      view1.setUint8(3, 0xFF);
      expect(view1.getUint32(0)).assertEqual(255);
    });

    /**
     * @tc.name   DataView12Test002
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_0200
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer2 = new ArrayBuffer(4);
      const view2 = new DataView(buffer2);
      view2.setUint8(0, 0x00);
      view2.setUint8(1, 0x00);
      view2.setUint8(2, 0x00);
      view2.setUint8(3, 0xFF);
      expect(view2.getUint32(0, true)).assertEqual(4278190080);
    });

    /**
     * @tc.name   DataView12Test003
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_0300
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer3 = new ArrayBuffer(5);
      const view3 = new DataView(buffer3);
      view3.setUint8(0, 0x12);
      view3.setUint8(1, 0x34);
      view3.setUint8(2, 0x56);
      view3.setUint8(3, 0x78);
      view3.setUint8(4, 0x9A);
      expect(view3.getUint32(1)).assertEqual(878082202);
    });

    /**
     * @tc.name   DataView12Test004
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_0400
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer4 = new ArrayBuffer(4);
      const view4 = new DataView(buffer4);
      view4.setUint8(0, 0x01);
      view4.setUint8(1, 0x00);
      view4.setUint8(2, 0x00);
      view4.setUint8(3, 0x00);
      expect(view4.getUint32(0)).assertEqual(16777216);
    });

    /**
     * @tc.name   DataView12Test005
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_0500
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer5 = new ArrayBuffer(4);
      const view5 = new DataView(buffer5);
      view5.setUint8(0, 0x01);
      view5.setUint8(1, 0x00);
      view5.setUint8(2, 0x00);
      view5.setUint8(3, 0x00);
      expect(view5.getUint32(0, true)).assertEqual(1);
    });

    /**
     * @tc.name   DataView12Test006
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_0600
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer6 = new ArrayBuffer(6);
      const view6 = new DataView(buffer6);
      view6.setUint8(2, 0xAB);
      view6.setUint8(3, 0xCD);
      view6.setUint8(4, 0xEF);
      view6.setUint8(5, 0x12);
      expect(view6.getUint32(2)).assertEqual(2882400018);
    });

    /**
     * @tc.name   DataView12Test007
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_0700
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer7 = new ArrayBuffer(6);
      const view7 = new DataView(buffer7);
      view7.setUint8(2, 0xAB);
      view7.setUint8(3, 0xCD);
      view7.setUint8(4, 0xEF);
      view7.setUint8(5, 0x12);
      expect(view7.getUint32(2, true)).assertEqual(317705643);
    });

    /**
     * @tc.name   DataView12Test008
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_0800
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer8 = new ArrayBuffer(4);
      const view8 = new DataView(buffer8);
      view8.setUint8(0, 0xFF);
      view8.setUint8(1, 0xFF);
      view8.setUint8(2, 0xFF);
      view8.setUint8(3, 0xFF);
      expect(view8.getUint32(0)).assertEqual(4294967295);
    });

    /**
     * @tc.name   DataView12Test009
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_0900
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer9 = new ArrayBuffer(4);
      const view9 = new DataView(buffer9);
      view9.setUint8(0, 0xFF);
      view9.setUint8(1, 0xFF);
      view9.setUint8(2, 0xFF);
      view9.setUint8(3, 0xFF);
      expect(view9.getUint32(0, true)).assertEqual(4294967295);
    });

    /**
     * @tc.name   DataView12Test010
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_1000
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer10 = new ArrayBuffer(5);
      const view10 = new DataView(buffer10);
      view10.setUint8(1, 0x00);
      view10.setUint8(2, 0x01);
      view10.setUint8(3, 0x02);
      view10.setUint8(4, 0x03);
      expect(view10.getUint32(1)).assertEqual(66051);
    });

    /**
     * @tc.name   DataView12Test011
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_1100
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer11 = new ArrayBuffer(5);
      const view11 = new DataView(buffer11);
      view11.setUint8(1, 0x00);
      view11.setUint8(2, 0x01);
      view11.setUint8(3, 0x02);
      view11.setUint8(4, 0x03);
      expect(view11.getUint32(1, true)).assertEqual(50462976);

    });

    /**
     * @tc.name   DataView12Test012
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_1200
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer12 = new ArrayBuffer(4);
      const view12 = new DataView(buffer12);
      view12.setUint8(0, 0x80);
      view12.setUint8(1, 0x00);
      view12.setUint8(2, 0x00);
      view12.setUint8(3, 0x00);
      expect(view12.getUint32(0)).assertEqual(2147483648);
    });

    /**
     * @tc.name   DataView12Test013
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_1300
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer13 = new ArrayBuffer(4);
      const view13 = new DataView(buffer13);
      view13.setUint8(0, 0x80);
      view13.setUint8(1, 0x00);
      view13.setUint8(2, 0x00);
      view13.setUint8(3, 0x00);
      expect(view13.getUint32(0, true)).assertEqual(128);
    });

    /**
     * @tc.name   DataView12Test014
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_1400
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer14 = new ArrayBuffer(7);
      const view14 = new DataView(buffer14);
      view14.setUint8(3, 0x11);
      view14.setUint8(4, 0x22);
      view14.setUint8(5, 0x33);
      view14.setUint8(6, 0x44);
      expect(view14.getUint32(3)).assertEqual(287454020);
    });

    /**
     * @tc.name   DataView12Test015
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_1500
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer15 = new ArrayBuffer(7);
      const view15 = new DataView(buffer15);
      view15.setUint8(3, 0x11);
      view15.setUint8(4, 0x22);
      view15.setUint8(5, 0x33);
      view15.setUint8(6, 0x44);
      expect(view15.getUint32(3, true)).assertEqual(1144201745);
    });

    /**
     * @tc.name   DataView12Test016
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_1600
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer16 = new ArrayBuffer(4);
      const view16 = new DataView(buffer16);
      view16.setUint8(0, 0x00);
      view16.setUint8(1, 0x00);
      view16.setUint8(2, 0x01);
      view16.setUint8(3, 0x00);
      expect(view16.getUint32(0)).assertEqual(256);
    });

    /**
     * @tc.name   DataView12Test017
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_1700
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer17 = new ArrayBuffer(4);
      const view17 = new DataView(buffer17);
      view17.setUint8(0, 0x00);
      view17.setUint8(1, 0x00);
      view17.setUint8(2, 0x01);
      view17.setUint8(3, 0x00);
      expect(view17.getUint32(0, true)).assertEqual(65536);
    });

    /**
     * @tc.name   DataView12Test018
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_1800
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer18 = new ArrayBuffer(5);
      const view18 = new DataView(buffer18);
      view18.setUint8(1, 0xFF);
      view18.setUint8(2, 0xFF);
      view18.setUint8(3, 0xFF);
      view18.setUint8(4, 0xFE);
      expect(view18.getUint32(1)).assertEqual(4294967294);
    });

    /**
     * @tc.name   DataView12Test019
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_1900
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer19 = new ArrayBuffer(5);
      const view19 = new DataView(buffer19);
      view19.setUint8(1, 0xFF);
      view19.setUint8(2, 0xFF);
      view19.setUint8(3, 0xFF);
      view19.setUint8(4, 0xFE);
      expect(view19.getUint32(1, true)).assertEqual(4278190079);
    });

    /**
     * @tc.name   DataView12Test020
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_2000
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer20 = new ArrayBuffer(4);
      const view20 = new DataView(buffer20);
      view20.setUint8(0, 0x0F);
      view20.setUint8(1, 0xF0);
      view20.setUint8(2, 0x0F);
      view20.setUint8(3, 0xF0);
      expect(view20.getUint32(0)).assertEqual(267390960);
    });

    /**
     * @tc.name   DataView12Test021
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_2100
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer21 = new ArrayBuffer(4);
      const view21 = new DataView(buffer21);
      view21.setUint8(0, 0x0F);
      view21.setUint8(1, 0xF0);
      view21.setUint8(2, 0x0F);
      view21.setUint8(3, 0xF0);
      expect(view21.getUint32(0, true)).assertEqual(4027576335);
    });

    /**
     * @tc.name   DataView12Test022
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_2200
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer22 = new ArrayBuffer(6);
      const view22 = new DataView(buffer22);
      view22.setUint8(2, 0x00);
      view22.setUint8(3, 0x00);
      view22.setUint8(4, 0x00);
      view22.setUint8(5, 0x00);
      expect(view22.getUint32(2)).assertEqual(0);
    });

    /**
     * @tc.name   DataView12Test023
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_2300
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer23 = new ArrayBuffer(6);
      const view23 = new DataView(buffer23);
      view23.setUint8(2, 0x00);
      view23.setUint8(3, 0x00);
      view23.setUint8(4, 0x00);
      view23.setUint8(5, 0x00);
      expect(view23.getUint32(2, true)).assertEqual(0);
    });

    /**
     * @tc.name   DataView12Test024
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_2400
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer24 = new ArrayBuffer(4);
      const view24 = new DataView(buffer24);
      view24.setUint8(0, 0x1A);
      view24.setUint8(1, 0x2B);
      view24.setUint8(2, 0x3C);
      view24.setUint8(3, 0x4D);
      expect(view24.getUint32(0)).assertEqual(439041101);
    });

    /**
     * @tc.name   DataView12Test025
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_2500
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer25 = new ArrayBuffer(4);
      const view25 = new DataView(buffer25);
      view25.setUint8(0, 0x1A);
      view25.setUint8(1, 0x2B);
      view25.setUint8(2, 0x3C);
      view25.setUint8(3, 0x4D);
      expect(view25.getUint32(0, true)).assertEqual(1295788826);
    });

    /**
     * @tc.name   DataView12Test026
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_2600
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer26 = new ArrayBuffer(8);
      const view26 = new DataView(buffer26);
      view26.setUint8(4, 0x55);
      view26.setUint8(5, 0xAA);
      view26.setUint8(6, 0x55);
      view26.setUint8(7, 0xAA);
      expect(view26.getUint32(4)).assertEqual(1437226410);
    });

    /**
     * @tc.name   DataView12Test027
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_2700
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer27 = new ArrayBuffer(8);
      const view27 = new DataView(buffer27);
      view27.setUint8(4, 0x55);
      view27.setUint8(5, 0xAA);
      view27.setUint8(6, 0x55);
      view27.setUint8(7, 0xAA);
      expect(view27.getUint32(4, true)).assertEqual(2857740885);
    });

    /**
     * @tc.name   DataView12Test028
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_2800
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer28 = new ArrayBuffer(4);
      const view28 = new DataView(buffer28);
      view28.setUint8(0, 0x00);
      view28.setUint8(1, 0x01);
      view28.setUint8(2, 0x00);
      view28.setUint8(3, 0x01);
      expect(view28.getUint32(0)).assertEqual(65537);
    });

    /**
     * @tc.name   DataView12Test029
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_2900
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer29 = new ArrayBuffer(4);
      const view29 = new DataView(buffer29);
      view29.setUint8(0, 0x00);
      view29.setUint8(1, 0x01);
      view29.setUint8(2, 0x00);
      view29.setUint8(3, 0x01);
      expect(view29.getUint32(0, true)).assertEqual(16777472);
    });

    /**
     * @tc.name   DataView12Test030
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_3000
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer30 = new ArrayBuffer(5);
      const view30 = new DataView(buffer30);
      view30.setUint8(1, 0x02);
      view30.setUint8(2, 0x03);
      view30.setUint8(3, 0x04);
      view30.setUint8(4, 0x05);
      expect(view30.getUint32(1)).assertEqual(33752069);
    });

    /**
     * @tc.name   DataView12Test031
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_3100
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer31 = new ArrayBuffer(5);
      const view31 = new DataView(buffer31);
      view31.setUint8(1, 0x02);
      view31.setUint8(2, 0x03);
      view31.setUint8(3, 0x04);
      view31.setUint8(4, 0x05);
      expect(view31.getUint32(1, true)).assertEqual(84148994);
    });

    /**
     * @tc.name   DataView12Test032
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_3200
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer32 = new ArrayBuffer(4);
      const view32 = new DataView(buffer32);
      view32.setUint8(0, 0xFF);
      view32.setUint8(1, 0x00);
      view32.setUint8(2, 0xFF);
      view32.setUint8(3, 0x00);
      expect(view32.getUint32(0)).assertEqual(4278255360);
    });

    /**
     * @tc.name   DataView12Test033
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_3300
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer33 = new ArrayBuffer(4);
      const view33 = new DataView(buffer33);
      view33.setUint8(0, 0xFF);
      view33.setUint8(1, 0x00);
      view33.setUint8(2, 0xFF);
      view33.setUint8(3, 0x00);
      expect(view33.getUint32(0, true)).assertEqual(16711935);
    });

    /**
     * @tc.name   DataView12Test034
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_3400
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer34 = new ArrayBuffer(4);
      const view34 = new DataView(buffer34);
      view34.setUint8(0, 0x00);
      view34.setUint8(1, 0x01);
      view34.setUint8(2, 0x02);
      view34.setUint8(3, 0x03);
      expect(view34.getUint32(0)).assertEqual(66051);
    });

    /**
     * @tc.name   DataView12Test035
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_3500
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer35 = new ArrayBuffer(4);
      const view35 = new DataView(buffer35);
      view35.setUint8(0, 0x00);
      view35.setUint8(1, 0x01);
      view35.setUint8(2, 0x02);
      view35.setUint8(3, 0x03);
      expect(view35.getUint32(0, true)).assertEqual(50462976);
    });

    /**
     * @tc.name   DataView12Test036
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_3600
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer36 = new ArrayBuffer(6);
      const view36 = new DataView(buffer36);
      view36.setUint8(2, 0xAB);
      view36.setUint8(3, 0x00);
      view36.setUint8(4, 0xCD);
      view36.setUint8(5, 0xFF);
      expect(view36.getUint32(2)).assertEqual(2868956671);
    });

    /**
     * @tc.name   DataView12Test037
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_3700
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer37 = new ArrayBuffer(6);
      const view37 = new DataView(buffer37);
      view37.setUint8(2, 0xAB);
      view37.setUint8(3, 0x00);
      view37.setUint8(4, 0xCD);
      view37.setUint8(5, 0xFF);
      expect(view37.getUint32(2, true)).assertEqual(4291625131);
    });

    /**
     * @tc.name   DataView12Test038
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_3800
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer38 = new ArrayBuffer(4);
      const view38 = new DataView(buffer38);
      view38.setUint8(0, 0x0F);
      view38.setUint8(1, 0x0F);
      view38.setUint8(2, 0x0F);
      view38.setUint8(3, 0x0F);
      expect(view38.getUint32(0)).assertEqual(252645135);
    });

    /**
     * @tc.name   DataView12Test039
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_3900
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer39 = new ArrayBuffer(4);
      const view39 = new DataView(buffer39);
      view39.setUint8(0, 0x0F);
      view39.setUint8(1, 0x0F);
      view39.setUint8(2, 0x0F);
      view39.setUint8(3, 0x0F);
      expect(view39.getUint32(0, true)).assertEqual(252645135);
    });

    /**
     * @tc.name   DataView12Test040
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_4000
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer40 = new ArrayBuffer(5);
      const view40 = new DataView(buffer40);
      view40.setUint8(1, 0x10);
      view40.setUint8(2, 0x20);
      view40.setUint8(3, 0x30);
      view40.setUint8(4, 0x40);
      expect(view40.getUint32(1)).assertEqual(270544960);
    });

    /**
     * @tc.name   DataView12Test041
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_4100
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer41 = new ArrayBuffer(5);
      const view41 = new DataView(buffer41);
      view41.setUint8(1, 0x10);
      view41.setUint8(2, 0x20);
      view41.setUint8(3, 0x30);
      view41.setUint8(4, 0x40);
      expect(view41.getUint32(1, true)).assertEqual(1076895760);
    });

    /**
     * @tc.name   DataView12Test042
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_4200
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer42 = new ArrayBuffer(4);
      const view42 = new DataView(buffer42);
      view42.setUint8(0, 0x7F);
      view42.setUint8(1, 0xFF);
      view42.setUint8(2, 0xFF);
      view42.setUint8(3, 0xFF);
      expect(view42.getUint32(0)).assertEqual(2147483647);
    });

    /**
     * @tc.name   DataView12Test043
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_4300
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer43 = new ArrayBuffer(4);
      const view43 = new DataView(buffer43);
      view43.setUint8(0, 0x7F);
      view43.setUint8(1, 0xFF);
      view43.setUint8(2, 0xFF);
      view43.setUint8(3, 0xFF);
      expect(view43.getUint32(0, true)).assertEqual(4294967167);
    });

    /**
     * @tc.name   DataView12Test044
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_4400
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer44 = new ArrayBuffer(8);
      const view44 = new DataView(buffer44);
      view44.setUint8(4, 0x00);
      view44.setUint8(5, 0x00);
      view44.setUint8(6, 0x01);
      view44.setUint8(7, 0x00);
      expect(view44.getUint32(4)).assertEqual(256);
    });

    /**
     * @tc.name   DataView12Test045
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_4500
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer45 = new ArrayBuffer(8);
      const view45 = new DataView(buffer45);
      view45.setUint8(4, 0x00);
      view45.setUint8(5, 0x00);
      view45.setUint8(6, 0x01);
      view45.setUint8(7, 0x00);
      expect(view45.getUint32(4, true)).assertEqual(65536);
    });

    /**
     * @tc.name   DataView12Test046
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_4600
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer46 = new ArrayBuffer(4);
      const view46 = new DataView(buffer46);
      view46.setUint8(0, 0x11);
      view46.setUint8(1, 0x22);
      view46.setUint8(2, 0x33);
      view46.setUint8(3, 0x44);
      expect(view46.getUint32(0)).assertEqual(287454020);
    });

    /**
     * @tc.name   DataView12Test047
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_4700
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer47 = new ArrayBuffer(4);
      const view47 = new DataView(buffer47);
      view47.setUint8(0, 0x11);
      view47.setUint8(1, 0x22);
      view47.setUint8(2, 0x33);
      view47.setUint8(3, 0x44);
      expect(view47.getUint32(0, true)).assertEqual(1144201745);
    });

    /**
     * @tc.name   DataView12Test048
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_4800
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer48 = new ArrayBuffer(7);
      const view48 = new DataView(buffer48);
      view48.setUint8(3, 0x55);
      view48.setUint8(4, 0x55);
      view48.setUint8(5, 0x55);
      view48.setUint8(6, 0x55);
      expect(view48.getUint32(3)).assertEqual(1431655765);
    });

    /**
     * @tc.name   DataView12Test049
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_4900
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer49 = new ArrayBuffer(7);
      const view49 = new DataView(buffer49);
      view49.setUint8(3, 0x55);
      view49.setUint8(4, 0x55);
      view49.setUint8(5, 0x55);
      view49.setUint8(6, 0x55);
      expect(view49.getUint32(3, true)).assertEqual(1431655765);
    });

    /**
     * @tc.name   DataView12Test050
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_5000
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer50 = new ArrayBuffer(4);
      const view50 = new DataView(buffer50);
      view50.setUint8(0, 0x00);
      view50.setUint8(1, 0x00);
      view50.setUint8(2, 0x00);
      view50.setUint8(3, 0x01);
      expect(view50.getUint32(0)).assertEqual(1);
    });

    /**
     * @tc.name   DataView12Test051
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_5100
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer51 = new ArrayBuffer(4);
      const view51 = new DataView(buffer51);
      view51.setUint8(0, 0x00);
      view51.setUint8(1, 0x00);
      view51.setUint8(2, 0x00);
      view51.setUint8(3, 0x01);
      expect(view51.getUint32(0, true)).assertEqual(16777216);
    });

    /**
     * @tc.name   DataView12Test052
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_5200
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer52 = new ArrayBuffer(6);
      const view52 = new DataView(buffer52);
      view52.setUint8(2, 0xAA);
      view52.setUint8(3, 0xBB);
      view52.setUint8(4, 0xCC);
      view52.setUint8(5, 0xDD);
      expect(view52.getUint32(2)).assertEqual(2864434397);
    });

    /**
     * @tc.name   DataView12Test053
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_5300
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer53 = new ArrayBuffer(6);
      const view53 = new DataView(buffer53);
      view53.setUint8(2, 0xAA);
      view53.setUint8(3, 0xBB);
      view53.setUint8(4, 0xCC);
      view53.setUint8(5, 0xDD);
      expect(view53.getUint32(2, true)).assertEqual(3721182122);
    });

    /**
     * @tc.name   DataView12Test054
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_5400
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer54 = new ArrayBuffer(4);
      const view54 = new DataView(buffer54);
      view54.setUint8(0, 0xFF);
      view54.setUint8(1, 0x00);
      view54.setUint8(2, 0x00);
      view54.setUint8(3, 0x00);
      expect(view54.getUint32(0)).assertEqual(4278190080);
    });

    /**
     * @tc.name   DataView12Test055
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_5500
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer55 = new ArrayBuffer(4);
      const view55 = new DataView(buffer55);
      view55.setUint8(0, 0xFF);
      view55.setUint8(1, 0x00);
      view55.setUint8(2, 0x00);
      view55.setUint8(3, 0x00);
      expect(view55.getUint32(0, true)).assertEqual(255);
    });

    /**
     * @tc.name   DataView12Test056
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_5600
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer56 = new ArrayBuffer(5);
      const view56 = new DataView(buffer56);
      view56.setUint8(1, 0x00);
      view56.setUint8(2, 0xFF);
      view56.setUint8(3, 0x00);
      view56.setUint8(4, 0xFF);
      expect(view56.getUint32(1)).assertEqual(16711935);
    });

    /**
     * @tc.name   DataView12Test057
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_5700
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer57 = new ArrayBuffer(5);
      const view57 = new DataView(buffer57);
      view57.setUint8(1, 0x00);
      view57.setUint8(2, 0xFF);
      view57.setUint8(3, 0x00);
      view57.setUint8(4, 0xFF);
      expect(view57.getUint32(1, true)).assertEqual(4278255360);
    });

    /**
     * @tc.name   DataView12Test058
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_5800
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer58 = new ArrayBuffer(4);
      const view58 = new DataView(buffer58);
      view58.setUint8(0, 0x12);
      view58.setUint8(1, 0x00);
      view58.setUint8(2, 0x34);
      view58.setUint8(3, 0x00);
      expect(view58.getUint32(0)).assertEqual(302003200);
    });

    /**
     * @tc.name   DataView12Test059
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_5900
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer59 = new ArrayBuffer(4);
      const view59 = new DataView(buffer59);
      view59.setUint8(0, 0x12);
      view59.setUint8(1, 0x00);
      view59.setUint8(2, 0x34);
      view59.setUint8(3, 0x00);
      expect(view59.getUint32(0, true)).assertEqual(3407890);
    });

    /**
     * @tc.name   DataView12Test060
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_6000
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer60 = new ArrayBuffer(9);
      const view60 = new DataView(buffer60);
      view60.setUint8(5, 0x01);
      view60.setUint8(6, 0x02);
      view60.setUint8(7, 0x03);
      view60.setUint8(8, 0x04);
      expect(view60.getUint32(5)).assertEqual(16909060);
    });

    /**
     * @tc.name   DataView12Test061
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_6100
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer61 = new ArrayBuffer(9);
      const view61 = new DataView(buffer61);
      view61.setUint8(5, 0x01);
      view61.setUint8(6, 0x02);
      view61.setUint8(7, 0x03);
      view61.setUint8(8, 0x04);
      expect(view61.getUint32(5, true)).assertEqual(67305985);
    });

    /**
     * @tc.name   DataView12Test062
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_6200
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer62 = new ArrayBuffer(4);
      const view62 = new DataView(buffer62);
      view62.setUint8(0, 0x00);
      view62.setUint8(1, 0x00);
      view62.setUint8(2, 0xFF);
      view62.setUint8(3, 0xFF);
      expect(view62.getUint32(0)).assertEqual(65535);
    });
    /**
     * @tc.name   DataView12Test063
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_6300
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer63 = new ArrayBuffer(4);
      const view63 = new DataView(buffer63);
      view63.setUint8(0, 0x00);
      view63.setUint8(1, 0x00);
      view63.setUint8(2, 0xFF);
      view63.setUint8(3, 0xFF);
      expect(view63.getUint32(0, true)).assertEqual(4294901760);
    });

    /**
     * @tc.name   DataView12Test064
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_6400
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer64 = new ArrayBuffer(4);
      const view64 = new DataView(buffer64);
      view64.setUint8(0, 0x0A);
      view64.setUint8(1, 0x0B);
      view64.setUint8(2, 0x0C);
      view64.setUint8(3, 0x0D);
      expect(view64.getUint32(0)).assertEqual(168496141);
    });

    /**
     * @tc.name   DataView12Test065
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_6500
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer65 = new ArrayBuffer(4);
      const view65 = new DataView(buffer65);
      view65.setUint8(0, 0x0A);
      view65.setUint8(1, 0x0B);
      view65.setUint8(2, 0x0C);
      view65.setUint8(3, 0x0D);
      expect(view65.getUint32(0, true)).assertEqual(218893066);
    });

    /**
     * @tc.name   DataView12Test066
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_6600
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer66 = new ArrayBuffer(7);
      const view66 = new DataView(buffer66);
      view66.setUint8(3, 0x10);
      view66.setUint8(4, 0x00);
      view66.setUint8(5, 0x00);
      view66.setUint8(6, 0x00);
      expect(view66.getUint32(3)).assertEqual(268435456);
    });

    /**
     * @tc.name   DataView12Test067
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_6700
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer67 = new ArrayBuffer(7);
      const view67 = new DataView(buffer67);
      view67.setUint8(3, 0x10);
      view67.setUint8(4, 0x00);
      view67.setUint8(5, 0x00);
      view67.setUint8(6, 0x00);
      expect(view67.getUint32(3, true)).assertEqual(16);
    });

    /**
     * @tc.name   DataView12Test068
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_6800
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer68 = new ArrayBuffer(4);
      const view68 = new DataView(buffer68);
      view68.setUint8(0, 0xF0);
      view68.setUint8(1, 0xF0);
      view68.setUint8(2, 0xF0);
      view68.setUint8(3, 0xF0);
      expect(view68.getUint32(0)).assertEqual(4042322160);
    });

    /**
     * @tc.name   DataView12Test069
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_6900
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer69 = new ArrayBuffer(4);
      const view69 = new DataView(buffer69);
      view69.setUint8(0, 0xF0);
      view69.setUint8(1, 0xF0);
      view69.setUint8(2, 0xF0);
      view69.setUint8(3, 0xF0);
      expect(view69.getUint32(0, true)).assertEqual(4042322160);
    });

    /**
     * @tc.name   DataView12Test070
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_7000
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer70 = new ArrayBuffer(6);
      const view70 = new DataView(buffer70);
      view70.setUint8(2, 0x00);
      view70.setUint8(3, 0x11);
      view70.setUint8(4, 0x22);
      view70.setUint8(5, 0x33);
      expect(view70.getUint32(2)).assertEqual(1122867);
    });

    /**
     * @tc.name   DataView12Test071
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_7100
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer71 = new ArrayBuffer(6);
      const view71 = new DataView(buffer71);
      view71.setUint8(2, 0x00);
      view71.setUint8(3, 0x11);
      view71.setUint8(4, 0x22);
      view71.setUint8(5, 0x33);
      expect(view71.getUint32(2, true)).assertEqual(857870592);
    });

    /**
     * @tc.name   DataView12Test072
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_7200
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer72 = new ArrayBuffer(4);
      const view72 = new DataView(buffer72);
      view72.setUint8(0, 0x00);
      view72.setUint8(1, 0x00);
      view72.setUint8(2, 0x00);
      view72.setUint8(3, 0x7F);
      expect(view72.getUint32(0)).assertEqual(127);
    });

    /**
     * @tc.name   DataView12Test073
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_7300
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer73 = new ArrayBuffer(4);
      const view73 = new DataView(buffer73);
      view73.setUint8(0, 0x00);
      view73.setUint8(1, 0x00);
      view73.setUint8(2, 0x00);
      view73.setUint8(3, 0x7F);
      expect(view73.getUint32(0, true)).assertEqual(2130706432);
    });

    /**
     * @tc.name   DataView12Test074
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_7400
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer74 = new ArrayBuffer(8);
      const view74 = new DataView(buffer74);
      view74.setUint8(4, 0xAB);
      view74.setUint8(5, 0xCD);
      view74.setUint8(6, 0xEF);
      view74.setUint8(7, 0x01);
      expect(view74.getUint32(4)).assertEqual(2882400001);
    });

    /**
     * @tc.name   DataView12Test075
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_7500
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer75 = new ArrayBuffer(8);
      const view75 = new DataView(buffer75);
      view75.setUint8(4, 0xAB);
      view75.setUint8(5, 0xCD);
      view75.setUint8(6, 0xEF);
      view75.setUint8(7, 0x01);
      expect(view75.getUint32(4, true)).assertEqual(32492971);
    });

    /**
     * @tc.name   DataView12Test076
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_7600
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer76 = new ArrayBuffer(4);
      const view76 = new DataView(buffer76);
      view76.setUint8(0, 0x33);
      view76.setUint8(1, 0x22);
      view76.setUint8(2, 0x11);
      view76.setUint8(3, 0x00);
      expect(view76.getUint32(0)).assertEqual(857870592);
    });

    /**
     * @tc.name   DataView12Test077
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_7700
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer77 = new ArrayBuffer(4);
      const view77 = new DataView(buffer77);
      view77.setUint8(0, 0x33);
      view77.setUint8(1, 0x22);
      view77.setUint8(2, 0x11);
      view77.setUint8(3, 0x00);
      expect(view77.getUint32(0, true)).assertEqual(1122867);
    });

    /**
     * @tc.name   DataView12Test078
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_7800
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer78 = new ArrayBuffer(5);
      const view78 = new DataView(buffer78);
      view78.setUint8(1, 0x00);
      view78.setUint8(2, 0x00);
      view78.setUint8(3, 0x01);
      view78.setUint8(4, 0xFF);
      expect(view78.getUint32(1)).assertEqual(511);
    });

    /**
     * @tc.name   DataView12Test079
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_7900
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer79 = new ArrayBuffer(5);
      const view79 = new DataView(buffer79);
      view79.setUint8(1, 0x00);
      view79.setUint8(2, 0x00);
      view79.setUint8(3, 0x01);
      view79.setUint8(4, 0xFF);
      expect(view79.getUint32(1, true)).assertEqual(4278255616);
    });

    /**
     * @tc.name   DataView12Test080
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_8000
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer80 = new ArrayBuffer(4);
      const view80 = new DataView(buffer80);
      view80.setUint8(0, 0x01);
      view80.setUint8(1, 0x00);
      view80.setUint8(2, 0x01);
      view80.setUint8(3, 0x00);
      expect(view80.getUint32(0)).assertEqual(16777472);
    });

    /**
     * @tc.name   DataView12Test081
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_8100
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer81 = new ArrayBuffer(4);
      const view81 = new DataView(buffer81);
      view81.setUint8(0, 0x01);
      view81.setUint8(1, 0x00);
      view81.setUint8(2, 0x01);
      view81.setUint8(3, 0x00);
      expect(view81.getUint32(0, true)).assertEqual(65537);
    });

    /**
     * @tc.name   DataView12Test082
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_8200
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer82 = new ArrayBuffer(10);
      const view82 = new DataView(buffer82);
      view82.setUint8(6, 0x55);
      view82.setUint8(7, 0x00);
      view82.setUint8(8, 0xAA);
      view82.setUint8(9, 0x00);
      expect(view82.getUint32(6)).assertEqual(1426106880);
    });

    /**
     * @tc.name   DataView12Test083
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_8300
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer83 = new ArrayBuffer(10);
      const view83 = new DataView(buffer83);
      view83.setUint8(6, 0x55);
      view83.setUint8(7, 0x00);
      view83.setUint8(8, 0xAA);
      view83.setUint8(9, 0x00);
      expect(view83.getUint32(6, true)).assertEqual(11141205);
    });

    /**
     * @tc.name   DataView12Test084
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_8400
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer84 = new ArrayBuffer(4);
      const view84 = new DataView(buffer84);
      view84.setUint8(0, 0xFF);
      view84.setUint8(1, 0xFF);
      view84.setUint8(2, 0x00);
      view84.setUint8(3, 0x00);
      expect(view84.getUint32(0)).assertEqual(4294901760);
    });

    /**
     * @tc.name   DataView12Test085
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_8500
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer85 = new ArrayBuffer(4);
      const view85 = new DataView(buffer85);
      view85.setUint8(0, 0xFF);
      view85.setUint8(1, 0xFF);
      view85.setUint8(2, 0x00);
      view85.setUint8(3, 0x00);
      expect(view85.getUint32(0, true)).assertEqual(65535);
    });

    /**
     * @tc.name   DataView12Test086
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_8600
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer86 = new ArrayBuffer(6);
      const view86 = new DataView(buffer86);
      view86.setUint8(2, 0x00);
      view86.setUint8(3, 0x0F);
      view86.setUint8(4, 0xF0);
      view86.setUint8(5, 0x00);
      expect(view86.getUint32(2)).assertEqual(1044480);
    });

    /**
     * @tc.name   DataView12Test087
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_8700
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer87 = new ArrayBuffer(6);
      const view87 = new DataView(buffer87);
      view87.setUint8(2, 0x00);
      view87.setUint8(3, 0x0F);
      view87.setUint8(4, 0xF0);
      view87.setUint8(5, 0x00);
      expect(view87.getUint32(2, true)).assertEqual(15732480);
    });

    /**
     * @tc.name   DataView12Test088
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_8800
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer88 = new ArrayBuffer(4);
      const view88 = new DataView(buffer88);
      view88.setUint8(0, 0x00);
      view88.setUint8(1, 0x12);
      view88.setUint8(2, 0x34);
      view88.setUint8(3, 0x56);
      expect(view88.getUint32(0)).assertEqual(1193046);
    });

    /**
     * @tc.name   DataView12Test089
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_8900
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer89 = new ArrayBuffer(4);
      const view89 = new DataView(buffer89);
      view89.setUint8(0, 0x00);
      view89.setUint8(1, 0x12);
      view89.setUint8(2, 0x34);
      view89.setUint8(3, 0x56);
      expect(view89.getUint32(0, true)).assertEqual(1446253056);
    });

    /**
     * @tc.name   DataView12Test090
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_9000
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer90 = new ArrayBuffer(9);
      const view90 = new DataView(buffer90);
      view90.setUint8(5, 0x9A);
      view90.setUint8(6, 0xBC);
      view90.setUint8(7, 0xDE);
      view90.setUint8(8, 0xF0);
      expect(view90.getUint32(5)).assertEqual(2596069104);
    });

    /**
     * @tc.name   DataView12Test091
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_9100
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer91 = new ArrayBuffer(9);
      const view91 = new DataView(buffer91);
      view91.setUint8(5, 0x9A);
      view91.setUint8(6, 0xBC);
      view91.setUint8(7, 0xDE);
      view91.setUint8(8, 0xF0);
      expect(view91.getUint32(5, true)).assertEqual(4041129114);
    });

    /**
     * @tc.name   DataView12Test092
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_9200
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer92 = new ArrayBuffer(4);
      const view92 = new DataView(buffer92);
      view92.setUint8(0, 0x01);
      view92.setUint8(1, 0x02);
      view92.setUint8(2, 0x00);
      view92.setUint8(3, 0x03);
      expect(view92.getUint32(0)).assertEqual(16908291);
    });

    /**
     * @tc.name   DataView12Test093
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_9300
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer93 = new ArrayBuffer(4);
      const view93 = new DataView(buffer93);
      view93.setUint8(0, 0x01);
      view93.setUint8(1, 0x02);
      view93.setUint8(2, 0x00);
      view93.setUint8(3, 0x03);
      expect(view93.getUint32(0, true)).assertEqual(50332161);
    });

    /**
     * @tc.name   DataView12Test094
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_9400
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer94 = new ArrayBuffer(4);
      const view94 = new DataView(buffer94);
      view94.setUint8(0, 0x22);
      view94.setUint8(1, 0x44);
      view94.setUint8(2, 0x66);
      view94.setUint8(3, 0x88);
      expect(view94.getUint32(0)).assertEqual(574908040);
    });

    /**
     * @tc.name   DataView12Test095
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_9500
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer95 = new ArrayBuffer(4);
      const view95 = new DataView(buffer95);
      view95.setUint8(0, 0x22);
      view95.setUint8(1, 0x44);
      view95.setUint8(2, 0x66);
      view95.setUint8(3, 0x88);
      expect(view95.getUint32(0, true)).assertEqual(2288403490);
    });

    /**
     * @tc.name   DataView12Test096
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_9600
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer96 = new ArrayBuffer(8);
      const view96 = new DataView(buffer96);
      view96.setUint8(4, 0x00);
      view96.setUint8(5, 0x00);
      view96.setUint8(6, 0x00);
      view96.setUint8(7, 0x80);
      expect(view96.getUint32(4)).assertEqual(128);
    });

    /**
     * @tc.name   DataView12Test097
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_9700
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer97 = new ArrayBuffer(8);
      const view97 = new DataView(buffer97);
      view97.setUint8(4, 0x00);
      view97.setUint8(5, 0x00);
      view97.setUint8(6, 0x00);
      view97.setUint8(7, 0x80);
      expect(view97.getUint32(4, true)).assertEqual(2147483648);
    });

    /**
     * @tc.name   DataView12Test098
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_9800
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer98 = new ArrayBuffer(4);
      const view98 = new DataView(buffer98);
      view98.setUint8(0, 0x11);
      view98.setUint8(1, 0x11);
      view98.setUint8(2, 0x22);
      view98.setUint8(3, 0x22);
      expect(view98.getUint32(0)).assertEqual(286335522);
    });

    /**
     * @tc.name   DataView12Test099
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_9900
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer99 = new ArrayBuffer(4);
      const view99 = new DataView(buffer99);
      view99.setUint8(0, 0x11);
      view99.setUint8(1, 0x11);
      view99.setUint8(2, 0x22);
      view99.setUint8(3, 0x22);
      expect(view99.getUint32(0, true)).assertEqual(572657937);
    });

    /**
     * @tc.name   DataView12Test100
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_10000
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer100 = new ArrayBuffer(6);
      const view100 = new DataView(buffer100);
      view100.setUint8(2, 0x33);
      view100.setUint8(3, 0x00);
      view100.setUint8(4, 0x00);
      view100.setUint8(5, 0x33);
      expect(view100.getUint32(2)).assertEqual(855638067);
    });

    /**
     * @tc.name   DataView12Test101
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_10100
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer101 = new ArrayBuffer(6);
      const view101 = new DataView(buffer101);
      view101.setUint8(2, 0x33);
      view101.setUint8(3, 0x00);
      view101.setUint8(4, 0x00);
      view101.setUint8(5, 0x33);
      expect(view101.getUint32(2, true)).assertEqual(855638067);
    });

    /**
     * @tc.name   DataView12Test102
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_10200
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer102 = new ArrayBuffer(4);
      const view102 = new DataView(buffer102);
      view102.setUint8(0, 0x00);
      view102.setUint8(1, 0x00);
      view102.setUint8(2, 0x80);
      view102.setUint8(3, 0x00);
      expect(view102.getUint32(0)).assertEqual(32768);
    });

    /**
     * @tc.name   DataView12Test103
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_10300
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer103 = new ArrayBuffer(4);
      const view103 = new DataView(buffer103);
      view103.setUint8(0, 0x00);
      view103.setUint8(1, 0x00);
      view103.setUint8(2, 0x80);
      view103.setUint8(3, 0x00);
      expect(view103.getUint32(0, true)).assertEqual(8388608);
    });

    /**
     * @tc.name   DataView12Test104
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_10400
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer104 = new ArrayBuffer(11);
      const view104 = new DataView(buffer104);
      view104.setUint8(7, 0xAB);
      view104.setUint8(8, 0x00);
      view104.setUint8(9, 0x00);
      view104.setUint8(10, 0xCD);
      expect(view104.getUint32(7)).assertEqual(2868904141);
    });

    /**
     * @tc.name   DataView12Test105
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_10500
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer105 = new ArrayBuffer(11);
      const view105 = new DataView(buffer105);
      view105.setUint8(7, 0xAB);
      view105.setUint8(8, 0x00);
      view105.setUint8(9, 0x00);
      view105.setUint8(10, 0xCD);
      expect(view105.getUint32(7, true)).assertEqual(3439329451);
    });

    /**
     * @tc.name   DataView12Test106
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_10600
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer106 = new ArrayBuffer(4);
      const view106 = new DataView(buffer106);
      view106.setUint8(0, 0x44);
      view106.setUint8(1, 0x33);
      view106.setUint8(2, 0x22);
      view106.setUint8(3, 0x11);
      expect(view106.getUint32(0)).assertEqual(1144201745);
    });

    /**
     * @tc.name   DataView12Test107
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_10700
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer107 = new ArrayBuffer(4);
      const view107 = new DataView(buffer107);
      view107.setUint8(0, 0x44);
      view107.setUint8(1, 0x33);
      view107.setUint8(2, 0x22);
      view107.setUint8(3, 0x11);
      expect(view107.getUint32(0, true)).assertEqual(287454020);
    });

    /**
     * @tc.name   DataView12Test108
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_10800
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer108 = new ArrayBuffer(5);
      const view108 = new DataView(buffer108);
      view108.setUint8(1, 0x00);
      view108.setUint8(2, 0x55);
      view108.setUint8(3, 0xAA);
      view108.setUint8(4, 0x00);
      expect(view108.getUint32(1)).assertEqual(5614080);
    });

    /**
     * @tc.name   DataView12Test109
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_10900
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer109 = new ArrayBuffer(5);
      const view109 = new DataView(buffer109);
      view109.setUint8(1, 0x00);
      view109.setUint8(2, 0x55);
      view109.setUint8(3, 0xAA);
      view109.setUint8(4, 0x00);
      expect(view109.getUint32(1, true)).assertEqual(11162880);
    });

    /**
     * @tc.name   DataView12Test110
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_11000
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer110 = new ArrayBuffer(4);
      const view110 = new DataView(buffer110);
      view110.setUint8(0, 0x00);
      view110.setUint8(1, 0x01);
      view110.setUint8(2, 0x80);
      view110.setUint8(3, 0x00);
      expect(view110.getUint32(0)).assertEqual(98304);
    });

    /**
     * @tc.name   DataView12Test111
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_11100
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer111 = new ArrayBuffer(4);
      const view111 = new DataView(buffer111);
      view111.setUint8(0, 0x00);
      view111.setUint8(1, 0x01);
      view111.setUint8(2, 0x80);
      view111.setUint8(3, 0x00);
      expect(view111.getUint32(0, true)).assertEqual(8388864);
    });

    /**
     * @tc.name   DataView12Test112
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_11200
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer112 = new ArrayBuffer(7);
      const view112 = new DataView(buffer112);
      view112.setUint8(3, 0x0F);
      view112.setUint8(4, 0x00);
      view112.setUint8(5, 0x00);
      view112.setUint8(6, 0xF0);
      expect(view112.getUint32(3)).assertEqual(251658480);
    });

    /**
     * @tc.name   DataView12Test113
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_11300
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer113 = new ArrayBuffer(7);
      const view113 = new DataView(buffer113);
      view113.setUint8(3, 0x0F);
      view113.setUint8(4, 0x00);
      view113.setUint8(5, 0x00);
      view113.setUint8(6, 0xF0);
      expect(view113.getUint32(3, true)).assertEqual(4026531855);
    });

    /**
     * @tc.name   DataView12Test114
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_11400
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer114 = new ArrayBuffer(4);
      const view114 = new DataView(buffer114);
      view114.setUint8(0, 0xFF);
      view114.setUint8(1, 0x00);
      view114.setUint8(2, 0xFF);
      view114.setUint8(3, 0x00);
      expect(view114.getUint32(0)).assertEqual(4278255360);
    });

    /**
     * @tc.name   DataView12Test115
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_11500
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer115 = new ArrayBuffer(4);
      const view115 = new DataView(buffer115);
      view115.setUint8(0, 0xFF);
      view115.setUint8(1, 0x00);
      view115.setUint8(2, 0xFF);
      view115.setUint8(3, 0x00);
      expect(view115.getUint32(0, true)).assertEqual(16711935);
    });

    /**
     * @tc.name   DataView12Test116
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_11600
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer116 = new ArrayBuffer(6);
      const view116 = new DataView(buffer116);
      view116.setUint8(2, 0x12);
      view116.setUint8(3, 0x34);
      view116.setUint8(4, 0x00);
      view116.setUint8(5, 0x56);
      expect(view116.getUint32(2)).assertEqual(305397846);
    });

    /**
     * @tc.name   DataView12Test117
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_11700
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer117 = new ArrayBuffer(6);
      const view117 = new DataView(buffer117);
      view117.setUint8(2, 0x12);
      view117.setUint8(3, 0x34);
      view117.setUint8(4, 0x00);
      view117.setUint8(5, 0x56);
      expect(view117.getUint32(2, true)).assertEqual(1442853906);
    });

    /**
     * @tc.name   DataView12Test118
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_11800
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer118 = new ArrayBuffer(4);
      const view118 = new DataView(buffer118);
      view118.setUint8(0, 0x00);
      view118.setUint8(1, 0x80);
      view118.setUint8(2, 0x00);
      view118.setUint8(3, 0x00);
      expect(view118.getUint32(0)).assertEqual(8388608);
    });

    /**
     * @tc.name   DataView12Test119
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_11900
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer119 = new ArrayBuffer(4);
      const view119 = new DataView(buffer119);
      view119.setUint8(0, 0x00);
      view119.setUint8(1, 0x80);
      view119.setUint8(2, 0x00);
      view119.setUint8(3, 0x00);
      expect(view119.getUint32(0, true)).assertEqual(32768);
    });

    /**
     * @tc.name   DataView12Test120
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_12000
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer120 = new ArrayBuffer(9);
      const view120 = new DataView(buffer120);
      view120.setUint8(5, 0x00);
      view120.setUint8(6, 0x01);
      view120.setUint8(7, 0x02);
      view120.setUint8(8, 0x03);
      expect(view120.getUint32(5)).assertEqual(66051);
    });

    /**
     * @tc.name   DataView12Test121
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_12100
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer121 = new ArrayBuffer(9);
      const view121 = new DataView(buffer121);
      view121.setUint8(5, 0x00);
      view121.setUint8(6, 0x01);
      view121.setUint8(7, 0x02);
      view121.setUint8(8, 0x03);
      expect(view121.getUint32(5, true)).assertEqual(50462976);
    });

    /**
     * @tc.name   DataView12Test122
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_12200
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer122 = new ArrayBuffer(4);
      const view122 = new DataView(buffer122);
      view122.setUint8(0, 0x03);
      view122.setUint8(1, 0x02);
      view122.setUint8(2, 0x01);
      view122.setUint8(3, 0x00);
      expect(view122.getUint32(0)).assertEqual(50462976);
    });

    /**
     * @tc.name   DataView12Test123
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_12300
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer123 = new ArrayBuffer(4);
      const view123 = new DataView(buffer123);
      view123.setUint8(0, 0x03);
      view123.setUint8(1, 0x02);
      view123.setUint8(2, 0x01);
      view123.setUint8(3, 0x00);
      expect(view123.getUint32(0, true)).assertEqual(66051);
    });

    /**
     * @tc.name   DataView12Test124
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_12400
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer124 = new ArrayBuffer(4);
      const view124 = new DataView(buffer124);
      view124.setUint8(0, 0x77);
      view124.setUint8(1, 0x66);
      view124.setUint8(2, 0x55);
      view124.setUint8(3, 0x44);
      expect(view124.getUint32(0)).assertEqual(2003195204);
    });

    /**
     * @tc.name   DataView12Test125
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_12500
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer125 = new ArrayBuffer(4);
      const view125 = new DataView(buffer125);
      view125.setUint8(0, 0x77);
      view125.setUint8(1, 0x66);
      view125.setUint8(2, 0x55);
      view125.setUint8(3, 0x44);
      expect(view125.getUint32(0, true)).assertEqual(1146447479);
    });

    /**
     * @tc.name   DataView12Test126
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_12600
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer126 = new ArrayBuffer(10);
      const view126 = new DataView(buffer126);
      view126.setUint8(6, 0x00);
      view126.setUint8(7, 0x00);
      view126.setUint8(8, 0x80);
      view126.setUint8(9, 0xFF);
      expect(view126.getUint32(6)).assertEqual(33023);
    });

    /**
     * @tc.name   DataView12Test127
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_12700
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer127 = new ArrayBuffer(10);
      const view127 = new DataView(buffer127);
      view127.setUint8(6, 0x00);
      view127.setUint8(7, 0x00);
      view127.setUint8(8, 0x80);
      view127.setUint8(9, 0xFF);
      expect(view127.getUint32(6, true)).assertEqual(4286578688);
    });

    /**
     * @tc.name   DataView12Test128
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_12800
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer128 = new ArrayBuffer(4);
      const view128 = new DataView(buffer128);
      view128.setUint8(0, 0x1A);
      view128.setUint8(1, 0x00);
      view128.setUint8(2, 0x00);
      view128.setUint8(3, 0x1A);
      expect(view128.getUint32(0)).assertEqual(436207642);
    });

    /**
     * @tc.name   DataView12Test129
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_12900
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer129 = new ArrayBuffer(4);
      const view129 = new DataView(buffer129);
      view129.setUint8(0, 0x1A);
      view129.setUint8(1, 0x00);
      view129.setUint8(2, 0x00);
      view129.setUint8(3, 0x1A);
      expect(view129.getUint32(0, true)).assertEqual(436207642);
    });

    /**
     * @tc.name   DataView12Test130
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_13000
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer130 = new ArrayBuffer(7);
      const view130 = new DataView(buffer130);
      view130.setUint8(3, 0x22);
      view130.setUint8(4, 0x33);
      view130.setUint8(5, 0x44);
      view130.setUint8(6, 0x55);
      expect(view130.getUint32(3)).assertEqual(573785173);
    });

    /**
     * @tc.name   DataView12Test131
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_13100
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer131 = new ArrayBuffer(7);
      const view131 = new DataView(buffer131);
      view131.setUint8(3, 0x22);
      view131.setUint8(4, 0x33);
      view131.setUint8(5, 0x44);
      view131.setUint8(6, 0x55);
      expect(view131.getUint32(3, true)).assertEqual(1430532898);
    });

    /**
     * @tc.name   DataView12Test132
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_13200
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer132 = new ArrayBuffer(4);
      const view132 = new DataView(buffer132);
      view132.setUint8(0, 0x00);
      view132.setUint8(1, 0x00);
      view132.setUint8(2, 0x01);
      view132.setUint8(3, 0x80);
      expect(view132.getUint32(0)).assertEqual(384);
    });

    /**
     * @tc.name   DataView12Test133
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_13300
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer133 = new ArrayBuffer(4);
      const view133 = new DataView(buffer133);
      view133.setUint8(0, 0x00);
      view133.setUint8(1, 0x00);
      view133.setUint8(2, 0x01);
      view133.setUint8(3, 0x80);
      expect(view133.getUint32(0, true)).assertEqual(2147549184);
    });

    /**
     * @tc.name   DataView12Test134
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_13400
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer134 = new ArrayBuffer(8);
      const view134 = new DataView(buffer134);
      view134.setUint8(4, 0xBC);
      view134.setUint8(5, 0xDE);
      view134.setUint8(6, 0xF0);
      view134.setUint8(7, 0x12);
      expect(view134.getUint32(4)).assertEqual(3168727058);
    });

    /**
     * @tc.name   DataView12Test135
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_13500
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer135 = new ArrayBuffer(8);
      const view135 = new DataView(buffer135);
      view135.setUint8(4, 0xBC);
      view135.setUint8(5, 0xDE);
      view135.setUint8(6, 0xF0);
      view135.setUint8(7, 0x12);
      expect(view135.getUint32(4, true)).assertEqual(317775548);
    });

    /**
     * @tc.name   DataView12Test136
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_13600
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer136 = new ArrayBuffer(4);
      const view136 = new DataView(buffer136);
      view136.setUint8(0, 0x66);
      view136.setUint8(1, 0x55);
      view136.setUint8(2, 0x44);
      view136.setUint8(3, 0x33);
      expect(view136.getUint32(0)).assertEqual(1716864051);
    });

    /**
     * @tc.name   DataView12Test137
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_13700
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer137 = new ArrayBuffer(4);
      const view137 = new DataView(buffer137);
      view137.setUint8(0, 0x66);
      view137.setUint8(1, 0x55);
      view137.setUint8(2, 0x44);
      view137.setUint8(3, 0x33);
      expect(view137.getUint32(0, true)).assertEqual(860116326);
    });

    /**
     * @tc.name   DataView12Test138
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_13800
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer138 = new ArrayBuffer(6);
      const view138 = new DataView(buffer138);
      view138.setUint8(2, 0x00);
      view138.setUint8(3, 0x9A);
      view138.setUint8(4, 0xBC);
      view138.setUint8(5, 0x00);
      expect(view138.getUint32(2)).assertEqual(10140672);
    });

    /**
     * @tc.name   DataView12Test139
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_13900
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer139 = new ArrayBuffer(6);
      const view139 = new DataView(buffer139);
      view139.setUint8(2, 0x00);
      view139.setUint8(3, 0x9A);
      view139.setUint8(4, 0xBC);
      view139.setUint8(5, 0x00);
      expect(view139.getUint32(2, true)).assertEqual(12360192);
    });

    /**
     * @tc.name   DataView12Test140
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_14000
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer140 = new ArrayBuffer(4);
      const view140 = new DataView(buffer140);
      view140.setUint8(0, 0x02);
      view140.setUint8(1, 0x00);
      view140.setUint8(2, 0x00);
      view140.setUint8(3, 0x02);
      expect(view140.getUint32(0)).assertEqual(33554434);
    });

    /**
     * @tc.name   DataView12Test141
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_14100
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer141 = new ArrayBuffer(4);
      const view141 = new DataView(buffer141);
      view141.setUint8(0, 0x02);
      view141.setUint8(1, 0x00);
      view141.setUint8(2, 0x00);
      view141.setUint8(3, 0x02);
      expect(view141.getUint32(0, true)).assertEqual(33554434);
    });

    /**
     * @tc.name   DataView12Test142
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_14200
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer142 = new ArrayBuffer(11);
      const view142 = new DataView(buffer142);
      view142.setUint8(7, 0x33);
      view142.setUint8(8, 0x44);
      view142.setUint8(9, 0x55);
      view142.setUint8(10, 0x66);
      expect(view142.getUint32(7)).assertEqual(860116326);
    });

    /**
     * @tc.name   DataView12Test143
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_14300
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer143 = new ArrayBuffer(11);
      const view143 = new DataView(buffer143);
      view143.setUint8(7, 0x33);
      view143.setUint8(8, 0x44);
      view143.setUint8(9, 0x55);
      view143.setUint8(10, 0x66);
      expect(view143.getUint32(7, true)).assertEqual(1716864051);
    });

    /**
     * @tc.name   DataView12Test144
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_14400
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer144 = new ArrayBuffer(4);
      const view144 = new DataView(buffer144);
      view144.setUint8(0, 0x00);
      view144.setUint8(1, 0xFF);
      view144.setUint8(2, 0xFF);
      view144.setUint8(3, 0x00);
      expect(view144.getUint32(0)).assertEqual(16776960);
    });

    /**
     * @tc.name   DataView12Test145
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_14500
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer145 = new ArrayBuffer(4);
      const view145 = new DataView(buffer145);
      view145.setUint8(0, 0x00);
      view145.setUint8(1, 0xFF);
      view145.setUint8(2, 0xFF);
      view145.setUint8(3, 0x00);
      expect(view145.getUint32(0, true)).assertEqual(16776960);
    });

    /**
     * @tc.name   DataView12Test146
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_14600
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer146 = new ArrayBuffer(5);
      const view146 = new DataView(buffer146);
      view146.setUint8(1, 0x55);
      view146.setUint8(2, 0x00);
      view146.setUint8(3, 0xAA);
      view146.setUint8(4, 0xFF);
      expect(view146.getUint32(1)).assertEqual(1426107135);
    });

    /**
     * @tc.name   DataView12Test147
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_14700
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer147 = new ArrayBuffer(5);
      const view147 = new DataView(buffer147);
      view147.setUint8(1, 0x55);
      view147.setUint8(2, 0x00);
      view147.setUint8(3, 0xAA);
      view147.setUint8(4, 0xFF);
      expect(view147.getUint32(1, true)).assertEqual(4289331285);
    });

    /**
     * @tc.name   DataView12Test148
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_14800
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer148 = new ArrayBuffer(4);
      const view148 = new DataView(buffer148);
      view148.setUint8(0, 0x00);
      view148.setUint8(1, 0x03);
      view148.setUint8(2, 0x00);
      view148.setUint8(3, 0x03);
      expect(view148.getUint32(0)).assertEqual(196611);
    });

    /**
     * @tc.name   DataView12Test149
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_14900
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer149 = new ArrayBuffer(4);
      const view149 = new DataView(buffer149);
      view149.setUint8(0, 0x00);
      view149.setUint8(1, 0x03);
      view149.setUint8(2, 0x00);
      view149.setUint8(3, 0x03);
      expect(view149.getUint32(0, true)).assertEqual(50332416);
    });

    /**
     * @tc.name   DataView12Test150
     * @tc.number SUB_BUILTINS_DATAVIEW12_TEST_15000
     * @tc.desc   test DataView getUint32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView12Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer150 = new ArrayBuffer(9);
      const view150 = new DataView(buffer150);
      view150.setUint8(5, 0x77);
      view150.setUint8(6, 0x00);
      view150.setUint8(7, 0x88);
      view150.setUint8(8, 0x00);
      expect(view150.getUint32(5)).assertEqual(1996523520);
    });

  })
}