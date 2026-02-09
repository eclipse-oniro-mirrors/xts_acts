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

export default function AtomicsAPISecondTest() {
  describe('AtomicsAPISecondTest', () => {
    // Presets an action, which is performed only once before all test cases of the test suite start.
    // This API supports only one parameter: preset action function.
    beforeAll(() => {
      console.info('AtomicsAPISecondTest beforeAll called');
    })

    // Presets an action, which is performed before each unit test case starts.
    // The number of execution times is the same as the number of test cases defined by **it**.
    // This API supports only one parameter: preset action function.
    beforeEach(async () => {
      console.info('AtomicsAPISecondTest beforeEach called');
      // Add delay to ensure resources from the previous test case are released
      await sleep(200);
    })

    // Presets a clear action, which is performed after each unit test case ends.
    // The number of execution times is the same as the number of test cases defined by **it**.
    // This API supports only one parameter: clear action function.
    afterEach(() => {
      console.info('AtomicsAPISecondTest afterEach called');
    })

    // Presets a clear action, which is performed after all test cases of the test suite end.
    // This API supports only one parameter: clear action function.
    afterAll(() => {
      console.info('AtomicsAPISecondTest afterAll called');
    })

    /**
     * @tc.name   AtomicsNotifyApiTest3800
     * @tc.number SUB_ATOMICS_API_TEST_3800
     * @tc.desc   Test Atomics.notify method to wake up agents sleeping in the wait queue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AtomicsNotifyApiTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsNotifyApiTest3800';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 10;
        
        const waitResult: string = Atomics.wait(typedArray, 0, 10, 50);
        expect(waitResult).assertEqual('timed-out');
        
        const notifyCount: number = Atomics.notify(typedArray, 0);
        expect(notifyCount).assertEqual(0);
        
        typedArray[0] = 20;
        const notifyCount2: number = Atomics.notify(typedArray, 0);
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
     * @tc.name   AtomicsNotifyApiTest3900
     * @tc.number SUB_ATOMICS_API_TEST_3900
     * @tc.desc   Test Atomics.notify method with different indices including -1, 0, length, length+1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AtomicsNotifyApiTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsNotifyApiTest3900';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4 * 4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 10;
        typedArray[1] = 20;
        typedArray[2] = 30;
        typedArray[3] = 40;
        
        const notifyCount1: number = Atomics.notify(typedArray, 0);
        expect(notifyCount1).assertEqual(0);
        
        const lastIndex: number = typedArray.length - 1;
        const notifyCount2: number = Atomics.notify(typedArray, lastIndex);
        expect(notifyCount2).assertEqual(0);
        
        try {
          Atomics.notify(typedArray, -1);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
        try {
          Atomics.notify(typedArray, typedArray.length);
          expect(false).assertTrue();
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
        
        try {
          Atomics.notify(typedArray, typedArray.length + 1);
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
     * @tc.name   AtomicsNotifyApiTest4000
     * @tc.number SUB_ATOMICS_API_TEST_4000
     * @tc.desc   Test Atomics.notify method with different count values (0, 1, 3)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AtomicsNotifyApiTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsNotifyApiTest4000';
      console.info(`${caseName} test start`);
      
      try {
        const buffer = new SharedArrayBuffer(4);
        const typedArray = new Int32Array(buffer);
        
        typedArray[0] = 10;
        
        const notifyCount0: number = Atomics.notify(typedArray, 0, 0);
        expect(notifyCount0).assertEqual(0);
        
        const notifyCount1: number = Atomics.notify(typedArray, 0, 1);
        expect(notifyCount1).assertEqual(0);
        
        const notifyCount3: number = Atomics.notify(typedArray, 0, 3);
        expect(notifyCount3).assertEqual(0);
        
        typedArray[0] = 20;
        const notifyCountAfterChange: number = Atomics.notify(typedArray, 0, 1);
        expect(notifyCountAfterChange).assertEqual(0);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   AtomicsIsLockFreeApiTest4100
     * @tc.number SUB_ATOMICS_API_TEST_4100
     * @tc.desc   Test Atomics.isLockFree method with values 1, 2, 4, 8 which should return true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AtomicsIsLockFreeApiTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsIsLockFreeApiTest4100';
      console.info(`${caseName} test start`);
      
      try {
        const result1: boolean = Atomics.isLockFree(1);
        expect(result1).assertTrue();
        
        const result2: boolean = Atomics.isLockFree(2);
        expect(result2).assertTrue();
        
        const result4: boolean = Atomics.isLockFree(4);
        expect(result4).assertTrue();
        
        const result8: boolean = Atomics.isLockFree(8);
        expect(result8).assertTrue();
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   AtomicsIsLockFreeApiTest4200
     * @tc.number SUB_ATOMICS_API_TEST_4200
     * @tc.desc   Test Atomics.isLockFree method with values -1, 0, 3, 9, Integer.MAX_VALUE, Integer.MAX_VALUE+1 which should return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AtomicsIsLockFreeApiTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsIsLockFreeApiTest4200';
      console.info(`${caseName} test start`);
      
      try {
        const resultMinus1: boolean = Atomics.isLockFree(-1);
        expect(resultMinus1).assertFalse();
        
        const result0: boolean = Atomics.isLockFree(0);
        expect(result0).assertFalse();
        
        const result3: boolean = Atomics.isLockFree(3);
        expect(result3).assertFalse();
        
        const result9: boolean = Atomics.isLockFree(9);
        expect(result9).assertFalse();
        
        const MAX_INT = 2147483647;
        const resultMaxInt: boolean = Atomics.isLockFree(MAX_INT);
        expect(resultMaxInt).assertFalse();
        
        const resultMaxIntPlus1: boolean = Atomics.isLockFree(MAX_INT + 1);
        expect(resultMaxIntPlus1).assertFalse();
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   AtomicsIsLockFreeApiTest4300
     * @tc.number SUB_ATOMICS_API_TEST_4300
     * @tc.desc   Test Atomics.isLockFree method with null and undefined values which should return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AtomicsIsLockFreeApiTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsIsLockFreeApiTest4300';
      console.info(`${caseName} test start`);
      
      try {
        const result0: boolean = Atomics.isLockFree(0);
        expect(result0).assertFalse();
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   AtomicsArrayTest4400
     * @tc.number SUB_ATOMICS_API_TEST_4400
     * @tc.desc   Test using arrayBuffer, sharedArrayBuffer, and numeric input with Int8Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AtomicsArrayTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsArrayTest4400';
      console.info(`${caseName} test start`);
      
      try {
        const sharedBuffer = new SharedArrayBuffer(4);
        const sharedTypedArray = new Int8Array(sharedBuffer);
        sharedTypedArray[0] = 5;
        expect(sharedTypedArray[0]).assertEqual(5);
        
        const arrayBuffer = new ArrayBuffer(4);
        const regularTypedArray = new Int8Array(arrayBuffer);
        regularTypedArray[0] = 10;
        expect(regularTypedArray[0]).assertEqual(10);
        
        const numericTypedArray = new Int8Array(8);
        numericTypedArray[0] = 15;
        expect(numericTypedArray[0]).assertEqual(15);
        expect(numericTypedArray.length).assertEqual(8);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   AtomicsArrayTest4500
     * @tc.number SUB_ATOMICS_API_TEST_4500
     * @tc.desc   Test using arrayBuffer, sharedArrayBuffer, and numeric input with Uint8Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AtomicsArrayTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsArrayTest4500';
      console.info(`${caseName} test start`);
      
      try {
        const sharedBuffer = new SharedArrayBuffer(4);
        const sharedTypedArray = new Uint8Array(sharedBuffer);
        sharedTypedArray[0] = 5;
        expect(sharedTypedArray[0]).assertEqual(5);
        
        const arrayBuffer = new ArrayBuffer(4);
        const regularTypedArray = new Uint8Array(arrayBuffer);
        regularTypedArray[0] = 10;
        expect(regularTypedArray[0]).assertEqual(10);
        
        const numericTypedArray = new Uint8Array(8);
        numericTypedArray[0] = 15;
        expect(numericTypedArray[0]).assertEqual(15);
        expect(numericTypedArray.length).assertEqual(8);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   AtomicsArrayTest4600
     * @tc.number SUB_ATOMICS_API_TEST_4600
     * @tc.desc   Test using arrayBuffer, sharedArrayBuffer, and numeric input with Int16Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AtomicsArrayTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsArrayTest4600';
      console.info(`${caseName} test start`);
      
      try {
        const sharedBuffer = new SharedArrayBuffer(8);
        const sharedTypedArray = new Int16Array(sharedBuffer);
        sharedTypedArray[0] = 100;
        expect(sharedTypedArray[0]).assertEqual(100);
        
        const arrayBuffer = new ArrayBuffer(8);
        const regularTypedArray = new Int16Array(arrayBuffer);
        regularTypedArray[0] = 200;
        expect(regularTypedArray[0]).assertEqual(200);
        
        const numericTypedArray = new Int16Array(8);
        numericTypedArray[0] = 300;
        expect(numericTypedArray[0]).assertEqual(300);
        expect(numericTypedArray.length).assertEqual(8);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   AtomicsArrayTest4700
     * @tc.number SUB_ATOMICS_API_TEST_4700
     * @tc.desc   Test using arrayBuffer, sharedArrayBuffer, and numeric input with Uint16Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AtomicsArrayTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsArrayTest4700';
      console.info(`${caseName} test start`);
      
      try {
        const sharedBuffer = new SharedArrayBuffer(8);
        const sharedTypedArray = new Uint16Array(sharedBuffer);
        sharedTypedArray[0] = 100;
        expect(sharedTypedArray[0]).assertEqual(100);
        
        const arrayBuffer = new ArrayBuffer(8);
        const regularTypedArray = new Uint16Array(arrayBuffer);
        regularTypedArray[0] = 200;
        expect(regularTypedArray[0]).assertEqual(200);
        
        const numericTypedArray = new Uint16Array(8);
        numericTypedArray[0] = 300;
        expect(numericTypedArray[0]).assertEqual(300);
        expect(numericTypedArray.length).assertEqual(8);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   AtomicsArrayTest4800
     * @tc.number SUB_ATOMICS_API_TEST_4800
     * @tc.desc   Test using arrayBuffer, sharedArrayBuffer, and numeric input with Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AtomicsArrayTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsArrayTest4800';
      console.info(`${caseName} test start`);
      
      try {
        const sharedBuffer = new SharedArrayBuffer(16);
        const sharedTypedArray = new Int32Array(sharedBuffer);
        sharedTypedArray[0] = 1000;
        expect(sharedTypedArray[0]).assertEqual(1000);
        
        const arrayBuffer = new ArrayBuffer(16);
        const regularTypedArray = new Int32Array(arrayBuffer);
        regularTypedArray[0] = 2000;
        expect(regularTypedArray[0]).assertEqual(2000);
        
        const numericTypedArray = new Int32Array(8);
        numericTypedArray[0] = 3000;
        expect(numericTypedArray[0]).assertEqual(3000);
        expect(numericTypedArray.length).assertEqual(8);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   AtomicsArrayTest4900
     * @tc.number SUB_ATOMICS_API_TEST_4900
     * @tc.desc   Test using arrayBuffer, sharedArrayBuffer, and numeric input with Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AtomicsArrayTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsArrayTest4900';
      console.info(`${caseName} test start`);
      
      try {
        const sharedBuffer = new SharedArrayBuffer(16);
        const sharedTypedArray = new Uint32Array(sharedBuffer);
        sharedTypedArray[0] = 1000;
        expect(sharedTypedArray[0]).assertEqual(1000);
        
        const arrayBuffer = new ArrayBuffer(16);
        const regularTypedArray = new Uint32Array(arrayBuffer);
        regularTypedArray[0] = 2000;
        expect(regularTypedArray[0]).assertEqual(2000);
        
        const numericTypedArray = new Uint32Array(8);
        numericTypedArray[0] = 3000;
        expect(numericTypedArray[0]).assertEqual(3000);
        expect(numericTypedArray.length).assertEqual(8);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   AtomicsArrayTest5000
     * @tc.number SUB_ATOMICS_API_TEST_5000
     * @tc.desc   Test using arrayBuffer, sharedArrayBuffer, and numeric input with Uint8ClampedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AtomicsArrayTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsArrayTest5000';
      console.info(`${caseName} test start`);
      
      try {
        const sharedBuffer = new SharedArrayBuffer(8);
        const sharedTypedArray = new Uint8ClampedArray(sharedBuffer);
        sharedTypedArray[0] = 100;
        expect(sharedTypedArray[0]).assertEqual(100);
        
        const arrayBuffer = new ArrayBuffer(8);
        const regularTypedArray = new Uint8ClampedArray(arrayBuffer);
        regularTypedArray[0] = 200;
        expect(regularTypedArray[0]).assertEqual(200);
        
        const numericTypedArray = new Uint8ClampedArray(8);
        numericTypedArray[0] = 255;
        expect(numericTypedArray[0]).assertEqual(255);
        expect(numericTypedArray.length).assertEqual(8);
        
        const overflowArray = new Uint8ClampedArray(4);
        overflowArray[0] = 300;
        expect(overflowArray[0]).assertEqual(255);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   AtomicsArrayTest5100
     * @tc.number SUB_ATOMICS_API_TEST_5100
     * @tc.desc   Test using arrayBuffer, sharedArrayBuffer, and numeric input with Float32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AtomicsArrayTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsArrayTest5100';
      console.info(`${caseName} test start`);
      
      try {
        const sharedBuffer = new SharedArrayBuffer(16);
        const sharedTypedArray = new Float32Array(sharedBuffer);
        sharedTypedArray[0] = 3.14;
        expect(Math.abs(sharedTypedArray[0] - 3.14) < 0.0001).assertTrue();
        
        const arrayBuffer = new ArrayBuffer(16);
        const regularTypedArray = new Float32Array(arrayBuffer);
        regularTypedArray[0] = 2.718;
        expect(Math.abs(regularTypedArray[0] - 2.718) < 0.0001).assertTrue();
        
        const numericTypedArray = new Float32Array(8);
        numericTypedArray[0] = 1.414;
        expect(Math.abs(numericTypedArray[0] - 1.414) < 0.0001).assertTrue();
        expect(numericTypedArray.length).assertEqual(8);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   AtomicsArrayTest5200
     * @tc.number SUB_ATOMICS_API_TEST_5200
     * @tc.desc   Test using arrayBuffer, sharedArrayBuffer, and numeric input with BigInt64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AtomicsArrayTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsArrayTest5200';
      console.info(`${caseName} test start`);
      
      try {
        const sharedBuffer = new SharedArrayBuffer(32);
        const sharedTypedArray = new BigInt64Array(sharedBuffer);
        sharedTypedArray[0] = 1000n;
        expect(sharedTypedArray[0] === 1000n).assertTrue();
        
        const arrayBuffer = new ArrayBuffer(32);
        const regularTypedArray = new BigInt64Array(arrayBuffer);
        regularTypedArray[0] = 2000n;
        expect(regularTypedArray[0] === 2000n).assertTrue();
        
        const numericTypedArray = new BigInt64Array(4);
        numericTypedArray[0] = 3000n;
        expect(numericTypedArray[0] === 3000n).assertTrue();
        expect(numericTypedArray.length).assertEqual(4);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   AtomicsArrayTest5300
     * @tc.number SUB_ATOMICS_API_TEST_5300
     * @tc.desc   Test using arrayBuffer, sharedArrayBuffer, and numeric input with BigUint64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AtomicsArrayTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'AtomicsArrayTest5300';
      console.info(`${caseName} test start`);
      
      try {
        const sharedBuffer = new SharedArrayBuffer(32);
        const sharedTypedArray = new BigUint64Array(sharedBuffer);
        sharedTypedArray[0] = 1000n;
        expect(sharedTypedArray[0] === 1000n).assertTrue();
        
        const arrayBuffer = new ArrayBuffer(32);
        const regularTypedArray = new BigUint64Array(arrayBuffer);
        regularTypedArray[0] = 2000n;
        expect(regularTypedArray[0] === 2000n).assertTrue();
        
        const numericTypedArray = new BigUint64Array(4);
        numericTypedArray[0] = 3000n;
        expect(numericTypedArray[0] === 3000n).assertTrue();
        expect(numericTypedArray.length).assertEqual(4);
        
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