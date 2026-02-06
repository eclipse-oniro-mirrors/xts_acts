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

export default function DataView10Test() {
  describe('DataView10Test', () => {
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
     * @tc.name   DataView10Test001
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_0100
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(1);
      const view1 = new DataView(buffer1);
      view1.setUint8(0, 0x0A);
      expect(view1.getUint8(0)).assertEqual(10);
    });

    /**
     * @tc.name   DataView10Test002
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_0200
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer2 = new Uint8Array([0x33, 0x7F, 0x9C]).buffer;
      const view2 = new DataView(buffer2);
      expect(view2.getUint8(1)).assertEqual(127);
    });

    /**
     * @tc.name   DataView10Test003
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_0300
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer3 = new ArrayBuffer(1);
      const view3 = new DataView(buffer3);
      view3.setUint8(0, 0xFF);
      expect(view3.getUint8(0)).assertEqual(255);
    });

    /**
     * @tc.name   DataView10Test004
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_0400
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer4 = new ArrayBuffer(1);
      const view4 = new DataView(buffer4);
      view4.setUint8(0, 0x00);
      expect(view4.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView10Test005
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_0500
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer5 = new ArrayBuffer(2);
      const view5 = new DataView(buffer5);
      view5.setUint8(0, 100);
      view5.setUint8(1, 1);
      expect(view5.getUint8(1)).assertEqual(1);
    });

    /**
     * @tc.name   DataView10Test006
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_0600
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer6 = new ArrayBuffer(3);
      const view6 = new DataView(buffer6);
      view6.setUint8(2, 0xFE);
      expect(view6.getUint8(2)).assertEqual(254);
    });

    /**
     * @tc.name   DataView10Test007
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_0700
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int8Buffer = new Int8Array([0x7F]).buffer;
      const view7 = new DataView(int8Buffer);
      expect(view7.getUint8(0)).assertEqual(127);
    });

    /**
     * @tc.name   DataView10Test008
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_0800
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer8 = new ArrayBuffer(3);
      const view8 = new DataView(buffer8);
      view8.setUint8(0, 10);
      view8.setUint8(1, 20);
      view8.setUint8(2, 30);
      expect(view8.getUint8(1)).assertEqual(20);
    });

    /**
     * @tc.name   DataView10Test009
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_0900
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer9 = new ArrayBuffer(10);
      const view9 = new DataView(buffer9);
      view9.setUint8(5, 150);
      expect(view9.getUint8(5)).assertEqual(150);
    });

    /**
     * @tc.name   DataView10Test010
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_1000
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer10 = new ArrayBuffer(1);
      const view10 = new DataView(buffer10);
      view10.setUint8(0, 0x0F);
      expect(view10.getUint8(0)).assertEqual(15);
    });

    /**
     * @tc.name   DataView10Test011
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_1100
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer11 = new ArrayBuffer(4);
      const view11 = new DataView(buffer11);
      view11.setUint8(3, 0xF0);
      expect(view11.getUint8(3)).assertEqual(240);
    });

    /**
     * @tc.name   DataView10Test012
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_1200
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer12 = new ArrayBuffer(1);
      const view12 = new DataView(buffer12);
      view12.setUint8(0, 50);
      view12.setUint8(0, 100);
      expect(view12.getUint8(0)).assertEqual(100);
    });

    /**
     * @tc.name   DataView10Test013
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_1300
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer13 = new ArrayBuffer(1);
      const view13 = new DataView(buffer13);
      view13.setUint8(0, 128);
      expect(view13.getUint8(0)).assertEqual(128);
    });

    /**
     * @tc.name   DataView10Test014
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_1400
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer14 = new ArrayBuffer(5);
      const view14 = new DataView(buffer14);
      view14.setUint8(4, 67);
      expect(view14.getUint8(4)).assertEqual(67);
    });

    /**
     * @tc.name   DataView10Test015
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_1500
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer15 = new ArrayBuffer(0);
      const view15 = new DataView(buffer15);
      try {
        view15.getUint8(0);
      } catch (e) {
        expect(e instanceof RangeError).assertEqual(true);
      }
    });

    /**
     * @tc.name   DataView10Test016
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_1600
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer16 = new ArrayBuffer(2);
      const view16 = new DataView(buffer16);
      try {
        view16.getUint8(2);
      } catch (e) {
        expect(e instanceof RangeError).assertEqual(true);
      }
    });

    /**
     * @tc.name   DataView10Test017
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_1700
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer17 = new ArrayBuffer(5);
      const view17 = new DataView(buffer17);
      view17.setUint8(1, 3);
      expect(view17.getUint8(1)).assertEqual(3);
    });

    /**
     * @tc.name   DataView10Test018
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_1800
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer18 = new ArrayBuffer(3);
      const view18 = new DataView(buffer18);
      view18.setUint8(0, 255);
      view18.setUint8(1, 255);
      view18.setUint8(2, 255);
      expect(view18.getUint8(2)).assertEqual(255);
    });

    /**
     * @tc.name   DataView10Test019
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_1900
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer19 = new ArrayBuffer(10);
      const view19 = new DataView(buffer19);
      view19.setUint8(4, 127);
      expect(view19.getUint8(4)).assertEqual(127);
    });

    /**
     * @tc.name   DataView10Test020
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_2000
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint16Buffer = new Uint16Array([0x1234]).buffer;
      const view20 = new DataView(uint16Buffer);
      expect(view20.getUint8(0)).assertEqual(0x34);
    });

    /**
     * @tc.name   DataView10Test021
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_2100
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer21 = new ArrayBuffer(6);
      const view21 = new DataView(buffer21);
      view21.setUint8(5, 0);
      expect(view21.getUint8(5)).assertEqual(0);
    });

    /**
     * @tc.name   DataView10Test022
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_2200
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer22 = new ArrayBuffer(100);
      const view22 = new DataView(buffer22);
      view22.setUint8(0, 255);
      expect(view22.getUint8(0)).assertEqual(255);
    });

    /**
     * @tc.name   DataView10Test023
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_2300
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer23 = new ArrayBuffer(1);
      const view23 = new DataView(buffer23);
      view23.setUint8(0, 65);
      expect(view23.getUint8(0)).assertEqual(65);
    });

    /**
     * @tc.name   DataView10Test024
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_2400
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer24 = new ArrayBuffer(5);
      const view24 = new DataView(buffer24);
      view24.setUint8(3, 0xC0);
      expect(view24.getUint8(3)).assertEqual(192);
    });

    /**
     * @tc.name   DataView10Test025
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_2500
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer25 = new ArrayBuffer(4);
      const view25 = new DataView(buffer25);
      [1, 2, 3, 4].forEach((val, i) => view25.setUint8(i, val));
      expect(view25.getUint8(2)).assertEqual(3);
    });

    /**
     * @tc.name   DataView10Test026
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_2600
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const float32Buffer = new Float32Array([1.0]).buffer;
      const view26 = new DataView(float32Buffer);
      const byteValue = view26.getUint8(0);
      expect(view26.getUint8(0)).assertEqual(byteValue);
    });

    /**
     * @tc.name   DataView10Test027
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_2700
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer27 = new ArrayBuffer(5);
      const view27 = new DataView(buffer27);
      view27.setUint8(2, 100);
      expect(view27.getUint8(2)).assertEqual(100);
    });

    /**
     * @tc.name   DataView10Test028
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_2800
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer28 = new ArrayBuffer(1);
      const view28 = new DataView(buffer28);
      view28.setUint8(0, 254);
      expect(view28.getUint8(0)).assertEqual(254);
    });

    /**
     * @tc.name   DataView10Test029
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_2900
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer29 = new ArrayBuffer(3);
      const view29 = new DataView(buffer29);
      view29.setUint8(1, 0x00);
      expect(view29.getUint8(1)).assertEqual(0);
    });

    /**
     * @tc.name   DataView10Test030
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_3000
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer30 = new ArrayBuffer(7);
      const view30 = new DataView(buffer30);
      view30.setUint8(6, 88);
      expect(view30.getUint8(6)).assertEqual(88);
    });

    /**
     * @tc.name   DataView10Test031
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_3100
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer31 = new ArrayBuffer(3);
      const view31 = new DataView(buffer31);
      view31.setUint8(0, 10);
      view31.setUint8(1, 20);
      view31.setUint8(2, 30);
      expect(view31.getUint8(1)).assertEqual(20);
    });

    /**
     * @tc.name   DataView10Test032
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_3200
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer32 = new ArrayBuffer(5);
      const view32 = new DataView(buffer32);
      view32.setUint8(4, 15);
      expect(view32.getUint8(4)).assertEqual(15);
    });

    /**
     * @tc.name   DataView10Test033
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_3300
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer33 = new ArrayBuffer(1);
      const view33 = new DataView(buffer33);
      view33.setUint8(0, 255);
      view33.setUint8(0, 0);
      expect(view33.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView10Test034
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_3400
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer34 = new ArrayBuffer(8);
      const view34 = new DataView(buffer34);
      view34.setUint8(7, 64);
      expect(view34.getUint8(7)).assertEqual(64);
    });

    /**
     * @tc.name   DataView10Test035
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_3500
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int16Buffer = new Int16Array([0x1234]).buffer;
      const view35 = new DataView(int16Buffer);
      expect(view35.getUint8(1)).assertEqual(0x12);
    });

    /**
     * @tc.name   DataView10Test036
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_3600
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer36 = new ArrayBuffer(3);
      const view36 = new DataView(buffer36);
      try {
        view36.getUint8(-1);
      } catch (e) {
        expect(e instanceof RangeError).assertEqual(true);
      }
    });

    /**
     * @tc.name   DataView10Test037
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_3700
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer37 = new ArrayBuffer(100);
      const view37 = new DataView(buffer37);
      view37.setUint8(99, 10);
      expect(view37.getUint8(99)).assertEqual(10);
    });

    /**
     * @tc.name   DataView10Test038
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_3800
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer38 = new ArrayBuffer(5);
      const view38 = new DataView(buffer38);
      view38.setUint8(2, 0x40);
      expect(view38.getUint8(2)).assertEqual(64);
    });

    /**
     * @tc.name   DataView10Test039
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_3900
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer39 = new ArrayBuffer(1);
      const view39 = new DataView(buffer39);
      view39.setUint8(0, 50);
      view39.setUint8(0, 75);
      view39.setUint8(0, 100);
      expect(view39.getUint8(0)).assertEqual(100);
    });

    /**
     * @tc.name   DataView10Test040
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_4000
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint32Buffer = new Uint32Array([0x11223344]).buffer;
      const view40 = new DataView(uint32Buffer);
      expect(view40.getUint8(2)).assertEqual(0x22);
    });

    /**
     * @tc.name   DataView10Test041
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_4100
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer41 = new ArrayBuffer(4);
      const view41 = new DataView(buffer41);
      view41.setUint8(2, 200);
      expect(view41.getUint8(2)).assertEqual(200);
    });

    /**
     * @tc.name   DataView10Test042
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_4200
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer42 = new ArrayBuffer(5);
      const view42 = new DataView(buffer42);
      view42.setUint8(0, 123);
      expect(view42.getUint8(0)).assertEqual(123);
    });

    /**
     * @tc.name   DataView10Test043
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_4300
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer43 = new ArrayBuffer(4);
      const view43 = new DataView(buffer43);
      try {
        view43.getUint8(4);
      } catch (e) {
        expect(e instanceof RangeError).assertEqual(true);
      }
    });

    /**
     * @tc.name   DataView10Test044
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_4400
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer44 = new ArrayBuffer(1);
      const view44 = new DataView(buffer44);
      view44.setUint8(0, 122);
      expect(view44.getUint8(0)).assertEqual(122);
    });

    /**
     * @tc.name   DataView10Test045
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_4500
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer45 = new ArrayBuffer(20);
      const view45 = new DataView(buffer45);
      view45.setUint8(10, 150);
      expect(view45.getUint8(10)).assertEqual(150);
    });

    /**
     * @tc.name   DataView10Test046
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_4600
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const float64Buffer = new Float64Array([Math.PI]).buffer;
      const view46 = new DataView(float64Buffer);
      const piFirstByte = view46.getUint8(0);
      expect(view46.getUint8(0)).assertEqual(piFirstByte);
    });

    /**
     * @tc.name   DataView10Test047
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_4700
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer47 = new ArrayBuffer(3);
      const view47 = new DataView(buffer47);
      view47.setUint8(1, 0x80);
      expect(view47.getUint8(1)).assertEqual(128);
    });

    /**
     * @tc.name   DataView10Test048
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_4800
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer48 = new ArrayBuffer(2);
      const view48 = new DataView(buffer48);
      view48.setUint8(0, 30);
      view48.setUint8(1, 40);
      expect(view48.getUint8(1)).assertEqual(40);
    });

    /**
     * @tc.name   DataView10Test049
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_4900
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer49 = new ArrayBuffer(10);
      const view49 = new DataView(buffer49);
      try {
        view49.getUint8(-5);
      } catch (e) {
        expect(e instanceof RangeError).assertEqual(true);
      }
    });

    /**
     * @tc.name   DataView10Test050
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_5000
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer50 = new ArrayBuffer(10);
      const view50 = new DataView(buffer50);
      view50.setUint8(5, 0x01);
      expect(view50.getUint8(5)).assertEqual(1);
    });

    /**
     * @tc.name   DataView10Test051
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_5100
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer51 = new ArrayBuffer(1000);
      const view51 = new DataView(buffer51);
      view51.setUint8(500, 255);
      expect(view51.getUint8(500)).assertEqual(255);
    });

    /**
     * @tc.name   DataView10Test052
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_5200
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int32Buffer = new Int32Array([0x80000000]).buffer;
      const view52 = new DataView(int32Buffer);
      expect(view52.getUint8(0)).assertEqual(0x00);
    });

    /**
     * @tc.name   DataView10Test053
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_5300
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer53 = new ArrayBuffer(5);
      const view53 = new DataView(buffer53);
      view53.setUint8(3, 250);
      expect(view53.getUint8(3)).assertEqual(250);
    });

    /**
     * @tc.name   DataView10Test054
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_5400
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer54 = new ArrayBuffer(6);
      const view54 = new DataView(buffer54);
      view54.setUint8(5, 0);
      expect(view54.getUint8(5)).assertEqual(0);
    });

    /**
     * @tc.name   DataView10Test055
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_5500
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer55 = new ArrayBuffer(4);
      const view55 = new DataView(buffer55);
      [10, 20, 30, 40].forEach((val, i) => view55.setUint8(i, val));
      expect(view55.getUint8(0)).assertEqual(10);
      expect(view55.getUint8(3)).assertEqual(40);
    });

    /**
     * @tc.name   DataView10Test056
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_5600
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer56 = new ArrayBuffer(3);
      const view56 = new DataView(buffer56);
      try {
        view56.getUint8(3);
      } catch (e) {
        expect(e instanceof RangeError).assertEqual(true);
      }
    });

    /**
     * @tc.name   DataView10Test057
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_5700
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer57 = new ArrayBuffer(6);
      const view57 = new DataView(buffer57);
      view57.setUint8(4, 0x7E);
      expect(view57.getUint8(4)).assertEqual(126);
    });

    /**
     * @tc.name   DataView10Test058
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_5800
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint16Buffer2 = new Uint16Array([0xABCD]).buffer;
      const view58 = new DataView(uint16Buffer2);
      expect(view58.getUint8(1)).assertEqual(0xAB);
    });

    /**
     * @tc.name   DataView10Test059
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_5900
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer59 = new ArrayBuffer(10);
      const view59 = new DataView(buffer59);
      view59.setUint8(8, 99);
      expect(view59.getUint8(8)).assertEqual(99);
    });

    /**
     * @tc.name   DataView10Test060
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_6000
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer60 = new ArrayBuffer(1);
      const view60 = new DataView(buffer60);
      view60.setUint8(0, 5);
      expect(view60.getUint8(0)).assertEqual(5);
    });

    /**
     * @tc.name   DataView10Test061
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_6100
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer61 = new ArrayBuffer(2);
      const view61 = new DataView(buffer61);
      try {
        view61.getUint8(3);
      } catch (e) {
        expect(e instanceof RangeError).assertEqual(true);
      }

    });

    /**
     * @tc.name   DataView10Test062
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_6200
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer62 = new ArrayBuffer(1);
      const view62 = new DataView(buffer62);
      view62.setUint8(0, 64);
      expect(view62.getUint8(0)).assertEqual(64);
    });
    /**
     * @tc.name   DataView10Test063
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_6300
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer63 = new ArrayBuffer(30);
      const view63 = new DataView(buffer63);
      view63.setUint8(15, 180);
      expect(view63.getUint8(15)).assertEqual(180);
    });

    /**
     * @tc.name   DataView10Test064
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_6400
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer64 = new ArrayBuffer(5);
      const view64 = new DataView(buffer64);
      view64.setUint8(2, 0x05);
      expect(view64.getUint8(2)).assertEqual(5);
    });

    /**
     * @tc.name   DataView10Test065
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_6500
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int8NegBuffer = new Int8Array([-1]).buffer;
      const view65 = new DataView(int8NegBuffer);
      expect(view65.getUint8(0)).assertEqual(255);
    });

    /**
     * @tc.name   DataView10Test066
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_6600
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer66 = new ArrayBuffer(15);
      const view66 = new DataView(buffer66);
      try {
        view66.getUint8(-10);
      } catch (e) {
        expect(e instanceof RangeError).assertEqual(true);
      }
    });

    /**
     * @tc.name   DataView10Test067
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_6700
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer67 = new ArrayBuffer(1000);
      const view67 = new DataView(buffer67);
      view67.setUint8(999, 0);
      expect(view67.getUint8(999)).assertEqual(0);
    });

    /**
     * @tc.name   DataView10Test068
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_6800
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer68 = new ArrayBuffer(6);
      const view68 = new DataView(buffer68);
      view68.setUint8(3, 0x9A);
      expect(view68.getUint8(3)).assertEqual(154);
    });

    /**
     * @tc.name   DataView10Test069
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_6900
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer69 = new ArrayBuffer(1);
      const view69 = new DataView(buffer69);
      view69.setUint8(0, 255);
      view69.setUint8(0, 0);
      expect(view69.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.name   DataView10Test070
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_7000
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint32Buffer2 = new Uint32Array([0xABCD1234]).buffer;
      const view70 = new DataView(uint32Buffer2);
      expect(view70.getUint8(3)).assertEqual(0xAB);
    });

    /**
     * @tc.name   DataView10Test071
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_7100
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer71 = new ArrayBuffer(6);
      const view71 = new DataView(buffer71);
      view71.setUint8(4, 101);
      expect(view71.getUint8(4)).assertEqual(101);
    });

    /**
     * @tc.name   DataView10Test072
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_7200
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer72 = new ArrayBuffer(3);
      const view72 = new DataView(buffer72);
      view72.setUint8(0, 255);
      view72.setUint8(1, 0);
      view72.setUint8(2, 128);
      expect(view72.getUint8(2)).assertEqual(128);
    });

    /**
     * @tc.name   DataView10Test073
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_7300
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer73 = new ArrayBuffer(7);
      const view73 = new DataView(buffer73);
      view73.setUint8(6, 200);
      expect(view73.getUint8(6)).assertEqual(200);
    });

    /**
     * @tc.name   DataView10Test074
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_7400
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer74 = new ArrayBuffer(1);
      const view74 = new DataView(buffer74);
      view74.setUint8(0, 33);
      expect(view74.getUint8(0)).assertEqual(33);
    });

    /**
     * @tc.name   DataView10Test075
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_7500
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer75 = new ArrayBuffer(50);
      const view75 = new DataView(buffer75);
      view75.setUint8(25, 63);
      expect(view75.getUint8(25)).assertEqual(63);
    });

    /**
     * @tc.name   DataView10Test076
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_7600
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const float32NegBuffer = new Float32Array([-2.0]).buffer;
      const view76 = new DataView(float32NegBuffer);
      const negFloatByte = view76.getUint8(3);
      expect(view76.getUint8(3)).assertEqual(negFloatByte);
    });

    /**
     * @tc.name   DataView10Test077
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_7700
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer77 = new ArrayBuffer(4);
      const view77 = new DataView(buffer77);
      view77.setUint8(1, 0x3F);
      expect(view77.getUint8(1)).assertEqual(63);
    });

    /**
     * @tc.name   DataView10Test078
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_7800
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer78 = new ArrayBuffer(4);
      const view78 = new DataView(buffer78);
      [1, 2, 3, 4].forEach((val, i) => view78.setUint8(i, val));
      expect(view78.getUint8(1)).assertEqual(2);
    });

    /**
     * @tc.name   DataView10Test079
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_7900
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer79 = new ArrayBuffer(5);
      const view79 = new DataView(buffer79);
      try {
        view79.getUint8(6);
      } catch (e) {
        expect(e instanceof RangeError).assertEqual(true);
      }
    });

    /**
     * @tc.name   DataView10Test080
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_8000
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer80 = new ArrayBuffer(10);
      const view80 = new DataView(buffer80);
      view80.setUint8(5, 0xEE);
      expect(view80.getUint8(5)).assertEqual(238);
    });

    /**
     * @tc.name   DataView10Test081
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_8100
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer81 = new ArrayBuffer(10000);
      const view81 = new DataView(buffer81);
      view81.setUint8(5000, 127);
      expect(view81.getUint8(5000)).assertEqual(127);
    });

    /**
     * @tc.name   DataView10Test082
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_8200
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int16NegBuffer = new Int16Array([-32768]).buffer;
      const view82 = new DataView(int16NegBuffer);
      expect(view82.getUint8(0)).assertEqual(0x00);
    });

    /**
     * @tc.name   DataView10Test083
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_8300
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer83 = new ArrayBuffer(5);
      const view83 = new DataView(buffer83);
      view83.setUint8(3, 1);
      expect(view83.getUint8(3)).assertEqual(1);
    });

    /**
     * @tc.name   DataView10Test084
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_8400
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer84 = new ArrayBuffer(8);
      const view84 = new DataView(buffer84);
      view84.setUint8(7, 255);
      expect(view84.getUint8(7)).assertEqual(255);

    });

    /**
     * @tc.name   DataView10Test085
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_8500
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer85 = new ArrayBuffer(3);
      const view85 = new DataView(buffer85);
      view85.setUint8(0, 10);
      view85.setUint8(1, 20);
      view85.setUint8(0, 15);
      view85.setUint8(2, 30);
      expect(view85.getUint8(0)).assertEqual(15);
      expect(view85.getUint8(1)).assertEqual(20);
    });

    /**
     * @tc.name   DataView10Test086
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_8600
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer86 = new ArrayBuffer(10);
      const view86 = new DataView(buffer86);
      try {
        view86.getUint8(-1);
      } catch (e) {
        expect(e instanceof RangeError).assertEqual(true);
      }
    });

    /**
     * @tc.name   DataView10Test087
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_8700
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer87 = new ArrayBuffer(4);
      const view87 = new DataView(buffer87);
      view87.setUint8(2, 0x0D);
      expect(view87.getUint8(2)).assertEqual(13);
    });

    /**
     * @tc.name   DataView10Test088
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_8800
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint16Buffer3 = new Uint16Array([0x00FF]).buffer;
      const view88 = new DataView(uint16Buffer3);
      expect(view88.getUint8(0)).assertEqual(0xFF);
    });

    /**
     * @tc.name   DataView10Test089
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_8900
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer89 = new ArrayBuffer(10);
      const view89 = new DataView(buffer89);
      view89.setUint8(9, 55);
      expect(view89.getUint8(9)).assertEqual(55);
    });

    /**
     * @tc.name   DataView10Test090
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_9000
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer90 = new ArrayBuffer(1);
      const view90 = new DataView(buffer90);
      view90.setUint8(0, 128);
      expect(view90.getUint8(0)).assertEqual(128);
    });

    /**
     * @tc.name   DataView10Test091
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_9100
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer91 = new ArrayBuffer(3);
      const view91 = new DataView(buffer91);
      try {
        view91.getUint8(100);
      } catch (e) {
        expect(e instanceof RangeError).assertEqual(true);
      }
    });

    /**
     * @tc.name   DataView10Test092
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_9200
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer92 = new ArrayBuffer(1);
      const view92 = new DataView(buffer92);
      view92.setUint8(0, 126);
      expect(view92.getUint8(0)).assertEqual(126);
    });

    /**
     * @tc.name   DataView10Test093
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_9300
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer93 = new ArrayBuffer(40);
      const view93 = new DataView(buffer93);
      view93.setUint8(20, 199);
      expect(view93.getUint8(20)).assertEqual(199);
    });

    /**
     * @tc.name   DataView10Test094
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_9400
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer94 = new ArrayBuffer(3);
      const view94 = new DataView(buffer94);
      view94.setUint8(1, 0x10);
      expect(view94.getUint8(1)).assertEqual(16);
    });

    /**
     * @tc.name   DataView10Test095
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_9500
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int32Buffer2 = new Int32Array([0x12345678]).buffer;
      const view95 = new DataView(int32Buffer2);
      expect(view95.getUint8(1)).assertEqual(0x56);
    });

    /**
     * @tc.name   DataView10Test096
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_9600
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer96 = new ArrayBuffer(10);
      const view96 = new DataView(buffer96);
      try {
        view96.getUint8(-3);
      } catch (e) {
        expect(e instanceof RangeError).assertEqual(true);
      }
    });

    /**
     * @tc.name   DataView10Test097
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_9700
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer97 = new ArrayBuffer(500);
      const view97 = new DataView(buffer97);
      view97.setUint8(499, 3);
      expect(view97.getUint8(499)).assertEqual(3);
    });

    /**
     * @tc.name   DataView10Test098
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_9800
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer98 = new ArrayBuffer(6);
      const view98 = new DataView(buffer98);
      view98.setUint8(4, 0x66);
      expect(view98.getUint8(4)).assertEqual(102);
    });

    /**
     * @tc.name   DataView10Test099
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_9900
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer99 = new ArrayBuffer(1);
      const view99 = new DataView(buffer99);
      view99.setUint8(0, 10);
      view99.setUint8(0, 50);
      view99.setUint8(0, 3);
      expect(view99.getUint8(0)).assertEqual(3);
    });

    /**
     * @tc.name   DataView10Test100
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_10000
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint32Buffer3 = new Uint32Array([0x87654321]).buffer;
      const view100 = new DataView(uint32Buffer3);
      expect(view100.getUint8(0)).assertEqual(0x21);
    });

    /**
     * @tc.name   DataView10Test101
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_10100
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer101 = new ArrayBuffer(5);
      const view101 = new DataView(buffer101);
      view101.setUint8(2, 201);
      expect(view101.getUint8(2)).assertEqual(201);
    });

    /**
     * @tc.name   DataView10Test102
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_10200
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer102 = new ArrayBuffer(4);
      const view102 = new DataView(buffer102);
      view102.setUint8(0, 100);
      view102.setUint8(1, 200);
      view102.setUint8(2, 0);
      view102.setUint8(3, 255);
      expect(view102.getUint8(3)).assertEqual(255);
    });

    /**
     * @tc.name   DataView10Test103
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_10300
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer103 = new ArrayBuffer(6);
      const view103 = new DataView(buffer103);
      view103.setUint8(4, 15);
      expect(view103.getUint8(4)).assertEqual(15);
    });

    /**
     * @tc.name   DataView10Test104
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_10400
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer104 = new ArrayBuffer(1);
      const view104 = new DataView(buffer104);
      view104.setUint8(0, 53);
      expect(view104.getUint8(0)).assertEqual(53);
    });

    /**
     * @tc.name   DataView10Test105
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_10500
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer105 = new ArrayBuffer(60);
      const view105 = new DataView(buffer105);
      view105.setUint8(30, 77);
      expect(view105.getUint8(30)).assertEqual(77);
    });

    /**
     * @tc.name   DataView10Test106
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_10600
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const float64HalfBuffer = new Float64Array([0.5]).buffer;
      const view106 = new DataView(float64HalfBuffer);
      const halfByte4 = view106.getUint8(4);
      expect(view106.getUint8(4)).assertEqual(halfByte4);
    });

    /**
     * @tc.name   DataView10Test107
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_10700
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer107 = new ArrayBuffer(5);
      const view107 = new DataView(buffer107);
      view107.setUint8(3, 0x99);
      expect(view107.getUint8(3)).assertEqual(153);
    });

    /**
     * @tc.name   DataView10Test108
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_10800
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer108 = new ArrayBuffer(5);
      const view108 = new DataView(buffer108);
      [5, 4, 3, 2, 1].forEach((val, i) => view108.setUint8(i, val));
      expect(view108.getUint8(2)).assertEqual(3);
    });

    /**
     * @tc.name   DataView10Test109
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_10900
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer109 = new ArrayBuffer(2);
      const view109 = new DataView(buffer109);
      try {
        view109.getUint8(5);
      } catch (e) {
        expect(e instanceof RangeError).assertEqual(true);
      }
    });

    /**
     * @tc.name   DataView10Test110
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_11000
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer110 = new ArrayBuffer(10);
      const view110 = new DataView(buffer110);
      view110.setUint8(6, 0xDD);
      expect(view110.getUint8(6)).assertEqual(221);
    });

    /**
     * @tc.name   DataView10Test111
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_11100
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer111 = new ArrayBuffer(5000);
      const view111 = new DataView(buffer111);
      view111.setUint8(2500, 255);
      expect(view111.getUint8(2500)).assertEqual(255);
    });

    /**
     * @tc.name   DataView10Test112
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_11200
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int16MaxBuffer = new Int16Array([32767]).buffer;
      const view112 = new DataView(int16MaxBuffer);
      expect(view112.getUint8(1)).assertEqual(0x7F);
    });

    /**
     * @tc.name   DataView10Test113
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_11300
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer113 = new ArrayBuffer(6);
      const view113 = new DataView(buffer113);
      view113.setUint8(4, 0);
      expect(view113.getUint8(4)).assertEqual(0);
    });

    /**
     * @tc.name   DataView10Test114
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_11400
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer114 = new ArrayBuffer(9);
      const view114 = new DataView(buffer114);
      view114.setUint8(8, 127);
      expect(view114.getUint8(8)).assertEqual(127);
    });

    /**
     * @tc.name   DataView10Test115
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_11500
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer115 = new ArrayBuffer(2);
      const view115 = new DataView(buffer115);
      view115.setUint8(1, 99);
      view115.setUint8(0, 88);
      expect(view115.getUint8(0)).assertEqual(88);
      expect(view115.getUint8(1)).assertEqual(99);
    });

    /**
     * @tc.name   DataView10Test116
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_11600
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer116 = new ArrayBuffer(200);
      const view116 = new DataView(buffer116);
      try {
        view116.getUint8(-100);
      } catch (e) {
        expect(e instanceof RangeError).assertEqual(true);
      }
    });

    /**
     * @tc.name   DataView10Test117
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_11700
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer117 = new ArrayBuffer(3);
      const view117 = new DataView(buffer117);
      view117.setUint8(1, 0x07);
      expect(view117.getUint8(1)).assertEqual(7);
    });

    /**
     * @tc.name   DataView10Test118
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_11800
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint16Buffer4 = new Uint16Array([0x1100]).buffer;
      const view118 = new DataView(uint16Buffer4);
      expect(view118.getUint8(1)).assertEqual(0x11);
    });

    /**
     * @tc.name   DataView10Test119
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_11900
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer119 = new ArrayBuffer(10);
      const view119 = new DataView(buffer119);
      view119.setUint8(8, 88);
      expect(view119.getUint8(8)).assertEqual(88);
    });

    /**
     * @tc.name   DataView10Test120
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_12000
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer120 = new ArrayBuffer(1);
      const view120 = new DataView(buffer120);
      view120.setUint8(0, 255);
      expect(view120.getUint8(0)).assertEqual(255);
    });

    /**
     * @tc.name   DataView10Test121
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_12100
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer121 = new ArrayBuffer(5);
      const view121 = new DataView(buffer121);
      try {
        view121.getUint8(1000);
      } catch (e) {
        expect(e instanceof RangeError).assertEqual(true);
      }
    });

    /**
     * @tc.name   DataView10Test122
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_12200
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer122 = new ArrayBuffer(1);
      const view122 = new DataView(buffer122);
      view122.setUint8(0, 32);
      expect(view122.getUint8(0)).assertEqual(32);
    });

    /**
     * @tc.name   DataView10Test123
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_12300
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer123 = new ArrayBuffer(70);
      const view123 = new DataView(buffer123);
      view123.setUint8(35, 144);
      expect(view123.getUint8(35)).assertEqual(144);
    });

    /**
     * @tc.name   DataView10Test124
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_12400
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer124 = new ArrayBuffer(4);
      const view124 = new DataView(buffer124);
      view124.setUint8(2, 0x22);
      expect(view124.getUint8(2)).assertEqual(34);
    });

    /**
     * @tc.name   DataView10Test125
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_12500
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int8MinBuffer = new Int8Array([-128]).buffer;
      const view125 = new DataView(int8MinBuffer);
      expect(view125.getUint8(0)).assertEqual(128);
    });

    /**
     * @tc.name   DataView10Test126
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_12600
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer126 = new ArrayBuffer(100);
      const view126 = new DataView(buffer126);
      try {
        view126.getUint8(-50);
      } catch (e) {
        expect(e instanceof RangeError).assertEqual(true);
      }
    });

    /**
     * @tc.name   DataView10Test127
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_12700
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer127 = new ArrayBuffer(800);
      const view127 = new DataView(buffer127);
      view127.setUint8(799, 99);
      expect(view127.getUint8(799)).assertEqual(99);
    });

    /**
     * @tc.name   DataView10Test128
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_12800
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer128 = new ArrayBuffer(7);
      const view128 = new DataView(buffer128);
      view128.setUint8(5, 0xAA);
      expect(view128.getUint8(5)).assertEqual(170);
    });

    /**
     * @tc.name   DataView10Test129
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_12900
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer129 = new ArrayBuffer(1);
      const view129 = new DataView(buffer129);
      view129.setUint8(0, 0);
      view129.setUint8(0, 255);
      expect(view129.getUint8(0)).assertEqual(255);
    });

    /**
     * @tc.name   DataView10Test130
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_13000
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint32Buffer4 = new Uint32Array([0x44332211]).buffer;
      const view130 = new DataView(uint32Buffer4);
      expect(view130.getUint8(2)).assertEqual(0x33);
    });

    /**
     * @tc.name   DataView10Test131
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_13100
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer131 = new ArrayBuffer(6);
      const view131 = new DataView(buffer131);
      view131.setUint8(3, 111);
      expect(view131.getUint8(3)).assertEqual(111);
    });

    /**
     * @tc.name   DataView10Test132
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_13200
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer132 = new ArrayBuffer(5);
      const view132 = new DataView(buffer132);
      [255, 128, 64, 32, 16].forEach((val, i) => view132.setUint8(i, val));
      expect(view132.getUint8(1)).assertEqual(128);
    });

    /**
     * @tc.name   DataView10Test133
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_13300
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer133 = new ArrayBuffer(9);
      const view133 = new DataView(buffer133);
      view133.setUint8(6, 42);
      expect(view133.getUint8(6)).assertEqual(42);
    });

    /**
     * @tc.name   DataView10Test134
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_13400
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer134 = new ArrayBuffer(1);
      const view134 = new DataView(buffer134);
      view134.setUint8(0, 90);
      expect(view134.getUint8(0)).assertEqual(90);
    });

    /**
     * @tc.name   DataView10Test135
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_13500
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer135 = new ArrayBuffer(90);
      const view135 = new DataView(buffer135);
      view135.setUint8(45, 11);
      expect(view135.getUint8(45)).assertEqual(11);
    });

    /**
     * @tc.name   DataView10Test136
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_13600
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const float32PiBuffer = new Float32Array([3.14]).buffer;
      const view136 = new DataView(float32PiBuffer);
      const piByte1 = view136.getUint8(1);
      expect(view136.getUint8(1)).assertEqual(piByte1);
    });

    /**
     * @tc.name   DataView10Test137
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_13700
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer137 = new ArrayBuffer(3);
      const view137 = new DataView(buffer137);
      view137.setUint8(1, 0x55);
      expect(view137.getUint8(1)).assertEqual(85);
    });

    /**
     * @tc.name   DataView10Test138
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_13800
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer138 = new ArrayBuffer(6);
      const view138 = new DataView(buffer138);
      [10, 20, 30, 40, 50, 60].forEach((val, i) => view138.setUint8(i, val));
      expect(view138.getUint8(4)).assertEqual(50);
    });

    /**
     * @tc.name   DataView10Test139
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_13900
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer139 = new ArrayBuffer(3);
      const view139 = new DataView(buffer139);
      try {
        view139.getUint8(7);
      } catch (e) {
        expect(e instanceof RangeError).assertEqual(true);
      }
    });

    /**
     * @tc.name   DataView10Test140
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_14000
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer140 = new ArrayBuffer(10);
      const view140 = new DataView(buffer140);
      view140.setUint8(7, 0x33);
      expect(view140.getUint8(7)).assertEqual(51);
    });

    /**
     * @tc.name   DataView10Test141
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_14100
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer141 = new ArrayBuffer(20000);
      const view141 = new DataView(buffer141);
      view141.setUint8(10000, 66);
      expect(view141.getUint8(10000)).assertEqual(66);
    });

    /**
     * @tc.name   DataView10Test142
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_14200
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int32Neg1Buffer = new Int32Array([-1]).buffer;
      const view142 = new DataView(int32Neg1Buffer);
      expect(view142.getUint8(3)).assertEqual(0xFF);
    });

    /**
     * @tc.name   DataView10Test143
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_14300
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer143 = new ArrayBuffer(7);
      const view143 = new DataView(buffer143);
      view143.setUint8(5, 255);
      expect(view143.getUint8(5)).assertEqual(255);
    });

    /**
     * @tc.name   DataView10Test144
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_14400
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer144 = new ArrayBuffer(10);
      const view144 = new DataView(buffer144);
      view144.setUint8(9, 0);
      expect(view144.getUint8(9)).assertEqual(0);
    });

    /**
     * @tc.name   DataView10Test145
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_14500
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer145 = new ArrayBuffer(3);
      const view145 = new DataView(buffer145);
      view145.setUint8(0, 1);
      view145.setUint8(1, 2);
      view145.setUint8(2, 3);
      view145.setUint8(2, 4);
      expect(view145.getUint8(0)).assertEqual(1);
      expect(view145.getUint8(1)).assertEqual(2);
    });

    /**
     * @tc.name   DataView10Test146
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_14600
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer146 = new ArrayBuffer(500);
      const view146 = new DataView(buffer146);
      try {
        view146.getUint8(-200);
      } catch (e) {
        expect(e instanceof RangeError).assertEqual(true);
      }
    });

    /**
     * @tc.name   DataView10Test147
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_14700
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer147 = new ArrayBuffer(5);
      const view147 = new DataView(buffer147);
      view147.setUint8(3, 0x0C);
      expect(view147.getUint8(3)).assertEqual(12);
    });

    /**
     * @tc.name   DataView10Test148
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_14800
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint16Buffer5 = new Uint16Array([0xFF00]).buffer;
      const view148 = new DataView(uint16Buffer5);
      expect(view148.getUint8(0)).assertEqual(0x00);
    });

    /**
     * @tc.name   DataView10Test149
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_14900
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer149 = new ArrayBuffer(8);
      const view149 = new DataView(buffer149);
      view149.setUint8(6, 177);
      expect(view149.getUint8(6)).assertEqual(177);
    });

    /**
     * @tc.name   DataView10Test150
     * @tc.number SUB_BUILTINS_DATAVIEW10_TEST_15000
     * @tc.desc   test DataView getUint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView10Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer150 = new ArrayBuffer(1);
      const view150 = new DataView(buffer150);
      view150.setUint8(0, 63);
      expect(view150.getUint8(0)).assertEqual(63);
    });

  })
}