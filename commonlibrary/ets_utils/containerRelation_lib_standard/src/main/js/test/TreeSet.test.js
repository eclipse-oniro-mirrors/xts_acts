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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
export default function TreeSetTest() {
describe("TreeSetTest", function () {
                              
  /**
   * @tc.name: testConstructor001
   * @tc.desc: Create an TreeSet instance. For example: let treeSet = new TreeSet().
   */   
  it("testConstructor001", 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TREESET_01000
   * @tc.name: testConstructor002
   * @tc.desc: Create an TreeSet instance and use Compare. For example: TreeSet((a, b) => {return a > b}).
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testConstructor002", 0, function () {
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
   * @tc.name: testAdd002
   * @tc.desc: Add element to TreeSet instance. For example: treeSet.add("四").
   */   
  it("testAdd002", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add("四");
    let res = treeSet.has("四");
    expect(res).assertEqual(true);
  });
                              
  /**
   * @tc.name: testAdd003
   * @tc.desc: Add element to TreeSet instance. For example: treeSet.add("四").
   */   
  it("testAdd003", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(8);
    let res = treeSet.has(8);
    expect(res).assertEqual(true);
  });
                              
  /**
   * @tc.name: testAdd004
   * @tc.desc: Add element to TreeSet instance. For example: let a = [1, 2, 3, 4]; treeSet.add(a).
   */   
  it("testAdd004", 0, function () {
    let treeSet = new TreeSet();
    let a = [1, 2, 3, 4];
    treeSet.add(a);
    let res = treeSet.has(a);
    expect(res).assertEqual(true);
  });
                              
  /**
   * @tc.name: testAdd005
   * @tc.desc: Add element to TreeSet instance. For example: treeSet.add("*").
   */   
  it("testAdd005", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add("*");
    let res = treeSet.has("*");
    expect(res).assertEqual(true);
  });
                              
  /**
   * @tc.name: testAdd006
   * @tc.desc: Add element to TreeSet instance.
   */   
  it("testAdd006", 0, function () {
    let treeSet = new TreeSet();
    let a = {name: "lala", age: "13岁"};
    treeSet.add(a);
    let res = treeSet.has(a);
    expect(res).assertEqual(true);
  });
                              
  /**
   * @tc.name: testAdd007
   * @tc.desc: Add element to TreeSet instance. For example: treeSet.add(1.234).
   */   
  it("testAdd007", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(1.234);
    let res = treeSet.has(1.234);
    expect(res).assertEqual(true);
  });
                              
  /**
   * @tc.name: testAdd008
   * @tc.desc: Add element to TreeSet instance. For example: treeSet.add(true).
   */   
  it("testAdd008", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(true);
    let res = treeSet.has(true);
    expect(res).assertEqual(true);
  });
                              
  /**
   * @tc.name: testAdd009
   * @tc.desc: Add element to TreeSet instance. For example: treeSet.add("").
   */   
  it("testAdd009", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add("");
    let res = treeSet.has("");
    expect(res).assertEqual(true);
  });
                              
  /**
   * @tc.name: testAdd010
   * @tc.desc: Add element to TreeSet instance.
   */   
  it("testAdd010", 0, function () {
    let treeSet = new TreeSet();
    for (let i = 0; i < 10000; i++) {
      treeSet.add(i);
    }
    expect(treeSet.length).assertEqual(10000);
    let res = treeSet.has(8888);
    expect(res).assertEqual(true);
  });
                              
  /**
   * @tc.name: testLength011
   * @tc.desc: Get the number of element in the TreeSet instance. For example: treeSet.length.
   */   
  it("testLength011", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    let res = treeSet.length;
    expect(res).assertEqual(3);
  });
                              
  /**
   * @tc.name: testLength012
   * @tc.desc: Get the number of element in the TreeSet instance. For example: treeSet.length.
   */   
  it("testLength012", 0, function () {
    let treeSet = new TreeSet();
    let res = treeSet.length;
    expect(res).assertEqual(0);
  });
                              
  /**
   * @tc.name: testHas013
   * @tc.desc: Determine whether the TreeSet instance contains the specified element. For example: treeSet.has(2).
   */   
  it("testHas013", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    let res = treeSet.has(2);
    expect(res).assertEqual(true);
  });
                              
  /**
   * @tc.name: testHas014
   * @tc.desc: Determine whether the TreeSet instance contains the specified element. For example: treeSet.has(2).
   */   
  it("testHas014", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    let res1 = treeSet.has(3);
    expect(res1).assertEqual(false);
  });
                              
  /**
   * @tc.name: testGetFirstValue015
   * @tc.desc: Get the value that ranks first in the TreeSet instance. For example: treeSet.getFirstValue().
   */   
  it("testGetFirstValue015", 0, function () {
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
   * @tc.name: testGetFirstValue016
   * @tc.desc: Get the value that ranks first in the TreeSet instance. 
   * For example: treeSet.getFirstValue().
   */   
  it("testGetFirstValue016", 0, function () {
    let treeSet = new TreeSet();
    let res = treeSet.getFirstValue();
    expect(res).assertEqual(undefined);
  });
                              
  /**
   * @tc.name: testGetLastValue017
   * @tc.desc: Get the last sorted key in the TreeSet instance. For example: treeSet.getLastValue().
   */   
  it("testGetLastValue017", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    let res = treeSet.getLastValue();
    expect(res).assertEqual(2);
  });
                              
  /**
   * @tc.name: testGetLastValue018
   * @tc.desc: Get the last sorted key in the TreeSet instance. For example: treeSet.getLastValue().
   */   
  it("testGetLastValue018", 0, function () {
    let treeSet = new TreeSet();
    let res = treeSet.getLastValue();
    expect(res).assertEqual(undefined);
  });
                              
  /**
   * @tc.name: testGetLowerValue019
   * @tc.desc: Get a value that is a little lower than the specified value sort. 
   * For example: treeSet.getLowerValue(2).
   */   
  it("testGetLowerValue019", 0, function () {
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
   * @tc.name: testGetLowerValue020
   * @tc.desc: Get a value that is a little lower than the specified value sort. 
   * For example: treeSet.getLowerValue(2).
   */   
  it("testGetLowerValue020", 0, function () {
    let treeSet = new TreeSet();
    let res = treeSet.getLowerValue(2);
    expect(res).assertEqual(undefined);
  });
                              
  /**
   * @tc.name: testGetHigherValue021
   * @tc.desc: Get a value that is a little higher than the specified value sort. 
   * For example: treeSet.getHigherValue(3).
   */   
  it("testGetHigherValue021", 0, function () {
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
   * @tc.name: testGetHigherValue022
   * @tc.desc: Get a value that is a little higher than the specified value sort. 
   * For example: treeSet.getHigherValue(3).
   */   
  it("testGetHigherValue022", 0, function () {
    let treeSet = new TreeSet();
    let res = treeSet.getHigherValue(3);
    expect(res).assertEqual(undefined);
  });
                              
  /**
   * @tc.name: testPopFirst023
   * @tc.desc: Delete first value of sort. For example: treeSet.popFirst().
   */   
  it("testPopFirst023", 0, function () {
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
   * @tc.name: testPopFirst024
   * @tc.desc: Delete first value of sort. For example: treeSet.popFirst().
   */   
  it("testPopFirst024", 0, function () {
    let treeSet = new TreeSet();
    let res = treeSet.popFirst();
    expect(res).assertEqual(undefined);
  });
                              
  /**
   * @tc.name: testPopLast025
   * @tc.desc: Delete last value of sort. For example: treeSet.popLast().
   */   
  it("testPopLast025", 0, function () {
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
   * @tc.name: testPopLast026
   * @tc.desc: Delete last value of sort. For example: treeSet.popLast().
   */   
  it("testPopLast026", 0, function () {
    let treeSet = new TreeSet();
    let res = treeSet.popLast();
    expect(res).assertEqual(undefined);
  });
                              
  /**
   * @tc.name: testClear027
   * @tc.desc: Clear all elements of the TreeSet instance. For example: treeSet.clear().
   */   
  it("testClear027", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    treeSet.clear();
    let res = treeSet.length;
    expect(res).assertEqual(0);
  });
                              
  /**
   * @tc.name: testClear028
   * @tc.desc: Clear all elements of the TreeSet instance. For example: treeSet.clear().
   */   
  it("testClear028", 0, function () {
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
   * @tc.name: testIsEmpty029
   * @tc.desc: Determine whether the TreeSet instance is empty. For example: treeSet.isEmpty().
   */   
  it("testIsEmpty029", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add("a");
    let res1 = treeSet.isEmpty();
    expect(res1).assertEqual(false);
  });
                              
  /**
   * @tc.name: testIsEmpty030
   * @tc.desc: Determine whether the TreeSet instance is empty. For example: treeSet.isEmpty().
   */   
  it("testIsEmpty030", 0, function () {
    let treeSet = new TreeSet();
    let res2 = treeSet.isEmpty();
    expect(res2).assertEqual(true);
  });
                              
  /**
   * @tc.name: testRemove031
   * @tc.desc: Delete the specified value. For example: hashSet.remove("c").
   */   
  it("testRemove031", 0, function () {
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
   * @tc.name: testRemove032
   * @tc.desc: Delete the specified value. For example: hashSet.remove("c").
   */   
  it("testRemove032", 0, function () {
    let treeSet = new TreeSet();
    let res = treeSet.remove("c");
    expect(res).assertEqual(false);
  });
                              
  /**
   * @tc.name: testValues033
   * @tc.desc: Get a collection of all the values in the TreeSet. For example: treeSet.values().
   */   
  it("testValues033", 0, function () {
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
   * @tc.name: testForEach034
   * @tc.desc: Traverse the collection of all elements of the TreeSet instance.
   */   
  it("testForEach034", 0, function () {
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
   * @tc.name: testEntries035
   * @tc.desc: Get all key value pairs collection in TreeMap.
   */   
  it("testEntries035", 0, function () {
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
   * @tc.name: testIterator036
   * @tc.desc: Iterate over all elements of the TreeSet instance.
   * For example: for (let item of treeSet) {arr.push(item);}
   */   
  it("testIterator036", 0, function () {
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
   * @tc.name: testIterator037
   * @tc.desc: Iterate over all elements of the TreeSet instance. For example: treeSet[Symbol.iterator]().
   */   
  it("testIterator037", 0, function () {
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
   * @tc.name: testAdd038
   * @tc.desc: Add element to TreeSet instance. For example: treeSet.add.bind({}, "a")().
   */   
   it("testAdd038", 0, function () {
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
   * @tc.name: testClear039
   * @tc.desc: Clear all elements of the TreeSet instance. For example: treeSet.clear.bind({}, "a")().
   */ 
  it('testClear039', 0, function () {
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
   * @tc.name: testGetLowerValue040
   * @tc.desc: Get a value that is a little lower than the specified value sort. 
   * For example: treeSet.getLowerValue.bind({}, "a")().
   */  
  it('testGetLowerValue040', 0, function () {
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
   * @tc.name: testGetLowerValue041
   * @tc.desc: Get a value that is a little lower than the specified value sort. 
   * For example: treeSet.getLowerValue(null).
   */  
  it('testGetLowerValue041', 0, function () {
    let  treeSet = new TreeSet();
    try {
      treeSet.getLowerValue(null);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "key" must be not null. Received value is: null`);
    }
  });

  /**
   * @tc.name: testGetHigherValue042
   * @tc.desc: Get a value that is a little higher than the specified value sort. 
   * For example: treeSet.getHigherValue(null).
   */  
  it('testGetHigherValue042', 0, function () {
    let  treeSet = new TreeSet();
    try {
      treeSet.getHigherValue(null);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "key" must be not null. Received value is: null`);
    }
  });

  /**
   * @tc.name: testGetHigherValue043
   * @tc.desc: Get a value that is a little higher than the specified value sort. 
   * For example: treeSet.getHigherValue.bind({}, "a")().
   */  
  it('testGetHigherValue043', 0, function () {
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
   * @tc.name: testForEach044
   * @tc.desc: Traverse the collection of all elements of the TreeSet instance.
   * For example: treeSet.forEach.bind({}, "a")().
   */ 
  it('testForEach044', 0, function () {
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
   * @tc.name: testForEach045
   * @tc.desc: Traverse the collection of all elements of the TreeSet instance.
   * For example: treeSet.forEach(11).
   */ 
  it('testForEach045', 0, function () {
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
   * @tc.name: testValues046
   * @tc.desc: Get a collection of all the values in the TreeSet. For example: treeSet.values.bind({}, "a")().
   */ 
  it('testValues046', 0, function () {
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
});
}
