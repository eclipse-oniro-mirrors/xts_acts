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
import LinkedList from "@ohos.util.LinkedList";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
export default function LinkedListTest() {
describe("LinkedListTest", function () {
      
  /**
   * @tc.name: testConstructor001
   * @tc.desc: Create an LinkedList instance. For example: let linkedList = new LinkedList().
   */
  it("testConstructor001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    try {
      let linkedList = new LinkedList();
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200012);
      expect(err.message).assertEqual("The LinkedList's constructor cannot be directly invoked");
    }
  });
  
  /**
   * @tc.name: testAdd002
   * @tc.desc: Add a element to the end of the LinkedList instance. For example: linkedList.add("四").
   */
  it("testAdd002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    linkedList.add("四");
    let res = linkedList.get(0);
    expect(res).assertEqual("四");
  });
  
  /**
   * @tc.name: testAdd003
   * @tc.desc: Add a element to the end of the LinkedList instance. For example: linkedList.add(8).
   */
  it("testAdd003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    linkedList.add(8);
    let res = linkedList.get(0);
    expect(res).assertEqual(8);
  });
    
  /**
   * @tc.name: testAdd004
   * @tc.desc: Add a element to the end of the LinkedList instance. 
   * For example: let a = [1, 2, 3, 4];linkedList.add(a).
   */
  it("testAdd004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    let a = [1, 2, 3, 4];
    linkedList.add(a);
    let res = linkedList.get(0);
    expect(res).assertEqual(a);
  });
    
  /**
   * @tc.name: testAdd005
   * @tc.desc: Add a element to the end of the LinkedList instance. 
   * For example: let a = {name: "lala", age: "13"};linkedList.add(a).
   */
  it("testAdd005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    let a = {name: "lala", age: "13"};
    linkedList.add(a);
    let res = linkedList.get(0);
    expect(res).assertEqual(a);
  });
    
  /**
   * @tc.name: testAdd006
   * @tc.desc: Add a element to the end of the LinkedList instance. For example: let a = ".";linkedList.add(a).
   */
  it("testAdd006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    let a = ".";
    linkedList.add(a);
    let res = linkedList.get(0);
    expect(res).assertEqual(a);
  });
    
  /**
   * @tc.name: testAdd007
   * @tc.desc: Add a element to the end of the LinkedList instance. For example: let a = "*";linkedList.add(a).
   */
  it("testAdd007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    let a = "*";
    linkedList.add(a);
    let res = linkedList.get(0);
    expect(res).assertEqual(a);
  });
    
  /**
   * @tc.name: testAdd008
   * @tc.desc: Add a element to the end of the LinkedList instance. For example: let a = "/";linkedList.add(a).
   */
  it("testAdd008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    let a = '/"';
    linkedList.add(a);
    let res = linkedList.get(0);
    expect(res).assertEqual(a);
  });
    
  /**
   * @tc.name: testAdd009
   * @tc.desc: Add a element to the end of the LinkedList instance. For example: let a = "";linkedList.add(a).
   */
  it("testAdd009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    let a = "";
    linkedList.add(a);
    let res = linkedList.get(0);
    expect(res).assertEqual(a);
  });
    
  /**
   * @tc.name: testAdd010
   * @tc.desc: Add a element to the end of the LinkedList instance. For example: let a = "a";linkedList.add(a).
   */
  it("testAdd010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    let a = "a";
    linkedList.add(a);
    linkedList.add(a);
    let res = linkedList.get(0);
    expect(res).assertEqual(a);
    let res1 = linkedList.get(1);
    expect(res1).assertEqual(a);
  });
    
  /**
   * @tc.name: testHas011
   * @tc.desc: Check whether the LinkedList contains a specified element. For example: linkedList.has("a").
   */
  it("testHas011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    let res = linkedList.has("a");
    expect(res).assertEqual(true);
    let res1 = linkedList.has("d");
    expect(res1).assertEqual(false);
  });
    
  /**
   * @tc.name: testClone012
   * @tc.desc: Clone an LinkedList instance. For example: linkedList.clone().
   */
  it("testClone012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    let linkedList1 = linkedList.clone();
    linkedList1.addFirst("e");
    let res = linkedList1.removeLast();
    expect(res).assertEqual("c");
    let arr = [];
    linkedList1.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["e", "a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
    
  /**
   * @tc.name: testAddFirst013
   * @tc.desc: Add element to LinkedList instance header. For example: linkedList.addFirst("e").
   */
  it("testAddFirst013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.addFirst("e");
    let res = linkedList.get(0);
    expect(res).assertEqual("e");
  });
    
  /**
   * @tc.name: testRemoveFirst014
   * @tc.desc: Delete the header element of a LinkedList instance. For example: linkedList.removeFirst().
   */
  it("testRemoveFirst014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    let res = linkedList.removeFirst();
    expect(res).assertEqual("a");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["b", "c"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
    
  /**
   * @tc.name: testGetLastIndexOf015
   * @tc.desc:  In the LinkedList instance, find the index of a specified element from brack to front, 
   * and return the index found for the first time. If not found, return -1.
   * For example: linkedList.getLastIndexOf("a").
   */
  it("testGetLastIndexOf015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("b");
    let res = linkedList.getLastIndexOf("a");
    expect(res).assertEqual(3);
  });
    
  /**
   * @tc.name: testGetLastIndexOf016
   * @tc.desc:  In the LinkedList instance, find the index of a specified element from brack to front, 
   * and return the index found for the first time. If not found, return -1. 
   * For example: linkedList.getLastIndexOf("f").
   */
  it("testGetLastIndexOf016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("b");
    let res = linkedList.getLastIndexOf("f");
    expect(res).assertEqual(-1);
  });
    
  /**
   * @tc.name: testGetIndexOf017
   * @tc.desc:  In the LinkedList instance, find the index of a specified element from front to back, 
   * and return the index found for the first time. If not found, return -1. 
   * For example: linkedList.getIndexOf("b").
   */
  it("testGetIndexOf017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("b");
    let res = linkedList.getIndexOf("b");
    expect(res).assertEqual(1);
  });
    
  /**
   * @tc.name: testGetIndexOf018
   * @tc.desc:  In the LinkedList instance, find the index of a specified element from front to back, 
   * and return the index found for the first time. If not found, return -1. 
   * For example: linkedList.getIndexOf("f").
   */
  it("testGetIndexOf018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("b");
    let res = linkedList.getIndexOf("f");
    expect(res).assertEqual(-1);
  });
    
  /**
   * @tc.name: testRemoveByIndex019
   * @tc.desc: In the linkedList instance, delete the element based on its index. 
   * For example: linkedList.removeByIndex(2).
   */
  it("testRemoveByIndex019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.removeByIndex(2);
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["a", "b", "a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
    
  /**
   * @tc.name: testRemoveByIndex020
   * @tc.desc: In the linkedList instance, delete the element based on its subscript index. 
   * For example: linkedList.removeByIndex(10).
   */
  it("testRemoveByIndex020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    try {
      let res = linkedList.removeByIndex(10);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200001);
      expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 10`);
    }
  });
    
  /**
   * @tc.name: testRemove021
   * @tc.desc: Delete the specified element. For example: linkedList.remove("a").
   */
  it("testRemove021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.remove("a");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["b", "c", "a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
    
  /**
   * @tc.name: testRemove022
   * @tc.desc: Delete the specified element. For example: linkedList.remove("d").
   */
  it("testRemove022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.remove("d");
    expect(res).assertEqual(false);
  });
    
  /**
   * @tc.name: testRemove023
   * @tc.desc: Delete the specified element. For example: linkedList.remove("d").
   */
  it("testRemove023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    let res = linkedList.remove("d");
    expect(res).assertEqual(false);
  });
    
  /**
   * @tc.name: testRemoveFirstFound024
   * @tc.desc: Delete the specified element found for the first time. For example: linkedList.removeFirstFound("b").
   */
  it("testRemoveFirstFound024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.removeFirstFound("b");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["a", "c", "a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
    
  /**
   * @tc.name: testRemoveLastFound025
   * @tc.desc: Delete the specified element found for the last time. For example: linkedList.removeLastFound("b").
   */
  it("testRemoveLastFound025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.removeLastFound("b");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["a", "b", "c", "a"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
    
  /**
   * @tc.name: testGetFirst026
   * @tc.desc: Get the header element of the linkedList instance. For example: linkedList.getFirst().
   */
  it("testGetFirst026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.getFirst();
    expect(res).assertEqual("a");
  });
    
  /**
   * @tc.name: testGetLast027
   * @tc.desc: Get the end element of the linkedList instance. For example: linkedList.getLast().
   */
  it("testGetLast027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.getLast();
    expect(res).assertEqual("b");
  });
    
  /**
   * @tc.name: testInsert028
   * @tc.desc: Insert an element into the middle of the LinkedList instance. For example: linkedList.insert(3, "d").
   */
  it("testInsert028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.insert(3, "d");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["a", "b", "c", "d", "a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
    
  /**
   * @tc.name: testInsert029
   * @tc.desc: Insert an element into the middle of the LinkedList instance. For example: linkedList.insert(0, "d").
   */
  it("testInsert029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.insert(0, "d");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["d", "a", "b", "c", "a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
    
  /**
   * @tc.name: testInsert030
   * @tc.desc: Insert an element into the middle of the LinkedList instance. For example: linkedList.insert(5, "d").
   */
  it("testInsert030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.insert(5, "d");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["a", "b", "c", "a", "b", "d"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
    
  /**
   * @tc.name: testInsert031
   * @tc.desc: Insert an element into the middle of the LinkedList instance. For example: linkedList.insert(9, "d").
   */
  it("testInsert031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    try {
      let res = linkedList.insert(8, "d");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200001);
      expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 5. Received value is: 8`);
    }
  });
    
  /**
   * @tc.name: testSet032
   * @tc.desc: Modify the element corresponding to the specified index. For example: linkedList.set(2, "d").
   */
  it("testSet032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    let res = linkedList.set(2, "d");
    let res1 = linkedList.get(2);
    expect(res1).assertEqual("d");
  });
    
  /**
   * @tc.name: testConvertToArray033
   * @tc.desc: Convert an LinkedList instance to an array. For example: linkedList.convertToArray().
   */
  it("testConvertToArray033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    linkedList.add(4);
    linkedList.add(3);
    linkedList.add(1);
    linkedList.add(2);
    linkedList.add(14);
    let res = linkedList.convertToArray();
    let a = [4, 3, 1, 2, 14];
    for (let i = 0; i < a.length; i++) {
      expect(res[i]).assertEqual(a[i]);
    }
  });
    
  /**
   * @tc.name: testLength034
   * @tc.desc: Get the number of elements in the LinkedList instance. For example: linkedList.length.
   */
  it("testLength034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    linkedList.add(4);
    linkedList.add(3);
    linkedList.add(1);
    linkedList.add(2);
    linkedList.add(14);
    let res = linkedList.length;
    expect(res).assertEqual(5);
  });
    
  /**
   * @tc.name: testClear035
   * @tc.desc: Clear all elements in the linkedList instance. For example: linkedList.clear().
   */
  it("testClear035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    linkedList.add(4);
    linkedList.add(3);
    linkedList.add(1);
    linkedList.add(2);
    linkedList.add(14);
    linkedList.clear();
    let res = linkedList.length;
    expect(res).assertEqual(0);
  });
    
  /**
   * @tc.name: testIterator036
   * @tc.desc: Iterates over all elements in an LinkedList instance. 
   * For example: for (let item of linkedList) {arr.push(item);}.
   */
  it("testIterator036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    linkedList.add(8);
    linkedList.add("一");
    linkedList.add("二");
    linkedList.add(5);
    let c = [1, 2, 3, 4];
    linkedList.add(c);
    linkedList.add(6);
    linkedList.add("三");
    linkedList.add("四");
    let arr = [];
    let a = [8, "一", "二", 5, c, 6, "三", "四"];
    for (let item of linkedList) {
      arr.push(item);
    }
    for (let index = 0; index < linkedList.length; index++) {
      expect(arr[index]).assertEqual(a[index]);
    }
  });
    
  /**
   * @tc.name: testForEach037
   * @tc.desc: Traversing elements in an LinkedList instance. 
   * For example: linkedList.forEach((item, index) => {arr.push(item);}).
   */
  it("testForEach037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    linkedList.add(8);
    linkedList.add("一");
    linkedList.add("二");
    linkedList.add(5);
    let c = [1, 2, 3, 4];
    linkedList.add(c);
    linkedList.add(6);
    linkedList.add("三");
    linkedList.add("四");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = [8, "一", "二", 5, c, 6, "三", "四"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
 
  /**
   * @tc.name: testRemoveLast038
   * @tc.desc: Delete the end element of a LinkedList instance. linkedList.removeLast().
   */
  it("testRemoveLast038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.addFirst("e");
    let res = linkedList.removeLast();
    expect(res).assertEqual("c");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["e", "a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
    
  /**
   * @tc.name: testGet039
   * @tc.desc: Gets the element corresponding to the specified index. For example: linkedList.get(1).
   */
  it("testGet039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.get(1);
    expect(res).assertEqual("b");
  });
    
  /**
   * @tc.name: testGet040
   * @tc.desc: Gets the element corresponding to the specified index. For example: linkedList.get(10).
   */
  it("testGet040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.get(10);
    expect(res).assertEqual(undefined);
  });
    
  /**
   * @tc.name: testListGet041
   * @tc.desc: Gets the element corresponding to the specified index. For example: linkedList[1].
   */
  it("testListGet041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList[1];
    linkedList.forEach((item, index) => {
      console.log(item);
    });
    expect(res).assertEqual("b");
  });
    
  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_LINKEDLIST_01000
   * @tc.name: testGet042
   * @tc.desc: Gets the element corresponding to the specified index. For example: list.get(1).
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testGet042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    linkedList.add(0);
    linkedList.add(1);
    linkedList.add(2);
    let s = Math.trunc(1.33);
    let res = linkedList.get(s);
    expect(res).assertEqual(1);
  });
    
  /**
   * @tc.name: testListSet042
   * @tc.desc: Modify the element corresponding to the specified index. For example: linkedList[1] = "f".
   */
  it("testListSet042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    linkedList[1] = "f";
    let res = linkedList[1];
    linkedList.forEach((item, index) => {
      console.log(item);
    });
    expect(res).assertEqual("f");
  });
    
  /**
   * @tc.name: testAdd043
   * @tc.desc: Add a element to the end of the LinkedList instance. 
   * For example: for (let i = 0; i < 100; i++) {linkedList.add(i);}.
   */
  it("testAdd043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    for (let i = 0; i < 100; i++) {
      linkedList.add(i);
    }
    let res = linkedList.get(99);
    expect(res).assertEqual(99);
  });
    
  /**
   * @tc.name: testRemoveByIndex044
   * @tc.desc: In the linkedList instance, delete the element based on its subscript index. 
   * For example: linkedList.removeByIndex(1).
   */
  it("testRemoveByIndex044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    try {
      let res = linkedList.removeByIndex(1);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200001);
      expect(err.message).assertEqual("Container is empty");
    }
  });
    
  /**
   * @tc.name: testClone045
   * @tc.desc: Clone an LinkedList instance. For example: linkedList.clone().
   */
  it("testClone045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    let newlinkedList = linkedList.clone();
    let res = true
    for (let i = 0; i < linkedList.length; i++) {
      if (linkedList[i] !== newlinkedList[i]) {
        res = false
      }
    }
    expect(res).assertEqual(true);
  });
    
  /**
   * @tc.name: testGetIndexOf046
   * @tc.desc:  In the LinkedList instance, find the index of a specified element from front to back, 
   * and return the index found for the first time. If not found, return -1. For example: linkedList.getIndexOf(1).
   */
  it("testGetIndexOf046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    let res = linkedList.getIndexOf(1);
    expect(res).assertEqual(-1);
  });
    
  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_LINKEDLIST_01005
   * @tc.name: testRemoveByIndex045
   * @tc.desc:   In the LinkedList instance, find the index of a specified element from front to back,
   * and return the index found for the first time. If not found, return -1. For example: linkedList.getIndexOf(1).
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testRemoveByIndex045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    linkedList.add(0)
    linkedList.add(1)
    let s = Math.trunc(1.33);
    linkedList.removeByIndex(s);
    expect(linkedList.has(1)).assertEqual(false);
  });
    
  /**
   * @tc.name: testForEach047
   * @tc.desc: Traversing elements in an LinkedList instance. 
   * For example: linkedList.forEach((item, index) => { num++; }).
   */
  it("testForEach047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    let num = 0;
    linkedList.forEach((item, index) => {
      num++;
    });
    expect(num).assertEqual(0);
  });
    
  /**
   * @tc.name: testHas048
   * @tc.desc: Check whether the LinkedList contains a specified element. For example: linkedList.has(1).
   */
  it("testHas048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    let res = linkedList.has(1);
    expect(res).assertEqual(false);
  });
    
  /**
   * @tc.name: testGet050
   * @tc.desc: Gets the element corresponding to the specified index. For example: linkedList.get(1).
   */
  it("testGet050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    let res = linkedList.get(1);
    expect(res).assertEqual(undefined);
  });
    
  /**
   * @tc.name: testClear051
   * @tc.desc: Clear all elements in the LinkedList instance. For example: linkedList.clear().
   */
  it("testClear051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    linkedList.clear();
    const len = linkedList.length;
    expect(len).assertEqual(0);
  });
    
  /**
   * @tc.name: testGetLast052
   * @tc.desc: Get the end element of the linkedList instance. For example: linkedList.getLast().
   */
  it("testGetLast052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    let res = linkedList.getLast();
    expect(res).assertEqual(undefined);
  });
    
  /**
   * @tc.name: testGetFirst053
   * @tc.desc: Get the header element of the linkedList instance. For example: linkedList.getFirst().
   */
  it("testGetFirst053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    let res = linkedList.getFirst();
    expect(res).assertEqual(undefined);
  });
    
  /**
   * @tc.name: testAdd054
   * @tc.desc: Add a element to the end of the LinkedList instance. For example: linkedList.add(null).
   */
  it("testAdd054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    linkedList.add(null);
    let res = linkedList.get(0);
    expect(res).assertEqual(null);
  });
    
  /**
   * @tc.name: testAdd055
   * @tc.desc: Add a element to the end of the LinkedList instance. For example: linkedList.add(0.1).
   */
  it("testAdd055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    linkedList.add(0.1);
    let res = linkedList.get(0);
    expect(res).assertEqual(0.1);
  });
    
  /**
   * @tc.name: testAdd056
   * @tc.desc: Add a element to the end of the LinkedList instance. For example: linkedList.add(-1).
   */
  it("testAdd056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    linkedList.add(-1);
    let res = linkedList.get(0);
    expect(res).assertEqual(-1);
  });
    
  /**
   * @tc.name: testAdd057
   * @tc.desc: Add a element to the end of the LinkedList instance. For example: const obj = {}; linkedList.add(obj).
   */
  it("testAdd057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    const obj = {};
    linkedList.add(obj);
    let res = linkedList.get(0);
    expect(res).assertEqual(obj);
  });
    
  /**
   * @tc.name: testIterator058
   * @tc.desc: Iterates over all elements in an LinkedList instance. For example: linkedList[Symbol.iterator]().
   */
  it("testIterator058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.addFirst("e");
    let res = linkedList.removeLast();
    expect(res).assertEqual("c");
    let arr = [];
    let itr = linkedList[Symbol.iterator]();
    let tmp = undefined;
    do {
      tmp = itr.next().value;
      arr.push(tmp);
    } while (tmp != undefined);
    let a = ["e", "a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
   * @tc.name: testAdd057
   * @tc.desc: Add a element to the end of the LinkedList instance. For example: linkedList.add.bind({}, obj)().
   */
  it("testAdd059 ", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    try {
      linkedList.add.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The add method cannot be bound`);
    }
  });

  /**
   * @tc.name: testInsert058
   * @tc.desc: Insert an element into the middle of the LinkedList instance. For example: linkedList.insert("a", "d").
   */
  it("testInsert058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    try {
      linkedList.insert("a", "d");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "index" must be small integer. Received value is: a`);
    }
  });
    
  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_LINKEDLIST_01002
   * @tc.name: testInsert059
   * @tc.desc: Insert an element into the middle of the LinkedList instance. For example: linkedList.insert("a", "d").
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testInsert059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    linkedList.add(0);
    linkedList.add(1);
    linkedList.add(2);
    let s = Math.trunc(1.33);
    linkedList.insert(s, 3);
    expect(linkedList.get(1)).assertEqual(3);
  });
    
  /**
   * @tc.name: testGet059
   * @tc.desc: Gets the element corresponding to the specified index. For example: linkedList.get("a").
   */
  it("testGet059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    try {
      linkedList.get("a");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "index" must be small integer. Received value is: a`);
    }
  });

  /**
   * @tc.name: testRemoveFirst060
   * @tc.desc: Delete the header element of a LinkedList instance. For example: linkedList.removeFirst().
   */
  it("testRemoveFirst060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    try {
      linkedList.removeFirst();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200010);
      expect(err.message).assertEqual(`Container is empty`);
    }
  });

  /**
   * @tc.name: testRemoveLast061
   * @tc.desc: Delete the end element of a LinkedList instance. linkedList.removeLast().
   */
  it("testRemoveLast061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    try {
      linkedList.removeLast();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200010);
      expect(err.message).assertEqual(`Container is empty`);
    }
  });

  /**
   * @tc.name: testRemoveByIndex062
   * @tc.desc: In the linkedList instance, delete the element based on its subscript index. 
   * For example: linkedList.removeByIndex("a").
   */
  it("testRemoveByIndex062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    try {
      linkedList.removeByIndex("a");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "index" must be small integer. Received value is: a`);
    }
  });

  /**
   * @tc.name: testRemoveFirstFound063
   * @tc.desc: Delete the specified element found for the first time. For example: linkedList.removeFirstFound("b").
   */
  it("testRemoveFirstFound063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    try {
      linkedList.removeFirstFound("b");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200010);
      expect(err.message).assertEqual(`Container is empty`);
    }
  });

  /**
   * @tc.name: testSet064
   * @tc.desc: Modify the element corresponding to the specified index. For example: linkedList.set(6, "d").
   */
  it("testSet064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    try {
      linkedList.set(6, "d");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200001);
      expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 3. Received value is: 6`);
    }
  });

  /**
   * @tc.name: testSet065
   * @tc.desc: Modify the element corresponding to the specified index. For example: linkedList.set("a", "d").
   */
  it("testSet065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    try {
      linkedList.set("a", "d");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "index" must be small integer. Received value is: a`);
    }
  });
});
}
