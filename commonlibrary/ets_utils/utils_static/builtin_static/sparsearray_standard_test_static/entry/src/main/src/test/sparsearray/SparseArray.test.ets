/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

function createLargeSparseArray(): SparseArray<int> {
  let sa = new SparseArray<int>(1000);
  sa.push(1);
  sa.push(2);
  sa.splice(500, 0, 100, 200);
  return sa;
}

export default function SparseArrayTest() {
  describe('SparseArrayTest', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_0100
     * @tc.name testSparseArrayPush
     * @tc.desc Verify push method adds elements to SparseArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayPush', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = new SparseArray<int>();
      expect(sa.length).assertEqual(0);
      let newLen = sa.push(10, 20);
      expect(newLen).assertEqual(2);
      expect(sa.length).assertEqual(2);
      expect(sa.at(0)).assertEqual(10);
      expect(sa.at(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_0200
     * @tc.name testSparseArrayForEach
     * @tc.desc Verify forEach method iterates through SparseArray elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayForEach', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = createLargeSparseArray();
      let sum = 0;
      let count = 0;
      sa.forEach((val, index, arr) => {
        sum += val;
        count++;
      });
      expect(count).assertEqual(4);
      expect(sum).assertEqual(303);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_0300
     * @tc.name testSparseArrayToString
     * @tc.desc Verify toString method converts SparseArray to string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayToString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = new SparseArray<int>();
      sa.length = 3;
      sa.push(1);
      sa.push(2);
      expect(sa.toString()).assertEqual(',,,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_0400
     * @tc.name testSparseArrayFind
     * @tc.desc Verify find method returns first element matching predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayFind', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = createLargeSparseArray();
      let found = sa.find((val) => val > 100);
      expect(found).assertEqual(200);
      let notFound = sa.find((val) => val > 500);
      expect(notFound).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_0500
     * @tc.name testSparseArraySplice
     * @tc.desc Verify splice method removes and adds elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArraySplice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = new SparseArray<int>();
      sa.length = 5;
      sa.push(10, 20);
      let deleted = sa.splice(2, 4, 100);
      expect(sa.length).assertEqual(4);
      expect(deleted.length).assertEqual(4);
      expect(deleted.at(3)).assertEqual(10);
      expect(sa.at(2)).assertEqual(100);
      expect(sa.at(3)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_0600
     * @tc.name testSparseArrayFindIndex
     * @tc.desc Verify findIndex method returns index of first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayFindIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = createLargeSparseArray();
      let index = sa.findIndex((val) => val === 200);
      expect(index).assertEqual(501);
      let notFoundIndex = sa.findIndex((val) => val === 999);
      expect(notFoundIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_0700
     * @tc.name testSparseArrayFilter
     * @tc.desc Verify filter method returns elements matching predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayFilter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = createLargeSparseArray();
      let filtered = sa.filter((val) => val > 10);
      expect(filtered.length).assertEqual(2);
      expect(filtered.at(0)).assertEqual(100);
      expect(filtered.at(1)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_0800
     * @tc.name testSparseArrayIncludes
     * @tc.desc Verify includes method checks if element exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayIncludes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = createLargeSparseArray();
      expect(sa.includes(100)).assertEqual(true);
      expect(sa.includes(999)).assertEqual(false);
      expect(sa.includes(200, 501)).assertEqual(true);
      expect(sa.includes(100, 501)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_0900
     * @tc.name testSparseArrayIndexOf
     * @tc.desc Verify indexOf method returns index of element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayIndexOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = createLargeSparseArray();
      expect(sa.indexOf(100)).assertEqual(500);
      expect(sa.indexOf(999)).assertEqual(-1);
      expect(sa.indexOf(100, 501)).assertEqual(-1);
      expect(sa.indexOf(2, 1000)).assertEqual(1003);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_1000
     * @tc.name testSparseArrayIsSparseArray
     * @tc.desc Verify isArray method checks if value is SparseArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayIsSparseArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = new SparseArray<int>();
      expect(SparseArray.isArray(sa)).assertEqual(true);
      expect(SparseArray.isArray(new Array<int>())).assertEqual(false);
      expect(SparseArray.isArray(1)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_1100
     * @tc.name testSparseArrayJoin
     * @tc.desc Verify join method concatenates array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayJoin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = new SparseArray<int>();
      sa.push(1);
      sa.length = 3;
      sa.push(2);
      expect(sa.join()).assertEqual('1,,,2');
      expect(sa.join('-')).assertEqual('1---2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_1200
     * @tc.name testSparseArraySlice
     * @tc.desc Verify slice method extracts section of SparseArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArraySlice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = createLargeSparseArray();
      let sliced = sa.slice(500, 502);
      expect(sliced.length).assertEqual(2);
      expect(sliced.at(0)).assertEqual(100);
      expect(sliced.at(1)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_1300
     * @tc.name testSparseArrayLengthSetter
     * @tc.desc Verify length setter truncates SparseArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayLengthSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = new SparseArray<int>(1, 2, 3);
      expect(sa.length).assertEqual(3);
      sa.length = 1;
      expect(sa.length).assertEqual(1);
      expect(sa.at(0)).assertEqual(1);
      expect(sa.at(1)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_1400
     * @tc.name testSparseArrayFrom
     * @tc.desc Verify from method creates SparseArray from iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayFrom', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr = SparseArray.from<int>([1, 2, 3]);
      expect(arr.length).assertEqual(3);
      expect(arr.at(0)).assertEqual(1);
      
      let arrMap = SparseArray.from<int, string>([1, 2, 3], (v: int) => v.toString());
      expect(arrMap.at(0)).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_1500
     * @tc.name testSparseArrayFindLastAndIndex
     * @tc.desc Verify findLast and findLastIndex methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayFindLastAndIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = new SparseArray<int>();
      sa[0] = 10;
      sa[2] = 30;
      sa[4] = 50;
      let found = sa.findLast((v: int) => v > 20);
      expect(found).assertEqual(50);
      let index = sa.findLastIndex((v: int) => v > 20);
      expect(index).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_1600
     * @tc.name testSparseArraySort
     * @tc.desc Verify sort method sorts SparseArray elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArraySort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = new SparseArray<int>(3, 1, 4, 1, 5);
      sa.sort((a: int, b: int) => a - b);
      expect(sa.at(0)).assertEqual(1);
      expect(sa.at(1)).assertEqual(1);
      expect(sa.at(2)).assertEqual(3);
      expect(sa.at(3)).assertEqual(4);
      expect(sa.at(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_1700
     * @tc.name testSparseArrayCopyWithin
     * @tc.desc Verify copyWithin method copies elements within SparseArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayCopyWithin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = new SparseArray<int>(1, 2, 3, 4, 5);
      sa.copyWithin(0, 3, 4);
      expect(sa.at(0)).assertEqual(4);
      expect(sa.at(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_1800
     * @tc.name testSparseArrayConcat
     * @tc.desc Verify concat method merges SparseArrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayConcat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa1 = new SparseArray<int>(1, 2);
      let sa2 = new Array<int>(3, 4);
      let newSa = sa1.concat(sa2);
      expect(newSa.length).assertEqual(4);
      expect(newSa.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_1900
     * @tc.name testSparseArrayFlat
     * @tc.desc Verify flat method flattens nested SparseArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayFlat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let inner = new SparseArray<int>(44, 55);
      let sa = new SparseArray<int | SparseArray<int>>();
      sa.push(1, 3);
      sa.push(inner);
      let res = sa.flat();
      expect(res.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_2000
     * @tc.name testSparseArrayFlatMap
     * @tc.desc Verify flatMap method maps and flattens SparseArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayFlatMap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = new SparseArray<int>(1, 2);
      let res = sa.flatMap((v: int) => {
        let inner = new SparseArray<int>();
        inner.push(v, v * 10);
        return inner;
      });
      expect(res.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_2100
     * @tc.name testSparseArraySome
     * @tc.desc Verify some method checks if any element matches predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArraySome', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = new SparseArray<int>(1, 2, 3);
      expect(sa.some((v: int) => v > 2)).assertEqual(true);
      expect(sa.some((v: int) => v > 5)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_2200
     * @tc.name testSparseArrayMap
     * @tc.desc Verify map method transforms SparseArray elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayMap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = new SparseArray<int>(1, 2);
      let doubled = sa.map((v: int) => v * 2);
      expect(doubled.at(0)).assertEqual(2);
      expect(doubled.at(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_2300
     * @tc.name testSparseArrayPopAndShift
     * @tc.desc Verify pop and shift methods remove elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayPopAndShift', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = new SparseArray<int>(1, 2, 3);
      expect(sa.pop()).assertEqual(3);
      expect(sa.length).assertEqual(2);
      expect(sa.shift()).assertEqual(1);
      expect(sa.length).assertEqual(1);
      expect(sa.at(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_2400
     * @tc.name testSparseArrayFill
     * @tc.desc Verify fill method fills SparseArray with value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayFill', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = new SparseArray<int>(1, 2, 3);
      sa.fill(4);
      expect(sa.at(0)).assertEqual(4);
      expect(sa.at(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_2500
     * @tc.name testSparseArrayUnshift
     * @tc.desc Verify unshift method adds elements to front
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayUnshift', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = new SparseArray<int>(3, 4);
      let len = sa.unshift(1, 2);
      expect(len).assertEqual(4);
      expect(sa.at(0)).assertEqual(1);
      expect(sa.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_2600
     * @tc.name testSparseArrayReverse
     * @tc.desc Verify reverse method reverses SparseArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayReverse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = new SparseArray<int>(1, 2, 3);
      sa.reverse();
      expect(sa.at(0)).assertEqual(3);
      expect(sa.at(2)).assertEqual(1);
    });
    
    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_2700
     * @tc.name testSparseArrayToReversed
     * @tc.desc Verify toReversed method returns reversed copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayToReversed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = new SparseArray<int>(1, 2, 3);
      let reversed = sa.toReversed();
      expect(reversed.at(0)).assertEqual(3);
      expect(sa.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_2800
     * @tc.name testSparseArrayLastIndexOf
     * @tc.desc Verify lastIndexOf method returns last index of element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayLastIndexOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = new SparseArray<int>(1, 2, 3, 2, 4);
      expect(sa.lastIndexOf(2)).assertEqual(3);
      expect(sa.lastIndexOf(5)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_2900
     * @tc.name testSparseArrayReduce
     * @tc.desc Verify reduce and reduceRight methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayReduce', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = new SparseArray<int>(1, 2, 3, 4);
      let sum = sa.reduce((acc: int, curr: int) => acc + curr);
      expect(sum).assertEqual(10);
      let sumRight = sa.reduceRight((acc: int, curr: int) => acc + curr);
      expect(sumRight).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_3000
     * @tc.name testSparseArrayEvery
     * @tc.desc Verify every method checks if all elements match predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayEvery', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = new SparseArray<int>(1, 2, 3);
      expect(sa.every((v: int) => v > 0)).assertEqual(true);
      expect(sa.every((v: int) => v > 1)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_3100
     * @tc.name testSparseArrayOf
     * @tc.desc Verify of method creates SparseArray from arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = SparseArray.of<string>("a", "b", "c");
      expect(sa.length).assertEqual(3);
      expect(sa.at(0)).assertEqual("a");
    });
    
    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SparseArray_3200
     * @tc.name testSparseArrayIterators
     * @tc.desc Verify keys, values, and entries iterator methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArrayIterators', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sa = new SparseArray<string>("a", "b");
      
      let keys = sa.keys();
      expect(keys.next().value).assertEqual(0);
      expect(keys.next().value).assertEqual(1);
      
      let values = sa.values();
      expect(values.next().value).assertEqual("a");
      expect(values.next().value).assertEqual("b");
    });
  });
}
