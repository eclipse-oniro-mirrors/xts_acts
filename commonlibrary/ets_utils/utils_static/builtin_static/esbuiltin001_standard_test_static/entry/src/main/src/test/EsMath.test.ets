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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import hilog from '@ohos.hilog'
import Utils from './Util.test';
export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function EsMathTest(){
  describe('EsMathTest', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number ES_BUILTINS_MATH_0001
     * @tc.name ESMathTest0001
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0001';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.abs(NaN))).assertEqual(Number.isNaN(NaN));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0002
     * @tc.name ESMathTest0002
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0002';
      console.info(`${caseName}, test start`);
      expect(Math.abs(-0)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0003
     * @tc.name ESMathTest0003
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0003';
      console.info(`${caseName}, test start`);
      let x = -Infinity;
      expect(Math.abs(x)).assertEqual(+Infinity);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0004
     * @tc.name ESMathTest0004
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0004';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.acos(NaN))).assertEqual(Number.isNaN(NaN));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0005
     * @tc.name ESMathTest0005
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0005';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.acos(1.000000000000001))).assertEqual(Number.isNaN(NaN))
      expect(Number.isNaN(Math.acos(2))).assertEqual(Number.isNaN(NaN))
      expect(Number.isNaN(Math.acos(Infinity))).assertEqual(Number.isNaN(NaN))
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0006
     * @tc.name ESMathTest0006
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0006';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.acos(-1.000000000000001))).assertEqual(Number.isNaN(NaN))
      expect(Number.isNaN(Math.acos(-2))).assertEqual(Number.isNaN(NaN))
      expect(Number.isNaN(Math.acos(-Infinity))).assertEqual(Number.isNaN(NaN))
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0007
     * @tc.name ESMathTest0007
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0007';
      console.info(`${caseName}, test start`);
      expect(Math.acos(1)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0008
     * @tc.name ESMathTest0008
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0008';
      console.info(`${caseName}, test start`);
      expect(Math.acosh(+1)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0009
     * @tc.name ESMathTest0009
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0009';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.acosh(NaN))).assertEqual(Number.isNaN(NaN));
      expect(Number.isNaN(Math.acosh(0.999999))).assertEqual(Number.isNaN(NaN));
      expect(Number.isNaN(Math.acosh(0))).assertEqual(Number.isNaN(NaN));
      expect(Number.isNaN(Math.acosh(-1))).assertEqual(Number.isNaN(NaN));
      expect(Number.isNaN(Math.acosh(-Infinity))).assertEqual(Number.isNaN(NaN));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0010
     * @tc.name ESMathTest0010
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0010';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.asin(NaN))).assertEqual(Number.isNaN(NaN))
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0011
     * @tc.name ESMathTest0011
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0011';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.asin(1.000000000000001))).assertEqual(Number.isNaN(NaN))
      expect(Number.isNaN(Math.asin(2))).assertEqual(Number.isNaN(NaN))
      expect(Number.isNaN(Math.asin(Infinity))).assertEqual(Number.isNaN(NaN))
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0012
     * @tc.name ESMathTest0012
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0012';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.asin(-1.000000000000001))).assertEqual(Number.isNaN(NaN))
      expect(Number.isNaN(Math.asin(-2))).assertEqual(Number.isNaN(NaN))
      expect(Number.isNaN(Math.asin(-Infinity))).assertEqual(Number.isNaN(NaN))
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0013
     * @tc.name ESMathTest0013
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0013';
      console.info(`${caseName}, test start`);
      expect(Math.asin(0)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0014
     * @tc.name ESMathTest0014
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0014';
      console.info(`${caseName}, test start`);
      expect(Math.asin(-0)).assertEqual(-0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0015
     * @tc.name ESMathTest0015
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0015';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.asinh(NaN))).assertEqual(Number.isNaN(NaN));
      expect(Math.asinh(Number.NEGATIVE_INFINITY)).assertEqual(Number.NEGATIVE_INFINITY);
      expect(Math.asinh(Number.POSITIVE_INFINITY)).assertEqual(Number.POSITIVE_INFINITY);
      expect(1 / Math.asinh(-0.0)).assertEqual(Number.NEGATIVE_INFINITY);
      expect(1 / Math.asinh(0.0)).assertEqual(Number.POSITIVE_INFINITY);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0016
     * @tc.name ESMathTest0016
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0016';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.atan(NaN))).assertEqual(Number.isNaN(NaN));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0017
     * @tc.name ESMathTest0017
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0017';
      console.info(`${caseName}, test start`);
      expect(Math.atan(0)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0018
     * @tc.name ESMathTest0018
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0018';
      console.info(`${caseName}, test start`);
      expect(Math.atan(-0)).assertEqual(-0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0019
     * @tc.name ESMathTest0019
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0019';
      console.info(`${caseName}, test start`);
      let vals = new Array<number>(7);
      vals[0] = -Infinity;
      vals[1] = -0.000000000000001;
      vals[2] = -0;
      vals[3] = +0
      vals[4] = 0.000000000000001;
      vals[5] = +Infinity;
      vals[6] = NaN;
      let valnum = 7;
      let args = new Array<number>(2);
      for (let i = 0; i < 2; i++)
      {
        args[i] = NaN;
        for (let j = 0; j < valnum; j++)
        {
          args[1 - i] = vals[j];
          let a = Math.atan2(args[0], args[1]);
          expect(a == a).assertEqual(false);
        }
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0020
     * @tc.name ESMathTest0020
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0020';
      console.info(`${caseName}, test start`);
      let x = +Infinity;
      let y = new Array<number>(3);
      y[0] = 0.000000000000001;
      y[1] = 1;
      y[2] = 1.7976931348623157E308;
      let ynum = 3;
      for (let i = 0; i < ynum; i++)
      {
        expect(Math.atan2(y[i], x)).assertEqual(0);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0021
     * @tc.name ESMathTest0021
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0021';
      console.info(`${caseName}, test start`);
      let x = +Infinity;
      let y = new Array<number>(3);
      y[0] = -0.000000000000001;
      y[1] = -1;
      y[2] = -1.7976931348623157E308;
      let ynum = 3;
      for (let i = 0; i < ynum; i++)
      {
        expect(Math.atan2(y[i], x)).assertEqual(-0);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0022
     * @tc.name ESMathTest0022
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0022';
      console.info(`${caseName}, test start`);
      let y = +0;
      let x = new Array<number>(3);
      x[0] = 0.000000000000001;
      x[2] = +Infinity;
      x[1] = 1;
      let xnum = 3;
      for (let i = 0; i < xnum; i++)
      {
        expect(Math.atan2(y, x[i])).assertEqual(0);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0023
     * @tc.name ESMathTest0023
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0023';
      console.info(`${caseName}, test start`);
      expect(Math.atan2(0, 0)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0024
     * @tc.name ESMathTest0024
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0024';
      console.info(`${caseName}, test start`);
      let y = -0;
      let x = new Array<number>(3);
      x[0] = 0.000000000000001;
      x[2] = +Infinity;
      x[1] = 1;
      let xnum = 3;
      for (let i = 0; i < xnum; i++)
      {
        expect(Math.atan2(y, x[i])).assertEqual(-0);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0025
     * @tc.name ESMathTest0025
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0025';
      console.info(`${caseName}, test start`);
      expect(Math.atan2(-0, 0)).assertEqual(-0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0026
     * @tc.name ESMathTest0026
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0026';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.atanh(-1.9))).assertEqual(Number.isNaN(Number.NaN));
      expect(Number.isNaN(Math.atanh(NaN))).assertEqual(Number.isNaN(Number.NaN));
      expect(Number.isNaN(Math.atanh(-10))).assertEqual(Number.isNaN(Number.NaN));
      expect(Number.isNaN(Math.atanh(-Infinity))).assertEqual(Number.isNaN(Number.NaN));
      expect(Number.isNaN(Math.atanh(1.9))).assertEqual(Number.isNaN(Number.NaN));
      expect(Number.isNaN(Math.atanh(10))).assertEqual(Number.isNaN(Number.NaN));
      expect(Number.isNaN(Math.atanh(Number.POSITIVE_INFINITY))).assertEqual(Number.isNaN(Number.NaN));
      expect(Math.atanh(-1)).assertEqual(Number.NEGATIVE_INFINITY);
      expect(Math.atanh(+1)).assertEqual(Number.POSITIVE_INFINITY);
      expect(1 / Math.atanh(-0.0)).assertEqual(Number.NEGATIVE_INFINITY);
      expect(1 / Math.atanh(0.0)).assertEqual(Number.POSITIVE_INFINITY);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0027
     * @tc.name ESMathTest0027
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0027';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.cbrt(NaN))).assertEqual(Number.isNaN(Number.NaN))
      expect(Math.cbrt(Number.NEGATIVE_INFINITY)).assertEqual(Number.NEGATIVE_INFINITY)
      expect(Math.cbrt(Number.POSITIVE_INFINITY)).assertEqual(Number.POSITIVE_INFINITY)
      expect(1 / Math.cbrt(0.0)).assertEqual(Number.POSITIVE_INFINITY)
      expect(1 / Math.cbrt(-0.0)).assertEqual(Number.NEGATIVE_INFINITY)
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0028
     * @tc.name ESMathTest0028
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0028';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.ceil(NaN))).assertEqual(Number.isNaN(Number.NaN));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0029
     * @tc.name ESMathTest0029
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0029';
      console.info(`${caseName}, test start`);
      expect(Math.ceil(0)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0030
     * @tc.name ESMathTest0030
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0030';
      console.info(`${caseName}, test start`);
      expect(Math.ceil(-0)).assertEqual(-0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0031
     * @tc.name ESMathTest0031
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0031';
      console.info(`${caseName}, test start`);
      let x = +Infinity;
      expect(Math.ceil(x)).assertEqual(+Infinity);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0032
     * @tc.name ESMathTest0032
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0032';
      console.info(`${caseName}, test start`);
      let x = -Infinity;
      expect(Math.ceil(x)).assertEqual(-Infinity);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0033
     * @tc.name ESMathTest0033
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0033';
      console.info(`${caseName}, test start`);
      expect(Math.ceil(-0.000000000000001)).assertEqual(-0);
      expect(Math.ceil(-0.999999999999999)).assertEqual(-0);
      expect(Math.ceil(-0.5)).assertEqual(-0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0034
     * @tc.name ESMathTest0034
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0034';
      console.info(`${caseName}, test start`);
      for (let i = -1000; i < -500; i++)
      {
        let x = i / 10.0;
        expect(Math.ceil(x)).assertEqual(-Math.floor(-x));
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0034_2
     * @tc.name ESMathTest0034_2
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0034_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0034_2';
      console.info(`${caseName}, test start`);
      for (let i = -500; i < 0; i++)
      {
        let x = i / 10.0;
        expect(Math.ceil(x)).assertEqual(-Math.floor(-x));
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0034_3
     * @tc.name ESMathTest0034_3
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0034_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0034_3';
      console.info(`${caseName}, test start`);
      for (let i = 0; i < 500; i++)
      {
        let x = i / 10.0;
        expect(Math.ceil(x)).assertEqual(-Math.floor(-x));
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0034_4
     * @tc.name ESMathTest0034_4
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0034_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0034_4';
      console.info(`${caseName}, test start`);
      for (let i = 500; i < 1000; i++)
      {
        let x = i / 10.0;
        expect(Math.ceil(x)).assertEqual(-Math.floor(-x));
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0035
     * @tc.name ESMathTest0035
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0035';
      console.info(`${caseName}, test start`);
      expect(Math.clz32(0)).assertEqual(32);
      expect(Math.clz32(-0)).assertEqual(32);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0036
     * @tc.name ESMathTest0036
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0036';
      console.info(`${caseName}, test start`);
      expect(Math.clz32(1)).assertEqual(31);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0037
     * @tc.name ESMathTest0037
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0037';
      console.info(`${caseName}, test start`);
      expect(Math.clz32(2147483648)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0038
     * @tc.name ESMathTest0038
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0038';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.cos(NaN))).assertEqual(Number.isNaN(NaN));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0039
     * @tc.name ESMathTest0039
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0039';
      console.info(`${caseName}, test start`);
      let x = +0;
      expect(Math.cos(x)).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0040
     * @tc.name ESMathTest0040
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0040';
      console.info(`${caseName}, test start`);
      let x = -0;
      expect(Math.cos(x)).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0041
     * @tc.name ESMathTest0041
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0041';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.cos(Infinity))).assertEqual(Number.isNaN(NaN));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0042
     * @tc.name ESMathTest0042
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0042';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.cos(-Infinity))).assertEqual(Number.isNaN(NaN));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0043
     * @tc.name ESMathTest0043
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0043';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.cosh(NaN))).assertEqual(Number.isNaN(NaN))
      expect(Math.cosh(0)).assertEqual(1)
      expect(Math.cosh(-0)).assertEqual(1)
      expect(Math.cosh(Number.NEGATIVE_INFINITY)).assertEqual(Number.POSITIVE_INFINITY)
      expect(Math.cosh(Number.POSITIVE_INFINITY)).assertEqual(Number.POSITIVE_INFINITY)
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0044
     * @tc.name ESMathTest0044
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0044';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.exp(NaN))).assertEqual(Number.isNaN(NaN));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0045
     * @tc.name ESMathTest0045
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0045';
      console.info(`${caseName}, test start`);
      let x = +0;
      expect(Math.exp(x)).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0046
     * @tc.name ESMathTest0046
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0046';
      console.info(`${caseName}, test start`);
      let x = -0;
      expect(Math.exp(x)).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0047
     * @tc.name ESMathTest0047
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0047';
      console.info(`${caseName}, test start`);
      let x = +Infinity;
      expect(Math.exp(x)).assertEqual(+Infinity);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0048
     * @tc.name ESMathTest0048
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0048';
      console.info(`${caseName}, test start`);
      expect(Math.exp(-Infinity)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0049
     * @tc.name ESMathTest0049
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0049';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.expm1(NaN))).assertEqual(Number.isNaN(NaN))
      expect(Math.expm1(Number.NEGATIVE_INFINITY)).assertEqual(-1)
      expect(Math.expm1(Number.POSITIVE_INFINITY)).assertEqual(Number.POSITIVE_INFINITY)
      expect(1 / Math.expm1(-0.0)).assertEqual(Number.NEGATIVE_INFINITY)
      expect(1 / Math.expm1(0.0)).assertEqual(Number.POSITIVE_INFINITY)
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0050
     * @tc.name ESMathTest0050
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0050';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.floor(NaN))).assertEqual(Number.isNaN(NaN));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0051
     * @tc.name ESMathTest0051
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0051';
      console.info(`${caseName}, test start`);
      expect(Math.floor(0)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0052
     * @tc.name ESMathTest0052
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0052';
      console.info(`${caseName}, test start`);
      expect(Math.floor(-0)).assertEqual(-0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0053
     * @tc.name ESMathTest0053
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0053';
      console.info(`${caseName}, test start`);
      let x = +Infinity;
      expect(Math.floor(x)).assertEqual(+Infinity);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0054
     * @tc.name ESMathTest0054
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0054';
      console.info(`${caseName}, test start`);
      let x = -Infinity;
      expect(Math.floor(x)).assertEqual(-Infinity);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0055
     * @tc.name ESMathTest0055
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0055';
      console.info(`${caseName}, test start`);
      expect(Math.floor(0.000000000000001)).assertEqual(0);
      expect(Math.floor(0.999999999999999)).assertEqual(0);
      expect(Math.floor(0.5)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0056
     * @tc.name ESMathTest0056
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0056';
      console.info(`${caseName}, test start`);
      for (let i = -1000; i < -500; i++)
      {
        let x = i / 10.0;
        expect(-Math.ceil(-x)).assertEqual(Math.floor(x));
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0056_2
     * @tc.name ESMathTest0056_2
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0056_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0056_2';
      console.info(`${caseName}, test start`);
      for (let i = -500; i < 0; i++)
      {
        let x = i / 10.0;
        expect(-Math.ceil(-x)).assertEqual(Math.floor(x));
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0056_3
     * @tc.name ESMathTest0056_3
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0056_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0056_3';
      console.info(`${caseName}, test start`);
      for (let i = 0; i < 500; i++)
      {
        let x = i / 10.0;
        expect(-Math.ceil(-x)).assertEqual(Math.floor(x));
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0056_4
     * @tc.name ESMathTest0056_4
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0056_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0056_4';
      console.info(`${caseName}, test start`);
      for (let i = 500; i < 1000; i++)
      {
        let x = i / 10.0;
        expect(-Math.ceil(-x)).assertEqual(Math.floor(x));
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0057
     * @tc.name ESMathTest0057
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0057';
      console.info(`${caseName}, test start`);
      expect(Math.fround(Infinity)).assertEqual(Infinity);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0058
     * @tc.name ESMathTest0058
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0058';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.fround(NaN))).assertEqual(Number.isNaN(NaN));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0059
     * @tc.name ESMathTest0059
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0059';
      console.info(`${caseName}, test start`);
      expect(Math.fround(0)).assertEqual(0);
      expect(Math.fround(-0)).assertEqual(-0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0060
     * @tc.name ESMathTest0060
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0060';
      console.info(`${caseName}, test start`);
      expect(Math.hypot(3, Infinity)).assertEqual(Infinity);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0061
     * @tc.name ESMathTest0061
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0061';
      console.info(`${caseName}, test start`);
      expect(Math.hypot(NaN, Infinity)).assertEqual(Infinity);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0062
     * @tc.name ESMathTest0062
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0062';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.hypot(NaN, 3))).assertEqual(Number.isNaN(NaN));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0063
     * @tc.name ESMathTest0063
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0063';
      console.info(`${caseName}, test start`);
      expect(Math.hypot(3, -Infinity)).assertEqual(Infinity);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0064
     * @tc.name ESMathTest0064
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0064';
      console.info(`${caseName}, test start`);
      expect(Math.hypot()).assertEqual(0)
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0065
     * @tc.name ESMathTest0065
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0065';
      console.info(`${caseName}, test start`);
      expect(Math.hypot(3, 4)).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0066
     * @tc.name ESMathTest0066
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0066';
      console.info(`${caseName}, test start`);
      expect(Math.hypot(0)).assertEqual(0);
      expect(Math.hypot(-0)).assertEqual(0);
      expect(Math.hypot(0, 0)).assertEqual(0);
      expect(Math.hypot(0, -0)).assertEqual(0);
      expect(Math.hypot(-0, 0)).assertEqual(0);
      expect(Math.hypot(-0, -0)).assertEqual(0);
      expect(Math.hypot(0, -0, -0)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0067
     * @tc.name ESMathTest0067
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0067';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.log(NaN))).assertEqual(Number.isNaN(NaN));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0068
     * @tc.name ESMathTest0068
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0068';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.log(-0.000000000000001))).assertEqual(Number.isNaN(NaN))
      expect(Number.isNaN(Math.log(-1))).assertEqual(Number.isNaN(NaN))
      expect(Number.isNaN(Math.log(-Infinity))).assertEqual(Number.isNaN(NaN))
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0069
     * @tc.name ESMathTest0069
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0069';
      console.info(`${caseName}, test start`);
      let x = +0;
      expect(Math.log(x)).assertEqual(-Infinity);
      let y = -0;
      expect(Math.log(y)).assertEqual(-Infinity);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0070
     * @tc.name ESMathTest0070
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0070';
      console.info(`${caseName}, test start`);
      expect(Math.log(1)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0071
     * @tc.name ESMathTest0071
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0071';
      console.info(`${caseName}, test start`);
      let x = +Infinity;
      expect(Math.log(x)).assertEqual(+Infinity);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0072
     * @tc.name ESMathTest0072
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0072';
      console.info(`${caseName}, test start`);
      expect(Math.log10(-0)).assertEqual(Number.NEGATIVE_INFINITY);
      expect(Math.log10(+0)).assertEqual(Number.NEGATIVE_INFINITY);
      expect(Number.isNaN(Math.log10(-0.9))).assertEqual(Number.isNaN(NaN));
      expect(Number.isNaN(Math.log10(NaN))).assertEqual(Number.isNaN(NaN));
      expect(Number.isNaN(Math.log10(-10))).assertEqual(Number.isNaN(NaN));
      expect(Math.log10(Number.POSITIVE_INFINITY)).assertEqual(Number.POSITIVE_INFINITY);
      expect(Math.log10(1)).assertEqual(0);
      expect(Math.log10(10.00)).assertEqual(1);
      expect(Math.log10(100.00)).assertEqual(2);
      expect(Math.log10(1000.00)).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0073
     * @tc.name ESMathTest0073
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0073';
      console.info(`${caseName}, test start`);
      expect(Math.log2(-0)).assertEqual(Number.NEGATIVE_INFINITY);
      expect(Math.log2(+0)).assertEqual(Number.NEGATIVE_INFINITY);
      expect(Number.isNaN(Math.log2(-0.9))).assertEqual(Number.isNaN(NaN));
      expect(Number.isNaN(Math.log2(NaN))).assertEqual(Number.isNaN(NaN));
      expect(Number.isNaN(Math.log2(-10))).assertEqual(Number.isNaN(NaN));
      expect(Number.isNaN(Math.log2(-Infinity))).assertEqual(Number.isNaN(NaN));
      expect(Math.log2(Number.POSITIVE_INFINITY)).assertEqual(Number.POSITIVE_INFINITY);
      expect(Math.log2(1)).assertEqual(0);
      expect(Math.log2(2.00)).assertEqual(1);
      expect(Math.log2(4.00)).assertEqual(2);
      expect(Math.log2(8.00)).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0074
     * @tc.name ESMathTest0074
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0074';
      console.info(`${caseName}, test start`);
      expect(Math.max()).assertEqual(-Infinity);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0075
     * @tc.name ESMathTest0075
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0075';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.max(NaN))).assertEqual(Number.isNaN(NaN));
      let vals:Array<number> = new Array<number>(7);
      vals[0] = -Infinity;
      vals[1] = -0.000000000000001;
      vals[2] = -0;
      vals[3] = +0
      vals[4] = 0.000000000000001;
      vals[5] = +Infinity;
      vals[6] = NaN;
      let valnum = 7;
      let args:Array<number> = new Array<number>(3);
      for (let i = 0; i <= 1; i++) {
        args[i] = NaN;
        for (let j = 0; j < valnum; j++) {
          args[1 - i] = vals[j];
          let a = Math.max(args[0], args[1]);
          expect(a === a).assertEqual(false);
        }
      }
      let k = 1;
      let l = 2;
      for (let i = 0; i <= 2; i++) {
        args[i] = NaN;
        if (i === 1) {
          k = 0;
        } else if (i === 2) {
          l = 1;
        }
        for (let j = 0; j < valnum; j++) {
          for (let jj = 0; jj < valnum; jj++) {
            args[k] = vals[j];
            args[l] = vals[jj];
            let a = Math.max(args[0], args[1], args[2]);
            expect(a === a).assertEqual(false);
          }
        }
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0076
     * @tc.name ESMathTest0076
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0076';
      console.info(`${caseName}, test start`);
      expect(Math.min()).assertEqual(+Infinity);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0077
     * @tc.name ESMathTest0077
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0077';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.min(NaN))).assertEqual(Number.isNaN(NaN));
      let vals:Array<number> = new Array<number>(7);
      vals[0] = -Infinity;
      vals[1] = -0.000000000000001;
      vals[2] = -0;
      vals[3] = +0
      vals[4] = 0.000000000000001;
      vals[5] = +Infinity;
      vals[6] = NaN;
      let valnum = 7;
      let args:Array<number> = new Array<number>(3);
      for (let i = 0; i <= 1; i++) {
        args[i] = NaN;
        for (let j = 0; j < valnum; j++) {
          args[1 - i] = vals[j];
          let a = Math.min(args[0], args[1]);
          expect(a === a).assertEqual(false);
        }
      }
      let k = 1;
      let l = 2;
      for (let i = 0; i <= 2; i++) {
        args[i] = NaN;
        if (i === 1) {
          k = 0;
        } else if (i === 2) {
          l = 1;
        }
        for (let j = 0; j < valnum; j++) {
          for (let jj = 0; jj < valnum; jj++) {
            args[k] = vals[j];
            args[l] = vals[jj];
            let a = Math.min(args[0], args[1], args[2]);
            expect(a === a).assertEqual(false);
          }
        }
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0078
     * @tc.name ESMathTest0078
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0078';
      console.info(`${caseName}, test start`);
      for (let i = 0; i < 100; i++)
      {
        let val = Math.random();
        expect(typeof val).assertEqual('number');
        expect(val === NaN).assertEqual(false);
        expect(val >= 0 && val < 1).assertEqual(true);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0079
     * @tc.name ESMathTest0079
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0079';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.round(NaN))).assertEqual(Number.isNaN(NaN));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0080
     * @tc.name ESMathTest0080
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0080';
      console.info(`${caseName}, test start`);
      expect(Math.round(0)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0081
     * @tc.name ESMathTest0081
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0081';
      console.info(`${caseName}, test start`);
      expect(Math.round(-0)).assertEqual(-0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0082
     * @tc.name ESMathTest0082
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0082';
      console.info(`${caseName}, test start`);
      let x = +Infinity;
      expect(Math.round(x)).assertEqual(+Infinity);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0083
     * @tc.name ESMathTest0083
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0083';
      console.info(`${caseName}, test start`);
      let x = -Infinity;
      expect(Math.round(x)).assertEqual(-Infinity);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0084
     * @tc.name ESMathTest0084
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0084';
      console.info(`${caseName}, test start`);
      for (let i = 0; i <= 500; i++)
      {
        let x = i / 10.0;
        expect(Math.round(x)).assertEqual(Math.floor(x + 0.5));
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0084_2
     * @tc.name ESMathTest0084_2
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0084_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0084_2';
      console.info(`${caseName}, test start`);
      for (let i = 500; i <= 1000; i++)
      {
        let x = i / 10.0;
        expect(Math.round(x)).assertEqual(Math.floor(x + 0.5));
      }
      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.number ES_BUILTINS_MATH_0084_3
     * @tc.name ESMathTest0084_3
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0084_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0084_3';
      console.info(`${caseName}, test start`);
      for (let i = -5; i >= -500; i--)
      {
        let x = 0.0;
        if (i === -5)
        {
          x = -0.500000000000001;
        } else
        {
          x = i / 10.0;
        }
        console.log(Math.round(x)+'',Math.floor(x + 0.5)+'','Math.round(i / 10.0) must return the same value returned by Math.floor(x + 0.5)')
        expect(Math.round(x)).assertEqual(Math.floor(x + 0.5));
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0084_4
     * @tc.name ESMathTest0084_4
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0084_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0084_4';
      console.info(`${caseName}, test start`);
      for (let i = -500; i >= -1000; i--)
      {
        let x = 0.0;
        if (i === -5)
        {
          x = -0.500000000000001;
        } else
        {
          x = i / 10.0;
        }
        console.log(Math.round(x)+'',Math.floor(x + 0.5)+'','Math.round(i / 10.0) must return the same value returned by Math.floor(x + 0.5)')
        expect(Math.round(x)).assertEqual(Math.floor(x + 0.5));
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0085
     * @tc.name ESMathTest0085
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0085';
      console.info(`${caseName}, test start`);
      expect(1 / Math.round(-0.5)).assertEqual(1 / -0.0);
      expect(1 / Math.round(-0.25)).assertEqual(1 / -0.0);
      expect(1 / Math.round(-0.0)).assertEqual(1 / -0.0);
      let x: number = 0.0;
      x = 0.5 - Number.EPSILON / 4;
      expect(1 / Math.round(x)).assertEqual(1 / 0.0);
      x = -(2 / Number.EPSILON - 1);
      expect(Math.round(x)).assertEqual(x);
      x = -(1.5 / Number.EPSILON - 1);
      expect(Math.round(x)).assertEqual(x);
      x = -(1 / Number.EPSILON + 1);
      expect(Math.round(x)).assertEqual(x);
      x = 1 / Number.EPSILON + 1;
      expect(Math.round(x)).assertEqual(x);
      x = 1.5 / Number.EPSILON - 1;
      expect(Math.round(x)).assertEqual(x);
      x = 2 / Number.EPSILON - 1;
      expect(Math.round(x)).assertEqual(x);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0086
     * @tc.name ESMathTest0086
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0086';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.sign(NaN))).assertEqual(Number.isNaN(NaN))
      expect(Math.sign(-0)).assertEqual(-0)
      expect(Math.sign(0)).assertEqual(0)
      expect(Math.sign(-0.000001)).assertEqual(-1)
      expect(Math.sign(-1)).assertEqual(-1)
      expect(Math.sign(-Infinity)).assertEqual(-1)
      expect(Math.sign(0.000001)).assertEqual(1)
      expect(Math.sign(1)).assertEqual(1)
      expect(Math.sign(Infinity)).assertEqual(1)
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0087
     * @tc.name ESMathTest0087
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0087';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.sin(NaN))).assertEqual(Number.isNaN(NaN));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0088
     * @tc.name ESMathTest0088
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0088';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.sin(Infinity))).assertEqual(Number.isNaN(NaN));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0089
     * @tc.name ESMathTest0089
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0089';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.sin(-Infinity))).assertEqual(Number.isNaN(NaN));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0090
     * @tc.name ESMathTest0090
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0090';
      console.info(`${caseName}, test start`);
      expect(Math.sin(0)).assertEqual(0);
      expect(Math.sin(-0)).assertEqual(-0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0091
     * @tc.name ESMathTest0091
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0091';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.sinh(NaN))).assertEqual(Number.isNaN(NaN));
      expect(Math.sinh(Number.NEGATIVE_INFINITY)).assertEqual(Number.NEGATIVE_INFINITY);
      expect(Math.sinh(Number.POSITIVE_INFINITY)).assertEqual(Number.POSITIVE_INFINITY);
      expect(1 / Math.sinh(-0.0)).assertEqual(Number.NEGATIVE_INFINITY);
      expect(1 / Math.sinh(0.0)).assertEqual(Number.POSITIVE_INFINITY);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0092
     * @tc.name ESMathTest0092
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0092';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.sqrt(NaN))).assertEqual(Number.isNaN(NaN));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0093
     * @tc.name ESMathTest0093
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0093';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.sqrt(-0.000000000000001))).assertEqual(Number.isNaN(NaN))
      expect(Number.isNaN(Math.sqrt(-1))).assertEqual(Number.isNaN(NaN))
      expect(Number.isNaN(Math.sqrt(-Infinity))).assertEqual(Number.isNaN(NaN))
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0094
     * @tc.name ESMathTest0094
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0094';
      console.info(`${caseName}, test start`);
      expect(Math.sqrt(0)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0095
     * @tc.name ESMathTest0095
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0095';
      console.info(`${caseName}, test start`);
      expect(Math.sqrt(-0)).assertEqual(-0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0096
     * @tc.name ESMathTest0096
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0096';
      console.info(`${caseName}, test start`);
      let x = +Infinity;
      expect(Math.sqrt(x)).assertEqual(+Infinity);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0097
     * @tc.name ESMathTest0097
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0097';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.tan(NaN))).assertEqual(Number.isNaN(NaN));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0098
     * @tc.name ESMathTest0098
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0098';
      console.info(`${caseName}, test start`);
      expect(Math.tan(0)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0099
     * @tc.name ESMathTest0099
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0099';
      console.info(`${caseName}, test start`);
      expect(Math.tan(-0)).assertEqual(-0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0100
     * @tc.name ESMathTest0100
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0100';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.tan(Infinity))).assertEqual(Number.isNaN(NaN));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0101
     * @tc.name ESMathTest0101
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0101';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.tan(-Infinity))).assertEqual(Number.isNaN(NaN));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0102
     * @tc.name ESMathTest0102
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0102';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.tanh(NaN))).assertEqual(Number.isNaN(NaN))
      expect(Math.tanh(Number.NEGATIVE_INFINITY)).assertEqual(-1)
      expect(Math.tanh(Number.POSITIVE_INFINITY)).assertEqual(1)
      expect(1 / Math.tanh(-0.0)).assertEqual(Number.NEGATIVE_INFINITY)
      expect(1 / Math.tanh(0.0)).assertEqual(Number.POSITIVE_INFINITY)
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0103
     * @tc.name ESMathTest0103
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0103';
      console.info(`${caseName}, test start`);
      expect(Math.trunc(Infinity)).assertEqual(Infinity);
      expect(Math.trunc(-Infinity)).assertEqual(-Infinity);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0104
     * @tc.name ESMathTest0104
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0104';
      console.info(`${caseName}, test start`);
      expect(Number.isNaN(Math.trunc(NaN))).assertEqual(Number.isNaN(NaN));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0105
     * @tc.name ESMathTest0105
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0105';
      console.info(`${caseName}, test start`);
      expect(Math.trunc(-.9)).assertEqual(-0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0106
     * @tc.name ESMathTest0106
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0106';
      console.info(`${caseName}, test start`);
      expect(Math.trunc(.9)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0107
     * @tc.name ESMathTest0107
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0107';
      console.info(`${caseName}, test start`);
      expect(Math.trunc(4578.584949)).assertEqual(4578);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0108
     * @tc.name ESMathTest0108
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0108';
      console.info(`${caseName}, test start`);
      expect(Math.trunc(0)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0109
     * @tc.name ESMathTest0109
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0109';
      console.info(`${caseName}, test start`);
      expect(1 / Math.trunc(0.02047410048544407)).assertEqual(Number.POSITIVE_INFINITY);
      expect(1 / Math.trunc(0.00000000000000001)).assertEqual(Number.POSITIVE_INFINITY);
      expect(1 / Math.trunc(0.9999999999999999)).assertEqual(Number.POSITIVE_INFINITY);
      expect(1 / Math.trunc(Number.EPSILON)).assertEqual(Number.POSITIVE_INFINITY);
      expect(1 / Math.trunc(Number.MIN_VALUE)).assertEqual(Number.POSITIVE_INFINITY);
      expect(1 / Math.trunc(-0.02047410048544407)).assertEqual(Number.NEGATIVE_INFINITY);
      expect(1 / Math.trunc(-0.00000000000000001)).assertEqual(Number.NEGATIVE_INFINITY);
      expect(1 / Math.trunc(-0.9999999999999999)).assertEqual(Number.NEGATIVE_INFINITY);
      expect(1 / Math.trunc(-Number.EPSILON)).assertEqual(Number.NEGATIVE_INFINITY);
      expect(1 / Math.trunc(-Number.MIN_VALUE)).assertEqual(Number.NEGATIVE_INFINITY);
      expect(Math.trunc(Number.MAX_VALUE)).assertEqual(Math.floor(Number.MAX_VALUE));
      expect(Math.trunc(10)).assertEqual(Math.floor(10));
      expect(Math.trunc(3.9)).assertEqual(Math.floor(3.9));
      expect(Math.trunc(4.9)).assertEqual(Math.floor(4.9));
      expect(Math.trunc(-Number.MAX_VALUE)).assertEqual(Math.ceil(-Number.MAX_VALUE));
      expect(Math.trunc(-10)).assertEqual(Math.ceil(-10));
      expect(Math.trunc(-3.9)).assertEqual(Math.ceil(-3.9));
      expect(Math.trunc(-4.9)).assertEqual(Math.ceil(-4.9));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_MATH_0110
     * @tc.name ESMathTest0110
     * @tc.desc Test ES Builtins-Api in Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESMathTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESMathTest0110';
      console.info(`${caseName}, test start`);
      expect(Math.trunc(Number.NEGATIVE_INFINITY)).assertEqual(Number.NEGATIVE_INFINITY);
      expect(Math.trunc(Number.POSITIVE_INFINITY)).assertEqual(Number.POSITIVE_INFINITY);
      expect(1 / Math.trunc(-0.0)).assertEqual(Number.NEGATIVE_INFINITY);
      expect(1 / Math.trunc(0.0)).assertEqual(Number.POSITIVE_INFINITY);
      console.info(`${caseName}, test end`);
    });

  })
}
