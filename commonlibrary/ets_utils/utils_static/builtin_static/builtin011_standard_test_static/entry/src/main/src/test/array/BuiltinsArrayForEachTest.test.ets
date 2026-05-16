/*
* Copyright (c) 2026 RKH Corp.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function BuiltinsArrayForEachTest(): void {
  describe('BuiltinsArrayForEachTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(100);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name    builtinsArrayForEachTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_FOR_EACH_TEST_0100
     * @tc.desc    Verify forEach with empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayForEachTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(0, 0);
      let callCount = 0;

      arr.forEach((value: number, index: int, array: Array<number>) => {
        callCount++;
      });

      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayForEachTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_FOR_EACH_TEST_0200
     * @tc.desc    Verify forEach with single element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayForEachTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Array<number> = Array.create<number>(1, 0);
      arr[0] = 42;
      let callCount = 0;
      let capturedValue: number = 0;
      let capturedIndex: number = -1;

      arr.forEach((value, index) => {
        callCount++;
        capturedValue = value;
        capturedIndex = index.toDouble();
      });

      // 断言正确匹配
      expect(callCount).assertEqual(1);
      expect(capturedValue).assertEqual(42);
      expect(capturedIndex).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayForEachTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_FOR_EACH_TEST_0300
     * @tc.desc    Verify forEach with multiple elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayForEachTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      let callCount = 0;
      const capturedValues: number[] = [];
      const capturedIndices: int[] = [];

      arr.forEach((value: number, index: int, array: Array<number>) => {
        callCount++;
        capturedValues.push(value);
        capturedIndices.push(index);
      });

      expect(callCount).assertEqual(5);
      expect(capturedValues.length).assertEqual(5);
      expect(capturedValues[0]).assertEqual(1);
      expect(capturedValues[1]).assertEqual(2);
      expect(capturedValues[2]).assertEqual(3);
      expect(capturedValues[3]).assertEqual(4);
      expect(capturedValues[4]).assertEqual(5);
      expect(capturedIndices.length).assertEqual(5);
      expect(capturedIndices[0]).assertEqual(0);
      expect(capturedIndices[1]).assertEqual(1);
      expect(capturedIndices[2]).assertEqual(2);
      expect(capturedIndices[3]).assertEqual(3);
      expect(capturedIndices[4]).assertEqual(4);
    });

    /**
     * @tc.name    builtinsArrayForEachTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_FOR_EACH_TEST_0400
     * @tc.desc    Verify forEach passes correct array reference
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayForEachTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      let receivedArray: Array<number> | null = null;

      arr.forEach((value: number, index: int, array: Array<number>) => {
        receivedArray = array;
      });

      expect(receivedArray).assertEqual(arr);
    });

    /**
     * @tc.name    builtinsArrayForEachTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_FOR_EACH_TEST_0500
     * @tc.desc    Verify forEach does not modify original array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayForEachTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const original: number[] = Array.create<number>(3, 0);
      original[0] = 1;
      original[1] = 2;
      original[2] = 3;

      arr.forEach((value: number, index: int, array: Array<number>) => {
        // Do nothing
      });

      expect(arr.length).assertEqual(original.length);
      for (let i = 0; i < arr.length; i++) {
        expect(arr.$_get(i)).assertEqual(original.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayForEachTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_FOR_EACH_TEST_0600
     * @tc.desc    Verify forEach with string array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayForEachTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = Array.create<string>(3, '');
      arr[0] = 'apple';
      arr[1] = 'banana';
      arr[2] = 'cherry';
      let callCount = 0;
      const capturedValues: string[] = [];

      arr.forEach((value: string, index: int, array: Array<string>) => {
        callCount++;
        capturedValues.push(value);
      });

      expect(callCount).assertEqual(3);
      expect(capturedValues.length).assertEqual(3);
      expect(capturedValues[0]).assertEqual('apple');
      expect(capturedValues[1]).assertEqual('banana');
      expect(capturedValues[2]).assertEqual('cherry');
    });
  });
}