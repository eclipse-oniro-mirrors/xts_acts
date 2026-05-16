import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { TreeSet, util } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function TreeSet01Test() {
  describe('TreeSet01Test', () => {
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
     * @tc.number    SUB_TREESET_TEST01_0100
     * @tc.name      testTreeSet01Chapter0001
     * @tc.desc      Default constructor creates empty set and length equals zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet01Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeSet01Chapter0001";
      console.log(TAG + " start");
      const treeSet = new TreeSet<string>();
      const len: number = treeSet.length;

      expect(len).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREESET_TEST01_0200
     * @tc.name      testTreeSet01Chapter0002
     * @tc.desc      Constructor with ascending string comparator yields a,b,c,d order on iteration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet01Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeSet01Chapter0002";
      console.log(TAG + " start");
      const cmpAsc: (a: string, b: string) => boolean = (a: string, b: string): boolean => a < b;
      const treeSet = new TreeSet<string>(cmpAsc);

      treeSet.add("d");
      treeSet.add("b");
      treeSet.add("a");
      treeSet.add("c");

      const seq: Array<string> = [];
      for (const item of treeSet) {
        seq.push(item);
      }

      expect(seq.length).assertEqual(4);
      expect(seq[0]).assertEqual("a");
      expect(seq[1]).assertEqual("b");
      expect(seq[2]).assertEqual("c");
      expect(seq[3]).assertEqual("d");
    });

    /**
     * @tc.number    SUB_TREESET_TEST01_0300
     * @tc.name      testTreeSet01Chapter0003
     * @tc.desc      Constructor with descending string comparator yields d,c,b,a order on iteration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet01Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeSet01Chapter0003";
      console.log(TAG + " start");
      const cmpDesc: (a: string, b: string) => boolean = (a: string, b: string): boolean => a > b;
      const treeSet = new TreeSet<string>(cmpDesc);

      treeSet.add("d");
      treeSet.add("b");
      treeSet.add("a");
      treeSet.add("c");

      const seq: Array<string> = [];
      for (const item of treeSet) {
        seq.push(item);
      }

      expect(seq.length).assertEqual(4);
      expect(seq[0]).assertEqual("d");
      expect(seq[1]).assertEqual("c");
      expect(seq[2]).assertEqual("b");
      expect(seq[3]).assertEqual("a");
    });

    /**
     * @tc.number    SUB_TREESET_TEST01_0400
     * @tc.name      testTreeSet01Chapter0004
     * @tc.desc      Constructor with ascending number comparator handles negatives and zero in order -2,-1,0,2,5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet01Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeSet01Chapter0004";
      console.log(TAG + " start");
      const cmpAsc: (a: number, b: number) => boolean = (a: number, b: number): boolean => a < b;
      const treeSet = new TreeSet<number>(cmpAsc);

      treeSet.add(5);
      treeSet.add(-2);
      treeSet.add(0);
      treeSet.add(-1);
      treeSet.add(2);

      const seq: Array<number> = [];
      for (const item of treeSet) {
        seq.push(item);
      }

      expect(seq.length).assertEqual(5);
      expect(seq[0]).assertEqual(-2);
      expect(seq[1]).assertEqual(-1);
      expect(seq[2]).assertEqual(0);
      expect(seq[3]).assertEqual(2);
      expect(seq[4]).assertEqual(5);
    });

    /**
     * @tc.number    SUB_TREESET_TEST01_0500
     * @tc.name      testTreeSet01Chapter0005
     * @tc.desc      Constructor with descending number comparator orders values 9,3,1,-1,-4 on iteration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet01Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeSet01Chapter0005";
      console.log(TAG + " start");
      const cmpDesc: (a: number, b: number) => boolean = (a: number, b: number): boolean => a > b;
      const treeSet = new TreeSet<number>(cmpDesc);

      treeSet.add(3);
      treeSet.add(9);
      treeSet.add(-4);
      treeSet.add(1);
      treeSet.add(-1);

      const seq: Array<number> = [];
      for (const item of treeSet) {
        seq.push(item);
      }

      expect(seq.length).assertEqual(5);
      expect(seq[0]).assertEqual(9);
      expect(seq[1]).assertEqual(3);
      expect(seq[2]).assertEqual(1);
      expect(seq[3]).assertEqual(-1);
      expect(seq[4]).assertEqual(-4);
    });

    /**
     * @tc.number    SUB_TREESET_TEST01_0600
     * @tc.name      testTreeSet01Chapter0006
     * @tc.desc      Custom type requires comparator and ascending by id yields 1,2,3 order on iteration and correct length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet01Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeSet01Chapter0006";
      console.log(TAG + " start");

      interface TestEntry {
        id: number;
      }

      const cmpAsc: (t1: TestEntry, t2: TestEntry) => boolean =
        (t1: TestEntry, t2: TestEntry): boolean => t1.id < t2.id;
      const treeSet = new TreeSet<TestEntry>(cmpAsc);

      treeSet.add({ id: 2 });
      treeSet.add({ id: 1 });
      treeSet.add({ id: 3 });

      const ids: Array<number> = [];
      for (const item of treeSet) {
        ids.push(item.id);
      }

      expect(ids.length).assertEqual(3);
      expect(ids[0]).assertEqual(1);
      expect(ids[1]).assertEqual(2);
      expect(ids[2]).assertEqual(3);
      expect(treeSet.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREESET_TEST01_0700
     * @tc.name      testTreeSet01Chapter0007
     * @tc.desc      Custom type comparator descending by id yields 3,2,1 order on iteration and correct length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet01Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeSet01Chapter0007";
      console.log(TAG + " start");

      interface TestEntry {
        id: number;
      }

      const cmpDesc: (t1: TestEntry, t2: TestEntry) => boolean =
        (t1: TestEntry, t2: TestEntry): boolean => t1.id > t2.id;
      const treeSet = new TreeSet<TestEntry>(cmpDesc);

      treeSet.add({ id: 2 });
      treeSet.add({ id: 1 });
      treeSet.add({ id: 3 });

      const ids: Array<number> = [];
      for (const item of treeSet) {
        ids.push(item.id);
      }

      expect(ids.length).assertEqual(3);
      expect(ids[0]).assertEqual(3);
      expect(ids[1]).assertEqual(2);
      expect(ids[2]).assertEqual(1);
      expect(treeSet.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREESET_TEST01_0800
     * @tc.name      testTreeSet01Chapter0008
     * @tc.desc      Boolean comparator orders false,true and iteration preserves order with correct uniqueness
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet01Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeSet01Chapter0008";
      console.log(TAG + " start");
      const cmpBoolAsc: (a: boolean, b: boolean) => boolean =
        (a: boolean, b: boolean): boolean => Number(a) < Number(b);
      const treeSet = new TreeSet<boolean>(cmpBoolAsc);

      treeSet.add(true);
      treeSet.add(false);
      treeSet.add(true);
      const seq: Array<boolean> = [];
      for (const item of treeSet) {
        seq.push(item);
      }

      expect(seq.length).assertEqual(2);
      expect(seq[0]).assertEqual(false);
      expect(seq[1]).assertEqual(true);
      expect(treeSet.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREESET_TEST01_0900
     * @tc.name      testTreeSet01Chapter0009
     * @tc.desc      Duplicate insertion does not increase length and iteration shows unique element only once
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet01Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeSet01Chapter0009";
      console.log(TAG + " start");
      const cmpAsc: (a: number, b: number) => boolean = (a: number, b: number): boolean => a < b;
      const treeSet = new TreeSet<number>(cmpAsc);

      treeSet.add(1);
      treeSet.add(1);
      treeSet.add(1);
      const seq: Array<number> = [];
      for (const item of treeSet) {
        seq.push(item);
      }

      expect(seq.length).assertEqual(1);
      expect(seq[0]).assertEqual(1);
      expect(treeSet.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_TREESET_TEST01_1000
     * @tc.name      testTreeSet01Chapter0010
     * @tc.desc      Test TreeSet with custom comparator that handles edge cases
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet01Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeSet01Chapter0010";
      console.log(TAG + " start");

      const cmpAsc: (a: number, b: number) => boolean = (a: number, b: number): boolean => a < b;
      const treeSet = new TreeSet<number>(cmpAsc);

      treeSet.add(0);
      treeSet.add(Number.MAX_VALUE);
      treeSet.add(Number.MIN_VALUE);

      const seq: Array<number> = [];
      for (const item of treeSet) {
        seq.push(item);
      }

      expect(seq.length).assertEqual(3);
      expect(seq[0]).assertEqual(0);
      expect(seq[1]).assertEqual(Number.MIN_VALUE);
      expect(seq[2]).assertEqual(Number.MAX_VALUE);
    });
  })
}