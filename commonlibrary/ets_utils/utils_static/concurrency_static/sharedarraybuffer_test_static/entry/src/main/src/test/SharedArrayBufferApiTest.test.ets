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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import { sleep } from '../testability/pages/TestUtils';
import hilog from '@ohos.hilog';

export default function SharedArrayBufferApiTest() {
  describe('SharedArrayBufferApiTest', (): void => {


    // Presets a clear action, which is performed after each unit test case ends.
    // The number of execution times is the same as the number of test cases defined by **it**.
    // This API supports only one parameter: clear action function.
    afterEach(async (): Promise<void> => {
      console.info('array_buffer_api_static_ afterEach called');
      await sleep(200);
    })

    /**
     * @tc.number SUB_MODULE_ArrayBuffer_API_TEST_0900
     * @tc.name array_buffer_api_static_0900
     * @tc.desc Test ArrayBuffer.prototype.slice with start=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('array_buffer_api_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'array_buffer_api_static_0900';
        console.info(`${caseName} test start`);

        try {
          const sab = new ArrayBuffer(16);

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
          error = error as Error;
          console.error(`${caseName} Test failed: ${error}`);
          expect(false).assertTrue();
        } finally {
          console.info(`${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_MODULE_ArrayBuffer_API_TEST_1000
     * @tc.name array_buffer_api_static_1000
     * @tc.desc Test ArrayBuffer.prototype.slice with start=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('array_buffer_api_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'array_buffer_api_static_1000';
        console.info(`${caseName} test start`);

        try {
          const sab = new ArrayBuffer(16);

          const slice1 = sab.slice(16);
          expect(slice1.byteLength).assertEqual(0);

          const int8Array = new Int8Array(slice1);
          expect(int8Array.length).assertEqual(0);

        } catch (error) {
          error = error as Error;
          console.error(`${caseName} Test failed: ${error}`);
          expect(false).assertTrue();
        } finally {
          console.info(`${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_MODULE_ArrayBuffer_API_TEST_1100
     * @tc.name array_buffer_api_static_1100
     * @tc.desc Test ArrayBuffer.prototype.slice with start=length+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('array_buffer_api_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'array_buffer_api_static_1100';
        console.info(`${caseName} test start`);

        try {
          const sab = new ArrayBuffer(16);

          const slice1 = sab.slice(17, sab.byteLength);
          expect(slice1.byteLength).assertEqual(0);

          const int8Array = new Int8Array(slice1);
          expect(int8Array.length).assertEqual(0);

        } catch (error) {
          error = error as Error;
          console.error(`${caseName} Test failed: ${error}`);
          expect(false).assertTrue();
        } finally {
          console.info(`${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_MODULE_ArrayBuffer_API_TEST_1200
     * @tc.name array_buffer_api_static_1200
     * @tc.desc Test ArrayBuffer.prototype.slice with start=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('array_buffer_api_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'array_buffer_api_static_1200';
        console.info(`${caseName} test start`);

        try {
          const sab = new ArrayBuffer(16);

          const int8Array = new Int8Array(sab);
          int8Array[15] = 42;

          const slice1 = sab.slice(15, sab.byteLength);
          expect(slice1.byteLength).assertEqual(1);

          const slicedInt8Array = new Int8Array(slice1);
          expect(slicedInt8Array[0]).assertEqual(42);

          int8Array[15] = 99;
          expect(slicedInt8Array[0]).assertEqual(42);

        } catch (error) {
          error = error as Error;
          console.error(`${caseName} Test failed: ${error}`);
          expect(false).assertTrue();
        } finally {
          console.info(`${caseName} test end`);
          done();
        }
      });

  });
}
