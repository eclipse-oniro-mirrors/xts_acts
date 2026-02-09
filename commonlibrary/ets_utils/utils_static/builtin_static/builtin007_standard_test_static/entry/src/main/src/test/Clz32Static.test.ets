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
export default function Clz32StaticTest() {

  describe("Clz32StaticTest", (): void => {
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
     * @tc.number SUB_MATH_CLZ32_STATIC_0100
     * @tc.name   testClz32Static0100
     * @tc.desc   Test clz32 function with positive integer
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testClz32Static0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static0100';
      try {
        
        let result: number = Math.clz32(0x0000FFFF);
        let expected: number = 16;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CLZ32_STATIC_0200
     * @tc.name   testClz32Static0200
     * @tc.desc   Test clz32 function with positive integer
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testClz32Static0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static0200';
      try {
        
        let result: number = Math.clz32(0x000000FF);
        let expected: number = 24;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CLZ32_STATIC_0300
     * @tc.name   testClz32Static0300
     * @tc.desc   Test clz32 function with positive integer
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testClz32Static0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static0300';
      try {
        
        let result: number = Math.clz32(0x0000000F);
        let expected: number = 28;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CLZ32_STATIC_0400
     * @tc.name   testClz32Static0400
     * @tc.desc   Test clz32 function with positive integer
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testClz32Static0400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static0400';
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
     * @tc.number SUB_MATH_CLZ32_STATIC_0500
     * @tc.name   testClz32Static0500
     * @tc.desc   Test clz32 function with zero
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testClz32Static0500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static0500';
      try {
        
        let result: number = Math.clz32(0);
        let expected: number = 32;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CLZ32_STATIC_0600
     * @tc.name   testClz32Static0600
     * @tc.desc   Test clz32 function with positive integer
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testClz32Static0600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static0600';
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
     * @tc.number SUB_MATH_CLZ32_STATIC_0700
     * @tc.name   testClz32Static0700
     * @tc.desc   Test clz32 function with positive integer
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testClz32Static0700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static0700';
      try {
        
        let result: number = Math.clz32(0x80000000);
        let expected: number = 0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CLZ32_STATIC_0800
     * @tc.name   testClz32Static0800
     * @tc.desc   Test clz32 function with positive integer
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testClz32Static0800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static0800';
      try {
        
        let result: number = Math.clz32(0x40000000);
        let expected: number = 1;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CLZ32_STATIC_0900
     * @tc.name   testClz32Static0900
     * @tc.desc   Test clz32 function with positive integer
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testClz32Static0900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static0900';
      try {
        
        let result: number = Math.clz32(0x20000000);
        let expected: number = 2;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CLZ32_STATIC_1000
     * @tc.name   testClz32Static1000
     * @tc.desc   Test clz32 function with positive integer
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testClz32Static1000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static1000';
      try {
        
        let result: number = Math.clz32(0x10000000);
        let expected: number = 3;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CLZ32_STATIC_1100
     * @tc.name   testClz32Static1100
     * @tc.desc   Test clz32 function with positive integer
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testClz32Static1100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static1100';
      try {
        
        let result: number = Math.clz32(0x08000000);
        let expected: number = 4;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CLZ32_STATIC_1200
     * @tc.name   testClz32Static1200
     * @tc.desc   Test clz32 function with positive integer
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testClz32Static1200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static1200';
      try {
        
        let result: number = Math.clz32(0x04000000);
        let expected: number = 5;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CLZ32_STATIC_1300
     * @tc.name   testClz32Static1300
     * @tc.desc   Test clz32 function with positive integer
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testClz32Static1300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static1300';
      try {
        
        let result: number = Math.clz32(0x02000000);
        let expected: number = 6;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CLZ32_STATIC_1400
     * @tc.name   testClz32Static1400
     * @tc.desc   Test clz32 function with positive integer
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testClz32Static1400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static1400';
      try {
        
        let result: number = Math.clz32(0x01000000);
        let expected: number = 7;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CLZ32_STATIC_1500
     * @tc.name   testClz32Static1500
     * @tc.desc   Test clz32 function with positive integer
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testClz32Static1500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static1500';
      try {
        
        let result: number = Math.clz32(0x00800000);
        let expected: number = 8;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CLZ32_STATIC_1600
     * @tc.name   testClz32Static1600
     * @tc.desc   Test clz32 function with positive integer
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testClz32Static1600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static1600';
      try {
        
        let result: number = Math.clz32(0x00400000);
        let expected: number = 9;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CLZ32_STATIC_1700
     * @tc.name   testClz32Static1700
     * @tc.desc   Test clz32 function with positive integer
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testClz32Static1700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static1700';
      try {
        
        let result: number = Math.clz32(0x00200000);
        let expected: number = 10;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CLZ32_STATIC_1800
     * @tc.name   testClz32Static1800
     * @tc.desc   Test clz32 function with positive integer
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testClz32Static1800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static1800';
      try {
        
        let result: number = Math.clz32(0x00100000);
        let expected: number = 11;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CLZ32_STATIC_1900
     * @tc.name   testClz32Static1900
     * @tc.desc   Test clz32 function with positive integer
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testClz32Static1900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static1900';
      try {
        
        let result: number = Math.clz32(0x00080000);
        let expected: number = 12;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CLZ32_STATIC_2000
     * @tc.name   testClz32Static2000
     * @tc.desc   Test clz32 function with positive integer
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testClz32Static2000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static2000';
      try {
        
        let result: number = Math.clz32(0x00040000);
        let expected: number = 13;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CLZ32_STATIC_2100
     * @tc.name   testClz32Static2100
     * @tc.desc   Test clz32 function with positive integer
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testClz32Static2100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static2100';
      try {
        
        let result: number = Math.clz32(0x00020000);
        let expected: number = 14;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CLZ32_STATIC_2200
     * @tc.name   testClz32Static2200
     * @tc.desc   Test clz32 function with positive integer
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testClz32Static2200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static2200';
      try {
        
        let result: number = Math.clz32(0x00010000);
        let expected: number = 15;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CLZ32_STATIC_2300
     * @tc.name   testClz32Static2300
     * @tc.desc   Test clz32 function with positive integer
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testClz32Static2300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static2300';
      try {
        
        let result: number = Math.clz32(0x00008000);
        let expected: number = 16;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CLZ32_STATIC_2400
     * @tc.name   testClz32Static2400
     * @tc.desc   Test clz32 function with positive integer
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testClz32Static2400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testClz32Static2400';
      try {
        
        let result: number = Math.clz32(0x00004000);
        let expected: number = 17;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    });
}