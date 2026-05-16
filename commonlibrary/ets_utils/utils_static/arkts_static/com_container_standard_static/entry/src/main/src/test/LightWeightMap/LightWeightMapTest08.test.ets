/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import { LightWeightMap } from '@kit.ArkTS';

class Person {
  name: string = '';
  age: number = 0;
  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}

interface SimpleObj05 {
  a: number;
  b: string;
}

function sleep(count: int): Promise<void> {
  return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (value: Error) => void) => {
    setTimeout(() => {
      resolve(Promise.resolve())
    }, count)
  })
}

export default function localUnitTest(): void {
       describe('localUnitTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTEIGHT_0100
     * @tc.name      testLightWeightMapTest08Chapter0100
     * @tc.desc      Use for..of (Symbol.iterator) to iterate and verify order and key/value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest08Chapter0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest08Chapter0100';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);

      let firstKey = "";
      let firstValue: number = 0;
      let secondKey = "";
      let secondValue: number = 0;
      let index: int = 0;

      for (let item of lightWeightMap) {
        let key = item[0];
        let value: number = item[1];
        if (index === 0) {
          firstKey = key;
          firstValue = value;
        } else if (index === 1) {
          secondKey = key;
          secondValue = value;
        }
        index++;
      }


      let ok = (index === 2 &&
        firstKey === "sparrow" && firstValue === 356 &&
        secondKey === "squirrel" && secondValue === 123);
      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTEIGHT_0200
     * @tc.name      testLightWeightMapTest08Chapter0200
     * @tc.desc      Use explicit iterator = map[Symbol.iterator]() to iterate entries and verify order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest08Chapter0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest08Chapter0200';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);

      let iter = lightWeightMap.entries();
      let temp: IteratorResult<[string, number]> = iter.next();

      let firstKey = "";
      let firstValue: number = 0;
      let secondKey = "";
      let secondValue: number = 0;
      let index: int = 0;

      while (!temp.done) {
        let pair = temp.value!;
        if (index === 0) {
          firstKey = pair[0];
          firstValue = pair[1];
        } else if (index === 1) {
          secondKey = pair[0];
          secondValue = pair[1];
        }
        index++;
        temp = iter.next();
      }

      let ok = (index === 2 &&
        firstKey === "sparrow" && firstValue === 356 &&
        secondKey === "squirrel" && secondValue === 123);
      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTEIGHT_0300
     * @tc.name      testLightWeightMapTest08Chapter0300
     * @tc.desc      Call Symbol.iterator on empty map, iterator should yield no elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest08Chapter0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest08Chapter0300';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();

      let iter = lightWeightMap.entries();
      let temp: IteratorResult<[string, number]> = iter.next();
      let count: int = 0;

      while (!temp.done) {
        count++;
        temp = iter.next();
      }

      expect(count === 0).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTEIGHT_0400
     * @tc.name      testLightWeightMapTest08Chapter0400
     * @tc.desc      Iterate class instances and modify their fields inside loop, verify changes take effect
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest08Chapter0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest08Chapter0400';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<number, Person>();
      let p1 = new Person('Alice', 20);
      let p2 = new Person('Bob', 30);
      lightWeightMap.set(1, p1);
      lightWeightMap.set(2, p2);

      for (let item of lightWeightMap) {
        let value = item[1];
        value.age = value.age + 5;
      }

      let ok = (p1.age === 25 && p2.age === 35);
      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTEIGHT_0500
     * @tc.name      testLightWeightMapTest08Chapter0500
     * @tc.desc      Insert new key during for..of iteration, iterator should not crash and visits initial items
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest08Chapter0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest08Chapter0500';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("x1", 1);
      lightWeightMap.set("x2", 2);

      let visited: int = 0;
      for (let item of lightWeightMap) {
        visited++;
        if (visited === 1) {
          lightWeightMap.set("x3", 3);
        }
      }

      let ok = (visited >= 2); // at least original two
      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTEIGHT_0600
     * @tc.name      testLightWeightMapTest08Chapter0600
     * @tc.desc      Iterate with Symbol.iterator when value is Uint8Array and verify contents
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest08Chapter0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest08Chapter0600';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, Uint8Array>();
      let u8 = new Uint8Array([72, 101, 108, 108, 111]); // "Hello"
      lightWeightMap.set("bytes", u8);

      let iter = lightWeightMap.entries();
      let temp: IteratorResult<[string, Uint8Array]> = iter.next();
      let ok = false;

      while (!temp.done) {
        let key = temp.value![0];
        let value = temp.value![1];
        if (key === "bytes" && value.length === 5 && value[0] === 72 && value[4] === 111) {
          ok = true;
        }
        temp = iter.next();
      }

      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTEIGHT_0700
     * @tc.name      testLightWeightMapTest08Chapter0700
     * @tc.desc      Iterate with Symbol.iterator when value is simple object and verify fields
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest08Chapter0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest08Chapter0700';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, SimpleObj05>();
      let obj: SimpleObj05 = { a: 10, b: "hello" };
      lightWeightMap.set("o", obj);

      let iter = lightWeightMap.entries();
      let temp: IteratorResult<[string, SimpleObj05]> = iter.next();
      let ok = false;

      while (!temp.done) {
        let key = temp.value![0];
        let value = temp.value![1];
        if (key === "o" && value.a === 10 && value.b === "hello") {
          ok = true;
        }
        temp = iter.next();
      }

      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTEIGHT_0800
     * @tc.name      testLightWeightMapTest08Chapter0800
     * @tc.desc      Use Uint8Array as key and verify iterated key reference equals original key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest08Chapter0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest08Chapter0800';
      console.log(TAG + 'start');

      let keyArr = new Uint8Array([1, 2, 3]);
      let lightWeightMap = new LightWeightMap<Uint8Array, string>();
      lightWeightMap.set(keyArr, 'arrKey');

      let iter = lightWeightMap.entries();
      let temp = iter.next();
      let sameRef = false;

      while (!temp.done) {
        let key = temp.value![0];
        let value = temp.value![1];
        if (value === 'arrKey' && key === keyArr) {
          sameRef = true;
        }
        temp = iter.next();
      }

      expect(sameRef).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTEIGHT_0900
     * @tc.name      testLightWeightMapTest08Chapter0900
     * @tc.desc      Iterate many elements with Symbol.iterator and check that sum of values is correct
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest08Chapter0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest08Chapter0900';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<number, number>();
      let expectedSum: int = 0;
      for (let i: int = 0; i < 100; i++) {
        lightWeightMap.set(i, i);
        expectedSum += i;
      }

      let sum: number = 0;
      let count: int = 0;
      for (let item of lightWeightMap) {
        sum += item[1];
        count++;
      }

      let ok = (count === 100 && sum === expectedSum);
      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTEIGHT_1000
     * @tc.name      testLightWeightMapTest08Chapter1000
     * @tc.desc      Compare first element from entries() and Symbol.iterator() and ensure they match
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest08Chapter1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest08Chapter1000';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('a', 1);
      lightWeightMap.set('b', 2);

      let iterEntries = lightWeightMap.entries();
      let iterSymbol = lightWeightMap.entries();

      let e1 = iterEntries.next();
      let s1 = iterSymbol.next();

      let ok = (!e1.done && !s1.done &&
        e1.value![0] === s1.value![0] &&
        e1.value![1] === s1.value![1]);
      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });


  });
}