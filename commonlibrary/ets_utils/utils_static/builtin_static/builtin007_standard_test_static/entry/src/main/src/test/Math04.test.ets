/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function math04Test() {

  describe("math04Test", (): void => {
    // Dewm25 fines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
	   await Utils.msSleep(100);
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
     * @tc.number  SUB_MATH_CLZ32_STATIC_2500
     * @tc.name    testClz32Static2500
     * @tc.desc    Test clz32 function with positive integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32Static2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static2500';
      try {
        
        let result: number = Math.clz32(0x00002000);
        let expected: number = 18;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32_STATIC_2600
     * @tc.name    testClz32Static2600
     * @tc.desc    Test clz32 function with positive integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32Static2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static2600';
      try {
        
        let result: number = Math.clz32(0x00001000);
        let expected: number = 19;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32_STATIC_2700
     * @tc.name    testClz32Static2700
     * @tc.desc    Test clz32 function with positive integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32Static2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static2700';
      try {
        
        let result: number = Math.clz32(0x00000800);
        let expected: number = 20;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32_STATIC_2800
     * @tc.name    testClz32Static2800
     * @tc.desc    Test clz32 function with positive integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32Static2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static2800';
      try {
        
        let result: number = Math.clz32(0x00000400);
        let expected: number = 21;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32_STATIC_2900
     * @tc.name    testClz32Static2900
     * @tc.desc    Test clz32 function with positive integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32Static2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static2900';
      try {
        
        let result: number = Math.clz32(0x00000200);
        let expected: number = 22;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32_STATIC_3000
     * @tc.name    testClz32Static3000
     * @tc.desc    Test clz32 function with positive integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32Static3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static3000';
      try {
        
        let result: number = Math.clz32(0x00000100);
        let expected: number = 23;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32_STATIC_3100
     * @tc.name    testClz32Static3100
     * @tc.desc    Test clz32 function with positive integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32Static3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static3100';
      try {
        
        let result: number = Math.clz32(0x00000080);
        let expected: number = 24;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32_STATIC_3200
     * @tc.name    testClz32Static3200
     * @tc.desc    Test clz32 function with positive integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32Static3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static3200';
      try {
        
        let result: number = Math.clz32(0x00000040);
        let expected: number = 25;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32_STATIC_3300
     * @tc.name    testClz32Static3300
     * @tc.desc    Test clz32 function with positive integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32Static3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static3300';
      try {
        
        let result: number = Math.clz32(0x00000020);
        let expected: number = 26;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32_STATIC_3400
     * @tc.name    testClz32Static3400
     * @tc.desc    Test clz32 function with positive integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32Static3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static3400';
      try {
        
        let result: number = Math.clz32(0x00000010);
        let expected: number = 27;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32_STATIC_3500
     * @tc.name    testClz32Static3500
     * @tc.desc    Test clz32 function with positive integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32Static3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static3500';
      try {
        
        let result: number = Math.clz32(0x00000008);
        let expected: number = 28;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32_STATIC_3600
     * @tc.name    testClz32Static3600
     * @tc.desc    Test clz32 function with positive integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32Static3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static3600';
      try {
        
        let result: number = Math.clz32(0x00000004);
        let expected: number = 29;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32_STATIC_3700
     * @tc.name    testClz32Static3700
     * @tc.desc    Test clz32 function with positive integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32Static3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static3700';
      try {
        
        let result: number = Math.clz32(0x00000002);
        let expected: number = 30;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32_STATIC_3800
     * @tc.name    testClz32Static3800
     * @tc.desc    Test clz32 function with positive integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32Static3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static3800';
      try {
        
        let result: number = Math.clz32(0x00000001);
        let expected: number = 31;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32_STATIC_3900
     * @tc.name    testClz32Static3900
     * @tc.desc    Test clz32 function with positive integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32Static3900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static3900';
      try {
        
        let result: number = Math.clz32(0xFFFFFFFF);
        let expected: number = 0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32_STATIC_4000
     * @tc.name    testClz32Static4000
     * @tc.desc    Test clz32 function with positive integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32Static4000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static4000';
      try {
        
        let result: number = Math.clz32(0x7FFFFFFF);
        let expected: number = 1;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32_STATIC_4100
     * @tc.name    testClz32Static4100
     * @tc.desc    Test clz32 function with positive integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32Static4100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static4100';
      try {
        
        let result: number = Math.clz32(0x3FFFFFFF);
        let expected: number = 2;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32_STATIC_4200
     * @tc.name    testClz32Static4200
     * @tc.desc    Test clz32 function with positive integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32Static4200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static4200';
      try {
        
        let result: number = Math.clz32(0x1FFFFFFF);
        let expected: number = 3;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32_STATIC_4300
     * @tc.name    testClz32PositiveInt_4300
     * @tc.desc    Test clz32 function with positive integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveInt_4300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveInt_4300';
      try {
        
        let result: number = Math.clz32(0x0FFFFFFF);
        let expected: number = 4;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32_STATIC_4400
     * @tc.name    testClz32PositiveInt_4400
     * @tc.desc    Test clz32 function with positive integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveInt_4400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveInt_4400';
      try {
        
        let result: number = Math.clz32(0x07FFFFFF);
        let expected: number = 5;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32_STATIC_4500
     * @tc.name    testClz32PositiveInt_4500
     * @tc.desc    Test clz32 function with positive integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveInt_4500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveInt_4500';
      try {
        
        let result: number = Math.clz32(0x03FFFFFF);
        let expected: number = 6;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32_STATIC_4600
     * @tc.name    testClz32PositiveInt_4600
     * @tc.desc    Test clz32 function with positive integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveInt_4600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveInt_4600';
      try {
        
        let result: number = Math.clz32(0x01FFFFFF);
        let expected: number = 7;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32_STATIC_4700
     * @tc.name    testClz32PositiveInt_4700
     * @tc.desc    Test clz32 function with positive integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveInt_4700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveInt_4700';
      try {
        
        let result: number = Math.clz32(0x00FFFFFF);
        let expected: number = 8;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32_STATIC_4800
     * @tc.name    testClz32PositiveInt_4800
     * @tc.desc    Test clz32 function with positive integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveInt_4800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveInt_4800';
      try {
        
        let result: number = Math.clz32(0x007FFFFF);
        let expected: number = 9;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32_STATIC_4900
     * @tc.name    testClz32PositiveInt_4900
     * @tc.desc    Test clz32 function with positive integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveInt_4900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveInt_4900';
      try {
        
        let result: number = Math.clz32(0x003FFFFF);
        let expected: number = 10;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32_STATIC_5000
     * @tc.name    testClz32PositiveInt_5000
     * @tc.desc    Test clz32 function with positive integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveInt_5000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveInt_5000';
      try {
        
        let result: number = Math.clz32(0x001FFFFF);
        let expected: number = 11;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_0100
     * @tc.name    testClz32PositiveDouble_0100
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_0100';
      try {
        
        let result: number = Math.clz32(0xFFFFFFFF);
        let expected: number = 0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_0200
     * @tc.name    testClz32PositiveDouble_0200
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_0200';
      try {
        
        let result: number = Math.clz32(1.5);
        let expected: number = 31;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_0300
     * @tc.name    testClz32PositiveDouble_0300
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_0300';
      try {
        
        let result: number = Math.clz32(2.7);
        let expected: number = 30;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_0400
     * @tc.name    testClz32PositiveDouble_0400
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_0400';
      try {
        
        let result: number = Math.clz32(3.14);
        let expected: number = 30;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_0500
     * @tc.name    testClz32PositiveDouble_0500
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_0500';
      try {
        
        let result: number = Math.clz32(4.8);
        let expected: number = 29;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_0600
     * @tc.name    testClz32PositiveDouble_0600
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_0600';
      try {
        
        let result: number = Math.clz32(7.9);
        let expected: number = 29;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_0700
     * @tc.name    testClz32PositiveDouble_0700
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_0700';
      try {
        
        let result: number = Math.clz32(8.5);
        let expected: number = 28;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_0800
     * @tc.name    testClz32PositiveDouble_0800
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_0800';
      try {
        
        let result: number = Math.clz32(15.3);
        let expected: number = 28;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_0900
     * @tc.name    testClz32PositiveDouble_0900
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_0900';
      try {
        
        let result: number = Math.clz32(16.7);
        let expected: number = 27;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_1000
     * @tc.name    testClz32PositiveDouble_1000
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_1000';
      try {
        
        let result: number = Math.clz32(31.9);
        let expected: number = 27;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_1100
     * @tc.name    testClz32PositiveDouble_1100
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_1100';
      try {
        
        let result: number = Math.clz32(32.5);
        let expected: number = 26;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_1200
     * @tc.name    testClz32PositiveDouble_1200
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_1200';
      try {
        
        let result: number = Math.clz32(63.8);
        let expected: number = 26;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_1300
     * @tc.name    testClz32PositiveDouble_1300
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_1300';
      try {
        
        let result: number = Math.clz32(64.2);
        let expected: number = 25;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_1400
     * @tc.name    testClz32PositiveDouble_1400
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_1400';
      try {
        
        let result: number = Math.clz32(127.6);
        let expected: number = 25;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_1500
     * @tc.name    testClz32PositiveDouble_1500
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_1500';
      try {
        
        let result: number = Math.clz32(128.3);
        let expected: number = 24;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_1600
     * @tc.name    testClz32PositiveDouble_1600
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_1600';
      try {
        
        let result: number = Math.clz32(255.7);
        let expected: number = 24;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_1700
     * @tc.name    testClz32PositiveDouble_1700
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_1700';
      try {
        
        let result: number = Math.clz32(256.1);
        let expected: number = 23;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_1800
     * @tc.name    testClz32PositiveDouble_1800
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_1800';
      try {
        
        let result: number = Math.clz32(511.9);
        let expected: number = 23;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_1900
     * @tc.name    testClz32PositiveDouble_1900
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_1900';
      try {
        
        let result: number = Math.clz32(512.4);
        let expected: number = 22;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_2000
     * @tc.name    testClz32PositiveDouble_2000
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_2000';
      try {
        
        let result: number = Math.clz32(1023.8);
        let expected: number = 22;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_2100
     * @tc.name    testClz32PositiveDouble_2100
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_2100';
      try {
        
        let result: number = Math.clz32(1024.5);
        let expected: number = 21;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_2200
     * @tc.name    testClz32PositiveDouble_2200
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_2200';
      try {
        
        let result: number = Math.clz32(2047.3);
        let expected: number = 21;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_2300
     * @tc.name    testClz32PositiveDouble_2300
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_2300';
      try {
        
        let result: number = Math.clz32(2048.7);
        let expected: number = 20;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_2400
     * @tc.name    testClz32PositiveDouble_2400
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_2400';
      try {
        
        let result: number = Math.clz32(4095.9);
        let expected: number = 20;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_2500
     * @tc.name    testClz32PositiveDouble_2500
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_2500';
      try {
        
        let result: number = Math.clz32(4096.2);
        let expected: number = 19;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_2600
     * @tc.name    testClz32PositiveDouble_2600
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_2600';
      try {
        
        let result: number = Math.clz32(8191.6);
        let expected: number = 19;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_2700
     * @tc.name    testClz32PositiveDouble_2700
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_2700';
      try {
        
        let result: number = Math.clz32(8192.4);
        let expected: number = 18;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_2800
     * @tc.name    testClz32PositiveDouble_2800
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_2800';
      try {
        
        let result: number = Math.clz32(16383.8);
        let expected: number = 18;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_2900
     * @tc.name    testClz32PositiveDouble_2900
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_2900';
      try {
        
        let result: number = Math.clz32(16384.1);
        let expected: number = 17;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_3000
     * @tc.name    testClz32PositiveDouble_3000
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_3000';
      try {
        
        let result: number = Math.clz32(32767.5);
        let expected: number = 17;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_3100
     * @tc.name    testClz32PositiveDouble_3100
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_3100';
      try {
        
        let result: number = Math.clz32(32768.3);
        let expected: number = 16;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_3200
     * @tc.name    testClz32PositiveDouble_3200
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_3200';
      try {
        
        let result: number = Math.clz32(65535.7);
        let expected: number = 16;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_3300
     * @tc.name    testClz32PositiveDouble_3300
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_3300';
      try {
        
        let result: number = Math.clz32(65536.2);
        let expected: number = 15;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_3400
     * @tc.name    testClz32PositiveDouble_3400
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_3400';
      try {
        
        let result: number = Math.clz32(131071.8);
        let expected: number = 15;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_3500
     * @tc.name    testClz32PositiveDouble_3500
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_3500';
      try {
        
        let result: number = Math.clz32(131072.4);
        let expected: number = 14;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_3600
     * @tc.name    testClz32PositiveDouble_3600
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_3600';
      try {
        
        let result: number = Math.clz32(262143.6);
        let expected: number = 14;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_3700
     * @tc.name    testClz32PositiveDouble_3700
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_3700';
      try {
        
        let result: number = Math.clz32(262144.1);
        let expected: number = 13;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_3800
     * @tc.name    testClz32PositiveDouble_3800
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_3800';
      try {
        
        let result: number = Math.clz32(524287.9);
        let expected: number = 13;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_3900
     * @tc.name    testClz32PositiveDouble_3900
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_3900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_3900';
      try {
        
        let result: number = Math.clz32(524288.5);
        let expected: number = 12;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_4000
     * @tc.name    testClz32PositiveDouble_4000
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_4000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_4000';
      try {
        
        let result: number = Math.clz32(1048575.3);
        let expected: number = 12;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_4100
     * @tc.name    testClz32PositiveDouble_4100
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_4100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_4100';
      try {
        
        let result: number = Math.clz32(1048576.7);
        let expected: number = 11;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_4200
     * @tc.name    testClz32PositiveDouble_4200
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_4200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_4200';
      try {
        
        let result: number = Math.clz32(2097151.2);
        let expected: number = 11;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_4300
     * @tc.name    testClz32PositiveDouble_4300
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_4300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_4300';
      try {
        
        let result: number = Math.clz32(2097152.8);
        let expected: number = 10;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_4400
     * @tc.name    testClz32PositiveDouble_4400
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_4400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_4400';
      try {
        
        let result: number = Math.clz32(4194303.4);
        let expected: number = 10;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_4500
     * @tc.name    testClz32PositiveDouble_4500
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_4500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_4500';
      try {
        
        let result: number = Math.clz32(4194304.6);
        let expected: number = 9;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_4600
     * @tc.name    testClz32PositiveDouble_4600
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_4600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_4600';
      try {
        
        let result: number = Math.clz32(8388607.1);
        let expected: number = 9;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_4700
     * @tc.name    testClz32PositiveDouble_4700
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_4700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_4700';
      try {
        
        let result: number = Math.clz32(8388608.9);
        let expected: number = 8;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_4800
     * @tc.name    testClz32PositiveDouble_4800
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_4800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_4800';
      try {
        
        let result: number = Math.clz32(16777215.5);
        let expected: number = 8;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_4900
     * @tc.name    testClz32PositiveDouble_4900
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_4900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_4900';
      try {
        
        let result: number = Math.clz32(16777216.3);
        let expected: number = 7;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MATH_CLZ32DOUBLE_STATIC_5000
     * @tc.name    testClz32PositiveDouble_5000
     * @tc.desc    Test clz32Double function with positive double
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it("testClz32PositiveDouble_5000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32PositiveDouble_5000';
      try {
        
        let result: number = Math.clz32(33554431.7);
        let expected: number = 7;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
  });
}