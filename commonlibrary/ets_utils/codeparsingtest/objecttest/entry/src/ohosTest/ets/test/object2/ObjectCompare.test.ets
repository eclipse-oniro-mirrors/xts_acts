/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { objectCompareTest0900, objectCompareTest0800, objectCompareTest1300,
  objectCompareTest1400,
  objectCompareTest1500,
  objectCompareTest1600,
  objectCompareTest1700,
  objectCompareTest1800,
  objectCompareTest1900,
  objectCompareTest2000,
  objectCompareTest2100,
  objectCompareTest2200,
  objectCompareTest2300,
  objectCompareTest2400,
  objectCompareTest2500,
  objectCompareTest2600,
  objectCompareTest2700,
  objectCompareTest2800,
  objectCompareTest2900,
  objectCompareTest3000,
  objectCompareTest3100,
  objectCompareTest3200,
  objectCompareTest3300,
  objectCompareTest3400,
  objectCompareTest3500,
  objectCompareTest3600,
  objectCompareTest3700,
  objectCompareTest3800,
  objectCompareTest3900,
  objectCompareTest4000,
  objectCompareTest4100,
  objectCompareTest4200,
  objectCompareTest4300,
  objectCompareTest4400,
  objectCompareTest4500,
  objectCompareTest4501,
  objectCompareTest4600,
  objectCompareTest4601,
  objectCompareTest4700,
  objectCompareTest4701,
  objectCompareTest4800,
  objectCompareTest4801,
  objectCompareTest4900} from './ObjectCompare';

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

interface ObjI{
  name?: string;
  value?: number;
}

export default function objectCompareTest() {
  describe('objectCompareTest', () => {
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
     * @tc.number SUB_OBJECT_COMPARE_TEST_0100
     * @tc.name objectCompareTest0100
     * @tc.desc compare 2 object false
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectCompareTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj1: ObjI = { name: "test", value: 10 };
      const obj2: ObjI = { name: "test", value: 10 };

      expect(obj1 == obj2).assertFalse();
      expect(obj1 === obj2).assertFalse();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_0200
     * @tc.name objectCompareTest0200
     * @tc.desc objectCompareTest true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectCompareTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj1: ObjI = { name: "test" };
      const obj2 = obj1;

      expect(obj1 == obj2).assertTrue();
      expect(obj1 === obj2).assertTrue();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_0300
     * @tc.name objectCompareTest0300
     * @tc.desc object compare test
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectCompareTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj1: ObjI = { name: "test", value: 10 };
      const obj2 = obj1;

      obj1.value = 20;

      expect(obj1 == obj2).assertTrue();
      expect(obj1 === obj2).assertTrue();

      expect(obj2.value).assertEqual(20);
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_0400
     * @tc.name objectCompareTest0400
     * @tc.desc object compare test false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectCompareTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {

      class Person{
        name: string;
        constructor(name: string) {
          this.name = name;
        }
      }

      const person1 = new Person("Alice");
      const person2 = new Person("Alice");
      const person3 = person1;

      expect(person1 == person2).assertFalse();
      expect(person1 === person2).assertFalse();

      expect(person1 == person3).assertTrue();
      expect(person1 === person3).assertTrue();
    });
    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_0500
     * @tc.name objectCompareTest0500
     * @tc.desc Compare the results of objects with different attribute orders but the same key value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectCompareTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface BaseI{
        a?: number;
        b?: number;
      }
      const obj1: BaseI = { a: 1, b: 2 };
      const obj2: BaseI = { b: 2, a: 1 };

      expect(obj1 == obj2).assertFalse();
      expect(obj1 === obj2).assertFalse();
    });
    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_0600
     * @tc.name objectCompareTest0600
     * @tc.desc Comparison of objects with different numbers of attributes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectCompareTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface BaseI{
        a?: number;
        b?: number;
      }
      const obj1: BaseI = { a: 1, b: 2 };
      const obj2: BaseI = { a: 1 };

      expect(obj1 == obj2).assertFalse();
      expect(obj1 === obj2).assertFalse();
    });
    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_0700
     * @tc.name objectCompareTest0700
     * @tc.desc Comparison of objects with different prototypes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectCompareTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface BaseI{
        x?: number;
      }
      const objArr = objectCompareTest0900() as BaseI[];
      expect(objArr[0] == objArr[1]).assertFalse();
      expect(objArr[0] === objArr[1]).assertFalse();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_0800
     * @tc.name objectCompareTest0800
     * @tc.desc Verify the behavioral differences between==and===in object and non object comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: ObjI = { value: 10 };
      const num = 10;
      const str = "10";
      const objStr = new String("10");

      expect(objStr == str).assertTrue();
      expect(objStr === str).assertFalse();
      const resultObj = objectCompareTest0800();
      expect(resultObj[0]).assertFalse();
      expect(resultObj[1]).assertTrue();
      expect(resultObj[2]).assertFalse();

      expect(resultObj[3]).assertTrue();
      expect(resultObj[4]).assertFalse();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_0900
     * @tc.name objectCompareTest0900
     * @tc.desc Comparison of objects with different prototypes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectCompareTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface BaseI{
        x?: number;
      }
      const objArr = objectCompareTest0900() as BaseI[];
      expect(objArr[0] == objArr[1]).assertFalse();
      expect(objArr[0] === objArr[1]).assertFalse();
    });
    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_1000
       * @tc.name objectCompareTest1000
     * @tc.desc Validate the comparative properties of arrays as objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectCompareTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // 内容相同的不同数组
      const arr1 = [1, 2, 3];
      const arr2 = [1, 2, 3];
      const arr3 = arr1;

      // 不同数组实例比较
      expect(arr1 == arr2).assertFalse();
      expect(arr1 === arr2).assertFalse();

      // 同一数组引用比较
      expect(arr1 == arr3).assertTrue();
      expect(arr1 === arr3).assertTrue();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_1100
     * @tc.name objectCompareTest1100
     * @tc.desc Validate the comparative properties of functions as objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectCompareTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let func = () => {
        return 1;
      }
      let func1 = () => {
        return 1;
      }

      const func3 = func;

      expect(func == func1).assertFalse();
      expect(func === func1).assertFalse();

      expect(func == func3).assertTrue();
      expect(func === func3).assertTrue();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_1200
     * @tc.name objectCompareTest1200
     * @tc.desc Verify the comparative characteristics of null and undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectCompareTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const a: null = null;
      const b: undefined = undefined;
      const c: null = null;

      expect(a == b).assertTrue();
      expect(a === b).assertFalse();

      expect(a == c).assertTrue();
      expect(a === c).assertTrue();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_1300
     * @tc.name objectCompareTest1300
     * @tc.desc Comparison of Objects with Different Constructors
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest1300', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const funArr = objectCompareTest1300();
      expect(funArr[0] == funArr[1]).assertFalse();
      expect(funArr[0] === funArr[1]).assertFalse();
    });
    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_1400
     * @tc.name objectCompareTest1400
     * @tc.desc Comparison of different instances of the same constructor
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest1400', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const funArr = objectCompareTest1400();
      expect(funArr[0] == funArr[1]).assertFalse();
      expect(funArr[0] === funArr[1]).assertFalse();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_1500
     * @tc.name objectCompareTest1500
     * @tc.desc Comparison of objects that have been serialized/deserialized
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest1500', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const jsonArr = objectCompareTest1500() as object[];
      expect(jsonArr[0] == jsonArr[1]).assertFalse();
      expect(jsonArr[0] === jsonArr[1]).assertFalse();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_1600
     * @tc.name objectCompareTest1600
     * @tc.desc Comparison between numerical raw values and packaging objects
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest1600', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const numberArr = objectCompareTest1600();
      expect(numberArr[0] == numberArr[1]).assertTrue();
      expect(numberArr[0] === numberArr[1]).assertFalse();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_1700
     * @tc.name objectCompareTest1700
     * @tc.desc Comparison between string raw values and packaging objects
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest1700', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const stringArr = objectCompareTest1700();
      expect(stringArr[0] == stringArr[1]).assertTrue();
      expect(stringArr[0] === stringArr[1]).assertFalse();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_1800
     * @tc.name objectCompareTest1800
     * @tc.desc Comparison between boolean raw values and packaging objects
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest1800', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const booArr = objectCompareTest1800();
      expect(booArr[0] == booArr[1]).assertTrue();
      expect(booArr[0] === booArr[1]).assertFalse();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_1900
     * @tc.name objectCompareTest1900
     * @tc.desc Comparison between number values of different values and packaging objects
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest1900', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const numberArr = objectCompareTest1900();
      expect(numberArr[0] == numberArr[1]).assertFalse();
      expect(numberArr[0] === numberArr[1]).assertFalse();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_2000
     * @tc.name objectCompareTest2000
     * @tc.desc Comparison between null and object
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest2000', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const nullObjArr = objectCompareTest2000();
      expect(nullObjArr[0] == nullObjArr[1]).assertFalse();
      expect(nullObjArr[0] === nullObjArr[1]).assertFalse();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_2100
     * @tc.name objectCompareTest2100
     * @tc.desc Comparison between undefined and object
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest2100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const undefinedObjArr = objectCompareTest2100();
      expect(undefinedObjArr[0] == undefinedObjArr[1]).assertFalse();
      expect(undefinedObjArr[0] === undefinedObjArr[1]).assertFalse();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_2200
     * @tc.name objectCompareTest2200
     * @tc.desc Comparison between raw value and object toString result
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest2200', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const toStringArr = objectCompareTest2200();
      expect(toStringArr[0] == toStringArr[1]).assertTrue();
      expect(toStringArr[0] === toStringArr[1]).assertFalse();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_2300
     * @tc.name objectCompareTest2300
     * @tc.desc Date Object Comparison
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest2300', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const dateArr = objectCompareTest2300();
      expect(dateArr[0] == dateArr[1]).assertFalse();
      expect(dateArr[0] === dateArr[1]).assertFalse();
      expect(dateArr[0] === dateArr[2]).assertTrue();

      expect(dateArr[0].getTime() === dateArr[1].getTime()).assertTrue();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_2400
     * @tc.name objectCompareTest2400
     * @tc.desc Comparison of Regular Expressions
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest2400', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const regArr = objectCompareTest2400();

      expect(regArr[0] == regArr[1]).assertFalse();
      expect(regArr[0] === regArr[1]).assertFalse();
      expect(regArr[0] === regArr[2]).assertTrue();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_2500
     * @tc.name objectCompareTest2500
     * @tc.desc Comparison of Map Expressions
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest2500', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const mapArr = objectCompareTest2500() as Map<string, number>[];

      expect(mapArr[0] == mapArr[1]).assertFalse();
      expect(mapArr[0] === mapArr[1]).assertFalse();
      expect(mapArr[0] === mapArr[2]).assertTrue();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_2600
     * @tc.name objectCompareTest2600
     * @tc.desc Comparison of Set Expressions
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest2600', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const setArr = objectCompareTest2600();

      expect(setArr[0] == setArr[1]).assertFalse();
      expect(setArr[0] === setArr[1]).assertFalse();
      expect(setArr[0] === setArr[2]).assertTrue();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_2700
     * @tc.name objectCompareTest2700
     * @tc.desc Comparison of different types of objects
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest2700', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const differentArr = objectCompareTest2700();

      expect(differentArr[0] == differentArr[1]).assertFalse();
      expect(differentArr[1] == differentArr[2]).assertFalse();
      expect(differentArr[2] == differentArr[3]).assertFalse();
      expect(differentArr[3] == differentArr[0]).assertFalse();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_2800
     * @tc.name objectCompareTest2800
     * @tc.desc Class instance comparison
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest2800', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const instanceArr = objectCompareTest2800();

      expect(instanceArr[0] == instanceArr[1]).assertFalse();
      expect(instanceArr[0] === instanceArr[1]).assertFalse();
      expect(instanceArr[0] === instanceArr[2]).assertTrue();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_2900
     * @tc.name objectCompareTest2900
     * @tc.desc Comparison between empty arrays and empty objects
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest2900', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const differentArr = objectCompareTest2900();

      expect(differentArr[0] == differentArr[1]).assertFalse();
      expect(differentArr[0] === differentArr[1]).assertFalse();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_3000
     * @tc.name objectCompareTest3000
     * @tc.desc Comparison between string objects and arrays
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest3000', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const stringAndArr = objectCompareTest3000();

      expect(stringAndArr[0] == stringAndArr[1]).assertFalse();
      expect(stringAndArr[0] === stringAndArr[1]).assertFalse();

      expect(stringAndArr[0] == stringAndArr[1]).assertFalse();
      expect(stringAndArr[0] === stringAndArr[1]).assertFalse();
      expect(stringAndArr[0].toString() == (stringAndArr[1] as string[]).join('')).assertTrue();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_3100
     * @tc.name objectCompareTest3100
     * @tc.desc Comparison of nested objects at the first level
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest3100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const nestFirstArr = objectCompareTest3100();

      expect(nestFirstArr[0] == nestFirstArr[1]).assertFalse();
      expect(nestFirstArr[0] === nestFirstArr[1]).assertFalse();
      expect(nestFirstArr[0].a == nestFirstArr[1].a).assertFalse();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_3200
     * @tc.name objectCompareTest3200
     * @tc.desc Comparison of nested objects at the two level
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest3200', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const nestTwoArr = objectCompareTest3100();

      expect(nestTwoArr[0] == nestTwoArr[1]).assertFalse();
      expect(nestTwoArr[0] === nestTwoArr[1]).assertFalse();
      expect(nestTwoArr[0].a.b == nestTwoArr[1].a.b).assertTrue();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_3300
     * @tc.name objectCompareTest3300
     * @tc.desc Comparison of nested objects with partially shared references
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest3300', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const shareObjArr = objectCompareTest3300();

      expect(shareObjArr[0] == shareObjArr[1]).assertFalse();
      expect(shareObjArr[0] === shareObjArr[1]).assertFalse();

      expect(shareObjArr[0].b == shareObjArr[1].b).assertTrue();
      expect(shareObjArr[0].b === shareObjArr[1].b).assertTrue();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_3400
     * @tc.name objectCompareTest3400
     * @tc.desc Comparison of nested objects containing arrays
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest3400', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const nestArrArr = objectCompareTest3400();

      expect(nestArrArr[0] == nestArrArr[1]).assertFalse();
      expect(nestArrArr[0] === nestArrArr[1]).assertFalse();
      expect(nestArrArr[0].a == nestArrArr[1].a).assertFalse();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_3500
     * @tc.name objectCompareTest3500
     * @tc.desc Comparison of nested objects containing functions
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest3500', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const nestFunArr = objectCompareTest3500();

      expect(nestFunArr[0] == nestFunArr[1]).assertFalse();
      expect(nestFunArr[0] === nestFunArr[1]).assertFalse();
      expect(nestFunArr[0].a == nestFunArr[1].a).assertFalse();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_3600
     * @tc.name objectCompareTest3600
     * @tc.desc Comparison of nested object properties after modification
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest3600', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const nestChangeArr = objectCompareTest3600();

      expect(nestChangeArr[0] === nestChangeArr[1]).assertTrue();
      expect(nestChangeArr[0].a === nestChangeArr[1].a).assertTrue();

      nestChangeArr[0].a.b = 2;

      expect(nestChangeArr[0] === nestChangeArr[1]).assertTrue();
      expect(nestChangeArr[0].a === nestChangeArr[1].a).assertTrue();
      expect(nestChangeArr[1].a.b).assertEqual(2);
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_3700
     * @tc.name objectCompareTest3700
     * @tc.desc Comparison after replacing nested objects
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest3700', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const nestChangeArr = objectCompareTest3600();

      expect(nestChangeArr[0].a === nestChangeArr[1].a).assertTrue();

      objectCompareTest3700(nestChangeArr[0]);

      expect(nestChangeArr[0] === nestChangeArr[1]).assertTrue();
      expect(nestChangeArr[0].a === nestChangeArr[1].a).assertTrue();
      expect(nestChangeArr[1].a.b).assertEqual(2);
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_3800
     * @tc.name objectCompareTest3800
     * @tc.desc Comparison of mixed type nested objects
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest3800', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const mixedNestArr = objectCompareTest3800();

      expect(mixedNestArr[0] == mixedNestArr[1]).assertFalse();
      expect(mixedNestArr[0] === mixedNestArr[1]).assertFalse();
      expect(mixedNestArr[0].c == mixedNestArr[1].c).assertFalse();
      expect(mixedNestArr[0].e == mixedNestArr[1].e).assertFalse();
      expect(mixedNestArr[0].f == mixedNestArr[1].f).assertFalse();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_3900
     * @tc.name objectCompareTest3900
     * @tc.desc Comparison of Circular Reference Objects
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest3900', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const circularObjArr = objectCompareTest3900();

      expect(circularObjArr[0] == circularObjArr[1]).assertFalse();
      expect(circularObjArr[0] === circularObjArr[1]).assertFalse();
      expect(circularObjArr[0] === circularObjArr[2]).assertTrue();
      expect(circularObjArr[0].self === circularObjArr[2].self).assertTrue();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_4000
     * @tc.name objectCompareTest4000
     * @tc.desc Comparison of shallow copy objects
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest4000', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const shallowCopyArr = objectCompareTest4000();

      expect(shallowCopyArr[0] == shallowCopyArr[1]).assertFalse();
      expect(shallowCopyArr[0] === shallowCopyArr[1]).assertFalse();

      expect(shallowCopyArr[0].b == shallowCopyArr[1].b).assertTrue();
      expect(shallowCopyArr[0].b === shallowCopyArr[1].b).assertTrue();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_4100
     * @tc.name objectCompareTest4100
     * @tc.desc Object.assign copy compare
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest4100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const assignCopyArr = objectCompareTest4100();

      expect(assignCopyArr[0] == assignCopyArr[1]).assertFalse();
      expect(assignCopyArr[0] === assignCopyArr[1]).assertFalse();
      expect(assignCopyArr[0].b == assignCopyArr[1].b).assertTrue();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_4200
     * @tc.name objectCompareTest4200
     * @tc.desc Comparison of deep copy objects
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest4200', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      interface BaseI1{
        c: number;
      }
      interface BaseI2{
        a: number;
        b: BaseI1;
        d: number[];
      }
      const deepCopyArr = objectCompareTest4200() as BaseI2[];

      expect(deepCopyArr[0] == deepCopyArr[1]).assertFalse();
      expect(deepCopyArr[0] === deepCopyArr[1]).assertFalse();
      expect(deepCopyArr[0].b == deepCopyArr[1].b).assertFalse();
      expect(deepCopyArr[0].d == deepCopyArr[1].d).assertFalse();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_4300
     * @tc.name objectCompareTest4300
     * @tc.desc The impact of modifying the original object on shallow copies
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest4300', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const shallowCopyArr = objectCompareTest4300();

      expect(shallowCopyArr[1].b.c).assertEqual(3);
      expect(shallowCopyArr[0].b === shallowCopyArr[1].b).assertTrue();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_4400
     * @tc.name objectCompareTest4400
     * @tc.desc The impact of modifying the original object on deep copy
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest4400', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      interface BaseI1{
        c: number;
      }
      interface BaseI2{
        a: number;
        b: BaseI1;
      }
      const deepCopyArr = objectCompareTest4400() as BaseI2[];

      expect(deepCopyArr[1].b.c).assertEqual(2);
      expect(deepCopyArr[0].b === deepCopyArr[1].b).assertFalse();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_4500
     * @tc.name objectCompareTest4500
     * @tc.desc Comparison of modified object properties
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest4500', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const modifiedArr = objectCompareTest4500();

      expect(modifiedArr[0] === modifiedArr[1]).assertTrue();

      objectCompareTest4501(modifiedArr[0])

      expect(modifiedArr[0] === modifiedArr[1]).assertTrue();
      expect(modifiedArr[1].a).assertEqual(2);
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_4600
     * @tc.name objectCompareTest4600
     * @tc.desc Comparison after replacing object attributes
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest4600', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const replaceArr = objectCompareTest4600();

      expect(replaceArr[0] === replaceArr[1]).assertTrue();

      objectCompareTest4601(replaceArr[0])

      expect(replaceArr[0] === replaceArr[1]).assertTrue();
      expect(replaceArr[1].a.b).assertEqual(2);
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_4700
     * @tc.name objectCompareTest4700
     * @tc.desc Comparison of objects after adding attributes
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest4700', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const addAttArr = objectCompareTest4700();

      expect(addAttArr[0] === addAttArr[1]).assertTrue();

      objectCompareTest4701(addAttArr[0])

      expect(addAttArr[0] === addAttArr[1]).assertTrue();
      expect(addAttArr[1].b).assertEqual(2);
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_4800
     * @tc.name objectCompareTest4800
     * @tc.desc Comparison of objects after deleting attributes
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest4800', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const delAttArr = objectCompareTest4800();

      expect(delAttArr[0] === delAttArr[1]).assertTrue();

      objectCompareTest4801(delAttArr[0])

      expect(delAttArr[0] === delAttArr[1]).assertTrue();
      expect(delAttArr[1].b).assertUndefined();
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_4900
     * @tc.name objectCompareTest4900
     * @tc.desc Freeze object comparison
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest4900', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const freezeObjArr = objectCompareTest4900();

      expect(freezeObjArr[0] == freezeObjArr[1]).assertFalse();
      expect(freezeObjArr[0] === freezeObjArr[1]).assertFalse();
      expect(freezeObjArr[0] === freezeObjArr[2]).assertTrue();
    });


    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_5000
     * @tc.name objectCompareTest5000
     * @tc.desc Validate the reference comparison feature of nested objects (non content comparison)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('objectCompareTest5000', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      interface Base1{
        c: number;
      }
      interface Base2{
        a: number;
        b: Base1;
      }
      interface Base3{
        x: Base2;
      }
      const nestedObj: Base2 = { a: 1, b: { c: 2 } };
      const obj1: Base3 = { x: nestedObj };
      const obj2: Base3 = { x: { a: 1, b: { c: 2 } } };
      const obj3 = obj1;

      expect(obj1 == obj2).assertFalse();
      expect(obj1 === obj2).assertFalse();
      expect(obj1 == obj3).assertTrue();

      expect(obj1.x == obj2.x).assertFalse();
      expect(obj1.x == obj3.x).assertTrue();

      nestedObj.a = 3;
      expect(obj3.x.a).assertEqual(3);
    });

    /**
     * @tc.number SUB_OBJECT_COMPARE_TEST_5100
     * @tc.name objectCompareTest5100
     * @tc.desc Comprehensive verification of various object comparison scenarios
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectCompareTest5100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      interface Base{
        id: number;
      }
      const base: Base = { id: 1 };

      const ref1 = base;
      const ref2 = ref1;

      const newObj: Base = { id: 1 };

      const arrBase = [1, 2, 3];
      const arrRef = arrBase;
      const arrNew = [1, 2, 3];

      expect(base == ref1).assertTrue();
      expect(ref1 === ref2).assertTrue();
      expect(arrBase == arrRef).assertTrue();

      expect(base == newObj).assertFalse();
      expect(arrBase === arrNew).assertFalse();

      ref2.id = 2;
      expect(base.id).assertEqual(2);
      expect(newObj.id).assertEqual(1);

      expect(null == undefined).assertTrue();
      expect(null === undefined).assertFalse();
      let arrA = [];
      let arrB = [];
      expect(arrA == arrB).assertFalse();
    });
  });
}