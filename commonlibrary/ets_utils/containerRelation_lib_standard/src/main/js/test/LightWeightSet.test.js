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
import LightWeightSet from "@ohos.util.LightWeightSet";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
export default function LightWeightSetTest() {
describe("LightWeightSetTest", function () {
              
  /**
   * @tc.name: testConstructor001
   * @tc.desc: Create an LightWeightSet instance. For example: let lightWeightSet = new LightWeightSet().
   */
  it("testConstructor001", 0, function () {
    try {
      let lightWeightSet = new LightWeightSet();
      expect(lightWeightSet != undefined).assertEqual(true);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200012);
      expect(err.message).assertEqual("The LightWeightSet's constructor cannot be directly invoked");
    }
  });
              
  /**
   * @tc.name: testAdd002
   * @tc.desc: Add element to LightWeightSet instance. For example: lightWeightSet.add(1).
   */
  it("testAdd002", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    let res = lightWeightSet.has(1);
    expect(res).assertEqual(true);
  });
              
  /**
   * @tc.name: testAdd003
   * @tc.desc: Add element to LightWeightSet instance. For example: lightWeightSet.add("a").
   */
  it("testAdd003", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add("a");
    let res = lightWeightSet.has("a");
    expect(res).assertEqual(true);
  });
              
  /**
   * @tc.name: testAdd004
   * @tc.desc: Add element to LightWeightSet instance. 
   * For example: let a = [1, 2, 3, 4]; lightWeightSet.add(a).
   */
  it("testAdd004", 0, function () {
    let lightWeightSet = new LightWeightSet();
    let a = [1, 2, 3, 4];
    lightWeightSet.add(a);
    let res = lightWeightSet.has(a);
    expect(res).assertEqual(true);
  });
              
  /**
   * @tc.name: testAdd005
   * @tc.desc: Add element to LightWeightSet instance. 
   * For example: let a = {name: "lili", age: "13"}; lightWeightSet.add(a).
   */
  it("testAdd005", 0, function () {
    let lightWeightSet = new LightWeightSet();
    let c = {name: "lili", age: "13"};
    lightWeightSet.add(c);
    let res = lightWeightSet.has(c);
    expect(res).assertEqual(true);
  });
              
  /**
   * @tc.name: testAdd006
   * @tc.desc: Add element to LightWeightSet instance. For example: let c = false; lightWeightSet.add(c).
   */
  it("testAdd006", 0, function () {
    let lightWeightSet = new LightWeightSet();
    let c = false;
    lightWeightSet.add(c);
    let res = lightWeightSet.has(c);
    expect(res).assertEqual(true);
  });
              
  /**
   * @tc.name: testLength007
   * @tc.desc: Get the number of element in the LightWeightSet instance. For example: lightWeightSet.length.
   */
  it("testLength007", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    lightWeightSet.add(4);
    lightWeightSet.add(5);
    let res = lightWeightSet.length;
    expect(res).assertEqual(5);
  });
              
  /**
   * @tc.name: testAddAll008
   * @tc.desc: Copy all element from one LightWeightSet to another.
   */
  it("testAddAll008", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    lightWeightSet.add(4);
    lightWeightSet.add(5);
    let lightWeightSet1 = new LightWeightSet();
    lightWeightSet1.add(6);
    lightWeightSet1.add(7);
    let res1 = lightWeightSet.addAll(lightWeightSet1);
    for (let item of lightWeightSet) {
      console.log("lightWeightSet-----" + item);
    }
    for (let item of lightWeightSet1) {
      console.log("lightWeightSet1-----" + item);
    }
    for (let i = 1; i < 8; i++) {
      expect(lightWeightSet.has(i)).assertEqual(true);
    }
    expect(res1).assertEqual(true);
  });
              
  /**
   * @tc.name: testHasAll009
   * @tc.desc: Judge whether a lightWeightSet contains all elements in another lightWeightSet.
   */
  it("testHasAll009", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add("a");
    lightWeightSet.add("b");
    lightWeightSet.add("c");
    lightWeightSet.add("d");
    lightWeightSet.add("e");
    let lightWeightSet1 = new LightWeightSet();
    lightWeightSet1.add("a");
    lightWeightSet1.add("d");
    let res = lightWeightSet.hasAll(lightWeightSet1);
    expect(res).assertEqual(true);
  });
              
  /**
   * @tc.name: testHasAll010
   * @tc.desc: Judge whether a lightWeightSet contains all elements in another lightWeightSet.
   */
  it("testHasAll010", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add("a");
    lightWeightSet.add("b");
    lightWeightSet.add("c");
    lightWeightSet.add("e");
    let lightWeightSet1 = new LightWeightSet();
    lightWeightSet1.add("a");
    lightWeightSet1.add("d");
    let res = lightWeightSet.hasAll(lightWeightSet1);
    expect(res).assertEqual(false);
  });
              
  /**
   * @tc.name: testHas011
   * @tc.desc: Judge whether a lightWeightSet contains all elements in another lightWeightSet.
   */
  it("testHas011", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add("a");
    lightWeightSet.add("b");
    lightWeightSet.add("c");
    lightWeightSet.add("d");
    lightWeightSet.add("e");
    let res = lightWeightSet.has("a");
    expect(res).assertEqual(true);
    let res1 = lightWeightSet.has(1);
    expect(res1).assertEqual(false);
  });
              
  /**
   * @tc.name: testEntries012
   * @tc.desc: Get all key value pairs collection in lightWeightSet.
   */
  it("testEntries012", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    lightWeightSet.add(4);
    lightWeightSet.add(5);
    let res = lightWeightSet.entries();
    expect(JSON.stringify(res.next().value)).assertEqual("[1,1]");
    expect(JSON.stringify(res.next().value)).assertEqual("[2,2]");
    expect(JSON.stringify(res.next().value)).assertEqual("[3,3]");
    expect(JSON.stringify(res.next().value)).assertEqual("[4,4]");
    expect(JSON.stringify(res.next().value)).assertEqual("[5,5]");
  });
              
  /**
   * @tc.name: testGetIndexOf013
   * @tc.desc: Get the index according to the specified element. For example: lightWeightSet.getIndexOf(2).
   */
  it("testGetIndexOf013", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    lightWeightSet.add(4);
    lightWeightSet.add(5);
    let res = lightWeightSet.getIndexOf(2);
    expect(res).assertEqual(1);
  });
              
  /**
   * @tc.name: testIsEmpty014
   * @tc.desc: Determine whether the lightWeightSet instance is empty. For example: lightWeightSet.isEmpty().
   */
  it("testIsEmpty014", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    lightWeightSet.add(4);
    lightWeightSet.add(5);
    let res = lightWeightSet.isEmpty();
    expect(res).assertEqual(false);
  });
              
  /**
   * @tc.name: testRemove015
   * @tc.desc: Delete elements according to key. For example: lightWeightMap.remove(1).
   */
  it("testRemove015", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    lightWeightSet.add(4);
    lightWeightSet.add(5);
    let res = lightWeightSet.remove(1);
    expect(res).assertEqual(1);
    let arr = [];
    lightWeightSet.forEach((value, index) => {
      arr.push(value);
    });
    let arr1 = [2, 3, 4, 5];
    for (let i = 0; i < arr.length; i++) {
      expect(arr1[i]).assertEqual(arr[i]);
    }
  });
              
  /**
   * @tc.name: testRemoveAt016
   * @tc.desc: Delete elements according to index. For example: lightWeightSet.removeAt(1).
   */
  it("testRemoveAt016", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    lightWeightSet.add(4);
    lightWeightSet.add(5);
    let res = lightWeightSet.removeAt(1);
    expect(res).assertEqual(true);
    let arr = [];
    lightWeightSet.forEach((value, index) => {
      arr.push(value);
    });
    let arr1 = [1, 3, 4, 5];
    for (let i = 0; i < arr.length; i++) {
      expect(arr1[i]).assertEqual(arr[i]);
    }
  });
              
  /**
   * @tc.name: testClear017
   * @tc.desc: Clear all elements in LightWeightSet. For example: lightWeightSet.clear().
   */
  it("testClear017", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    lightWeightSet.add(4);
    lightWeightSet.add(5);
    lightWeightSet.clear();
    let res = lightWeightSet.length;
    expect(res).assertEqual(0);
  });
              
  /**
   * @tc.name: testForEach018
   * @tc.desc: Traverse all elements in the LightWeightSet instance.
   */
  it("testForEach018", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    lightWeightSet.add(4);
    lightWeightSet.add(5);
    let arr = [];
    lightWeightSet.forEach((value, index) => {
      arr.push(value);
    });
    let arr1 = [1, 2, 3, 4, 5];
    for (let i = 0; i < arr1.length; i++) {
      expect(arr[i]).assertEqual(arr1[i]);
    }
  });
              
  /**
   * @tc.name: testToString019
   * @tc.desc: Use "," to splice the elements in the LightWeightSet instance into a string. 
   * For example: lightWeightSet.toString().
   */
  it("testToString019", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    let res = lightWeightSet.toString();
    expect(res).assertEqual("1,2,3");
  });
              
  /**
   * @tc.name: testToArray020
   * @tc.desc: Convert an lightWeightSet instance to an array. For example: lightWeightSet.toArray().
   */
  it("testToArray020", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    lightWeightSet.add(4);
    lightWeightSet.add(5);
    let res = lightWeightSet.toArray();
    let arr1 = [1, 2, 3, 4, 5];
    for (let i = 0; i < arr1.length; i++) {
      expect(res[i]).assertEqual(arr1[i]);
    }
  });
              
  /**
   * @tc.name: testGetValueAt021
   * @tc.desc:  Get the element according to the corresponding index. For example: lightWeightSet.getValueAt(1).
   */
  it("testGetValueAt021", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    lightWeightSet.add(4);
    lightWeightSet.add(5);
    let res = lightWeightSet.getValueAt(1);
    expect(res).assertEqual(2);
  });
              
  /**
   * @tc.name: testIterator022
   * @tc.desc: Iterate over all elements in the LightWeightSet.
   */
  it("testIterator022", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    lightWeightSet.add(4);
    lightWeightSet.add(5);
    let arr = [];
    for (let item of lightWeightSet) {
      let res = arr.push(item);
    }
    let arr1 = [1, 2, 3, 4, 5];
    for (let i = 0; i < arr1.length; i++) {
      expect(arr[i]).assertEqual(arr1[i]);
    }
  });
              
  /**
   * @tc.name: testValues023
   * @tc.desc: Get a collection of all the values in the LightWeightSet. For example: lightWeightSet.values().
   */
  it("testValues023", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    lightWeightSet.add(4);
    lightWeightSet.add(5);
    let res = lightWeightSet.values();
    expect(res.next().value).assertEqual(1);
    expect(res.next().value).assertEqual(2);
    expect(res.next().value).assertEqual(3);
    expect(res.next().value).assertEqual(4);
    expect(res.next().value).assertEqual(5);
  });
              
  /**
   * @tc.name: testAdd024
   * @tc.desc: Add element to LightWeightSet instance. For example: lightWeightSet.add(null).
   */
  it("testAdd024", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(null);
    let res = lightWeightSet.has(null);
    expect(res).assertEqual(true);
  });
              
  /**
   * @tc.name: testAdd025
   * @tc.desc: Add element to LightWeightSet instance. For example: lightWeightSet.add(1.23).
   */
  it("testAdd025", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1.23);
    let res1 = lightWeightSet.has(1.23);
    expect(res1).assertEqual(true);
  });
              
  /**
   * @tc.name: testHasAll026
   * @tc.desc: Judge whether a lightWeightSet contains all elements in another lightWeightSet.
   */
  it("testHasAll026", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    lightWeightSet.add(4);
    lightWeightSet.add(5);
    let lightWeightSet1 = new LightWeightSet();
    lightWeightSet1.add("a1");
    lightWeightSet1.add("d1");
    let res = lightWeightSet.hasAll(lightWeightSet1);
    expect(res).assertEqual(false);
  });
              
  /**
   * @tc.name: testHasAll027
   * @tc.desc: Judge whether a lightWeightSet contains all elements in another lightWeightSet.
   */
  it("testHasAll027", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    lightWeightSet.add(4);
    lightWeightSet.add(5);
    let lightWeightSet1 = new LightWeightSet();
    lightWeightSet1.add(1);
    lightWeightSet1.add("d");
    let res = lightWeightSet.hasAll(lightWeightSet1);
    expect(res).assertEqual(false);
  });
              
  /**
   * @tc.name: testRemove028
   * @tc.desc: Delete elements according to key. For example: lightWeightMap.remove(3).
   */
  it("testRemove028", 0, function () {
    let lightWeightSet = new LightWeightSet();
    let res = lightWeightSet.remove(3);
    expect(res).assertEqual(undefined);
  });
              
  /**
   * @tc.name: testRemoveAt029
   * @tc.desc: Delete elements according to index. For example: lightWeightSet.removeAt(1).
   */
  it("testRemoveAt029", 0, function () {
    let lightWeightSet = new LightWeightSet();
    let res = lightWeightSet.removeAt(1);
    expect(res).assertEqual(false);
  });
              
  /**
   * @tc.name: testIncreaseCapacityTo030
   * @tc.desc: Expand the LightWeightSet capacity to the specified value. 
   * For example: lightWeightSet.increaseCapacityTo(3).
   */
  it("testIncreaseCapacityTo030", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    lightWeightSet.add(4);
    lightWeightSet.add(5);
    try {
      lightWeightSet.increaseCapacityTo(3);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200001);
      expect(err.message).assertEqual(`The value of "minimumCapacity" is out of range. It must be > 8. Received value is: 3`);
    }
  });
              
  /**
   * @tc.name: testIncreaseCapacityTo031
   * @tc.desc: Expand the LightWeightSet capacity to the specified value. 
   * For example: lightWeightSet.increaseCapacityTo("qwe").
   */
  it("testIncreaseCapacityTo031", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    lightWeightSet.add(4);
    lightWeightSet.add(5);
    try {
      let res = lightWeightSet.increaseCapacityTo("qwe");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "minimumCapacity" must be number. Received value is: qwe`);
    }
  });
              
  /**
   * @tc.name: testRemoveAt032
   * @tc.desc: Delete elements according to index. For example: lightWeightSet.removeAt("a").
   */
  it("testRemoveAt032", 0, function () {
    let lightWeightSet = new LightWeightSet();
    try {
      let res = lightWeightSet.removeAt("a");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "index" must be number. Received value is: a`);
    }
  });
              
  /**
   * @tc.name: testIncreaseCapacityTo033
   * @tc.desc: Expand the LightWeightSet capacity to the specified value. 
   * For example: lightWeightSet.increaseCapacityTo(20).
   */
  it("testIncreaseCapacityTo033", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    lightWeightSet.add(4);
    lightWeightSet.add(5);
    let res = lightWeightSet.increaseCapacityTo(20);
    expect(res).assertEqual(undefined);
  });
              
  /**
   * @tc.name: testGetValueAt034
   * @tc.desc: Get the element according to the corresponding index. For example: lightWeightSet.getValueAt("a").
   */
  it("testGetValueAt034", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    lightWeightSet.add(4);
    lightWeightSet.add(5);
    try {
      let res = lightWeightSet.getValueAt("a");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "index" must be number. Received value is: a`);
    }
  });
              
  /**
   * @tc.name: testIsEmpty035
   * @tc.desc: Determine whether the lightWeightSet instance is empty. For example: lightWeightSet.isEmpty().
   */
  it("testIsEmpty035", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    lightWeightSet.add(4);
    lightWeightSet.add(5);
    lightWeightSet.clear();
    let res = lightWeightSet.isEmpty();
    expect(res).assertEqual(true);
  });
              
  /**
   * @tc.name: testAdd036
   * @tc.desc: Add element to LightWeightSet instance.
   */
  it("testAdd036", 0, function () {
    let lightWeightSet = new LightWeightSet();
    for (let i = 0; i < 10000; i++) {
      lightWeightSet.add(i);
    }
    let res = lightWeightSet.getValueAt(9999);
    let res1 = lightWeightSet.length;
    expect(res).assertEqual(9999);
    expect(res1).assertEqual(10000);
  });
              
  /**
   * @tc.name: testAdd037
   * @tc.desc: Add element to LightWeightSet instance. For example: lightWeightSet.add("").
   */
  it("testAdd037", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add("");
    let res = lightWeightSet.has("");
    expect(res).assertEqual(true);
  });
              
  /**
   * @tc.name: testAdd038
   * @tc.desc: Add element to LightWeightSet instance. For example: lightWeightSet.add("$").
   */
  it("testAdd038", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add("$");
    let res = lightWeightSet.has("$");
    expect(res).assertEqual(true);
  });
              
  /**
   * @tc.name: testClear039
   * @tc.desc: Clear all elements in LightWeightSet. For example: lightWeightSet.clear().
   */
  it("testClear039", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    lightWeightSet.add(4);
    lightWeightSet.add(5);
    let res = lightWeightSet.length;
    lightWeightSet.clear();
    let res1 = lightWeightSet.length;
    expect(res).assertEqual(5);
    expect(res1).assertEqual(0);
  });
              
  /**
   * @tc.name: testRemove040
   * @tc.desc: Delete elements according to key. For example: lightWeightMap.remove("A").
   */
  it("testRemove040", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    lightWeightSet.add(4);
    lightWeightSet.add(5);
    let res = lightWeightSet.remove("A");
    expect(res).assertEqual(undefined);
  });
              
  /**
   * @tc.name: testIterator41
   * @tc.desc: Iterate over all elements in the LightWeightSet.
   */
  it("testIterator41", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    lightWeightSet.add(4);
    lightWeightSet.add(5);
    let arr = [];
    let res = lightWeightSet[Symbol.iterator]();
    let temp = undefined;
    do {
      temp = res.next().value;
      arr.push(temp);
    } while (temp != undefined);
    let arr1 = [1, 2, 3, 4, 5];
    for (let i = 0; i < arr1.length; i++) {
      expect(arr[i]).assertEqual(arr1[i]);
    }
  });
              
  /**
   * @tc.name: testEqual42
   * @tc.desc: Compare lightweightmap and specified object for equality. For example: lightWeightSet.equal(obj).
   */
  it("testEqual42", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    let obj = [1,2,3];
    let res = lightWeightSet.equal(obj);
    expect(res).assertEqual(true);
  });
              
  /**
   * @tc.name: testEqual43
   * @tc.desc: Compare lightweightmap and specified object for equality. For example: lightWeightSet.equal(obj).
   */
  it("testEqual43", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    let obj = [1,2];
    let res = lightWeightSet.equal(obj);
    expect(res).assertEqual(false);
  });

  /**
   * @tc.name: testAddAll044
   * @tc.desc: Copy all element from one LightWeightSet to another.
   */
  it("testAddAll044", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    try {
      lightWeightSet.addAll([1, 2, 3]);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "set" must be LightWeightSet. Received value is: 1,2,3`);
    }
  });

  /**
   * @tc.name: testHasAll045
   * @tc.desc: Judge whether a lightWeightSet contains all elements in another lightWeightSet.
   */
  it("testHasAll045", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add("a");
    lightWeightSet.add("b");
    lightWeightSet.add("c");
    try {
      lightWeightSet.hasAll([1, 2, 3]);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "set" must be LightWeightSet. Received value is: 1,2,3`);
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_LIGHTWEIGHTSET_01000
   * @tc.name: testEntries046
   * @tc.desc: Iterate over all elements of the LightWeightSet instance. For example: LightWeightSet.entries().
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testEntries046", 0, function () {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1);
    lightWeightSet.add(2);
    lightWeightSet.add(3);
    lightWeightSet.add(4);
    lightWeightSet.add(5);
    let iter = lightWeightSet.entries();
    let temp = iter.next();
    while(!temp.done) {
      expect(temp.value[0]).assertEqual(temp.value[1]);
      temp = iter.next();
    }
  });
});
}
