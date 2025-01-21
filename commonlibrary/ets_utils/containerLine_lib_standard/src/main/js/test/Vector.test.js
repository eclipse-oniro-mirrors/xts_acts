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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
export default function VectorTest() {
describe("VectorTest", function () {
    
  /**
   * @tc.name: testConstructor001
   * @tc.desc: Create an Vector instance. For example: let vector = new Vector().
   */
  it("testConstructor001", 0, function () {
    try {
      let vector = new Vector();
    } catch (err) {
      expect(err.name).assertEqual("TypeError");
      expect(err.message).assertEqual("Cannot create new vector");
    }
  });
      
  /**
   * @tc.name: testAdd002
   * @tc.desc: Add a element to the end of the Vector instance. For example: vector.add("四").
   */
  it("testAdd002", 0, function () {
    let vector = new Vector();
    vector.add("四");
    let res = vector.getFirstElement();
    expect(res).assertEqual("四");
  });
      
  /**
   * @tc.name: testAdd003
   * @tc.desc: Add a element to the end of the Vector instance. For example: vector.add(4).
   */
  it("testAdd003", 0, function () {
    let vector = new Vector();
    vector.add(4);
    let res = vector.getFirstElement();
    expect(res).assertEqual(4);
  });
      
  /**
   * @tc.name: testAdd004
   * @tc.desc: Add a element to the end of the Vector instance. 
   * For example: let a = {name: "lala", age: "13岁"}; vector.add(a).
   */
  it("testAdd004", 0, function () {
    let vector = new Vector();
    let a = {name: "lala", age: "13岁"};
    vector.add(a);
    let res = vector.getFirstElement();
    expect(res).assertEqual(a);
  });
      
  /**
   * @tc.name: testAdd005
   * @tc.desc: Add a element to the end of the Vector instance. For example: let a = [1, 2, 3, 4]; vector.add(a).
   */
  it("testAdd005", 0, function () {
    let vector = new Vector();
    let a = [1, 2, 3, 4];
    vector.add(a);
    let res = vector.getFirstElement();
    expect(res).assertEqual(a);
  });

  /**
   * @tc.name: testInsert006
   * @tc.desc: Insert an element into the middle of the Vector instance. For example: vector.insert(8, 2).
   */
  it("testInsert006", 0, function () {
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
   * @tc.name: testInsert007
   * @tc.desc: Insert an element into the middle of the Vector instance. For example: vector.insert(-1, 2).
   */
  it("testInsert007", 0, function () {
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
   * @tc.name: testInsert008
   * @tc.desc: Insert an element into the middle of the Vector instance. For example: vector.insert(capacity, 2).
   */
  it("testInsert008", 0, function () {
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
   * @tc.name: testInsert009
   * @tc.desc: Insert an element into the middle of the Vector instance. For example: vector.insert(2, capacity + 1).
   */
  it("testInsert009", 0, function () {
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
   * @tc.name: testLength010
   * @tc.desc: Get the number of elements contained in the Vector instance. For example: vector.length.
   */
  it("testLength010", 0, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    vector.add("a");
    let res = vector.length;
    expect(res).assertEqual(4);
  });
    
  /**
   * @tc.name: testHas011
   * @tc.desc: Check whether the Vector contains a specified element. For example: vector.has(8).
   */
  it("testHas011", 0, function () {
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
   * @tc.name: testHas012
   * @tc.desc: Check whether the Vector contains a specified element. For example: vector.has("二").
   */
  it("testHas012", 0, function () {
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
   * @tc.name: testGet013
   * @tc.desc: Gets the element corresponding to the specified index. For example: vector.get(1).
   */
  it("testGet013", 0, function () {
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
   * @tc.name: testGet014
   * @tc.desc: Gets the element corresponding to the specified index. For example: vector.get(10).
   */
  it("testGet014", 0, function () {
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
   * @tc.name: testGetIndexOf015
   * @tc.desc: In the Vector instance, find the index of a specified element from front to back, 
   * and return the index found for the first time. If not found, return -1. For example: vector.getIndexOf(1).
   */
  it("testGetIndexOf015", 0, function () {
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
   * @tc.name: testGetFirstElement016
   * @tc.desc: Get the header element of the Vector instance. For example: vector.getFirstElement().
   */
  it("testGetFirstElement016", 0, function () {
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
   * @tc.name: testGetFirstElement017
   * @tc.desc: Get the header element of the Vector instance. For example: vector.getFirstElement().
   */
  it("testGetFirstElement017", 0, function () {
    let vector = new Vector();
    let res = vector.getFirstElement();
    expect(res).assertEqual(undefined);
  });
    
  /**
   * @tc.name: testSet018
   * @tc.desc: Modify the element corresponding to the specified index. For example: vector.set(1, "二").
   */
  it("testSet018", 0, function () {
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
   * @tc.name: testRemoveByIndex019
   * @tc.desc: In the Vector instance, delete the element based on its index. For example: vector.removeByIndex(2).
   */
  it("testRemoveByIndex019", 0, function () {
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
   * @tc.name: testRemove020
   * @tc.desc: Delete the specified element. For example: vector.remove("三").
   */
  it("testRemove020", 0, function () {
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
   * @tc.name: testRemove021
   * @tc.desc: Delete the specified element. For example: vector.remove(2).
   */
  it("testRemove021", 0, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    vector.add(1);
    vector.add("a");
    let res = vector.remove(2);
    expect(res).assertEqual(false);
  });
    
  /**
   * @tc.name: testGetLastElement022
   * @tc.desc: Get the end element of the Vector instance. For example: vector.getLastElement().
   */
  it("testGetLastElement022", 0, function () {
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
   * @tc.name: testGetLastElement023
   * @tc.desc: Get the end element of the Vector instance. For example: vector.getLastElement().
   */
  it("testGetLastElement023", 0, function () {
    let vector = new Vector();
    let res = vector.getLastElement();
    expect(res).assertEqual(undefined);
  });
    
  /**
   * @tc.name: testGetLastIndexOf024
   * @tc.desc: In the Vector instance, find the index of a specified element from back to front, 
   * and return the index found for the first time. If not found, return -1. For example: vector.getLastIndexOf(1).
   */
  it("testGetLastIndexOf024", 0, function () {
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
  it("testGetLastIndexFrom025", 0, function () {
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
  it("testGetIndexFrom026", 0, function () {
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
   * @tc.name: testRemoveByRange027
   * @tc.desc: Deletes elements from a specified range, including elements at the start position and 
   * elements at the end position. For example: vector.removeByRange(1, 3).
   */
  it("testRemoveByRange027", 0, function () {
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
   * @tc.name: testRemoveByRange028
   * @tc.desc: Deletes elements from a specified range, including elements at the start position and 
   * elements at the end position. For example: vector.removeByRange(3, 1).
   */
  it("testRemoveByRange028", 0, function () {
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
   * @tc.name: testRemoveByRange029
   * @tc.desc: Deletes elements from a specified range, including elements at the start position and 
   * elements at the end position. For example: vector.removeByRange(length + 1, 7).
   */
  it("testRemoveByRange029", 0, function () {
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
   * @tc.name: testRemoveByRange030
   * @tc.desc: Deletes elements from a specified range, including elements at the start position and 
   * elements at the end position. For example: vector.removeByRange(1, 7).
   */
  it("testRemoveByRange030", 0, function () {
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
   * @tc.name: testRemoveByRange031
   * @tc.desc: Deletes elements from a specified range, including elements at the start position and 
   * elements at the end position. For example: vector.removeByRange(0, capacity).
   */
  it("testRemoveByRange031", 0, function () {
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
   * @tc.name: testRemoveByRange032
   * @tc.desc: Deletes elements from a specified range, including elements at the start position and 
   * elements at the end position. For example: vector.removeByRange(-1, capacity).
   */
  it("testRemoveByRange032", 0, function () {
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
   * @tc.name: testRemoveByRange033
   * @tc.desc: Deletes elements from a specified range, including elements at the start position and 
   * elements at the end position. For example: vector.removeByRange(0, capacity + 1).
   */
  it("testRemoveByRange033", 0, function () {
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
   * @tc.name: testSetLength034
   * @tc.desc: Get the number of elements contained in the Vector instance. For example: vector.length.
   */
  it("testSetLength034", 0, function () {
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
   * @tc.name: testReplaceAllElements035
   * @tc.desc: Perform some operation on the elements in the Vector instance and return the Vector instance 
   * after the operation. For example: vector.replaceAllElements((item, index) => {return (item = 2 * item);}).
   */
  it("testReplaceAllElements035", 0, function () {
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
   * @tc.name: testForEach036
   * @tc.desc: Traversing elements in an Vector instance. 
   * For example: vector.forEach((item, index) => {arr.push(item);}).
   */
  it("testForEach036", 0, function () {
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
   * @tc.name: testForEach037
   * @tc.desc: Traversing elements in an Vector instance. 
   * For example: vector.forEach((item, index) => {arr.push(item);}).
   */
  it("testForEach037", 0, function () {
    let vector = new Vector();
    let arr = [];
    vector.forEach((item, index) => {
      arr.push(item);
    });
    let a = [4, 3, 1, 2, 14];
    expect(arr.length).assertEqual(0);
  });
      
  /**
   * @tc.name: testSubVector038
   * @tc.desc: Intercepts an element within the specified range, including the element with the 
   * starting index but not the element with the ending index. For example: vector.subVector(2, 4).
   */
  it("testSubVector038", 0, function () {
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
   * @tc.name: testSubVector039
   * @tc.desc: Intercepts an element within the specified range, including the element with the 
   * starting index but not the element with the ending index. For example: vector.subVector(4, 2).
   */
  it("testSubVector039", 0, function () {
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
   * @tc.name: testSubVector040
   * @tc.desc: Intercepts an element within the specified range, including the element with the 
   * starting index but not the element with the ending index. For example: vector.subVector(length + 1, length + 3).
   */
  it("testSubVector040", 0, function () {
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
   * @tc.name: testSubVector041
   * @tc.desc: Intercepts an element within the specified range, including the element with the 
   * starting index but not the element with the ending index. For example: vector.vector.subVector(1, length + 1).
   */
  it("testSubVector041", 0, function () {
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
   * @tc.name: testClear042
   * @tc.desc: Clear all elements in the Vector instance. For example: vector.clear().
   */
  it("testClear042", 0, function () {
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
   * @tc.name: testConvertToArray043
   * @tc.desc: Convert an Vector instance to an array. For example: vector.convertToArray().
   */
  it("testConvertToArray043", 0, function () {
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
   * @tc.name: testCopyToArray044
   * @tc.desc: Appends the number of elements of corresponding length to a specified array. 
   * For example: vector.copyToArray(arr1).
   */
  it("testCopyToArray044", 0, function () {
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
   * @tc.name: testToString045
   * @tc.desc: Use "," to splice the elements in the vector instance into a string. For example: vector.toString().
   */
  it("testToString045", 0, function () {
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
   * @tc.name: testClone046
   * @tc.desc: Clone an ArrayList instance. For example: vector.clone().
   */
  it("testClone046", 0, function () {
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
   * @tc.name: testGetCapacity047
   * @tc.desc: Get the capacity of Vector instance. For example: vector.getCapacity().
   */
  it("testGetCapacity047", 0, function () {
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
   * @tc.name: testGetCapacity048
   * @tc.desc: Get the capacity of Vector instance. For example: vector.getCapacity().
   */
  it("testGetCapacity048", 0, function () {
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
   * @tc.name: testIncreaseCapacityTo049
   * @tc.desc: Expand the Vector instance capacity to the specified value. For example: vector.increaseCapacityTo(30).
   */
  it("testIncreaseCapacityTo049", 0, function () {
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
   * @tc.name: testTrimToCurrentLength050
   * @tc.desc: Limit the Vector instance capacity to the length of the Vector instance. 
   * For example: vector.trimToCurrentLength().
   */
  it("testTrimToCurrentLength050", 0, function () {
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
   * @tc.name: testSetLength051
   * @tc.desc: Sets the length of the vector instance to the specified value. For example: vector.setLength(7).
   */
  it("testSetLength051", 0, function () {
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
   * @tc.name: testIterator052
   * @tc.desc: Iterate over all elements in the Vector instance. 
   * For example: for (let item of vector) {arr.push(item);}.
   */
  it("testIterator052", 0, function () {
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
   * @tc.name: testIteratorAndRemove053
   * @tc.desc: Iterate over all elements in the Vector instance.
   */
  it("testIteratorAndRemove053", 0, function () {
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
   * @tc.name: testIteratorAndRemove054
   * @tc.desc: Iterate over all elements in the Vector instance.
   */
  it("testIteratorAndRemove054", 0, function () {
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
   * @tc.name: testIterator055
   * @tc.desc: Iterate over all elements in the Vector instance. 
   * For example: for (let item of vector) {arr.push(item);}.
   */
  it("testIterator055", 0, function () {
    let vector = new Vector();
    let arr = [];
    for (let item of vector) {
      arr.push(item);
    }
    expect(arr.length).assertEqual(0);
  });
      
  /**
   * @tc.name: testSort056
   * @tc.desc: Arrange the elements in the Vector instance in descending order. 
   * For example: vector.sort((a, b) => a - b).
   */
  it("testSort056", 0, function () {
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
   * @tc.name: testIsEmpty057
   * @tc.desc: Determine whether the Vector instance is empty. For example: vector.isEmpty().
   */
  it("testIsEmpty057", 0, function () {
    let vector = new Vector();
    vector.add("四");
    let res = vector.isEmpty();
    expect(res).assertEqual(false);
  });
      
  /**
   * @tc.name: testisEmpty058
   * @tc.desc: Determine whether the Vector instance is empty. For example: vector.isEmpty().
   */
  it("testisEmpty058", 0, function () {
    let vector = new Vector();
    let res = vector.isEmpty();
    expect(res).assertEqual(true);
  });
      
  /**
   * @tc.name: testAdd060
   * @tc.desc: Add a element to the end of the Vector instance. 
   * For example: for (let i = 0; i < 100; i++) {let res3 = vector.add(i);}.
   */
  it("testAdd060", 0, function () {
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
   * @tc.name: testAdd061
   * @tc.desc: Add a element to the end of the Vector instance. For example: vector.add("%").
   */
  it("testAdd061", 0, function () {
    let vector = new Vector();
    vector.add("%");
    let res = vector.getFirstElement();
    expect(res).assertEqual("%");
  });
      
  /**
   * @tc.name: testAdd062
   * @tc.desc: Add a element to the end of the Vector instance. For example: vector.add(1.89).
   */
  it("testAdd062", 0, function () {
    let vector = new Vector();
    vector.add(1.89);
    let res = vector.getFirstElement();
    expect(res).assertEqual(1.89);
  });
      
  /**
   * @tc.name: testAdd063
   * @tc.desc: Add a element to the end of the Vector instance. For example: vector.add("").
   */
  it("testAdd063", 0, function () {
    let vector = new Vector();
    vector.add("");
    let res = vector.getFirstElement();
    expect(res).assertEqual("");
  });
      
  /**
   * @tc.name: testAdd064
   * @tc.desc: Add a element to the end of the Vector instance. For example: vector.add(true).
   */
  it("testAdd064", 0, function () {
    let vector = new Vector();
    vector.add(true);
    let res = vector.getFirstElement();
    expect(res).assertEqual(true);
  });
      
  /**
   * @tc.name: testGetIndexOf065
   * @tc.desc: In the Vector instance, find the index of a specified element from front to back, 
   * and return the index found for the first time. If not found, return -1. For example: vector.getIndexOf(23).
   */
  it("testGetIndexOf065", 0, function () {
    let vector = new Vector();
    vector.add(1);
    vector.add(2);
    vector.add(3);
    let res = vector.getIndexOf(23);
    expect(res).assertEqual(-1);
  });
      
  /**
   * @tc.name: testSet066
   * @tc.desc: Modify the element corresponding to the specified index. For example: vector.set(12, "二").
   */
  it("testSet066", 0, function () {
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
   * @tc.name: testRemoveByIndex067
   * @tc.desc: In the Vector instance, delete the element based on its index. For example: vector.removeByIndex(12).
   */
  it("testRemoveByIndex067", 0, function () {
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
   * @tc.name: testGetLastIndexOf068
   * @tc.desc: In the Vector instance, find the index of a specified element from back to front, 
   * and return the index found for the first time. If not found, return -1. For example: vector.getLastIndexOf("二").
   */
  it("testGetLastIndexOf068", 0, function () {
    let vector = new Vector();
    vector.add("四");
    vector.add("三");
    let res = vector.getLastIndexOf("二");
    expect(res).assertEqual(-1);
  });
        
  /**
   * @tc.name: testIterator069
   * @tc.desc: Iterate over all elements in the Vector instance. For example: Vector[Symbol.iterator]().
   */
  it("testIterator069", 0, function () {
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
