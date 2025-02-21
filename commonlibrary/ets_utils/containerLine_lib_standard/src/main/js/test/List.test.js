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
import List from "@ohos.util.List";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
export default function ListTest() {
describe("ListTest", function () {

  /**
   * @tc.name: testConstructor001
   * @tc.desc: Create an List instance. For example: let list = new List().
   */
  it("testConstructor001", 0, function () {
    try {
      let list = new List();
      expect(list != undefined).assertEqual(true);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200012);
      expect(err.message).assertEqual("The List's constructor cannot be directly invoked");
    }
  });
  
  /**
   * @tc.name: testGet002
   * @tc.desc: Gets the element corresponding to the specified index. For example: list.get(0).
   */
  it("testGet002", 0, function () {
    let list = new List();
    list.add("四");
    let res = list.get(0);
    expect(res).assertEqual("四");
  });
    
  /**
   * @tc.name: testAdd003
   * @tc.desc: Add a element to the end of the List instance. For example: list.add(8).
   */
  it("testAdd003", 0, function () {
    let list = new List();
    list.add(8);
    let res = list.get(0);
    expect(res).assertEqual(8);
  });
    
  /**
   * @tc.name: testAdd004
   * @tc.desc: Add a element to the end of the List instance. 
   * For example: let a = [1, 2, 3, 4]; list.add(a).
   */
  it("testAdd004", 0, function () {
    let list = new List();
    let a = [1, 2, 3, 4];
    list.add(a);
    let res = list.get(0);
    expect(res).assertEqual(a);
  });
    
  /**
   * @tc.name: testAdd005
   * @tc.desc: Add a element to the end of the List instance. 
   * For example: let a = {name: "lala", age: "13"}; list.add(a).
   */
  it("testAdd005", 0, function () {
    let list = new List();
    let a = {name: "lala", age: "13"};
    list.add(a);
    let res = list.get(0);
    expect(res).assertEqual(a);
  });
    
  /**
   * @tc.name: testHas006
   * @tc.desc: Check whether the List contains a specified element. For example: list.has("a").
   */
  it("testHas006", 0, function () {
    let list = new List();
    list.add("a");
    list.add("b");
    list.add("c");
    let res = list.has("a");
    expect(res).assertEqual(true);
  });
    
  /**
   * @tc.name: testHas007
   * @tc.desc: Check whether the List contains a specified element. For example: list.has("d").
   */
  it("testHas007", 0, function () {
    let list = new List();
    list.add("a");
    list.add("b");
    list.add("c");
    let res = list.has("d");
    expect(res).assertEqual(false);
  });
    
  /**
   * @tc.name: testEqual008
   * @tc.desc: Judge whether two List instances are equal. For example: let res = list.equal(list1).
   */
  it("testEqual008", 0, function () {
    let list = new List();
    let list1 = new List();
    list.add("a");
    list.add("b");
    list.add("c");
    list1.add("a");
    list1.add("b");
    list1.add("d");
    let res = list.equal(list1);
    expect(res).assertEqual(false);
  });
    
  /**
   * @tc.name: testEqual009
   * @tc.desc: Judge whether two List instances are equal. For example: let res = list.equal(list1).
   */
  it("testEqual009", 0, function () {
    let list = new List();
    let list1 = new List();
    list.add("a");
    list.add("b");
    list.add("c");
    list1.add("a");
    list1.add("b");
    list1.add("c");
    let res = list.equal(list1);
    expect(res).assertEqual(true);
  });
    
  /**
   * @tc.name: testEqual010
   * @tc.desc: Judge whether two List instances are equal. For example: let res = list.equal(list1).
   */
  it("testEqual010", 0, function () {
    let list = new List();
    let list1 = new List();
    list.add("a");
    list.add("b");
    list.add("c");
    list1.add("a");
    list1.add("b");
    let res = list.equal(list1);
    expect(res).assertEqual(false);
  });
    
  /**
   * @tc.name: testGet011
   * @tc.desc: Gets the element corresponding to the specified index. For example: list.get(2).
   */
  it("testGet010", 0, function () {
    let list = new List();
    list.add("a");
    list.add("b");
    list.add("c");
    list.add("a");
    list.add("b");
    list.add("b");
    let res = list.get(2);
    expect(res).assertEqual("c");
  });
    
  /**
   * @tc.name: testGetLastIndexOf012
   * @tc.desc:  In the List instance, find the index of a specified element from brack to front, 
   * and return the index found for the first time. If not found, return -1. For example: list.getLastIndexOf("a").
   */
  it("testGetLastIndexOf012", 0, function () {
    let list = new List();
    list.add("a");
    list.add("b");
    list.add("c");
    list.add("a");
    list.add("b");
    list.add("b");
    let res = list.getLastIndexOf("a");
    expect(res).assertEqual(3);
  });
    
  /**
   * @tc.name: testGetIndexOf013
   * @tc.desc:  In the List instance, find the index of a specified element from front to back, 
   * and return the index found for the first time. If not found, return -1. For example: list.getIndexOf("b").
   */
  it("testGetIndexOf013", 0, function () {
    let list = new List();
    list.add("a");
    list.add("b");
    list.add("c");
    list.add("a");
    list.add("b");
    list.add("b");
    let res = list.getIndexOf("b");
    expect(res).assertEqual(1);
  });
    
  /**
   * @tc.name: testRemoveByIndex014
   * @tc.desc: In the List instance, delete the element based on its index. For example: list.removeByIndex(2).
   */
  it("testRemoveByIndex014", 0, function () {
    let list = new List();
    list.add("a");
    list.add("b");
    list.add("c");
    list.add("a");
    list.add("b");
    let res = list.removeByIndex(2);
    let arr = [];
    list.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["a", "b", "a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
    
  /**
   * @tc.name: testRemove015
   * @tc.desc: Delete the specified element. For example: list.remove("a").
   */
  it("testRemove015", 0, function () {
    let list = new List();
    list.add("a");
    list.add("b");
    list.add("c");
    list.add("a");
    list.add("b");
    let res = list.remove("a");
    let arr = [];
    list.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["b", "c", "a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
    
  /**
   * @tc.name: testReplaceAllElements016
   * @tc.desc: Perform some operation on the elements in the List instance and return the List instance 
   * after the operation. For example: list.replaceAllElements((item, index) => {return (item = 2 * item);}).
   */
  it("testReplaceAllElements016", 0, function () {
    let list = new List();
    list.add(1);
    list.add(2);
    list.add(4);
    list.add(5);
    list.replaceAllElements((item, index) => {
      return (item = 2 * item);
    });
    let arr = [];
    list.forEach((item, index) => {
      arr.push(item);
    });
    let a = [2, 4, 8, 10];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
    
  /**
   * @tc.name: testGetFirst017
   * @tc.desc: Get the header element of the List instance. For example: list.getFirst().
   */
  it("testGetFirst017", 0, function () {
    let list = new List();
    list.add("a");
    list.add("b");
    list.add("c");
    list.add("a");
    list.add("b");
    let res = list.getFirst();
    expect(res).assertEqual("a");
  });
    
  /**
   * @tc.name: testGetLast018
   * @tc.desc: Get the end element of the List instance. For example: list.getLast().
   */
  it("testGetLast018", 0, function () {
    let list = new List();
    list.add("a");
    list.add("b");
    list.add("c");
    list.add("a");
    list.add("b");
    let res = list.getLast();
    expect(res).assertEqual("b");
  });
    
  /**
   * @tc.name: testInsert019
   * @tc.desc: Insert an element into the middle of the List instance. For example: list.insert("d", 3).
   */
  it("testInsert019", 0, function () {
    let list = new List();
    list.add("a");
    list.add("b");
    list.add("c");
    list.add("a");
    list.add("b");
    let res = list.insert("d", 3);
    let arr = [];
    list.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["a", "b", "c", "d", "a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
    
  /**
   * @tc.name: testSet020
   * @tc.desc: Modify the element corresponding to the specified index. For example: list.set(2, "d").
   */
  it("testSet020", 0, function () {
    let list = new List();
    list.add("a");
    list.add("b");
    list.add("c");
    list.add("a");
    let res = list.set(2, "d");
    let res1 = list.get(2);
    expect(res1).assertEqual("d");
  });
    
  /**
   * @tc.name: testSort021
   * @tc.desc: Arrange the elements in the List instance in descending order. For example: list.sort((a, b) => a - b).
   */
  it("testSort021", 0, function () {
    let list = new List();
    list.add(4);
    list.add(3);
    list.add(1);
    list.add(2);
    list.add(14);
    list.sort((a, b) => a - b);
    let arr = [];
    list.forEach((item, index) => {
      arr.push(item);
    });
    let a = [1, 2, 3, 4, 14];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
    
  /**
   * @tc.name: testGetSubList022
   * @tc.desc: Intercepts an element within the specified range, including the element with the 
   * starting index but not the element with the ending index. For example: list.getSubList(2, 4).
   */
  it("testGetSubList022", 0, function () {
    let list = new List();
    list.add(4);
    list.add(3);
    list.add(1);
    list.add(2);
    list.add(14);
    let res = list.getSubList(2, 4);
    let arr = [];
    res.forEach((item, index) => {
      arr.push(item);
    });
    let a = [1, 2];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
    
  /**
   * @tc.name: testConvertToArray023
   * @tc.desc: Convert an List instance to an array. For example: list.convertToArray().
   */
  it("testConvertToArray023", 0, function () {
    let list = new List();
    list.add(4);
    list.add(3);
    list.add(1);
    list.add(2);
    list.add(14);
    let res = list.convertToArray();

    let a = [4, 3, 1, 2, 14];
    for (let i = 0; i < a.length; i++) {
      expect(res[i]).assertEqual(a[i]);
    }
  });
    
  /**
   * @tc.name: testLength024
   * @tc.desc: Get the number of elements contained in the List instance. For example: list.length.
   */
  it("testLength024", 0, function () {
    let list = new List();
    list.add(4);
    list.add(3);
    list.add(1);
    list.add(2);
    list.add(14);
    let res = list.length;
    expect(res).assertEqual(5);
  });
    
  /**
   * @tc.name: testIterator025
   * @tc.desc: Iterates over all elements in an List instance. For example: for (let item of list) {arr.push(item);}.
   */
  it("testIterator025", 0, function () {
    let list = new List();
    list.add(8);
    list.add("一");
    list.add("二");
    list.add(5);
    let c = [1, 2, 3, 4];
    list.add(c);
    list.add(6);
    list.add("三");
    list.add("四");
    let arr = [];
    for (let item of list) {
      arr.push(item);
    }
    let a = [8, "一", "二", 5, c, 6, "三", "四"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
    
  /**
   * @tc.name: testForEach026
   * @tc.desc: Traversing elements in an List instance. For example: list.forEach((item, index) => {arr.push(item);}).
   */
  it("testForEach026", 0, function () {
    let list = new List();
    list.add(8);
    list.add("一");
    list.add("二");
    list.add(5);
    let c = [1, 2, 3, 4];
    list.add(c);
    list.add(6);
    list.add("三");
    list.add("四");
    let arr = [];
    list.forEach((item, index) => {
      arr.push(item);
    });
    let a = [8, "一", "二", 5, c, 6, "三", "四"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
    
  /**
   * @tc.name: testIsEmpty027
   * @tc.desc: Determine whether the List instance is empty. For example: list.isEmpty().
   */
  it("testIsEmpty027", 0, function () {
    let list = new List();
    list.add(8);
    list.add("一");
    list.add("二");
    list.add(5);
    let c = [1, 2, 3, 4];
    list.add(c);
    list.add(6);
    list.add("三");
    list.add("四");
    let res = list.isEmpty();
    expect(res).assertEqual(false);
  });
    
  /**
   * @tc.name: testClear028
   * @tc.desc: Clear all elements in the List instance. For example: list.clear().
   */
  it("testClear028", 0, function () {
    let list = new List();
    list.add("a");
    list.add("b");
    list.add("c");
    list.add("a");
    list.clear();
    let res = list.length;
    expect(res).assertEqual(0);
  });
    
  /**
   * @tc.name: testGet029
   * @tc.desc: Gets the element corresponding to the specified index. For example: list.get(6).
   */
  it("testGet029", 0, function () {
    let list = new List();
    list.add("a");
    list.add("b");
    list.add("c");
    list.add("a");
    list.add("b");
    list.add("b");
    let res = list.get(6);
    expect(res).assertEqual(undefined);
  });
    
  /**
   * @tc.name: testGetLastIndexOf030
   * @tc.desc:  In the List instance, find the index of a specified element from brack to front, 
   * and return the index found for the first time. If not found, return -1. For example: list.getLastIndexOf("F").
   */
  it("testGetLastIndexOf030", 0, function () {
    let list = new List();
    list.add("a");
    list.add("b");
    list.add("c");
    list.add("a");
    list.add("b");
    list.add("b");
    let res = list.getLastIndexOf("F");
    expect(res).assertEqual(-1);
  });
    
  /**
   * @tc.name: testRemoveByIndex031
   * @tc.desc: In the List instance, delete the element based on its index. For example: list.removeByIndex(5).
   */
  it("testRemoveByIndex031", 0, function () {
    let list = new List();
    list.add("a");
    list.add("b");
    list.add("c");
    list.add("a");
    list.add("b");
    try {
      let res = list.removeByIndex(5);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200001);
      expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 5`);
    }
  });
    
  /**
   * @tc.name: testRemove032
   * @tc.desc: Delete the specified element. For example: list.remove().
   */
  it("testRemove032", 0, function () {
    let list = new List();
    list.add();
    let res = list.remove();
    expect(res).assertEqual(true);
  });
    
  /**
   * @tc.name: testInsert033
   * @tc.desc: Insert an element into the middle of the List instance. For example: list.insert("d", 8).
   */
  it("testInsert033", 0, function () {
    let list = new List();
    list.add("a");
    list.add("b");
    list.add("c");
    list.add("a");
    list.add("b");
    try {
      let res = list.insert("d", 8);
      expect(true).assertEqual(false);
    } catch(err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200001);
      expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 5. Received value is: 8`);
    }
  });
    
  /**
   * @tc.name: testSort034
   * @tc.desc: Arrange the elements in the List instance in descending order. For example: list.sort((a, b) => a - b).
   */
  it("testSort034", 0, function () {
    let list = new List();
    list.add(";");
    list.add("一");
    list.add("a");
    list.add("1");
    list.add("2");
    list.add("14");
    list.sort((a, b) => a - b);
    let arr = [];
    list.forEach((item, index) => {
      arr.push(item);
    });
    let a = [";", "一", "a", "1", "2", "14"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
    
  /**
   * @tc.name: testGetSubList035
   * @tc.desc: Intercepts an element within the specified range, including the element with the 
   * starting index but not the element with the ending index. For example: list.getSubList(2, 8).
   */
  it("testGetSubList035", 0, function () {
    let list = new List();
    list.add("4");
    list.add("3");
    list.add("1");
    list.add("2");
    list.add("14");
    try {
      list.getSubList(2, 8);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200001);
      expect(err.message).assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 5. Received value is: 8`);
    }
  });
    
  /**
   * @tc.name: testGetSubList036
   * @tc.desc: Intercepts an element within the specified range, including the element with the 
   * starting index but not the element with the ending index. For example: list.getSubList(6, 8).
   */
  it("testGetSubList036", 0, function () {
    let list = new List();
    list.add("4");
    list.add("3");
    list.add("1");
    list.add("2");
    list.add("14");
    try {
      let res = list.getSubList(6, 8);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200001);
      expect(err.message).assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 4. Received value is: 6`);
    }
  });
    
  /**
   * @tc.name: testGetSubList037
   * @tc.desc: Intercepts an element within the specified range, including the element with the 
   * starting index but not the element with the ending index. For example: list.getSubList(6, 2).
   */
  it("testGetSubList037", 0, function () {
    let list = new List();
    list.add("4");
    list.add("3");
    list.add("1");
    list.add("2");
    list.add("14");
    try {
      let res = list.getSubList(6, 2);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200001);
      expect(err.message).assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 1. Received value is: 6`);
    }
  });
    
  /**
   * @tc.name: testAdd038
   * @tc.desc: Add a element to the end of the List instance. For example: list.add("*").
   */
  it("testAdd038", 0, function () {
    let list = new List();
    list.add(".");
    list.add("*");
    list.add("|");
    let res = list.get(0);
    expect(res).assertEqual(".");
  });
    
  /**
   * @tc.name: testAdd039
   * @tc.desc: Add a element to the end of the List instance. For example: list.add("*").
   */
  it("testAdd039", 0, function () {
    let list = new List();
    list.add(".");
    list.add("*");
    list.add("|");
    let arr = [];
    list.forEach((item, index) => {
      arr.push(item);
    });
    let a = [".", "*", "|"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
    
  /**
   * @tc.name: testAdd040
   * @tc.desc: Add a element to the end of the List instance. For example: list.add(" ").
   */
  it("testAdd040", 0, function () {
    let list = new List();
    list.add(" ");
    let res = list.get(0);
    expect(res).assertEqual(" ");
  });
    
  /**
   * @tc.name: testAdd041
   * @tc.desc: Add a element to the end of the List instance. For example: list.add("a").
   */
  it("testAdd041", 0, function () {
    let list = new List();
    list.add("a");
    list.add("a");
    let res = list.get(0);
    let res1 = list.get(1);
    expect(res).assertEqual("a");
    expect(res1).assertEqual("a");
  });
    
  /**
   * @tc.name: testListGet042
   * @tc.desc: Gets the element corresponding to the specified index. For example: list[0].
   */
  it("testListGet042", 0, function () {
    let list = new List();
    list.add("a");
    list.add("b");
    let res = list[0];
    expect(res).assertEqual("a");
  });
    
  /**
   * @tc.name: testListSet043
   * @tc.desc: Modify the element corresponding to the specified index. For example: list[1] = "c".
   */
  it("testListSet043", 0, function () {
    let list = new List();
    list.add("a");
    list.add("b");
    list[0] = "c";
    let res = list[0];
    expect(res).assertEqual("c");
    list.forEach((item, index) => {
      console.log(item);
    });
  });
    
  /**
   * @tc.name: testAdd044
   * @tc.desc: Add a element to the end of the List instance. For example: for (let i = 0; i < 100; i++) {list.add(i);}.
   */
  it("testAdd044", 0, function () {
    let list = new List();
    for (let i = 0; i < 100; i++) {
      list.add(i);
    }
    let res = list.get(99);
    let res1 = list.length;
    expect(res).assertEqual(99);
    expect(res1).assertEqual(100);
  });
    
  /**
   * @tc.name: testAdd045
   * @tc.desc: Add a element to the end of the List instance. For example: list.add(null).
   */
  it("testAdd045", 0, function () {
    let list = new List();
    list.add(null);
    let res = list.get(0);
    expect(res).assertEqual(null);
  });
    
  /**
   * @tc.name: testAdd046
   * @tc.desc: Add a element to the end of the List instance. For example: list.add(0.1111).
   */
  it("testAdd046", 0, function () {
    let list = new List();
    list.add(0.1111);
    let res = list.get(0);
    expect(res).assertEqual(0.1111);
  });
    
  /**
   * @tc.name: testAdd047
   * @tc.desc: Add a element to the end of the List instance. For example: list.add(-1).
   */
  it("testAdd047", 0, function () {
    let list = new List();
    list.add(-1);
    let res = list.get(0);
    expect(res).assertEqual(-1);
  });
    
  /**
   * @tc.name: testAdd048
   * @tc.desc: Add a element to the end of the List instance. For example: const obj = {}; list.add(obj).
   */
  it("testAdd048", 0, function () {
    let list = new List();
    const obj = {};
    list.add(obj);
    let res = list.get(0);
    expect(res).assertEqual(obj);
  });
    
  /**
   * @tc.name: testSort049
   * @tc.desc: Arrange the elements in the List instance in descending order. For example: list.sort((a, b) => a - b).
   */
  it("testSort049", 0, function () {
    let list = new List();
    list.sort((a, b) => a - b);
    let res1 = list.length;
    expect(res1).assertEqual(0);
  });
    
  /**
   * @tc.name: testRemoveByIndex050
   * @tc.desc: In the List instance, delete the element based on its index. For example: list.removeByIndex(1).
   */
  it("testRemoveByIndex050", 0, function () {
    let list = new List();
    try {
      let res = list.removeByIndex(1);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200001);
      expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 0. Received value is: 1`);
    }
  });
    
  /**
   * @tc.name: testEqual051
   * @tc.desc: Judge whether two List instances are equal. For example: let res = list.equal(list1).
   */
  it("testEqual051", 0, function () {
    let list = new List();
    let list1 = new List();
    let res = list.equal(list1);
    expect(res).assertEqual(true);
  });
    
  /**
   * @tc.name: testGetIndexOf052
   * @tc.desc:  In the List instance, find the index of a specified element from front to back, 
   * and return the index found for the first time. If not found, return -1. For example: list.getIndexOf("b").
   */
  it("testGetIndexOf052", 0, function () {
    let list = new List();
    let res = list.getIndexOf(1);
    expect(res).assertEqual(-1);
  });
    
  /**
   * @tc.name: testForEach053
   * @tc.desc: Traversing elements in an List instance. For example: list.forEach((item, index) => {num++;}).
   */
  it("testForEach053", 0, function () {
    let list = new List();
    let num = 0;
    list.forEach((item, index) => {
      num++;
    });
    expect(num).assertEqual(0);
  });
    
  /**
   * @tc.name: testIsEmpty054
   * @tc.desc: Determine whether the List instance is empty. For example: list.isEmpty().
   */
  it("testIsEmpty054", 0, function () {
    let list = new List();
    let res = list.isEmpty();
    expect(res).assertEqual(true);
  });
    
  /**
   * @tc.name: testHas055
   * @tc.desc: Check whether the List contains a specified element. For example: list.has(1).
   */
  it("testHas055", 0, function () {
    let list = new List();
    let res = list.has(1);
    expect(res).assertEqual(false);
  });
    
  /**
   * @tc.name: testGet056
   * @tc.desc: Gets the element corresponding to the specified index. For example: list.get(1).
   */
  it("testGet056", 0, function () {
    let list = new List();
    let res = list.get(1);
    expect(res).assertEqual(undefined);
  });
    
  /**
   * @tc.name: testClear057
   * @tc.desc: Clear all elements in the List instance. For example: list.clear().
   */
  it("testClear057", 0, function () {
    let list = new List();
    list.clear();
    let res1 = list.length;
    expect(res1).assertEqual(0);
  });
    
  /**
   * @tc.name: testGetLast058
   * @tc.desc: Get the end element of the List instance. For example: list.getLast().
   */
  it("testGetLast058", 0, function () {
    let list = new List();
    let res = list.getLast();
    expect(res).assertEqual(undefined);
  });
    
  /**
   * @tc.name: testReplaceAllElements059"
   * @tc.desc: Perform some operation on the elements in the List instance and return the List instance 
   * after the operation. For example: list.replaceAllElements((item, index) => {num++;}).
   */
  it("testReplaceAllElements059", 0, function () {
    let list = new List();
    let num = 0;
    list.replaceAllElements((item, index) => {
      num++;
    });
    expect(num).assertEqual(0);
  });
    
  /**
   * @tc.name: testConvertToArray060
   * @tc.desc: Convert an List instance to an array. For example: list.convertToArray().
   */
  it("testConvertToArray060", 0, function () {
    let list = new List();
    const res = list.convertToArray();
    expect(res.length).assertEqual(0);
  });
    
  /**
   * @tc.name: testConvertToArray061
   * @tc.desc: Convert an List instance to an array. For example: list.convertToArray().
   */
  it("testConvertToArray061", 0, function () {
    let list = new List();
    const res = list.convertToArray();
    expect(res.length).assertEqual(0);
  });
    
  /**
   * @tc.name: testlterator062
   * @tc.desc: Iterates over all elements in an List instance. For example: for (const iterator of list) { num++;}.
   */
  it("testlterator062", 0, function () {
    let list = new List();
    for (let index = 0; index < 10; index++) {
      list.add(index);
    }
    let num = 0;
    for (const iterator of list) {
      expect(iterator).assertEqual(num);
      num++;
    }
  });
    
  /**
   * @tc.name: testlterator063
   * @tc.desc: Get the header element of the List instance. For example: list.getFirst().
   */
  it("testGetFirst063", 0, function () {
    let list = new List();
    let res = list.getFirst();
    expect(res).assertEqual(undefined);
  });
    
  /**
   * @tc.name: testIterator064
   * @tc.desc: Iterates over all elements in an List instance. For example: List[Symbol.iterator]().
   */
  it("testIterator064", 0, function () {
    let list = new List();
    list.add("a");
    list.add("b");
    list.add("c");
    list.add("a");
    list.add("b");
    list.removeByIndex(2);
    let arr = [];
    let itr = list[Symbol.iterator]();
    let tmp = undefined;
    do {
      tmp = itr.next().value;
      arr.push(tmp);
    } while (tmp != undefined);
    let a = ["a", "b", "a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
   * @tc.name: testGet065
   * @tc.desc: Gets the element corresponding to the specified index. For example: list.get.bind({}, 1)().
   */
  it("testGet065 ", 0, function () {
    let list = new List();
    try {
      list.get.bind({}, 1)();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The get method cannot be bound`);
    }
  });

  /**
   * @tc.name: testInsert066
   * @tc.desc: Insert an element into the middle of the List instance. For example: list.insert("d", "a").
   */
  it("testInsert066", 0, function () {
    let list = new List();
    list.add("a");
    list.add("b");
    list.add("c");
    try {
      list.insert("d", "a");
      expect(true).assertEqual(false);
    } catch(err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "index" must be number. Received value is: a`);
    }
  });

  /**
   * @tc.name: testRemoveByIndex067
   * @tc.desc: In the List instance, delete the element based on its index. For example: list.removeByIndex("a").
   */
  it("testRemoveByIndex067", 0, function () {
    let list = new List();
    try {
      let res = list.removeByIndex("a");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "index" must be number. Received value is: a`);
    }
  });

  /**
   * @tc.name: testSet068
   * @tc.desc: Modify the element corresponding to the specified index. For example: list.set(6, "d").
   */
  it("testSet068", 0, function () {
    let list = new List();
    list.add("a");
    list.add("b");
    list.add("c");
    try {
      list.set(6, "d");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200001);
      expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 2. Received value is: 6`);
    }
  });

  /**
   * @tc.name: testSet069
   * @tc.desc: Modify the element corresponding to the specified index. For example: list.set("a", "d").
   */
  it("testSet069", 0, function () {
    let list = new List();
    list.add("a");
    list.add("b");
    list.add("c");
    try {
      list.set("a", "d");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "index" must be number. Received value is: a`);
    }
  });

  /**
   * @tc.name: testSort070
   * @tc.desc: Arrange the elements in the List instance in descending order. For example: list.sort(123).
   */
  it("testSort070", 0, function () {
    let list = new List();
    try {
      list.sort(123);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "comparator" must be callable. Received value is: 123`);
    }
  });

  /**
   * @tc.name: testGetSubList071
   * @tc.desc: Intercepts an element within the specified range, including the element with the 
   * starting index but not the element with the ending index. For example: list.getSubList(6, 2).
   */
  it("testGetSubList071", 0, function () {
    let list = new List();
    list.add("4");
    list.add("3");
    try {
      let res = list.getSubList("a", 2);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "fromIndex" must be number. Received value is: a`);
    }
  });

  /**
   * @tc.name: testAdd072
   * @tc.desc: Add a element to the end of the List instance. For example: list.add.bind({}, "a")().
   */
  it('testAdd072', 0, function () {
    let  list = new List();
    try {
      list.add.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The add method cannot be bound`);
    }
  });

  /**
   * @tc.name: testForEach073
   * @tc.desc: Traversing elements in an List instance. For example: list.forEach(11).
   */
  it('testForEach073', 0, function () {
    let  list = new List();
    try {
      list.forEach(11);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "callbackfn" must be callable. Received value is: 11`);
    }
  });

  /**
   * @tc.name: testForEach074
   * @tc.desc: Traversing elements in an List instance. For example: list.forEach.bind({}, "a")().
   */
  it('testForEach074', 0, function () {
    let  list = new List();
    try {
      list.forEach.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The forEach method cannot be bound`);
    }
  });

  /**
   * @tc.name: testIsEmpty075
   * @tc.desc: Determine whether the List instance is empty. For example: list.isEmpty.bind({}, "a")().
   */
  it('testIsEmpty075', 0, function () {
    let  list = new List();
    try {
      list.isEmpty.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The isEmpty method cannot be bound`);
    }
  });
});
}
