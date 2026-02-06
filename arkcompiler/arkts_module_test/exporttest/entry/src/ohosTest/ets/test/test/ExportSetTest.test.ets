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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import defaultSet from "../Set/SetExport";
import { fruitSet, numberSet, type StringSet, createStringSet, setUtils } from "../Set/SetExport";
import { sleep } from "../utils/Utils";

export default function ExportSetTest() {
  describe('ExportSetTest', () => {
    beforeAll(() => {
      // 测试套件前置操作
    })
    beforeEach(async () => {
      await sleep(100);
    })
    afterEach(() => {
      // 每个测试用例后置操作
    })
    afterAll(() => {
      // 测试套件后置操作
    })

    /**
     * @tc.name   exportSetTest0100
     * @tc.number SUB_EXPORT_SET_TEST_0100
     * @tc.desc   Test default Set export
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('exportSetTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(defaultSet.has('apple')).assertTrue();
      expect(defaultSet.has('banana')).assertTrue();
      expect(defaultSet.has('orange')).assertTrue();
      expect(defaultSet.size).assertEqual(3);
    })

    /**
     * @tc.name   exportSetTest0200
     * @tc.number SUB_EXPORT_SET_TEST_0200
     * @tc.desc   Test named Set export
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportSetTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(fruitSet.has('apple')).assertTrue();
      expect(fruitSet.has('banana')).assertTrue();
      expect(fruitSet.has('orange')).assertTrue();
      expect(fruitSet.size).assertEqual(3);
    })

    /**
     * @tc.name   exportSetTest0300
     * @tc.number SUB_EXPORT_SET_TEST_0300
     * @tc.desc   Test number Set export
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportSetTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(numberSet.has(1)).assertTrue();
      expect(numberSet.has(2)).assertTrue();
      expect(numberSet.has(3)).assertTrue();
      expect(numberSet.size).assertEqual(5);
    })

    /**
     * @tc.name   exportSetTest0400
     * @tc.number SUB_EXPORT_SET_TEST_0400
     * @tc.desc   Test Set type alias export
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportSetTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const mySet: StringSet = new Set<string>(['test1', 'test2']);
      expect(mySet.has('test1')).assertTrue();
      expect(mySet.has('test2')).assertTrue();
      expect(mySet.size).assertEqual(2);
    })

    /**
     * @tc.name   exportSetTest0500
     * @tc.number SUB_EXPORT_SET_TEST_0500
     * @tc.desc   Test Set factory function export
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportSetTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const newSet = createStringSet('x', 'y', 'z');
      expect(newSet.has('x')).assertTrue();
      expect(newSet.has('y')).assertTrue();
      expect(newSet.has('z')).assertTrue();
      expect(newSet.size).assertEqual(3);
    })

    /**
     * @tc.name   exportSetTest0600
     * @tc.number SUB_EXPORT_SET_TEST_0600
     * @tc.desc   Test Set utility object export
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportSetTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numSet = setUtils.createNumberSet(10, 20, 30);
      expect(setUtils.getSize(numSet)).assertEqual(3);
      expect(setUtils.hasValue(numSet, 10)).assertTrue();
      expect(setUtils.hasValue(numSet, 20)).assertTrue();
      expect(setUtils.hasValue(numSet, 99)).assertFalse();
    })

    /**
     * @tc.name   exportSetTest0700
     * @tc.number SUB_EXPORT_SET_TEST_0700
     * @tc.desc   Test Set add and delete operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportSetTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testSet: StringSet = new Set<string>();
      testSet.add('item1');
      expect(testSet.has('item1')).assertTrue();
      testSet.add('item2');
      expect(testSet.size).assertEqual(2);
      testSet.delete('item1');
      expect(testSet.has('item1')).assertFalse();
      expect(testSet.size).assertEqual(1);
    })

    /**
     * @tc.name   exportSetTest0800
     * @tc.number SUB_EXPORT_SET_TEST_0800
     * @tc.desc   Test Set iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportSetTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let sum = 0;
      numberSet.forEach((value) => {
        sum += value;
      });
      expect(sum).assertEqual(15); // 1+2+3+4+5 = 15
    })

    /**
     * @tc.name   exportSetTest0900
     * @tc.number SUB_EXPORT_SET_TEST_0900
     * @tc.desc   Test Set clear operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportSetTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const clearSet: Set<number> = new Set<number>([1, 2, 3]);
      expect(clearSet.size).assertEqual(3);
      clearSet.clear();
      expect(clearSet.size).assertEqual(0);
      expect(clearSet.has(1)).assertFalse();
    })
  })
}
