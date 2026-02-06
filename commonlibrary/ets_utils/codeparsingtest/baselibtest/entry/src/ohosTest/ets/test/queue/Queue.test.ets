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
import { Queue } from '@kit.ArkTS';

export default function QueueTest() {
  describe('QueueTest', () => {
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

    class C1 {
      name: string = ""
      age: string = ""
    }

    /**
     * @tc.name   testQueueAdd0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_QUEUE_ADD_0100
     * @tc.desc   Testing Queue add by number index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQueueAdd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testQueueAdd0001";
      try {
        let queue: Queue<number> = new Queue();
        let result = queue.add(1)
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testQueueAdd0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_QUEUE_ADD_0200
     * @tc.desc   Testing Queue add by string index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQueueAdd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testQueueAdd0002";
      try {
        let queue: Queue<string> = new Queue();
        let result = queue.add("a")
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testQueueAdd0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_QUEUE_ADD_0300
     * @tc.desc   Testing Queue add by object index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQueueAdd0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testQueueAdd0003";
      try {
        let queue: Queue<object> = new Queue();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        let result = queue.add(a)
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testQueueAdd0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_QUEUE_ADD_0400
     * @tc.desc   Testing Queue add by object or number or stirng  index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueAdd0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testQueueAdd0004";
      try {
        let queue: Queue<number | string | object> = new Queue();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        let b = 'a'
        let c = 1
        let result1 = queue.add(a)
        let result2 = queue.add(b)
        let result3 = queue.add(c)
        expect(result1).assertEqual(true);
        expect(result2).assertEqual(true);
        expect(result3).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testQueueAdd0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_QUEUE_ADD_0500
     * @tc.desc   Testing Queue add by undefined or null or stirng index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueAdd0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testQueueAdd0005";
      try {
        let queue: Queue<object> = new Queue();
        let result = queue.add(undefined)
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testQueuePop0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_QUEUE_POP_0600
     * @tc.desc   Testing Queue pop by without.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueuePop0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testQueuePop0006";
      try {
        let queue: Queue<number | string | object> = new Queue();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        let b = 'a'
        let c = 1
        queue.add(a)
        queue.add(b)
        queue.add(c)
        let result = queue.pop();
        expect(result).assertEqual(a);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testQueuePop0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_QUEUE_POP_0700
     * @tc.desc   Testing Queue pop by without.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueuePop0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testQueuePop0007";
      try {
        let queue: Queue<number | string | object> = new Queue();
        let result = queue.pop();
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testQueueGetfirst0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_QUEUE_GETFIRST_0800
     * @tc.desc   Testing Queue getFirst by without.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueGetfirst0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testQueueGetfirst0008";
      try {
        let queue: Queue<number | string | object> = new Queue();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        let b = 'a'
        let c = 1
        queue.add(a)
        queue.add(b)
        queue.add(c)
        let result = queue.getFirst();
        expect(result).assertEqual(a);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.name   testQueueGetfirst0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_QUEUE_GETFIRST_0900
     * @tc.desc   Testing Queue getFirst by without.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueGetfirst0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testQueueGetfirst0009";
      try {
        let queue: Queue<number | string | object> = new Queue();
        let result = queue.getFirst();
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.name   testQueueForeach0010
     * @tc.number testQueueForeach0010
     * @tc.desc   testQueueForeach0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueForeach0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testQueueForeach0010";
      try {
        let queue: Queue<number | string | object> = new Queue();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        let b = 'a';
        let c = 1;
        queue.add(a);
        queue.add(b);
        queue.add(c);
        queue.forEach((value, index): void => {
          let result = value;
          let result1 = index;
          expect(result).assertEqual(value);
          expect(result1).assertEqual(index);
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testQueueSymbol0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_QUEUE_[SYMBOL.ITERATOR]_1100
     * @tc.desc   Testing Queue [Symbol.iterator] by array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueSymbol0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testQueue[Symbol.iterator]0011";
      try {
        let queue: Queue<number | string | object> = new Queue();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        let b = 'a';
        let c = 1;
        queue.add(a);
        queue.add(b);
        queue.add(c);
        let iter = queue[Symbol.iterator]();
        let temp: IteratorResult<number> = iter.next().value;
        while (temp != undefined) {
          temp = iter.next().value;
          expect(temp).assertEqual(temp);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testQueueSymbol.iterator0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_QUEUE_[SYMBOL.ITERATOR]_1200
     * @tc.desc   Testing Queue [Symbol.iterator] by array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueSymbol.iterator0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testQueueSymbol.iterator0012";
      try {
        let queue: Queue<number | string | object> = new Queue();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        let b = 'a';
        let c = 1;
        queue.add(a);
        queue.add(b);
        queue.add(c);
        while (queue.length) {
          let item = queue.pop();
          console.log("value:" + item);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.name   testQueueForeach0013
     * @tc.number testQueueForeach0013
     * @tc.desc   testQueueForeach0013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueForeach0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testQueueForeach0013";
      try {
        let queue: Queue<number | string | object> = new Queue();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        let b = 'a';
        let c = 1;
        queue.add(a);
        queue.add(b);
        queue.add(c);
        queue.forEach((): void => {
          expect(queue.length).assertEqual(3);
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.name   testQueueForeach0014
     * @tc.number testQueueForeach0014
     * @tc.desc   testQueueForeach0014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueForeach0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testQueueForeach0014";
      try {
        let queue: Queue<number | string | object> = new Queue();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        queue.add(a);
        queue.forEach((value): void => {
          expect(queue.getFirst()).assertEqual(value);
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.name   testQueueForeach0015
     * @tc.number testQueueForeach0015
     * @tc.desc   testQueueForeach0015
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueForeach0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testQueueForeach0015";
      try {
        let queue: Queue<number | string | object> = new Queue();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        queue.add(a);
        queue.forEach((value, index, queue: Queue<number | string | object>): void => {
          expect(queue.getFirst()).assertEqual(value);
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.name   testQueueForeach0016
     * @tc.number testQueueForeach0016
     * @tc.desc   testQueueForeach0016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueForeach0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testQueueForeach0016";
      try {
        let queue: Queue<number | string | object> = new Queue();
        queue.add(1);
        queue.forEach((value, index, queue: Queue<number | string | object>): void => {
          expect(queue.getFirst()).assertEqual(value);
        }, queue);
        expect(queue.getFirst()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

  })
}
