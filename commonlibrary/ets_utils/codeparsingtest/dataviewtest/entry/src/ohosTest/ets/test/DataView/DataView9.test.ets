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

export default function DataView9Test() {
  describe('DataView9Test', () => {
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
     * @tc.name   DataView9Test001
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_0100
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(4);
      const view1 = new DataView(buffer1);
      view1.setUint8(0, 0x00);
      view1.setUint8(1, 0x00);
      view1.setUint8(2, 0x01);
      view1.setUint8(3, 0x02);
      expect(view1.getInt32(0)).assertEqual(258);
    });

    /**
     * @tc.name   DataView9Test002
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_0200
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer2 = new ArrayBuffer(4);
      const view2 = new DataView(buffer2);
      view2.setUint8(0, 0x02);
      view2.setUint8(1, 0x01);
      view2.setUint8(2, 0x00);
      view2.setUint8(3, 0x00);
      expect(view2.getInt32(0, true)).assertEqual(258);
    });

    /**
     * @tc.name   DataView9Test003
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_0300
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer3 = new ArrayBuffer(4);
      const view3 = new DataView(buffer3);
      view3.setUint8(0, 0xFF);
      view3.setUint8(1, 0xFF);
      view3.setUint8(2, 0xFF);
      view3.setUint8(3, 0xFF);
      expect(view3.getInt32(0)).assertEqual(-1);
    });

    /**
     * @tc.name   DataView9Test004
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_0400
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer4 = new ArrayBuffer(5);
      const view4 = new DataView(buffer4);
      view4.setUint8(0, 0x00);
      view4.setUint8(1, 0x00);
      view4.setUint8(2, 0x00);
      view4.setUint8(3, 0x00);
      view4.setUint8(4, 0x0A);
      expect(view4.getInt32(1)).assertEqual(10);
    });

    /**
     * @tc.name   DataView9Test005
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_0500
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer5 = new ArrayBuffer(6);
      const view5 = new DataView(buffer5);
      view5.setUint8(0, 0x00);
      view5.setUint8(1, 0x00);
      view5.setUint8(2, 0x0A);
      view5.setUint8(3, 0x00);
      view5.setUint8(4, 0x00);
      view5.setUint8(5, 0x00);
      expect(view5.getInt32(2, true)).assertEqual(10);
    });

    /**
     * @tc.name   DataView9Test006
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_0600
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer6 = new ArrayBuffer(4);
      const view6 = new DataView(buffer6);
      view6.setUint8(0, 0x7F);
      view6.setUint8(1, 0xFF);
      view6.setUint8(2, 0xFF);
      view6.setUint8(3, 0xFF);
      expect(view6.getInt32(0)).assertEqual(2147483647);
    });

    /**
     * @tc.name   DataView9Test007
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_0700
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer7 = new ArrayBuffer(4);
      const view7 = new DataView(buffer7);
      view7.setUint8(0, 0xFF);
      view7.setUint8(1, 0xFF);
      view7.setUint8(2, 0xFF);
      view7.setUint8(3, 0x7F);
      expect(view7.getInt32(0, true)).assertEqual(2147483647);
    });

    /**
     * @tc.name   DataView9Test008
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_0800
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer8 = new ArrayBuffer(4);
      const view8 = new DataView(buffer8);
      view8.setUint8(0, 0x80);
      view8.setUint8(1, 0x00);
      view8.setUint8(2, 0x00);
      view8.setUint8(3, 0x00);
      expect(view8.getInt32(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.name   DataView9Test009
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_0900
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer9 = new ArrayBuffer(4);
      const view9 = new DataView(buffer9);
      view9.setUint8(0, 0x00);
      view9.setUint8(1, 0x00);
      view9.setUint8(2, 0x00);
      view9.setUint8(3, 0x80);
      expect(view9.getInt32(0, true)).assertEqual(-2147483648);
    });

    /**
     * @tc.name   DataView9Test010
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_1000
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer10 = new ArrayBuffer(4);
      const view10 = new DataView(buffer10);
      view10.setUint8(0, 0x01);
      view10.setUint8(1, 0x02);
      view10.setUint8(2, 0x03);
      view10.setUint8(3, 0x04);
      expect(view10.getInt32(0)).assertEqual(16909060);
    });

    /**
     * @tc.name   DataView9Test011
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_1100
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer11 = new ArrayBuffer(4);
      const view11 = new DataView(buffer11);
      view11.setUint8(0, 0x04);
      view11.setUint8(1, 0x03);
      view11.setUint8(2, 0x02);
      view11.setUint8(3, 0x01);
      expect(view11.getInt32(0, true)).assertEqual(16909060);
    });

    /**
     * @tc.name   DataView9Test012
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_1200
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer12 = new ArrayBuffer(4);
      const view12 = new DataView(buffer12);
      view12.setUint8(0, 0x00);
      view12.setUint8(1, 0x00);
      view12.setUint8(2, 0x00);
      view12.setUint8(3, 0xFF);
      expect(view12.getInt32(0)).assertEqual(255);
    });

    /**
     * @tc.name   DataView9Test013
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_1300
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer13 = new ArrayBuffer(4);
      const view13 = new DataView(buffer13);
      view13.setUint8(0, 0xFF);
      view13.setUint8(1, 0x00);
      view13.setUint8(2, 0x00);
      view13.setUint8(3, 0x00);
      expect(view13.getInt32(0, true)).assertEqual(255);
    });

    /**
     * @tc.name   DataView9Test014
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_1400
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer14 = new ArrayBuffer(4);
      const view14 = new DataView(buffer14);
      view14.setUint8(0, 0xFF);
      view14.setUint8(1, 0xFF);
      view14.setUint8(2, 0xFF);
      view14.setUint8(3, 0xFE);
      expect(view14.getInt32(0)).assertEqual(-2);
    });

    /**
     * @tc.name   DataView9Test015
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_1500
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer15 = new ArrayBuffer(4);
      const view15 = new DataView(buffer15);
      view15.setUint8(0, 0xFE);
      view15.setUint8(1, 0xFF);
      view15.setUint8(2, 0xFF);
      view15.setUint8(3, 0xFF);
      expect(view15.getInt32(0, true)).assertEqual(-2);
    });

    /**
     * @tc.name   DataView9Test016
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_1600
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer16 = new ArrayBuffer(4);
      const view16 = new DataView(buffer16);
      view16.setUint8(0, 0x00);
      view16.setUint8(1, 0x00);
      view16.setUint8(2, 0x01);
      view16.setUint8(3, 0x00);
      expect(view16.getInt32(0)).assertEqual(256);
    });

    /**
     * @tc.name   DataView9Test017
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_1700
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer17 = new ArrayBuffer(8);
      const view17 = new DataView(buffer17);
      view17.setUint8(0, 0x00);
      view17.setUint8(1, 0x01);
      view17.setUint8(2, 0x00);
      view17.setUint8(3, 0x00);
      expect(view17.getInt32(0, true)).assertEqual(256);
    });

    /**
     * @tc.name   DataView9Test018
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_1800
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer18 = new ArrayBuffer(4);
      const view18 = new DataView(buffer18);
      view18.setUint8(0, 0xFF);
      view18.setUint8(1, 0xFF);
      view18.setUint8(2, 0x00);
      view18.setUint8(3, 0x00);
      expect(view18.getInt32(0, true)).assertEqual(65535);
    });

    /**
     * @tc.name   DataView9Test019
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_1900
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer19 = new ArrayBuffer(4);
      const view19 = new DataView(buffer19);
      view19.setUint8(0, 0x00);
      view19.setUint8(1, 0x00);
      view19.setUint8(2, 0xFF);
      view19.setUint8(3, 0xFF);
      expect(view19.getInt32(0)).assertEqual(65535);
    });

    /**
     * @tc.name   DataView9Test020
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_2000
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer20 = new ArrayBuffer(4);
      const view20 = new DataView(buffer20);
      view20.setUint8(0, 0x12);
      view20.setUint8(1, 0x34);
      view20.setUint8(2, 0x56);
      view20.setUint8(3, 0x78);
      expect(view20.getInt32(0)).assertEqual(305419896);
    });

    /**
     * @tc.name   DataView9Test021
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_2100
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer21 = new ArrayBuffer(4);
      const view21 = new DataView(buffer21);
      view21.setUint8(0, 0x78);
      view21.setUint8(1, 0x56);
      view21.setUint8(2, 0x34);
      view21.setUint8(3, 0x12);
      expect(view21.getInt32(0, true)).assertEqual(305419896);
    });

    /**
     * @tc.name   DataView9Test022
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_2200
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer22 = new ArrayBuffer(7);
      const view22 = new DataView(buffer22);
      view22.setUint8(3, 0x00);
      view22.setUint8(4, 0x00);
      view22.setUint8(5, 0x00);
      view22.setUint8(6, 0x05);
      expect(view22.getInt32(3)).assertEqual(5);
    });

    /**
     * @tc.name   DataView9Test023
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_2300
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer23 = new ArrayBuffer(4);
      const view23 = new DataView(buffer23);
      view23.setUint8(0, 0x00);
      view23.setUint8(1, 0x01);
      view23.setUint8(2, 0x00);
      view23.setUint8(3, 0x00);
      expect(view23.getInt32(0)).assertEqual(65536);
    });

    /**
     * @tc.name   DataView9Test024
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_2400
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer24 = new ArrayBuffer(4);
      const view24 = new DataView(buffer24);
      view24.setUint8(0, 0x00);
      view24.setUint8(1, 0x00);
      view24.setUint8(2, 0x01);
      view24.setUint8(3, 0x00);
      expect(view24.getInt32(0, true)).assertEqual(65536);
    });

    /**
     * @tc.name   DataView9Test025
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_2500
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer25 = new ArrayBuffer(4);
      const view25 = new DataView(buffer25);
      view25.setUint8(0, 0x18);
      view25.setUint8(1, 0xFC);
      view25.setUint8(2, 0xFF);
      view25.setUint8(3, 0xFF);
      expect(view25.getInt32(0, true)).assertEqual(-1000);
    });

    /**
     * @tc.name   DataView9Test026
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_2600
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer26 = new ArrayBuffer(4);
      const view26 = new DataView(buffer26);
      view26.setUint8(0, 0x00);
      view26.setUint8(1, 0x00);
      view26.setUint8(2, 0x00);
      view26.setUint8(3, 0x80);
      expect(view26.getInt32(0)).assertEqual(128);
    });

    /**
     * @tc.name   DataView9Test027
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_2700
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer27 = new ArrayBuffer(4);
      const view27 = new DataView(buffer27);
      view27.setUint8(0, 0x80);
      view27.setUint8(1, 0x00);
      view27.setUint8(2, 0x00);
      view27.setUint8(3, 0x00);
      expect(view27.getInt32(0, true)).assertEqual(128);
    });

    /**
     * @tc.name   DataView9Test028
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_2800
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer28 = new ArrayBuffer(4);
      const view28 = new DataView(buffer28);
      view28.setUint8(0, 0x07);
      view28.setUint8(1, 0x5B);
      view28.setUint8(2, 0xCD);
      view28.setUint8(3, 0x15);
      expect(view28.getInt32(0)).assertEqual(123456789);
    });

    /**
     * @tc.name   DataView9Test029
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_2900
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer29 = new ArrayBuffer(4);
      const view29 = new DataView(buffer29);
      view29.setUint8(0, 0x15);
      view29.setUint8(1, 0xCD);
      view29.setUint8(2, 0x5B);
      view29.setUint8(3, 0x07);
      expect(view29.getInt32(0, true)).assertEqual(123456789);
    });

    /**
     * @tc.name   DataView9Test030
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_3000
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer30 = new ArrayBuffer(4);
      const view30 = new DataView(buffer30);
      view30.setUint8(0, 0xFF);
      view30.setUint8(1, 0x00);
      view30.setUint8(2, 0x00);
      view30.setUint8(3, 0x00);
      expect(view30.getInt32(0)).assertEqual(-16777216);
    });

    /**
     * @tc.name   DataView9Test031
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_3100
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer31 = new ArrayBuffer(4);
      const view31 = new DataView(buffer31);
      view31.setUint8(0, 0x00);
      view31.setUint8(1, 0x00);
      view31.setUint8(2, 0x00);
      view31.setUint8(3, 0xFF);
      expect(view31.getInt32(0, true)).assertEqual(-16777216);
    });

    /**
     * @tc.name   DataView9Test032
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_3200
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer32 = new ArrayBuffer(4);
      const view32 = new DataView(buffer32);
      view32.setUint8(0, 0x01);
      view32.setUint8(1, 0x01);
      view32.setUint8(2, 0x01);
      view32.setUint8(3, 0x01);
      expect(view32.getInt32(0, true)).assertEqual(16843009);
    });

    /**
     * @tc.name   DataView9Test033
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_3300
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer33 = new ArrayBuffer(4);
      const view33 = new DataView(buffer33);
      view33.setUint8(0, 0x01);
      view33.setUint8(1, 0x01);
      view33.setUint8(2, 0x01);
      view33.setUint8(3, 0x01);
      expect(view33.getInt32(0)).assertEqual(16843009);
    });

    /**
     * @tc.name   DataView9Test034
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_3400
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer34 = new ArrayBuffer(4);
      const view34 = new DataView(buffer34);
      view34.setUint8(0, 0x00);
      view34.setUint8(1, 0x00);
      view34.setUint8(2, 0x00);
      view34.setUint8(3, 0x00);
      expect(view34.getInt32(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView9Test035
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_3500
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer35 = new ArrayBuffer(4);
      const view35 = new DataView(buffer35);
      view35.setUint8(0, 0x00);
      view35.setUint8(1, 0x00);
      view35.setUint8(2, 0x00);
      view35.setUint8(3, 0x00);
      expect(view35.getInt32(0, true)).assertEqual(0);
    });

    /**
     * @tc.name   DataView9Test036
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_3600
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer36 = new ArrayBuffer(8);
      const view36 = new DataView(buffer36);
      view36.setUint8(4, 0x00);
      view36.setUint8(5, 0x00);
      view36.setUint8(6, 0x02);
      view36.setUint8(7, 0x03);
      expect(view36.getInt32(4)).assertEqual(515);
    });

    /**
     * @tc.name   DataView9Test037
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_3700
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer37 = new ArrayBuffer(5);
      const view37 = new DataView(buffer37);
      view37.setUint8(1, 0xFD);
      view37.setUint8(2, 0xFF);
      view37.setUint8(3, 0xFF);
      view37.setUint8(4, 0xFF);
      expect(view37.getInt32(1, true)).assertEqual(-3);
    });

    /**
     * @tc.name   DataView9Test038
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_3800
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer38 = new ArrayBuffer(4);
      const view38 = new DataView(buffer38);
      view38.setUint8(0, 0x00);
      view38.setUint8(1, 0x01);
      view38.setUint8(2, 0x00);
      view38.setUint8(3, 0x00);
      expect(view38.getInt32(0)).assertEqual(65536);
    });

    /**
     * @tc.name   DataView9Test039
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_3900
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer39 = new ArrayBuffer(4);
      const view39 = new DataView(buffer39);
      view39.setUint8(0, 0x00);
      view39.setUint8(1, 0x00);
      view39.setUint8(2, 0x00);
      view39.setUint8(3, 0x01);
      expect(view39.getInt32(0, true)).assertEqual(16777216);
    });

    /**
     * @tc.name   DataView9Test040
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_4000
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer40 = new ArrayBuffer(4);
      const view40 = new DataView(buffer40);
      view40.setUint8(0, 0xFF);
      view40.setUint8(1, 0xFE);
      view40.setUint8(2, 0x00);
      view40.setUint8(3, 0x00);
      expect(view40.getInt32(0)).assertEqual(-131072);
    });

    /**
     * @tc.name   DataView9Test041
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_4100
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer41 = new ArrayBuffer(4);
      const view41 = new DataView(buffer41);
      view41.setUint8(0, 0x00);
      view41.setUint8(1, 0x00);
      view41.setUint8(2, 0xFE);
      view41.setUint8(3, 0xFF);
      expect(view41.getInt32(0, true)).assertEqual(-131072);
    });

    /**
     * @tc.name   DataView9Test042
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_4200
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer42 = new ArrayBuffer(4);
      const view42 = new DataView(buffer42);
      view42.setUint8(0, 0x00);
      view42.setUint8(1, 0xFF);
      view42.setUint8(2, 0x00);
      view42.setUint8(3, 0xFF);
      expect(view42.getInt32(0)).assertEqual(16711935);
    });

    /**
     * @tc.name   DataView9Test043
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_4300
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer43 = new ArrayBuffer(4);
      const view43 = new DataView(buffer43);
      view43.setUint8(0, 0xFF);
      view43.setUint8(1, 0x00);
      view43.setUint8(2, 0xFF);
      view43.setUint8(3, 0x00);
      expect(view43.getInt32(0, true)).assertEqual(16711935);
    });

    /**
     * @tc.name   DataView9Test044
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_4400
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer44 = new ArrayBuffer(6);
      const view44 = new DataView(buffer44);
      view44.setUint8(2, 0x00);
      view44.setUint8(3, 0x01);
      view44.setUint8(4, 0x02);
      view44.setUint8(5, 0x03);
      expect(view44.getInt32(2)).assertEqual(66051);
    });

    /**
     * @tc.name   DataView9Test045
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_4500
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer45 = new ArrayBuffer(7);
      const view45 = new DataView(buffer45);
      view45.setUint8(3, 0xE8);
      view45.setUint8(4, 0x03);
      view45.setUint8(5, 0x00);
      view45.setUint8(6, 0x00);
      expect(view45.getInt32(3, true)).assertEqual(1000);
    });

    /**
     * @tc.name   DataView9Test046
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_4600
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer46 = new ArrayBuffer(4);
      const view46 = new DataView(buffer46);
      view46.setUint8(0, 0xFF);
      view46.setUint8(1, 0xF0);
      view46.setUint8(2, 0x41);
      view46.setUint8(3, 0x80);
      expect(view46.getInt32(0)).assertEqual(-1031808);
    });

    /**
     * @tc.name   DataView9Test047
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_4700
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer47 = new ArrayBuffer(4);
      const view47 = new DataView(buffer47);
      view47.setUint8(0, 0x80);
      view47.setUint8(1, 0x41);
      view47.setUint8(2, 0xF0);
      view47.setUint8(3, 0xFF);
      expect(view47.getInt32(0, true)).assertEqual(-1031808);
    });

    /**
     * @tc.name   DataView9Test048
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_4800
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer48 = new ArrayBuffer(4);
      const view48 = new DataView(buffer48);
      view48.setUint8(0, 0x7F);
      view48.setUint8(1, 0x00);
      view48.setUint8(2, 0x00);
      view48.setUint8(3, 0x00);
      expect(view48.getInt32(0)).assertEqual(2130706432);
    });

    /**
     * @tc.name   DataView9Test049
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_4900
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer49 = new ArrayBuffer(4);
      const view49 = new DataView(buffer49);
      view49.setUint8(0, 0x00);
      view49.setUint8(1, 0x00);
      view49.setUint8(2, 0x00);
      view49.setUint8(3, 0x7F);
      expect(view49.getInt32(0, true)).assertEqual(2130706432);
    });

    /**
     * @tc.name   DataView9Test050
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_5000
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer50 = new ArrayBuffer(4);
      const view50 = new DataView(buffer50);
      view50.setUint8(0, 0x00);
      view50.setUint8(1, 0x80);
      view50.setUint8(2, 0x00);
      view50.setUint8(3, 0x00);
      expect(view50.getInt32(0)).assertEqual(8388608);
    });

    /**
     * @tc.name   DataView9Test051
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_5100
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer51 = new ArrayBuffer(4);
      const view51 = new DataView(buffer51);
      view51.setUint8(0, 0x00);
      view51.setUint8(1, 0x80);
      view51.setUint8(2, 0x00);
      view51.setUint8(3, 0x00);
      expect(view51.getInt32(0, true)).assertEqual(32768);
    });

    /**
     * @tc.name   DataView9Test052
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_5200
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer52 = new ArrayBuffer(4);
      const view52 = new DataView(buffer52);
      view52.setUint8(0, 0x00);
      view52.setUint8(1, 0x00);
      view52.setUint8(2, 0x7F);
      view52.setUint8(3, 0xFF);
      expect(view52.getInt32(0)).assertEqual(32767);
    });

    /**
     * @tc.name   DataView9Test053
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_5300
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer53 = new ArrayBuffer(4);
      const view53 = new DataView(buffer53);
      view53.setUint8(0, 0xFF);
      view53.setUint8(1, 0x7F);
      view53.setUint8(2, 0x00);
      view53.setUint8(3, 0x00);
      expect(view53.getInt32(0, true)).assertEqual(32767);
    });

    /**
     * @tc.name   DataView9Test054
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_5400
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer54 = new ArrayBuffer(4);
      const view54 = new DataView(buffer54);
      view54.setUint8(0, 0xFF);
      view54.setUint8(1, 0xFF);
      view54.setUint8(2, 0x80);
      view54.setUint8(3, 0x00);
      expect(view54.getInt32(0)).assertEqual(-32768);
    });

    /**
     * @tc.name   DataView9Test055
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_5500
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer55 = new ArrayBuffer(4);
      const view55 = new DataView(buffer55);
      view55.setUint8(0, 0x00);
      view55.setUint8(1, 0x80);
      view55.setUint8(2, 0xFF);
      view55.setUint8(3, 0xFF);
      expect(view55.getInt32(0, true)).assertEqual(-32768);

    });

    /**
     * @tc.name   DataView9Test056
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_5600
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer56 = new ArrayBuffer(9);
      const view56 = new DataView(buffer56);
      view56.setUint8(5, 0x01);
      view56.setUint8(6, 0x00);
      view56.setUint8(7, 0x00);
      view56.setUint8(8, 0x00);
      expect(view56.getInt32(5)).assertEqual(16777216);
    });

    /**
     * @tc.name   DataView9Test057
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_5700
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer57 = new ArrayBuffer(4);
      const view57 = new DataView(buffer57);
      view57.setUint8(0, 0x01);
      view57.setUint8(1, 0x00);
      view57.setUint8(2, 0x00);
      view57.setUint8(3, 0x80);
      expect(view57.getInt32(0, true)).assertEqual(-2147483647);
    });

    /**
     * @tc.name   DataView9Test058
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_5800
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer58 = new ArrayBuffer(4);
      const view58 = new DataView(buffer58);
      view58.setUint8(0, 0x77);
      view58.setUint8(1, 0x35);
      view58.setUint8(2, 0x94);
      view58.setUint8(3, 0x00);
      expect(view58.getInt32(0)).assertEqual(2000000000);
    });

    /**
     * @tc.name   DataView9Test059
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_5900
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer59 = new ArrayBuffer(4);
      const view59 = new DataView(buffer59);
      view59.setUint8(0, 0x00);
      view59.setUint8(1, 0x94);
      view59.setUint8(2, 0x35);
      view59.setUint8(3, 0x77);
      expect(view59.getInt32(0, true)).assertEqual(2000000000);
    });

    /**
     * @tc.name   DataView9Test060
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_6000
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer60 = new ArrayBuffer(5);
      const view60 = new DataView(buffer60);
      view60.setUint8(1, 0xFF);
      view60.setUint8(2, 0x00);
      view60.setUint8(3, 0x00);
      view60.setUint8(4, 0x01);
      expect(view60.getInt32(1)).assertEqual(-16777215);
    });

    /**
     * @tc.name   DataView9Test061
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_6100
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer61 = new ArrayBuffer(8);
      const view61 = new DataView(buffer61);
      view61.setUint8(4, 0xFF);
      view61.setUint8(5, 0xFF);
      view61.setUint8(6, 0x00);
      view61.setUint8(7, 0x00);
      expect(view61.getInt32(4, true)).assertEqual(65535);
    });

    /**
     * @tc.name   DataView9Test062
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_6200
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer62 = new ArrayBuffer(4);
      const view62 = new DataView(buffer62);
      view62.setUint8(0, 0x80);
      view62.setUint8(1, 0x80);
      view62.setUint8(2, 0x80);
      view62.setUint8(3, 0x80);
      expect(view62.getInt32(0)).assertEqual(-2139062144);
    });
    /**
     * @tc.name   DataView9Test063
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_6300
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer63 = new ArrayBuffer(4);
      const view63 = new DataView(buffer63);
      view63.setUint8(0, 0x80);
      view63.setUint8(1, 0x80);
      view63.setUint8(2, 0x80);
      view63.setUint8(3, 0x80);
      expect(view63.getInt32(0, true)).assertEqual(-2139062144);
    });

    /**
     * @tc.name   DataView9Test064
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_6400
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer64 = new ArrayBuffer(4);
      const view64 = new DataView(buffer64);
      view64.setUint8(0, 0x00);
      view64.setUint8(1, 0x00);
      view64.setUint8(2, 0x00);
      view64.setUint8(3, 0x01);
      expect(view64.getInt32(0)).assertEqual(1);
    });

    /**
     * @tc.name   DataView9Test065
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_6500
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer65 = new ArrayBuffer(4);
      const view65 = new DataView(buffer65);
      view65.setUint8(0, 0x01);
      view65.setUint8(1, 0x00);
      view65.setUint8(2, 0x00);
      view65.setUint8(3, 0x00);
      expect(view65.getInt32(0, true)).assertEqual(1);
    });

    /**
     * @tc.name   DataView9Test066
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_6600
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer66 = new ArrayBuffer(6);
      const view66 = new DataView(buffer66);
      view66.setUint8(2, 0x00);
      view66.setUint8(3, 0x00);
      view66.setUint8(4, 0xFF);
      view66.setUint8(5, 0xFF);
      expect(view66.getInt32(2)).assertEqual(65535);
    });

    /**
     * @tc.name   DataView9Test067
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_6700
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer67 = new ArrayBuffer(5);
      const view67 = new DataView(buffer67);
      view67.setUint8(1, 0x01);
      view67.setUint8(2, 0x00);
      view67.setUint8(3, 0xFF);
      view67.setUint8(4, 0xFF);
      expect(view67.getInt32(1, true)).assertEqual(-65535);
    });

    /**
     * @tc.name   DataView9Test068
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_6800
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer68 = new ArrayBuffer(4);
      const view68 = new DataView(buffer68);
      view68.setUint8(0, 0x00);
      view68.setUint8(1, 0xFF);
      view68.setUint8(2, 0xFF);
      view68.setUint8(3, 0xFF);
      expect(view68.getInt32(0)).assertEqual(16777215);
    });

    /**
     * @tc.name   DataView9Test069
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_6900
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer69 = new ArrayBuffer(4);
      const view69 = new DataView(buffer69);
      view69.setUint8(0, 0xFF);
      view69.setUint8(1, 0xFF);
      view69.setUint8(2, 0xFF);
      view69.setUint8(3, 0x00);
      expect(view69.getInt32(0, true)).assertEqual(16777215);
    });

    /**
     * @tc.name   DataView9Test070
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_7000
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer70 = new ArrayBuffer(4);
      const view70 = new DataView(buffer70);
      view70.setUint8(0, 0xFF);
      view70.setUint8(1, 0x00);
      view70.setUint8(2, 0x00);
      view70.setUint8(3, 0x01);
      expect(view70.getInt32(0)).assertEqual(-16777215);
    });

    /**
     * @tc.name   DataView9Test071
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_7100
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer71 = new ArrayBuffer(4);
      const view71 = new DataView(buffer71);
      view71.setUint8(0, 0x01);
      view71.setUint8(1, 0x00);
      view71.setUint8(2, 0x00);
      view71.setUint8(3, 0xFF);
      expect(view71.getInt32(0, true)).assertEqual(-16777215);
    });

    /**
     * @tc.name   DataView9Test072
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_7200
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer72 = new ArrayBuffer(7);
      const view72 = new DataView(buffer72);
      view72.setUint8(3, 0x00);
      view72.setUint8(4, 0x00);
      view72.setUint8(5, 0x00);
      view72.setUint8(6, 0xFF);
      expect(view72.getInt32(3)).assertEqual(255);
    });

    /**
     * @tc.name   DataView9Test073
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_7300
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer73 = new ArrayBuffer(6);
      const view73 = new DataView(buffer73);
      view73.setUint8(2, 0x00);
      view73.setUint8(3, 0x00);
      view73.setUint8(4, 0x00);
      view73.setUint8(5, 0x01);
      expect(view73.getInt32(2, true)).assertEqual(16777216);
    });

    /**
     * @tc.name   DataView9Test074
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_7400
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer74 = new ArrayBuffer(4);
      const view74 = new DataView(buffer74);
      view74.setUint8(0, 0x80);
      view74.setUint8(1, 0x00);
      view74.setUint8(2, 0x00);
      view74.setUint8(3, 0x01);
      expect(view74.getInt32(0)).assertEqual(-2147483647);
    });

    /**
     * @tc.name   DataView9Test075
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_7500
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer75 = new ArrayBuffer(4);
      const view75 = new DataView(buffer75);
      view75.setUint8(0, 0x01);
      view75.setUint8(1, 0x00);
      view75.setUint8(2, 0x00);
      view75.setUint8(3, 0x80);
      expect(view75.getInt32(0, true)).assertEqual(-2147483647);
    });

    /**
     * @tc.name   DataView9Test076
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_7600
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer76 = new ArrayBuffer(4);
      const view76 = new DataView(buffer76);
      view76.setUint8(0, 0x11);
      view76.setUint8(1, 0x22);
      view76.setUint8(2, 0x33);
      view76.setUint8(3, 0x44);
      expect(view76.getInt32(0)).assertEqual(287454020);
    });

    /**
     * @tc.name   DataView9Test077
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_7700
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer77 = new ArrayBuffer(4);
      const view77 = new DataView(buffer77);
      view77.setUint8(0, 0x44);
      view77.setUint8(1, 0x33);
      view77.setUint8(2, 0x22);
      view77.setUint8(3, 0x11);
      expect(view77.getInt32(0, true)).assertEqual(287454020);
    });

    /**
     * @tc.name   DataView9Test078
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_7800
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer78 = new ArrayBuffer(5);
      const view78 = new DataView(buffer78);
      view78.setUint8(1, 0x00);
      view78.setUint8(2, 0x80);
      view78.setUint8(3, 0x00);
      view78.setUint8(4, 0x00);
      expect(view78.getInt32(1)).assertEqual(8388608);
    });

    /**
     * @tc.name   DataView9Test079
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_7900
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer79 = new ArrayBuffer(7);
      const view79 = new DataView(buffer79);
      view79.setUint8(3, 0x00);
      view79.setUint8(4, 0x00);
      view79.setUint8(5, 0x80);
      view79.setUint8(6, 0xFF);
      expect(view79.getInt32(3, true)).assertEqual(-8388608);
    });

    /**
     * @tc.name   DataView9Test080
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_8000
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer80 = new ArrayBuffer(4);
      const view80 = new DataView(buffer80);
      view80.setUint8(0, 0x88);
      view80.setUint8(1, 0x6B);
      view80.setUint8(2, 0xE4);
      view80.setUint8(3, 0x00);
      expect(view80.getInt32(0)).assertEqual(-2006195200);
    });

    /**
     * @tc.name   DataView9Test081
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_8100
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer81 = new ArrayBuffer(4);
      const view81 = new DataView(buffer81);
      view81.setUint8(0, 0x00);
      view81.setUint8(1, 0xE4);
      view81.setUint8(2, 0x6B);
      view81.setUint8(3, 0x88);
      expect(view81.getInt32(0, true)).assertEqual(-2006195200);
    });

    /**
     * @tc.name   DataView9Test082
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_8200
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer82 = new ArrayBuffer(4);
      const view82 = new DataView(buffer82);
      view82.setUint8(0, 0x0F);
      view82.setUint8(1, 0x0F);
      view82.setUint8(2, 0x0F);
      view82.setUint8(3, 0x0F);
      expect(view82.getInt32(0)).assertEqual(252645135);
    });

    /**
     * @tc.name   DataView9Test083
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_8300
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer83 = new ArrayBuffer(4);
      const view83 = new DataView(buffer83);
      view83.setUint8(0, 0x0F);
      view83.setUint8(1, 0x0F);
      view83.setUint8(2, 0x0F);
      view83.setUint8(3, 0x0F);
      expect(view83.getInt32(0, true)).assertEqual(252645135);
    });

    /**
     * @tc.name   DataView9Test084
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_8400
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer84 = new ArrayBuffer(4);
      const view84 = new DataView(buffer84);
      view84.setUint8(0, 0x00);
      view84.setUint8(1, 0x00);
      view84.setUint8(2, 0x80);
      view84.setUint8(3, 0x00);
      expect(view84.getInt32(0)).assertEqual(32768);
    });

    /**
     * @tc.name   DataView9Test085
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_8500
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer85 = new ArrayBuffer(4);
      const view85 = new DataView(buffer85);
      view85.setUint8(0, 0x00);
      view85.setUint8(1, 0x80);
      view85.setUint8(2, 0x00);
      view85.setUint8(3, 0x00);
      expect(view85.getInt32(0, true)).assertEqual(32768);
    });

    /**
     * @tc.name   DataView9Test086
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_8600
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer86 = new ArrayBuffer(8);
      const view86 = new DataView(buffer86);
      view86.setUint8(4, 0xFF);
      view86.setUint8(5, 0xFF);
      view86.setUint8(6, 0xFF);
      view86.setUint8(7, 0xFF);
      expect(view86.getInt32(4)).assertEqual(-1);
    });

    /**
     * @tc.name   DataView9Test087
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_8700
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer87 = new ArrayBuffer(6);
      const view87 = new DataView(buffer87);
      view87.setUint8(2, 0xFF);
      view87.setUint8(3, 0xFF);
      view87.setUint8(4, 0xFF);
      view87.setUint8(5, 0x7F);
      expect(view87.getInt32(2, true)).assertEqual(2147483647);
    });

    /**
     * @tc.name   DataView9Test088
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_8800
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer88 = new ArrayBuffer(4);
      const view88 = new DataView(buffer88);
      view88.setUint8(0, 0xFF);
      view88.setUint8(1, 0xFF);
      view88.setUint8(2, 0x7F);
      view88.setUint8(3, 0xFF);
      expect(view88.getInt32(0)).assertEqual(-32769);
    });

    /**
     * @tc.name   DataView9Test089
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_8900
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer89 = new ArrayBuffer(4);
      const view89 = new DataView(buffer89);
      view89.setUint8(0, 0xFF);
      view89.setUint8(1, 0x7F);
      view89.setUint8(2, 0xFF);
      view89.setUint8(3, 0xFF);
      expect(view89.getInt32(0, true)).assertEqual(-32769);
    });

    /**
     * @tc.name   DataView9Test090
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_9000
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer90 = new ArrayBuffer(5);
      const view90 = new DataView(buffer90);
      view90.setUint8(1, 0x00);
      view90.setUint8(2, 0x07);
      view90.setUint8(3, 0xA1);
      view90.setUint8(4, 0x20);
      expect(view90.getInt32(1)).assertEqual(500000);
    });

    /**
     * @tc.name   DataView9Test091
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_9100
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer91 = new ArrayBuffer(4);
      const view91 = new DataView(buffer91);
      view91.setUint8(0, 0x20);
      view91.setUint8(1, 0xA1);
      view91.setUint8(2, 0x07);
      view91.setUint8(3, 0x00);
      expect(view91.getInt32(0, true)).assertEqual(500000);
    });

    /**
     * @tc.name   DataView9Test092
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_9200
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer92 = new ArrayBuffer(4);
      const view92 = new DataView(buffer92);
      view92.setUint8(0, 0xF0);
      view92.setUint8(1, 0xF0);
      view92.setUint8(2, 0xF0);
      view92.setUint8(3, 0xF0);
      expect(view92.getInt32(0)).assertEqual(-252645136);
    });

    /**
     * @tc.name   DataView9Test093
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_9300
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer93 = new ArrayBuffer(4);
      const view93 = new DataView(buffer93);
      view93.setUint8(0, 0xF0);
      view93.setUint8(1, 0xF0);
      view93.setUint8(2, 0xF0);
      view93.setUint8(3, 0xF0);
      expect(view93.getInt32(0, true)).assertEqual(-252645136);
    });

    /**
     * @tc.name   DataView9Test094
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_9400
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer94 = new ArrayBuffer(4);
      const view94 = new DataView(buffer94);
      view94.setUint8(0, 0x00);
      view94.setUint8(1, 0x00);
      view94.setUint8(2, 0x00);
      view94.setUint8(3, 0x02);
      expect(view94.getInt32(0)).assertEqual(2);
    });

    /**
     * @tc.name   DataView9Test095
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_9500
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer95 = new ArrayBuffer(4);
      const view95 = new DataView(buffer95);
      view95.setUint8(0, 0x02);
      view95.setUint8(1, 0x00);
      view95.setUint8(2, 0x00);
      view95.setUint8(3, 0x00);
      expect(view95.getInt32(0, true)).assertEqual(2);
    });

    /**
     * @tc.name   DataView9Test096
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_9600
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer96 = new ArrayBuffer(5);
      const view96 = new DataView(buffer96);
      view96.setUint8(1, 0x00);
      view96.setUint8(2, 0xFF);
      view96.setUint8(3, 0xFF);
      view96.setUint8(4, 0xFF);
      expect(view96.getInt32(1)).assertEqual(16777215);
    });

    /**
     * @tc.name   DataView9Test097
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_9700
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer97 = new ArrayBuffer(6);
      const view97 = new DataView(buffer97);
      view97.setUint8(2, 0x00);
      view97.setUint8(3, 0x00);
      view97.setUint8(4, 0x00);
      view97.setUint8(5, 0xFF);
      expect(view97.getInt32(2, true)).assertEqual(-16777216);
    });

    /**
     * @tc.name   DataView9Test098
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_9800
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer98 = new ArrayBuffer(4);
      const view98 = new DataView(buffer98);
      view98.setUint8(0, 0x00);
      view98.setUint8(1, 0x00);
      view98.setUint8(2, 0xFF);
      view98.setUint8(3, 0xFF);
      expect(view98.getInt32(0)).assertEqual(65535);
    });

    /**
     * @tc.name   DataView9Test099
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_9900
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer99 = new ArrayBuffer(4);
      const view99 = new DataView(buffer99);
      view99.setUint8(0, 0xFF);
      view99.setUint8(1, 0xFF);
      view99.setUint8(2, 0x00);
      view99.setUint8(3, 0x00);
      expect(view99.getInt32(0, true)).assertEqual(65535);
    });

    /**
     * @tc.name   DataView9Test100
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_10000
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer100 = new ArrayBuffer(7);
      const view100 = new DataView(buffer100);
      view100.setUint8(3, 0x00);
      view100.setUint8(4, 0x01);
      view100.setUint8(5, 0x00);
      view100.setUint8(6, 0x00);
      expect(view100.getInt32(3)).assertEqual(65536);
    });

    /**
     * @tc.name   DataView9Test101
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_10100
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer101 = new ArrayBuffer(5);
      const view101 = new DataView(buffer101);
      view101.setUint8(1, 0x00);
      view101.setUint8(2, 0x00);
      view101.setUint8(3, 0xFE);
      view101.setUint8(4, 0xFF);
      expect(view101.getInt32(1, true)).assertEqual(-131072);
    });

    /**
     * @tc.name   DataView9Test102
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_10200
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer102 = new ArrayBuffer(4);
      const view102 = new DataView(buffer102);
      view102.setUint8(0, 0x00);
      view102.setUint8(1, 0x01);
      view102.setUint8(2, 0x86);
      view102.setUint8(3, 0xA0);
      expect(view102.getInt32(0)).assertEqual(100000);
    });

    /**
     * @tc.name   DataView9Test103
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_10300
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer103 = new ArrayBuffer(4);
      const view103 = new DataView(buffer103);
      view103.setUint8(0, 0xA0);
      view103.setUint8(1, 0x86);
      view103.setUint8(2, 0x01);
      view103.setUint8(3, 0x00);
      expect(view103.getInt32(0, true)).assertEqual(100000);
    });

    /**
     * @tc.name   DataView9Test104
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_10400
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer104 = new ArrayBuffer(6);
      const view104 = new DataView(buffer104);
      view104.setUint8(2, 0xFF);
      view104.setUint8(3, 0xFE);
      view104.setUint8(4, 0x79);
      view104.setUint8(5, 0x60);
      expect(view104.getInt32(2)).assertEqual(-100000);
    });

    /**
     * @tc.name   DataView9Test105
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_10500
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer105 = new ArrayBuffer(8);
      const view105 = new DataView(buffer105);
      view105.setUint8(4, 0xFF);
      view105.setUint8(5, 0xFF);
      view105.setUint8(6, 0xFF);
      view105.setUint8(7, 0x7F);
      expect(view105.getInt32(4, true)).assertEqual(2147483647);
    });

    /**
     * @tc.name   DataView9Test106
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_10600
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer106 = new ArrayBuffer(4);
      const view106 = new DataView(buffer106);
      view106.setUint8(0, 0x80);
      view106.setUint8(1, 0x00);
      view106.setUint8(2, 0x00);
      view106.setUint8(3, 0x00);
      expect(view106.getInt32(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.name   DataView9Test107
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_10700
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer107 = new ArrayBuffer(4);
      const view107 = new DataView(buffer107);
      view107.setUint8(0, 0x00);
      view107.setUint8(1, 0x00);
      view107.setUint8(2, 0x00);
      view107.setUint8(3, 0x80);
      expect(view107.getInt32(0, true)).assertEqual(-2147483648);
    });

    /**
     * @tc.name   DataView9Test108
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_10800
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer108 = new ArrayBuffer(5);
      const view108 = new DataView(buffer108);
      view108.setUint8(1, 0x00);
      view108.setUint8(2, 0x00);
      view108.setUint8(3, 0x7F);
      view108.setUint8(4, 0xFF);
      expect(view108.getInt32(1)).assertEqual(32767);
    });

    /**
     * @tc.name   DataView9Test109
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_10900
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer109 = new ArrayBuffer(7);
      const view109 = new DataView(buffer109);
      view109.setUint8(3, 0x01);
      view109.setUint8(4, 0x80);
      view109.setUint8(5, 0xFF);
      view109.setUint8(6, 0xFF);
      expect(view109.getInt32(3, true)).assertEqual(-32767);
    });

    /**
     * @tc.name   DataView9Test110
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_11000
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer110 = new ArrayBuffer(4);
      const view110 = new DataView(buffer110);
      view110.setUint8(0, 0x00);
      view110.setUint8(1, 0x80);
      view110.setUint8(2, 0x00);
      view110.setUint8(3, 0x00);
      expect(view110.getInt32(0)).assertEqual(8388608);
    });

    /**
     * @tc.name   DataView9Test111
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_11100
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer111 = new ArrayBuffer(4);
      const view111 = new DataView(buffer111);
      view111.setUint8(0, 0x00);
      view111.setUint8(1, 0x00);
      view111.setUint8(2, 0x80);
      view111.setUint8(3, 0x00);
      expect(view111.getInt32(0, true)).assertEqual(8388608);
    });

    /**
     * @tc.name   DataView9Test112
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_11200
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer112 = new ArrayBuffer(6);
      const view112 = new DataView(buffer112);
      view112.setUint8(2, 0xFF);
      view112.setUint8(3, 0x80);
      view112.setUint8(4, 0x00);
      view112.setUint8(5, 0x00);
      expect(view112.getInt32(2)).assertEqual(-8388608);
    });

    /**
     * @tc.name   DataView9Test113
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_11300
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer113 = new ArrayBuffer(4);
      const view113 = new DataView(buffer113);
      view113.setUint8(0, 0x00);
      view113.setUint8(1, 0x00);
      view113.setUint8(2, 0x80);
      view113.setUint8(3, 0xFF);
      expect(view113.getInt32(0, true)).assertEqual(-8388608);
    });

    /**
     * @tc.name   DataView9Test114
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_11400
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer114 = new ArrayBuffer(4);
      const view114 = new DataView(buffer114);
      view114.setUint8(0, 0x7F);
      view114.setUint8(1, 0x00);
      view114.setUint8(2, 0x00);
      view114.setUint8(3, 0x00);
      expect(view114.getInt32(0)).assertEqual(2130706432);
    });

    /**
     * @tc.name   DataView9Test115
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_11500
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer115 = new ArrayBuffer(4);
      const view115 = new DataView(buffer115);
      view115.setUint8(0, 0x00);
      view115.setUint8(1, 0x00);
      view115.setUint8(2, 0x00);
      view115.setUint8(3, 0x7F);
      expect(view115.getInt32(0, true)).assertEqual(2130706432);
    });

    /**
     * @tc.name   DataView9Test116
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_11600
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer116 = new ArrayBuffer(8);
      const view116 = new DataView(buffer116);
      view116.setUint8(4, 0x81);
      view116.setUint8(5, 0x00);
      view116.setUint8(6, 0x00);
      view116.setUint8(7, 0x00);
      expect(view116.getInt32(4)).assertEqual(-2130706432);
    });

    /**
     * @tc.name   DataView9Test117
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_11700
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer117 = new ArrayBuffer(6);
      const view117 = new DataView(buffer117);
      view117.setUint8(2, 0x0F);
      view117.setUint8(3, 0x0F);
      view117.setUint8(4, 0x0F);
      view117.setUint8(5, 0x0F);
      expect(view117.getInt32(2, true)).assertEqual(252645135);
    });

    /**
     * @tc.name   DataView9Test118
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_11800
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer118 = new ArrayBuffer(4);
      const view118 = new DataView(buffer118);
      view118.setUint8(0, 0xF0);
      view118.setUint8(1, 0xF0);
      view118.setUint8(2, 0xF0);
      view118.setUint8(3, 0xF0);
      expect(view118.getInt32(0)).assertEqual(-252645136);
    });

    /**
     * @tc.name   DataView9Test119
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_11900
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer119 = new ArrayBuffer(4);
      const view119 = new DataView(buffer119);
      view119.setUint8(0, 0xF0);
      view119.setUint8(1, 0xF0);
      view119.setUint8(2, 0xF0);
      view119.setUint8(3, 0xF0);
      expect(view119.getInt32(0, true)).assertEqual(-252645136);
    });

    /**
     * @tc.name   DataView9Test120
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_12000
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer120 = new ArrayBuffer(5);
      const view120 = new DataView(buffer120);
      view120.setUint8(1, 0xFF);
      view120.setUint8(2, 0xF8);
      view120.setUint8(3, 0x5E);
      view120.setUint8(4, 0xE0);
      expect(view120.getInt32(1)).assertEqual(-500000);
    });

    /**
     * @tc.name   DataView9Test121
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_12100
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer121 = new ArrayBuffer(4);
      const view121 = new DataView(buffer121);
      view121.setUint8(0, 0xE0);
      view121.setUint8(1, 0x5E);
      view121.setUint8(2, 0xF8);
      view121.setUint8(3, 0xFF);
      expect(view121.getInt32(0, true)).assertEqual(-500000);
    });

    /**
     * @tc.name   DataView9Test122
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_12200
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer122 = new ArrayBuffer(4);
      const view122 = new DataView(buffer122);
      view122.setUint8(0, 0x00);
      view122.setUint8(1, 0x00);
      view122.setUint8(2, 0x80);
      view122.setUint8(3, 0x00);
      expect(view122.getInt32(0)).assertEqual(32768);
    });

    /**
     * @tc.name   DataView9Test123
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_12300
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer123 = new ArrayBuffer(4);
      const view123 = new DataView(buffer123);
      view123.setUint8(0, 0x00);
      view123.setUint8(1, 0x80);
      view123.setUint8(2, 0x00);
      view123.setUint8(3, 0x00);
      expect(view123.getInt32(0, true)).assertEqual(32768);
    });

    /**
     * @tc.name   DataView9Test124
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_12400
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer124 = new ArrayBuffer(4);
      const view124 = new DataView(buffer124);
      view124.setUint8(0, 0xFF);
      view124.setUint8(1, 0xFF);
      view124.setUint8(2, 0xFF);
      view124.setUint8(3, 0xFD);
      expect(view124.getInt32(0)).assertEqual(-3);
    });

    /**
     * @tc.name   DataView9Test125
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_12500
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer125 = new ArrayBuffer(4);
      const view125 = new DataView(buffer125);
      view125.setUint8(0, 0xFD);
      view125.setUint8(1, 0xFF);
      view125.setUint8(2, 0xFF);
      view125.setUint8(3, 0xFF);
      expect(view125.getInt32(0, true)).assertEqual(-3);
    });

    /**
     * @tc.name   DataView9Test126
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_12600
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer126 = new ArrayBuffer(6);
      const view126 = new DataView(buffer126);
      view126.setUint8(2, 0x00);
      view126.setUint8(3, 0x00);
      view126.setUint8(4, 0x30);
      view126.setUint8(5, 0x39);
      expect(view126.getInt32(2)).assertEqual(12345);
    });

    /**
     * @tc.name   DataView9Test127
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_12700
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer127 = new ArrayBuffer(5);
      const view127 = new DataView(buffer127);
      view127.setUint8(1, 0x32);
      view127.setUint8(2, 0x09);
      view127.setUint8(3, 0x01);
      view127.setUint8(4, 0x00);
      expect(view127.getInt32(1, true)).assertEqual(67890);
    });

    /**
     * @tc.name   DataView9Test128
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_12800
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer128 = new ArrayBuffer(4);
      const view128 = new DataView(buffer128);
      view128.setUint8(0, 0xC8);
      view128.setUint8(1, 0x7C);
      view128.setUint8(2, 0x64);
      view128.setUint8(3, 0x00);
      expect(view128.getInt32(0)).assertEqual(-931372032);
    });

    /**
     * @tc.name   DataView9Test129
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_12900
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer129 = new ArrayBuffer(4);
      const view129 = new DataView(buffer129);
      view129.setUint8(0, 0x00);
      view129.setUint8(1, 0x64);
      view129.setUint8(2, 0x7C);
      view129.setUint8(3, 0xC8);
      expect(view129.getInt32(0, true)).assertEqual(-931372032);
    });

    /**
     * @tc.name   DataView9Test130
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_13000
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer130 = new ArrayBuffer(7);
      const view130 = new DataView(buffer130);
      view130.setUint8(3, 0xFF);
      view130.setUint8(4, 0xFF);
      view130.setUint8(5, 0xFF);
      view130.setUint8(6, 0xFF);
      expect(view130.getInt32(3)).assertEqual(-1);
    });

    /**
     * @tc.name   DataView9Test131
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_13100
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer131 = new ArrayBuffer(4);
      const view131 = new DataView(buffer131);
      view131.setUint8(0, 0xFF);
      view131.setUint8(1, 0xFF);
      view131.setUint8(2, 0xFF);
      view131.setUint8(3, 0xFF);
      expect(view131.getInt32(0, true)).assertEqual(-1);
    });

    /**
     * @tc.name   DataView9Test132
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_13200
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer132 = new ArrayBuffer(4);
      const view132 = new DataView(buffer132);
      view132.setUint8(0, 0x3B);
      view132.setUint8(1, 0x9A);
      view132.setUint8(2, 0xCA);
      view132.setUint8(3, 0x00);
      expect(view132.getInt32(0)).assertEqual(1000000000);
    });

    /**
     * @tc.name   DataView9Test133
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_13300
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer133 = new ArrayBuffer(4);
      const view133 = new DataView(buffer133);
      view133.setUint8(0, 0x00);
      view133.setUint8(1, 0xCA);
      view133.setUint8(2, 0x9A);
      view133.setUint8(3, 0x3B);
      expect(view133.getInt32(0, true)).assertEqual(1000000000);
    });

    /**
     * @tc.name   DataView9Test134
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_13400
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer134 = new ArrayBuffer(5);
      const view134 = new DataView(buffer134);
      view134.setUint8(1, 0x80);
      view134.setUint8(2, 0x00);
      view134.setUint8(3, 0x00);
      view134.setUint8(4, 0x01);
      expect(view134.getInt32(1)).assertEqual(-2147483647);
    });

    /**
     * @tc.name   DataView9Test135
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_13500
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer135 = new ArrayBuffer(6);
      const view135 = new DataView(buffer135);
      view135.setUint8(2, 0xFF);
      view135.setUint8(3, 0xFF);
      view135.setUint8(4, 0xFF);
      view135.setUint8(5, 0x7F);
      expect(view135.getInt32(2, true)).assertEqual(2147483647);
    });

    /**
     * @tc.name   DataView9Test136
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_13600
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer136 = new ArrayBuffer(4);
      const view136 = new DataView(buffer136);
      view136.setUint8(0, 0xF8);
      view136.setUint8(1, 0xA4);
      view136.setUint8(2, 0x3B);
      view136.setUint8(3, 0x23);
      expect(view136.getInt32(0)).assertEqual(-123454685);
    });

    /**
     * @tc.name   DataView9Test137
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_13700
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer137 = new ArrayBuffer(4);
      const view137 = new DataView(buffer137);
      view137.setUint8(0, 0x23);
      view137.setUint8(1, 0x3B);
      view137.setUint8(2, 0xA4);
      view137.setUint8(3, 0xF8);
      expect(view137.getInt32(0, true)).assertEqual(-123454685);
    });

    /**
     * @tc.name   DataView9Test138
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_13800
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer138 = new ArrayBuffer(8);
      const view138 = new DataView(buffer138);
      view138.setUint8(4, 0x00);
      view138.setUint8(5, 0x00);
      view138.setUint8(6, 0x00);
      view138.setUint8(7, 0x03);
      expect(view138.getInt32(4)).assertEqual(3);
    });

    /**
     * @tc.name   DataView9Test139
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_13900
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer139 = new ArrayBuffer(7);
      const view139 = new DataView(buffer139);
      view139.setUint8(3, 0xFC);
      view139.setUint8(4, 0xFF);
      view139.setUint8(5, 0xFF);
      view139.setUint8(6, 0xFF);
      expect(view139.getInt32(3, true)).assertEqual(-4);
    });

    /**
     * @tc.name   DataView9Test140
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_14000
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer140 = new ArrayBuffer(4);
      const view140 = new DataView(buffer140);
      view140.setUint8(0, 0x00);
      view140.setUint8(1, 0x02);
      view140.setUint8(2, 0x00);
      view140.setUint8(3, 0x06);
      expect(view140.getInt32(0)).assertEqual(131078);
    });

    /**
     * @tc.name   DataView9Test141
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_14100
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer141 = new ArrayBuffer(4);
      const view141 = new DataView(buffer141);
      view141.setUint8(0, 0x06);
      view141.setUint8(1, 0x00);
      view141.setUint8(2, 0x02);
      view141.setUint8(3, 0x00);
      expect(view141.getInt32(0, true)).assertEqual(131078);
    });

    /**
     * @tc.name   DataView9Test142
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_14200
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer142 = new ArrayBuffer(4);
      const view142 = new DataView(buffer142);
      view142.setUint8(0, 0xFF);
      view142.setUint8(1, 0xFD);
      view142.setUint8(2, 0xFF);
      view142.setUint8(3, 0xFA);
      expect(view142.getInt32(0)).assertEqual(-131078);
    });

    /**
     * @tc.name   DataView9Test143
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_14300
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer143 = new ArrayBuffer(4);
      const view143 = new DataView(buffer143);
      view143.setUint8(0, 0xFA);
      view143.setUint8(1, 0xFF);
      view143.setUint8(2, 0xFD);
      view143.setUint8(3, 0xFF);
      expect(view143.getInt32(0, true)).assertEqual(-131078);
    });

    /**
     * @tc.name   DataView9Test144
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_14400
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer144 = new ArrayBuffer(4);
      const view144 = new DataView(buffer144);
      view144.setUint8(0, 0x00);
      view144.setUint8(1, 0x01);
      view144.setUint8(2, 0xE2);
      view144.setUint8(3, 0x40);
      expect(view144.getInt32(0)).assertEqual(123456);
    });

    /**
     * @tc.name   DataView9Test145
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_14500
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer145 = new ArrayBuffer(4);
      const view145 = new DataView(buffer145);
      view145.setUint8(0, 0x40);
      view145.setUint8(1, 0xE2);
      view145.setUint8(2, 0x01);
      view145.setUint8(3, 0x00);
      expect(view145.getInt32(0, true)).assertEqual(123456);
    });

    /**
     * @tc.name   DataView9Test146
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_14600
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer146 = new ArrayBuffer(6);
      const view146 = new DataView(buffer146);
      view146.setUint8(2, 0xFF);
      view146.setUint8(3, 0xFE);
      view146.setUint8(4, 0x79);
      view146.setUint8(5, 0xAD);
      expect(view146.getInt32(2)).assertEqual(-99923);
    });

    /**
     * @tc.name   DataView9Test147
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_14700
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer147 = new ArrayBuffer(5);
      const view147 = new DataView(buffer147);
      view147.setUint8(1, 0xAD);
      view147.setUint8(2, 0x79);
      view147.setUint8(3, 0xFE);
      view147.setUint8(4, 0xFF);
      expect(view147.getInt32(1, true)).assertEqual(-99923);
    });

    /**
     * @tc.name   DataView9Test148
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_14800
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer148 = new ArrayBuffer(4);
      const view148 = new DataView(buffer148);
      view148.setUint8(0, 0x7F);
      view148.setUint8(1, 0xFF);
      view148.setUint8(2, 0xFF);
      view148.setUint8(3, 0xFE);
      expect(view148.getInt32(0)).assertEqual(2147483646);
    });

    /**
     * @tc.name   DataView9Test149
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_14900
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer149 = new ArrayBuffer(4);
      const view149 = new DataView(buffer149);
      view149.setUint8(0, 0xFE);
      view149.setUint8(1, 0xFF);
      view149.setUint8(2, 0xFF);
      view149.setUint8(3, 0x7F);
      expect(view149.getInt32(0, true)).assertEqual(2147483646);
    });

    /**
     * @tc.name   DataView9Test150
     * @tc.number SUB_BUILTINS_DATAVIEW9_TEST_15000
     * @tc.desc   test DataView getInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView9Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer150 = new ArrayBuffer(7);
      const view150 = new DataView(buffer150);
      view150.setUint8(3, 0xFF);
      view150.setUint8(4, 0xFF);
      view150.setUint8(5, 0xFF);
      view150.setUint8(6, 0x9C);
      expect(view150.getInt32(3)).assertEqual(-100);
    });

  })
}