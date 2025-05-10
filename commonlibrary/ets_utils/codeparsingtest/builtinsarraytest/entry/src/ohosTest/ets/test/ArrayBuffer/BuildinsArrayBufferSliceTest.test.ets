/*
* Copyright (C) 2024 HiHope Open Source Organization.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from '@ohos/hypium'
import { slice } from '../../testability/pages/ArrayFunOpen'
import { sleep } from '../../testability/pages/Utils'

export default function builtinsArrayBufferSliceTest() {
  describe('BuiltinsArrayBufferSliceTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
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
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_SLICE_TEST_0100
     * @tc.name buildinsArrayBufferSliceTest1001
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferSliceTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new ArrayBuffer(8)
        let uint8View = new Uint8Array(arrayBuffer);
        for (let i = 0; i < uint8View.length; i++) {
          uint8View[i] = i;
        }
        let arrayBuffer2: ArrayBuffer = slice(arrayBuffer)
        expect(arrayBuffer2.byteLength).assertEqual(arrayBuffer.byteLength)
        let view1 = new Uint8Array(arrayBuffer)
        let view2 = new Uint8Array(arrayBuffer2)
        for (let i = 0; i < view1.length; i++) {
          expect(view1[i] == view2[i])
        }
        Done()

      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_SLICE_TEST_0200
     * @tc.name buildinsArrayBufferSliceTest1002
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferSliceTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let start = 2;
        let arrayBuffer = new ArrayBuffer(8)
        let uint8View = new Uint8Array(arrayBuffer);
        for (let i = 0; i < uint8View.length; i++) {
          uint8View[i] = i;
        }
        let arrayBuffer2 = arrayBuffer.slice(start)
        expect(arrayBuffer2.byteLength + start).assertEqual(arrayBuffer.byteLength)
        let view1 = new Uint8Array(arrayBuffer)
        let view2 = new Uint8Array(arrayBuffer2)
        for (let i = 0; i < view1.length; i++) {
          expect(view1[i+start]).assertEqual(view2[i])
        }
        Done()

      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_SLICE_TEST_0300
     * @tc.name buildinsArrayBufferSliceTest1003
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferSliceTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let start = 2;
        let end = 5;
        let arrayBuffer = new ArrayBuffer(8)
        let uint8View = new Uint8Array(arrayBuffer);
        for (let i = 0; i < uint8View.length; i++) {
          uint8View[i] = i;
        }
        let arrayBuffer2 = arrayBuffer.slice(start, end)
        expect(arrayBuffer2.byteLength).assertEqual(end - start)
        let view1 = new Uint8Array(arrayBuffer)
        let view2 = new Uint8Array(arrayBuffer2)
        for (let i = 0; i < (end - start); i++) {
          expect(view1[i+start]).assertEqual(view2[i])
        }
        Done()

      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_SLICE_TEST_0400
     * @tc.name buildinsArrayBufferSliceTest1004
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferSliceTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let start = 5;
        let arrayBuffer = new ArrayBuffer(8)
        let uint8View = new Uint8Array(arrayBuffer);
        for (let i = 0; i < uint8View.length; i++) {
          uint8View[i] = i;
        }
        let arrayBuffer2 = arrayBuffer.slice(-3)
        expect(arrayBuffer2.byteLength + start).assertEqual(arrayBuffer.byteLength)
        let view1 = new Uint8Array(arrayBuffer)
        let view2 = new Uint8Array(arrayBuffer2)
        for (let i = 0; i < view1.length; i++) {
          expect(view1[i+start]).assertEqual(view2[i])
        }
        Done()

      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_SLICE_TEST_0500
     * @tc.name buildinsArrayBufferSliceTest1005
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferSliceTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let start = 0;
        let end = 5;
        let arrayBuffer = new ArrayBuffer(8)
        let uint8View = new Uint8Array(arrayBuffer);
        for (let i = 0; i < uint8View.length; i++) {
          uint8View[i] = i;
        }
        let arrayBuffer2 = arrayBuffer.slice(start, -3)
        expect(arrayBuffer2.byteLength).assertEqual(end - start)
        let view1 = new Uint8Array(arrayBuffer)
        let view2 = new Uint8Array(arrayBuffer2)
        for (let i = 0; i < (end - start); i++) {
          expect(view1[i+start]).assertEqual(view2[i])
        }
        Done()

      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_SLICE_TEST_0600
     * @tc.name buildinsArrayBufferSliceTest1006
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferSliceTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let start = 10;
        let arrayBuffer = new ArrayBuffer(8)
        let uint8View = new Uint8Array(arrayBuffer);
        for (let i = 0; i < uint8View.length; i++) {
          uint8View[i] = i;
        }
        let arrayBuffer2 = arrayBuffer.slice(start)
        expect(arrayBuffer2.byteLength).assertEqual(0)
        Done()

      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_SLICE_TEST_0700
     * @tc.name buildinsArrayBufferSliceTest1007
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferSliceTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let start = 0;
        let end = 8;
        let arrayBuffer = new ArrayBuffer(8)
        let uint8View = new Uint8Array(arrayBuffer);
        for (let i = 0; i < uint8View.length; i++) {
          uint8View[i] = i;
        }
        let arrayBuffer2 = arrayBuffer.slice(start, 10)
        expect(arrayBuffer2.byteLength).assertEqual(end - start)
        let view1 = new Uint8Array(arrayBuffer)
        let view2 = new Uint8Array(arrayBuffer2)
        for (let i = 0; i < (end - start); i++) {
          expect(view1[i+start]).assertEqual(view2[i])
        }
        Done()

      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_SLICE_TEST_0800
     * @tc.name buildinsArrayBufferSliceTest1008
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferSliceTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new ArrayBuffer(8)
        let arrayBuffer2 = arrayBuffer.slice(-0)
        expect(arrayBuffer2.byteLength).assertEqual(arrayBuffer.byteLength)
        Done()

      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_SLICE_TEST_0900
     * @tc.name buildinsArrayBufferSliceTest1009
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferSliceTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new ArrayBuffer(8)
        let arrayBuffer2 = arrayBuffer.slice(NaN)
        expect(arrayBuffer2.byteLength).assertEqual(arrayBuffer.byteLength)
        Done()

      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_SLICE_TEST_1000
     * @tc.name buildinsArrayBufferSliceTest1010
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferSliceTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new ArrayBuffer(8)
        let arrayBuffer2 = arrayBuffer.slice(Infinity)
        expect(arrayBuffer2.byteLength).assertEqual(0)
        Done()

      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_SLICE_TEST_1100
     * @tc.name buildinsArrayBufferSliceTest1011
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferSliceTest1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new ArrayBuffer(8)
        let arrayBuffer2 = arrayBuffer.slice(-Infinity)
        expect(arrayBuffer2.byteLength).assertEqual(arrayBuffer.byteLength)
        Done()

      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_SLICE_TEST_1200
     * @tc.name buildinsArrayBufferSliceTest1012
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferSliceTest1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new ArrayBuffer(8)
        let arrayBuffer2 = arrayBuffer.slice(Math.floor(1.5))
        expect(arrayBuffer2.byteLength).assertEqual(arrayBuffer.byteLength - Math.floor(1.5))
        Done()

      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_SLICE_TEST_1300
     * @tc.name buildinsArrayBufferSliceTest1013
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferSliceTest1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new ArrayBuffer(8)
        let arrayBuffer2 = arrayBuffer.slice(Number.MAX_VALUE)
        expect(arrayBuffer2.byteLength).assertEqual(0)
        Done()

      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_SLICE_TEST_1400
     * @tc.name buildinsArrayBufferSliceTest1014
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferSliceTest1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new ArrayBuffer(8)
        let arrayBuffer2 = arrayBuffer.slice(Number.MIN_VALUE)
        expect(arrayBuffer2.byteLength).assertEqual(arrayBuffer.byteLength)
        Done()

      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_SLICE_TEST_1500
     * @tc.name buildinsArrayBufferSliceTest1015
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferSliceTest1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new ArrayBuffer(8)
        let arrayBuffer2 = arrayBuffer.slice(Number.EPSILON)
        expect(arrayBuffer2.byteLength).assertEqual(arrayBuffer.byteLength)
        Done()

      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_SLICE_TEST_1600
     * @tc.name buildinsArrayBufferSliceTest1016
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferSliceTest1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new ArrayBuffer(124)
        let arrayBuffer2 = arrayBuffer.slice(123.456)
        expect(arrayBuffer2.byteLength).assertEqual(1)
        Done()

      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_SLICE_TEST_1700
     * @tc.name buildinsArrayBufferSliceTest1017
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferSliceTest1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new ArrayBuffer(8)
        let arrayBuffer2 = arrayBuffer.slice(0xcafebabe)
        expect(arrayBuffer2.byteLength).assertEqual(0)
        Done()

      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_SLICE_TEST_1800
     * @tc.name buildinsArrayBufferSliceTest1018
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferSliceTest1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new ArrayBuffer(0x0102 + 1)
        let arrayBuffer2 = arrayBuffer.slice(0x0102)
        expect(arrayBuffer2.byteLength).assertEqual(1)
        Done()

      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_SLICE_TEST_1900
     * @tc.name buildinsArrayBufferSliceTest1019
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferSliceTest1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new ArrayBuffer(8)
        let arrayBuffer2 = arrayBuffer.slice(0x01020304)
        expect(arrayBuffer2.byteLength).assertEqual(0)
        Done()

      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_SLICE_TEST_2000
     * @tc.name buildinsArrayBufferSliceTest1020
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferSliceTest1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new ArrayBuffer(0x3 + 1)
        let arrayBuffer2 = arrayBuffer.slice(0x3)
        expect(arrayBuffer2.byteLength).assertEqual(1)
        Done()

      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_SLICE_TEST_2100
     * @tc.name buildinsArrayBufferSliceTest1021
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferSliceTest1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new ArrayBuffer(8)
        let arrayBuffer2 = arrayBuffer.slice(3, 1)
        expect(arrayBuffer2.byteLength).assertEqual(0)
        Done()

      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_SLICE_TEST_2200
     * @tc.name buildinsArrayBufferSliceTest1022
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferSliceTest1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new ArrayBuffer(8)
        let arrayBuffer2 = arrayBuffer.slice(1, 1)
        expect(arrayBuffer2.byteLength).assertEqual(0)
        Done()
      })
  })
}