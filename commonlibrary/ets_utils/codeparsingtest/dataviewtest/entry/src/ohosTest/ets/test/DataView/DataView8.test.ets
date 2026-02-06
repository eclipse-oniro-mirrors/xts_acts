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

export default function DataView8Test() {
  describe('DataView8Test', () => {
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
     * @tc.name   DataView8Test001
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_0100
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(2);
      const view1 = new DataView(buffer1);
      view1.setUint8(0, 0x00);
      view1.setUint8(1, 0x01);
      expect(view1.getInt16(0)).assertEqual(1);

    });

    /**
     * @tc.name   DataView8Test002
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_0200
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer2 = new ArrayBuffer(2);
      const view2 = new DataView(buffer2);
      view2.setUint8(0, 0x00);
      view2.setUint8(1, 0x01);
      expect(view2.getInt16(0, true)).assertEqual(256);
    });

    /**
     * @tc.name   DataView8Test003
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_0300
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer3 = new ArrayBuffer(2);
      const view3 = new DataView(buffer3);
      view3.setUint8(0, 0xFF);
      view3.setUint8(1, 0xFF);
      expect(view3.getInt16(0)).assertEqual(-1);
    });

    /**
     * @tc.name   DataView8Test004
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_0400
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer4 = new ArrayBuffer(2);
      const view4 = new DataView(buffer4);
      view4.setUint8(0, 0x00);
      view4.setUint8(1, 0x02);
      expect(view4.getInt16(0)).assertEqual(2);
    });

    /**
     * @tc.name   DataView8Test005
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_0500
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer5 = new ArrayBuffer(2);
      const view5 = new DataView(buffer5);
      view5.setUint8(0, 0x7F);
      view5.setUint8(1, 0xFF);
      expect(view5.getInt16(0)).assertEqual(32767);
    });

    /**
     * @tc.name   DataView8Test006
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_0600
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer6 = new ArrayBuffer(2);
      const view6 = new DataView(buffer6);
      view6.setUint8(0, 0x80);
      view6.setUint8(1, 0x00);
      expect(view6.getInt16(0)).assertEqual(-32768);
    });

    /**
     * @tc.name   DataView8Test007
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_0700
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer7 = new ArrayBuffer(2);
      const view7 = new DataView(buffer7);
      view7.setUint8(0, 0xFF);
      view7.setUint8(1, 0xFE);
      expect(view7.getInt16(0)).assertEqual(-2);
    });

    /**
     * @tc.name   DataView8Test008
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_0800
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer8 = new ArrayBuffer(2);
      const view8 = new DataView(buffer8);
      view8.setUint8(0, 0x00);
      view8.setUint8(1, 0x64);
      expect(view8.getInt16(0)).assertEqual(100);
    });

    /**
     * @tc.name   DataView8Test009
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_0900
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer9 = new ArrayBuffer(2);
      const view9 = new DataView(buffer9);
      view9.setUint8(0, 0xFF);
      view9.setUint8(1, 0x9C);
      expect(view9.getInt16(0)).assertEqual(-100);
    });

    /**
     * @tc.name   DataView8Test010
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_1000
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer10 = new ArrayBuffer(3);
      const view10 = new DataView(buffer10);
      view10.setUint8(1, 0x00);
      view10.setUint8(2, 0x03);
      expect(view10.getInt16(1)).assertEqual(3);

    });

    /**
     * @tc.name   DataView8Test011
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_1100
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer11 = new ArrayBuffer(2);
      const view11 = new DataView(buffer11);
      view11.setUint8(0, 0x07);
      view11.setUint8(1, 0xD0);
      expect(view11.getInt16(0)).assertEqual(2000);
    });

    /**
     * @tc.name   DataView8Test012
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_1200
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer12 = new ArrayBuffer(2);
      const view12 = new DataView(buffer12);
      view12.setUint8(0, 0xF8);
      view12.setUint8(1, 0x30);
      expect(view12.getInt16(0)).assertEqual(-2000);
    });

    /**
     * @tc.name   DataView8Test013
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_1300
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer13 = new ArrayBuffer(2);
      const view13 = new DataView(buffer13);
      view13.setUint8(0, 0x02);
      view13.setUint8(1, 0x00);
      expect(view13.getInt16(0, true)).assertEqual(2);
    });

    /**
     * @tc.name   DataView8Test014
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_1400
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer14 = new ArrayBuffer(2);
      const view14 = new DataView(buffer14);
      view14.setUint8(0, 0xFF);
      view14.setUint8(1, 0x7F);
      expect(view14.getInt16(0, true)).assertEqual(32767);
    });

    /**
     * @tc.name   DataView8Test015
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_1500
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer15 = new ArrayBuffer(2);
      const view15 = new DataView(buffer15);
      view15.setUint8(0, 0x00);
      view15.setUint8(1, 0x80);
      expect(view15.getInt16(0, true)).assertEqual(-32768);
    });

    /**
     * @tc.name   DataView8Test016
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_1600
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer16 = new ArrayBuffer(2);
      const view16 = new DataView(buffer16);
      view16.setUint8(0, 0xFE);
      view16.setUint8(1, 0xFF);
      expect(view16.getInt16(0, true)).assertEqual(-2);
    });

    /**
     * @tc.name   DataView8Test017
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_1700
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer17 = new ArrayBuffer(2);
      const view17 = new DataView(buffer17);
      view17.setUint8(0, 0x64);
      view17.setUint8(1, 0x00);
      expect(view17.getInt16(0, true)).assertEqual(100);
    });

    /**
     * @tc.name   DataView8Test018
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_1800
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer18 = new ArrayBuffer(2);
      const view18 = new DataView(buffer18);
      view18.setUint8(0, 0x9C);
      view18.setUint8(1, 0xFF);
      expect(view18.getInt16(0, true)).assertEqual(-100);
    });

    /**
     * @tc.name   DataView8Test019
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_1900
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer19 = new ArrayBuffer(3);
      const view19 = new DataView(buffer19);
      view19.setUint8(1, 0x03);
      view19.setUint8(2, 0x00);
      expect(view19.getInt16(1, true)).assertEqual(3);
    });

    /**
     * @tc.name   DataView8Test020
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_2000
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer20 = new ArrayBuffer(2);
      const view20 = new DataView(buffer20);
      view20.setUint8(0, 0xD0);
      view20.setUint8(1, 0x07);
      expect(view20.getInt16(0, true)).assertEqual(2000);
    });

    /**
     * @tc.name   DataView8Test021
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_2100
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer21 = new ArrayBuffer(2);
      const view21 = new DataView(buffer21);
      view21.setUint8(0, 0x30);
      view21.setUint8(1, 0xF8);
      expect(view21.getInt16(0, true)).assertEqual(-2000);
    });

    /**
     * @tc.name   DataView8Test022
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_2200
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer22 = new ArrayBuffer(2);
      const view22 = new DataView(buffer22);
      view22.setUint8(0, 0x00);
      view22.setUint8(1, 0x0F);
      expect(view22.getInt16(0)).assertEqual(15);

    });

    /**
     * @tc.name   DataView8Test023
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_2300
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer23 = new ArrayBuffer(2);
      const view23 = new DataView(buffer23);
      view23.setUint8(0, 0x0F);
      view23.setUint8(1, 0x00);
      expect(view23.getInt16(0)).assertEqual(3840);
    });

    /**
     * @tc.name   DataView8Test024
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_2400
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer24 = new ArrayBuffer(2);
      const view24 = new DataView(buffer24);
      view24.setUint8(0, 0x0F);
      view24.setUint8(1, 0x00);
      expect(view24.getInt16(0, true)).assertEqual(15);
    });

    /**
     * @tc.name   DataView8Test025
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_2500
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer25 = new ArrayBuffer(2);
      const view25 = new DataView(buffer25);
      view25.setUint8(0, 0x00);
      view25.setUint8(1, 0x0F);
      expect(view25.getInt16(0, true)).assertEqual(3840);

    });

    /**
     * @tc.name   DataView8Test026
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_2600
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer26 = new ArrayBuffer(2);
      const view26 = new DataView(buffer26);
      view26.setUint8(0, 0x80);
      view26.setUint8(1, 0x01);
      expect(view26.getInt16(0)).assertEqual(-32767);
    });

    /**
     * @tc.name   DataView8Test027
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_2700
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer27 = new ArrayBuffer(2);
      const view27 = new DataView(buffer27);
      view27.setUint8(0, 0x01);
      view27.setUint8(1, 0x80);
      expect(view27.getInt16(0, true)).assertEqual(-32767);
    });

    /**
     * @tc.name   DataView8Test028
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_2800
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer28 = new ArrayBuffer(4);
      const view28 = new DataView(buffer28);
      view28.setUint8(2, 0x00);
      view28.setUint8(3, 0x04);
      expect(view28.getInt16(2)).assertEqual(4);
    });

    /**
     * @tc.name   DataView8Test029
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_2900
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer29 = new ArrayBuffer(4);
      const view29 = new DataView(buffer29);
      view29.setUint8(2, 0x04);
      view29.setUint8(3, 0x00);
      expect(view29.getInt16(2, true)).assertEqual(4);
    });

    /**
     * @tc.name   DataView8Test030
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_3000
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer30 = new ArrayBuffer(2);
      const view30 = new DataView(buffer30);
      view30.setUint8(0, 0x30);
      view30.setUint8(1, 0x39);
      expect(view30.getInt16(0)).assertEqual(12345);
    });

    /**
     * @tc.name   DataView8Test031
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_3100
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer31 = new ArrayBuffer(2);
      const view31 = new DataView(buffer31);
      view31.setUint8(0, 0x39);
      view31.setUint8(1, 0x30);
      expect(view31.getInt16(0, true)).assertEqual(12345);
    });

    /**
     * @tc.name   DataView8Test032
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_3200
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer32 = new ArrayBuffer(2);
      const view32 = new DataView(buffer32);
      view32.setUint8(0, 0xCF);
      view32.setUint8(1, 0xC7);
      expect(view32.getInt16(0)).assertEqual(-12345);
    });

    /**
     * @tc.name   DataView8Test033
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_3300
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer33 = new ArrayBuffer(2);
      const view33 = new DataView(buffer33);
      view33.setUint8(0, 0xC7);
      view33.setUint8(1, 0xCF);
      expect(view33.getInt16(0, true)).assertEqual(-12345);
    });

    /**
     * @tc.name   DataView8Test034
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_3400
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer34 = new ArrayBuffer(2);
      const view34 = new DataView(buffer34);
      view34.setUint8(0, 0x01);
      view34.setUint8(1, 0xF4);
      expect(view34.getInt16(0)).assertEqual(500);
    });

    /**
     * @tc.name   DataView8Test035
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_3500
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer35 = new ArrayBuffer(2);
      const view35 = new DataView(buffer35);
      view35.setUint8(0, 0xF4);
      view35.setUint8(1, 0x01);
      expect(view35.getInt16(0, true)).assertEqual(500);
    });

    /**
     * @tc.name   DataView8Test036
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_3600
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer36 = new ArrayBuffer(2);
      const view36 = new DataView(buffer36);
      view36.setUint8(0, 0xFE);
      view36.setUint8(1, 0x0C);
      expect(view36.getInt16(0)).assertEqual(-500);
    });

    /**
     * @tc.name   DataView8Test037
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_3700
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer37 = new ArrayBuffer(2);
      const view37 = new DataView(buffer37);
      view37.setUint8(0, 0x0C);
      view37.setUint8(1, 0xFE);
      expect(view37.getInt16(0, true)).assertEqual(-500);
    });

    /**
     * @tc.name   DataView8Test038
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_3800
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer38 = new ArrayBuffer(2);
      const view38 = new DataView(buffer38);
      view38.setUint8(0, 0x27);
      view38.setUint8(1, 0x10);
      expect(view38.getInt16(0)).assertEqual(10000);
    });

    /**
     * @tc.name   DataView8Test039
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_3900
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer39 = new ArrayBuffer(2);
      const view39 = new DataView(buffer39);
      view39.setUint8(0, 0x10);
      view39.setUint8(1, 0x27);
      expect(view39.getInt16(0, true)).assertEqual(10000);
    });

    /**
     * @tc.name   DataView8Test040
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_4000
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer40 = new ArrayBuffer(2);
      const view40 = new DataView(buffer40);
      view40.setUint8(0, 0xD8);
      view40.setUint8(1, 0xF0);
      expect(view40.getInt16(0)).assertEqual(-10000);
    });

    /**
     * @tc.name   DataView8Test041
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_4100
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer41 = new ArrayBuffer(2);
      const view41 = new DataView(buffer41);
      view41.setUint8(0, 0xF0);
      view41.setUint8(1, 0xD8);
      expect(view41.getInt16(0, true)).assertEqual(-10000);
    });

    /**
     * @tc.name   DataView8Test042
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_4200
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer42 = new ArrayBuffer(4);
      const view42 = new DataView(buffer42);
      view42.setUint8(1, 0x00);
      view42.setUint8(2, 0x7B);
      expect(view42.getInt16(1)).assertEqual(123);
    });

    /**
     * @tc.name   DataView8Test043
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_4300
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer43 = new ArrayBuffer(4);
      const view43 = new DataView(buffer43);
      view43.setUint8(1, 0x7B);
      view43.setUint8(2, 0x00);
      expect(view43.getInt16(1, true)).assertEqual(123);
    });

    /**
     * @tc.name   DataView8Test044
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_4400
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer44 = new ArrayBuffer(2);
      const view44 = new DataView(buffer44);
      view44.setUint8(0, 0x7F);
      view44.setUint8(1, 0xFE);
      expect(view44.getInt16(0)).assertEqual(32766);
    });

    /**
     * @tc.name   DataView8Test045
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_4500
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer45 = new ArrayBuffer(2);
      const view45 = new DataView(buffer45);
      view45.setUint8(0, 0xFE);
      view45.setUint8(1, 0x7F);
      expect(view45.getInt16(0, true)).assertEqual(32766);
    });

    /**
     * @tc.name   DataView8Test046
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_4600
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer46 = new ArrayBuffer(2);
      const view46 = new DataView(buffer46);
      view46.setUint8(0, 0x80);
      view46.setUint8(1, 0x01);
      expect(view46.getInt16(0)).assertEqual(-32767);
    });

    /**
     * @tc.name   DataView8Test047
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_4700
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer47 = new ArrayBuffer(2);
      const view47 = new DataView(buffer47);
      view47.setUint8(0, 0x01);
      view47.setUint8(1, 0x80);
      expect(view47.getInt16(0, true)).assertEqual(-32767);
    });

    /**
     * @tc.name   DataView8Test048
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_4800
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer48 = new ArrayBuffer(2);
      const view48 = new DataView(buffer48);
      view48.setUint8(0, 0xFF);
      view48.setUint8(1, 0xFF);
      expect(view48.getInt16(0)).assertEqual(-1);
    });

    /**
     * @tc.name   DataView8Test049
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_4900
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer49 = new ArrayBuffer(2);
      const view49 = new DataView(buffer49);
      view49.setUint8(0, 0xFF);
      view49.setUint8(1, 0xFF);
      expect(view49.getInt16(0, true)).assertEqual(-1);
    });

    /**
     * @tc.name   DataView8Test050
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_5000
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer50 = new ArrayBuffer(2);
      const view50 = new DataView(buffer50);
      view50.setUint8(0, 0x20);
      view50.setUint8(1, 0x00);
      expect(view50.getInt16(0)).assertEqual(8192);
    });

    /**
     * @tc.name   DataView8Test051
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_5100
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer51 = new ArrayBuffer(2);
      const view51 = new DataView(buffer51);
      view51.setUint8(0, 0x00);
      view51.setUint8(1, 0x20);
      expect(view51.getInt16(0, true)).assertEqual(8192);
    });

    /**
     * @tc.name   DataView8Test052
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_5200
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer52 = new ArrayBuffer(2);
      const view52 = new DataView(buffer52);
      view52.setUint8(0, 0xE0);
      view52.setUint8(1, 0x00);
      expect(view52.getInt16(0)).assertEqual(-8192);
    });

    /**
     * @tc.name   DataView8Test053
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_5300
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer53 = new ArrayBuffer(2);
      const view53 = new DataView(buffer53);
      view53.setUint8(0, 0x00);
      view53.setUint8(1, 0xE0);
      expect(view53.getInt16(0, true)).assertEqual(-8192);
    });

    /**
     * @tc.name   DataView8Test054
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_5400
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer54 = new ArrayBuffer(5);
      const view54 = new DataView(buffer54);
      view54.setUint8(2, 0xFE);
      view54.setUint8(3, 0x38);
      expect(view54.getInt16(2)).assertEqual(-456);
    });

    /**
     * @tc.name   DataView8Test055
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_5500
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer55 = new ArrayBuffer(5);
      const view55 = new DataView(buffer55);
      view55.setUint8(2, 0x38);
      view55.setUint8(3, 0xFE);
      expect(view55.getInt16(2, true)).assertEqual(-456);
    });

    /**
     * @tc.name   DataView8Test056
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_5600
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer56 = new ArrayBuffer(2);
      const view56 = new DataView(buffer56);
      view56.setUint8(0, 0x04);
      view56.setUint8(1, 0xD2);
      expect(view56.getInt16(0)).assertEqual(1234);
    });

    /**
     * @tc.name   DataView8Test057
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_5700
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer57 = new ArrayBuffer(2);
      const view57 = new DataView(buffer57);
      view57.setUint8(0, 0xD2);
      view57.setUint8(1, 0x04);
      expect(view57.getInt16(0, true)).assertEqual(1234);
    });

    /**
     * @tc.name   DataView8Test058
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_5800
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer58 = new ArrayBuffer(2);
      const view58 = new DataView(buffer58);
      view58.setUint8(0, 0xFB);
      view58.setUint8(1, 0x2E);
      expect(view58.getInt16(0)).assertEqual(-1234);
    });

    /**
     * @tc.name   DataView8Test059
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_5900
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer59 = new ArrayBuffer(2);
      const view59 = new DataView(buffer59);
      view59.setUint8(0, 0x2E);
      view59.setUint8(1, 0xFB);
      expect(view59.getInt16(0, true)).assertEqual(-1234);
    });

    /**
     * @tc.name   DataView8Test060
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_6000
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer60 = new ArrayBuffer(2);
      const view60 = new DataView(buffer60);
      view60.setUint8(0, 0xFF);
      view60.setUint8(1, 0xFE);
      expect(view60.getInt16(0)).assertEqual(-2);
    });

    /**
     * @tc.name   DataView8Test061
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_6100
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer61 = new ArrayBuffer(2);
      const view61 = new DataView(buffer61);
      view61.setUint8(0, 0xFE);
      view61.setUint8(1, 0xFF);
      expect(view61.getInt16(0, true)).assertEqual(-2);
    });

    /**
     * @tc.name   DataView8Test062
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_6200
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer62 = new ArrayBuffer(2);
      const view62 = new DataView(buffer62);
      view62.setUint8(0, 0x7D);
      view62.setUint8(1, 0x00);
      expect(view62.getInt16(0)).assertEqual(32000);
    });
    /**
     * @tc.name   DataView8Test063
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_6300
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer63 = new ArrayBuffer(2);
      const view63 = new DataView(buffer63);
      view63.setUint8(0, 0x00);
      view63.setUint8(1, 0x7D);
      expect(view63.getInt16(0, true)).assertEqual(32000);
    });

    /**
     * @tc.name   DataView8Test064
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_6400
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer64 = new ArrayBuffer(2);
      const view64 = new DataView(buffer64);
      view64.setUint8(0, 0x0B);
      view64.setUint8(1, 0xB8);
      expect(view64.getInt16(0)).assertEqual(3000);
    });

    /**
     * @tc.name   DataView8Test065
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_6500
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer65 = new ArrayBuffer(2);
      const view65 = new DataView(buffer65);
      view65.setUint8(0, 0xB8);
      view65.setUint8(1, 0x0B);
      expect(view65.getInt16(0, true)).assertEqual(3000);
    });

    /**
     * @tc.name   DataView8Test066
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_6600
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer66 = new ArrayBuffer(2);
      const view66 = new DataView(buffer66);
      view66.setUint8(0, 0xF4);
      view66.setUint8(1, 0x48);
      expect(view66.getInt16(0)).assertEqual(-3000);
    });

    /**
     * @tc.name   DataView8Test067
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_6700
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer67 = new ArrayBuffer(2);
      const view67 = new DataView(buffer67);
      view67.setUint8(0, 0x48);
      view67.setUint8(1, 0xF4);
      expect(view67.getInt16(0, true)).assertEqual(-3000);
    });

    /**
     * @tc.name   DataView8Test068
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_6800
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer68 = new ArrayBuffer(5);
      const view68 = new DataView(buffer68);
      view68.setUint8(3, 0x03);
      view68.setUint8(4, 0x15);
      expect(view68.getInt16(3)).assertEqual(789);
    });

    /**
     * @tc.name   DataView8Test069
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_6900
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer69 = new ArrayBuffer(5);
      const view69 = new DataView(buffer69);
      view69.setUint8(3, 0x15);
      view69.setUint8(4, 0x03);
      expect(view69.getInt16(3, true)).assertEqual(789);
    });

    /**
     * @tc.name   DataView8Test070
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_7000
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer70 = new ArrayBuffer(2);
      const view70 = new DataView(buffer70);
      view70.setUint8(0, 0x13);
      view70.setUint8(1, 0x88);
      expect(view70.getInt16(0)).assertEqual(5000);
    });

    /**
     * @tc.name   DataView8Test071
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_7100
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer71 = new ArrayBuffer(2);
      const view71 = new DataView(buffer71);
      view71.setUint8(0, 0x88);
      view71.setUint8(1, 0x13);
      expect(view71.getInt16(0, true)).assertEqual(5000);
    });

    /**
     * @tc.name   DataView8Test072
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_7200
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer72 = new ArrayBuffer(2);
      const view72 = new DataView(buffer72);
      view72.setUint8(0, 0xEC);
      view72.setUint8(1, 0x78);
      expect(view72.getInt16(0)).assertEqual(-5000);
    });

    /**
     * @tc.name   DataView8Test073
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_7300
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer73 = new ArrayBuffer(2);
      const view73 = new DataView(buffer73);
      view73.setUint8(0, 0x78);
      view73.setUint8(1, 0xEC);
      expect(view73.getInt16(0, true)).assertEqual(-5000);
    });

    /**
     * @tc.name   DataView8Test074
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_7400
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer74 = new ArrayBuffer(2);
      const view74 = new DataView(buffer74);
      view74.setUint8(0, 0x7F);
      view74.setUint8(1, 0xFE);
      expect(view74.getInt16(0)).assertEqual(32766);
    });

    /**
     * @tc.name   DataView8Test075
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_7500
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer75 = new ArrayBuffer(2);
      const view75 = new DataView(buffer75);
      view75.setUint8(0, 0xFE);
      view75.setUint8(1, 0x7F);
      expect(view75.getInt16(0, true)).assertEqual(32766);
    });

    /**
     * @tc.name   DataView8Test076
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_7600
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer76 = new ArrayBuffer(2);
      const view76 = new DataView(buffer76);
      view76.setUint8(0, 0x80);
      view76.setUint8(1, 0x02);
      expect(view76.getInt16(0)).assertEqual(-32766);
    });

    /**
     * @tc.name   DataView8Test077
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_7700
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer77 = new ArrayBuffer(2);
      const view77 = new DataView(buffer77);
      view77.setUint8(0, 0x02);
      view77.setUint8(1, 0x80);
      expect(view77.getInt16(0, true)).assertEqual(-32766);
    });

    /**
     * @tc.name   DataView8Test078
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_7800
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer78 = new ArrayBuffer(4);
      const view78 = new DataView(buffer78);
      view78.setUint8(1, 0xFC);
      view78.setUint8(2, 0x19);
      expect(view78.getInt16(1)).assertEqual(-999);
    });

    /**
     * @tc.name   DataView8Test079
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_7900
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer79 = new ArrayBuffer(4);
      const view79 = new DataView(buffer79);
      view79.setUint8(1, 0x19);
      view79.setUint8(2, 0xFC);
      expect(view79.getInt16(1, true)).assertEqual(-999);
    });

    /**
     * @tc.name   DataView8Test080
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_8000
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer80 = new ArrayBuffer(2);
      const view80 = new DataView(buffer80);
      view80.setUint8(0, 0x05);
      view80.setUint8(1, 0xDC);
      expect(view80.getInt16(0)).assertEqual(1500);
    });

    /**
     * @tc.name   DataView8Test081
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_8100
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer81 = new ArrayBuffer(2);
      const view81 = new DataView(buffer81);
      view81.setUint8(0, 0xDC);
      view81.setUint8(1, 0x05);
      expect(view81.getInt16(0, true)).assertEqual(1500);
    });

    /**
     * @tc.name   DataView8Test082
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_8200
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer82 = new ArrayBuffer(2);
      const view82 = new DataView(buffer82);
      view82.setUint8(0, 0xFA);
      view82.setUint8(1, 0x24);
      expect(view82.getInt16(0)).assertEqual(-1500);
    });

    /**
     * @tc.name   DataView8Test083
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_8300
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer83 = new ArrayBuffer(2);
      const view83 = new DataView(buffer83);
      view83.setUint8(0, 0x24);
      view83.setUint8(1, 0xFA);
      expect(view83.getInt16(0, true)).assertEqual(-1500);
    });

    /**
     * @tc.name   DataView8Test084
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_8400
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer84 = new ArrayBuffer(2);
      const view84 = new DataView(buffer84);
      view84.setUint8(0, 0x10);
      view84.setUint8(1, 0x00);
      expect(view84.getInt16(0)).assertEqual(4096);
    });

    /**
     * @tc.name   DataView8Test085
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_8500
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer85 = new ArrayBuffer(2);
      const view85 = new DataView(buffer85);
      view85.setUint8(0, 0x00);
      view85.setUint8(1, 0x10);
      expect(view85.getInt16(0, true)).assertEqual(4096);
    });

    /**
     * @tc.name   DataView8Test086
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_8600
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer86 = new ArrayBuffer(2);
      const view86 = new DataView(buffer86);
      view86.setUint8(0, 0xF0);
      view86.setUint8(1, 0x00);
      expect(view86.getInt16(0)).assertEqual(-4096);
    });

    /**
     * @tc.name   DataView8Test087
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_8700
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer87 = new ArrayBuffer(2);
      const view87 = new DataView(buffer87);
      view87.setUint8(0, 0x00);
      view87.setUint8(1, 0xF0);
      expect(view87.getInt16(0, true)).assertEqual(-4096);

    });

    /**
     * @tc.name   DataView8Test088
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_8800
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer88 = new ArrayBuffer(6);
      const view88 = new DataView(buffer88);
      view88.setUint8(2, 0x00);
      view88.setUint8(3, 0xFF);
      expect(view88.getInt16(2)).assertEqual(255);
    });

    /**
     * @tc.name   DataView8Test089
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_8900
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer89 = new ArrayBuffer(6);
      const view89 = new DataView(buffer89);
      view89.setUint8(2, 0xFF);
      view89.setUint8(3, 0x00);
      expect(view89.getInt16(2, true)).assertEqual(255);
    });

    /**
     * @tc.name   DataView8Test090
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_9000
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer90 = new ArrayBuffer(2);
      const view90 = new DataView(buffer90);
      view90.setUint8(0, 0xFF);
      view90.setUint8(1, 0xFD);
      expect(view90.getInt16(0)).assertEqual(-3);
    });

    /**
     * @tc.name   DataView8Test091
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_9100
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer91 = new ArrayBuffer(2);
      const view91 = new DataView(buffer91);
      view91.setUint8(0, 0xFD);
      view91.setUint8(1, 0xFF);
      expect(view91.getInt16(0, true)).assertEqual(-3);
    });

    /**
     * @tc.name   DataView8Test092
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_9200
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer92 = new ArrayBuffer(2);
      const view92 = new DataView(buffer92);
      view92.setUint8(0, 0x61);
      view92.setUint8(1, 0xC8);
      expect(view92.getInt16(0)).assertEqual(25032);
    });

    /**
     * @tc.name   DataView8Test093
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_9300
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer93 = new ArrayBuffer(2);
      const view93 = new DataView(buffer93);
      view93.setUint8(0, 0xC8);
      view93.setUint8(1, 0x61);
      expect(view93.getInt16(0, true)).assertEqual(25032);
    });

    /**
     * @tc.name   DataView8Test094
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_9400
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer94 = new ArrayBuffer(2);
      const view94 = new DataView(buffer94);
      view94.setUint8(0, 0x9E);
      view94.setUint8(1, 0x38);
      expect(view94.getInt16(0)).assertEqual(-25032);

    });

    /**
     * @tc.name   DataView8Test095
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_9500
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer95 = new ArrayBuffer(2);
      const view95 = new DataView(buffer95);
      view95.setUint8(0, 0x38);
      view95.setUint8(1, 0x9E);
      expect(view95.getInt16(0, true)).assertEqual(-25032);

    });

    /**
     * @tc.name   DataView8Test096
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_9600
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer96 = new ArrayBuffer(2);
      const view96 = new DataView(buffer96);
      view96.setUint8(0, 0x00);
      view96.setUint8(1, 0x01);
      expect(view96.getInt16(0)).assertEqual(1);
    });

    /**
     * @tc.name   DataView8Test097
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_9700
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer97 = new ArrayBuffer(2);
      const view97 = new DataView(buffer97);
      view97.setUint8(0, 0x01);
      view97.setUint8(1, 0x00);
      expect(view97.getInt16(0, true)).assertEqual(1);
    });

    /**
     * @tc.name   DataView8Test098
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_9800
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer98 = new ArrayBuffer(2);
      const view98 = new DataView(buffer98);
      view98.setUint8(0, 0x80);
      view98.setUint8(1, 0x03);
      expect(view98.getInt16(0)).assertEqual(-32765);
    });

    /**
     * @tc.name   DataView8Test099
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_9900
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer99 = new ArrayBuffer(2);
      const view99 = new DataView(buffer99);
      view99.setUint8(0, 0x03);
      view99.setUint8(1, 0x80);
      expect(view99.getInt16(0, true)).assertEqual(-32765);
    });

    /**
     * @tc.name   DataView8Test100
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_10000
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer100 = new ArrayBuffer(7);
      const view100 = new DataView(buffer100);
      view100.setUint8(4, 0x02);
      view100.setUint8(5, 0xA6);
      expect(view100.getInt16(4)).assertEqual(678);
    });

    /**
     * @tc.name   DataView8Test101
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_10100
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer101 = new ArrayBuffer(7);
      const view101 = new DataView(buffer101);
      view101.setUint8(4, 0xA6);
      view101.setUint8(5, 0x02);
      expect(view101.getInt16(4, true)).assertEqual(678);
    });

    /**
     * @tc.name   DataView8Test102
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_10200
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer102 = new ArrayBuffer(2);
      const view102 = new DataView(buffer102);
      view102.setUint8(0, 0x22);
      view102.setUint8(1, 0xB8);
      expect(view102.getInt16(0)).assertEqual(8888);
    });

    /**
     * @tc.name   DataView8Test103
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_10300
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer103 = new ArrayBuffer(2);
      const view103 = new DataView(buffer103);
      view103.setUint8(0, 0xB8);
      view103.setUint8(1, 0x22);
      expect(view103.getInt16(0, true)).assertEqual(8888);
    });

    /**
     * @tc.name   DataView8Test104
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_10400
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer104 = new ArrayBuffer(2);
      const view104 = new DataView(buffer104);
      view104.setUint8(0, 0x1A);
      view104.setUint8(1, 0x85);
      expect(view104.getInt16(0)).assertEqual(6789);
    });

    /**
     * @tc.name   DataView8Test105
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_10500
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer105 = new ArrayBuffer(2);
      const view105 = new DataView(buffer105);
      view105.setUint8(0, 0x85);
      view105.setUint8(1, 0x1A);
      expect(view105.getInt16(0, true)).assertEqual(6789);
    });

    /**
     * @tc.name   DataView8Test106
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_10600
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer106 = new ArrayBuffer(2);
      const view106 = new DataView(buffer106);
      view106.setUint8(0, 0xE5);
      view106.setUint8(1, 0x7B);
      expect(view106.getInt16(0)).assertEqual(-6789);
    });

    /**
     * @tc.name   DataView8Test107
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_10700
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer107 = new ArrayBuffer(2);
      const view107 = new DataView(buffer107);
      view107.setUint8(0, 0x7B);
      view107.setUint8(1, 0xE5);
      expect(view107.getInt16(0, true)).assertEqual(-6789);
    });

    /**
     * @tc.name   DataView8Test108
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_10800
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer108 = new ArrayBuffer(5);
      const view108 = new DataView(buffer108);
      view108.setUint8(2, 0x00);
      view108.setUint8(3, 0x22);
      expect(view108.getInt16(2)).assertEqual(34);
    });

    /**
     * @tc.name   DataView8Test109
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_10900
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer109 = new ArrayBuffer(5);
      const view109 = new DataView(buffer109);
      view109.setUint8(2, 0x22);
      view109.setUint8(3, 0x00);
      expect(view109.getInt16(2, true)).assertEqual(34);
    });

    /**
     * @tc.name   DataView8Test110
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_11000
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer110 = new ArrayBuffer(2);
      const view110 = new DataView(buffer110);
      view110.setUint8(0, 0x7F);
      view110.setUint8(1, 0xDC);
      expect(view110.getInt16(0)).assertEqual(32732);
    });

    /**
     * @tc.name   DataView8Test111
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_11100
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer111 = new ArrayBuffer(2);
      const view111 = new DataView(buffer111);
      view111.setUint8(0, 0xDC);
      view111.setUint8(1, 0x7F);
      expect(view111.getInt16(0, true)).assertEqual(32732);
    });

    /**
     * @tc.name   DataView8Test112
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_11200
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer112 = new ArrayBuffer(2);
      const view112 = new DataView(buffer112);
      view112.setUint8(0, 0x80);
      view112.setUint8(1, 0x24);
      expect(view112.getInt16(0)).assertEqual(-32732);
    });

    /**
     * @tc.name   DataView8Test113
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_11300
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer113 = new ArrayBuffer(2);
      const view113 = new DataView(buffer113);
      view113.setUint8(0, 0x24);
      view113.setUint8(1, 0x80);
      expect(view113.getInt16(0, true)).assertEqual(-32732);
    });

    /**
     * @tc.name   DataView8Test114
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_11400
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer114 = new ArrayBuffer(2);
      const view114 = new DataView(buffer114);
      view114.setUint8(0, 0x00);
      view114.setUint8(1, 0x63);
      expect(view114.getInt16(0)).assertEqual(99);
    });

    /**
     * @tc.name   DataView8Test115
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_11500
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer115 = new ArrayBuffer(2);
      const view115 = new DataView(buffer115);
      view115.setUint8(0, 0x63);
      view115.setUint8(1, 0x00);
      expect(view115.getInt16(0, true)).assertEqual(99);
    });

    /**
     * @tc.name   DataView8Test116
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_11600
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer116 = new ArrayBuffer(2);
      const view116 = new DataView(buffer116);
      view116.setUint8(0, 0xFF);
      view116.setUint8(1, 0x9D);
      expect(view116.getInt16(0)).assertEqual(-99);
    });

    /**
     * @tc.name   DataView8Test117
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_11700
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer117 = new ArrayBuffer(2);
      const view117 = new DataView(buffer117);
      view117.setUint8(0, 0x9D);
      view117.setUint8(1, 0xFF);
      expect(view117.getInt16(0, true)).assertEqual(-99);
    });

    /**
     * @tc.name   DataView8Test118
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_11800
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer118 = new ArrayBuffer(4);
      const view118 = new DataView(buffer118);
      view118.setUint8(1, 0x11);
      view118.setUint8(2, 0x57);
      expect(view118.getInt16(1)).assertEqual(4439);
    });

    /**
     * @tc.name   DataView8Test119
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_11900
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer119 = new ArrayBuffer(4);
      const view119 = new DataView(buffer119);
      view119.setUint8(1, 0x57);
      view119.setUint8(2, 0x11);
      expect(view119.getInt16(1, true)).assertEqual(4439);
    });

    /**
     * @tc.name   DataView8Test120
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_12000
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer120 = new ArrayBuffer(2);
      const view120 = new DataView(buffer120);
      view120.setUint8(0, 0xEE);
      view120.setUint8(1, 0xA9);
      expect(view120.getInt16(0)).assertEqual(-4439);
    });

    /**
     * @tc.name   DataView8Test121
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_12100
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer121 = new ArrayBuffer(2);
      const view121 = new DataView(buffer121);
      view121.setUint8(0, 0xA9);
      view121.setUint8(1, 0xEE);
      expect(view121.getInt16(0, true)).assertEqual(-4439);
    });

    /**
     * @tc.name   DataView8Test122
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_12200
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer122 = new ArrayBuffer(2);
      const view122 = new DataView(buffer122);
      view122.setUint8(0, 0x40);
      view122.setUint8(1, 0x00);
      expect(view122.getInt16(0)).assertEqual(16384);
    });

    /**
     * @tc.name   DataView8Test123
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_12300
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer123 = new ArrayBuffer(2);
      const view123 = new DataView(buffer123);
      view123.setUint8(0, 0x00);
      view123.setUint8(1, 0x40);
      expect(view123.getInt16(0, true)).assertEqual(16384);
    });

    /**
     * @tc.name   DataView8Test124
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_12400
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer124 = new ArrayBuffer(2);
      const view124 = new DataView(buffer124);
      view124.setUint8(0, 0xC0);
      view124.setUint8(1, 0x00);
      expect(view124.getInt16(0)).assertEqual(-16384);
    });

    /**
     * @tc.name   DataView8Test125
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_12500
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer125 = new ArrayBuffer(2);
      const view125 = new DataView(buffer125);
      view125.setUint8(0, 0x00);
      view125.setUint8(1, 0xC0);
      expect(view125.getInt16(0, true)).assertEqual(-16384);
    });

    /**
     * @tc.name   DataView8Test126
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_12600
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer126 = new ArrayBuffer(6);
      const view126 = new DataView(buffer126);
      view126.setUint8(3, 0xFF);
      view126.setUint8(4, 0xB2);
      expect(view126.getInt16(3)).assertEqual(-78);
    });

    /**
     * @tc.name   DataView8Test127
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_12700
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer127 = new ArrayBuffer(6);
      const view127 = new DataView(buffer127);
      view127.setUint8(3, 0xB2);
      view127.setUint8(4, 0xFF);
      expect(view127.getInt16(3, true)).assertEqual(-78);
    });

    /**
     * @tc.name   DataView8Test128
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_12800
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer128 = new ArrayBuffer(2);
      const view128 = new DataView(buffer128);
      view128.setUint8(0, 0x1F);
      view128.setUint8(1, 0xFF);
      expect(view128.getInt16(0)).assertEqual(8191);
    });

    /**
     * @tc.name   DataView8Test129
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_12900
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer129 = new ArrayBuffer(2);
      const view129 = new DataView(buffer129);
      view129.setUint8(0, 0xFF);
      view129.setUint8(1, 0x1F);
      expect(view129.getInt16(0, true)).assertEqual(8191);
    });

    /**
     * @tc.name   DataView8Test130
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_13000
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer130 = new ArrayBuffer(2);
      const view130 = new DataView(buffer130);
      view130.setUint8(0, 0xE0);
      view130.setUint8(1, 0x01);
      expect(view130.getInt16(0)).assertEqual(-8191);
    });

    /**
     * @tc.name   DataView8Test131
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_13100
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer131 = new ArrayBuffer(2);
      const view131 = new DataView(buffer131);
      view131.setUint8(0, 0x01);
      view131.setUint8(1, 0xE0);
      expect(view131.getInt16(0, true)).assertEqual(-8191);
    });

    /**
     * @tc.name   DataView8Test132
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_13200
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer132 = new ArrayBuffer(2);
      const view132 = new DataView(buffer132);
      view132.setUint8(0, 0xFF);
      view132.setUint8(1, 0xFC);
      expect(view132.getInt16(0)).assertEqual(-4);
    });

    /**
     * @tc.name   DataView8Test133
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_13300
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer133 = new ArrayBuffer(2);
      const view133 = new DataView(buffer133);
      view133.setUint8(0, 0xFC);
      view133.setUint8(1, 0xFF);
      expect(view133.getInt16(0, true)).assertEqual(-4);
    });

    /**
     * @tc.name   DataView8Test134
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_13400
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer134 = new ArrayBuffer(2);
      const view134 = new DataView(buffer134);
      view134.setUint8(0, 0x02);
      view134.setUint8(1, 0x9A);
      expect(view134.getInt16(0)).assertEqual(666);
    });

    /**
     * @tc.name   DataView8Test135
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_13500
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer135 = new ArrayBuffer(2);
      const view135 = new DataView(buffer135);
      view135.setUint8(0, 0x9A);
      view135.setUint8(1, 0x02);
      expect(view135.getInt16(0, true)).assertEqual(666);
    });

    /**
     * @tc.name   DataView8Test136
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_13600
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer136 = new ArrayBuffer(2);
      const view136 = new DataView(buffer136);
      view136.setUint8(0, 0xFD);
      view136.setUint8(1, 0x66);
      expect(view136.getInt16(0)).assertEqual(-666);
    });

    /**
     * @tc.name   DataView8Test137
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_13700
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer137 = new ArrayBuffer(2);
      const view137 = new DataView(buffer137);
      view137.setUint8(0, 0x66);
      view137.setUint8(1, 0xFD);
      expect(view137.getInt16(0, true)).assertEqual(-666);
    });

    /**
     * @tc.name   DataView8Test138
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_13800
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer138 = new ArrayBuffer(5);
      const view138 = new DataView(buffer138);
      view138.setUint8(2, 0x03);
      view138.setUint8(3, 0xE7);
      expect(view138.getInt16(2)).assertEqual(999);
    });

    /**
     * @tc.name   DataView8Test139
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_13900
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer139 = new ArrayBuffer(5);
      const view139 = new DataView(buffer139);
      view139.setUint8(2, 0xE7);
      view139.setUint8(3, 0x03);
      expect(view139.getInt16(2, true)).assertEqual(999);
    });

    /**
     * @tc.name   DataView8Test140
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_14000
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer140 = new ArrayBuffer(2);
      const view140 = new DataView(buffer140);
      view140.setUint8(0, 0x1E);
      view140.setUint8(1, 0xD2);
      expect(view140.getInt16(0)).assertEqual(7890);
    });

    /**
     * @tc.name   DataView8Test141
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_14100
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer141 = new ArrayBuffer(2);
      const view141 = new DataView(buffer141);
      view141.setUint8(0, 0xD2);
      view141.setUint8(1, 0x1E);
      expect(view141.getInt16(0, true)).assertEqual(7890);
    });

    /**
     * @tc.name   DataView8Test142
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_14200
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer142 = new ArrayBuffer(2);
      const view142 = new DataView(buffer142);
      view142.setUint8(0, 0xE1);
      view142.setUint8(1, 0x2E);
      expect(view142.getInt16(0)).assertEqual(-7890);
    });

    /**
     * @tc.name   DataView8Test143
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_14300
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer143 = new ArrayBuffer(2);
      const view143 = new DataView(buffer143);
      view143.setUint8(0, 0x2E);
      view143.setUint8(1, 0xE1);
      expect(view143.getInt16(0, true)).assertEqual(-7890);
    });

    /**
     * @tc.name   DataView8Test144
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_14400
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer144 = new ArrayBuffer(2);
      const view144 = new DataView(buffer144);
      view144.setUint8(0, 0x08);
      view144.setUint8(1, 0x00);
      expect(view144.getInt16(0)).assertEqual(2048);

    });

    /**
     * @tc.name   DataView8Test145
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_14500
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer145 = new ArrayBuffer(2);
      const view145 = new DataView(buffer145);
      view145.setUint8(0, 0x00);
      view145.setUint8(1, 0x08);
      expect(view145.getInt16(0, true)).assertEqual(2048);
    });

    /**
     * @tc.name   DataView8Test146
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_14600
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer146 = new ArrayBuffer(2);
      const view146 = new DataView(buffer146);
      view146.setUint8(0, 0xF8);
      view146.setUint8(1, 0x00);
      expect(view146.getInt16(0)).assertEqual(-2048);
    });

    /**
     * @tc.name   DataView8Test147
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_14700
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer147 = new ArrayBuffer(2);
      const view147 = new DataView(buffer147);
      view147.setUint8(0, 0x00);
      view147.setUint8(1, 0xF8);
      expect(view147.getInt16(0, true)).assertEqual(-2048);
    });

    /**
     * @tc.name   DataView8Test148
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_14800
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer148 = new ArrayBuffer(4);
      const view148 = new DataView(buffer148);
      view148.setUint8(1, 0xFF);
      view148.setUint8(2, 0x85);
      expect(view148.getInt16(1)).assertEqual(-123);
    });

    /**
     * @tc.name   DataView8Test149
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_14900
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer149 = new ArrayBuffer(4);
      const view149 = new DataView(buffer149);
      view149.setUint8(1, 0x85);
      view149.setUint8(2, 0xFF);
      expect(view149.getInt16(1, true)).assertEqual(-123);

    });

    /**
     * @tc.name   DataView8Test150
     * @tc.number SUB_BUILTINS_DATAVIEW8_TEST_15000
     * @tc.desc   test DataView getInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView8Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer150 = new ArrayBuffer(2);
      const view150 = new DataView(buffer150);
      view150.setUint8(0, 0x7F);
      view150.setUint8(1, 0xFD);
      expect(view150.getInt16(0)).assertEqual(32765);
    });

  })
}