/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Level,
  Size
} from '../../../../hypium/index';
import { BusinessError } from '@ohos.base';
import Stack from '@ohos.util.Stack';
import hilog from '@ohos.hilog'
import Utils from '../Util.test';

class C1 {
  name: string = ""
  age: string = ""
}
export default function StackTest1() {
  describe('StackTest1', (): void => {
    afterEach(() => {
      await Utils.msSleep(10)
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STACK_PUSH_0100
     * @tc.name       : testStackPush0001
     * @tc.desc       : Testing Stack push by number.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackPush0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStackPush0001";
      try {
        let stack: Stack<number> = new Stack<number>();
        let result = stack.push(1)
        expect(String(result)).assertEqual('1');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail()
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
    it('testStackPush0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStack0002";
      try {
        let stack: Stack<string> = new Stack<string>();
        let result = stack.push("a")
        expect(result).assertEqual("a");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail()
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
    it('testStackPush0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStackPush0003";
      try {
        let stack: Stack<object> = new Stack<object>();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        let result = stack.push(a)
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(a));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail()
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
    it('testStackPush0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStackPush0004";
      try {
        let stack: Stack<number | string | object> = new Stack<number | string | object>();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        let b = 'a'
        let c = 1
        let result1 = stack.push(a)
        let result2 = stack.push(b)
        let result3 = stack.push(c)
        expect(JSON.stringify(result1)).assertEqual(JSON.stringify(a));
        expect(JSON.stringify(result2)).assertEqual(JSON.stringify(b));
        expect(JSON.stringify(result3)).assertEqual(JSON.stringify(c));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail()
      }
    });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STACK_POP_0500
    //  * @tc.name       : testStackpop0005
    //  * @tc.desc       : Testing Stack pop by without.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testStackpop0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testStackpop0005";
    //   try {
    //     let stack: Stack<number | string | object> = new Stack<number | string | object>();
    //     stack.push(undefined)
    //     let result = stack.pop()
    //     expect(result).assertEqual(undefined);
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail()
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STACK_POP_0600
     * @tc.name       : testStackpop0006
     * @tc.desc       : Testing Stack pop by without.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackpop0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStackpop0006";
      try {
        let stack: Stack<number | string | object> = new Stack<number | string | object>();
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
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail()
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
    it('testStackpop0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStackpop0007";
      try {
        let stack: Stack<number | string | object> = new Stack<number | string | object>();
        let result = stack.pop()
        expect(result).assertEqual(undefined);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail()
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
    it('testStackpop0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStackpop0008";
      try {
        let stack: Stack<number | string | object> = new Stack<number | string | object>();
        let result = stack.pop();
        expect(result).assertEqual(undefined);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail()
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
    it('testStackPeek0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStackPeek0009";
      try {
        let stack: Stack<number | string | object> = new Stack<number | string | object>();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        let b = 'a'
        let c = 1
        stack.push(a)
        stack.push(b)
        stack.push(c)
        let result = stack.peek();
        expect(String(result)).assertEqual(String(c));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail()
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
    it('testStackPeek0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStackPeek0010";
      try {
        let stack: Stack<number | string | object> = new Stack<number | string | object>();
        let result = stack.peek();
        expect(result).assertEqual(undefined);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail()
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
    it('testStackLocate0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStackLocate0011";
      try {
        let stack: Stack<number | string | object> = new Stack<number | string | object>();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        let b = 'a'
        let c = 1
        stack.push(a)
        stack.push(b)
        stack.push(c)
        let result = stack.locate(a);
        expect(String(result)).assertEqual('0');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail()
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
    it('testStackLocate0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStackLocate0012";
      try {
        let stack: Stack<number> = new Stack<number>();
        stack.push(1)
        stack.push(2)
        stack.push(3)
        let result = stack.locate(4);
        expect(String(result)).assertEqual('-1');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail()
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
    it('testStackLocate0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStackLocate0013";
      try {
        let stack: Stack<number> = new Stack<number>();
        stack.push(1)
        stack.push(2)
        stack.push(3)
        stack.push(3)
        let result = stack.locate(3);
        expect(String(result)).assertEqual('2');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail()
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
    it('testStackForEach0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStackForEach0014";
      try {
        let stack: Stack<number> = new Stack<number>();
        stack.push(1)
        stack.push(2)
        stack.push(3)
        stack.push(3)
        stack.forEach((item, index) => {
          let result1 = item
          let result2 = index
          expect(String(result1)).assertEqual(String(item));
          expect(String(result2)).assertEqual(String(index));
        })
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail()
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
    it('testStackIsEmpty0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStackIsEmpty0015";
      try {
        let stack: Stack<number> = new Stack<number>();
        stack.push(1)
        stack.push(2)
        stack.push(3)
        stack.push(3)
        let result = stack.isEmpty()
        expect(String(result)).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail()
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
    it('testStackLength0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStack0016";
      try {
        let stack: Stack<number> = new Stack<number>();
        stack.push(1);
        stack.push(2);
        stack.push(3);
        stack.push(3);
        let result = stack.length;
        expect(String(result)).assertEqual('4');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail()
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STACK_FOREACH_1500
     * @tc.name       : testStackForEach0015
     * @tc.desc       : Testing Stack forEach by array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackForEach0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStackForEach0015";
      try {
        let stack: Stack<number> = new Stack<number>();
        stack.push(1);
        stack.push(2);
        stack.push(3);
        stack.forEach(() => {
          expect(String(stack.length)).assertEqual('3');
        });
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail()
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STACK_FOREACH_1600
     * @tc.name       : testStackForEach0016
     * @tc.desc       : Testing Stack forEach by array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackForEach0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStackForEach0016";
      try {
        let stack: Stack<number> = new Stack<number>();
        stack.push(1);
        stack.forEach((value) => {
          expect(String(stack.locate(value))).assertEqual('0');
        });
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail()
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STACK_FOREACH_1700
     * @tc.name       : testStackForEach0017
     * @tc.desc       : Testing Stack forEach by array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackForEach0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStackForEach0017";
      try {
        let stack: Stack<number> = new Stack<number>();
        stack.push(1);
        stack.forEach((value, index, stack: Stack<number>) => {
          expect(String(stack.locate(value))).assertEqual('0');
        });
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail()
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STACK_FOREACH_1800
     * @tc.name       : testStackForEach0018
     * @tc.desc       : Testing Stack forEach by array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackForEach0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStackForEach0018";
      try {
        let stack: Stack<number> = new Stack<number>();
        stack.push(1);
        stack.forEach((value, index, stack: Stack<number>) => {
          expect(String(stack.locate(value))).assertEqual('0');
        });
        expect(String(stack.locate(1))).assertEqual('0');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail()
      }
    });
  })
}