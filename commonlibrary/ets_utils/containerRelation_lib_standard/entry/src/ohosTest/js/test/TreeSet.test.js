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
import TreeSet from "@ohos.util.TreeSet";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
export default function TreeSetTest() {
describe("TreeSetTest", function () {
                              
  /**
   * @tc.name   testConstructor001
   * @tc.number testConstructor001
   * @tc.desc   Create an TreeSet instance. For example: let treeSet = new TreeSet().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testConstructor001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    try {
      let treeSet = new TreeSet();
      expect(treeSet != undefined).assertEqual(true);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200012);
      expect(err.message).assertEqual("The TreeSet's constructor cannot be directly invoked");
    }
  });

  /**
   * @tc.name   testConstructor002
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TREESET_01000
   * @tc.desc   Create an TreeSet instance and use Compare. For example: TreeSet((a, b) => {return a > b}).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testConstructor002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    try {
      let treeSet = new TreeSet((a, b) => {return a > b});
      expect(treeSet != undefined).assertEqual(true);
      treeSet.add("a");
      treeSet.add("c");
      treeSet.add("d");
      treeSet.add("b");
      expect(treeSet.length).assertEqual(4);
      let numbers = Array.from(treeSet.values())
      for (let item of numbers) {
        let res = treeSet.remove(item)
        expect(res).assertEqual(true);
      }
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200012);
      expect(err.message).assertEqual("The TreeMap's constructor cannot be directly invoked");
    }
  });

  /**
   * @tc.name   testAdd002
   * @tc.number testAdd002
   * @tc.desc   Add element to TreeSet instance. For example: treeSet.add("四").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAdd002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let treeSet = new TreeSet();
    treeSet.add("四");
    let res = treeSet.has("四");
    expect(res).assertEqual(true);
  });
                              
  /**
   * @tc.name   testAdd003
   * @tc.number testAdd003
   * @tc.desc   Add element to TreeSet instance. For example: treeSet.add("四").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAdd003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let treeSet = new TreeSet();
    treeSet.add(8);
    let res = treeSet.has(8);
    expect(res).assertEqual(true);
  });
                              
  /**
   * @tc.name   testAdd004
   * @tc.number testAdd004
   * @tc.desc   Add element to TreeSet instance. For example: let a = [1, 2, 3, 4]; treeSet.add(a).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAdd004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let treeSet = new TreeSet();
    let a = [1, 2, 3, 4];
    treeSet.add(a);
    let res = treeSet.has(a);
    expect(res).assertEqual(true);
  });
                              
  /**
   * @tc.name   testAdd005
   * @tc.number testAdd005
   * @tc.desc   Add element to TreeSet instance. For example: treeSet.add("*").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAdd005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let treeSet = new TreeSet();
    treeSet.add("*");
    let res = treeSet.has("*");
    expect(res).assertEqual(true);
  });
                              
  /**
   * @tc.name   testAdd006
   * @tc.number testAdd006
   * @tc.desc   Add element to TreeSet instance.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAdd006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let treeSet = new TreeSet();
    let a = {name: "lala", age: "13岁"};
    treeSet.add(a);
    let res = treeSet.has(a);
    expect(res).assertEqual(true);
  });
                              
  /**
   * @tc.name   testAdd007
   * @tc.number testAdd007
   * @tc.desc   Add element to TreeSet instance. For example: treeSet.add(1.234).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAdd007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let treeSet = new TreeSet();
    treeSet.add(1.234);
    let res = treeSet.has(1.234);
    expect(res).assertEqual(true);
  });
                              
  /**
   * @tc.name   testAdd008
   * @tc.number testAdd008
   * @tc.desc   Add element to TreeSet instance. For example: treeSet.add(true).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAdd008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let treeSet = new TreeSet();
    treeSet.add(true);
    let res = treeSet.has(true);
    expect(res).assertEqual(true);
  });
                              
  /**
   * @tc.name   testAdd009
   * @tc.number testAdd009
   * @tc.desc   Add element to TreeSet instance. For example: treeSet.add("").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAdd009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let treeSet = new TreeSet();
    treeSet.add("");
    let res = treeSet.has("");
    expect(res).assertEqual(true);
  });
                              
  /**
   * @tc.name   testAdd010
   * @tc.number testAdd010
   * @tc.desc   Add element to TreeSet instance.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAdd010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let treeSet = new TreeSet();
    for (let i = 0; i < 10000; i++) {
      treeSet.add(i);
    }
    expect(treeSet.length).assertEqual(10000);
    let res = treeSet.has(8888);
    expect(res).assertEqual(true);
  });
                              
  /**
   * @tc.name   testLength011
   * @tc.number testLength011
   * @tc.desc   Get the number of element in the TreeSet instance. For example: treeSet.length.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testLength011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    let res = treeSet.length;
    expect(res).assertEqual(3);
  });
                              
  /**
   * @tc.name   testLength012
   * @tc.number testLength012
   * @tc.desc   Get the number of element in the TreeSet instance. For example: treeSet.length.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testLength012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let treeSet = new TreeSet();
    let res = treeSet.length;
    expect(res).assertEqual(0);
  });
                              
  /**
   * @tc.name   testHas013
   * @tc.number testHas013
   * @tc.desc   Determine whether the TreeSet instance contains the specified element. For example: treeSet.has(2).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testHas013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    let res = treeSet.has(2);
    expect(res).assertEqual(true);
  });
                              
  /**
   * @tc.name   testHas014
   * @tc.number testHas014
   * @tc.desc   Determine whether the TreeSet instance contains the specified element. For example: treeSet.has(2).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testHas014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    let res1 = treeSet.has(3);
    expect(res1).assertEqual(false);
  });
                              
  /**
   * @tc.name   testGetFirstValue015
   * @tc.number testGetFirstValue015
   * @tc.desc   Get the value that ranks first in the TreeSet instance. For example: treeSet.getFirstValue().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGetFirstValue015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    treeSet.add(3);
    treeSet.add(4);
    let res = treeSet.getFirstValue();
    expect(res).assertEqual(0);
  });
                              
  /**
   * @tc.name   testGetFirstValue016
   * @tc.number testGetFirstValue016
   * @tc.desc   Get the value that ranks first in the TreeSet instance.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGetFirstValue016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let treeSet = new TreeSet();
    let res = treeSet.getFirstValue();
    expect(res).assertEqual(undefined);
  });
                              
  /**
   * @tc.name   testGetLastValue017
   * @tc.number testGetLastValue017
   * @tc.desc   Get the last sorted key in the TreeSet instance. For example: treeSet.getLastValue().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testGetLastValue017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    let res = treeSet.getLastValue();
    expect(res).assertEqual(2);
  });
                              
  /**
   * @tc.name   testGetLastValue018
   * @tc.number testGetLastValue018
   * @tc.desc   Get the last sorted key in the TreeSet instance. For example: treeSet.getLastValue().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testGetLastValue018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeSet = new TreeSet();
    let res = treeSet.getLastValue();
    expect(res).assertEqual(undefined);
  });
                              
  /**
   * @tc.name   testGetLowerValue019
   * @tc.number testGetLowerValue019
   * @tc.desc   Get a value that is a little lower than the specified value sort.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testGetLowerValue019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    treeSet.add(3);
    treeSet.add(4);
    let res = treeSet.getLowerValue(2);
    expect(res).assertEqual(1);
  });
                              
  /**
   * @tc.name   testGetLowerValue020
   * @tc.number testGetLowerValue020
   * @tc.desc   Get a value that is a little lower than the specified value sort.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testGetLowerValue020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeSet = new TreeSet();
    let res = treeSet.getLowerValue(2);
    expect(res).assertEqual(undefined);
  });
                              
  /**
   * @tc.name   testGetHigherValue021
   * @tc.number testGetHigherValue021
   * @tc.desc   Get a value that is a little higher than the specified value sort.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testGetHigherValue021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    treeSet.add(3);
    treeSet.add(4);
    let res = treeSet.getHigherValue(3);
    expect(res).assertEqual(4);
  });
                              
  /**
   * @tc.name   testGetHigherValue022
   * @tc.number testGetHigherValue022
   * @tc.desc   Get a value that is a little higher than the specified value sort.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testGetHigherValue022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeSet = new TreeSet();
    let res = treeSet.getHigherValue(3);
    expect(res).assertEqual(undefined);
  });
                              
  /**
   * @tc.name   testPopFirst023
   * @tc.number testPopFirst023
   * @tc.desc   Delete first value of sort. For example: treeSet.popFirst().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testPopFirst023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeSet = new TreeSet();
    treeSet.add("a");
    treeSet.add("b");
    treeSet.add("c");
    treeSet.add("d");
    treeSet.add("e");
    let res = treeSet.popFirst();
    expect(res).assertEqual("a");
  });
                              
  /**
   * @tc.name   testPopFirst024
   * @tc.number testPopFirst024
   * @tc.desc   Delete first value of sort. For example: treeSet.popFirst().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testPopFirst024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeSet = new TreeSet();
    let res = treeSet.popFirst();
    expect(res).assertEqual(undefined);
  });
                              
  /**
   * @tc.name   testPopLast025
   * @tc.number testPopLast025
   * @tc.desc   Delete last value of sort. For example: treeSet.popLast().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testPopLast025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeSet = new TreeSet();
    treeSet.add("a");
    treeSet.add("b");
    treeSet.add("c");
    treeSet.add("d");
    treeSet.add("e");
    let res = treeSet.popLast();
    expect(res).assertEqual("e");
  });
                              
  /**
   * @tc.name   testPopLast026
   * @tc.number testPopLast026
   * @tc.desc   Delete last value of sort. For example: treeSet.popLast().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testPopLast026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeSet = new TreeSet();
    let res = treeSet.popLast();
    expect(res).assertEqual(undefined);
  });
                              
  /**
   * @tc.name   testClear027
   * @tc.number testClear027
   * @tc.desc   Clear all elements of the TreeSet instance. For example: treeSet.clear().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testClear027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    treeSet.clear();
    let res = treeSet.length;
    expect(res).assertEqual(0);
  });
                              
  /**
   * @tc.name   testClear028
   * @tc.number testClear028
   * @tc.desc   Clear all elements of the TreeSet instance. For example: treeSet.clear().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testClear028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    treeSet.clear();
    let res = treeSet.length;
    expect(res).assertEqual(0);
    let res1 = treeSet.popFirst();
    expect(res1).assertEqual(undefined);
  });
                              
  /**
   * @tc.name   testIsEmpty029
   * @tc.number testIsEmpty029
   * @tc.desc   Determine whether the TreeSet instance is empty. For example: treeSet.isEmpty().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIsEmpty029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeSet = new TreeSet();
    treeSet.add("a");
    let res1 = treeSet.isEmpty();
    expect(res1).assertEqual(false);
  });
                              
  /**
   * @tc.name   testIsEmpty030
   * @tc.number testIsEmpty030
   * @tc.desc   Determine whether the TreeSet instance is empty. For example: treeSet.isEmpty().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIsEmpty030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeSet = new TreeSet();
    let res2 = treeSet.isEmpty();
    expect(res2).assertEqual(true);
  });
                              
  /**
   * @tc.name   testRemove031
   * @tc.number testRemove031
   * @tc.desc   Delete the specified value. For example: hashSet.remove("c").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testRemove031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeSet = new TreeSet();
    treeSet.add("a");
    treeSet.add("b");
    treeSet.add("c");
    treeSet.add("c");
    treeSet.add("d");
    treeSet.add("g");
    let res1 = treeSet.remove("c");
    expect(res1).assertEqual(true);
    let res2 = treeSet.has("c");
    expect(res2).assertEqual(false);
  });
                              
  /**
   * @tc.name   testRemove032
   * @tc.number testRemove032
   * @tc.desc   Delete the specified value. For example: hashSet.remove("c").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testRemove032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeSet = new TreeSet();
    let res = treeSet.remove("c");
    expect(res).assertEqual(false);
  });
                              
  /**
   * @tc.name   testValues033
   * @tc.number testValues033
   * @tc.desc   Get a collection of all the values in the TreeSet. For example: treeSet.values().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testValues033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeSet = new TreeSet();
    treeSet.add("a");
    treeSet.add("b");
    treeSet.add("c");
    treeSet.add("d");
    treeSet.add("g");
    let res = treeSet.values();
    expect(res.next().value).assertEqual("a");
    expect(res.next().value).assertEqual("b");
    expect(res.next().value).assertEqual("c");
    expect(res.next().value).assertEqual("d");
    expect(res.next().value).assertEqual("g");
  });
                              
  /**
   * @tc.name   testForEach034
   * @tc.number testForEach034
   * @tc.desc   Traverse the collection of all elements of the TreeSet instance.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testForEach034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    treeSet.add(3);
    treeSet.add(4);
    let arr1 = [];
    treeSet.forEach((value, key) => {
      arr1.push(value);
    });
    let arr = [0, 1, 2, 3, 4];
    for (let i = 0; i < arr1.length; i++) {
      expect(arr[i]).assertEqual(arr1[i]);
    }
  });
                              
  /**
   * @tc.name   testEntries035
   * @tc.number testEntries035
   * @tc.desc   Get all key value pairs collection in TreeMap.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testEntries035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeSet = new TreeSet();
    treeSet.add("a");
    treeSet.add("b");
    treeSet.add("c");
    treeSet.add("d");
    treeSet.add("g");
    let res = treeSet.entries();
    expect(JSON.stringify(res.next().value)).assertEqual('["a","a"]');
    expect(JSON.stringify(res.next().value)).assertEqual('["b","b"]');
    expect(JSON.stringify(res.next().value)).assertEqual('["c","c"]');
    expect(JSON.stringify(res.next().value)).assertEqual('["d","d"]');
    expect(JSON.stringify(res.next().value)).assertEqual('["g","g"]');
  });
                              
  /**
   * @tc.name   testIterator036
   * @tc.number testIterator036
   * @tc.desc   Iterate over all elements of the TreeSet instance.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIterator036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    treeSet.add(3);
    treeSet.add(4);
    let arr = [];
    for (let item of treeSet) {
      arr.push(item);
    }
    let arr1 = [0, 1, 2, 3, 4];
    for (let i = 0; i < arr1.length; i++) {
      expect(arr[i]).assertEqual(arr1[i]);
    }
  });
                              
  /**
   * @tc.name   testIterator037
   * @tc.number testIterator037
   * @tc.desc   Iterate over all elements of the TreeSet instance. For example: treeSet[Symbol.iterator]().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIterator037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    treeSet.add(3);
    treeSet.add(4);
    let arr = [];
    let res = treeSet[Symbol.iterator]();
    let temp = undefined;
    do {
      temp = res.next().value;
      arr.push(temp);
    } while (temp != undefined);
    let arr1 = [0, 1, 2, 3, 4];
    for (let i = 0; i < arr1.length; i++) {
      expect(arr[i]).assertEqual(arr1[i]);
    }
  });

   /**
    * @tc.name   testAdd038
    * @tc.number testAdd038
    * @tc.desc   Add element to TreeSet instance. For example: treeSet.add.bind({}, "a")().
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("testAdd038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeSet = new TreeSet();
    try {
      treeSet.add.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The add method cannot be bound`);
    }
  });

  /**
   * @tc.name   testClear039
   * @tc.number testClear039
   * @tc.desc   Clear all elements of the TreeSet instance. For example: treeSet.clear.bind({}, "a")().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testClear039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let  treeSet = new TreeSet();
    try {
      treeSet.clear.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The clear method cannot be bound`);
    }
  });

  /**
   * @tc.name   testGetLowerValue040
   * @tc.number testGetLowerValue040
   * @tc.desc   Get a value that is a little lower than the specified value sort.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testGetLowerValue040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let  treeSet = new TreeSet();
    try {
      treeSet.getLowerValue.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The getLowerValue method cannot be bound`);
    }
  });

  /**
   * @tc.name   testGetLowerValue041
   * @tc.number testGetLowerValue041
   * @tc.desc   Get a value that is a little lower than the specified value sort.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testGetLowerValue041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let  treeSet = new TreeSet();
    let res = treeSet.getLowerValue(null);
    expect(res).assertEqual(undefined);
  });

  /**
   * @tc.name   testGetHigherValue042
   * @tc.number testGetHigherValue042
   * @tc.desc   Get a value that is a little higher than the specified value sort.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testGetHigherValue042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let  treeSet = new TreeSet();
    let res = treeSet.getHigherValue(null);
    expect(res).assertEqual(undefined);
  });

  /**
   * @tc.name   testGetHigherValue043
   * @tc.number testGetHigherValue043
   * @tc.desc   Get a value that is a little higher than the specified value sort.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testGetHigherValue043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let  treeSet = new TreeSet();
    try {
      treeSet.getHigherValue.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The getHigherValue method cannot be bound`);
    }
  });

  /**
   * @tc.name   testForEach044
   * @tc.number testForEach044
   * @tc.desc   Traverse the collection of all elements of the TreeSet instance.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testForEach044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let  treeSet = new TreeSet();
    try {
      treeSet.forEach.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The forEach method cannot be bound`);
    }
  });

  /**
   * @tc.name   testForEach045
   * @tc.number testForEach045
   * @tc.desc   Traverse the collection of all elements of the TreeSet instance.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testForEach045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let  treeSet = new TreeSet();
    try {
      treeSet.forEach(11);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "callbackfn" must be callable. Received value is: 11`);
    }
  });

  /**
   * @tc.name   testValues046
   * @tc.number testValues046
   * @tc.desc   Get a collection of all the values in the TreeSet. For example: treeSet.values.bind({}, "a")().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testValues046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let  treeSet = new TreeSet();
    try {
      treeSet.values.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The Symbol.iterator method cannot be bound`);
    }
  });

  /**
   * @tc.name   testValues047
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TREESET_01002
   * @tc.desc   Get a collection of all the values in the TreeSet. For example: treeSet.forEach((value, key).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testValues047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let  treeSet = new TreeSet();
    treeSet.add("sparrow");
    treeSet.forEach((value, key) => {
      expect(value).assertEqual("sparrow");
      expect(key).assertEqual("sparrow");
    });
  });
});
}
