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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import { HashSet } from '@kit.ArkTS';

export default function HasSetTest() {
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
  describe('hasSetTest', () => {
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_LENGTH_0100
     * @tc.name      : testHashSetLength0001
     * @tc.desc      : Testing HashSet length is 0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testHashSetLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testHashSetLength0001';
      try {
        const hashSet = new HashSet<number>();
        expect(hashSet.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_LENGTH_0200
     * @tc.name      : testHashSetLength0002
     * @tc.desc      : Testing HashSet has data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testHashSetLength0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testHashSetLength0002';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        expect(hashSet.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_LENGTH_0300
     * @tc.name      : testHashSetLength0003
     * @tc.desc      : Testing HashSet remove->add->clear
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testHashSetLength0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testHashSetLength0003';
      try {
        const hashSet = new HashSet<number>();
        hashSet.remove(1);
        hashSet.add(1);
        hashSet.clear()
        expect(hashSet.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_LENGTH_0400
     * @tc.name      : testHashSetLength0004
     * @tc.desc      : Testing HashSet add duplicate data length result
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testHashSetLength0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testHashSetLength0004';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        hashSet.add(1);
        expect(hashSet.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_CONSTRUCTOR_0100
     * @tc.name      : testHashSetConstructor0001
     * @tc.desc      : Testing HashSet constructor add sample data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testHashSetConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testHashSetConstructor0001';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        expect(hashSet.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_CONSTRUCTOR_0200
     * @tc.name      : testConstructor0002
     * @tc.desc      : Testing HashSet constructor add custom type data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetConstructor0002';
      try {
        class Tmp {
          name: number = 0
        }

        const hashSet = new HashSet<Tmp>();
        let param: Tmp = {
          name: 1
        };
        hashSet.add(param);
        let result = hashSet.has(param);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_IS_EMPTY_0100
     * @tc.name      : testHashSetIsEmpty0001
     * @tc.desc      : Testing HashSet empty data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetIsEmpty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetIsEmpty0001';
      try {
        const hashSet = new HashSet<number>();
        expect(hashSet.isEmpty()).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_IS_EMPTY_0200
     * @tc.name      : testHashSetIsEmpty0002
     * @tc.desc      : Testing HashSet has data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetIsEmpty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetIsEmpty0002';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        expect(hashSet.isEmpty()).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_IS_EMPTY_0300
     * @tc.name      : testHashSetIsEmpty0003
     * @tc.desc      : Testing HashSet has data and remove
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetIsEmpty0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetIsEmpty0003';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        hashSet.remove(1);
        expect(hashSet.isEmpty()).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_IS_EMPTY_0400
     * @tc.name      : testHashSetIsEmpty0004
     * @tc.desc      : Testing HashSet has data and clear
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetIsEmpty0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetIsEmpty0004';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        hashSet.clear();
        expect(hashSet.isEmpty()).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_HAS_0100
     * @tc.name      : testHashSetHas0001
     * @tc.desc      : Testing HashSet is empty and check if "" has
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetHas0001';
      try {
        const hashSet = new HashSet<string>();
        expect(hashSet.has("")).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_HAS_0200
     * @tc.name      : testHashSetHas0002
     * @tc.desc      : Testing HashSet is empty and check if null has
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetHas0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetHas0002';
      try {
        const hashSet = new HashSet<string>();
        expect(hashSet.has(null)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_HAS_0300
     * @tc.name      : testHashSetHas0003
     * @tc.desc      : Testing HashSet is empty and check if undefined has
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetHas0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetHas0003';
      try {
        const hashSet = new HashSet<string>();
        expect(hashSet.has(undefined)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_HAS_0400
     * @tc.name      : testHashSetHas0004
     * @tc.desc      : Testing HashSet is empty and check if value has
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetHas0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetHas0004';
      try {
        const hashSet = new HashSet<string>();
        expect(hashSet.has('value')).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_HAS_0500
     * @tc.name      : testHashSetHas0005
     * @tc.desc      : Testing HashSet has 1 and check if 1 has
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetHas0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetHas0005';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        expect(hashSet.has(1)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_HAS_0600
     * @tc.name      : testHashSetHas0006
     * @tc.desc      : Testing HashSet has 1 and check if 2 has
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetHas0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetHas0006';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        expect(hashSet.has(2)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_HAS_0700
     * @tc.name      : testHashSetHas0007
     * @tc.desc      : Testing HashSet remove->add->clear
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetHas0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetHas0007';
      try {
        const hashSet = new HashSet<number>();
        hashSet.remove(1)
        hashSet.add(1);
        hashSet.clear();
        expect(hashSet.has(1)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_ADD_0100
     * @tc.name      : testHashSetAdd0001
     * @tc.desc      : Testing HashSet data "" check length =1 and has ""
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetAdd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetAdd0001';
      try {
        const hashSet = new HashSet<string>();
        hashSet.add("");
        let result = hashSet.length == 1 && hashSet.has("");
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_ADD_0200
     * @tc.name      : testHashSetAdd0002
     * @tc.desc      : Testing HashSet data "a" check length =1 and has "a"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetAdd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetAdd0002';
      try {
        const hashSet = new HashSet<string>();
        hashSet.add("a");
        let result = hashSet.length == 1 && hashSet.has("a");
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_ADD_0300
     * @tc.name      : testHashSetAdd0003
     * @tc.desc      : Testing HashSet data null check length =1 and has null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetAdd0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetAdd0003';
      try {
        const hashSet = new HashSet<string>();
        hashSet.add(null);
        let result = hashSet.length == 1 && hashSet.has(null);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_ADD_0400
     * @tc.name      : testHashSetAdd0004
     * @tc.desc      : Testing HashSet data undefined check length =1 and has undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetAdd0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetAdd0004';
      try {
        const hashSet = new HashSet<string>();
        hashSet.add(undefined);
        let result = hashSet.length == 1 && hashSet.has(undefined);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_ADD_0500
     * @tc.name      : testHashSetAdd0005
     * @tc.desc      : Testing HashSet data string length is 2048 check length =1 and has string
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetAdd0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetAdd0005';
      try {
        const hashSet = new HashSet<string>();
        let param = 'a'.repeat(2048);
        hashSet.add(param);
        let result = hashSet.length == 1 && hashSet.has(param);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_ADD_0600
     * @tc.name      : testHashSetAdd0006
     * @tc.desc      : Testing HashSet data has 1000 check length =1 and has 1000 data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetAdd0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetAdd0006';
      try {
        const hashSet = new HashSet<number>();
        for (let i = 0; i < 1000; i++) {
          hashSet.add(i);
        }
        for (let i = 0; i < hashSet.length; i++) {
          expect(hashSet.has(i)).assertEqual(true)
        }
        expect(hashSet.length).assertEqual(1000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_ADD_0700
     * @tc.name      : testHashSetAdd0007
     * @tc.desc      : Testing HashSet remove->add->clear
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetAdd0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetAdd0007';
      try {
        const hashSet = new HashSet<number>();
        hashSet.remove(1);
        hashSet.add(1);
        hashSet.clear();
        let result = hashSet.length == 1 && hashSet.has(1);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_REMOVE_0100
     * @tc.name      : testHashSetRemove0001
     * @tc.desc      : Testing HashSet is empty and remove value is ""
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetRemove0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetRemove0001';
      try {
        const hashSet = new HashSet<string>();
        expect(hashSet.remove("")).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_REMOVE_0200
     * @tc.name      : testHashSetRemove0002
     * @tc.desc      : Testing HashSet is empty and remove value is null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetRemove0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetRemove0002';
      try {
        const hashSet = new HashSet<string>();
        expect(hashSet.remove(null)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_REMOVE_0300
     * @tc.name      : testHashSetRemove0003
     * @tc.desc      : Testing HashSet is empty and remove value is undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetRemove0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetRemove0003';
      try {
        const hashSet = new HashSet<string>();
        expect(hashSet.remove(undefined)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_REMOVE_0400
     * @tc.name      : testHashSetRemove0004
     * @tc.desc      : Testing HashSet is empty and remove value is "a"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetRemove0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetRemove0004';
      try {
        const hashSet = new HashSet<string>();
        expect(hashSet.remove("a")).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_REMOVE_0500
     * @tc.name      : testHashSetRemove0005
     * @tc.desc      : Testing HashSet has 1 and remove value is 1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetRemove0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetRemove0005';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        expect(hashSet.remove(1)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_REMOVE_0600
     * @tc.name      : testHashSetRemove0006
     * @tc.desc      : Testing HashSet has 1 and remove value is 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetRemove0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetRemove0006';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        expect(hashSet.remove(2)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_REMOVE_0700
     * @tc.name      : testHashSetRemove0007
     * @tc.desc      : Testing HashSet remove->add->clear
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetRemove0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetRemove0007';
      try {
        const hashSet = new HashSet<number>();
        hashSet.remove(1);
        hashSet.add(1);
        hashSet.clear();
        expect(hashSet.remove(1)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_CLEAR_0100
     * @tc.name      : testHashSetClear0001
     * @tc.desc      : Testing HashSet is empty clear
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetClear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetClear0001';
      try {
        const hashSet = new HashSet<number>();
        hashSet.clear();
        expect(hashSet.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_CLEAR_0200
     * @tc.name      : testHashSetClear0002
     * @tc.desc      : Testing HashSet has data clear
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetClear0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetClear0002';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        hashSet.clear();
        expect(hashSet.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_CLEAR_0300
     * @tc.name      : testHashSetClear0003
     * @tc.desc      : Testing HashSet has data clear and add
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetClear0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetClear0003';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        hashSet.clear();
        hashSet.add(1);
        expect(hashSet.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_VALUES_0100
     * @tc.name      : testHashSetValues0001
     * @tc.desc      : Testing HashSet is empty get values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetValues0001';
      try {
        const hashSet = new HashSet<number>();
        let values = hashSet.values();
        let temp = values.next()
        expect(temp.done).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_VALUES_0200
     * @tc.name      : testHashSetValues0002
     * @tc.desc      : Testing HashSet has data get values while check
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetValues0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
            expect(temp.value).assertEqual(index);
            index++;
          }
          temp = values.next();
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_FOREACH_0100
     * @tc.name      : testHashSetForEach0001
     * @tc.desc      : Testing HashSet is empty and foreach
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetForEach0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetForEach0001';
      try {
        const hashSet = new HashSet<number>();
        hashSet.forEach((value?: number, key?: number) => {
          expect(hashSet.length).assertEqual(0);
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_FOREACH_0200
     * @tc.name      : testHashSetForEach0002
     * @tc.desc      : Testing HashSet has data check everyOne and length
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetForEach0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetForEach0002';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        hashSet.add(2);
        hashSet.add(3);
        let index = 1;
        hashSet.forEach((value?: number) => {
          expect(value).assertEqual(index);
          index++;
        });
        expect(hashSet.length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_FOREACH_0300
     * @tc.name      : testHashSetForEach0003
     * @tc.desc      : Testing HashSet has data and add check length
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetForEach0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetForEach0003';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        hashSet.forEach((value?: number) => {
          hashSet.add(2);
          expect(hashSet.length).assertEqual(2);
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_FOREACH_0400
     * @tc.name      : testHashSetForEach0004
     * @tc.desc      : Testing HashSet has data and clear check length
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetForEach0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetForEach0004';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        hashSet.forEach((value?: number) => {
          hashSet.clear();
          expect(hashSet.length).assertEqual(0);
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_FOREACH_0500
     * @tc.name      : testHashSetForEach0005
     * @tc.desc      : Testing HashSet has data and ArgThis
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetForEach0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetForEach0005';
      try {
        const hashSet = new HashSet<number>();
        const hashSetNew = new HashSet<number>();
        hashSetNew.add(1);
        hashSet.add(1);
        hashSet.forEach((value?: number) => {
          hashSet.clear();
          expect(hashSet.length).assertEqual(0);
        }, hashSetNew);
        expect(hashSetNew.length).assertEqual(1);
        expect(hashSetNew.has(1)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_FOREACH_0600
     * @tc.name      : testHashSetForEach0006
     * @tc.desc      : Testing HashSet has data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetForEach0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetForEach0006';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        hashSet.forEach((value: number, index, hashSet: HashSet<number>) => {
          hashSet.clear();
          expect(hashSet.length).assertEqual(0);
        })
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_ENTRIES_0100
     * @tc.name      : testHashSetEntries0001
     * @tc.desc      : Testing HashSet is empty get entries length
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetEntries0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetEntries0001';
      try {
        const hashSet = new HashSet<number>();
        let entries = hashSet.entries();
        let temp = entries.next();
        while (!temp.done) {
          expect(hashSet.length).assertEqual(0);
          temp = entries.next();
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_ENTRIES_0200
     * @tc.name      : testHashSetEntries0002
     * @tc.desc      : Testing HashSet has data check everyOne and length
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetEntries0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
            expect(temp.value[1]).assertEqual(index);
          }
          index++;
          temp = entries.next();
        }
        expect(hashSet.length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_ENTRIES_0300
     * @tc.name      : testHashSetEntries0003
     * @tc.desc      : Testing HashSet has data add and check length
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetEntries0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetEntries0003';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1)
        let entries = hashSet.entries();
        let temp = entries.next();
        while (!temp.done) {
          hashSet.add(2)
          expect(hashSet.length).assertEqual(2);
          temp = entries.next();
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_ENTRIES_0400
     * @tc.name      : testHashSetEntries0004
     * @tc.desc      : Testing HashSet has data clear and check length
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetEntries0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetEntries0003';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1)
        let entries = hashSet.entries();
        let temp = entries.next();
        while (!temp.done) {
          hashSet.clear()
          expect(hashSet.length).assertEqual(0);
          temp = entries.next();
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_SYMBOL_ITERATOR_0100
     * @tc.name      : testHashSetSymbolIterator0001
     * @tc.desc      : Testing HashSet is empty while loop check
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetSymbolIterator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetSymbolIterator0001';
      try {
        const hashSet = new HashSet<number>();
        let iter = hashSet[Symbol.iterator]();
        let temp: IteratorResult<number> = iter.next();
        while (!temp.done) {
          expect(hashSet.length).assertEqual(0)
          temp = iter.next()
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_SYMBOL_ITERATOR_0200
     * @tc.name      : testHashSetSymbolIterator0002
     * @tc.desc      : Testing HashSet has data while loop check value and length
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetSymbolIterator0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetSymbolIterator0002';
      try {
        const hashSet = new HashSet<number>();
        hashSet.add(1)
        hashSet.add(2)
        hashSet.add(3)
        let iter = hashSet[Symbol.iterator]();
        let temp: IteratorResult<number> = iter.next();
        let index = 1;
        while (!temp.done) {
          if (temp.value) {
            expect(temp.value).assertEqual(index)
          }
          index++;
          temp = iter.next()
        }
        expect(hashSet.length).assertEqual(3)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_HASHSET_CUSTOM_0100
     * @tc.name      : testHashSetCustom0001
     * @tc.desc      : Testing HashSet has data check custom value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHashSetCustom0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testHashSetCustom0001';
      try {
        class Temp {
          age: number = 0
          name: string = ""
        }

        const hashSet = new HashSet<Temp>();
        let temp: Temp = {
          age: 18, name: "zhang san"
        };
        hashSet.add(temp)
        let temp1: Temp = {
          age: 19, name: "li si"
        };
        hashSet.add(temp1)
        let temp2: Temp = {
          age: 31, name: "wang wu"
        };
        hashSet.add(temp2)
        expect(hashSet.isEmpty()).assertEqual(false)
        let removeResult = hashSet.remove(temp)
        expect(removeResult).assertEqual(true)
        hashSet.clear()
        expect(hashSet.length).assertEqual(0)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
  })
}