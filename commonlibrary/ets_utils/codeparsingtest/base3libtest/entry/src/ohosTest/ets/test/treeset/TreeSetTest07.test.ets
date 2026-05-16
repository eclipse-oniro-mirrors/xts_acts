import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { TreeSet, util } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function TreeSet07Test() {
  describe('TreeSet07Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
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
     * @tc.number    SUB_TREESET_TEST07_0100
     * @tc.name      testTreeSet07Chapter0001
     * @tc.desc      Test basic iteration over TreeSet with string elements using for...of loop
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet07Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet07Chapter0001';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("squirrel");
      treeSet.add("sparrow");
      treeSet.add("eagle");
      let result: Array<string> = [];
      for (let item of treeSet) {
        result.push(item);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("eagle");
      expect(result[1]).assertEqual("sparrow");
      expect(result[2]).assertEqual("squirrel");
    });

    /**
     * @tc.number    SUB_TREESET_TEST07_0200
     * @tc.name      testTreeSet07Chapter0002
     * @tc.desc      Test iteration over empty TreeSet using for...of loop
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet07Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet07Chapter0002';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      let count: number = 0;
      for (let item of treeSet) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREESET_TEST07_0300
     * @tc.name      testTreeSet07Chapter0003
     * @tc.desc      Test manual iteration using Symbol.iterator and next() method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet07Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet07Chapter0003';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      treeSet.add(100);
      treeSet.add(200);
      treeSet.add(300);
      let iter: IterableIterator<number> = treeSet[Symbol.iterator]();
      let temp: IteratorResult<number> = iter.next();
      let result: Array<number> = [];
      while (!temp.done) {
        result.push(temp.value);
        temp = iter.next();
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(100);
      expect(result[1]).assertEqual(200);
      expect(result[2]).assertEqual(300);
    });

    /**
     * @tc.number    SUB_TREESET_TEST07_0400
     * @tc.name      testTreeSet07Chapter0004
     * @tc.desc      Test iteration with mixed types including undefined and null values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet07Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet07Chapter0004';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string | undefined | null> = new TreeSet<string | undefined | null>();
      treeSet.add("test");
      treeSet.add(undefined);
      treeSet.add(null);
      let result: Array<string | undefined | null> = [];
      for (let item of treeSet) {
        result.push(item);
      }
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREESET_TEST07_0500
     * @tc.name      testTreeSet07Chapter0005
     * @tc.desc      Test iteration with special number values including Infinity, -Infinity and NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet07Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet07Chapter0005';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      treeSet.add(Infinity);
      treeSet.add(-Infinity);
      treeSet.add(NaN);
      treeSet.add(0);
      let result: Array<number> = [];
      for (let item of treeSet) {
        result.push(item);
      }
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_TREESET_TEST07_0600
     * @tc.name      testTreeSet07Chapter0006
     * @tc.desc      Test iteration with maximum safe integer values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet07Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet07Chapter0006';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      treeSet.add(Number.MAX_SAFE_INTEGER);
      treeSet.add(Number.MIN_SAFE_INTEGER);
      treeSet.add(Number.MAX_VALUE);
      treeSet.add(Number.MIN_VALUE);
      let result: Array<number> = [];
      for (let item of treeSet) {
        result.push(item);
      }
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_TREESET_TEST07_0700
     * @tc.name      testTreeSet07Chapter0007
     * @tc.desc      Test iteration with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet07Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet07Chapter0007';
      console.log(TAG + ' start');
      let treeSet: TreeSet<boolean> = new TreeSet<boolean>();
      treeSet.add(true);
      treeSet.add(false);
      let result: Array<boolean> = [];
      for (let item of treeSet) {
        result.push(item);
      }
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREESET_TEST07_0800
     * @tc.name      testTreeSet07Chapter0008
     * @tc.desc      Test iteration with large number of elements (performance test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet07Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet07Chapter0008';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      for (let i = 0; i < 10; i++) {
        treeSet.add(i);
      }
      let count: number = 0;
      for (let item of treeSet) {
        count++;
        expect(item).assertEqual(count - 1);
      }
      expect(count).assertEqual(10);
    });

    /**
     * @tc.number    SUB_TREESET_TEST07_0900
     * @tc.name      testTreeSet07Chapter0009
     * @tc.desc      Test iteration order with reverse sorted elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet07Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet07Chapter0009';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      for (let i = 10; i > 0; i--) {
        treeSet.add(i);
      }
      let expected: number = 1;
      for (let item of treeSet) {
        expect(item).assertEqual(expected);
        expected++;
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST07_1000
     * @tc.name      testTreeSet07Chapter0010
     * @tc.desc      Test iteration with duplicate elements (should not appear multiple times)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet07Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet07Chapter0010';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("apple");
      treeSet.add("apple");
      treeSet.add("banana");
      treeSet.add("banana");
      treeSet.add("cherry");
      let result: Array<string> = [];
      for (let item of treeSet) {
        result.push(item);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("apple");
      expect(result[1]).assertEqual("banana");
      expect(result[2]).assertEqual("cherry");
    });


    /**
     * @tc.number    SUB_TREESET_TEST07_1100
     * @tc.name      testTreeSet07Chapter0011
     * @tc.desc      Test iteration while modifying TreeSet (add operation during iteration)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet07Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet07Chapter0011';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      treeSet.add(1);
      treeSet.add(2);
      treeSet.add(3);
      let count: number = 0;
      for (let item of treeSet) {
        count++;
        if (item === 2) {
          treeSet.add(4);
        }
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number    SUB_TREESET_TEST07_1200
     * @tc.name      testTreeSet07Chapter0012
     * @tc.desc      Test iteration while modifying TreeSet (remove operation during iteration)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet07Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet07Chapter0012';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      for (let i = 0; i < 10; i++) {
        treeSet.add(i);
      }
      let count: number = 0;
      for (let item of treeSet) {
        count++;
        if (item === 5) {
          treeSet.remove(6);
        }
      }
      expect(count).assertEqual(9);
    });

    /**
     * @tc.number    SUB_TREESET_TEST07_1300
     * @tc.name      testTreeSet07Chapter0013
     * @tc.desc      Test multiple independent iterators on same TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet07Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet07Chapter0013';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("a");
      treeSet.add("b");
      treeSet.add("c");
      let iter1: IterableIterator<string> = treeSet[Symbol.iterator]();
      let iter2: IterableIterator<string> = treeSet[Symbol.iterator]();
      let result1: Array<string> = [];
      let result2: Array<string> = [];
      let temp1 = iter1.next();
      let temp2 = iter2.next();
      while (!temp1.done) {
        result1.push(temp1.value);
        temp1 = iter1.next();
      }
      while (!temp2.done) {
        result2.push(temp2.value);
        temp2 = iter2.next();
      }
      expect(result1.length).assertEqual(3);
      expect(result2.length).assertEqual(3);
      expect(result1[0]).assertEqual("a");
      expect(result2[0]).assertEqual("a");
    });

    /**
     * @tc.number    SUB_TREESET_TEST07_1400
     * @tc.name      testTreeSet07Chapter0014
     * @tc.desc      Test iteration with complex objects in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet07Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet07Chapter0014';
      console.log(TAG + ' start');

      class TestObject {
        id: number;
        name: string;

        constructor(id: number, name: string) {
          this.id = id;
          this.name = name;
        }
      }

      let treeSet: TreeSet<TestObject> = new TreeSet<TestObject>((a: TestObject, b: TestObject): boolean => {
        return a.id < b.id;
      });
      let obj1 = new TestObject(1, "first");
      let obj2 = new TestObject(2, "second");
      let obj3 = new TestObject(3, "third");
      treeSet.add(obj1);
      treeSet.add(obj2);
      treeSet.add(obj3);
      let result: Array<TestObject> = [];
      for (let item of treeSet) {
        result.push(item);
      }
      expect(result.length).assertEqual(3);
      expect(result[0].id).assertEqual(1);
      expect(result[1].id).assertEqual(2);
      expect(result[2].id).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREESET_TEST07_1500
     * @tc.name      testTreeSet07Chapter0015
     * @tc.desc      Test iteration after clearing TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet07Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet07Chapter0015';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      for (let i = 0; i < 5; i++) {
        treeSet.add(i);
      }
      treeSet.clear();
      let count: number = 0;
      for (let item of treeSet) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREESET_TEST07_1600
     * @tc.name      testTreeSet07Chapter0016
     * @tc.desc      Test iteration with string containing special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet07Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet07Chapter0016';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("!@#$%^&*()");
      treeSet.add("test\nnewline");
      treeSet.add("tab\tcharacter");
      let result: Array<string> = [];
      for (let item of treeSet) {
        result.push(item);
      }
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREESET_TEST07_1700
     * @tc.name      testTreeSet07Chapter0017
     * @tc.desc      Test iteration with emoji and unicode characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet07Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet07Chapter0017';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("👆");
      treeSet.add("👿");
      treeSet.add("👀");
      treeSet.add("💯");
      let result: Array<string> = [];
      for (let item of treeSet) {
        result.push(item);
      }
      expect(result.length).assertEqual(4);
    });
  })
}