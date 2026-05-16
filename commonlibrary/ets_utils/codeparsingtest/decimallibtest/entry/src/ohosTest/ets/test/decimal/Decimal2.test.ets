/*
* Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { Decimal } from '@kit.ArkTS';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function Decimal2Test() {
  describe('Decimal2Test', () => {
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
     * @tc.name   testComparedTo0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20100
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(1);
      let data1: boolean = data.isFinite();
      expect(data1).assertEqual(true);
    });
    /**
     * @tc.name   testComparedTo0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20101
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(Infinity);
      let data1: boolean = data.isFinite();
      expect(data1).assertEqual(false);
    });

    /**
     * @tc.name   testComparedTo0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20102
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(123.456);
      let data1: boolean = data.isInteger();
      expect(data1).assertEqual(false);
    });

    /**
     * @tc.name   testComparedTo0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20103
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(123);
      let data1: boolean = data.isInteger();
      expect(data1).assertEqual(true);
    });

    /**
     * @tc.name   testComparedTo0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20104
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(NaN);
      let data1: boolean = data.isNaN();
      expect(data1).assertEqual(true);
    });

    /**
     * @tc.name   testComparedTo0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20105
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(Number.NEGATIVE_INFINITY);
      let data1: boolean = data.isNaN();
      expect(data1).assertEqual(false);
    });

    /**
     * @tc.name   testComparedTo0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20106
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(-0);
      let data1: boolean = data.isNegative();
      expect(data1).assertEqual(true);
    });

    /**
     * @tc.name   testComparedTo0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20107
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(0);
      let data1: boolean = data.isNegative();
      expect(data1).assertEqual(false);
    });

    /**
     * @tc.name   testComparedTo0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20108
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(-0);
      let data1: boolean = data.isPositive();
      expect(data1).assertEqual(false);
    });

    /**
     * @tc.name   testComparedTo0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20109
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(0);
      let data1: boolean = data.isPositive();
      expect(data1).assertEqual(true);
    });

    /**
     * @tc.name   testComparedTo0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20110
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(0);
      let data1: boolean = data.isZero();
      expect(data1).assertEqual(true);
    });

    /**
     * @tc.name   testComparedTo0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20111
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(-0);
      let data1: boolean = data.isZero();
      expect(data1).assertEqual(true);
    });

    /**
     * @tc.name   testComparedTo0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20112
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(-110);
      let data1: boolean = data.isZero();
      expect(data1).assertEqual(false);
    });

    /**
     * @tc.name   testComparedTo0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20113
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(256);
      let data1: string = data.toOctal();
      expect(data1).assertEqual("0o400");
    });

    /**
     * @tc.name   testComparedTo0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20114
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(256);
      let data1: string = data.toOctal(1);
      expect(data1.toString()).assertEqual("0o1p+8");
    });

    /**
     * @tc.name   testComparedTo0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20115
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(256);
      let data1: string = data.toOctal(1, Decimal.ROUND_HALF_UP);
      expect(data1).assertEqual("0o1p+8");
    });

    /**
     * @tc.name   testComparedTo0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20116
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(256);
      let data1: string = data.toHexadecimal();
      expect(data1).assertEqual("0x100");
    });

    /**
     * @tc.name   testComparedTo0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20117
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(256);
      let data1: string = data.toHexadecimal(1);
      expect(data1).assertEqual("0x1p+8");
    });

    /**
     * @tc.name   testComparedTo0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20118
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(256);
      let data1: string = data.toHexadecimal(1, Decimal.ROUND_HALF_UP);
      expect(data1).assertEqual("0x1p+8");
    });

    /**
     * @tc.name   testComparedTo0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20119
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let data: Decimal = new Decimal(256);
        let data1: string = data.toHexadecimal(1.6);
        expect(data1).assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200001);
      }
    });
    /**
     * @tc.name   testComparedTo0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20120
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let data: Decimal = new Decimal(256);
        let data1: string = data.toHexadecimal(3.5, Decimal.ROUND_HALF_UP);
        expect(data1).assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200001);
      }

    });

    /**
     * @tc.name   testComparedTo0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20121
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let data: Decimal = new Decimal(256);
        let data1: string = data.toHexadecimal(1.6);
        expect(data1).assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name   testComparedTo0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20122
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let data: Decimal = new Decimal(256);
        let data1: string = data.toOctal(1.587, Decimal.ROUND_HALF_UP);
        expect(data1).assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name   testComparedTo0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20123
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(3.456);
      let data1: string = data.toFixed();
      expect(data1).assertEqual("3.456");
    });

    /**
     * @tc.name   testComparedTo0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20124
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(3.456);
      let data1: string = data.toFixed(0);
      expect(data1).assertEqual("3");
      console.info("test Decimal toFixed:" + data1);
      data1 = data.toFixed(2);
      expect(data1).assertEqual("3.46");
      data1 = data.toFixed(5);
      expect(data1).assertEqual("3.45600");
    });

    /**
     * @tc.name   testComparedTo0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20125
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let data: Decimal = new Decimal(3.456);
        let data1: string = data.toFixed(0.3578);
        expect(data1).assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name   testComparedTo0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20126
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(3.456);
      let data1: string = data.toFixed(2, Decimal.ROUND_DOWN);
      expect(data1).assertEqual("3.45");
    });

    /**
     * @tc.name   testComparedTo0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20127
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let data: Decimal = new Decimal(3.456);
        let data1: string = data.toFixed(2.5641, Decimal.ROUND_DOWN);
        expect(data1).assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name   testComparedTo0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20128
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(1.75);
      let data1: Decimal[] = data.toFraction();
      expect(data1.toString()).assertEqual("7,4");
    });

    /**
     * @tc.name   testComparedTo0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20129
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(0);
      let data1: Decimal[] = data.toFraction();
      expect(data1.toString()).assertEqual("0,1");
    });

    /**
     * @tc.name   testComparedTo0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20130
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(Number.EPSILON);
      let data1: Decimal[] = data.toFraction();
      expect(data1.toString()).assertEqual("2220446049250313,1e+31");
    });

    /**
     * @tc.name   testComparedTo0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20131
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pi: Decimal = new Decimal('3.14159265358');
      let data1 = pi.toFraction();
      expect(data1.toString()).assertEqual("157079632679,50000000000");
      data1 = pi.toFraction(100000);
      expect(data1.toString()).assertEqual("312689,99532");
      data1 = pi.toFraction(10000);
      expect(data1.toString()).assertEqual("355,113");
      data1 = pi.toFraction(100);
      expect(data1.toString()).assertEqual("311,99");
      data1 = pi.toFraction(10);
      expect(data1.toString()).assertEqual("22,7");
      data1 = pi.toFraction(1);
      expect(data1.toString()).assertEqual("3,1")
    });

    /**
     * @tc.name   testComparedTo0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20132
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let pi: Decimal = new Decimal('3.14159265358');
        let data1 = pi.toFraction(0.12135);
        expect(data1).assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testComparedTo0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20133
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(1.39);
      let data1: Decimal = data.toNearest(0.25);
      expect(data1.toString()).assertEqual("1.5");
    });

    /**
     * @tc.name   testComparedTo0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20134
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(1.39);
      let data1: Decimal = data.toNearest(Number.MAX_VALUE);
      expect(data1.toString()).assertEqual("0");
    });

    /**
     * @tc.name   testComparedTo0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20135
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(9.499);
      let data1 = data.toNearest(0.5, Decimal.ROUND_UP);
      expect(data1.toString()).assertEqual("9.5");
      data1 = data.toNearest(0.5, Decimal.ROUND_DOWN);
      expect(data1.toString()).assertEqual("9");
    });

    /**
     * @tc.name   testComparedTo0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20136
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(45.6);
      let data1: string = data.toPrecision();
      expect(data1).assertEqual("45.6");
    });

    /**
     * @tc.name   testComparedTo0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20137
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = new Decimal(45.6);
      let data1: string = data.toPrecision(1);
      expect(data1).assertEqual("5e+1");
    });

    /**
     * @tc.name   testComparedTo0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20138
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let data: Decimal = new Decimal(45.6);
        let data1: string = data.toPrecision(1.514);
        expect(data1).assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name   testComparedTo0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20139
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.abs(-0.5);
      expect(data.toString()).assertEqual("0.5");
    });
    /**
     * @tc.name   testComparedTo0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20140
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.abs(Number.POSITIVE_INFINITY);
      expect(data.toString()).assertEqual("Infinity");
    });

    /**
     * @tc.name   testComparedTo0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20141
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.floor(1.8);
      expect(data.toString()).assertEqual("1");
    });

    /**
     * @tc.name   testComparedTo0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20142
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.ceil(1.8);
      expect(data.toString()).assertEqual("2");
    });

    /**
     * @tc.name   testComparedTo0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20143
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.trunc(2.5);
      expect(data.toString()).assertEqual("2");
    });

    /**
     * @tc.name   testComparedTo0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20144
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.clamp(10.1, 0, 10);
      expect(data.toString()).assertEqual("10");
    });

    /**
     * @tc.name   testComparedTo0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20145
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.add(0.5, 0.5);
      expect(data.toString()).assertEqual("1");
    });

    /**
     * @tc.name   testComparedTo0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20146
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.sum(0.5, 0.5);
      expect(data.toString()).assertEqual("1");
    });

    /**
     * @tc.name   testComparedTo0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20147
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.sub(1, 0.5);
      expect(data.toString()).assertEqual("0.5");
    });

    /**
     * @tc.name   testComparedTo0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20148
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.mul(1, 0.5);
      expect(data.toString()).assertEqual("0.5");
    });

    /**
     * @tc.name   testComparedTo0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20149
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.div(1, 0.5);
      expect(data.toString()).assertEqual("2");
    });

    /**
     * @tc.name   testComparedTo0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20150
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.mod(2, 1);
      expect(data.toString()).assertEqual("0");
    });

    /**
     * @tc.name   testComparedTo0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20151
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.sqrt(3);
      expect(data.toString()).assertEqual("1.7320508075688772935");
    });

    /**
     * @tc.name   testComparedTo0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20152
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.cbrt(3);
      expect(data.toString()).assertEqual("1.4422495703074083823");
    });

    /**
     * @tc.name   testComparedTo0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20153
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.pow(3, -2);
      expect(data.toString()).assertEqual("0.11111111111111111111");
    });

    /**
     * @tc.name   testComparedTo0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20154
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.exp(2);
      expect(data.toString()).assertEqual("7.3890560989306502272");
    });

    /**
     * @tc.name   testComparedTo0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20155
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.log(2, 256);
      expect(data.toString()).assertEqual("0.125");
    });

    /**
     * @tc.name   testComparedTo0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20156
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.ln(1.23e+30);
      expect(data.toString()).assertEqual("69.284566959205696648");
    });

    /**
     * @tc.name   testComparedTo0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20157
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.log2(4);
      expect(data.toString()).assertEqual("2");
    });

    /**
     * @tc.name   testComparedTo0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20158
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.log10(10000);
      expect(data.toString()).assertEqual("4");
    });

    /**
     * @tc.name   testComparedTo0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20159
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.cos(-0.25);
      expect(data.toString()).assertEqual("0.96891242171064478414");
    });

    /**
     * @tc.name   testComparedTo0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20160
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.sin(0.75);
      expect(data.toString()).assertEqual("0.68163876002333416673");
    });

    /**
     * @tc.name   testComparedTo0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20161
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.tan(0.75);
      expect(data.toString()).assertEqual("0.93159645994407246117");
    });

    /**
     * @tc.name   testComparedTo0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20162
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.cosh(0.5);
      expect(data.toString()).assertEqual("1.1276259652063807852");
    });

    /**
     * @tc.name   testComparedTo0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20163
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.sinh(0.5);
      expect(data.toString()).assertEqual("0.52109530549374736162");
    });

    /**
     * @tc.name   testComparedTo0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20164
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.tanh(0.5);
      expect(data.toString()).assertEqual("0.4621171572600097585");
    });

    /**
     * @tc.name   testComparedTo0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20165
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.acos(0.5);
      expect(data.toString()).assertEqual("1.0471975511965977462");
    });

    /**
     * @tc.name   testComparedTo0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20166
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.asin(0.75);
      expect(data.toString()).assertEqual("0.84806207898148100805");
    });

    /**
     * @tc.name   testComparedTo0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20167
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.atan(0.75);
      let a = () => {
      };
      a.name
      expect(data.toString()).assertEqual("0.6435011087932843868");
    });

    /**
     * @tc.name   testComparedTo0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20168
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.acosh(50);
      expect(data.toString()).assertEqual("4.6050701709847571595");
    });

    /**
     * @tc.name   testComparedTo0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20169
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.asinh(50);
      expect(data.toString()).assertEqual("4.6052701709914238266");
    });

    /**
     * @tc.name   testComparedTo0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20170
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.atanh(0.75);
      expect(data.toString()).assertEqual("0.97295507452765665255");
    });

    /**
     * @tc.name   testComparedTo0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20171
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.atan2(2, 3);
      expect(data.toString()).assertEqual("0.58800260354756755125");
    });

    /**
     * @tc.name   testComparedTo0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20172
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.hypot(2, 3, 4);
      expect(data.toString()).assertEqual("5.3851648071345040313");
    });

    /**
     * @tc.name   testComparedTo0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20173
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.max(2, 3, 4);
      expect(data.toString()).assertEqual("4");
    });

    /**
     * @tc.name   testComparedTo0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL20174
     * @tc.desc   Testing the decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: Decimal = Decimal.min(2, 3, 4);
      expect(data.toString()).assertEqual("2");
    });
  })
}