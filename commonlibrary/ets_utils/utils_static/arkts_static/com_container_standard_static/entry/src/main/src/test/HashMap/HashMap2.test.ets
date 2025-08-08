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
import HashMap from '@ohos.util.HashMap';
import { BusinessError } from '@ohos.base';
import Utils from '../Util.test';

async function sleep(count: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}

class Tmp {
  name: number = 0
}

class Temp1 {
  age: number = 0
  name: string = ""
}


export default function HashMapTest2() {
  describe('hashMapTest2', (): void => {
    afterEach(() => {
      await Utils.msSleep(10)
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_LENGTH_0100
     * @tc.name      : testHashMapLength0001
     * @tc.desc      : Testing HashMap length is 0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapLength0001';
      try {
        const hashMap = new HashMap<string, number>();
        expect(String(hashMap.length)).assertEqual('0');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_LENGTH_0200
     * @tc.name      : testHashMapLength0002
     * @tc.desc      : Testing HashMap has data check length
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapLength0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapLength0002';
      try {
        const hashMap = new HashMap<string, number>();
        hashMap.set("li", 1);
        expect(String(hashMap.length)).assertEqual('1');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_LENGTH_0300
     * @tc.name      : testHashMapLength0003
     * @tc.desc      : Testing HashMap remove->set->clear check length
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapLength0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapLength0003';
      try {
        const hashMap = new HashMap<string, number>();
        hashMap.remove("zhang")
        hashMap.set("li", 1);
        hashMap.clear();
        expect(String(hashMap.length)).assertEqual('0');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_CONSTRUCTOR_0100
     * @tc.name      : testHashMapConstructor0001
     * @tc.desc      : Testing HashMap constructor add sample data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapConstructor0001';
      try {
        const hashMap = new HashMap<string, number>();
        hashMap.set("li", 1);
        expect(String(hashMap.length)).assertEqual('1');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_CONSTRUCTOR_0200
     * @tc.name      : testHashMapConstructor0002
     * @tc.desc      : Testing HashMap constructor add custom type data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashSetConstructor0002';
      try {
        const hashMap = new HashMap<string, Tmp>();
        let param: Tmp = {
          name: 1
        };
        hashMap.set("li", param);
        let result = hashMap.hasValue(param);
        expect(String(result)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_IS_EMPTY_0100
     * @tc.name      : testHashMapIsEmpty0001
     * @tc.desc      : Testing HashMap empty data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapIsEmpty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapIsEmpty0001';
      try {
        const hashMap = new HashMap<string, number>();
        expect(String(hashMap.isEmpty())).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_IS_EMPTY_0200
     * @tc.name      : testHashMapIsEmpty0002
     * @tc.desc      : Testing HashMap has data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapIsEmpty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapIsEmpty0002';
      try {
        const hashMap = new HashMap<string, number>();
        hashMap.set("ji", 1)
        expect(String(hashMap.isEmpty())).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_IS_EMPTY_0300
     * @tc.name      : testHashMapIsEmpty0003
     * @tc.desc      : Testing HashMap has data and remove
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapIsEmpty0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapIsEmpty0003';
      try {
        const hashMap = new HashMap<string, number>();
        hashMap.set("ji", 1)
        hashMap.remove("ji")
        expect(String(hashMap.isEmpty())).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_IS_EMPTY_0400
     * @tc.name      : testHashMapIsEmpty0004
     * @tc.desc      : Testing HashMap has data and clear
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapIsEmpty0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapIsEmpty0004';
      try {
        const hashMap = new HashMap<string, number>();
        hashMap.set("ji", 1)
        hashMap.clear();
        expect(String(hashMap.isEmpty())).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_HAS_KEY_0100
     * @tc.name      : testHashMapHasKey0001
     * @tc.desc      : Testing HashMap is empty and check if "" has
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapHasKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapHasKey0001';
      try {
        const hashMap = new HashMap<string, number>();
        expect(String(hashMap.hasKey(""))).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_HAS_KEY_0200
    //  * @tc.name      : testHashMapHasKey0002
    //  * @tc.desc      : Testing HashMap is empty and check if null has
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 1
    //  */
    // it('testHashMapHasKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = 'testHashMapHasKey0002';
    //   try {
    //     const hashMap = new HashMap<string, number>();
    //     expect(hashMap.hasKey(null).toString()).assertEqual('false');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_HAS_KEY_0300
    //  * @tc.name      : testHashMapHasKey0003
    //  * @tc.desc      : Testing HashMap is empty and check if undefined has
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 1
    //  */
    // it('testHashMapHasKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = 'testHashMapHasKey0003';
    //   try {
    //     const hashMap = new HashMap<string, number>();
    //     expect(hashMap.hasKey(undefined)).assertEqual(false);
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_HAS_KEY_0400
     * @tc.name      : testHashMapHasKey0004
     * @tc.desc      : Testing HashMap is empty and check if key has
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapHasKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapHasKey0004';
      try {
        const hashMap = new HashMap<string, number>();
        expect(String(hashMap.hasKey('key'))).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_HAS_KEY_0500
     * @tc.name      : testHashMapHasKey0005
     * @tc.desc      : Testing HashMap has data and check if key has
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapHasKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapHasKey0005';
      try {
        const hashMap = new HashMap<string, number>();
        hashMap.set("ji", 1);
        expect(String(hashMap.hasKey('ji'))).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_HAS_KEY_0600
     * @tc.name      : testHashMapHasKey0006
     * @tc.desc      : Testing HashMap has data and check if not this key has
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapHasKey0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapHasKey0006';
      try {
        const hashMap = new HashMap<string, number>();
        hashMap.set("ji", 1);
        expect(String(hashMap.hasKey('li'))).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_HAS_KEY_0700
     * @tc.name      : testHashMapHasKey0007
     * @tc.desc      : Testing HashMap has data and check if value has
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapHasKey0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapHasKey0007';
      try {
        const hashMap = new HashMap<string, string>();
        hashMap.set("ji", "hello");
        expect(String(hashMap.hasKey('hello'))).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_HAS_KEY_0800
     * @tc.name      : testHashMapHasKey0008
     * @tc.desc      : Testing HashMap remove->set->clear
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapHasKey0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapHasKey0008';
      try {
        const hashMap = new HashMap<string, string>();
        hashMap.remove("ji");
        hashMap.set("ji", "hello");
        hashMap.clear();
        expect(String(hashMap.hasKey('hello'))).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_HAS_VALUE_0100
     * @tc.name      : testHashMapHasValue0001
     * @tc.desc      : Testing HashMap is empty and check if "" has
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapHasValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapHasValue0001';
      try {
        const hashMap = new HashMap<string, string>();
        expect(String(hashMap.hasValue('hello'))).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_HAS_VALUE_0200
    //  * @tc.name      : testHashMapHasValue0002
    //  * @tc.desc      : Testing HashMap is empty and check if null has
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 1
    //  */
    // it('testHashMapHasValue0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = 'testHashMapHasValue0002';
    //   try {
    //     const hashMap = new HashMap<string, number>();
    //     expect(hashMap.hasValue(null)).assertEqual(false);
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_HAS_VALUE_0300
    //  * @tc.name      : testHashMapHasValue0003
    //  * @tc.desc      : Testing HashMap is empty and check if undefined has
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 1
    //  */
    // it('testHashMapHasValue0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = 'testHashMapHasValue0003';
    //   try {
    //     const hashMap = new HashMap<string, number>();
    //     expect(hashMap.hasValue(undefined)).assertEqual(false);
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_HAS_VALUE_0400
     * @tc.name      : testHashMapHasValue0004
     * @tc.desc      : Testing HashMap is empty and check if key has
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapHasValue0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapHasValue0004';
      try {
        const hashMap = new HashMap<string, string>();
        expect(String(hashMap.hasValue('key'))).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_HAS_VALUE_0500
     * @tc.name      : testHashMapHasValue0005
     * @tc.desc      : Testing HashMap has data and check if value has
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapHasValue0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapHasValue0005';
      try {
        const hashMap = new HashMap<string, string>();
        hashMap.set("ji", "hello");
        expect(String(hashMap.hasValue('hello'))).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_HAS_VALUE_0600
     * @tc.name      : testHashMapHasValue0006
     * @tc.desc      : Testing HashMap has data and check if not this value has
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapHasValue0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapHasValue0006';
      try {
        const hashMap = new HashMap<string, string>();
        hashMap.set("ji", "hello");
        expect(String(hashMap.hasValue('li'))).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_HAS_VALUE_0700
     * @tc.name      : testHashMapHasValue0007
     * @tc.desc      : Testing HashMap remove->set->clear
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapHasValue0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapHasValue0007';
      try {
        const hashMap = new HashMap<string, string>();
        hashMap.remove("ji");
        hashMap.set("ji", "hello");
        hashMap.clear();
        expect(String(hashMap.hasValue('hello'))).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_GET_0100
     * @tc.name      : testHashMapGet0001
     * @tc.desc      : Testing HashMap is empty and check if get ""
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapGet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapGet0001';
      try {
        const hashMap = new HashMap<string, string>();
        expect(String(hashMap.get(''))).assertEqual('undefined');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_GET_0200
    //  * @tc.name      : testHashMapGet0002
    //  * @tc.desc      : Testing HashMap is empty and check if get null
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 1
    //  */
    // it('testHashMapGet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = 'testHashMapGet0002';
    //   try {
    //     const hashMap = new HashMap<string, number>();
    //     expect(hashMap.get(null)).assertEqual(undefined);
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_GET_0300
    //  * @tc.name      : testHashMapGet0003
    //  * @tc.desc      : Testing HashMap is empty and check if get undefined
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 1
    //  */
    // it('testHashMapGet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = 'testHashMapGet0003';
    //   try {
    //     const hashMap = new HashMap<string, number>();
    //     expect(hashMap.get(undefined)).assertEqual(undefined);
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_GET_0400
     * @tc.name      : testHashMapGet0004
     * @tc.desc      : Testing HashMap is empty and check if get key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapGet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapGet0004';
      try {
        const hashMap = new HashMap<string, string>();
        expect(String(hashMap.get('key'))).assertEqual('undefined');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_GET_0500
     * @tc.name      : testHashMapGet0005
     * @tc.desc      : Testing HashMap has data and check if get this key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapGet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapGet0005';
      try {
        const hashMap = new HashMap<string, string>();
        hashMap.set("ji", "hello");
        expect(String(hashMap.get('ji'))).assertEqual("hello");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_GET_0600
     * @tc.name      : testHashMapGet0006
     * @tc.desc      : Testing HashMap has data and check if get not this key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapGet0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapGet0006';
      try {
        const hashMap = new HashMap<string, string>();
        hashMap.set("ji", "hello");
        expect(String(hashMap.get('li'))).assertEqual('undefined');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_GET_0700
     * @tc.name      : testHashMapGet0007
     * @tc.desc      : Testing HashMap remove->set->clear
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapGet0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapGet0007';
      try {
        const hashMap = new HashMap<string, string>();
        hashMap.remove("ji");
        hashMap.set("ji", "hello");
        hashMap.clear();
        expect(String(hashMap.get('ji'))).assertEqual('undefined');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_SET_ALL_0100
     * @tc.name      : testHashMapSetAll0001
     * @tc.desc      : Testing HashMap is empty check length
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapSetAll0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapSetAll0001';
      try {
        const hashMap = new HashMap<string, string>();
        expect(String(hashMap.length)).assertEqual('0');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_SET_ALL_0200
     * @tc.name      : testHashMapSetAll0002
     * @tc.desc      : Testing HashMap has data check length
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapSetAll0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapSetAll0002';
      try {
        const hashMap: HashMap<string, number> = new HashMap<string, number>();
        hashMap.set("squirrel", 123);
        hashMap.set("sparrow", 356);
        let newHashMap: HashMap<string, number> = new HashMap<string, number>();
        newHashMap.set("newMap", 99);
        hashMap.setAll(newHashMap);
        expect(String(hashMap.length)).assertEqual('3');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_SET_ALL_0300
     * @tc.name      : testHashMapSetAll0003
     * @tc.desc      : Testing HashMap has data check data is change
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapSetAll0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapSetAll0003';
      try {
        const hashMap: HashMap<string, number> = new HashMap<string, number>();
        hashMap.set("squirrel", 123);
        hashMap.set("sparrow", 356);
        let newHashMap: HashMap<string, number> = new HashMap<string, number>();
        newHashMap.set("newMap", 100);
        hashMap.setAll(newHashMap);
        expect(String(hashMap.get("sparrow"))).assertEqual('356');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_SET_ALL_0400
     * @tc.name      : testHashMapSetAll0004
     * @tc.desc      : Testing HashMap has data check same key diff value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapSetAll0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapSetAll0004';
      try {
        const hashMap: HashMap<string, number> = new HashMap<string, number>();
        hashMap.set("squirrel", 123);
        hashMap.set("sparrow", 356);
        let newHashMap: HashMap<string, number> = new HashMap<string, number>();
        newHashMap.set("sparrow", 100);
        hashMap.setAll(newHashMap);
        expect(String(hashMap.get("sparrow"))).assertEqual('100');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_SET_ALL_0500
     * @tc.name      : testHashMapSetAll0005
     * @tc.desc      : Testing HashMap remove->set->clear->replace
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapSetAll0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapSetAll0005';
      try {
        const hashMap: HashMap<string, number> = new HashMap<string, number>();
        hashMap.remove("sparrow");
        hashMap.set("sparrow", 356);
        hashMap.clear();
        hashMap.replace("sparrow", 12);
        expect(String(hashMap.get("sparrow"))).assertEqual('undefined');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_SET_ALL_0600
     * @tc.name      : testHashMapSetAll0006
     * @tc.desc      : Testing HashMap has data and setAll same data check length
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapSetAll0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapSetAll0006';
      try {
        const hashMap: HashMap<string, number> = new HashMap<string, number>();
        hashMap.set("sparrow", 356);
        const newHashMap: HashMap<string, number> = new HashMap<string, number>();
        newHashMap.set("sparrow", 356);
        hashMap.setAll(newHashMap);
        expect(String(hashMap.length)).assertEqual('1');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_SET_0100
     * @tc.name      : testHashMapSet0001
     * @tc.desc      : Testing HashMap set "" check length and get ""
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapSet0001';
      try {
        const hashMap: HashMap<string, number> = new HashMap<string, number>();
        hashMap.set("", 356);
        expect(String(hashMap.length)).assertEqual('1');
        expect(String(hashMap.get(""))).assertEqual('356');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_SET_0200
     * @tc.name      : testHashMapSet0002
     * @tc.desc      : Testing HashMap set "a" check length and get "a"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapSet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapSet0002';
      try {
        const hashMap: HashMap<string, number> = new HashMap<string, number>();
        hashMap.set("a", 356);
        expect(String(hashMap.length)).assertEqual('1');
        expect(String(hashMap.get("a"))).assertEqual('356');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_SET_0300
    //  * @tc.name      : testHashMapSet0003
    //  * @tc.desc      : Testing HashMap set null check length and get null
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 1
    //  */
    // it('testHashMapSet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = 'testHashMapSet0003';
    //   try {
    //     const hashMap: HashMap<string, number> = new HashMap<string, number>();
    //     hashMap.set(null, 356);
    //     expect(String(hashMap.length)).assertEqual('1');
    //     expect(String(hashMap.get(null))).assertEqual('356');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_SET_0400
    //  * @tc.name      : testHashMapSet0004
    //  * @tc.desc      : Testing HashMap set key is undefined and not support key is undefined
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 1
    //  */
    // it('testHashMapSet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = 'testHashMapSet0004';
    //   try {
    //     const hashMap: HashMap<string, number> = new HashMap<string, number>();
    //     hashMap.set(undefined, 356);
    //     expect(false).assertFail();
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.code}`);
    //     expect(err.code).assertEqual(401);
    //   }
    // });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_SET_0500
     * @tc.name      : testHashMapSet0005
     * @tc.desc      : Testing HashMap set key length 1024 check hashMap length and get key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapSet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapSet0005';
      try {
        const hashMap: HashMap<string, number> = new HashMap<string, number>();
        let param = 'a'.repeat(2048);
        hashMap.set(param, 356);
        expect(String(hashMap.length)).assertEqual('1');
        expect(String(hashMap.get(param))).assertEqual('356');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_SET_0600
    //  * @tc.name      : testHashMapSet0006
    //  * @tc.desc      : Testing HashMap set value is null check hashMap length and get value
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 1
    //  */
    // it('testHashMapSet0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = 'testHashMapSet0006';
    //   try {
    //     const hashMap: HashMap<string, number> = new HashMap<string, number>();
    //     hashMap.set("ji", null);
    //     expect(String(hashMap.length)).assertEqual('1');
    //     expect(String(hashMap.get("ji"))).assertEqual('null');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_SET_0700
     * @tc.name      : testHashMapSet0007
     * @tc.desc      : Testing HashMap set value is 1 check hashMap length and get value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapSet0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapSet0007';
      try {
        const hashMap: HashMap<string, number> = new HashMap<string, number>();
        hashMap.set("ji", 1);
        expect(String(hashMap.length)).assertEqual('1');
        expect(String(hashMap.get("ji"))).assertEqual('1');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_SET_0800
    //  * @tc.name      : testHashMapSet0008
    //  * @tc.desc      : Testing HashMap set value is undefined check hashMap length and get value
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 1
    //  */
    // it('testHashMapSet0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = 'testHashMapSet0008';
    //   try {
    //     const hashMap: HashMap<string, number> = new HashMap<string, number>();
    //     hashMap.set("ji", undefined);
    //     expect(String(hashMap.length)).assertEqual('1');
    //     expect(String(hashMap.get("ji"))).assertEqual('undefined');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_SET_0900
     * @tc.name      : testHashMapSet0009
     * @tc.desc      : Testing HashMap data has 1000 check length =1 and has 1000 data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapSet0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapSet0009';
      try {
        const hashMap: HashMap<string, number> = new HashMap<string, number>();
        for (let i = 0; i < 1000; i++) {
          hashMap.set("ji" + i, i);
        }
        for (let i = 0; i < 1000; i++) {
          expect(String(hashMap.get("ji" + i))).assertEqual(String(i));
        }
        expect(String(hashMap.length)).assertEqual('1000');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_SET_1000
     * @tc.name      : testHashMapSet0010
     * @tc.desc      : Testing HashMap remove->set->clear->replace
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapSet0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapSet0010';
      try {
        const hashMap: HashMap<string, number> = new HashMap<string, number>();
        hashMap.remove("sparrow");
        hashMap.set("sparrow", 356);
        hashMap.clear();
        hashMap.replace("sparrow", 12);
        expect(String(hashMap.get("sparrow"))).assertEqual('undefined');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_REMOVE_0100
     * @tc.name      : testHashMapRemove0001
     * @tc.desc      : Testing HashMap is empty and check if remove ""
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapRemove0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapRemove0001';
      try {
        const hashMap = new HashMap<string, string>();
        expect(String(hashMap.remove(''))).assertEqual('undefined');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_REMOVE_0200
    //  * @tc.name      : testHashMapRemove0002
    //  * @tc.desc      : Testing HashMap is empty and check if remove null
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 1
    //  */
    // it('testHashMapRemove0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = 'testHashMapRemove0002';
    //   try {
    //     const hashMap = new HashMap<string, number>();
    //     expect(String(hashMap.remove(null))).assertEqual('undefined');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_REMOVE_0300
    //  * @tc.name      : testHashMapRemove0003
    //  * @tc.desc      : Testing HashMap is empty and check if remove undefined
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 1
    //  */
    // it('testHashMapRemove0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = 'testHashMapRemove0003';
    //   try {
    //     const hashMap = new HashMap<string, number>();
    //     expect(String(hashMap.remove(undefined))).assertEqual('undefined');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_REMOVE_0400
     * @tc.name      : testHashMapRemove0004
     * @tc.desc      : Testing HashMap is empty and check if remove key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapRemove0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapRemove0004';
      try {
        const hashMap = new HashMap<string, string>();
        expect(String(hashMap.remove('key'))).assertEqual('undefined');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_REMOVE_0500
     * @tc.name      : testHashMapRemove0005
     * @tc.desc      : Testing HashMap has data and check if remove this key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapRemove0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapRemove0005';
      try {
        const hashMap = new HashMap<string, string>();
        hashMap.set("ji", "hello");
        expect(String(hashMap.remove('ji'))).assertEqual("hello");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_REMOVE_0600
     * @tc.name      : testHashMapRemove0006
     * @tc.desc      : Testing HashMap has data and check if not remove this key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapRemove0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapRemove0006';
      try {
        const hashMap = new HashMap<string, string>();
        hashMap.set("ji", "hello");
        expect(String(hashMap.remove('li'))).assertEqual('undefined');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_REMOVE_0700
     * @tc.name      : testHashMapRemove0007
     * @tc.desc      : Testing HashMap remove->set->clear
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapRemove0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapRemove0007';
      try {
        const hashMap = new HashMap<string, string>();
        hashMap.remove("ji");
        hashMap.set("ji", "hello");
        hashMap.clear();
        expect(String(hashMap.remove('ji'))).assertEqual('undefined');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_CLEAR_0100
     * @tc.name      : testHashMapClear0001
     * @tc.desc      : Testing HashMap is empty clear and check length get hasKey
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapClear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapClear0001';
      try {
        const hashMap = new HashMap<string, number>();
        hashMap.clear();
        expect(String(hashMap.length)).assertEqual('0');
        expect(String(hashMap.get('ji'))).assertEqual('undefined');
        expect(String(hashMap.hasKey('ji'))).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_CLEAR_0200
     * @tc.name      : testHashMapClear0002
     * @tc.desc      : Testing HashMap has data clear and check length get hasKey
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapClear0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapClear0002';
      try {
        const hashMap = new HashMap<string, number>();
        hashMap.set("ji", 12);
        hashMap.clear();
        expect(String(hashMap.length)).assertEqual('0');
        expect(String(hashMap.get('ji'))).assertEqual('undefined');
        expect(String(hashMap.hasKey('ji'))).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_CLEAR_0300
     * @tc.name      : testHashMapClear0003
     * @tc.desc      : Testing HashMap has data clear and set data check length
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapClear0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapClear0003';
      try {
        const hashMap = new HashMap<string, number>();
        hashMap.set("ji", 12);
        hashMap.clear();
        hashMap.set("ji", 13);
        expect(String(hashMap.length)).assertEqual('1');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_KEYS_0100
     * @tc.name      : testHashMapKeys0001
     * @tc.desc      : Testing HashMap is empty check keys
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapKeys0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapKeys0001';
      try {
        const hashMap = new HashMap<string, number>();
        let keys = hashMap.keys();
        expect(String(keys.next().done)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_KEYS_0200
     * @tc.name      : testHashMapKeys0002
     * @tc.desc      : Testing HashMap has data check everyOne key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapKeys0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapKeys0002';
      try {
        const hashMap = new HashMap<number, number>();
        hashMap.set(0, 1);
        hashMap.set(1, 2);
        hashMap.set(2, 3);
        let keys = hashMap.keys();
        let temp = keys.next();
        let index = 0;
        while (!temp.done) {
          if (temp.value) {
            expect(String(temp.value)).assertEqual(String(index));
          }
          temp = keys.next();
          index++;
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_VALUES_0100
     * @tc.name      : testHashMapValues0001
     * @tc.desc      : Testing HashMap is empty check values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapValues0001';
      try {
        const hashMap = new HashMap<string, number>();
        let keys = hashMap.values();
        expect(String(keys.next().done)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_VALUES_0200
     * @tc.name      : testHashMapValues0002
     * @tc.desc      : Testing HashMap has data check everyOne value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapValues0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapValues0002';
      try {
        const hashMap = new HashMap<number, number>();
        hashMap.set(0, 1);
        hashMap.set(1, 2);
        hashMap.set(2, 3);
        let values = hashMap.values();
        let temp = values.next();
        let index = 1;
        while (!temp.done) {
          if (temp.value) {
            expect(String(temp.value)).assertEqual(String(index));
          }
          temp = values.next();
          index++;
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_REPLACE_0100
     * @tc.name      : testHashMapReplace0001
     * @tc.desc      : Testing HashMap is empty and check if key is ""
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapReplace0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapReplace0001';
      try {
        const hashMap = new HashMap<string, number>();
        expect(String(hashMap.replace('', 1))).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_REPLACE_0200
    //  * @tc.name      : testHashMapReplace0002
    //  * @tc.desc      : Testing HashMap is empty and check if key is null
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 1
    //  */
    // it('testHashMapReplace0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = 'testHashMapReplace0002';
    //   try {
    //     const hashMap = new HashMap<string, number>();
    //     expect(String(hashMap.replace(null, 1))).assertEqual('false');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_REPLACE_0300
    //  * @tc.name      : testHashMapReplace0003
    //  * @tc.desc      : Testing HashMap is empty and check if ke is undefined
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 1
    //  */
    // it('testHashMapReplace0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = 'testHashMapReplace0003';
    //   try {
    //     const hashMap = new HashMap<string, number>();
    //     expect(String(hashMap.replace(undefined, 1))).assertEqual('false');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_REPLACE_0400
     * @tc.name      : testHashMapReplace0004
     * @tc.desc      : Testing HashMap is empty and check if key is key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapReplace0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapReplace0004';
      try {
        const hashMap = new HashMap<string, number>();
        expect(String(hashMap.replace('key', 1))).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_REPLACE_0500
     * @tc.name      : testHashMapReplace0005
     * @tc.desc      : Testing HashMap has data and check if key and value not change
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapReplace0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapReplace0005';
      try {
        const hashMap = new HashMap<string, number>();
        hashMap.set("ji", 1);
        expect(String(hashMap.replace("ji", 1))).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_REPLACE_0600
     * @tc.name      : testHashMapReplace0006
     * @tc.desc      : Testing HashMap has data and check if value change
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapReplace0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapReplace0006';
      try {
        const hashMap = new HashMap<string, number>();
        hashMap.set("ji", 1);
        expect(String(hashMap.replace("ji", 2))).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_REPLACE_0700
     * @tc.name      : testHashMapReplace0007
     * @tc.desc      : Testing HashMap has data and check if key is 1 and value is change
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapReplace0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapReplace0007';
      try {
        const hashMap = new HashMap<number, number>();
        hashMap.set(2, 1);
        expect(String(hashMap.replace(1, 2))).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_FOREACH_0100
     * @tc.name      : testHashMapForeach0001
     * @tc.desc      : Testing HashMap is empty foreach check length
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapForeach0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapForeach0001';
      try {
        const hashMap = new HashMap<number, number>();
        hashMap.forEach((value?: number, key?: number) => {
          expect(String(hashMap.length)).assertEqual('0');
        });
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_FOREACH_0200
     * @tc.name      : testHashMapForeach0002
     * @tc.desc      : Testing HashMap has foreach check value and allLength
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapForeach0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapForeach0002';
      try {
        const hashMap = new HashMap<number, number>();
        hashMap.set(0, 0);
        hashMap.set(1, 1);
        hashMap.set(2, 2);
        let index = 0;
        hashMap.forEach((value?: number, key?: number) => {
          expect(String(key)).assertEqual(String(index));
          expect(String(value)).assertEqual(String(index));
          index++;
        });
        expect(String(hashMap.length)).assertEqual('3');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_FOREACH_0300
     * @tc.name      : testHashMapForeach0003
     * @tc.desc      : Testing HashMap has foreach check remove
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapForeach0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapForeach0003';
      try {
        const hashMap = new HashMap<number, number>();
        hashMap.set(0, 0);
        hashMap.set(1, 1);
        hashMap.set(2, 2);
        hashMap.forEach((value: number, key: number) => {
          expect(String(hashMap.remove(key))).assertEqual(String(value));
        });
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_FOREACH_0400
     * @tc.name      : testHashMapForeach0004
     * @tc.desc      : Testing HashMap has foreach check replace
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapForeach0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapForeach0004';
      try {
        const hashMap = new HashMap<number, number>();
        hashMap.set(0, 0);
        hashMap.set(1, 1);
        hashMap.set(2, 2);
        hashMap.forEach((value: number, key: number) => {
          expect(String(hashMap.replace(key, value ? value + 1 : 0))).assertEqual('true');
        });
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_FOREACH_0500
     * @tc.name      : testHashMapForeach0005
     * @tc.desc      : Testing HashMap has foreach if clear check length
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapForeach0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapForeach0005';
      try {
        const hashMap = new HashMap<number, number>();
        hashMap.set(0, 0);
        hashMap.set(1, 1);
        hashMap.set(2, 2);
        hashMap.forEach((value?: number, key?: number) => {
          hashMap.clear();
          expect(String(hashMap.length)).assertEqual('0');
        });
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_FOREACH_0600
     * @tc.name      : testHashMapForeach0006
     * @tc.desc      : Testing HashMap has foreach if no params check length
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapForeach0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapForeach0006';
      try {
        const hashMap = new HashMap<number, number>();
        hashMap.set(0, 0);
        hashMap.set(1, 1);
        hashMap.set(2, 2);
        hashMap.forEach((): void => {
          expect(String(hashMap.length)).assertEqual('3');
        });
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_FOREACH_0700
     * @tc.name      : testHashMapForeach0007
     * @tc.desc      : Testing HashMap has foreach if one param check length
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapForeach0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapForeach0007';
      try {
        const hashMap = new HashMap<number, number>();
        hashMap.set(0, 0);
        hashMap.forEach((value) => {
          expect(String(hashMap.length)).assertEqual('1');
          expect(value?.toString()).assertEqual("0");
        });
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_FOREACH_0800
     * @tc.name      : testHashMapForeach0008
     * @tc.desc      : Testing HashMap has foreach ArgThis
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapForeach0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapForeach0008';
      try {
        const hashMap = new HashMap<number, number>();
        const hashMapNew = new HashMap<number, number>();
        hashMap.set(0, 0);
        hashMapNew.set(0, 0);
        hashMap.forEach((value) => {
          expect(String(hashMap.length)).assertEqual('1');
          expect(value?.toString()).assertEqual("0");
        });
        expect(String(hashMapNew.length)).assertEqual('1');
        expect(String(hashMapNew.get(0))).assertEqual('0');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_FOREACH_0900
     * @tc.name      : testHashMapForeach0009
     * @tc.desc      : Testing HashMap has foreach ArgThis
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapForeach0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapForeach0009';
      try {
        const hashMap = new HashMap<number, number>();
        hashMap.set(0, 0);
        hashMap.forEach((value, index, hashMap: HashMap<number, number>) => {
          expect(String(hashMap.length)).assertEqual('1');
          expect(value?.toString()).assertEqual("0");
        });
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_ENTRIES_0100
     * @tc.name      : testHashMapEntries0001
     * @tc.desc      : Testing HashMap is empty check length
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapEntries0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapEntries0001';
      try {
        const hashMap = new HashMap<number, number>();
        let entries = hashMap.entries();
        let temp = entries.next();
        while (!temp.done) {
          expect(String(hashMap.length)).assertEqual('0');
          temp = entries.next();
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_ENTRIES_0200
     * @tc.name      : testHashMapEntries0002
     * @tc.desc      : Testing HashMap has check everyOne and allLength
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapEntries0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapEntries0002';
      try {
        const hashMap = new HashMap<number, number>();
        hashMap.set(0, 0);
        hashMap.set(1, 1);
        hashMap.set(2, 2);
        let entries = hashMap.entries();
        let temp = entries.next();
        let index = 0;
        while (!temp.done) {
          if (!temp.done) {
            expect(String(temp.value![0])).assertEqual(String(index));
            expect(String(temp.value![1])).assertEqual(String(index));
          }
          index++;
          temp = entries.next();
        }
        expect(hashMap.length).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_ENTRIES_0300
     * @tc.name      : testHashMapEntries0003
     * @tc.desc      : Testing HashMap has entries check remove
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapEntries0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapEntries0003';
      try {
        const hashMap = new HashMap<number, number>();
        hashMap.set(0, 0);
        hashMap.set(1, 1);
        hashMap.set(2, 2);
        let entries = hashMap.entries();
        let temp = entries.next();
        while (!temp.done) {
          if (!temp.value) {
            expect(String(hashMap.remove(temp.value![0]))).assertEqual(String(temp.value![1]));
          }
          temp = entries.next();
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_ENTRIES_0400
     * @tc.name      : testHashMapEntries0004
     * @tc.desc      : Testing HashMap has entries check replace
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapEntries0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapEntries0004';
      try {
        const hashMap = new HashMap<number, number>();
        hashMap.set(0, 0);
        hashMap.set(1, 1);
        hashMap.set(2, 2);
        let entries = hashMap.entries();
        let temp = entries.next();
        while (!temp.done) {
          if (!temp.value) {
            let key = temp.value![0];
            let value = temp.value![1];
            expect(String(hashMap.replace(key, value ? value + 1 : 0))).assertEqual('true');
          }
          temp = entries.next();
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_ENTRIES_0500
     * @tc.name      : testHashMapEntries0005
     * @tc.desc      : Testing HashMap has entries if clear check length
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapEntries0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapEntries0005';
      try {
        const hashMap = new HashMap<number, number>();
        hashMap.set(0, 0);
        hashMap.set(1, 1);
        hashMap.set(2, 2);
        let entries = hashMap.entries();
        let temp = entries.next();
        while (!temp.done) {
          if (temp.value) {
            hashMap.clear();
            expect(String(hashMap.length)).assertEqual('0');
          }
          temp = entries.next();
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_SYMBOL_ITERATOR_0100
     * @tc.name      : testHashMapSymbolIterator0001
     * @tc.desc      : Testing HashMap is empty while loop check
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapSymbolIterator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapSymbolIterator0001';
      try {
        const hashMap = new HashMap<number, number>();
        // let iter = hashMap[Symbol.iterator]();
        let iter = hashMap.$_iterator();
          let temp: IteratorResult<[Number, Number]> = iter.next();
        while (!temp.done) {
          expect(String(hashMap.length)).assertEqual('0')
          temp = iter.next()
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_SYMBOL_ITERATOR_0200
     * @tc.name      : testHashMapSymbolIterator0002
     * @tc.desc      : Testing HashMap has data while loop check value and length
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapSymbolIterator0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapSymbolIterator0002';
      try {
        const hashMap = new HashMap<number, number>();
        hashMap.set(0, 0);
        hashMap.set(1, 1);
        hashMap.set(2, 2);
        // let iter = hashMap[Symbol.iterator]();
        let iter = hashMap.$_iterator();
          let temp: IteratorResult<[Number, Number]> = iter.next();
        let index = 0;
        while (!temp.done) {
          if (!temp.value) {
            expect(String(temp.value![0])).assertEqual(String(index));
            expect(String(temp.value![1])).assertEqual(String(index));
          }
          index++;
          temp = iter.next()
        }
        expect(String(hashMap.length)).assertEqual('3')
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHMAP_CUSTOM_0100
     * @tc.name      : testHashMapCustom0001
     * @tc.desc      : Testing HashMap has data while loop check value and length
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashMapCustom0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHashMapCustom0001';
      try {
        const hashMap = new HashMap<number, Temp1>();
        let temp: Temp1 = {
          age: 18, name: "zhang san"
        };
        hashMap.set(0, temp);
        let temp1: Temp1 = {
          age: 19, name: "li si"
        };
        hashMap.set(1, temp1);
        let temp2: Temp1 = {
          age: 31, name: "wang wu"
        };
        hashMap.set(2, temp2);
        const newHashMap = new HashMap<number, Temp1>();
        let temp3: Temp1 = {
          age: 32, name: "zhao liu"
        };
        newHashMap.set(3, temp3);
        hashMap.setAll(newHashMap);
        expect(String(hashMap.isEmpty())).assertEqual('false')
        expect(String(hashMap.hasKey(0))).assertEqual('true')
        expect(String(hashMap.hasValue(temp))).assertEqual('true')
        expect(String(hashMap.get(0))).assertEqual(String(temp));
        let temp4: Temp1 = {
          age: 33, name: "wang ma zi"
        };
        expect(hashMap.replace(1, temp4)).assertEqual(true)
        expect(hashMap.remove(0)).assertEqual(temp)
        hashMap.clear()
        expect(hashMap.length).assertEqual(0)
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });
  });
}