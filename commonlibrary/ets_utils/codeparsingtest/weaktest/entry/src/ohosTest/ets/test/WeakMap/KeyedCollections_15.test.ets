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

export default function keyedCollections_15Test() {
  describe('keyedCollections_15Test', () => {
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
     * @tc.number    SUB_ARK_WEAKMAP_SYMBOL_KEY_0400
     * @tc.name      testWeakMap_SymbolLike_Key_0004
     * @tc.desc      Verify that an exception is thrown when a "Symbol-like" string unique ID (UUID) is used as a key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_SymbolLike_Key_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_SymbolLike_Key_0004 start');

        interface ValueType { data: string; }
        class Box {
          public id: string;
          constructor(id: string) {
            this.id = id;
          }
        }
        const wm = new WeakMap<Box, ValueType>();

        let thrown = false;
        try {

          const uuid = 'xxxx-xxxx-4xxx-yxxx-xxxx'.replace(/[xy]/g, c => (Math.random() * 16 | 0).toString(16));
          wm.set(new Box(uuid), { data: 'value10' });
        } catch {
          thrown = true;
        }

        expect(thrown).assertFalse();
        console.log('testWeakMap_SymbolLike_Key_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SYMBOL_KEY_0500
     * @tc.name      testWeakMap_SymbolLike_Key_0005
     * @tc.desc      Verify that an exception is thrown when a "Symbol-like" string unique ID (incremental sequence) is used as a key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_SymbolLike_Key_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_SymbolLike_Key_0005 start');

        interface ValueType { data: string; }
        class Box {
          public id: string;
          constructor(id: string) {
            this.id = id;
          }
        }
        const wm = new WeakMap<Box, ValueType>();

        let thrown = false;
        try {

          const seq = 'seq-' + (Math.random() * 1e9 | 0);
          wm.set(new Box(seq), { data: 'value10' });
        } catch {
          thrown = true;
        }

        expect(thrown).assertFalse();
        console.log('testWeakMap_SymbolLike_Key_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SYMBOL_KEY_0600
     * @tc.name      testWeakMap_SymbolLike_Key_0006
     * @tc.desc      Verify that an exception is thrown when a "Symbol-like" string unique ID (hash string) is used as a key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testWeakMap_SymbolLike_Key_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testWeakMap_SymbolLike_Key_0006 start');

        interface ValueType { data: string; }
        class Box {
          public id: string;
          constructor(id: string) {
            this.id = id;
          }
        }
        const wm = new WeakMap<Box, ValueType>();

        let thrown = false;
        try {

          const hash = 'hash-' + (Math.random() * 1e18).toString(36);
          wm.set(new Box(hash), { data: 'value10' });
        } catch {
          thrown = true;
        }

        expect(thrown).assertFalse();
        console.log('testWeakMap_SymbolLike_Key_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_SET_DIFF_0100
     * @tc.name      test_WeakSet_Set_Diff_Basic_0001
     * @tc.desc      Verify that after a strong reference is set to null, the WeakSet value is reclaimed while the Set value is retained
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_Set_Diff_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_Set_Diff_Basic_0001 start');

        interface ValueType { id: number; }
        const ws = new WeakSet<ValueType>();
        const set = new Set<ValueType>();

        let val: ValueType | null = { id: 11 };
        ws.add(val);
        set.add(val);
        val = null;

        setTimeout(() => {
          const actual = !ws.has(val!) && set.size === 1;
          expect(actual).assertTrue();
          console.log('test_WeakSet_Set_Diff_Basic_0001 done');
          done();
        }, 100);
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_SET_DIFF_0200
     * @tc.name      test_WeakSet_Set_Diff_Multi_0002
     * @tc.desc      Verify that in a multi-value scenario, only the WeakSet value whose strong reference is set to null is reclaimed, while Set values are retained
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_Set_Diff_Multi_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_Set_Diff_Multi_0002 start');

        interface ValueType { id: number; }
        const ws = new WeakSet<ValueType>();
        const set = new Set<ValueType>();

        let v1: ValueType | null = { id: 2 };
        let v2: ValueType | null = { id: 3 };
        ws.add(v1);
        ws.add(v2);
        set.add(v1);
        set.add(v2);
        v1 = null;

        setTimeout(() => {
          const actual = !ws.has(v1!) && ws.has(v2!) && set.size === 2;
          expect(actual).assertTrue();
          console.log('test_WeakSet_Set_Diff_Multi_0002 done');
          done();
        }, 100);
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_SET_DIFF_0300
     * @tc.name      test_WeakSet_Set_Diff_ArrayVal_0003
     * @tc.desc      Verify that in an array-value scenario, the WeakSet value is reclaimed while the Set value is retained
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_Set_Diff_ArrayVal_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_Set_Diff_ArrayVal_0003 start');

        interface ValueArray extends Array<number> {}
        const ws = new WeakSet<ValueArray>();
        const set = new Set<ValueArray>();

        let arr: ValueArray | null = [1, 2, 3];
        ws.add(arr);
        set.add(arr);
        arr = null;

        setTimeout(() => {
          const actual = !ws.has(arr!) && set.size === 1;
          expect(actual).assertTrue();
          console.log('test_WeakSet_Set_Diff_ArrayVal_0003 done');
          done();
        }, 100);
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_SET_DIFF_0400
     * @tc.name      test_WeakSet_Set_Diff_MapVal_0004
     * @tc.desc      Verify that in a Map-value scenario, the WeakSet value is reclaimed while the Set value is retaine
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_Set_Diff_MapVal_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_Set_Diff_MapVal_0004 start');

        interface ValueMap extends Map<string, number> {}
        const ws = new WeakSet<ValueMap>();
        const set = new Set<ValueMap>();

        let map: ValueMap | null = new Map([['k', 4]]);
        ws.add(map);
        set.add(map);
        map = null;

        setTimeout(() => {
          const actual = !ws.has(map!) && set.size === 1;
          expect(actual).assertTrue();
          console.log('test_WeakSet_Set_Diff_MapVal_0004 done');
          done();
        }, 100);
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_SET_DIFF_0500
     * @tc.name      test_WeakSet_Set_Diff_SetVal_0005
     * @tc.desc      Verify that in a Set-value scenario, the WeakSet value is reclaimed while the Set value is retained
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_Set_Diff_SetVal_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_Set_Diff_SetVal_0005 start');

        interface ValueSet extends Set<number> {}
        const ws = new WeakSet<ValueSet>();
        const set = new Set<ValueSet>();

        let setVal: ValueSet | null = new Set([5, 6, 7]);
        ws.add(setVal);
        set.add(setVal);
        setVal = null;

        setTimeout(() => {
          const actual = !ws.has(setVal!) && set.size === 1;
          expect(actual).assertTrue();
          console.log('test_WeakSet_Set_Diff_SetVal_0005 done');
          done();
        }, 100);
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_SET_DIFF_0600
     * @tc.name      test_WeakSet_Set_Diff_CallableClass_0006
     * @tc.desc      Verify that in a "callable class" instance-value scenario, the WeakSet value is reclaimed while the Set value is retained
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_Set_Diff_CallableClass_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_Set_Diff_CallableClass_0006 start');

        interface CallableValue {
          invoke: () => string;
        }
        class MockCallable implements CallableValue {
          public invoke: () => string;
          constructor() {
            this.invoke = () => 'callable';
          }
        }

        const ws = new WeakSet<CallableValue>();
        const set = new Set<CallableValue>();

        let val: CallableValue | null = new MockCallable();
        ws.add(val);
        set.add(val);
        val = null;

        setTimeout(() => {
          const actual = !ws.has(val!) && set.size === 1;
          expect(actual).assertTrue();
          console.log('test_WeakSet_Set_Diff_CallableClass_0006 done');
          done();
        }, 100);
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_VALUE_STRONG_0100
     * @tc.name      test_WeakSet_ValueStrong_Basic_0001
     * @tc.desc      Verify that when an external strong reference to the value exists, the value remains accessible after its key is reclaimed (WeakSet does not reclaim it)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_ValueStrong_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_ValueStrong_Basic_0001 start');

        interface ValueType { id: number; }
        const ws = new WeakSet<ValueType>();

        let val: ValueType | null = { id: 12 };
        const ref: ValueType = val;
        ws.add(val);
        val = null;

        setTimeout(() => {
          const result = ws.has(ref);
          expect(result).assertTrue();
          console.log('test_WeakSet_ValueStrong_Basic_0001 done');
          done();
        }, 100);
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_VALUE_STRONG_0200
     * @tc.name      test_WeakSet_ValueStrong_Array_0002
     * @tc.desc      Verify that when an external strong reference to an array value exists, the value remains accessible after its key is reclaimed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_ValueStrong_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_ValueStrong_Array_0002 start');

        interface ValueArray extends Array<number> {}
        const ws = new WeakSet<ValueArray>();

        let arr: ValueArray | null = [1, 2, 3];
        const copy: ValueArray = arr;
        ws.add(arr);
        arr = null;

        setTimeout(() => {
          const result = ws.has(copy);
          expect(result).assertTrue();
          console.log('test_WeakSet_ValueStrong_Array_0002 done');
          done();
        }, 100);
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_VALUE_STRONG_0300
     * @tc.name      test_WeakSet_ValueStrong_Map_0003
     * @tc.desc      Verify that when an external strong reference to a Map value exists, the value remains accessible after its key is reclaimed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_ValueStrong_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_ValueStrong_Map_0003 start');

        interface ValueMap extends Map<string, number> {}
        const ws = new WeakSet<ValueMap>();

        let map: ValueMap | null = new Map([['k', 3]]);
        const copy: ValueMap = map;
        ws.add(map);
        map = null;

        setTimeout(() => {
          const result = ws.has(copy);
          expect(result).assertTrue();
          console.log('test_WeakSet_ValueStrong_Map_0003 done');
          done();
        }, 100);
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_VALUE_STRONG_0400
     * @tc.name      test_WeakSet_ValueStrong_Set_0004
     * @tc.desc      Verify that when an external strong reference to a Set value exists, the value remains accessible after its key is reclaimed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_ValueStrong_Set_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_ValueStrong_Set_0004 start');

        interface ValueSet extends Set<number> {}
        const ws = new WeakSet<ValueSet>();

        let setVal: ValueSet | null = new Set([4, 5, 6]);
        const copy: ValueSet = setVal;
        ws.add(setVal);
        setVal = null;

        setTimeout(() => {
          const result = ws.has(copy);
          expect(result).assertTrue();
          console.log('test_WeakSet_ValueStrong_Set_0004 done');
          done();
        }, 100);
      });
    /**
     * @tc.number    SUB_ARK_WEAKSET_VALUE_STRONG_0500
     * @tc.name      test_WeakSet_ValueStrong_MultiRef_0005
     * @tc.desc      Verify that when multiple external strong references exist, the WeakSet value is not reclaimed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_ValueStrong_MultiRef_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_ValueStrong_MultiRef_0005 start');

        interface ValueType { id: number; }
        const ws = new WeakSet<ValueType>();

        let val: ValueType | null = { id: 5 };
        const ref1: ValueType = val;
        const ref2: ValueType = val;
        ws.add(val);
        val = null;

        setTimeout(() => {
          const actual = ws.has(ref1) && ws.has(ref2);
          expect(actual).assertTrue();
          console.log('test_WeakSet_ValueStrong_MultiRef_0005 done');
          done();
        }, 100);
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_VALUE_STRONG_0600
     * @tc.name      test_WeakSet_ValueStrong_CallableClass_0006
     * @tc.desc      Verify that when an external strong reference to a "callable class" instance value exists, the WeakSet value remains accessibl
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_ValueStrong_CallableClass_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_ValueStrong_CallableClass_0006 start');

        interface CallableValue {
          invoke: () => string;
        }
        class MockCallable implements CallableValue {
          public invoke: () => string;
          constructor() {
            this.invoke = () => 'callable';
          }
        }

        const ws = new WeakSet<CallableValue>();
        let val: CallableValue | null = new MockCallable();
        const ref: CallableValue = val;
        ws.add(val);
        val = null;

        setTimeout(() => {
          const result = ws.has(ref) && ref.invoke() === 'callable';
          expect(result).assertTrue();
          console.log('test_WeakSet_ValueStrong_CallableClass_0006 done');
          done();
        }, 100);
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_DEDUP_0100
     * @tc.name      test_WeakSet_Dedup_Basic_0001
     * @tc.desc      Verify that adding the same object to a WeakSet multiple times retains only one occurrence (basic object).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_Dedup_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_Dedup_Basic_0001 start');

        interface ValueType { id: number; }
        const ws = new WeakSet<ValueType>();

        const val: ValueType = { id: 13 };
        ws.add(val);
        ws.add(val);

        const result = ws.has(val);
        expect(result).assertTrue();
        console.log('test_WeakSet_Dedup_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_DEDUP_0200
     * @tc.name      test_WeakSet_Dedup_Array_0002
     * @tc.desc      Verify that adding the same array object to a WeakSet multiple times retains only one occurrence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_Dedup_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_Dedup_Array_0002 start');

        interface ValueArray extends Array<number> {}
        const ws = new WeakSet<ValueArray>();

        const arr: ValueArray = [1, 2, 3];
        ws.add(arr);
        ws.add(arr);

        const result = ws.has(arr);
        expect(result).assertTrue();
        console.log('test_WeakSet_Dedup_Array_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_DEDUP_0300
     * @tc.name      test_WeakSet_Dedup_Map_0003
     * @tc.desc      Verify that adding the same Map object to a WeakSet multiple times retains only one occurrence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_Dedup_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_Dedup_Map_0003 start');

        interface ValueMap extends Map<string, number> {}
        const ws = new WeakSet<ValueMap>();

        const map: ValueMap = new Map([['k', 3]]);
        ws.add(map);
        ws.add(map);

        const result = ws.has(map);
        expect(result).assertTrue();
        console.log('test_WeakSet_Dedup_Map_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_DEDUP_0400
     * @tc.name      test_WeakSet_Dedup_Set_0004
     * @tc.desc      Verify that adding the same Set object to a WeakSet multiple times retains only one occurrence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_Dedup_Set_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_Dedup_Set_0004 start');

        interface ValueSet extends Set<number> {}
        const ws = new WeakSet<ValueSet>();

        const setVal: ValueSet = new Set([4, 5, 6]);
        ws.add(setVal);
        ws.add(setVal);

        const result = ws.has(setVal);
        expect(result).assertTrue();
        console.log('test_WeakSet_Dedup_Set_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_DEDUP_0500
     * @tc.name      test_WeakSet_Dedup_MultiRef_0005
     * @tc.desc      Verify that when multiple references point to the same object, adding it repeatedly to a WeakSet retains only one occurrence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_Dedup_MultiRef_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_Dedup_MultiRef_0005 start');

        interface ValueType { id: number; }
        const ws = new WeakSet<ValueType>();

        const val: ValueType = { id: 5 };
        const ref1: ValueType = val;
        const ref2: ValueType = val;
        ws.add(ref1);
        ws.add(ref2);

        const result = ws.has(val);
        expect(result).assertTrue();
        console.log('test_WeakSet_Dedup_MultiRef_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_DEDUP_0600
     * @tc.name      test_WeakSet_Dedup_CallableClass_0006
     * @tc.desc      Verify that adding the same "callable class" instance to a WeakSet multiple times retains only one occurrence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_Dedup_CallableClass_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_Dedup_CallableClass_0006 start');

        interface CallableValue {
          invoke: () => string;
        }
        class MockCallable implements CallableValue {
          public invoke: () => string;
          constructor() {
            this.invoke = () => 'callable';
          }
        }

        const ws = new WeakSet<CallableValue>();
        const val: CallableValue = new MockCallable();
        ws.add(val);
        ws.add(val);

        const result = ws.has(val);
        expect(result).assertTrue();
        console.log('test_WeakSet_Dedup_CallableClass_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_READD_0100
     * @tc.name      test_WeakSet_ReAdd_Basic_0001
     * @tc.desc      Verify that after the object is garbage-collected, a new object can be recreated and successfully re-added (basic object).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_ReAdd_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_ReAdd_Basic_0001 start');

        interface ValueType { id: number; }
        const ws = new WeakSet<ValueType>();

        let val: ValueType | null = { id: 14 };
        ws.add(val);
        val = null;

        setTimeout(() => {
          val = { id: 14 };
          ws.add(val);
          const result = ws.has(val);
          expect(result).assertTrue();
          console.log('test_WeakSet_ReAdd_Basic_0001 done');
          done();
        }, 100);
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_READD_0200
     * @tc.name      test_WeakSet_ReAdd_Array_0002
     * @tc.desc      Verify that after the array is garbage-collected, a new array can be recreated and successfully re-added.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_ReAdd_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_ReAdd_Array_0002 start');

        interface ValueArray extends Array<number> {}
        const ws = new WeakSet<ValueArray>();

        let arr: ValueArray | null = [1, 2, 3];
        ws.add(arr);
        arr = null;

        setTimeout(() => {
          arr = [1, 2, 3];
          ws.add(arr);
          const result = ws.has(arr);
          expect(result).assertTrue();
          console.log('test_WeakSet_ReAdd_Array_0002 done');
          done();
        }, 100);
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_READD_0300
     * @tc.name      test_WeakSet_ReAdd_Map_0003
     * @tc.desc      Verify that after the Map is garbage-collected, a new Map can be recreated and successfully re-added.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_ReAdd_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_ReAdd_Map_0003 start');

        interface ValueMap extends Map<string, number> {}
        const ws = new WeakSet<ValueMap>();

        let map: ValueMap | null = new Map([['k', 3]]);
        ws.add(map);
        map = null;

        setTimeout(() => {
          map = new Map([['k', 3]]);
          ws.add(map);
          const result = ws.has(map);
          expect(result).assertTrue();
          console.log('test_WeakSet_ReAdd_Map_0003 done');
          done();
        }, 100);
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_READD_0400
     * @tc.name      test_WeakSet_ReAdd_Set_0004
     * @tc.desc      Verify that after the Set is garbage-collected, a new Set can be recreated and successfully re-added.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_ReAdd_Set_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_ReAdd_Set_0004 start');

        interface ValueSet extends Set<number> {}
        const ws = new WeakSet<ValueSet>();

        let setVal: ValueSet | null = new Set([4, 5, 6]);
        ws.add(setVal);
        setVal = null;

        setTimeout(() => {
          setVal = new Set([4, 5, 6]);
          ws.add(setVal);
          const result = ws.has(setVal);
          expect(result).assertTrue();
          console.log('test_WeakSet_ReAdd_Set_0004 done');
          done();
        }, 100);
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_READD_0500
     * @tc.name      test_WeakSet_ReAdd_MultiRef_0005
     * @tc.desc      WeakSet readd multiRef test.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_ReAdd_MultiRef_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_ReAdd_MultiRef_0005 start');

        interface ValueType { id: number; }
        const ws = new WeakSet<ValueType>();

        let val: ValueType | null = { id: 5 };
        const ref1: ValueType = val;
        const ref2: ValueType = val;
        ws.add(ref1);
        val = null;
        ref1.id = 0;

        setTimeout(() => {
          const newVal: ValueType = { id: 5 };
          ws.add(newVal);
          const result = ws.has(newVal);
          expect(result).assertTrue();
          console.log('test_WeakSet_ReAdd_MultiRef_0005 done');
          done();
        }, 100);
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_READD_0600
     * @tc.name      test_WeakSet_ReAdd_CallableClass_0006
     * @tc.desc      Verify that after a “callable class” instance is garbage-collected, a new instance can be recreated and successfully re-added.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_ReAdd_CallableClass_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_ReAdd_CallableClass_0006 start');

        interface CallableValue {
          invoke: () => string;
        }
        class MockCallable implements CallableValue {
          public invoke: () => string;
          constructor() {
            this.invoke = () => 'callable';
          }
        }

        const ws = new WeakSet<CallableValue>();

        let val: CallableValue | null = new MockCallable();
        ws.add(val);
        val = null;

        setTimeout(() => {
          const newVal: CallableValue = new MockCallable();
          ws.add(newVal);
          const result = ws.has(newVal);
          expect(result).assertTrue();
          console.log('test_WeakSet_ReAdd_CallableClass_0006 done');
          done();
        }, 100);
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ARRAY_GC_0100
     * @tc.name      test_WeakSet_ArrayGC_Basic_0001
     * @tc.desc      Verify that a basic array is reclaimed by the WeakSet after its strong reference is removed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_ArrayGC_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_ArrayGC_Basic_0001 start');

        interface ValueArray extends Array<number> {}
        const ws = new WeakSet<ValueArray>();

        let arr: ValueArray | null = [15, 16];
        ws.add(arr);
        arr = null;

        setTimeout(() => {
          const result = !ws.has(arr!);
          expect(result).assertTrue();
          console.log('test_WeakSet_ArrayGC_Basic_0001 done');
          done();
        }, 100);
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ARRAY_GC_0200
     * @tc.name      test_WeakSet_ArrayGC_Nested_0002
     * @tc.desc      Verify that a nested array is reclaimed by the WeakSet after its strong reference is removed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_ArrayGC_Nested_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_ArrayGC_Nested_0002 start');

        interface NestedArray extends Array<number[]> {}
        const ws = new WeakSet<NestedArray>();

        let arr: NestedArray | null = [[1, 2], [3, 4]];
        ws.add(arr);
        arr = null;

        setTimeout(() => {
          const result = !ws.has(arr!);
          expect(result).assertTrue();
          console.log('test_WeakSet_ArrayGC_Nested_0002 done');
          done();
        }, 100);
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ARRAY_GC_0300
     * @tc.name      test_WeakSet_ArrayGC_ObjectItem_0003
     * @tc.desc      Verify that an array whose elements are objects is reclaimed by the WeakSet after its strong reference is removed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_ArrayGC_ObjectItem_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_ArrayGC_ObjectItem_0003 start');

        interface Item { id: number; }
        interface ObjectArray extends Array<Item> {}
        const ws = new WeakSet<ObjectArray>();

        let arr: ObjectArray | null = [{ id: 1 }, { id: 2 }];
        ws.add(arr);
        arr = null;

        setTimeout(() => {
          const result = !ws.has(arr!);
          expect(result).assertTrue();
          console.log('test_WeakSet_ArrayGC_ObjectItem_0003 done');
          done();
        }, 100);
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ARRAY_GC_0400
     * @tc.name      test_WeakSet_ArrayGC_MapItem_0004
     * @tc.desc      Verify that an array whose elements are Maps is reclaimed by the WeakSet after its strong reference is removed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_ArrayGC_MapItem_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_ArrayGC_MapItem_0004 start');

        interface ItemMap extends Map<string, number> {}
        interface MapArray extends Array<ItemMap> {}
        const ws = new WeakSet<MapArray>();

        let arr: MapArray | null = [new Map([['k', 3]])];
        ws.add(arr);
        arr = null;

        setTimeout(() => {
          const result = !ws.has(arr!);
          expect(result).assertTrue();
          console.log('test_WeakSet_ArrayGC_MapItem_0004 done');
          done();
        }, 100);
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ARRAY_GC_0500
     * @tc.name      test_WeakSet_ArrayGC_SetItem_0005
     * @tc.desc      Verify that an array whose elements are Sets is reclaimed by the WeakSet after its strong reference is removed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_ArrayGC_SetItem_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_ArrayGC_SetItem_0005 start');

        interface ItemSet extends Set<number> {}
        interface SetArray extends Array<ItemSet> {}
        const ws = new WeakSet<SetArray>();

        let arr: SetArray | null = [new Set([4, 5, 6])];
        ws.add(arr);
        arr = null;

        setTimeout(() => {
          const result = !ws.has(arr!);
          expect(result).assertTrue();
          console.log('test_WeakSet_ArrayGC_SetItem_0005 done');
          done();
        }, 100);
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ARRAY_GC_0600
     * @tc.name      test_WeakSet_ArrayGC_CallableClass_0006
     * @tc.desc      Verify that an array of “callable class” instances is reclaimed by the WeakSet after its strong reference is removed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_ArrayGC_CallableClass_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_ArrayGC_CallableClass_0006 start');

        interface CallableValue {
          invoke: () => string;
        }
        class MockCallable implements CallableValue {
          public invoke: () => string;
          constructor() {
            this.invoke = () => 'callable';
          }
        }
        interface CallableArray extends Array<CallableValue> {}
        const ws = new WeakSet<CallableArray>();

        let arr: CallableArray | null = [new MockCallable()];
        ws.add(arr);
        arr = null;

        setTimeout(() => {
          const result = !ws.has(arr!);
          expect(result).assertTrue();
          console.log('test_WeakSet_ArrayGC_CallableClass_0006 done');
          done();
        }, 100);
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_DEL_READD_0100
     * @tc.name      test_WeakSet_DelReAdd_Basic_0001
     * @tc.desc      Verify that a basic object can be successfully re-added after being deleted
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_DelReAdd_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_DelReAdd_Basic_0001 start');

        interface ValueType { id: number; }
        const ws = new WeakSet<ValueType>();

        const val: ValueType = { id: 17 };
        ws.add(val);
        ws.delete(val);
        ws.add(val);

        const result = ws.has(val);
        expect(result).assertTrue();
        console.log('test_WeakSet_DelReAdd_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_DEL_READD_0200
     * @tc.name      test_WeakSet_DelReAdd_Array_0002
     * @tc.desc      Verify that an array can be successfully re-added after being deleted
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_DelReAdd_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_DelReAdd_Array_0002 start');

        interface ValueArray extends Array<number> {}
        const ws = new WeakSet<ValueArray>();

        const arr: ValueArray = [17, 18];
        ws.add(arr);
        ws.delete(arr);
        ws.add(arr);

        const result = ws.has(arr);
        expect(result).assertTrue();
        console.log('test_WeakSet_DelReAdd_Array_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_DEL_READD_0300
     * @tc.name      test_WeakSet_DelReAdd_Map_0003
     * @tc.desc      Verify that a Set can be successfully re-added after being deleted
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_DelReAdd_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_DelReAdd_Map_0003 start');

        interface ValueMap extends Map<string, number> {}
        const ws = new WeakSet<ValueMap>();

        const map: ValueMap = new Map([['k', 3]]);
        ws.add(map);
        ws.delete(map);
        ws.add(map);

        const result = ws.has(map);
        expect(result).assertTrue();
        console.log('test_WeakSet_DelReAdd_Map_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_DEL_READD_0400
     * @tc.name      test_WeakSet_DelReAdd_Set_0004
     * @tc.desc      WeakSet and delete and Readd test.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_DelReAdd_Set_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_DelReAdd_Set_0004 start');

        interface ValueSet extends Set<number> {}
        const ws = new WeakSet<ValueSet>();

        const setVal: ValueSet = new Set([4, 5, 6]);
        ws.add(setVal);
        ws.delete(setVal);
        ws.add(setVal);

        const result = ws.has(setVal);
        expect(result).assertTrue();
        console.log('test_WeakSet_DelReAdd_Set_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_DEL_READD_0500
     * @tc.name      test_WeakSet_DelReAdd_MultiRef_0005
     * @tc.desc      object weakset and delete
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_DelReAdd_MultiRef_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_DelReAdd_MultiRef_0005 start');

        interface ValueType { id: number; }
        const ws = new WeakSet<ValueType>();

        const val: ValueType = { id: 5 };
        const ref1: ValueType = val;
        const ref2: ValueType = val;
        ws.add(ref1);
        ws.delete(ref2);
        ws.add(ref1);

        const result = ws.has(val);
        expect(result).assertTrue();
        console.log('test_WeakSet_DelReAdd_MultiRef_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_DEL_READD_0600
     * @tc.name      test_WeakSet_DelReAdd_CallableClass_0006
     * @tc.desc      Verify that a callable-class instance can be successfully re-added after being deleted
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_DelReAdd_CallableClass_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_DelReAdd_CallableClass_0006 start');

        interface CallableValue {
          invoke: () => string;
        }
        class MockCallable implements CallableValue {
          public invoke: () => string;
          constructor() {
            this.invoke = () => 'callable';
          }
        }

        const ws = new WeakSet<CallableValue>();
        const val: CallableValue = new MockCallable();
        ws.add(val);
        ws.delete(val);
        ws.add(val);

        const result = ws.has(val);
        expect(result).assertTrue();
        console.log('test_WeakSet_DelReAdd_CallableClass_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_WEAKSET_NULL_ADD_0100
     * @tc.name      test_WeakSet_NullAdd_Basic_0001
     * @tc.desc      Verify that adding null to WeakSet throws an exception (basic wrapper)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_NullAdd_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_NullAdd_Basic_0001 start');

        interface ValueType { id: number; }
        class NullBox {
          public tag: string;
          constructor() {
            this.tag = 'null';
          }
        }
        const ws = new WeakSet<NullBox>();

        let thrown = false;
        try {
          ws.add(new NullBox());
        } catch {
          thrown = true;
        }

        expect(thrown).assertFalse();
        console.log('test_WeakSet_NullAdd_Basic_0001 done');
        done();
      });


    /**
     * @tc.number    SUB_ARK_WEAKSET_NULL_ADD_0200
     * @tc.name      test_WeakSet_NullAdd_MapWrapper_0002
     * @tc.desc      Verify that adding null to WeakSet throws an exception (Map wrapper)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_NullAdd_MapWrapper_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_NullAdd_MapWrapper_0002 start');

        interface ValueMap extends Map<string, number> {}
        const ws = new WeakSet<ValueMap>();

        let thrown = false;
        try {
          ws.add(new Map());
        } catch {
          thrown = true;
        }

        expect(thrown).assertFalse();
        console.log('test_WeakSet_NullAdd_MapWrapper_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_NULL_ADD_0300
     * @tc.name      test_WeakSet_NullAdd_SetWrapper_0003
     * @tc.desc      Verify that adding null to WeakSet throws an exception (Set wrapper)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_NullAdd_SetWrapper_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_NullAdd_SetWrapper_0003 start');

        interface ValueSet extends Set<number> {}
        const ws = new WeakSet<ValueSet>();

        let thrown = false;
        try {
          ws.add(new Set());
        } catch {
          thrown = true;
        }

        expect(thrown).assertFalse();
        console.log('test_WeakSet_NullAdd_SetWrapper_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_NULL_ADD_0400
     * @tc.name      test_WeakSet_NullAdd_CallableWrapper_0004
     * @tc.desc      Verify that adding null to WeakSet throws an exception (callable class wrapper)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_NullAdd_CallableWrapper_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_NullAdd_CallableWrapper_0004 start');

        interface CallableValue {
          invoke: () => string;
        }
        class MockCallable implements CallableValue {
          public invoke: () => string;
          constructor() {
            this.invoke = () => 'callable';
          }
        }
        const ws = new WeakSet<CallableValue>();

        let thrown = false;
        try {
          ws.add(new MockCallable());
        } catch {
          thrown = true;
        }

        expect(thrown).assertFalse();
        console.log('test_WeakSet_NullAdd_CallableWrapper_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_NULL_ADD_0500
     * @tc.name      test_WeakSet_NullAdd_MultiWrapper_0005
     * @tc.desc      Verify that adding null to WeakSet throws an exception (multiple wrapper types)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_NullAdd_MultiWrapper_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_NullAdd_MultiWrapper_0005 start');

        interface ValueType { id: number; }
        class Box {
          public id: number;
          constructor(id: number) {
            this.id = id;
          }
        }
        const ws = new WeakSet<Box>();

        let thrown = false;
        try {
          ws.add(new Box(0));
        } catch {
          thrown = true;
        }

        expect(thrown).assertFalse();
        console.log('test_WeakSet_NullAdd_MultiWrapper_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_NULL_ADD_0100
     * @tc.name      test_WeakSet_nullAdd_Basic_0001
     * @tc.desc      Verify that adding null to WeakSet throws an exception (boxing wrapper)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_nullAdd_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_nullAdd_Basic_0001 start');

        interface BoxedNull extends Object { __brand: 'null' }

        const ws = new WeakSet<BoxedNull>();

        const boxedNull = Object(null) as BoxedNull;

        let errorThrown = false;
        try {
          ws.add(boxedNull);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('test_WeakSet_nullAdd_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_UNDEFINED_ADD_0200
     * @tc.name      test_WeakSet_UndefinedAdd_Basic_0002
     * @tc.desc      Verify that adding undefined to WeakSet throws an exception (boxing wrapper)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_UndefinedAdd_Basic_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_UndefinedAdd_Basic_0002 start');

        interface BoxedUndefined extends Object { __brand: 'undefined' }

        const ws = new WeakSet<BoxedUndefined>();

        const boxedUndefined = Object(undefined) as BoxedUndefined;

        let errorThrown = false;
        try {
          ws.add(boxedUndefined);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('test_WeakSet_UndefinedAdd_Basic_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_VALID_ADD_0300
     * @tc.name      test_WeakSet_ValidAdd_Basic_0003
     * @tc.desc      Verify that adding a valid object to WeakSet succeeds (basic wrapper)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_ValidAdd_Basic_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_ValidAdd_Basic_0003 start');

        interface ValueType { id: string; }
        const ws = new WeakSet<ValueType>();

        class Wrapper implements ValueType {
          id: string;
          constructor(id: string) {
            this.id = id;
          }
        }
        const wrapper = new Wrapper('unique-001');

        let errorThrown = false;
        try {
          ws.add(wrapper);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        expect(ws.has(wrapper)).assertTrue();
        console.log('test_WeakSet_ValidAdd_Basic_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_ARROW_ADD_0400
     * @tc.name      test_WeakSet_ArrowAdd_Basic_0004
     * @tc.desc      Verify that adding an arrow-function wrapper to WeakSet succeeds
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_ArrowAdd_Basic_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_ArrowAdd_Basic_0004 start');

        interface FnBox { id: string; invoke(): void; }

        class ArrowBox implements FnBox {
          id: string;
          constructor(id: string) {
            this.id = id;
          }
          invoke = (): void => { /* no-op */ };
        }

        const ws = new WeakSet<FnBox>();
        const arrowBox = new ArrowBox('arrow-001');

        let errorThrown = false;
        try {
          ws.add(arrowBox);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        expect(ws.has(arrowBox)).assertTrue();
        console.log('test_WeakSet_ArrowAdd_Basic_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_WEAKSET_READD_0500
     * @tc.name      test_WeakSet_ReAdd_Basic_0005
     * @tc.desc      Verify that re-adding a deleted object to WeakSet succeeds
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_ReAdd_Basic_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_ReAdd_Basic_0005 start');

        interface ValueType { id: string; }
        const ws = new WeakSet<ValueType>();

        class Wrapper implements ValueType {
          id: string;
          constructor(id: string) {
            this.id = id;
          }
        }
        const wrapper = new Wrapper('readd-001');

        ws.add(wrapper);
        ws.delete(wrapper);
        ws.add(wrapper);

        expect(ws.has(wrapper)).assertTrue();
        console.log('test_WeakSet_ReAdd_Basic_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_MULTI_ADD_0600
     * @tc.name      test_WeakSet_MultiAdd_Basic_0006
     * @tc.desc      Verify that adding multiple distinct valid objects to WeakSet succeeds
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_MultiAdd_Basic_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_MultiAdd_Basic_0006 start');

        interface ValueType { id: string; }
        const ws = new WeakSet<ValueType>();

        class Wrapper implements ValueType {
          id: string;
          constructor(id: string) {
            this.id = id;
          }
        }
        const w1 = new Wrapper('multi-001');
        const w2 = new Wrapper('multi-002');

        let errorThrown = false;
        try {
          ws.add(w1);
          ws.add(w2);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        expect(ws.has(w1)).assertTrue();
        expect(ws.has(w2)).assertTrue();
        console.log('test_WeakSet_MultiAdd_Basic_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_STRING_ADD_0100
     * @tc.name      test_WeakSet_StringAdd_Basic_0001
     * @tc.desc      Verify that adding a plain string to WeakSet throws an exception (boxing wrapper)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_StringAdd_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_StringAdd_Basic_0001 start');

        interface StringBox extends Object { __brand: 'string' }

        const ws = new WeakSet<StringBox>();
        const boxed = Object('test-string') as StringBox;

        let errorThrown = false;
        try {
          ws.add(boxed);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('test_WeakSet_StringAdd_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_STRING_ADD_0200
     * @tc.name      test_WeakSet_EmptyStringAdd_Basic_0002
     * @tc.desc      Verify that adding an empty string to WeakSet throws an exception
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_EmptyStringAdd_Basic_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_EmptyStringAdd_Basic_0002 start');

        interface StringBox extends Object { __brand: 'empty' }
        const ws = new WeakSet<StringBox>();
        const boxed = Object('') as StringBox;

        let errorThrown = false;
        try { ws.add(boxed); } catch (e) { errorThrown = true; }
        expect(errorThrown).assertFalse();
        console.log('test_WeakSet_EmptyStringAdd_Basic_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_STRING_ADD_0300
     * @tc.name      test_WeakSet_LongStringAdd_Basic_0003
     * @tc.desc      Verify that adding a 1k-length string to WeakSet throws an exception
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_LongStringAdd_Basic_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_LongStringAdd_Basic_0003 start');

        interface StringBox extends Object { __brand: 'long' }
        const ws = new WeakSet<StringBox>();
        const boxed = Object('a'.repeat(1024)) as StringBox;

        let errorThrown = false;
        try { ws.add(boxed); } catch (e) { errorThrown = true; }
        expect(errorThrown).assertFalse();
        console.log('test_WeakSet_LongStringAdd_Basic_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_STRING_ADD_0400
     * @tc.name      test_WeakSet_NumberStringAdd_Basic_0004
     * @tc.desc      Verify that adding a number-cast string to WeakSet throws an exception
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_NumberStringAdd_Basic_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_NumberStringAdd_Basic_0004 start');

        interface StringBox extends Object { __brand: 'numstr' }
        const ws = new WeakSet<StringBox>();
        const boxed = Object(String(12345)) as StringBox;

        let errorThrown = false;
        try { ws.add(boxed); } catch (e) { errorThrown = true; }
        expect(errorThrown).assertFalse();
        console.log('test_WeakSet_NumberStringAdd_Basic_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_STRING_ADD_0500
     * @tc.name      test_WeakSet_TemplateStringAdd_Basic_0005
     * @tc.desc      Verify that adding a template-string to WeakSet throws an exception
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_TemplateStringAdd_Basic_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_TemplateStringAdd_Basic_0005 start');

        interface StringBox extends Object { __brand: 'tpl' }
        const ws = new WeakSet<StringBox>();
        const uid = 'tpl-001';
        const boxed = Object(`str-${uid}`) as StringBox;

        let errorThrown = false;
        try { ws.add(boxed); } catch (e) { errorThrown = true; }
        expect(errorThrown).assertFalse();
        console.log('test_WeakSet_TemplateStringAdd_Basic_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_WEAKSET_STRING_ADD_0600
     * @tc.name      test_WeakSet_ClassFieldStringAdd_Basic_0006
     * @tc.desc      Verify that adding a string-casted class field to WeakSet throws an exception
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakSet_ClassFieldStringAdd_Basic_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakSet_ClassFieldStringAdd_Basic_0006 start');

        interface StringBox extends Object { __brand: 'field' }
        const ws = new WeakSet<StringBox>();

        class Config {
          id: string;
          constructor() { this.id = 'config-001'; }
        }
        const cfg = new Config();
        const boxed = Object(cfg.id) as StringBox;

        let errorThrown = false;
        try { ws.add(boxed); } catch (e) { errorThrown = true; }
        expect(errorThrown).assertFalse();
        console.log('test_WeakSet_ClassFieldStringAdd_Basic_0006 done');
        done();
      });
  })
}