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

class NumHolder {
  get value() {
    return 11.11;
  }
}

export default function DataView16Test() {
  describe('DataView16Test', () => {
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
     * @tc.name   DataView16Test001
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_0100
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer1 = new ArrayBuffer(8);
      const view1 = new DataView(buffer1);
      view1.setFloat64(0, 0, false);
      expect(view1.getFloat64(0, false)).assertEqual(0);
    });

    /**
     * @tc.name   DataView16Test002
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_0200
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer2 = new ArrayBuffer(8);
      const view2 = new DataView(buffer2);
      view2.setFloat64(0, -0, false);
      expect(view2.getFloat64(0, false)).assertEqual(-0);
    });

    /**
     * @tc.name   DataView16Test003
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_0300
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer3 = new ArrayBuffer(8);
      const view3 = new DataView(buffer3);
      view3.setFloat64(0, Infinity, false);
      expect(view3.getFloat64(0, false)).assertEqual(Infinity);

    });

    /**
     * @tc.name   DataView16Test004
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_0400
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer4 = new ArrayBuffer(8);
      const view4 = new DataView(buffer4);
      view4.setFloat64(0, -Infinity, true);
      expect(view4.getFloat64(0, true)).assertEqual(-Infinity);
    });

    /**
     * @tc.name   DataView16Test005
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_0500
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer5 = new ArrayBuffer(8);
      const view5 = new DataView(buffer5);
      view5.setFloat64(0, NaN, false);
      expect(Number.isNaN(view5.getFloat64(0, false))).assertEqual(true);
    });

    /**
     * @tc.name   DataView16Test006
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_0600
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer6 = new ArrayBuffer(8);
      const view6 = new DataView(buffer6);
      const minSafe = Number.MIN_SAFE_INTEGER;
      view6.setFloat64(0, minSafe, false);
      expect(view6.getFloat64(0, false)).assertEqual(minSafe);
    });

    /**
     * @tc.name   DataView16Test007
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_0700
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer7 = new ArrayBuffer(8);
      const view7 = new DataView(buffer7);
      const maxSafe = Number.MAX_SAFE_INTEGER;
      view7.setFloat64(0, maxSafe, true);
      expect(view7.getFloat64(0, true)).assertEqual(maxSafe);
    });

    /**
     * @tc.name   DataView16Test008
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_0800
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer8 = new ArrayBuffer(8);
      const view8 = new DataView(buffer8);
      view8.setFloat64(0, Number.EPSILON, false);
      expect(view8.getFloat64(0, false)).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.name   DataView16Test009
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_0900
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer9 = new ArrayBuffer(8);
      const view9 = new DataView(buffer9);
      view9.setFloat64(0, Math.PI, true);
      expect(view9.getFloat64(0, true)).assertEqual(Math.PI);
    });

    /**
     * @tc.name   DataView16Test010
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_1000
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer10 = new ArrayBuffer(8);
      const view10 = new DataView(buffer10);
      view10.setFloat64(0, Math.E, false);
      expect(view10.getFloat64(0, false)).assertEqual(Math.E);
    });

    /**
     * @tc.name   DataView16Test011
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_1100
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer11 = new ArrayBuffer(8);
      const view11 = new DataView(buffer11);
      view11.setFloat64(0, 0.123456789, true);
      expect(view11.getFloat64(0, true)).assertEqual(0.123456789);
    });

    /**
     * @tc.name   DataView16Test012
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_1200
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer12 = new ArrayBuffer(8);
      const view12 = new DataView(buffer12);
      view12.setFloat64(0, 1.23e-10, false);
      expect(view12.getFloat64(0, false)).assertEqual(1.23e-10);
    });

    /**
     * @tc.name   DataView16Test013
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_1300
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer13 = new ArrayBuffer(8);
      const view13 = new DataView(buffer13);
      view13.setFloat64(0, Number.MAX_VALUE, true);
      expect(view13.getFloat64(0, true)).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.name   DataView16Test014
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_1400
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer14 = new ArrayBuffer(8);
      const view14 = new DataView(buffer14);
      view14.setFloat64(0, Number.MIN_VALUE, false);
      expect(view14.getFloat64(0, false)).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.name   DataView16Test015
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_1500
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer15 = new ArrayBuffer(8);
      const view15 = new DataView(buffer15);
      view15.setFloat64(0, -1, true);
      expect(view15.getFloat64(0, true)).assertEqual(-1);
    });

    /**
     * @tc.name   DataView16Test016
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_1600
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer16 = new ArrayBuffer(8);
      const view16 = new DataView(buffer16);
      view16.setFloat64(0, 42.5, false); // 大端写入
      expect(view16.getFloat64(0, false)).assertEqual(42.5);
    });

    /**
     * @tc.name   DataView16Test017
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_1700
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer17 = new ArrayBuffer(8);
      const view17 = new DataView(buffer17);
      view17.setFloat64(0, -99.99, true);
      expect(view17.getFloat64(0, true)).assertEqual(-99.99);
    });

    /**
     * @tc.name   DataView16Test018
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_1800
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer18 = new ArrayBuffer(8);
      const view18 = new DataView(buffer18);
      view18.setFloat64(0, 1000, false);
      expect(view18.getFloat64(0, false)).assertEqual(1000);
    });

    /**
     * @tc.name   DataView16Test019
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_1900
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer19 = new ArrayBuffer(8);
      const view19 = new DataView(buffer19);
      view19.setFloat64(0, 0.000000123456789, true);
      expect(view19.getFloat64(0, true)).assertEqual(0.000000123456789);
    });

    /**
     * @tc.name   DataView16Test020
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_2000
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer20 = new ArrayBuffer(8);
      const view20 = new DataView(buffer20);
      view20.setFloat64(0, 1.7976931348623157e+308, false);
      expect(view20.getFloat64(0, false)).assertEqual(1.7976931348623157e+308);
    });

    /**
     * @tc.name   DataView16Test021
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_2100
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer21 = new ArrayBuffer(8);
      const view21 = new DataView(buffer21);
      view21.setFloat64(0, 0.9999999999999999, true);
      expect(view21.getFloat64(0, true)).assertEqual(0.9999999999999999);
    });

    /**
     * @tc.name   DataView16Test022
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_2200
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer22 = new ArrayBuffer(8);
      const view22 = new DataView(buffer22);
      view22.setFloat64(0, Math.pow(2, 53), false);
      expect(view22.getFloat64(0, false)).assertEqual(Math.pow(2, 53));
    });

    /**
     * @tc.name   DataView16Test023
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_2300
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer23 = new ArrayBuffer(8);
      const view23 = new DataView(buffer23);
      view23.setFloat64(0, -0.5, true);
      expect(view23.getFloat64(0, true)).assertEqual(-0.5);
    });

    /**
     * @tc.name   DataView16Test024
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_2400
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer24 = new ArrayBuffer(8);
      const view24 = new DataView(buffer24);
      view24.setFloat64(0, 123456789.987654321, false);
      expect(view24.getFloat64(0, false)).assertEqual(123456789.987654321);
    });

    /**
     * @tc.name   DataView16Test025
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_2500
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer25 = new ArrayBuffer(8);
      const view25 = new DataView(buffer25);
      view25.setFloat64(0, Number.NaN, true);
      expect(Number.isNaN(view25.getFloat64(0, true))).assertEqual(true);
    });

    /**
     * @tc.name   DataView16Test026
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_2600
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer26 = new ArrayBuffer(8);
      const view26 = new DataView(buffer26);
      view26.setFloat64(0, -Number.MIN_VALUE, false);
      expect(view26.getFloat64(0, false)).assertEqual(-Number.MIN_VALUE);
    });

    /**
     * @tc.name   DataView16Test027
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_2700
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer27 = new ArrayBuffer(8);
      const view27 = new DataView(buffer27);
      view27.setFloat64(0, -Math.PI, true);
      expect(view27.getFloat64(0, true)).assertEqual(-Math.PI);
    });

    /**
     * @tc.name   DataView16Test028
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_2800
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer28 = new ArrayBuffer(8);
      const view28 = new DataView(buffer28);
      const oneThird = 1 / 3;
      view28.setFloat64(0, oneThird, false);
      expect(view28.getFloat64(0, false)).assertEqual(oneThird);
    });

    /**
     * @tc.name   DataView16Test037
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_3700
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer37 = new ArrayBuffer(8);
      const view37 = new DataView(buffer37);
      view37.setFloat64(0, 1.1, false);
      expect(view37.getFloat64(0, false)).assertEqual(1.1);
    });

    /**
     * @tc.name   DataView16Test038
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_3800
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer38 = new ArrayBuffer(16);
      const view38 = new DataView(buffer38);
      view38.setFloat64(8, 2.2, true);
      expect(view38.getFloat64(8, true)).assertEqual(2.2);
    });

    /**
     * @tc.name   DataView16Test039
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_3900
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer39 = new ArrayBuffer(16);
      const view39 = new DataView(buffer39);
      view39.setFloat64(0, 100.1, false);
      view39.setFloat64(8, 200.2, false);
      expect(view39.getFloat64(0, false)).assertEqual(100.1);
      expect(view39.getFloat64(8, false)).assertEqual(200.2);
    });

    /**
     * @tc.name   DataView16Test040
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_4000
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer40 = new ArrayBuffer(8);
      const view40 = new DataView(buffer40);
      view40.setFloat64(0, 999.999, true);
      view40.setFloat64(0, 888.888, true);
      expect(view40.getFloat64(0, true)).assertEqual(888.888);
    });

    /**
     * @tc.name   DataView16Test041
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_4100
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer41 = new ArrayBuffer(8);
      const view41 = new DataView(buffer41);
      view41.setFloat64(0, Number.POSITIVE_INFINITY, false);
      expect(view41.getFloat64(0, false)).assertEqual(Infinity);
    });

    /**
     * @tc.name   DataView16Test042
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_4200
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer42 = new ArrayBuffer(8);
      const view42 = new DataView(buffer42);
      view42.setFloat64(0, Number.NEGATIVE_INFINITY, true);
      expect(view42.getFloat64(0, true)).assertEqual(-Infinity);
    });

    /**
     * @tc.name   DataView16Test043
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_4300
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer43 = new ArrayBuffer(8);
      const view43 = new DataView(buffer43);
      view43.setFloat64(0, -0, false);
      expect(view43.getFloat64(0, false)).assertEqual(-0);
    });

    /**
     * @tc.name   DataView16Test044
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_4400
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer44 = new ArrayBuffer(8);
      const view44 = new DataView(buffer44);
      const nearMax = Number.MAX_VALUE * 0.9999999999999999;
      view44.setFloat64(0, nearMax, true);
      expect(view44.getFloat64(0, true)).assertEqual(nearMax);
    });

    /**
     * @tc.name   DataView16Test045
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_4500
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer45 = new ArrayBuffer(8);
      const view45 = new DataView(buffer45);
      view45.setFloat64(0, 1e-300, false);
      expect(view45.getFloat64(0, false)).assertEqual(1e-300);
    });

    /**
     * @tc.name   DataView16Test046
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_4600
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer46 = new ArrayBuffer(8);
      const view46 = new DataView(buffer46);
      view46.setFloat64(0, -1e-300, true);
      expect(view46.getFloat64(0, true)).assertEqual(-1e-300);
    });

    /**
     * @tc.name   DataView16Test047
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_4700
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer47 = new ArrayBuffer(8);
      const view47 = new DataView(buffer47);
      view47.setFloat64(0, Math.LOG2E, false);
      expect(view47.getFloat64(0, false)).assertEqual(Math.LOG2E);
    });

    /**
     * @tc.name   DataView16Test048
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_4800
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer48 = new ArrayBuffer(8);
      const view48 = new DataView(buffer48);
      view48.setFloat64(0, Math.SQRT2, true);
      expect(view48.getFloat64(0, true)).assertEqual(Math.SQRT2);
    });

    /**
     * @tc.name   DataView16Test049
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_4900
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer49 = new ArrayBuffer(8);
      const view49 = new DataView(buffer49);
      const now = Date.now();
      view49.setFloat64(0, now, false);
      expect(view49.getFloat64(0, false)).assertEqual(now);
    });

    /**
     * @tc.name   DataView16Test050
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_5000
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer50 = new ArrayBuffer(8);
      const view50 = new DataView(buffer50);
      const perf = 12345.6789;
      view50.setFloat64(0, perf, true);
      expect(view50.getFloat64(0, true)).assertEqual(perf);
    });

    /**
     * @tc.name   DataView16Test051
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_5100
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer51 = new ArrayBuffer(8);
      const view51 = new DataView(buffer51);
      const sin1 = Math.sin(1);
      view51.setFloat64(0, sin1, false);
      expect(view51.getFloat64(0, false)).assertEqual(sin1);
    });

    /**
     * @tc.name   DataView16Test052
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_5200
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer52 = new ArrayBuffer(8);
      const view52 = new DataView(buffer52);
      view52.setFloat64(0, Math.cos(Math.PI), true);
      expect(view52.getFloat64(0, true)).assertEqual(Math.cos(Math.PI));
    });

    /**
     * @tc.name   DataView16Test053
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_5300
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer53 = new ArrayBuffer(8);
      const view53 = new DataView(buffer53);
      const invEps = 1 / Number.EPSILON;
      view53.setFloat64(0, invEps, false);
      expect(view53.getFloat64(0, false)).assertEqual(invEps);
    });

    /**
     * @tc.name   DataView16Test054
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_5400
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer54 = new ArrayBuffer(8);
      const view54 = new DataView(buffer54);
      view54.setFloat64(0, -Number.MAX_SAFE_INTEGER, true);
      expect(view54.getFloat64(0, true)).assertEqual(-Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.name   DataView16Test055
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_5500
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer55 = new ArrayBuffer(8);
      const view55 = new DataView(buffer55);
      const subnormal = 5e-324; // 最小可表示正数
      view55.setFloat64(0, subnormal, false);
      expect(view55.getFloat64(0, false)).assertEqual(subnormal);

    });

    /**
     * @tc.name   DataView16Test056
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_5600
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer56 = new ArrayBuffer(8);
      const view56 = new DataView(buffer56);
      view56.setFloat64(0, -5e-324, true);
      expect(view56.getFloat64(0, true)).assertEqual(-5e-324);
    });

    /**
     * @tc.name   DataView16Test061
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_6100
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer61 = new ArrayBuffer(8);
      const view61 = new DataView(buffer61);
      const halfMax = Number.MAX_VALUE / 2;
      view61.setFloat64(0, halfMax, false);
      expect(view61.getFloat64(0, false)).assertEqual(halfMax);
    });

    /**
     * @tc.name   DataView16Test062
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_6200
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer62 = new ArrayBuffer(8);
      const view62 = new DataView(buffer62);
      const negHalfMax = -Number.MAX_VALUE / 2;
      view62.setFloat64(0, negHalfMax, true);
      expect(view62.getFloat64(0, true)).assertEqual(negHalfMax);

    });
    /**
     * @tc.name   DataView16Test063
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_6300
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer63 = new ArrayBuffer(8);
      const view63 = new DataView(buffer63);
      const piApprox = Math.atan(1) * 4;
      view63.setFloat64(0, piApprox, false);
      expect(view63.getFloat64(0, false)).assertEqual(piApprox);
    });

    /**
     * @tc.name   DataView16Test064
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_6400
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer64 = new ArrayBuffer(8);
      const view64 = new DataView(buffer64);
      const randInt = (0 | Math.random() * 1e9) + 0.123;
      view64.setFloat64(0, randInt, true);
      expect(view64.getFloat64(0, true)).assertEqual(randInt);
    });

    /**
     * @tc.name   DataView16Test065
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_6500
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer65 = new ArrayBuffer(8);
      const view65 = new DataView(buffer65);
      const utcTime = Date.UTC(2025, 0, 1);
      view65.setFloat64(0, utcTime, false);
      expect(view65.getFloat64(0, false)).assertEqual(utcTime);
    });

    /**
     * @tc.name   DataView16Test066
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_6600
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer66 = new ArrayBuffer(8);
      const view66 = new DataView(buffer66);
      view66.setFloat64(0, -86400000, true);
      expect(view66.getFloat64(0, true)).assertEqual(-86400000);
    });

    /**
     * @tc.name   DataView16Test067
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_6700
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // 67. 写入 Number.EPSILON * 2
      const buffer67 = new ArrayBuffer(8);
      const view67 = new DataView(buffer67);
      const eps2 = Number.EPSILON * 2;
      view67.setFloat64(0, eps2, false);
      expect(view67.getFloat64(0, false)).assertEqual(eps2);
    });

    /**
     * @tc.name   DataView16Test068
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_6800
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // 68. 写入 1 - Number.EPSILON
      const buffer68 = new ArrayBuffer(8);
      const view68 = new DataView(buffer68);
      const oneMinusEps = 1 - Number.EPSILON;
      view68.setFloat64(0, oneMinusEps, true);
      expect(view68.getFloat64(0, true)).assertEqual(oneMinusEps);
    });

    /**
     * @tc.name   DataView16Test069
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_6900
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer69 = new ArrayBuffer(8);
      const view69 = new DataView(buffer69);
      view69.setFloat64(0, Math.LN2, false);
      expect(view69.getFloat64(0, false)).assertEqual(Math.LN2);
    });

    /**
     * @tc.name   DataView16Test070
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_7000
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer70 = new ArrayBuffer(8);
      const view70 = new DataView(buffer70);
      view70.setFloat64(0, Math.LN10, true);
      expect(view70.getFloat64(0, true)).assertEqual(Math.LN10);
    });

    /**
     * @tc.name   DataView16Test071
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_7100
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer71 = new ArrayBuffer(8);
      const view71 = new DataView(buffer71);
      view71.setFloat64(0, Math.LOG10E, false);
      expect(view71.getFloat64(0, false)).assertEqual(Math.LOG10E);
    });

    /**
     * @tc.name   DataView16Test072
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_7200
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer72 = new ArrayBuffer(8);
      const view72 = new DataView(buffer72);
      view72.setFloat64(0, Math.SQRT1_2, true);
      expect(view72.getFloat64(0, true)).assertEqual(Math.SQRT1_2);
    });

    /**
     * @tc.name   DataView16Test073
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_7300
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer73 = new ArrayBuffer(8);
      const view73 = new DataView(buffer73);
      const sum = 0.1 + 0.2;
      view73.setFloat64(0, sum, false);
      expect(view73.getFloat64(0, false)).assertEqual(sum);
    });

    /**
     * @tc.name   DataView16Test074
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_7400
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer74 = new ArrayBuffer(8);
      const view74 = new DataView(buffer74);
      view74.setFloat64(0, 1e308, true);
      expect(view74.getFloat64(0, true)).assertEqual(1e308);
    });

    /**
     * @tc.name   DataView16Test075
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_7500
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer75 = new ArrayBuffer(8);
      const view75 = new DataView(buffer75);
      view75.setFloat64(0, -1e308, false);
      expect(view75.getFloat64(0, false)).assertEqual(-1e308);
    });

    /**
     * @tc.name   DataView16Test076
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_7600
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer76 = new ArrayBuffer(8);
      const view76 = new DataView(buffer76);
      const bigIntFloat = 9007199254740994;
      view76.setFloat64(0, bigIntFloat, true);
      expect(view76.getFloat64(0, true)).assertEqual(bigIntFloat);
    });

    /**
     * @tc.name   DataView16Test077
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_7700
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer77 = new ArrayBuffer(8);
      const view77 = new DataView(buffer77);
      view77.setFloat64(0, -9007199254740994, false);
      expect(view77.getFloat64(0, false)).assertEqual(-9007199254740994);
    });

    /**
     * @tc.name   DataView16Test078
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_7800
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer78 = new ArrayBuffer(8);
      const view78 = new DataView(buffer78);
      const parsed = Number.parseFloat("123.456");
      view78.setFloat64(0, parsed, true);
      expect(view78.getFloat64(0, true)).assertEqual(parsed);
    });

    /**
     * @tc.name   DataView16Test079
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_7900
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer79 = new ArrayBuffer(8);
      const view79 = new DataView(buffer79);
      const numFromStr = Number("3.14159");
      view79.setFloat64(0, numFromStr, false);
      expect(view79.getFloat64(0, false)).assertEqual(numFromStr);
    });

    /**
     * @tc.name   DataView16Test083
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_8300
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer83 = new ArrayBuffer(8);
      const view83 = new DataView(buffer83);
      view83.setFloat64(0, Math.hypot(3, 4), false);
      expect(view83.getFloat64(0, false)).assertEqual(5);
    });

    /**
     * @tc.name   DataView16Test084
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_8400
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer84 = new ArrayBuffer(8);
      const view84 = new DataView(buffer84);
      view84.setFloat64(0, Math.cbrt(27), true);
      expect(view84.getFloat64(0, true)).assertEqual(3);
    });

    /**
     * @tc.name   DataView16Test085
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_8500
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer85 = new ArrayBuffer(8);
      const view85 = new DataView(buffer85);
      view85.setFloat64(0, Math.exp(1), false);
      expect(view85.getFloat64(0, false)).assertEqual(Math.exp(1));
    });

    /**
     * @tc.name   DataView16Test086
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_8600
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer86 = new ArrayBuffer(8);
      const view86 = new DataView(buffer86);
      view86.setFloat64(0, Math.log(Math.E), true);
      expect(view86.getFloat64(0, true)).assertEqual(1);
    });

    /**
     * @tc.name   DataView16Test087
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_8700
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer87 = new ArrayBuffer(8);
      const view87 = new DataView(buffer87);
      const tanVal = Math.tan(Math.PI / 4);
      view87.setFloat64(0, tanVal, false);
      expect(view87.getFloat64(0, false)).assertEqual(tanVal);
    });

    /**
     * @tc.name   DataView16Test088
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_8800
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer88 = new ArrayBuffer(8);
      const view88 = new DataView(buffer88);
      view88.setFloat64(0, Math.asin(1), true);
      expect(view88.getFloat64(0, true)).assertEqual(Math.asin(1));
    });

    /**
     * @tc.name   DataView16Test089
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_8900
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer89 = new ArrayBuffer(8);
      const view89 = new DataView(buffer89);
      view89.setFloat64(0, Math.acos(0), false);
      expect(view89.getFloat64(0, false)).assertEqual(Math.acos(0));
    });

    /**
     * @tc.name   DataView16Test090
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_9000
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer90 = new ArrayBuffer(8);
      const view90 = new DataView(buffer90);
      view90.setFloat64(0, Math.atan2(1, 1), true);
      expect(view90.getFloat64(0, true)).assertEqual(Math.atan2(1, 1));
    });

    /**
     * @tc.name   DataView16Test091
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_9100
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer91 = new ArrayBuffer(8);
      const view91 = new DataView(buffer91);
      const froundVal = Math.fround(0.1);
      view91.setFloat64(0, froundVal, false);
      expect(view91.getFloat64(0, false)).assertEqual(froundVal);
    });

    /**
     * @tc.name   DataView16Test092
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_9200
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer92 = new ArrayBuffer(8);
      const view92 = new DataView(buffer92);
      const minVal2 = Number.MIN_VALUE * 2;
      view92.setFloat64(0, minVal2, true);
      expect(view92.getFloat64(0, true)).assertEqual(minVal2);
    });

    /**
     * @tc.name   DataView16Test093
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_9300
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer93 = new ArrayBuffer(8);
      const view93 = new DataView(buffer93);
      const shifted = (1 << 30) + 0.5;
      view93.setFloat64(0, shifted, false);
      expect(view93.getFloat64(0, false)).assertEqual(shifted);
    });

    /**
     * @tc.name   DataView16Test094
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_9400
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer94 = new ArrayBuffer(8);
      const view94 = new DataView(buffer94);
      const minSubNeg = -Math.pow(2, -1074);
      view94.setFloat64(0, minSubNeg, true);
      expect(view94.getFloat64(0, true)).assertEqual(minSubNeg);
    });

    /**
     * @tc.name   DataView16Test095
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_9500
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer95 = new ArrayBuffer(8);
      const view95 = new DataView(buffer95);
      const minSubPos = Math.pow(2, -1074);
      view95.setFloat64(0, minSubPos, false);
      expect(view95.getFloat64(0, false)).assertEqual(minSubPos);
    });

    /**
     * @tc.name   DataView16Test099
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_9900
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer99 = new ArrayBuffer(8);
      const view99 = new DataView(buffer99);
      const bigIntNum = Number(1234567890123456789n);
      view99.setFloat64(0, bigIntNum, false);
      expect(view99.getFloat64(0, false)).assertEqual(bigIntNum);
    });

    /**
     * @tc.name   DataView16Test100
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_10000
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer100 = new ArrayBuffer(8);
      const view100 = new DataView(buffer100);
      const negBigIntNum = Number(-9876543210987654321n);
      view100.setFloat64(0, negBigIntNum, true);
      expect(view100.getFloat64(0, true)).assertEqual(negBigIntNum);
    });

    /**
     * @tc.name   DataView16Test103
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_10300
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer103 = new ArrayBuffer(8);
      const view103 = new DataView(buffer103);
      const dateVal = new Date().valueOf();
      view103.setFloat64(0, dateVal, false);
      expect(view103.getFloat64(0, false)).assertEqual(dateVal);
    });

    /**
     * @tc.name   DataView16Test105
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_10500
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer105 = new ArrayBuffer(8);
      const view105 = new DataView(buffer105);
      const imulRes = Math.imul(0x12345678, 0x9ABCDEF);
      view105.setFloat64(0, imulRes, false);
      expect(view105.getFloat64(0, false)).assertEqual(imulRes);
    });

    /**
     * @tc.name   DataView16Test106
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_10600
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer106 = new ArrayBuffer(8);
      const view106 = new DataView(buffer106);
      const parsedInt = Number.parseInt("0xFF");
      view106.setFloat64(0, parsedInt, true);
      expect(view106.getFloat64(0, true)).assertEqual(parsedInt);
    });

    /**
     * @tc.name   DataView16Test107
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_10700
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer107 = new ArrayBuffer(8);
      const view107 = new DataView(buffer107);
      const infFromStr = Number("Infinity");
      view107.setFloat64(0, infFromStr, false);
      expect(view107.getFloat64(0, false)).assertEqual(Infinity);
    });

    /**
     * @tc.name   DataView16Test108
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_10800
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer108 = new ArrayBuffer(8);
      const view108 = new DataView(buffer108);
      const negInfFromStr = Number("-Infinity");
      view108.setFloat64(0, negInfFromStr, true);
      expect(view108.getFloat64(0, true)).assertEqual(-Infinity);
    });

    /**
     * @tc.name   DataView16Test109
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_10900
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer109 = new ArrayBuffer(8);
      const view109 = new DataView(buffer109);
      const decoded = Number(decodeURIComponent("3%2E14"));
      view109.setFloat64(0, decoded, false);
      expect(view109.getFloat64(0, false)).assertEqual(3.14);
    });

    /**
     * @tc.name   DataView16Test110
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_11000
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer110 = new ArrayBuffer(8);
      const view110 = new DataView(buffer110);
      const numViaURI = Number(decodeURI(encodeURI("2.718")));
      view110.setFloat64(0, numViaURI, true);
      expect(view110.getFloat64(0, true)).assertEqual(2.718);
    });

    /**
     * @tc.name   DataView16Test114
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_11400
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer114 = new ArrayBuffer(8);
      const view114 = new DataView(buffer114);
      const lineNum = 42.0; // 模拟从 stack 提取
      view114.setFloat64(0, lineNum, true);
      expect(view114.getFloat64(0, true)).assertEqual(42);
    });

    /**
     * @tc.name   DataView16Test115
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_11500
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer115 = new ArrayBuffer(8);
      const view115 = new DataView(buffer115);
      const intlLike = 1234.56;
      view115.setFloat64(0, intlLike, false);
      expect(view115.getFloat64(0, false)).assertEqual(intlLike);
    });

    /**
     * @tc.name   DataView16Test116
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_11600
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer116 = new ArrayBuffer(8);
      const view116 = new DataView(buffer116);
      const mockRandomFloat = Math.random() * 2 - 1;
      view116.setFloat64(0, mockRandomFloat, true);
      expect(view116.getFloat64(0, true)).assertEqual(mockRandomFloat);
    });

    /**
     * @tc.name   DataView16Test117
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_11700
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer117 = new ArrayBuffer(8);
      const view117 = new DataView(buffer117);
      const atomicLike = 777.777;
      view117.setFloat64(0, atomicLike, false);
      expect(view117.getFloat64(0, false)).assertEqual(atomicLike);
    });

    /**
     * @tc.name   DataView16Test118
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_11800
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer118 = new ArrayBuffer(8);
      const view118 = new DataView(buffer118);
      const wasmResult = 999.999;
      view118.setFloat64(0, wasmResult, true);
      expect(view118.getFloat64(0, true)).assertEqual(wasmResult);
    });

    /**
     * @tc.name   DataView16Test120
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_12000
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer120 = new ArrayBuffer(8);
      const view120 = new DataView(buffer120);
      const storedNum = Number("6.66");
      view120.setFloat64(0, storedNum, true);
      expect(view120.getFloat64(0, true)).assertEqual(6.66);
    });

    /**
     * @tc.name   DataView16Test122
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_12200
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer122 = new ArrayBuffer(8);
      const view122 = new DataView(buffer122);
      const reduced = [1.1, 2.2, 3.3].reduce((a, b) => a + b, 0);
      view122.setFloat64(0, reduced, true);
      expect(view122.getFloat64(0, true)).assertEqual(reduced);
    });

    /**
     * @tc.name   DataView16Test125
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_12500
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer125 = new ArrayBuffer(8);
      const view125 = new DataView(buffer125);
      const promiseVal = 9.99;
      view125.setFloat64(0, promiseVal, false);
      expect(view125.getFloat64(0, false)).assertEqual(9.99);
    });

    /**
     * @tc.name   DataView16Test127
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_12700
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer127 = new ArrayBuffer(8);
      const view127 = new DataView(buffer127);
      const classVal = new NumHolder().value;
      view127.setFloat64(0, classVal, false);
      expect(view127.getFloat64(0, false)).assertEqual(11.11);
    });

    /**
     * @tc.name   DataView16Test134
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_13400
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer134 = new ArrayBuffer(8);
      const view134 = new DataView(buffer134);
      const matchAllVal = 18.18; // 模拟提取结果
      view134.setFloat64(0, matchAllVal, true);
      expect(view134.getFloat64(0, true)).assertEqual(18.18);
    });

    /**
     * @tc.name   DataView16Test135
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_13500
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer135 = new ArrayBuffer(8);
      const view135 = new DataView(buffer135);
      const langLen = "en-US".length + 0.0; // 5.0
      view135.setFloat64(0, langLen, false);
      expect(view135.getFloat64(0, false)).assertEqual(5);
    });

    /**
     * @tc.name   DataView16Test137
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_13700
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer137 = new ArrayBuffer(8);
      const view137 = new DataView(buffer137);
      const screenRatio = 1920 / 100.0; // 19.2
      view137.setFloat64(0, screenRatio, false);
      expect(view137.getFloat64(0, false)).assertEqual(19.2);
    });

    /**
     * @tc.name   DataView16Test138
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_13800
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer138 = new ArrayBuffer(8);
      const view138 = new DataView(buffer138);
      const dpr = 2.0;
      view138.setFloat64(0, dpr, true);
      expect(view138.getFloat64(0, true)).assertEqual(2.0);
    });

    /**
     * @tc.name   DataView16Test139
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_13900
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer139 = new ArrayBuffer(8);
      const view139 = new DataView(buffer139);
      const randSafe = Math.random() * Number.MAX_SAFE_INTEGER;
      view139.setFloat64(0, randSafe, false);
      expect(view139.getFloat64(0, false)).assertEqual(randSafe);
    });

    /**
     * @tc.name   DataView16Test140
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_14000
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer140 = new ArrayBuffer(8);
      const view140 = new DataView(buffer140);
      const parsedDate = Date.parse('2025-01-01T00:00:00Z');
      view140.setFloat64(0, parsedDate, true);
      expect(view140.getFloat64(0, true)).assertEqual(parsedDate);
    });

    /**
     * @tc.name   DataView16Test141
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_14100
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer141 = new ArrayBuffer(8);
      const view141 = new DataView(buffer141);
      const dateMs = new Date('2025-06-15').getTime();
      view141.setFloat64(0, dateMs, false);
      expect(view141.getFloat64(0, false)).assertEqual(dateMs);
    });

    /**
     * @tc.name   DataView16Test142
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_14200
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer142 = new ArrayBuffer(8);
      const view142 = new DataView(buffer142);
      const clzRes = Math.clz32(0);
      view142.setFloat64(0, clzRes, true);
      expect(view142.getFloat64(0, true)).assertEqual(32);
    });

    /**
     * @tc.name   DataView16Test143
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_14300
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer143 = new ArrayBuffer(8);
      const view143 = new DataView(buffer143);
      const signedVal = Math.sign(-5.5) * 20.20;
      view143.setFloat64(0, signedVal, false);
      expect(view143.getFloat64(0, false)).assertEqual(-20.20);
    });

    /**
     * @tc.name   DataView16Test144
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_14400
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer144 = new ArrayBuffer(8);
      const view144 = new DataView(buffer144);
      const truncVal = Math.trunc(21.999);
      view144.setFloat64(0, truncVal, true);
      expect(view144.getFloat64(0, true)).assertEqual(21);
    });

    /**
     * @tc.name   DataView16Test145
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_14500
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer145 = new ArrayBuffer(8);
      const view145 = new DataView(buffer145);
      view145.setFloat64(0, Math.floor(22.9), false);
      expect(view145.getFloat64(0, false)).assertEqual(22);
    });

    /**
     * @tc.name   DataView16Test146
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_14600
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer146 = new ArrayBuffer(8);
      const view146 = new DataView(buffer146);
      view146.setFloat64(0, Math.ceil(23.1), true);
      expect(view146.getFloat64(0, true)).assertEqual(24);
    });

    /**
     * @tc.name   DataView16Test147
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_14700
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer147 = new ArrayBuffer(8);
      const view147 = new DataView(buffer147);
      view147.setFloat64(0, Math.round(24.5), false);
      expect(view147.getFloat64(0, false)).assertEqual(25);
    });

    /**
     * @tc.name   DataView16Test148
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_14800
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer148 = new ArrayBuffer(8);
      const view148 = new DataView(buffer148);
      view148.setFloat64(0, Math.abs(-25.25), true);
      expect(view148.getFloat64(0, true)).assertEqual(25.25);
    });

    /**
     * @tc.name   DataView16Test149
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_14900
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer149 = new ArrayBuffer(8);
      const view149 = new DataView(buffer149);
      view149.setFloat64(0, Math.min(30.3, 26.26), false);
      expect(view149.getFloat64(0, false)).assertEqual(26.26);
    });

    /**
     * @tc.name   DataView16Test150
     * @tc.number SUB_BUILTINS_DATAVIEW16_TEST_15000
     * @tc.desc   test DataView setFloat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DataView16Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer150 = new ArrayBuffer(8);
      const view150 = new DataView(buffer150);
      view150.setFloat64(0, Math.max(-10, 27.27), true);
      expect(view150.getFloat64(0, true)).assertEqual(27.27);
    });

  })
}