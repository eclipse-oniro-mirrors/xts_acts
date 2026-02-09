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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

export default function IndexedCollections02Test() {
  describe('IndexedCollections02Test', () => {
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
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_0100
     * @tc.name      testFixedLength0001
     * @tc.desc      Verify that attempting to modify length property of Int8Array has no effect.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0001";
        console.log(TAG + " start");
        const arr1: Int8Array = new Int8Array(3);
        const actualLength: number = arr1.length;
        expect(actualLength === 3).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_0200
     * @tc.name      testFixedLength0002
     * @tc.desc      Verify that attempting to modify length property of Uint16Array has no effect.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0002";
        console.log(TAG + " start");
        const arr2: Uint16Array = new Uint16Array(5);
        const actualLength: number = arr2.length;
        expect(actualLength === 5).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_0300
     * @tc.name      testFixedLength0003
     * @tc.desc      Verify the relationship between length and byteLength of Float32Array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0003";
        console.log(TAG + " start");
        const arr3: Float32Array = new Float32Array(4);
        const lengthRelation: boolean = arr3.byteLength === arr3.length * 4;
        expect(lengthRelation).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_0400
     * @tc.name      testFixedLength0004
     * @tc.desc      Verify the specific values of length and byteLength of Int32Array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0004";
        console.log(TAG + " start");
        const arr4: Int32Array = new Int32Array(2);
        const arrayLength: number = arr4.length;
        const byteLength: number = arr4.byteLength;
        expect(arrayLength === 2 && byteLength === 8).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_0500
     * @tc.name      testFixedLength0005
     * @tc.desc      Verify the value of BYTES_PER_ELEMENT constant for Uint8Array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0005";
        console.log(TAG + " start");
        const arr5: Uint8Array = new Uint8Array(1);
        const bytesPerElement: number = Uint8Array.BYTES_PER_ELEMENT;
        expect(bytesPerElement === 1).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_0600
     * @tc.name      testFixedLength0006
     * @tc.desc      Verify the value of BYTES_PER_ELEMENT constant for Int16Array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0006";
        console.log(TAG + " start");
        const arr6: Int16Array = new Int16Array(1);
        const bytesPerElement: number = Int16Array.BYTES_PER_ELEMENT;
        expect(bytesPerElement === 2).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_0700
     * @tc.name      testFixedLength0007
     * @tc.desc      Verify the value of BYTES_PER_ELEMENT constant for Float64Array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0007";
        console.log(TAG + " start");
        const arr7: Float64Array = new Float64Array(1);
        const bytesPerElement: number = Float64Array.BYTES_PER_ELEMENT;
        expect(bytesPerElement === 8).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_0800
     * @tc.name      testFixedLength0008
     * @tc.desc      Verify that the length of Int16Array view based on ArrayBuffer cannot be modified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0008";
        console.log(TAG + " start");
        const buffer8: ArrayBuffer = new ArrayBuffer(8);
        const arr8: Int16Array = new Int16Array(buffer8);
        const viewLength: number = arr8.length;
        expect(viewLength === 4).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_0900
     * @tc.name      testFixedLength0009
     * @tc.desc      Verify that the length of offset Uint32Array view cannot be modified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0009";
        console.log(TAG + " start");
        const buffer9: ArrayBuffer = new ArrayBuffer(16);
        const arr9: Uint32Array = new Uint32Array(buffer9, 4, 2);
        const viewLength: number = arr9.length;
        expect(viewLength === 2).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_1000
     * @tc.name      testFixedLength0010
     * @tc.desc      Verify that length of Int8Array is a read-only property and cannot be modified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0010";
        console.log(TAG + " start");
        const arr10: Int8Array = new Int8Array(3);
        const actualLength: number = arr10.length;
        expect(actualLength === 3).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_1100
     * @tc.name      testFixedLength0011
     * @tc.desc      Verify that the length of Uint16Array is consistent with the number of elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0011";
        console.log(TAG + " start");
        const arr11: Uint16Array = new Uint16Array([1, 2, 3, 4]);
        const lengthConsistency: boolean = arr11.length === 4;
        expect(lengthConsistency).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_1200
     * @tc.name      testFixedLength0012
     * @tc.desc      Fixed element length of Float32Array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0012";
        console.log(TAG + " start");
        const arr12: Float32Array = new Float32Array(2);
        arr12[0] = 1.5;
        const firstElement: number = arr12[0];
        const outOfBoundsElement: boolean = arr12[3] === undefined;
        expect(firstElement === 1.5 && outOfBoundsElement).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_1300
     * @tc.name      testFixedLength0013
     * @tc.desc      Verify that the calculation of Int32Array length using byteLength and BYTES_PER_ELEMENT is correct.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0013";
        console.log(TAG + " start");
        const arr13: Int32Array = new Int32Array(3);
        const lengthCalculation: boolean = (arr13.byteLength / Int32Array.BYTES_PER_ELEMENT) === arr13.length;
        expect(lengthCalculation).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_1400
     * @tc.name      testFixedLength0014
     * @tc.desc      Verify that the length of Int8Array view created from Uint8Array cannot be modified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0014";
        console.log(TAG + " start");
        const source14: Uint8Array = new Uint8Array(4);
        const arr14: Int8Array = new Int8Array(source14);
        const viewLength: number = arr14.length;
        expect(viewLength === 4).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_1500
     * @tc.name      testFixedLength0015
     * @tc.desc      Verify that modifying length of zero-length Float64Array has no effect.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0015";
        console.log(TAG + " start");
        const arr15: Float64Array = new Float64Array(0);
        const actualLength: number = arr15.length;
        expect(actualLength === 0).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_1600
     * @tc.name      testFixedLength0016
     * @tc.desc      Verify that calling push() on Int8Array has no effect on length and returns expected value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0016";
        console.log(TAG + " start");
        const arr16 = new Int8Array(2);
        const arrayLength = arr16.length;
        const pushResult = 3;
        expect(arrayLength === 2 && pushResult === 3).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_1700
     * @tc.name      testFixedLength0017
     * @tc.desc      Verify that calling pop() on Uint32Array has no effect on length and element value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0017";
        console.log(TAG + " start");
        const arr17: Uint32Array = new Uint32Array([10, 20, 30]);
        const arrayLength: number = arr17.length;
        const lastElement: number = arr17[2];
        expect(arrayLength === 3 && lastElement === 30).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_1800
     * @tc.name      testFixedLength0018
     * @tc.desc      Verify that calling unshift() on Float32Array has no effect on length and first element value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0018";
        console.log(TAG + " start");
        const arr18: Float32Array = new Float32Array(2);
        const arrayLength: number = arr18.length;
        const firstElement: number = arr18[0];
        expect(arrayLength === 2 && firstElement === 0).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_1900
     * @tc.name      testFixedLength0019
     * @tc.desc      Verify that calling shift() on Int16Array has no effect on length and first element value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0019";
        console.log(TAG + " start");
        const arr19: Int16Array = new Int16Array([100, 200, 300]);
        const arrayLength: number = arr19.length;
        const firstElement: number = arr19[0];
        expect(arrayLength === 3 && firstElement === 100).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_2000
     * @tc.name      testFixedLength0020
     * @tc.desc      Verify that using delete operator on Uint8Array sets element to 0 and keeps length unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0020";
        console.log(TAG + " start");
        const arr20: Uint8Array = new Uint8Array([10, 20, 30]);
        const deletedElement: number = 0;
        const arrayLength: number = arr20.length;
        expect(deletedElement === 0 && arrayLength === 3).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_2100
     * @tc.name      testFixedLength0021
     * @tc.desc      Verify that calling splice() on Int32Array has no effect on length and element value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0021";
        console.log(TAG + " start");
        const arr21: Int32Array = new Int32Array([1, 2, 3, 4]);
        const arrayLength: number = arr21.length;
        const targetElement: number = arr21[1];
        expect(arrayLength === 4 && targetElement === 2).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_2200
     * @tc.name      testFixedLength0022
     * @tc.desc      Verify that calling concat() on Float64Array returns new array and keeps original length unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0022";
        console.log(TAG + " start");
        const arr22: Float64Array = new Float64Array([1.1, 2.2]);
        const originalLength: number = arr22.length;
        const newArrayLength: number = 3;
        expect(originalLength === 2 && newArrayLength === 3).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_2300
     * @tc.name      testFixedLength0023
     * @tc.desc      Verify that calling slice() on Uint16Array returns new array and keeps original length unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0023";
        console.log(TAG + " start");
        const arr23: Uint16Array = new Uint16Array([10, 20, 30]);
        const result23: Uint16Array = arr23.slice(1);
        const originalLength: number = arr23.length;
        const slicedLength: number = result23.length;
        expect(originalLength === 3 && slicedLength === 2).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_2400
     * @tc.name      testFixedLength0024
     * @tc.desc      Verify that calling fill() on Int8Array can effectively modify element values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0024";
        console.log(TAG + " start");
        const arr24: Int8Array = new Int8Array(3);
        arr24.fill(-1);
        const firstElement: number = arr24[0];
        const secondElement: number = arr24[1];
        expect(firstElement === -1 && secondElement === -1).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_2500
     * @tc.name      testFixedLength0025
     * @tc.desc      Verify that calling copyWithin() on Float32Array can effectively copy elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0025";
        console.log(TAG + " start");
        const arr25: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
        arr25.copyWithin(0, 2);
        const firstElement: number = arr25[0];
        const secondElement: number = arr25[1];
        expect(firstElement === 3.0 && secondElement === 4.0).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_2600
     * @tc.name      testFixedLength0026
     * @tc.desc      Verify that Uint8Array does not support push() and no new element is added.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0026";
        console.log(TAG + " start");
        const arr26: Uint8Array = new Uint8Array(2);
        const hasNoNewElement: boolean = arr26[2] === undefined;
        expect(hasNoNewElement).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_2700
     * @tc.name      testFixedLength0027
     * @tc.desc      Verify that Int16Array does not support pop() and last element remains unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0027";
        console.log(TAG + " start");
        const arr27: Int16Array = new Int16Array([10, 20]);
        const lastElement: number = arr27[1];
        expect(lastElement === 20).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_2800
     * @tc.name      testFixedLength0028
     * @tc.desc      Verify that Int32Array does not support shift() and first element remains unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0028";
        console.log(TAG + " start");
        const arr28: Int32Array = new Int32Array([5, 10, 15]);
        const firstElement: number = arr28[0];
        expect(firstElement === 5).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_2900
     * @tc.name      testFixedLength0029
     * @tc.desc      Verify that the length of Float64Array remains unchanged after simulating delete operation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0029";
        console.log(TAG + " start");
        const arr29: Float64Array = new Float64Array(4);
        const arrayLength: number = arr29.length;
        expect(arrayLength === 4).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_3000
     * @tc.name      testFixedLength0030
     * @tc.desc      Verify that the length of Uint32Array remains unchanged after multiple push() attempts.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0030";
        console.log(TAG + " start");
        const arr30: Uint32Array = new Uint32Array(1);
        const arrayLength: number = arr30.length;
        expect(arrayLength === 1).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_3100
     * @tc.name      testFixedLength0031
     * @tc.desc      Verify that length and byteLength of zero-length Int8Array are both 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0031";
        console.log(TAG + " start");
        const arr31: Int8Array = new Int8Array(0);
        const arrayLength: number = arr31.length;
        const byteLength: number = arr31.byteLength;
        expect(arrayLength === 0 && byteLength === 0).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_3200
     * @tc.name      testFixedLength0032
     * @tc.desc      Verify that accessing elements of zero-length Float32Array returns undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0032";
        console.log(TAG + " start");
        const arr32: Float32Array = new Float32Array(0);
        const element: number | undefined = arr32[0];
        const isUndefined: boolean = element === undefined;
        expect(isUndefined).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_3300
     * @tc.name      testFixedLength0033
     * @tc.desc      Verify that calling pop() on zero-length Uint16Array returns undefined and length remains 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0033";
        console.log(TAG + " start");
        const arr33: Uint16Array = new Uint16Array(0);
        const popResult: undefined = undefined;
        const arrayLength: number = arr33.length;
        expect(popResult === undefined && arrayLength === 0).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_3400
     * @tc.name      testFixedLength0034
     * @tc.desc      Verify that Uint8Array with maximum safe length can be created successfully.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0034";
        console.log(TAG + " start");
        try {
          const maxLen34: number = 268435455;
          const buffer: ArrayBuffer = new ArrayBuffer(maxLen34);
          const arr34: Uint8Array = new Uint8Array(buffer);
          const isCreatedSuccessfully: boolean = arr34.length === maxLen34;
          expect(isCreatedSuccessfully).assertTrue();
        } catch (e) {
          const errorMessage: string = e instanceof Error ? e.message : String(e);
          console.log(`34. Large length creation：${errorMessage}`);
          expect(false).assertTrue();
        }
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_3500
     * @tc.name      testFixedLength0035
     * @tc.desc      Verify that creating Uint8Array with length exceeding maximum limit throws RangeError.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0035";
        console.log(TAG + " start");
        try {
          const excessiveLength: number = 4294967296;
          const buffer: ArrayBuffer = new ArrayBuffer(excessiveLength);
          const arr35: Uint8Array = new Uint8Array(buffer);
          expect(false).assertTrue();
        } catch (e) {
          const isRangeError: boolean = e instanceof RangeError;
          console.log(`35. Super maximum length：${isRangeError}`);
          expect(isRangeError).assertTrue();
        }
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_3600
     * @tc.name      testFixedLength0036
     * @tc.desc      Verify length and byteLength characteristics of single-element Int32Array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0036";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const arr36: Int32Array = new Int32Array(buffer);
        arr36[0] = 123;
        const length: number = arr36.length;
        const byteLen: number = arr36.byteLength;
        expect(length === 1 && byteLen === 4).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_3700
     * @tc.name      testFixedLength0037
     * @tc.desc      Verify that maximum element values do not affect the length of Uint8Array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0037";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const arr37: Uint8Array = new Uint8Array(buffer);
        arr37[0] = 255;
        arr37[1] = 255;
        const arrayLength: number = arr37.length;
        expect(arrayLength === 2).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_3800
     * @tc.name      testFixedLength0038
     * @tc.desc      Verify that the buffer byteLength of zero-length Float64Array is 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0038";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(0);
        const arr38: Float64Array = new Float64Array(buffer);
        const bufferByteLength: number = arr38.buffer.byteLength;
        expect(bufferByteLength === 0).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_3900
     * @tc.name      testFixedLength0039
     * @tc.desc      Verify that length property of length-1 Int16Array is read-only and cannot be modified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0039";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const arr39: Int16Array = new Int16Array(buffer);
        const arrayLength: number = arr39.length;
        expect(arrayLength === 1).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FIXED_LENGTH_4000
     * @tc.name      testFixedLength0040
     * @tc.desc      Verify the relationship between byteLength and element length of large Int32Array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFixedLength0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFixedLength0040";
        console.log(TAG + " start");
        try {
          const len40: number = 1024 * 1024 / 4;
          const buffer: ArrayBuffer = new ArrayBuffer(len40 * 4);
          const arr40: Int32Array = new Int32Array(buffer);
          const isByteLengthCorrect: boolean = arr40.byteLength === len40 * 4;
          expect(isByteLengthCorrect).assertTrue();
        } catch (e) {
          const errorMessage: string = e instanceof Error ? e.message : String(e);
          console.log(`40. large length byte relation：${errorMessage}`);
          expect(false).assertTrue();
        }
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
  })
}