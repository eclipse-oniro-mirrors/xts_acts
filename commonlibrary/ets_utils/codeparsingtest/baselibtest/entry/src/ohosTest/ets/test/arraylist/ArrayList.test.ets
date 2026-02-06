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
import { ArrayList } from '@kit.ArkTS';

class Temp {
  age: number = 0
  name: string = ""
}

export default function ArrayListTest() {
  describe('arrayListTest', () => {
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
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_LENGTH_0100
     * @tc.name      : testArrayListLength0001
     * @tc.desc      : Testing ArrayList length is ok
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testArrayListLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testArrayListLength0001';
      try {
        const arrayList = new ArrayList<number>();
        expect(arrayList.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_CONSTRUCTOR_0100
     * @tc.name      : testArrayListConstructor0001
     * @tc.desc      : Testing ArrayList constructor support dataType
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testArrayListConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testArrayListConstructor0001';
      try {
        let arrayList: ArrayList<number | string | Array<number | string | boolean> | boolean | bigint | Int8Array |
        Int16Array | Int32Array | undefined | null | Symbol | Uint8Array | Uint16Array | Uint32Array |
        BigInt64Array | BigUint64Array> = new ArrayList();
        expect(arrayList.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_ADD_0100
     * @tc.name      : testArrayListAdd0001
     * @tc.desc      : Testing ArrayList Add different dataType data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testArrayListAdd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testArrayListAdd0001';
      try {
        let arrayList: ArrayList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new ArrayList();
        arrayList.add("zhang san");
        arrayList.add(1);
        arrayList.add({
          age: 10, name: "zhang"
        });
        arrayList.add(undefined);
        arrayList.add(null);
        arrayList.add(true);
        arrayList.insert("insert", 0);
        arrayList.add([0, 1, 2, undefined]);
        arrayList.removeByIndex(0);
        let jsonResult = JSON.stringify(arrayList);
        console.log(`${TAG} jsonResult: ${jsonResult}`);
        expect(jsonResult)
          .assertEqual(`{"0":"zhang san","1":1,"2":{"age":10,"name":"zhang"},"4":null,"5":true,"6":[0,1,2,null]}`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_ADD_0200
     * @tc.name      : testArrayListAdd0002
     * @tc.desc      : Testing ArrayList add special string
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testArrayListAdd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testArrayListAdd0002';
      try {
        let arrayList: ArrayList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new ArrayList();
        arrayList.add("");
        arrayList.add("`");
        arrayList.add("%");
        arrayList.add(`"`);
        let jsonResult = JSON.stringify(arrayList);
        console.log(`${TAG} jsonResult: ${jsonResult}`);
        expect(jsonResult).assertEqual(`{"0":"","1":"\`","2":"%","3":"\\""}`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_INSERT_0100
     * @tc.name      : testArrayListInsert0001
     * @tc.desc      : Testing ArrayList insert data in start and end
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testArrayListInsert0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testArrayListInsert0001';
      try {
        let arrayList: ArrayList<number | string> = new ArrayList();
        arrayList.add("zhang");
        arrayList.insert("start", 0);
        arrayList.insert("end", arrayList.length);
        let startIndex = arrayList.getIndexOf("start");
        arrayList.removeByIndex(startIndex);
        let endIndex = arrayList.getIndexOf("end");
        arrayList.removeByIndex(endIndex);
        expect(arrayList.has("start")).assertEqual(false);
        expect(arrayList.has("end")).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_INSERT_0200
     * @tc.name      : testArrayListInsert0002
     * @tc.desc      : Testing ArrayList insert special string
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testArrayListInsert0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testArrayListInsert0002';
      try {
        let arrayList: ArrayList<number | string> = new ArrayList();
        arrayList.insert("`", 0);
        arrayList.insert("%", 1);
        arrayList.insert(`"`, 2);
        let index1 = arrayList.getIndexOf("`");
        arrayList.removeByIndex(index1);
        let index2 = arrayList.getIndexOf("%");
        arrayList.removeByIndex(index2);
        let index3 = arrayList.getIndexOf(`"`);
        arrayList.removeByIndex(index3);
        expect(arrayList.has("`")).assertEqual(false);
        expect(arrayList.has("%")).assertEqual(false);
        expect(arrayList.has(`"`)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_HAS_0100
     * @tc.name      : testArrayListHas0001
     * @tc.desc      : Testing ArrayList check has data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListHas0001';
      try {

        let arrayList: ArrayList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new ArrayList();
        arrayList.add("zhang san");
        arrayList.add(1);
        let temp: Temp = {
          age: 10, name: "zhang"
        };
        arrayList.add(temp);
        arrayList.add(undefined);
        arrayList.add(null);
        arrayList.add(true);
        let array = [0, 1, 2, undefined];
        arrayList.add(array);
        arrayList.add("");
        arrayList.add("`");
        arrayList.add("%");
        arrayList.add(`"`);

        expect(arrayList.has("zhang san")).assertEqual(true);
        expect(arrayList.has(1)).assertEqual(true);
        expect(arrayList.has(temp)).assertEqual(true);
        expect(arrayList.has(undefined)).assertEqual(true);
        expect(arrayList.has(null)).assertEqual(true);
        expect(arrayList.has(true)).assertEqual(true);
        expect(arrayList.has(array)).assertEqual(true);
        expect(arrayList.has("")).assertEqual(true);
        expect(arrayList.has("`")).assertEqual(true);
        expect(arrayList.has("%")).assertEqual(true);
        expect(arrayList.has(`"`)).assertEqual(true);

        arrayList.remove("zhang san");
        arrayList.remove(1);
        arrayList.remove(temp);
        arrayList.remove(undefined);
        arrayList.remove(null);
        arrayList.remove(true);
        arrayList.remove(array);
        arrayList.remove("");
        arrayList.remove("`");
        arrayList.remove("%");
        arrayList.remove(`"`);

        expect(arrayList.has("zhang san")).assertEqual(false);
        expect(arrayList.has(1)).assertEqual(false);
        expect(arrayList.has(temp)).assertEqual(false);
        expect(arrayList.has(undefined)).assertEqual(false);
        expect(arrayList.has(null)).assertEqual(false);
        expect(arrayList.has(true)).assertEqual(false);
        expect(arrayList.has(array)).assertEqual(false);
        expect(arrayList.has("")).assertEqual(false);
        expect(arrayList.has("`")).assertEqual(false);
        expect(arrayList.has("%")).assertEqual(false);
        expect(arrayList.has(`"`)).assertEqual(false);

      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_GETINDEXOF_0100
     * @tc.name      : testArrayListGetIndexOf0001
     * @tc.desc      : Testing ArrayList getIndexOf
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListGetIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListGetIndexOf0001';
      try {
        let arrayList: ArrayList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new ArrayList();
        arrayList.add("zhang san");
        arrayList.add(1);
        let temp: Temp = {
          age: 10, name: "zhang"
        };
        arrayList.add(temp);
        arrayList.add(undefined);
        arrayList.add(null);
        arrayList.add(true);
        let array = [0, 1, 2, undefined];
        arrayList.add(array);
        arrayList.add("");
        arrayList.add("`");
        arrayList.add("%");
        arrayList.add(`"`);

        arrayList.add("zhang san");
        arrayList.add(1);
        let index1 = arrayList.getIndexOf("zhang san");
        expect(index1).assertEqual(0);
        let index2 = arrayList.getIndexOf(1);
        expect(index2).assertEqual(1);

        arrayList.remove(1);
        arrayList.remove("zhang san");

        expect(arrayList.has("zhang san")).assertEqual(true);
        expect(arrayList.has(1)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_GETLASTINDEXOF_0100
     * @tc.name      : testArrayListGetLastIndexOf0001
     * @tc.desc      : Testing ArrayList getLastIndexOf
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListGetLastIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListGetLastIndexOf0001';
      try {
        let arrayList: ArrayList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new ArrayList();
        arrayList.add("zhang san");
        arrayList.add(1);
        let temp: Temp = {
          age: 10, name: "zhang"
        };
        arrayList.add(temp);
        arrayList.add(undefined);
        arrayList.add(null);
        arrayList.add(true);
        let array = [0, 1, 2, undefined];
        arrayList.add(array);
        arrayList.add("");
        arrayList.add("`");
        arrayList.add("%");
        arrayList.add(`"`);

        arrayList.add("zhang san");
        arrayList.add(1);
        let index1 = arrayList.getLastIndexOf("zhang san");
        expect(index1).assertEqual(11);
        let index2 = arrayList.getLastIndexOf(1);
        expect(index2).assertEqual(12);

        arrayList.remove(1);
        arrayList.remove("zhang san");

        expect(arrayList.has("zhang san")).assertEqual(true);
        expect(arrayList.has(1)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_REMOVEBYINDEX_0100
     * @tc.name      : testArrayListRemoveByIndexOf0001
     * @tc.desc      : Testing ArrayList removeByIndex
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListRemoveByIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListRemoveByIndexOf0001';
      try {
        let arrayList: ArrayList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new ArrayList();
        arrayList.add("zhang san");
        arrayList.add(1);
        let temp: Temp = {
          age: 10, name: "zhang"
        };
        arrayList.add(temp);
        arrayList.add(undefined);
        arrayList.add(null);
        arrayList.add(true);
        let array = [0, 1, 2, undefined];
        arrayList.add(array);
        arrayList.add("");
        arrayList.add("`");
        arrayList.add("%");
        arrayList.add(`"`);

        let index1 = arrayList.getIndexOf("");
        let result = arrayList.removeByIndex(index1);
        let result1 = arrayList.removeByIndex(index1);
        expect(result != result1).assertEqual(true);

        let index2 = arrayList.getIndexOf("%");
        let result2 = arrayList.removeByIndex(index2);
        let result3 = arrayList.removeByIndex(index2);
        expect(result2 != result3).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_REMOVEBYINDEX_0200
     * @tc.name      : testArrayListRemoveByIndexOf0002
     * @tc.desc      : Testing ArrayList removeByIndex -2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListRemoveByIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testArrayListRemoveByIndexOf0002"
      try {
        let arrayList: ArrayList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new ArrayList();
        arrayList.add("zhang san");
        arrayList.add(1);
        let temp: Temp = {
          age: 10, name: "zhang"
        };
        arrayList.add(temp);
        arrayList.add(undefined);
        arrayList.add(null);
        arrayList.add(true);
        let array = [0, 1, 2, undefined];
        arrayList.add(array);
        arrayList.add("");
        arrayList.add("`");
        arrayList.add("%");
        arrayList.add(`"`);

        arrayList.removeByIndex(-2);
        arrayList.removeByIndex(arrayList.length);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_REMOVEBYINDEX_0300
     * @tc.name      : testArrayListRemoveByIndexOf0003
     * @tc.desc      : Testing ArrayList removeByIndex index > arrayList.length -1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListRemoveByIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListRemoveByIndexOf0003'
      try {
        let arrayList: ArrayList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new ArrayList();
        arrayList.add("zhang san");
        arrayList.add(1);
        let temp: Temp = {
          age: 10, name: "zhang"
        };
        arrayList.add(temp);
        arrayList.add(undefined);
        arrayList.add(null);
        arrayList.add(true);
        let array = [0, 1, 2, undefined];
        arrayList.add(array);
        arrayList.add("");
        arrayList.add("`");
        arrayList.add("%");
        arrayList.add(`"`);

        arrayList.removeByIndex(arrayList.length);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_REMOVE_0100
     * @tc.name      : testArrayListRemove0001
     * @tc.desc      : Testing ArrayList remove same data and check
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListRemove0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListRemove0001';
      try {
        let arrayList: ArrayList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new ArrayList();
        arrayList.add("zhang san");
        arrayList.add(1);
        let temp: Temp = {
          age: 10, name: "zhang"
        };
        arrayList.add(temp);
        arrayList.add(undefined);
        arrayList.add(null);
        arrayList.add(true);
        let array = [0, 1, 2, undefined];
        arrayList.add(array);
        arrayList.add("");
        arrayList.add("`");
        arrayList.add("%");
        arrayList.add(`"`);

        arrayList.remove("zhang san");
        arrayList.remove(1);
        arrayList.remove(temp);
        arrayList.remove(undefined);
        arrayList.remove(null);
        arrayList.remove(true);
        arrayList.remove(array);
        arrayList.remove("");
        arrayList.remove("`");
        arrayList.remove("%");
        arrayList.remove(`"`);

        arrayList.insert("zhang san", 0);
        arrayList.insert("zhang san", 1);
        arrayList.insert("zhang san", 2);

        let index = arrayList.getIndexOf("zhang san");
        expect(index).assertEqual(0);
        arrayList.remove("zhang san");
        let index1 = arrayList.getIndexOf("zhang san");
        expect(index1).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_REMOVE_0200
     * @tc.name      : testArrayListRemove0002
     * @tc.desc      : Testing ArrayList removeByIndex same data and check
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListRemove0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListRemove0002';
      try {
        let arrayList: ArrayList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new ArrayList();
        arrayList.add("zhang san");
        arrayList.add(1);
        let temp: Temp = {
          age: 10, name: "zhang"
        };
        arrayList.add(temp);
        arrayList.add(undefined);
        arrayList.add(null);
        arrayList.add(true);
        let array = [0, 1, 2, undefined];
        arrayList.add(array);
        arrayList.add("");
        arrayList.add("`");
        arrayList.add("%");
        arrayList.add(`"`);

        arrayList.remove("zhang san");
        arrayList.remove(1);
        arrayList.remove(temp);
        arrayList.remove(undefined);
        arrayList.remove(null);
        arrayList.remove(true);
        arrayList.remove(array);
        arrayList.remove("");
        arrayList.remove("`");
        arrayList.remove("%");
        arrayList.remove(`"`);

        arrayList.insert("zhang san", 0);
        arrayList.insert("zhang san", 1);
        arrayList.insert("zhang san", 2);

        let index = arrayList.getIndexOf("zhang san");
        expect(index).assertEqual(0);
        arrayList.removeByIndex(index);
        let index1 = arrayList.getIndexOf("zhang san");
        expect(index1).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_REMOVEBYRANGE_0100
     * @tc.name      : testArrayListRemoveByRange0001
     * @tc.desc      : Testing ArrayList removeByRange fromIndex == toIndex
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListRemoveByRange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListRemoveByRange0001';
      try {
        let arrayList: ArrayList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new ArrayList();
        arrayList.add("zhang san");
        arrayList.add(1);
        let temp: Temp = {
          age: 10, name: "zhang"
        };
        arrayList.add(temp);
        arrayList.add(undefined);
        arrayList.add(null);
        arrayList.add(true);
        let array = [0, 1, 2, undefined];
        arrayList.add(array);
        arrayList.add("");
        arrayList.add("`");
        arrayList.add("%");
        arrayList.add(`"`);

        arrayList.removeByRange(1, 1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_REMOVEBYRANGE_0200
     * @tc.name      : testArrayListRemoveByRange0002
     * @tc.desc      : Testing ArrayList removeByRange toIndex is Math.floor(arrayList.length)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListRemoveByRange0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListRemoveByRange0002';
      try {
        let arrayList: ArrayList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new ArrayList();
        arrayList.add("zhang san");
        arrayList.add(1);
        let temp: Temp = {
          age: 10, name: "zhang"
        };
        arrayList.add(temp);
        arrayList.add(undefined);
        arrayList.add(null);
        arrayList.add(true);
        let array = [0, 1, 2, undefined];
        arrayList.add(array);
        arrayList.add("");
        arrayList.add("`");
        arrayList.add("%");
        arrayList.add(`"`);

        let fromIndex = Math.floor(1.5);
        arrayList.removeByRange(fromIndex, Math.floor(arrayList.length));
        expect(arrayList.length).assertEqual(fromIndex);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_REPLACEALLELEMENT_0100
     * @tc.name      : testArrayListReplaceAllElement0001
     * @tc.desc      : Testing ArrayList replaceAllElement add same data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListReplaceAllElement0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListReplaceAllElement0001';
      try {
        let arrayList: ArrayList<string> = new ArrayList();
        arrayList.add("zhang san");
        arrayList.add("");
        arrayList.add("`");
        arrayList.add("%");
        arrayList.add(`"`);
        arrayList.replaceAllElements((value: string, index: number) => {
          let tmp = value;
          value = tmp + value;
          let result = arrayList[index];
          expect(value).assertEqual(result + result);
          return value;
        })
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_REPLACEALLELEMENT_0200
     * @tc.name      : testArrayListReplaceAllElement0002
     * @tc.desc      : Testing ArrayList replaceAllElement insert new string
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListReplaceAllElement0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListReplaceAllElement0002';
      try {
        let arrayList: ArrayList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new ArrayList();
        arrayList.add("zhang san");
        arrayList.add(1);
        let temp: Temp = {
          age: 10, name: "zhang"
        };
        arrayList.add(temp);
        arrayList.add(undefined);
        arrayList.add(null);
        arrayList.add(true);
        let array = [0, 1, 2, undefined];
        arrayList.add(array);
        arrayList.add("");
        arrayList.add("`");
        arrayList.add("%");
        arrayList.add(`"`);

        arrayList.replaceAllElements((value, index, tempList) => {
          let indexValue = index ?? 0;
          let length = tempList ? tempList.length - 1 : 0;
          if (indexValue === length) {
            let tmp = value as string;
            value = tmp + "add last index";
          }
          return value;
        })
        expect(arrayList.has(`"add last index`)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_FOREACH_0100
     * @tc.name      : testArrayListForEach0001
     * @tc.desc      : Testing ArrayList forEach
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListForEach0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListForEach0001';
      try {
        let arrayList: ArrayList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new ArrayList();
        arrayList.add("zhang san");
        arrayList.add(1);
        let temp: Temp = {
          age: 10, name: "zhang"
        };
        arrayList.add(temp);
        arrayList.add(undefined);
        arrayList.add(null);
        arrayList.add(true);
        let array = [0, 1, 2, undefined];
        arrayList.add(array);
        arrayList.add("");
        arrayList.add("`");
        arrayList.add("%");
        arrayList.add(`"`);

        arrayList.forEach((value) => {
          expect(arrayList.has(value)).assertEqual(true);
        })
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_SORT_0100
     * @tc.name      : testArrayListSort0001
     * @tc.desc      : Testing ArrayList sort by Ascending Order
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListSort0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListSort0001';
      try {
        let arrayList: ArrayList<number> = new ArrayList();
        arrayList.add(1);
        arrayList.add(22);
        arrayList.add(3);
        arrayList.add(24);
        arrayList.add(5);
        arrayList.add(51);
        arrayList.add(8);
        arrayList.add(0);
        arrayList.sort((firstValue, secondValue) => firstValue - secondValue);
        console.log(JSON.stringify(arrayList));
        expect(JSON.stringify(arrayList)).assertEqual(`{"0":0,"1":1,"2":3,"3":5,"4":8,"5":22,"6":24,"7":51}`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_SORT_0200
     * @tc.name      : testArrayListSort0002
     * @tc.desc      : Testing ArrayList sort by Descending Order
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListSort0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListSort0002';
      try {
        let arrayList: ArrayList<number> = new ArrayList();
        arrayList.add(1);
        arrayList.add(22);
        arrayList.add(3);
        arrayList.add(24);
        arrayList.add(5);
        arrayList.add(51);
        arrayList.add(8);
        arrayList.add(0);
        arrayList.sort((firstValue, secondValue) => secondValue - firstValue);
        console.log(JSON.stringify(arrayList));
        expect(JSON.stringify(arrayList)).assertEqual(`{"0":51,"1":24,"2":22,"3":8,"4":5,"5":3,"6":1,"7":0}`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_SORT_0300
     * @tc.name      : testArrayListSort0003
     * @tc.desc      : Testing ArrayList sort insert string
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListSort0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListSort0003';
      try {
        let arrayList: ArrayList<number | string> = new ArrayList();
        arrayList.add(1);
        arrayList.add(22);
        arrayList.add(3);
        arrayList.add(24);
        arrayList.add(5);
        arrayList.add(51);
        arrayList.add(8);
        arrayList.add(0);
        arrayList.add("zhang san");
        arrayList.sort();
        console.log(JSON.stringify(arrayList));
        expect(JSON.stringify(arrayList))
          .assertEqual(`{"0":0,"1":1,"2":22,"3":24,"4":3,"5":5,"6":51,"7":8,"8":"zhang san"}`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_SORT_0400
     * @tc.name      : testArrayListSort0004
     * @tc.desc      : Testing ArrayList sort insert 'A'
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListSort0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListSort0004';
      try {
        let arrayList: ArrayList<number | string> = new ArrayList();
        arrayList.add(1);
        arrayList.add(22);
        arrayList.add(3);
        arrayList.add(24);
        arrayList.add(5);
        arrayList.add(51);
        arrayList.add(8);
        arrayList.add(0);
        arrayList.add("A");
        arrayList.sort();
        console.log(JSON.stringify(arrayList));
        expect(JSON.stringify(arrayList))
          .assertEqual(`{"0":0,"1":1,"2":22,"3":24,"4":3,"5":5,"6":51,"7":8,"8":"A"}`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_SUBARRAYLIST_0100
     * @tc.name      : testArrayListSubArrayList0001
     * @tc.desc      : Testing ArrayList subArrayList
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListSubArrayList0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListSubArrayList0001';
      try {
        let arrayList: ArrayList<number | string> = new ArrayList();
        arrayList.add(1);
        arrayList.add(22);
        arrayList.add(3);
        arrayList.add(24);
        arrayList.add(5);
        arrayList.add(51);
        arrayList.add(8);
        arrayList.add(0);
        arrayList.subArrayList(Math.floor(1), Math.floor(5));
        console.log(JSON.stringify(arrayList));
        expect(JSON.stringify(arrayList))
          .assertEqual(`{"0":1,"1":22,"2":3,"3":24,"4":5,"5":51,"6":8,"7":0}`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_CLEAR_0100
     * @tc.name      : testArrayListClear0001
     * @tc.desc      : Testing ArrayList insert->add->subArrayList->clear
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListClear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListClear0001';
      try {
        let arrayList: ArrayList<number | string> = new ArrayList();
        arrayList.insert(2, 0);
        arrayList.add(1);
        arrayList.add(22);
        arrayList.subArrayList(Math.floor(1), Math.floor(2));
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_CLONE_0100
     * @tc.name      : testArrayListClone0001
     * @tc.desc      : Testing ArrayList insert->add->subArrayList->clone
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListClone0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListClone0001';
      try {
        let arrayList: ArrayList<number | string> = new ArrayList();
        arrayList.insert(2, 0);
        arrayList.add(1);
        arrayList.add(22);
        arrayList.subArrayList(Math.floor(1), Math.floor(2));
        let result = arrayList.clone();
        expect(arrayList.length).assertEqual(result.length);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_CLONE_0200
     * @tc.name      : testArrayListClone0002
     * @tc.desc      : Testing ArrayList insert->add->subArrayList->clear->clone
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListClone0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListClone0002';
      try {
        let arrayList: ArrayList<number | string> = new ArrayList();
        arrayList.insert(2, 0);
        arrayList.add(1);
        arrayList.add(22);
        arrayList.subArrayList(Math.floor(1), Math.floor(2));
        arrayList.clear();
        let result = arrayList.clone();
        expect(result.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_GETCAPACITY_0100
     * @tc.name      : testArrayListGetCapacity0001
     * @tc.desc      : Testing ArrayList insert->add->remove->subArrayList->getCapacity
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListGetCapacity0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListGetCapacity0001';
      try {
        let arrayList: ArrayList<number | string> = new ArrayList();
        arrayList.insert(2, 0);
        arrayList.add(1);
        arrayList.add(22);
        arrayList.remove(1);
        arrayList.increaseCapacityTo(1);
        arrayList.subArrayList(Math.floor(1), Math.floor(2));
        arrayList.trimToCurrentLength();
        let result = arrayList.getCapacity();
        expect(result).assertEqual(arrayList.length);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_GETCAPACITY_0200
     * @tc.name      : testArrayListGetCapacity0002
     * @tc.desc      : Testing ArrayList insert->add->remove->subArrayList->clear->getCapacity
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListGetCapacity0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListGetCapacity0002';
      try {
        let arrayList: ArrayList<number | string> = new ArrayList();
        arrayList.insert(2, 0);
        arrayList.add(1);
        arrayList.add(22);
        arrayList.remove(1)
        arrayList.subArrayList(Math.floor(1), Math.floor(2));
        arrayList.clear();
        arrayList.trimToCurrentLength();
        expect(arrayList.getCapacity()).assertEqual(0);
        arrayList.increaseCapacityTo(1)
        expect(arrayList.getCapacity()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_CONVERTTOARRAY_0100
     * @tc.name      : testArrayListConvertToArray0001
     * @tc.desc      : Testing ArrayList convertToArray filter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListConvertToArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListConvertToArray0001';
      try {
        class Dog {
          age: number = 0
          name: string = ""

          constructor(age: number, name: string) {
            this.age = age;
            this.name = name;
          }
        }

        let arrayList: ArrayList<Dog> = new ArrayList();
        let dog = new Dog(1, "jiu jiu");
        arrayList.add(dog);
        let array = arrayList.convertToArray();
        array.filter((value) => {
          expect(value instanceof Dog).assertEqual(true);
        })
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_CONVERTTOARRAY_0200
     * @tc.name      : testArrayListConvertToArray0002
     * @tc.desc      : Testing ArrayList convertToArray fill
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListConvertToArray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListConvertToArray0002';
      try {
        class Dog {
          age: number = 0
          name: string = ""

          constructor(age: number, name: string) {
            this.age = age;
            this.name = name;
          }
        }

        class Cat {
          age1: number = 0
          name1: string = ""

          constructor(age: number, name: string) {
            this.age1 = age;
            this.name1 = name;
          }
        }

        let arrayList: ArrayList<Dog | Cat> = new ArrayList();
        let dog = new Dog(1, "jiu jiu");
        arrayList.add(dog);
        let array = arrayList.convertToArray();
        let cat = new Cat(2, "li li");
        array.fill(cat);
        expect(array[0] instanceof Dog).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_ISEMPTY_0100
     * @tc.name      : testArrayListIsEmpty0001
     * @tc.desc      : Testing ArrayList isEmpty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListIsEmpty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListIsEmpty0001';
      try {
        let arrayList: ArrayList<number> = new ArrayList();
        expect(arrayList.isEmpty()).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_ISEMPTY_0200
     * @tc.name      : testArrayListIsEmpty0002
     * @tc.desc      : Testing ArrayList isEmpty has data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListIsEmpty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListIsEmpty0002';
      try {
        let arrayList: ArrayList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new ArrayList();
        arrayList.add("zhang san");
        arrayList.add(1);
        let temp: Temp = {
          age: 10, name: "zhang"
        };
        arrayList.add(temp);
        arrayList.add(undefined);
        arrayList.add(null);
        arrayList.add(true);
        let array = [0, 1, 2, undefined];
        arrayList.add(array);
        arrayList.add("");
        arrayList.add("`");
        arrayList.add("%");
        arrayList.add(`"`);

        expect(arrayList.isEmpty()).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_ISEMPTY_0300
     * @tc.name      : testArrayListIsEmpty0003
     * @tc.desc      : Testing ArrayList isEmpty clear->isEmpty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListIsEmpty0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListIsEmpty0003';
      try {
        let arrayList: ArrayList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new ArrayList();
        arrayList.add("zhang san");
        arrayList.add(1);
        let temp: Temp = {
          age: 10, name: "zhang"
        };
        arrayList.add(temp);
        arrayList.add(undefined);
        arrayList.add(null);
        arrayList.add(true);
        let array = [0, 1, 2, undefined];
        arrayList.add(array);
        arrayList.add("");
        arrayList.add("`");
        arrayList.add("%");
        arrayList.add(`"`);
        arrayList.clear();
        expect(arrayList.isEmpty()).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_SYMBOL_ITERATOR_0100
     * @tc.name      : testArrayListSymbolIterator0001
     * @tc.desc      : Testing ArrayList Symbol.iterator
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListSymbolIterator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListSymbolIterator0001';
      try {
        let arrayList: ArrayList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new ArrayList();
        arrayList.add("zhang san");
        arrayList.add(1);
        let temp: Temp = {
          age: 10, name: "zhang"
        };
        arrayList.add(temp);
        arrayList.add(undefined);
        arrayList.add(null);
        arrayList.add(true);
        let array = [0, 1, 2, undefined];
        arrayList.add(array);
        arrayList.add("");
        arrayList.add("`");
        arrayList.add("%");
        arrayList.add(`"`);
        let iter = arrayList[Symbol.iterator]();
        let tem = iter.next();
        while (!tem.done) {
          console.log(`${TAG} value: ${tem.value}`);
          expect(arrayList.has(tem.value)).assertEqual(true);
          tem = iter.next();
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_REPLACEALLELEMENTS_0100
     * @tc.name      : testArrayListReplaceAllElements0001
     * @tc.desc      : Testing ArrayList isEmpty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListReplaceAllElements0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListReplaceAllElements0001';
      try {
        let arrayList: ArrayList<number> = new ArrayList();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(4);
        arrayList.replaceAllElements((value: number): number => {
          return value + 1;
        });
        expect(arrayList.convertToArray().toString()).assertEqual("3,5,6,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_REPLACEALLELEMENTS_0200
     * @tc.name      : testArrayListReplaceAllElements0002
     * @tc.desc      : Testing ArrayList isEmpty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListReplaceAllElements0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListReplaceAllElements0002';
      try {
        let arrayList: ArrayList<number> = new ArrayList();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(4);
        arrayList.replaceAllElements((value: number): number => {
          return value - 1;
        }, undefined);
        expect(arrayList.convertToArray().toString()).assertEqual("1,3,4,3");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_REPLACEALLELEMENTS_0300
     * @tc.name      : testArrayListReplaceAllElements0003
     * @tc.desc      : Testing ArrayList isEmpty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListReplaceAllElements0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListReplaceAllElements0003';
      try {
        let arrayList: ArrayList<number> = new ArrayList();
        let newArrayList: ArrayList<number> = new ArrayList();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(4);
        arrayList.replaceAllElements((value: number): number => {
          return value - 1;
        }, newArrayList);
        expect(arrayList.convertToArray().toString()).assertEqual("1,3,4,3");
        expect(newArrayList.convertToArray().toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_REPLACEALLELEMENTS_0300
     * @tc.name      : testArrayListReplaceAllElements0003
     * @tc.desc      : Testing ArrayList isEmpty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListReplaceAllElements0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListReplaceAllElements0004';
      try {
        let arrayList: ArrayList<number> = new ArrayList();
        let newArrayList: ArrayList<number> = new ArrayList();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(4);
        newArrayList.add(3);
        newArrayList.add(5);
        newArrayList.add(7);
        arrayList.replaceAllElements((value: number): number => {
          return value - 1;
        }, newArrayList);
        expect(arrayList.convertToArray().toString()).assertEqual("1,3,4,3");
        expect(newArrayList.convertToArray().toString()).assertEqual("3,5,7");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_FOREACH_0200
     * @tc.name      : testArrayListForEach0002
     * @tc.desc      : Testing ArrayList isEmpty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListForEach0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListForEach0002';
      try {
        let arrayList: ArrayList<number> = new ArrayList();
        let newArrayList: ArrayList<number> = new ArrayList();
        let result: ArrayList<number> = new ArrayList();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(4);
        arrayList.forEach((value: number, index?: number) => {
          result.add(value);
          result.add(index);
        },newArrayList);
        expect(arrayList.convertToArray().toString()).assertEqual("2,4,5,4");
        expect(newArrayList.convertToArray().toString()).assertEqual("");
        expect(result.convertToArray().toString()).assertEqual("2,0,4,1,5,2,4,3");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_FOREACH_0100
     * @tc.name      : testArrayListForEach0003
     * @tc.desc      : Testing ArrayList isEmpty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListForEach0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListForEach0003';
      try {
        let arrayList: ArrayList<number> = new ArrayList();
        let newArrayList: ArrayList<number> = new ArrayList();
        let result: ArrayList<number> = new ArrayList();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(4);
        newArrayList.add(4)
        arrayList.forEach((value: number, index?: number) => {
          result.add(value);
          result.add(index);
        },newArrayList);
        expect(arrayList.convertToArray().toString()).assertEqual("2,4,5,4");
        expect(newArrayList.convertToArray().toString()).assertEqual("4");
        expect(result.convertToArray().toString()).assertEqual("2,0,4,1,5,2,4,3");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_SYMBOL_0200
     * @tc.name      : testArrayListSymbol0002
     * @tc.desc      : Testing ArrayList isEmpty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayListSymbol0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayListSymbol0002';
      try {
        let arrayList: ArrayList<number> = new ArrayList();
        let result: ArrayList<number> = new ArrayList();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(4);

        let numbers: Array<number> = arrayList.convertToArray()
        for (let item of numbers) {
          result.add(item);
        }
        expect(arrayList.convertToArray().toString()).assertEqual("2,4,5,4");
        expect(result.convertToArray().toString()).assertEqual("2,4,5,4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
  });
}