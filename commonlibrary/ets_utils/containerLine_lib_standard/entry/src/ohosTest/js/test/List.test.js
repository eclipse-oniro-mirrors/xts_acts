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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
export default function ListTest() {
describe("ListTest", function () {

  /**
   * @tc.name   testConstructor001
   * @tc.number testConstructor001
   * @tc.desc   Create an List instance. For example: let list = new List().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testConstructor001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testGet002
   * @tc.number testGet002
   * @tc.desc   Gets the element corresponding to the specified index. For example: list.get(0).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGet002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let list = new List();
    list.add("四");
    let res = list.get(0);
    expect(res).assertEqual("四");
  });
    
  /**
   * @tc.name   testGet003
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LIST_01000
   * @tc.desc   Gets the element corresponding to the specified index. For example: list.get(1).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGet003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let list = new List();
    list.add(0);
    list.add(1);
    let s = Math.trunc(1.33);
    let res = list.get(s);
    expect(res).assertEqual(1);
  });
    
  /**
   * @tc.name   testAdd003
   * @tc.number testAdd003
   * @tc.desc   Add a element to the end of the List instance. For example: list.add(8).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAdd003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let list = new List();
    list.add(8);
    let res = list.get(0);
    expect(res).assertEqual(8);
  });
    
  /**
   * @tc.name   testAdd004
   * @tc.number testAdd004
   * @tc.desc   Add a element to the end of the List instance.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAdd004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let list = new List();
    let a = [1, 2, 3, 4];
    list.add(a);
    let res = list.get(0);
    expect(res).assertEqual(a);
  });
    
  /**
   * @tc.name   testAdd005
   * @tc.number testAdd005
   * @tc.desc   Add a element to the end of the List instance.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAdd005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let list = new List();
    let a = {name: "lala", age: "13"};
    list.add(a);
    let res = list.get(0);
    expect(res).assertEqual(a);
  });
    
  /**
   * @tc.name   testHas006
   * @tc.number testHas006
   * @tc.desc   Check whether the List contains a specified element. For example: list.has("a").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testHas006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let list = new List();
    list.add("a");
    list.add("b");
    list.add("c");
    let res = list.has("a");
    expect(res).assertEqual(true);
  });
    
  /**
   * @tc.name   testHas007
   * @tc.number testHas007
   * @tc.desc   Check whether the List contains a specified element. For example: list.has("d").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testHas007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let list = new List();
    list.add("a");
    list.add("b");
    list.add("c");
    let res = list.has("d");
    expect(res).assertEqual(false);
  });
    
  /**
   * @tc.name   testEqual008
   * @tc.number testEqual008
   * @tc.desc   Judge whether two List instances are equal. For example: let res = list.equal(list1).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testEqual008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testEqual009
   * @tc.number testEqual009
   * @tc.desc   Judge whether two List instances are equal. For example: let res = list.equal(list1).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testEqual009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testEqual010
   * @tc.number testEqual010
   * @tc.desc   Judge whether two List instances are equal. For example: let res = list.equal(list1).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testEqual010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testGet010
   * @tc.number testGet010
   * @tc.desc   Gets the element corresponding to the specified index. For example: list.get(2).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGet010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testGetLastIndexOf012
   * @tc.number testGetLastIndexOf012
   * @tc.desc   In the List instance, find the index of a specified element from brack to front,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGetLastIndexOf012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testGetIndexOf013
   * @tc.number testGetIndexOf013
   * @tc.desc   In the List instance, find the index of a specified element from front to back,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGetIndexOf013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testRemoveByIndex014
   * @tc.number testRemoveByIndex014
   * @tc.desc   In the List instance, delete the element based on its index. For example: list.removeByIndex(2).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testRemoveByIndex014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testRemove015
   * @tc.number testRemove015
   * @tc.desc   Delete the specified element. For example: list.remove("a").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testRemove015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testReplaceAllElements016
   * @tc.number testReplaceAllElements016
   * @tc.desc   Perform some operation on the elements in the List instance and return the List instance
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testReplaceAllElements016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testGetFirst017
   * @tc.number testGetFirst017
   * @tc.desc   Get the header element of the List instance. For example: list.getFirst().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGetFirst017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testGetLast018
   * @tc.number testGetLast018
   * @tc.desc   Get the end element of the List instance. For example: list.getLast().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGetLast018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testInsert019
   * @tc.number testInsert019
   * @tc.desc   Insert an element into the middle of the List instance. For example: list.insert("d", 3).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testInsert019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testSet020
   * @tc.number testSet020
   * @tc.desc   Modify the element corresponding to the specified index. For example: list.set(2, "d").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testSet020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testSort021
   * @tc.number testSort021
   * @tc.desc   Arrange the elements in the List instance in descending order. For example: list.sort((a, b) => a - b).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testSort021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testGetSubList022
   * @tc.number testGetSubList022
   * @tc.desc   Intercepts an element within the specified range, including the element with the
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGetSubList022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testConvertToArray023
   * @tc.number testConvertToArray023
   * @tc.desc   Convert an List instance to an array. For example: list.convertToArray().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testConvertToArray023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testLength024
   * @tc.number testLength024
   * @tc.desc   Get the number of elements contained in the List instance. For example: list.length.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testLength024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testIterator025
   * @tc.number testIterator025
   * @tc.desc   Iterates over all elements in an List instance. For example: for (let item of list) {arr.push(item);}.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testIterator025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testForEach026
   * @tc.number testForEach026
   * @tc.desc   Traversing elements in an List instance. For example: list.forEach((item, index) => {arr.push(item);}).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testForEach026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testIsEmpty027
   * @tc.number testIsEmpty027
   * @tc.desc   Determine whether the List instance is empty. For example: list.isEmpty().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testIsEmpty027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testClear028
   * @tc.number testClear028
   * @tc.desc   Clear all elements in the List instance. For example: list.clear().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testClear028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testGet029
   * @tc.number testGet029
   * @tc.desc   Gets the element corresponding to the specified index. For example: list.get(6).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGet029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testGetLastIndexOf030
   * @tc.number testGetLastIndexOf030
   * @tc.desc   In the List instance, find the index of a specified element from brack to front,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGetLastIndexOf030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testRemoveByIndex031
   * @tc.number testRemoveByIndex031
   * @tc.desc   In the List instance, delete the element based on its index. For example: list.removeByIndex(5).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testRemoveByIndex031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testRemove032
   * @tc.number testRemove032
   * @tc.desc   Delete the specified element. For example: list.remove().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testRemove032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let list = new List();
    list.add();
    let res = list.remove();
    expect(res).assertEqual(true);
  });
    
  /**
   * @tc.name   testInsert033
   * @tc.number testInsert033
   * @tc.desc   Insert an element into the middle of the List instance. For example: list.insert("d", 8).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testInsert033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testSort034
   * @tc.number testSort034
   * @tc.desc   Arrange the elements in the List instance in descending order. For example: list.sort((a, b) => a - b).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testSort034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testGetSubList035
   * @tc.number testGetSubList035
   * @tc.desc   Intercepts an element within the specified range, including the element with the
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGetSubList035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testGetSubList036
   * @tc.number testGetSubList036
   * @tc.desc   Intercepts an element within the specified range, including the element with the
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testGetSubList036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
   * @tc.name   testGetSubList037
   * @tc.number testGetSubList037
   * @tc.desc   Intercepts an element within the specified range, including the element with the
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testGetSubList037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
   * @tc.name   testAdd038
   * @tc.number testAdd038
   * @tc.desc   Add a element to the end of the List instance. For example: list.add("*").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testAdd038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let list = new List();
    list.add(".");
    list.add("*");
    list.add("|");
    let res = list.get(0);
    expect(res).assertEqual(".");
  });
    
  /**
   * @tc.name   testAdd039
   * @tc.number testAdd039
   * @tc.desc   Add a element to the end of the List instance. For example: list.add("*").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testAdd039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
   * @tc.name   testAdd040
   * @tc.number testAdd040
   * @tc.desc   Add a element to the end of the List instance. For example: list.add(" ").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testAdd040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let list = new List();
    list.add(" ");
    let res = list.get(0);
    expect(res).assertEqual(" ");
  });
    
  /**
   * @tc.name   testAdd041
   * @tc.number testAdd041
   * @tc.desc   Add a element to the end of the List instance. For example: list.add("a").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testAdd041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let list = new List();
    list.add("a");
    list.add("a");
    let res = list.get(0);
    let res1 = list.get(1);
    expect(res).assertEqual("a");
    expect(res1).assertEqual("a");
  });
    
  /**
   * @tc.name   testListGet042
   * @tc.number testListGet042
   * @tc.desc   Gets the element corresponding to the specified index. For example: list[0].
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testListGet042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let list = new List();
    list.add("a");
    list.add("b");
    let res = list[0];
    expect(res).assertEqual("a");
  });
    
  /**
   * @tc.name   testListSet043
   * @tc.number testListSet043
   * @tc.desc   Modify the element corresponding to the specified index. For example: list[1] = "c".
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testListSet043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
   * @tc.name   testAdd044
   * @tc.number testAdd044
   * @tc.desc   Add a element to the end of the List instance. For example: for (let i = 0; i < 100; i++) {list.add(i);}.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testAdd044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
   * @tc.name   testAdd045
   * @tc.number testAdd045
   * @tc.desc   Add a element to the end of the List instance. For example: list.add(null).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testAdd045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let list = new List();
    list.add(null);
    let res = list.get(0);
    expect(res).assertEqual(null);
  });
    
  /**
   * @tc.name   testAdd046
   * @tc.number testAdd046
   * @tc.desc   Add a element to the end of the List instance. For example: list.add(0.1111).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testAdd046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let list = new List();
    list.add(0.1111);
    let res = list.get(0);
    expect(res).assertEqual(0.1111);
  });
    
  /**
   * @tc.name   testAdd047
   * @tc.number testAdd047
   * @tc.desc   Add a element to the end of the List instance. For example: list.add(-1).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testAdd047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let list = new List();
    list.add(-1);
    let res = list.get(0);
    expect(res).assertEqual(-1);
  });
    
  /**
   * @tc.name   testAdd048
   * @tc.number testAdd048
   * @tc.desc   Add a element to the end of the List instance. For example: const obj = {}; list.add(obj).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testAdd048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let list = new List();
    const obj = {};
    list.add(obj);
    let res = list.get(0);
    expect(res).assertEqual(obj);
  });
    
  /**
   * @tc.name   testSort049
   * @tc.number testSort049
   * @tc.desc   Arrange the elements in the List instance in descending order. For example: list.sort((a, b) => a - b).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSort049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let list = new List();
    list.sort((a, b) => a - b);
    let res1 = list.length;
    expect(res1).assertEqual(0);
  });
    
  /**
   * @tc.name   testRemoveByIndex050
   * @tc.number testRemoveByIndex050
   * @tc.desc   In the List instance, delete the element based on its index. For example: list.removeByIndex(1).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testRemoveByIndex050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let list = new List();
    try {
      let res = list.removeByIndex(1);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200001);
      expect(err.message).assertEqual("Container is empty");
    }
  });
    
  /**
   * @tc.name   testEqual051
   * @tc.number testEqual051
   * @tc.desc   Judge whether two List instances are equal. For example: let res = list.equal(list1).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testEqual051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let list = new List();
    let list1 = new List();
    let res = list.equal(list1);
    expect(res).assertEqual(true);
  });
    
  /**
   * @tc.name   testGetIndexOf052
   * @tc.number testGetIndexOf052
   * @tc.desc   In the List instance, find the index of a specified element from front to back,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testGetIndexOf052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let list = new List();
    let res = list.getIndexOf(1);
    expect(res).assertEqual(-1);
  });
    
  /**
   * @tc.name   testForEach053
   * @tc.number testForEach053
   * @tc.desc   Traversing elements in an List instance. For example: list.forEach((item, index) => {num++;}).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testForEach053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let list = new List();
    let num = 0;
    list.forEach((item, index) => {
      num++;
    });
    expect(num).assertEqual(0);
  });
    
  /**
   * @tc.name   testIsEmpty054
   * @tc.number testIsEmpty054
   * @tc.desc   Determine whether the List instance is empty. For example: list.isEmpty().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIsEmpty054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let list = new List();
    let res = list.isEmpty();
    expect(res).assertEqual(true);
  });
    
  /**
   * @tc.name   testHas055
   * @tc.number testHas055
   * @tc.desc   Check whether the List contains a specified element. For example: list.has(1).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testHas055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let list = new List();
    let res = list.has(1);
    expect(res).assertEqual(false);
  });
    
  /**
   * @tc.name   testGet056
   * @tc.number testGet056
   * @tc.desc   Gets the element corresponding to the specified index. For example: list.get(1).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testGet056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let list = new List();
    let res = list.get(1);
    expect(res).assertEqual(undefined);
  });
    
  /**
   * @tc.name   testClear057
   * @tc.number testClear057
   * @tc.desc   Clear all elements in the List instance. For example: list.clear().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testClear057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let list = new List();
    list.clear();
    let res1 = list.length;
    expect(res1).assertEqual(0);
  });
    
  /**
   * @tc.name   testGetLast058
   * @tc.number testGetLast058
   * @tc.desc   Get the end element of the List instance. For example: list.getLast().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testGetLast058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let list = new List();
    let res = list.getLast();
    expect(res).assertEqual(undefined);
  });
    
  /**
   * @tc.name   testReplaceAllElements059
   * @tc.number testReplaceAllElements059
   * @tc.desc   Perform some operation on the elements in the List instance and return the List instance
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReplaceAllElements059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let list = new List();
    let num = 0;
    list.replaceAllElements((item, index) => {
      num++;
    });
    expect(num).assertEqual(0);
  });
    
  /**
   * @tc.name   testConvertToArray060
   * @tc.number testConvertToArray060
   * @tc.desc   Convert an List instance to an array. For example: list.convertToArray().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testConvertToArray060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let list = new List();
    const res = list.convertToArray();
    expect(res.length).assertEqual(0);
  });
    
  /**
   * @tc.name   testConvertToArray061
   * @tc.number testConvertToArray061
   * @tc.desc   Convert an List instance to an array. For example: list.convertToArray().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testConvertToArray061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let list = new List();
    const res = list.convertToArray();
    expect(res.length).assertEqual(0);
  });
    
  /**
   * @tc.name   testlterator062
   * @tc.number testlterator062
   * @tc.desc   Iterates over all elements in an List instance. For example: for (const iterator of list) { num++;}.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testlterator062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
   * @tc.name   testGetFirst063
   * @tc.number testGetFirst063
   * @tc.desc   Get the header element of the List instance. For example: list.getFirst().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testGetFirst063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let list = new List();
    let res = list.getFirst();
    expect(res).assertEqual(undefined);
  });
    
  /**
   * @tc.name   testIterator064
   * @tc.number testIterator064
   * @tc.desc   Iterates over all elements in an List instance. For example: List[Symbol.iterator]().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIterator064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
   * @tc.name   testGet065 
   * @tc.number testGet065 
   * @tc.desc   Gets the element corresponding to the specified index. For example: list.get.bind({}, 1)().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testGet065 ", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
   * @tc.name   testInsert066
   * @tc.number testInsert066
   * @tc.desc   Insert an element into the middle of the List instance. For example: list.insert("d", "a").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testInsert066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
      expect(err.message).assertEqual(`The type of "index" must be small integer. Received value is: a`);
    }
  });

  /**
   * @tc.name   testInsert067
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LIST_01003
   * @tc.desc   Insert an element into the middle of the List instance. For example: list.insert("d", "a").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testInsert067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let list = new List();
    list.add(0);
    list.add(1);
    list.add(2);
    let num = Math.trunc(3.33);
    list.insert(3, num);
    expect(list.has(3)).assertEqual(true);
  });

  /**
   * @tc.name   testRemoveByIndex067
   * @tc.number testRemoveByIndex067
   * @tc.desc   In the List instance, delete the element based on its index. For example: list.removeByIndex("a").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testRemoveByIndex067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let list = new List();
    try {
      let res = list.removeByIndex("a");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "index" must be small integer. Received value is: a`);
    }
  });

  /**
   * @tc.name   testRemoveByIndex068
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LIST_01002
   * @tc.desc   In the List instance, delete the element based on its index. For example: list.removeByIndex("a").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testRemoveByIndex068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let list = new List();
    list.add(0);
    list.add(1);
    list.add(2);
    let num = Math.trunc(1.33);
    let res = list.removeByIndex(num);
    expect(res).assertEqual(1);
  });

  /**
   * @tc.name   testSet068
   * @tc.number testSet068
   * @tc.desc   Modify the element corresponding to the specified index. For example: list.set(6, "d").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSet068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
   * @tc.name   testSet069
   * @tc.number testSet069
   * @tc.desc   Modify the element corresponding to the specified index. For example: list.set("a", "d").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSet069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
      expect(err.message).assertEqual(`The type of "index" must be small integer. Received value is: a`);
    }
  });

  /**
   * @tc.name   testSet070
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LIST_01001
   * @tc.desc   Modify the element corresponding to the specified index. For example: list.set("a", "d").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSet070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let list = new List();
    list.add(0);
    list.add(1);
    list.add(2);
    let num = Math.trunc(1.33);
    let res = list.set(num, 3);
    expect(res).assertEqual(3);
  });

  /**
   * @tc.name   testSort070
   * @tc.number testSort070
   * @tc.desc   Arrange the elements in the List instance in descending order. For example: list.sort(123).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSort070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
   * @tc.name   testGetSubList071
   * @tc.number testGetSubList071
   * @tc.desc   Intercepts an element within the specified range, including the element with the
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testGetSubList071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
   * @tc.name   testAdd072
   * @tc.number testAdd072
   * @tc.desc   Add a element to the end of the List instance. For example: list.add.bind({}, "a")().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testAdd072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
   * @tc.name   testForEach073
   * @tc.number testForEach073
   * @tc.desc   Traversing elements in an List instance. For example: list.forEach(11).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testForEach073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
   * @tc.name   testForEach074
   * @tc.number testForEach074
   * @tc.desc   Traversing elements in an List instance. For example: list.forEach.bind({}, "a")().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testForEach074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
   * @tc.name   testIsEmpty075
   * @tc.number testIsEmpty075
   * @tc.desc   Determine whether the List instance is empty. For example: list.isEmpty.bind({}, "a")().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testIsEmpty075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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

  /**
   * @tc.name   testGetSubList076
   * @tc.number testGetSubList076
   * @tc.desc   Determine whether the List instance is empty. For example: list.isEmpty.bind({}, "a")().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testGetSubList076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let list = new List();
    list.add(4);
    list.add(0);
    list.add(1);
    list.add(2);
    let res = list.getSubList(1, 4);
    let arr = [];
    res.forEach((item, index) => {
      arr.push(item);
    });
    let a = [0, 1, 2];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
    });

    /**
     * @tc.name   testGetSubList077
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LIST_01010
     * @tc.desc   Determine whether the List instance is empty. For example: list.isEmpty.bind({}, "a")().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetSubList077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let list = new List();
      list.add(4);
      list.add(0);
      list.add(1);
      list.add(2);
      let left = Math.trunc(1.33);
      let right = Math.trunc(4.33);
      let res = list.getSubList(left, right);
      let arr = [];
      res.forEach((item, index) => {
        arr.push(item);
      });
      let a = [0, 1, 2];
      for (let i = 0; i < a.length; i++) {
        expect(arr[i]).assertEqual(a[i]);
      }
    });
  });
}
