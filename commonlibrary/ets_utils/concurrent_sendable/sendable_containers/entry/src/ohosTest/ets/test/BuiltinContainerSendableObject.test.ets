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

@Sendable
function sendableFunction(x: number): number {
  return x * 2;
}

const enum SendableEnum {
  VALUE1 = 1,
  VALUE2 = 2,
  VALUE3 = 3
}

export default function builtinContainerSendableObjectTest() {
  describe('builtinContainerSendableObjectTest', () => {
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
     * @tc.name   builtinArraySendableClassTyped0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_ARRAY_SENDABLE_TYPED_0100
     * @tc.desc   Array sendableClass typed test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinArraySendableClassTyped0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinArraySendableClassTyped0100';
        console.info(`${caseName} test start`);
        let arr: Array<SendableClass> = new Array<SendableClass>();
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
     * @tc.name   builtinArraySendableClassObject0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_ARRAY_SENDABLE_OBJECT_0100
     * @tc.desc   Array sendableClass object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinArraySendableClassObject0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinArraySendableClassObject0100';
        console.info(`${caseName} test start`);
        let arr: Array<object> = new Array<object>();
        let obj1 = new SendableClass(1) as object;
        let obj2 = new SendableClass(2) as object;
        arr.push(obj1);
        arr.push(obj2);
        expect(arr.length).assertEqual(2);
        expect((arr[0] as SendableClass).value).assertEqual(1);
        expect((arr[1] as SendableClass).value).assertEqual(2);
        let arr2 = arr.filter((item) => (item as SendableClass).value > 0);
        expect(arr2.length).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinArraySendableFunctionTyped0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_ARRAY_SENDABLE_FUNCTION_TYPED_0100
     * @tc.desc   Array sendableFunction typed test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinArraySendableFunctionTyped0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinArraySendableFunctionTyped0100';
        console.info(`${caseName} test start`);
        let arr: Array<(x: number) => number> = new Array<(x: number) => number>();
        arr.push(sendableFunction);
        expect(arr.length).assertEqual(1);
        let result: number = arr[0](5);
        expect(result).assertEqual(10);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinArraySendableEnumTyped0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_ARRAY_SENDABLE_ENUM_TYPED_0100
     * @tc.desc   Array sendableEnum typed test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinArraySendableEnumTyped0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinArraySendableEnumTyped0100';
        console.info(`${caseName} test start`);
        let arr: Array<SendableEnum> = new Array<SendableEnum>();
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
     * @tc.name   builtinMapSendableClassTyped0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_MAP_SENDABLE_TYPED_0100
     * @tc.desc   Map sendableClass typed test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinMapSendableClassTyped0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinMapSendableClassTyped0100';
        console.info(`${caseName} test start`);
        let map: Map<number, SendableClass> = new Map<number, SendableClass>();
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
     * @tc.name   builtinMapSendableClassObject0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_MAP_SENDABLE_OBJECT_0100
     * @tc.desc   Map sendableClass object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinMapSendableClassObject0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinMapSendableClassObject0100';
        console.info(`${caseName} test start`);
        let map: Map<number, object> = new Map<number, object>();
        let obj1 = new SendableClass(1) as object;
        let obj2 = new SendableClass(2) as object;
        map.set(1, obj1);
        map.set(2, obj2);
        expect(map.size).assertEqual(2);
        expect((map.get(1) as SendableClass).value).assertEqual(1);
        expect((map.get(2) as SendableClass).value).assertEqual(2);
        map.forEach((value, key) => {
          expect(key > 0).assertTrue();
        });
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinMapSendableKeyTyped0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_MAP_SENDABLE_KEY_TYPED_0100
     * @tc.desc   Map sendableKey typed test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinMapSendableKeyTyped0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinMapSendableKeyTyped0100';
        console.info(`${caseName} test start`);
        let map: Map<SendableClass, SendableClass> = new Map<SendableClass, SendableClass>();
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
     * @tc.name   builtinSetSendableClassTyped0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_SET_SENDABLE_TYPED_0100
     * @tc.desc   Set sendableClass typed test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinSetSendableClassTyped0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinSetSendableClassTyped0100';
        console.info(`${caseName} test start`);
        let set: Set<SendableClass> = new Set<SendableClass>();
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
     * @tc.name   builtinSetSendableClassObject0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_SET_SENDABLE_OBJECT_0100
     * @tc.desc   Set sendableClass object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinSetSendableClassObject0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinSetSendableClassObject0100';
        console.info(`${caseName} test start`);
        let set: Set<object> = new Set<object>();
        let obj1 = new SendableClass(1) as object;
        let obj2 = new SendableClass(2) as object;
        set.add(obj1);
        set.add(obj2);
        expect(set.size).assertEqual(2);
        expect(set.has(obj1)).assertTrue();
        let count = 0;
        set.forEach((value) => {
          count++;
        });
        expect(count).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinArrayBoundaryGet0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_ARRAY_BOUNDARY_GET_0100
     * @tc.desc   Array get empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinArrayBoundaryGet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinArrayBoundaryGet0100';
        console.info(`${caseName} test start`);
        let arr: Array<SendableClass> = new Array<SendableClass>();
        expect(arr.length).assertEqual(0);
        expect(arr[0]).assertEqual(undefined);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinArrayBoundaryObjectGet0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_ARRAY_BOUNDARY_OBJECT_GET_0100
     * @tc.desc   Array get object empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinArrayBoundaryObjectGet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinArrayBoundaryObjectGet0100';
        console.info(`${caseName} test start`);
        let arr: Array<object> = new Array<object>();
        expect(arr.length).assertEqual(0);
        expect(arr[0]).assertEqual(undefined);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinArrayBoundaryPop0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_ARRAY_BOUNDARY_POP_0100
     * @tc.desc   Array pop empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinArrayBoundaryPop0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinArrayBoundaryPop0100';
        console.info(`${caseName} test start`);
        let arr: Array<SendableClass> = new Array<SendableClass>();
        let result = arr.pop();
        expect(result).assertEqual(undefined);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinArrayBoundaryObjectPop0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_ARRAY_BOUNDARY_OBJECT_POP_0100
     * @tc.desc   Array pop object empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinArrayBoundaryObjectPop0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinArrayBoundaryObjectPop0100';
        console.info(`${caseName} test start`);
        let arr: Array<object> = new Array<object>();
        let result = arr.pop();
        expect(result).assertEqual(undefined);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinMapBoundaryGet0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_MAP_BOUNDARY_GET_0100
     * @tc.desc   Map get empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinMapBoundaryGet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinMapBoundaryGet0100';
        console.info(`${caseName} test start`);
        let map: Map<number, SendableClass> = new Map<number, SendableClass>();
        expect(map.size).assertEqual(0);
        expect(map.get(1)).assertEqual(undefined);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinMapBoundaryDelete0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_MAP_BOUNDARY_DELETE_0100
     * @tc.desc   Map delete empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinMapBoundaryDelete0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinMapBoundaryDelete0100';
        console.info(`${caseName} test start`);
        let map: Map<number, SendableClass> = new Map<number, SendableClass>();
        let result = map.delete(1);
        expect(result).assertFalse();
        expect(map.size).assertEqual(0);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinMapBoundaryObjectGet0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_MAP_BOUNDARY_OBJECT_GET_0100
     * @tc.desc   Map get object empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinMapBoundaryObjectGet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinMapBoundaryObjectGet0100';
        console.info(`${caseName} test start`);
        let map: Map<number, object> = new Map<number, object>();
        expect(map.size).assertEqual(0);
        expect(map.get(1)).assertEqual(undefined);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinMapBoundaryObjectDelete0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_MAP_BOUNDARY_OBJECT_DELETE_0100
     * @tc.desc   Map delete object empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinMapBoundaryObjectDelete0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinMapBoundaryObjectDelete0100';
        console.info(`${caseName} test start`);
        let map: Map<number, object> = new Map<number, object>();
        let result = map.delete(1);
        expect(result).assertFalse();
        expect(map.size).assertEqual(0);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinMapBoundaryObjectKeyGet0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_MAP_BOUNDARY_OBJECT_KEY_GET_0100
     * @tc.desc   Map objectKey get empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinMapBoundaryObjectKeyGet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinMapBoundaryObjectKeyGet0100';
        console.info(`${caseName} test start`);
        let map: Map<object, SendableClass> = new Map<object, SendableClass>();
        expect(map.size).assertEqual(0);
        let keyObj = new SendableClass(1) as object;
        expect(map.get(keyObj)).assertEqual(undefined);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinMapBoundaryObjectKeyDelete0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_MAP_BOUNDARY_OBJECT_KEY_DELETE_0100
     * @tc.desc   Map objectKey delete empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinMapBoundaryObjectKeyDelete0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinMapBoundaryObjectKeyDelete0100';
        console.info(`${caseName} test start`);
        let map: Map<object, SendableClass> = new Map<object, SendableClass>();
        let keyObj = new SendableClass(1) as object;
        let result = map.delete(keyObj);
        expect(result).assertFalse();
        expect(map.size).assertEqual(0);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinMapBoundaryObjectKeyValue0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_MAP_BOUNDARY_OBJECT_KEY_VALUE_0100
     * @tc.desc   Map objectKeyValue empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinMapBoundaryObjectKeyValue0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinMapBoundaryObjectKeyValue0100';
        console.info(`${caseName} test start`);
        let map: Map<object, object> = new Map<object, object>();
        expect(map.size).assertEqual(0);
        let keyObj = new SendableClass(1) as object;
        expect(map.get(keyObj)).assertEqual(undefined);
        let result = map.delete(keyObj);
        expect(result).assertFalse();
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinSetBoundaryHas0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_SET_BOUNDARY_HAS_0100
     * @tc.desc   Set has empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinSetBoundaryHas0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinSetBoundaryHas0100';
        console.info(`${caseName} test start`);
        let set: Set<SendableClass> = new Set<SendableClass>();
        expect(set.size).assertEqual(0);
        let obj = new SendableClass(1);
        expect(set.has(obj)).assertFalse();
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinSetBoundaryDelete0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_SET_BOUNDARY_DELETE_0100
     * @tc.desc   Set delete empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinSetBoundaryDelete0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinSetBoundaryDelete0100';
        console.info(`${caseName} test start`);
        let set: Set<SendableClass> = new Set<SendableClass>();
        let obj = new SendableClass(1);
        let result = set.delete(obj);
        expect(result).assertFalse();
        expect(set.size).assertEqual(0);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinSetBoundaryObjectHas0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_SET_BOUNDARY_OBJECT_HAS_0100
     * @tc.desc   Set has object empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinSetBoundaryObjectHas0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinSetBoundaryObjectHas0100';
        console.info(`${caseName} test start`);
        let set: Set<object> = new Set<object>();
        expect(set.size).assertEqual(0);
        let obj = new SendableClass(1) as object;
        expect(set.has(obj)).assertFalse();
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinSetBoundaryObjectDelete0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_SET_BOUNDARY_OBJECT_DELETE_0100
     * @tc.desc   Set delete object empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinSetBoundaryObjectDelete0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinSetBoundaryObjectDelete0100';
        console.info(`${caseName} test start`);
        let set: Set<object> = new Set<object>();
        let obj = new SendableClass(1) as object;
        let result = set.delete(obj);
        expect(result).assertFalse();
        expect(set.size).assertEqual(0);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinArrayCombinedOperations0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_ARRAY_COMBINED_0100
     * @tc.desc   Array combined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinArrayCombinedOperations0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinArrayCombinedOperations0100';
        console.info(`${caseName} test start`);
        let arr: Array<SendableClass> = new Array<SendableClass>();

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
     * @tc.name   builtinMapCombinedOperations0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_MAP_COMBINED_0100
     * @tc.desc   Map combined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinMapCombinedOperations0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinMapCombinedOperations0100';
        console.info(`${caseName} test start`);
        let map: Map<number, SendableClass> = new Map<number, SendableClass>();

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
     * @tc.name   builtinSetCombinedOperations0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_SET_COMBINED_0100
     * @tc.desc   Set combined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinSetCombinedOperations0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinSetCombinedOperations0100';
        console.info(`${caseName} test start`);
        let set: Set<SendableClass> = new Set<SendableClass>();

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
     * @tc.name   builtinArrayStress0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_ARRAY_STRESS_0100
     * @tc.desc   Array stress test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinArrayStress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinArrayStress0100';
        console.info(`${caseName} test start`);
        let arr: Array<SendableClass> = new Array<SendableClass>();

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
     * @tc.name   builtinMapStress0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_MAP_STRESS_0100
     * @tc.desc   Map stress test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinMapStress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinMapStress0100';
        console.info(`${caseName} test start`);
        let map: Map<number, SendableClass> = new Map<number, SendableClass>();

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
     * @tc.name   builtinSetStress0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_SET_STRESS_0100
     * @tc.desc   Set stress test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinSetStress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinSetStress0100';
        console.info(`${caseName} test start`);
        let set: Set<SendableClass> = new Set<SendableClass>();
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
     * @tc.name   builtinArrayWithCollectionsArray0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_ARRAY_WITH_COLLECTIONS_ARRAY_0100
     * @tc.desc   Array storing collectionsArray test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinArrayWithCollectionsArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinArrayWithCollectionsArray0100';
        console.info(`${caseName} test start`);
        let arr: Array<collections.Array<number>> = new Array<collections.Array<number>>();
        const nestedArr = new collections.Array<number>();
        nestedArr.push(1);
        nestedArr.push(2);
        nestedArr.push(3);
        arr.push(nestedArr);
        expect(arr.length).assertEqual(1);
        expect(arr[0] !== null).assertTrue();
        expect(arr[0].length).assertEqual(3);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinArrayWithCollectionsMap0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_ARRAY_WITH_COLLECTIONS_MAP_0100
     * @tc.desc   Array storing collectionsMap test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinArrayWithCollectionsMap0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinArrayWithCollectionsMap0100';
        console.info(`${caseName} test start`);
        let arr: Array<collections.Map<number, number>> = new Array<collections.Map<number, number>>();
        const nestedMap = new collections.Map<number, number>();
        nestedMap.set(1, 10);
        nestedMap.set(2, 20);
        arr.push(nestedMap);
        expect(arr.length).assertEqual(1);
        expect(arr[0] !== null).assertTrue();
        expect(arr[0].size).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinArrayWithCollectionsSet0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_ARRAY_WITH_COLLECTIONS_SET_0100
     * @tc.desc   Array storing collectionsSet test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinArrayWithCollectionsSet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinArrayWithCollectionsSet0100';
        console.info(`${caseName} test start`);
        let arr: Array<collections.Set<number>> = new Array<collections.Set<number>>();
        const nestedSet = new collections.Set<number>();
        nestedSet.add(1);
        nestedSet.add(2);
        nestedSet.add(3);
        arr.push(nestedSet);
        expect(arr.length).assertEqual(1);
        expect(arr[0] !== null).assertTrue();
        expect(arr[0].size).assertEqual(3);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinMapWithCollectionsArray0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_MAP_WITH_COLLECTIONS_ARRAY_0100
     * @tc.desc   Map storing collectionsArray test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinMapWithCollectionsArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinMapWithCollectionsArray0100';
        console.info(`${caseName} test start`);
        let map: Map<number, collections.Array<number>> = new Map<number, collections.Array<number>>();
        const nestedArr = new collections.Array<number>();
        nestedArr.push(1);
        nestedArr.push(2);
        nestedArr.push(3);
        map.set(1, nestedArr);
        expect(map.size).assertEqual(1);
        expect(map.get(1) !== null).assertTrue();
        expect(map.get(1)!.length).assertEqual(3);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinMapWithCollectionsMap0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_MAP_WITH_COLLECTIONS_MAP_0100
     * @tc.desc   Map storing collectionsMap test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinMapWithCollectionsMap0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinMapWithCollectionsMap0100';
        console.info(`${caseName} test start`);
        let map: Map<number, collections.Map<number, number>> = new Map<number, collections.Map<number, number>>();
        const nestedMap = new collections.Map<number, number>();
        nestedMap.set(1, 10);
        nestedMap.set(2, 20);
        map.set(1, nestedMap);
        expect(map.size).assertEqual(1);
        expect(map.get(1) !== null).assertTrue();
        expect(map.get(1)!.size).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinMapWithCollectionsSet0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_MAP_WITH_COLLECTIONS_SET_0100
     * @tc.desc   Map storing collectionsSet test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinMapWithCollectionsSet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinMapWithCollectionsSet0100';
        console.info(`${caseName} test start`);
        let map: Map<number, collections.Set<number>> = new Map<number, collections.Set<number>>();
        const nestedSet = new collections.Set<number>();
        nestedSet.add(1);
        nestedSet.add(2);
        nestedSet.add(3);
        map.set(1, nestedSet);
        expect(map.size).assertEqual(1);
        expect(map.get(1) !== null).assertTrue();
        expect(map.get(1)!.size).assertEqual(3);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinSetWithCollectionsArray0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_SET_WITH_COLLECTIONS_ARRAY_0100
     * @tc.desc   Set storing collectionsArray test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinSetWithCollectionsArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinSetWithCollectionsArray0100';
        console.info(`${caseName} test start`);
        let set: Set<collections.Array<number>> = new Set<collections.Array<number>>();
        const nestedArr = new collections.Array<number>();
        nestedArr.push(1);
        nestedArr.push(2);
        nestedArr.push(3);
        set.add(nestedArr);
        expect(set.size).assertEqual(1);
        expect(set.has(nestedArr)).assertTrue();
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinSetWithCollectionsMap0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_SET_WITH_COLLECTIONS_MAP_0100
     * @tc.desc   Set storing collectionsMap test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinSetWithCollectionsMap0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinSetWithCollectionsMap0100';
        console.info(`${caseName} test start`);
        let set: Set<collections.Map<number, number>> = new Set<collections.Map<number, number>>();
        const nestedMap = new collections.Map<number, number>();
        nestedMap.set(1, 10);
        nestedMap.set(2, 20);
        set.add(nestedMap);
        expect(set.size).assertEqual(1);
        expect(set.has(nestedMap)).assertTrue();
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinSetWithCollectionsSet0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_SET_WITH_COLLECTIONS_SET_0100
     * @tc.desc   Set storing collectionsSet test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinSetWithCollectionsSet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinSetWithCollectionsSet0100';
        console.info(`${caseName} test start`);
        let set: Set<collections.Set<number>> = new Set<collections.Set<number>>();
        const nestedSet = new collections.Set<number>();
        nestedSet.add(1);
        nestedSet.add(2);
        nestedSet.add(3);
        set.add(nestedSet);
        expect(set.size).assertEqual(1);
        expect(set.has(nestedSet)).assertTrue();
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinMapObjectKeyFullOperations0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_MAP_OBJECT_KEY_FULL_0100
     * @tc.desc   Map objectKey full operations test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinMapObjectKeyFullOperations0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinMapObjectKeyFullOperations0100';
        console.info(`${caseName} test start`);
        let map: Map<object, SendableClass> = new Map<object, SendableClass>();
        let key1 = new SendableClass(1) as object;
        let key2 = new SendableClass(2) as object;
        let value1 = new SendableClass(10);
        let value2 = new SendableClass(20);
        map.set(key1, value1);
        map.set(key2, value2);
        expect(map.size).assertEqual(2);
        expect(map.get(key1)!.value).assertEqual(10);
        expect(map.get(key2)!.value).assertEqual(20);
        expect(map.has(key1)).assertTrue();
        map.set(key1, new SendableClass(100));
        expect(map.get(key1)!.value).assertEqual(100);
        map.delete(key2);
        expect(map.size).assertEqual(1);
        expect(map.has(key2)).assertFalse();
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinSetObjectFullOperations0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_SET_OBJECT_FULL_0100
     * @tc.desc   Set object full operations test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinSetObjectFullOperations0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinSetObjectFullOperations0100';
        console.info(`${caseName} test start`);
        let set: Set<object> = new Set<object>();
        let obj1 = new SendableClass(1) as object;
        let obj2 = new SendableClass(2) as object;
        let obj3 = new SendableClass(3) as object;
        set.add(obj1);
        set.add(obj2);
        set.add(obj3);
        expect(set.size).assertEqual(3);
        expect(set.has(obj1)).assertTrue();
        expect(set.has(obj2)).assertTrue();
        set.delete(obj2);
        expect(set.size).assertEqual(2);
        expect(set.has(obj2)).assertFalse();
        set.add(obj1);
        expect(set.size).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinArrayNegativeIndex0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_ARRAY_NEGATIVE_INDEX_0100
     * @tc.desc   Array negative index test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinArrayNegativeIndex0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinArrayNegativeIndex0100';
        console.info(`${caseName} test start`);
        let arr: Array<SendableClass> = new Array<SendableClass>();
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
     * @tc.name   builtinArrayOutOfBoundsIndex0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_ARRAY_OUT_OF_BOUNDS_0100
     * @tc.desc   Array out of bounds index test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinArrayOutOfBoundsIndex0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinArrayOutOfBoundsIndex0100';
        console.info(`${caseName} test start`);
        let arr: Array<SendableClass> = new Array<SendableClass>();
        arr.push(new SendableClass(1));
        arr.push(new SendableClass(2));
        expect(arr[100]).assertEqual(undefined);
        expect(arr[1000]).assertEqual(undefined);
        expect(arr.length).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   builtinMapClear0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_MAP_CLEAR_0100
     * @tc.desc   Map clear test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinMapClear0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinMapClear0100';
        console.info(`${caseName} test start`);
        let map: Map<number, SendableClass> = new Map<number, SendableClass>();
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
     * @tc.name   builtinSetClear0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_SET_CLEAR_0100
     * @tc.desc   Set clear test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinSetClear0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinSetClear0100';
        console.info(`${caseName} test start`);
        let set: Set<SendableClass> = new Set<SendableClass>();
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
     * @tc.name   builtinArrayStress1000_0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_ARRAY_STRESS_TEST_0100
     * @tc.desc   Array stress 1000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinArrayStress1000_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinArrayStress1000_0100';
        console.info(`${caseName} test start`);
        let arr: Array<SendableClass> = new Array<SendableClass>();
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
     * @tc.name   builtinMapStress1000_0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_MAP_STRESS_TEST_0100
     * @tc.desc   Map stress 1000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinMapStress1000_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinMapStress1000_0100';
        console.info(`${caseName} test start`);
        let map: Map<number, SendableClass> = new Map<number, SendableClass>();
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
     * @tc.name   builtinSetStress1000_0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_SET_STRESS_TEST_0100
     * @tc.desc   Set stress 1000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinSetStress1000_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinSetStress1000_0100';
        console.info(`${caseName} test start`);
        let set: Set<SendableClass> = new Set<SendableClass>();
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
     * @tc.name   builtinNestedContainerModify0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUILTIN_NESTED_MODIFY_0100
     * @tc.desc   Array nested collections modify test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinNestedContainerModify0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'builtinNestedContainerModify0100';
        console.info(`${caseName} test start`);
        let arr: Array<collections.Array<number>> = new Array<collections.Array<number>>();
        const nestedArr = new collections.Array<number>();
        nestedArr.push(1);
        nestedArr.push(2);
        arr.push(nestedArr);
        expect(arr[0].length).assertEqual(2);
        nestedArr.push(3);
        expect(arr[0].length).assertEqual(3);
        expect(arr[0][2]).assertEqual(3);
        console.info(`${caseName} test end`);
        done()
      })
  })
}