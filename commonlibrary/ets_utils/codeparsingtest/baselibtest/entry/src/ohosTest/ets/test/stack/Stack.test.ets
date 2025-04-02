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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import { Stack } from '@kit.ArkTS';

export default function StackTest() {
  describe('StackTest', () => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STACK_PUSH_0100
     * @tc.name       : testStackPush0001
     * @tc.desc       : Testing Stack push by number.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackPush0001', 0, () => {
      const TAG = "testStackPush0001";
      try {
        let stack: Stack<number> = new Stack();
        let result = stack.push(1)
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STACK_PUSH_0200
     * @tc.name       : testStackPush0002
     * @tc.desc       : Testing Stack push by string.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackPush0002', 0, () => {
      const TAG = "testStack0002";
      try {
        let stack: Stack<string> = new Stack();
        let result = stack.push("a")
        expect(result).assertEqual("a");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STACK_PUSH_0300
     * @tc.name       : testStackPush0003
     * @tc.desc       : Testing Stack push by object.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackPush0003', 0, () => {
      const TAG = "testStackPush0003";
      try {
        let stack: Stack<object> = new Stack();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        let result = stack.push(a)
        expect(result).assertEqual(a);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STACK_PUSH_0400
     * @tc.name       : testStackPush0004
     * @tc.desc       : Testing Stack push by object or string or number.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackPush0004', 0, () => {
      const TAG = "testStackPush0004";
      try {
        let stack: Stack<number | string | object> = new Stack();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        let b = 'a'
        let c = 1
        let result1 = stack.push(a)
        let result2 = stack.push(b)
        let result3 = stack.push(c)
        expect(result1).assertEqual(a);
        expect(result2).assertEqual(b);
        expect(result3).assertEqual(c);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STACK_POP_0500
     * @tc.name       : testStackpop0005
     * @tc.desc       : Testing Stack pop by without.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackpop0005', 0, () => {
      const TAG = "testStackpop0005";
      try {
        let stack: Stack<number | string | object> = new Stack();
        stack.push(undefined)
        let result = stack.pop()
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STACK_POP_0600
     * @tc.name       : testStackpop0006
     * @tc.desc       : Testing Stack pop by without.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackpop0006', 0, () => {
      const TAG = "testStackpop0006";
      try {
        let stack: Stack<number | string | object> = new Stack();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        let b = 'a'
        let c = 1
        stack.push(a)
        stack.push(b)
        stack.push(c)
        stack.pop()
        let result = stack.pop()
        expect(result).assertEqual(b);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STACK_POP_0700
     * @tc.name       : testStackpop0007
     * @tc.desc       : Testing Stack pop by without.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackpop0007', 0, () => {
      const TAG = "testStackpop0007";
      try {
        let stack: Stack<number | string | object> = new Stack();
        let result = stack.pop()
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STACK_POP_0800
     * @tc.name       : testStackpop0008
     * @tc.desc       : Testing Stack pop by without.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackpop0008', 0, () => {
      const TAG = "testStackpop0008";
      try {
        let stack: Stack<number | string | object> = new Stack();
        let result = stack.pop();
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STACK_PEEK_0900
     * @tc.name       : testStackPeek0009
     * @tc.desc       : Testing Stack pop by without.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackPeek0009', 0, () => {
      const TAG = "testStackPeek0009";
      try {
        let stack: Stack<number | string | object> = new Stack();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        let b = 'a'
        let c = 1
        stack.push(a)
        stack.push(b)
        stack.push(c)
        let result = stack.peek();
        expect(result).assertEqual(c);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STACK_PEEK_0100
     * @tc.name       : testStackPeek0010
     * @tc.desc       : Testing Stack pop by without.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackPeek0010', 0, () => {
      const TAG = "testStackPeek0010";
      try {
        let stack: Stack<number | string | object> = new Stack();
        let result = stack.peek();
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STACK_LOCATE_01100
     * @tc.name       : testStackLocate0011
     * @tc.desc       : Testing Stack locate by without.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackLocate0011', 0, () => {
      const TAG = "testStackLocate0011";
      try {
        let stack: Stack<number | string | object> = new Stack();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        let b = 'a'
        let c = 1
        stack.push(a)
        stack.push(b)
        stack.push(c)
        let result = stack.locate(a);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STACK_LOCATE_1200
     * @tc.name       : testStackLocate0012
     * @tc.desc       : Testing Stack locate by without.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackLocate0012', 0, () => {
      const TAG = "testStackLocate0012";
      try {
        let stack: Stack<number> = new Stack();
        stack.push(1)
        stack.push(2)
        stack.push(3)
        let result = stack.locate(4);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STACK_LOCATE_1300
     * @tc.name       : testStackLocate0013
     * @tc.desc       : Testing Stack locate by without.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackLocate0013', 0, () => {
      const TAG = "testStackLocate0013";
      try {
        let stack: Stack<number> = new Stack();
        stack.push(1)
        stack.push(2)
        stack.push(3)
        stack.push(3)
        let result = stack.locate(3);
        expect(result).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STACK_FOREACH_1400
     * @tc.name       : testStackForEach0014
     * @tc.desc       : Testing Stack forEach by array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackForEach0014', 0, () => {
      const TAG = "testStackForEach0014";
      try {
        let stack: Stack<number> = new Stack();
        stack.push(1)
        stack.push(2)
        stack.push(3)
        stack.push(3)
        stack.forEach((item, index) => {
          let result1 = item
          let result2 = index
          expect(result1).assertEqual(item);
          expect(result2).assertEqual(index);
        })
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STACK_ISEMPTY_1500
     * @tc.name       : testStackIsEmpty0015
     * @tc.desc       : Testing isEmpty forEach by without.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackIsEmpty0015', 0, () => {
      const TAG = "testStackIsEmpty0015";
      try {
        let stack: Stack<number> = new Stack();
        stack.push(1)
        stack.push(2)
        stack.push(3)
        stack.push(3)
        let result = stack.isEmpty()
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STACK_PUSH_1500
     * @tc.name       : testStackLength0016
     * @tc.desc       : Testing isEmpty push by without.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackLength0016', 0, () => {
      const TAG = "testStack0016";
      try {
        let stack: Stack<number> = new Stack();
        stack.push(1)
        stack.push(2)
        stack.push(3)
        stack.push(3)
        let result = stack.length
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

  })
}
