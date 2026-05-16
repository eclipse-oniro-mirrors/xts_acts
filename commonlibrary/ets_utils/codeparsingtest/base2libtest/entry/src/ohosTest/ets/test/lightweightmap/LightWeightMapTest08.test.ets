import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
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

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function localUnitTest() {
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST08_0001
     * @tc.name      testLightWeightMapTest08Chapter0001
     * @tc.desc      Use for..of (Symbol.iterator) to iterate and verify order and key/value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest08Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest08Chapter0001';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);

      let firstKey = "";
      let firstValue = 0;
      let secondKey = "";
      let secondValue = 0;
      let index = 0;

      for (let item of lightWeightMap) {
        let key = item[0];
        let value = item[1];
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST08_0002
     * @tc.name      testLightWeightMapTest08Chapter0002
     * @tc.desc      Use explicit iterator = map[Symbol.iterator]() to iterate entries and verify order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest08Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest08Chapter0002';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);

      let iter = lightWeightMap[Symbol.iterator]();
      let temp: IteratorResult<[string, number]> = iter.next();

      let firstKey = "";
      let firstValue = 0;
      let secondKey = "";
      let secondValue = 0;
      let index = 0;

      while (!temp.done) {
        let pair = temp.value;
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST08_0003
     * @tc.name      testLightWeightMapTest08Chapter0003
     * @tc.desc      Call Symbol.iterator on empty map, iterator should yield no elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest08Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest08Chapter0003';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();

      let iter = lightWeightMap[Symbol.iterator]();
      let temp: IteratorResult<[string, number]> = iter.next();
      let count = 0;

      while (!temp.done) {
        count++;
        temp = iter.next();
      }

      expect(count === 0).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST08_0004
     * @tc.name      testLightWeightMapTest08Chapter0004
     * @tc.desc      Iterate class instances and modify their fields inside loop, verify changes take effect
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest08Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest08Chapter0004';
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST08_0005
     * @tc.name      testLightWeightMapTest08Chapter0005
     * @tc.desc      Insert new key during for..of iteration, iterator should not crash and visits initial items
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest08Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest08Chapter0005';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("x1", 1);
      lightWeightMap.set("x2", 2);

      let visited = 0;
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST08_0006
     * @tc.name      testLightWeightMapTest08Chapter0006
     * @tc.desc      Iterate with Symbol.iterator when value is Uint8Array and verify contents
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest08Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest08Chapter0006';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, Uint8Array>();
      let u8 = new Uint8Array([72, 101, 108, 108, 111]); // "Hello"
      lightWeightMap.set("bytes", u8);

      let iter = lightWeightMap[Symbol.iterator]();
      let temp: IteratorResult<[string, Uint8Array]> = iter.next();
      let ok = false;

      while (!temp.done) {
        let key = temp.value[0];
        let value = temp.value[1];
        if (key === "bytes" && value.length === 5 && value[0] === 72 && value[4] === 111) {
          ok = true;
        }
        temp = iter.next();
      }

      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST08_0007
     * @tc.name      testLightWeightMapTest08Chapter0007
     * @tc.desc      Iterate with Symbol.iterator when value is simple object and verify fields
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest08Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest08Chapter0007';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, SimpleObj05>();
      let obj: SimpleObj05 = { a: 10, b: "hello" };
      lightWeightMap.set("o", obj);

      let iter = lightWeightMap[Symbol.iterator]();
      let temp: IteratorResult<[string, SimpleObj05]> = iter.next();
      let ok = false;

      while (!temp.done) {
        let key = temp.value[0];
        let value = temp.value[1];
        if (key === "o" && value.a === 10 && value.b === "hello") {
          ok = true;
        }
        temp = iter.next();
      }

      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });


    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST08_0008
     * @tc.name      testLightWeightMapTest08Chapter0008
     * @tc.desc      Use Uint8Array as key and verify iterated key reference equals original key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest08Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest08Chapter0008';
      console.log(TAG + 'start');

      let keyArr = new Uint8Array([1, 2, 3]);
      let lightWeightMap = new LightWeightMap<Uint8Array, string>();
      lightWeightMap.set(keyArr, 'arrKey');

      let iter = lightWeightMap[Symbol.iterator]();
      let temp = iter.next();
      let sameRef = false;

      while (!temp.done) {
        let key = temp.value[0];
        let value = temp.value[1];
        if (value === 'arrKey' && key === keyArr) {
          sameRef = true;
        }
        temp = iter.next();
      }

      expect(sameRef).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST08_0009
     * @tc.name      testLightWeightMapTest08Chapter0009
     * @tc.desc      Iterate many elements with Symbol.iterator and check that sum of values is correct
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest08Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest08Chapter0009';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<number, number>();
      let expectedSum = 0;
      for (let i = 0; i < 100; i++) {
        lightWeightMap.set(i, i);
        expectedSum += i;
      }

      let sum = 0;
      let count = 0;
      for (let item of lightWeightMap) {
        sum += item[1];
        count++;
      }

      let ok = (count === 100 && sum === expectedSum);
      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });


    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST08_0010
     * @tc.name      testLightWeightMapTest08Chapter0010
     * @tc.desc      Compare first element from entries() and Symbol.iterator() and ensure they match
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest08Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest08Chapter0010';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('a', 1);
      lightWeightMap.set('b', 2);

      let iterEntries = lightWeightMap.entries();
      let iterSymbol = lightWeightMap[Symbol.iterator]();

      let e1 = iterEntries.next();
      let s1 = iterSymbol.next();

      let ok = (!e1.done && !s1.done &&
        e1.value[0] === s1.value[0] &&
        e1.value[1] === s1.value[1]);
      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });


  });
}