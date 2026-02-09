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

export default function keyedCollections_19Test() {
  describe('keyedCollections_19Test', () => {
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
     * @tc.number    SUB_ARK_WEAKSET_ADD_MULTI_0300
     * @tc.name      testWeakSet_Add_MultiArgs_Promise_0003
     * @tc.desc      Verify that only the first argument is taken when add() is called with multiple arguments on WeakSet<Promise-like>.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_MultiArgs_Promise_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_MultiArgs_Promise_0003 start');

        interface PromiseLikeBox { readonly id: string; then(): void; }
        class PromiseLikeWrapper implements PromiseLikeBox {
          public id: string;
          constructor() {
            this.id = 'promise-' + Date.now();
          }
          public then(): void {

          }
        }


        interface WeakSetMulti {
          add(item: PromiseLikeBox, ...rest: never[]): void;
        }


        class MultiArgWrapper {
          private ws: WeakSet<PromiseLikeBox>;
          constructor(set: WeakSet<PromiseLikeBox>) {
            this.ws = set;
          }

          public addMulti(item: PromiseLikeBox): void {

            const dummyObj = new PromiseLikeWrapper();
            const dummyArr: number[] = [];
            (this.ws as WeakSetMulti).add(item, dummyObj as never, dummyArr as never);
          }
        }

        const ws = new WeakSet<PromiseLikeBox>();
        const inst = new PromiseLikeWrapper();
        const wrapper = new MultiArgWrapper(ws);

        let thrown = false;
        try {
          wrapper.addMulti(inst);
        } catch {
          thrown = true;
        }
        expect(!thrown && ws.has(inst)).assertTrue();
        console.log('testWeakSet_Add_MultiArgs_Promise_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_MULTI_0400
     * @tc.name      testWeakSet_Add_MultiArgs_Nullable_0004
     * @tc.desc      Verify that only the first argument is taken when add() is called with multiple arguments on WeakSet<nullable-class>.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_MultiArgs_Nullable_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_MultiArgs_Nullable_0004 start');

        interface NullableBox { readonly id: string; value: string | null; }
        class NullableWrapper implements NullableBox {
          public id: string;
          public value: string | null;
          constructor(v: string | null) {
            this.id = 'nullable-' + Date.now();
            this.value = v;
          }
        }

        interface WeakSetMulti {
          add(item: NullableBox, ...rest: never[]): void;
        }

        class MultiArgWrapper {
          private ws: WeakSet<NullableBox>;
          constructor(set: WeakSet<NullableBox>) {
            this.ws = set;
          }
          public addMulti(item: NullableBox): void {
            (this.ws as WeakSetMulti).add(item, null as never, undefined as never);
          }
        }

        const ws = new WeakSet<NullableBox>();
        const inst = new NullableWrapper('arkts');
        const wrapper = new MultiArgWrapper(ws);

        let thrown = false;
        try {
          wrapper.addMulti(inst);
        } catch {
          thrown = true;
        }
        expect(!thrown && ws.has(inst)).assertTrue();
        console.log('testWeakSet_Add_MultiArgs_Nullable_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_MULTI_0500
     * @tc.name      testWeakSet_Add_MultiArgs_Array_0005
     * @tc.desc      Verify that only the first argument is taken when add() is called with multiple arguments on WeakSet<array-class>.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_MultiArgs_Array_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_MultiArgs_Array_0005 start');

        interface ArrayBox { readonly id: string; items: number[]; }
        class ArrayWrapper implements ArrayBox {
          public id: string;
          public items: number[];
          constructor(arr: number[]) {
            this.id = 'arr-' + Date.now();
            this.items = arr;
          }
        }

        interface WeakSetMulti {
          add(item: ArrayBox, ...rest: never[]): void;
        }

        class MultiArgWrapper {
          private ws: WeakSet<ArrayBox>;
          constructor(set: WeakSet<ArrayBox>) {
            this.ws = set;
          }
          public addMulti(item: ArrayBox): void {
            (this.ws as WeakSetMulti).add(item, [4, 5] as never, 'extra' as never);
          }
        }

        const ws = new WeakSet<ArrayBox>();
        const inst = new ArrayWrapper([1, 2, 3]);
        const wrapper = new MultiArgWrapper(ws);

        let thrown = false;
        try {
          wrapper.addMulti(inst);
        } catch {
          thrown = true;
        }
        expect(!thrown && ws.has(inst)).assertTrue();
        console.log('testWeakSet_Add_MultiArgs_Array_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_HAS_NON_OBJ_0100
     * @tc.name      testWeakSet_Has_StringWrapped_0001
     * @tc.desc      Verify that has() returns false and does not throw when passed a string-wrapped instance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Has_StringWrapped_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Has_StringWrapped_0001 start');

        interface StrBox { readonly id: string; value: string; }
        class StrWrapper implements StrBox {
          public id: string;
          public value: string;
          constructor(v: string) {
            this.id = 'str-' + Date.now();
            this.value = v;
          }
        }

        const ws = new WeakSet<StrBox>();
        const inst = new StrWrapper('arkts');
        ws.add(inst);

        let thrown = false;
        let result = false;
        try {

          const probe = new StrWrapper('probe');
          result = ws.has(probe);
        } catch {
          thrown = true;
        }
        expect(!thrown && !result).assertTrue();
        console.log('testWeakSet_Has_StringWrapped_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_HAS_NON_OBJ_0200
     * @tc.name      testWeakSet_Has_NumberWrapped_0002
     * @tc.desc      Verify that has() returns false and does not throw when passed a number-wrapped instance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Has_NumberWrapped_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Has_NumberWrapped_0002 start');

        interface NumBox { readonly id: string; value: number; }
        class NumWrapper implements NumBox {
          public id: string;
          public value: number;
          constructor(v: number) {
            this.id = 'num-' + Date.now();
            this.value = v;
          }
        }

        const ws = new WeakSet<NumBox>();
        const inst = new NumWrapper(42);
        ws.add(inst);

        let thrown = false;
        let result = false;
        try {
          const probe = new NumWrapper(999);
          result = ws.has(probe);
        } catch {
          thrown = true;
        }
        expect(!thrown && !result).assertTrue();
        console.log('testWeakSet_Has_NumberWrapped_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_HAS_NON_OBJ_0300
     * @tc.name      testWeakSet_Has_BoolWrapped_0003
     * @tc.desc      Verify that has() returns false and does not throw when passed a boolean-wrapped instance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Has_BoolWrapped_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Has_BoolWrapped_0003 start');

        interface BoolBox { readonly id: string; value: boolean; }
        class BoolWrapper implements BoolBox {
          public id: string;
          public value: boolean;
          constructor(v: boolean) {
            this.id = 'bool-' + Date.now();
            this.value = v;
          }
        }

        const ws = new WeakSet<BoolBox>();
        const inst = new BoolWrapper(true);
        ws.add(inst);

        let thrown = false;
        let result = false;
        try {
          const probe = new BoolWrapper(false);
          result = ws.has(probe);
        } catch {
          thrown = true;
        }
        expect(!thrown && !result).assertTrue();
        console.log('testWeakSet_Has_BoolWrapped_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_HAS_NON_OBJ_0400
     * @tc.name      testWeakSet_Has_BigIntWrapped_0004
     * @tc.desc      Verify that has() returns false and does not throw when passed a bigint-wrapped instance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Has_BigIntWrapped_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Has_BigIntWrapped_0004 start');

        interface BigBox { readonly id: string; value: bigint; }
        class BigWrapper implements BigBox {
          public id: string;
          public value: bigint;
          constructor(v: bigint) {
            this.id = 'bi-' + Date.now();
            this.value = v;
          }
        }

        const ws = new WeakSet<BigBox>();
        const inst = new BigWrapper(BigInt(123));
        ws.add(inst);

        let thrown = false;
        let result = false;
        try {
          const probe = new BigWrapper(BigInt(999));
          result = ws.has(probe);
        } catch {
          thrown = true;
        }
        expect(!thrown && !result).assertTrue();
        console.log('testWeakSet_Has_BigIntWrapped_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_HAS_NON_OBJ_0500
     * @tc.name      testWeakSet_Has_UndefinedBox_0005
     * @tc.desc      Verify that has() returns false and does not throw when passed an undefined-wrapped instance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Has_UndefinedBox_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Has_UndefinedBox_0005 start');

        interface UndefBox { readonly id: string; value: string | undefined; }
        class UndefWrapper implements UndefBox {
          public id: string;
          public value: string | undefined;
          constructor(v?: string) {
            this.id = 'undef-' + Date.now();
            this.value = v;
          }
        }

        const ws = new WeakSet<UndefBox>();
        const inst = new UndefWrapper('arkts');
        ws.add(inst);

        let thrown = false;
        let result = false;
        try {
          const probe = new UndefWrapper(undefined);
          result = ws.has(probe);
        } catch {
          thrown = true;
        }
        expect(!thrown && !result).assertTrue();
        console.log('testWeakSet_Has_UndefinedBox_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_HAS_NON_OBJ_0600
     * @tc.name      testWeakSet_Has_CallableWrapped_0006
     * @tc.desc      Verify that has() returns false and does not throw when passed a callable-class instance which is not in the set.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Has_CallableWrapped_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Has_CallableWrapped_0006 start');

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
        const inst = new CallableWrapper();
        ws.add(inst);

        let thrown = false;
        let result = false;
        try {
          const probe = new CallableWrapper();
          result = ws.has(probe);
        } catch {
          thrown = true;
        }
        expect(!thrown && !result).assertTrue();
        console.log('testWeakSet_Has_CallableWrapped_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_DELETE_NON_OBJ_0100
     * @tc.name      testWeakSet_Delete_NumberWrapped_0001
     * @tc.desc      Verify that delete() returns false and does not throw when passed a number-wrapped instance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Delete_NumberWrapped_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Delete_NumberWrapped_0001 start');

        interface NumBox { readonly id: string; value: number; }
        class NumWrapper implements NumBox {
          public id: string;
          public value: number;
          constructor(v: number) {
            this.id = 'num-' + Date.now();
            this.value = v;
          }
        }

        const ws = new WeakSet<NumBox>();
        const inst = new NumWrapper(42);
        ws.add(inst);

        let thrown = false;
        let result = false;
        try {
          const probe = new NumWrapper(999);
          result = ws.delete(probe);
        } catch {
          thrown = true;
        }
        expect(!thrown && !result).assertTrue();
        console.log('testWeakSet_Delete_NumberWrapped_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_DELETE_NON_OBJ_0200
     * @tc.name      testWeakSet_Delete_StringWrapped_0002
     * @tc.desc      Verify that delete() returns false and does not throw when passed a string-wrapped instance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Delete_StringWrapped_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Delete_StringWrapped_0002 start');

        interface StrBox { readonly id: string; value: string; }
        class StrWrapper implements StrBox {
          public id: string;
          public value: string;
          constructor(v: string) {
            this.id = 'str-' + Date.now();
            this.value = v;
          }
        }

        const ws = new WeakSet<StrBox>();
        const inst = new StrWrapper('arkts');
        ws.add(inst);

        let thrown = false;
        let result = false;
        try {
          const probe = new StrWrapper('probe');
          result = ws.delete(probe);
        } catch {
          thrown = true;
        }
        expect(!thrown && !result).assertTrue();
        console.log('testWeakSet_Delete_StringWrapped_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_DELETE_NON_OBJ_0300
     * @tc.name      testWeakSet_Delete_BoolWrapped_0003
     * @tc.desc      Verify that delete() returns false and does not throw when passed a boolean-wrapped instance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Delete_BoolWrapped_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Delete_BoolWrapped_0003 start');

        interface BoolBox { readonly id: string; value: boolean; }
        class BoolWrapper implements BoolBox {
          public id: string;
          public value: boolean;
          constructor(v: boolean) {
            this.id = 'bool-' + Date.now();
            this.value = v;
          }
        }

        const ws = new WeakSet<BoolBox>();
        const inst = new BoolWrapper(true);
        ws.add(inst);

        let thrown = false;
        let result = false;
        try {
          const probe = new BoolWrapper(false);
          result = ws.delete(probe);
        } catch {
          thrown = true;
        }
        expect(!thrown && !result).assertTrue();
        console.log('testWeakSet_Delete_BoolWrapped_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_DELETE_NON_OBJ_0400
     * @tc.name      testWeakSet_Delete_BigIntWrapped_0004
     * @tc.desc      Verify that delete() returns false and does not throw when passed a bigint-wrapped instance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Delete_BigIntWrapped_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Delete_BigIntWrapped_0004 start');

        interface BigBox { readonly id: string; value: bigint; }
        class BigWrapper implements BigBox {
          public id: string;
          public value: bigint;
          constructor(v: bigint) {
            this.id = 'bi-' + Date.now();
            this.value = v;
          }
        }

        const ws = new WeakSet<BigBox>();
        const inst = new BigWrapper(BigInt(123));
        ws.add(inst);

        let thrown = false;
        let result = false;
        try {
          const probe = new BigWrapper(BigInt(999));
          result = ws.delete(probe);
        } catch {
          thrown = true;
        }
        expect(!thrown && !result).assertTrue();
        console.log('testWeakSet_Delete_BigIntWrapped_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_DELETE_NON_OBJ_0500
     * @tc.name      testWeakSet_Delete_UndefinedBox_0005
     * @tc.desc      Verify that delete() returns false and does not throw when passed an undefined-wrapped instance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Delete_UndefinedBox_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Delete_UndefinedBox_0005 start');

        interface UndefBox { readonly id: string; value: string | undefined; }
        class UndefWrapper implements UndefBox {
          public id: string;
          public value: string | undefined;
          constructor(v?: string) {
            this.id = 'undef-' + Date.now();
            this.value = v;
          }
        }

        const ws = new WeakSet<UndefBox>();
        const inst = new UndefWrapper('arkts');
        ws.add(inst);

        let thrown = false;
        let result = false;
        try {
          const probe = new UndefWrapper(undefined);
          result = ws.delete(probe);
        } catch {
          thrown = true;
        }
        expect(!thrown && !result).assertTrue();
        console.log('testWeakSet_Delete_UndefinedBox_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_DELETE_NON_OBJ_0600
     * @tc.name      testWeakSet_Delete_CallableWrapped_0006
     * @tc.desc      Verify that delete() returns false and does not throw when passed a callable-class instance which is not in the set.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Delete_CallableWrapped_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Delete_CallableWrapped_0006 start');

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
        const inst = new CallableWrapper();
        ws.add(inst);

        let thrown = false;
        let result = false;
        try {
          const probe = new CallableWrapper();
          result = ws.delete(probe);
        } catch {
          thrown = true;
        }
        expect(!thrown && !result).assertTrue();
        console.log('testWeakSet_Delete_CallableWrapped_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_WRAPPER_0100
     * @tc.name      testWeakSet_Add_NumberWrapper_0001
     * @tc.desc      Verify that adding a Number-wrapper instance succeeds and is retrievable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_NumberWrapper_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_NumberWrapper_0001 start');

        interface NumBox { readonly id: string; value: number; }
        class NumWrapper implements NumBox {
          public id: string;
          public value: number;
          constructor(v: number) {
            this.id = 'num-' + Date.now();
            this.value = v;
          }
        }

        const ws = new WeakSet<NumBox>();
        const inst = new NumWrapper(123);

        let thrown = false;
        try {
          ws.add(inst);
        } catch {
          thrown = true;
        }
        expect(!thrown && ws.has(inst)).assertTrue();
        console.log('testWeakSet_Add_NumberWrapper_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_WRAPPER_0200
     * @tc.name      testWeakSet_Add_StringWrapper_0002
     * @tc.desc      Verify that adding a String-wrapper instance succeeds and is retrievable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_StringWrapper_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_StringWrapper_0002 start');

        interface StrBox { readonly id: string; value: string; }
        class StrWrapper implements StrBox {
          public id: string;
          public value: string;
          constructor(v: string) {
            this.id = 'str-' + Date.now();
            this.value = v;
          }
        }

        const ws = new WeakSet<StrBox>();
        const inst = new StrWrapper('arkts');

        let thrown = false;
        try {
          ws.add(inst);
        } catch {
          thrown = true;
        }
        expect(!thrown && ws.has(inst)).assertTrue();
        console.log('testWeakSet_Add_StringWrapper_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_WRAPPER_0300
     * @tc.name      testWeakSet_Add_BoolWrapper_0003
     * @tc.desc      Verify that adding a Boolean-wrapper instance succeeds and is retrievable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_BoolWrapper_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_BoolWrapper_0003 start');

        interface BoolBox { readonly id: string; value: boolean; }
        class BoolWrapper implements BoolBox {
          public id: string;
          public value: boolean;
          constructor(v: boolean) {
            this.id = 'bool-' + Date.now();
            this.value = v;
          }
        }

        const ws = new WeakSet<BoolBox>();
        const inst = new BoolWrapper(true);

        let thrown = false;
        try {
          ws.add(inst);
        } catch {
          thrown = true;
        }
        expect(!thrown && ws.has(inst)).assertTrue();
        console.log('testWeakSet_Add_BoolWrapper_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_WRAPPER_0400
     * @tc.name      testWeakSet_Add_BigIntWrapper_0004
     * @tc.desc      Verify that adding a BigInt-wrapper instance succeeds and is retrievable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_BigIntWrapper_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_BigIntWrapper_0004 start');

        interface BigBox { readonly id: string; value: bigint; }
        class BigWrapper implements BigBox {
          public id: string;
          public value: bigint;
          constructor(v: bigint) {
            this.id = 'bi-' + Date.now();
            this.value = v;
          }
        }

        const ws = new WeakSet<BigBox>();
        const inst = new BigWrapper(BigInt(123));

        let thrown = false;
        try {
          ws.add(inst);
        } catch {
          thrown = true;
        }
        expect(!thrown && ws.has(inst)).assertTrue();
        console.log('testWeakSet_Add_BigIntWrapper_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_WRAPPER_0500
     * @tc.name      testWeakSet_Add_DateWrapper_0005
     * @tc.desc      Verify that adding a Date-wrapper instance succeeds and is retrievable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_DateWrapper_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_DateWrapper_0005 start');

        interface DateBox { readonly id: string; value: Date; }
        class DateWrapper implements DateBox {
          public id: string;
          public value: Date;
          constructor(v: Date) {
            this.id = 'date-' + Date.now();
            this.value = v;
          }
        }

        const ws = new WeakSet<DateBox>();
        const inst = new DateWrapper(new Date());

        let thrown = false;
        try {
          ws.add(inst);
        } catch {
          thrown = true;
        }
        expect(!thrown && ws.has(inst)).assertTrue();
        console.log('testWeakSet_Add_DateWrapper_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ADD_WRAPPER_0600
     * @tc.name      testWeakSet_Add_RegexWrapper_0006
     * @tc.desc      Verify that adding a RegExp-wrapper instance succeeds and is retrievable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakSet_Add_RegexWrapper_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakSet_Add_RegexWrapper_0006 start');

        interface RegexBox { readonly id: string; pattern: RegExp; }
        class RegexWrapper implements RegexBox {
          public id: string;
          public pattern: RegExp;
          constructor(p: RegExp) {
            this.id = 'regex-' + Date.now();
            this.pattern = p;
          }
        }

        const ws = new WeakSet<RegexBox>();
        const inst = new RegexWrapper(/arkts\d+/i);

        let thrown = false;
        try {
          ws.add(inst);
        } catch {
          thrown = true;
        }
        expect(!thrown && ws.has(inst)).assertTrue();
        console.log('testWeakSet_Add_RegexWrapper_0006 done');
        done();
      });
  })
}