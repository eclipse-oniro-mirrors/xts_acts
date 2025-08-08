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
import { sleep } from '../../testability/pages/Utils'

export default function builtinsArrayBufferConstructorTest() {
  describe('BuiltinsArrayBufferConstructorTest', () => {
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
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_CONSTRUCTOR_TEST_0100
     * @tc.name buildinsArrayBufferConstructorTest1001
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferConstructorTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new ArrayBuffer(0)
        expect(arrayBuffer.byteLength).assertEqual(0)
        Done()

      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_CONSTRUCTOR_TEST_0200
     * @tc.name buildinsArrayBufferConstructorTest1002
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferConstructorTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new ArrayBuffer(8)
        expect(arrayBuffer.byteLength).assertEqual(8)
        Done()

      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_CONSTRUCTOR_TEST_0300
     * @tc.name buildinsArrayBufferConstructorTest1003
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferConstructorTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        try {
          new ArrayBuffer(-1)
          throw new Error("Not throw Uncaught RangeError")
        } catch (e) {
          expect(e.name).assertEqual(RangeError.name)
        }
        Done()

      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_CONSTRUCTOR_TEST_0400
     * @tc.name buildinsArrayBufferConstructorTest1004
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferConstructorTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        new ArrayBuffer(-0)
        Done()

      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_CONSTRUCTOR_TEST_0500
     * @tc.name buildinsArrayBufferConstructorTest1005
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferConstructorTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new ArrayBuffer(NaN)
        expect(arrayBuffer.byteLength).assertEqual(0)
        Done()

      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_CONSTRUCTOR_TEST_0600
     * @tc.name buildinsArrayBufferConstructorTest1006
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferConstructorTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        try {
          new ArrayBuffer(Infinity)
          throw new Error("Not throw Uncaught RangeError")
        } catch (e) {
          expect(e.name).assertEqual(RangeError.name)
        }

        Done()

      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_CONSTRUCTOR_TEST_0700
     * @tc.name buildinsArrayBufferConstructorTest1007
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferConstructorTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        try {
          new ArrayBuffer(-Infinity)
          throw new Error("Not throw Uncaught RangeError")
        } catch (e) {
          expect(e.name).assertEqual(RangeError.name)
        }
        Done()

      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_CONSTRUCTOR_TEST_0800
     * @tc.name buildinsArrayBufferConstructorTest1008
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferConstructorTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        new ArrayBuffer(Math.floor(1.5))
        Done()

      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_CONSTRUCTOR_TEST_0900
     * @tc.name buildinsArrayBufferConstructorTest1009
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferConstructorTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        try {
          new ArrayBuffer(Number.MAX_VALUE)
          throw new Error("Not throw Uncaught RangeError")
        } catch (e) {
          expect(e.name).assertEqual(RangeError.name)
        }

        Done()

      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_CONSTRUCTOR_TEST_1000
     * @tc.name buildinsArrayBufferConstructorTest1010
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferConstructorTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new ArrayBuffer(Number.MIN_VALUE)
        expect(arrayBuffer.byteLength).assertEqual(0)
        Done()

      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_CONSTRUCTOR_TEST_1100
     * @tc.name buildinsArrayBufferConstructorTest1011
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferConstructorTest1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new ArrayBuffer(Number.EPSILON)
        expect(arrayBuffer.byteLength).assertEqual(0)
        Done()

      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_CONSTRUCTOR_TEST_1200
     * @tc.name buildinsArrayBufferConstructorTest1012
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferConstructorTest1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new ArrayBuffer(123.456)
        expect(arrayBuffer.byteLength).assertEqual(123)
        Done()

      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_CONSTRUCTOR_TEST_1300
     * @tc.name buildinsArrayBufferConstructorTest1013
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferConstructorTest1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        try {
          new ArrayBuffer(0xcafebabe)
          throw new Error("Not throw Uncaught RangeError")
        } catch (e) {
          expect(e.name).assertEqual(RangeError.name)
        }
        Done()

      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_CONSTRUCTOR_TEST_1400
     * @tc.name buildinsArrayBufferConstructorTest1014
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferConstructorTest1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new ArrayBuffer(0x0102)
        expect(arrayBuffer.byteLength).assertEqual(0x0102)
        Done()

      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_CONSTRUCTOR_TEST_1500
     * @tc.name buildinsArrayBufferConstructorTest1015
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferConstructorTest1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new ArrayBuffer(0x01020304)
        expect(arrayBuffer.byteLength).assertEqual(0x01020304)
        Done()

      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_CONSTRUCTOR_TEST_1600
     * @tc.name buildinsArrayBufferConstructorTest1016
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferConstructorTest1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let arrayBuffer = new ArrayBuffer(0x3)
        expect(arrayBuffer.byteLength).assertEqual(0x3)
        Done()
      })
  })
}