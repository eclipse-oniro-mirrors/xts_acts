/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

export default function TypedArrayTest() {
  describe('typedArrayTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0100
     * @tc.name       : testTypedArrayFrom0001
     * @tc.desc       : Test the function of the interface TypedArray.from().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayFrom0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayFrom0001";
      try {
        let s = new Set([1, 2, 3]);
        let value = Uint8Array.from(s);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":3}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0200
     * @tc.name       : testTypedArrayFrom0002
     * @tc.desc       : Test the function of the interface TypedArray.from().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayFrom0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayFrom0002";
      try {
        let s = new Set([1, 2, 3]);
        let value = Int8Array.from(s);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":3}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0300
     * @tc.name       : testTypedArrayFrom0003
     * @tc.desc       : Test the function of the interface TypedArray.from().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayFrom0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayFrom0003";
      try {
        let s = new Set([1, 2, 3]);
        let value = Uint8ClampedArray.from(s);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":3}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0400
     * @tc.name       : testTypedArrayFrom0004
     * @tc.desc       : Test the function of the interface TypedArray.from().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayFrom0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayFrom0004";
      try {
        let s = new Set([1, 2, 3]);
        let value = Int16Array.from(s);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":3}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0500
     * @tc.name       : testTypedArrayFrom0005
     * @tc.desc       : Test the function of the interface TypedArray.from().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayFrom0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayFrom0005";
      try {
        let s = new Set([1, 2, 3]);
        let value = Uint16Array.from(s);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":3}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0600
     * @tc.name       : testTypedArrayFrom0006
     * @tc.desc       : Test the function of the interface TypedArray.from().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayFrom0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayFrom0006";
      try {
        let s = new Set([1, 2, 3]);
        let value = Int32Array.from(s);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":3}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0700
     * @tc.name       : testTypedArrayFrom0007
     * @tc.desc       : Test the function of the interface TypedArray.from().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayFrom0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayFrom0007";
      try {
        let s = new Set([1, 2, 3]);
        let value = Uint32Array.from(s);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":3}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0800
     * @tc.name       : testTypedArrayFrom0008
     * @tc.desc       : Test the function of the interface TypedArray.from().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayFrom0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayFrom0008";
      try {
        let s = new Set([1, 2, 3]);
        let value = Float32Array.from(s);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":3}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0900
     * @tc.name       : testTypedArrayFrom0009
     * @tc.desc       : Test the function of the interface TypedArray.from().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayFrom0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayFrom0009";
      try {
        let s = new Set([1, 2, 3]);
        let value = Float64Array.from(s);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":3}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1000
     * @tc.name       : testTypedArrayFrom0010
     * @tc.desc       : Test the function of the interface TypedArray.from().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayFrom0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayFrom0010";
      try {
        let s = new Set([1n, 2n, 3n]);
        let arr: Array<bigint> = Array.from(s);
        let value = BigInt64Array.from(arr);
        expect(value.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1100
     * @tc.name       : testTypedArrayFrom0011
     * @tc.desc       : Test the function of the interface TypedArray.from().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayFrom0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayFrom0011";
      try {
        let s = new Set([1n, 2n, 3n]);
        let arr: Array<bigint> = Array.from(s);
        let value = BigUint64Array.from(arr);
        expect(value.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1200
     * @tc.name       : testTypedArrayOf0001
     * @tc.desc       : Test the function of the interface TypedArray.of().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayOf0001";
      try {
        let value = Uint8Array.of(1, 2, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1300
     * @tc.name       : testTypedArrayOf0002
     * @tc.desc       : Test the function of the interface TypedArray.of().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayOf0002";
      try {
        let value = Int8Array.of(1, 2, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1400
     * @tc.name       : testTypedArrayOf0003
     * @tc.desc       : Test the function of the interface TypedArray.of().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayOf0003";
      try {
        let value = Uint8ClampedArray.of(1, 2, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1500
     * @tc.name       : testTypedArrayOf0004
     * @tc.desc       : Test the function of the interface TypedArray.of().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayOf0004";
      try {
        let value = Int16Array.of(1, 2, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1600
     * @tc.name       : testTypedArrayOf0005
     * @tc.desc       : Test the function of the interface TypedArray.of().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayOf0005";
      try {
        let value = Uint16Array.of(1, 2, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1700
     * @tc.name       : testTypedArrayOf0006
     * @tc.desc       : Test the function of the interface TypedArray.of().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayOf0006";
      try {
        let value = Int32Array.of(1, 2, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1800
     * @tc.name       : testTypedArrayOf0007
     * @tc.desc       : Test the function of the interface TypedArray.of().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayOf0007";
      try {
        let value = Uint32Array.of(1, 2, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1900
     * @tc.name       : testTypedArrayOf0008
     * @tc.desc       : Test the function of the interface TypedArray.of().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayOf0008";
      try {
        let value = Float32Array.of(1, 2, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2000
     * @tc.name       : testTypedArrayOf0009
     * @tc.desc       : Test the function of the interface TypedArray.of().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayOf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayOf0009";
      try {
        let value = Float64Array.of(1, 2, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2100
     * @tc.name       : testTypedArrayOf0010
     * @tc.desc       : Test the function of the interface TypedArray.of().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayOf0010";
      try {
        let value = BigInt64Array.of(1n, 2n, 3n);
        expect(value.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2200
     * @tc.name       : testTypedArrayOf0011
     * @tc.desc       : Test the function of the interface TypedArray.of().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayOf0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayOf0011";
      try {
        let value = BigUint64Array.of(1n, 2n, 3n);
        expect(value.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2300
     * @tc.name       : testTypedArrayPrototypeCopyWithin0001
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0001";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint8Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, 2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":3,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2400
     * @tc.name       : testTypedArrayPrototypeCopyWithin0002
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0002";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint8Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, -2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2500
     * @tc.name       : testTypedArrayPrototypeCopyWithin0003
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0003";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint8Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(-1, -1);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2600
     * @tc.name       : testTypedArrayPrototypeCopyWithin0004
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0004";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint8Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(3, 0, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":1,"4":2,"5":3,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2700
     * @tc.name       : testTypedArrayPrototypeCopyWithin0005
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0005";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int8Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, 2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":3,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2800
     * @tc.name       : testTypedArrayPrototypeCopyWithin0006
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0006";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int8Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, -2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2900
     * @tc.name       : testTypedArrayPrototypeCopyWithin0007
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0007";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int8Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(-1, -1);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3000
     * @tc.name       : testTypedArrayPrototypeCopyWithin0008
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0008";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int8Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(3, 0, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":1,"4":2,"5":3,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3100
     * @tc.name       : testTypedArrayPrototypeCopyWithin0009
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0009";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint8ClampedArray(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, 2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":3,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3200
     * @tc.name       : testTypedArrayPrototypeCopyWithin0010
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0010";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint8ClampedArray(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, -2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3300
     * @tc.name       : testTypedArrayPrototypeCopyWithin0011
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0011";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint8ClampedArray(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(-1, -1);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3400
     * @tc.name       : testTypedArrayPrototypeCopyWithin0012
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0012";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint8ClampedArray(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(3, 0, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":1,"4":2,"5":3,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3500
     * @tc.name       : testTypedArrayPrototypeCopyWithin0013
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0013";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int16Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, 2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":3,"2":0,"3":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3600
     * @tc.name       : testTypedArrayPrototypeCopyWithin0014
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0014";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int16Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, -2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":3,"2":0,"3":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3700
     * @tc.name       : testTypedArrayPrototypeCopyWithin0015
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0015";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int16Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(-1, -1);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3800
     * @tc.name       : testTypedArrayPrototypeCopyWithin0016
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0016";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int16Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(3, 0, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":1}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3900
     * @tc.name       : testTypedArrayPrototypeCopyWithin0017
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0017";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint16Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, 2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":3,"2":0,"3":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4000
     * @tc.name       : testTypedArrayPrototypeCopyWithin0018
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0018";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint16Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, -2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":3,"2":0,"3":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4100
     * @tc.name       : testTypedArrayPrototypeCopyWithin0019
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0019";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint16Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(-1, -1);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4200
     * @tc.name       : testTypedArrayPrototypeCopyWithin0020
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0020";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint16Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(3, 0, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":1}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4300
     * @tc.name       : testTypedArrayPrototypeCopyWithin0021
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0021";
      try {
        let buffer = new ArrayBuffer(32);
        let array = new Int32Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, 2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":3,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4400
     * @tc.name       : testTypedArrayPrototypeCopyWithin0022
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0022";
      try {
        let buffer = new ArrayBuffer(32);
        let array = new Int32Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, -2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4500
     * @tc.name       : testTypedArrayPrototypeCopyWithin0023
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0023";
      try {
        let buffer = new ArrayBuffer(32);
        let array = new Int32Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(-1, -1);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4600
     * @tc.name       : testTypedArrayPrototypeCopyWithin0024
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0024";
      try {
        let buffer = new ArrayBuffer(32);
        let array = new Int32Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(3, 0, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":1,"4":2,"5":3,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4700
     * @tc.name       : testTypedArrayPrototypeCopyWithin0025
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0025";
      try {
        let buffer = new ArrayBuffer(32);
        let array = new Uint32Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, 2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":3,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4800
     * @tc.name       : testTypedArrayPrototypeCopyWithin0026
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0026";
      try {
        let buffer = new ArrayBuffer(32);
        let array = new Uint32Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, -2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4900
     * @tc.name       : testTypedArrayPrototypeCopyWithin0027
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0027";
      try {
        let buffer = new ArrayBuffer(32);
        let array = new Uint32Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(-1, -1);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5000
     * @tc.name       : testTypedArrayPrototypeCopyWithin0028
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0028";
      try {
        let buffer = new ArrayBuffer(32);
        let array = new Uint32Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(3, 0, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":1,"4":2,"5":3,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5100
     * @tc.name       : testTypedArrayPrototypeCopyWithin0029
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0029";
      try {
        let buffer = new ArrayBuffer(32);
        let array = new Float32Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, 2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":3,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5200
     * @tc.name       : testTypedArrayPrototypeCopyWithin0030
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0030";
      try {
        let buffer = new ArrayBuffer(32);
        let array = new Float32Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, -2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5300
     * @tc.name       : testTypedArrayPrototypeCopyWithin0031
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0031";
      try {
        let buffer = new ArrayBuffer(32);
        let array = new Float32Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(-1, -1);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5400
     * @tc.name       : testTypedArrayPrototypeCopyWithin0032
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0032";
      try {
        let buffer = new ArrayBuffer(32);
        let array = new Float32Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(3, 0, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":1,"4":2,"5":3,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5500
     * @tc.name       : testTypedArrayPrototypeCopyWithin0033
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0033";
      try {
        let buffer = new ArrayBuffer(64);
        let array = new Float64Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, 2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":3,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5600
     * @tc.name       : testTypedArrayPrototypeCopyWithin0034
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0034";
      try {
        let buffer = new ArrayBuffer(64);
        let array = new Float64Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, -2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5700
     * @tc.name       : testTypedArrayPrototypeCopyWithin0035
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0035";
      try {
        let buffer = new ArrayBuffer(64);
        let array = new Float64Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(-1, -1);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5800
     * @tc.name       : testTypedArrayPrototypeCopyWithin0036
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0036";
      try {
        let buffer = new ArrayBuffer(64);
        let array = new Float64Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(3, 0, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":1,"4":2,"5":3,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5900
     * @tc.name       : testTypedArrayPrototypeCopyWithin0037
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0037";
      try {
        let buffer = new ArrayBuffer(64);
        let array = new BigInt64Array(buffer);
        array.set([1n, 2n, 3n]);
        let value = array.copyWithin(1, 2);
        expect(value.toString()).assertEqual('1,3,0,0,0,0,0,0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6000
     * @tc.name       : testTypedArrayPrototypeCopyWithin0038
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0038";
      try {
        let buffer = new ArrayBuffer(64);
        let array = new BigInt64Array(buffer);
        array.set([1n, 2n, 3n]);
        let value = array.copyWithin(1, -2);
        expect(value.toString()).assertEqual('1,0,0,0,0,0,0,0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6100
     * @tc.name       : testTypedArrayPrototypeCopyWithin0039
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0039";
      try {
        let buffer = new ArrayBuffer(64);
        let array = new BigInt64Array(buffer);
        array.set([1n, 2n, 3n]);
        let value = array.copyWithin(-1, -1);
        expect(value.toString()).assertEqual('1,2,3,0,0,0,0,0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6200
     * @tc.name       : testTypedArrayPrototypeCopyWithin0040
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0040";
      try {
        let buffer = new ArrayBuffer(64);
        let array = new BigInt64Array(buffer);
        array.set([1n, 2n, 3n]);
        let value = array.copyWithin(3, 0, 3);
        expect(value.toString()).assertEqual('1,2,3,1,2,3,0,0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6300
     * @tc.name       : testTypedArrayPrototypeCopyWithin0041
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0041";
      try {
        let buffer = new ArrayBuffer(64);
        let array = new BigUint64Array(buffer);
        array.set([1n, 2n, 3n]);
        let value = array.copyWithin(1, 2);
        expect(value.toString()).assertEqual('1,3,0,0,0,0,0,0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6400
     * @tc.name       : testTypedArrayPrototypeCopyWithin0042
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0042";
      try {
        let buffer = new ArrayBuffer(64);
        let array = new BigUint64Array(buffer);
        array.set([1n, 2n, 3n]);
        let value = array.copyWithin(1, -2);
        expect(value.toString()).assertEqual('1,0,0,0,0,0,0,0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6500
     * @tc.name       : testTypedArrayPrototypeCopyWithin0043
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0043";
      try {
        let buffer = new ArrayBuffer(64);
        let array = new BigUint64Array(buffer);
        array.set([1n, 2n, 3n]);
        let value = array.copyWithin(-1, -1);
        expect(value.toString()).assertEqual('1,2,3,0,0,0,0,0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6600
     * @tc.name       : testTypedArrayPrototypeCopyWithin0044
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0044";
      try {
        let buffer = new ArrayBuffer(64);
        let array = new BigUint64Array(buffer);
        array.set([1n, 2n, 3n]);
        let value = array.copyWithin(3, 0, 3);
        expect(value.toString()).assertEqual('1,2,3,1,2,3,0,0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6700
     * @tc.name       : testTypedArrayPrototypeEntries0001
     * @tc.desc       : Test the function of the interface TypedArray.prototype.entries().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeEntries0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeEntries0001";
      try {
        let arr = new Uint8Array([10, 20, 30]);
        let eArr = arr.entries();
        expect(JSON.stringify(eArr.next().value)).assertEqual("[0,10]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[1,20]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[2,30]");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6800
     * @tc.name       : testTypedArrayPrototypeEntries0002
     * @tc.desc       : Test the function of the interface TypedArray.prototype.entries().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeEntries0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeEntries0002";
      try {
        let arr = new Int8Array([10, 20, 30]);
        let eArr = arr.entries();
        expect(JSON.stringify(eArr.next().value)).assertEqual("[0,10]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[1,20]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[2,30]");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6900
     * @tc.name       : testTypedArrayPrototypeEntries0003
     * @tc.desc       : Test the function of the interface TypedArray.prototype.entries().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeEntries0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeEntries0003";
      try {
        let arr = new Uint8ClampedArray([10, 20, 30]);
        let eArr = arr.entries();
        expect(JSON.stringify(eArr.next().value)).assertEqual("[0,10]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[1,20]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[2,30]");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_7000
     * @tc.name       : testTypedArrayPrototypeEntries0004
     * @tc.desc       : Test the function of the interface TypedArray.prototype.entries().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeEntries0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeEntries0004";
      try {
        let arr = new Int16Array([10, 20, 30]);
        let eArr = arr.entries();
        expect(JSON.stringify(eArr.next().value)).assertEqual("[0,10]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[1,20]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[2,30]");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_7100
     * @tc.name       : testTypedArrayPrototypeEntries0005
     * @tc.desc       : Test the function of the interface TypedArray.prototype.entries().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeEntries0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeEntries0005";
      try {
        let arr = new Uint16Array([10, 20, 30]);
        let eArr = arr.entries();
        expect(JSON.stringify(eArr.next().value)).assertEqual("[0,10]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[1,20]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[2,30]");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_7200
     * @tc.name       : testTypedArrayPrototypeEntries0006
     * @tc.desc       : Test the function of the interface TypedArray.prototype.entries().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeEntries0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeEntries0006";
      try {
        let arr = new Int32Array([10, 20, 30]);
        let eArr = arr.entries();
        expect(JSON.stringify(eArr.next().value)).assertEqual("[0,10]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[1,20]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[2,30]");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_7300
     * @tc.name       : testTypedArrayPrototypeEntries0007
     * @tc.desc       : Test the function of the interface TypedArray.prototype.entries().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeEntries0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeEntries0007";
      try {
        let arr = new Uint32Array([10, 20, 30]);
        let eArr = arr.entries();
        expect(JSON.stringify(eArr.next().value)).assertEqual("[0,10]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[1,20]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[2,30]");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_7400
     * @tc.name       : testTypedArrayPrototypeEntries0008
     * @tc.desc       : Test the function of the interface TypedArray.prototype.entries().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeEntries0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeEntries0008";
      try {
        let arr = new Float32Array([10, 20, 30]);
        let eArr = arr.entries();
        expect(JSON.stringify(eArr.next().value)).assertEqual("[0,10]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[1,20]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[2,30]");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_7500
     * @tc.name       : testTypedArrayPrototypeEntries0009
     * @tc.desc       : Test the function of the interface TypedArray.prototype.entries().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeEntries0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeEntries0009";
      try {
        let arr = new Float64Array([10, 20, 30]);
        let eArr = arr.entries();
        expect(JSON.stringify(eArr.next().value)).assertEqual("[0,10]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[1,20]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[2,30]");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_7600
     * @tc.name       : testTypedArrayPrototypeEntries0010
     * @tc.desc       : Test the function of the interface TypedArray.prototype.entries().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeEntries0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeEntries0010";
      try {
        let arr = new BigInt64Array([10n, 20n, 30n]);
        let eArr = arr.entries();
        let arr1: bigint = eArr.next().value
        let arr2: bigint = eArr.next().value
        let arr3: bigint = eArr.next().value
        expect(arr1.toString()).assertEqual([0, 10n].toString())
        expect(arr2.toString()).assertEqual([1, 20n].toString())
        expect(arr3.toString()).assertEqual([2, 30n].toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_7700
     * @tc.name       : testTypedArrayPrototypeEntries0011
     * @tc.desc       : Test the function of the interface TypedArray.prototype.entries().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeEntries0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeEntries0011";
      try {
        let arr = new BigUint64Array([10n, 20n, 30n]);
        let eArr = arr.entries();
        let arr1: bigint = eArr.next().value
        let arr2: bigint = eArr.next().value
        let arr3: bigint = eArr.next().value
        expect(arr1.toString()).assertEqual([0, 10n].toString())
        expect(arr2.toString()).assertEqual([1, 20n].toString())
        expect(arr3.toString()).assertEqual([2, 30n].toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_7800
     * @tc.name       : testTypedArrayPrototypeFill0001
     * @tc.desc       : Test the function of the interface TypedArray.prototype.fill().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFill0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeFill0001";
      try {
        let array = [1, 2, 3];
        let value = new Uint8Array(array).fill(4);
        expect(JSON.stringify(value)).assertEqual("{\"0\":4,\"1\":4,\"2\":4}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_7900
     * @tc.name       : testTypedArrayPrototypeFill0002
     * @tc.desc       : Test the function of the interface TypedArray.prototype.fill().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFill0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeFill0002";
      try {
        let array = [1, 2, 3];
        let value = new Uint8Array(array).fill(4, 1);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":4,\"2\":4}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_8000
     * @tc.name       : testTypedArrayPrototypeFill0003
     * @tc.desc       : Test the function of the interface TypedArray.prototype.fill().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFill0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeFill0003";
      try {
        let array = [1, 2, 3];
        let value = new Uint8Array(array).fill(4, 1, 2);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":4,\"2\":3}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_8100
     * @tc.name       : testTypedArrayPrototypeFill0004
     * @tc.desc       : Test the function of the interface TypedArray.prototype.fill().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFill0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeFill0004";
      try {
        let array = [1, 2, 3];
        let value = new Uint8Array(array).fill(4, 1, 1);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":3}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_8200
     * @tc.name       : testTypedArrayPrototypeFill0005
     * @tc.desc       : Test the function of the interface TypedArray.prototype.fill().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFill0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeFill0005";
      try {
        let array = [1, 2, 3];
        let value = new Uint8Array(array).fill(4, -3, -2);
        expect(JSON.stringify(value)).assertEqual("{\"0\":4,\"1\":2,\"2\":3}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_8300
     * @tc.name       : testTypedArrayPrototypeFill0006
     * @tc.desc       : Test the function of the interface TypedArray.prototype.fill().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFill0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeFill0006";
      try {
        let array = [1, 2, 3, 4];
        let value = new Uint8Array(array).fill(1, 2);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":1,\"3\":1}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_8400
     * @tc.name       : testTypedArrayPrototypeFill0007
     * @tc.desc       : Test the function of the interface TypedArray.prototype.fill().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFill0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeFill0007";
      try {
        let array = [1, 2, 3, 4];
        let value = new Uint8Array(array).fill(1, 2);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":1,\"3\":1}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_8500
     * @tc.name       : testTypedArrayPrototypeFill0008
     * @tc.desc       : Test the function of the interface TypedArray.prototype.fill().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFill0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeFill0008";
      try {
        let array = [1, 2, 3, 4];
        let value = new Int8Array(array).fill(1, 2);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":1,\"3\":1}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_8600
     * @tc.name       : testTypedArrayPrototypeFill0009
     * @tc.desc       : Test the function of the interface TypedArray.prototype.fill().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFill0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeFill0009";
      try {
        let array = [1, 2, 3, 4];
        let value = new Int16Array(array).fill(1, 2);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":1,\"3\":1}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_8700
     * @tc.name       : testTypedArrayPrototypeFill0010
     * @tc.desc       : Test the function of the interface TypedArray.prototype.fill().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFill0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeFill0010";
      try {
        let array = [1, 2, 3, 4];
        let value = new Uint16Array(array).fill(1, 2);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":1,\"3\":1}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_8800
     * @tc.name       : testTypedArrayPrototypeFill0011
     * @tc.desc       : Test the function of the interface TypedArray.prototype.fill().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFill0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeFill0011";
      try {
        let array = [1, 2, 3, 4];
        let value = new Int32Array(array).fill(1, 2);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":1,\"3\":1}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_8900
     * @tc.name       : testTypedArrayPrototypeFill0012
     * @tc.desc       : Test the function of the interface TypedArray.prototype.fill().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFill0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeFill0012";
      try {
        let array = [1, 2, 3, 4];
        let value = new Uint32Array(array).fill(1, 2);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":1,\"3\":1}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_9000
     * @tc.name       : testTypedArrayPrototypeFill0013
     * @tc.desc       : Test the function of the interface TypedArray.prototype.fill().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFill0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeFill0013";
      try {
        let array = [1, 2, 3, 4];
        let value = new Float32Array(array).fill(1, 2);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":1,\"3\":1}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_9100
     * @tc.name       : testTypedArrayPrototypeFill0014
     * @tc.desc       : Test the function of the interface TypedArray.prototype.fill().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFill0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeFill0014";
      try {
        let array = [1, 2, 3, 4];
        let value = new Float64Array(array).fill(1, 2);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":1,\"3\":1}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_9200
     * @tc.name       : testTypedArrayPrototypeFill0015
     * @tc.desc       : Test the function of the interface TypedArray.prototype.fill().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFill0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeFill0015";
      try {
        let array = [1n, 2n, 3n, 4n];
        let value = new BigInt64Array(array).fill(1n, 2);
        expect(value.toString()).assertEqual("1,2,1,1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_9300
     * @tc.name       : testTypedArrayPrototypeFill0016
     * @tc.desc       : Test the function of the interface TypedArray.prototype.fill().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFill0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeFill0016";
      try {
        let array = [1n, 2n, 3n, 4n];
        let value = new BigUint64Array(array).fill(1n, 2);
        expect(value.toString()).assertEqual("1,2,1,1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_9400
     * @tc.name       : testTypedArrayPrototypeFilter0001
     * @tc.desc       : Test the function of the interface TypedArray.prototype.filter().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFilter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeFilter0001";
      try {
        let array = [12, 5, 8, 130, 44]
        let value = new Uint8Array(array).filter((elem) => elem >= 10);
        expect(JSON.stringify(value)).assertEqual('{"0":12,"1":130,"2":44}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_9500
     * @tc.name       : testTypedArrayPrototypeFilter0002
     * @tc.desc       : Test the function of the interface TypedArray.prototype.filter().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFilter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeFilter0002";
      try {
        let array = [12, 5, 8, 130, 44]
        let value = new Int8Array(array).filter((elem) => elem <= 10);
        expect(JSON.stringify(value)).assertEqual('{"0":5,"1":8,"2":-126}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_9600
     * @tc.name       : testTypedArrayPrototypeFilter0003
     * @tc.desc       : Test the function of the interface TypedArray.prototype.filter().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFilter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeFilter0003";
      try {
        let array = [12, 5, 8, 130, 44]
        let value = new Uint8ClampedArray(array).filter((elem) => elem == 10);
        expect(JSON.stringify(value)).assertEqual('{}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_9700
     * @tc.name       : testTypedArrayPrototypeFilter0004
     * @tc.desc       : Test the function of the interface TypedArray.prototype.filter().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFilter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeFilter0004";
      try {
        let array = [12, 5, 8, 130, 44]
        let value = new Int16Array(array).filter((elem) => elem <= 10);
        expect(JSON.stringify(value)).assertEqual('{"0":5,"1":8}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_9800
     * @tc.name       : testTypedArrayPrototypeFilter0005
     * @tc.desc       : Test the function of the interface TypedArray.prototype.filter().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFilter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeFilter0005";
      try {
        let array = [12, 5, 8, 130, 44]
        let value = new Uint16Array(array).filter((elem) => elem <= 10);
        expect(JSON.stringify(value)).assertEqual('{"0":5,"1":8}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_9900
     * @tc.name       : testTypedArrayPrototypeFilter0006
     * @tc.desc       : Test the function of the interface TypedArray.prototype.filter().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFilter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeFilter0006";
      try {
        let array = [12, 5, 8, 130, 44]
        let value = new Int32Array(array).filter((elem) => elem <= 10);
        expect(JSON.stringify(value)).assertEqual('{"0":5,"1":8}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_10000
     * @tc.name       : testTypedArrayPrototypeFilter0007
     * @tc.desc       : Test the function of the interface TypedArray.prototype.filter().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFilter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeFilter0007";
      try {
        let array = [12, 5, 8, 130, 44]
        let value = new Uint32Array(array).filter((elem) => elem <= 10);
        expect(JSON.stringify(value)).assertEqual('{"0":5,"1":8}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_10100
     * @tc.name       : testTypedArrayPrototypeFilter0008
     * @tc.desc       : Test the function of the interface TypedArray.prototype.filter().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFilter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeFilter0008";
      try {
        let array = [12, 5, 8, 130, 44]
        let value = new Float32Array(array).filter((elem) => elem <= 10);
        expect(JSON.stringify(value)).assertEqual('{"0":5,"1":8}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_10200
     * @tc.name       : testTypedArrayPrototypeFilter0009
     * @tc.desc       : Test the function of the interface TypedArray.prototype.filter().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFilter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeFilter0009";
      try {
        let array = [12, 5, 8, 130, 44]
        let value = new Float64Array(array).filter((elem) => elem <= 10);
        expect(JSON.stringify(value)).assertEqual('{"0":5,"1":8}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_10300
     * @tc.name       : testTypedArrayPrototypeFilter0010
     * @tc.desc       : Test the function of the interface TypedArray.prototype.filter().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFilter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeFilter0010";
      try {
        let array = [12n, 5n, 8n, 130n, 44n]
        let value = new BigInt64Array(array).filter((elem) => elem <= 10);
        expect(value.toString()).assertEqual('5,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_10400
     * @tc.name       : testTypedArrayPrototypeFilter0011
     * @tc.desc       : Test the function of the interface TypedArray.prototype.filter().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFilter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeFilter0011";
      try {
        let array = [12n, 5n, 8n, 130n, 44n]
        let value = new BigUint64Array(array).filter((elem) => elem <= 10);
        expect(value.toString()).assertEqual('5,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0100
     * @tc.name       : testPrototypeFind0001
     * @tc.desc       : Test the function of the interface PrototypeFind.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeFind0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFind0001"
      try {
        const isNegative = (element: number): boolean => {
          return element < 0;
        }
        const int8 = new Int8Array([10, 0, -10, 20, -30, 40, -50]);
        expect(int8.find(isNegative)).assertEqual(-10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0200
     * @tc.name       : testPrototypeFind0002
     * @tc.desc       : Test the function of the interface PrototypeFind.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeFind0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFind0002"
      try {
        const isPrime = (element: number, index: number, array: Uint8Array): boolean => {
          let start = 2;
          while (start <= Math.sqrt(element)) {
            if (element % start++ < 1) {
              return false;
            }
          }
          return element > 1;
        };
        const uint8 = new Uint8Array([4, 5, 8, 12]);
        expect(uint8.find(isPrime)).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0300
     * @tc.name       : testPrototypeFind0003
     * @tc.desc       : Test the function of the interface PrototypeFind.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeFind0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFind0003"
      try {
        const isNegative = (element: number): boolean => {
          return element < 0;
        }
        const int8 = new Int8Array([10, 0, 10, 20, 30, 40, 50]);
        expect(int8.find(isNegative)).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0400
     * @tc.name       : testPrototypeFind0004
     * @tc.desc       : Test the function of the interface PrototypeFind.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeFind0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFind0004"
      try {
        const isNegative = (element: number): boolean => {
          return element < 0;
        }
        const int8 = new Int8Array([]);
        expect(int8.find(isNegative)).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0500
     * @tc.name       : testPrototypeFind0005
     * @tc.desc       : Test the function of the interface PrototypeFind.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeFind0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFind0005"
      try {
        const isNegative = (element: number): boolean => {
          return element > 0;
        }
        const int8 = new Int8Array([10, 0, -10, 20, -30, 40, -50]);
        expect(int8.find(isNegative)).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0600
     * @tc.name       : testPrototypeFindIndex0001
     * @tc.desc       : Test the function of the interface PrototypeFindIndex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeFindIndex0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFindIndex0001"
      try {
        const isNegative = (element: number): boolean => {
          return element < 0;
        }
        const int8 = new Int8Array([10, 0, -10, 20, -30, 40, -50]);
        expect(int8.findIndex(isNegative)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0700
     * @tc.name       : testPrototypeFindIndex0002
     * @tc.desc       : Test the function of the interface PrototypeFindIndex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeFindIndex0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFindIndex0002"
      try {
        const isPrime = (element: number, index: number, array: Uint8Array): boolean => {
          let start = 2;
          while (start <= Math.sqrt(element)) {
            if (element % start++ < 1) {
              return false;
            }
          }
          return element > 1;
        };
        const uint8 = new Uint8Array([4, 5, 8, 12]);
        expect(uint8.findIndex(isPrime)).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0800
     * @tc.name       : testPrototypeFindIndex0003
     * @tc.desc       : Test the function of the interface PrototypeFindIndex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeFindIndex0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFindIndex0003"
      try {
        const isNegative = (element: number): boolean => {
          return element < 0;
        }
        const int8 = new Int8Array([10, 0, 10, 20, 30, 40, 50]);
        expect(int8.findIndex(isNegative)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0900
     * @tc.name       : testPrototypeFindIndex0004
     * @tc.desc       : Test the function of the interface PrototypeFindIndex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeFindIndex0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFindIndex0004"
      try {
        const isNegative = (element: number): boolean => {
          return element < 0;
        }
        const int8 = new Int8Array([]);
        expect(int8.findIndex(isNegative)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1000
     * @tc.name       : testPrototypeFindIndex0005
     * @tc.desc       : Test the function of the interface PrototypeFindIndex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeFindIndex0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFindIndex0005"
      try {
        const isNegative = (element: number): boolean => {
          return element > 0;
        }
        const int8 = new Int8Array([10, 0, -10, 20, -30, 40, -50]);
        expect(int8.findIndex(isNegative)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1100
     * @tc.name       : testPrototypeFindForEach0001
     * @tc.desc       : Test the function of the interface PrototypeFindForEach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeFindForEach0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFindForEach0001"
      try {
        let uint8: Uint8Array = new Uint8Array([1, 2, 3, 4]);
        let count = 0;
        uint8.forEach((element) => {
          expect(typeof element).assertEqual("number");
          count++;
        })
        expect(count).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1200
     * @tc.name       : testPrototypeFindForEach0002
     * @tc.desc       : Test the function of the interface PrototypeFindForEach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeFindForEach0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFindForEach0002"
      try {
        let uint8: Uint8Array = new Uint8Array([]);
        let count = 0;
        uint8.forEach((element) => {
          expect(typeof element).assertEqual("number");
          count++;
        })
        expect(count).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1300
     * @tc.name       : testPrototypeIncludes0001
     * @tc.desc       : Test the function of the interface PrototypeIncludes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeIncludes0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIncludes0001"
      try {
        const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
        expect(uint8.includes(20)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1400
     * @tc.name       : testPrototypeIncludes0002
     * @tc.desc       : Test the function of the interface PrototypeIncludes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeIncludes0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIncludes0002"
      try {
        const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
        expect(uint8.includes(20, 1)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1500
     * @tc.name       : testPrototypeIncludes0003
     * @tc.desc       : Test the function of the interface PrototypeIncludes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeIncludes0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIncludes0003"
      try {
        const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
        expect(uint8.includes(20, 3)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1600
     * @tc.name       : testPrototypeIncludes0004
     * @tc.desc       : Test the function of the interface PrototypeIncludes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeIncludes0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIncludes0004"
      try {
        const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
        expect(uint8.includes(0)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1700
     * @tc.name       : testPrototypeIncludes0005
     * @tc.desc       : Test the function of the interface PrototypeIncludes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeIncludes0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIncludes0005"
      try {
        const uint8 = new Uint8Array([NaN]);
        expect(uint8.includes(0)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1800
     * @tc.name       : testPrototypeIncludes0006
     * @tc.desc       : Test the function of the interface PrototypeIncludes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeIncludes0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIncludes0006"
      try {
        const uint8 = new Uint8Array([NaN]);
        expect(uint8.includes(NaN)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1900
     * @tc.name       : testPrototypeIncludes0007
     * @tc.desc       : Test the function of the interface PrototypeIncludes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeIncludes0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIncludes0007"
      try {
        const uint8 = new Float32Array([NaN]);
        expect(uint8.includes(NaN)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2000
     * @tc.name       : testPrototypeIncludes0008
     * @tc.desc       : Test the function of the interface PrototypeIncludes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeIncludes0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIncludes0008"
      try {
        const uint8 = new Float32Array([NaN]);
        expect(uint8.includes(0)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2100
     * @tc.name       : testPrototypeIndexOf0001
     * @tc.desc       : Test the function of the interface PrototypeIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeIndexOf0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIndexOf0001"
      try {
        const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
        expect(uint8.indexOf(50)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2200
     * @tc.name       : testPrototypeIndexOf0002
     * @tc.desc       : Test the function of the interface PrototypeIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeIndexOf0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIndexOf0002"
      try {
        const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
        expect(uint8.indexOf(20, 3)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2300
     * @tc.name       : testPrototypeIndexOf0003
     * @tc.desc       : Test the function of the interface PrototypeIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeIndexOf0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIndexOf0003"
      try {
        const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
        expect(uint8.indexOf(51)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2400
     * @tc.name       : testPrototypeIndexOf0004
     * @tc.desc       : Test the function of the interface PrototypeIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeIndexOf0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIndexOf0004"
      try {
        const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
        expect(uint8.indexOf(30, 1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2500
     * @tc.name       : testPrototypeIndexOf0005
     * @tc.desc       : Test the function of the interface PrototypeIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeIndexOf0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIndexOf0005"
      try {
        const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
        expect(uint8.indexOf(20, -1)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2600
     * @tc.name       : testPrototypeIndexOf0006
     * @tc.desc       : Test the function of the interface PrototypeIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeIndexOf0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIndexOf0006"
      try {
        const uint8 = new Uint8Array([]);
        expect(uint8.indexOf(30, 1)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2700
     * @tc.name       : testPrototypeIndexOf0007
     * @tc.desc       : Test the function of the interface PrototypeIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeIndexOf0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIndexOf0007"
      try {
        const uint8 = new Uint8Array([]);
        expect(uint8.indexOf(20, -1)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2800
     * @tc.name       : testPrototypeIndexOf0008
     * @tc.desc       : Test the function of the interface PrototypeIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeIndexOf0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIndexOf0008"
      try {
        const uint8 = new Uint8Array([]);
        expect(uint8.indexOf(51)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2900
     * @tc.name       : testPrototypeJoin0001
     * @tc.desc       : Test the function of the interface PrototypeJoin.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeJoin0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeJoin0001"
      try {
        const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
        expect(uint8.join()).assertEqual("10,20,30,40,50");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3000
     * @tc.name       : testPrototypeJoin0002
     * @tc.desc       : Test the function of the interface PrototypeJoin.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeJoin0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeJoin0002"
      try {
        const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
        expect(uint8.join('')).assertEqual("1020304050");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3100
     * @tc.name       : testPrototypeJoin0003
     * @tc.desc       : Test the function of the interface PrototypeJoin.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeJoin0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeJoin0003"
      try {
        const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
        expect(uint8.join('-')).assertEqual("10-20-30-40-50");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3200
     * @tc.name       : testPrototypeJoin0004
     * @tc.desc       : Test the function of the interface PrototypeJoin.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeJoin0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeJoin0004"
      try {
        const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
        expect(uint8.join(" / ")).assertEqual('10 / 20 / 30 / 40 / 50');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3300
     * @tc.name       : testPrototypeKeys0001
     * @tc.desc       : Test the function of the interface PrototypeKeys.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeKeys0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeKeys0001"
      try {
        const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
        expect(uint8.keys().next().value).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3400
     * @tc.name       : testPrototypeKeys0002
     * @tc.desc       : Test the function of the interface PrototypeKeys.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeKeys0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeKeys0002"
      try {
        const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
        const keys = uint8.keys();
        keys.next();
        expect(keys.next().value).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3500
     * @tc.name       : testPrototypeKeys0003
     * @tc.desc       : Test the function of the interface PrototypeKeys.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeKeys0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeKeys0003"
      try {
        const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
        const keys = uint8.keys();
        keys.next();
        keys.next();
        expect(keys.next().value).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3600
     * @tc.name       : testPrototypeLastIndexOf0001
     * @tc.desc       : Test the function of the interface PrototypeLastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeLastIndexOf0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeLastIndexOf0001"
      try {
        const uint8 = new Uint8Array([10, 20, 50, 50, 50, 60]);
        expect(uint8.lastIndexOf(50, 5)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3700
     * @tc.name       : testPrototypeLastIndexOf0002
     * @tc.desc       : Test the function of the interface PrototypeLastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeLastIndexOf0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeLastIndexOf0002"
      try {
        const uint8 = new Uint8Array([10, 20, 50, 50, 50, 60]);
        expect(uint8.lastIndexOf(50, 3)).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3800
     * @tc.name       : testPrototypeLastIndexOf0003
     * @tc.desc       : Test the function of the interface PrototypeLastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeLastIndexOf0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeLastIndexOf0003"
      try {
        const uint8 = new Uint8Array([10, 20, 50, 50, 50, 60]);
        expect(uint8.lastIndexOf(50)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3900
     * @tc.name       : testPrototypeLastIndexOf0004
     * @tc.desc       : Test the function of the interface PrototypeLastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeLastIndexOf0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeLastIndexOf0004"
      try {
        const uint8 = new Uint8Array([10, 20, 50, 50, 50, 60]);
        expect(uint8.lastIndexOf(51)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4000
     * @tc.name       : testPrototypeLastIndexOf0005
     * @tc.desc       : Test the function of the interface PrototypeLastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeLastIndexOf0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeLastIndexOf0005"
      try {
        const uint8 = new Uint8Array([2, 5, 9, 2]);
        expect(uint8.lastIndexOf(2)).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4100
     * @tc.name       : testPrototypeLastIndexOf0006
     * @tc.desc       : Test the function of the interface PrototypeLastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeLastIndexOf0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeLastIndexOf0006"
      try {
        const uint8 = new Uint8Array([2, 5, 9, 2]);
        expect(uint8.lastIndexOf(7)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4200
     * @tc.name       : testPrototypeLastIndexOf0007
     * @tc.desc       : Test the function of the interface PrototypeLastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeLastIndexOf0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeLastIndexOf0007"
      try {
        const uint8 = new Uint8Array([2, 5, 9, 2]);
        expect(uint8.lastIndexOf(2, 3)).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4300
     * @tc.name       : testPrototypeLastIndexOf0008
     * @tc.desc       : Test the function of the interface PrototypeLastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeLastIndexOf0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeLastIndexOf0008"
      try {
        const uint8 = new Uint8Array([2, 5, 9, 2]);
        expect(uint8.lastIndexOf(2, 2)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4400
     * @tc.name       : testPrototypeLastIndexOf0009
     * @tc.desc       : Test the function of the interface PrototypeLastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeLastIndexOf0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeLastIndexOf0009"
      try {
        const uint8 = new Uint8Array([2, 5, 9, 2]);
        expect(uint8.lastIndexOf(2, -2)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4500
     * @tc.name       : testPrototypeLastIndexOf0010
     * @tc.desc       : Test the function of the interface PrototypeLastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeLastIndexOf0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeLastIndexOf0010"
      try {
        const uint8 = new Uint8Array([2, 5, 9, 2]);
        expect(uint8.lastIndexOf(2, -1)).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4600
     * @tc.name       : testPrototypeMap0001
     * @tc.desc       : Test the function of the interface PrototypeMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeMap0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeMap0001"
      try {
        const uint8 = new Uint8Array([25, 36, 49]);
        expect(uint8.map(Math.sqrt).toString()).assertEqual("5,6,7");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4700
     * @tc.name       : testPrototypeMap0002
     * @tc.desc       : Test the function of the interface PrototypeMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeMap0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeMap0002"
      try {
        const numbers = new Uint8Array([1, 4, 9]);
        const doubles = numbers.map((num) => num * 2);
        expect(doubles.join()).assertEqual([2, 8, 18].join());
        expect(numbers.join()).assertEqual([1, 4, 9].join());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4800
     * @tc.name       : testPrototypeReduce0001
     * @tc.desc       : Test the function of the interface PrototypeReduce.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeReduce0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeReduce0001"
      try {
        const uint8 = new Uint8Array([0, 1, 2, 3]);
        const sum = (accumulator: number, currentValue: number): number => {
          return accumulator + currentValue;
        };
        expect(uint8.reduce(sum)).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4900
     * @tc.name       : testPrototypeReduce0002
     * @tc.desc       : Test the function of the interface PrototypeReduce.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeReduce0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeReduce0002"
      try {
        const total = new Uint8Array([0, 1, 2, 3]).reduce((a, b) => a + b);
        expect(total).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5000
     * @tc.name       : testPrototypeReduceRight0001
     * @tc.desc       : Test the function of the interface PrototypeReduceRight.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeReduceRight0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeReduceRight0001";
      try {
        const uint8 = new Uint8Array([10, 20, 30]);
        const result = uint8.reduceRight(
          (accumulator: string, currentValue: number) => `${accumulator},${currentValue}`, // 去掉空格
          ''
        );
        const finalResult = result.replace(/^,/, '').trim();
        expect(finalResult).assertEqual("30,20,10");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5100
     * @tc.name       : testPrototypeReduceRight0002
     * @tc.desc       : Test the function of the interface PrototypeReduceRight.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeReduceRight0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeReduceRight0002"
      try {
        const total = new Uint8Array([0, 1, 2, 3]).reduceRight((a, b) => a + b);
        expect(total).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5200
     * @tc.name       : testPrototypeReverse0001
     * @tc.desc       : Test the function of the interface PrototypeReverse.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeReverse0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeReverse0001"
      try {
        const uint8 = new Uint8Array([1, 2, 3]);
        expect(uint8.reverse().toString()).assertEqual("3,2,1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5300
     * @tc.name       : testPrototypeSet0001
     * @tc.desc       : Test the function of the interface PrototypeSet.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeSet0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSet0001"
      try {
        const buffer = new ArrayBuffer(8);
        const uint8 = new Uint8Array(buffer);
        uint8.set([1, 2, 3], 3);
        let value = Array.from(uint8).toString();
        expect(value).assertEqual("0,0,0,1,2,3,0,0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5400
     * @tc.name       : testPrototypeSlice0001
     * @tc.desc       : Test the function of the interface PrototypeSlice.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeSlice0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0001"
      try {
        const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
        const slicedArray = Array.from(uint8.slice(1, 3));
        expect(JSON.stringify(slicedArray)).assertEqual(JSON.stringify([20, 30]));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5500
     * @tc.name       : testPrototypeSlice0002
     * @tc.desc       : Test the function of the interface PrototypeSlice.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeSlice0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0002"
      try {
        const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
        expect(uint8.slice().toString()).assertEqual("10,20,30,40,50");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5600
     * @tc.name       : testPrototypeSlice0003
     * @tc.desc       : Test the function of the interface PrototypeSlice.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeSlice0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0003"
      try {
        const uint8 = new Uint8Array([1, 2, 3]);
        const slicedArray = Array.from(uint8.slice(1));
        expect(JSON.stringify(slicedArray)).assertEqual(JSON.stringify([2, 3]));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5700
     * @tc.name       : testPrototypeSlice0004
     * @tc.desc       : Test the function of the interface PrototypeSlice.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeSlice0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0004"
      try {
        const uint8 = new Uint8Array([1, 2, 3]);
        const slicedArray = Array.from(uint8.slice(2))
        expect(JSON.stringify(slicedArray)).assertEqual(JSON.stringify([3]));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5800
     * @tc.name       : testPrototypeSlice0005
     * @tc.desc       : Test the function of the interface PrototypeSlice.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeSlice0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0005"
      try {
        const uint8 = new Uint8Array([1, 2, 3]);
        const sliceArray = Array.from(uint8.slice(-2))
        expect(JSON.stringify(sliceArray)).assertEqual(JSON.stringify([2, 3]));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5900
     * @tc.name       : testPrototypeSlice0006
     * @tc.desc       : Test the function of the interface PrototypeSlice.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeSlice0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0006"
      try {
        const uint8 = new Uint8Array([1, 2, 3]);
        const sliceArray = Array.from(uint8.slice(0, 1))
        expect(JSON.stringify(sliceArray)).assertEqual(JSON.stringify([1]));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6000
     * @tc.name       : testPrototypeSome0001
     * @tc.desc       : Test the function of the interface PrototypeSome.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeSome0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSome0001"
      try {
        const isNegative = (element: number, index: number, array: Int8Array): boolean => {
          return element < 0;
        };
        const int8 = new Int8Array([-10, 20, -30, 40, -50]);
        expect(int8.some(isNegative)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6100
     * @tc.name       : testPrototypeSome0002
     * @tc.desc       : Test the function of the interface PrototypeSome.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeSome0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSome0002"
      try {
        const isNegative = (element: number, index: number, array: Int8Array): boolean => {
          return element < 0;
        };
        const positives = new Int8Array([10, 20, 30, 40, 50]);
        expect(positives.some(isNegative)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6200
     * @tc.name       : testPrototypeSome0003
     * @tc.desc       : Test the function of the interface PrototypeSome.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeSome0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSome0003"
      try {
        const isBiggerThan10 = (element: number): boolean => {
          return element > 10;
        };
        const result = new Uint8Array([2, 5, 8, 1, 4]).some(isBiggerThan10);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6300
     * @tc.name       : testPrototypeSome0004
     * @tc.desc       : Test the function of the interface PrototypeSome.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeSome0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSome0004"
      try {
        const isBiggerThan10 = (element: number): boolean => {
          return element > 10;
        };
        expect(new Uint8Array([12, 5, 8, 1, 4]).some(isBiggerThan10)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6400
     * @tc.name       : testPrototypeSort0001
     * @tc.desc       : Test the function of the interface PrototypeSort.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeSort0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSort0001"
      try {
        const uint8 = new Uint8Array([40, 10, 50, 20, 30]);
        uint8.sort()
        const array = Array.from(uint8)
        expect(JSON.stringify(array)).assertEqual(JSON.stringify([10, 20, 30, 40, 50]));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6500
     * @tc.name       : testPrototypeSort0002
     * @tc.desc       : Test the function of the interface PrototypeSort.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeSort0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSort0002"
      try {
        let numbers = new Uint8Array([40, 1, 5, 200]);
        numbers.sort()
        const array = Array.from(numbers)
        expect(JSON.stringify(array)).assertEqual(JSON.stringify([1, 5, 40, 200]));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6600
     * @tc.name       : testPrototypeSort0003
     * @tc.desc       : Test the function of the interface PrototypeSort.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeSort0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSort0003"
      try {
        let numbers = [40, 1, 5, 200];
        numbers.sort()
        const array = Array.from(numbers)
        expect(JSON.stringify(array)).assertEqual(JSON.stringify([1, 200, 40, 5]));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6700
     * @tc.name       : testPrototypeSort0004
     * @tc.desc       : Test the function of the interface PrototypeSort.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeSort0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSort0004"
      try {
        let numbers = [40, 1, 5, 200];
        numbers.sort((a, b) => a - b)
        expect(JSON.stringify(Array.from(numbers))).assertEqual(JSON.stringify([1, 5, 40, 200]));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6800
     * @tc.name       : testPrototypeSubarray0001
     * @tc.desc       : Test the function of the interface PrototypeSubarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeSubarray0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSubarray0001"
      try {
        const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
        const value = Array.from(uint8.subarray(1, 3))
        expect(JSON.stringify(value)).assertEqual(JSON.stringify([20, 30]));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6900
     * @tc.name       : testPrototypeSubarray0002
     * @tc.desc       : Test the function of the interface PrototypeSubarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeSubarray0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSubarray0002"
      try {
        const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
        const value = uint8.subarray(1).toString();
        expect(value).assertEqual("20,30,40,50");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_7000
     * @tc.name       : testPrototypeSubarray0003
     * @tc.desc       : Test the function of the interface PrototypeSubarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeSubarray0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSubarray0003"
      try {
        const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
        const value = uint8.subarray().toString()

        expect(value).assertEqual("10,20,30,40,50");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_7100
     * @tc.name       : testPrototypeSubarray0004
     * @tc.desc       : Test the function of the interface PrototypeSubarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeSubarray0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSubarray0004"
      try {
        const buffer = new ArrayBuffer(8);
        const uint8 = new Uint8Array(buffer);
        uint8.set([1, 2, 3])
        const resultArray = Array.from(uint8)
        expect(JSON.stringify(resultArray)).assertEqual(JSON.stringify([1, 2, 3, 0, 0, 0, 0, 0]));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_7200
     * @tc.name       : testPrototypeSubarray0005
     * @tc.desc       : Test the function of the interface PrototypeSubarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testPrototypeSubarray0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSubarray0005"
      try {
        const buffer = new ArrayBuffer(8);
        const uint8 = new Uint8Array(buffer);
        uint8.set([1, 2, 3])
        const subarray = uint8.subarray(0, 4)
        expect(JSON.stringify(Array.from(subarray))).assertEqual(JSON.stringify([1, 2, 3, 0]));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0100
     * @tc.name       : testTypedArrayPrototypeSymbolIterator0001
     * @tc.desc       : Test the function of the interface TypedArray.prototype[Symbol.iterator]().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeSymbolIterator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeSymbolIterator0001";
      try {
        const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
        const iterator1 = uint8[Symbol.iterator]();
        let index = 0;
        let isEqual = true;
        for (const value of iterator1) {
          expect(value).assertEqual(uint8[index]);
          if (value !== uint8[index]) {
            isEqual = false;
          }
          index++;
        }
        expect(isEqual).assertDeepEquals(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0200
     * @tc.name       : testTypedArrayPrototypeSymbolIterator0002
     * @tc.desc       : Test the function of the interface TypedArray.prototype[Symbol.iterator]().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeSymbolIterator0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeSymbolIterator0002";
      try {
        const arr = new Uint8Array([10, 20, 30, 40, 50]);
        expect(arr).assertDeepEquals(new Uint8Array([10, 20, 30, 40, 50]));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0300
     * @tc.name       : testTypedArrayPrototypeSymbolIterator0003
     * @tc.desc       : Test the function of the interface TypedArray.prototype[Symbol.iterator]().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeSymbolIterator0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeSymbolIterator0003";
      try {
        const arr = new Uint8Array([10, 20, 30, 40, 50]);
        const arrIter = arr[Symbol.iterator]();
        expect(arrIter.next().value).assertEqual(10)
        expect(arrIter.next().value).assertEqual(20)
        expect(arrIter.next().value).assertEqual(30)
        expect(arrIter.next().value).assertEqual(40)
        expect(arrIter.next().value).assertEqual(50);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0400
     * @tc.name       : testTypedArrayPrototypeSymbolIterator0004
     * @tc.desc       : Test the function of the interface TypedArray.prototype[Symbol.iterator]().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeSymbolIterator0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeSymbolIterator0004";
      try {
        const arr = new Uint8Array([]);
        const arrIter = arr[Symbol.iterator]();
        expect(arrIter.next().value).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0500
     * @tc.name       : testTypedArrayPrototypeToLocaleString0001
     * @tc.desc       : Test the function of the interface TypedArray.prototype.toLocaleString().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeToLocaleString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeToLocaleString0001";
      try {
        const uint8 = new Uint32Array([500, 8123, 12]);
        let value = uint8.toLocaleString()
        expect(value).assertEqual("500,8,123,12");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0600
     * @tc.name       : testTypedArrayPrototypeToLocaleString0002
     * @tc.desc       : Test the function of the interface TypedArray.prototype.toLocaleString().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeToLocaleString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeToLocaleString0002";
      try {
        const uint = new Uint32Array([]);
        let value = uint.toLocaleString()
        expect(value).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0700
     * @tc.name       : testTypedArrayPrototypeToString0001
     * @tc.desc       : Test the function of the interface TypedArray.prototype.toString().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeToString0001";
      try {
        const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
        let value = uint8.toString()
        expect(value).assertEqual("10,20,30,40,50");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0800
     * @tc.name       : testTypedArrayPrototypeToString0002
     * @tc.desc       : Test the function of the interface TypedArray.prototype.toString().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeToString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeToString0002";
      try {
        const uint8 = new Uint8Array([]);
        let value = uint8.toString()
        expect(value).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0900
     * @tc.name       : testTypedArrayPrototypeValues0001
     * @tc.desc       : Test the function of the interface TypedArray.prototype.values().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeValues0001";
      try {
        const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
        let uint8Value = uint8.values();
        expect(uint8Value.next().value).assertEqual(10)
        expect(uint8Value.next().value).assertEqual(20)
        expect(uint8Value.next().value).assertEqual(30)
        expect(uint8Value.next().value).assertEqual(40)
        expect(uint8Value.next().value).assertEqual(50);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1000
     * @tc.name       : testTypedArrayPrototypeValues0002
     * @tc.desc       : Test the function of the interface TypedArray.prototype.values().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeValues0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeValues0002";
      try {
        const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
        let uint8Value = uint8.values();
        let index = 0;
        let isEqual = true;
        for (const value of uint8Value) {
          expect(value).assertEqual(uint8[index]);
          if (value !== uint8[index]) {
            isEqual = false;
          }
          index++;
        }
        expect(isEqual).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1100
     * @tc.name       : testTypedArrayPrototypeValues0003
     * @tc.desc       : Test the function of the interface TypedArray.prototype.values().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeValues0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTypedArrayPrototypeValues0003";
      try {
        const uint8 = new Uint8Array([]);
        let uint8Value = uint8.values();
        expect(uint8Value.next().value).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
  })
}