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
import HashMap from "@ohos.util.HashMap";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
export default function HashMapTest() {
describe("HashMapTest", function () {
          
  /**
   * @tc.name   testConstructor001
   * @tc.number testConstructor001
   * @tc.desc   Create an HashMap instance. For example: let hashMap = new HashMap().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testConstructor001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    try {
      let hashMap = new HashMap();
      expect(hashMap != undefined).assertEqual(true);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200012);
      expect(err.message).assertEqual("The HashMap's constructor cannot be directly invoked");
    }
  });
      
  /**
   * @tc.name   testSet002
   * @tc.number testSet002
   * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set(1, "A").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testSet002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    let res = hashMap.get(1);
    expect(res).assertEqual("A");
  });
      
  /**
   * @tc.name   testSet003
   * @tc.number testSet003
   * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set(1, 2).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testSet003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, 2);
    let res = hashMap.get(1);
    expect(res).assertEqual(2);
  });
      
  /**
   * @tc.name   testSet004
   * @tc.number testSet004
   * @tc.desc   Add a pair of key value pairs to the HashMap. For example: let c = [1, 2, 3]; hashMap.set(1, c).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testSet004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let hashMap = new HashMap();
    let c = [1, 2, 3];
    hashMap.set(1, c);
    let res = hashMap.get(1);
    expect(res).assertEqual(c);
  });
      
  /**
   * @tc.name   testSet005
   * @tc.number testSet005
   * @tc.desc   Add a pair of key value pairs to the HashMap.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testSet005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let hashMap = new HashMap();
    let c = {name: "lili", age: "13"};
    hashMap.set(1, c);
    let res = hashMap.get(1);
    expect(res).assertEqual(c);
  });
      
  /**
   * @tc.name   testSet006
   * @tc.number testSet006
   * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set("a", "A").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testSet006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let hashMap = new HashMap();
    hashMap.set("a", "A");
    let res = hashMap.get("a");
    expect(res).assertEqual("A");
  });
      
  /**
   * @tc.name   testSet007
   * @tc.number testSet007
   * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set("", "A").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testSet007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let hashMap = new HashMap();
    hashMap.set("", "A");
    let res = hashMap.get("");
    expect(res).assertEqual("A");
  });
        
  /**
   * @tc.name   testSet008
   * @tc.number testSet008
   * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set("$", "A").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testSet008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let hashMap = new HashMap();
    hashMap.set("$", "A");
    let res = hashMap.get("$");
    expect(res).assertEqual("A");
  });
        
  /**
   * @tc.name   testSet009
   * @tc.number testSet009
   * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set(3.14, "A").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testSet009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let hashMap = new HashMap();
    hashMap.set(3.14, "A");
    let res = hashMap.get(3.14);
    expect(res).assertEqual("A");
  });
        
  /**
   * @tc.name   testSet010
   * @tc.number testSet010
   * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set(0.3, "A").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testSet010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let hashMap = new HashMap();
    hashMap.set(0.3, "A");
    let res = hashMap.get(0.3);
    expect(res).assertEqual("A");
  });
        
  /**
   * @tc.name   testSet011
   * @tc.number testSet011
   * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set(-1, "A").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testSet011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let hashMap = new HashMap();
    hashMap.set(-1, "A");
    let res = hashMap.get(-1);
    expect(res).assertEqual("A");
  });
        
  /**
   * @tc.name   testSet012
   * @tc.number testSet012
   * @tc.desc   Add a pair of key value pairs to the HashMap. For example: let a = {}; hashMap.set(a, "A").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testSet012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let hashMap = new HashMap();
    let a = {};
    hashMap.set(a, "A");
    let res = hashMap.get(a);
    expect(res).assertEqual("A");
  });
        
  /**
   * @tc.name   testSet013
   * @tc.number testSet013
   * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set(1, null).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testSet013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, null);
    let res = hashMap.get(1);
    expect(res).assertEqual(null);
  });
        
  /**
   * @tc.name   testSet014
   * @tc.number testSet014
   * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set(1, "$").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testSet014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "$");
    let res = hashMap.get(1);
    expect(res).assertEqual("$");
  });
        
  /**
   * @tc.name   testSet015
   * @tc.number testSet015
   * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set(1, "3.14").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testSet015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, 3.14);
    let res = hashMap.get(1);
    expect(res).assertEqual(3.14);
  });
        
  /**
   * @tc.name   testSet016
   * @tc.number testSet016
   * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set(1, -1).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testSet016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, -1);
    let res = hashMap.get(1);
    expect(res).assertEqual(-1);
  });
        
  /**
   * @tc.name   testSet017
   * @tc.number testSet017
   * @tc.desc   Add a pair of key value pairs to the HashMap. For example: let a = {}; hashMap.set(1, a).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testSet017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let hashMap = new HashMap();
    let a = {};
    hashMap.set(1, a);
    let res = hashMap.get(1);
    expect(res).assertEqual(a);
  });
        
  /**
   * @tc.name   testSet018
   * @tc.number testSet018
   * @tc.desc   Add a pair of key value pairs to the HashMap.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testSet018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let hashMap = new HashMap();
    for (let i = 0; i < 100; i++) {
      hashMap.set(1, i);
    }
    let res = hashMap.get(1);
    let res1 = hashMap.length;
    expect(res).assertEqual(99);
    expect(res1).assertEqual(1);
  });
        
  /**
   * @tc.name   testSet019
   * @tc.number testSet019
   * @tc.desc   Add a pair of key value pairs to the HashMap.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testSet019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let hashMap = new HashMap();
    for (let i = 0; i < 100; i++) {
      hashMap.set(i, 1);
      let res = hashMap.get(i);
      expect(res).assertEqual(1);
    }
    let res1 = hashMap.length;
    expect(res1).assertEqual(100);
  });
        
  /**
   * @tc.name   testLength020
   * @tc.number testLength020
   * @tc.desc   Get the number of key value pairs in the HashMap instance. For example: hashMap.length.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testLength020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let res = hashMap.length;
    expect(res).assertEqual(5);
  });
        
  /**
   * @tc.name   testHasKey021
   * @tc.number testHasKey021
   * @tc.desc   Determine whether the HashMap contains the specified key. For example: hashMap.hasKey(3).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testHasKey021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let res = hashMap.hasKey(3);
    expect(res).assertEqual(true);
    let res1 = hashMap.hasKey(8);
    expect(res1).assertEqual(false);
  });
        
  /**
   * @tc.name   testHasKey022
   * @tc.number testHasKey022
   * @tc.desc   Determine whether the HashMap contains the specified key. For example: hashMap.hasKey(8).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testHasKey022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    let res = hashMap.hasKey(8);
    expect(res).assertEqual(false);
  });
        
  /**
   * @tc.name   testHasValue023
   * @tc.number testHasValue023
   * @tc.desc   Determine whether the HashMap contains the specified value. For example: hashMap.hasValue("C").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testHasValue023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let res = hashMap.hasValue("C");
    expect(res).assertEqual(true);
    let res1 = hashMap.hasValue(8);
    expect(res1).assertEqual(false);
  });
        
  /**
   * @tc.name   testHasKey023
   * @tc.number testHasKey023
   * @tc.desc   Determine whether the HashMap contains the specified key. For example: hashMap.hasKey(8).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testHasKey023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    for (let i = 0; i < 10; i++) {
      hashMap.set(i, i)
    }
    let ss = Math.floor(Math.random()*10)
    let res = hashMap.hasKey(ss);
    expect(res).assertEqual(true);
  });
        
  /**
   * @tc.name   testHasValue024
   * @tc.number testHasValue024
   * @tc.desc   Determine whether the HashMap contains the specified value. For example: hashMap.hasValue(8).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testHasValue024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    let res = hashMap.hasValue(8);
    expect(res).assertEqual(false);
  });
        
  /**
   * @tc.name   testGet025
   * @tc.number testGet025
   * @tc.desc   Get the corresponding value through the key. For example: hashMap.get(3).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testGet025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let res = hashMap.get(3);
    expect(res).assertEqual("C");
  });
        
  /**
   * @tc.name   testGet026
   * @tc.number testGet026
   * @tc.desc   Get the corresponding value through the key. For example: hashMap.get(3).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testGet026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    let res = hashMap.get(3);
    expect(res).assertEqual(undefined);
  });
        
  /**
   * @tc.name   testSetAll027
   * @tc.number testSetAll027
   * @tc.desc   Copy key value pairs from one HashMap to another.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSetAll027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let hashMap1 = new HashMap();
    hashMap1.set(1, 1);
    hashMap1.set(2, 2);
    hashMap.setAll(hashMap1);
    let arr = [];
    for (let [key, value] of hashMap) {
      arr.push([key, value]);
    }
    arr.sort(function (a, b) {
      return a[0] - b[0];
    });

    for (let i = 0; i < arr.length; i++) {
      expect(arr[i][0]).assertEqual(i + 1);
      expect(arr[i][1]).assertEqual(hashMap.get(i + 1));
    }
  });
        
  /**
   * @tc.name   testSetAll028
   * @tc.number testSetAll028
   * @tc.desc   Copy key value pairs from one HashMap to another.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSetAll028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    let hashMap1 = new HashMap();
    hashMap1.set(1, 1);
    hashMap1.set(2, 2);
    hashMap.setAll(hashMap1);
    let arr = [];
    for (let [key, value] of hashMap) {
      arr.push([key, value]);
    }
    arr.sort(function (a, b) {
      return a[0] - b[0];
    });
    for (let i = 0; i < arr.length; i++) {
      expect(JSON.stringify(arr[i])).assertEqual(
        JSON.stringify([i + 1, hashMap.get(i + 1)])
      );
    }
  });
        
  /**
   * @tc.name   testRemove029
   * @tc.number testRemove029
   * @tc.desc   Delete key value pairs according to key. For example: hashMap.remove(3).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testRemove029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let res = hashMap.remove(3);
    expect(res).assertEqual("C");
    let res1 = hashMap.length;
    expect(res1).assertEqual(4);
  });
        
  /**
   * @tc.name   testRemove030
   * @tc.number testRemove030
   * @tc.desc   Delete key value pairs according to key. For example: hashMap.remove(3).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testRemove030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    let res = hashMap.remove(3);
    expect(res).assertEqual(undefined);
  });
        
  /**
   * @tc.name   testClear031
   * @tc.number testClear031
   * @tc.desc   Clear all key value pairs in HashMap. For example: hashMap.clear().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testClear031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let res = hashMap.length;
    expect(res).assertEqual(5);
    hashMap.clear();
    let res1 = hashMap.length;
    expect(res1).assertEqual(0);
  });
        
  /**
   * @tc.name   testClear032
   * @tc.number testClear032
   * @tc.desc   Clear all key value pairs in HashMap. For example: hashMap.clear().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testClear032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    hashMap.clear();
    let res = hashMap.length;
    expect(res).assertEqual(0);
  });
        
  /**
   * @tc.name   testKeys033
   * @tc.number testKeys033
   * @tc.desc   Get a collection of all the keys in the HashMap. For example: hashMap.keys().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testKeys033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let res = hashMap.keys();
    for (let i = 0; i < hashMap.length; i++) {
      let result = hashMap.hasKey(res.next().value);
      expect(result).assertEqual(true);
    }
  });
        
  /**
   * @tc.name   testValues034
   * @tc.number testValues034
   * @tc.desc   Get a collection of all the values in the HashMap. For example: hashMap.values().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testValues034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let res = hashMap.values();
    for (let i = 0; i < hashMap.length; i++) {
      let has = hashMap.hasValue(res.next().value);
      expect(has).assertEqual(true);
    }
  });
        
  /**
   * @tc.name   testReplace035
   * @tc.number testReplace035
   * @tc.desc   Modify the corresponding value according to the specified key. For example: hashMap.replace(2, "G").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReplace035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let res = hashMap.replace(2, "G");
    expect(res).assertEqual(true);
    expect(hashMap.get(2)).assertEqual("G");
  });
        
  /**
   * @tc.name   testReplace036
   * @tc.number testReplace036
   * @tc.desc   Modify the corresponding value according to the specified key. For example: hashMap.replace(2, "G").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReplace036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    let res = hashMap.replace(2, "G");
    expect(res).assertEqual(false);
  });
        
  /**
   * @tc.name   testForEach037
   * @tc.number testForEach037
   * @tc.desc   Traverse all key value pairs in the HashMap instance.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testForEach037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let vals = [];
    let keys = [];
    hashMap.forEach((value, key) => {
      keys.push(key);
      vals.push(value);
    });
    for (let i = 0; i < keys.length; i++) {
      let has = hashMap.hasKey(keys[i]);
      expect(has).assertEqual(true);
    }
    for (let i = 0; i < vals.length; i++) {
      let has = hashMap.hasValue(vals[i]);
      expect(has).assertEqual(true);
    }
  });
        
  /**
   * @tc.name   testForEach038
   * @tc.number testForEach038
   * @tc.desc   Traverse all key value pairs in the HashMap instance.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testForEach038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    let arr = [];
    hashMap.forEach((item, index) => {
      arr.push(item);
    });
    expect(arr.length).assertEqual(0);
  });
        
  /**
   * @tc.name   testIterator039
   * @tc.number testIterator039
   * @tc.desc   Iterate over all key value pairs in the HashMap.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIterator039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let arr = [];
    for (let [key, value] of hashMap) {
      arr.push([key, value]);
    }
    arr.sort(function (a, b) {
      return a[0] - b[0];
    });
    for (let i = 0; i < arr.length; i++) {
      expect(arr[i][0]).assertEqual(i + 1);
      expect(arr[i][1]).assertEqual(hashMap.get(i + 1));
    }
  });
        
  /**
   * @tc.name   testIterator040
   * @tc.number testIterator040
   * @tc.desc   Traverse all key value pairs in the HashMap instance.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIterator040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    let arr = [];
    for (let item of hashMap) {
      arr.push(item);
    }
    expect(arr.length).assertEqual(0);
  });
        
  /**
   * @tc.name   testEntries041
   * @tc.number testEntries041
   * @tc.desc   Get all key value pairs collection in HashMap.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testEntries041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let res = hashMap.entries();
    let arr = [];
    for (let i = 0; i < hashMap.length; i++) {
      let obj = res.next();
      arr.push([obj.value[0], obj.value[1]]);
    }
    arr.sort(function (a, b) {
      return a[0] - b[0];
    });
    for (let i = 0; i < arr.length; i++) {
      expect(arr[i][0]).assertEqual(i + 1);
      expect(arr[i][1]).assertEqual(hashMap.get(i + 1));
    }
  });
        
  /**
   * @tc.name   testEntries042
   * @tc.number testEntries042
   * @tc.desc   Get all key value pairs collection in HashMap.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testEntries042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    let res = hashMap.entries();
    expect(undefined).assertEqual(res.next().value);
  });
        
  /**
   * @tc.name   testIsEmpty043
   * @tc.number testIsEmpty043
   * @tc.desc   Determine whether the HashMap instance is empty. For example: hashMap.isEmpty().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIsEmpty043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let res = hashMap.length;
    let res1 = hashMap.isEmpty();
    expect(res).assertEqual(5);
    expect(res1).assertEqual(false);
  });
        
  /**
   * @tc.name   testIsEmpty044
   * @tc.number testIsEmpty044
   * @tc.desc   Determine whether the HashMap instance is empty. For example: hashMap.isEmpty().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIsEmpty044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    hashMap.clear();
    let res = hashMap.length;
    let res1 = hashMap.isEmpty();
    expect(res).assertEqual(0);
    expect(res1).assertEqual(true);
  });
        
  /**
   * @tc.name   testEntries045
   * @tc.number testEntries045
   * @tc.desc   Get all key value pairs collection in HashMap.For example: hashMap.entries().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testEntries045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    let res = hashMap.entries();
    expect(undefined).assertEqual(res.next().value);
  });
        
  /**
   * @tc.name   testIterator046
   * @tc.number testIterator046
   * @tc.desc   Iterate over all key value pairs in the HashMap. For example: hashMap[Symbol.iterator]().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIterator046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let arr = [];
    let iters = hashMap[Symbol.iterator]();
    let flag = true;
    for (let i = 0, len = hashMap.length; i < len; i++) {
      let entry = iters.next().value;
      let res = hashMap.get(entry[0]);
      if (res != entry[1]) {
        flag = false;
        break;
      }
    }
    expect(flag).assertEqual(true);
  });

  /**
   * @tc.name   testSet047
   * @tc.number testSet047
   * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set.bind({}, 1, "A")().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSet047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    try {
      hashMap.set.bind({}, 1, "A")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The set method cannot be bound`);
    }
  });

  /**
   * @tc.name   testSetAll048
   * @tc.number testSetAll048
   * @tc.desc   Copy key value pairs from one HashMap to another.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSetAll048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    try {
      hashMap.setAll([1, 2, 3]);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "map" must be HashMap. Received value is: 1,2,3`);
    }
  });

  /**
   * @tc.name   testSetAll049
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_HASHMAP_01002
   * @tc.desc   Copy key value pairs from one HashMap to another.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSetAll049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    hashMap.set(1, 1);
    hashMap.set(2, 2);
    let newHashmap = new HashMap();
    newHashmap.setAll(hashMap);
    expect(newHashmap.length).assertEqual(2);
    let vals = [];
    let keys = [];
    newHashmap.forEach((value, key) => {
    keys.push(key);
    vals.push(value);
    });
    for (let i = 0; i < keys.length; i++) {
      let has = newHashmap.hasKey(i+1);
      expect(has).assertEqual(true);
    }
    for (let i = 0; i < vals.length; i++) {
      let has = newHashmap.hasKey(i+1);
      expect(has).assertEqual(true);
    }
  })

  /**
   * @tc.name   testSet049
   * @tc.number testSet049
   * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set.bind({}, "a", "b")().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSet049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let hashMap = new HashMap();
    try {
      hashMap.set.bind({}, "a", "b")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The set method cannot be bound`);
    }
  });

  /**
   * @tc.name   testIsEmpty050
   * @tc.number testIsEmpty050
   * @tc.desc   Determine whether the HashMap instance is empty. For example: hashMap.isEmpty.bind({}, "a")().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testIsEmpty050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let  hashMap = new HashMap();
    try {
      hashMap.isEmpty.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The isEmpty method cannot be bound`);
    }
  });

  /**
   * @tc.name   testHasKey051
   * @tc.number testHasKey051
   * @tc.desc   Determine whether the HashMap contains the specified key. For example: hashMap.hasKey.bind({}, "a")().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testHasKey051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let  hashMap = new HashMap();
    try {
      hashMap.hasKey.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The hasKey method cannot be bound`);
    }
  });

  /**
   * @tc.name   testGet052
   * @tc.number testGet052
   * @tc.desc   Get the corresponding value through the key. For example: hashMap.get.bind({}, "a")().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testGet052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let  hashMap = new HashMap();
    try {
      hashMap.get.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The get method cannot be bound`);
    }
  });

  /**
   * @tc.name   testSet053
   * @tc.number testSet053
   * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set(undefined, 11).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testSet053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let  hashMap = new HashMap();
    try {
      hashMap.set(undefined, 11);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "key" must be Key of JS. Received value is: undefined`);
    }
  });

  /**
   * @tc.name   testRemove054
   * @tc.number testRemove054
   * @tc.desc   Delete key value pairs according to key. For example: hashMap.remove.bind({}, "a")().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testRemove054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let  hashMap = new HashMap();
    try {
      hashMap.remove.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The remove method cannot be bound`);
    }
  });

  /**
   * @tc.name   testForEach055
   * @tc.number testForEach055
   * @tc.desc   Traverse all key value pairs in the HashMap instance.For example: hashMap.forEach.bind({}, "a")().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testForEach055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let  hashMap = new HashMap();
    try {
      hashMap.forEach.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The forEach method cannot be bound`);
    }
  });

  /**
   * @tc.name   testForEach056
   * @tc.number testForEach056
   * @tc.desc   Traverse all key value pairs in the HashMap instance.For example: hashMap.forEach(11).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testForEach056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let  hashMap = new HashMap();
    try {
      hashMap.forEach(11);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "callbackfn" must be callable. Received value is: 11`);
    }
  });
});
}
