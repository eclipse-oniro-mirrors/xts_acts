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
import {
  PlainArray,
  LinkedList,
  Queue,
  Stack,
  TreeMap,
  TreeSet,
  LightWeightMap,
  LightWeightSet,
  ArrayList,
  collections
} from '@kit.ArkTS';

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

export default function baselibContainerSendableObjectTest() {
  describe('baselibContainerSendableObjectTest', () => {
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
     * @tc.name   baselibPlainArraySendableClassTyped0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_PLAINARRAY_SENDABLE_TYPED_0100
     * @tc.desc   PlainArray sendableClass typed test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibPlainArraySendableClassTyped0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibPlainArraySendableClassTyped0100';
        console.info(`${caseName} test start`);
        let arr: PlainArray<SendableClass> = new PlainArray<SendableClass>();
        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        arr.add(0, obj1);
        arr.add(1, obj2);
        expect(arr.length).assertEqual(2);
        expect(arr.get(0)!.value).assertEqual(1);
        expect(arr.get(1)!.value).assertEqual(2);
        expect(arr.get(0) !== null).assertTrue();
        arr.remove(0);
        expect(arr.length).assertEqual(1);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibPlainArraySendableClassObject0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_PLAINARRAY_SENDABLE_OBJECT_0100
     * @tc.desc   PlainArray sendableClass object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibPlainArraySendableClassObject0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibPlainArraySendableClassObject0100';
        console.info(`${caseName} test start`);
        let arr: PlainArray<object> = new PlainArray<object>();
        let obj1 = new SendableClass(1) as object;
        let obj2 = new SendableClass(2) as object;
        arr.add(0, obj1);
        arr.add(1, obj2);
        expect(arr.length).assertEqual(2);
        expect((arr.get(0) as SendableClass).value).assertEqual(1);
        expect((arr.get(1) as SendableClass).value).assertEqual(2);
        let cloned = arr.clone();
        expect(cloned.length).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibLinkedListSendableClassTyped0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LINKEDLIST_SENDABLE_TYPED_0100
     * @tc.desc   LinkedList sendableClass typed test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibLinkedListSendableClassTyped0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibLinkedListSendableClassTyped0100';
        console.info(`${caseName} test start`);
        let list: LinkedList<SendableClass> = new LinkedList<SendableClass>();
        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        list.add(obj1);
        list.add(obj2);
        expect(list.length).assertEqual(2);
        expect(list.get(0)!.value).assertEqual(1);
        expect(list.get(1)!.value).assertEqual(2);
        list.addFirst(new SendableClass(0));
        expect(list.getFirst()!.value).assertEqual(0);
        expect(list.getLast()!.value).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibLinkedListSendableClassObject0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LINKEDLIST_SENDABLE_OBJECT_0100
     * @tc.desc   LinkedList sendableClass object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibLinkedListSendableClassObject0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibLinkedListSendableClassObject0100';
        console.info(`${caseName} test start`);
        let list: LinkedList<object> = new LinkedList<object>();
        let obj1 = new SendableClass(1) as object;
        let obj2 = new SendableClass(2) as object;
        list.add(obj1);
        list.add(obj2);
        expect(list.length).assertEqual(2);
        expect((list.get(0) as SendableClass).value).assertEqual(1);
        let removed = list.removeLast();
        expect((removed as SendableClass).value).assertEqual(2);
        expect(list.length).assertEqual(1);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibQueueSendableClassTyped0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_QUEUE_SENDABLE_TYPED_0100
     * @tc.desc   Queue sendableClass typed test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibQueueSendableClassTyped0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibQueueSendableClassTyped0100';
        console.info(`${caseName} test start`);
        let queue: Queue<SendableClass> = new Queue<SendableClass>();
        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        queue.add(obj1);
        queue.add(obj2);
        expect(queue.length).assertEqual(2);
        expect(queue.getFirst()!.value).assertEqual(1);
        let popped = queue.pop();
        expect(popped!.value).assertEqual(1);
        expect(queue.length).assertEqual(1);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibQueueSendableClassObject0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_QUEUE_SENDABLE_OBJECT_0100
     * @tc.desc   Queue sendableClass object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibQueueSendableClassObject0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibQueueSendableClassObject0100';
        console.info(`${caseName} test start`);
        let queue: Queue<object> = new Queue<object>();
        let obj1 = new SendableClass(1) as object;
        let obj2 = new SendableClass(2) as object;
        queue.add(obj1);
        queue.add(obj2);
        expect(queue.length).assertEqual(2);
        expect((queue.getFirst() as SendableClass).value).assertEqual(1);
        let popped = queue.pop();
        expect((popped as SendableClass).value).assertEqual(1);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibStackSendableClassTyped0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_STACK_SENDABLE_TYPED_0100
     * @tc.desc   Stack sendableClass typed test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibStackSendableClassTyped0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibStackSendableClassTyped0100';
        console.info(`${caseName} test start`);
        let stack: Stack<SendableClass> = new Stack<SendableClass>();
        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        stack.push(obj1);
        stack.push(obj2);
        expect(stack.length).assertEqual(2);
        expect(stack.peek()!.value).assertEqual(2);
        let popped = stack.pop();
        expect(popped!.value).assertEqual(2);
        expect(stack.length).assertEqual(1);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibStackSendableClassObject0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_STACK_SENDABLE_OBJECT_0100
     * @tc.desc   Stack sendableClass object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibStackSendableClassObject0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibStackSendableClassObject0100';
        console.info(`${caseName} test start`);
        let stack: Stack<object> = new Stack<object>();
        let obj1 = new SendableClass(1) as object;
        let obj2 = new SendableClass(2) as object;
        stack.push(obj1);
        stack.push(obj2);
        expect(stack.length).assertEqual(2);
        expect((stack.peek() as SendableClass).value).assertEqual(2);
        let popped = stack.pop();
        expect((popped as SendableClass).value).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibTreeMapSendableClassTyped0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TREEMAP_SENDABLE_TYPED_0100
     * @tc.desc   TreeMap sendableClass typed test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibTreeMapSendableClassTyped0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibTreeMapSendableClassTyped0100';
        console.info(`${caseName} test start`);
        let map: TreeMap<number, SendableClass> = new TreeMap<number, SendableClass>();
        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        map.set(1, obj1);
        map.set(2, obj2);
        expect(map.length).assertEqual(2);
        expect(map.get(1)!.value).assertEqual(1);
        expect(map.get(2)!.value).assertEqual(2);
        expect(map.hasKey(1)).assertTrue();
        expect(map.hasValue(obj1)).assertTrue();
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibTreeMapSendableClassObject0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TREEMAP_SENDABLE_OBJECT_0100
     * @tc.desc   TreeMap sendableClass object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibTreeMapSendableClassObject0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibTreeMapSendableClassObject0100';
        console.info(`${caseName} test start`);
        let map: TreeMap<number, object> = new TreeMap<number, object>();
        let obj1 = new SendableClass(1) as object;
        let obj2 = new SendableClass(2) as object;
        map.set(1, obj1);
        map.set(2, obj2);
        expect(map.length).assertEqual(2);
        expect((map.get(1) as SendableClass).value).assertEqual(1);
        map.forEach((value: object, key: number) => {
          expect(key > 0).assertTrue();
        });
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibTreeSetSendableClassTyped0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TREESET_SENDABLE_TYPED_0100
     * @tc.desc   TreeSet sendableClass typed test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibTreeSetSendableClassTyped0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibTreeSetSendableClassTyped0100';
        console.info(`${caseName} test start`);
        let set: TreeSet<SendableClass> = new TreeSet<SendableClass>((v1, v2) => {
          return v1.value > v2.value
        });
        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        set.add(obj1);
        set.add(obj2);
        expect(set.length).assertEqual(2);
        expect(set.has(obj1)).assertTrue();
        expect(set.has(obj2)).assertTrue();
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibTreeSetSendableClassObject0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TREESET_SENDABLE_OBJECT_0100
     * @tc.desc   TreeSet sendableClass object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibTreeSetSendableClassObject0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibTreeSetSendableClassObject0100';
        console.info(`${caseName} test start`);
        let set: TreeSet<object> = new TreeSet<object>((v1, v2) => {
          return (v1 as SendableClass).value > (v2 as SendableClass).value
        });
        let obj1 = new SendableClass(1) as object;
        let obj2 = new SendableClass(2) as object;
        set.add(obj1);
        set.add(obj2);
        expect(set.length).assertEqual(2);
        expect(set.has(obj1)).assertTrue();
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibLightWeightMapSendableClassTyped0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LIGHTWEIGHTMAP_SENDABLE_TYPED_0100
     * @tc.desc   LightWeightMap sendableClass typed test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibLightWeightMapSendableClassTyped0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibLightWeightMapSendableClassTyped0100';
        console.info(`${caseName} test start`);
        let map: LightWeightMap<number, SendableClass> = new LightWeightMap<number, SendableClass>();
        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        map.set(1, obj1);
        map.set(2, obj2);
        expect(map.length).assertEqual(2);
        expect(map.get(1)!.value).assertEqual(1);
        expect(map.get(2)!.value).assertEqual(2);
        expect(map.hasKey(1)).assertTrue();
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibLightWeightMapSendableClassObject0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LIGHTWEIGHTMAP_SENDABLE_OBJECT_0100
     * @tc.desc   LightWeightMap sendableClass object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibLightWeightMapSendableClassObject0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibLightWeightMapSendableClassObject0100';
        console.info(`${caseName} test start`);
        let map: LightWeightMap<number, object> = new LightWeightMap<number, object>();
        let obj1 = new SendableClass(1) as object;
        let obj2 = new SendableClass(2) as object;
        map.set(1, obj1);
        map.set(2, obj2);
        expect(map.length).assertEqual(2);
        expect((map.get(1) as SendableClass).value).assertEqual(1);
        map.forEach((value: object, key: number) => {
          expect(key > 0).assertTrue();
        });
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibLightWeightSetSendableClassTyped0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LIGHTWEIGHTSET_SENDABLE_TYPED_0100
     * @tc.desc   LightWeightSet sendableClass typed test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibLightWeightSetSendableClassTyped0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibLightWeightSetSendableClassTyped0100';
        console.info(`${caseName} test start`);
        let set: LightWeightSet<SendableClass> = new LightWeightSet<SendableClass>();
        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        set.add(obj1);
        set.add(obj2);
        expect(set.length).assertEqual(2);
        expect(set.has(obj1)).assertTrue();
        expect(set.has(obj2)).assertTrue();
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibLightWeightSetSendableClassObject0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LIGHTWEIGHTSET_SENDABLE_OBJECT_0100
     * @tc.desc   LightWeightSet sendableClass object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibLightWeightSetSendableClassObject0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibLightWeightSetSendableClassObject0100';
        console.info(`${caseName} test start`);
        let set: LightWeightSet<object> = new LightWeightSet<object>();
        let obj1 = new SendableClass(1) as object;
        let obj2 = new SendableClass(2) as object;
        set.add(obj1);
        set.add(obj2);
        expect(set.length).assertEqual(2);
        expect(set.has(obj1)).assertTrue();
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibArrayListSendableClassTyped0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAYLIST_SENDABLE_TYPED_0100
     * @tc.desc   ArrayList sendableClass typed test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibArrayListSendableClassTyped0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibArrayListSendableClassTyped0100';
        console.info(`${caseName} test start`);
        let list: ArrayList<SendableClass> = new ArrayList<SendableClass>();
        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        list.add(obj1);
        list.add(obj2);
        expect(list.length).assertEqual(2);
        expect(list[0]!.value).assertEqual(1);
        expect(list[1]!.value).assertEqual(2);
        expect(list.has(obj1)).assertTrue();
        let removedObj = list[0];
        list.remove(removedObj);
        expect(list.length).assertEqual(1);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibArrayListSendableClassObject0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAYLIST_SENDABLE_OBJECT_0100
     * @tc.desc   ArrayList sendableClass object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibArrayListSendableClassObject0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibArrayListSendableClassObject0100';
        console.info(`${caseName} test start`);
        let list: ArrayList<object> = new ArrayList<object>();
        let obj1 = new SendableClass(1) as object;
        let obj2 = new SendableClass(2) as object;
        list.add(obj1);
        list.add(obj2);
        expect(list.length).assertEqual(2);
        expect((list[0] as SendableClass).value).assertEqual(1);
        expect((list[1] as SendableClass).value).assertEqual(2);
        list.forEach((value: object, index: number) => {
          expect(index >= 0).assertTrue();
        });
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibPlainArrayBoundaryGet0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_PLAINARRAY_BOUNDARY_GET_0100
     * @tc.desc   PlainArray get empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibPlainArrayBoundaryGet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibPlainArrayBoundaryGet0100';
        console.info(`${caseName} test start`);
        let arr: PlainArray<SendableClass> = new PlainArray<SendableClass>();
        expect(arr.length).assertEqual(0);
        expect(arr.get(0)).assertEqual(undefined);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibPlainArrayBoundaryObjectGet0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_PLAINARRAY_BOUNDARY_OBJECT_GET_0100
     * @tc.desc   PlainArray get object empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibPlainArrayBoundaryObjectGet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibPlainArrayBoundaryObjectGet0100';
        console.info(`${caseName} test start`);
        let arr: PlainArray<object> = new PlainArray<object>();
        expect(arr.length).assertEqual(0);
        expect(arr.get(0)).assertEqual(undefined);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibQueueBoundaryPop0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_QUEUE_BOUNDARY_POP_0100
     * @tc.desc   Queue pop empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibQueueBoundaryPop0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibQueueBoundaryPop0100';
        console.info(`${caseName} test start`);
        let queue: Queue<SendableClass> = new Queue<SendableClass>();
        expect(queue.length).assertEqual(0);
        let result = queue.pop();
        expect(result).assertEqual(undefined);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibStackBoundaryPop0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_STACK_BOUNDARY_POP_0100
     * @tc.desc   Stack pop empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibStackBoundaryPop0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibStackBoundaryPop0100';
        console.info(`${caseName} test start`);
        let stack: Stack<SendableClass> = new Stack<SendableClass>();
        expect(stack.length).assertEqual(0);
        let result = stack.pop();
        expect(result).assertEqual(undefined);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibTreeMapBoundaryGet0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TREEMAP_BOUNDARY_GET_0100
     * @tc.desc   TreeMap get empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibTreeMapBoundaryGet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibTreeMapBoundaryGet0100';
        console.info(`${caseName} test start`);
        let map: TreeMap<number, SendableClass> = new TreeMap<number, SendableClass>();
        expect(map.length).assertEqual(0);
        expect(map.get(1)).assertEqual(undefined);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibTreeMapBoundaryObjectGet0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TREEMAP_BOUNDARY_OBJECT_GET_0100
     * @tc.desc   TreeMap get object empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibTreeMapBoundaryObjectGet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibTreeMapBoundaryObjectGet0100';
        console.info(`${caseName} test start`);
        let map: TreeMap<number, object> = new TreeMap<number, object>();
        expect(map.length).assertEqual(0);
        expect(map.get(1)).assertEqual(undefined);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibPlainArrayCombinedOperations0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_PLAINARRAY_COMBINED_0100
     * @tc.desc   PlainArray combined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibPlainArrayCombinedOperations0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibPlainArrayCombinedOperations0100';
        console.info(`${caseName} test start`);
        let arr: PlainArray<SendableClass> = new PlainArray<SendableClass>();

        arr.add(0, new SendableClass(1));
        arr.add(1, new SendableClass(2));
        arr.add(2, new SendableClass(3));
        expect(arr.length).assertEqual(3);

        arr.remove(1);
        expect(arr.length).assertEqual(2);

        arr.add(3, new SendableClass(4));
        expect(arr.length).assertEqual(3);

        let cloned = arr.clone();
        expect(cloned.length).assertEqual(3);
        expect(cloned.get(0)!.value).assertEqual(1);

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibLinkedListCombinedOperations0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LINKEDLIST_COMBINED_0100
     * @tc.desc   LinkedList combined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibLinkedListCombinedOperations0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibLinkedListCombinedOperations0100';
        console.info(`${caseName} test start`);
        let list: LinkedList<SendableClass> = new LinkedList<SendableClass>();

        list.add(new SendableClass(1));
        list.add(new SendableClass(2));
        list.add(new SendableClass(3));
        expect(list.length).assertEqual(3);

        list.addFirst(new SendableClass(0));
        expect(list.length).assertEqual(4);
        expect(list.getFirst()!.value).assertEqual(0);

        list.removeLast();
        expect(list.length).assertEqual(3);
        expect(list.getLast()!.value).assertEqual(2);

        list.insert(1, new SendableClass(10));
        expect(list.length).assertEqual(4);
        expect(list.get(1)!.value).assertEqual(10);

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibQueueCombinedOperations0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_QUEUE_COMBINED_0100
     * @tc.desc   Queue combined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibQueueCombinedOperations0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibQueueCombinedOperations0100';
        console.info(`${caseName} test start`);
        let queue: Queue<SendableClass> = new Queue<SendableClass>();

        queue.add(new SendableClass(1));
        queue.add(new SendableClass(2));
        queue.add(new SendableClass(3));
        expect(queue.length).assertEqual(3);

        let popped = queue.pop();
        expect(popped!.value).assertEqual(1);
        expect(queue.length).assertEqual(2);

        queue.add(new SendableClass(4));
        expect(queue.length).assertEqual(3);

        expect(queue.getFirst()!.value).assertEqual(2);

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibStackCombinedOperations0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_STACK_COMBINED_0100
     * @tc.desc   Stack combined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibStackCombinedOperations0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibStackCombinedOperations0100';
        console.info(`${caseName} test start`);
        let stack: Stack<SendableClass> = new Stack<SendableClass>();

        stack.push(new SendableClass(1));
        stack.push(new SendableClass(2));
        stack.push(new SendableClass(3));
        expect(stack.length).assertEqual(3);

        let popped = stack.pop();
        expect(popped!.value).assertEqual(3);
        expect(stack.length).assertEqual(2);

        stack.push(new SendableClass(4));
        expect(stack.length).assertEqual(3);

        expect(stack.peek()!.value).assertEqual(4);
        expect(stack.isEmpty()).assertFalse();

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibTreeMapCombinedOperations0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TREEMAP_COMBINED_0100
     * @tc.desc   TreeMap combined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibTreeMapCombinedOperations0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibTreeMapCombinedOperations0100';
        console.info(`${caseName} test start`);
        let map: TreeMap<number, SendableClass> = new TreeMap<number, SendableClass>();

        map.set(1, new SendableClass(1));
        map.set(2, new SendableClass(2));
        map.set(3, new SendableClass(3));
        expect(map.length).assertEqual(3);

        map.remove(2);
        expect(map.length).assertEqual(2);
        expect(map.hasKey(2)).assertFalse();

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
     * @tc.name   baselibTreeSetCombinedOperations0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TREESET_COMBINED_0100
     * @tc.desc   TreeSet combined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibTreeSetCombinedOperations0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibTreeSetCombinedOperations0100';
        console.info(`${caseName} test start`);
        let set: TreeSet<SendableClass> = new TreeSet<SendableClass>((v1, v2) => v1.value > v2.value);

        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        let obj3 = new SendableClass(3);

        set.add(obj1);
        set.add(obj2);
        set.add(obj3);
        expect(set.length).assertEqual(3);

        set.remove(obj2);
        expect(set.length).assertEqual(2);
        expect(set.has(obj2)).assertFalse();

        set.add(obj1);
        expect(set.length).assertEqual(2);

        let arr = Array.from(set);
        expect(arr.length).assertEqual(2);

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibLightWeightMapCombinedOperations0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LIGHTWEIGHTMAP_COMBINED_0100
     * @tc.desc   LightWeightMap combined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibLightWeightMapCombinedOperations0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibLightWeightMapCombinedOperations0100';
        console.info(`${caseName} test start`);
        let map: LightWeightMap<number, SendableClass> = new LightWeightMap<number, SendableClass>();

        map.set(1, new SendableClass(1));
        map.set(2, new SendableClass(2));
        map.set(3, new SendableClass(3));
        expect(map.length).assertEqual(3);

        map.remove(2);
        expect(map.length).assertEqual(2);
        expect(map.hasKey(2)).assertFalse();

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
     * @tc.name   baselibLightWeightSetCombinedOperations0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LIGHTWEIGHTSET_COMBINED_0100
     * @tc.desc   LightWeightSet combined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibLightWeightSetCombinedOperations0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibLightWeightSetCombinedOperations0100';
        console.info(`${caseName} test start`);
        let set: LightWeightSet<SendableClass> = new LightWeightSet<SendableClass>();

        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        let obj3 = new SendableClass(3);

        set.add(obj1);
        set.add(obj2);
        set.add(obj3);
        expect(set.length).assertEqual(3);

        set.remove(obj2);
        expect(set.length).assertEqual(2);
        expect(set.has(obj2)).assertFalse();

        set.add(obj1);
        expect(set.length).assertEqual(2);

        let arr = Array.from(set);
        expect(arr.length).assertEqual(2);

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibArrayListCombinedOperations0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAYLIST_COMBINED_0100
     * @tc.desc   ArrayList combined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibArrayListCombinedOperations0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibArrayListCombinedOperations0100';
        console.info(`${caseName} test start`);
        let list: ArrayList<SendableClass> = new ArrayList<SendableClass>();

        list.add(new SendableClass(1));
        list.add(new SendableClass(2));
        list.add(new SendableClass(3));
        expect(list.length).assertEqual(3);

        let removedObj = list[0];
        list.remove(removedObj);
        expect(list.length).assertEqual(2);

        list.add(new SendableClass(10));
        expect(list.length).assertEqual(3);
        expect(list[2]!.value).assertEqual(10);

        list[0] = new SendableClass(100);
        expect(list[0]!.value).assertEqual(100);

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibPlainArrayStress0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_PLAINARRAY_STRESS_0100
     * @tc.desc   PlainArray stress test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibPlainArrayStress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibPlainArrayStress0100';
        console.info(`${caseName} test start`);
        let arr: PlainArray<SendableClass> = new PlainArray<SendableClass>();

        for (let i = 0; i < 100; i++) {
          arr.add(i, new SendableClass(i));
        }
        expect(arr.length).assertEqual(100);

        for (let i = 0; i < 100; i++) {
          expect(arr.get(i)!.value).assertEqual(i);
        }

        for (let i = 0; i < 50; i++) {
          arr.remove(i);
        }
        expect(arr.length).assertEqual(50);

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibLinkedListStress0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LINKEDLIST_STRESS_0100
     * @tc.desc   LinkedList stress test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibLinkedListStress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibLinkedListStress0100';
        console.info(`${caseName} test start`);
        let list: LinkedList<SendableClass> = new LinkedList<SendableClass>();

        for (let i = 0; i < 100; i++) {
          list.add(new SendableClass(i));
        }
        expect(list.length).assertEqual(100);

        for (let i = 0; i < 100; i++) {
          expect(list.get(i)!.value).assertEqual(i);
        }

        for (let i = 0; i < 50; i++) {
          list.removeFirst();
        }
        expect(list.length).assertEqual(50);

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibQueueStress0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_QUEUE_STRESS_0100
     * @tc.desc   Queue stress test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibQueueStress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibQueueStress0100';
        console.info(`${caseName} test start`);
        let queue: Queue<SendableClass> = new Queue<SendableClass>();

        for (let i = 0; i < 100; i++) {
          queue.add(new SendableClass(i));
        }
        expect(queue.length).assertEqual(100);

        for (let i = 0; i < 50; i++) {
          let popped = queue.pop();
          expect(popped!.value).assertEqual(i);
        }
        expect(queue.length).assertEqual(50);

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibStackStress0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_STACK_STRESS_0100
     * @tc.desc   Stack stress test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibStackStress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibStackStress0100';
        console.info(`${caseName} test start`);
        let stack: Stack<SendableClass> = new Stack<SendableClass>();

        for (let i = 0; i < 100; i++) {
          stack.push(new SendableClass(i));
        }
        expect(stack.length).assertEqual(100);

        for (let i = 99; i >= 50; i--) {
          let popped = stack.pop();
          expect(popped!.value).assertEqual(i);
        }
        expect(stack.length).assertEqual(50);

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibTreeMapStress0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TREEMAP_STRESS_0100
     * @tc.desc   TreeMap stress test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibTreeMapStress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibTreeMapStress0100';
        console.info(`${caseName} test start`);
        let map: TreeMap<number, SendableClass> = new TreeMap<number, SendableClass>();

        for (let i = 0; i < 100; i++) {
          map.set(i, new SendableClass(i));
        }
        expect(map.length).assertEqual(100);

        for (let i = 0; i < 100; i++) {
          expect(map.get(i)!.value).assertEqual(i);
        }

        for (let i = 0; i < 50; i++) {
          map.remove(i);
        }
        expect(map.length).assertEqual(50);

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibTreeSetStress0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TREESET_STRESS_0100
     * @tc.desc   TreeSet stress test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibTreeSetStress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibTreeSetStress0100';
        console.info(`${caseName} test start`);
        let set: TreeSet<SendableClass> = new TreeSet<SendableClass>((v1, v2) => v1.value > v2.value);
        let objects: SendableClass[] = [];

        for (let i = 0; i < 100; i++) {
          let obj = new SendableClass(i);
          objects.push(obj);
          set.add(obj);
        }
        expect(set.length).assertEqual(100);

        for (let i = 0; i < 100; i++) {
          expect(set.has(objects[i])).assertTrue();
        }

        for (let i = 0; i < 50; i++) {
          set.remove(objects[i]);
        }
        expect(set.length).assertEqual(50);

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibLightWeightMapStress0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LIGHTWEIGHTMAP_STRESS_0100
     * @tc.desc   LightWeightMap stress test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibLightWeightMapStress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibLightWeightMapStress0100';
        console.info(`${caseName} test start`);
        let map: LightWeightMap<number, SendableClass> = new LightWeightMap<number, SendableClass>();

        for (let i = 0; i < 100; i++) {
          map.set(i, new SendableClass(i));
        }
        expect(map.length).assertEqual(100);

        for (let i = 0; i < 100; i++) {
          expect(map.get(i)!.value).assertEqual(i);
        }

        for (let i = 0; i < 50; i++) {
          map.remove(i);
        }
        expect(map.length).assertEqual(50);

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibLightWeightSetStress0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LIGHTWEIGHTSET_STRESS_0100
     * @tc.desc   LightWeightSet stress test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibLightWeightSetStress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibLightWeightSetStress0100';
        console.info(`${caseName} test start`);
        let set: LightWeightSet<SendableClass> = new LightWeightSet<SendableClass>();
        let objects: SendableClass[] = [];

        for (let i = 0; i < 100; i++) {
          let obj = new SendableClass(i);
          objects.push(obj);
          set.add(obj);
        }
        expect(set.length).assertEqual(100);

        for (let i = 0; i < 100; i++) {
          expect(set.has(objects[i])).assertTrue();
        }

        for (let i = 0; i < 50; i++) {
          set.remove(objects[i]);
        }
        expect(set.length).assertEqual(50);

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibArrayListStress0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAYLIST_STRESS_0100
     * @tc.desc   ArrayList stress test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibArrayListStress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibArrayListStress0100';
        console.info(`${caseName} test start`);
        let list: ArrayList<SendableClass> = new ArrayList<SendableClass>();

        for (let i = 0; i < 100; i++) {
          list.add(new SendableClass(i));
        }
        expect(list.length).assertEqual(100);

        for (let i = 0; i < 100; i++) {
          expect(list[i]!.value).assertEqual(i);
        }

        for (let i = 0; i < 50; i++) {
          let removedObj = list[0];
          list.remove(removedObj);
        }
        expect(list.length).assertEqual(50);

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibPlainArrayWithCollectionsArray0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_PLAINARRAY_WITH_COLLECTIONS_ARRAY_0100
     * @tc.desc   PlainArray storing collectionsArray test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibPlainArrayWithCollectionsArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibPlainArrayWithCollectionsArray0100';
        console.info(`${caseName} test start`);
        let arr: PlainArray<collections.Array<number>> = new PlainArray<collections.Array<number>>();
        const nestedArr = new collections.Array<number>();
        nestedArr.push(1);
        nestedArr.push(2);
        nestedArr.push(3);
        arr.add(0, nestedArr);
        expect(arr.length).assertEqual(1);
        expect(arr.get(0) !== null).assertTrue();
        expect(arr.get(0)!.length).assertEqual(3);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibLinkedListWithCollectionsArray0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LINKEDLIST_WITH_COLLECTIONS_ARRAY_0100
     * @tc.desc   LinkedList storing collectionsArray test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibLinkedListWithCollectionsArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibLinkedListWithCollectionsArray0100';
        console.info(`${caseName} test start`);
        let list: LinkedList<collections.Array<number>> = new LinkedList<collections.Array<number>>();
        const nestedArr = new collections.Array<number>();
        nestedArr.push(1);
        nestedArr.push(2);
        nestedArr.push(3);
        list.add(nestedArr);
        expect(list.length).assertEqual(1);
        expect(list.get(0) !== null).assertTrue();
        expect(list.get(0)!.length).assertEqual(3);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibQueueWithCollectionsArray0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_QUEUE_WITH_COLLECTIONS_ARRAY_0100
     * @tc.desc   Queue storing collectionsArray test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibQueueWithCollectionsArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibQueueWithCollectionsArray0100';
        console.info(`${caseName} test start`);
        let queue: Queue<collections.Array<number>> = new Queue<collections.Array<number>>();
        const nestedArr = new collections.Array<number>();
        nestedArr.push(1);
        nestedArr.push(2);
        nestedArr.push(3);
        queue.add(nestedArr);
        expect(queue.length).assertEqual(1);
        expect(queue.getFirst() !== null).assertTrue();
        expect(queue.getFirst()!.length).assertEqual(3);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibStackWithCollectionsArray0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_STACK_WITH_COLLECTIONS_ARRAY_0100
     * @tc.desc   Stack storing collectionsArray test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibStackWithCollectionsArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibStackWithCollectionsArray0100';
        console.info(`${caseName} test start`);
        let stack: Stack<collections.Array<number>> = new Stack<collections.Array<number>>();
        const nestedArr = new collections.Array<number>();
        nestedArr.push(1);
        nestedArr.push(2);
        nestedArr.push(3);
        stack.push(nestedArr);
        expect(stack.length).assertEqual(1);
        expect(stack.peek() !== null).assertTrue();
        expect(stack.peek()!.length).assertEqual(3);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibTreeMapWithCollectionsArray0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TREEMAP_WITH_COLLECTIONS_ARRAY_0100
     * @tc.desc   TreeMap storing collectionsArray test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibTreeMapWithCollectionsArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibTreeMapWithCollectionsArray0100';
        console.info(`${caseName} test start`);
        let map: TreeMap<number, collections.Array<number>> = new TreeMap<number, collections.Array<number>>();
        const nestedArr = new collections.Array<number>();
        nestedArr.push(1);
        nestedArr.push(2);
        nestedArr.push(3);
        map.set(1, nestedArr);
        expect(map.length).assertEqual(1);
        expect(map.get(1) !== null).assertTrue();
        expect(map.get(1)!.length).assertEqual(3);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibLightWeightMapWithCollectionsArray0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LIGHTWEIGHTMAP_WITH_COLLECTIONS_ARRAY_0100
     * @tc.desc   LightWeightMap storing collectionsArray test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibLightWeightMapWithCollectionsArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibLightWeightMapWithCollectionsArray0100';
        console.info(`${caseName} test start`);
        let map: LightWeightMap<number, collections.Array<number>> = new LightWeightMap<number, collections.Array<number>>();
        const nestedArr = new collections.Array<number>();
        nestedArr.push(1);
        nestedArr.push(2);
        nestedArr.push(3);
        map.set(1, nestedArr);
        expect(map.length).assertEqual(1);
        expect(map.get(1) !== null).assertTrue();
        expect(map.get(1)!.length).assertEqual(3);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibArrayListWithCollectionsArray0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAYLIST_WITH_COLLECTIONS_ARRAY_0100
     * @tc.desc   ArrayList storing collectionsArray test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibArrayListWithCollectionsArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibArrayListWithCollectionsArray0100';
        console.info(`${caseName} test start`);
        let list: ArrayList<collections.Array<number>> = new ArrayList<collections.Array<number>>();
        const nestedArr = new collections.Array<number>();
        nestedArr.push(1);
        nestedArr.push(2);
        nestedArr.push(3);
        list.add(nestedArr);
        expect(list.length).assertEqual(1);
        expect(list[0] !== null).assertTrue();
        expect(list[0]!.length).assertEqual(3);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibPlainArrayWithCollectionsMap0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_PLAINARRAY_WITH_COLLECTIONS_MAP_0100
     * @tc.desc   PlainArray storing collectionsMap test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibPlainArrayWithCollectionsMap0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibPlainArrayWithCollectionsMap0100';
        console.info(`${caseName} test start`);
        let arr: PlainArray<collections.Map<number, number>> = new PlainArray<collections.Map<number, number>>();
        const nestedMap = new collections.Map<number, number>();
        nestedMap.set(1, 10);
        nestedMap.set(2, 20);
        arr.add(0, nestedMap);
        expect(arr.length).assertEqual(1);
        expect(arr.get(0) !== null).assertTrue();
        expect(arr.get(0)!.size).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibPlainArrayWithCollectionsSet0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_PLAINARRAY_WITH_COLLECTIONS_SET_0100
     * @tc.desc   PlainArray storing collectionsSet test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibPlainArrayWithCollectionsSet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibPlainArrayWithCollectionsSet0100';
        console.info(`${caseName} test start`);
        let arr: PlainArray<collections.Set<number>> = new PlainArray<collections.Set<number>>();
        const nestedSet = new collections.Set<number>();
        nestedSet.add(1);
        nestedSet.add(2);
        nestedSet.add(3);
        arr.add(0, nestedSet);
        expect(arr.length).assertEqual(1);
        expect(arr.get(0) !== null).assertTrue();
        expect(arr.get(0)!.size).assertEqual(3);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibLinkedListWithCollectionsMap0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LINKEDLIST_WITH_COLLECTIONS_MAP_0100
     * @tc.desc   LinkedList storing collectionsMap test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibLinkedListWithCollectionsMap0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibLinkedListWithCollectionsMap0100';
        console.info(`${caseName} test start`);
        let list: LinkedList<collections.Map<number, number>> = new LinkedList<collections.Map<number, number>>();
        const nestedMap = new collections.Map<number, number>();
        nestedMap.set(1, 10);
        nestedMap.set(2, 20);
        list.add(nestedMap);
        expect(list.length).assertEqual(1);
        expect(list.get(0) !== null).assertTrue();
        expect(list.get(0)!.size).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibLinkedListWithCollectionsSet0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LINKEDLIST_WITH_COLLECTIONS_SET_0100
     * @tc.desc   LinkedList storing collectionsSet test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibLinkedListWithCollectionsSet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibLinkedListWithCollectionsSet0100';
        console.info(`${caseName} test start`);
        let list: LinkedList<collections.Set<number>> = new LinkedList<collections.Set<number>>();
        const nestedSet = new collections.Set<number>();
        nestedSet.add(1);
        nestedSet.add(2);
        nestedSet.add(3);
        list.add(nestedSet);
        expect(list.length).assertEqual(1);
        expect(list.get(0) !== null).assertTrue();
        expect(list.get(0)!.size).assertEqual(3);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibQueueWithCollectionsMap0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_QUEUE_WITH_COLLECTIONS_MAP_0100
     * @tc.desc   Queue storing collectionsMap test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibQueueWithCollectionsMap0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibQueueWithCollectionsMap0100';
        console.info(`${caseName} test start`);
        let queue: Queue<collections.Map<number, number>> = new Queue<collections.Map<number, number>>();
        const nestedMap = new collections.Map<number, number>();
        nestedMap.set(1, 10);
        nestedMap.set(2, 20);
        queue.add(nestedMap);
        expect(queue.length).assertEqual(1);
        expect(queue.getFirst() !== null).assertTrue();
        expect(queue.getFirst()!.size).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibQueueWithCollectionsSet0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_QUEUE_WITH_COLLECTIONS_SET_0100
     * @tc.desc   Queue storing collectionsSet test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibQueueWithCollectionsSet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibQueueWithCollectionsSet0100';
        console.info(`${caseName} test start`);
        let queue: Queue<collections.Set<number>> = new Queue<collections.Set<number>>();
        const nestedSet = new collections.Set<number>();
        nestedSet.add(1);
        nestedSet.add(2);
        nestedSet.add(3);
        queue.add(nestedSet);
        expect(queue.length).assertEqual(1);
        expect(queue.getFirst() !== null).assertTrue();
        expect(queue.getFirst()!.size).assertEqual(3);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibStackWithCollectionsMap0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_STACK_WITH_COLLECTIONS_MAP_0100
     * @tc.desc   Stack storing collectionsMap test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibStackWithCollectionsMap0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibStackWithCollectionsMap0100';
        console.info(`${caseName} test start`);
        let stack: Stack<collections.Map<number, number>> = new Stack<collections.Map<number, number>>();
        const nestedMap = new collections.Map<number, number>();
        nestedMap.set(1, 10);
        nestedMap.set(2, 20);
        stack.push(nestedMap);
        expect(stack.length).assertEqual(1);
        expect(stack.peek() !== null).assertTrue();
        expect(stack.peek()!.size).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibStackWithCollectionsSet0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_STACK_WITH_COLLECTIONS_SET_0100
     * @tc.desc   Stack storing collectionsSet test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibStackWithCollectionsSet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibStackWithCollectionsSet0100';
        console.info(`${caseName} test start`);
        let stack: Stack<collections.Set<number>> = new Stack<collections.Set<number>>();
        const nestedSet = new collections.Set<number>();
        nestedSet.add(1);
        nestedSet.add(2);
        nestedSet.add(3);
        stack.push(nestedSet);
        expect(stack.length).assertEqual(1);
        expect(stack.peek() !== null).assertTrue();
        expect(stack.peek()!.size).assertEqual(3);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibTreeMapWithCollectionsMap0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TREEMAP_WITH_COLLECTIONS_MAP_0100
     * @tc.desc   TreeMap storing collectionsMap test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibTreeMapWithCollectionsMap0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibTreeMapWithCollectionsMap0100';
        console.info(`${caseName} test start`);
        let map: TreeMap<number, collections.Map<number, number>> = new TreeMap<number, collections.Map<number, number>>();
        const nestedMap = new collections.Map<number, number>();
        nestedMap.set(1, 10);
        nestedMap.set(2, 20);
        map.set(1, nestedMap);
        expect(map.length).assertEqual(1);
        expect(map.get(1) !== null).assertTrue();
        expect(map.get(1)!.size).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibTreeMapWithCollectionsSet0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TREEMAP_WITH_COLLECTIONS_SET_0100
     * @tc.desc   TreeMap storing collectionsSet test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibTreeMapWithCollectionsSet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibTreeMapWithCollectionsSet0100';
        console.info(`${caseName} test start`);
        let map: TreeMap<number, collections.Set<number>> = new TreeMap<number, collections.Set<number>>();
        const nestedSet = new collections.Set<number>();
        nestedSet.add(1);
        nestedSet.add(2);
        nestedSet.add(3);
        map.set(1, nestedSet);
        expect(map.length).assertEqual(1);
        expect(map.get(1) !== null).assertTrue();
        expect(map.get(1)!.size).assertEqual(3);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibLightWeightMapWithCollectionsMap0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LIGHTWEIGHTMAP_WITH_COLLECTIONS_MAP_0100
     * @tc.desc   LightWeightMap storing collectionsMap test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibLightWeightMapWithCollectionsMap0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibLightWeightMapWithCollectionsMap0100';
        console.info(`${caseName} test start`);
        let map: LightWeightMap<number, collections.Map<number, number>> = new LightWeightMap<number, collections.Map<number, number>>();
        const nestedMap = new collections.Map<number, number>();
        nestedMap.set(1, 10);
        nestedMap.set(2, 20);
        map.set(1, nestedMap);
        expect(map.length).assertEqual(1);
        expect(map.get(1) !== null).assertTrue();
        expect(map.get(1)!.size).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibLightWeightMapWithCollectionsSet0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LIGHTWEIGHTMAP_WITH_COLLECTIONS_SET_0100
     * @tc.desc   LightWeightMap storing collectionsSet test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibLightWeightMapWithCollectionsSet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibLightWeightMapWithCollectionsSet0100';
        console.info(`${caseName} test start`);
        let map: LightWeightMap<number, collections.Set<number>> = new LightWeightMap<number, collections.Set<number>>();
        const nestedSet = new collections.Set<number>();
        nestedSet.add(1);
        nestedSet.add(2);
        nestedSet.add(3);
        map.set(1, nestedSet);
        expect(map.length).assertEqual(1);
        expect(map.get(1) !== null).assertTrue();
        expect(map.get(1)!.size).assertEqual(3);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibArrayListWithCollectionsMap0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAYLIST_WITH_COLLECTIONS_MAP_0100
     * @tc.desc   ArrayList storing collectionsMap test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibArrayListWithCollectionsMap0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibArrayListWithCollectionsMap0100';
        console.info(`${caseName} test start`);
        let list: ArrayList<collections.Map<number, number>> = new ArrayList<collections.Map<number, number>>();
        const nestedMap = new collections.Map<number, number>();
        nestedMap.set(1, 10);
        nestedMap.set(2, 20);
        list.add(nestedMap);
        expect(list.length).assertEqual(1);
        expect(list[0] !== null).assertTrue();
        expect(list[0]!.size).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibArrayListWithCollectionsSet0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAYLIST_WITH_COLLECTIONS_SET_0100
     * @tc.desc   ArrayList storing collectionsSet test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibArrayListWithCollectionsSet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibArrayListWithCollectionsSet0100';
        console.info(`${caseName} test start`);
        let list: ArrayList<collections.Set<number>> = new ArrayList<collections.Set<number>>();
        const nestedSet = new collections.Set<number>();
        nestedSet.add(1);
        nestedSet.add(2);
        nestedSet.add(3);
        list.add(nestedSet);
        expect(list.length).assertEqual(1);
        expect(list[0] !== null).assertTrue();
        expect(list[0]!.size).assertEqual(3);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibPlainArrayNegativeIndex0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_PLAINARRAY_NEGATIVE_INDEX_0100
     * @tc.desc   PlainArray negative index test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibPlainArrayNegativeIndex0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibPlainArrayNegativeIndex0100';
        console.info(`${caseName} test start`);
        let arr: PlainArray<SendableClass> = new PlainArray<SendableClass>();
        arr.add(0, new SendableClass(1));
        arr.add(1, new SendableClass(2));
        expect(arr.get(-1)).assertEqual(undefined);
        expect(arr.get(-100)).assertEqual(undefined);
        expect(arr.length).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibLinkedListNegativeIndex0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LINKEDLIST_NEGATIVE_INDEX_0100
     * @tc.desc   LinkedList negative index test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibLinkedListNegativeIndex0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibLinkedListNegativeIndex0100';
        console.info(`${caseName} test start`);
        let list: LinkedList<SendableClass> = new LinkedList<SendableClass>();
        list.add(new SendableClass(1));
        list.add(new SendableClass(2));
        expect(list.get(-1)).assertEqual(undefined);
        expect(list.get(-100)).assertEqual(undefined);
        expect(list.length).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibArrayListNegativeIndex0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAYLIST_NEGATIVE_INDEX_0100
     * @tc.desc   ArrayList negative index test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibArrayListNegativeIndex0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibArrayListNegativeIndex0100';
        console.info(`${caseName} test start`);
        let list: ArrayList<SendableClass> = new ArrayList<SendableClass>();
        list.add(new SendableClass(1));
        list.add(new SendableClass(2));
        expect(list.length).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibTreeMapClear0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TREEMAP_CLEAR_0100
     * @tc.desc   TreeMap clear test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibTreeMapClear0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibTreeMapClear0100';
        console.info(`${caseName} test start`);
        let map: TreeMap<number, SendableClass> = new TreeMap<number, SendableClass>();
        map.set(1, new SendableClass(1));
        map.set(2, new SendableClass(2));
        map.set(3, new SendableClass(3));
        expect(map.length).assertEqual(3);
        map.clear();
        expect(map.length).assertEqual(0);
        expect(map.hasKey(1)).assertFalse();
        expect(map.get(1)).assertEqual(undefined);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibLightWeightMapClear0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LIGHTWEIGHTMAP_CLEAR_0100
     * @tc.desc   LightWeightMap clear test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibLightWeightMapClear0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibLightWeightMapClear0100';
        console.info(`${caseName} test start`);
        let map: LightWeightMap<number, SendableClass> = new LightWeightMap<number, SendableClass>();
        map.set(1, new SendableClass(1));
        map.set(2, new SendableClass(2));
        map.set(3, new SendableClass(3));
        expect(map.length).assertEqual(3);
        map.clear();
        expect(map.length).assertEqual(0);
        expect(map.hasKey(1)).assertFalse();
        expect(map.get(1)).assertEqual(undefined);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibTreeSetClear0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TREESET_CLEAR_0100
     * @tc.desc   TreeSet clear test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibTreeSetClear0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibTreeSetClear0100';
        console.info(`${caseName} test start`);
        let set: TreeSet<SendableClass> = new TreeSet<SendableClass>((v1, v2) => v1.value > v2.value);
        set.add(new SendableClass(1));
        set.add(new SendableClass(2));
        set.add(new SendableClass(3));
        expect(set.length).assertEqual(3);
        set.clear();
        expect(set.length).assertEqual(0);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibLightWeightSetClear0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LIGHTWEIGHTSET_CLEAR_0100
     * @tc.desc   LightWeightSet clear test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibLightWeightSetClear0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibLightWeightSetClear0100';
        console.info(`${caseName} test start`);
        let set: LightWeightSet<SendableClass> = new LightWeightSet<SendableClass>();
        set.add(new SendableClass(1));
        set.add(new SendableClass(2));
        set.add(new SendableClass(3));
        expect(set.length).assertEqual(3);
        set.clear();
        expect(set.length).assertEqual(0);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibPlainArrayStress1000_0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_PLAINARRAY_STRESS_TEST_0100
     * @tc.desc   PlainArray stress 1000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibPlainArrayStress1000_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibPlainArrayStress1000_0100';
        console.info(`${caseName} test start`);
        let arr: PlainArray<SendableClass> = new PlainArray<SendableClass>();
        for (let i = 0; i < 1000; i++) {
          arr.add(i, new SendableClass(i));
        }
        expect(arr.length).assertEqual(1000);
        for (let i = 0; i < 1000; i++) {
          expect(arr.get(i)!.value).assertEqual(i);
        }
        for (let i = 0; i < 500; i++) {
          arr.remove(i);
        }
        expect(arr.length).assertEqual(500);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibLinkedListStress1000_0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LINKEDLIST_STRESS_TEST_0100
     * @tc.desc   LinkedList stress 1000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibLinkedListStress1000_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibLinkedListStress1000_0100';
        console.info(`${caseName} test start`);
        let list: LinkedList<SendableClass> = new LinkedList<SendableClass>();
        for (let i = 0; i < 1000; i++) {
          list.add(new SendableClass(i));
        }
        expect(list.length).assertEqual(1000);
        for (let i = 0; i < 1000; i++) {
          expect(list.get(i)!.value).assertEqual(i);
        }
        for (let i = 0; i < 500; i++) {
          list.removeFirst();
        }
        expect(list.length).assertEqual(500);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibTreeMapStress1000_0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TREEMAP_STRESS_TEST_0100
     * @tc.desc   TreeMap stress 1000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibTreeMapStress1000_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibTreeMapStress1000_0100';
        console.info(`${caseName} test start`);
        let map: TreeMap<number, SendableClass> = new TreeMap<number, SendableClass>();
        for (let i = 0; i < 1000; i++) {
          map.set(i, new SendableClass(i));
        }
        expect(map.length).assertEqual(1000);
        for (let i = 0; i < 1000; i++) {
          expect(map.get(i)!.value).assertEqual(i);
        }
        for (let i = 0; i < 500; i++) {
          map.remove(i);
        }
        expect(map.length).assertEqual(500);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibTreeSetStress1000_0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TREESET_STRESS_TEST_0100
     * @tc.desc   TreeSet stress 1000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibTreeSetStress1000_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibTreeSetStress1000_0100';
        console.info(`${caseName} test start`);
        let set: TreeSet<SendableClass> = new TreeSet<SendableClass>((v1, v2) => v1.value > v2.value);
        let objects: SendableClass[] = [];
        for (let i = 0; i < 1000; i++) {
          let obj = new SendableClass(i);
          objects.push(obj);
          set.add(obj);
        }
        expect(set.length).assertEqual(1000);
        for (let i = 0; i < 1000; i++) {
          expect(set.has(objects[i])).assertTrue();
        }
        for (let i = 0; i < 500; i++) {
          set.remove(objects[i]);
        }
        expect(set.length).assertEqual(500);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibArrayListStress1000_0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAYLIST_STRESS_TEST_0100
     * @tc.desc   ArrayList stress 1000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibArrayListStress1000_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibArrayListStress1000_0100';
        console.info(`${caseName} test start`);
        let list: ArrayList<SendableClass> = new ArrayList<SendableClass>();
        for (let i = 0; i < 1000; i++) {
          list.add(new SendableClass(i));
        }
        expect(list.length).assertEqual(1000);
        for (let i = 0; i < 1000; i++) {
          expect(list[i]!.value).assertEqual(i);
        }
        for (let i = 0; i < 500; i++) {
          let removedObj = list[0];
          list.remove(removedObj);
        }
        expect(list.length).assertEqual(500);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibNestedContainerModify0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NESTED_MODIFY_0100
     * @tc.desc   ArrayList nested modify test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibNestedContainerModify0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibNestedContainerModify0100';
        console.info(`${caseName} test start`);
        let list: ArrayList<collections.Array<number>> = new ArrayList<collections.Array<number>>();
        const nestedArr = new collections.Array<number>();
        nestedArr.push(1);
        nestedArr.push(2);
        list.add(nestedArr);
        expect(list[0]!.length).assertEqual(2);
        nestedArr.push(3);
        expect(list[0]!.length).assertEqual(3);
        expect(list[0]![2]).assertEqual(3);
        nestedArr.pop();
        expect(list[0]!.length).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibTreeMapObjectKeyFullOperations0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TREEMAP_OBJECT_KEY_FULL_0100
     * @tc.desc   TreeMap objectKey full operations test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibTreeMapObjectKeyFullOperations0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibTreeMapObjectKeyFullOperations0100';
        console.info(`${caseName} test start`);
        let map: TreeMap<object, SendableClass> = new TreeMap<object, SendableClass>((k1, k2) => {
          return (k1 as SendableClass).value > (k2 as SendableClass).value
        });
        let key1 = new SendableClass(1) as object;
        let key2 = new SendableClass(2) as object;
        let value1 = new SendableClass(10);
        let value2 = new SendableClass(20);
        map.set(key1, value1);
        map.set(key2, value2);
        expect(map.length).assertEqual(2);
        expect(map.get(key1)!.value).assertEqual(10);
        expect(map.get(key2)!.value).assertEqual(20);
        expect(map.hasKey(key1)).assertTrue();
        map.set(key1, new SendableClass(100));
        expect(map.get(key1)!.value).assertEqual(100);
        map.remove(key2);
        expect(map.length).assertEqual(1);
        expect(map.hasKey(key2)).assertFalse();
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibLightWeightMapObjectKeyFullOperations0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LIGHTWEIGHTMAP_OBJECT_KEY_FULL_0100
     * @tc.desc   LightWeightMap objectKey full operations test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibLightWeightMapObjectKeyFullOperations0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibLightWeightMapObjectKeyFullOperations0100';
        console.info(`${caseName} test start`);
        let map: LightWeightMap<object, SendableClass> = new LightWeightMap<object, SendableClass>();
        let key1 = new SendableClass(1) as object;
        let key2 = new SendableClass(2) as object;
        let value1 = new SendableClass(10);
        let value2 = new SendableClass(20);
        map.set(key1, value1);
        map.set(key2, value2);
        expect(map.length).assertEqual(2);
        expect(map.get(key1)!.value).assertEqual(10);
        expect(map.get(key2)!.value).assertEqual(20);
        expect(map.hasKey(key1)).assertTrue();
        map.set(key1, new SendableClass(100));
        expect(map.get(key1)!.value).assertEqual(100);
        map.remove(key2);
        expect(map.length).assertEqual(1);
        expect(map.hasKey(key2)).assertFalse();
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   baselibTreeSetObjectComparator0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TREESET_OBJECT_COMPARATOR_0100
     * @tc.desc   TreeSet object comparator test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('baselibTreeSetObjectComparator0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'baselibTreeSetObjectComparator0100';
        console.info(`${caseName} test start`);
        let set: TreeSet<object> = new TreeSet<object>((v1, v2) => {
          return (v1 as SendableClass).value > (v2 as SendableClass).value
        });
        let obj1 = new SendableClass(1) as object;
        let obj2 = new SendableClass(2) as object;
        let obj3 = new SendableClass(3) as object;
        set.add(obj1);
        set.add(obj2);
        set.add(obj3);
        expect(set.length).assertEqual(3);
        expect(set.has(obj1)).assertTrue();
        expect(set.has(obj2)).assertTrue();
        expect(set.has(obj3)).assertTrue();
        set.remove(obj2);
        expect(set.length).assertEqual(2);
        expect(set.has(obj2)).assertFalse();
        console.info(`${caseName} test end`);
        done()
      })
  })
}