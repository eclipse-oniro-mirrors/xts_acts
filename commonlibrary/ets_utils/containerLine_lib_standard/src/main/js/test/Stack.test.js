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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
export default function StackTest() {
describe("StackTest", function () {

  /**
   * @tc.name: testConstructor001
   * @tc.desc: Create an Stack instance. For example: let stack = new Stack().
   */
  it("testConstructor001", 0, function () {
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
   * @tc.name: testPush002
   * @tc.desc: Insert element at top of stack.For example: stack.push("四").
   */
  it("testPush002", 0, function () {
    let stack = new Stack();
    stack.push("四");
    let res = stack.peek();
    expect(res).assertEqual("四");
  });

  /**
   * @tc.name: testPush003
   * @tc.desc: Insert element at top of stack.For example: stack.push(8).
   */
  it("testPush003", 0, function () {
    let stack = new Stack();
    stack.push(8);
    let res = stack.peek();
    expect(res).assertEqual(8);
  });

  /**
   * @tc.name: testPush004
   * @tc.desc: Insert element at top of stack.For example: let a = {name: "lala", age: "13岁"}; stack.push(a).
   */
  it("testPush004", 0, function () {
    let stack = new Stack();
    let a = {name: "lala", age: "13岁"};
    stack.push(a);
    let res = stack.peek();
    expect(res).assertEqual(a);
  });
  
  /**
   * @tc.name: testPush005
   * @tc.desc: Insert element at top of stack.For example: let a = [1, 2, 3, 4]; stack.push(a).
   */
  it("testPush005", 0, function () {
    let stack = new Stack();
    let a = [1, 2, 3, 4];
    stack.push(a);
    let res = stack.peek();
    expect(res).assertEqual(a);
  });
  
  /**
   * @tc.name: testPeek006
   * @tc.desc: Get stack top element. For example: stack.peek().
   */
  it("testPeek006", 0, function () {
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
   * @tc.name: testLocate007
   * @tc.desc: Get the index corresponding to the element in the stack. For example: stack.locate("A").
   */
  it("testLocate007", 0, function () {
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
   * @tc.name: testPop008
   * @tc.desc: Delete top of stack element. For example: stack.pop().
   */
  it("testPop008", 0, function () {
    let stack = new Stack();
    stack.push("B");
    stack.push(1);
    let res = stack.pop();
    let res1 = stack.peek();
    expect(res).assertEqual(1);
    expect(res1).assertEqual("B");
  });
  
  /**
   * @tc.name: testForEach009
   * @tc.desc: Traversing elements in stack instances. For example: stack.forEach((item, index) => {arr.push(item);}).
   */
  it("testForEach009", 0, function () {
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
   * @tc.name: testIterator010
   * @tc.desc: Iterate over all elements in the stack instance. For example: for (let item of stack) {arr.push(item);}.
   */
  it("testIterator010", 0, function () {
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
   * @tc.name: testLength011
   * @tc.desc: Get the number of elements in the stack instance. For example: stack.length.
   */
  it("testLength011", 0, function () {
    let stack = new Stack();
    stack.push(8);
    stack.push("一");
    stack.push("二");
    stack.push(5);
    let res = stack.length;
    expect(4).assertEqual(res);
  });
  
  /**
   * @tc.name: testLength012
   * @tc.desc: Get the number of elements in the stack instance. For example: stack.length.
   */
  it("testLength012", 0, function () {
    let stack = new Stack();
    let res = stack.length;
    expect(0).assertEqual(res);
  });
  
  /**
   * @tc.name: testIsEmpty013
   * @tc.desc: Determine whether the Stack instance is empty. For example: stack.isEmpty().
   */
  it("testIsEmpty013", 0, function () {
    let stack = new Stack();
    stack.push(8);
    stack.push("一");
    stack.push("二");
    stack.push(5);
    let res = stack.isEmpty();
    expect(res).assertEqual(false);
  });
  
  /**
   * @tc.name: testIsEmpty014
   * @tc.desc: Determine whether the Stack instance is empty. For example: stack.isEmpty().
   */
  it("testIsEmpty014", 0, function () {
    let stack = new Stack();
    let res = stack.isEmpty();
    expect(res).assertEqual(true);
  });
  
  /**
   * @tc.name: testPush015
   * @tc.desc: Insert element at top of stack.For example: stack.push("你好世界").
   */
  it("testPush015", 0, function () {
    let stack = new Stack();
    stack.push("你好世界");
    let res = stack.peek();
    expect(res).assertEqual("你好世界");
  });
  
  /**
   * @tc.name: testPush016
   * @tc.desc: Insert element at top of stack.For example: stack.push(1234).
   */
  it("testPush016", 0, function () {
    let stack = new Stack();
    stack.push(1234);
    let res = stack.peek();
    expect(res).assertEqual(1234);
  });
  
  /**
   * @tc.name: testPush017
   * @tc.desc: Insert element at top of stack.For example: stack.push(1.234).
   */
  it("testPush017", 0, function () {
    let stack = new Stack();
    stack.push(1.234);
    let res = stack.peek();
    expect(res).assertEqual(1.234);
  });
  
  /**
   * @tc.name: testPush018
   * @tc.desc: Insert element at top of stack.For example: stack.push(-1234).
   */
  it("testPush018", 0, function () {
    let stack = new Stack();
    stack.push(-1234);
    let res = stack.peek();
    expect(res).assertEqual(-1234);
  });
  
  /**
   * @tc.name: testPush019
   * @tc.desc: Insert element at top of stack.For example: stack.push(0).
   */
  it("testPush019", 0, function () {
    let stack = new Stack();
    stack.push(0);
    let res = stack.peek();
    expect(res).assertEqual(0);
  });
  
  /**
   * @tc.name: testPush020
   * @tc.desc: Insert element at top of stack.For example: stack.push("*").
   */
  it("testPush020", 0, function () {
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
   * @tc.name: testPush021
   * @tc.desc: Insert element at top of stack.For example: let arr = {}; stack.push(arr).
   */
  it("testPush021", 0, function () {
    let stack = new Stack();
    let arr = {};
    stack.push(arr);
    let res = stack.peek();
    expect(res).assertEqual(arr);
  });
  
  /**
   * @tc.name: testPush022
   * @tc.desc: Insert element at top of stack.For example: let arr = []; stack.push(arr).
   */
  it("testPush022", 0, function () {
    let stack = new Stack();
    let arr = [];
    stack.push(arr);
    let res = stack.peek();
    expect(res).assertEqual(arr);
  });
  
  /**
   * @tc.name: testPush023
   * @tc.desc: Insert element at top of stack.For example: stack.push("hello world").
   */
  it("testPush023", 0, function () {
    let stack = new Stack();
    stack.push("hello world");
    let res = stack.peek();
    expect(res).assertEqual("hello world");
  });
  
  /**
   * @tc.name: testPush024
   * @tc.desc: Insert element at top of stack.
   */
  it("testPush024", 0, function () {
    let stack = new Stack();
    stack.push("~!@#$^&*()_+-*/=.?<>:;|{}[]");
    let res = stack.peek();
    expect(res).assertEqual("~!@#$^&*()_+-*/=.?<>:;|{}[]");
  });
  
  /**
   * @tc.name: testPush025
   * @tc.desc: Insert element at top of stack. For example: stack.push("").
   */
  it("testPush025", 0, function () {
    let stack = new Stack();
    stack.push("");
    let res = stack.peek();
    expect(res).assertEqual("");
  });
  
  /**
   * @tc.name: testPush026
   * @tc.desc: Insert element at top of stack. For example: stack.push(true).
   */
  it("testPush026", 0, function () {
    let stack = new Stack();
    stack.push(true);
    let res = stack.peek();
    expect(res).assertEqual(true);
  });
  
  /**
   * @tc.name: testPush027
   * @tc.desc: Insert element at top of stack. For example: stack.push(false).
   */
  it("testPush027", 0, function () {
    let stack = new Stack();
    stack.push(false);
    let res = stack.peek();
    expect(res).assertEqual(false);
  });
  
  /**
   * @tc.name: testPush028
   * @tc.desc: Insert element at top of stack. For example: stack.push(null).
   */
  it("testPush028", 0, function () {
    let stack = new Stack();
    stack.push(null);
    let res = stack.peek();
    expect(res).assertEqual(null);
  });
  
  /**
   * @tc.name: testPush029
   * @tc.desc: Insert element at top of stack. For example: stack.push(undefined).
   */
  it("testPush029", 0, function () {
    let stack = new Stack();
    stack.push(undefined);
    let res = stack.peek();
    expect(res).assertEqual(undefined);
  });
  
  /**
   * @tc.name: testPeek030
   * @tc.desc: Get stack top element. For example: stack.peek().
   */
  it("testPeek030", 0, function () {
    let stack = new Stack();
    let res = stack.peek();
    expect(res).assertEqual(undefined);
  });
  
  /**
   * @tc.name: testPop031
   * @tc.desc: Delete top of stack element. For example: stack.pop().
   */
  it("testPop031", 0, function () {
    let stack = new Stack();
    let res = stack.pop();
    expect(res).assertEqual(undefined);
  });
  
  /**
   * @tc.name: testForEach032
   * @tc.desc: Traversing elements in stack instances. For example: stack.forEach((item, index) => {arr.push(item);}).
   */
  it("testForEach032", 0, function () {
    let stack = new Stack();
    let arr = [];
    stack.forEach((item, index) => {
      arr.push(item);
    });
    expect(arr.length).assertEqual(0);
  });
  
  /**
   * @tc.name: testIterator033
   * @tc.desc: Iterate over all elements in the stack instance. For example: for (let item of stack) {arr.push(item);}.
   */
  it("testIterator033", 0, function () {
    let stack = new Stack();
    let arr = [];
    for (let item of stack) {
      arr.push(item);
    }
    expect(arr.length).assertEqual(0);
  });
  
  /**
   * @tc.name: testPush034
   * @tc.desc: Insert element at top of stack. For example: for (let i = 0; i < 1000; i++) {stack.push(i);}.
   */
  it("testPush034", 0, function () {
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
   * @tc.name: testIterator035
   * @tc.desc: Iterate over all elements in the stack instance. For example: stack[Symbol.iterator]().
   */
  it("testIterator035", 0, function () {
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
   * @tc.name: testPush036
   * @tc.desc: Insert element at top of stack. For example: stack.push.bind({}, 10)().
   */
  it("testPush036 ", 0, function () {
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
   * @tc.name: testIsEmpty037
   * @tc.desc: Determine whether the Stack instance is empty. For example: stack.isEmpty.bind({}, "a")().
   */  
  it('testIsEmpty037', 0, function () {
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
   * @tc.name: testPop038
   * @tc.desc: Delete top of stack element. For example: stack.pop.bind({}, "a")().
   */
  it('testPop038', 0, function () {
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
