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
     * @tc.name   testInsertFront0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_0100
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testInsertFront0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_0200
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testInsertFront0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_0300
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInsertFront0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testInsertFront0003";
      try {
        let deque: Deque<object> = new Deque<object>();
        let a: C1 = new C1("Dylon", "13");
        let b: C1 = new C1("Joe", "14");
        let c: C1 = new C1("Lucy", "15");
        deque.insertFront(a)
        deque.insertFront(b)
        deque.insertFront(c)
        let result = deque.getFirst();
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(c));
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testInsertFront0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_0400
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInsertFront0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testInsertFront0004";
      try {
        let deque: Deque<number | string | object> = new Deque<number | string | object>();
        let a: C1 = new C1("Dylon", "13");
        let b = 'a'
        let c = 1
        deque.insertFront(a)
        deque.insertFront(b)
        deque.insertFront(c)
        let result = deque.getFirst();
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(c));
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.name   testInsertEnd0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_0500
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testInsertEnd0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_0600
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testInsertEnd0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_0700
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInsertEnd0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testInsertEnd0007";
      try {
        let deque: Deque<object> = new Deque<object>();
        let a: C1 = new C1("Dylon", "13");
        let b: C1 = new C1("Joe", "14");
        let c: C1 = new C1("Lucy", "15");
        deque.insertEnd(a)
        deque.insertEnd(b)
        deque.insertEnd(c)
        let result = deque.getLast();
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(c));
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testInsertEnd0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_0800
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInsertEnd0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testInsertEnd0008";
      try {
        let deque: Deque<number | string | object> = new Deque<number | string | object>();
        let a: C1 = new C1("Dylon", "13");
        let b = 'a'
        let c = 1
        deque.insertEnd(a)
        deque.insertEnd(b)
        deque.insertEnd(c)
        let result = deque.getLast();
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(c));
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHas0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_0900
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHas0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testHas0009";
      try {
        let deque: Deque<string> = new Deque<string>();
        deque.insertFront("a")
        let result = deque.has("a");
        expect(String(result)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHas0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_1000
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHas0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testHas0010";
      try {
        let deque: Deque<number> = new Deque<number>();
        deque.insertFront(1)
        let result = deque.has(1);
        expect(String(result)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHas0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_1100
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHas0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testHas0011";
      try {
        let deque: Deque<object> = new Deque<object>();
        let a: C1 = new C1("Dylon", "13");
        deque.insertFront(a)
        let result = deque.has(a);
        expect(String(result)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   tesPopFirst0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_1200
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   tesPopFirst0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_1300
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tesPopFirst0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "tesPopFirst0013";
      try {
        let deque: Deque<number> = new Deque<number>();
        let res = deque.popFirst();
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.message).assertEqual("Container is empty");
      }
    });

    /**
     * @tc.name   tesPopLast0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_1400
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   tesGetFirst0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_1500
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tesGetFirst0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "tesGetFirst0015";
      try {
        let deque: Deque<number> = new Deque<number>();
        let result = deque.getFirst();
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.message).assertEqual("Container is empty");
      }
    });

    /**
     * @tc.name   tesGetLast0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_1600
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   tesGetLast0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_1700
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tesGetLast0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "tesGetLast0017";
      try {
        let deque: Deque<number> = new Deque<number>();
        let result = deque.getLast();
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.message).assertEqual("Container is empty");
      }
    });

    /**
     * @tc.name   tesGetLast0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_1800
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tesGetLast0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "tesGetLast0018";
      try {
        let deque: Deque<number | string | object> = new Deque<number | string | object>();
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
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

   /**
    * @tc.name   tesForeach0019
    * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DEQUE_1800
    * @tc.desc   Test the function of the interface isEmpty.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it('tesForeach0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "tesGetLast0019";
      try {
        let deque: Deque<number | string | object> = new Deque<number | string | object>();
        let res: Deque<number | string | object> = new Deque<number | string | object>();
        let a: C1 = new C1("Dylon", "13");
        let b = 'a'
        let c = 1
        deque.insertEnd(a);
        deque.insertEnd(b);
        deque.insertEnd(c);
        deque.forEach((item: number | string | object, index: int) => {
          let result = item;
          let itemIndex = index;
          expect(JSON.stringify(result)).assertEqual(JSON.stringify(item));
          expect(String(itemIndex)).assertEqual(String(itemIndex));
        })
        expect(JSON.stringify(deque)).assertEqual('{"0":{"name":"Dylon","age":"13"},"1":"a","2":1}')
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   tesForeach0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL3_003
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tesForeach0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "tesForeach0020";
      try {
        let deque: Deque<number | string | object> = new Deque<number | string | object>();
        let res: Deque<number | string | object> = new Deque<number | string | object>();
        let a: C1 = new C1("Dylon", "13");
        let b = 'a'
        let c = 1
        deque.insertEnd(a);
        deque.insertEnd(b);
        deque.insertEnd(c);
        let iter = deque.$_iterator();
        let temp = iter.next().value;
        while (temp != undefined) {
          temp = iter.next().value;
          expect(String(temp)).assertEqual(String(temp));
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testUtil3_004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL3_004
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil3_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let deque: Deque<int> = new Deque<int>();
      expect(deque.length).assertEqual(0);
      deque.insertFront(2);
      deque.insertFront(4);
      deque.insertFront(5);
      deque.insertFront(4);
      expect(deque.length).assertEqual(4);
    })
  })
}
