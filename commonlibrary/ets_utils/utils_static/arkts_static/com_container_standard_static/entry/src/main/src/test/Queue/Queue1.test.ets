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
import Queue from '@ohos.util.Queue';
import Utils from '../Util.test';

class C1 {
  name: string = ""
  age: string = ""

  constructor(name: string = "", age: string = "") {
    this.name = name;
    this.age = age;
  }
}
export default function queueTest1() {
  describe('queueTest1', (): void => {
    afterEach(() => {
      await Utils.msSleep(10)
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_QUEUE_ADD_0100
     * @tc.name       : testQueueAdd0001
     * @tc.desc       : Testing Queue add by number index.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testQueueAdd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testQueueAdd0001";
      try {
        let queue: Queue<number> = new Queue<number>();
        let result = queue.add(1)
        expect(String(result)).assertEqual("true");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_QUEUE_ADD_0200
     * @tc.name       : testQueueAdd0002
     * @tc.desc       : Testing Queue add by string index.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testQueueAdd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testQueueAdd0002";
      try {
        let queue: Queue<string> = new Queue<string>();
        let result = queue.add("a")
        expect(String(result)).assertEqual("true");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_QUEUE_ADD_0300
     * @tc.name       : testQueueAdd0003
     * @tc.desc       : Testing Queue add by object index.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testQueueAdd0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testQueueAdd0003";
      try {
        let queue: Queue<object> = new Queue<object>();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        let result = queue.add(a)
        expect(String(result)).assertEqual("true");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_QUEUE_ADD_0400
     * @tc.name       : testQueueAdd0004
     * @tc.desc       : Testing Queue add by object or number or stirng  index.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testQueueAdd0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testQueueAdd0004";
      try {
        let queue: Queue<number | string | object> = new Queue<number | string | object>();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        let b = 'a'
        let c = 1
        let result1 = queue.add(a)
        let result2 = queue.add(b)
        let result3 = queue.add(c)
        expect(String(result1)).assertEqual("true");
        expect(String(result2)).assertEqual("true");
        expect(String(result3)).assertEqual("true");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_QUEUE_ADD_0500
    //  * @tc.name       : testQueueAdd0005
    //  * @tc.desc       : Testing Queue add by undefined or null or stirng index.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testQueueAdd0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testQueueAdd0005";
    //   try {
    //     let queue: Queue<object> = new Queue<object>();
    //     let result = queue.add(undefined)
    //     expect(result).assertEqual(true);
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_QUEUE_POP_0600
     * @tc.name       : testQueuePop0006
     * @tc.desc       : Testing Queue pop by without.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testQueuePop0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testQueuePop0006";
      try {
        let queue: Queue<number | string | object> = new Queue<number | string | object>();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        let b = 'a'
        let c = 1
        queue.add(a)
        queue.add(b)
        queue.add(c)
        let result = queue.pop();
        expect(String(result)).assertEqual(String(a));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_QUEUE_POP_0700
    //  * @tc.name       : testQueuePop0007
    //  * @tc.desc       : Testing Queue pop by without.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testQueuePop0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testQueuePop0007";
    //   try {
    //     let queue: Queue<number | string | object> = new Queue<number | string | object>();
    //     let result = queue.pop();
    //     expect(result).assertEqual(undefined);
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_QUEUE_GETFIRST_0800
     * @tc.name       : testQueueGetfirst0008
     * @tc.desc       : Testing Queue getFirst by without.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testQueueGetfirst0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testQueueGetfirst0008";
      try {
        let queue: Queue<number | string | object> = new Queue<number | string | object>();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        let b = 'a'
        let c = 1
        queue.add(a)
        queue.add(b)
        queue.add(c)
        let result = queue.getFirst();
        expect(String(result)).assertEqual(String(a));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_QUEUE_GETFIRST_0900
     * @tc.name       : testQueueGetfirst0009
     * @tc.desc       : Testing Queue getFirst by without.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testQueueGetfirst0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testQueueGetfirst0009";
      try {
        let queue: Queue<number | string | object> = new Queue<number | string | object>();
        let result = queue.getFirst();
        expect(result).assertEqual(undefined);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_QUEUE_1000
     * @tc.name       : testQueueForeach0010
     * @tc.desc       : Testing Queue forEach by array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('testQueueForeach0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testQueueForeach0010";
      try {
        let queue: Queue<number | string | object> = new Queue<number | string | object>();
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
          expect(String(result)).assertEqual(String(value));
          expect(String(result1)).assertEqual(String(index));
        });
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_QUEUE_[SYMBOL.ITERATOR]_1100
     * @tc.name       : testQueue[Symbol.iterator]0011
     * @tc.desc       : Testing Queue [Symbol.iterator] by array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testQueue[Symbol.iterator]0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testQueue[Symbol.iterator]0011";
      try {
        let queue: Queue<number | string | object> = new Queue<number | string | object>();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        let b = 'a';
        let c = 1;
        queue.add(a);
        queue.add(b);
        queue.add(c);
        let iter = queue.$_iterator();
        let temp = iter.next().value;
        while (temp != undefined) {
          temp = iter.next().value;
          expect(String(temp)).assertEqual(String(temp));
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_QUEUE_[SYMBOL.ITERATOR]_1200
     * @tc.name       : testQueue[Symbol.iterator]0012
     * @tc.desc       : Testing Queue [Symbol.iterator] by array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testQueueSymbol.iterator0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testQueueSymbol.iterator0012";
      try {
        let queue: Queue<number | string | object> = new Queue<number | string | object>();
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
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_QUEUE_1300
     * @tc.name       : testQueueForeach0013
     * @tc.desc       : Testing Queue forEach by array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('testQueueForeach0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testQueueForeach0013";
      try {
        let queue: Queue<number | string | object> = new Queue<number | string | object>();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        let b = 'a';
        let c = 1;
        queue.add(a);
        queue.add(b);
        queue.add(c);
        queue.forEach((): void => {
          expect(String(queue.length)).assertEqual("3");
        });
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_QUEUE_1400
     * @tc.name       : testQueueForeach0014
     * @tc.desc       : Testing Queue forEach by array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('testQueueForeach0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testQueueForeach0014";
      try {
        let queue: Queue<number | string | object> = new Queue<number | string | object>();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        queue.add(a);
        queue.forEach((value): void => {
          expect(String(queue.getFirst())).assertEqual(String(value));
        });
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_QUEUE_1500
     * @tc.name       : testQueueForeach0015
     * @tc.desc       : Testing Queue forEach by array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('testQueueForeach0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testQueueForeach0015";
      try {
        let queue: Queue<number | string | object> = new Queue<number | string | object>();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        queue.add(a);
        queue.forEach((value, index, queue: Queue<number | string | object>): void => {
          expect(String(queue.getFirst())).assertEqual(String(value));
        });
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_QUEUE_1600
     * @tc.name       : testQueueForeach0016
     * @tc.desc       : Testing Queue forEach by array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('testQueueForeach0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testQueueForeach0016";
      try {
        let queue: Queue<number | string | object> = new Queue<number | string | object>();
        queue.add(1);
        queue.forEach((value, index, queue: Queue<number | string | object>): void => {
          expect(String(queue.getFirst())).assertEqual("1");
        });
        expect(String(queue.getFirst())).assertEqual("1");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

  })
}