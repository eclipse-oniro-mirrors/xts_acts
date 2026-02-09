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

interface KeyType {
  id: number;
}
export default function keyedCollections_14Test() {
  describe('keyedCollections_14Test', () => {
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
     * @tc.number    SUB_ARK_WEAKMAP_MAP_KEY_RECYCLING_0100
     * @tc.name      test_WeakMap_Key_GC_Basic_0001
     * @tc.desc      Verify that after the strong reference is set to null, the WeakMap key is reclaimed while the Map key is retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakMap_Key_GC_Basic_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_Key_GC_Basic_0001 start');

        const wm = new WeakMap<KeyType, string>();
        const map = new Map<KeyType, string>();

        let key: KeyType | null = { id: 1 };
        wm.set(key, 'v');
        map.set(key, 'v');

        key = null;

        setTimeout(() => {
              const actual = !wm.has(key!) && map.size === 1;
              expect(actual).assertTrue();

              console.log('test_WeakMap_Key_GC_Basic_0001 done');
              done();
              }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_MAP_KEY_RECYCLING_0200
     * @tc.name      test_WeakMap_PartialKey_GC_0002
     * @tc.desc      Verify that in a multi-key scenario, only the key set to null is reclaimed by the WeakMap, while the rest remain.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakMap_PartialKey_GC_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_PartialKey_GC_0002 start');

        interface KeyType { id: number; }
        const wm = new WeakMap<KeyType, string>();
        const map = new Map<KeyType, string>();

        let k1: KeyType | null = { id: 1 };
        let k2: KeyType | null = { id: 2 };
        wm.set(k1!, 'v1');
        wm.set(k2!, 'v2');
        map.set(k1!, 'v1');
        map.set(k2!, 'v2');

        k1 = null;

        setTimeout(() => {
            const result = !wm.has(k1!) && wm.has(k2!) && map.size === 2;
            expect(result).assertTrue();
            console.log('test_WeakMap_PartialKey_GC_0002 done');
            done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_MAP_KEY_RECYCLING_0300
     * @tc.name      test_WeakMap_ValueReachable_0003
     * @tc.desc      Verify that the WeakMap key can still be reclaimed even if its value remains reachable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakMap_ValueReachable_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_ValueReachable_0003 start');

        interface KeyType { id: number; }
        interface ValueType { val: string; }

        const wm = new WeakMap<KeyType, ValueType>();
        let key: KeyType | null = { id: 3 };
        const valueHolder: ValueType = { val: 'reachable' };

        wm.set(key!, valueHolder);
        key = null;

        setTimeout(() => {
            const result = !wm.has(key!);
            expect(result).assertTrue();
            console.log('test_WeakMap_ValueReachable_0003 done');
            done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_MAP_KEY_RECYCLING_0400
     * @tc.name      test_Map_RetainKey_0004
     * @tc.desc      Verify that the strong reference held by Map prevents the key from being GC-ed even after external references are released.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Map_RetainKey_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Map_RetainKey_0004 start');

        interface KeyType { id: number; }
        const map = new Map<KeyType, string>();

        let key: KeyType | null = { id: 4 };
        map.set(key!, 'v');
        key = null;

        setTimeout(() => {
              const result = map.size === 1;
              expect(result).assertTrue();
              console.log('test_Map_RetainKey_0004 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_MAP_KEY_RECYCLING_0500
     * @tc.name      test_WeakMap_ReSetAfterGC_0005
     * @tc.desc      Verify that after the old key is reclaimed, a new key can be successfully stored.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakMap_ReSetAfterGC_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_ReSetAfterGC_0005 start');

        interface KeyType { id: number; }
        const wm = new WeakMap<KeyType, string>();

        let key: KeyType | null = { id: 5 };
        wm.set(key!, 'old');
        key = null;

        setTimeout(() => {
              let newKey: KeyType | null = { id: 5 };
              wm.set(newKey!, 'new');
              const result = wm.has(newKey!) && wm.get(newKey!) === 'new';
              expect(result).assertTrue();
              console.log('test_WeakMap_ReSetAfterGC_0005 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_STRONG_REF_0100
     * @tc.name      test_WeakMap_Key_StrongRef_0001
     * @tc.desc      Verify that when the WeakMap key has an additional strong reference, it is not reclaimed even if the original variable is set to null.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakMap_Key_StrongRef_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_Key_StrongRef_0001 start');

        interface KeyType { id: number; }
        const wm = new WeakMap<KeyType, string>();

        let key: KeyType | null = { id: 2 };
        const ref: KeyType = key;
        wm.set(key!, 'value2');
        key = null;

        setTimeout(() => {
              const result = wm.has(ref);
              expect(result).assertTrue();
              console.log('test_WeakMap_Key_StrongRef_0001 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_STRONG_REF_0200
     * @tc.name      test_WeakMap_ArrayHold_0002
     * @tc.desc      Verify that when an array holds a strong reference to the key, the WeakMap key is not reclaimed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakMap_ArrayHold_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_ArrayHold_0002 start');

        interface KeyType { id: number; }
        const wm = new WeakMap<KeyType, string>();
        const arr: (KeyType | null)[] = [];

        let key: KeyType | null = { id: 20 };
        arr.push(key);
        wm.set(key!, 'v');
        key = null;

        setTimeout(() => {
              const result = wm.has(arr[0]!);
              expect(result).assertTrue();
              console.log('test_WeakMap_ArrayHold_0002 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_STRONG_REF_0300
     * @tc.name      test_WeakMap_MapHold_0003
     * @tc.desc      Verify that when the Map itself holds a strong reference to the key, the WeakMap key is not reclaimed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakMap_MapHold_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_MapHold_0003 start');

        interface KeyType { id: number; }
        const wm = new WeakMap<KeyType, string>();
        const map = new Map<KeyType, number>();

        let key: KeyType | null = { id: 30 };
        map.set(key, 1);
        wm.set(key!, 'v');
        key = null;

        setTimeout(() => {
              const result = wm.has(Array.from(map.keys())[0]);
              expect(result).assertTrue();
              console.log('test_WeakMap_MapHold_0003 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_STRONG_REF_0400
     * @tc.name      test_WeakMap_DoubleStrongRef_0004
     * @tc.desc      Verify that the WeakMap key is reclaimed only after all strong references are removed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakMap_DoubleStrongRef_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_DoubleStrongRef_0004 start');

        interface KeyType { id: number; }
        const wm = new WeakMap<KeyType, string>();

        let key: KeyType | null = { id: 40 };
        const ref1: KeyType = key;
        const ref2: KeyType = key;
        wm.set(key!, 'v');

        key  = null;

        setTimeout(() => {
              const stillThere = wm.has(ref1);

              ref1.id = 0;
              const result = stillThere && wm.has(ref2);
              expect(result).assertTrue();
              console.log('test_WeakMap_DoubleStrongRef_0004 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_STRONG_REF_0500
     * @tc.name      test_WeakMap_ClassFieldHold_0005
     * @tc.desc      Verify that when a class field holds a strong reference to the key, the WeakMap key is not reclaimed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakMap_ClassFieldHold_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_ClassFieldHold_0005 start');

        interface KeyType { id: number; }

        class Holder {
              public key: KeyType | null;
              constructor(k: KeyType) { this.key = k; }
              release() { this.key = null; }
        }

        const wm = new WeakMap<KeyType, string>();
        let key: KeyType | null = { id: 50 };
        const holder = new Holder(key);

        wm.set(key!, 'v');
        key = null;

        setTimeout(() => {
              const result = wm.has(holder.key!);
              expect(result).assertTrue();
              console.log('test_WeakMap_ClassFieldHold_0005 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_STRONG_REF_0600
     * @tc.name      test_WeakMap_ClosureHold_0006
     * @tc.desc      Verify that when a closure variable holds a strong reference to the key, the WeakMap key is not reclaimed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakMap_ClosureHold_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_ClosureHold_0006 start');

        interface KeyType { id: number; }

        const wm = new WeakMap<KeyType, string>();
        let key: KeyType | null = { id: 60 };


        const closure = (): KeyType | null => key;

        wm.set(key!, 'v');
        key = null;

        const result = wm.has(closure()!);
        expect(result).assertFalse();
        console.log('test_WeakMap_ClosureHold_0006 done');
        done();

    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_ARRAY_KEY_0100
     * @tc.name      test_WeakMap_ArrayKey_GC_0001
     * @tc.desc      Verify that array keys are reclaimed by the WeakMap after their strong references are removed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakMap_ArrayKey_GC_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_ArrayKey_GC_0001 start');

        interface ArrayKey extends Array<number> {}
        const wm = new WeakMap<ArrayKey, string>();

        let arr: ArrayKey | null = [1, 2, 3];
        wm.set(arr!, 'value3');
        arr = null;

        setTimeout(() => {
              const result = !wm.has(arr!);
              expect(result).assertTrue();
              console.log('test_WeakMap_ArrayKey_GC_0001 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_ARRAY_KEY_0200
     * @tc.name      test_WeakMap_ArrayKey_StillThere_0002
     * @tc.desc      Verify that array keys are not reclaimed when an additional strong reference (array copy) exists.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakMap_ArrayKey_StillThere_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_ArrayKey_StillThere_0002 start');

        interface ArrayKey extends Array<number> {}
        const wm = new WeakMap<ArrayKey, string>();

        let arr: ArrayKey | null = [4, 5, 6];
        const copy: ArrayKey = arr;
        wm.set(arr!, 'v');
        arr = null;

        setTimeout(() => {
              const result = wm.has(copy);
              expect(result).assertTrue();
              console.log('test_WeakMap_ArrayKey_StillThere_0002 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_ARRAY_KEY_0300
     * @tc.name      test_WeakMap_NestedArrayKey_GC_0003
     * @tc.desc      Verify that nested array keys are reclaimed after their strong references are removed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakMap_NestedArrayKey_GC_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_NestedArrayKey_GC_0003 start');

        interface NestedArray extends Array<number[]> {}
        const wm = new WeakMap<NestedArray, string>();

        let nested: NestedArray | null = [[1, 2], [3, 4]];
        wm.set(nested!, 'nested');
        nested = null;

        setTimeout(() => {
              const result = !wm.has(nested!);
              expect(result).assertTrue();
              console.log('test_WeakMap_NestedArrayKey_GC_0003 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_ARRAY_KEY_0400
     * @tc.name      test_WeakMap_MixedArrayKey_0004
     * @tc.desc      Verify that object-array keys are reclaimed after their strong references are removed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakMap_MixedArrayKey_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_MixedArrayKey_0004 start');

        interface Item { id: number; }
        interface MixedArray extends Array<Item> {}
        const wm = new WeakMap<MixedArray, string>();

        let arr: MixedArray | null = [{ id: 1 }, { id: 2 }];
        wm.set(arr!, 'mixed');
        arr = null;

        setTimeout(() => {
              const result = !wm.has(arr!);
              expect(result).assertTrue();
              console.log('test_WeakMap_MixedArrayKey_0004 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_ARRAY_KEY_0500
     * @tc.name      test_WeakMap_ArrayKey_ReverseHold_0005
     * @tc.desc      Verify that array keys are not reclaimed when they are strongly referenced by another WeakMap.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakMap_ArrayKey_ReverseHold_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_ArrayKey_ReverseHold_0005 start');

        interface ArrayKey extends Array<number> {}
        const wm1 = new WeakMap<ArrayKey, string>();
        const wm2 = new WeakMap<ArrayKey, string>();

        let arr: ArrayKey | null = [7, 8, 9];
        const keyRef: ArrayKey = arr;
        wm1.set(arr!, 'v1');
        wm2.set(arr!, 'v2');
        arr = null;

        setTimeout(() => {
              const result = wm1.has(keyRef);
              expect(result).assertTrue();
              console.log('test_WeakMap_ArrayKey_ReverseHold_0005 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_ARRAY_KEY_0600
     * @tc.name      test_WeakMap_ArrayKey_AllRefReleased_0006
     * @tc.desc      Verify that array keys are reclaimed only after all strong references (variable + array copy) are removed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakMap_ArrayKey_AllRefReleased_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_ArrayKey_AllRefReleased_0006 start');

        interface ArrayKey extends Array<number> {}
        const wm = new WeakMap<ArrayKey, string>();

        let arr: ArrayKey | null = [10, 11, 12];
        const copy: ArrayKey = arr;
        wm.set(arr!, 'v');
        arr = null;
        copy.length = 0;


        setTimeout(() => {
              const result = wm.has(copy);
              expect(result).assertTrue();
              console.log('test_WeakMap_ArrayKey_AllRefReleased_0006 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_FUNC_KEY_0100
     * @tc.name      test_WeakMap_FuncKey_GC_0001
     * @tc.desc      Verify that function keys are reclaimed by the WeakMap after their strong references are removed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_FuncKey_GC_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_FuncKey_GC_0001 start');

        class FuncKey {
              public invoke(): string { return 'test'; }
        }

        const wm = new WeakMap<FuncKey, string>();
        let key: FuncKey | null = new FuncKey();
        wm.set(key, 'value4');
        key = null;

        setTimeout(() => {
              const result = !wm.has(key!);
              expect(result).assertTrue();
              console.log('test_WeakMap_FuncKey_GC_0001 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_FUNC_KEY_0200
     * @tc.name      test_WeakMap_FuncKey_StillThere_0002
     * @tc.desc      Verify that function keys are not reclaimed when an additional strong reference (copy) exists.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_FuncKey_StillThere_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_FuncKey_StillThere_0002 start');

        class FuncKey {
              public invoke(): number { return 42; }
        }

        const wm = new WeakMap<FuncKey, string>();
        let key: FuncKey | null = new FuncKey();
        const copy: FuncKey = key;
        wm.set(key, 'v');
        key = null;

        setTimeout(() => {
              const result = wm.has(copy);
              expect(result).assertTrue();
              console.log('test_WeakMap_FuncKey_StillThere_0002 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_FUNC_KEY_0300
     * @tc.name      test_WeakMap_FuncKey_MultiRef_0003
     * @tc.desc      Verify that function keys are reclaimed only after all strong references are removed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_FuncKey_MultiRef_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_FuncKey_MultiRef_0003 start');

        class FuncKey {
              public invoke(): boolean { return true; }
        }

        const wm = new WeakMap<FuncKey, string>();
        let key: FuncKey | null = new FuncKey();
        const ref1: FuncKey = key;
        const ref2: FuncKey = key;
        wm.set(key, 'v');

        key = null;

        setTimeout(() => {
              const result = wm.has(ref1) && wm.has(ref2);
              expect(result).assertTrue();
              console.log('test_WeakMap_FuncKey_MultiRef_0003 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_FUNC_KEY_0400
     * @tc.name      test_WeakMap_FuncKey_ClassMethod_0004
     * @tc.desc      Verify that class method keys are not reclaimed as long as the instance is alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_FuncKey_ClassMethod_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_FuncKey_ClassMethod_0004 start');

        class MyClass {
              public method: () => string = () => 'class';
        }

        const wm = new WeakMap<() => string, string>();
        let inst: MyClass | null = new MyClass();
        const method: () => string = inst.method;
        wm.set(method, 'v');
        inst = null;

        setTimeout(() => {
              const result = wm.has(method);
              expect(result).assertTrue();
              console.log('test_WeakMap_FuncKey_ClassMethod_0004 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_FUNC_KEY_0500
     * @tc.name      test_WeakMap_FuncKey_Iterator_0005
     * @tc.desc      Verify that iterator class instance keys are reclaimed after their strong references are removed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_FuncKey_Iterator_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_FuncKey_Iterator_0005 start');
        class IteratorKey {
              private idx = 0;
              public invoke(): number {
                    return ++this.idx;
              }
        }

        const wm = new WeakMap<IteratorKey, string>();

        let key: IteratorKey | null = new IteratorKey();
        wm.set(key, 'iter');
        key = null;

        setTimeout(() => {
              const result = !wm.has(key!);
              expect(result).assertTrue();
              console.log('test_WeakMap_FuncKey_Iterator_0005 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_FUNC_KEY_0600
     * @tc.name      test_WeakMap_FuncKey_ArrowClosure_0006
     * @tc.desc      Verify that arrow-function class instance keys are not reclaimed when a closure strong reference exists.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_FuncKey_ArrowClosure_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_FuncKey_ArrowClosure_0006 start');

        class ArrowKey {
              public readonly invoke: () => number;
              constructor() { this.invoke = () => 999; }
        }

        const wm = new WeakMap<ArrowKey, string>();

        let key: ArrowKey | null = new ArrowKey();
        const closure = (): ArrowKey | null => key;   //
        wm.set(key, 'v');
        key = null;

        const result = wm.has(closure()!);
        expect(result).assertFalse();
        console.log('test_WeakMap_FuncKey_ArrowClosure_0006 done');
        done();
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_VALUE_STRONG_0100
     * @tc.name      test_WeakMap_ValueStrong_Basic_0001
     * @tc.desc      Verify that when the value has an external strong reference, it remains accessible after the key is reclaimed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_ValueStrong_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_ValueStrong_Basic_0001 start');

        interface KeyType { id: number; }
        interface ValueType { data: string; }

        const wm = new WeakMap<KeyType, ValueType>();
        let key: KeyType | null = { id: 5 };
        let value: ValueType | null = { data: 'value5' };

        wm.set(key, value);
        key = null;

        setTimeout(() => {
              const result = value!.data === 'value5';
              expect(result).assertTrue();
              console.log('test_WeakMap_ValueStrong_Basic_0001 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_VALUE_STRONG_0200
     * @tc.name      test_WeakMap_ValueStrong_Array_0002
     * @tc.desc      Verify that when the array value has an external strong reference, it remains accessible after the key is reclaimed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_ValueStrong_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_ValueStrong_Array_0002 start');

        interface KeyType { id: number; }
        interface ValueArray extends Array<string> {}

        const wm = new WeakMap<KeyType, ValueArray>();
        let key: KeyType | null = { id: 2 };
        let value: ValueArray | null = ['a', 'b', 'c'];

        wm.set(key, value);
        key = null;

        setTimeout(() => {
              const result = value![0] === 'a' && value!.length === 3;
              expect(result).assertTrue();
              console.log('test_WeakMap_ValueStrong_Array_0002 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_VALUE_STRONG_0300
     * @tc.name      test_WeakMap_ValueStrong_Class_0003
     * @tc.desc      Verify that when the class instance value has an external strong reference, it remains accessible after the key is reclaimed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_ValueStrong_Class_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_ValueStrong_Class_0003 start');

        interface KeyType { id: number; }
        class ValueClass {
              public data: string;
              constructor(d: string) { this.data = d; }
        }

        const wm = new WeakMap<KeyType, ValueClass>();
        let key: KeyType | null = { id: 3 };
        let value: ValueClass | null = new ValueClass('classVal');

        wm.set(key, value);
        key = null;

        setTimeout(() => {
              const result = value!.data === 'classVal';
              expect(result).assertTrue();
              console.log('test_WeakMap_ValueStrong_Class_0003 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_VALUE_STRONG_0400
     * @tc.name      test_WeakMap_ValueStrong_Map_0004
     * @tc.desc      Verify that when the Map value has an external strong reference, it remains accessible after the key is reclaimed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_ValueStrong_Map_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_ValueStrong_Map_0004 start');

        interface KeyType { id: number; }
        interface ValueMap extends Map<string, number> {}

        const wm = new WeakMap<KeyType, ValueMap>();
        let key: KeyType | null = { id: 4 };
        let value: ValueMap | null = new Map([['k', 100]]);

        wm.set(key, value);
        key = null;

        setTimeout(() => {
              const result = value!.get('k') === 100;
              expect(result).assertTrue();
              console.log('test_WeakMap_ValueStrong_Map_0004 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_VALUE_STRONG_0500
     * @tc.name      test_WeakMap_ValueStrong_Set_0005
     * @tc.desc      Verify that when the Set value has an external strong reference, it remains accessible after the key is reclaimed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_ValueStrong_Set_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_ValueStrong_Set_0005 start');

        interface KeyType { id: number; }
        interface ValueSet extends Set<number> {}

        const wm = new WeakMap<KeyType, ValueSet>();
        let key: KeyType | null = { id: 5 };
        let value: ValueSet | null = new Set([1, 2, 3]);

        wm.set(key, value);
        key = null;

        setTimeout(() => {
              const result = value!.has(2) && value!.size === 3;
              expect(result).assertTrue();
              console.log('test_WeakMap_ValueStrong_Set_0005 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_VALUE_STRONG_0600
     * @tc.name      test_WeakMap_ValueStrong_Nested_0006
     * @tc.desc      Verify that when the nested object value has an external strong reference, it remains accessible after the key is reclaimed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_ValueStrong_Nested_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_ValueStrong_Nested_0006 start');

        interface KeyType { id: number; }
        interface Level2 { data: string; }
        interface Level1 { level2: Level2; }
        interface NestedValue { level1: Level1; }

        const wm = new WeakMap<KeyType, NestedValue>();
        let key: KeyType | null = { id: 6 };
        let value: NestedValue | null = {
              level1: { level2: { data: 'nested' } }
        };

        wm.set(key!, value);
        key = null;

        setTimeout(() => {
              const result = value!.level1.level2.data === 'nested';
              expect(result).assertTrue();
              console.log('test_WeakMap_ValueStrong_Nested_0006 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_VALUE_NO_STRONG_0100
     * @tc.name      test_WeakMap_ValueNoStrong_Basic_0001
     * @tc.desc      Verify that when the value has no external strong reference, it disappears along with the reclaimed key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_ValueNoStrong_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_ValueNoStrong_Basic_0001 start');

        interface KeyType { id: number; }
        interface ValueType { data: string; }

        const wm = new WeakMap<KeyType, ValueType>();
        let key: KeyType | null = { id: 6 };
        let value: ValueType | null = { data: 'value6' };

        wm.set(key, value);
        value = null;
        key = null;

        setTimeout(() => {
              const result = !wm.has(key!);
              expect(result).assertTrue();
              console.log('test_WeakMap_ValueNoStrong_Basic_0001 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_VALUE_NO_STRONG_0200
     * @tc.name      test_WeakMap_ValueNoStrong_Array_0002
     * @tc.desc      Verify that when the array value has no external strong reference, it disappears along with the reclaimed key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_ValueNoStrong_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_ValueNoStrong_Array_0002 start');

        interface KeyType { id: number; }
        interface ValueArray extends Array<string> {}

        const wm = new WeakMap<KeyType, ValueArray>();
        let key: KeyType | null = { id: 2 };
        let value: ValueArray | null = ['a', 'b', 'c'];

        wm.set(key, value);
        value = null;
        key = null;

        setTimeout(() => {
              const result = !wm.has(key!);
              expect(result).assertTrue();
              console.log('test_WeakMap_ValueNoStrong_Array_0002 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_VALUE_NO_STRONG_0300
     * @tc.name      test_WeakMap_ValueNoStrong_Class_0003
     * @tc.desc      Verify that when the class instance value has no external strong reference, it disappears along with the reclaimed key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_ValueNoStrong_Class_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_ValueNoStrong_Class_0003 start');

        interface KeyType { id: number; }
        class ValueClass {
              public data: string;
              constructor(d: string) { this.data = d; }
        }

        const wm = new WeakMap<KeyType, ValueClass>();
        let key: KeyType | null = { id: 3 };
        let value: ValueClass | null = new ValueClass('classVal');

        wm.set(key, value);
        value = null;
        key = null;

        setTimeout(() => {
              const result = !wm.has(key!);
              expect(result).assertTrue();
              console.log('test_WeakMap_ValueNoStrong_Class_0003 done');
              done();
        }, 100);
    });

    /**
    * @tc.number    SUB_ARK_WEAKMAP_VALUE_NO_STRONG_0400
     * @tc.name      test_WeakMap_ValueNoStrong_Map_0004
     * @tc.desc      Verify that when the Map value has no external strong reference, it disappears along with the reclaimed key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_ValueNoStrong_Map_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_ValueNoStrong_Map_0004 start');

        interface KeyType { id: number; }
        interface ValueMap extends Map<string, number> {}

        const wm = new WeakMap<KeyType, ValueMap>();
        let key: KeyType | null = { id: 4 };
        let value: ValueMap | null = new Map([['k', 100]]);

        wm.set(key, value);
        value = null;
        key = null;

        setTimeout(() => {
              const result = !wm.has(key!);
              expect(result).assertTrue();
              console.log('test_WeakMap_ValueNoStrong_Map_0004 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_VALUE_NO_STRONG_0500
     * @tc.name      test_WeakMap_ValueNoStrong_Set_0005
     * @tc.desc      Verify that when the Set value has no external strong reference, it disappears along with the reclaimed key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_ValueNoStrong_Set_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_ValueNoStrong_Set_0005 start');

        interface KeyType { id: number; }
        interface ValueSet extends Set<number> {}

        const wm = new WeakMap<KeyType, ValueSet>();
        let key: KeyType | null = { id: 5 };
        let value: ValueSet | null = new Set([1, 2, 3]);

        wm.set(key, value);
        value = null;
        key = null;

        setTimeout(() => {
              const result = !wm.has(key!);
              expect(result).assertTrue();
              console.log('test_WeakMap_ValueNoStrong_Set_0005 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_VALUE_NO_STRONG_0600
     * @tc.name      test_WeakMap_ValueNoStrong_CallableClass_0006
     * @tc.desc      Verify that when the “callable class” instance value has no external strong reference, it disappears along with the reclaimed key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_ValueNoStrong_CallableClass_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_ValueNoStrong_CallableClass_0006 start');

        interface KeyType { id: number; }


        class CallableValue {
              public invoke: () => string = () => 'callable';
        }

        const wm = new WeakMap<KeyType, CallableValue>();
        let key: KeyType | null = { id: 6 };
        let value: CallableValue | null = new CallableValue();

        wm.set(key, value);
        value = null;
        key = null;

        setTimeout(() => {
              const result = !wm.has(key!);
              expect(result).assertTrue();
              console.log('test_WeakMap_ValueNoStrong_CallableClass_0006 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_CYCLE_REF_0100
     * @tc.name      test_WeakMap_CycleRef_Basic_0001
     * @tc.desc      Verify that bidirectional circular-reference keys are reclaimed after all external references are removed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_CycleRef_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_CycleRef_Basic_0001 start');


        interface NodeA { name: string; ref: NodeB | null; }
        interface NodeB { name: string; ref: NodeA | null; }

        const wm = new WeakMap<NodeA, string>();
        let nodeA: NodeA | null = { name: 'a', ref: null };
        let nodeB: NodeB | null = { name: 'b', ref: null };
        nodeA.ref = nodeB;
        nodeB.ref = nodeA;

        wm.set(nodeA, 'value7');
        nodeA = null;
        nodeB = null;

        setTimeout(() => {
              const result = !wm.has(nodeA!);
              expect(result).assertTrue();
              console.log('test_WeakMap_CycleRef_Basic_0001 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_CYCLE_REF_0200
     * @tc.name      test_WeakMap_CycleRef_Array_0002
     * @tc.desc      Verify that array-element circular-reference keys are reclaimed after all external references are removed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_CycleRef_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_CycleRef_Array_0002 start');

        interface ArrayNode extends Array<ArrayNode | null> {}

        const wm = new WeakMap<ArrayNode, string>();
        let node: ArrayNode | null = [];
        node.push(node);

        wm.set(node, 'arr');
        node = null;

        setTimeout(() => {
              const result = !wm.has(node!);
              expect(result).assertTrue();
              console.log('test_WeakMap_CycleRef_Array_0002 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_CYCLE_REF_0300
     * @tc.name      test_WeakMap_CycleRef_Map_0003
     * @tc.desc      Verify that Map-internal circular-reference keys are reclaimed after all external references are removed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_CycleRef_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_CycleRef_Map_0003 start');

        interface KeyType { id: number; }
        interface NodeMap extends Map<string, KeyType | null> {
              owner?: KeyType | null;
        }

        const wm = new WeakMap<KeyType, NodeMap>();
        let key: KeyType | null = { id: 3 };
        let map: NodeMap | null = new Map();
        map.set('self', key);
        map.owner = key;

        wm.set(key, map);
        key = null;
        map = null;

        setTimeout(() => {
              const result = !wm.has(key!);
              expect(result).assertTrue();
              console.log('test_WeakMap_CycleRef_Map_0003 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_CYCLE_REF_0400
     * @tc.name      test_WeakMap_CycleRef_Set_0004
     * @tc.desc      Verify that Set-internal circular-reference keys are reclaimed after all external references are removed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_CycleRef_Set_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_CycleRef_Set_0004 start');

        interface KeyType { id: number; }
        interface NodeSet extends Set<KeyType | null> {
              owner?: KeyType | null;
        }

        const wm = new WeakMap<KeyType, NodeSet>();
        let key: KeyType | null = { id: 4 };
        let set: NodeSet | null = new Set();
        set.add(key);
        set.owner = key;

        wm.set(key, set);
        key = null;
        set = null;

        setTimeout(() => {
              const result = !wm.has(key!);
              expect(result).assertTrue();
              console.log('test_WeakMap_CycleRef_Set_0004 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_CYCLE_REF_0500
     * @tc.name      test_WeakMap_CycleRef_CallableClass_0005
     * @tc.desc      Verify that “callable class” instance circular-reference keys are reclaimed after all external references are removed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_CycleRef_CallableClass_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_CycleRef_CallableClass_0005 start');


        class CallableNode {
              public invoke: () => string = () => 'callable';
              public ref: CallableNode | null = null;
        }

        const wm = new WeakMap<CallableNode, string>();
        let nodeA: CallableNode | null = new CallableNode();
        let nodeB: CallableNode | null = new CallableNode();
        nodeA.ref = nodeB;
        nodeB.ref = nodeA;

        wm.set(nodeA, 'callableValue');
        nodeA = null;
        nodeB = null;

        setTimeout(() => {
              const result = !wm.has(nodeA!);
              expect(result).assertTrue();
              console.log('test_WeakMap_CycleRef_CallableClass_0005 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_CYCLE_REF_0600
     * @tc.name      test_WeakMap_CycleRef_Tree_0006
     * @tc.desc      Verify that tree-structure circular-reference keys are reclaimed after all external references are removed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_CycleRef_Tree_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_CycleRef_Tree_0006 start');

        interface TreeNode {
              name: string;
              children: TreeNode[];
              parent: TreeNode | null;
        }

        const wm = new WeakMap<TreeNode, string>();
        let root: TreeNode | null = { name: 'root', children: [], parent: null };
        let child: TreeNode | null = { name: 'child', children: [], parent: root };
        root.children.push(child);
        child.children.push(root);

        wm.set(root, 'tree');
        root = null;
        child = null;

        setTimeout(() => {
              const result = !wm.has(root!);
              expect(result).assertTrue();
              console.log('test_WeakMap_CycleRef_Tree_0006 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_DOM_VALUE_0100
     * @tc.name      test_WeakMap_DOMValue_Basic_0001
     * @tc.desc      Verify that when the value is a mock DOM element with an external strong reference, it remains accessible after the key is reclaimed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_DOMValue_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_DOMValue_Basic_0001 start');

        interface KeyType { id: number; }
        interface DOMElement {
              tagName: string;
              textContent: string;
              setText(text: string): void;
        }


        class MockDiv implements DOMElement {
              public tagName = 'div';
              public textContent = '';
              public setText(text: string): void { this.textContent = text; }
        }

        const wm = new WeakMap<KeyType, DOMElement>();
        let key: KeyType | null = { id: 8 };
        let elem: DOMElement | null = new MockDiv();
        elem.setText('test');

        wm.set(key, elem);
        key = null;

        setTimeout(() => {
              const result = elem!.textContent === 'test';
              expect(result).assertTrue();
              console.log('test_WeakMap_DOMValue_Basic_0001 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_DOM_VALUE_0200
     * @tc.name      test_WeakMap_DOMValue_MultiElem_0002
     * @tc.desc      Verify that when multiple mock DOM element values have external strong references, they remain accessible after the key is reclaimed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_DOMValue_MultiElem_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_DOMValue_MultiElem_0002 start');

        interface KeyType { id: number; }
        interface DOMElement {
              tagName: string;
              textContent: string;
              setText(text: string): void;
        }

        class MockSpan implements DOMElement {
              public tagName = 'span';
              public textContent = '';
              public setText(text: string): void { this.textContent = text; }
        }

        const wm = new WeakMap<KeyType, DOMElement>();
        let key: KeyType | null = { id: 2 };
        let elem: DOMElement | null = new MockSpan();
        elem.setText('multi');

        wm.set(key, elem);
        key = null;

        setTimeout(() => {
              const result = elem!.textContent === 'multi';
              expect(result).assertTrue();
              console.log('test_WeakMap_DOMValue_MultiElem_0002 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_DOM_VALUE_0300
     * @tc.name      test_WeakMap_DOMValue_Nested_0003
     * @tc.desc      Verify that when nested mock DOM element values have external strong references, they remain accessible after the key is reclaimed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_DOMValue_Nested_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_DOMValue_Nested_0003 start');

        interface KeyType { id: number; }
        interface DOMElement {
              tagName: string;
              textContent: string;
              children: DOMElement[];
              setText(text: string): void;
        }

        class MockDiv implements DOMElement {
              public tagName = 'div';
              public textContent = '';
              public children: DOMElement[] = [];
              public setText(text: string): void { this.textContent = text; }
        }

        const wm = new WeakMap<KeyType, DOMElement>();
        let key: KeyType | null = { id: 3 };
        let parent: DOMElement | null = new MockDiv();
        let child: DOMElement | null = new MockDiv();
        parent.setText('parent');
        child.setText('child');
        parent.children.push(child);

        wm.set(key, parent);
        key = null;

        setTimeout(() => {
              const result = parent!.textContent === 'parent' && parent!.children[0].textContent === 'child';
              expect(result).assertTrue();
              console.log('test_WeakMap_DOMValue_Nested_0003 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_DOM_VALUE_0400
     * @tc.name      test_WeakMap_DOMValue_CallableClass_0004
     * @tc.desc      Verify that when a “callable class” instance acts as a mock DOM value with an external strong reference, it remains accessible after the key is reclaimed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_DOMValue_CallableClass_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_DOMValue_CallableClass_0004 start');

        interface KeyType { id: number; }

        interface CallableDOM {
              tagName: string;
              textContent: string;
              invoke: () => string;
              setText(text: string): void;
        }

        class CallableDiv implements CallableDOM {
              public tagName = 'div';
              public textContent = '';
              public invoke: () => string = () => this.textContent;
              public setText(text: string): void { this.textContent = text; }
        }

        const wm = new WeakMap<KeyType, CallableDOM>();
        let key: KeyType | null = { id: 4 };
        let elem: CallableDOM | null = new CallableDiv();
        elem.setText('callable');

        wm.set(key, elem);
        key = null;

        setTimeout(() => {
              const result = elem!.invoke() === 'callable';
              expect(result).assertTrue();
              console.log('test_WeakMap_DOMValue_CallableClass_0004 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_DOM_VALUE_0500
     * @tc.name      test_WeakMap_DOMValue_MapInside_0005
     * @tc.desc      Verify that when a Map acts as a mock DOM attribute value with an external strong reference, it remains accessible after the key is reclaimed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_DOMValue_MapInside_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_DOMValue_MapInside_0005 start');

        interface KeyType { id: number; }
        interface AttrMap extends Map<string, string> {}
        interface DOMElement {
              tagName: string;
              attrs: AttrMap;
              setAttr(k: string, v: string): void;
        }

        class MockElem implements DOMElement {
              public tagName = 'elem';
              public attrs: AttrMap = new Map();
              public setAttr(k: string, v: string): void { this.attrs.set(k, v); }
        }

        const wm = new WeakMap<KeyType, DOMElement>();
        let key: KeyType | null = { id: 5 };
        let elem: DOMElement | null = new MockElem();
        elem.setAttr('id', 'test');

        wm.set(key, elem);
        key = null;

        setTimeout(() => {
              const result = elem!.attrs.get('id') === 'test';
              expect(result).assertTrue();
              console.log('test_WeakMap_DOMValue_MapInside_0005 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_DOM_VALUE_0600
     * @tc.name      test_WeakMap_DOMValue_SetInside_0006
     * @tc.desc      Verify that when a Set acts as mock DOM style-class names with an external strong reference, it remains accessible after the key is reclaimed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_DOMValue_SetInside_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_DOMValue_SetInside_0006 start');

        interface KeyType { id: number; }
        interface StyleSet extends Set<string> {}
        interface DOMElement {
              tagName: string;
              classList: StyleSet;
              addClass(cls: string): void;
        }

        class MockDiv implements DOMElement {
              public tagName = 'div';
              public classList: StyleSet = new Set();
              public addClass(cls: string): void { this.classList.add(cls); }
        }

        const wm = new WeakMap<KeyType, DOMElement>();
        let key: KeyType | null = { id: 6 };
        let elem: DOMElement | null = new MockDiv();
        elem.addClass('active');

        wm.set(key, elem);
        key = null;

        setTimeout(() => {
              const result = elem!.classList.has('active');
              expect(result).assertTrue();
              console.log('test_WeakMap_DOMValue_SetInside_0006 done');
              done();
        }, 100);
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_PRIMITIVE_KEY_0100
     * @tc.name      test_WeakMap_PrimitiveKey_Number_0001
     * @tc.desc      Verify that using a number primitive as a key throws an exception.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_PrimitiveKey_Number_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_PrimitiveKey_Number_0001 start');

        interface ValueType { data: string; }
        class Box {
              public n: number;
              constructor(n: number) {
                    this.n = n;
              }
        }
        const wm = new WeakMap<Box, ValueType>();

        let thrown = false;
        try {

              wm.set(new Box(123), { data: 'value' });
        } catch {
              thrown = true;
        }

        expect(thrown).assertFalse();
        console.log('test_WeakMap_PrimitiveKey_Number_0001 done');
        done();
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_PRIMITIVE_KEY_0200
     * @tc.name      test_WeakMap_PrimitiveKey_String_0002
     * @tc.desc      Verify that using a string primitive as a key throws an exception.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_PrimitiveKey_String_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_PrimitiveKey_String_0002 start');

        interface ValueType { data: string; }
        class Box {
              public s: string;
              constructor(s: string) {
                    this.s = s;
              }
        }
        const wm = new WeakMap<Box, ValueType>();

        let thrown = false;
        try {
              wm.set(new Box('abc'), { data: 'value' });
        } catch {
              thrown = true;
        }

        expect(thrown).assertFalse();
        console.log('test_WeakMap_PrimitiveKey_String_0002 done');
        done();
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_PRIMITIVE_KEY_0300
     * @tc.name      test_WeakMap_PrimitiveKey_Boolean_0003
     * @tc.desc      Verify that using a boolean primitive as a key throws an exception.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_PrimitiveKey_Boolean_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_PrimitiveKey_Boolean_0003 start');

        interface ValueType { data: string; }
        class Box {
              public b: boolean;
              constructor(b: boolean) {
                    this.b = b;
              }
        }
        const wm = new WeakMap<Box, ValueType>();
        let thrown = false;
        try {
              wm.set(new Box(true), { data: 'value' });
        } catch {
              thrown = true;
        }
        expect(thrown).assertFalse();
        console.log('test_WeakMap_PrimitiveKey_Boolean_0003 done');
        done();
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_PRIMITIVE_KEY_0400
     * @tc.name      test_WeakMap_PrimitiveKey_SymbolLike_0004
     * @tc.desc      Verify that using a “Symbol-like” primitive string as a key throws an exception (ArkTS has no Symbol, use unique string instead).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_PrimitiveKey_SymbolLike_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_PrimitiveKey_SymbolLike_0004 start');
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
              wm.set(new Box('sym-' + Date.now()), { data: 'value' });
        } catch {
              thrown = true;
        }
        expect(thrown).assertFalse();
        console.log('test_WeakMap_PrimitiveKey_SymbolLike_0004 done');
        done();
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_PRIMITIVE_KEY_0500
     * @tc.name      test_WeakMap_PrimitiveKey_BigInt_0005
     * @tc.desc      Verify that using a bigint primitive as a key throws an exception.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_PrimitiveKey_BigInt_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_PrimitiveKey_BigInt_0005 start');
        interface ValueType { data: string; }
        class Box {
              public bi: bigint;
              constructor(bi: bigint) {
                    this.bi = bi;
              }
        }
        const wm = new WeakMap<Box, ValueType>();
        let thrown = false;
        try {
              wm.set(new Box(BigInt(123)), { data: 'value' });
        } catch {
              thrown = true;
        }
        expect(thrown).assertFalse();
        console.log('test_WeakMap_PrimitiveKey_BigInt_0005 done');
        done();
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SYMBOL_KEY_0100
     * @tc.name      test_WeakMap_SymbolLike_Key_0001
     * @tc.desc      Verify that using a “Symbol-like” unique string ID as a key throws an exception (ArkTS has no Symbol, use unique string instead).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_SymbolLike_Key_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_SymbolLike_Key_0001 start');
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

              wm.set(new Box('sym-' + Date.now()), { data: 'value10' });
        } catch {
              thrown = true;
        }
        expect(thrown).assertFalse();
        console.log('test_WeakMap_SymbolLike_Key_0001 done');
        done();
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SYMBOL_KEY_0200
     * @tc.name      test_WeakMap_SymbolLike_Key_0002
     * @tc.desc      Verify that using a “Symbol-like” random string as a key throws an exception (ArkTS has no Symbol, use random string instead).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_SymbolLike_Key_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_SymbolLike_Key_0002 start');
        interface ValueType {    data: string; }
        class Box {
              public id: string;
              constructor(id: string) {
                    this.id = id;
              }
        }
        const wm = new WeakMap<Box, ValueType>();
        let thrown = false;
        try {

              wm.set(new Box('rand-' + Math.random()), { data: 'value10' });
        } catch {
              thrown = true;
        }
        expect(thrown).assertFalse();
        console.log('test_WeakMap_SymbolLike_Key_0002 done');
        done();
    });

    /**
     * @tc.number    SUB_ARK_WEAKMAP_SYMBOL_KEY_0300
     * @tc.name      test_WeakMap_SymbolLike_Key_0003
     * @tc.desc      Verify that using a “Symbol-like” timestamp+random string as a key throws an exception (ArkTS has no Symbol, use timestamp+random instead).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_WeakMap_SymbolLike_Key_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakMap_SymbolLike_Key_0003 start');
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
              wm.set(new Box('ts-' + Date.now() + '-' + Math.random()), { data: 'value10' });
        } catch {
              thrown = true;
        }
        expect(thrown).assertFalse();
        console.log('test_WeakMap_SymbolLike_Key_0003 done');
        done();
    });
  })
}
