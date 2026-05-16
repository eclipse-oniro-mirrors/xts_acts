/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import Stack from "@ohos.util.Stack";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
export default function StackTest() {
describe("StackTest", function () {

  /**
   * @tc.name   testConstructor001
   * @tc.number testConstructor001
   * @tc.desc   Create an Stack instance. For example: let stack = new Stack().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testConstructor001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    try {
      let stack = new Stack();
      expect(stack != undefined).assertEqual(true);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200012);
      expect(err.message).assertEqual("The Stack's constructor cannot be directly invoked");
    }
  });

  /**
   * @tc.name   testPush002
   * @tc.number testPush002
   * @tc.desc   Insert element at top of stack.For example: stack.push("四").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testPush002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let stack = new Stack();
    stack.push("四");
    let res = stack.peek();
    expect(res).assertEqual("四");
  });

  /**
   * @tc.name   testPush003
   * @tc.number testPush003
   * @tc.desc   Insert element at top of stack.For example: stack.push(8).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testPush003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let stack = new Stack();
    stack.push(8);
    let res = stack.peek();
    expect(res).assertEqual(8);
  });

  /**
   * @tc.name   testPush004
   * @tc.number testPush004
   * @tc.desc   Insert element at top of stack.For example: let a = {name: "lala", age: "13岁"}; stack.push(a).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testPush004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let stack = new Stack();
    let a = {name: "lala", age: "13岁"};
    stack.push(a);
    let res = stack.peek();
    expect(res).assertEqual(a);
  });
  
  /**
   * @tc.name   testPush005
   * @tc.number testPush005
   * @tc.desc   Insert element at top of stack.For example: let a = [1, 2, 3, 4]; stack.push(a).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testPush005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let stack = new Stack();
    let a = [1, 2, 3, 4];
    stack.push(a);
    let res = stack.peek();
    expect(res).assertEqual(a);
  });
  
  /**
   * @tc.name   testPeek006
   * @tc.number testPeek006
   * @tc.desc   Get stack top element. For example: stack.peek().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testPeek006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let stack = new Stack();
    let a = [1, 2, 3, 4];
    stack.push(a);
    stack.push("A");
    stack.push("B");
    stack.push(1);
    let res = stack.peek();
    expect(res).assertEqual(1);
  });
  
  /**
   * @tc.name   testLocate007
   * @tc.number testLocate007
   * @tc.desc   Get the index corresponding to the element in the stack. For example: stack.locate("A").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testLocate007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let stack = new Stack();
    let a = [1, 2, 3, 4];
    stack.push(8);
    stack.push(a);
    stack.push("A");
    stack.push("B");
    stack.push(1);
    let res = stack.locate("A");
    let res1 = stack.locate("C");
    expect(res).assertEqual(2);
    expect(res1).assertEqual(-1);
  });
  
  /**
   * @tc.name   testPop008
   * @tc.number testPop008
   * @tc.desc   Delete top of stack element. For example: stack.pop().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testPop008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let stack = new Stack();
    stack.push("B");
    stack.push(1);
    let res = stack.pop();
    let res1 = stack.peek();
    expect(res).assertEqual(1);
    expect(res1).assertEqual("B");
  });
  
  /**
   * @tc.name   testForEach009
   * @tc.number testForEach009
   * @tc.desc   Traversing elements in stack instances. For example: stack.forEach((item, index) => {arr.push(item);}).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testForEach009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let stack = new Stack();
    stack.push(8);
    stack.push("三");
    stack.push(5);
    let c = {name: "lili", age: "13"};
    stack.push(c);
    stack.push(6);
    stack.push("四");
    let arr = [];
    stack.forEach((item, index) => {
      arr.push(item);
    });
    let a = [8, "三", 5, c, 6, "四"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
  
  /**
   * @tc.name   testIterator010
   * @tc.number testIterator010
   * @tc.desc   Iterate over all elements in the stack instance. For example: for (let item of stack) {arr.push(item);}.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testIterator010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let stack = new Stack();
    stack.push(8);
    stack.push("一");
    stack.push("二");
    stack.push(5);
    let c = [1, 2, 3, 4];
    stack.push(c);
    stack.push(6);
    stack.push("三");
    stack.push("四");
    let arr = [];
    for (let item of stack) {
      arr.push(item);
    }
    let a = [8, "一", "二", 5, c, 6, "三", "四"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
  
  /**
   * @tc.name   testLength011
   * @tc.number testLength011
   * @tc.desc   Get the number of elements in the stack instance. For example: stack.length.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testLength011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let stack = new Stack();
    stack.push(8);
    stack.push("一");
    stack.push("二");
    stack.push(5);
    let res = stack.length;
    expect(4).assertEqual(res);
  });
  
  /**
   * @tc.name   testLength012
   * @tc.number testLength012
   * @tc.desc   Get the number of elements in the stack instance. For example: stack.length.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testLength012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let stack = new Stack();
    let res = stack.length;
    expect(0).assertEqual(res);
  });
  
  /**
   * @tc.name   testIsEmpty013
   * @tc.number testIsEmpty013
   * @tc.desc   Determine whether the Stack instance is empty. For example: stack.isEmpty().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testIsEmpty013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let stack = new Stack();
    stack.push(8);
    stack.push("一");
    stack.push("二");
    stack.push(5);
    let res = stack.isEmpty();
    expect(res).assertEqual(false);
  });
  
  /**
   * @tc.name   testIsEmpty014
   * @tc.number testIsEmpty014
   * @tc.desc   Determine whether the Stack instance is empty. For example: stack.isEmpty().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIsEmpty014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let stack = new Stack();
    let res = stack.isEmpty();
    expect(res).assertEqual(true);
  });
  
  /**
   * @tc.name   testPush015
   * @tc.number testPush015
   * @tc.desc   Insert element at top of stack.For example: stack.push("你好世界").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testPush015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let stack = new Stack();
    stack.push("你好世界");
    let res = stack.peek();
    expect(res).assertEqual("你好世界");
  });
  
  /**
   * @tc.name   testPush016
   * @tc.number testPush016
   * @tc.desc   Insert element at top of stack.For example: stack.push(1234).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testPush016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let stack = new Stack();
    stack.push(1234);
    let res = stack.peek();
    expect(res).assertEqual(1234);
  });
  
  /**
   * @tc.name   testPush017
   * @tc.number testPush017
   * @tc.desc   Insert element at top of stack.For example: stack.push(1.234).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testPush017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let stack = new Stack();
    stack.push(1.234);
    let res = stack.peek();
    expect(res).assertEqual(1.234);
  });
  
  /**
   * @tc.name   testPush018
   * @tc.number testPush018
   * @tc.desc   Insert element at top of stack.For example: stack.push(-1234).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testPush018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let stack = new Stack();
    stack.push(-1234);
    let res = stack.peek();
    expect(res).assertEqual(-1234);
  });
  
  /**
   * @tc.name   testPush019
   * @tc.number testPush019
   * @tc.desc   Insert element at top of stack.For example: stack.push(0).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testPush019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let stack = new Stack();
    stack.push(0);
    let res = stack.peek();
    expect(res).assertEqual(0);
  });
  
  /**
   * @tc.name   testPush020
   * @tc.number testPush020
   * @tc.desc   Insert element at top of stack.For example: stack.push("*").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testPush020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let stack = new Stack();
    stack.push(10);
    stack.push(3.14);
    stack.push(-2);
    stack.push("AB");
    stack.push("*");
    let res = stack.peek();
    expect(res).assertEqual("*");
  });
  
  /**
   * @tc.name   testPush021
   * @tc.number testPush021
   * @tc.desc   Insert element at top of stack.For example: let arr = {}; stack.push(arr).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testPush021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let stack = new Stack();
    let arr = {};
    stack.push(arr);
    let res = stack.peek();
    expect(res).assertEqual(arr);
  });
  
  /**
   * @tc.name   testPush022
   * @tc.number testPush022
   * @tc.desc   Insert element at top of stack.For example: let arr = []; stack.push(arr).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testPush022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let stack = new Stack();
    let arr = [];
    stack.push(arr);
    let res = stack.peek();
    expect(res).assertEqual(arr);
  });
  
  /**
   * @tc.name   testPush023
   * @tc.number testPush023
   * @tc.desc   Insert element at top of stack.For example: stack.push("hello world").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testPush023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let stack = new Stack();
    stack.push("hello world");
    let res = stack.peek();
    expect(res).assertEqual("hello world");
  });
  
  /**
   * @tc.name   testPush024
   * @tc.number testPush024
   * @tc.desc   Insert element at top of stack.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testPush024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let stack = new Stack();
    stack.push("~!@#$^&*()_+-*/=.?<>:;|{}[]");
    let res = stack.peek();
    expect(res).assertEqual("~!@#$^&*()_+-*/=.?<>:;|{}[]");
  });
  
  /**
   * @tc.name   testPush025
   * @tc.number testPush025
   * @tc.desc   Insert element at top of stack. For example: stack.push("").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testPush025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let stack = new Stack();
    stack.push("");
    let res = stack.peek();
    expect(res).assertEqual("");
  });
  
  /**
   * @tc.name   testPush026
   * @tc.number testPush026
   * @tc.desc   Insert element at top of stack. For example: stack.push(true).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testPush026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let stack = new Stack();
    stack.push(true);
    let res = stack.peek();
    expect(res).assertEqual(true);
  });
  
  /**
   * @tc.name   testPush027
   * @tc.number testPush027
   * @tc.desc   Insert element at top of stack. For example: stack.push(false).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testPush027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let stack = new Stack();
    stack.push(false);
    let res = stack.peek();
    expect(res).assertEqual(false);
  });
  
  /**
   * @tc.name   testPush028
   * @tc.number testPush028
   * @tc.desc   Insert element at top of stack. For example: stack.push(null).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testPush028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let stack = new Stack();
    stack.push(null);
    let res = stack.peek();
    expect(res).assertEqual(null);
  });
  
  /**
   * @tc.name   testPush029
   * @tc.number testPush029
   * @tc.desc   Insert element at top of stack. For example: stack.push(undefined).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testPush029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let stack = new Stack();
    stack.push(undefined);
    let res = stack.peek();
    expect(res).assertEqual(undefined);
  });
  
  /**
   * @tc.name   testPeek030
   * @tc.number testPeek030
   * @tc.desc   Get stack top element. For example: stack.peek().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testPeek030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let stack = new Stack();
    let res = stack.peek();
    expect(res).assertEqual(undefined);
  });
  
  /**
   * @tc.name   testPop031
   * @tc.number testPop031
   * @tc.desc   Delete top of stack element. For example: stack.pop().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testPop031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let stack = new Stack();
    let res = stack.pop();
    expect(res).assertEqual(undefined);
  });
  
  /**
   * @tc.name   testForEach032
   * @tc.number testForEach032
   * @tc.desc   Traversing elements in stack instances. For example: stack.forEach((item, index) => {arr.push(item);}).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testForEach032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let stack = new Stack();
    let arr = [];
    stack.forEach((item, index) => {
      arr.push(item);
    });
    expect(arr.length).assertEqual(0);
  });
  
  /**
   * @tc.name   testIterator033
   * @tc.number testIterator033
   * @tc.desc   Iterate over all elements in the stack instance. For example: for (let item of stack) {arr.push(item);}.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIterator033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let stack = new Stack();
    let arr = [];
    for (let item of stack) {
      arr.push(item);
    }
    expect(arr.length).assertEqual(0);
  });
  
  /**
   * @tc.name   testPush034
   * @tc.number testPush034
   * @tc.desc   Insert element at top of stack. For example: for (let i = 0; i < 1000; i++) {stack.push(i);}.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testPush034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let stack = new Stack();
    for (let i = 0; i < 1000; i++) {
      stack.push(i);
    }
    let res = stack.length;
    expect(res).assertEqual(1000);
    let res1 = stack.peek();
    expect(res1).assertEqual(999);
  });
  
  /**
   * @tc.name   testIterator035
   * @tc.number testIterator035
   * @tc.desc   Iterate over all elements in the stack instance. For example: stack[Symbol.iterator]().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIterator035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let stack = new Stack();
    stack.push(8);
    stack.push("一");
    stack.push("二");
    stack.push(5);
    let c = [1, 2, 3, 4];
    stack.push(c);
    stack.push(6);
    stack.push("三");
    stack.push("四");
    let arr = [];
    let itr = stack[Symbol.iterator]();
    let tmp = undefined;
    do {
      tmp = itr.next().value;
      arr.push(tmp);
    } while (tmp != undefined);
    let a = [8, "一", "二", 5, c, 6, "三", "四"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
   * @tc.name   testPush036
   * @tc.number testPush036
   * @tc.desc   Insert element at top of stack. For example: stack.push.bind({}, 10)().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testPush036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let stack = new Stack();
    try {
      stack.push.bind({}, 10)();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The push method cannot be bound`);
    }
  });

  /**
   * @tc.name   testIsEmpty037
   * @tc.number testIsEmpty037
   * @tc.desc   Determine whether the Stack instance is empty. For example: stack.isEmpty.bind({}, "a")().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testIsEmpty037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let  stack = new Stack();
    try {
      stack.isEmpty.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The isEmpty method cannot be bound`);
    }
  });

  /**
   * @tc.name   testPop038
   * @tc.number testPop038
   * @tc.desc   Delete top of stack element. For example: stack.pop.bind({}, "a")().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testPop038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let  stack = new Stack();
    try {
      stack.pop.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The pop method cannot be bound`);
    }
  });
});
}
