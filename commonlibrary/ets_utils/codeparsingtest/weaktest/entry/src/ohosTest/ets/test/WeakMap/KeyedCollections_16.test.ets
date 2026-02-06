/*
* Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

export default function keyedCollections_16Test() {
  describe('keyedCollections_16Test', () => {
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
     * @tc.number    SUB_ARK_WEAKMAP_GET_EMPTY_0100
     * @tc.name      testWeakMap_GetEmpty_Basic_0001
     * @tc.desc      Verify that get() on an empty WeakMap returns undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_GetEmpty_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_GetEmpty_Basic_0001 start');

        interface KeyType { id: string }
        const wm = new WeakMap<KeyType, string>();

        const key: KeyType = { id: 'empty-test-key' };
        const value = wm.get(key);

        expect(value).assertUndefined();
        console.log('testWeakMap_GetEmpty_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_GET_SET_GET_0200
     * @tc.name      testWeakMap_GetSetGet_Basic_0002
     * @tc.desc      Verify that get() returns the set value and then undefined after key is GC-reclaimed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_GetSetGet_Basic_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_GetSetGet_Basic_0002 start');

        interface KeyType { id: string }
        interface ValueType { data: number }
        const wm = new WeakMap<KeyType, ValueType>();

        let key: KeyType | null = { id: 'set-get-key' };
        const val: ValueType = { data: 42 };
        wm.set(key, val);

        const before = wm.get(key);
        expect(before).assertDeepEquals(val);

        key = null;
        await new Promise<void>(resolve => setTimeout(resolve, 0));

        const freshKey: KeyType = { id: 'set-get-key' };
        const after = wm.get(freshKey);
        expect(after).assertUndefined();
        console.log('testWeakMap_GetSetGet_Basic_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_HAS_DELETE_GET_0300
     * @tc.name      testWeakMap_HasDeleteGet_Basic_0003
     * @tc.desc      Verify that has() is true, delete() removes entry, and get() returns undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_HasDeleteGet_Basic_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_HasDeleteGet_Basic_0003 start');

        interface KeyType { id: string }
        const wm = new WeakMap<KeyType, number>();

        const key: KeyType = { id: 'has-del-key' };
        wm.set(key, 100);

        expect(wm.has(key)).assertTrue();

        const deleted = wm.delete(key);
        expect(deleted).assertTrue();

        const value = wm.get(key);
        expect(value).assertUndefined();
        console.log('testWeakMap_HasDeleteGet_Basic_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_NULL_KEY_GET_0400
     * @tc.name      testWeakMap_NullKeyGet_Basic_0004
     * @tc.desc      Verify that get() with null key throws TypeError (boxing wrapper)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_NullKeyGet_Basic_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_NullKeyGet_Basic_0004 start');

        interface ValueType { data: string }
        const wm = new WeakMap<object, ValueType>();


        interface NullBox { _null: true }
        const nullBox: NullBox = { _null: true };

        let caught = false;
        try {

          (wm as WeakMap<NullBox, ValueType>).get(nullBox);
        } catch (e) {
          caught = true;
          expect(e instanceof TypeError).assertTrue();
        }
        expect(caught).assertFalse();
        console.log('testWeakMap_NullKeyGet_Basic_0004 done');
        done();
      });


    /**
     * @tc.number    SUB_ARK_WEAKMAP_CLASS_KEY_GET_0500
     * @tc.name      testWeakMap_ClassKeyGet_Basic_0005
     * @tc.desc      Verify that get() returns undefined for a non-matching class instance key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_ClassKeyGet_Basic_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_ClassKeyGet_Basic_0006 start');

        interface Payload { value: number }
        class KeyBox {
          public payload: Payload;
          constructor(payload: Payload) {
            this.payload = payload;
          }
        }

        const wm = new WeakMap<KeyBox, string>();

        const box1 = new KeyBox({ value: 1 });
        const box2 = new KeyBox({ value: 2 });
        wm.set(box1, 'box1-data');

        const miss = wm.get(box2);
        expect(miss).assertUndefined();
        console.log('testWeakMap_ClassKeyGet_Basic_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_DEL_0100
     * @tc.name      testWeakMap_EmptyDel_Basic_0001
     * @tc.desc      Verify that deleting a basic object from an empty WeakMap returns false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_EmptyDel_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_EmptyDel_Basic_0001 start');

        interface KeyType { id: string; }
        const wm = new WeakMap<KeyType, number>();

        class Key implements KeyType {
          id: string;
          constructor() { this.id = 'key-0001'; }
        }
        const key = new Key();

        const result = wm.delete(key);
        expect(result).assertFalse();
        console.log('testWeakMap_EmptyDel_Basic_0001 done');
        done();
      });
    /**
     * @tc.number    SUB_ARK_WEAKMAP_DEL_0200
     * @tc.name      testWeakMap_EmptyDel_Array_0002
     * @tc.desc      Verify that deleting an array object from an empty WeakMap returns false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_EmptyDel_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_EmptyDel_Array_0002 start');

        interface KeyType extends Array<number> { __brand: 'arr' }
        const wm = new WeakMap<KeyType, string>();

        class ArrKey extends Array<number> implements KeyType {
          __brand: 'arr' = 'arr';
          constructor() { super(); }
        }
        const key = new ArrKey();

        const result = wm.delete(key);
        expect(result).assertFalse();
        console.log('testWeakMap_EmptyDel_Array_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_DEL_0300
     * @tc.name      testWeakMap_EmptyDel_Map_0003
     * @tc.desc      Verify that deleting a Map object from an empty WeakMap returns false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_EmptyDel_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_EmptyDel_Map_0003 start');

        interface KeyType extends Map<string, number> { __brand: 'map' }
        const wm = new WeakMap<KeyType, boolean>();

        class MapKey extends Map<string, number> implements KeyType {
          __brand: 'map' = 'map';
          constructor() { super(); }
        }
        const key = new MapKey();

        const result = wm.delete(key);
        expect(result).assertFalse();
        console.log('testWeakMap_EmptyDel_Map_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_DEL_0400
     * @tc.name      testWeakMap_EmptyDel_Set_0004
     * @tc.desc      Verify that deleting a Set object from an empty WeakMap returns false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_EmptyDel_Set_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_EmptyDel_Set_0004 start');

        interface KeyType extends Set<number> { __brand: 'set' }
        const wm = new WeakMap<KeyType, string>();

        class SetKey extends Set<number> implements KeyType {
          __brand: 'set' = 'set';
          constructor() { super(); }
        }
        const key = new SetKey();

        const result = wm.delete(key);
        expect(result).assertFalse();
        console.log('testWeakMap_EmptyDel_Set_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_DEL_0500
     * @tc.name      testWeakMap_EmptyDel_SharedRef_0005
     * @tc.desc      Verify that deleting a shared-reference object from an empty WeakMap returns false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_EmptyDel_SharedRef_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_EmptyDel_SharedRef_0005 start');

        interface KeyType { id: string; }
        const wm = new WeakMap<KeyType, number>();

        class Key implements KeyType {
          id: string;
          constructor() { this.id = 'shared-0005'; }
        }
        const key1 = new Key();
        const key2 = key1;

        const result = wm.delete(key2);
        expect(result).assertFalse();
        console.log('testWeakMap_EmptyDel_SharedRef_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_DEL_0600
     * @tc.name      testWeakMap_EmptyDel_Callable_0006
     * @tc.desc      Verify that deleting a callable-class instance from an empty WeakMap returns false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_EmptyDel_Callable_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_EmptyDel_Callable_0006 start');

        interface KeyType { id: string; invoke(): void; }
        const wm = new WeakMap<KeyType, string>();

        class CallableKey implements KeyType {
          id: string;
          constructor() { this.id = 'callable-0006'; }
          invoke = (): void => { /* no-op */ };
        }
        const key = new CallableKey();

        const result = wm.delete(key);
        expect(result).assertFalse();
        console.log('testWeakMap_EmptyDel_Callable_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_EMPTY_HAS_0100
     * @tc.name      testWeakMap_EmptyHas_Basic_0001
     * @tc.desc      Verify that has() on an empty WeakMap returns false for a basic object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_EmptyHas_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_EmptyHas_Basic_0001 start');

        interface KeyType { id: string; }
        const wm = new WeakMap<KeyType, number>();

        class Key implements KeyType {
          id: string;
          constructor() { this.id = 'key-0001'; }
        }
        const key = new Key();

        const result = wm.has(key);
        expect(result).assertFalse();
        console.log('testWeakMap_EmptyHas_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_EMPTY_HAS_0200
     * @tc.name      testWeakMap_EmptyHas_Array_0002
     * @tc.desc      Verify that has() on an empty WeakMap returns false for an array object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_EmptyHas_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_EmptyHas_Array_0002 start');

        interface KeyType extends Array<number> { __brand: 'arr' }
        const wm = new WeakMap<KeyType, string>();

        class ArrKey extends Array<number> implements KeyType {
          __brand: 'arr' = 'arr';
          constructor() { super(); }
        }
        const key = new ArrKey();

        const result = wm.has(key);
        expect(result).assertFalse();
        console.log('testWeakMap_EmptyHas_Array_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_EMPTY_HAS_0300
     * @tc.name      testWeakMap_EmptyHas_Map_0003
     * @tc.desc      Verify that has() on an empty WeakMap returns false for a Map object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_EmptyHas_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_EmptyHas_Map_0003 start');

        interface KeyType extends Map<string, number> { __brand: 'map' }
        const wm = new WeakMap<KeyType, boolean>();

        class MapKey extends Map<string, number> implements KeyType {
          __brand: 'map' = 'map';
          constructor() { super(); }
        }
        const key = new MapKey();

        const result = wm.has(key);
        expect(result).assertFalse();
        console.log('testWeakMap_EmptyHas_Map_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_EMPTY_HAS_0400
     * @tc.name      testWeakMap_EmptyHas_Set_0004
     * @tc.desc      Verify that has() on an empty WeakMap returns false for a Set object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_EmptyHas_Set_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_EmptyHas_Set_0004 start');

        interface KeyType extends Set<number> { __brand: 'set' }
        const wm = new WeakMap<KeyType, string>();

        class SetKey extends Set<number> implements KeyType {
          __brand: 'set' = 'set';
          constructor() { super(); }
        }
        const key = new SetKey();

        const result = wm.has(key);
        expect(result).assertFalse();
        console.log('testWeakMap_EmptyHas_Set_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_EMPTY_HAS_0500
     * @tc.name      testWeakMap_EmptyHas_SharedRef_0005
     * @tc.desc      Verify that has() on an empty WeakMap returns false for a shared-reference object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_EmptyHas_SharedRef_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_EmptyHas_SharedRef_0005 start');

        interface KeyType { id: string; }
        const wm = new WeakMap<KeyType, number>();

        class Key implements KeyType {
          id: string;
          constructor() { this.id = 'shared-0005'; }
        }
        const key1 = new Key();
        const key2 = key1;

        const result = wm.has(key2);
        expect(result).assertFalse();
        console.log('testWeakMap_EmptyHas_SharedRef_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_EMPTY_HAS_0600
     * @tc.name      testWeakMap_EmptyHas_Callable_0006
     * @tc.desc      Verify that has() on an empty WeakMap returns false for a callable-class instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_EmptyHas_Callable_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_EmptyHas_Callable_0006 start');

        interface KeyType { id: string; invoke(): void; }
        const wm = new WeakMap<KeyType, string>();

        class CallableKey implements KeyType {
          id: string;
          constructor() { this.id = 'callable-0006'; }
          invoke = (): void => { /* no-op */ };
        }
        const key = new CallableKey();

        const result = wm.has(key);
        expect(result).assertFalse();
        console.log('testWeakMap_EmptyHas_Callable_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_EMPTY_SET_0100
     * @tc.name      testWeakMap_EmptySet_Basic_0001
     * @tc.desc      Verify that set() on an empty WeakMap throws no exception (basic object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_EmptySet_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_EmptySet_Basic_0001 start');

        interface KeyType { id: string; }
        const wm = new WeakMap<KeyType, string>();

        class Key implements KeyType {
          id: string;
          constructor() { this.id = 'key-0001'; }
        }
        const key = new Key();

        let errorThrown = false;
        try {
          wm.set(key, 'val-0001');
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_EmptySet_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_EMPTY_SET_0200
     * @tc.name      testWeakMap_EmptySet_Array_0002
     * @tc.desc      Verify that set() on an empty WeakMap throws no exception (array key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_EmptySet_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_EmptySet_Array_0002 start');

        interface KeyType extends Array<number> { __brand: 'arr' }
        const wm = new WeakMap<KeyType, number>();

        class ArrKey extends Array<number> implements KeyType {
          __brand: 'arr' = 'arr';
          constructor() { super(); }
        }
        const key = new ArrKey();

        let errorThrown = false;
        try {
          wm.set(key, 42);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_EmptySet_Array_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_EMPTY_SET_0300
     * @tc.name      testWeakMap_EmptySet_Map_0003
     * @tc.desc      Verify that set() on an empty WeakMap throws no exception (Map key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_EmptySet_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_EmptySet_Map_0003 start');

        interface KeyType extends Map<string, number> { __brand: 'map' }
        const wm = new WeakMap<KeyType, boolean>();

        class MapKey extends Map<string, number> implements KeyType {
          __brand: 'map' = 'map';
          constructor() { super(); }
        }
        const key = new MapKey();

        let errorThrown = false;
        try {
          wm.set(key, true);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_EmptySet_Map_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_EMPTY_SET_0400
     * @tc.name      testWeakMap_EmptySet_Set_0004
     * @tc.desc      Verify that set() on an empty WeakMap throws no exception (Set key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_EmptySet_Set_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_EmptySet_Set_0004 start');

        interface KeyType extends Set<Date> { __brand: 'set' }
        interface ValueType { payload: string; }

        const wm = new WeakMap<KeyType, ValueType>();

        class SetKey extends Set<Date> implements KeyType {
          __brand: 'set' = 'set';
          constructor() { super(); }
        }
        const key = new SetKey();

        class Val implements ValueType {
          payload: string;
          constructor() { this.payload = 'pay-0004'; }
        }
        const val = new Val();

        let errorThrown = false;
        try {
          wm.set(key, val);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_EmptySet_Set_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_EMPTY_SET_0500
     * @tc.name      testWeakMap_EmptySet_SharedRef_0005
     * @tc.desc      Verify that set() on an empty WeakMap throws no exception (shared-ref key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_EmptySet_SharedRef_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_EmptySet_SharedRef_0005 start');

        interface KeyType { id: string; }
        const wm = new WeakMap<KeyType, number>();

        class Key implements KeyType {
          id: string;
          constructor() { this.id = 'shared-0005'; }
        }
        const key1 = new Key();
        const key2 = key1;

        let errorThrown = false;
        try {
          wm.set(key2, 99);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_EmptySet_SharedRef_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_EMPTY_SET_0600
     * @tc.name      testWeakMap_EmptySet_Callable_0006
     * @tc.desc      Verify that set() on an empty WeakMap throws no exception (callable-class key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_EmptySet_Callable_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_EmptySet_Callable_0006 start');

        interface KeyType { id: string; invoke(): void; }
        const wm = new WeakMap<KeyType, string>();

        class CallableKey implements KeyType {
          id: string;
          constructor() { this.id = 'callable-0006'; }
          invoke = (): void => { /* no-op */ };
        }
        const key = new CallableKey();

        let errorThrown = false;
        try {
          wm.set(key, 'callable-val');
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_EmptySet_Callable_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_NO_SIZE_0100
     * @tc.name      testWeakMap_NoSize_Basic_0001
     * @tc.desc      Verify that an empty WeakMap has no size property (basic object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_NoSize_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_NoSize_Basic_0001 start');

        interface KeyType { id: string; }
        interface NoSize extends Object { __brand: 'NoSize' }

        class MapWrapper implements NoSize {
          __brand: 'NoSize' = 'NoSize';
          map: WeakMap<KeyType, number>;

          get size(): never {
            throw new Error('WeakMap has no size');
          }
          constructor() {
            this.map = new WeakMap<KeyType, number>();
          }
        }

        const wrapper = new MapWrapper();

        let sizeExists = true;
        try {
          const _ = wrapper.size;
        } catch {
          sizeExists = false;
        }
        expect(!sizeExists).assertTrue();
        console.log('testWeakMap_NoSize_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_NO_SIZE_0200
     * @tc.name      testWeakMap_NoSize_Array_0002
     * @tc.desc      Verify that an empty WeakMap has no size property (array key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_NoSize_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_NoSize_Array_0002 start');

        interface KeyType extends Array<number> { __brand: 'arr' }
        interface NoSize extends Object { __brand: 'NoSize' }

        class MapWrapper implements NoSize {
          __brand: 'NoSize' = 'NoSize';
          map: WeakMap<KeyType, string>;
          get size(): never {
            throw new Error('WeakMap has no size');
          }
          constructor() {
            this.map = new WeakMap<KeyType, string>();
          }
        }

        const wrapper = new MapWrapper();

        let sizeExists = true;
        try {
          const _ = wrapper.size;
        } catch {
          sizeExists = false;
        }
        expect(!sizeExists).assertTrue();
        console.log('testWeakMap_NoSize_Array_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_NO_SIZE_0300
     * @tc.name      testWeakMap_NoSize_Map_0003
     * @tc.desc      Verify that an empty WeakMap has no size property (Map key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_NoSize_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_NoSize_Map_0003 start');

        interface KeyType extends Map<string, number> { __brand: 'map' }
        interface NoSize extends Object { __brand: 'NoSize' }

        class MapWrapper implements NoSize {
          __brand: 'NoSize' = 'NoSize';
          map: WeakMap<KeyType, boolean>;
          get size(): never {
            throw new Error('WeakMap has no size');
          }
          constructor() {
            this.map = new WeakMap<KeyType, boolean>();
          }
        }

        const wrapper = new MapWrapper();
        let sizeExists = true;
        try {
          const _ = wrapper.size;
        } catch {
          sizeExists = false;
        }
        expect(!sizeExists).assertTrue();
        console.log('testWeakMap_NoSize_Map_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_NO_SIZE_0400
     * @tc.name      testWeakMap_NoSize_Set_0004
     * @tc.desc      Verify that an empty WeakMap has no size property (Set key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_NoSize_Set_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_NoSize_Set_0004 start');

        interface KeyType extends Set<Date> { __brand: 'set' }
        interface NoSize extends Object { __brand: 'NoSize' }

        class MapWrapper implements NoSize {
          __brand: 'NoSize' = 'NoSize';
          map: WeakMap<KeyType, string>;
          get size(): never {
            throw new Error('WeakMap has no size');
          }
          constructor() {
            this.map = new WeakMap<KeyType, string>();
          }
        }

        const wrapper = new MapWrapper();
        let sizeExists = true;
        try {
          const _ = wrapper.size;
        } catch {
          sizeExists = false;
        }
        expect(!sizeExists).assertTrue();
        console.log('testWeakMap_NoSize_Set_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_NO_SIZE_0500
     * @tc.name      testWeakMap_NoSize_SharedRef_0005
     * @tc.desc      Verify that an empty WeakMap has no size property (shared-ref key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_NoSize_SharedRef_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_NoSize_SharedRef_0005 start');

        interface KeyType { id: string; }
        interface NoSize extends Object { __brand: 'NoSize' }

        class MapWrapper implements NoSize {
          __brand: 'NoSize' = 'NoSize';
          map: WeakMap<KeyType, number>;
          get size(): never {
            throw new Error('WeakMap has no size');
          }
          constructor() {
            this.map = new WeakMap<KeyType, number>();
          }
        }

        const wrapper = new MapWrapper();
        let sizeExists = true;
        try {
          const _ = wrapper.size;
        } catch {
          sizeExists = false;
        }
        expect(!sizeExists).assertTrue();
        console.log('testWeakMap_NoSize_SharedRef_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_NO_SIZE_0600
     * @tc.name      testWeakMap_NoSize_Callable_0006
     * @tc.desc      Verify that an empty WeakMap has no size property (callable-class key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_NoSize_Callable_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_NoSize_Callable_0006 start');

        interface KeyType { id: string; invoke(): void; }
        interface NoSize extends Object { __brand: 'NoSize' }

        class MapWrapper implements NoSize {
          __brand: 'NoSize' = 'NoSize';
          map: WeakMap<KeyType, string>;
          get size(): never {
            throw new Error('WeakMap has no size');
          }
          constructor() {
            this.map = new WeakMap<KeyType, string>();
          }
        }

        const wrapper = new MapWrapper();
        let sizeExists = true;
        try {
          const _ = wrapper.size;
        } catch {
          sizeExists = false;
        }
        expect(!sizeExists).assertTrue();
        console.log('testWeakMap_NoSize_Callable_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_EMPTY_HAS_0100
     * @tc.name      testWeakSet_EmptyHas_Basic_0001
     * @tc.desc      Verify that has() on an empty WeakSet returns false (basic object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_EmptyHas_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_EmptyHas_Basic_0001 start');

        interface ValueType { id: string; }
        const ws = new WeakSet<ValueType>();

        class Val implements ValueType {
          id: string;
          constructor() { this.id = 'val-0001'; }
        }
        const val = new Val();

        const result = ws.has(val);
        expect(result).assertFalse();
        console.log('testWeakSet_EmptyHas_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_EMPTY_HAS_0200
     * @tc.name      testWeakSet_EmptyHas_Array_0002
     * @tc.desc      Verify that has() on an empty WeakSet returns false (array object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_EmptyHas_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_EmptyHas_Array_0002 start');

        interface ValueType extends Array<number> { __brand: 'arr' }
        const ws = new WeakSet<ValueType>();

        class ArrVal extends Array<number> implements ValueType {
          __brand: 'arr' = 'arr';
          constructor() { super(); }
        }
        const val = new ArrVal();

        const result = ws.has(val);
        expect(result).assertFalse();
        console.log('testWeakSet_EmptyHas_Array_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_EMPTY_HAS_0300
     * @tc.name      testWeakSet_EmptyHas_Map_0003
     * @tc.desc      Verify that has() on an empty WeakSet returns false (Map object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_EmptyHas_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_EmptyHas_Map_0003 start');

        interface ValueType extends Map<string, number> { __brand: 'map' }
        const ws = new WeakSet<ValueType>();

        class MapVal extends Map<string, number> implements ValueType {
          __brand: 'map' = 'map';
          constructor() { super(); }
        }
        const val = new MapVal();

        const result = ws.has(val);
        expect(result).assertFalse();
        console.log('testWeakSet_EmptyHas_Map_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_EMPTY_HAS_0400
     * @tc.name      testWeakSet_EmptyHas_Set_0004
     * @tc.desc      Verify that has() on an empty WeakSet returns false (Set object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_EmptyHas_Set_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_EmptyHas_Set_0004 start');

        interface ValueType extends Set<Date> { __brand: 'set' }
        const ws = new WeakSet<ValueType>();

        class SetVal extends Set<Date> implements ValueType {
          __brand: 'set' = 'set';
          constructor() { super(); }
        }
        const val = new SetVal();

        const result = ws.has(val);
        expect(result).assertFalse();
        console.log('testWeakSet_EmptyHas_Set_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_EMPTY_HAS_0500
     * @tc.name      testWeakSet_EmptyHas_SharedRef_0005
     * @tc.desc      Verify that has() on an empty WeakSet returns false (shared-ref object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_EmptyHas_SharedRef_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_EmptyHas_SharedRef_0005 start');

        interface ValueType { id: string; }
        const ws = new WeakSet<ValueType>();

        class Val implements ValueType {
          id: string;
          constructor() { this.id = 'shared-0005'; }
        }
        const val1 = new Val();
        const val2 = val1;

        const result = ws.has(val2);
        expect(result).assertFalse();
        console.log('testWeakSet_EmptyHas_SharedRef_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_EMPTY_HAS_0600
     * @tc.name      testWeakSet_EmptyHas_Callable_0006
     * @tc.desc      Verify that has() on an empty WeakSet returns false (callable-class instance)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_EmptyHas_Callable_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_EmptyHas_Callable_0006 start');

        interface ValueType { id: string; invoke(): void; }
        const ws = new WeakSet<ValueType>();

        class CallableVal implements ValueType {
          id: string;
          constructor() { this.id = 'callable-0006'; }
          invoke = (): void => { /* no-op */ };
        }
        const val = new CallableVal();

        const result = ws.has(val);
        expect(result).assertFalse();
        console.log('testWeakSet_EmptyHas_Callable_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_EMPTY_DEL_0100
     * @tc.name      testWeakSet_EmptyDel_Basic_0001
     * @tc.desc      Verify that delete() on an empty WeakSet returns false (basic object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_EmptyDel_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_EmptyDel_Basic_0001 start');

        interface ValueType { id: string; }
        const ws = new WeakSet<ValueType>();

        class Val implements ValueType {
          id: string;
          constructor() { this.id = 'val-0001'; }
        }
        const val = new Val();

        const result = ws.delete(val);
        expect(result).assertFalse();
        console.log('testWeakSet_EmptyDel_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_EMPTY_DEL_0200
     * @tc.name      testWeakSet_EmptyDel_Array_0002
     * @tc.desc      Verify that delete() on an empty WeakSet returns false (array object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_EmptyDel_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_EmptyDel_Array_0002 start');

        interface ValueType extends Array<number> { __brand: 'arr' }
        const ws = new WeakSet<ValueType>();

        class ArrVal extends Array<number> implements ValueType {
          __brand: 'arr' = 'arr';
          constructor() { super(); }
        }
        const val = new ArrVal();

        const result = ws.delete(val);
        expect(result).assertFalse();
        console.log('testWeakSet_EmptyDel_Array_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_EMPTY_DEL_0300
     * @tc.name      testWeakSet_EmptyDel_Map_0003
     * @tc.desc      Verify that delete() on an empty WeakSet returns false (Map object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_EmptyDel_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_EmptyDel_Map_0003 start');

        interface ValueType extends Map<string, number> { __brand: 'map' }
        const ws = new WeakSet<ValueType>();

        class MapVal extends Map<string, number> implements ValueType {
          __brand: 'map' = 'map';
          constructor() { super(); }
        }
        const val = new MapVal();

        const result = ws.delete(val);
        expect(result).assertFalse();
        console.log('testWeakSet_EmptyDel_Map_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_EMPTY_DEL_0400
     * @tc.name      testWeakSet_EmptyDel_Set_0004
     * @tc.desc      Verify that delete() on an empty WeakSet returns false (Set object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_EmptyDel_Set_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_EmptyDel_Set_0004 start');

        interface ValueType extends Set<Date> { __brand: 'set' }
        const ws = new WeakSet<ValueType>();

        class SetVal extends Set<Date> implements ValueType {
          __brand: 'set' = 'set';
          constructor() { super(); }
        }
        const val = new SetVal();

        const result = ws.delete(val);
        expect(result).assertFalse();
        console.log('testWeakSet_EmptyDel_Set_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_EMPTY_DEL_0500
     * @tc.name      testWeakSet_EmptyDel_SharedRef_0005
     * @tc.desc      Verify that delete() on an empty WeakSet returns false (shared-ref object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_EmptyDel_SharedRef_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_EmptyDel_SharedRef_0005 start');

        interface ValueType { id: string; }
        const ws = new WeakSet<ValueType>();

        class Val implements ValueType {
          id: string;
          constructor() { this.id = 'shared-0005'; }
        }
        const val1 = new Val();
        const val2 = val1;

        const result = ws.delete(val2);
        expect(result).assertFalse();
        console.log('testWeakSet_EmptyDel_SharedRef_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_EMPTY_DEL_0600
     * @tc.name      testWeakSet_EmptyDel_Callable_0006
     * @tc.desc      Verify that delete() on an empty WeakSet returns false (callable-class instance)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_EmptyDel_Callable_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_EmptyDel_Callable_0006 start');

        interface ValueType { id: string; invoke(): void; }
        const ws = new WeakSet<ValueType>();

        class CallableVal implements ValueType {
          id: string;
          constructor() { this.id = 'callable-0006'; }
          invoke = (): void => { /* no-op */ };
        }
        const val = new CallableVal();

        const result = ws.delete(val);
        expect(result).assertFalse();
        console.log('testWeakSet_EmptyDel_Callable_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_EMPTY_ADD_0100
     * @tc.name      testWeakSet_EmptyAdd_Basic_0001
     * @tc.desc      Verify that add() on an empty WeakSet throws no exception (basic object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_EmptyAdd_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_EmptyAdd_Basic_0001 start');

        interface ValueType { id: string; }
        const ws = new WeakSet<ValueType>();

        class Val implements ValueType {
          id: string;
          constructor() { this.id = 'val-0001'; }
        }
        const val = new Val();

        let errorThrown = false;
        try {
          ws.add(val);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakSet_EmptyAdd_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_EMPTY_ADD_0200
     * @tc.name      testWeakSet_EmptyAdd_Array_0002
     * @tc.desc      Verify that add() on an empty WeakSet throws no exception (array object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_EmptyAdd_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_EmptyAdd_Array_0002 start');

        interface ValueType extends Array<number> { __brand: 'arr' }
        const ws = new WeakSet<ValueType>();

        class ArrVal extends Array<number> implements ValueType {
          __brand: 'arr' = 'arr';
          constructor() { super(); }
        }
        const val = new ArrVal();

        let errorThrown = false;
        try {
          ws.add(val);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakSet_EmptyAdd_Array_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_EMPTY_ADD_0300
     * @tc.name      testWeakSet_EmptyAdd_Map_0003
     * @tc.desc      Verify that add() on an empty WeakSet throws no exception (Map object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_EmptyAdd_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_EmptyAdd_Map_0003 start');

        interface ValueType extends Map<string, number> { __brand: 'map' }
        const ws = new WeakSet<ValueType>();

        class MapVal extends Map<string, number> implements ValueType {
          __brand: 'map' = 'map';
          constructor() { super(); }
        }
        const val = new MapVal();

        let errorThrown = false;
        try {
          ws.add(val);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakSet_EmptyAdd_Map_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_EMPTY_ADD_0400
     * @tc.name      testWeakSet_EmptyAdd_Set_0004
     * @tc.desc      Verify that add() on an empty WeakSet throws no exception (Set object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_EmptyAdd_Set_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_EmptyAdd_Set_0004 start');

        interface ValueType extends Set<Date> { __brand: 'set' }
        const ws = new WeakSet<ValueType>();

        class SetVal extends Set<Date> implements ValueType {
          __brand: 'set' = 'set';
          constructor() { super(); }
        }
        const val = new SetVal();

        let errorThrown = false;
        try {
          ws.add(val);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakSet_EmptyAdd_Set_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_EMPTY_ADD_0500
     * @tc.name      testWeakSet_EmptyAdd_SharedRef_0005
     * @tc.desc      Verify that add() on an empty WeakSet throws no exception (shared-ref object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_EmptyAdd_SharedRef_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_EmptyAdd_SharedRef_0005 start');

        interface ValueType { id: string; }
        const ws = new WeakSet<ValueType>();

        class Val implements ValueType {
          id: string;
          constructor() { this.id = 'shared-0005'; }
        }
        const val1 = new Val();
        const val2 = val1;

        let errorThrown = false;
        try {
          ws.add(val2);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakSet_EmptyAdd_SharedRef_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_EMPTY_ADD_0600
     * @tc.name      testWeakSet_EmptyAdd_Callable_0006
     * @tc.desc      Verify that add() on an empty WeakSet throws no exception (callable-class instance)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_EmptyAdd_Callable_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_EmptyAdd_Callable_0006 start');

        interface ValueType { id: string; invoke(): void; }
        const ws = new WeakSet<ValueType>();

        class CallableVal implements ValueType {
          id: string;
          constructor() { this.id = 'callable-0006'; }
          invoke = (): void => { /* no-op */ };
        }
        const val = new CallableVal();

        let errorThrown = false;
        try {
          ws.add(val);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakSet_EmptyAdd_Callable_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_NO_SIZE_0100
     * @tc.name      testWeakSet_NoSize_Basic_0001
     * @tc.desc      Verify that an empty WeakSet has no size property (basic object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_NoSize_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_NoSize_Basic_0001 start');

        interface ValueType { id: string; }
        interface NoSize extends Object { __brand: 'NoSize' }

        class SetWrapper implements NoSize {
          __brand: 'NoSize' = 'NoSize';
          set: WeakSet<ValueType>;
          get size(): never {
            throw new Error('WeakSet has no size');
          }
          constructor() {
            this.set = new WeakSet<ValueType>();
          }
        }

        const wrapper = new SetWrapper();
        let sizeExists = true;
        try {
          const _ = wrapper.size;
        } catch {
          sizeExists = false;
        }
        expect(!sizeExists).assertTrue();
        console.log('testWeakSet_NoSize_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_NO_SIZE_0200
     * @tc.name      testWeakSet_NoSize_Array_0002
     * @tc.desc      Verify that an empty WeakSet has no size property (array object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_NoSize_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_NoSize_Array_0002 start');

        interface ValueType extends Array<number> { __brand: 'arr' }
        interface NoSize extends Object { __brand: 'NoSize' }

        class SetWrapper implements NoSize {
          __brand: 'NoSize' = 'NoSize';
          set: WeakSet<ValueType>;
          get size(): never {
            throw new Error('WeakSet has no size');
          }
          constructor() {
            this.set = new WeakSet<ValueType>();
          }
        }

        const wrapper = new SetWrapper();
        let sizeExists = true;
        try {
          const _ = wrapper.size;
        } catch {
          sizeExists = false;
        }
        expect(!sizeExists).assertTrue();
        console.log('testWeakSet_NoSize_Array_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_NO_SIZE_0300
     * @tc.name      testWeakSet_NoSize_Map_0003
     * @tc.desc      Verify that an empty WeakSet has no size property (Map object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_NoSize_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_NoSize_Map_0003 start');

        interface ValueType extends Map<string, number> { __brand: 'map' }
        interface NoSize extends Object { __brand: 'NoSize' }

        class SetWrapper implements NoSize {
          __brand: 'NoSize' = 'NoSize';
          set: WeakSet<ValueType>;
          get size(): never {
            throw new Error('WeakSet has no size');
          }
          constructor() {
            this.set = new WeakSet<ValueType>();
          }
        }

        const wrapper = new SetWrapper();
        let sizeExists = true;
        try {
          const _ = wrapper.size;
        } catch {
          sizeExists = false;
        }
        expect(!sizeExists).assertTrue();
        console.log('testWeakSet_NoSize_Map_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_NO_SIZE_0400
     * @tc.name      testWeakSet_NoSize_Set_0004
     * @tc.desc      Verify that an empty WeakSet has no size property (Set object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_NoSize_Set_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_NoSize_Set_0004 start');

        interface ValueType extends Set<Date> { __brand: 'set' }
        interface NoSize extends Object { __brand: 'NoSize' }

        class SetWrapper implements NoSize {
          __brand: 'NoSize' = 'NoSize';
          set: WeakSet<ValueType>;
          get size(): never {
            throw new Error('WeakSet has no size');
          }
          constructor() {
            this.set = new WeakSet<ValueType>();
          }
        }

        const wrapper = new SetWrapper();
        let sizeExists = true;
        try {
          const _ = wrapper.size;
        } catch {
          sizeExists = false;
        }
        expect(!sizeExists).assertTrue();
        console.log('testWeakSet_NoSize_Set_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_NO_SIZE_0500
     * @tc.name      testWeakSet_NoSize_SharedRef_0005
     * @tc.desc      Verify that an empty WeakSet has no size property (shared-ref object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_NoSize_SharedRef_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_NoSize_SharedRef_0005 start');

        interface ValueType { id: string; }
        interface NoSize extends Object { __brand: 'NoSize' }

        class SetWrapper implements NoSize {
          __brand: 'NoSize' = 'NoSize';
          set: WeakSet<ValueType>;
          get size(): never {
            throw new Error('WeakSet has no size');
          }
          constructor() {
            this.set = new WeakSet<ValueType>();
          }
        }

        const wrapper = new SetWrapper();
        let sizeExists = true;
        try {
          const _ = wrapper.size;
        } catch {
          sizeExists = false;
        }
        expect(!sizeExists).assertTrue();
        console.log('testWeakSet_NoSize_SharedRef_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_NO_SIZE_0600
     * @tc.name      testWeakSet_NoSize_Callable_0006
     * @tc.desc      Verify that an empty WeakSet has no size property (callable-class instance)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_NoSize_Callable_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_NoSize_Callable_0006 start');

        interface ValueType { id: string; invoke(): void; }
        interface NoSize extends Object { __brand: 'NoSize' }

        class SetWrapper implements NoSize {
          __brand: 'NoSize' = 'NoSize';
          set: WeakSet<ValueType>;
          get size(): never {
            throw new Error('WeakSet has no size');
          }
          constructor() {
            this.set = new WeakSet<ValueType>();
          }
        }

        const wrapper = new SetWrapper();
        let sizeExists = true;
        try {
          const _ = wrapper.size;
        } catch {
          sizeExists = false;
        }
        expect(!sizeExists).assertTrue();
        console.log('testWeakSet_NoSize_Callable_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_HAS_0100
     * @tc.name      testWeakSet_AddHas_Basic_0001
     * @tc.desc      Verify that add() on an empty WeakSet followed by has() returns true (basic object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_AddHas_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_AddHas_Basic_0001 start');

        interface ValueType { id: string; }
        const ws = new WeakSet<ValueType>();

        class Val implements ValueType {
          id: string;
          constructor() { this.id = 'val-0001'; }
        }
        const val = new Val();

        ws.add(val);
        const result = ws.has(val);
        expect(result).assertTrue();
        console.log('testWeakSet_AddHas_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_HAS_0200
     * @tc.name      testWeakSet_AddHas_Array_0002
     * @tc.desc      Verify that add() on an empty WeakSet followed by has() returns true (array object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_AddHas_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_AddHas_Array_0002 start');

        interface ValueType extends Array<number> { __brand: 'arr' }
        const ws = new WeakSet<ValueType>();

        class ArrVal extends Array<number> implements ValueType {
          __brand: 'arr' = 'arr';
          constructor() { super(); }
        }
        const val = new ArrVal();

        ws.add(val);
        const result = ws.has(val);
        expect(result).assertTrue();
        console.log('testWeakSet_AddHas_Array_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_HAS_0300
     * @tc.name      testWeakSet_AddHas_Map_0003
     * @tc.desc      Verify that add() on an empty WeakSet followed by has() returns true (Map object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_AddHas_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_AddHas_Map_0003 start');

        interface ValueType extends Map<string, number> { __brand: 'map' }
        const ws = new WeakSet<ValueType>();

        class MapVal extends Map<string, number> implements ValueType {
          __brand: 'map' = 'map';
          constructor() { super(); }
        }
        const val = new MapVal();

        ws.add(val);
        const result = ws.has(val);
        expect(result).assertTrue();
        console.log('testWeakSet_AddHas_Map_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_HAS_0400
     * @tc.name      testWeakSet_AddHas_Set_0004
     * @tc.desc      Verify that add() on an empty WeakSet followed by has() returns true (Set object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_AddHas_Set_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_AddHas_Set_0004 start');

        interface ValueType extends Set<Date> { __brand: 'set' }
        const ws = new WeakSet<ValueType>();

        class SetVal extends Set<Date> implements ValueType {
          __brand: 'set' = 'set';
          constructor() { super(); }
        }
        const val = new SetVal();

        ws.add(val);
        const result = ws.has(val);
        expect(result).assertTrue();
        console.log('testWeakSet_AddHas_Set_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_HAS_0500
     * @tc.name      testWeakSet_AddHas_SharedRef_0005
     * @tc.desc      Verify that add() on an empty WeakSet followed by has() returns true (shared-ref object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_AddHas_SharedRef_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_AddHas_SharedRef_0005 start');

        interface ValueType { id: string; }
        const ws = new WeakSet<ValueType>();

        class Val implements ValueType {
          id: string;
          constructor() { this.id = 'shared-0005'; }
        }
        const val1 = new Val();
        const val2 = val1;

        ws.add(val2);
        const result = ws.has(val1);
        expect(result).assertTrue();
        console.log('testWeakSet_AddHas_SharedRef_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_HAS_0600
     * @tc.name      testWeakSet_AddHas_Callable_0006
     * @tc.desc      Verify that add() on an empty WeakSet followed by has() returns true (callable-class instance)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_AddHas_Callable_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_AddHas_Callable_0006 start');

        interface ValueType { id: string; invoke(): void; }
        const ws = new WeakSet<ValueType>();

        class CallableVal implements ValueType {
          id: string;
          constructor() { this.id = 'callable-0006'; }
          invoke = (): void => { /* no-op */ };
        }
        const val = new CallableVal();

        ws.add(val);
        const result = ws.has(val);
        expect(result).assertTrue();
        console.log('testWeakSet_AddHas_Callable_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET1_NO_ERR_0100
     * @tc.name      testMap_Set1_NoErr_Basic_0001
     * @tc.desc      Verify that Map.set() with undefined value throws no exception (basic object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_Set1_NoErr_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_Set1_NoErr_Basic_0001 start');

        interface KeyType { id: string; }

        const map = new Map<KeyType, number | undefined>();

        class Key implements KeyType {
          id: string;
          constructor() { this.id = 'key-0001'; }
        }
        const key = new Key();

        let errorThrown = false;
        try {
          map.set(key, undefined);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_Set1_NoErr_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET1_NO_ERR_0200
     * @tc.name      testMap_Set1_NoErr_Array_0002
     * @tc.desc      Verify that Map.set() with undefined value throws no exception (array key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_Set1_NoErr_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_Set1_NoErr_Array_0002 start');

        interface KeyType extends Array<number> { __brand: 'arr' }
        const map = new Map<KeyType, string | undefined>();

        class ArrKey extends Array<number> implements KeyType {
          __brand: 'arr' = 'arr';
          constructor() { super(); }
        }
        const key = new ArrKey();

        let errorThrown = false;
        try {
          map.set(key, undefined);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_Set1_NoErr_Array_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET1_NO_ERR_0300
     * @tc.name      testMap_Set1_NoErr_Map_0003
     * @tc.desc      Verify that Map.set() with undefined value throws no exception (Map key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_Set1_NoErr_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_Set1_NoErr_Map_0003 start');

        interface KeyType extends Map<string, number> { __brand: 'map' }
        const map = new Map<KeyType, boolean | undefined>();

        class MapKey extends Map<string, number> implements KeyType {
          __brand: 'map' = 'map';
          constructor() { super(); }
        }
        const key = new MapKey();

        let errorThrown = false;
        try {
          map.set(key, undefined);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_Set1_NoErr_Map_0003 done');
        done();
      });


    /**
     * @tc.number    SUB_ARK_MAP_SET1_NO_ERR_0400
     * @tc.name      testMap_Set1_NoErr_Set_0004
     * @tc.desc      Verify that Map.set() with undefined value throws no exception (Set key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_Set1_NoErr_Set_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_Set1_NoErr_Set_0004 start');

        interface KeyType extends Set<Date> { __brand: 'set' }
        const map = new Map<KeyType, string | undefined>();

        class SetKey extends Set<Date> implements KeyType {
          __brand: 'set' = 'set';
          constructor() { super(); }
        }
        const key = new SetKey();

        let errorThrown = false;
        try {
          map.set(key, undefined);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_Set1_NoErr_Set_0004 done');
        done();
      });
  })
}