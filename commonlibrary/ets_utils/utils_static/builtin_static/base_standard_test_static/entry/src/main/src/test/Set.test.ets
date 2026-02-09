import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';

export default function SetTest() {
  describe('setTest', (): void => {
    afterEach(() => {
      await Utils.msSleep(20);
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0100
     * @tc.name testSetPrototypeAdd0001
     * @tc.desc Test the function of the interface SetPrototypeAdd.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetPrototypeAdd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
      , (): void => {
        const TAG = "testSetPrototypeAdd0001";
        try {
          const odds: Set<string> = new Set<string>(["a", "b"]);
          let value: Set<String> = odds.add("c");
          expect(String(value.has("c"))).assertEqual('true');
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0200
     * @tc.name testSetPrototypeAdd0002
     * @tc.desc Test the function of the interface SetPrototypeAdd.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetPrototypeAdd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testSetPrototypeAdd0002";
        try {
          const odds: Set<string> = new Set<string>(["a", "b"]);
          let value: Set<string> = odds.add("c");
          expect(String(value.has("d"))).assertEqual('false');
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0300
     * @tc.name testSetPrototypeAdd0003
     * @tc.desc Test the function of the interface SetPrototypeAdd.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetPrototypeAdd0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testSetPrototypeAdd0003";
        try {
          const odds = new Set<number>();
          odds.add(1);
          odds.add(2);
          odds.add(3);
          odds.add(4);
          let value = odds.add(5);
          expect(String(value.has(5))).assertEqual('true');
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0400
     * @tc.name testSetPrototypeAdd0004
     * @tc.desc Test the function of the interface SetPrototypeAdd.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetPrototypeAdd0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testSetPrototypeAdd0004";
        try {
          const odds = new Set<number>();
          odds.add(1);
          odds.add(2);
          odds.add(3);
          odds.add(4);
          let value = odds.add(5);
          expect(String(value.has(6))).assertEqual('false');
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0500
     * @tc.name testSetPrototypeAdd0005
     * @tc.desc Test the function of the interface SetPrototypeAdd.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // it('testSetPrototypeAdd0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    //   (): void => {
    //     const TAG = "testSetPrototypeAdd0005";
    //     try {
    //       const odds = new Set<string>([]);
    //       let value = odds.add("c");
    //       expect(String(value.has("c"))).assertEqual('true');
    //     } catch (err: BusinessError) {
    //       console.error(`${TAG} failed, error: ${err.message}`);
    //       expect(false).assertFail();
    //     }
    //   })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0600
     * @tc.name testSetPrototypeClear0001
     * @tc.desc Test the function of the interface SetPrototypeClear.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetPrototypeClear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testSetPrototypeClear0001";
        try {
          const odds = new Set<number>();
          odds.add(1);
          odds.add(2);
          odds.add(3);
          odds.add(4);
          odds.clear();
          let value = odds.size
          expect(String(value)).assertEqual('0');
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0700
     * @tc.name testSetPrototypeClear0002
     * @tc.desc Test the function of the interface SetPrototypeClear.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetPrototypeClear0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testSetPrototypeClear0002";
        try {
          const odds = new Set<string>(["a", "b", "c"]);
          odds.clear();
          let value = odds.size
          expect(String(value)).assertEqual('0');
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0800
     * @tc.name testSetPrototypeClear0003
     * @tc.desc Test the function of the interface SetPrototypeClear.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetPrototypeClear0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testSetPrototypeClear0003";
        try {
          const odds = new Set<string>([""]);
          odds.clear();
          let value = odds.size
          expect(String(value)).assertEqual('0');
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0900
     * @tc.name testSetPrototypeDelete0001
     * @tc.desc Test the function of the interface SetPrototypeDelete.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetPrototypeDelete0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testSetPrototypeDelete0001";
        try {
          const odds = new Set<number>();
          odds.add(1);
          odds.add(2);
          odds.add(3);
          expect(String(odds.delete(3))).assertEqual('true')
          expect(String(odds.size)).assertEqual('2');
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1000
     * @tc.name testSetPrototypeDelete0002
     * @tc.desc Test the function of the interface SetPrototypeDelete.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetPrototypeDelete0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testSetPrototypeDelete0002";
        try {
          const odds = new Set<number>();
          odds.add(1);
          odds.add(2);
          odds.add(3);
          expect(String(odds.delete(4))).assertEqual('false')
          expect(String(odds.size)).assertEqual('3');
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1100
     * @tc.name testSetPrototypeDelete0003
     * @tc.desc Test the function of the interface SetPrototypeDelete.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetPrototypeDelete0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testSetPrototypeDelete0003";
        try {
          const odds = new Set<string>(["a", "b", "c"]);
          expect(String(odds.delete("c"))).assertEqual('true')
          expect(String(odds.size)).assertEqual('2');
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1200
     * @tc.name testSetPrototypeDelete0004
     * @tc.desc Test the function of the interface SetPrototypeDelete.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetPrototypeDelete0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testSetPrototypeDelete0004";
        try {
          const odds = new Set<string>(["a", "b", "c"]);
          expect(String(odds.delete("d"))).assertEqual('false')
          expect(String(odds.size)).assertEqual('3');
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1300
     * @tc.name testSetPrototypeEntries0001
     * @tc.desc Test the function of the interface SetPrototypeEntries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetPrototypeEntries0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testSetPrototypeEntries0001";
        try {
          const odds = new Set<number>();
          odds.add(1);
          odds.add(3);
          odds.add(5);
          odds.add(7);
          odds.add(9);
          let set = odds.entries();
          expect(JSON.stringify(set.next().value)).assertEqual('[1,1]')
          expect(JSON.stringify(set.next().value)).assertEqual('[3,3]')
          expect(JSON.stringify(set.next().value)).assertEqual('[5,5]')
          expect(JSON.stringify(set.next().value)).assertEqual('[7,7]')
          expect(JSON.stringify(set.next().value)).assertEqual('[9,9]');
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1400
     * @tc.name testSetPrototypeEntries0002
     * @tc.desc Test the function of the interface SetPrototypeEntries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetPrototypeEntries0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testSetPrototypeEntries0002";
        try {
          const odds = new Set<undefined>([undefined]);
          let set = odds.entries();
          expect(JSON.stringify(set.next().value)).assertEqual('[null,null]');
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1500
     * @tc.name testSetPrototypeEntries0003
     * @tc.desc Test the function of the interface SetPrototypeEntries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetPrototypeEntries0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testSetPrototypeEntries0003";
        try {
          const odds = new Set<null>([null]);
          let set = odds.entries();
          expect(JSON.stringify(set.next().value)).assertEqual('[null,null]');
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1600
     * @tc.name testSetPrototypeHas0001
     * @tc.desc Test the function of the interface SetPrototypeHas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetPrototypeHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testSetPrototypeHas0001";
        try {
          const odds = new Set<number>();
          odds.add(1);
          odds.add(2);
          odds.add(3);
          let value = odds.has(2);
          expect(String(value)).assertEqual('true');
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1700
     * @tc.name testSetPrototypeHas0002
     * @tc.desc Test the function of the interface SetPrototypeHas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetPrototypeHas0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testSetPrototypeHas0002";
        try {
          const odds = new Set<number>();
          odds.add(1);
          odds.add(2);
          odds.add(3);
          let value = odds.has(4);
          expect(String(value)).assertEqual('false');
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1800
     * @tc.name testSetPrototypeHas0003
     * @tc.desc Test the function of the interface SetPrototypeHas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetPrototypeHas0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testSetPrototypeHas0003";
        try {
          let set1 = new Set<string>(['a', 'b', 'c']);
          let value = set1.has('b');
          expect(String(value)).assertEqual('true');
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1900
     * @tc.name testSetPrototypeHas0004
     * @tc.desc Test the function of the interface SetPrototypeHas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetPrototypeHas0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testSetPrototypeHas0004";
        try {
          let set1 = new Set<string>(['a', 'b', 'c']);
          let value = set1.has('d');
          expect(String(value)).assertEqual('false');
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_2000
     * @tc.name testSetPrototypeKeys0001
     * @tc.desc Test the function of the interface SetPrototypeKeys.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetPrototypeKeys0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testSetPrototypeKeys0001";
        try {
          let mySet = new Set<string>(["apple", "banana", "cat"]);
          let setIter = mySet.keys();
          let value1 = setIter.next();
          let value2 = setIter.next();
          let value3 = setIter.next();
          expect(JSON.stringify(value1)).assertEqual('{"done":false,"value":"apple"}')
          expect(JSON.stringify(value2)).assertEqual('{"done":false,"value":"banana"}')
          expect(JSON.stringify(value3)).assertEqual('{"done":false,"value":"cat"}');
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_2100
     * @tc.name testSetPrototypeKeys0002
     * @tc.desc Test the function of the interface SetPrototypeKeys.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetPrototypeKeys0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testSetPrototypeKeys0002";
        try {
          let mySet = new Set<string>([] as string[]);
          let setIter = mySet.keys();
          let value1 = setIter.next();
          expect(JSON.stringify(value1)).assertEqual('{"done":true}');
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })
  })
}