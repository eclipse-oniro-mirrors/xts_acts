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
import HashSet from "@ohos.util.HashSet";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
export default function HashSetTest() {
describe("HashSetTest", function () {
            
  /**
   * @tc.name: testConstructor001
   * @tc.desc: Create an HashSet instance. For example: let hashSet = new HashSet().
   */
  it("testConstructor001", 0, function () {
    try {
      let hashSet = new HashSet();
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200012);
      expect(err.message).assertEqual("The HashSet's constructor cannot be directly invoked");
    }
  });
              
  /**
   * @tc.name: testAdd001
   * @tc.desc: Add element to HashSet instance. For example: hashSet.add(1).
   */
  it("testAdd001", 0, function () {
    let hashSet = new HashSet();
    hashSet.add(1);
    let res = hashSet.has(1);
    expect(res).assertEqual(true);
  });
                
  /**
   * @tc.name: testAdd002
   * @tc.desc: Add element to HashSet instance. For example: hashSet.add("a").
   */
  it("testAdd002", 0, function () {
    let hashSet = new HashSet();
    hashSet.add("b");
    hashSet.add("c");
    hashSet.add("d");
    hashSet.add("a");
    hashSet.add("g");
    let res = hashSet.has("a");
    expect(res).assertEqual(true);
  });
                
  /**
   * @tc.name: testAdd003
   * @tc.desc: Add element to HashSet instance. For example: let c = [1, 2, 3]; hashSet.add(c).
   */
  it("testAdd003", 0, function () {
    let hashSet = new HashSet();
    let c = [1, 2, 3];
    hashSet.add(c);
    let res = hashSet.has(c);
    expect(res).assertEqual(true);
  });
                
  /**
   * @tc.name: testAdd004
   * @tc.desc: Add element to HashSet instance. For example: let c = {name: "lili", age: "13"}; hashSet.add(c).
   */
  it("testAdd004", 0, function () {
    let hashSet = new HashSet();
    let c = {name: "lili", age: "13"};
    hashSet.add(c);
    let res = hashSet.has(c);
    expect(res).assertEqual(true);
  });
                
  /**
   * @tc.name: testLength005
   * @tc.desc: Get the number of element in the HashSet instance. For example: hashSet.length.
   */
  it("testLength005", 0, function () {
    let hashSet = new HashSet();
    hashSet.add(1);
    hashSet.add(2);
    hashSet.add(3);
    hashSet.add(4);
    hashSet.add(5);
    let res = hashSet.length;
    expect(res).assertEqual(5);
  });
                
  /**
   * @tc.name: testHas006
   * @tc.desc: Determine whether the HashSet instance contains the specified element. For example: hashSet.has(1).
   */
  it("testHas006", 0, function () {
    let hashSet = new HashSet();
    hashSet.add(4);
    hashSet.add(1);
    hashSet.add(3);
    hashSet.add(2);
    hashSet.add(5);
    let res = hashSet.has(1);
    expect(res).assertEqual(true);
    let res1 = hashSet.has("A");
    expect(res1).assertEqual(false);
  });
                
  /**
   * @tc.name: testIsEmpty007
   * @tc.desc: Determine whether the HashSet instance is empty. For example: hashSet.isEmpty().
   */
  it("testIsEmpty007", 0, function () {
    let hashSet = new HashSet();
    hashSet.add(4);
    hashSet.add(1);
    hashSet.add(3);
    hashSet.add(2);
    hashSet.add(5);
    let res = hashSet.isEmpty();
    expect(res).assertEqual(false);
  });
                
  /**
   * @tc.name: testRemove008
   * @tc.desc: Delete the specified element. For example: hashSet.remove(1).
   */
  it("testRemove008", 0, function () {
    let hashSet = new HashSet();
    hashSet.add(4);
    hashSet.add(1);
    hashSet.add(3);
    hashSet.add(2);
    hashSet.add(5);
    let res = hashSet.remove(1);
    expect(res).assertEqual(true);
    let arr = [];
    hashSet.forEach((value, index) => {
      arr.push(value);
    });
    for (let i = 0; i < arr.length; i++) {
      let has = hashSet.has(arr[i]);
      expect(has).assertEqual(true);
    }
  });
                
  /**
   * @tc.name: testClear009
   * @tc.desc: Clear all elements of the HashSet instance. For example: hashSet.clear().
   */
  it("testClear009", 0, function () {
    let hashSet = new HashSet();
    hashSet.add(4);
    hashSet.add(1);
    hashSet.add(3);
    hashSet.add(2);
    hashSet.add(5);
    let res = hashSet.length;
    expect(res).assertEqual(5);
    hashSet.clear();
    let res1 = hashSet.length;
    expect(res1).assertEqual(0);
  });
                
  /**
   * @tc.name: testValues010
   * @tc.desc: Get a collection of all elements of a HashSet instance. For example: hashSet.values().
   */
  it("testValues010", 0, function () {
    let hashSet = new HashSet();
    hashSet.add("A");
    hashSet.add("B");
    hashSet.add("C");
    hashSet.add("D");
    hashSet.add("E");
    let res = hashSet.values();
    for (let i = 0; i < hashSet.length; i++) {
      let has = hashSet.has(res.next().value);
      expect(has).assertEqual(true);
    }
  });
                
  /**
   * @tc.name: testForEach011
   * @tc.desc: Traverse the collection of all elements of the HashSet instance.
   */
  it("testForEach011", 0, function () {
    let hashSet = new HashSet();
    hashSet.add(1);
    hashSet.add(2);
    hashSet.add(3);
    hashSet.add(4);
    hashSet.add(5);
    let arr = [];
    hashSet.forEach((value, index) => {
      arr.push(value);
    });
    for (let i = 0; i < arr.length; i++) {
      let has = hashSet.has(arr[i]);
      expect(has).assertEqual(true);
    }
  });
                
  /**
   * @tc.name: testIterator012
   * @tc.desc: Iterate over all elements of the HashSet instance. 
   * For example: for (let item of hashSet) {arr.push(item);}.
   */
  it("testIterator012", 0, function () {
    let hashSet = new HashSet();
    hashSet.add(1);
    hashSet.add(2);
    hashSet.add(3);
    hashSet.add(4);
    hashSet.add(5);
    let arr = [];
    for (let item of hashSet) {
      arr.push(item);
    }
    for (let i = 0; i < arr.length; i++) {
      let has = hashSet.has(arr[i]);
      expect(has).assertEqual(true);
    }
  });
                
  /**
   * @tc.name: testIterator013
   * @tc.desc: Iterate over all elements of the HashSet instance. 
   * For example: for (let item of hashSet) {arr.push(item);}.
   */
  it("testIterator013", 0, function () {
    let hashSet = new HashSet();
    hashSet.add("A");
    hashSet.add("B");
    hashSet.add("C");
    hashSet.add("D");
    hashSet.add("E");
    let arr = [];
    for (let item of hashSet) {
      arr.push(item);
    }
    for (let i = 0; i < arr.length; i++) {
      let has = hashSet.has(arr[i]);
      expect(has).assertEqual(true);
    }
  });
                
  /**
   * @tc.name: testEntries014
   * @tc.desc: Iterate over all elements of the HashSet instance. For example: hashSet.entries().
   */
  it("testEntries014", 0, function () {
    let hashSet = new HashSet();
    hashSet.add(1);
    hashSet.add(2);
    hashSet.add(3);
    hashSet.add(4);
    hashSet.add(5);
    let res = hashSet.entries();
    for (let i = 0; i < hashSet.length; i++) {
      let has = hashSet.has(res.next().value[1]);
      expect(has).assertEqual(true);
    }
  });
                            
  /**
   * @tc.name: testAdd015
   * @tc.desc: Add element to HashSet instance. For example: hashSet.add("").
   */
  it("testAdd015", 0, function () {
    let hashSet = new HashSet();
    hashSet.add("");
    let res = hashSet.has("");
    expect(res).assertEqual(true);
  });
                              
  /**
   * @tc.name: testAdd016
   * @tc.desc: Add element to HashSet instance. For example: hashSet.add("$").
   */
  it("testAdd016", 0, function () {
    let hashSet = new HashSet();
    hashSet.add("$");
    let res = hashSet.has("$");
    expect(res).assertEqual(true);
  });
                              
  /**
   * @tc.name: testAdd017
   * @tc.desc: Add element to HashSet instance. For example: hashSet.add(1.34).
   */
  it("testAdd017", 0, function () {
    let hashSet = new HashSet();
    hashSet.add(1.34);
    let res = hashSet.has(1.34);
    expect(res).assertEqual(true);
  });
                              
  /**
   * @tc.name: testAdd018
   * @tc.desc: Add element to HashSet instance. For example: hashSet.add(-1).
   */
  it("testAdd018", 0, function () {
    let hashSet = new HashSet();
    hashSet.add(-1);
    let res = hashSet.has(-1);
    expect(res).assertEqual(true);
  });
                              
  /**
   * @tc.name: testAdd019
   * @tc.desc: Add element to HashSet instance. For example: let a = {}; hashSet.add(a).
   */
  it("testAdd019", 0, function () {
    let hashSet = new HashSet();
    let a = {};
    hashSet.add(a);
    let res = hashSet.has(a);
    expect(res).assertEqual(true);
  });
                              
  /**
   * @tc.name: testAdd020
   * @tc.desc: Add element to HashSet instance.
   */
  it("testAdd020", 0, function () {
    let hashSet = new HashSet();
    for (let i = 0; i < 100; i++) {
      hashSet.add(i);
      let res = hashSet.has(i);
      expect(res).assertEqual(true);
    }
    let res1 = hashSet.length;
    expect(res1).assertEqual(100);
  });
                              
  /**
   * @tc.name: testIterator021
   * @tc.desc: Iterate over all elements of the HashSet instance. 
   */
  it("testIterator021", 0, function () {
    let hashSet = new HashSet();
    let i = 0;
    for (let item of hashSet) {
      expect(item).assertEqual(i);
      i++;
    }
  });
                              
  /**
   * @tc.name: testForEach022
   * @tc.desc: Traverse the collection of all elements of the HashSet instance.
   */
  it("testForEach022", 0, function () {
    let hashSet = new HashSet();
    let arr = [];
    hashSet.forEach((value, index) => {
      arr.push(value);
    });
    expect(arr.length).assertEqual(0);
  });
                              
  /**
   * @tc.name: testIsEmpty023
   * @tc.desc: Determine whether the HashSet instance is empty. For example: hashSet.isEmpty().
   */
  it("testIsEmpty023", 0, function () {
    let hashSet = new HashSet();
    hashSet.add(4);
    hashSet.add(1);
    hashSet.add(3);
    hashSet.add(2);
    hashSet.add(5);
    hashSet.clear();
    let res = hashSet.isEmpty();
    expect(res).assertEqual(true);
  });
                              
  /**
   * @tc.name:testHas024
   * @tc.desc: Determine whether the HashSet instance contains the specified element. For example: hashSet.has(1).
   */
  it("testHas024", 0, function () {
    let hashSet = new HashSet();
    let res = hashSet.has(1);
    expect(res).assertEqual(false);
  });
                              
  /**
   * @tc.name: testConstructor001
   * @tc.desc: Delete the specified element. For example: hashSet.remove(1).
   */
  it("testRemove025", 0, function () {
    let hashSet = new HashSet();
    let res = hashSet.remove(1);
    expect(res).assertEqual(false);
  });
                              
  /**
   * @tc.name: testClear026
   * @tc.desc: Clear all elements of the HashSet instance. For example: hashSet.clear().
   */
  it("testClear026", 0, function () {
    let hashSet = new HashSet();
    let res = hashSet.clear();
    expect(res).assertEqual(undefined);
  });
                              
  /**
   * @tc.name: testEntries027
   * @tc.desc: Iterate over all elements of the HashSet instance. For example: hashSet.entries().
   */
  it("testEntries027", 0, function () {
    let hashSet = new HashSet();
    let res = hashSet.entries();
    expect(res.next().value).assertEqual(undefined);
  });
                              
  /**
   * @tc.name: testIterator028
   * @tc.desc: Iterate over all elements of the HashSet instance.
   */
  it("testIterator028", 0, function () {
    let hashSet = new HashSet();
    for (let i = 0; i < 100; i++) {
      let text = hashSet.add(i);
    }
    let arr = [];
    for (let item of hashSet) {
      arr.push(Number.parseInt(item));
    }
    for (let i = 0; i < 100; i++) {
      let a = arr[i];
      let res = hashSet.has(a);
      expect(res).assertEqual(true);
    }
  });
                              
  /**
   * @tc.name: testForEach029
   * @tc.desc: Traverse the collection of all elements of the HashSet instance.
   */
  it("testForEach029", 0, function () {
    let hashSet = new HashSet();
    for (let i = 0; i < 100; i++) {
      hashSet.add(i);
    }
    let arr = [];
    hashSet.forEach((value, index) => {
      arr.push(value);
    });
    for (let i = 0; i < 100; i++) {
      let a = arr[i];
      let res = hashSet.has(a);
      expect(res).assertEqual(true);
    }
  });
                              
  /**
   * @tc.name: testAdd030
   * @tc.desc: Add element to HashSet instance. For example: hashSet.add(1).
   */
  it("testAdd030", 0, function () {
    let hashSet = new HashSet();
    hashSet.add(1);
    hashSet.add(1);
    let has = hashSet.has(1);
    let size = hashSet.length;
    expect(has).assertEqual(true);
    expect(size).assertEqual(1);
  });
                              
  /**
   * @tc.name: testIterator031
   * @tc.desc: Iterate over all elements of the HashSet instance. For example: hashSet[Symbol.iterator]().
   */
  it("testIterator031", 0, function () {
    let hashSet = new HashSet();
    hashSet.add(1);
    hashSet.add(2);
    hashSet.add(3);
    hashSet.add(4);
    hashSet.add(5);
    let res = hashSet[Symbol.iterator]();
    let temp = undefined;
    let arr = [];
    do {
      temp = res.next().value;
      arr.push(temp);
    } while (temp != undefined);
    arr.sort(function (a, b) {
      return a - b;
    });
    let arr1 = [1, 2, 3, 4, 5];
    for (let i = 0; i < arr.length; i++) {
      expect(arr[i]).assertEqual(arr1[i]);
    }
  });

  /**
   * @tc.name: testHas032
   * @tc.desc: Determine whether the HashSet instance contains the specified element. For example: hashSet.has.bind({}, "a")().
   */
  it("testHas032", 0, function () {
    let hashSet = new HashSet();
    hashSet.add(4);
    hashSet.add(1);
    hashSet.add(3);
    hashSet.add(2);
    hashSet.add(5);
    try {
      hashSet.has.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The has method cannot be bound`);
    }
  });

  /**
   * @tc.name: testAdd033
   * @tc.desc: Add element to HashSet instance. For example: hashSet.add.bind({}, "a")().
   */
  it("testAdd033", 0, function () {
    let hashSet = new HashSet();
    try {
      hashSet.add.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The add method cannot be bound`);
    }
  });

  /**
   * @tc.name: testIsEmpty034
   * @tc.desc: Determine whether the HashSet instance is empty. For example: hashSet.isEmpty.bind({}, "a")().
   */
  it('testIsEmpty034', 0, function () {
    let  hashSet = new HashSet();
    try {
      hashSet.isEmpty.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The isEmpty method cannot be bound`);
    }
  });

  /**
   * @tc.name: testForEach035
   * @tc.desc: Traverse the collection of all elements of the HashSet instance.
   * For example: hashSet.forEach.bind({}, "a")().
   */
  it('testForEach035', 0, function () {
    let  hashSet = new HashSet();
    try {
      hashSet.forEach.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The forEach method cannot be bound`);
    }
  });

  /**
   * @tc.name: testForEach036
   * @tc.desc: Traverse the collection of all elements of the HashSet instance.
   * For example: hashSet.forEach(11).
   */
  it('testForEach036', 0, function () {
    let  hashSet = new HashSet();
    try {
      hashSet.forEach(11);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "callbackfn" must be callable. Received value is: 11`);
    }
  });
});
}
