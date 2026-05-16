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



export default function BuiltinsTryGetIteratorLengthTest(): void {
  describe("BuiltinsTryGetIteratorLengthTest", () => {
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
     * @tc.name    builtinsTryGetIteratorLengthTest0100
     * @tc.number  SUB_BUILTINS_TRY_GET_ITERATOR_LENGTH_TEST_0100
     * @tc.desc    Verify tryGetIteratorLength() - with object that has __Iterator_getLength method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsTryGetIteratorLengthTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // 使用数组的entries()方法获取迭代器（具有__Iterator_getLength方法）
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      const iterator = arr.entries();
      const result = tryGetIteratorLength(iterator);
      const expected = 5;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsTryGetIteratorLengthTest0200
     * @tc.number  SUB_BUILTINS_TRY_GET_ITERATOR_LENGTH_TEST_0200
     * @tc.desc    Verify tryGetIteratorLength() - with empty array entries iterator
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsTryGetIteratorLengthTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // 使用空数组的entries()方法获取迭代器
      const arr: number[] = Array.create<number>(0, 0);
      const iterator = arr.entries();
      const result = tryGetIteratorLength(iterator);
      const expected = 0;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsTryGetIteratorLengthTest0300
     * @tc.number  SUB_BUILTINS_TRY_GET_ITERATOR_LENGTH_TEST_0300
     * @tc.desc    Verify tryGetIteratorLength() - with single element array entries iterator
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsTryGetIteratorLengthTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // 使用单元素数组的entries()方法获取迭代器
      const arr = Array.of<number>(42);
      const iterator = arr.entries();
      const result = tryGetIteratorLength(iterator);
      const expected = 1;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsTryGetIteratorLengthTest0400
     * @tc.number  SUB_BUILTINS_TRY_GET_ITERATOR_LENGTH_TEST_0400
     * @tc.desc    Verify tryGetIteratorLength() - with object that doesn't have __Iterator_getLength method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsTryGetIteratorLengthTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // 创建一个普通对象（不包含__Iterator_getLength方法）
      const obj = new Object();
      const result = tryGetIteratorLength(obj);

      expect(result).assertEqual(undefined);
    });
  });
}