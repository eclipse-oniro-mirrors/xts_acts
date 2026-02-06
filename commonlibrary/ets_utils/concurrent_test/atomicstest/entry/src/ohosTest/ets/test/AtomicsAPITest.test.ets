/*
 * Copyright (C) 2025 HiHope Open Source Organization.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { sleep } from '../testability/pages/TestUtils';

// Test suite for Atomics API
// This file contains test cases for various Atomics methods
export default function AtomicsAPITest() {
  describe('AtomicsAPITest', () => {
    // Presets an action, which is performed only once before all test cases of the test suite start.
    // This API supports only one parameter: preset action function.
    beforeAll(() => {
      console.info('AtomicsAPITest beforeAll called');
    })

    // Presets an action, which is performed before each unit test case starts.
    // The number of execution times is the same as the number of test cases defined by **it**.
    // This API supports only one parameter: preset action function.
    beforeEach(async () => {
      console.info('AtomicsAPITest beforeEach called');
      // Add delay to ensure resources from the previous test case are released
      await sleep(200);
    })

    // Presets a clear action, which is performed after each unit test case ends.
    // The number of execution times is the same as the number of test cases defined by **it**.
    // This API supports only one parameter: clear action function.
    afterEach(() => {
      console.info('AtomicsAPITest afterEach called');
    })

    // Presets a clear action, which is performed after all test cases of the test suite end.
    // This API supports only one parameter: clear action function.
    afterAll(() => {
      console.info('AtomicsAPITest afterAll called');
    })

    /**
     * @tc.number SUB_ATOMICS_API_TEST_0100
     * @tc.name AtomicsAddApiTest0100
     * @tc.desc Test Atomics.add method which adds a given value to the value at a specific index in an array, and returns the old value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsAddApiTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsAddApiTest0100';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 5;
        
        const oldValue = Atomics.add(typedArray, 0, 10);
        const newValue = typedArray[0];
        
        expect(oldValue).assertEqual(5);
        expect(newValue).assertEqual(15);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_0200
     * @tc.name AtomicsAddApiTest0200
     * @tc.desc Test Atomics.add method with different values including -1, 0, 1, 7, Integer.MAX_VALUE, Integer.MAX_VALUE+1. Note: null and undefined cannot be used as values because they fail to compile in ArkTS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsAddApiTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsAddApiTest0200';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(6 * 4);
        const typedArray = new Int32Array(buffer);
        
        for (let i = 0; i < typedArray.length; i++) {
          typedArray[i] = 10;
        }
        
        const oldValue1 = Atomics.add(typedArray, 0, -1);
        expect(oldValue1).assertEqual(10);
        expect(typedArray[0]).assertEqual(9);
        
        const oldValue2 = Atomics.add(typedArray, 1, 0);
        expect(oldValue2).assertEqual(10);
        expect(typedArray[1]).assertEqual(10);
        
        const oldValue3 = Atomics.add(typedArray, 2, 1);
        expect(oldValue3).assertEqual(10);
        expect(typedArray[2]).assertEqual(11);
        
        const oldValue4 = Atomics.add(typedArray, 3, 7);
        expect(oldValue4).assertEqual(10);
        expect(typedArray[3]).assertEqual(17);
        
        const MAX_INT = 2147483647;
        const oldValue5 = Atomics.add(typedArray, 4, MAX_INT);
        expect(oldValue5).assertEqual(10);
        expect(typedArray[4]).assertEqual(-2147483639);
        
        const oldValue6 = Atomics.add(typedArray, 5, MAX_INT + 1);
        expect(oldValue6).assertEqual(10);
        expect(typedArray[5]).assertEqual(-2147483638);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_0300
     * @tc.name AtomicsAddApiTest0300
     * @tc.desc Test Atomics.add method with different indices including -1, 0, length, length+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsAddApiTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsAddApiTest0300';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4 * 4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 5;
        typedArray[1] = 10;
        typedArray[2] = 15;
        typedArray[3] = 20;
        
        const oldValue1 = Atomics.add(typedArray, 0, 1);
        expect(oldValue1).assertEqual(5);
        expect(typedArray[0]).assertEqual(6);
        
        const lastIndex = typedArray.length - 1;
        const oldValue2 = Atomics.add(typedArray, lastIndex, 1);
        expect(oldValue2).assertEqual(20);
        expect(typedArray[lastIndex]).assertEqual(21);
        
        try {
          Atomics.add(typedArray, -1, 1);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
        try {
          Atomics.add(typedArray, typedArray.length, 1);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
        try {
          Atomics.add(typedArray, typedArray.length + 1, 1);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_0400
     * @tc.name AtomicsAndApiTest0400
     * @tc.desc Test Atomics.and method which performs a bitwise AND operation on a value at a specific index in an array, and returns the old value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsAndApiTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsAndApiTest0400';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 7;
        
        const oldValue = Atomics.and(typedArray, 0, 5);
        const newValue = typedArray[0];
        
        expect(oldValue).assertEqual(7);
        expect(newValue).assertEqual(5);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_0500
     * @tc.name AtomicsAndApiTest0500
     * @tc.desc Test Atomics.and method with different values including -1, 0, 1, 7, Integer.MAX_VALUE, Integer.MAX_VALUE+1. Note: null and undefined values are not tested as they fail to compile in ArkTS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsAndApiTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsAndApiTest0500';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(6 * 4);
        const typedArray = new Int32Array(buffer);
        
        for (let i = 0; i < typedArray.length; i++) {
          typedArray[i] = -1;
        }
        
        const oldValue1 = Atomics.and(typedArray, 0, -1);
        expect(oldValue1).assertEqual(-1);
        expect(typedArray[0]).assertEqual(-1);
        
        const oldValue2 = Atomics.and(typedArray, 1, 0);
        expect(oldValue2).assertEqual(-1);
        expect(typedArray[1]).assertEqual(0);
        
        const oldValue3 = Atomics.and(typedArray, 2, 1);
        expect(oldValue3).assertEqual(-1);
        expect(typedArray[2]).assertEqual(1);
        
        const oldValue4 = Atomics.and(typedArray, 3, 7);
        expect(oldValue4).assertEqual(-1);
        expect(typedArray[3]).assertEqual(7);
        
        const MAX_INT = 2147483647;
        const oldValue5 = Atomics.and(typedArray, 4, MAX_INT);
        expect(oldValue5).assertEqual(-1);
        expect(typedArray[4]).assertEqual(MAX_INT);
        
        const oldValue6 = Atomics.and(typedArray, 5, MAX_INT + 1);
        expect(oldValue6).assertEqual(-1);
        const expectedResult = -2147483648;
        expect(typedArray[5]).assertEqual(expectedResult);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_0600
     * @tc.name AtomicsAndApiTest0600
     * @tc.desc Test Atomics.and method with different indices including -1, 0, length, length+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsAndApiTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsAndApiTest0600';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4 * 4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 0xFFFF;
        typedArray[1] = 0xAAAA;
        typedArray[2] = 0x5555;
        typedArray[3] = 0xF0F0;
        
        const oldValue1 = Atomics.and(typedArray, 0, 0xF00F);
        expect(oldValue1).assertEqual(0xFFFF);
        expect(typedArray[0]).assertEqual(0xF00F);
        
        const lastIndex = typedArray.length - 1;
        const oldValue2 = Atomics.and(typedArray, lastIndex, 0xFF00);
        expect(oldValue2).assertEqual(0xF0F0);
        expect(typedArray[lastIndex]).assertEqual(0xF000);
        
        try {
          Atomics.and(typedArray, -1, 1);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
        try {
          Atomics.and(typedArray, typedArray.length, 1);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
        try {
          Atomics.and(typedArray, typedArray.length + 1, 1);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_0700
     * @tc.name AtomicsCompareExchangeApiTest0700
     * @tc.desc Test Atomics.compareExchange method which compares the value at a specific index with an expected value and replaces it with a new value if equal, returning the old value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsCompareExchangeApiTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsCompareExchangeApiTest0700';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 5;
        
        const oldValue1 = Atomics.compareExchange(typedArray, 0, 5, 10);
        expect(oldValue1).assertEqual(5);
        expect(typedArray[0]).assertEqual(10);
        
        const oldValue2 = Atomics.compareExchange(typedArray, 0, 5, 15);
        expect(oldValue2).assertEqual(10);
        expect(typedArray[0]).assertEqual(10);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_0800
     * @tc.name AtomicsCompareExchangeApiTest0800
     * @tc.desc Test Atomics.compareExchange method with different values including -1, 0, 1, 7, Integer.MAX_VALUE, Integer.MAX_VALUE+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsCompareExchangeApiTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsCompareExchangeApiTest0800';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(8 * 4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = -1;
        typedArray[1] = 0;
        typedArray[2] = 1;
        typedArray[3] = 7;
        const MAX_INT = 2147483647;
        typedArray[4] = MAX_INT;
        const MIN_INT = -2147483648;
        typedArray[5] = MIN_INT;
        
        const result1 = Atomics.compareExchange(typedArray, 0, -1, 42);
        expect(result1).assertEqual(-1);
        expect(typedArray[0]).assertEqual(42);
        
        const result2 = Atomics.compareExchange(typedArray, 1, 0, 42);
        expect(result2).assertEqual(0);
        expect(typedArray[1]).assertEqual(42);
        
        const result3 = Atomics.compareExchange(typedArray, 2, 1, 42);
        expect(result3).assertEqual(1);
        expect(typedArray[2]).assertEqual(42);
        
        const result4 = Atomics.compareExchange(typedArray, 3, 7, 42);
        expect(result4).assertEqual(7);
        expect(typedArray[3]).assertEqual(42);
        
        const result5 = Atomics.compareExchange(typedArray, 4, MAX_INT, 42);
        expect(result5).assertEqual(MAX_INT);
        expect(typedArray[4]).assertEqual(42);
        
        const result6 = Atomics.compareExchange(typedArray, 5, MIN_INT, 42);
        expect(result6).assertEqual(MIN_INT);
        expect(typedArray[5]).assertEqual(42);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_0900
     * @tc.name AtomicsCompareExchangeApiTest0900
     * @tc.desc Test Atomics.compareExchange method with different indices including -1, 0, length, length+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsCompareExchangeApiTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsCompareExchangeApiTest0900';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4 * 4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 1;
        typedArray[1] = 2;
        typedArray[2] = 3;
        typedArray[3] = 4;
        
        const oldValue1 = Atomics.compareExchange(typedArray, 0, 1, 100);
        expect(oldValue1).assertEqual(1);
        expect(typedArray[0]).assertEqual(100);
        
        const lastIndex = typedArray.length - 1;
        const oldValue2 = Atomics.compareExchange(typedArray, lastIndex, 4, 400);
        expect(oldValue2).assertEqual(4);
        expect(typedArray[lastIndex]).assertEqual(400);
        
        try {
          Atomics.compareExchange(typedArray, -1, 0, 0);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
        try {
          Atomics.compareExchange(typedArray, typedArray.length, 0, 0);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
        try {
          Atomics.compareExchange(typedArray, typedArray.length + 1, 0, 0);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_1000
     * @tc.name AtomicsCompareExchangeApiTest1000
     * @tc.desc Test Atomics.compareExchange method with cases where the value equals and does not equal the expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsCompareExchangeApiTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsCompareExchangeApiTest1000';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4 * 4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 10;
        typedArray[1] = 20;
        typedArray[2] = 30;
        typedArray[3] = 40;
        
        const oldValue1 = Atomics.compareExchange(typedArray, 0, 10, 100);
        expect(oldValue1).assertEqual(10);
        expect(typedArray[0]).assertEqual(100);
        
        const oldValue2 = Atomics.compareExchange(typedArray, 1, 21, 200);
        expect(oldValue2).assertEqual(20);
        expect(typedArray[1]).assertEqual(20);
        
        const oldValue3 = Atomics.compareExchange(typedArray, 2, 30, 300);
        expect(oldValue3).assertEqual(30);
        expect(typedArray[2]).assertEqual(300);
        
        const oldValue4 = Atomics.compareExchange(typedArray, 3, 41, 400);
        expect(oldValue4).assertEqual(40);
        expect(typedArray[3]).assertEqual(40);
        
        const oldValue5 = Atomics.compareExchange(typedArray, 2, 300, 301);
        expect(oldValue5).assertEqual(300);
        expect(typedArray[2]).assertEqual(301);
        
        const oldValue6 = Atomics.compareExchange(typedArray, 2, 301, 302);
        expect(oldValue6).assertEqual(301);
        expect(typedArray[2]).assertEqual(302);
        
        const oldValue7 = Atomics.compareExchange(typedArray, 2, 500, 600);
        expect(oldValue7).assertEqual(302);
        expect(typedArray[2]).assertEqual(302);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_1100
     * @tc.name AtomicsExchangeApiTest1100
     * @tc.desc Test Atomics.exchange method which replaces the value at a specific index in an array with a given value, and returns the old value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsExchangeApiTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsExchangeApiTest1100';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 5;
        
        const oldValue = Atomics.exchange(typedArray, 0, 10);
        
        expect(oldValue).assertEqual(5);
        expect(typedArray[0]).assertEqual(10);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_1200
     * @tc.name AtomicsExchangeApiTest1200
     * @tc.desc Test Atomics.exchange method with different values including -1, 0, 1, 7, Integer.MAX_VALUE, Integer.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsExchangeApiTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsExchangeApiTest1200';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(6 * 4);
        const typedArray = new Int32Array(buffer);
        
        for (let i = 0; i < typedArray.length; i++) {
          typedArray[i] = 100;
        }
        
        const oldValue1 = Atomics.exchange(typedArray, 0, -1);
        expect(oldValue1).assertEqual(100);
        expect(typedArray[0]).assertEqual(-1);
        
        const oldValue2 = Atomics.exchange(typedArray, 1, 0);
        expect(oldValue2).assertEqual(100);
        expect(typedArray[1]).assertEqual(0);
        
        const oldValue3 = Atomics.exchange(typedArray, 2, 1);
        expect(oldValue3).assertEqual(100);
        expect(typedArray[2]).assertEqual(1);
        
        const oldValue4 = Atomics.exchange(typedArray, 3, 7);
        expect(oldValue4).assertEqual(100);
        expect(typedArray[3]).assertEqual(7);
        
        const MAX_INT = 2147483647;
        const oldValue5 = Atomics.exchange(typedArray, 4, MAX_INT);
        expect(oldValue5).assertEqual(100);
        expect(typedArray[4]).assertEqual(MAX_INT);
        
        const MIN_INT = -2147483648;
        const oldValue6 = Atomics.exchange(typedArray, 5, MIN_INT);
        expect(oldValue6).assertEqual(100);
        expect(typedArray[5]).assertEqual(MIN_INT);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_1300
     * @tc.name AtomicsExchangeApiTest1300
     * @tc.desc Test Atomics.exchange method with different indices including -1, 0, length, length+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsExchangeApiTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsExchangeApiTest1300';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4 * 4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 10;
        typedArray[1] = 20;
        typedArray[2] = 30;
        typedArray[3] = 40;
        
        const oldValue1 = Atomics.exchange(typedArray, 0, 100);
        expect(oldValue1).assertEqual(10);
        expect(typedArray[0]).assertEqual(100);
        
        const lastIndex = typedArray.length - 1;
        const oldValue2 = Atomics.exchange(typedArray, lastIndex, 400);
        expect(oldValue2).assertEqual(40);
        expect(typedArray[lastIndex]).assertEqual(400);
        
        try {
          Atomics.exchange(typedArray, -1, 0);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
        try {
          Atomics.exchange(typedArray, typedArray.length, 0);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
        try {
          Atomics.exchange(typedArray, typedArray.length + 1, 0);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_1400
     * @tc.name AtomicsExchangeApiTest1400
     * @tc.desc Test Atomics.exchange method with cases where the new value equals and does not equal the old value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsExchangeApiTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsExchangeApiTest1400';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4 * 4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 10;
        typedArray[1] = 20;
        typedArray[2] = 30;
        
        const oldValue1 = Atomics.exchange(typedArray, 0, 10);
        expect(oldValue1).assertEqual(10);
        expect(typedArray[0]).assertEqual(10);
        
        const oldValue2 = Atomics.exchange(typedArray, 1, 21);
        expect(oldValue2).assertEqual(20);
        expect(typedArray[1]).assertEqual(21);
        
        const oldValue3 = Atomics.exchange(typedArray, 2, 30);
        expect(oldValue3).assertEqual(30);
        expect(typedArray[2]).assertEqual(30);
        
        const previousValue = typedArray[0];
        const newValue = previousValue + 5;
        const oldValue4 = Atomics.exchange(typedArray, 0, newValue);
        expect(oldValue4).assertEqual(previousValue);
        expect(typedArray[0]).assertEqual(newValue);
        
        const oldValue5 = Atomics.exchange(typedArray, 0, oldValue4);
        expect(oldValue5).assertEqual(newValue);
        expect(typedArray[0]).assertEqual(oldValue4);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_1500
     * @tc.name AtomicsLoadApiTest1500
     * @tc.desc Test Atomics.load method which returns the value at a specific index in an array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsLoadApiTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsLoadApiTest1500';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4 * 4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 42;
        typedArray[1] = -1;
        typedArray[2] = 0;
        typedArray[3] = 2147483647;
        
        const value0 = Atomics.load(typedArray, 0);
        const value1 = Atomics.load(typedArray, 1);
        const value2 = Atomics.load(typedArray, 2);
        const value3 = Atomics.load(typedArray, 3);
        
        expect(value0).assertEqual(42);
        expect(value1).assertEqual(-1);
        expect(value2).assertEqual(0);
        expect(value3).assertEqual(2147483647);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_1600
     * @tc.name AtomicsLoadApiTest1600
     * @tc.desc Test Atomics.load method with different indices including -1, 0, length, length+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsLoadApiTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsLoadApiTest1600';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4 * 4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 10;
        typedArray[1] = 20;
        typedArray[2] = 30;
        typedArray[3] = 40;
        
        const value0 = Atomics.load(typedArray, 0);
        expect(value0).assertEqual(10);
        
        const lastIndex = typedArray.length - 1;
        const lastValue = Atomics.load(typedArray, lastIndex);
        expect(lastValue).assertEqual(40);
        
        try {
          Atomics.load(typedArray, -1);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
        try {
          Atomics.load(typedArray, typedArray.length);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
        try {
          Atomics.load(typedArray, typedArray.length + 1);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_1700
     * @tc.name AtomicsLoadApiTest1700
     * @tc.desc Test Atomics.load method after using other atomic operations like add, and, exchange
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsLoadApiTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsLoadApiTest1700';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(3 * 4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 5;
        typedArray[1] = 10;
        typedArray[2] = 15;
        
        Atomics.add(typedArray, 0, 5);
        const valueAfterAdd = Atomics.load(typedArray, 0);
        expect(valueAfterAdd).assertEqual(10);
        
        Atomics.and(typedArray, 1, 6);
        const valueAfterAnd = Atomics.load(typedArray, 1);
        expect(valueAfterAnd).assertEqual(2);
        
        Atomics.exchange(typedArray, 2, 50);
        const valueAfterExchange = Atomics.load(typedArray, 2);
        expect(valueAfterExchange).assertEqual(50);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_1800
     * @tc.name AtomicsOrApiTest1800
     * @tc.desc Test Atomics.or method which performs a bitwise OR operation on a value at a specific index in an array, and returns the old value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsOrApiTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsOrApiTest1800';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 5;
        
        const oldValue = Atomics.or(typedArray, 0, 10);
        const newValue = typedArray[0];
        
        expect(oldValue).assertEqual(5);
        expect(newValue).assertEqual(15);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_1900
     * @tc.name AtomicsOrApiTest1900
     * @tc.desc Test Atomics.or method with different values including -1, 0, 1, 7, Integer.MAX_VALUE, Integer.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsOrApiTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsOrApiTest1900';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(6 * 4);
        const typedArray = new Int32Array(buffer);
        
        for (let i = 0; i < typedArray.length; i++) {
          typedArray[i] = 0;
        }
        
        const oldValue1 = Atomics.or(typedArray, 0, -1);
        expect(oldValue1).assertEqual(0);
        expect(typedArray[0]).assertEqual(-1);
        
        const oldValue2 = Atomics.or(typedArray, 1, 0);
        expect(oldValue2).assertEqual(0);
        expect(typedArray[1]).assertEqual(0);
        
        const oldValue3 = Atomics.or(typedArray, 2, 1);
        expect(oldValue3).assertEqual(0);
        expect(typedArray[2]).assertEqual(1);
        
        const oldValue4 = Atomics.or(typedArray, 3, 7);
        expect(oldValue4).assertEqual(0);
        expect(typedArray[3]).assertEqual(7);
        
        const MAX_INT = 2147483647;
        const oldValue5 = Atomics.or(typedArray, 4, MAX_INT);
        expect(oldValue5).assertEqual(0);
        expect(typedArray[4]).assertEqual(MAX_INT);
        
        const MIN_INT = -2147483648;
        const oldValue6 = Atomics.or(typedArray, 5, MIN_INT);
        expect(oldValue6).assertEqual(0);
        expect(typedArray[5]).assertEqual(MIN_INT);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_2000
     * @tc.name AtomicsOrApiTest2000
     * @tc.desc Test Atomics.or method with different indices including -1, 0, length, length+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsOrApiTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsOrApiTest2000';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4 * 4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 0x0000;
        typedArray[1] = 0x5555;
        typedArray[2] = 0xAAAA;
        typedArray[3] = 0x0F0F;
        
        const oldValue1 = Atomics.or(typedArray, 0, 0x00FF);
        expect(oldValue1).assertEqual(0x0000);
        expect(typedArray[0]).assertEqual(0x00FF);
        
        const lastIndex = typedArray.length - 1;
        const oldValue2 = Atomics.or(typedArray, lastIndex, 0xF000);
        expect(oldValue2).assertEqual(0x0F0F);
        expect(typedArray[lastIndex]).assertEqual(0xFF0F);
        
        try {
          Atomics.or(typedArray, -1, 1);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
        try {
          Atomics.or(typedArray, typedArray.length, 1);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
        try {
          Atomics.or(typedArray, typedArray.length + 1, 1);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_2100
     * @tc.name AtomicsStoreApiTest2100
     * @tc.desc Test Atomics.store method which stores a given value at a specific index in an array and returns the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsStoreApiTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsStoreApiTest2100';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 5;
        
        const returnValue = Atomics.store(typedArray, 0, 10);
        const newValue = typedArray[0];
        
        expect(returnValue).assertEqual(10);
        expect(newValue).assertEqual(10);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_2200
     * @tc.name AtomicsStoreApiTest2200
     * @tc.desc Test Atomics.store method with different values including -1, 0, 1, 7, Integer.MAX_VALUE, Integer.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsStoreApiTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsStoreApiTest2200';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(6 * 4);
        const typedArray = new Int32Array(buffer);
        
        for (let i = 0; i < typedArray.length; i++) {
          typedArray[i] = 100;
        }
        
        const returnValue1 = Atomics.store(typedArray, 0, -1);
        expect(returnValue1).assertEqual(-1);
        expect(typedArray[0]).assertEqual(-1);
        
        const returnValue2 = Atomics.store(typedArray, 1, 0);
        expect(returnValue2).assertEqual(0);
        expect(typedArray[1]).assertEqual(0);
        
        const returnValue3 = Atomics.store(typedArray, 2, 1);
        expect(returnValue3).assertEqual(1);
        expect(typedArray[2]).assertEqual(1);
        
        const returnValue4 = Atomics.store(typedArray, 3, 7);
        expect(returnValue4).assertEqual(7);
        expect(typedArray[3]).assertEqual(7);
        
        const MAX_INT = 2147483647;
        const returnValue5 = Atomics.store(typedArray, 4, MAX_INT);
        expect(returnValue5).assertEqual(MAX_INT);
        expect(typedArray[4]).assertEqual(MAX_INT);
        
        const MIN_INT = -2147483648;
        const returnValue6 = Atomics.store(typedArray, 5, MIN_INT);
        expect(returnValue6).assertEqual(MIN_INT);
        expect(typedArray[5]).assertEqual(MIN_INT);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_2300
     * @tc.name AtomicsStoreApiTest2300
     * @tc.desc Test Atomics.store method with different indices including -1, 0, length, length+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsStoreApiTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsStoreApiTest2300';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4 * 4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 10;
        typedArray[1] = 20;
        typedArray[2] = 30;
        typedArray[3] = 40;
        
        const returnValue1 = Atomics.store(typedArray, 0, 100);
        expect(returnValue1).assertEqual(100);
        expect(typedArray[0]).assertEqual(100);
        
        const lastIndex = typedArray.length - 1;
        const returnValue2 = Atomics.store(typedArray, lastIndex, 400);
        expect(returnValue2).assertEqual(400);
        expect(typedArray[lastIndex]).assertEqual(400);
        
        try {
          Atomics.store(typedArray, -1, 0);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
        try {
          Atomics.store(typedArray, typedArray.length, 0);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
        try {
          Atomics.store(typedArray, typedArray.length + 1, 0);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_2400
     * @tc.name AtomicsStoreApiTest2400
     * @tc.desc Test Atomics.store method with cases where the new value equals and does not equal the old value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsStoreApiTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsStoreApiTest2400';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(3 * 4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 10;
        typedArray[1] = 20;
        typedArray[2] = 30;
        
        const returnValue1 = Atomics.store(typedArray, 0, 10);
        expect(returnValue1).assertEqual(10);
        expect(typedArray[0]).assertEqual(10);
        
        const returnValue2 = Atomics.store(typedArray, 1, 21);
        expect(returnValue2).assertEqual(21);
        expect(typedArray[1]).assertEqual(21);
        
        const oldValue = typedArray[2];
        const newValue = oldValue + 5;
        const returnValue3 = Atomics.store(typedArray, 2, newValue);
        expect(returnValue3).assertEqual(newValue);
        expect(typedArray[2]).assertEqual(newValue);
        
        const loadedValue = Atomics.load(typedArray, 2);
        expect(loadedValue).assertEqual(newValue);
        
        const anotherValue = newValue * 2;
        Atomics.store(typedArray, 2, anotherValue);
        expect(typedArray[2]).assertEqual(anotherValue);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_2500
     * @tc.name AtomicsSubApiTest2500
     * @tc.desc Test Atomics.sub method which subtracts a given value from the value at a specific index in an array, and returns the old value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsSubApiTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsSubApiTest2500';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 15;
        
        const oldValue = Atomics.sub(typedArray, 0, 10);
        const newValue = typedArray[0];
        
        expect(oldValue).assertEqual(15);
        expect(newValue).assertEqual(5);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_2600
     * @tc.name AtomicsSubApiTest2600
     * @tc.desc Test Atomics.sub method with different values including -1, 0, 1, 7, Integer.MAX_VALUE, Integer.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsSubApiTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsSubApiTest2600';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(6 * 4);
        const typedArray = new Int32Array(buffer);
        
        for (let i = 0; i < typedArray.length; i++) {
          typedArray[i] = 100;
        }
        
        const oldValue1 = Atomics.sub(typedArray, 0, -1);
        expect(oldValue1).assertEqual(100);
        expect(typedArray[0]).assertEqual(101);
        
        const oldValue2 = Atomics.sub(typedArray, 1, 0);
        expect(oldValue2).assertEqual(100);
        expect(typedArray[1]).assertEqual(100);
        
        const oldValue3 = Atomics.sub(typedArray, 2, 1);
        expect(oldValue3).assertEqual(100);
        expect(typedArray[2]).assertEqual(99);
        
        const oldValue4 = Atomics.sub(typedArray, 3, 7);
        expect(oldValue4).assertEqual(100);
        expect(typedArray[3]).assertEqual(93);
        
        const MAX_INT = 2147483647;
        const oldValue5 = Atomics.sub(typedArray, 4, MAX_INT);
        expect(oldValue5).assertEqual(100);
        const afterSubWithMaxInt = -2147483547;
        expect(typedArray[4]).assertEqual(afterSubWithMaxInt);
        
        const MIN_INT = -2147483648;
        const oldValue6 = Atomics.sub(typedArray, 5, MIN_INT);
        expect(oldValue6).assertEqual(100);
        
        // 当减去MIN_INT时，结果应该是100 - (-2147483648)，相当于100 + 2147483648
        // 但在32位有符号整数中会发生溢出，实际结果为-2147483548
        const afterSubWithMinInt = -2147483548;
        expect(typedArray[5]).assertEqual(afterSubWithMinInt);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_2700
     * @tc.name AtomicsSubApiTest2700
     * @tc.desc Test Atomics.sub method with different indices including -1, 0, length, length+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsSubApiTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsSubApiTest2700';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4 * 4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 50;
        typedArray[1] = 60;
        typedArray[2] = 70;
        typedArray[3] = 80;
        
        const oldValue1 = Atomics.sub(typedArray, 0, 10);
        expect(oldValue1).assertEqual(50);
        expect(typedArray[0]).assertEqual(40);
        
        const lastIndex = typedArray.length - 1;
        const oldValue2 = Atomics.sub(typedArray, lastIndex, 20);
        expect(oldValue2).assertEqual(80);
        expect(typedArray[lastIndex]).assertEqual(60);
        
        try {
          Atomics.sub(typedArray, -1, 1);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
        try {
          Atomics.sub(typedArray, typedArray.length, 1);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
        try {
          Atomics.sub(typedArray, typedArray.length + 1, 1);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_2800
     * @tc.name AtomicsXorApiTest2800
     * @tc.desc Test Atomics.xor method which performs a bitwise XOR operation on a value at a specific index in an array, and returns the old value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsXorApiTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsXorApiTest2800';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 5;
        
        const oldValue = Atomics.xor(typedArray, 0, 3);
        const newValue = typedArray[0];
        
        expect(oldValue).assertEqual(5);
        expect(newValue).assertEqual(6);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_2900
     * @tc.name AtomicsXorApiTest2900
     * @tc.desc Test Atomics.xor method with different values including -1, 0, 1, 7, Integer.MAX_VALUE, Integer.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsXorApiTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsXorApiTest2900';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(6 * 4);
        const typedArray = new Int32Array(buffer);
        
        for (let i = 0; i < typedArray.length; i++) {
          typedArray[i] = 0;
        }
        
        const oldValue1 = Atomics.xor(typedArray, 0, -1);
        expect(oldValue1).assertEqual(0);
        expect(typedArray[0]).assertEqual(-1);
        
        const oldValue2 = Atomics.xor(typedArray, 1, 0);
        expect(oldValue2).assertEqual(0);
        expect(typedArray[1]).assertEqual(0);
        
        const oldValue3 = Atomics.xor(typedArray, 2, 1);
        expect(oldValue3).assertEqual(0);
        expect(typedArray[2]).assertEqual(1);
        
        const oldValue4 = Atomics.xor(typedArray, 3, 7);
        expect(oldValue4).assertEqual(0);
        expect(typedArray[3]).assertEqual(7);
        
        const MAX_INT = 2147483647;
        const oldValue5 = Atomics.xor(typedArray, 4, MAX_INT);
        expect(oldValue5).assertEqual(0);
        expect(typedArray[4]).assertEqual(MAX_INT);
        
        const MIN_INT = -2147483648;
        const oldValue6 = Atomics.xor(typedArray, 5, MIN_INT);
        expect(oldValue6).assertEqual(0);
        expect(typedArray[5]).assertEqual(MIN_INT);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_3000
     * @tc.name AtomicsXorApiTest3000
     * @tc.desc Test Atomics.xor method with different indices including -1, 0, length, length+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsXorApiTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsXorApiTest3000';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4 * 4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 0xAAAA;
        typedArray[1] = 0x5555;
        typedArray[2] = 0xFFFF;
        typedArray[3] = 0x0000;
        
        const oldValue1 = Atomics.xor(typedArray, 0, 0xFFFF);
        expect(oldValue1).assertEqual(0xAAAA);
        expect(typedArray[0]).assertEqual(0x5555);
        
        const lastIndex = typedArray.length - 1;
        const oldValue2 = Atomics.xor(typedArray, lastIndex, 0xFFFF);
        expect(oldValue2).assertEqual(0x0000);
        expect(typedArray[lastIndex]).assertEqual(0xFFFF);
        
        try {
          Atomics.xor(typedArray, -1, 1);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
        try {
          Atomics.xor(typedArray, typedArray.length, 1);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
        try {
          Atomics.xor(typedArray, typedArray.length + 1, 1);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_3100
     * @tc.name AtomicsWaitApiTest3100
     * @tc.desc Test Atomics.wait method which checks whether the value at a specific index in a shared memory is still a given value and if so sleeps, waiting to be woken up or timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsWaitApiTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsWaitApiTest3100';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 10;
        
        const result1 = Atomics.wait(typedArray, 0, 10, 100);
        expect(result1).assertEqual('timed-out');
        
        typedArray[0] = 20;
        const result2 = Atomics.wait(typedArray, 0, 10, 100);
        expect(result2).assertEqual('not-equal');
        
        const result3 = Atomics.wait(typedArray, 0, 20, 100);
        expect(result3).assertEqual('timed-out');
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_3200
     * @tc.name AtomicsWaitApiTest3200
     * @tc.desc Test Atomics.wait method with different values including -1, 0, 1, 7, Integer.MAX_VALUE, Integer.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsWaitApiTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsWaitApiTest3200';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(6 * 4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = -1;
        typedArray[1] = 0;
        typedArray[2] = 1;
        typedArray[3] = 7;
        const MAX_INT = 2147483647;
        typedArray[4] = MAX_INT;
        const MIN_INT = -2147483648;
        typedArray[5] = MIN_INT;
        
        const result1 = Atomics.wait(typedArray, 0, -1, 100);
        expect(result1).assertEqual('timed-out');
        
        const result2 = Atomics.wait(typedArray, 1, 0, 100);
        expect(result2).assertEqual('timed-out');
        
        const result3 = Atomics.wait(typedArray, 2, 1, 100);
        expect(result3).assertEqual('timed-out');
        
        const result4 = Atomics.wait(typedArray, 3, 7, 100);
        expect(result4).assertEqual('timed-out');
        
        const result5 = Atomics.wait(typedArray, 4, MAX_INT, 100);
        expect(result5).assertEqual('timed-out');
        
        const result6 = Atomics.wait(typedArray, 5, MIN_INT, 100);
        expect(result6).assertEqual('timed-out');
        
        typedArray[0] = 42;
        const result7 = Atomics.wait(typedArray, 0, -1, 100);
        expect(result7).assertEqual('not-equal');
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_3300
     * @tc.name AtomicsWaitApiTest3300
     * @tc.desc Test Atomics.wait method with different indices including -1, 0, length, length+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsWaitApiTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsWaitApiTest3300';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4 * 4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 10;
        typedArray[1] = 20;
        typedArray[2] = 30;
        typedArray[3] = 40;
        
        const result1 = Atomics.wait(typedArray, 0, 10, 100);
        expect(result1).assertEqual('timed-out');
        
        const lastIndex = typedArray.length - 1;
        const result2 = Atomics.wait(typedArray, lastIndex, 40, 100);
        expect(result2).assertEqual('timed-out');
        
        try {
          Atomics.wait(typedArray, -1, 0, 100);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
        try {
          Atomics.wait(typedArray, typedArray.length, 0, 100);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
        try {
          Atomics.wait(typedArray, typedArray.length + 1, 0, 100);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_3400
     * @tc.name AtomicsWaitApiTest3400
     * @tc.desc Test Atomics.wait method with different timeout values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsWaitApiTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsWaitApiTest3400';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 42;
        
        const result2 = Atomics.wait(typedArray, 0, 42, 0);
        expect(result2).assertEqual('timed-out');
        
        const result3 = Atomics.wait(typedArray, 0, 42, 1);
        expect(result3).assertEqual('timed-out');
        
        const result4 = Atomics.wait(typedArray, 0, 42, 7);
        expect(result4).assertEqual('timed-out');
        
        const result5 = Atomics.wait(typedArray, 0, 42, 50);
        expect(result5).assertEqual('timed-out');
        
        const result7 = Atomics.wait(typedArray, 0, 43, 50);
        expect(result7).assertEqual('not-equal');
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_3500
     * @tc.name AtomicsWaitApiTest3500
     * @tc.desc Test Atomics.wait method when a new value is written while waiting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsWaitApiTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsWaitApiTest3500';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 50;
        
        const result1 = Atomics.wait(typedArray, 0, 50, 50);
        expect(result1).assertEqual('timed-out');
        
        typedArray[0] = 51;
        const result2 = Atomics.wait(typedArray, 0, 50, 50);
        expect(result2).assertEqual('not-equal');
        
        const result3 = Atomics.wait(typedArray, 0, 51, 50);
        expect(result3).assertEqual('timed-out');
        
        Atomics.store(typedArray, 0, 52);
        const result4 = Atomics.wait(typedArray, 0, 51, 50);
        expect(result4).assertEqual('not-equal');
        
        const valueAfterStore = Atomics.load(typedArray, 0);
        expect(valueAfterStore).assertEqual(52);
        
        const valueBeforeAdd = Atomics.load(typedArray, 0);
        Atomics.add(typedArray, 0, 1);
        const valueAfterAdd = Atomics.load(typedArray, 0);
        expect(valueAfterAdd).assertEqual(valueBeforeAdd + 1);
        
        const result5 = Atomics.wait(typedArray, 0, valueBeforeAdd, 50);
        expect(result5).assertEqual('not-equal');
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_3600
     * @tc.name AtomicsWaitApiTest3600
     * @tc.desc Test Atomics.wait method with Atomics.notify to wake up waiters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsWaitApiTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsWaitApiTest3600';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 60;
        
        Atomics.notify(typedArray, 0, 1);
        
        const result1 = Atomics.wait(typedArray, 0, 60, 100);
        expect(result1).assertEqual('timed-out');
        
        typedArray[0] = 61;
        
        const result2 = Atomics.wait(typedArray, 0, 60, 100);
        expect(result2).assertEqual('not-equal');
        
        const notifyCount = Atomics.notify(typedArray, 0, 1);
        expect(notifyCount).assertEqual(0);
        
        const result3 = Atomics.wait(typedArray, 0, 61, 5);
        expect(result3).assertEqual('timed-out');
        
        typedArray[0] = 62;
        const notifyCount2 = Atomics.notify(typedArray, 0, 5);
        expect(notifyCount2).assertEqual(0);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_ATOMICS_API_TEST_3700
     * @tc.name AtomicsWaitApiTest3700
     * @tc.desc Test Atomics.wait method called multiple times on the same location
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsWaitApiTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsWaitApiTest3700';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 70;
        
        const result1 = Atomics.wait(typedArray, 0, 70, 10);
        expect(result1).assertEqual('timed-out');
        
        const result2 = Atomics.wait(typedArray, 0, 70, 10);
        expect(result2).assertEqual('timed-out');
        
        const result3 = Atomics.wait(typedArray, 0, 70, 10);
        expect(result3).assertEqual('timed-out');
        
        typedArray[0] = 71;
        
        const result4 = Atomics.wait(typedArray, 0, 70, 10);
        expect(result4).assertEqual('not-equal');
        
        const result5 = Atomics.wait(typedArray, 0, 70, 10);
        expect(result5).assertEqual('not-equal');
        
        const result6 = Atomics.wait(typedArray, 0, 71, 10);
        expect(result6).assertEqual('timed-out');
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });
  });
} 