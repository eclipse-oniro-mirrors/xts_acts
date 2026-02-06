/*
 * Copyright (C) 2025 HiHope Open Source Organization.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { sleep } from '../testability/pages/TestUtils';

export default function SharedArrayBufferApiTest() {
  describe('SharedArrayBufferApiTest', () => {
    // Presets an action, which is performed only once before all test cases of the test suite start.
    // This API supports only one parameter: preset action function.
    beforeAll(() => {
      console.info('SharedArrayBufferApiTest beforeAll called');
    })

    // Presets an action, which is performed before each unit test case starts.
    // The number of execution times is the same as the number of test cases defined by **it**.
    // This API supports only one parameter: preset action function.
    beforeEach(async () => {
      console.info('SharedArrayBufferApiTest beforeEach called');
      // Add delay to ensure resources from the previous test case are released
      await sleep(200);
    })

    // Presets a clear action, which is performed after each unit test case ends.
    // The number of execution times is the same as the number of test cases defined by **it**.
    // This API supports only one parameter: clear action function.
    afterEach(() => {
      console.info('SharedArrayBufferApiTest afterEach called');
    })

    // Presets a clear action, which is performed after all test cases of the test suite end.
    // This API supports only one parameter: clear action function.
    afterAll(() => {
      console.info('SharedArrayBufferApiTest afterAll called');
    })


    /**
     * @tc.number SUB_MODULE_SHAREDARRAYBUFFER_API_TEST_0100
     * @tc.name SharedArrayBufferApiTest0100
     * @tc.desc Test SharedArrayBuffer.prototype.slice where start > end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SharedArrayBufferApiTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'SharedArrayBufferApiTest0100';
      console.info(`${caseName} test start`);
      
      try {
        const sab = new SharedArrayBuffer(16);
        
        const slice1 = sab.slice(8, 4);
        expect(slice1.byteLength).assertEqual(0);
        
        const slice2 = sab.slice(16, 8);
        expect(slice2.byteLength).assertEqual(0);
        
        const slice3 = sab.slice(4, 0);
        expect(slice3.byteLength).assertEqual(0);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_MODULE_SHAREDARRAYBUFFER_API_TEST_0200
     * @tc.name SharedArrayBufferApiTest0200
     * @tc.desc Test SharedArrayBuffer.prototype.slice where start < end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SharedArrayBufferApiTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'SharedArrayBufferApiTest0200';
      console.info(`${caseName} test start`);
      
      try {
        const sab = new SharedArrayBuffer(16);
        
        const slice1 = sab.slice(0, 16);
        expect(slice1.byteLength).assertEqual(16);
        
        const slice2 = sab.slice(0, 8);
        expect(slice2.byteLength).assertEqual(8);
        
        const slice3 = sab.slice(4, 12);
        expect(slice3.byteLength).assertEqual(8);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_MODULE_SHAREDARRAYBUFFER_API_TEST_0300
     * @tc.name SharedArrayBufferApiTest0300
     * @tc.desc Test SharedArrayBuffer.prototype.slice where start = end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SharedArrayBufferApiTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'SharedArrayBufferApiTest0300';
      console.info(`${caseName} test start`);
      
      try {
        const sab = new SharedArrayBuffer(16);
        
        const slice1 = sab.slice(0, 0);
        expect(slice1.byteLength).assertEqual(0);
        
        const slice2 = sab.slice(8, 8);
        expect(slice2.byteLength).assertEqual(0);
        
        const slice3 = sab.slice(16, 16);
        expect(slice3.byteLength).assertEqual(0);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_MODULE_SHAREDARRAYBUFFER_API_TEST_0400
     * @tc.name SharedArrayBufferApiTest0400
     * @tc.desc Test SharedArrayBuffer.prototype.slice with start=0, end=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SharedArrayBufferApiTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'SharedArrayBufferApiTest0400';
      console.info(`${caseName} test start`);
      
      try {
        const sab = new SharedArrayBuffer(16);
        
        const int8Array = new Int8Array(sab);
        int8Array[0] = 42;
        
        const slice1 = sab.slice(0, 1);
        expect(slice1.byteLength).assertEqual(1);
        
        const slicedInt8Array = new Int8Array(slice1);
        expect(slicedInt8Array[0]).assertEqual(42);
        
        int8Array[0] = 24;
        expect(slicedInt8Array[0]).assertEqual(42);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_MODULE_SHAREDARRAYBUFFER_API_TEST_0500
     * @tc.name SharedArrayBufferApiTest0500
     * @tc.desc Test SharedArrayBuffer.prototype.slice with start=0, end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SharedArrayBufferApiTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'SharedArrayBufferApiTest0500';
      console.info(`${caseName} test start`);
      
      try {
        const sab = new SharedArrayBuffer(16);
        
        const int8Array = new Int8Array(sab);
        int8Array[0] = 1;
        int8Array[15] = 15;
        
        const slice1 = sab.slice(0, 16);
        expect(slice1.byteLength).assertEqual(16);
        
        const slicedInt8Array = new Int8Array(slice1);
        expect(slicedInt8Array[0]).assertEqual(1);
        expect(slicedInt8Array[15]).assertEqual(15);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_MODULE_SHAREDARRAYBUFFER_API_TEST_0600
     * @tc.name SharedArrayBufferApiTest0600
     * @tc.desc Test SharedArrayBuffer.prototype.slice with start=0, end=length+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SharedArrayBufferApiTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'SharedArrayBufferApiTest0600';
      console.info(`${caseName} test start`);
      
      try {
        const sab = new SharedArrayBuffer(16);
        
        const int8Array = new Int8Array(sab);
        int8Array[0] = 1;
        int8Array[15] = 15;
        
        const slice1 = sab.slice(0, 17);
        expect(slice1.byteLength).assertEqual(16);
        
        const slicedInt8Array = new Int8Array(slice1);
        expect(slicedInt8Array[0]).assertEqual(1);
        expect(slicedInt8Array[15]).assertEqual(15);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_MODULE_SHAREDARRAYBUFFER_API_TEST_0700
     * @tc.name SharedArrayBufferApiTest0700
     * @tc.desc Test SharedArrayBuffer.prototype.slice with start=length, end=length+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SharedArrayBufferApiTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'SharedArrayBufferApiTest0700';
      console.info(`${caseName} test start`);
      
      try {
        const sab = new SharedArrayBuffer(16);
        
        const slice1 = sab.slice(16, 17);
        expect(slice1.byteLength).assertEqual(0);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_MODULE_SHAREDARRAYBUFFER_API_TEST_0800
     * @tc.name SharedArrayBufferApiTest0800
     * @tc.desc Test SharedArrayBuffer.prototype.slice with start=length-1, end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SharedArrayBufferApiTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'SharedArrayBufferApiTest0800';
      console.info(`${caseName} test start`);
      
      try {
        const sab = new SharedArrayBuffer(16);
        
        const int8Array = new Int8Array(sab);
        int8Array[15] = 42;
        
        const slice1 = sab.slice(15, 16);
        expect(slice1.byteLength).assertEqual(1);
        
        const slicedInt8Array = new Int8Array(slice1);
        expect(slicedInt8Array[0]).assertEqual(42);
        
        int8Array[15] = 24;
        expect(slicedInt8Array[0]).assertEqual(42);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_MODULE_SHAREDARRAYBUFFER_API_TEST_0900
     * @tc.name SharedArrayBufferApiTest0900
     * @tc.desc Test SharedArrayBuffer.prototype.slice with start=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SharedArrayBufferApiTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'SharedArrayBufferApiTest0900';
      console.info(`${caseName} test start`);
      
      try {
        const sab = new SharedArrayBuffer(16);
        
        const int8Array = new Int8Array(sab);
        for (let i = 0; i < 16; i++) {
          int8Array[i] = i;
        }
        
        const slice1 = sab.slice(0);
        expect(slice1.byteLength).assertEqual(16);
        
        const slicedInt8Array = new Int8Array(slice1);
        for (let i = 0; i < 16; i++) {
          expect(slicedInt8Array[i]).assertEqual(i);
        }
        
        int8Array[0] = 99;
        expect(slicedInt8Array[0]).assertEqual(0);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_MODULE_SHAREDARRAYBUFFER_API_TEST_1000
     * @tc.name SharedArrayBufferApiTest1000
     * @tc.desc Test SharedArrayBuffer.prototype.slice with start=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SharedArrayBufferApiTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'SharedArrayBufferApiTest1000';
      console.info(`${caseName} test start`);
      
      try {
        const sab = new SharedArrayBuffer(16);
        
        const slice1 = sab.slice(16);
        expect(slice1.byteLength).assertEqual(0);
        
        const int8Array = new Int8Array(slice1);
        expect(int8Array.length).assertEqual(0);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_MODULE_SHAREDARRAYBUFFER_API_TEST_1100
     * @tc.name SharedArrayBufferApiTest1100
     * @tc.desc Test SharedArrayBuffer.prototype.slice with start=length+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SharedArrayBufferApiTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'SharedArrayBufferApiTest1100';
      console.info(`${caseName} test start`);
      
      try {
        const sab = new SharedArrayBuffer(16);
        
        const slice1 = sab.slice(17);
        expect(slice1.byteLength).assertEqual(0);
        
        const int8Array = new Int8Array(slice1);
        expect(int8Array.length).assertEqual(0);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_MODULE_SHAREDARRAYBUFFER_API_TEST_1200
     * @tc.name SharedArrayBufferApiTest1200
     * @tc.desc Test SharedArrayBuffer.prototype.slice with start=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SharedArrayBufferApiTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'SharedArrayBufferApiTest1200';
      console.info(`${caseName} test start`);
      
      try {
        const sab = new SharedArrayBuffer(16);
        
        const int8Array = new Int8Array(sab);
        int8Array[15] = 42;
        
        const slice1 = sab.slice(15);
        expect(slice1.byteLength).assertEqual(1);
        
        const slicedInt8Array = new Int8Array(slice1);
        expect(slicedInt8Array[0]).assertEqual(42);
        
        int8Array[15] = 99;
        expect(slicedInt8Array[0]).assertEqual(42);
        
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });


    /**
     * @tc.number SUB_MODULE_SHAREDARRAYBUFFER_API_TEST_1300
     * @tc.name SharedArrayBufferApiTest1300
     * @tc.desc Test SharedArrayBuffer.prototype.slice with start=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SharedArrayBufferApiTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      const caseName = 'SharedArrayBufferApiTest1300';
      console.info(`${caseName} test start`);
      try {
        const sab = new SharedArrayBuffer(-1);
        console.log(`byteLength: ${sab.byteLength}`);
      } catch (error) {
        if (error instanceof Error) {
            console.log(`${error.message}`);
            expect(error.message).assertEqual("integerIndex < 0 or integerIndex > SAFE_NUMBER")
        }
      }
      const sab1 = new SharedArrayBuffer(0);
      expect(sab1.byteLength).assertEqual(0);

      const sab2 = new SharedArrayBuffer(1);
      expect(sab2.byteLength).assertEqual(1);

      const sab3 = new SharedArrayBuffer(8);
      expect(sab3.byteLength).assertEqual(8);

      try {
        const sab4 = new SharedArrayBuffer(Number.MAX_SAFE_INTEGER);
        console.log(`byteLength: ${sab4.byteLength}`);
      } catch (error) {
        if (error instanceof Error) {
          console.log(`${error.message}`);
          expect(error.message).assertEqual("Out of range")
        }
      }

      try {
        const sab5 = new SharedArrayBuffer(Number.MAX_SAFE_INTEGER+1);
        console.log(`byteLength: ${sab5.byteLength}`);
      } catch (error) {
        if (error instanceof Error) {
          console.log(`${error.message}`);
          expect(error.message).assertEqual("integerIndex < 0 or integerIndex > SAFE_NUMBER")
        }
      }

      console.info(`${caseName} test end`);
      Done();
    });

  });
}
