/*Pop
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
import Vector from "@ohos.util.Vector";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
export default function VectorTest() {
describe("VectorTest", function () {
    
  /**
   * @tc.name   testConstructor001
   * @tc.number testConstructor001
   * @tc.desc   Create an Vector instance. For example: let vector = new Vector().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testConstructor001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    try {
      let vector = new Vector();
    } catch (err) {
      expect(err.name).assertEqual("TypeError");
      expect(err.message).assertEqual("Cannot create new vector");
    }
  });
      
  /**
   * @tc.name   testAdd002
   * @tc.number testAdd002
   * @tc.desc   Add a element to the end of the Vector instance. For example: vector.add("四").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAdd002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let vector = new Vector();
    vector.add("四");
    let res = vector.getFirstElement();
    expect(res).assertEqual("四");
  });
      
  /**
   * @tc.name   testAdd003
   * @tc.number testAdd003
   * @tc.desc   Add a element to the end of the Vector instance. For example: vector.add(4).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAdd003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let vector = new Vector();
    vector.add(4);
    let res = vector.getFirstElement();
    expect(res).assertEqual(4);
  });
      
  /**
   * @tc.name   testAdd004
   * @tc.number testAdd004
   * @tc.desc   Add a element to the end of the Vector instance.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAdd004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let vector = new Vector();
    let a = {name: "lala", age: "13岁"};
    vector.add(a);
    let res = vector.getFirstElement();
    expect(res).assertEqual(a);
  });
      
  /**
   * @tc.name   testAdd005
   * @tc.number testAdd005
   * @tc.desc   Add a element to the end of the Vector instance. For example: let a = [1, 2, 3, 4]; vector.add(a).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAdd005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let vector = new Vector();
    let a = [1, 2, 3, 4];
    vector.add(a);
    let res = vector.getFirstElement();
    expect(res).assertEqual(a);
  });

  /**
   * @tc.name   testInsert006
   * @tc.number testInsert006
   * @tc.desc   Insert an element into the middle of the Vector instance. For example: vector.insert(8, 2).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testInsert006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    vector.add("a");
    vector.insert(8, 2);
    let res = vector.get(2);
    expect(res).assertEqual(8);
  });
  
  /**
   * @tc.name   testInsert007
   * @tc.number testInsert007
   * @tc.desc   Insert an element into the middle of the Vector instance. For example: vector.insert(-1, 2).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testInsert007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    vector.add("a");
    try {
      vector.insert(-1, 2);
    } catch (err) {
      expect(err.name).assertEqual("RangeError");
      expect(err.message).assertEqual("the index is out-of-bounds");
    }
  });
    
  /**
   * @tc.name   testInsert008
   * @tc.number testInsert008
   * @tc.desc   Insert an element into the middle of the Vector instance. For example: vector.insert(capacity, 2).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testInsert008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    vector.add("a");
    let capacity = vector.getCapacity();
    vector.insert(capacity, 2);
    let res = vector.get(2);
    expect(res).assertEqual(10);
  });
    
  /**
   * @tc.name   testInsert009
   * @tc.number testInsert009
   * @tc.desc   Insert an element into the middle of the Vector instance. For example: vector.insert(2, capacity + 1).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testInsert009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    vector.add("a");
    let capacity = vector.getCapacity();
    try {
      vector.insert(2, capacity + 1);
    } catch (err) {
      expect(err.name).assertEqual("RangeError");
      expect(err.message).assertEqual("the index is out-of-bounds");
    }
  });
    
  /**
   * @tc.name   testLength010
   * @tc.number testLength010
   * @tc.desc   Get the number of elements contained in the Vector instance. For example: vector.length.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testLength010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    vector.add("a");
    let res = vector.length;
    expect(res).assertEqual(4);
  });
    
  /**
   * @tc.name   testHas011
   * @tc.number testHas011
   * @tc.desc   Check whether the Vector contains a specified element. For example: vector.has(8).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testHas011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    vector.add("a");
    vector.insert(8, 2);
    let res = vector.has(8);
    expect(res).assertEqual(true);
  });
    
  /**
   * @tc.name   testHas012
   * @tc.number testHas012
   * @tc.desc   Check whether the Vector contains a specified element. For example: vector.has("二").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testHas012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    vector.add("a");
    vector.insert(8, 2);
    let res1 = vector.has("二");
    expect(res1).assertEqual(false);
  });
    
  /**
   * @tc.name   testGet013
   * @tc.number testGet013
   * @tc.desc   Gets the element corresponding to the specified index. For example: vector.get(1).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGet013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    vector.add("a");
    vector.insert(8, 2);
    let res1 = vector.get(1);
    expect(res1).assertEqual("三");
  });
    
  /**
   * @tc.name   testGet014
   * @tc.number testGet014
   * @tc.desc   Gets the element corresponding to the specified index. For example: vector.get(10).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGet014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    vector.add("a");
    vector.insert(8, 2);
    try {
      let res = vector.get(10);
    } catch (err) {
      expect(err.name).assertEqual("RangeError");
      expect(err.message).assertEqual("the index is out-of-bounds");
    }
  });
    
  /**
   * @tc.name   testGetIndexOf015
   * @tc.number testGetIndexOf015
   * @tc.desc   In the Vector instance, find the index of a specified element from front to back,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGetIndexOf015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let vector = new Vector();
    vector.add(1);
    vector.add("三");
    vector.add(1);
    vector.add("a");
    vector.insert(1, 2);
    let res1 = vector.getIndexOf(1);
    expect(res1).assertEqual(0);
  });
    
  /**
   * @tc.name   testGetFirstElement016
   * @tc.number testGetFirstElement016
   * @tc.desc   Get the header element of the Vector instance. For example: vector.getFirstElement().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGetFirstElement016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    vector.add("a");
    vector.insert(8, 2);
    let res = vector.getFirstElement();
    expect(res).assertEqual("四");
  });
    
  /**
   * @tc.name   testGetFirstElement017
   * @tc.number testGetFirstElement017
   * @tc.desc   Get the header element of the Vector instance. For example: vector.getFirstElement().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGetFirstElement017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let vector = new Vector();
    let res = vector.getFirstElement();
    expect(res).assertEqual(undefined);
  });
    
  /**
   * @tc.name   testSet018
   * @tc.number testSet018
   * @tc.desc   Modify the element corresponding to the specified index. For example: vector.set(1, "二").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testSet018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    vector.add("a");
    vector.insert(8, 2);
    vector.set(1, "二");
    let res = vector.get(1);
    expect(res).assertEqual("二");
  });
    
  /**
   * @tc.name   testRemoveByIndex019
   * @tc.number testRemoveByIndex019
   * @tc.desc   In the Vector instance, delete the element based on its index. For example: vector.removeByIndex(2).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testRemoveByIndex019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    vector.add("a");
    vector.removeByIndex(2);
    let res = vector.has(1);
    expect(res).assertEqual(false);
  });
    
  /**
   * @tc.name   testRemove020
   * @tc.number testRemove020
   * @tc.desc   Delete the specified element. For example: vector.remove("三").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testRemove020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    vector.add("a");
    vector.remove("三");
    let res = vector.has("三");
    expect(res).assertEqual(false);
  });
    
  /**
   * @tc.name   testRemove021
   * @tc.number testRemove021
   * @tc.desc   Delete the specified element. For example: vector.remove(2).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testRemove021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    vector.add("a");
    let res = vector.remove(2);
    expect(res).assertEqual(false);
  });
    
  /**
   * @tc.name   testGetLastElement022
   * @tc.number testGetLastElement022
   * @tc.desc   Get the end element of the Vector instance. For example: vector.getLastElement().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGetLastElement022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    vector.add("a");
    let res1 = vector.length;
    let res = vector.getLastElement();
    expect(res).assertEqual("a");
  });
    
  /**
   * @tc.name   testGetLastElement023
   * @tc.number testGetLastElement023
   * @tc.desc   Get the end element of the Vector instance. For example: vector.getLastElement().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGetLastElement023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let vector = new Vector();
    let res = vector.getLastElement();
    expect(res).assertEqual(undefined);
  });
    
  /**
   * @tc.name   testGetLastIndexOf024
   * @tc.number testGetLastIndexOf024
   * @tc.desc   In the Vector instance, find the index of a specified element from back to front,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGetLastIndexOf024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    vector.add("a");
    vector.add(1);
    vector.add("b");
    let res = vector.getLastIndexOf(1);
    expect(res).assertEqual(4);
  });
    
  /**
   * @tc.name: testGetLastIndexFrom025
   * In the vector instance, find the index of the specified element from back to front 
   * from the specified index position, and return the index found for the first time If not found, 
   * return -1.vector.getLastIndexFrom(1, 5).
   */
  /**
   * @tc.name   testGetLastIndexFrom025
   * @tc.number testGetLastIndexFrom025
   * @tc.desc   testGetLastIndexFrom025
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGetLastIndexFrom025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    vector.add("a");
    vector.add(1);
    vector.add("b");
    vector.add("c");
    vector.add(1);
    let res = vector.getLastIndexFrom(1, 5);
    expect(res).assertEqual(4);
  });
    
  /**
   * @tc.name: testGetIndexFrom026
   * In the vector instance, find the index of the specified element from front to back 
   * from the specified index position, and return the index found for the first time If not found, 
   * return -1.vector.getLastIndexFrom(1, 5).
   */
  /**
   * @tc.name   testGetIndexFrom026
   * @tc.number testGetIndexFrom026
   * @tc.desc   testGetIndexFrom026
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGetIndexFrom026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    vector.add("a");
    vector.add(1);
    vector.add("b");
    vector.add("c");
    vector.add(1);
    let res = vector.getIndexFrom(1, 5);
    expect(res).assertEqual(7);
  });
    
  /**
   * @tc.name   testRemoveByRange027
   * @tc.number testRemoveByRange027
   * @tc.desc   Deletes elements from a specified range, including elements at the start position and
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testRemoveByRange027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    vector.add("a");
    vector.add(1);
    vector.add("b");
    vector.add("c");
    vector.add(1);
    vector.removeByRange(1, 3);
    let arr = [];
    vector.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["四", "a", 1, "b", "c", 1];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
    
  /**
   * @tc.name   testRemoveByRange028
   * @tc.number testRemoveByRange028
   * @tc.desc   Deletes elements from a specified range, including elements at the start position and
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testRemoveByRange028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    vector.add("a");
    vector.add(1);
    vector.add("b");
    vector.add("c");
    vector.add(1);
    try {
      vector.removeByRange(3, 1);
    } catch (err) {
      expect(err.name).assertEqual("RangeError");
      expect(err.message).assertEqual("the fromIndex cannot be less than or equal to toIndex");
    }
  });
    
  /**
   * @tc.name   testRemoveByRange029
   * @tc.number testRemoveByRange029
   * @tc.desc   Deletes elements from a specified range, including elements at the start position and
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testRemoveByRange029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    let length = vector.length;
    try {
      vector.removeByRange(length + 1, 7);
    } catch (err) {
      expect(err.name).assertEqual("RangeError");
      expect(err.message).assertEqual("the fromIndex or the toIndex is out-of-bounds");
    }
  });
    
  /**
   * @tc.name   testRemoveByRange030
   * @tc.number testRemoveByRange030
   * @tc.desc   Deletes elements from a specified range, including elements at the start position and
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testRemoveByRange030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    let length = vector.length;
    try {
      vector.removeByRange(1, 7);
    } catch (err) {
      expect(err.name).assertEqual("RangeError");
      expect(err.message).assertEqual("the index is out-of-bounds");
    }
  });
    
  /**
   * @tc.name   testRemoveByRange031
   * @tc.number testRemoveByRange031
   * @tc.desc   Deletes elements from a specified range, including elements at the start position and
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testRemoveByRange031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    vector.add("a");
    vector.add(1);
    vector.add("b");
    vector.add("c");
    vector.add(1);
    let capacity = vector.getCapacity();
    vector.removeByRange(0, capacity);
    let arr = [];
    vector.forEach((item, index) => {
      arr.push(item);
    });
    expect(arr.length).assertEqual(0);
  });
    
  /**
   * @tc.name   testRemoveByRange032
   * @tc.number testRemoveByRange032
   * @tc.desc   Deletes elements from a specified range, including elements at the start position and
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testRemoveByRange032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    vector.add("a");
    vector.add(1);
    vector.add("b");
    vector.add("c");
    vector.add(1);
    let capacity = vector.getCapacity();
    try {
      vector.removeByRange(-1, capacity);
    } catch (err) {
      expect(err.name).assertEqual("RangeError");
      expect(err.message).assertEqual("the fromIndex or the toIndex is out-of-bounds");
    }
  });
    
  /**
   * @tc.name   testRemoveByRange033
   * @tc.number testRemoveByRange033
   * @tc.desc   Deletes elements from a specified range, including elements at the start position and
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testRemoveByRange033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    vector.add("a");
    vector.add(1);
    vector.add("b");
    vector.add("c");
    vector.add(1);
    let capacity = vector.getCapacity();
    vector.removeByRange(0, capacity + 1);
    let length = vector.length;
    expect(length).assertEqual(0);
  });
    
  /**
   * @tc.name   testSetLength034
   * @tc.number testSetLength034
   * @tc.desc   Get the number of elements contained in the Vector instance. For example: vector.length.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSetLength034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    vector.add("a");
    vector.add(1);
    vector.add("b");
    vector.add("c");
    vector.add(1);
    vector.setLength(5);
    let res1 = vector.length;
    expect(res1).assertEqual(5);
  });
      
  /**
   * @tc.name   testReplaceAllElements035
   * @tc.number testReplaceAllElements035
   * @tc.desc   Perform some operation on the elements in the Vector instance and return the Vector instance
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReplaceAllElements035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add(4);
    vector.add(3);
    vector.add(1);
    vector.add(2);
    vector.add(14);
    vector.replaceAllElements((item, index) => {
      return (item = 2 * item);
    });
    let arr = [];
    vector.forEach((item, index) => {
      arr.push(item);
    });
    let a = [8, 6, 2, 4, 28];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
      
  /**
   * @tc.name   testForEach036
   * @tc.number testForEach036
   * @tc.desc   Traversing elements in an Vector instance.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testForEach036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add(4);
    vector.add(3);
    vector.add(1);
    vector.add(2);
    vector.add(14);
    let arr = [];
    vector.forEach((item, index) => {
      arr.push(item);
    });
    let a = [4, 3, 1, 2, 14];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
      
  /**
   * @tc.name   testForEach037
   * @tc.number testForEach037
   * @tc.desc   Traversing elements in an Vector instance.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testForEach037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    let arr = [];
    vector.forEach((item, index) => {
      arr.push(item);
    });
    let a = [4, 3, 1, 2, 14];
    expect(arr.length).assertEqual(0);
  });
      
  /**
   * @tc.name   testSubVector038
   * @tc.number testSubVector038
   * @tc.desc   Intercepts an element within the specified range, including the element with the
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSubVector038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add(4);
    vector.add(3);
    vector.add(1);
    vector.add(2);
    vector.add(14);
    let res = vector.subVector(2, 4);
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
   * @tc.name   testSubVector039
   * @tc.number testSubVector039
   * @tc.desc   Intercepts an element within the specified range, including the element with the
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSubVector039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add(4);
    vector.add(3);
    vector.add(1);
    vector.add(2);
    vector.add(14);
    try {
      let res = vector.subVector(4, 2);
    } catch (err) {
      expect(err.name).assertEqual("RangeError");
      expect(err.message).assertEqual("the fromIndex cannot be less than or equal to toIndex");
    }
  });
      
  /**
   * @tc.name   testSubVector040
   * @tc.number testSubVector040
   * @tc.desc   Intercepts an element within the specified range, including the element with the
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSubVector040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add(4);
    vector.add(3);
    vector.add(1);
    vector.add(2);
    vector.add(14);
    let length = vector.length;
    try {
      vector.subVector(length + 1, length + 3);
    } catch (err) {
      expect(err.name).assertEqual("RangeError");
      expect(err.message).assertEqual("the fromIndex or the toIndex is out-of-bounds");
    }
  });
      
  /**
   * @tc.name   testSubVector041
   * @tc.number testSubVector041
   * @tc.desc   Intercepts an element within the specified range, including the element with the
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSubVector041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add(4);
    vector.add(3);
    vector.add(1);
    vector.add(2);
    vector.add(14);
    let length = vector.length;
    try {
      let res = vector.subVector(1, length + 1);
    } catch (err) {
      expect(err.name).assertEqual("RangeError");
      expect(err.message).assertEqual("the fromIndex or the toIndex is out-of-bounds");
    }
  });
      
  /**
   * @tc.name   testClear042
   * @tc.number testClear042
   * @tc.desc   Clear all elements in the Vector instance. For example: vector.clear().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testClear042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add(4);
    vector.add(3);
    vector.add(1);
    vector.add(2);
    vector.add(14);
    vector.clear();
    let res = vector.length;
    expect(res).assertEqual(0);
  });
      
  /**
   * @tc.name   testConvertToArray043
   * @tc.number testConvertToArray043
   * @tc.desc   Convert an Vector instance to an array. For example: vector.convertToArray().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testConvertToArray043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add(4);
    vector.add(3);
    vector.add(1);
    vector.add(2);
    vector.add(14);
    let arr = vector.convertToArray();
    let a = [4, 3, 1, 2, 14];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
      
  /**
   * @tc.name   testCopyToArray044
   * @tc.number testCopyToArray044
   * @tc.desc   Appends the number of elements of corresponding length to a specified array.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testCopyToArray044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add(4);
    vector.add(3);
    vector.add(1);
    vector.add(2);
    vector.add(14);
    let arr1 = ["a", "b", "c"];
    vector.copyToArray(arr1);
    let a = [4, 3, 1, 2, 14];
    for (let i = 0; i < a.length; i++) {
      expect(arr1[i]).assertEqual(a[i]);
    }
  });
      
  /**
   * @tc.name   testToString045
   * @tc.number testToString045
   * @tc.desc   Use "," to splice the elements in the vector instance into a string. For example: vector.toString().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testToString045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add(4);
    vector.add(3);
    vector.add(1);
    vector.add(2);
    vector.add(14);
    let res = vector.toString();
    expect(res).assertEqual("4,3,1,2,14");
  });
      
  /**
   * @tc.name   testClone046
   * @tc.number testClone046
   * @tc.desc   Clone an ArrayList instance. For example: vector.clone().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testClone046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add(4);
    vector.add(3);
    vector.add(1);
    vector.add(2);
    vector.add(14);
    let res = vector.clone();
    let arr = [];
    res.forEach((item, index) => {
      arr.push(item);
    });
    let a = [4, 3, 1, 2, 14];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
      
  /**
   * @tc.name   testGetCapacity047
   * @tc.number testGetCapacity047
   * @tc.desc   Get the capacity of Vector instance. For example: vector.getCapacity().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testGetCapacity047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add(4);
    vector.add(3);
    vector.add(1);
    vector.add(2);
    vector.add(14);
    let res = vector.getCapacity();
    expect(res).assertEqual(10);
  });
      
  /**
   * @tc.name   testGetCapacity048
   * @tc.number testGetCapacity048
   * @tc.desc   Get the capacity of Vector instance. For example: vector.getCapacity().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testGetCapacity048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add(4);
    vector.add(3);
    vector.add(1);
    vector.add(2);
    vector.add(14);
    vector.add("a");
    vector.add("b");
    vector.add("c");
    vector.add("d");
    vector.add("v");
    let a = [1, 2, 3, 4];
    vector.add(a);
    let res = vector.getCapacity();
    expect(res).assertEqual(20);
  });
      
  /**
   * @tc.name   testIncreaseCapacityTo049
   * @tc.number testIncreaseCapacityTo049
   * @tc.desc   Expand the Vector instance capacity to the specified value. For example: vector.increaseCapacityTo(30).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIncreaseCapacityTo049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add(4);
    vector.add(3);
    vector.add(1);
    vector.add(2);
    vector.add(14);
    vector.increaseCapacityTo(30);
    let res = vector.getCapacity();
    expect(res).assertEqual(30);
  });
      
  /**
   * @tc.name   testTrimToCurrentLength050
   * @tc.number testTrimToCurrentLength050
   * @tc.desc   Limit the Vector instance capacity to the length of the Vector instance.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testTrimToCurrentLength050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add(4);
    vector.add(3);
    vector.add(1);
    vector.add(2);
    vector.add(14);
    vector.trimToCurrentLength();
    let res = vector.getCapacity();
    expect(res).assertEqual(5);
  });
      
  /**
   * @tc.name   testSetLength051
   * @tc.number testSetLength051
   * @tc.desc   Sets the length of the vector instance to the specified value. For example: vector.setLength(7).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSetLength051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add(4);
    vector.add(3);
    vector.add(1);
    vector.add(2);
    vector.add(14);
    vector.setLength(7);
    let res1 = vector.length;
    expect(res1).assertEqual(7);
  });
      
  /**
   * @tc.name   testIterator052
   * @tc.number testIterator052
   * @tc.desc   Iterate over all elements in the Vector instance.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIterator052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add(8);
    vector.add("一");
    vector.add("二");
    vector.add(5);
    let c = [1, 2, 3, 4];
    vector.add(c);
    vector.add(6);
    vector.add("三");
    vector.add("四");
    let arr = [];
    for (let item of vector) {
      arr.push(item);
    }
    let a = [8, "一", "二", 5, c, 6, "三", "四"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
      
  /**
   * @tc.name   testIteratorAndRemove053
   * @tc.number testIteratorAndRemove053
   * @tc.desc   Iterate over all elements in the Vector instance.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIteratorAndRemove053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add(8);
    vector.add("一");
    vector.add("二");
    vector.add(5);
    let c = [1, 2, 3, 4];
    vector.add(c);
    vector.add(6);
    vector.add(8);
    vector.add("三");
    vector.add("四");
    let arr = [];
    for (let item of vector) {
      if (item == 8) {
        vector.remove(8);
      }
    }
    for (let item of vector) {
      arr.push(item);
    }
    let a = ["一", "二", 5, c, 6, "三", "四"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
      
  /**
   * @tc.name   testIteratorAndRemove054
   * @tc.number testIteratorAndRemove054
   * @tc.desc   Iterate over all elements in the Vector instance.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIteratorAndRemove054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add(8);
    vector.add("一");
    vector.add("二");
    vector.add(5);
    let c = [1, 2, 3, 4];
    vector.add(c);
    vector.add(6);
    vector.add("三");
    vector.add("四");
    let arr = [];
    for (let item of vector) {
      if (item == 123) {
        vector.remove(123);
      } else {
        arr.push(item);
      }
    }
    let a = [8, "一", "二", 5, c, 6, "三", "四"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
      
  /**
   * @tc.name   testIterator055
   * @tc.number testIterator055
   * @tc.desc   Iterate over all elements in the Vector instance.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIterator055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    let arr = [];
    for (let item of vector) {
      arr.push(item);
    }
    expect(arr.length).assertEqual(0);
  });
      
  /**
   * @tc.name   testSort056
   * @tc.number testSort056
   * @tc.desc   Arrange the elements in the Vector instance in descending order.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSort056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add(4);
    vector.add(3);
    vector.add(1);
    vector.add(2);
    vector.add(14);
    vector.sort((a, b) => a - b);
    let arr = [];
    vector.forEach((item, index) => {
      arr.push(item);
    });
    let a = [1, 2, 3, 4, 14];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
      
  /**
   * @tc.name   testIsEmpty057
   * @tc.number testIsEmpty057
   * @tc.desc   Determine whether the Vector instance is empty. For example: vector.isEmpty().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIsEmpty057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add("四");
    let res = vector.isEmpty();
    expect(res).assertEqual(false);
  });
      
  /**
   * @tc.name   testisEmpty058
   * @tc.number testisEmpty058
   * @tc.desc   Determine whether the Vector instance is empty. For example: vector.isEmpty().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testisEmpty058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    let res = vector.isEmpty();
    expect(res).assertEqual(true);
  });
      
  /**
   * @tc.name   testAdd060
   * @tc.number testAdd060
   * @tc.desc   Add a element to the end of the Vector instance.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testAdd060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    for (let i = 0; i < 100; i++) {
      let res3 = vector.add(i);
    }
    let res = vector.getLastElement();
    let res1 = vector.length;
    expect(res).assertEqual(99);
    expect(res1).assertEqual(100);
  });
      
  /**
   * @tc.name   testAdd061
   * @tc.number testAdd061
   * @tc.desc   Add a element to the end of the Vector instance. For example: vector.add("%").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testAdd061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add("%");
    let res = vector.getFirstElement();
    expect(res).assertEqual("%");
  });
      
  /**
   * @tc.name   testAdd062
   * @tc.number testAdd062
   * @tc.desc   Add a element to the end of the Vector instance. For example: vector.add(1.89).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testAdd062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add(1.89);
    let res = vector.getFirstElement();
    expect(res).assertEqual(1.89);
  });
      
  /**
   * @tc.name   testAdd063
   * @tc.number testAdd063
   * @tc.desc   Add a element to the end of the Vector instance. For example: vector.add("").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testAdd063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add("");
    let res = vector.getFirstElement();
    expect(res).assertEqual("");
  });
      
  /**
   * @tc.name   testAdd064
   * @tc.number testAdd064
   * @tc.desc   Add a element to the end of the Vector instance. For example: vector.add(true).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testAdd064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add(true);
    let res = vector.getFirstElement();
    expect(res).assertEqual(true);
  });
      
  /**
   * @tc.name   testGetIndexOf065
   * @tc.number testGetIndexOf065
   * @tc.desc   In the Vector instance, find the index of a specified element from front to back,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testGetIndexOf065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add(1);
    vector.add(2);
    vector.add(3);
    let res = vector.getIndexOf(23);
    expect(res).assertEqual(-1);
  });
      
  /**
   * @tc.name   testSet066
   * @tc.number testSet066
   * @tc.desc   Modify the element corresponding to the specified index. For example: vector.set(12, "二").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSet066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    try {
      vector.set(12, "二");
    } catch (err) {
      expect(err.name).assertEqual("RangeError");
      expect(err.message).assertEqual("the index is out-of-bounds");
    }
  });
        
  /**
   * @tc.name   testRemoveByIndex067
   * @tc.number testRemoveByIndex067
   * @tc.desc   In the Vector instance, delete the element based on its index. For example: vector.removeByIndex(12).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testRemoveByIndex067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    try {
      vector.removeByIndex(12);
    } catch (err) {
      expect(err.name).assertEqual("RangeError");
      expect(err.message).assertEqual("the index is out-of-bounds");
    }
  });
        
  /**
   * @tc.name   testGetLastIndexOf068
   * @tc.number testGetLastIndexOf068
   * @tc.desc   In the Vector instance, find the index of a specified element from back to front,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testGetLastIndexOf068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    let res = vector.getLastIndexOf("二");
    expect(res).assertEqual(-1);
  });
        
  /**
   * @tc.name   testIterator069
   * @tc.number testIterator069
   * @tc.desc   Iterate over all elements in the Vector instance. For example: Vector[Symbol.iterator]().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIterator069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let vector = new Vector();
    vector.add(8);
    vector.add("一");
    vector.add("二");
    vector.add(5);
    let c = [1, 2, 3, 4];
    vector.add(c);
    vector.add(6);
    vector.add("三");
    vector.add("四");
    let arr = [];
    let itr = vector[Symbol.iterator]();
    let tmp = undefined;
    do {
      tmp = itr.next().value;
      arr.push(tmp);
    } while (tmp != undefined);
    let a = [8, "一", "二", 5, c, 6, "三", "四"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
});
}
