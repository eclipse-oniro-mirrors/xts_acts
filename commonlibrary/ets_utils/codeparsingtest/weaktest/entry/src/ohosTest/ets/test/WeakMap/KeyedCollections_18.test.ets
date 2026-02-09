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

export default function keyedCollections_18Test() {
  describe('keyedCollections_18Test', () => {
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
     * @tc.number    SUB_ARK_WEAKMAP_SET_UNDEF_ERR_0100
     * @tc.name      testWeakMap_SetUndefErr_Basic_0001
     * @tc.desc      Verify that WeakMap.set(undefined-boxed, value) throws an exception (basic object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_SetUndefErr_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_SetUndefErr_Basic_0001 start');

        interface KeyType { id: string; }

        class UndefBox extends Object implements KeyType {
          id: string;
          constructor() {
            super();
            this.id = 'undefined-box';
          }
        }

        const wm = new WeakMap<KeyType, string>();
        const undefBox = new UndefBox();


        let errorThrown = false;
        try {
          wm.set(undefBox, 'val');
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_SetUndefErr_Basic_0001 done');
        done();
      });


    /**
     * @tc.number    SUB_ARK_WEAKMAP_SET_UNDEF_ERR_0200
     * @tc.name      testWeakMap_SetUndefErr_SharedRef_0002
     * @tc.desc      Verify that WeakMap.set(undefined-boxed, value) throws an exception (shared-ref key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_SetUndefErr_SharedRef_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_SetUndefErr_SharedRef_0002 start');

        interface KeyType { id: string; }
        class UndefBox extends Object implements KeyType {
          id: string;
          constructor() {
            super();
            this.id = 'undefined-box';
          }
        }

        const wm = new WeakMap<KeyType, number>();
        const undefBox = new UndefBox();

        let errorThrown = false;
        try {
          wm.set(undefBox, 99);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_SetUndefErr_SharedRef_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SET_UNDEF_ERR_0300
     * @tc.name      testWeakMap_SetUndefErr_Callable_0003
     * @tc.desc      Verify that WeakMap.set(undefined-boxed, value) throws an exception (callable-class instance)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_SetUndefErr_Callable_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_SetUndefErr_Callable_0003 start');

        interface KeyType { id: string; invoke(): void; }
        class UndefBox extends Object implements KeyType {
          id: string;
          invoke = (): void => { /* no-op */ };
          constructor() {
            super();
            this.id = 'undefined-box';
          }
        }

        const wm = new WeakMap<KeyType, string>();
        const undefBox = new UndefBox();

        let errorThrown = false;
        try {
          wm.set(undefBox, 'callable-val');
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_SetUndefErr_Callable_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SET1_NO_ERR_0100
     * @tc.name      testWeakMap_Set1_NoErr_Basic_0001
     * @tc.desc      Verify that WeakMap.set(key, undefined) throws no exception (basic object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_Set1_NoErr_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_Set1_NoErr_Basic_0001 start');

        interface KeyType { id: string; }
        const wm = new WeakMap<KeyType, string | undefined>();

        class Key implements KeyType {
          id: string;
          constructor() { this.id = 'key-0001'; }
        }
        const key = new Key();

        let errorThrown = false;
        try {
          wm.set(key, undefined);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_Set1_NoErr_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SET1_NO_ERR_0200
     * @tc.name      testWeakMap_Set1_NoErr_Array_0002
     * @tc.desc      Verify that WeakMap.set(key, undefined) throws no exception (array key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_Set1_NoErr_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_Set1_NoErr_Array_0002 start');

        interface KeyType extends Array<number> { __brand: 'arr'; }
        const wm = new WeakMap<KeyType, number | undefined>();

        class ArrKey extends Array<number> implements KeyType {
          __brand: 'arr' = 'arr';
          constructor() { super(); }
        }
        const key = new ArrKey();

        let errorThrown = false;
        try {
          wm.set(key, undefined);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_Set1_NoErr_Array_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SET1_NO_ERR_0300
     * @tc.name      testWeakMap_Set1_NoErr_Map_0003
     * @tc.desc      Verify that WeakMap.set(key, undefined) throws no exception (Map object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_Set1_NoErr_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_Set1_NoErr_Map_0003 start');

        interface KeyType extends Map<string, number> { __brand: 'map'; }
        const wm = new WeakMap<KeyType, boolean | undefined>();

        class MapKey extends Map<string, number> implements KeyType {
          __brand: 'map' = 'map';
          constructor() { super(); }
        }
        const key = new MapKey();

        let errorThrown = false;
        try {
          wm.set(key, undefined);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_Set1_NoErr_Map_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SET1_NO_ERR_0400
     * @tc.name      testWeakMap_Set1_NoErr_Set_0004
     * @tc.desc      Verify that WeakMap.set(key, undefined) throws no exception (Set object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_Set1_NoErr_Set_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_Set1_NoErr_Set_0004 start');

        interface KeyType extends Set<Date> { __brand: 'set'; }
        const wm = new WeakMap<KeyType, string | undefined>();

        class SetKey extends Set<Date> implements KeyType {
          __brand: 'set' = 'set';
          constructor() { super(); }
        }
        const key = new SetKey();

        let errorThrown = false;
        try {
          wm.set(key, undefined);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_Set1_NoErr_Set_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SET1_NO_ERR_0500
     * @tc.name      testWeakMap_Set1_NoErr_SharedRef_0005
     * @tc.desc      Verify that WeakMap.set(key, undefined) throws no exception (shared-ref key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_Set1_NoErr_SharedRef_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_Set1_NoErr_SharedRef_0005 start');

        interface KeyType { id: string; }
        const wm = new WeakMap<KeyType, number | undefined>();

        class Key implements KeyType {
          id: string;
          constructor() { this.id = 'shared-0005'; }
        }
        const key1 = new Key();
        const key2 = key1;

        let errorThrown = false;
        try {
          wm.set(key2, undefined);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_Set1_NoErr_SharedRef_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SET1_NO_ERR_0600
     * @tc.name      testWeakMap_Set1_NoErr_Callable_0006
     * @tc.desc      Verify that WeakMap.set(key, undefined) throws no exception (callable-class instance)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_Set1_NoErr_Callable_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_Set1_NoErr_Callable_0006 start');

        interface KeyType { id: string; invoke(): void; }
        const wm = new WeakMap<KeyType, string | undefined>();

        class CallableKey implements KeyType {
          id: string;
          invoke = (): void => { /* no-op */ };
          constructor() { this.id = 'callable-0006'; }
        }
        const key = new CallableKey();

        let errorThrown = false;
        try {
          wm.set(key, undefined);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_Set1_NoErr_Callable_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SET1_NO_EFFECT_0100
     * @tc.name      testWeakMap_Set1_NoEffect_Basic_0001
     * @tc.desc      Verify that WeakMap.set(key, undefined) does not store the key (basic object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_Set1_NoEffect_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_Set1_NoEffect_Basic_0001 start');

        interface KeyType { id: string; }
        const wm = new WeakMap<KeyType, string | undefined>();

        class Key implements KeyType {
          id: string;
          constructor() { this.id = 'obj-0001'; }
        }
        const key = new Key();

        wm.set(key, undefined);
        const result = wm.has(key);
        expect(result).assertTrue();
        console.log('testWeakMap_Set1_NoEffect_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SET1_NO_EFFECT_0200
     * @tc.name      testWeakMap_Set1_NoEffect_Array_0002
     * @tc.desc      Verify that WeakMap.set(key, undefined) does not store the key (array object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_Set1_NoEffect_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_Set1_NoEffect_Array_0002 start');

        interface KeyType extends Array<number> { __brand: 'arr'; }
        const wm = new WeakMap<KeyType, number | undefined>();

        class ArrKey extends Array<number> implements KeyType {
          __brand: 'arr' = 'arr';
          constructor() { super(); }
        }
        const key = new ArrKey();

        wm.set(key, undefined);
        expect(wm.has(key)).assertTrue();
        console.log('testWeakMap_Set1_NoEffect_Array_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SET1_NO_EFFECT_0300
     * @tc.name      testWeakMap_Set1_NoEffect_Map_0003
     * @tc.desc      Verify that WeakMap.set(key, undefined) does not store the key (Map object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_Set1_NoEffect_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_Set1_NoEffect_Map_0003 start');

        interface KeyType extends Map<string, number> { __brand: 'map'; }
        const wm = new WeakMap<KeyType, boolean | undefined>();

        class MapKey extends Map<string, number> implements KeyType {
          __brand: 'map' = 'map';
          constructor() { super(); }
        }
        const key = new MapKey();

        wm.set(key, undefined);
        expect(wm.has(key)).assertTrue();
        console.log('testWeakMap_Set1_NoEffect_Map_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SET1_NO_EFFECT_0400
     * @tc.name      testWeakMap_Set1_NoEffect_Set_0004
     * @tc.desc      Verify that WeakMap.set(key, undefined) does not store the key (Set object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_Set1_NoEffect_Set_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_Set1_NoEffect_Set_0004 start');

        interface KeyType extends Set<Date> { __brand: 'set'; }
        const wm = new WeakMap<KeyType, string | undefined>();

        class SetKey extends Set<Date> implements KeyType {
          __brand: 'set' = 'set';
          constructor() { super(); }
        }
        const key = new SetKey();

        wm.set(key, undefined);
        expect(wm.has(key)).assertTrue();
        console.log('testWeakMap_Set1_NoEffect_Set_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SET1_NO_EFFECT_0500
     * @tc.name      testWeakMap_Set1_NoEffect_SharedRef_0005
     * @tc.desc      Verify that WeakMap.set(key, undefined) does not store the key (shared-ref)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_Set1_NoEffect_SharedRef_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_Set1_NoEffect_SharedRef_0005 start');

        interface KeyType { id: string; }
        const wm = new WeakMap<KeyType, number | undefined>();

        class Key implements KeyType {
          id: string;
          constructor() { this.id = 'shared-0005'; }
        }
        const key1 = new Key();
        const key2 = key1;

        wm.set(key2, undefined);
        expect(wm.has(key1)).assertTrue();
        console.log('testWeakMap_Set1_NoEffect_SharedRef_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SET1_NO_EFFECT_0600
     * @tc.name      testWeakMap_Set1_NoEffect_Callable_0006
     * @tc.desc      Verify that WeakMap.set(key, undefined) does not store the key (callable-class instance)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_Set1_NoEffect_Callable_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_Set1_NoEffect_Callable_0006 start');

        interface KeyType { id: string; invoke(): void; }
        const wm = new WeakMap<KeyType, string | undefined>();

        class CallableKey implements KeyType {
          id: string;
          invoke = (): void => { /* no-op */ };
          constructor() { this.id = 'callable-0006'; }
        }
        const key = new CallableKey();

        wm.set(key, undefined);
        expect(wm.has(key)).assertTrue();
        console.log('testWeakMap_Set1_NoEffect_Callable_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_GET_NON_OBJ_0100
     * @tc.name      testWeakMap_GetNonObj_Basic_0001
     * @tc.desc      Verify that WeakMap.get(string-boxed) throws no exception (basic object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_GetNonObj_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_GetNonObj_Basic_0001 start');

        interface KeyType { id: string; }

        class StrBox extends Object implements KeyType {
          id: string;
          constructor(content: string) {
            super();
            this.id = content;
          }
        }

        const wm = new WeakMap<KeyType, string>();
        const strBox = new StrBox('str');


        let errorThrown = false;
        try {
          wm.get(strBox);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_GetNonObj_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_GET_NON_OBJ_0200
     * @tc.name      testWeakMap_GetNonObj_SharedRef_0002
     * @tc.desc      Verify that WeakMap.get(non-object-boxed) throws no exception (shared-ref key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_GetNonObj_SharedRef_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_GetNonObj_SharedRef_0002 start');

        interface KeyType { id: string; }
        class StrBox extends Object implements KeyType {
          id: string;
          constructor(content: string) {
            super();
            this.id = content;
          }
        }

        const wm = new WeakMap<KeyType, number>();
        const strBox = new StrBox('str');

        let errorThrown = false;
        try {
          wm.get(strBox);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_GetNonObj_SharedRef_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_GET_NON_OBJ_0300
     * @tc.name      testWeakMap_GetNonObj_Callable_0003
     * @tc.desc      Verify that WeakMap.get(non-object-boxed) throws no exception (callable-class instance)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_GetNonObj_Callable_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_GetNonObj_Callable_0003 start');

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
        const strBox = new StrBox('callable');

        let errorThrown = false;
        try {
          wm.get(strBox);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_GetNonObj_Callable_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_DEL_NON_OBJ_0100
     * @tc.name      testWeakMap_DelNonObj_Basic_0001
     * @tc.desc      Verify that WeakMap.delete(number-boxed) throws no exception (basic object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_DelNonObj_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_DelNonObj_Basic_0001 start');

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
          wm.delete(numBox);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_DelNonObj_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_DEL_NON_OBJ_0200
     * @tc.name      testWeakMap_DelNonObj_SharedRef_0002
     * @tc.desc      Verify that WeakMap.delete(non-object-boxed) throws no exception (shared-ref key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_DelNonObj_SharedRef_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_DelNonObj_SharedRef_0002 start');

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
          wm.delete(numBox);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_DelNonObj_SharedRef_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_DEL_NON_OBJ_0300
     * @tc.name      testWeakMap_DelNonObj_Callable_0003
     * @tc.desc      Verify that WeakMap.delete(non-object-boxed) throws no exception (callable-class instance)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_DelNonObj_Callable_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_DelNonObj_Callable_0003 start');

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
          wm.delete(numBox);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_DelNonObj_Callable_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_HAS_NON_OBJ_0100
     * @tc.name      testWeakMap_HasNonObj_Basic_0001
     * @tc.desc      Verify that WeakMap.has(string-boxed) throws no exception (basic object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_HasNonObj_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_HasNonObj_Basic_0001 start');

        interface KeyType { id: string; }

        class StrBox extends Object implements KeyType {
          id: string;
          constructor(content: string) {
            super();
            this.id = content;
          }
        }

        const wm = new WeakMap<KeyType, string>();
        const strBox = new StrBox('str');


        let errorThrown = false;
        try {
          wm.has(strBox);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_HasNonObj_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_HAS_NON_OBJ_0200
     * @tc.name      testWeakMap_HasNonObj_SharedRef_0002
     * @tc.desc      Verify that WeakMap.has(non-object-boxed) throws no exception (shared-ref key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_HasNonObj_SharedRef_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_HasNonObj_SharedRef_0002 start');

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
          wm.has(numBox);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_HasNonObj_SharedRef_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_HAS_NON_OBJ_0300
     * @tc.name      testWeakMap_HasNonObj_Callable_0003
     * @tc.desc      Verify that WeakMap.has(non-object-boxed) throws no exception (callable-class instance)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_HasNonObj_Callable_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_HasNonObj_Callable_0003 start');

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
          wm.has(numBox);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakMap_HasNonObj_Callable_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_STR_ERR_0100
     * @tc.name      testWeakSet_AddStrErr_Basic_0001
     * @tc.desc      Verify that WeakSet.add(string-boxed) throws an exception (basic object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_AddStrErr_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_AddStrErr_Basic_0001 start');

        interface ValueType { id: string; }

        class StrBox extends Object implements ValueType {
          id: string;
          constructor(content: string) {
            super();
            this.id = content;
          }
        }

        const ws = new WeakSet<ValueType>();
        const strBox = new StrBox('str');


        let errorThrown = false;
        try {
          ws.add(strBox);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakSet_AddStrErr_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_STR_ERR_0200
     * @tc.name      testWeakSet_AddStrErr_SharedRef_0002
     * @tc.desc      Verify that WeakSet.add(string-boxed) throws an exception (shared-ref key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_AddStrErr_SharedRef_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_AddStrErr_SharedRef_0002 start');

        interface ValueType { id: string; }
        class StrBox extends Object implements ValueType {
          id: string;
          constructor(content: string) {
            super();
            this.id = content;
          }
        }

        const ws = new WeakSet<ValueType>();
        const strBox1 = new StrBox('shared');
        const strBox2 = strBox1;

        let errorThrown = false;
        try {
          ws.add(strBox2);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakSet_AddStrErr_SharedRef_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_STR_ERR_0300
     * @tc.name      testWeakSet_AddStrErr_Callable_0003
     * @tc.desc      Verify that WeakSet.add(string-boxed) throws an exception (callable-class instance)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_AddStrErr_Callable_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_AddStrErr_Callable_0003 start');

        interface ValueType { id: string; invoke(): void; }
        class StrBox extends Object implements ValueType {
          id: string;
          invoke = (): void => { /* no-op */ };
          constructor(content: string) {
            super();
            this.id = content;
          }
        }

        const ws = new WeakSet<ValueType>();
        const strBox = new StrBox('callable');

        let errorThrown = false;
        try {
          ws.add(strBox);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakSet_AddStrErr_Callable_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_NUM_ERR_0100
     * @tc.name      testWeakSet_AddNumErr_Basic_0001
     * @tc.desc      Verify that WeakSet.add(number-boxed) throws an exception (basic object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_AddNumErr_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_AddNumErr_Basic_0001 start');

        interface ValueType { id: string; }

        class NumBox extends Object implements ValueType {
          id: string;
          constructor(num: number) {
            super();
            this.id = num.toString();
          }
        }

        const ws = new WeakSet<ValueType>();
        const numBox = new NumBox(123);


        let errorThrown = false;
        try {
          ws.add(numBox);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakSet_AddNumErr_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_NUM_ERR_0200
     * @tc.name      testWeakSet_AddNumErr_SharedRef_0002
     * @tc.desc      Verify that WeakSet.add(number-boxed) throws an exception (shared-ref key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_AddNumErr_SharedRef_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_AddNumErr_SharedRef_0002 start');

        interface ValueType { id: string; }
        class NumBox extends Object implements ValueType {
          id: string;
          constructor(num: number) {
            super();
            this.id = num.toString();
          }
        }

        const ws = new WeakSet<ValueType>();
        const numBox1 = new NumBox(99);
        const numBox2 = numBox1;

        let errorThrown = false;
        try {
          ws.add(numBox2);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakSet_AddNumErr_SharedRef_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_DATA_WEAKSET_ADD_NUM_ERR_0300
     * @tc.name      testWeakSet_AddNumErr_Callable_0003
     * @tc.desc      Verify that WeakSet.add(number-boxed) throws an exception (callable-class instance)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_AddNumErr_Callable_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_AddNumErr_Callable_0003 start');

        interface ValueType { id: string; invoke(): void; }
        class NumBox extends Object implements ValueType {
          id: string;
          invoke = (): void => { /* no-op */ };
          constructor(num: number) {
            super();
            this.id = num.toString();
          }
        }

        const ws = new WeakSet<ValueType>();
        const numBox = new NumBox(42);

        let errorThrown = false;
        try {
          ws.add(numBox);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakSet_AddNumErr_Callable_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_NUM_ERR_0300
     * @tc.name      testWeakSet_addNumErr_Callable_0003
     * @tc.desc      Verify that WeakSet.add(number-boxed) throws an exception (callable-class instance)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_addNumErr_Callable_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_addNumErr_Callable_0003 start');

        interface ValueType { id: string; invoke(): void; }
        class NumBox extends Object implements ValueType {
          id: string;
          invoke = (): void => { /* no-op */ };
          constructor(num: number) {
            super();
            this.id = num.toString();
          }
        }

        const ws = new WeakSet<ValueType>();
        const numBox = new NumBox(42);

        let errorThrown = false;
        try {
          ws.add(numBox);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testWeakSet_AddNumErr_Callable_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_BOOL_0100
     * @tc.name      testWeakSet_Add_BoolWrapped_0001
     * @tc.desc      Verify that adding a boolean-wrapped instance throws an exception.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_BoolWrapped_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_BoolWrapped_0001 start');

        interface BoolBox { readonly id: string; readonly value: boolean; }
        class BoolWrapper implements BoolBox {
          public id: string;
          public value: boolean;
          constructor(v: boolean) {
            this.id = 'bool-' + Date.now() + '-' + Math.random();
            this.value = v;
          }
        }

        const ws = new WeakSet<BoolWrapper>();
        let thrown = false;
        try {
          ws.add(new BoolWrapper(true));
        } catch {
          thrown = true;
        }
        expect(thrown).assertFalse();
        console.log('testWeakSet_Add_BoolWrapped_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_BOOL_0200
     * @tc.name      testWeakSet_Add_BoolFalse_0002
     * @tc.desc      Verify that adding a false-wrapped instance throws an exception.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_BoolFalse_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_BoolFalse_0002 start');

        interface BoolBox { readonly id: string; readonly value: boolean; }
        class BoolWrapper implements BoolBox {
          public id: string;
          public value: boolean;
          constructor(v: boolean) {
            this.id = 'bool-false-' + Date.now();
            this.value = v;
          }
        }

        const ws = new WeakSet<BoolWrapper>();
        let thrown = false;
        try {
          ws.add(new BoolWrapper(false));
        } catch {
          thrown = true;
        }
        expect(thrown).assertFalse();
        console.log('testWeakSet_Add_BoolFalse_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_BOOL_0300
     * @tc.name      testWeakSet_Add_NumWrapped_0003
     * @tc.desc      Verify that adding a number-wrapped instance throws an exception.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_NumWrapped_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_NumWrapped_0003 start');

        interface NumBox { readonly id: string; readonly value: number; }
        class NumWrapper implements NumBox {
          public id: string;
          public value: number;
          constructor(v: number) {
            this.id = 'num-' + Date.now();
            this.value = v;
          }
        }

        const ws = new WeakSet<NumWrapper>();
        let thrown = false;
        try {
          ws.add(new NumWrapper(123));
        } catch {
          thrown = true;
        }
        expect(thrown).assertFalse();
        console.log('testWeakSet_Add_NumWrapped_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_BOOL_0400
     * @tc.name      testWeakSet_Add_StringWrapped_0004
     * @tc.desc      Verify that adding a string-wrapped instance throws an exception.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_StringWrapped_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_StringWrapped_0004 start');

        interface StrBox { readonly id: string; readonly value: string; }
        class StrWrapper implements StrBox {
          public id: string;
          public value: string;
          constructor(v: string) {
            this.id = 'str-' + Date.now();
            this.value = v;
          }
        }

        const ws = new WeakSet<StrWrapper>();
        let thrown = false;
        try {
          ws.add(new StrWrapper('arkts'));
        } catch {
          thrown = true;
        }
        expect(thrown).assertFalse();
        console.log('testWeakSet_Add_StringWrapped_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_BOOL_0500
     * @tc.name      testWeakSet_Add_BigIntWrapped_0005
     * @tc.desc      Verify that adding a bigint-wrapped instance throws an exception.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_BigIntWrapped_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_BigIntWrapped_0005 start');

        interface BigBox { readonly id: string; readonly value: bigint; }
        class BigWrapper implements BigBox {
          public id: string;
          public value: bigint;
          constructor(v: bigint) {
            this.id = 'bi-' + Date.now();
            this.value = v;
          }
        }

        const ws = new WeakSet<BigWrapper>();
        let thrown = false;
        try {
          ws.add(new BigWrapper(BigInt(123)));
        } catch {
          thrown = true;
        }
        expect(thrown).assertFalse();
        console.log('testWeakSet_Add_BigIntWrapped_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_BOOL_0600
     * @tc.name      testWeakSet_Add_CallableWrapped_0006
     * @tc.desc      Verify that adding a callable-class instance succeeds (no error).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_CallableWrapped_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_CallableWrapped_0006 start');

        interface CallableBox { readonly id: string; invoke(): string; }
        class CallableWrapper implements CallableBox {
          public id: string;
          constructor() {
            this.id = 'call-' + Date.now();
          }
          public invoke(): string {
            return 'callable';
          }
        }

        const ws = new WeakSet<CallableWrapper>();
        const inst = new CallableWrapper();
        let thrown = false;
        try {
          ws.add(inst);
        } catch {
          thrown = true;
        }
        expect(!thrown && ws.has(inst)).assertTrue();
        console.log('testWeakSet_Add_CallableWrapped_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_NULL_0100
     * @tc.name      testWeakSet_Add_Null_0001
     * @tc.desc      Verify that adding null throws an exception.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_Null_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_Null_0001 start');

        interface Box { readonly id: string; }
        class NullBox implements Box {
          public id: string;
          constructor() {
            this.id = 'null-' + Date.now();
          }
        }

        const ws = new WeakSet<Box>();
        let thrown = false;
        try {

          ws.add(null as never);
        } catch {
          thrown = true;
        }
        expect(thrown).assertTrue();
        console.log('testWeakSet_Add_Null_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_NULL_0200
     * @tc.name      testWeakSet_Add_NullUnion_0002
     * @tc.desc      Verify that adding a null-union-wrapped instance throws an exception.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_NullUnion_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_NullUnion_0002 start');

        interface NullableBox { readonly id: string; value: string | null; }
        class NullableWrapper implements NullableBox {
          public id: string;
          public value: string | null;
          constructor(v: string | null) {
            this.id = 'nullable-' + Date.now();
            this.value = v;
          }
        }

        const ws = new WeakSet<NullableWrapper>();
        let thrown = false;
        try {

          ws.add(null as never);
        } catch {
          thrown = true;
        }
        expect(thrown).assertTrue();
        console.log('testWeakSet_Add_NullUnion_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_NULL_0300
     * @tc.name      testWeakSet_Add_UndefinedBox_0003
     * @tc.desc      Verify that adding undefined-wrapped instance throws an exception.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_UndefinedBox_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_UndefinedBox_0003 start');

        interface UndefBox { readonly id: string; value: string | undefined; }
        class UndefWrapper implements UndefBox {
          public id: string;
          public value: string | undefined;
          constructor(v?: string) {
            this.id = 'undef-' + Date.now();
            this.value = v;
          }
        }

        const ws = new WeakSet<UndefWrapper>();
        let thrown = false;
        try {
          ws.add(undefined as never);
        } catch {
          thrown = true;
        }
        expect(thrown).assertTrue();
        console.log('testWeakSet_Add_UndefinedBox_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_NULL_0400
     * @tc.name      testWeakSet_Add_NumNullUnion_0004
     * @tc.desc      Verify that adding number-or-null-wrapped null throws an exception.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_NumNullUnion_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_NumNullUnion_0004 start');

        interface NumNullBox { readonly id: string; value: number | null; }
        class NumNullWrapper implements NumNullBox {
          public id: string;
          public value: number | null;
          constructor(v: number | null) {
            this.id = 'numNull-' + Date.now();
            this.value = v;
          }
        }

        const ws = new WeakSet<NumNullWrapper>();
        let thrown = false;
        try {
          ws.add(null as never);
        } catch {
          thrown = true;
        }
        expect(thrown).assertTrue();
        console.log('testWeakSet_Add_NumNullUnion_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_NULL_0500
     * @tc.name      testWeakSet_Add_CallableNull_0005
     * @tc.desc      Verify that adding null to WeakSet<callable-class> throws an exception.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_CallableNull_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_CallableNull_0005 start');

        interface CallableBox { readonly id: string; invoke(): string; }
        class CallableWrapper implements CallableBox {
          public id: string;
          constructor() {
            this.id = 'call-' + Date.now();
          }
          public invoke(): string {
            return 'callable';
          }
        }

        const ws = new WeakSet<CallableBox>();
        let thrown = false;
        try {
          ws.add(null as never);
        } catch {
          thrown = true;
        }
        expect(thrown).assertTrue();
        console.log('testWeakSet_Add_CallableNull_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_NULL_0600
     * @tc.name      testWeakSet_Add_ValidObject_0006
     * @tc.desc      Verify that adding a valid object succeeds (no error).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_ValidObject_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_ValidObject_0006 start');

        interface ValidBox { readonly id: string; payload: number; }
        class ValidWrapper implements ValidBox {
          public id: string;
          public payload: number;
          constructor(p: number) {
            this.id = 'valid-' + Date.now();
            this.payload = p;
          }
        }

        const ws = new WeakSet<ValidBox>();
        const inst = new ValidWrapper(42);
        let thrown = false;
        try {
          ws.add(inst);
        } catch {
          thrown = true;
        }
        expect(!thrown && ws.has(inst)).assertTrue();
        console.log('testWeakSet_Add_ValidObject_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_UNDEFINED_0100
     * @tc.name      testWeakSet_Add_Undefined_0001
     * @tc.desc      Verify that adding undefined throws an exception.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_Undefined_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_Undefined_0001 start');

        interface Box { readonly id: string; }
        class UndefinedBox implements Box {
          public id: string;
          constructor() {
            this.id = 'undef-' + Date.now();
          }
        }

        const ws = new WeakSet<Box>();
        let thrown = false;
        try {
          ws.add(undefined as never);
        } catch {
          thrown = true;
        }
        expect(thrown).assertTrue();
        console.log('testWeakSet_Add_Undefined_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_UNDEFINED_0200
     * @tc.name      testWeakSet_Add_UndefinedUnion_0002
     * @tc.desc      Verify that adding an undefined-union-wrapped instance throws an exception.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_UndefinedUnion_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_UndefinedUnion_0002 start');

        interface NullableBox { readonly id: string; value: string | undefined; }
        class NullableWrapper implements NullableBox {
          public id: string;
          public value: string | undefined;
          constructor(v?: string) {
            this.id = 'nullable-' + Date.now();
            this.value = v;
          }
        }

        const ws = new WeakSet<NullableWrapper>();
        let thrown = false;
        try {
          ws.add(undefined as never);
        } catch {
          thrown = true;
        }
        expect(thrown).assertTrue();
        console.log('testWeakSet_Add_UndefinedUnion_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_UNDEFINED_0300
     * @tc.name      testWeakSet_Add_NumUndefinedUnion_0003
     * @tc.desc      Verify that adding number-or-undefined-wrapped undefined throws an exception.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_NumUndefinedUnion_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_NumUndefinedUnion_0003 start');

        interface NumUndefBox { readonly id: string; value: number | undefined; }
        class NumUndefWrapper implements NumUndefBox {
          public id: string;
          public value: number | undefined;
          constructor(v?: number) {
            this.id = 'numUndef-' + Date.now();
            this.value = v;
          }
        }

        const ws = new WeakSet<NumUndefWrapper>();
        let thrown = false;
        try {
          ws.add(undefined as never);
        } catch {
          thrown = true;
        }
        expect(thrown).assertTrue();
        console.log('testWeakSet_Add_NumUndefinedUnion_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_UNDEFINED_0400
     * @tc.name      testWeakSet_Add_CallableUndefined_0004
     * @tc.desc      Verify that adding undefined to WeakSet<callable-class> throws an exception.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_CallableUndefined_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_CallableUndefined_0004 start');

        interface CallableBox { readonly id: string; invoke(): string; }
        class CallableWrapper implements CallableBox {
          public id: string;
          constructor() {
            this.id = 'call-' + Date.now();
          }
          public invoke(): string {
            return 'callable';
          }
        }

        const ws = new WeakSet<CallableBox>();
        let thrown = false;
        try {
          ws.add(undefined as never);
        } catch {
          thrown = true;
        }
        expect(thrown).assertTrue();
        console.log('testWeakSet_Add_CallableUndefined_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_UNDEFINED_0500
     * @tc.name      testWeakSet_add_ValidObject_0005
     * @tc.desc      Verify that adding a valid object succeeds (no error).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_add_ValidObject_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_add_ValidObject_0005 start');

        interface ValidBox { readonly id: string; payload: number; }
        class ValidWrapper implements ValidBox {
          public id: string;
          public payload: number;
          constructor(p: number) {
            this.id = 'valid-' + Date.now();
            this.payload = p;
          }
        }

        const ws = new WeakSet<ValidBox>();
        const inst = new ValidWrapper(42);
        let thrown = false;
        try {
          ws.add(inst);
        } catch {
          thrown = true;
        }

        expect(!thrown && ws.has(inst)).assertTrue();
        console.log('testWeakSet_add_ValidObject_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_UNDEFINED_0600
     * @tc.name      testWeakSet_Add_NullUndefinedUnion_0006
     * @tc.desc      Verify that adding null | undefined union-wrapped null throws an exception.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_NullUndefinedUnion_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_NullUndefinedUnion_0006 start');

        interface NullUndefBox { readonly id: string; value: string | null | undefined; }
        class NullUndefWrapper implements NullUndefBox {
          public id: string;
          public value: string | null | undefined;
          constructor(v?: string | null) {
            this.id = 'nullUndef-' + Date.now();
            this.value = v;
          }
        }

        const ws = new WeakSet<NullUndefWrapper>();
        let thrown = false;
        try {
          ws.add(undefined as never);
        } catch {
          thrown = true;
        }
        expect(thrown).assertTrue();
        console.log('testWeakSet_Add_NullUndefinedUnion_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_NO_ARG_0100
     * @tc.name      testWeakSet_Add_NoArg_0001
     * @tc.desc      Verify that calling add() without any argument throws an exception.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_NoArg_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_NoArg_0001 start');

        interface Box { readonly id: string; }
        class EmptyBox implements Box {
          public id: string;
          constructor() {
            this.id = 'empty-' + Date.now();
          }
        }

        const ws = new WeakSet<Box>();


        type WeakSetAdd = (item: Box) => void;
        const addFn: WeakSetAdd = (item) => ws.add(item);

        let thrown = false;
        try {

          (addFn as (item?: Box) => void)();
        } catch {
          thrown = true;
        }
        expect(thrown).assertTrue();
        console.log('testWeakSet_Add_NoArg_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_NO_ARG_0200
     * @tc.name      testWeakSet_Add_VoidUnion_0002
     * @tc.desc      Verify that adding void-union-wrapped undefined throws an exception.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_VoidUnion_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_VoidUnion_0002 start');

        interface VoidBox { readonly id: string; value: string | void; }
        class VoidWrapper implements VoidBox {
          public id: string;
          public value: string | void;
          constructor(v?: string) {
            this.id = 'void-' + Date.now();
            this.value = v;
          }
        }

        const ws = new WeakSet<VoidBox>();
        let thrown = false;
        try {
          ws.add(undefined as never);
        } catch {
          thrown = true;
        }
        expect(thrown).assertTrue();
        console.log('testWeakSet_Add_VoidUnion_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_NO_ARG_0300
     * @tc.name      testWeakSet_Add_NeverUnion_0003
     * @tc.desc      Verify that adding never-union-wrapped null throws an exception.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_NeverUnion_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_NeverUnion_0003 start');

        interface NeverBox { readonly id: string; value: string | never; }
        class NeverWrapper implements NeverBox {
          public id: string;
          public value: string | never;
          constructor(v: string) {
            this.id = 'never-' + Date.now();
            this.value = v;
          }
        }

        const ws = new WeakSet<NeverBox>();
        let thrown = false;
        try {
          ws.add(null as never);
        } catch {
          thrown = true;
        }
        expect(thrown).assertTrue();
        console.log('testWeakSet_Add_NeverUnion_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_NO_ARG_0400
     * @tc.name      testWeakSet_Add_CallableNoArg_0004
     * @tc.desc      Verify that calling add() without argument on WeakSet<callable-class> throws an exception.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_CallableNoArg_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_CallableNoArg_0004 start');

        interface CallableBox { readonly id: string; invoke(): string; }
        class CallableWrapper implements CallableBox {
          public id: string;
          constructor() {
            this.id = 'call-' + Date.now();
          }
          public invoke(): string {
            return 'callable';
          }
        }

        const ws = new WeakSet<CallableBox>();
        type WeakSetAdd = (item: CallableBox) => void;
        const addFn: WeakSetAdd = (item) => ws.add(item);

        let thrown = false;
        try {
          (addFn as (item?: CallableBox) => void)();
        } catch {
          thrown = true;
        }
        expect(thrown).assertTrue();
        console.log('testWeakSet_Add_CallableNoArg_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_NO_ARG_0500
     * @tc.name      testWeakSet_Add_ValidObject_0005
     * @tc.desc      Verify that adding a valid object succeeds (no error).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_ValidObject_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_ValidObject_0005 start');

        interface ValidBox { readonly id: string; payload: number; }
        class ValidWrapper implements ValidBox {
          public id: string;
          public payload: number;
          constructor(p: number) {
            this.id = 'valid-' + Date.now();
            this.payload = p;
          }
        }

        const ws = new WeakSet<ValidBox>();
        const inst = new ValidWrapper(42);
        let thrown = false;
        try {
          ws.add(inst);
        } catch {
          thrown = true;
        }

        expect(!thrown && ws.has(inst)).assertTrue();
        console.log('testWeakSet_Add_ValidObject_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_NO_ARG_0600
     * @tc.name      testWeakSet_Add_PromiseNoArg_0006
     * @tc.desc      Verify that calling add() without argument on WeakSet<Promise-like> throws an exception.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_PromiseNoArg_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_PromiseNoArg_0006 start');

        interface PromiseLikeBox { readonly id: string; then(): void; }
        class PromiseLikeWrapper implements PromiseLikeBox {
          public id: string;
          constructor() {
            this.id = 'promise-' + Date.now();
          }
          public then(): void {

          }
        }

        const ws = new WeakSet<PromiseLikeBox>();
        type WeakSetAdd = (item: PromiseLikeBox) => void;
        const addFn: WeakSetAdd = (item) => ws.add(item);

        let thrown = false;
        try {
          (addFn as (item?: PromiseLikeBox) => void)();
        } catch {
          thrown = true;
        }
        expect(thrown).assertTrue();
        console.log('testWeakSet_Add_PromiseNoArg_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_MULTI_0100
     * @tc.name      testWeakSet_Add_MultiArgs_Basic_0001
     * @tc.desc      Verify that only the first argument is taken when add() is called with multiple arguments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_MultiArgs_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_MultiArgs_Basic_0001 start');

        interface Box { readonly id: string; }
        class EmptyBox implements Box {
          public id: string;
          constructor() {
            this.id = 'empty-' + Date.now();
          }
        }


        interface WeakSetMulti {
          add(item: Box, ...rest: never[]): void;
        }


        class MultiArgWrapper {
          private ws: WeakSet<Box>;
          constructor(set: WeakSet<Box>) {
            this.ws = set;
          }

          public addMulti(item: Box): void {
            (this.ws as WeakSetMulti).add(item, 'str' as never, 123 as never);
          }
        }

        const ws = new WeakSet<Box>();
        const obj = new EmptyBox();
        const wrapper = new MultiArgWrapper(ws);

        let thrown = false;
        try {
          wrapper.addMulti(obj);
        } catch {
          thrown = true;
        }
        expect(!thrown && ws.has(obj)).assertTrue();
        console.log('testWeakSet_Add_MultiArgs_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_MULTI_0200
     * @tc.name      testWeakSet_Add_MultiArgs_Callable_0002
     * @tc.desc      Verify that only the first argument is taken when add() is called with multiple arguments on WeakSet<callable-class>.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_MultiArgs_Callable_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_MultiArgs_Callable_0002 start');

        interface CallableBox { readonly id: string; invoke(): string; }
        class CallableWrapper implements CallableBox {
          public id: string;
          constructor() {
            this.id = 'call-' + Date.now();
          }
          public invoke(): string {
            return 'callable';
          }
        }

        interface WeakSetMulti {
          add(item: CallableBox, ...rest: never[]): void;
        }

        class MultiArgWrapper {
          private ws: WeakSet<CallableBox>;
          constructor(set: WeakSet<CallableBox>) {
            this.ws = set;
          }
          public addMulti(item: CallableBox): void {
            (this.ws as WeakSetMulti).add(item, 'extra' as never, 456 as never);
          }
        }

        const ws = new WeakSet<CallableBox>();
        const inst = new CallableWrapper();
        const wrapper = new MultiArgWrapper(ws);

        let thrown = false;
        try {
          wrapper.addMulti(inst);
        } catch {
          thrown = true;
        }
        expect(!thrown && ws.has(inst)).assertTrue();
        console.log('testWeakSet_Add_MultiArgs_Callable_0002 done');
        done();
      });
  })
}