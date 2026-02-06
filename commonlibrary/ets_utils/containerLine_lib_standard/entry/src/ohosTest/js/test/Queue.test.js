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
import Queue from "@ohos.util.Queue";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
export default function QueueTest() {
describe("QueueTest", function () {

  /**
   * @tc.name: testConstructor001
   * @tc.desc: Create an Queue instance. For example: let queue = new Queue().
   */
  it("testConstructor001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    try {
      let queue = new Queue();
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200012);
      expect(err.message).assertEqual("The Queue's constructor cannot be directly invoked");
    }
  });
  
  /**
   * @tc.name: testAdd002
   * @tc.desc: Add element to Queue instance end. For example: queue.add("四").
   */
  it("testAdd002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let queue = new Queue();
    queue.add("四");
    let res = queue.getFirst();
    expect(res).assertEqual("四");
  });
  
  /**
   * @tc.name: testAdd003
   * @tc.desc: Add element to Queue instance end. For example: queue.add(8).
   */
  it("testAdd003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let queue = new Queue();
    queue.add(8);
    let res = queue.getFirst();
    expect(res).assertEqual(8);
  });
  
  /**
   * @tc.name: testAdd004
   * @tc.desc: Add element to Queue instance end. For example: queue.add(8).
   */
  it("testAdd004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let queue = new Queue();
    let a = ["a", "b", "c"];
    queue.add(a);
    let res = queue.getFirst();
    expect(res).assertEqual(a);
  });
  
  /**
   * @tc.name: testGetFirst005
   * @tc.desc: Get the header element of the queue instance. For example: queue.getFirst().
   */
  it("testGetFirst005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let queue = new Queue();
    queue.add(6);
    queue.add("四");
    let res = queue.getFirst();
    expect(res).assertEqual(6);
  });
  
  /**
   * @tc.name: testPop006
   * @tc.desc: Delete the header element of a queue instance. For example: queue.pop().
   */
  it("testPop006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let queue = new Queue();
    queue.add(6);
    queue.add("四");
    let res = queue.pop();
    let res1 = queue.getFirst();
    expect(res).assertEqual(6);
    expect(res1).assertEqual("四");
  });
  
  /**
   * @tc.name: testForEach007
   * @tc.desc: Traversing elements in queue instances. For example: queue.forEach((item, index) => {arr.push(item);}).
   */
  it("testForEach007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let queue = new Queue();
    queue.add(8);
    queue.add("一");
    queue.add("二");
    queue.add(1);
    queue.add(2);
    queue.add(3);
    queue.add(4);
    queue.add(5);
    queue.add(6);
    let c = ["a", "b", "c", "d"];
    queue.add(c);
    let arr = [];
    queue.forEach((item, index) => {
      arr.push(item);
    });
    let a = [8, "一", "二", 1, 2, 3, 4, 5, 6, c];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
  
  /**
   * @tc.name: testIterator008
   * @tc.desc: Iterate over all elements in the queue instance. For example: for (let item of queue) { arr.push(item);}.
   */
  it("testIterator008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let queue = new Queue();
    queue.add(8);
    queue.add("一");
    queue.add("二");
    queue.add(5);
    queue.add(6);
    queue.add("三");
    queue.add("四");
    let arr = [];
    for (let item of queue) {
      arr.push(item);
    }
    let a = [8, "一", "二", 5, 6, "三", "四"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
  
  /**
   * @tc.name: testLength009
   * @tc.desc: Get the number of elements in the queue instance. For example: queue.length.
   */
  it("testLength009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let queue = new Queue();
    queue.add(8);
    queue.add("一");
    queue.add("二");
    queue.add(1);
    queue.add(2);
    queue.add(3);
    queue.add(4);
    queue.add(5);
    queue.add(6);
    let res = queue.length;
    expect(9).assertEqual(res);
  });

  /**
   * @tc.name: testAdd010
   * @tc.desc: Add element to Queue instance end. For example: queue.add("$").
   */
  it("testAdd010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let queue = new Queue();
    queue.add("$");
    let res = queue.getFirst();
    expect(res).assertEqual("$");
  });
  
  /**
   * @tc.name: testAdd011
   * @tc.desc: Add element to Queue instance end. For example: queue.add(" ").
   */
  it("testAdd011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let queue = new Queue();
    queue.add(" ");
    let res = queue.getFirst();
    expect(res).assertEqual(" ");
  });
  
  /**
   * @tc.name: testAdd012
   * @tc.desc: Add element to Queue instance end. For example: queue.add(null).
   */
  it("testAdd012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let queue = new Queue();
    queue.add(null);
    let res = queue.getFirst();
    expect(res).assertEqual(null);
  });
  
  /**
   * @tc.name: testAdd013
   * @tc.desc: Add element to Queue instance end. For example: queue.add(undefined).
   */
  it("testAdd013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let queue = new Queue();
    queue.add(undefined);
    let res = queue.getFirst();
    expect(res).assertEqual(undefined);
  });
  
  /**
   * @tc.name: testAdd014
   * @tc.desc: Add element to Queue instance end. For example: for (let i = 0; i < 100; i++) { queue.add(i);}.
   */
  it("testAdd014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let queue = new Queue();
    for (let i = 0; i < 100; i++) {
      queue.add(i);
    }
    let res = queue.length;
    expect(res).assertEqual(100);
  });
  
  /**
   * @tc.name: testGetFirst015
   * @tc.desc: Get the header element of the queue instance. For example: queue.getFirst().
   */
  it("testGetFirst015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let queue = new Queue();
    let res = queue.getFirst();
    expect(res).assertEqual(undefined);
  });
  
  /**
   * @tc.name: testPop016
   * @tc.desc: Delete the header element of a queue instance. For example: queue.pop().
   */
  it("testPop016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let queue = new Queue();
    let res = queue.pop();
    expect(res).assertEqual(undefined);
  });

  /**
   * @tc.name: testForEach017
   * @tc.desc: Traversing elements in queue instances. For example: queue.forEach((item, index) => {arr.push(item);}).
   */
  it("testForEach017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let queue = new Queue();
    let arr = [];
    queue.forEach((item, index) => {
      arr.push(item);
    });
    expect(arr.length).assertEqual(0);
  });
  
  /**
   * @tc.name: testIterator018
   * @tc.desc: Iterate over all elements in the queue instance. For example: for (let item of queue) { arr.push(item);}.
   */
  it("testIterator018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let queue = new Queue();
    let arr = [];
    for (let item of queue) {
      arr.push(item);
    }
    expect(arr.length).assertEqual(0);
  });
  
  /**
   * @tc.name: testIterator019
   * @tc.desc: Iterate over all elements in the queue instance. For example: queue[Symbol.iterator]().
   */
  it("testIterator019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let queue = new Queue();
    queue.add(8);
    queue.add("一");
    queue.add("二");
    queue.add(5);
    queue.add(6);
    queue.add("三");
    queue.add("四");
    let arr = [];
    let size = queue.length;
    let itr = queue[Symbol.iterator]();
    for (let i = 0; i < size; i++) {
      arr.push(itr.next().value);
    }
    let a = [8, "一", "二", 5, 6, "三", "四"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
   * @tc.name: testAdd020
   * @tc.desc: Add element to Queue instance end. For example: queue.add.bind({}, 10)().
   */
  it("testAdd020 ", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let queue = new Queue();
    try {
      queue.add.bind({}, 10)();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The add method cannot be bound`);
    }
  });
});
}
