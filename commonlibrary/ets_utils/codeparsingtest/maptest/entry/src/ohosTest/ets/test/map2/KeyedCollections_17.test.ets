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

export default function keyedCollections_17Test() {
  describe('keyedCollections_17Test', () => {
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
     * @tc.number    SUB_ARK_MAP_SET1_NO_ERR_0500
     * @tc.name      testMap_Set1_NoErr_SharedRef_0005
     * @tc.desc      Verify that Map.set() with undefined value throws no exception (shared-ref key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_Set1_NoErr_SharedRef_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_Set1_NoErr_SharedRef_0005 start');

        interface KeyType { id: string; }
        const map = new Map<KeyType, number | undefined>();

        class Key implements KeyType {
          id: string;
          constructor() { this.id = 'shared-0005'; }
        }
        const key1 = new Key();
        const key2 = key1;

        let errorThrown = false;
        try {
          map.set(key2, undefined);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_Set1_NoErr_SharedRef_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET1_NO_ERR_0600
     * @tc.name      testMap_Set1_NoErr_Callable_0006
     * @tc.desc      Verify that Map.set() with undefined value throws no exception (callable-class key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_Set1_NoErr_Callable_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_Set1_NoErr_Callable_0006 start');

        interface KeyType { id: string; invoke(): void; }
        const map = new Map<KeyType, string | undefined>();

        class CallableKey implements KeyType {
          id: string;
          constructor() { this.id = 'callable-0006'; }
          invoke = (): void => { /* no-op */ };
        }
        const key = new CallableKey();

        let errorThrown = false;
        try {
          map.set(key, undefined);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_Set1_NoErr_Callable_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET1_NO_EFFECT_0100
     * @tc.name      testMap_Set1_NoEffect_Basic_0001
     * @tc.desc      Verify that Map.set() with undefined value does not store the key (basic object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_Set1_NoEffect_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_Set1_NoEffect_Basic_0001 start');

        interface KeyType { id: string; }
        const map = new Map<KeyType, number | undefined>();

        class Key implements KeyType {
          id: string;
          constructor() { this.id = 'key-0001'; }
        }
        const key = new Key();

        map.set(key, undefined);
        const result = map.has(key);
        expect(result).assertTrue();
        console.log('testMap_Set1_NoEffect_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET1_NO_EFFECT_0200
     * @tc.name      testMap_Set1_NoEffect_Array_0002
     * @tc.desc      Verify that Map.set() with undefined value does not store the key (array object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_Set1_NoEffect_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_Set1_NoEffect_Array_0002 start');

        interface KeyType extends Array<number> { __brand: 'arr' }
        const map = new Map<KeyType, string | undefined>();

        class ArrKey extends Array<number> implements KeyType {
          __brand: 'arr' = 'arr';
          constructor() { super(); }
        }
        const key = new ArrKey();

        map.set(key, undefined);
        expect(map.has(key)).assertTrue();
        console.log('testMap_Set1_NoEffect_Array_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET1_NO_EFFECT_0300
     * @tc.name      testMap_Set1_NoEffect_Map_0003
     * @tc.desc      Verify that Map.set() with undefined value does not store the key (Map object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_Set1_NoEffect_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_Set1_NoEffect_Map_0003 start');

        interface KeyType extends Map<string, number> { __brand: 'map' }
        const map = new Map<KeyType, boolean | undefined>();

        class MapKey extends Map<string, number> implements KeyType {
          __brand: 'map' = 'map';
          constructor() { super(); }
        }
        const key = new MapKey();

        map.set(key, undefined);
        expect(map.has(key)).assertTrue();
        console.log('testMap_Set1_NoEffect_Map_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET1_NO_EFFECT_0400
     * @tc.name      testMap_Set1_NoEffect_Set_0004
     * @tc.desc      Verify that Map.set() with undefined value does not store the key (Set object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_Set1_NoEffect_Set_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_Set1_NoEffect_Set_0004 start');

        interface KeyType extends Set<Date> { __brand: 'set' }
        const map = new Map<KeyType, string | undefined>();

        class SetKey extends Set<Date> implements KeyType {
          __brand: 'set' = 'set';
          constructor() { super(); }
        }
        const key = new SetKey();

        map.set(key, undefined);
        expect(map.has(key)).assertTrue();
        console.log('testMap_Set1_NoEffect_Set_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET1_NO_EFFECT_0500
     * @tc.name      testMap_Set1_NoEffect_SharedRef_0005
     * @tc.desc      Verify that Map.set() with undefined value does not store the key (shared-ref)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_Set1_NoEffect_SharedRef_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_Set1_NoEffect_SharedRef_0005 start');

        interface KeyType { id: string; }
        const map = new Map<KeyType, number | undefined>();

        class Key implements KeyType {
          id: string;
          constructor() { this.id = 'shared-0005'; }
        }
        const key1 = new Key();
        const key2 = key1;

        map.set(key2, undefined);
        expect(map.has(key1)).assertTrue();
        console.log('testMap_Set1_NoEffect_SharedRef_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET1_NO_EFFECT_0600
     * @tc.name      testMap_Set1_NoEffect_Callable_0006
     * @tc.desc      Verify that Map.set() with undefined value does not store the key (callable-class)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_Set1_NoEffect_Callable_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_Set1_NoEffect_Callable_0006 start');

        interface KeyType { id: string; invoke(): void; }
        const map = new Map<KeyType, string | undefined>();

        class CallableKey implements KeyType {
          id: string;
          constructor() { this.id = 'callable-0006'; }
          invoke = (): void => { /* no-op */ };
        }
        const key = new CallableKey();

        map.set(key, undefined);
        expect(map.has(key)).assertTrue();
        console.log('testMap_Set1_NoEffect_Callable_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_GET_UNDEF_0100
     * @tc.name      testMap_GetUndef_Basic_0001
     * @tc.desc      Verify that Map.get(undefined) throws no exception (basic object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_GetUndef_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_GetUndef_Basic_0001 start');

        interface KeyType { id: string; }
        const map = new Map<KeyType | undefined, number>();


        let errorThrown = false;
        try {
          map.get(undefined);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_GetUndef_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_GET_UNDEF_0200
     * @tc.name      testMap_GetUndef_Array_0002
     * @tc.desc      Verify that Map.get(undefined) throws no exception (array key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_GetUndef_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_GetUndef_Array_0002 start');

        interface KeyType extends Array<number> { __brand: 'arr' }
        const map = new Map<KeyType | undefined, string>();

        let errorThrown = false;
        try {
          map.get(undefined);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_GetUndef_Array_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_GET_UNDEF_0300
     * @tc.name      testMap_GetUndef_Map_0003
     * @tc.desc      Verify that Map.get(undefined) throws no exception (Map key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_GetUndef_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_GetUndef_Map_0003 start');

        interface KeyType extends Map<string, number> { __brand: 'map' }
        const map = new Map<KeyType | undefined, boolean>();

        let errorThrown = false;
        try {
          map.get(undefined);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_GetUndef_Map_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_GET_UNDEF_0400
     * @tc.name      testMap_GetUndef_Set_0004
     * @tc.desc      Verify that Map.get(undefined) throws no exception (Set key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_GetUndef_Set_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_GetUndef_Set_0004 start');

        interface KeyType extends Set<Date> { __brand: 'set' }
        const map = new Map<KeyType | undefined, string>();

        let errorThrown = false;
        try {
          map.get(undefined);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_GetUndef_Set_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_GET_UNDEF_0500
     * @tc.name      testMap_GetUndef_SharedRef_0005
     * @tc.desc      Verify that Map.get(undefined) throws no exception (shared-ref key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_GetUndef_SharedRef_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_GetUndef_SharedRef_0005 start');

        interface KeyType { id: string; }
        const map = new Map<KeyType | undefined, number>();

        let errorThrown = false;
        try {
          map.get(undefined);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_GetUndef_SharedRef_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_GET_UNDEF_0600
     * @tc.name      testMap_GetUndef_Callable_0006
     * @tc.desc      Verify that Map.get(undefined) throws no exception (callable-class key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_GetUndef_Callable_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_GetUndef_Callable_0006 start');

        interface KeyType { id: string; invoke(): void; }
        const map = new Map<KeyType | undefined, string>();

        let errorThrown = false;
        try {
          map.get(undefined);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_GetUndef_Callable_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_DEL_NULL_0100
     * @tc.name      testMap_DelNull_Basic_0001
     * @tc.desc      Verify that Map.delete(null) throws no exception (basic object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_DelNull_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_DelNull_Basic_0001 start');

        interface KeyType { id: string; }
        const map = new Map<KeyType | null, number>();


        let errorThrown = false;
        try {
          map.delete(null);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_DelNull_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_DEL_NULL_0200
     * @tc.name      testMap_DelNull_Array_0002
     * @tc.desc      Verify that Map.delete(null) throws no exception (array key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_DelNull_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_DelNull_Array_0002 start');

        interface KeyType extends Array<number> { __brand: 'arr' }
        const map = new Map<KeyType | null, string>();


        let errorThrown = false;
        try {
          map.delete(null);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_DelNull_Array_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_DEL_NULL_0300
     * @tc.name      testMap_DelNull_Map_0003
     * @tc.desc      Verify that Map.delete(null) throws no exception (Map object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_DelNull_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_DelNull_Map_0003 start');

        interface KeyType extends Map<string, number> { __brand: 'map' }
        const map = new Map<KeyType | null, boolean>();

        let errorThrown = false;
        try {
          map.delete(null);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_DelNull_Map_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_DEL_NULL_0400
     * @tc.name      testMap_DelNull_Set_0004
     * @tc.desc      Verify that Map.delete(null) throws no exception (Set object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_DelNull_Set_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_DelNull_Set_0004 start');

        interface KeyType extends Set<Date> { __brand: 'set' }
        const map = new Map<KeyType | null, string>();

        let errorThrown = false;
        try {
          map.delete(null);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_DelNull_Set_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_DEL_NULL_0500
     * @tc.name      testMap_DelNull_SharedRef_0005
     * @tc.desc      Verify that Map.delete(null) throws no exception (shared-ref key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_DelNull_SharedRef_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_DelNull_SharedRef_0005 start');

        interface KeyType { id: string; }
        const map = new Map<KeyType | null, number>();

        class Key implements KeyType {
          id: string;
          constructor() { this.id = 'shared-0005'; }
        }
        const key1 = new Key();
        const key2 = key1;

        let errorThrown = false;
        try {
          map.delete(null);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_DelNull_SharedRef_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_DEL_NULL_0600
     * @tc.name      testMap_DelNull_Callable_0006
     * @tc.desc      Verify that Map.delete(null) throws no exception (callable-class instance)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_DelNull_Callable_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_DelNull_Callable_0006 start');

        interface KeyType { id: string; invoke(): void; }
        const map = new Map<KeyType | null, string>();


        let errorThrown = false;
        try {
          map.delete(null);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_DelNull_Callable_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_HAS_NAN_0100
     * @tc.name      testMap_HasNaN_Basic_0001
     * @tc.desc      Verify that Map.has(NaN) throws no exception (basic object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_HasNaN_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_HasNaN_Basic_0001 start');

        interface KeyType { id: string; }
        const map = new Map<KeyType | number, number>();


        let errorThrown = false;
        try {
          map.has(NaN);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_HasNaN_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_HAS_NAN_0200
     * @tc.name      testMap_HasNaN_Array_0002
     * @tc.desc      Verify that Map.has(NaN) throws no exception (array key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_HasNaN_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_HasNaN_Array_0002 start');

        interface KeyType extends Array<number> { __brand: 'arr' }
        const map = new Map<KeyType | number, string>();

        let errorThrown = false;
        try {
          map.has(NaN);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_HasNaN_Array_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_HAS_NAN_0300
     * @tc.name      testMap_HasNaN_Map_0003
     * @tc.desc      Verify that Map.has(NaN) throws no exception (Map object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_HasNaN_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_HasNaN_Map_0003 start');

        interface KeyType extends Map<string, number> { __brand: 'map' }
        const map = new Map<KeyType | number, boolean>();

        let errorThrown = false;
        try {
          map.has(NaN);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_HasNaN_Map_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_HAS_NAN_0400
     * @tc.name      testMap_HasNaN_Set_0004
     * @tc.desc      Verify that Map.has(NaN) throws no exception (Set object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_HasNaN_Set_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_HasNaN_Set_0004 start');

        interface KeyType extends Set<Date> { __brand: 'set' }
        const map = new Map<KeyType | number, string>();

        let errorThrown = false;
        try {
          map.has(NaN);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_HasNaN_Set_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_HAS_NAN_0500
     * @tc.name      testMap_HasNaN_SharedRef_0005
     * @tc.desc      Verify that Map.has(NaN) throws no exception (shared-ref key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_HasNaN_SharedRef_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_HasNaN_SharedRef_0005 start');

        interface KeyType { id: string; }
        const map = new Map<KeyType | number, number>();

        let errorThrown = false;
        try {
          map.has(NaN);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_HasNaN_SharedRef_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_HAS_NAN_0600
     * @tc.name      testMap_HasNaN_Callable_0006
     * @tc.desc      Verify that Map.has(NaN) throws no exception (callable-class instance)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_HasNaN_Callable_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_HasNaN_Callable_0006 start');

        interface KeyType { id: string; invoke(): void; }
        const map = new Map<KeyType | number, string>();

        let errorThrown = false;
        try {
          map.has(NaN);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_HasNaN_Callable_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_NAN_0100
     * @tc.name      testMap_SetNaN_Basic_0001
     * @tc.desc      Verify that Map.set(NaN, value) makes has(NaN) return true (basic object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetNaN_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetNaN_Basic_0001 start');

        interface KeyType { id: string; }
        const map = new Map<KeyType | number, string>();

        map.set(NaN, 'val');
        const result = map.has(NaN);
        expect(result).assertTrue();
        console.log('testMap_SetNaN_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_NAN_0200
     * @tc.name      testMap_SetNaN_Array_0002
     * @tc.desc      Verify that Map.set(NaN, value) makes has(NaN) return true (array key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetNaN_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetNaN_Array_0002 start');

        interface KeyType extends Array<number> { __brand: 'arr' }
        const map = new Map<KeyType | number, number>();

        map.set(NaN, 42);
        expect(map.has(NaN)).assertTrue();
        console.log('testMap_SetNaN_Array_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_NAN_0300
     * @tc.name      testMap_SetNaN_Map_0003
     * @tc.desc      Verify that Map.set(NaN, value) makes has(NaN) return true (Map object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetNaN_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetNaN_Map_0003 start');

        interface KeyType extends Map<string, number> { __brand: 'map' }
        const map = new Map<KeyType | number, boolean>();

        map.set(NaN, true);
        expect(map.has(NaN)).assertTrue();
        console.log('testMap_SetNaN_Map_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_NAN_0400
     * @tc.name      testMap_SetNaN_Set_0004
     * @tc.desc      Verify that Map.set(NaN, value) makes has(NaN) return true (Set object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetNaN_Set_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetNaN_Set_0004 start');

        interface KeyType extends Set<Date> { __brand: 'set' }
        const map = new Map<KeyType | number, string>();

        map.set(NaN, 'NaN-val');
        expect(map.has(NaN)).assertTrue();
        console.log('testMap_SetNaN_Set_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_NAN_0500
     * @tc.name      testMap_SetNaN_SharedRef_0005
     * @tc.desc      Verify that Map.set(NaN, value) makes has(NaN) return true (shared-ref key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetNaN_SharedRef_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetNaN_SharedRef_0005 start');

        interface KeyType { id: string; }
        const map = new Map<KeyType | number, number>();

        map.set(NaN, 99);
        expect(map.has(NaN)).assertTrue();
        console.log('testMap_SetNaN_SharedRef_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_NAN_0600
     * @tc.name      testMap_SetNaN_Callable_0006
     * @tc.desc      Verify that Map.set(NaN, value) makes has(NaN) return true (callable-class instance)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetNaN_Callable_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetNaN_Callable_0006 start');

        interface KeyType { id: string; invoke(): void; }
        const map = new Map<KeyType | number, string>();

        map.set(NaN, 'callable-NaN');
        expect(map.has(NaN)).assertTrue();
        console.log('testMap_SetNaN_Callable_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_FUNC_0100
     * @tc.name      testMap_SetFunc_Basic_0001
     * @tc.desc      Verify that Map.set(func, value) makes has(func) return true (basic object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetFunc_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetFunc_Basic_0001 start');

        interface KeyType { id: string; }
        interface FnBox extends Object { __brand: 'fn'; invoke(): void; }

        class FuncKey implements FnBox {
          __brand: 'fn' = 'fn';
          id: string;
          constructor(id: string) {
            this.id = id;
          }
          invoke = (): void => { /* no-op */ };
        }

        const map = new Map<FnBox | KeyType, string>();
        const funcKey = new FuncKey('func-0001');

        map.set(funcKey, 'val');
        const result = map.has(funcKey);
        expect(result).assertTrue();
        console.log('testMap_SetFunc_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_FUNC_0200
     * @tc.name      testMap_SetFunc_Array_0002
     * @tc.desc      Verify that Map.set(func, value) makes has(func) return true (array key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetFunc_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetFunc_Array_0002 start');

        interface KeyType extends Array<number> { __brand: 'arr'; }
        interface FnBox extends Object { __brand: 'fn'; invoke(): void; }

        class FuncKey implements FnBox {
          __brand: 'fn' = 'fn';
          id: string;
          constructor(id: string) { this.id = id; }
          invoke = (): void => { /* no-op */ };
        }

        const map = new Map<FnBox | KeyType, number>();
        const funcKey = new FuncKey('arr-func-0002');

        map.set(funcKey, 42);
        expect(map.has(funcKey)).assertTrue();
        console.log('testMap_SetFunc_Array_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_FUNC_0300
     * @tc.name      testMap_SetFunc_Map_0003
     * @tc.desc      Verify that Map.set(func, value) makes has(func) return true (Map object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetFunc_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetFunc_Map_0003 start');

        interface KeyType extends Map<string, number> { __brand: 'map'; }
        interface FnBox extends Object { __brand: 'fn'; invoke(): void; }

        class FuncKey implements FnBox {
          __brand: 'fn' = 'fn';
          id: string;
          constructor(id: string) { this.id = id; }
          invoke = (): void => { /* no-op */ };
        }

        const map = new Map<FnBox | KeyType, boolean>();
        const funcKey = new FuncKey('map-func-0003');

        map.set(funcKey, true);
        expect(map.has(funcKey)).assertTrue();
        console.log('testMap_SetFunc_Map_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_FUNC_0400
     * @tc.name      testMap_SetFunc_Set_0004
     * @tc.desc      Verify that Map.set(func, value) makes has(func) return true (Set object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetFunc_Set_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetFunc_Set_0004 start');

        interface KeyType extends Set<Date> { __brand: 'set'; }
        interface FnBox extends Object { __brand: 'fn'; invoke(): void; }

        class FuncKey implements FnBox {
          __brand: 'fn' = 'fn';
          id: string;
          constructor(id: string) { this.id = id; }
          invoke = (): void => { /* no-op */ };
        }

        const map = new Map<FnBox | KeyType, string>();
        const funcKey = new FuncKey('set-func-0004');

        map.set(funcKey, 'val');
        expect(map.has(funcKey)).assertTrue();
        console.log('testMap_SetFunc_Set_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_FUNC_0500
     * @tc.name      testMap_SetFunc_SharedRef_0005
     * @tc.desc      Verify that Map.set(func, value) makes has(func) return true (shared-ref)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetFunc_SharedRef_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetFunc_SharedRef_0005 start');

        interface KeyType { id: string; }
        interface FnBox extends Object { __brand: 'fn'; invoke(): void; }

        class FuncKey implements FnBox {
          __brand: 'fn' = 'fn';
          id: string;
          constructor(id: string) { this.id = id; }
          invoke = (): void => { /* no-op */ };
        }

        const map = new Map<FnBox | KeyType, number>();
        const funcKey1 = new FuncKey('shared-func-0005');
        const funcKey2 = funcKey1;

        map.set(funcKey2, 99);
        expect(map.has(funcKey1)).assertTrue();
        console.log('testMap_SetFunc_SharedRef_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_FUNC_0600
     * @tc.name      testMap_SetFunc_Callable_0006
     * @tc.desc      Verify that Map.set(func, value) makes has(func) return true (callable-class)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetFunc_Callable_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetFunc_Callable_0006 start');

        interface KeyType { id: string; invoke(): void; }
        interface FnBox extends Object { __brand: 'fn'; invoke(): void; }

        class FuncKey implements FnBox {
          __brand: 'fn' = 'fn';
          id: string;
          constructor(id: string) { this.id = id; }
          invoke = (): void => { /* no-op */ };
        }

        const map = new Map<FnBox | KeyType, string>();
        const funcKey = new FuncKey('callable-func-0006');

        map.set(funcKey, 'callable-val');
        expect(map.has(funcKey)).assertTrue();
        console.log('testMap_SetFunc_Callable_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_ARRAY_0100
     * @tc.name      testMap_SetArray_Basic_0001
     * @tc.desc      Verify that Map.set(array, value) makes has(array) return true (basic object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetArray_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetArray_Basic_0001 start');

        interface KeyType { id: string; }
        interface ArrBox extends Object { __brand: 'arr'; items: number[]; }

        class ArrKey implements ArrBox {
          __brand: 'arr' = 'arr';
          items: number[];
          constructor(items: number[]) {
            this.items = items;
          }
        }

        const map = new Map<ArrBox | KeyType, string>();
        const arrKey = new ArrKey([1, 2, 3]);

        map.set(arrKey, 'val');
        const result = map.has(arrKey);
        expect(result).assertTrue();
        console.log('testMap_SetArray_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_ARRAY_0200
     * @tc.name      testMap_SetArray_Array_0002
     * @tc.desc      Verify that Map.set(array, value) makes has(array) return true (array key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetArray_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetArray_Array_0002 start');

        interface KeyType extends Array<number> { __brand: 'arr'; }
        interface ArrBox extends Object { __brand: 'arr'; items: number[]; }

        class ArrKey extends Array<number> implements ArrBox {
          __brand: 'arr' = 'arr';
          items: number[];
          constructor(items: number[]) {
            super();
            this.items = items;
          }
        }

        const map = new Map<ArrBox | KeyType, number>();
        const arrKey = new ArrKey([4, 5, 6]);

        map.set(arrKey, 42);
        expect(map.has(arrKey)).assertTrue();
        console.log('testMap_SetArray_Array_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_ARRAY_0300
     * @tc.name      testMap_SetArray_Map_0003
     * @tc.desc      Verify that Map.set(array, value) makes has(array) return true (Map object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetArray_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetArray_Map_0003 start');

        interface KeyType extends Map<string, number> { __brand: 'map'; }
        interface ArrBox extends Object { __brand: 'arr'; items: number[]; }

        class ArrKey implements ArrBox {
          __brand: 'arr' = 'arr';
          items: number[];
          constructor(items: number[]) {
            this.items = items;
          }
        }

        const map = new Map<ArrBox | KeyType, boolean>();
        const arrKey = new ArrKey([7, 8, 9]);

        map.set(arrKey, true);
        expect(map.has(arrKey)).assertTrue();
        console.log('testMap_SetArray_Map_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_ARRAY_0400
     * @tc.name      testMap_SetArray_Set_0004
     * @tc.desc      Verify that Map.set(array, value) makes has(array) return true (Set object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetArray_Set_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetArray_Set_0004 start');

        interface KeyType extends Set<Date> { __brand: 'set'; }
        interface ArrBox extends Object { __brand: 'arr'; items: number[]; }

        class ArrKey implements ArrBox {
          __brand: 'arr' = 'arr';
          items: number[];
          constructor(items: number[]) {
            this.items = items;
          }
        }

        const map = new Map<ArrBox | KeyType, string>();
        const arrKey = new ArrKey([10, 11, 12]);

        map.set(arrKey, 'val');
        expect(map.has(arrKey)).assertTrue();
        console.log('testMap_SetArray_Set_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_ARRAY_0500
     * @tc.name      testMap_SetArray_SharedRef_0005
     * @tc.desc      Verify that Map.set(array, value) makes has(array) return true (shared-ref)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetArray_SharedRef_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetArray_SharedRef_0005 start');

        interface KeyType { id: string; }
        interface ArrBox extends Object { __brand: 'arr'; items: number[]; }

        class ArrKey implements ArrBox {
          __brand: 'arr' = 'arr';
          items: number[];
          constructor(items: number[]) {
            this.items = items;
          }
        }

        const map = new Map<ArrBox | KeyType, number>();
        const arrKey1 = new ArrKey([13, 14, 15]);
        const arrKey2 = arrKey1;

        map.set(arrKey2, 99);
        expect(map.has(arrKey1)).assertTrue();
        console.log('testMap_SetArray_SharedRef_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_ARRAY_0600
     * @tc.name      testMap_SetArray_Callable_0006
     * @tc.desc      Verify that Map.set(array, value) makes has(array) return true (callable-class)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetArray_Callable_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetArray_Callable_0006 start');

        interface KeyType { id: string; invoke(): void; }
        interface ArrBox extends Object { __brand: 'arr'; items: number[]; }

        class ArrKey implements ArrBox {
          __brand: 'arr' = 'arr';
          items: number[];
          constructor(items: number[]) {
            this.items = items;
          }
        }

        const map = new Map<ArrBox | KeyType, string>();
        const arrKey = new ArrKey([16, 17, 18]);

        map.set(arrKey, 'callable-val');
        expect(map.has(arrKey)).assertTrue();
        console.log('testMap_SetArray_Callable_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_OBJ_0100
     * @tc.name      testMap_SetObj_Basic_0001
     * @tc.desc      Verify that Map.set(object, value) makes has(object) return true (basic object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetObj_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetObj_Basic_0001 start');

        interface KeyType { id: string; }
        interface ObjBox extends Object { __brand: 'obj'; uid: string; }

        class ObjKey implements ObjBox {
          __brand: 'obj' = 'obj';
          uid: string;
          constructor(uid: string) {
            this.uid = uid;
          }
        }

        const map = new Map<ObjBox | KeyType, string>();
        const objKey = new ObjKey('obj-0001');

        map.set(objKey, 'val');
        const result = map.has(objKey);
        expect(result).assertTrue();
        console.log('testMap_SetObj_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_OBJ_0200
     * @tc.name      testMap_SetObj_Array_0002
     * @tc.desc      Verify that Map.set(object, value) makes has(object) return true (array key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetObj_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetObj_Array_0002 start');

        interface KeyType extends Array<number> { __brand: 'arr'; }
        interface ObjBox extends Object { __brand: 'obj'; uid: string; }

        class ObjKey implements ObjBox {
          __brand: 'obj' = 'obj';
          uid: string;
          constructor(uid: string) {
            this.uid = uid;
          }
        }

        const map = new Map<ObjBox | KeyType, number>();
        const objKey = new ObjKey('obj-0002');

        map.set(objKey, 42);
        expect(map.has(objKey)).assertTrue();
        console.log('testMap_SetObj_Array_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_OBJ_0300
     * @tc.name      testMap_SetObj_Map_0003
     * @tc.desc      Verify that Map.set(object, value) makes has(object) return true (Map object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetObj_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetObj_Map_0003 start');

        interface KeyType extends Map<string, number> { __brand: 'map'; }
        interface ObjBox extends Object { __brand: 'obj'; uid: string; }

        class ObjKey implements ObjBox {
          __brand: 'obj' = 'obj';
          uid: string;
          constructor(uid: string) {
            this.uid = uid;
          }
        }

        const map = new Map<ObjBox | KeyType, boolean>();
        const objKey = new ObjKey('obj-0003');

        map.set(objKey, true);
        expect(map.has(objKey)).assertTrue();
        console.log('testMap_SetObj_Map_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_OBJ_0400
     * @tc.name      testMap_SetObj_Set_0004
     * @tc.desc      Verify that Map.set(object, value) makes has(object) return true (Set object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetObj_Set_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetObj_Set_0004 start');

        interface KeyType extends Set<Date> { __brand: 'set'; }
        interface ObjBox extends Object { __brand: 'obj'; uid: string; }

        class ObjKey implements ObjBox {
          __brand: 'obj' = 'obj';
          uid: string;
          constructor(uid: string) {
            this.uid = uid;
          }
        }

        const map = new Map<ObjBox | KeyType, string>();
        const objKey = new ObjKey('obj-0004');

        map.set(objKey, 'val');
        expect(map.has(objKey)).assertTrue();
        console.log('testMap_SetObj_Set_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_OBJ_0500
     * @tc.name      testMap_SetObj_SharedRef_0005
     * @tc.desc      Verify that Map.set(object, value) makes has(object) return true (shared-ref)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetObj_SharedRef_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetObj_SharedRef_0005 start');

        interface KeyType { id: string; }
        interface ObjBox extends Object { __brand: 'obj'; uid: string; }

        class ObjKey implements ObjBox {
          __brand: 'obj' = 'obj';
          uid: string;
          constructor(uid: string) {
            this.uid = uid;
          }
        }

        const map = new Map<ObjBox | KeyType, number>();
        const objKey1 = new ObjKey('obj-0005');
        const objKey2 = objKey1;

        map.set(objKey2, 99);
        expect(map.has(objKey1)).assertTrue();
        console.log('testMap_SetObj_SharedRef_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_OBJ_0600
     * @tc.name      testMap_SetObj_Callable_0006
     * @tc.desc      Verify that Map.set(object, value) makes has(object) return true (callable-class)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetObj_Callable_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetObj_Callable_0006 start');

        interface KeyType { id: string; invoke(): void; }
        interface ObjBox extends Object { __brand: 'obj'; uid: string; }

        class ObjKey implements ObjBox {
          __brand: 'obj' = 'obj';
          uid: string;
          constructor(uid: string) {
            this.uid = uid;
          }
        }

        const map = new Map<ObjBox | KeyType, string>();
        const objKey = new ObjKey('obj-0006');

        map.set(objKey, 'callable-val');
        expect(map.has(objKey)).assertTrue();
        console.log('testMap_SetObj_Callable_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_SYM_0100
     * @tc.name      testMap_SetSym_Basic_0001
     * @tc.desc      Verify that Map.set(string-ID, value) makes has(string-ID) return true (basic object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetSym_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetSym_Basic_0001 start');

        interface KeyType { id: string; }
        interface SymBox extends Object { __brand: 'sym'; uid: string; }

        class SymKey implements SymBox {
          __brand: 'sym' = 'sym';
          uid: string;
          constructor(uid: string) { this.uid = uid; }
        }

        const map = new Map<SymBox | KeyType, string>();
        const symKey = new SymKey('str-id-0001');

        map.set(symKey, 'val');
        const result = map.has(symKey);
        expect(result).assertTrue();
        console.log('testMap_SetSym_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_SYM_0200
     * @tc.name      testMap_SetSym_Array_0002
     * @tc.desc      Verify that Map.set(string-ID, value) makes has(string-ID) return true (array key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetSym_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetSym_Array_0002 start');

        interface KeyType extends Array<number> { __brand: 'arr'; }
        interface SymBox extends Object { __brand: 'sym'; uid: string; }

        class SymKey implements SymBox {
          __brand: 'sym' = 'sym';
          uid: string;
          constructor(uid: string) { this.uid = uid; }
        }

        const map = new Map<SymBox | KeyType, number>();
        const symKey = new SymKey('str-id-0002');

        map.set(symKey, 42);
        expect(map.has(symKey)).assertTrue();
        console.log('testMap_SetSym_Array_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_SYM_0300
     * @tc.name      testMap_SetSym_Map_0003
     * @tc.desc      Verify that Map.set(string-ID, value) makes has(string-ID) return true (Map object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetSym_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetSym_Map_0003 start');

        interface KeyType extends Map<string, number> { __brand: 'map'; }
        interface SymBox extends Object { __brand: 'sym'; uid: string; }

        class SymKey implements SymBox {
          __brand: 'sym' = 'sym';
          uid: string;
          constructor(uid: string) { this.uid = uid; }
        }

        const map = new Map<SymBox | KeyType, boolean>();
        const symKey = new SymKey('str-id-0003');

        map.set(symKey, true);
        expect(map.has(symKey)).assertTrue();
        console.log('testMap_SetSym_Map_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_SYM_0400
     * @tc.name      testMap_SetSym_Set_0004
     * @tc.desc      Verify that Map.set(string-ID, value) makes has(string-ID) return true (Set object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetSym_Set_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetSym_Set_0004 start');

        interface KeyType extends Set<Date> { __brand: 'set'; }
        interface SymBox extends Object { __brand: 'sym'; uid: string; }

        class SymKey implements SymBox {
          __brand: 'sym' = 'sym';
          uid: string;
          constructor(uid: string) { this.uid = uid; }
        }

        const map = new Map<SymBox | KeyType, string>();
        const symKey = new SymKey('str-id-0004');

        map.set(symKey, 'val');
        expect(map.has(symKey)).assertTrue();
        console.log('testMap_SetSym_Set_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_SYM_0500
     * @tc.name      testMap_SetSym_SharedRef_0005
     * @tc.desc      Verify that Map.set(string-ID, value) makes has(string-ID) return true (shared-ref)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetSym_SharedRef_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetSym_SharedRef_0005 start');

        interface KeyType { id: string; }
        interface SymBox extends Object { __brand: 'sym'; uid: string; }

        class SymKey implements SymBox {
          __brand: 'sym' = 'sym';
          uid: string;
          constructor(uid: string) { this.uid = uid; }
        }

        const map = new Map<SymBox | KeyType, number>();
        const symKey1 = new SymKey('str-id-0005');
        const symKey2 = symKey1;

        map.set(symKey2, 99);
        expect(map.has(symKey1)).assertTrue();
        console.log('testMap_SetSym_SharedRef_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET_SYM_0600
     * @tc.name      testMap_SetSym_Callable_0006
     * @tc.desc      Verify that Map.set(string-ID, value) makes has(string-ID) return true (callable-class)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_SetSym_Callable_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_SetSym_Callable_0006 start');

        interface KeyType { id: string; invoke(): void; }
        interface SymBox extends Object { __brand: 'sym'; uid: string; }

        class SymKey implements SymBox {
          __brand: 'sym' = 'sym';
          uid: string;
          constructor(uid: string) { this.uid = uid; }
        }

        const map = new Map<SymBox | KeyType, string>();
        const symKey = new SymKey('str-id-0006');

        map.set(symKey, 'callable-val');
        expect(map.has(symKey)).assertTrue();
        console.log('testMap_SetSym_Callable_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SET_STR_ERR_0100
     * @tc.name      testWeakMap_SetStrErr_Basic_0001
     * @tc.desc      Verify that WeakMap.set(string-boxed, value) throws an exception (basic object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_SetStrErr_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_SetStrErr_Basic_0001 start');

        interface KeyType { id: string; }

        class StrBox implements KeyType {
          id: string;
          constructor(content: string) {
            this.id = content;
          }
        }

        const wm = new WeakMap<KeyType, string>();
        const strBox = new StrBox('strKey');

        let errorThrown = false;
        try {
          wm.set(strBox, 'val');
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_SetStrErr_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SET_STR_ERR_0200
     * @tc.name      testWeakMap_SetStrErr_Callable_0002
     * @tc.desc      Verify that WeakMap.set(string-boxed, value) throws an exception (callable-class instance)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_SetStrErr_Callable_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_SetStrErr_Callable_0006 start');

        interface KeyType { id: string; invoke(): void; }
        class StrBox extends Object implements KeyType {
          id: string;
          invoke = (): void => { /* no-op */ };
          constructor(content: string) {
            super();
            this.id = content;
          }
        }

        const wm = new WeakMap<KeyType, string>();
        const strBox = new StrBox('strKey');

        let errorThrown = false;
        try {
          wm.set(strBox, 'callable-val');
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_SetStrErr_Callable_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SET_STR_ERR_0300
     * @tc.name      testWeakMap_SetStrErr_SharedRef_0003
     * @tc.desc      Verify that WeakMap.set(string-boxed, value) throws an exception (shared-ref key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_SetStrErr_SharedRef_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_SetStrErr_SharedRef_0003 start');

        interface KeyType { id: string; }
        class StrBox extends Object implements KeyType {
          id: string;
          constructor(content: string) {
            super();
            this.id = content;
          }
        }

        const wm = new WeakMap<KeyType, number>();
        const strBox = new StrBox('strKey');

        let errorThrown = false;
        try {
          wm.set(strBox, 99);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_SetStrErr_SharedRef_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SET_NUM_ERR_0100
     * @tc.name      testWeakMap_SetNumErr_Basic_0001
     * @tc.desc      Verify that WeakMap.set(number-boxed, value) throws an exception (basic object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_SetNumErr_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_SetNumErr_Basic_0001 start');

        interface KeyType { id: string; }

        class NumBox extends Object implements KeyType {
          id: string;
          constructor(num: number) {
            super();
            this.id = num.toString();
          }
        }

        const wm = new WeakMap<KeyType, string>();
        const numBox = new NumBox(123);


        let errorThrown = false;
        try {
          wm.set(numBox, 'val');
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_SetNumErr_Basic_0001 done');
        done();
      });


    /**
     * @tc.number    SUB_ARK_WEAKMAP_SET_NUM_ERR_0200
     * @tc.name      testWeakMap_SetNumErr_SharedRef_0002
     * @tc.desc      Verify that WeakMap.set(number-boxed, value) throws an exception (shared-ref key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_SetNumErr_SharedRef_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_SetNumErr_SharedRef_0002 start');

        interface KeyType { id: string; }
        class NumBox extends Object implements KeyType {
          id: string;
          constructor(num: number) {
            super();
            this.id = num.toString();
          }
        }

        const wm = new WeakMap<KeyType, number>();
        const numBox = new NumBox(123);

        let errorThrown = false;
        try {
          wm.set(numBox, 99);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_SetNumErr_SharedRef_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SET_NUM_ERR_0300
     * @tc.name      testWeakMap_SetNumErr_Callable_0003
     * @tc.desc      Verify that WeakMap.set(number-boxed, value) throws an exception (callable-class instance)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_SetNumErr_Callable_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_SetNumErr_Callable_0003 start');

        interface KeyType { id: string; invoke(): void; }
        class NumBox extends Object implements KeyType {
          id: string;
          invoke = (): void => { /* no-op */ };
          constructor(num: number) {
            super();
            this.id = num.toString();
          }
        }

        const wm = new WeakMap<KeyType, string>();
        const numBox = new NumBox(456);

        let errorThrown = false;
        try {
          wm.set(numBox, 'callable-val');
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_SetNumErr_Callable_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SET_BOOL_ERR_0100
     * @tc.name      testWeakMap_SetBoolErr_Basic_0001
     * @tc.desc      Verify that WeakMap.set(bool-boxed, value) throws an exception (basic object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_SetBoolErr_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_SetBoolErr_Basic_0001 start');

        interface KeyType { id: string; }

        class BoolBox extends Object implements KeyType {
          id: string;
          constructor(b: boolean) {
            super();
            this.id = b.toString();
          }
        }

        const wm = new WeakMap<KeyType, string>();
        const boolBox = new BoolBox(true);


        let errorThrown = false;
        try {
          wm.set(boolBox, 'val');
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_SetBoolErr_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SET_BOOL_ERR_0200
     * @tc.name      testWeakMap_SetBoolErr_SharedRef_0002
     * @tc.desc      Verify that WeakMap.set(bool-boxed, value) throws an exception (shared-ref key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_SetBoolErr_SharedRef_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_SetBoolErr_SharedRef_0005 start');

        interface KeyType { id: string; }
        class BoolBox extends Object implements KeyType {
          id: string;
          constructor(b: boolean) {
            super();
            this.id = b.toString();
          }
        }

        const wm = new WeakMap<KeyType, number>();
        const boolBox = new BoolBox(true);

        let errorThrown = false;
        try {
          wm.set(boolBox, 99);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_SetBoolErr_SharedRef_0002 done');
        done();
      });
    /**
     * @tc.number    SUB_ARK_WEAKMAP_SET_BOOL_ERR_0300
     * @tc.name      testWeakMap_SetBoolErr_Callable_0003
     * @tc.desc      Verify that WeakMap.set(bool-boxed, value) throws an exception (callable-class instance)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_SetBoolErr_Callable_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_SetBoolErr_Callable_0003 start');

        interface KeyType { id: string; invoke(): void; }
        class BoolBox extends Object implements KeyType {
          id: string;
          invoke = (): void => { /* no-op */ };
          constructor(b: boolean) {
            super();
            this.id = b.toString();
          }
        }

        const wm = new WeakMap<KeyType, string>();
        const boolBox = new BoolBox(false);

        let errorThrown = false;
        try {
          wm.set(boolBox, 'callable-val');
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_SetBoolErr_Callable_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SET_NULL_ERR_0100
     * @tc.name      testWeakMap_SetNullErr_Basic_0001
     * @tc.desc      Verify that WeakMap.set(null-boxed, value) throws an exception (basic object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_SetNullErr_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_SetNullErr_Basic_0001 start');

        interface KeyType { id: string; }

        class NullBox extends Object implements KeyType {
          id: string;
          constructor() {
            super();
            this.id = 'null-box';
          }
        }

        const wm = new WeakMap<KeyType, string>();
        const nullBox = new NullBox();


        let errorThrown = false;
        try {
          wm.set(nullBox, 'val');
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_SetNullErr_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SET_NULL_ERR_0200
     * @tc.name      testWeakMap_SetNullErr_SharedRef_0002
     * @tc.desc      Verify that WeakMap.set(null-boxed, value) throws an exception (shared-ref key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_SetNullErr_SharedRef_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_SetNullErr_SharedRef_0002 start');

        interface KeyType { id: string; }
        class NullBox extends Object implements KeyType {
          id: string;
          constructor() {
            super();
            this.id = 'null-box';
          }
        }

        const wm = new WeakMap<KeyType, number>();
        const nullBox = new NullBox();

        let errorThrown = false;
        try {
          wm.set(nullBox, 99);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_SetNullErr_SharedRef_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SET_NULL_ERR_0300
     * @tc.name      testWeakMap_SetNullErr_Callable_0003
     * @tc.desc      Verify that WeakMap.set(null-boxed, value) throws an exception (callable-class instance)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_SetNullErr_Callable_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_SetNullErr_Callable_0003 start');

        interface KeyType { id: string; invoke(): void; }
        class NullBox extends Object implements KeyType {
          id: string;
          invoke = (): void => { /* no-op */ };
          constructor() {
            super();
            this.id = 'null-box';
          }
        }

        const wm = new WeakMap<KeyType, string>();
        const nullBox = new NullBox();

        let errorThrown = false;
        try {
          wm.set(nullBox, 'callable-val');
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_SetNullErr_Callable_0003 done');
        done();
      });
  })
}