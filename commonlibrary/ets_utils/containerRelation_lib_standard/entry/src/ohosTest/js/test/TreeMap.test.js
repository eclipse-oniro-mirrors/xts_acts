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
import TreeMap from "@ohos.util.TreeMap";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
export default function TreeMapTest() {
describe("TreeMapTest", function () {
                          
  /**
   * @tc.name: testConstructor001
   * @tc.desc: Create an TreeMap instance. For example: let treeMap = new TreeMap().
   */
  it("testConstructor001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    try {
      let treeMap = new TreeMap();
      expect(treeMap != undefined).assertEqual(true);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200012);
      expect(err.message).assertEqual("The TreeMap's constructor cannot be directly invoked");
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TREEMAP_01000
   * @tc.name: testConstructor002
   * @tc.desc: Create an TreeMap instance and use Compare. For example: TreeMap((a, b) => {return a > b}).
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testConstructor002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    try {
      let treeMap = new TreeMap((a, b) => {return a > b});
      expect(treeMap != undefined).assertEqual(true);
      treeMap.set("a", 1);
      treeMap.set("c", 3);
      treeMap.set("d", 4);
      treeMap.set("b", 2);
      expect(treeMap.length).assertEqual(4);
      expect(treeMap.remove("a")).assertEqual(1);
      expect(treeMap.remove("b")).assertEqual(2);
      expect(treeMap.remove("c")).assertEqual(3);
      expect(treeMap.remove("d")).assertEqual(4);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200012);
      expect(err.message).assertEqual("The TreeMap's constructor cannot be directly invoked");
    }
  });

  /**
   * @tc.name: testSet002
   * @tc.desc: Add a pair of key value pairs to the TreeMap. For example: treeMap.set(0, "四").
   */
  it("testSet002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "四");
    let res = treeMap.get(0);
    expect(res).assertEqual("四");
  });
                            
  /**
   * @tc.name: testSet003
   * @tc.desc: Add a pair of key value pairs to the TreeMap. For example: treeMap.set(0, 8).
   */
  it("testSet003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, 8);
    let res = treeMap.get(0);
    expect(res).assertEqual(8);
  });
                            
  /**
   * @tc.name: testSet004
   * @tc.desc: Add a pair of key value pairs to the TreeMap.
   */
  it("testSet004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let treeMap = new TreeMap();
    let a = [1, 2, 3, 4];
    treeMap.set(0, a);
    let res = treeMap.get(0);
    expect(res).assertEqual(a);
  });
                            
  /**
   * @tc.name: testSet005
   * @tc.desc: Add a pair of key value pairs to the TreeMap.
   */
  it("testSet005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let treeMap = new TreeMap();
    let a = {name: "lala", age: "13"};
    treeMap.set(0, a);
    let res = treeMap.get(0);
    expect(res).assertEqual(a);
  });
                            
  /**
   * @tc.name: testSet006
   * @tc.desc: Add a pair of key value pairs to the TreeMap. For example: treeMap.set(2, "*").
   */
  it("testSet006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let treeMap = new TreeMap();
    treeMap.set(2, "*");
    let res = treeMap.get(2);
    expect(res).assertEqual("*");
  });
                            
  /**
   * @tc.name: testSet007
   * @tc.desc: Add a pair of key value pairs to the TreeMap. For example: treeMap.set(-2, 3.14).
   */
  it("testSet007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let treeMap = new TreeMap();
    treeMap.set(-2, 3.14);
    let res = treeMap.get(-2);
    expect(res).assertEqual(3.14);
  });
                            
  /**
   * @tc.name: testSet008
   * @tc.desc: Add a pair of key value pairs to the TreeMap. For example: treeMap.set(100, true).
   */
  it("testSet008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let treeMap = new TreeMap();
    treeMap.set(100, true);
    let res = treeMap.get(100);
    expect(res).assertEqual(true);
  });
                            
  /**
   * @tc.name: testSet009
   * @tc.desc: Add a pair of key value pairs to the TreeMap. For example: treeMap.set(100, true).
   */
  it("testSet009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let treeMap = new TreeMap();
    treeMap.set(100, "");
    let res = treeMap.get(100);
    expect(res).assertEqual("");
  });
                            
  /**
   * @tc.name: testSet010
   * @tc.desc: Add a pair of key value pairs to the TreeMap. For example: treeMap.set("a", "四").
   */
  it("testSet010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let treeMap = new TreeMap();
    treeMap.set("a", "四");
    let res = treeMap.get("a");
    expect(res).assertEqual("四");
  });
                            
  /**
   * @tc.name: testSet011
   * @tc.desc: Add a pair of key value pairs to the TreeMap.
   */
  it("testSet011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let treeMap = new TreeMap();
    for (let i = 0; i < 10000; i++) {
      treeMap.set(0, 8);
    }
    let res = treeMap.get(0);
    expect(res).assertEqual(8);
    expect(treeMap.length).assertEqual(1);
  });
                            
  /**
   * @tc.name: testHasKey012
   * @tc.desc: Determine whether the TreeMap contains the specified key. For example: treeMap.hasKey(1).
   */
  it("testHasKey012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    let res = treeMap.hasKey(1);
    expect(res).assertEqual(true);
    let res1 = treeMap.hasKey(6);
    expect(res1).assertEqual(false);
  });
                            
  /**
   * @tc.name: testHasValue013
   * @tc.desc: Determine whether the TreeMap contains the specified Value. For example: treeMap.hasValue("a").
   */
  it("testHasValue013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    let res = treeMap.hasValue("a");
    expect(res).assertEqual(true);
    let res1 = treeMap.hasValue("d");
    expect(res1).assertEqual(false);
  });
                            
  /**
   * @tc.name: testGet014
   * @tc.desc: Get the corresponding value through the key. For example: treeMap.get(1).
   */
  it("testGet014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    let res = treeMap.get(1);
    expect(res).assertEqual("b");
  });
                            
  /**
   * @tc.name: testGet015
   * @tc.desc: Get the corresponding value through the key. For example: treeMap.get(1).
   */
  it("testGet015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    let res = treeMap.get(1);
    expect(res).assertEqual(undefined);
  });
                            
  /**
   * @tc.name: testGet016
   * @tc.desc: Get the corresponding value through the key. For example: treeMap.get(0).
   */
  it("testGet016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.clear();
    expect(treeMap.length).assertEqual(0);
    let res = treeMap.get(0);
     expect(res).assertEqual(undefined);
  });
                            
  /**
   * @tc.name: testGetFirstKey017
   * @tc.desc: Get the key that ranks first in the TreeMap instance. For example: treeMap.getFirstKey().
   */
  it("testGetFirstKey017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    let res = treeMap.getFirstKey();
    expect(res).assertEqual(0);
  });
                            
  /**
   * @tc.name: testGetFirstKey018
   * @tc.desc: Get the key that ranks first in the TreeMap instance. For example: treeMap.getFirstKey().
   */
  it("testGetFirstKey018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    let res = treeMap.getFirstKey();
    expect(res).assertEqual(undefined);
  });
                            
  /**
   * @tc.name: testGetLastKey019
   * @tc.desc: Get the last sorted key in the TreeMap instance. For example: treeMap.getLastKey().
   */
  it("testGetLastKey019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    let res = treeMap.getLastKey();
    expect(res).assertEqual(2);
  });
                            
  /**
   * @tc.name: testGetLastKey020
   * @tc.desc: Get the last sorted key in the TreeMap instance. For example: treeMap.getLastKey().
   */
  it("testGetLastKey020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    let res = treeMap.getLastKey();
    expect(res).assertEqual(undefined);
  });
                            
  /**
   * @tc.name: testSetAll021
   * @tc.desc: Copy key value pairs from one HashMap to another. For example: treeMap.setAll(treeMap1).
   */
  it("testSetAll021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    let treeMap1 = new TreeMap();
    treeMap1.set(0, "a");
    treeMap1.set(1, "b");
    treeMap1.set(2, "c");
    treeMap.setAll(treeMap1);
    let res = treeMap.get(0);
    expect(res).assertEqual("a");
    let res1 = treeMap.get(1);
    expect(res1).assertEqual("b");
    let res2 = treeMap.get(2);
    expect(res2).assertEqual("c");
  });
                            
  /**
   * @tc.name: testRemove022
   * @tc.desc: Delete key value pairs according to key. For example: treeMap.remove(1).
   */
  it("testRemove022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    let res = treeMap.remove(1);
    expect(res).assertEqual("b");
  });
                            
  /**
   * @tc.name: testRemove023
   * @tc.desc: Delete key value pairs according to key. For example: treeMap.remove(1).
   */
  it("testRemove023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    let res = treeMap.remove(1);
    expect(res).assertEqual(undefined);
  });
                            
  /**
   * @tc.name: testClear024
   * @tc.desc: Clear all key value pairs in TreeMap. For example: treeMap.clear().
   */
  it("testClear024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.clear();
    let res = treeMap.length;
    expect(res).assertEqual(0);
  });
                            
  /**
   * @tc.name: testClear025
   * @tc.desc: Clear all key value pairs in TreeMap. For example: treeMap.clear().
   */
  it("testClear025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.clear();
    let res = treeMap.length;
    expect(res).assertEqual(0);
    treeMap.set(3, "d");
    let va = treeMap.get(3);
    expect(va).assertEqual("d");
  });
                            
  /**
   * @tc.name: testGetLowerKey026
   * @tc.desc: Get a key that is a little lower than the specified key sort. 
   * For example: treeMap.getLowerKey(2).
   */
  it("testGetLowerKey026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.set(3, "d");
    treeMap.set(4, "g");
    let res = treeMap.getLowerKey(2);
    expect(res).assertEqual(1);
  });
                            
  /**
   * @tc.name: testGetLowerKey027
   * @tc.desc: Get a key that is a little lower than the specified key sort. For example: treeMap.getLowerKey(2).
   */
  it("testGetLowerKey027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    let res = treeMap.getLowerKey(2);
    expect(res).assertEqual(undefined);
  });
                            
  /**
   * @tc.name: testGetHigherKey028
   * @tc.desc: Get a key that is a little higher than the specified key sort. For example: treeMap.getLowerKey(2).
   */
  it("testGetHigherKey028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.set(3, "d");
    treeMap.set(4, "g");
    let res = treeMap.getHigherKey(2);
    expect(res).assertEqual(3);
  });
                            
  /**
   * @tc.name: testGetHigherKey029
   * @tc.desc: Get a key that is a little higher than the specified key sort. For example: treeMap.getLowerKey(2).
   */
  it("testGetHigherKey029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    let res = treeMap.getHigherKey(2);
    expect(res).assertEqual(undefined);
  });
                            
  /**
   * @tc.name: testKeys030
   * @tc.desc: Get a collection of all the keys in the TreeMap. For example: treeMap.keys().
   */
  it("testKeys030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.set(3, "d");
    treeMap.set(4, "g");
    let res = treeMap.keys();
    expect(res.next().value).assertEqual(0);
    expect(res.next().value).assertEqual(1);
    expect(res.next().value).assertEqual(2);
    expect(res.next().value).assertEqual(3);
    expect(res.next().value).assertEqual(4);
  });
                            
  /**
   * @tc.name: testValues031
   * @tc.desc: Get a collection of all the values in the TreeMap. For example: treeMap.values().
   */
  it("testValues031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.set(3, "d");
    treeMap.set(4, "g");
    let res = treeMap.values();
    expect(res.next().value).assertEqual("a");
    expect(res.next().value).assertEqual("b");
    expect(res.next().value).assertEqual("c");
    expect(res.next().value).assertEqual("d");
    expect(res.next().value).assertEqual("g");
  });
                            
  /**
   * @tc.name: testReplace032
   * @tc.desc: Modify the corresponding value according to the specified key. For example: treeMap.replace(2, "B").
   */
  it("testReplace032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.set(3, "d");
    treeMap.set(4, "g");
    let res = treeMap.replace(2, "B");
    let res1 = treeMap.get(2);
    expect(res1).assertEqual("B");
  });
                            
  /**
   * @tc.name: testReplace033
   * @tc.desc: Modify the corresponding value according to the specified key. For example: treeMap.replace(2, "B").
   */
  it("testReplace033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    let res = treeMap.replace(2, "B");
    expect(res).assertEqual(false);
    let res1 = treeMap.get(2);
    expect(res1).assertEqual(undefined);
  });
                            
  /**
   * @tc.name: testLength034
   * @tc.desc: Get the number of key value pairs in the TreeMap instance. For example: treeMap.length.
   */
  it("testLength034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.set(3, "d");
    treeMap.set(4, "g");
    let res = treeMap.length;
    expect(res).assertEqual(5);
  });
                            
  /**
   * @tc.name: testLength035
   * @tc.desc: Get the number of key value pairs in the TreeMap instance. For example: treeMap.length.
   */
  it("testLength035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    let res = treeMap.length;
    expect(res).assertEqual(0);
  });
                            
  /**
   * @tc.name: testForEach036
   * @tc.desc: Traverse all key value pairs in the TreeMap instance.
   */
  it("testForEach036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.set(3, "d");
    treeMap.set(4, "g");
    let arr1 = [];
    let arr2 = [];
    treeMap.forEach((value, key) => {
      arr1.push(value);
    });
    treeMap.forEach((value, key) => {
      arr2.push(key);
    });
    let arr = ["a", "b", "c", "d", "g"];
    for (let i = 0; i < arr1.length; i++) {
      expect(arr[i]).assertEqual(arr1[i]);
    }
    let arr3 = [0, 1, 2, 3, 4];
    for (let i = 0; i < arr3.length; i++) {
      expect(arr3[i]).assertEqual(arr2[i]);
    }
  });
                            
  /**
   * @tc.name: testEntries037
   * @tc.desc: Get all key value pairs collection in TreeMap.
   */
  it("testEntries037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.set(3, "d");
    treeMap.set(4, "g");
    let entries = treeMap.entries();
    let flag = true;
    for (let i = 0, len = treeMap.length; i < len; i++) {
      let entry = entries.next().value;
      let res = treeMap.get(entry[0]);
      if (res != entry[1]) {
        flag = false;
        break;
      }
    }
    expect(flag).assertEqual(true);
  });
                            
  /**
   * @tc.name: testIterator038
   * @tc.desc: Traverse all key value pairs in the TreeMap instance.
   */
  it("testIterator038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.set(3, "d");
    treeMap.set(4, "g");
    let arr = ["0,a", "1,b", "2,c", "3,d", "4,g"];
    let iterArr = [];
    for (let [key, value] of treeMap) {
      iterArr.push(key + "," + value);
    }
    for (let i = 0; i < arr.length; i++) {
      expect(arr[i]).assertEqual(iterArr[i]);
    }
  });
                            
  /**
   * @tc.name: testIterator039
   * @tc.desc: Traverse all key value pairs in the TreeMap instance. For example: treeMap[Symbol.iterator]().
   */
  it("testIterator039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.set(3, "d");
    treeMap.set(4, "g");
    let iters = treeMap[Symbol.iterator]();
    let flag = true;
    for (let i = 0, len = treeMap.length; i < len; i++) {
      let entry = iters.next().value;
      let res = treeMap.get(entry[0]);
      if (res != entry[1]) {
        flag = false;
        break;
      }
    }
    expect(flag).assertEqual(true);
  });
                            
  /**
   * @tc.name: testIsEmpty040
   * @tc.desc: Determine whether the TreeMap instance is empty. For example: treeMap.isEmpty().
   */                                                                                              
  it("testIsEmpty040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.set(3, "d");
    treeMap.set(4, "g");
    let res = treeMap.isEmpty();
    expect(res).assertEqual(false);
    treeMap.clear();
    let res1 = treeMap.isEmpty();
    expect(res1).assertEqual(true);
  });

  /**
   * @tc.name: testSetAll041
   * @tc.desc: Copy key value pairs from one HashMap to another. For example: treeMap.setAll([1, 2, 3]).
   */
  it("testSetAll041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    try {
      treeMap.setAll([1, 2, 3]);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "map" must be TreeMap. Received value is: 1,2,3`);
    }
  });
});
}
