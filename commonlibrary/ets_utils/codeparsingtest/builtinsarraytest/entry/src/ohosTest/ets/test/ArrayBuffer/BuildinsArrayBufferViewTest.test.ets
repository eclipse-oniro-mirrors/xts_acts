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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

export default function builtinsArrayBufferViewTest() {
  describe('BuiltinsArrayBufferViewTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
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
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1001
     * @tc.name buildinsArrayBufferViewTest1001
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('buildinsArrayBufferViewTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: Function) => {
        let buffer = new ArrayBuffer(16);
        let uint = new Uint8Array(buffer, 0, 8);
        expect(8).assertEqual(uint.byteLength);
        expect(0).assertEqual(uint.byteOffset);
        Done();
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1002
     * @tc.name buildinsArrayBufferViewTest1002
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('buildinsArrayBufferViewTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: Function) => {
        let buffer = new ArrayBuffer(16);
        let uint = new Uint8Array(buffer, 8, 4);
        expect(4).assertEqual(uint.byteLength);
        expect(8).assertEqual(uint.byteOffset);
        Done();
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1003
     * @tc.name buildinsArrayBufferViewTest1003
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('buildinsArrayBufferViewTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: Function) => {
        try {
          let buffer = new ArrayBuffer(16);
          let uint = new Uint8Array(buffer, -8, 4);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1004
     * @tc.name buildinsArrayBufferViewTest1004
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new ArrayBuffer(16);
          let uint = new Uint8Array(buffer, 8, -4);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1005
     * @tc.name buildinsArrayBufferViewTest1005
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new ArrayBuffer(16);
        let uint = new Int8Array(buffer, 0, 8);
        expect(8).assertEqual(uint.byteLength);
        expect(0).assertEqual(uint.byteOffset);
        Done();
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1006
     * @tc.name buildinsArrayBufferViewTest1006
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new ArrayBuffer(16);
        let uint = new Int8Array(buffer, 8, 4);
        expect(4).assertEqual(uint.byteLength);
        expect(8).assertEqual(uint.byteOffset);
        Done();
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1007
     * @tc.name buildinsArrayBufferViewTest1007
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new ArrayBuffer(16);
          let uint = new Int8Array(buffer, -8, 4);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1008
     * @tc.name buildinsArrayBufferViewTest1008
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new ArrayBuffer(16);
          let uint = new Int8Array(buffer, 8, -4);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1009
     * @tc.name buildinsArrayBufferViewTest1009
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new ArrayBuffer(16);
        let uint = new Uint8ClampedArray(buffer, 0, 8);
        expect(8).assertEqual(uint.byteLength);
        expect(0).assertEqual(uint.byteOffset);
        Done();
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1010
     * @tc.name buildinsArrayBufferViewTest1010
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new ArrayBuffer(16);
        let uint = new Uint8ClampedArray(buffer, 8, 4);
        expect(4).assertEqual(uint.byteLength);
        expect(8).assertEqual(uint.byteOffset);
        Done();
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1011
     * @tc.name buildinsArrayBufferViewTest1011
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new ArrayBuffer(16);
          let uint = new Uint8ClampedArray(buffer, -8, 4);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1012
     * @tc.name buildinsArrayBufferViewTest1012
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new ArrayBuffer(16);
          let uint = new Uint8ClampedArray(buffer, 8, -4);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1013
     * @tc.name buildinsArrayBufferViewTest1013
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new ArrayBuffer(16);
        let uint = new Int16Array(buffer, 0, 8);
        expect(16).assertEqual(uint.byteLength);
        expect(0).assertEqual(uint.byteOffset);
        Done();
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1014
     * @tc.name buildinsArrayBufferViewTest1014
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new ArrayBuffer(16);
        let uint = new Int16Array(buffer, 8, 4);
        expect(8).assertEqual(uint.byteLength);
        expect(8).assertEqual(uint.byteOffset);
        Done();
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1015
     * @tc.name buildinsArrayBufferViewTest1015
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new ArrayBuffer(16);
          let uint = new Int16Array(buffer, -8, 4);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1016
     * @tc.name buildinsArrayBufferViewTest1016
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new ArrayBuffer(16);
          let uint = new Int16Array(buffer, 8, -4);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1017
     * @tc.name buildinsArrayBufferViewTest1017
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new ArrayBuffer(16);
        let uint = new Uint16Array(buffer, 0, 8);
        expect(16).assertEqual(uint.byteLength);
        expect(0).assertEqual(uint.byteOffset);
        Done();
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1018
     * @tc.name buildinsArrayBufferViewTest1018
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new ArrayBuffer(16);
        let uint = new Uint16Array(buffer, 8, 4);
        expect(8).assertEqual(uint.byteLength);
        expect(8).assertEqual(uint.byteOffset);
        Done();
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1019
     * @tc.name buildinsArrayBufferViewTest1019
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new ArrayBuffer(16);
          let uint = new Uint16Array(buffer, -8, 4);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1020
     * @tc.name buildinsArrayBufferViewTest1020
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new ArrayBuffer(16);
          let uint = new Uint16Array(buffer, 8, -4);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1021
     * @tc.name buildinsArrayBufferViewTest1021
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new ArrayBuffer(16);
        let uint = new Uint32Array(buffer, 0, 4);
        expect(16).assertEqual(uint.byteLength);
        expect(0).assertEqual(uint.byteOffset);
        Done();
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1022
     * @tc.name buildinsArrayBufferViewTest1022
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new ArrayBuffer(16);
        let uint = new Uint32Array(buffer, 8, 2);
        expect(8).assertEqual(uint.byteLength);
        expect(8).assertEqual(uint.byteOffset);
        Done();
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1023
     * @tc.name buildinsArrayBufferViewTest1023
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new ArrayBuffer(16);
          let uint = new Uint32Array(buffer, -8, 2);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1024
     * @tc.name buildinsArrayBufferViewTest1024
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new ArrayBuffer(16);
          let uint = new Uint32Array(buffer, 8, -2);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1025
     * @tc.name buildinsArrayBufferViewTest1025
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new ArrayBuffer(16);
        let float = new Float32Array(buffer, 0, 4);
        expect(16).assertEqual(float.byteLength);
        expect(0).assertEqual(float.byteOffset);
        Done();
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1026
     * @tc.name buildinsArrayBufferViewTest1026
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new ArrayBuffer(16);
        let float = new Float32Array(buffer, 8, 2);
        expect(8).assertEqual(float.byteLength);
        expect(8).assertEqual(float.byteOffset);
        Done();
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1027
     * @tc.name buildinsArrayBufferViewTest1027
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new ArrayBuffer(16);
          let float = new Float32Array(buffer, -8, 2);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1028
     * @tc.name buildinsArrayBufferViewTest1028
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new ArrayBuffer(16);
          let float = new Float32Array(buffer, 8, -2);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1029
     * @tc.name buildinsArrayBufferViewTest1029
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new ArrayBuffer(16);
        let float = new Float64Array(buffer, 0, 2);
        expect(16).assertEqual(float.byteLength);
        expect(0).assertEqual(float.byteOffset);
        Done();
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1030
     * @tc.name buildinsArrayBufferViewTest1030
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new ArrayBuffer(16);
        let float = new Float64Array(buffer, 8, 1);
        expect(8).assertEqual(float.byteLength);
        expect(8).assertEqual(float.byteOffset);
        Done();
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1031
     * @tc.name buildinsArrayBufferViewTest1031
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new ArrayBuffer(16);
          let float = new Float64Array(buffer, -8, 1);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1032
     * @tc.name buildinsArrayBufferViewTest1032
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new ArrayBuffer(16);
          let float = new Float64Array(buffer, 8, -1);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1033
     * @tc.name buildinsArrayBufferViewTest1033
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new ArrayBuffer(16);
        let big = new BigInt64Array(buffer, 0, 2);
        expect(16).assertEqual(big.byteLength);
        expect(0).assertEqual(big.byteOffset);
        Done();
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1034
     * @tc.name buildinsArrayBufferViewTest1034
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new ArrayBuffer(16);
        let big = new BigInt64Array(buffer, 8, 1);
        expect(8).assertEqual(big.byteLength);
        expect(8).assertEqual(big.byteOffset);
        Done();
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1035
     * @tc.name buildinsArrayBufferViewTest1035
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new ArrayBuffer(16);
          let big = new BigInt64Array(buffer, -8, 1);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1036
     * @tc.name buildinsArrayBufferViewTest1036
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new ArrayBuffer(16);
          let big = new BigInt64Array(buffer, 8, -1);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1037
     * @tc.name buildinsArrayBufferViewTest1037
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new ArrayBuffer(16);
        let big = new BigUint64Array(buffer, 0, 2);
        expect(16).assertEqual(big.byteLength);
        expect(0).assertEqual(big.byteOffset);
        Done();
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1038
     * @tc.name buildinsArrayBufferViewTest1038
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer = new ArrayBuffer(16);
        let big = new BigUint64Array(buffer, 8, 1);
        expect(8).assertEqual(big.byteLength);
        expect(8).assertEqual(big.byteOffset);
        Done();
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1039
     * @tc.name buildinsArrayBufferViewTest1039
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new ArrayBuffer(16);
          let big = new BigUint64Array(buffer, -8, 1);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

    /**
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_VIEW_TEST_1040
     * @tc.name buildinsArrayBufferViewTest1040
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsArrayBufferViewTest1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        try {
          let buffer = new ArrayBuffer(16);
          let big = new BigUint64Array(buffer, 8, -1);
        } catch (err) {
          expect('integerIndex < 0 or integerIndex > SAFE_NUMBER').assertEqual(err.message);
          Done();
        }
      })

  })
}