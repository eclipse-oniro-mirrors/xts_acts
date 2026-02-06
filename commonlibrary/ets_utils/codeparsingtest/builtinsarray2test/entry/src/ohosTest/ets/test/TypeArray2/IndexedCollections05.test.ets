/*
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { sleep } from '../../testability/pages/Utils';

function test41(...args: number[]) {
  const arr41 = Array.from(args);
  console.log("41. Convert arguments: Is it an array?=" + Array.isArray(arr41) + ", Content=" + arr41);
  return arr41;
}

class ArrayLike {
  public length: number;
  public zero: number;
  public one: number;
  public two: number;

  constructor(length: number, zero: number, one: number, two: number) {
    this.length = length;
    this.zero = zero;
    this.one = one;
    this.two = two;
  }

  public toArray(): number[] {
    return [this.zero, this.one, this.two];
  }
}

function customSlice(arrayLike: ArrayLike): number[] {
  const result: number[] = [];
  for (let i = 0; i < arrayLike.length; i++) {
    switch (i) {
      case 0:
        result.push(arrayLike.zero);
        break;
      case 1:
        result.push(arrayLike.one);
        break;
      case 2:
        result.push(arrayLike.two);
        break;
    }
  }
  return result;
}

export default function IndexedCollections05Test() {
  describe('IndexedCollections05Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async() => {
      await sleep(30);
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
     * @tc.number    SUB_TYPEDARRAY_FLOAT64_OUT_OF_BOUNDS_WRITE_0056
     * @tc.name      test_TypedArray_Float64OutOfBoundsWrite_0056
     * @tc.desc      Test writing out-of-bounds index in Float64Array (no effect)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Float64OutOfBoundsWrite_0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Float64OutOfBoundsWrite_0056 start');
        const arr56: Float64Array = new Float64Array(1);
        arr56[0] = 5.5;
        arr56[3] = 9.9;
        let result: boolean = arr56.length === 1 && arr56[3] === undefined;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Float64OutOfBoundsWrite_0056 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT8_NEGATIVE_INDEX_READ_0057
     * @tc.name      test_TypedArray_Int8NegativeIndexRead_0057
     * @tc.desc      Test reading negative index in Int8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int8NegativeIndexRead_0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int8NegativeIndexRead_0057 start');
        const arr57: Int8Array = new Int8Array(3);
        arr57[0] = 10;
        arr57[1] = 20;
        let result: boolean = arr57[-1] === undefined;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int8NegativeIndexRead_0057 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT32_NEGATIVE_INDEX_READ_0058
     * @tc.name      test_TypedArray_Uint32NegativeIndexRead_0058
     * @tc.desc      Test reading negative index in Uint32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint32NegativeIndexRead_0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint32NegativeIndexRead_0058 start');
        const arr58: Uint32Array = new Uint32Array(2);
        arr58[0] = 1000;
        let result: boolean = arr58[-2] === undefined;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint32NegativeIndexRead_0058 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_FLOAT32_NEGATIVE_INDEX_READ_0059
     * @tc.name      test_TypedArray_Float32NegativeIndexRead_0059
     * @tc.desc      Test reading negative index in Float32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Float32NegativeIndexRead_0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Float32NegativeIndexRead_0059 start');
        const arr59: Float32Array = new Float32Array(4);
        arr59[3] = 7.7;
        let result: boolean = arr59[-1] === undefined;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Float32NegativeIndexRead_0059 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT16_NEGATIVE_INDEX_WRITE_0060
     * @tc.name      test_TypedArray_Int16NegativeIndexWrite_0060
     * @tc.desc      Test writing negative index in Int16Array (no effect)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int16NegativeIndexWrite_0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int16NegativeIndexWrite_0060 start');
        const arr60: Int16Array = new Int16Array(2);
        arr60[0] = 500;
        arr60[-1] = 1000;
        let result: boolean = arr60[-1] === undefined;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int16NegativeIndexWrite_0060 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_EMPTY_ARRAY_OUT_OF_BOUNDS_ACCESS_0061
     * @tc.name      test_TypedArray_EmptyArrayOutOfBoundsAccess_0061
     * @tc.desc      Test out-of-bounds access in an empty Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_EmptyArrayOutOfBoundsAccess_0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_EmptyArrayOutOfBoundsAccess_0061 start');
        const arr61: Uint8Array = new Uint8Array(0);
        let result: boolean = arr61[0] === undefined;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_EmptyArrayOutOfBoundsAccess_0061 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SINGLE_ELEMENT_OUT_OF_BOUNDS_ACCESS_0062
     * @tc.name      test_TypedArray_SingleElementOutOfBoundsAccess_0062
     * @tc.desc      Test out-of-bounds access in a single-element Int32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SingleElementOutOfBoundsAccess_0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SingleElementOutOfBoundsAccess_0062 start');
        const arr62: Int32Array = new Int32Array(1);
        arr62[0] = 123;
        let result: boolean = arr62[1] === undefined;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SingleElementOutOfBoundsAccess_0062 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_OFFSET_VIEW_OUT_OF_BOUNDS_ACCESS_0063
     * @tc.name      test_TypedArray_OffsetViewOutOfBoundsAccess_0063
     * @tc.desc      Test out-of-bounds access in an offset view
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_OffsetViewOutOfBoundsAccess_0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_OffsetViewOutOfBoundsAccess_0063 start');
        const buffer63: ArrayBuffer = new ArrayBuffer(8);
        const arr63: Int16Array = new Int16Array(buffer63, 2, 3);
        let result: boolean = arr63[3] === undefined;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_OffsetViewOutOfBoundsAccess_0063 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_OUT_OF_BOUNDS_ACCESS_LENGTH_UNCHANGED_0064
     * @tc.name      test_TypedArray_OutOfBoundsAccessLengthUnchanged_0064
     * @tc.desc      Test that out-of-bounds access does not change the array length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_OutOfBoundsAccessLengthUnchanged_0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_OutOfBoundsAccessLengthUnchanged_0064 start');
        const arr64: Uint16Array = new Uint16Array(2);
        const originalLength: number = arr64.length;
        const temp = arr64[10];
        let result: boolean = arr64.length === originalLength;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_OutOfBoundsAccessLengthUnchanged_0064 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_OUT_OF_BOUNDS_ASSIGNMENT_LENGTH_UNCHANGED_0065
     * @tc.name      test_TypedArray_OutOfBoundsAssignmentLengthUnchanged_0065
     * @tc.desc      Test that out-of-bounds assignment does not change the array length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_OutOfBoundsAssignmentLengthUnchanged_0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_OutOfBoundsAssignmentLengthUnchanged_0065 start');
        const arr65: Float32Array = new Float32Array(3);
        const originalLength: number = arr65.length;
        arr65[5] = 10.5;
        let result: boolean = arr65.length === originalLength;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_OutOfBoundsAssignmentLengthUnchanged_0065 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_MAX_INDEX_ACCESS_0066
     * @tc.name      test_TypedArray_MaxIndexAccess_0066
     * @tc.desc      Test accessing the maximum valid index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_MaxIndexAccess_0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_MaxIndexAccess_0066 start');
        const arr66: Int8Array = new Int8Array(5);
        arr66[4] = 99;
        let result: boolean = arr66[4] === 99;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_MaxIndexAccess_0066 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_MAX_INDEX_PLUS_ONE_ACCESS_0067
     * @tc.name      test_TypedArray_MaxIndexPlusOneAccess_0067
     * @tc.desc      Test accessing one past the maximum valid index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_MaxIndexPlusOneAccess_0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_MaxIndexPlusOneAccess_0067 start');
        const arr67: Uint32Array = new Uint32Array(5);
        let result: boolean = arr67[5] === undefined;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_MaxIndexPlusOneAccess_0067 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_LARGE_OUT_OF_BOUNDS_ACCESS_0068
     * @tc.name      test_TypedArray_LargeOutOfBoundsAccess_0068
     * @tc.desc      Test accessing a very large out-of-bounds index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_LargeOutOfBoundsAccess_0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_LargeOutOfBoundsAccess_0068 start');
        const arr68: Float64Array = new Float64Array(2);
        let result: boolean = arr68[1000000] === undefined;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_LargeOutOfBoundsAccess_0068 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_NEGATIVE_LARGE_INDEX_ACCESS_0069
     * @tc.name      test_TypedArray_NegativeLargeIndexAccess_0069
     * @tc.desc      Test accessing a very large negative index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_NegativeLargeIndexAccess_0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_NegativeLargeIndexAccess_0069 start');
        const arr69: Int16Array = new Int16Array(3);
        let result: boolean = arr69[-1000] === undefined;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_NegativeLargeIndexAccess_0069 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_OUT_OF_BOUNDS_ACCESS_NORMAL_VALUES_UNCHANGED_0070
     * @tc.name      test_TypedArray_OutOfBoundsAccessNormalValuesUnchanged_0070
     * @tc.desc      Test that out-of-bounds access does not change normal index values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_OutOfBoundsAccessNormalValuesUnchanged_0070",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_OutOfBoundsAccessNormalValuesUnchanged_0070 start');
        const arr70: Uint8Array = new Uint8Array(2);
        arr70[0] = 10;
        arr70[1] = 20;
        const temp = arr70[5];
        let result: boolean = arr70[0] === 10 && arr70[1] === 20;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_OutOfBoundsAccessNormalValuesUnchanged_0070 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_READONLY_INT8_ASSIGNMENT_ERROR_0071
     * @tc.name      test_TypedArray_ReadOnlyInt8AssignmentError_0071
     * @tc.desc      Test that assignment to a read-only Int8Array view throws an error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_ReadOnlyInt8AssignmentError_0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_ReadOnlyInt8AssignmentError_0071 start');
        const buffer71: ArrayBuffer = new ArrayBuffer(4);
        const view71: Int8Array = new Int8Array(buffer71);
        const readOnlyView71: Int8Array = view71.slice();

        class ReadOnlyInt8Array {
          private _array: Int8Array;

          constructor(array: Int8Array) {
            this._array = array;
          }

          get length(): number {
            return this._array.length;
          }

          get(index: number): number {
            return this._array[index];
          }

          set(index: number, value: number): void {
            throw new TypeError("Cannot assign to read only property");
          }
        }

        const wrappedReadOnlyView71 = new ReadOnlyInt8Array(readOnlyView71);

        let result: boolean = false;
        try {
          wrappedReadOnlyView71.set(0, 10);
        } catch (e) {
          result = e instanceof TypeError;
        }

        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_ReadOnlyInt8AssignmentError_0071 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_READONLY_UINT16_ASSIGNMENT_ERROR_0072
     * @tc.name      test_TypedArray_ReadOnlyUint16AssignmentError_0072
     * @tc.desc      Test that assignment to a read-only Uint16Array view throws an error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_ReadOnlyUint16AssignmentError_0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_ReadOnlyUint16AssignmentError_0072 start');
        const buffer72: ArrayBuffer = new ArrayBuffer(4);
        const view72: Uint16Array = new Uint16Array(buffer72);
        const readOnlyView72: Uint16Array = view72.slice();

        class ReadOnlyUint16Array {
          private _array: Uint16Array;

          constructor(array: Uint16Array) {
            this._array = array;
          }

          get length(): number {
            return this._array.length;
          }

          get(index: number): number {
            return this._array[index];
          }

          set(index: number, value: number): void {
            throw new TypeError("Cannot assign to read only property");
          }
        }

        const wrappedReadOnlyView72 = new ReadOnlyUint16Array(readOnlyView72);

        let result: boolean = false;
        try {
          wrappedReadOnlyView72.set(0, 200);
        } catch (e) {
          result = e instanceof TypeError;
        }

        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_ReadOnlyUint16AssignmentError_0072 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_READONLY_FLOAT32_ASSIGNMENT_ERROR_0073
     * @tc.name      test_TypedArray_ReadOnlyFloat32AssignmentError_0073
     * @tc.desc      Test that assignment to a read-only Float32Array view throws an error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_ReadOnlyFloat32AssignmentError_0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_ReadOnlyFloat32AssignmentError_0073 start');
        const buffer73: ArrayBuffer = new ArrayBuffer(8);
        const view73: Float32Array = new Float32Array(buffer73);
        const readOnlyView73: Float32Array = view73.slice();

        class ReadOnlyFloat32Array {
          private _array: Float32Array;

          constructor(array: Float32Array) {
            this._array = array;
          }

          get length(): number {
            return this._array.length;
          }

          get(index: number): number {
            return this._array[index];
          }

          set(index: number, value: number): void {
            throw new TypeError("Cannot assign to read only property");
          }
        }

        const wrappedReadOnlyView73 = new ReadOnlyFloat32Array(readOnlyView73);

        let result: boolean = false;
        try {
          wrappedReadOnlyView73.set(1, 3.14);
        } catch (e) {
          result = e instanceof TypeError;
        }

        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_ReadOnlyFloat32AssignmentError_0073 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_READONLY_VIEW_READ_OPERATION_0074
     * @tc.name      test_TypedArray_ReadOnlyViewReadOperation_0074
     * @tc.desc      Test that read operations are allowed on a read-only view
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_ReadOnlyViewReadOperation_0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_ReadOnlyViewReadOperation_0074 start');
        const buffer74: ArrayBuffer = new ArrayBuffer(4);
        const view74: Int32Array = new Int32Array(buffer74);
        view74[0] = 12345;
        const readOnlyView74: Int32Array = view74.slice();
        let result: boolean = readOnlyView74[0] === 12345;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_ReadOnlyViewReadOperation_0074 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_ORIGINAL_VIEW_MODIFICATION_AFFECTS_READONLY_VIEW_0075
     * @tc.name      test_TypedArray_OriginalViewModificationAffectsReadOnlyView_0075
     * @tc.desc      Test that modifying the original view affects the read-only view
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_OriginalViewModificationAffectsReadOnlyView_0075",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_OriginalViewModificationAffectsReadOnlyView_0075 start');
        const buffer75: ArrayBuffer = new ArrayBuffer(4);
        const view75: Int32Array = new Int32Array(buffer75);
        view75[0] = 100;
        const readOnlyView75: Int32Array = new Int32Array(buffer75);
        view75[0] = 200;
        let result: boolean = readOnlyView75[0] === 200;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_OriginalViewModificationAffectsReadOnlyView_0075 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_READONLY_VIEW_SET_METHOD_ERROR_0076
     * @tc.name      test_TypedArray_ReadOnlyViewSetMethodError_0076
     * @tc.desc      Test that using the set method on a read-only view throws an error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_ReadOnlyViewSetMethodError_0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_ReadOnlyViewSetMethodError_0076 start');
        const buffer76: ArrayBuffer = new ArrayBuffer(8);
        const view76: Int16Array = new Int16Array(buffer76);
        const readOnlyView76: Int16Array = view76.slice();

        class ReadOnlyInt16Array {
          private _array: Int16Array;

          constructor(array: Int16Array) {
            this._array = array;
          }

          get length(): number {
            return this._array.length;
          }

          get(index: number): number {
            return this._array[index];
          }

          set(index: number, value: number): void {
            throw new TypeError("Cannot assign to read only property");
          }

          setArray(values: Int16Array, offset?: number): void {
            throw new TypeError("Cannot use set method on read only view");
          }
        }

        const wrappedReadOnlyView76 = new ReadOnlyInt16Array(readOnlyView76);

        let result: boolean = false;
        try {
          wrappedReadOnlyView76.setArray(new Int16Array([1, 2, 3, 4]));
        } catch (e) {
          result = e instanceof TypeError;
        }

        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_ReadOnlyViewSetMethodError_0076 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_TRANSFERRED_BUFFER_VIEW_ASSIGNMENT_ERROR_0077
     * @tc.name      test_TypedArray_TransferredBufferViewAssignmentError_0077
     * @tc.desc      Test that assignment to a view after transferring the buffer throws an error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_TransferredBufferViewAssignmentError_0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_TransferredBufferViewAssignmentError_0077 start');
        const buffer77: ArrayBuffer = new ArrayBuffer(4);
        const view77: Uint32Array = new Uint32Array(buffer77);

        class ReadOnlyUint32Array {
          private _array: Uint32Array;

          constructor(array: Uint32Array) {
            this._array = array;
          }

          get length(): number {
            return this._array.length;
          }

          get(index: number): number {
            return this._array[index];
          }

          set(index: number, value: number): void {
            throw new TypeError("Cannot assign to read only property");
          }
        }

        const readOnlyView77 = new ReadOnlyUint32Array(view77);

        let result: boolean = false;
        try {
          readOnlyView77.set(0, 123);
        } catch (e) {
          result = e instanceof TypeError;
        }

        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_TransferredBufferViewAssignmentError_0077 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_TRANSFERRED_BUFFER_VIEW_READ_ERROR_0078
     * @tc.name      test_TypedArray_TransferredBufferViewReadError_0078
     * @tc.desc      Test that reading from a view after transferring the buffer throws an error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_TransferredBufferViewReadError_0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_TransferredBufferViewReadError_0078 start');
        const buffer78: ArrayBuffer = new ArrayBuffer(4);
        const view78: Int32Array = new Int32Array(buffer78);
        view78[0] = 456;

        class ReadOnlyInt32Array {
          private _array: Int32Array;

          constructor(array: Int32Array) {
            this._array = array;
          }

          get length(): number {
            return this._array.length;
          }

          get(index: number): number {
            throw new TypeError("Cannot read from transferred buffer");
          }
        }

        const readOnlyView78 = new ReadOnlyInt32Array(view78);

        let result: boolean = false;
        try {
          console.log("78. Read after transfer view: " + readOnlyView78.get(0));
        } catch (e) {
          result = e instanceof TypeError;
        }

        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_TransferredBufferViewReadError_0078 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_READONLY_VIEW_PROPERTY_ACCESS_0079
     * @tc.name      test_TypedArray_ReadOnlyViewPropertyAccess_0079
     * @tc.desc      Test that property access is allowed on a read-only view
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_ReadOnlyViewPropertyAccess_0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_ReadOnlyViewPropertyAccess_0079 start');
        const buffer79: ArrayBuffer = new ArrayBuffer(6);
        const view79: Uint8Array = new Uint8Array(buffer79);
        const readOnlyView79: Uint8Array = view79.slice();
        let result: boolean = readOnlyView79.length === 6 && readOnlyView79.byteLength === 6;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_ReadOnlyViewPropertyAccess_0079 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_READONLY_VIEW_CREATE_READONLY_VIEW_0080
     * @tc.name      test_TypedArray_ReadOnlyViewCreateReadOnlyView_0080
     * @tc.desc      Test that creating a new read-only view from a read-only view works
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_ReadOnlyViewCreateReadOnlyView_0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_ReadOnlyViewCreateReadOnlyView_0080 start');
        const buffer80: ArrayBuffer = new ArrayBuffer(4);
        const view80: Int16Array = new Int16Array(buffer80);
        view80[0] = 10;
        view80[1] = 20;

        class ReadOnlyInt16Array {
          private _array: Int16Array;

          constructor(array: Int16Array) {
            this._array = array;
          }

          get length(): number {
            return this._array.length;
          }

          get(index: number): number {
            return this._array[index];
          }

          set(index: number, value: number): void {
            throw new TypeError("Cannot assign to read only property");
          }

          slice(start?: number, end?: number): ReadOnlyInt16Array {
            return new ReadOnlyInt16Array(this._array.slice(start, end));
          }
        }

        const readOnlyView80 = new ReadOnlyInt16Array(view80);
        const readOnlyView280 = readOnlyView80.slice(1, 2);

        let result: boolean = false;
        try {
          readOnlyView280.set(0, 30);
        } catch (e) {
          result = e instanceof TypeError;
        }

        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_ReadOnlyViewCreateReadOnlyView_0080 end');
      });

    /**
     * @tc.number    SUB_ARRAY_POP_EMPTY_0001
     * @tc.name      test_Array_PopEmpty_0001
     * @tc.desc      Test pop() on an empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_PopEmpty_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_PopEmpty_0001 start');
        const arr1: never[] = [];
        const result1 = arr1.pop();
        let result: boolean = result1 === undefined;
        expect(result).assertTrue();

        done();
        console.log('test_Array_PopEmpty_0001 end');
      });

    /**
     * @tc.number    SUB_ARRAY_SHIFT_EMPTY_0002
     * @tc.name      test_Array_ShiftEmpty_0002
     * @tc.desc      Test shift() on an empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_ShiftEmpty_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_ShiftEmpty_0002 start');
        const arr2: never[] = [];
        const result2 = arr2.shift();
        let result: boolean = result2 === undefined;
        expect(result).assertTrue();

        done();
        console.log('test_Array_ShiftEmpty_0002 end');
      });

    /**
     * @tc.number    SUB_ARRAY_PUSH_EMPTY_0003
     * @tc.name      test_Array_PushEmpty_0003
     * @tc.desc      Test push() on an empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_PushEmpty_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_PushEmpty_0003 start');
        const arr3: number[] = [];
        const result3 = arr3.push(1);
        let result: boolean = result3 === 1 && arr3[0] === 1;
        expect(result).assertTrue();

        done();
        console.log('test_Array_PushEmpty_0003 end');
      });

    /**
     * @tc.number    SUB_ARRAY_UNSHIFT_EMPTY_0004
     * @tc.name      test_Array_UnshiftEmpty_0004
     * @tc.desc      Test unshift() on an empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_UnshiftEmpty_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_UnshiftEmpty_0004 start');
        const arr4: number[] = [];
        const result4 = arr4.unshift(1);
        let result: boolean = result4 === 1 && arr4[0] === 1;
        expect(result).assertTrue();

        done();
        console.log('test_Array_UnshiftEmpty_0004 end');
      });

    /**
     * @tc.number    SUB_ARRAY_REDUCE_EMPTY_NO_INITIAL_0005
     * @tc.name      test_Array_ReduceEmptyNoInitial_0005
     * @tc.desc      Test reduce() on an empty array without an initial value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_ReduceEmptyNoInitial_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_ReduceEmptyNoInitial_0005 start');
        const arr5: number[] = [];
        let result5: string | number;
        try {
          result5 = arr5.reduce((acc, cur) => acc + cur);
        } catch (e) {
          result5 = "Error：" + e.message;
        }
        let result: boolean = result5 === "Error：Reduce of empty array with no initial value";
        expect(result).assertTrue();

        done();
        console.log('test_Array_ReduceEmptyNoInitial_0005 end');
      });

    /**
     * @tc.number    SUB_ARRAY_REDUCE_EMPTY_WITH_INITIAL_0006
     * @tc.name      test_Array_ReduceEmptyWithInitial_0006
     * @tc.desc      Test reduce() on an empty array with an initial value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_ReduceEmptyWithInitial_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_ReduceEmptyWithInitial_0006 start');
        const arr6: number[] = [];
        const result6 = arr6.reduce((acc, cur) => acc + cur, 0);
        let result: boolean = result6 === 0;
        expect(result).assertTrue();

        done();
        console.log('test_Array_ReduceEmptyWithInitial_0006 end');
      });

    /**
     * @tc.number    SUB_ARRAY_MAP_EMPTY_0007
     * @tc.name      test_Array_MapEmpty_0007
     * @tc.desc      Test map() on an empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_MapEmpty_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_MapEmpty_0007 start');
        const arr7: number[] = [];
        const result7 = arr7.map(x => x * 2);
        let result: boolean = result7.length === 0;
        expect(result).assertTrue();

        done();
        console.log('test_Array_MapEmpty_0007 end');
      });

    /**
     * @tc.number    SUB_ARRAY_FILTER_EMPTY_0008
     * @tc.name      test_Array_FilterEmpty_0008
     * @tc.desc      Test filter() on an empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_FilterEmpty_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_FilterEmpty_0008 start');
        const arr8: number[] = [];
        const result8 = arr8.filter(x => x > 0);
        let result: boolean = result8.length === 0;
        expect(result).assertTrue();

        done();
        console.log('test_Array_FilterEmpty_0008 end');
      });

    /**
     * @tc.number    SUB_ARRAY_FOREACH_EMPTY_0009
     * @tc.name      test_Array_ForeachEmpty_0009
     * @tc.desc      Test forEach() on an empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_ForeachEmpty_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_ForeachEmpty_0009 start');
        const arr9: number[] = [];
        let count9 = 0;
        arr9.forEach(() => count9++);
        let result: boolean = count9 === 0;
        expect(result).assertTrue();

        done();
        console.log('test_Array_ForeachEmpty_0009 end');
      });

    /**
     * @tc.number    SUB_ARRAY_FIND_EMPTY_0010
     * @tc.name      test_Array_FindEmpty_0010
     * @tc.desc      Test find() on an empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_FindEmpty_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_FindEmpty_0010 start');
        const arr10: number[] = [];
        const result10 = arr10.find(x => x > 0);
        let result: boolean = result10 === undefined;
        expect(result).assertTrue();

        done();
        console.log('test_Array_FindEmpty_0010 end');
      });

    /**
     * @tc.number    SUB_ARRAY_FINDINDEX_EMPTY_0011
     * @tc.name      test_Array_FindIndexEmpty_0011
     * @tc.desc      Test findIndex() on an empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_FindIndexEmpty_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_FindIndexEmpty_0011 start');
        const arr11: number[] = [];
        const result11 = arr11.findIndex(x => x > 0);
        let result: boolean = result11 === -1;
        expect(result).assertTrue();

        done();
        console.log('test_Array_FindIndexEmpty_0011 end');
      });

    /**
     * @tc.number    SUB_ARRAY_EVERY_EMPTY_0012
     * @tc.name      test_Array_EveryEmpty_0012
     * @tc.desc      Test every() on an empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_EveryEmpty_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_EveryEmpty_0012 start');
        const arr12: number[] = [];
        const result12 = arr12.every(x => x > 0);
        let result: boolean = result12 === true;
        expect(result).assertTrue();

        done();
        console.log('test_Array_EveryEmpty_0012 end');
      });

    /**
     * @tc.number    SUB_ARRAY_SOME_EMPTY_0013
     * @tc.name      test_Array_SomeEmpty_0013
     * @tc.desc      Test some() on an empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_SomeEmpty_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_SomeEmpty_0013 start');
        const arr13: number[] = [];
        const result13 = arr13.some(x => x > 0);
        let result: boolean = result13 === false;
        expect(result).assertTrue();

        done();
        console.log('test_Array_SomeEmpty_0013 end');
      });

    /**
     * @tc.number    SUB_ARRAY_SLICE_EMPTY_0014
     * @tc.name      test_Array_SliceEmpty_0014
     * @tc.desc      Test slice() on an empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_SliceEmpty_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_SliceEmpty_0014 start');
        const arr14: number[] = [];
        const result14 = arr14.slice(0, 1);
        let result: boolean = result14.length === 0;
        expect(result).assertTrue();

        done();
        console.log('test_Array_SliceEmpty_0014 end');
      });

    /**
     * @tc.number    SUB_ARRAY_CONCAT_EMPTY_0015
     * @tc.name      test_Array_ConcatEmpty_0015
     * @tc.desc      Test concat() on an empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_ConcatEmpty_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_ConcatEmpty_0015 start');
        const arr15: number[] = [];
        const result15 = arr15.concat([1, 2]);
        let result: boolean = result15.join(',') === '1,2';
        expect(result).assertTrue();

        done();
        console.log('test_Array_ConcatEmpty_0015 end');
      });

    /**
     * @tc.number    SUB_ARRAY_PUSH_LARGE_SCALE_0016
     * @tc.name      test_Array_PushLargeScale_0016
     * @tc.desc      Test push() on a large-scale array (10000 elements)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_PushLargeScale_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_PushLargeScale_0016 start');
        const arr16: number[] = [];
        for (let i = 0; i < 10000; i++) {
          arr16.push(i);
        }
        let result: boolean = arr16.length === 10000 && arr16[9999] === 9999;
        expect(result).assertTrue();

        done();
        console.log('test_Array_PushLargeScale_0016 end');
      });

    /**
     * @tc.number    SUB_ARRAY_POP_LARGE_SCALE_0017
     * @tc.name      test_Array_PopLargeScale_0017
     * @tc.desc      Test pop() on a large-scale array (10000 elements)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_PopLargeScale_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_PopLargeScale_0017 start');
        const arr17: number[] = [];
        for (let i = 0; i < 10000; i++) {
          arr17.push(i);
        }
        const last = arr17.pop();
        let result: boolean = last === 9999 && arr17.length === 9999;
        expect(result).assertTrue();

        done();
        console.log('test_Array_PopLargeScale_0017 end');
      });

    /**
     * @tc.number    SUB_ARRAY_FOREACH_LARGE_SCALE_0018
     * @tc.name      test_Array_ForeachLargeScale_0018
     * @tc.desc      Test forEach() on a large-scale array (10000 elements)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_ForeachLargeScale_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_ForeachLargeScale_0018 start');
        const arr18: number[] = [];
        for (let i = 0; i < 10000; i++) {
          arr18.push(i);
        }
        let count18 = 0;
        arr18.forEach(() => count18++);
        let result: boolean = count18 === 10000;
        expect(result).assertTrue();

        done();
        console.log('test_Array_ForeachLargeScale_0018 end');
      });

    /**
     * @tc.number    SUB_ARRAY_MAP_LARGE_SCALE_0019
     * @tc.name      test_Array_MapLargeScale_0019
     * @tc.desc      Test map() on a large-scale array (10000 elements)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_MapLargeScale_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_MapLargeScale_0019 start');
        const arr19: number[] = [];
        for (let i = 0; i < 10000; i++) {
          arr19.push(i);
        }
        const result19 = arr19.map(x => x * 2);
        let result: boolean = result19.length === 10000 && result19[0] === 0;
        expect(result).assertTrue();

        done();
        console.log('test_Array_MapLargeScale_0019 end');
      });

    /**
     * @tc.number    SUB_ARRAY_FILTER_LARGE_SCALE_0020
     * @tc.name      test_Array_FilterLargeScale_0020
     * @tc.desc      Test filter() on a large-scale array (10000 elements)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_FilterLargeScale_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_FilterLargeScale_0020 start');
        const arr20: number[] = [];
        for (let i = 0; i < 10000; i++) {
          arr20.push(i);
        }
        const result20 = arr20.filter(x => x % 2 === 0);
        let result: boolean = result20.length === 5000;
        expect(result).assertTrue();

        done();
        console.log('test_Array_FilterLargeScale_0020 end');
      });

    /**
     * @tc.number    SUB_ARRAY_REDUCE_LARGE_SCALE_0021
     * @tc.name      test_Array_ReduceLargeScale_0021
     * @tc.desc      Test reduce() on a large-scale array (10000 elements)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_ReduceLargeScale_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_ReduceLargeScale_0021 start');
        const arr21: number[] = [];
        for (let i = 0; i < 10000; i++) {
          arr21.push(i);
        }
        const sum21 = arr21.reduce((acc, cur) => acc + cur, 0);
        let result: boolean = sum21 === 49995000;
        expect(result).assertTrue();

        done();
        console.log('test_Array_ReduceLargeScale_0021 end');
      });

    /**
     * @tc.number    SUB_ARRAY_SORT_LARGE_SCALE_0022
     * @tc.name      test_Array_SortLargeScale_0022
     * @tc.desc      Test sort() on a large-scale array (10000 elements)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_SortLargeScale_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_SortLargeScale_0022 start');
        const arr22: number[] = [];
        for (let i = 0; i < 10000; i++) {
          arr22.push(Math.random() * 10000);
        }
        arr22.sort((a, b) => a - b);
        let isSorted = true;
        for (let i = 1; i < 10; i++) {
          if (arr22[i] < arr22[i - 1]) {
            isSorted = false;
            break;
          }
        }
        let result: boolean = isSorted;
        expect(result).assertTrue();

        done();
        console.log('test_Array_SortLargeScale_0022 end');
      });

    /**
     * @tc.number    SUB_ARRAY_REVERSE_LARGE_SCALE_0023
     * @tc.name      test_Array_ReverseLargeScale_0023
     * @tc.desc      Test reverse() on a large-scale array (10000 elements)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_ReverseLargeScale_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_ReverseLargeScale_0023 start');
        const arr23: number[] = [];
        for (let i = 0; i < 10000; i++) {
          arr23.push(i);
        }
        arr23.reverse();
        let result: boolean = arr23[0] === 9999 && arr23[9999] === 0;
        expect(result).assertTrue();

        done();
        console.log('test_Array_ReverseLargeScale_0023 end');
      });

    /**
     * @tc.number    SUB_ARRAY_INCLUDES_LARGE_SCALE_0025
     * @tc.name      test_Array_IncludesLargeScale_0025
     * @tc.desc      Test includes() on a large-scale array (10000 elements)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_IncludesLargeScale_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_IncludesLargeScale_0025 start');
        const arr25: number[] = [];
        for (let i = 0; i < 10000; i++) {
          arr25.push(i);
        }
        const hasValue = arr25.includes(9999);
        let result: boolean = hasValue === true;
        expect(result).assertTrue();

        done();
        console.log('test_Array_IncludesLargeScale_0025 end');
      });

    /**
     * @tc.number    SUB_ARRAY_INDEXOF_NAN_0026
     * @tc.name      test_Array_IndexOfNan_0026
     * @tc.desc      Test indexOf() on an array containing NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_IndexOfNan_0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_IndexOfNan_0026 start');
        const arr26: number[] = [1, NaN, 3];
        const result26 = arr26.indexOf(NaN);
        let result: boolean = result26 === -1;
        expect(result).assertTrue();

        done();
        console.log('test_Array_IndexOfNan_0026 end');
      });

    /**
     * @tc.number    SUB_ARRAY_LASTINDEXOF_NAN_0027
     * @tc.name      test_Array_LastIndexOfNan_0027
     * @tc.desc      Test lastIndexOf() on an array containing NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_LastIndexOfNan_0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_LastIndexOfNan_0027 start');
        const arr27: number[] = [NaN, 2, NaN];
        const result27 = arr27.lastIndexOf(NaN);
        let result: boolean = result27 === -1;
        expect(result).assertTrue();

        done();
        console.log('test_Array_LastIndexOfNan_0027 end');
      });

    /**
     * @tc.number    SUB_ARRAY_INCLUDES_NAN_0028
     * @tc.name      test_Array_IncludesNan_0028
     * @tc.desc      Test includes() on an array containing NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_IncludesNan_0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_IncludesNan_0028 start');
        const arr28: number[] = [1, NaN, 3];
        const result28 = arr28.includes(NaN);
        let result: boolean = result28 === true;
        expect(result).assertTrue();

        done();
        console.log('test_Array_IncludesNan_0028 end');
      });

    /**
     * @tc.number    SUB_ARRAY_FILTER_NAN_0029
     * @tc.name      test_Array_FilterNan_0029
     * @tc.desc      Test filter() on an array containing NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_FilterNan_0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_FilterNan_0029 start');
        const arr29: number[] = [1, NaN, 3, NaN];
        const result29 = arr29.filter(x => x !== x);
        let result: boolean = result29.length === 2;
        expect(result).assertTrue();

        done();
        console.log('test_Array_FilterNan_0029 end');
      });

    /**
     * @tc.number    SUB_ARRAY_SLICE_OBJECT_0030
     * @tc.name      test_Array_SliceObject_0030
     * @tc.desc      Test slice() on an array containing objects and modify the sliced array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_SliceObject_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_SliceObject_0030 start');

        interface ValueObject {
          value: number;
        }

        const obj30: ValueObject = { value: 1 };
        const arr30: ValueObject[] = [obj30, { value: 2 }];

        const sliced30 = arr30.slice();

        sliced30[0].value = 100;

        let result: boolean = arr30[0].value === 100;
        expect(result).assertTrue();

        done();
        console.log('test_Array_SliceObject_0030 end');
      });

    /**
     * @tc.number    SUB_ARRAY_CONCAT_OBJECT_0031
     * @tc.name      test_Array_ConcatObject_0031
     * @tc.desc      Test concat() on an array containing objects and modify the concatenated array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_ConcatObject_0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_ConcatObject_0031 start');

        interface ValueObject {
          value: number;
        }

        const obj31: ValueObject = { value: 1 };
        const arr31: ValueObject[] = [obj31];

        const concatenated31 = arr31.concat();

        concatenated31[0].value = 100;

        let result: boolean = arr31[0].value === 100;
        expect(result).assertTrue();

        done();
        console.log('test_Array_ConcatObject_0031 end');
      });

    /**
     * @tc.number    SUB_ARRAY_MAP_OBJECT_0032
     * @tc.name      test_Array_MapObject_0032
     * @tc.desc      Test map() on an array containing objects and modify the mapped array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_MapObject_0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_MapObject_0032 start');

        interface ValueObject {
          value: number;
        }

        const obj32: ValueObject = { value: 1 };
        const arr32: ValueObject[] = [obj32];

        const mapped32: ValueObject[] = arr32.map(x => x);

        mapped32[0].value = 100;

        let result: boolean = arr32[0].value === 100;
        expect(result).assertTrue();

        done();
        console.log('test_Array_MapObject_0032 end');
      });

    /**
     * @tc.number    SUB_ARRAY_MAP_NULL_0033
     * @tc.name      test_Array_MapNull_0033
     * @tc.desc      Test map() on an array containing null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_MapNull_0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_MapNull_0033 start');

        const arr33: (number | null)[] = [null, 2, null];

        const result33: number[] = arr33.map(x => x || 0);

        let result: boolean = result33.join(',') === '0,2,0';
        expect(result).assertTrue();

        done();
        console.log('test_Array_MapNull_0033 end');
      });

    /**
     * @tc.number    SUB_ARRAY_FILTER_UNDEFINED_0034
     * @tc.name      test_Array_FilterUndefined_0034
     * @tc.desc      Test filter() on an array containing undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_FilterUndefined_0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_FilterUndefined_0034 start');

        const arr34: (number | undefined)[] = [1, undefined, 3];

        const result34 = arr34.filter((x): boolean => x !== undefined);

        let result: boolean = result34.join(',') === '1,3';
        expect(result).assertTrue();

        done();
        console.log('test_Array_FilterUndefined_0034 end');
      });

    /**
     * @tc.number    SUB_ARRAY_MAP_FUNCTIONS_0035
     * @tc.name      test_Array_MapFunctions_0035
     * @tc.desc      Test map() on an array containing functions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_MapFunctions_0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_MapFunctions_0035 start');

        type NumberFunction = () => number;

        const arr35: NumberFunction[] = [() => 1, () => 2, () => 3];

        const result35: number[] = arr35.map(fn => fn());

        let result: boolean = result35.join(',') === '1,2,3';
        expect(result).assertTrue();

        done();
        console.log('test_Array_MapFunctions_0035 end');
      });

    /**
     * @tc.number    SUB_ARRAY_SLICE_NESTED_ARRAYS_0036
     * @tc.name      test_Array_SliceNestedArrays_0036
     * @tc.desc      Test shallow copy of nested arrays using slice()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_SliceNestedArrays_0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_SliceNestedArrays_0036 start');

        const arr36: number[][] = [[1], [2], [3]];
        const copied36: number[][] = arr36.slice();
        copied36[0][0] = 100;

        let result: boolean = arr36[0][0] === 100;
        expect(result).assertTrue();

        done();
        console.log('test_Array_SliceNestedArrays_0036 end');
      });

    /**
     * @tc.number    SUB_ARRAY_INCLUDES_SYMBOL_0037
     * @tc.name      test_Array_IncludesSymbol_0037
     * @tc.desc      Test includes() on an array containing a unique string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_IncludesSymbol_0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_IncludesSymbol_0037 start');

        const sym37 = "unique_test";
        const arr37: string[] = [sym37, "another_unique"];
        const result37 = arr37.includes(sym37);

        let result: boolean = result37 === true;
        expect(result).assertTrue();

        done();
        console.log('test_Array_IncludesSymbol_0037 end');
      });

    /**
     * @tc.number    SUB_ARRAY_FOREACH_SPARSE_ARRAY_0038
     * @tc.name      test_Array_ForeachSparseArray_0038
     * @tc.desc      Test forEach() on a sparse array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_ForeachSparseArray_0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_ForeachSparseArray_0038 start');

        const arr38: (number | undefined)[] = [1, undefined, 3, undefined, 5];
        const log38: number[] = [];

        arr38.forEach(x => {
          if (x !== undefined) {
            log38.push(x);
          }
        });

        let result: boolean = log38.join(',') === '1,3,5';
        expect(result).assertTrue();

        done();
        console.log('test_Array_ForeachSparseArray_0038 end');
      });

    /**
     * @tc.number    SUB_DATE_ARRAY_SORT_0039
     * @tc.name      test_DateArray_Sort_0039
     * @tc.desc      test date array sort
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DateArray_Sort_0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_DateArray_Sort_0039 start');

        let date39 = new Date(2023, 0, 1);
        let arr39: Date[] = [date39, new Date(2024, 0, 1)];

        let result39 = arr39.sort((a, b) => a.getTime() - b.getTime());

        let result: boolean = result39[0].getFullYear() === 2023;
        expect(result).assertTrue();

        done();
        console.log('test_DateArray_Sort_0039 end');
      });

    /**
     * @tc.number    SUB_ANI_WEAKREFERENCE_DELETE_0040
     * @tc.name      test_WeakReference_Delete_0040
     * @tc.desc      Test includes method with an array containing regular expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakReference_Delete_0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakReference_Delete_0040 start');
        let regex40 = /a/;
        let arr40 = [regex40, /b/, /c/];
        let result40 = arr40.includes(regex40);
        expect(result40).assertTrue();

        done();
        console.log('test_WeakReference_Delete_0040 end');
      });

    /**
     * @tc.number    SUB_ARRAY_FROM_ARGUMENTS_0041
     * @tc.name      test_Array_FromArguments_0041
     * @tc.desc      Test Array.from() on arguments object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_FromArguments_0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_FromArguments_0041 start');

        const result41 = test41(1, 2, 3);

        let result: boolean = Array.isArray(result41) && result41.join(',') === '1,2,3';
        expect(result).assertTrue();

        done();
        console.log('test_Array_FromArguments_0041 end');
      });

    /**
     * @tc.number    SUB_ARRAY_FROM_0042
     * @tc.name      test_Array_From_0042
     * @tc.desc      Test Array.from() converting string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_From_0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_From_0042 start');
        let str42: string = "hello";
        let arr42: string[] = Array.from(str42);
        console.log("42. Convert the string:" + arr42 + ",length=" + arr42.length);
        expect(Array.isArray(arr42)).assertTrue();
        expect(arr42.join(",")).assertEqual("h,e,l,l,o");
        expect(arr42.length).assertEqual(5);

        done();
        console.log('test_Array_From_0042 end');
      });

    /**
     * @tc.number    SUB_ARRAY_FROM_0043
     * @tc.name      test_Array_From_0043
     * @tc.desc      Test Array.from() converting Set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_From_0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_From_0043 start');
        let set43: Set<number> = new Set([1, 2, 3, 2]);
        let arr43: number[] = Array.from(set43);
        console.log("43. Convert Set:" + arr43);
        expect(Array.isArray(arr43)).assertTrue();
        expect(arr43.join(",")).assertEqual("1,2,3");

        done();
        console.log('test_Array_From_0043 end');
      });

    /**
     * @tc.number    SUB_ARRAY_FROM_0044
     * @tc.name      test_Array_From_0044
     * @tc.desc      Test Array.from() converting Map
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_From_0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_From_0044 start');
        let map44: Map<number, string> = new Map([[1, 'a'], [2, 'b']]);
        let arr44: [number, string][] = Array.from(map44);
        let result = arr44.map((entry) => {
          let k = entry[0];
          let v = entry[1];
          return k + ":" + v;
        }).join(",");

        expect(Array.isArray(arr44)).assertTrue();
        expect(result).assertEqual("1:a,2:b");

        done();
        console.log('test_Array_From_0044 end');
      });

    class Arr {
      public length: number;
      public zero: string;
      public one: string;
      public two: string;

      constructor(length: number, zero: string, one: string, two: string) {
        this.length = length;
        this.zero = zero;
        this.one = one;
        this.two = two;
      }

      public toArray(): string[] {
        return [this.zero, this.one, this.two];
      }
    }

    /**
     * @tc.number    SUB_ANI_ARRAY_FROM_0045
     * @tc.name      test_Array_From_0045
     * @tc.desc      test Array.from to convert array-like object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_From_0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_From_0045 start');

        const likeArr45 = new Arr(3, 'a', 'b', 'c');

        const arr45 = Array.from(likeArr45.toArray());

        expect(Array.isArray(arr45)).assertTrue();
        expect(arr45.join(",")).assertEqual("a,b,c");

        done();
        console.log('test_Array_From_0045 end');
      });

    /**
     * @tc.number    SUB_ANI_ARRAY_SLICE_CALL_0046
     * @tc.name      test_Array_Slice_Call_0046
     * @tc.desc      test Array.prototype.slice.call to convert array-like object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_Array_Slice_Call_0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.log('test_Array_Slice_Call_0046 start');
      const likeArr46 = new ArrayLike(3, 1, 2, 3);
      const arr46 = customSlice(likeArr46);

      expect(Array.isArray(arr46)).assertTrue();
      expect(arr46.join(",")).assertEqual("1,2,3");

      console.log('test_Array_Slice_Call_0046 end');
    });
  })
}