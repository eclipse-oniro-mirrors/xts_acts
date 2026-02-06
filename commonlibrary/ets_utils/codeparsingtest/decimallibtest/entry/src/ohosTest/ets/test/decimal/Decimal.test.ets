/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { Deque, Decimal } from '@kit.ArkTS';

function getRandomFloat(min: number, max: number): number {
  return Math.random() * (max - min) + min;
}

function getRandomInt(min: number, max: number): number {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

export default function DecimalTest() {
  describe('DecimalTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_COMPARED_TO_0100
     * @tc.name       : testComparedTo0001
     * @tc.desc       : Testing the decimal comparedTo with "Nah".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testComparedTo0001',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testComparedTo0001';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: number = a.comparedTo("Nah");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_COMPARED_TO_0200
     * @tc.name       : testComparedTo0002
     * @tc.desc       : Testing the decimal comparedTo with 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testComparedTo0002',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testComparedTo0002';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: number = a.comparedTo(0);
        expect(c).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_COMPARED_TO_0300
     * @tc.name       : testComparedTo0003
     * @tc.desc       : Testing the decimal comparedTo with "0".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testComparedTo0003',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testComparedTo0003';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: number = a.comparedTo("0");
        expect(c).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_COMPARED_TO_0400
     * @tc.name       : testComparedTo0004
     * @tc.desc       : Testing the decimal comparedTo with new Decimal(0).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testComparedTo0004',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testComparedTo0004';
      try {
        let a: Decimal = new Decimal(Infinity);
        let b: Decimal = new Decimal(0);
        let c: number = a.comparedTo(b);
        expect(c).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_COMPARED_TO_0500
     * @tc.name       : testComparedTo0005
     * @tc.desc       : Testing the decimal comparedTo -0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testComparedTo0005',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testComparedTo0005';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: number = a.comparedTo(-0);
        expect(c).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_COMPARED_TO_0600
     * @tc.name       : testComparedTo0006
     * @tc.desc       : Testing the decimal comparedTo "-0".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testComparedTo0006',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testComparedTo0006';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: number = a.comparedTo("-0");
        expect(c).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_COMPARED_TO_0700
     * @tc.name       : testComparedTo0007
     * @tc.desc       : Testing the decimal comparedTo new Decimal(-0).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testComparedTo0007',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testComparedTo0007';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: number = a.comparedTo(new Decimal(-0));
        expect(c).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_COMPARED_TO_0800
     * @tc.name       : testComparedTo0008
     * @tc.desc       : Testing the decimal comparedTo Infinity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testComparedTo0008',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testComparedTo0008';
      try {
        let a: Decimal = new Decimal(0);
        let c: number = a.comparedTo(Infinity);
        expect(c).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_COMPARED_TO_0900
     * @tc.name       : testComparedTo0009
     * @tc.desc       : Testing the decimal comparedTo -Infinity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testComparedTo0009',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testComparedTo0009';
      try {
        let a: Decimal = new Decimal(0);
        let c: number = a.comparedTo(-Infinity);
        expect(c).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_COMPARED_TO_1000
     * @tc.name       : testComparedTo0010
     * @tc.desc       : Testing the decimal comparedTo with new Decimal(Infinity).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testComparedTo0010',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testComparedTo0010';
      try {
        let a: Decimal = new Decimal(0);
        let c: number = a.comparedTo(new Decimal(Infinity));
        expect(c).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_COMPARED_TO_1100
     * @tc.name       : testComparedTo0011
     * @tc.desc       : Testing the decimal comparedTo with number in scientific notation (5e3).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testComparedTo0011',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testComparedTo0011';
      try {
        let a: Decimal = new Decimal(5000);
        let c: number = a.comparedTo(5e3);
        expect(c).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_COMPARED_TO_1200
     * @tc.name       : testComparedTo0012
     * @tc.desc       : Testing the decimal comparedTo with various types of real numbers.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testComparedTo0012',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testComparedTo0012';
      try {
        let a: Decimal = new Decimal(10);
        expect(a.comparedTo(5)).assertEqual(1);
        let c: Decimal = new Decimal(-10);
        expect(c.comparedTo(-5)).assertEqual(-1);
        let e: Decimal = new Decimal(0.5);
        expect(e.comparedTo(0.75)).assertEqual(-1);
        let g: Decimal = new Decimal(-0.5);
        expect(g.comparedTo(-0.25)).assertEqual(-1);
        let i: Decimal = new Decimal(1e6);
        expect(i.comparedTo(500000)).assertEqual(1);
        let k: Decimal = new Decimal(-1e6);
        expect(k.comparedTo(-500000)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_COMPARED_TO_1300
     * @tc.name       : testComparedTo0013
     * @tc.desc       : Testing the decimal comparedTo with 'Infinity'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testComparedTo0013',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testComparedTo0013';
      try {
        let a: Decimal = new Decimal(0);
        let c: number = a.comparedTo('Infinity');
        expect(c).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_COMPARED_TO_1400
     * @tc.name       : testComparedTo0014
     * @tc.desc       : Testing the decimal comparedTo with '-Infinity'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testComparedTo0014',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testComparedTo0014';
      try {
        let a: Decimal = new Decimal(0);
        let c: number = a.comparedTo('-Infinity');
        expect(c).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_COMPARED_TO_1500
     * @tc.name       : testComparedTo0015
     * @tc.desc       : Testing the decimal comparedTo with new Decimal(-Infinity).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testComparedTo0015',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testComparedTo0015';
      try {
        let a: Decimal = new Decimal(0);
        let c: number = a.comparedTo(new Decimal(-Infinity));
        expect(c).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_COMPARED_TO_1600
     * @tc.name       : testComparedTo0016
     * @tc.desc       : Testing the decimal comparedTo with new Decimal("Nah").
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testComparedTo0016',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testComparedTo0016';
      try {
        let a: Decimal = new Decimal(Infinity);
        let b: Decimal = new Decimal("Nah");
        let c: number = a.comparedTo(b);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_COMPARED_TO_1700
     * @tc.name       : testComparedTo0017
     * @tc.desc       : Testing the decimal comparedTo with Decimal in scientific notation (5e3).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testComparedTo0017',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testComparedTo0017';
      try {
        let a: Decimal = new Decimal(Infinity);
        let b: Decimal = new Decimal(new Decimal(5e3));
        let c: number = a.comparedTo(b);
        expect(c).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_COMPARED_TO_1800
     * @tc.name       : testComparedTo0018
     * @tc.desc       : Testing the decimal comparedTo with new Decimal("0").
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testComparedTo0018',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testComparedTo0018';
      try {
        let a: Decimal = new Decimal(Infinity);
        let b: Decimal = new Decimal("0");
        let c: number = a.comparedTo(b);
        expect(c).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_COMPARED_TO_1900
     * @tc.name       : testComparedTo0019
     * @tc.desc       : Testing the decimal comparedTo new Decimal(0) in new Decimal().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testComparedTo0019',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testComparedTo0019';
      try {
        let a: Decimal = new Decimal(Infinity);
        let b: Decimal = new Decimal(new Decimal(0));
        let c: number = a.comparedTo(b);
        expect(c).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_COMPARED_TO_2000
     * @tc.name       : testComparedTo0020
     * @tc.desc       : Testing the decimal comparedTo with new Decimal(realNum).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testComparedTo0020',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testComparedTo0020';
      try {
        let a: Decimal = new Decimal(10);
        let b: Decimal = new Decimal(5);
        expect(a.comparedTo(b)).assertEqual(1);
        let c: Decimal = new Decimal(-10);
        let d: Decimal = new Decimal(-5);
        expect(c.comparedTo(d)).assertEqual(-1);
        let e: Decimal = new Decimal(0.5);
        let f: Decimal = new Decimal(0.75);
        expect(e.comparedTo(f)).assertEqual(-1);
        let g: Decimal = new Decimal(-0.5);
        let h: Decimal = new Decimal(-0.25);
        expect(g.comparedTo(h)).assertEqual(-1);
        let i: Decimal = new Decimal(1e6);
        let j: Decimal = new Decimal(500000);
        expect(i.comparedTo(j)).assertEqual(1);
        let k: Decimal = new Decimal(-1e6);
        let l: Decimal = new Decimal(-500000);
        expect(k.comparedTo(l)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_COMPARED_TO_2100
     * @tc.name       : testComparedTo0021
     * @tc.desc       : Testing the decimal comparedTo with new Decimal("-0").
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testComparedTo0021',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testComparedTo0021';
      try {
        let a: Decimal = new Decimal(-Infinity);
        let b: Decimal = new Decimal("-0");
        let c: number = a.comparedTo(b);
        expect(c).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_COMPARED_TO_2200
     * @tc.name       : testComparedTo0022
     * @tc.desc       : Testing the decimal comparedTo new Decimal(-0).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testComparedTo0022',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testComparedTo0022';
      try {
        let a: Decimal = new Decimal("5000");
        let b: Decimal = new Decimal(new Decimal(-0));
        let c: number = a.comparedTo(b);
        expect(c).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_COMPARED_TO_2500
     * @tc.name       : testComparedTo0025
     * @tc.desc       : Testing the decimal comparedTo with new Decimal(new Decimal(Infinity)).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testComparedTo0025',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testComparedTo0025';
      try {
        let a: Decimal = new Decimal(0);
        let b: Decimal = new Decimal(new Decimal(Infinity));
        let c: number = a.comparedTo(b);
        expect(c).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_COMPARED_TO_2600
     * @tc.name       : testComparedTo0026
     * @tc.desc       : Testing the decimal comparedTo with "Infinity".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testComparedTo0026',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testComparedTo0026';
      try {
        let a: Decimal = new Decimal(0);
        let b: Decimal = new Decimal("Infinity");
        let c: number = a.comparedTo(b);
        expect(c).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_EQUALS_0100
     * @tc.name       : testEquals0001
     * @tc.desc       : Testing the decimal equals with "Nah".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEquals0001',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testEquals0001';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.equals("Nah");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_EQUALS_0200
     * @tc.name       : testEquals0002
     * @tc.desc       : Testing the decimal equals with 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEquals0002',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testEquals0002';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.equals(0);
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_EQUALS_0300
     * @tc.name       : testEquals0003
     * @tc.desc       : Testing the decimal equals with "0".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEquals0003',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testEquals0003';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.equals("0");
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_EQUALS_0400
     * @tc.name       : testEquals0004
     * @tc.desc       : Testing the decimal equals with new Decimal(0).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEquals0004',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testEquals0004';
      try {
        let a: Decimal = new Decimal(Infinity);
        let b: Decimal = new Decimal(0);
        let c: boolean = a.equals(b);
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_EQUALS_0500
     * @tc.name       : testEquals0005
     * @tc.desc       : Testing the decimal equals -0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEquals0005',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testEquals0005';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.equals(-0);
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_EQUALS_0600
     * @tc.name       : testEquals0006
     * @tc.desc       : Testing the decimal equals "-0".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEquals0006',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testEquals0006';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.equals("-0");
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_EQUALS_0700
     * @tc.name       : testEquals0007
     * @tc.desc       : Testing the decimal equals new Decimal(-0).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEquals0007',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testEquals0007';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.equals(new Decimal(-0));
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_EQUALS_0800
     * @tc.name       : testEquals0008
     * @tc.desc       : Testing the decimal equals Infinity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEquals0008',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testEquals0008';
      try {
        let a: Decimal = new Decimal(0);
        let c: boolean = a.equals(Infinity);
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_EQUALS_0900
     * @tc.name       : testEquals0009
     * @tc.desc       : Testing the decimal equals -Infinity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEquals0009',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testEquals0009';
      try {
        let a: Decimal = new Decimal(0);
        let c: boolean = a.equals(-Infinity);
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_EQUALS_1000
     * @tc.name       : testEquals0010
     * @tc.desc       : Testing the decimal equals with new Decimal(Infinity).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEquals0010',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testEquals0010';
      try {
        let a: Decimal = new Decimal(0);
        let b: Decimal = new Decimal(Infinity);
        let c: boolean = a.equals(b);
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_EQUALS_1100
     * @tc.name       : testEquals0011
     * @tc.desc       : Testing the decimal equals with number in scientific notation (5e3).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEquals0011',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testEquals0011';
      try {
        let a: Decimal = new Decimal(5000);
        let b: Decimal = new Decimal(5e3);
        let c: boolean = a.equals(b);
        expect(c).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_EQUALS_1200
     * @tc.name       : testEquals0012
     * @tc.desc       : Testing the decimal equals with various types of real numbers.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEquals0012',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testEquals0012';
      try {
        let a: Decimal = new Decimal(10);
        let b: Decimal = new Decimal(5);
        expect(a.equals(b)).assertEqual(false);
        let c: Decimal = new Decimal(-10);
        let d: Decimal = new Decimal(-5);
        expect(c.equals(d)).assertEqual(false);
        let e: Decimal = new Decimal(0.5);
        let f: Decimal = new Decimal(0.75);
        expect(e.equals(f)).assertEqual(false);
        let g: Decimal = new Decimal(-0.5);
        let h: Decimal = new Decimal(-0.25);
        expect(g.equals(h)).assertEqual(false);
        let i: Decimal = new Decimal(1e6);
        let j: Decimal = new Decimal(500000);
        expect(i.equals(j)).assertEqual(false);
        let k: Decimal = new Decimal(-1e6);
        let l: Decimal = new Decimal(-500000);
        expect(k.equals(l)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_EQUALS_1300
     * @tc.name       : testEquals0013
     * @tc.desc       : Testing the decimal equals with 'Infinity'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEquals0013',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testEquals0013';
      try {
        let a: Decimal = new Decimal(0);
        let c: boolean = a.equals('Infinity');
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_EQUALS_1400
     * @tc.name       : testEquals0014
     * @tc.desc       : Testing the decimal equals with '-Infinity'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEquals0014',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testEquals0014';
      try {
        let a: Decimal = new Decimal(0);
        let c: boolean = a.equals('-Infinity');
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_EQUALS_1500
     * @tc.name       : testEquals0015
     * @tc.desc       : Testing the decimal equals with new Decimal(-Infinity).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEquals0015',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testEquals0015';
      try {
        let a: Decimal = new Decimal(0);
        let c: boolean = a.equals(new Decimal(-Infinity));
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHAN_0100
     * @tc.name       : testGreaterThan0001
     * @tc.desc       : Testing the decimal greaterThan with "Nah".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThan0001',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThan0001';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.greaterThan("Nah");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHAN_0200
     * @tc.name       : testGreaterThan0002
     * @tc.desc       : Testing the decimal greaterThan with 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThan0002',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThan0002';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.greaterThan(0);
        expect(c).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHAN_0300
     * @tc.name       : testGreaterThan0003
     * @tc.desc       : Testing the decimal greaterThan with "0".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThan0003',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThan0003';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.greaterThan("0");
        expect(c).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHAN_0400
     * @tc.name       : testGreaterThan0004
     * @tc.desc       : Testing the decimal greaterThan with new Decimal(0).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThan0004',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThan0004';
      try {
        let a: Decimal = new Decimal(Infinity);
        let b: Decimal = new Decimal(0);
        let c: boolean = a.greaterThan(b);
        expect(c).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHAN_0500
     * @tc.name       : testGreaterThan0005
     * @tc.desc       : Testing the decimal greaterThan -0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThan0005',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThan0005';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.greaterThan(-0);
        expect(c).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHAN_0600
     * @tc.name       : testGreaterThan0006
     * @tc.desc       : Testing the decimal greaterThan "-0".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThan0006',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThan0006';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.greaterThan("-0");
        expect(c).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHAN_0700
     * @tc.name       : testGreaterThan0007
     * @tc.desc       : Testing the decimal greaterThan new Decimal(-0).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThan0007',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThan0007';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.greaterThan(new Decimal(-0));
        expect(c).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHAN_0800
     * @tc.name       : testGreaterThan0008
     * @tc.desc       : Testing the decimal greaterThan Infinity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThan0008',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThan0008';
      try {
        let a: Decimal = new Decimal(0);
        let c: boolean = a.greaterThan(Infinity);
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHAN_0900
     * @tc.name       : testGreaterThan0009
     * @tc.desc       : Testing the decimal greaterThan -Infinity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThan0009',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThan0009';
      try {
        let a: Decimal = new Decimal(0);
        let c: boolean = a.greaterThan(-Infinity);
        expect(c).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHAN_1000
     * @tc.name       : testGreaterThan0010
     * @tc.desc       : Testing the decimal greaterThan with new Decimal(Infinity).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThan0010',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThan0010';
      try {
        let a: Decimal = new Decimal(0);
        let b: Decimal = new Decimal(Infinity);
        let c: boolean = a.greaterThan(b);
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHAN_1100
     * @tc.name       : testGreaterThan0011
     * @tc.desc       : Testing the decimal greaterThan with number in scientific notation (5e3).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThan0011',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThan0011';
      try {
        let a: Decimal = new Decimal(5000);
        let b: Decimal = new Decimal(5e3);
        let c: boolean = a.greaterThan(b);
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHAN_1200
     * @tc.name       : testGreaterThan0012
     * @tc.desc       : Testing the decimal greaterThan with various types of real numbers.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThan0012',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThan0012';
      try {
        let a: Decimal = new Decimal(10);
        let b: Decimal = new Decimal(5);
        expect(a.greaterThan(b)).assertEqual(true);
        let c: Decimal = new Decimal(-10);
        let d: Decimal = new Decimal(-5);
        expect(c.greaterThan(d)).assertEqual(false);
        let e: Decimal = new Decimal(0.5);
        let f: Decimal = new Decimal(0.75);
        expect(e.greaterThan(f)).assertEqual(false);
        let g: Decimal = new Decimal(-0.5);
        let h: Decimal = new Decimal(-0.25);
        expect(g.greaterThan(h)).assertEqual(false);
        let i: Decimal = new Decimal(1e6);
        let j: Decimal = new Decimal(500000);
        expect(i.greaterThan(j)).assertEqual(true);
        let k: Decimal = new Decimal(-1e6);
        let l: Decimal = new Decimal(-500000);
        expect(k.greaterThan(l)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHAN_1300
     * @tc.name       : testGreaterThan0013
     * @tc.desc       : Testing the decimal greaterThan with 'Infinity'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThan0013',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThan0013';
      try {
        let a: Decimal = new Decimal(0);
        let c: boolean = a.greaterThan('Infinity');
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHAN_1400
     * @tc.name       : testGreaterThan0014
     * @tc.desc       : Testing the decimal greaterThan with '-Infinity'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThan0014',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThan0014';
      try {
        let a: Decimal = new Decimal(0);
        let c: boolean = a.greaterThan('-Infinity');
        expect(c).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHAN_1500
     * @tc.name       : testGreaterThan0015
     * @tc.desc       : Testing the decimal greaterThan with new Decimal(-Infinity).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThan0015',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThan0015';
      try {
        let a: Decimal = new Decimal(0);
        let c: boolean = a.greaterThan(new Decimal(-Infinity));
        expect(c).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHANOREQUALTO_0100
     * @tc.name       : testGreaterThanOrEqualTo0001
     * @tc.desc       : Testing the decimal greaterThanOrEqualTo with "Nah".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThanOrEqualTo0001',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThanOrEqualTo0001';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.greaterThanOrEqualTo("Nah");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHANOREQUALTO_0200
     * @tc.name       : testGreaterThanOrEqualTo0002
     * @tc.desc       : Testing the decimal greaterThanOrEqualTo with 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThanOrEqualTo0002',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThanOrEqualTo0002';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.greaterThanOrEqualTo(0);
        expect(c).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHANOREQUALTO_0300
     * @tc.name       : testGreaterThanOrEqualTo0003
     * @tc.desc       : Testing the decimal greaterThanOrEqualTo with "0".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThanOrEqualTo0003',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThanOrEqualTo0003';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.greaterThanOrEqualTo("0");
        expect(c).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHANOREQUALTO_0400
     * @tc.name       : testGreaterThanOrEqualTo0004
     * @tc.desc       : Testing the decimal greaterThanOrEqualTo with new Decimal(0).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThanOrEqualTo0004',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThanOrEqualTo0004';
      try {
        let a: Decimal = new Decimal(Infinity);
        let b: Decimal = new Decimal(0);
        let c: boolean = a.greaterThanOrEqualTo(b);
        expect(c).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHANOREQUALTO_0500
     * @tc.name       : testGreaterThanOrEqualTo0005
     * @tc.desc       : Testing the decimal greaterThanOrEqualTo -0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThanOrEqualTo0005',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThanOrEqualTo0005';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.greaterThanOrEqualTo(-0);
        expect(c).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHANOREQUALTO_0600
     * @tc.name       : testGreaterThanOrEqualTo0006
     * @tc.desc       : Testing the decimal greaterThanOrEqualTo "-0".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThanOrEqualTo0006',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThanOrEqualTo0006';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.greaterThanOrEqualTo("-0");
        expect(c).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHANOREQUALTO_0700
     * @tc.name       : testGreaterThanOrEqualTo0007
     * @tc.desc       : Testing the decimal greaterThanOrEqualTo new Decimal(-0).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThanOrEqualTo0007',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThanOrEqualTo0007';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.greaterThanOrEqualTo(new Decimal(-0));
        expect(c).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHANOREQUALTO_0800
     * @tc.name       : testGreaterThanOrEqualTo0008
     * @tc.desc       : Testing the decimal greaterThanOrEqualTo Infinity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThanOrEqualTo0008',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThanOrEqualTo0008';
      try {
        let a: Decimal = new Decimal(0);
        let c: boolean = a.greaterThanOrEqualTo(Infinity);
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHANOREQUALTO_0900
     * @tc.name       : testGreaterThanOrEqualTo0009
     * @tc.desc       : Testing the decimal greaterThanOrEqualTo -Infinity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThanOrEqualTo0009',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThanOrEqualTo0009';
      try {
        let a: Decimal = new Decimal(0);
        let c: boolean = a.greaterThanOrEqualTo(-Infinity);
        expect(c).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHANOREQUALTO_1000
     * @tc.name       : testGreaterThanOrEqualTo0010
     * @tc.desc       : Testing the decimal greaterThanOrEqualTo with new Decimal(Infinity).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThanOrEqualTo0010',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThanOrEqualTo0010';
      try {
        let a: Decimal = new Decimal(0);
        let b: Decimal = new Decimal(Infinity);
        let c: boolean = a.greaterThanOrEqualTo(b);
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHANOREQUALTO_1100
     * @tc.name       : testGreaterThanOrEqualTo0011
     * @tc.desc       : Testing the decimal greaterThanOrEqualTo with number in scientific notation (5e3).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThanOrEqualTo0011',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThanOrEqualTo0011';
      try {
        let a: Decimal = new Decimal(5000);
        let b: Decimal = new Decimal(5e3);
        let c: boolean = a.greaterThanOrEqualTo(b);
        expect(c).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHANOREQUALTO_1200
     * @tc.name       : testGreaterThanOrEqualTo0012
     * @tc.desc       : Testing the decimal greaterThanOrEqualTo with various types of real numbers.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThanOrEqualTo0012',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThanOrEqualTo0012';
      try {
        let a: Decimal = new Decimal(10);
        let b: Decimal = new Decimal(5);
        expect(a.greaterThanOrEqualTo(b)).assertEqual(true);
        let c: Decimal = new Decimal(-10);
        let d: Decimal = new Decimal(-5);
        expect(c.greaterThanOrEqualTo(d)).assertEqual(false);
        let e: Decimal = new Decimal(0.5);
        let f: Decimal = new Decimal(0.75);
        expect(e.greaterThanOrEqualTo(f)).assertEqual(false);
        let g: Decimal = new Decimal(-0.5);
        let h: Decimal = new Decimal(-0.25);
        expect(g.greaterThanOrEqualTo(h)).assertEqual(false);
        let i: Decimal = new Decimal(1e6);
        let j: Decimal = new Decimal(500000);
        expect(i.greaterThanOrEqualTo(j)).assertEqual(true);
        let k: Decimal = new Decimal(-1e6);
        let l: Decimal = new Decimal(-500000);
        expect(k.greaterThanOrEqualTo(l)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHANOREQUALTO_1300
     * @tc.name       : testGreaterThanOrEqualTo0013
     * @tc.desc       : Testing the decimal greaterThanOrEqualTo with 'Infinity'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThanOrEqualTo0013',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThanOrEqualTo0013';
      try {
        let a: Decimal = new Decimal(0);
        let c: boolean = a.greaterThanOrEqualTo('Infinity');
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHANOREQUALTO_1400
     * @tc.name       : testGreaterThanOrEqualTo0014
     * @tc.desc       : Testing the decimal greaterThanOrEqualTo with '-Infinity'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThanOrEqualTo0014',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThanOrEqualTo0014';
      try {
        let a: Decimal = new Decimal(0);
        let c: boolean = a.greaterThanOrEqualTo('-Infinity');
        expect(c).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATERTHANOREQUALTO_1500
     * @tc.name       : testGreaterThanOrEqualTo0015
     * @tc.desc       : Testing the decimal greaterThanOrEqualTo with new Decimal(-Infinity).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGreaterThanOrEqualTo0015',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testGreaterThanOrEqualTo0015';
      try {
        let a: Decimal = new Decimal(0);
        let c: boolean = a.greaterThanOrEqualTo(new Decimal(-Infinity));
        expect(c).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHAN_0100
     * @tc.name       : testLessThan0001
     * @tc.desc       : Testing the decimal lessThan with "Nah".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThan0001',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThan0001';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.lessThan("Nah");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHAN_0200
     * @tc.name       : testLessThan0002
     * @tc.desc       : Testing the decimal lessThan with 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThan0002',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThan0002';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.lessThan(0);
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHAN_0300
     * @tc.name       : testLessThan0003
     * @tc.desc       : Testing the decimal lessThan with "0".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThan0003',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThan0003';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.lessThan("0");
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHAN_0400
     * @tc.name       : testLessThan0004
     * @tc.desc       : Testing the decimal lessThan with new Decimal(0).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThan0004',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThan0004';
      try {
        let a: Decimal = new Decimal(Infinity);
        let b: Decimal = new Decimal(0);
        let c: boolean = a.lessThan(b);
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHAN_0500
     * @tc.name       : testLessThan0005
     * @tc.desc       : Testing the decimal lessThan -0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThan0005',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThan0005';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.lessThan(-0);
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHAN_0600
     * @tc.name       : testLessThan0006
     * @tc.desc       : Testing the decimal lessThan "-0".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThan0006',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThan0006';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.lessThan("-0");
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHAN_0700
     * @tc.name       : testLessThan0007
     * @tc.desc       : Testing the decimal lessThan new Decimal(-0).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThan0007',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThan0007';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.lessThan(new Decimal(-0));
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHAN_0800
     * @tc.name       : testLessThan0008
     * @tc.desc       : Testing the decimal lessThan Infinity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThan0008',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThan0008';
      try {
        let a: Decimal = new Decimal(0);
        let c: boolean = a.lessThan(Infinity);
        expect(c).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHAN_0900
     * @tc.name       : testLessThan0009
     * @tc.desc       : Testing the decimal lessThan -Infinity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThan0009',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThan0009';
      try {
        let a: Decimal = new Decimal(0);
        let c: boolean = a.lessThan(-Infinity);
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHAN_1000
     * @tc.name       : testLessThan0010
     * @tc.desc       : Testing the decimal lessThan with new Decimal(Infinity).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThan0010',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThan0010';
      try {
        let a: Decimal = new Decimal(0);
        let b: Decimal = new Decimal(Infinity);
        let c: boolean = a.lessThan(b);
        expect(c).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHAN_1100
     * @tc.name       : testLessThan0011
     * @tc.desc       : Testing the decimal lessThan with number in scientific notation (5e3).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThan0011',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThan0011';
      try {
        let a: Decimal = new Decimal(5000);
        let b: Decimal = new Decimal(5e3);
        let c: boolean = a.lessThan(b);
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHAN_1200
     * @tc.name       : testLessThan0012
     * @tc.desc       : Testing the decimal lessThan with various types of real numbers.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThan0012',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThan0012';
      try {
        let a: Decimal = new Decimal(10);
        let b: Decimal = new Decimal(5);
        expect(a.lessThan(b)).assertEqual(false);
        let c: Decimal = new Decimal(-10);
        let d: Decimal = new Decimal(-5);
        expect(c.lessThan(d)).assertEqual(true);
        let e: Decimal = new Decimal(0.5);
        let f: Decimal = new Decimal(0.75);
        expect(e.lessThan(f)).assertEqual(true);
        let g: Decimal = new Decimal(-0.5);
        let h: Decimal = new Decimal(-0.25);
        expect(g.lessThan(h)).assertEqual(true);
        let i: Decimal = new Decimal(1e6);
        let j: Decimal = new Decimal(500000);
        expect(i.lessThan(j)).assertEqual(false);
        let k: Decimal = new Decimal(-1e6);
        let l: Decimal = new Decimal(-500000);
        expect(k.lessThan(l)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHAN_1300
     * @tc.name       : testLessThan0013
     * @tc.desc       : Testing the decimal lessThan with 'Infinity'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThan0013',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThan0013';
      try {
        let a: Decimal = new Decimal(0);
        let c: boolean = a.lessThan('Infinity');
        expect(c).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHAN_1400
     * @tc.name       : testLessThan0014
     * @tc.desc       : Testing the decimal lessThan with '-Infinity'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThan0014',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThan0014';
      try {
        let a: Decimal = new Decimal(0);
        let c: boolean = a.lessThan('-Infinity');
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHAN_1500
     * @tc.name       : testLessThan0015
     * @tc.desc       : Testing the decimal lessThan with new Decimal(-Infinity).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThan0015',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThan0015';
      try {
        let a: Decimal = new Decimal(0);
        let c: boolean = a.lessThan(new Decimal(-Infinity));
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHANOREQUALTO_0100
     * @tc.name       : testLessThanOrEqualTo0001
     * @tc.desc       : Testing the decimal lessThanOrEqualTo with "Nah".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThanOrEqualTo0001',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThanOrEqualTo0001';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.lessThanOrEqualTo("Nah");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHANOREQUALTO_0200
     * @tc.name       : testLessThanOrEqualTo0002
     * @tc.desc       : Testing the decimal lessThanOrEqualTo with 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThanOrEqualTo0002',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThanOrEqualTo0002';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.lessThanOrEqualTo(0);
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHANOREQUALTO_0300
     * @tc.name       : testLessThanOrEqualTo0003
     * @tc.desc       : Testing the decimal lessThanOrEqualTo with "0".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThanOrEqualTo0003',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThanOrEqualTo0003';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.lessThanOrEqualTo("0");
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHANOREQUALTO_0400
     * @tc.name       : testLessThanOrEqualTo0004
     * @tc.desc       : Testing the decimal lessThanOrEqualTo with new Decimal(0).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThanOrEqualTo0004',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThanOrEqualTo0004';
      try {
        let a: Decimal = new Decimal(Infinity);
        let b: Decimal = new Decimal(0);
        let c: boolean = a.lessThanOrEqualTo(b);
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHANOREQUALTO_0500
     * @tc.name       : testLessThanOrEqualTo0005
     * @tc.desc       : Testing the decimal lessThanOrEqualTo -0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThanOrEqualTo0005',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThanOrEqualTo0005';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.lessThanOrEqualTo(-0);
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHANOREQUALTO_0600
     * @tc.name       : testLessThanOrEqualTo0006
     * @tc.desc       : Testing the decimal lessThanOrEqualTo "-0".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThanOrEqualTo0006',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThanOrEqualTo0006';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.lessThanOrEqualTo("-0");
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHANOREQUALTO_0700
     * @tc.name       : testLessThanOrEqualTo0007
     * @tc.desc       : Testing the decimal lessThanOrEqualTo new Decimal(-0).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThanOrEqualTo0007',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThanOrEqualTo0007';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: boolean = a.lessThanOrEqualTo(new Decimal(-0));
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHANOREQUALTO_0800
     * @tc.name       : testLessThanOrEqualTo0008
     * @tc.desc       : Testing the decimal lessThanOrEqualTo Infinity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThanOrEqualTo0008',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThanOrEqualTo0008';
      try {
        let a: Decimal = new Decimal(0);
        let c: boolean = a.lessThanOrEqualTo(Infinity);
        expect(c).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHANOREQUALTO_0900
     * @tc.name       : testLessThanOrEqualTo0009
     * @tc.desc       : Testing the decimal lessThanOrEqualTo -Infinity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThanOrEqualTo0009',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThanOrEqualTo0009';
      try {
        let a: Decimal = new Decimal(0);
        let c: boolean = a.lessThanOrEqualTo(-Infinity);
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHANOREQUALTO_1000
     * @tc.name       : testLessThanOrEqualTo0010
     * @tc.desc       : Testing the decimal lessThanOrEqualTo with new Decimal(Infinity).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThanOrEqualTo0010',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThanOrEqualTo0010';
      try {
        let a: Decimal = new Decimal(0);
        let b: Decimal = new Decimal(Infinity);
        let c: boolean = a.lessThanOrEqualTo(b);
        expect(c).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHANOREQUALTO_1100
     * @tc.name       : testLessThanOrEqualTo0011
     * @tc.desc       : Testing the decimal lessThanOrEqualTo with number in scientific notation (5e3).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThanOrEqualTo0011',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThanOrEqualTo0011';
      try {
        let a: Decimal = new Decimal(5000);
        let b: Decimal = new Decimal(5e3);
        let c: boolean = a.lessThanOrEqualTo(b);
        expect(c).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHANOREQUALTO_1200
     * @tc.name       : testLessThanOrEqualTo0012
     * @tc.desc       : Testing the decimal lessThanOrEqualTo with various types of real numbers.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThanOrEqualTo0012',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThanOrEqualTo0012';
      try {
        let a: Decimal = new Decimal(10);
        let b: Decimal = new Decimal(5);
        expect(a.lessThanOrEqualTo(b)).assertEqual(false);
        let c: Decimal = new Decimal(-10);
        let d: Decimal = new Decimal(-5);
        expect(c.lessThanOrEqualTo(d)).assertEqual(true);
        let e: Decimal = new Decimal(0.5);
        let f: Decimal = new Decimal(0.75);
        expect(e.lessThanOrEqualTo(f)).assertEqual(true);
        let g: Decimal = new Decimal(-0.5);
        let h: Decimal = new Decimal(-0.25);
        expect(g.lessThanOrEqualTo(h)).assertEqual(true);
        let i: Decimal = new Decimal(1e6);
        let j: Decimal = new Decimal(500000);
        expect(i.lessThanOrEqualTo(j)).assertEqual(false);
        let k: Decimal = new Decimal(-1e6);
        let l: Decimal = new Decimal(-500000);
        expect(k.lessThanOrEqualTo(l)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHANOREQUALTO_1300
     * @tc.name       : testLessThanOrEqualTo0013
     * @tc.desc       : Testing the decimal lessThanOrEqualTo with 'Infinity'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThanOrEqualTo0013',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThanOrEqualTo0013';
      try {
        let a: Decimal = new Decimal(0);
        let c: boolean = a.lessThanOrEqualTo('Infinity');
        expect(c).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHANOREQUALTO_1400
     * @tc.name       : testLessThanOrEqualTo0014
     * @tc.desc       : Testing the decimal lessThanOrEqualTo with '-Infinity'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThanOrEqualTo0014',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThanOrEqualTo0014';
      try {
        let a: Decimal = new Decimal(0);
        let c: boolean = a.lessThanOrEqualTo('-Infinity');
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESSTHANOREQUALTO_1500
     * @tc.name       : testLessThanOrEqualTo0015
     * @tc.desc       : Testing the decimal lessThanOrEqualTo with new Decimal(-Infinity).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLessThanOrEqualTo0015',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLessThanOrEqualTo0015';
      try {
        let a: Decimal = new Decimal(0);
        let c: boolean = a.lessThanOrEqualTo(new Decimal(-Infinity));
        expect(c).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_DIVIDEDTOINTEGERBY_0100
     * @tc.name       : testDividedToIntegerBy0001
     * @tc.desc       : Testing the decimal dividedToIntegerBy with "Nah".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDividedToIntegerBy0001',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDividedToIntegerBy0001';
      try {
        let a: Decimal = new Decimal(20);
        let c: Decimal = a.dividedToIntegerBy("Nah");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_DIVIDEDTOINTEGERBY_0200
     * @tc.name       : testDividedToIntegerBy0002
     * @tc.desc       : Testing the decimal dividedToIntegerBy with 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDividedToIntegerBy0002',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDividedToIntegerBy0002';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: Decimal = a.dividedToIntegerBy(0);
        expect(c.toNumber()).assertEqual(Infinity);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_DIVIDEDTOINTEGERBY_0300
     * @tc.name       : testDividedToIntegerBy0003
     * @tc.desc       : Testing the decimal dividedToIntegerBy with "0".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDividedToIntegerBy0003',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDividedToIntegerBy0003';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: Decimal = a.dividedToIntegerBy("0");
        expect(c.toNumber()).assertEqual(Infinity);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_DIVIDEDTOINTEGERBY_0400
     * @tc.name       : testDividedToIntegerBy0004
     * @tc.desc       : Testing the decimal dividedToIntegerBy with new Decimal(0).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDividedToIntegerBy0004',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDividedToIntegerBy0004';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: Decimal = a.dividedToIntegerBy(new Decimal(0));
        expect(c.toNumber()).assertEqual(Infinity);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_DIVIDEDTOINTEGERBY_0500
     * @tc.name       : testDividedToIntegerBy0005
     * @tc.desc       : Testing the decimal dividedToIntegerBy with -0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDividedToIntegerBy0005',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDividedToIntegerBy0005';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: Decimal = a.dividedToIntegerBy(-0);
        expect(c.toNumber()).assertEqual(-Infinity);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_DIVIDEDTOINTEGERBY_0600
     * @tc.name       : testDividedToIntegerBy0006
     * @tc.desc       : Testing the decimal dividedToIntegerBy with "-0".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDividedToIntegerBy0006',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDividedToIntegerBy0006';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: Decimal = a.dividedToIntegerBy("-0");
        expect(c.toNumber()).assertEqual(-Infinity);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_DIVIDEDTOINTEGERBY_0700
     * @tc.name       : testDividedToIntegerBy0007
     * @tc.desc       : Testing the decimal dividedToIntegerBy with new Decimal(-0).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDividedToIntegerBy0007',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDividedToIntegerBy0007';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c: Decimal = a.dividedToIntegerBy(new Decimal(-0));
        expect(c.toNumber()).assertEqual(-Infinity);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_DIVIDEDTOINTEGERBY_0800
     * @tc.name       : testDividedToIntegerBy0008
     * @tc.desc       : Testing the decimal dividedToIntegerBy with Infinity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDividedToIntegerBy0008',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDividedToIntegerBy0008';
      try {
        let a: Decimal = new Decimal(0);
        let c: Decimal = a.dividedToIntegerBy(Infinity);
        expect(c.toNumber()).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_DIVIDEDTOINTEGERBY_0900
     * @tc.name       : testDividedToIntegerBy0009
     * @tc.desc       : Testing the decimal dividedToIntegerBy with "Infinity".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDividedToIntegerBy0009',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDividedToIntegerBy0009';
      try {
        let a: Decimal = new Decimal(0);
        let c: Decimal = a.dividedToIntegerBy("Infinity");
        expect(c.toNumber()).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_DIVIDEDTOINTEGERBY_1000
     * @tc.name       : testDividedToIntegerBy0010
     * @tc.desc       : Testing the decimal dividedToIntegerBy with new Decimal(Infinity).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDividedToIntegerBy0010',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDividedToIntegerBy0010';
      try {
        let a: Decimal = new Decimal(0);
        let c: Decimal = a.dividedToIntegerBy(new Decimal(Infinity));
        expect(c.toNumber()).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_DIVIDEDTOINTEGERBY_1100
     * @tc.name       : testDividedToIntegerBy0011
     * @tc.desc       : Testing the decimal dividedToIntegerBy with -Infinity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDividedToIntegerBy0011',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDividedToIntegerBy0011';
      try {
        let a: Decimal = new Decimal(0);
        let c: Decimal = a.dividedToIntegerBy(-Infinity);
        expect(c.toNumber()).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_DIVIDEDTOINTEGERBY_1200
     * @tc.name       : testDividedToIntegerBy0012
     * @tc.desc       : Testing the decimal dividedToIntegerBy with "-Infinity".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDividedToIntegerBy0012',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDividedToIntegerBy0012';
      try {
        let a: Decimal = new Decimal(0);
        let c: Decimal = a.dividedToIntegerBy("-Infinity");
        expect(c.toNumber()).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_DIVIDEDTOINTEGERBY_1300
     * @tc.name       : testDividedToIntegerBy0013
     * @tc.desc       : Testing the decimal dividedToIntegerBy with new Decimal(-Infinity).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDividedToIntegerBy0013',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDividedToIntegerBy0013';
      try {
        let a: Decimal = new Decimal(0);
        let c: Decimal = a.dividedToIntegerBy(new Decimal(-Infinity));
        expect(c.toNumber()).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_DIVIDEDTOINTEGERBY_1400
     * @tc.name       : testDividedToIntegerBy0014
     * @tc.desc       : Testing the decimal dividedToIntegerBy with number in scientific notation (5e3).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDividedToIntegerBy0014',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDividedToIntegerBy0014';
      try {
        let a: Decimal = new Decimal(5000);
        let b: Decimal = new Decimal(5e3);
        let c: Decimal = a.dividedToIntegerBy(b);
        expect(c.toNumber()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_DIVIDEDTOINTEGERBY_1500
     * @tc.name       : testDividedToIntegerBy0015
     * @tc.desc       : Testing the decimal dividedToIntegerBy with various types of real numbers.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDividedToIntegerBy0015',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDividedToIntegerBy0015';
      try {
        let a: Decimal = new Decimal(10);
        let b: Decimal = new Decimal(5);
        expect(a.dividedToIntegerBy(b).toNumber()).assertEqual(2);
        let c: Decimal = new Decimal(-10);
        let d: Decimal = new Decimal(-5);
        expect(c.dividedToIntegerBy(d).toNumber()).assertEqual(2);
        let e: Decimal = new Decimal(0.5);
        let f: Decimal = new Decimal(0.75);
        expect(e.dividedToIntegerBy(f).toNumber()).assertEqual(0);
        let g: Decimal = new Decimal(-0.5);
        let h: Decimal = new Decimal(-0.25);
        expect(g.dividedToIntegerBy(h).toNumber()).assertEqual(2);
        let i: Decimal = new Decimal(1e6);
        let j: Decimal = new Decimal(500000);
        expect(i.dividedToIntegerBy(j).toNumber()).assertEqual(2);
        let k: Decimal = new Decimal(-1e6);
        let l: Decimal = new Decimal(-500000);
        expect(k.dividedToIntegerBy(l).toNumber()).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_0100
     * @tc.name       : testInsertFront0001
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInsertFront0001',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInsertFront0001";
      try {
        let deque: Deque<string> = new Deque();
        deque.insertFront("a")
        deque.insertFront("b")
        deque.insertFront("c")
        let result = deque.getFirst();
        expect(result).assertEqual("c");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_0100
     * @tc.name       : testDecimal0001
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0001',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal000f1";
      try {
        let a: Decimal = new Decimal("Nah").sqrt();
        console.info(TAG + " test Decimal sqrt is " + a.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_0200
     * @tc.name       : testDecimal0002
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0002',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0002";
      try {
        let a: Decimal = new Decimal(-0).sqrt();
        console.info(TAG + " test Decimal sqrt is " + a.toString());
        expect(a.toNumber()).assertEqual(-0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_0300
     * @tc.name       : testDecimal0003
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0003',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0003";
      try {
        let a: Decimal = new Decimal(Infinity).sqrt();
        console.info(TAG + " test Decimal sqrt is " + a.toString());
        expect(a.toNumber()).assertEqual(Infinity);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_0400
     * @tc.name       : testDecimal0004
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0004',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0004";
      try {
        let a: Decimal = new Decimal(-Infinity).sqrt();
        console.info(TAG + " test Decimal sqrt is " + a.toNumber());
        expect(Number.isNaN(a.toNumber())).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_0500
     * @tc.name       : testDecimal0005
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0005',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0005";
      try {
        let a: Decimal = new Decimal(-1).sqrt();
        console.info(TAG + " test Decimal sqrt is " + a.toNumber());
        expect(Number.isNaN(a.toNumber())).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_0600
     * @tc.name       : testDecimal0006
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0006',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0006";
      try {
        let a: Decimal = new Decimal(9).sqrt();
        console.info(TAG + " test Decimal sqrt is " + a.toNumber());
        let b = Math.sqrt(9);
        console.info(TAG + " test Math sqrt is " + b);
        expect(a.toNumber()).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_0800
     * @tc.name       : testDecimal0008
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0008',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0008";
      try {
        let a: Decimal = new Decimal(9.6).sqrt();
        console.info(TAG + " test Decimal sqrt is " + a.toNumber());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_0900
     * @tc.name       : testDecimal0009
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0009',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0009";
      try {
        let a: Decimal = new Decimal("abcd").sqrt();
        console.info(TAG + " test Decimal sqrt is " + a.toNumber());
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.toString()
          .includes('BusinessError: The type of "test(str)" must be Hex/Binary/Octal. Received value is:')).assertTrue()
        expect(err.code).assertEqual(401);
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_1000
     * @tc.name       : testDecimal0010
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0010',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0010";
      try {
        let a: Decimal = new Decimal(2.5).div(0.5);
        console.info(`${TAG} test Decimal div: ${a.toString()}`);
        expect(a.toNumber()).assertEqual(5)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_1100
     * @tc.name       : testDecimal0011
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0011',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0011";
      try {
        let a: Decimal = new Decimal(256);
        let b: string = a.toBinary();
        console.info(`test Decimal toBinary: + ${b}`); //
        expect(b).assertEqual('0b100000000')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_1200
     * @tc.name       : testDecimal0012
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0012',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0012";
      try {
        let a: Decimal = new Decimal(0);
        let b: string = a.toBinary();
        console.info(`${TAG} test Decimal toBinary: + ${b}`); //
        expect(b).assertEqual('0b0')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_1300
     * @tc.name       : testDecimal0013
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0013',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0013";
      try {
        let a: Decimal = new Decimal(+Infinity);
        let b: string = a.toBinary();
        console.info(`${TAG} test Decimal toBinary: ${b}`); //
        expect(b).assertEqual("Infinity")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_1400
     * @tc.name       : testDecimal0014
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0014',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0014";
      try {
        let a: Decimal = new Decimal(-Infinity);
        let b: string = a.toBinary();
        console.info(`${TAG} test Decimal toBinary: ${b}`); //
        expect(b).assertEqual("-Infinity")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_1500
     * @tc.name       : testDecimal0015
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0015',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0015";
      try {
        let a: Decimal = new Decimal(13.14);
        let b: string = a.toBinary();
        console.info(`${TAG} test Decimal toBinary: ${b}`); //
        expect(b).assertEqual("0b1101.0010001111010111")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_1600
     * @tc.name       : testDecimal0016
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0016',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0016";
      try {
        let a: Decimal = new Decimal(13.14);
        let b: string = a.toBinary(0);
        console.info(`${TAG} test Decimal toBinary: ${b}`); //
        expect().assertFail()
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect(10200001).assertEqual(err.code);
        expect(err.toString()
          .includes('BusinessError: The value of "0" is out of range. It must be >= 1 && <= 1000000000 . Received value is: 0'))
          .assertTrue()
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_1700
     * @tc.name       : testDecimal0017
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0017',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0017";
      try {
        let a: Decimal = new Decimal(256);
        let b: string = a.toOctal();
        console.info(`${TAG} Decimal toOctal: ${b}`);
        expect(b).assertEqual("0o400")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_1800
     * @tc.name       : testDecimal0018
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0018',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0018";
      try {
        let a: Decimal = new Decimal(256);
        let b: string = a.toHexadecimal();
        console.info(`${TAG} Decimal toHexadecimal: ${b}`);
        expect(b).assertEqual("0x100")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_1900
     * @tc.name       : testDecimal0019
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0019',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0019";
      try {
        let a: Decimal = new Decimal(3.456);
        let b: string = a.toFixed();
        console.info(`${TAG} Decimal toHexadecimal: ${b}`);
        expect(b).assertEqual("3.456")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_2000
     * @tc.name       : testDecimal0020
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0020',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0020";
      try {
        let a: Decimal = new Decimal(1.75);
        let b: Decimal[] = a.toFraction();
        console.info(`${TAG} Decimal toFraction: + ${b.toString()}`);
        expect(b.toString()).assertEqual("7,4")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_2100
     * @tc.name       : testDecimal0021
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0021',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0021";
      try {
        let a: Decimal = new Decimal(12.34567);
        let b: Decimal = a.toDecimalPlaces();
        console.info(`${TAG} Decimal toDecimalPlaces: + ${b.toString()}`);
        expect(b.toString()).assertEqual("12.34567")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_2200
     * @tc.name       : testDecimal0022
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0022',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0022";
      try {
        let a: Decimal = new Decimal(-Infinity);
        let b: Decimal = a.toDecimalPlaces();
        console.info(`${TAG} Decimal toDecimalPlaces: + ${b.toString()}`);
        expect(b.toNumber()).assertEqual(-Infinity)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_2300
     * @tc.name       : testDecimal0023
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0023',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0023";
      try {
        let a: Decimal = new Decimal(Infinity);
        let b: Decimal = a.toDecimalPlaces();
        console.info(`${TAG} Decimal toDecimalPlaces: + ${b.toString()}`);
        expect(b.toNumber()).assertEqual(Infinity)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_2400
     * @tc.name       : testDecimal0024
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0024',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0024";
      try {
        let a: Decimal = new Decimal(NaN);
        let b: Decimal = a.toDecimalPlaces();
        console.info(`${TAG} Decimal toDecimalPlaces: + ${b.toString()}`);
        expect(Number.isNaN(a.toNumber())).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_2500
     * @tc.name       : testDecimal0025
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0025',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0025";
      try {
        let a: Decimal = new Decimal(0);
        let b: Decimal = a.toDecimalPlaces();
        console.info(`${TAG} Decimal toDecimalPlaces: + ${b.toString()}`);
        expect(b.toNumber()).assertEqual(0)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_2600
     * @tc.name       : testDecimal0026
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0026',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0026";
      try {
        let a: Decimal = new Decimal(Infinity);
        let b: Decimal = a.toDecimalPlaces(0);
        console.info(`${TAG} Decimal toDecimalPlaces: + ${b.toString()}`);
        expect(b.toNumber()).assertEqual(Infinity)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_2700
     * @tc.name       : testDecimal0026
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0027',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0027";
      try {
        let a: Decimal = new Decimal(-Infinity);
        let b: Decimal = a.toDecimalPlaces(0);
        console.info(`${TAG} Decimal toDecimalPlaces: + ${b.toString()}`);
        expect(b.toNumber()).assertEqual(-Infinity)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_2800
     * @tc.name       : testDecimal0028
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0028',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0028";
      try {
        let a: Decimal = new Decimal(30.16789);
        Decimal.set({
          rounding: Decimal.ROUND_DOWN
        })
        let b: Decimal = a.toDecimalPlaces(2);
        console.info(`${TAG} Decimal toDecimalPlaces: + ${b.toString()}`);
        expect(b.toNumber()).assertEqual(30.16)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_2900
     * @tc.name       : testDecimal0029
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0029',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0029";
      try {
        let a: Decimal = new Decimal(30.16789);
        Decimal.set({
          rounding: Decimal.ROUND_UP
        })
        let b: Decimal = a.toDecimalPlaces(0);
        console.info(`${TAG} Decimal toDecimalPlaces: + ${b.toString()}`);
        expect(b.toNumber()).assertEqual(31)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_3000
     * @tc.name       : testDecimal0030
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0030',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0030";
      try {
        let a: Decimal = new Decimal(0);
        console.info(`${TAG} Decimal :  ${a.toString()}`);
        expect(a.toNumber()).assertEqual(0)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_3100
     * @tc.name       : testDecimal0031
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0031',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0031";
      try {
        let a: Decimal = new Decimal(-0);
        console.info(`${TAG} Decimal :  ${a.toString()}`);
        expect(a.toNumber()).assertEqual(-0)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_3200
     * @tc.name       : testDecimal0032
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0032',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0032";
      try {
        let a: Decimal = new Decimal(0);
        console.info(`${TAG} Decimal :  ${a.toString()}`);
        expect(a.toNumber()).assertEqual(0)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_3300
     * @tc.name       : testDecimal0033
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0033',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0033";
      try {
        const randomNumber = getRandomFloat(1.5, 5.5);
        let a: Decimal = new Decimal(randomNumber);
        let b: Decimal = a.toDecimalPlaces(0);
        console.info(`${TAG} Decimal :  ${b.toString()}`);
        let alist = [1, 2, 3, 4, 5, 6]
        expect(alist.includes(b.toNumber())).assertTrue()
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_3400
     * @tc.name       : testDecimal0034
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0034',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0034";
      try {
        let a: Decimal = new Decimal(1e10);
        console.info(`${TAG} Decimal :  ${a.toString()}`);
        let b: Decimal = a.toDecimalPlaces(0);
        console.info(`${TAG} Decimal toDecimalPlaces: + ${b.toString()}`);
        expect(b.toNumber()).assertEqual(10000000000)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_3500
     * @tc.name       : testDecimal0035
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0035',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0035";
      try {
        let a: Decimal = new Decimal(45.6);
        console.info(`${TAG} Decimal :  ${a.toString()}`);
        let b: string = a.toExponential();
        console.info(`${TAG} Decimal toExponential: + ${b.toString()}`);
        expect(b.toString()).assertEqual('4.56e+1')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_3600
     * @tc.name       : testDecimal0036
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0036',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0036";
      try {
        let a: Decimal = new Decimal(45.6);
        console.info(`${TAG} Decimal :  ${a.toString()}`);
        let b: string = a.toExponential(0);
        console.info(`${TAG} Decimal toExponential: + ${b.toString()}`);
        expect(b.toString()).assertEqual("5e+1")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_3700
     * @tc.name       : testDecimal0037
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0037',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0037";
      try {
        let a: Decimal = new Decimal(47);
        console.info(`${TAG} Decimal :  ${a.toString()}`);
        let b: string = a.toExponential(1);
        console.info(`${TAG} Decimal toExponential: + ${b.toString()}`);
        expect(b.toString()).assertEqual('4.7e+1')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_3800
     * @tc.name       : testDecimal0038
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0038',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0038";
      try {
        const randomInt = getRandomInt(1, 10000);
        let a: Decimal = new Decimal(randomInt);
        console.info(`${TAG} Decimal :  ${a.toString()}`);
        const randomInt1 = getRandomInt(1, 3);
        let b: string = a.toExponential(randomInt1);
        console.info(`${TAG} Decimal toExponential: + ${b.toString()}`);
        expect(Number(b.toString().split("e")[1]) > 0).assertTrue()
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_3900
     * @tc.name       : testDecimal0039
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0039',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0039";
      try {
        const randomFloat = getRandomFloat(0.1, 0.8);
        let a: Decimal = new Decimal(randomFloat);
        console.info(`${TAG} Decimal :  ${a.toString()}`);
        const randomInt1 = getRandomInt(1, 3);
        let b: string = a.toExponential(randomInt1);
        console.info(`${TAG} Decimal toExponential: + ${b.toString()}`);
        expect(Number(b.toString().split("e")[1]) < 0).assertTrue()
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_4000
     * @tc.name       : testDecimal0040
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0040',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0040";
      try {
        const randomFloat = getRandomInt(1, 9);
        let a: Decimal = new Decimal(randomFloat);
        console.info(`${TAG} Decimal :  ${a.toString()}`);
        const randomInt1 = getRandomInt(1, 10);
        let b: string = a.toExponential(randomInt1);
        console.info(`${TAG} Decimal toExponential: + ${b.toString()}`);
        expect(Number(b.toString().split("e")[1]) == 0).assertTrue()
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_4100
     * @tc.name       : testDecimal0041
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0041',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0041";
      try {
        let a: Decimal = new Decimal(Infinity);
        console.info(`${TAG} Decimal :  ${a.toString()}`);
        let b: string = a.toExponential(10);
        console.info(`${TAG} Decimal toExponential: + ${b.toString()}`);
        expect(Number(b.toString())).assertEqual(Infinity)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_4200
     * @tc.name       : testDecimal0042
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0042',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0042";
      try {
        let a: Decimal = new Decimal(-Infinity);
        console.info(`${TAG} Decimal :  ${a.toString()}`);
        let b: string = a.toExponential(0);
        console.info(`${TAG} Decimal toExponential: + ${b.toString()}`);
        expect(Number(b.toString())).assertEqual(-Infinity)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_4300
     * @tc.name       : testDecimal0043
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0043',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0043";
      try {
        let a: Decimal = new Decimal(-Infinity);
        console.info(`${TAG} Decimal :  ${a.toString()}`);
        let b: string = a.toExponential(1);
        console.info(`${TAG} Decimal toExponential: + ${b.toString()}`);
        expect(Number(b.toString())).assertEqual(-Infinity)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_4400
     * @tc.name       : testDecimal0044
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0044',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0044";
      try {
        let a: Decimal = new Decimal(-100);
        console.info(`${TAG} Decimal :  ${a.toString()}`);
        let b: string = a.toExponential(-1);
        console.info(`${TAG} Decimal toExponential: + ${b.toString()}`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect(10200001).assertEqual(err.code);
        expect(err.toString()
          .includes('BusinessError: The value of "-1" is out of range. It must be >= 0 && <= 1000000000 . Received value is: -1'))
          .assertTrue()
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_4500
     * @tc.name       : testDecimal0045
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0045',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0045";
      try {
        let a: Decimal = new Decimal(0).exp();
        console.info(`${TAG} Decimal exp:  ${a.toString()}`);
        expect(a.toNumber()).assertEqual(1)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_4600
     * @tc.name       : testDecimal0046
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0046',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0046";
      try {
        let a: Decimal = new Decimal(-0).exp();
        console.info(`${TAG} Decimal exp:  ${a.toString()}`);
        expect(a.toNumber()).assertEqual(1)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_4700
     * @tc.name       : testDecimal0047
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0047',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0047";
      try {
        let a: Decimal = new Decimal(Infinity).exp();
        console.info(`${TAG} Decimal exp:  ${a.toString()}`);
        expect(a.toNumber()).assertEqual(Infinity)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_4800
     * @tc.name       : testDecimal0048
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0048',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0048";
      try {
        let a: Decimal = new Decimal(-Infinity).exp();
        console.info(`${TAG} Decimal exp:  ${a.toString()}`);
        expect(a.toNumber()).assertEqual(0)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_4900
     * @tc.name       : testDecimal0049
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0049',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0049";
      const n = 5;
      try {
        let a: Decimal = new Decimal(n).exp();
        console.info(`${TAG} Decimal exp:  ${a.toString()}`);
        expect(a.toNumber()).assertEqual(148.41315910257660343);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_5000
     * @tc.name       : testDecimal0050
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0050',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0050";
      const n = 5;
      try {
        let a: Decimal = new Decimal(n).exp();
        console.info(`${TAG} Decimal exp:  ${a.toString()}`);
        expect(a.toNumber()).assertLarger(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_5100
     * @tc.name       : testDecimal0051
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0051',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0051";
      const n = 2.08E+16;
      try {
        let a: Decimal = new Decimal(n).exp();
        console.info(`${TAG} Decimal exp:  ${a.toString()}`);
        expect(a.toNumber()).assertEqual(Infinity);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_5400
     * @tc.name       : testDecimal0054
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0054',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0054";
      const n = "testDecimal0054";
      try {
        let a: Decimal = new Decimal(n).exp();
        console.info(`${TAG} Decimal exp:  ${a.toString()}`);
        expect().assertFail()
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.toString()
          .includes('BusinessError: The type of "test(str)" must be Hex/Binary/Octal. Received value is:')).assertTrue()
        expect(401).assertEqual(err.code)
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_5500
     * @tc.name       : testDecimal0055
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0055',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0055";
      try {
        let a: Decimal = Decimal.max(-3, 6, 9, NaN, Infinity, -Infinity);
        console.info(`${TAG} Decimal max:  ${a.toString()}`);
        expect(Number.isNaN(a.toNumber())).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_5600
     * @tc.name       : testDecimal0056
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0056',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0056";
      try {
        let a: Decimal = Decimal.max(-3, 6, 9, Infinity, -Infinity);
        console.info(`${TAG} Decimal max:  ${a.toString()}`);
        expect(a.toNumber()).assertEqual(Infinity);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_5700
     * @tc.name       : testDecimal0057
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0057',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0057";
      try {
        let a: Decimal = Decimal.max(0, 0, 0, 0);
        console.info(`${TAG} Decimal max:  ${a.toString()}`);
        expect(a.toNumber()).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_5800
     * @tc.name       : testDecimal0058
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0058',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0058";
      try {
        let a: Decimal = Decimal.max(new Decimal(-1), "0", "6.758E-05", 10, 6.758E+05);
        console.info(`${TAG} Decimal max:  ${a.toString()}`);
        expect(a.toNumber()).assertEqual(6.758E+05);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_5900
     * @tc.name       : testDecimal0059
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0059',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0059";
      try {
        let a: Decimal = Decimal.max(Decimal.max(new Decimal(-1), "0", "6.758E-05", 10, 6.758E+05),
          Decimal.min(new Decimal(-1), "0", "6.758E-05", 10, 6.758E+05));
        console.info(`${TAG} Decimal max:  ${a.toString()}`);
        expect(a.toNumber()).assertEqual(6.758E+05);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_6000
     * @tc.name       : testDecimal0060
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0060',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0060";
      try {
        let a: Decimal = Decimal.max("0", "6.758EGB-05", 10, 6.758E+05);
        console.info(`${TAG} Decimal max:  ${a.toString()}`);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.toString()
          .includes('BusinessError: The type of "test(str)" must be Hex/Binary/Octal. Received value is:')).assertTrue()
        expect(401).assertEqual(err.code)
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_6100
     * @tc.name       : testDecimal0061
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0061',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0061";
      try {
        let a: Decimal = Decimal.min(-3, 6, 9, NaN, Infinity, -Infinity);
        console.info(`${TAG} Decimal max:  ${a.toString()}`);
        expect(Number.isNaN(a.toNumber())).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_6200
     * @tc.name       : testDecimal0062
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0062',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0062";
      try {
        let a: Decimal = Decimal.min(-3, 6, 9, Infinity, -Infinity);
        console.info(`${TAG} Decimal min:  ${a.toString()}`);
        expect(a.toNumber()).assertEqual(-Infinity);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_6300
     * @tc.name       : testDecimal0063
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0063',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0063";
      try {
        let a: Decimal = Decimal.min(0, 0, 0, 0);
        console.info(`${TAG} Decimal min:  ${a.toString()}`);
        expect(a.toNumber()).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_6400
     * @tc.name       : testDecimal0064
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0064',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0064";
      try {
        let a: Decimal = Decimal.min(new Decimal(-1), "0", "6.758E-05", 10, 6.758E+05);
        console.info(`${TAG} Decimal min:  ${a.toString()}`);
        expect(a.toNumber()).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_6500
     * @tc.name       : testDecimal0065
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0065',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0065";
      try {
        let a: Decimal = Decimal.min(Decimal.max(new Decimal(-1), "0", "6.758E-05", 10, 6.758E+05),
          Decimal.min(new Decimal(-1), "0", "6.758E-05", 10, 6.758E+05));
        console.info(`${TAG} Decimal min:  ${a.toString()}`);
        expect(a.toNumber()).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_6600
     * @tc.name       : testDecimal0066
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0066',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0066";
      try {
        let a: Decimal = Decimal.min("-1.1314", "6.758EGB-05", 10, 6.758E+05);
        console.info(`${TAG} Decimal min:  ${a.toString()}`);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.toString()
          .includes('BusinessError: The type of "test(str)" must be Hex/Binary/Octal. Received value is:')).assertTrue()
        expect(401).assertEqual(err.code)
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_6700
     * @tc.name       : testDecimal0067
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0067',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0067";
      try {
        let a: Decimal = Decimal.sum(-3, 6, 9, Infinity, -Infinity);
        console.info(`${TAG} Decimal sum:  ${a.toString()}`);
        expect(Number.isNaN(a.toNumber())).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_6800
     * @tc.name       : testDecimal0068
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0068',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0068";
      try {
        let a: Decimal = Decimal.sum(0, 0, 0, 0);
        console.info(`${TAG} Decimal sum:  ${a.toString()}`);
        expect(a.toNumber()).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_6900
     * @tc.name       : testDecimal0069
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0069',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0069";
      try {
        let a: Decimal = Decimal.sum(new Decimal(-1), "0", "6.758E-05", 10, 6.758E+05, 2);
        console.info(`${TAG} Decimal sum:  ${a.toString()}`);
        expect(a.toNumber()).assertEqual(675811.00006758);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_7000
     * @tc.name       : testDecimal0070
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0070',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0070";
      try {
        let a: Decimal = Decimal.sum(Decimal.sum(new Decimal(-1), "0", "6.758E-05", 10, 6.758E+05),
          Decimal.sum(new Decimal(-1), "0", "6.758E-05", 10, 6.758E+05), 1);
        console.info(`${TAG} Decimal sum:  ${a.toString()}`);
        expect(a.toNumber()).assertEqual(1351619.00013516);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_7100
     * @tc.name       : testDecimal0071
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0071',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0071";
      try {
        let a: Decimal = Decimal.sum("-1.1314S", "6.758EGB-05", 10, 6.758E+05);
        console.info(`${TAG} Decimal sum:  ${a.toString()}`);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.toString()
          .includes('BusinessError: The type of "test(str)" must be Hex/Binary/Octal. Received value is:')).assertTrue()
        expect(401).assertEqual(err.code)
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_7200
     * @tc.name       : testDecimal0072
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0072',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0072";
      try {
        let a: Decimal = Decimal.hypot(-3, 6, 9, Infinity, -Infinity);
        console.info(`${TAG} Decimal hypot:  ${a.toString()}`);
        expect(a.toNumber()).assertEqual(Infinity);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_7300
     * @tc.name       : testDecimal0073
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0073',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0073";
      try {
        let a: Decimal = Decimal.hypot(0, 0, 0, 0);
        console.info(`${TAG} Decimal hypot:  ${a.toString()}`);
        expect(a.toNumber()).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_7400
     * @tc.name       : testDecimal0074
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0074',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0074";
      try {
        let a: Decimal = Decimal.hypot(new Decimal(-1), "0", "6.758E-05", 10, 6.758E+05, 2);
        console.info(`${TAG} Decimal hypot:  ${a.toString()}`);
        expect(a.toNumber()).assertEqual(675800.00007768570583);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_7500
     * @tc.name       : testDecimal0075
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0075',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0075";
      try {
        let a: Decimal = Decimal.hypot(Decimal.hypot(new Decimal(-1), "0", "6.758E-05", 10, 6.758E+05),
          Decimal.hypot(new Decimal(-1), "0", "6.758E-05", 10, 6.758E+05), 1);
        console.info(`${TAG} Decimal hypot:  ${a.toString()}`);
        expect(a.toNumber()).assertEqual(955725.52555793967347);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_7600
     * @tc.name       : testDecimal0076
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0076',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0076";
      try {
        let a: Decimal = Decimal.hypot("-1.1314S", "6.758EGB-05", 10, 6.758E+05);
        console.info(`${TAG} Decimal hypot:  ${a.toString()}`);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.toString()
          .includes('BusinessError: The type of "test(str)" must be Hex/Binary/Octal. Received value is:')).assertTrue()
        expect(401).assertEqual(err.code)
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_7800
     * @tc.name       : testDecimal0078
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0078',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0078";
      try {
        let a: Decimal = Decimal.sin(0.75);
        console.info(TAG + " test Decimal sin is " + a.toNumber());
        expect(a.toNumber()).assertEqual(0.6816387600233342)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_7900
     * @tc.name       : testDecimal0079
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0079',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0079";
      try {
        let a: Decimal = new Decimal(0.75)
        console.info(TAG + " test Decimal sin is " + a.sin());
        expect(a.sin().toNumber()).assertEqual(0.6816387600233342)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_8000
     * @tc.name       : testDecimal0080
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0080',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0080";
      try {
        let a: Decimal = Decimal.cos(-0.25);
        console.info(TAG + " test Decimal sin cos " + a.toNumber());
        expect(a.toNumber()).assertEqual(0.9689124217106448)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_8100
     * @tc.name       : testDecimal0081
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0081',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0081";
      try {
        let a: Decimal = new Decimal(-0.25)
        console.info(TAG + " test Decimal sin is " + a.cos());
        console.info("test Decimal cos:" + a.toString());
        expect(a.cos().toNumber()).assertEqual(0.9689124217106448)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_8200
     * @tc.name       : testDecimal0082
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0082',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0082";
      try {
        let a: Decimal = Decimal.tan(0.75);
        console.info(TAG + " test Decimal tan is " + a.toNumber());
        expect(a.toNumber()).assertEqual(0.9315964599440724)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_8300
     * @tc.name       : testDecimal0083
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0083',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0083";
      try {
        let a: Decimal = new Decimal(0.75)
        console.info(TAG + " test Decimal tan is " + a.tan());
        console.info("test Decimal cos:" + a.toString());
        expect(a.tan().toNumber()).assertEqual(0.9315964599440724)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_8400
     * @tc.name       : testDecimal0084
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0084',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0084";
      try {
        let a: Decimal = Decimal.sinh(0.5);
        console.info(TAG + " test Decimal sinh is " + a.toNumber());
        expect(a.toNumber()).assertEqual(0.5210953054937474)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_8500
     * @tc.name       : testDecimal0085
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0085',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0085";
      try {
        let a: Decimal = new Decimal(0.5)
        console.info(TAG + " test Decimal sinh is " + a.sinh());
        console.info("test Decimal cos:" + a.toString());
        expect(a.sinh().toNumber()).assertEqual(0.5210953054937474)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_8600
     * @tc.name       : testDecimal0086
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0086',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0086";
      try {
        let a: Decimal = Decimal.cosh(0.5);
        console.info(TAG + " test Decimal cosh is " + a.toNumber());
        expect(a.toNumber()).assertEqual(1.1276259652063807)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_8700
     * @tc.name       : testDecimal0087
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0087',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0087";
      try {
        let a: Decimal = new Decimal(0.5)
        console.info(TAG + " test Decimal cosh is " + a.cosh());
        expect(a.cosh().toNumber()).assertEqual(1.1276259652063807)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_8800
     * @tc.name       : testDecimal0088
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0088',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0088";
      try {
        let a: Decimal = Decimal.tanh(0.5);
        console.info(TAG + " test Decimal tanh is " + a.toNumber());
        expect(a.toNumber()).assertEqual(0.4621171572600098)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_8900
     * @tc.name       : testDecimal0089
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0089',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0089";
      try {
        let a: Decimal = new Decimal(0.5)
        console.info(TAG + " test Decimal tanh is " + a.tanh());
        expect(a.tanh().toNumber()).assertEqual(0.4621171572600098)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_9000
     * @tc.name       : testDecimal0090
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0090',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0090";
      try {
        let a: Decimal = new Decimal(0.5)
        console.info(TAG + " test Decimal tanh is " + a.tanh());
        expect(a.tanh().toNumber()).assertEqual(0.4621171572600098)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_9100
     * @tc.name       : testComparedTo0091
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0091',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDecimal0091';
      try {
        let a: Decimal = new Decimal("Nah");
        a.tanh();
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_9200
     * @tc.name       : testDecimal0092
     * @tc.desc       : Testing the decimal comparedTo with 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0092',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDecimal0092';
      try {
        let a: Decimal = new Decimal(0);
        console.info(TAG + " test Decimal tanh is " + a.tanh());
        expect(a.tanh().toNumber()).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_9300
     * @tc.name       : testDecimal0093
     * @tc.desc       : Testing the decimal comparedTo with "0".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0093',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDecimal0093';
      try {
        let a: Decimal = new Decimal("0");
        console.info(TAG + " test Decimal tanh is " + a.tanh());
        expect(a.tanh().toNumber()).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_9400
     * @tc.name       : testComparedTo0004
     * @tc.desc       : Testing the decimal comparedTo with new Decimal(0).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0094',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDecimal0094';
      try {
        let b: Decimal = new Decimal(0);
        let c = b.tanh();
        console.info(TAG + " test Decimal tanh is " + c);
        expect(c.toNumber()).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_9500
     * @tc.name       : testDecimal0095
     * @tc.desc       : Testing the decimal comparedTo -0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0095',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDecimal0095';
      try {
        let a: Decimal = new Decimal(Infinity);
        console.info(TAG + " test Decimal tanh is " + a.tanh());
        let c = a.tanh();
        expect(c.toNumber()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_9600
     * @tc.name       : testComparedTo0006
     * @tc.desc       : Testing the decimal comparedTo "-0".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0096',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDecimal0096';
      try {
        let a: Decimal = new Decimal(Infinity);
        console.info(TAG + " test Decimal tanh is " + a.tanh());
        let c = a.tanh();
        expect(c.toNumber()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_9700
     * @tc.name       : testComparedTo0007
     * @tc.desc       : Testing the decimal comparedTo new Decimal(-0).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0097',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDecimal0097';
      try {
        let a: Decimal = new Decimal(Infinity);
        console.info(TAG + " test Decimal tanh is " + a.tanh());
        let c = a.tanh();
        expect(c.toNumber()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_9800
     * @tc.name       : testComparedTo0008
     * @tc.desc       : Testing the decimal comparedTo Infinity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0098',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDecimal0098';
      try {
        let a: Decimal = new Decimal(0);
        let c: number = a.comparedTo(Infinity);
        expect(c).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_9900
     * @tc.name       : testComparedTo0009
     * @tc.desc       : Testing the decimal comparedTo Infinity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0099',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDecimal0099';
      try {
        let a: Decimal = new Decimal(0);
        let c: number = a.comparedTo(-Infinity);
        expect(c).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_1000
     * @tc.name       : testDecimal0100
     * @tc.desc       : Test the function of the interface Decimal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecimal0100',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDecimal0100";
      try {
        // 将配置属性全部设置为默认值
        Decimal.set({
          precision: 2, defaults: true
        })
        let a: Decimal = new Decimal(10).sqrt();
        console.info(TAG + " test Decimal a sqrt is " + a.toNumber());
        expect(a.toNumber()).assertEqual(3.2);
        let b: Decimal = new Decimal(-10).sqrt();
        console.info(TAG + " test Decimal b sqrt is " + b.toNumber());
        expect(Number.isNaN(b.toNumber())).assertTrue();
        let c: Decimal = new Decimal(1024).sqrt();
        console.info(TAG + " test Decimal c sqrt is " + c.toNumber());
        expect(c.toNumber()).assertEqual(32);
        let d: Decimal = new Decimal(11.8).sqrt();
        console.info(TAG + " test Decimal d sqrt is " + d.toNumber());
        expect(d.toNumber()).assertEqual(3.4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_0100
     * @tc.name       : testSin0001
     * @tc.desc       : Testing the decimal sin with "Nah".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0001',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0001';
      try {
        let a: Decimal = new Decimal("Nah");
        a.sin();
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_0200
     * @tc.name       : testSin0002
     * @tc.desc       : Testing the decimal sin with 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0002',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0002';
      try {
        let a: Decimal = new Decimal(0);
        let c = a.sin();
        expect(c.toNumber()).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_0300
     * @tc.name       : testSin0003
     * @tc.desc       : Testing the decimal sin with "0".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0003',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0003';
      try {
        let a: Decimal = new Decimal("0");
        let c = a.sin();
        expect(c.toNumber()).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_0400
     * @tc.name       : testSin0004
     * @tc.desc       : Testing the decimal sin with new Decimal(0).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0004',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0004';
      try {
        let b: Decimal = new Decimal(0);
        let c = b.sin();
        expect(c.toNumber()).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_0500
     * @tc.name       : testSin0005
     * @tc.desc       : Testing the decimal sin -0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0005',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0005';
      try {
        let a: Decimal = new Decimal(-0);
        let c = a.sin();
        expect(c.toNumber()).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_0600
     * @tc.name       : testSin0006
     * @tc.desc       : Testing the decimal sin "-0".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0006',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0006';
      try {
        let a: Decimal = new Decimal("-0");
        let c = a.sin();
        expect(c.toNumber()).assertEqual(-0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_0700
     * @tc.name       : testSin0007
     * @tc.desc       : Testing the decimal sin new Decimal(-0).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0007',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0007';
      try {
        let a: Decimal = new Decimal(-0);
        let c = a.sin();
        expect(c.toNumber()).assertEqual(-0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_0800
     * @tc.name       : testSin0008
     * @tc.desc       : Testing the decimal sin Infinity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0008',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0008';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c = a.sin();
        expect(Number.isNaN(c.toNumber())).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_0900
     * @tc.name       : testSin0009
     * @tc.desc       : Testing the decimal sin -Infinity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0009',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0009';
      try {
        let a: Decimal = new Decimal(-Infinity);
        let c = a.sin();
        expect(Number.isNaN(c.toNumber())).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_1000
     * @tc.name       : testSin0010
     * @tc.desc       : Testing the decimal sin with new Decimal(Infinity).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0010',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0010';
      try {
        let a: Decimal = new Decimal(Infinity);
        let c = a.sin();
        expect(Number.isNaN(c.toNumber())).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_1100
     * @tc.name       : testSin0011
     * @tc.desc       : Testing the decimal sin with number in scientific notation (5e3).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0011',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0011';
      try {
        let a: Decimal = new Decimal(5e3);
        let c = a.sin();
        expect(c.toNumber()).assertEqual(-0.99);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_1200
     * @tc.name       : testSin0012
     * @tc.desc       : Testing the decimal sin with various types of real numbers.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0012',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0012';
      try {
        let a: Decimal = new Decimal(10);
        console.log(`${TAG} a.sin : ${a.sin()}`);
        expect(a.sin().toNumber()).assertEqual(-0.54);
        let c: Decimal = new Decimal(-10);
        console.log(`${TAG} c.sin : ${c.sin()}`);
        expect(c.sin().toNumber()).assertEqual(0.54);
        let e: Decimal = new Decimal(0.5);
        console.log(`${TAG} e.sin : ${e.sin()}`);
        expect(e.sin().toNumber()).assertEqual(0.48);
        let g: Decimal = new Decimal(-0.5);
        console.log(`${TAG} g.sin : ${g.sin()}`);
        expect(g.sin().toNumber()).assertEqual(-0.48);
        let i: Decimal = new Decimal(1e6);
        console.log(`${TAG} i.sin : ${i.sin()}`);
        expect(i.sin().toNumber()).assertEqual(-0.35);
        let k: Decimal = new Decimal(-1e6);
        console.log(`${TAG} k.sin : ${k.sin()}`);
        expect(k.sin().toNumber()).assertEqual(0.35);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_1300
     * @tc.name       : testSin0013
     * @tc.desc       : Testing the decimal sin with 'Infinity'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0013',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0013';
      try {
        let a: Decimal = new Decimal('Infinity');
        let c = a.sin();
        expect(Number.isNaN(c.toNumber())).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_1400
     * @tc.name       : testSin0014
     * @tc.desc       : Testing the decimal sin with '-Infinity'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0014',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0014';
      try {
        let a: Decimal = new Decimal('-Infinity');
        let c = a.sin();
        expect(Number.isNaN(c.toNumber())).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_1500
     * @tc.name       : testSin0015
     * @tc.desc       : Testing the decimal sin with new Decimal(-Infinity).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0015',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0015';
      try {
        let a: Decimal = new Decimal(-Infinity);
        let c = a.sin();
        expect(Number.isNaN(c.toNumber())).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_1600
     * @tc.name       : testSin0016
     * @tc.desc       : Testing the decimal sin with "Nah".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0016',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0016';
      try {
        Decimal.sin("Nah");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_1700
     * @tc.name       : testSin0017
     * @tc.desc       : Testing the decimal sin with 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0017',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0017';
      try {
        let c = Decimal.sin(0);
        expect(c.toNumber()).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_1800
     * @tc.name       : testSin0018
     * @tc.desc       : Testing the decimal sin with "0".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0018',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0018';
      try {
        let c = Decimal.sin("0");
        expect(c.toNumber()).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_1900
     * @tc.name       : testSin0019
     * @tc.desc       : Testing the decimal sin with new Decimal(0).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0019',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0019';
      try {
        let b: Decimal = new Decimal(0);
        let c = Decimal.sin(b);
        expect(c.toNumber()).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_2000
     * @tc.name       : testSin0020
     * @tc.desc       : Testing the decimal sin -0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0020',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0020';
      try {
        let c = Decimal.sin(-0);
        expect(c.toNumber()).assertEqual(-0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_2100
     * @tc.name       : testSin0021
     * @tc.desc       : Testing the decimal sin "-0".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0021',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0021';
      try {
        let c = Decimal.sin("-0");
        expect(c.toNumber()).assertEqual(-0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_2200
     * @tc.name       : testSin0022
     * @tc.desc       : Testing the decimal sin new Decimal(-0).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0022',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0022';
      try {
        let c = Decimal.sin(new Decimal(-0));
        expect(c.toNumber()).assertEqual(-0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_2300
     * @tc.name       : testSin0023
     * @tc.desc       : Testing the decimal sin Infinity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0023',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0023';
      try {
        let c = Decimal.sin(Infinity);
        expect(Number.isNaN(c.toNumber())).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_2400
     * @tc.name       : testSin0024
     * @tc.desc       : Testing the decimal sin -Infinity.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0024',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0024';
      try {
        let c = Decimal.sin(-Infinity);
        expect(Number.isNaN(c.toNumber())).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_2400
     * @tc.name       : testSin0025
     * @tc.desc       : Testing the decimal sin with new Decimal(Infinity).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0025',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0025';
      try {
        let c = Decimal.sin(new Decimal(Infinity));
        expect(Number.isNaN(c.toNumber())).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_2600
     * @tc.name       : testSin0026
     * @tc.desc       : Testing the decimal sin with number in scientific notation (5e3).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0026',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0026';
      try {
        let c = Decimal.sin(5e3);
        expect(c.toNumber()).assertEqual(-0.99);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_2700
     * @tc.name       : testSin0027
     * @tc.desc       : Testing the decimal sin with various types of real numbers.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0027',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0027';
      try {
        let a: Decimal = new Decimal(5);
        console.log(`${TAG} a.sin : ${Decimal.sin(a)}`);
        expect(Decimal.sin(a).toNumber()).assertEqual(-0.96);
        let b: Decimal = new Decimal(-5);
        console.log(`${TAG} b.sin : ${Decimal.sin(b)}`);
        expect(Decimal.sin(b).toNumber()).assertEqual(0.96);
        let c: Decimal = new Decimal(10);
        console.log(`${TAG} c.sin : ${Decimal.sin(c)}`);
        expect(Decimal.sin(c).toNumber()).assertEqual(-0.54);
        let d: Decimal = new Decimal(-10);
        console.log(`${TAG} d.sin : ${Decimal.sin(d)}`);
        expect(Decimal.sin(d).toNumber()).assertEqual(0.54);
        let e: Decimal = new Decimal(0.5);
        console.log(`${TAG} e.sin : ${Decimal.sin(e)}`);
        expect(Decimal.sin(e).toNumber()).assertEqual(0.48);
        let g: Decimal = new Decimal(-0.5);
        console.log(`${TAG} g.sin : ${Decimal.sin(g)}`);
        expect(Decimal.sin(g).toNumber()).assertEqual(-0.48);
        let i: Decimal = new Decimal(1e6);
        console.log(`${TAG} i.sin : ${Decimal.sin(i)}`);
        expect(Decimal.sin(i).toNumber()).assertEqual(-0.35);
        let k: Decimal = new Decimal(-1e6);
        console.log(`${TAG} k.sin : ${Decimal.sin(k)}`);
        expect(Decimal.sin(k).toNumber()).assertEqual(0.35);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_2800
     * @tc.name       : testSin0028
     * @tc.desc       : Testing the decimal sin with 'Infinity'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0028',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0028';
      try {
        let c = Decimal.sin('Infinity');
        expect(Number.isNaN(c.toNumber())).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_2900
     * @tc.name       : testSin0029
     * @tc.desc       : Testing the decimal sin with '-Infinity'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0029',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0029';
      try {
        let c = Decimal.sin('-Infinity');
        expect(Number.isNaN(c.toNumber())).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_TO_3000
     * @tc.name       : testSin0030
     * @tc.desc       : Testing the decimal sin with new Decimal(-Infinity).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSin0030',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSin0030';
      try {
        let c = Decimal.sin(new Decimal(-Infinity));
        expect(Number.isNaN(c.toNumber())).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
  })
}