import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Level,
  Size
} from '../../../../hypium/index';
import { BusinessError } from '@ohos.base';
import HashSet from '@ohos.util.HashSet';
import Utils from '../Util.test';

class Tmp {
  name: number = 0
}
class Temp1 {
  age: number = 0
  name: string = ""
}


export default function hasSetTest2() {
  describe('hasSetTest2', (): void => {
    afterEach(() => {
      await Utils.msSleep(10)
    })
    /**
     * @tc.name   testHashSetLength0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_LENGTH_0100
     * @tc.desc   Testing HashSet length is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetLength0001';
      try {
        const hashSet = new HashSet<number>();
        expect(String(hashSet.length)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetLength0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_LENGTH_0200
     * @tc.desc   Testing HashSet has data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetLength0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetLength0002';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        expect(String(hashSet.length)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetLength0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_LENGTH_0300
     * @tc.desc   Testing HashSet remove->add->clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetLength0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetLength0003';
      try {
        const hashSet = new HashSet<number>();
        hashSet.remove(1);
        hashSet.add(1);
        hashSet.clear()
        expect(String(hashSet.length)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetLength0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_LENGTH_0400
     * @tc.desc   Testing HashSet add duplicate data length result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetLength0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetLength0004';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        hashSet.add(1);
        expect(String(hashSet.length)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetConstructor0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_CONSTRUCTOR_0100
     * @tc.desc   Testing HashSet constructor add sample data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetConstructor0001';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        expect(String(hashSet.length)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetConstructor0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_CONSTRUCTOR_0200
     * @tc.desc   Testing HashSet constructor add custom type data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetConstructor0002';
      try {
        const hashSet = new HashSet<Tmp>();
        let param: Tmp = {
          name: 1
        };
        hashSet.add(param);
        let result = hashSet.has(param);
        expect(String(result)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetIsEmpty0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_IS_EMPTY_0100
     * @tc.desc   Testing HashSet empty data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetIsEmpty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetIsEmpty0001';
      try {
        const hashSet = new HashSet<number>();
        expect(String(hashSet.isEmpty())).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetIsEmpty0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_IS_EMPTY_0200
     * @tc.desc   Testing HashSet has data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetIsEmpty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetIsEmpty0002';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        expect(String(hashSet.isEmpty())).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetIsEmpty0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_IS_EMPTY_0300
     * @tc.desc   Testing HashSet has data and remove
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetIsEmpty0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetIsEmpty0003';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        hashSet.remove(1);
        expect(String(hashSet.isEmpty())).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetIsEmpty0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_IS_EMPTY_0400
     * @tc.desc   Testing HashSet has data and clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetIsEmpty0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetIsEmpty0004';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        hashSet.clear();
        expect(String(hashSet.isEmpty())).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetHas0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_HAS_0100
     * @tc.desc   Testing HashSet is empty and check if "" has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetHas0001';
      try {
        const hashSet = new HashSet<string>();
        expect(String(hashSet.has(""))).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetHas0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_HAS_0400
     * @tc.desc   Testing HashSet is empty and check if value has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetHas0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetHas0004';
      try {
        const hashSet = new HashSet<string>();
        expect(String(hashSet.has('value'))).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetHas0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_HAS_0500
     * @tc.desc   Testing HashSet has 1 and check if 1 has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetHas0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetHas0005';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        expect(String(hashSet.has(1))).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetHas0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_HAS_0600
     * @tc.desc   Testing HashSet has 1 and check if 2 has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetHas0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetHas0006';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        expect(String(hashSet.has(2))).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetHas0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_HAS_0700
     * @tc.desc   Testing HashSet remove->add->clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetHas0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetHas0007';
      try {
        const hashSet = new HashSet<number>();
        hashSet.remove(1)
        hashSet.add(1);
        hashSet.clear();
        expect(String(hashSet.has(1))).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetAdd0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_ADD_0100
     * @tc.desc   Testing HashSet data "" check length =1 and has ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetAdd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetAdd0001';
      try {
        const hashSet = new HashSet<string>();
        hashSet.add("");
        let result = hashSet.length == 1 && hashSet.has("");
        expect(String(result)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetAdd0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_ADD_0200
     * @tc.desc   Testing HashSet data "a" check length =1 and has "a"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetAdd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetAdd0002';
      try {
        const hashSet = new HashSet<string>();
        hashSet.add("a");
        let result = hashSet.length == 1 && hashSet.has("a");
        expect(String(result)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetAdd0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_ADD_0500
     * @tc.desc   Testing HashSet data string length is 2048 check length =1 and has string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetAdd0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetAdd0005';
      try {
        const hashSet = new HashSet<string>();
        let param = 'a'.repeat(2048);
        hashSet.add(param);
        let result = hashSet.length == 1 && hashSet.has(param);
        expect(String(result)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetAdd0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_ADD_0600
     * @tc.desc   Testing HashSet data has 1000 check length =1 and has 1000 data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetAdd0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetAdd0006';
      try {
        const hashSet = new HashSet<number>();
        for (let i = 0; i < 1000; i++) {
          hashSet.add(i);
        }
        for (let i = 0; i < hashSet.length; i++) {
          expect(String(hashSet.has(i))).assertEqual('true')
        }
        expect(String(hashSet.length)).assertEqual('1000');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetAdd0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_ADD_0700
     * @tc.desc   Testing HashSet remove->add->clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetAdd0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetAdd0007';
      try {
        const hashSet = new HashSet<number>();
        hashSet.remove(1);
        hashSet.add(1);
        hashSet.clear();
        let result = hashSet.length == 1 && hashSet.has(1);
        expect(String(result)).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetRemove0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_REMOVE_0100
     * @tc.desc   Testing HashSet is empty and remove value is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetRemove0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetRemove0001';
      try {
        const hashSet = new HashSet<string>();
        expect(String(hashSet.remove(""))).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });


    /**
     * @tc.name   testHashSetRemove0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_REMOVE_0400
     * @tc.desc   Testing HashSet is empty and remove value is "a"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetRemove0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetRemove0004';
      try {
        const hashSet = new HashSet<string>();
        expect(String(hashSet.remove("a"))).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetRemove0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_REMOVE_0500
     * @tc.desc   Testing HashSet has 1 and remove value is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetRemove0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetRemove0005';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        expect(String(hashSet.remove(1))).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetRemove0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_REMOVE_0600
     * @tc.desc   Testing HashSet has 1 and remove value is 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetRemove0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetRemove0006';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        expect(String(hashSet.remove(2))).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetRemove0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_REMOVE_0700
     * @tc.desc   Testing HashSet remove->add->clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetRemove0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetRemove0007';
      try {
        const hashSet = new HashSet<number>();
        hashSet.remove(1);
        hashSet.add(1);
        hashSet.clear();
        expect(String(hashSet.remove(1))).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetClear0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_CLEAR_0100
     * @tc.desc   Testing HashSet is empty clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetClear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetClear0001';
      try {
        const hashSet = new HashSet<number>();
        hashSet.clear();
        expect(String(hashSet.length)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetClear0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_CLEAR_0200
     * @tc.desc   Testing HashSet has data clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetClear0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetClear0002';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        hashSet.clear();
        expect(String(hashSet.length)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetClear0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_CLEAR_0300
     * @tc.desc   Testing HashSet has data clear and add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetClear0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetClear0003';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        hashSet.clear();
        hashSet.add(1);
        expect(String(hashSet.length)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetValues0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_VALUES_0100
     * @tc.desc   Testing HashSet is empty get values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetValues0001';
      try {
        const hashSet = new HashSet<number>();
        let values = hashSet.values();
        let temp = values.next()
        expect(String(temp.done)).assertEqual("true");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetValues0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_VALUES_0200
     * @tc.desc   Testing HashSet has data get values while check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetValues0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetValues0002';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        hashSet.add(2);
        hashSet.add(3);
        let values = hashSet.values();
        let temp = values.next();
        let index = 1;
        while (!temp.done) {
          if (temp.value) {
            expect(String(temp.value)).assertEqual(String(index));
            index++;
          }
          temp = values.next();
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetForEach0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_FOREACH_0100
     * @tc.desc   Testing HashSet is empty and foreach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetForEach0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetForEach0001';
      try {
        const hashSet = new HashSet<number>();
        hashSet.forEach((value?: number, key?: number) => {
          expect(String(hashSet.length)).assertEqual('0');
        });
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetForEach0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_FOREACH_0200
     * @tc.desc   Testing HashSet has data check everyOne and length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetForEach0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetForEach0002';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        hashSet.add(2);
        hashSet.add(3);
        let index = 1;
        hashSet.forEach((value?: number) => {
          expect(String(value)).assertEqual(String(index));
          index++;
        });
        expect(String(hashSet.length)).assertEqual('3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetForEach0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_FOREACH_0300
     * @tc.desc   Testing HashSet has data and add check length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetForEach0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetForEach0003';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        hashSet.forEach((value?: number) => {
          hashSet.add(2);
          expect(String(hashSet.length)).assertEqual('2');
        });
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetForEach0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_FOREACH_0400
     * @tc.desc   Testing HashSet has data and clear check length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetForEach0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetForEach0004';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        hashSet.forEach((value?: number) => {
          hashSet.clear();
          expect(String(hashSet.length)).assertEqual('0');
        });
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetForEach0005
     * @tc.number testHashSetForEach0005
     * @tc.desc   testHashSetForEach0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetForEach0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetForEach0005';
      try {
        const hashSet = new HashSet<number>();
        const hashSetNew = new HashSet<number>();
        hashSetNew.add(1);
        hashSet.add(1);
        hashSet.forEach((value : number, hashSetNew) => {
          hashSet.clear();
          expect(String(hashSet.length)).assertEqual('0');
        });
        expect(hashSetNew.length).assertEqual(1);
        expect(hashSetNew.has(1)).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetForEach0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_FOREACH_0600
     * @tc.desc   Testing HashSet has data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetForEach0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetForEach0006';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        hashSet.forEach((value: number, index, hashSet: HashSet<number>) => {
          hashSet.clear();
          expect(String(hashSet.length)).assertEqual('0');
        })
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetEntries0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_ENTRIES_0100
     * @tc.desc   Testing HashSet is empty get entries length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetEntries0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetEntries0001';
      try {
        const hashSet = new HashSet<number>();
        let entries = hashSet.entries();
        let temp = entries.next();
        while (!temp.done) {
          expect(String(hashSet.length)).assertEqual('0');
          temp = entries.next();
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetEntries0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_ENTRIES_0200
     * @tc.desc   Testing HashSet has data check everyOne and length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetEntries0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetEntries0002';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1)
        hashSet.add(2)
        hashSet.add(3)
        let entries = hashSet.entries();
        let temp = entries.next();
        let index = 1;
        while (!temp.done) {
          if (temp.value) {
            expect(String(temp.value?.[1])).assertEqual(String(index));
          }
          index++;
          temp = entries.next();
        }
        expect(String(hashSet.length)).assertEqual('3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetEntries0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_ENTRIES_0300
     * @tc.desc   Testing HashSet has data add and check length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetEntries0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetEntries0003';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1)
        let entries = hashSet.entries();
        let temp = entries.next();
        while (!temp.done) {
          hashSet.add(2)
          expect(String(hashSet.length)).assertEqual('2');
          temp = entries.next();
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetEntries0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_ENTRIES_0400
     * @tc.desc   Testing HashSet has data clear and check length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetEntries0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetEntries0003';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1)
        let entries = hashSet.entries();
        let temp = entries.next();
        while (!temp.done) {
          hashSet.clear()
          expect(String(hashSet.length)).assertEqual('0');
          temp = entries.next();
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetSymbolIterator0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_SYMBOL_ITERATOR_0100
     * @tc.desc   Testing HashSet is empty while loop check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetSymbolIterator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetSymbolIterator0001';
      try {
        const hashSet = new HashSet<number>();
        let iter = hashSet.$_iterator();
        let temp: IteratorResult<number> = iter.next();
        while (!temp.done) {
          expect(String(hashSet.length)).assertEqual('0')
          temp = iter.next()
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetSymbolIterator0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_SYMBOL_ITERATOR_0200
     * @tc.desc   Testing HashSet has data while loop check value and length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetSymbolIterator0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetSymbolIterator0002';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1)
        hashSet.add(2)
        hashSet.add(3)
        let iter = hashSet.$_iterator();
        let temp: IteratorResult<number> = iter.next();
        let index = 1;
        while (!temp.done) {
          if (temp.value) {
            expect(String(temp.value)).assertEqual(String(index))
          }
          index++;
          temp = iter.next()
        }
        expect(String(hashSet.length)).assertEqual("3")
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetCustom0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_CUSTOM_0100
     * @tc.desc   Testing HashSet has data check custom value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetCustom0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetCustom0001';
      try {
        const hashSet = new HashSet<Temp1>();
        let temp: Temp1 = {
          age: 18, name: "zhang san"
        };
        hashSet.add(temp)
        let temp1: Temp1 = {
          age: 19, name: "li si"
        };
        hashSet.add(temp1)
        let temp2: Temp1 = {
          age: 31, name: "wang wu"
        };
        hashSet.add(temp2)
        expect(String(hashSet.isEmpty())).assertEqual('false')
        let removeResult = hashSet.remove(temp)
        expect(String(removeResult)).assertEqual('true')
        hashSet.clear()
        expect(String(hashSet.length)).assertEqual('0')
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHashSetLength0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_LENGTH_1700
     * @tc.desc   Testing HashSet remove->add->clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashSetLength0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const hashSet = new HashSet<number>();
      expect(String(hashSet.length)).assertEqual('0');
      hashSet.add(1);
      hashSet.add(1);
      hashSet.add(1);
      hashSet.add(1);
      expect(String(hashSet.length)).assertEqual('1');
      hashSet.add(2);
      expect(String(hashSet.length)).assertEqual('2');
    });

  })
}
