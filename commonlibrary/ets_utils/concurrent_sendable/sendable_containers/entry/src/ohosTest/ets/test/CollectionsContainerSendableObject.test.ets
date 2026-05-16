/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';

export function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => {
    setTimeout(() => {
      resolve()
    }, time)
  })
}

@Sendable
class SendableClass {
  public value: number;

  constructor(value: number) {
    this.value = value;
  }
}

const enum SendableEnum {
  VALUE1 = 1,
  VALUE2 = 2,
  VALUE3 = 3
}

export default function collectionsContainerSendableObjectTest() {
  describe('collectionsContainerSendableObjectTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await sleep(200);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   collectionsArraySendableClassTyped0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_ARRAY_SENDABLE_TYPED_0100
     * @tc.desc   collectionsArray sendableClass typed test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsArraySendableClassTyped0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsArraySendableClassTyped0100';
        console.info(`${caseName} test start`);
        let arr: collections.Array<SendableClass> = new collections.Array<SendableClass>();
        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        arr.push(obj1);
        arr.push(obj2);
        expect(arr.length).assertEqual(2);
        expect(arr[0].value).assertEqual(1);
        expect(arr[1].value).assertEqual(2);
        let popped = arr.pop();
        expect(popped!.value).assertEqual(2);
        expect(arr.length).assertEqual(1);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsArraySendableClassObject0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_ARRAY_SENDABLE_OBJECT_0100
     * @tc.desc   collectionsArray sendableClass object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsArraySendableClassObject0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsArraySendableClassObject0100';
        console.info(`${caseName} test start`);
        let arr: collections.Array<SendableClass> = new collections.Array<SendableClass>();
        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        arr.push(obj1);
        arr.push(obj2);
        expect(arr.length).assertEqual(2);
        expect((arr[0] as SendableClass).value).assertEqual(1);
        expect((arr[1] as SendableClass).value).assertEqual(2);
        arr.forEach((value: SendableClass, index: number) => {
          expect(index >= 0).assertTrue();
        });
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsArraySendableClassTyped0200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_ARRAY_SENDABLE_TYPED_0200
     * @tc.desc   collectionsArray sendableClass typed test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsArraySendableClassTyped0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsArraySendableClassTyped0200';
        console.info(`${caseName} test start`);
        let arr: collections.Array<SendableClass> = new collections.Array<SendableClass>();
        let obj = new SendableClass(5);
        arr.push(obj);
        expect(arr.length).assertEqual(1);
        expect(arr[0].value).assertEqual(5);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsArraySendableEnumTyped0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_ARRAY_SENDABLE_ENUM_TYPED_0100
     * @tc.desc   collectionsArray sendableEnum typed test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsArraySendableEnumTyped0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsArraySendableEnumTyped0100';
        console.info(`${caseName} test start`);
        let arr: collections.Array<SendableEnum> = new collections.Array<SendableEnum>();
        arr.push(SendableEnum.VALUE1);
        arr.push(SendableEnum.VALUE2);
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(SendableEnum.VALUE1);
        expect(arr[1]).assertEqual(SendableEnum.VALUE2);
        let found = arr.includes(SendableEnum.VALUE1);
        expect(found).assertTrue();
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsMapSendableClassTyped0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_MAP_SENDABLE_TYPED_0100
     * @tc.desc   collectionsMap sendableClass typed test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsMapSendableClassTyped0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsMapSendableClassTyped0100';
        console.info(`${caseName} test start`);
        let map: collections.Map<number, SendableClass> = new collections.Map<number, SendableClass>();
        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        map.set(1, obj1);
        map.set(2, obj2);
        expect(map.size).assertEqual(2);
        expect(map.get(1)!.value).assertEqual(1);
        expect(map.get(2)!.value).assertEqual(2);
        expect(map.has(1)).assertTrue();
        map.delete(1);
        expect(map.size).assertEqual(1);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsMapSendableClassObject0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_MAP_SENDABLE_OBJECT_0100
     * @tc.desc   collectionsMap sendableClass object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsMapSendableClassObject0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsMapSendableClassObject0100';
        console.info(`${caseName} test start`);
        let map: collections.Map<number, SendableClass> = new collections.Map<number, SendableClass>();
        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        map.set(1, obj1);
        map.set(2, obj2);
        expect(map.size).assertEqual(2);
        expect((map.get(1) as SendableClass).value).assertEqual(1);
        expect((map.get(2) as SendableClass).value).assertEqual(2);
        map.forEach((value: SendableClass, key: number) => {
          expect(key > 0).assertTrue();
        });
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsMapSendableKeyTyped0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_MAP_SENDABLE_KEY_TYPED_0100
     * @tc.desc   collectionsMap sendableKey typed test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsMapSendableKeyTyped0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsMapSendableKeyTyped0100';
        console.info(`${caseName} test start`);
        let map: collections.Map<SendableClass, SendableClass> = new collections.Map<SendableClass, SendableClass>();
        let key1 = new SendableClass(1);
        let key2 = new SendableClass(2);
        let value1 = new SendableClass(10);
        let value2 = new SendableClass(20);
        map.set(key1, value1);
        map.set(key2, value2);
        expect(map.size).assertEqual(2);
        expect(map.get(key1)!.value).assertEqual(10);
        expect(map.get(key2)!.value).assertEqual(20);
        expect(map.has(key1)).assertTrue();
        map.delete(key1);
        expect(map.size).assertEqual(1);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsSetSendableClassTyped0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_SET_SENDABLE_TYPED_0100
     * @tc.desc   collectionsSet sendableClass typed test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsSetSendableClassTyped0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSetSendableClassTyped0100';
        console.info(`${caseName} test start`);
        let set: collections.Set<SendableClass> = new collections.Set<SendableClass>();
        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        set.add(obj1);
        set.add(obj2);
        expect(set.size).assertEqual(2);
        expect(set.has(obj1)).assertTrue();
        expect(set.has(obj2)).assertTrue();
        set.delete(obj1);
        expect(set.size).assertEqual(1);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsSetSendableClassObject0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_SET_SENDABLE_OBJECT_0100
     * @tc.desc   collectionsSet sendableClass object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsSetSendableClassObject0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSetSendableClassObject0100';
        console.info(`${caseName} test start`);
        let set: collections.Set<SendableClass> = new collections.Set<SendableClass>();
        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        set.add(obj1);
        set.add(obj2);
        expect(set.size).assertEqual(2);
        expect(set.has(obj1)).assertTrue();
        expect(set.has(obj2)).assertTrue();
        set.forEach((value: SendableClass) => {
          expect(value !== null).assertTrue();
        });
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsArrayWithNestedCollections0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_ARRAY_NESTED_COLLECTIONS_0100
     * @tc.desc   collectionsArray nested test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsArrayWithNestedCollections0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsArrayWithNestedCollections0100';
        console.info(`${caseName} test start`);
        let arr: collections.Array<collections.Array<number>> = new collections.Array<collections.Array<number>>();
        const nestedArr = new collections.Array<number>();
        nestedArr.push(1);
        nestedArr.push(2);
        nestedArr.push(3);
        arr.push(nestedArr);
        expect(arr.length).assertEqual(1);
        expect(arr[0] !== null).assertTrue();
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsArrayBoundaryGet0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_ARRAY_BOUNDARY_GET_0100
     * @tc.desc   collectionsArray get empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsArrayBoundaryGet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsArrayBoundaryGet0100';
        console.info(`${caseName} test start`);
        let arr: collections.Array<SendableClass> = new collections.Array<SendableClass>();
        expect(arr.length).assertEqual(0);
        expect(arr[0]).assertEqual(undefined);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsArrayBoundaryPop0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_ARRAY_BOUNDARY_POP_0100
     * @tc.desc   collectionsArray pop empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsArrayBoundaryPop0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsArrayBoundaryPop0100';
        console.info(`${caseName} test start`);
        let arr: collections.Array<SendableClass> = new collections.Array<SendableClass>();
        let result = arr.pop();
        expect(result).assertEqual(undefined);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsMapBoundaryGet0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_MAP_BOUNDARY_GET_0100
     * @tc.desc   collectionsMap get empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsMapBoundaryGet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsMapBoundaryGet0100';
        console.info(`${caseName} test start`);
        let map: collections.Map<number, SendableClass> = new collections.Map<number, SendableClass>();
        expect(map.size).assertEqual(0);
        expect(map.get(1)).assertEqual(undefined);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsMapBoundaryDelete0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_MAP_BOUNDARY_DELETE_0100
     * @tc.desc   collectionsMap delete empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsMapBoundaryDelete0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsMapBoundaryDelete0100';
        console.info(`${caseName} test start`);
        let map: collections.Map<number, SendableClass> = new collections.Map<number, SendableClass>();
        let result = map.delete(1);
        expect(result).assertFalse();
        expect(map.size).assertEqual(0);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsMapBoundarySendableKeyGet0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_MAP_BOUNDARY_SENDABLE_KEY_GET_0100
     * @tc.desc   collectionsMap sendableKey get empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsMapBoundarySendableKeyGet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsMapBoundarySendableKeyGet0100';
        console.info(`${caseName} test start`);
        let map: collections.Map<SendableClass, SendableClass> = new collections.Map<SendableClass, SendableClass>();
        expect(map.size).assertEqual(0);
        let keyObj = new SendableClass(1);
        expect(map.get(keyObj)).assertEqual(undefined);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsMapBoundarySendableKeyDelete0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_MAP_BOUNDARY_SENDABLE_KEY_DELETE_0100
     * @tc.desc   collectionsMap sendableKey delete empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsMapBoundarySendableKeyDelete0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsMapBoundarySendableKeyDelete0100';
        console.info(`${caseName} test start`);
        let map: collections.Map<SendableClass, SendableClass> = new collections.Map<SendableClass, SendableClass>();
        let keyObj = new SendableClass(1);
        let result = map.delete(keyObj);
        expect(result).assertFalse();
        expect(map.size).assertEqual(0);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsSetBoundaryHas0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_SET_BOUNDARY_HAS_0100
     * @tc.desc   collectionsSet has empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsSetBoundaryHas0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSetBoundaryHas0100';
        console.info(`${caseName} test start`);
        let set: collections.Set<SendableClass> = new collections.Set<SendableClass>();
        expect(set.size).assertEqual(0);
        let obj = new SendableClass(1);
        expect(set.has(obj)).assertFalse();
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsSetBoundaryDelete0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_SET_BOUNDARY_DELETE_0100
     * @tc.desc   collectionsSet delete empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsSetBoundaryDelete0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSetBoundaryDelete0100';
        console.info(`${caseName} test start`);
        let set: collections.Set<SendableClass> = new collections.Set<SendableClass>();
        let obj = new SendableClass(1);
        let result = set.delete(obj);
        expect(result).assertFalse();
        expect(set.size).assertEqual(0);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsArrayCombinedOperations0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_ARRAY_COMBINED_0100
     * @tc.desc   collectionsArray combined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsArrayCombinedOperations0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsArrayCombinedOperations0100';
        console.info(`${caseName} test start`);
        let arr: collections.Array<SendableClass> = new collections.Array<SendableClass>();

        arr.push(new SendableClass(1));
        arr.push(new SendableClass(2));
        arr.push(new SendableClass(3));
        expect(arr.length).assertEqual(3);

        arr.shift();
        expect(arr.length).assertEqual(2);
        expect(arr[0].value).assertEqual(2);

        arr.unshift(new SendableClass(0));
        expect(arr.length).assertEqual(3);
        expect(arr[0].value).assertEqual(0);

        arr.splice(1, 1);
        expect(arr.length).assertEqual(2);

        let filtered = arr.filter((item) => item.value > 0);
        expect(filtered.length).assertEqual(1);

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsMapCombinedOperations0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_MAP_COMBINED_0100
     * @tc.desc   collectionsMap combined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsMapCombinedOperations0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsMapCombinedOperations0100';
        console.info(`${caseName} test start`);
        let map: collections.Map<number, SendableClass> = new collections.Map<number, SendableClass>();

        map.set(1, new SendableClass(1));
        map.set(2, new SendableClass(2));
        map.set(3, new SendableClass(3));
        expect(map.size).assertEqual(3);

        map.delete(2);
        expect(map.size).assertEqual(2);
        expect(map.has(2)).assertFalse();

        map.set(1, new SendableClass(10));
        expect(map.get(1)!.value).assertEqual(10);

        let keys = Array.from(map.keys());
        expect(keys.length).assertEqual(2);

        let values = Array.from(map.values());
        expect(values.length).assertEqual(2);

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsSetCombinedOperations0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_SET_COMBINED_0100
     * @tc.desc   collectionsSet combined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsSetCombinedOperations0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSetCombinedOperations0100';
        console.info(`${caseName} test start`);
        let set: collections.Set<SendableClass> = new collections.Set<SendableClass>();

        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        let obj3 = new SendableClass(3);

        set.add(obj1);
        set.add(obj2);
        set.add(obj3);
        expect(set.size).assertEqual(3);

        set.delete(obj2);
        expect(set.size).assertEqual(2);
        expect(set.has(obj2)).assertFalse();

        set.add(obj1);
        expect(set.size).assertEqual(2);

        let arr = Array.from(set);
        expect(arr.length).assertEqual(2);

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsArrayStress0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_ARRAY_STRESS_0100
     * @tc.desc   collectionsArray stress test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsArrayStress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsArrayStress0100';
        console.info(`${caseName} test start`);
        let arr: collections.Array<SendableClass> = new collections.Array<SendableClass>();

        for (let i = 0; i < 100; i++) {
          arr.push(new SendableClass(i));
        }
        expect(arr.length).assertEqual(100);

        for (let i = 0; i < 100; i++) {
          expect(arr[i].value).assertEqual(i);
        }

        for (let i = 0; i < 50; i++) {
          arr.pop();
        }
        expect(arr.length).assertEqual(50);

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsMapStress0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_MAP_STRESS_0100
     * @tc.desc   collectionsMap stress test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsMapStress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsMapStress0100';
        console.info(`${caseName} test start`);
        let map: collections.Map<number, SendableClass> = new collections.Map<number, SendableClass>();

        for (let i = 0; i < 100; i++) {
          map.set(i, new SendableClass(i));
        }
        expect(map.size).assertEqual(100);

        for (let i = 0; i < 100; i++) {
          expect(map.get(i)!.value).assertEqual(i);
        }

        for (let i = 0; i < 50; i++) {
          map.delete(i);
        }
        expect(map.size).assertEqual(50);

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsSetStress0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_SET_STRESS_0100
     * @tc.desc   collectionsSet stress test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsSetStress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSetStress0100';
        console.info(`${caseName} test start`);
        let set: collections.Set<SendableClass> = new collections.Set<SendableClass>();
        let objects: SendableClass[] = [];

        for (let i = 0; i < 100; i++) {
          let obj = new SendableClass(i);
          objects.push(obj);
          set.add(obj);
        }
        expect(set.size).assertEqual(100);

        for (let i = 0; i < 100; i++) {
          expect(set.has(objects[i])).assertTrue();
        }

        for (let i = 0; i < 50; i++) {
          set.delete(objects[i]);
        }
        expect(set.size).assertEqual(50);

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsArrayNegativeIndex0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_ARRAY_NEGATIVE_INDEX_0100
     * @tc.desc   collectionsArray negative index test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsArrayNegativeIndex0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsArrayNegativeIndex0100';
        console.info(`${caseName} test start`);
        let arr: collections.Array<SendableClass> = new collections.Array<SendableClass>();
        arr.push(new SendableClass(1));
        arr.push(new SendableClass(2));
        arr.push(new SendableClass(3));
        expect(arr[-1]).assertEqual(undefined);
        expect(arr[-100]).assertEqual(undefined);
        expect(arr.length).assertEqual(3);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsArrayOutOfBoundsIndex0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_ARRAY_OUT_OF_BOUNDS_0100
     * @tc.desc   collectionsArray out of bounds index test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsArrayOutOfBoundsIndex0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsArrayOutOfBoundsIndex0100';
        console.info(`${caseName} test start`);
        let arr: collections.Array<SendableClass> = new collections.Array<SendableClass>();
        arr.push(new SendableClass(1));
        arr.push(new SendableClass(2));
        expect(arr[100]).assertEqual(undefined);
        expect(arr[1000]).assertEqual(undefined);
        expect(arr.length).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsMapClear0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_MAP_CLEAR_0100
     * @tc.desc   collectionsMap clear test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsMapClear0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsMapClear0100';
        console.info(`${caseName} test start`);
        let map: collections.Map<number, SendableClass> = new collections.Map<number, SendableClass>();
        map.set(1, new SendableClass(1));
        map.set(2, new SendableClass(2));
        map.set(3, new SendableClass(3));
        expect(map.size).assertEqual(3);
        map.clear();
        expect(map.size).assertEqual(0);
        expect(map.has(1)).assertFalse();
        expect(map.get(1)).assertEqual(undefined);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsSetClear0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_SET_CLEAR_0100
     * @tc.desc   collectionsSet clear test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsSetClear0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSetClear0100';
        console.info(`${caseName} test start`);
        let set: collections.Set<SendableClass> = new collections.Set<SendableClass>();
        set.add(new SendableClass(1));
        set.add(new SendableClass(2));
        set.add(new SendableClass(3));
        expect(set.size).assertEqual(3);
        set.clear();
        expect(set.size).assertEqual(0);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsArrayStress1000_0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_ARRAY_STRESS_TEST_0100
     * @tc.desc   collectionsArray stress 1000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsArrayStress1000_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsArrayStress1000_0100';
        console.info(`${caseName} test start`);
        let arr: collections.Array<SendableClass> = new collections.Array<SendableClass>();
        for (let i = 0; i < 1000; i++) {
          arr.push(new SendableClass(i));
        }
        expect(arr.length).assertEqual(1000);
        for (let i = 0; i < 1000; i++) {
          expect(arr[i].value).assertEqual(i);
        }
        for (let i = 0; i < 500; i++) {
          arr.pop();
        }
        expect(arr.length).assertEqual(500);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsMapStress1000_0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_MAP_STRESS_TEST_0100
     * @tc.desc   collectionsMap stress 1000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsMapStress1000_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsMapStress1000_0100';
        console.info(`${caseName} test start`);
        let map: collections.Map<number, SendableClass> = new collections.Map<number, SendableClass>();
        for (let i = 0; i < 1000; i++) {
          map.set(i, new SendableClass(i));
        }
        expect(map.size).assertEqual(1000);
        for (let i = 0; i < 1000; i++) {
          expect(map.get(i)!.value).assertEqual(i);
        }
        for (let i = 0; i < 500; i++) {
          map.delete(i);
        }
        expect(map.size).assertEqual(500);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsSetStress1000_0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_SET_STRESS_TEST_0100
     * @tc.desc   collectionsSet stress 1000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsSetStress1000_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsSetStress1000_0100';
        console.info(`${caseName} test start`);
        let set: collections.Set<SendableClass> = new collections.Set<SendableClass>();
        let objects: SendableClass[] = [];
        for (let i = 0; i < 1000; i++) {
          let obj = new SendableClass(i);
          objects.push(obj);
          set.add(obj);
        }
        expect(set.size).assertEqual(1000);
        for (let i = 0; i < 1000; i++) {
          expect(set.has(objects[i])).assertTrue();
        }
        for (let i = 0; i < 500; i++) {
          set.delete(objects[i]);
        }
        expect(set.size).assertEqual(500);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsNestedContainerModify0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_NESTED_MODIFY_0100
     * @tc.desc   collectionsArray nested modify test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsNestedContainerModify0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsNestedContainerModify0100';
        console.info(`${caseName} test start`);
        let arr: collections.Array<collections.Array<number>> = new collections.Array<collections.Array<number>>();
        const nestedArr = new collections.Array<number>();
        nestedArr.push(1);
        nestedArr.push(2);
        arr.push(nestedArr);
        expect(arr[0].length).assertEqual(2);
        nestedArr.push(3);
        expect(arr[0].length).assertEqual(3);
        expect(arr[0][2]).assertEqual(3);
        nestedArr.pop();
        expect(arr[0].length).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsNestedMapModify0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_NESTED_MAP_MODIFY_0100
     * @tc.desc   collectionsMap nested modify test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsNestedMapModify0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsNestedMapModify0100';
        console.info(`${caseName} test start`);
        let map: collections.Map<number, collections.Array<number>> = new collections.Map<number, collections.Array<number>>();
        const nestedArr = new collections.Array<number>();
        nestedArr.push(1);
        nestedArr.push(2);
        map.set(1, nestedArr);
        expect(map.get(1)!.length).assertEqual(2);
        nestedArr.push(3);
        expect(map.get(1)!.length).assertEqual(3);
        expect(map.get(1)![2]).assertEqual(3);
        console.info(`${caseName} test end`);
        done()
      })
  })
}