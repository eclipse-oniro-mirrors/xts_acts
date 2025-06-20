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
import { exportObj } from '../../testability/pages/ArrayFunOpen'
import { sleep } from '../../testability/pages/Utils'

export default function builtinsArrayBufferIsViewTest() {
  describe('BuiltinsArrayBufferIsViewTest', () => {
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
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_0100
     * @tc.name buildinsArrayBufferIsViewTest1001
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let data = new Uint8Array(8)
        let result = ArrayBuffer.isView(data)
        expect(result).assertEqual(true)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_0200
     * @tc.name buildinsArrayBufferIsViewTest1002
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let data = new Uint8Array(0)
        let result = ArrayBuffer.isView(data)
        expect(result).assertEqual(true)
        Done()
      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_0300
     * @tc.name buildinsArrayBufferIsViewTest1003
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let data = new Uint8Array(new ArrayBuffer(8).slice(0, 4))
        let result = ArrayBuffer.isView(data)
        expect(result).assertEqual(true)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_0400
     * @tc.name buildinsArrayBufferIsViewTest1004
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let data = new DataView(new ArrayBuffer(8))
        let result = ArrayBuffer.isView(data)
        expect(result).assertEqual(true)
        Done()
      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_0500
     * @tc.name buildinsArrayBufferIsViewTest1005
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let data = new DataView(new ArrayBuffer(8), 0, 4)
        let result = ArrayBuffer.isView(data)
        expect(result).assertEqual(true)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_0600
     * @tc.name buildinsArrayBufferIsViewTest1006
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let data = new Int32Array(4)
        let result = ArrayBuffer.isView(data)
        expect(result).assertEqual(true)
        Done()
      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_0700
     * @tc.name buildinsArrayBufferIsViewTest1007
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let data = new Int8Array()
        let result = ArrayBuffer.isView(data)
        expect(result).assertEqual(true)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_0800
     * @tc.name buildinsArrayBufferIsViewTest1008
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let data = new Int8Array(1)
        let result = ArrayBuffer.isView(data)
        expect(result).assertEqual(true)
        Done()
      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_0900
     * @tc.name buildinsArrayBufferIsViewTest1009
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let data = new Uint8ClampedArray(1)
        let result = ArrayBuffer.isView(data)
        expect(result).assertEqual(true)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_1000
     * @tc.name buildinsArrayBufferIsViewTest1010
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let data = new Int16Array(1)
        let result = ArrayBuffer.isView(data)
        expect(result).assertEqual(true)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_1100
     * @tc.name buildinsArrayBufferIsViewTest1011
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let data = new Uint16Array(1)
        let result = ArrayBuffer.isView(data)
        expect(result).assertEqual(true)
        Done()
      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_1200
     * @tc.name buildinsArrayBufferIsViewTest1012
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let data = new Uint32Array(1)
        let result = ArrayBuffer.isView(data)
        expect(result).assertEqual(true)
        Done()
      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_1300
     * @tc.name buildinsArrayBufferIsViewTest1013
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let data = new Float32Array(1)
        let result = ArrayBuffer.isView(data)
        expect(result).assertEqual(true)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_1400
     * @tc.name buildinsArrayBufferIsViewTest1014
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let data = new Float64Array(1)
        let result = ArrayBuffer.isView(data)
        expect(result).assertEqual(true)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_1500
     * @tc.name buildinsArrayBufferIsViewTest1015
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let data = new BigInt64Array(1)
        let result = ArrayBuffer.isView(data)
        expect(result).assertEqual(true)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_1600
     * @tc.name buildinsArrayBufferIsViewTest1016
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let data = new BigUint64Array(1)
        let result = ArrayBuffer.isView(data)
        expect(result).assertEqual(true)
        Done()
      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_1700
     * @tc.name buildinsArrayBufferIsViewTest1017
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let data = [1, 2, 3]
        let result = ArrayBuffer.isView(data)
        expect(result).assertEqual(false)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_1800
     * @tc.name buildinsArrayBufferIsViewTest1018
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let data = "Hello"
        let result = ArrayBuffer.isView(data)
        expect(result).assertEqual(false)
        Done()
      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_1900
     * @tc.name buildinsArrayBufferIsViewTest1019
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let data = 42
        let result = ArrayBuffer.isView(data)
        expect(result).assertEqual(false)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_2000
     * @tc.name buildinsArrayBufferIsViewTest1020
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let data = true
        let result = ArrayBuffer.isView(data)
        expect(result).assertEqual(false)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_2100
     * @tc.name buildinsArrayBufferIsViewTest1021
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let data = null
        let result = ArrayBuffer.isView(data)
        expect(result).assertEqual(false)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_2200
     * @tc.name buildinsArrayBufferIsViewTest1022
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let data = undefined
        let result = ArrayBuffer.isView(data)
        expect(result).assertEqual(false)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_2300
     * @tc.name buildinsArrayBufferIsViewTest1023
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let data: object = exportObj()
        let result = ArrayBuffer.isView(data)
        expect(result).assertEqual(false)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_2400
     * @tc.name buildinsArrayBufferIsViewTest1024
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let result = ArrayBuffer.isView(0)
        expect(result).assertEqual(false)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_2500
     * @tc.name buildinsArrayBufferIsViewTest1025
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let result = ArrayBuffer.isView(-0)
        expect(result).assertEqual(false)
        Done()
      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_2600
     * @tc.name buildinsArrayBufferIsViewTest1026
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let result = ArrayBuffer.isView(NaN)
        expect(result).assertEqual(false)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_2700
     * @tc.name buildinsArrayBufferIsViewTest1027
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let result = ArrayBuffer.isView(Infinity)
        expect(result).assertEqual(false)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_2800
     * @tc.name buildinsArrayBufferIsViewTest1028
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let result = ArrayBuffer.isView(-Infinity)
        expect(result).assertEqual(false)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_2900
     * @tc.name buildinsArrayBufferIsViewTest1029
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let result = ArrayBuffer.isView(Math.floor(1.5))
        expect(result).assertEqual(false)
        Done()
      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_3000
     * @tc.name buildinsArrayBufferIsViewTest1030
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let result = ArrayBuffer.isView(Number.MAX_VALUE)
        expect(result).assertEqual(false)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_3100
     * @tc.name buildinsArrayBufferIsViewTest1031
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let result = ArrayBuffer.isView(Number.MIN_VALUE)
        expect(result).assertEqual(false)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_3200
     * @tc.name buildinsArrayBufferIsViewTest1032
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let result = ArrayBuffer.isView(Number.EPSILON)
        expect(result).assertEqual(false)
        Done()
      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_3300
     * @tc.name buildinsArrayBufferIsViewTest1033
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let result = ArrayBuffer.isView(123.456)
        expect(result).assertEqual(false)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_3400
     * @tc.name buildinsArrayBufferIsViewTest1034
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let result = ArrayBuffer.isView(0xcafebabe)
        expect(result).assertEqual(false)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_3500
     * @tc.name buildinsArrayBufferIsViewTest1035
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let result = ArrayBuffer.isView(0x0102)
        expect(result).assertEqual(false)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_3600
     * @tc.name buildinsArrayBufferIsViewTest1036
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let result = ArrayBuffer.isView(0x01020304)
        expect(result).assertEqual(false)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_3700
     * @tc.name buildinsArrayBufferIsViewTest1037
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let result = ArrayBuffer.isView(0x3)
        expect(result).assertEqual(false)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_3800
     * @tc.name buildinsArrayBufferIsViewTest1038
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let result = ArrayBuffer.isView(BigInt(0xdecafafecacefade))
        expect(result).assertEqual(false)
        Done()

      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_3900
     * @tc.name buildinsArrayBufferIsViewTest1039
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let result = ArrayBuffer.isView("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~")
        expect(result).assertEqual(false)
        Done()

      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_4000
     * @tc.name buildinsArrayBufferIsViewTest1040
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let result = ArrayBuffer.isView(undefined)
        expect(result).assertEqual(false)
        let result2 = ArrayBuffer.isView("undefined")
        expect(result2).assertEqual(false)
        Done()

      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_4100
     * @tc.name buildinsArrayBufferIsViewTest1041
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let result = ArrayBuffer.isView(null)
        expect(result).assertEqual(false)
        let result2 = ArrayBuffer.isView("null")
        expect(result2).assertEqual(false)
        Done()

      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_4200
     * @tc.name buildinsArrayBufferIsViewTest1042
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let result = ArrayBuffer.isView("0")
        expect(result).assertEqual(false)
        let result2 = ArrayBuffer.isView("NaN")
        expect(result2).assertEqual(false)
        Done()

      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_4300
     * @tc.name buildinsArrayBufferIsViewTest1043
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let result = ArrayBuffer.isView('')
        expect(result).assertEqual(false)
        Done()

      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_4400
     * @tc.name buildinsArrayBufferIsViewTest1044
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let result = ArrayBuffer.isView("\ud83d\udc46")
        expect(result).assertEqual(false)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_4500
     * @tc.name buildinsArrayBufferIsViewTest1045
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let result = ArrayBuffer.isView("\udc04")
        expect(result).assertEqual(false)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_4600
     * @tc.name buildinsArrayBufferIsViewTest1046
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let result = ArrayBuffer.isView("\a")
        expect(result).assertEqual(false)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_4700
     * @tc.name buildinsArrayBufferIsViewTest1047
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let result = ArrayBuffer.isView(true)
        expect(result).assertEqual(false)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_4800
     * @tc.name buildinsArrayBufferIsViewTest1048
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let result = ArrayBuffer.isView(false)
        expect(result).assertEqual(false)
        Done()
      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_4900
     * @tc.name buildinsArrayBufferIsViewTest1049
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let result = ArrayBuffer.isView(!'s')
        expect(result).assertEqual(false)
        Done()
      })


    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_5000
     * @tc.name buildinsArrayBufferIsViewTest1050
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        let result = ArrayBuffer.isView(!0)
        expect(result).assertEqual(false)
        Done()
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_IS_VIEW_TEST_5100
     * @tc.name buildinsArrayBufferIsViewTest1051
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferIsViewTest1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('testTag', '%{public}s', 'it begin');
        const data = []
        data["abc"] = 111
        data["aaa"] = 222
        let result = ArrayBuffer.isView(data)
        expect(result).assertEqual(false)
        Done()
      })
  })
}