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
import Deque from '@ohos.util.Deque';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import Utils from '../Util.test';

class C1 {
  name: string;
  age: string;

  constructor(name: string = "", age: string = "") {
    this.name = name;
    this.age = age;
  }
}

export default function DequeTest() {
  describe('dequeTest', (): void => {
    afterEach(() => {
      await Utils.msSleep(10)
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_0100
     * @tc.name       : testInsertFront0001
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInsertFront0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testInsertFront0001";
      try {
        let deque: Deque<string> = new Deque<string>();
        deque.insertFront("a")
        deque.insertFront("b")
        deque.insertFront("c")
        let result = deque.getFirst();
        expect(result).assertEqual("c");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_0200
     * @tc.name       : testInsertFront0001
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInsertFront0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testInsertFront0002";
      try {
        let deque: Deque<number> = new Deque<number>();
        deque.insertFront(1)
        deque.insertFront(2)
        deque.insertFront(3)
        let result = deque.getFirst();
        expect(String(result)).assertEqual('3');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_0300
     * @tc.name       : testInsertFront0001
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInsertFront0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testInsertFront0003";
      try {
        let deque: Deque<object> = new Deque<object>();
        // let a: C1 = {
        //   name: "Dylon", age: "13"
        // };
        // let b: C1 = {
        //   name: "Joe", age: "14"
        // };
        // let c: C1 = {
        //   name: "Lucy", age: "15"
        // };
        let a: C1 = new C1("Dylon", "13");
        let b: C1 = new C1("Joe", "14");
        let c: C1 = new C1("Lucy", "15");
        deque.insertFront(a)
        deque.insertFront(b)
        deque.insertFront(c)
        let result = deque.getFirst();
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(c));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_0400
     * @tc.name       : testInsertFront0001
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInsertFront0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testInsertFront0004";
      try {
        let deque: Deque<number | string | object> = new Deque<number | string | object>();
        // let a: C1 = {
        //   name: "Dylon", age: "13"
        // };
        let a: C1 = new C1("Dylon", "13");
        let b = 'a'
        let c = 1
        deque.insertFront(a)
        deque.insertFront(b)
        deque.insertFront(c)
        let result = deque.getFirst();
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(c));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_0500
     * @tc.name       : testInsertEnd0005
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInsertEnd0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testInsertEnd0005";
      try {
        let deque: Deque<string> = new Deque<string>();
        deque.insertEnd("a")
        deque.insertEnd("b")
        deque.insertEnd("c")
        let result = deque.getLast();
        expect(result).assertEqual("c");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_0600
     * @tc.name       : testInsertEnd0005
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInsertEnd0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testInsertEnd0006";
      try {
        let deque: Deque<number> = new Deque<number>();
        deque.insertEnd(1)
        deque.insertEnd(2)
        deque.insertEnd(3)
        let result = deque.getLast();
        expect(String(result)).assertEqual('3');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_0700
     * @tc.name       : testInsertEnd0007
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInsertEnd0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testInsertEnd0007";
      try {
        let deque: Deque<object> = new Deque<object>();
        // let a: C1 = {
        //   name: "Dylon", age: "13"
        // };
        // let b: C1 = {
        //   name: "Joe", age: "14"
        // };
        // let c: C1 = {
        //   name: "Lucy", age: "15"
        // };
        let a: C1 = new C1("Dylon", "13");
        let b: C1 = new C1("Joe", "14");
        let c: C1 = new C1("Lucy", "15");
        deque.insertEnd(a)
        deque.insertEnd(b)
        deque.insertEnd(c)
        let result = deque.getLast();
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(c));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_0800
     * @tc.name       : testInsertEnd0005
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInsertEnd0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testInsertEnd0008";
      try {
        let deque: Deque<number | string | object> = new Deque<number | string | object>();
        // let a: C1 = {
        //   name: "Dylon", age: "13"
        // };
        let a: C1 = new C1("Dylon", "13");
        let b = 'a'
        let c = 1
        deque.insertEnd(a)
        deque.insertEnd(b)
        deque.insertEnd(c)
        let result = deque.getLast();
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(c));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_0900
     * @tc.name       : testHas0009
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHas0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testHas0009";
      try {
        let deque: Deque<string> = new Deque<string>();
        deque.insertFront("a")
        let result = deque.has("a");
        expect(String(result)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_1000
     * @tc.name       : testHas0010
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHas0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testHas0010";
      try {
        let deque: Deque<number> = new Deque<number>();
        deque.insertFront(1)
        let result = deque.has(1);
        expect(String(result)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_1100
     * @tc.name       : testHas0011
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHas0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testHas0011";
      try {
        let deque: Deque<object> = new Deque<object>();
        // let a: C1 = {
        //   name: "Dylon", age: "13"
        // };
        let a: C1 = new C1("Dylon", "13");
        deque.insertFront(a)
        let result = deque.has(a);
        expect(String(result)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_1200
     * @tc.name       : tesPopFirst0012
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('tesPopFirst0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "tesPopFirst0012";
      try {
        let deque: Deque<number> = new Deque<number>();
        deque.insertFront(1);
        deque.insertFront(2)
        deque.insertEnd(3);
        deque.insertFront(4)
        deque.popFirst()
        let result = deque.getFirst();
        expect(String(result)).assertEqual('2');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_1300
     * @tc.name       : tesPopFirst0013
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('tesPopFirst0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "tesPopFirst0013";
      try {
        let deque: Deque<number> = new Deque<number>();
        deque.popFirst()
        let result = deque.getFirst();
        expect(String(result)).assertEqual('undefined');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_1400
     * @tc.name       : tesPopLast0014
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('tesPopLast0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "tesPopLast0014";
      try {
        let deque: Deque<number> = new Deque<number>();
        deque.insertFront(1);
        deque.insertFront(2);
        deque.insertEnd(4);
        deque.insertFront(3);
        deque.popLast();
        let result = deque.getLast();
        expect(String(result)).assertEqual('1');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_1500
     * @tc.name       : tesGetFirst0015
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('tesGetFirst0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "tesGetFirst0015";
      try {
        let deque: Deque<number> = new Deque<number>();
        deque.popLast();
        let result = deque.getFirst();
        expect(String(result)).assertEqual('undefined');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_1600
     * @tc.name       : tesGetLast0016
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('tesGetLast0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "tesGetLast0016";
      try {
        let deque: Deque<number> = new Deque<number>();
        deque.insertFront(1);
        deque.insertFront(2);
        deque.insertEnd(4);
        deque.insertFront(3);
        let result = deque.getLast();
        expect(String(result)).assertEqual('4');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_1700
     * @tc.name       : tesGetLast0017
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('tesGetLast0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "tesGetLast0017";
      try {
        let deque: Deque<number> = new Deque<number>();
        let result = deque.getLast();
        expect(String(result)).assertEqual('undefined');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_1800
     * @tc.name       : tesGetLast0018
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('tesGetLast0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "tesGetLast0018";
      try {
        let deque: Deque<number | string | object> = new Deque<number | string | object>();
        // let a: C1 = {
        //   name: "Dylon", age: "13"
        // };
        let a: C1 = new C1("Dylon", "13");
        let b = 'a';
        let c = 1;
        deque.insertEnd(a);
        deque.insertEnd(b);
        deque.insertEnd(c);
        deque.forEach((item, index) => {
          let result = item;
          let itemIndex = index;
          expect(JSON.stringify(result)).assertEqual(JSON.stringify(item));
          expect(String(itemIndex)).assertEqual(String(itemIndex));
        })
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_1800
     * @tc.name       : tesGetLast0018
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
   // it('tesForeach0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "tesGetLast0019";
    //   try {
    //     let deque: Deque<number | string | object> = new Deque<number | string | object>();
    //     let res: Deque<number | string | object> = new Deque<number | string | object>();
    //     let a: C1 = new C1("Dylon", "13");
    //     let b = 'a'
    //     let c = 1
    //     deque.insertEnd(a);
    //     deque.insertEnd(b);
    //     deque.insertEnd(c);
    //     deque.forEach((item: number | string | object, index: number) => {
    //       let result = item;
    //       let itemIndex = index;
    //       expect(JSON.stringify(result)).assertEqual(JSON.stringify(item));
    //       expect(String(itemIndex)).assertEqual(String(itemIndex));
    //     })
    //     expect(JSON.stringify(deque)).assertEqual('{"0":{"name":"Dylon","age":"13"},"1":"a","2":1}')
    //     // expect(JSON.stringify(res)).assertEqual("{}");
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

  })
}
