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
import PlainArray from "@ohos.util.PlainArray";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
export default function PlainArrayTest() {
describe("PlainArrayTest", function () {
              
  /**
   * @tc.name: testConstructor001
   * @tc.desc: Create an PlainArray instance. For example: let plainArray = new PlainArray().
   */
  it("testConstructor001", 0, function () {
    try {
      let plainArray = new PlainArray();
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200012);
      expect(err.message).assertEqual("The PlainArray's constructor cannot be directly invoked");
    }
  });
                
  /**
   * @tc.name: testAdd002
   * @tc.desc: Add a pair of key value pairs to the PlainArray. For example: plainArray.add(1, "A").
   */
  it("testAdd002", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "A");
    let res = plainArray.get(1);
    expect(res).assertEqual("A");
  });
                
  /**
   * @tc.name: testAdd003
   * @tc.desc: Add a pair of key value pairs to the PlainArray.
   */
  it("testAdd003", 0, function () {
    let plainArray = new PlainArray();
    let a = [1, 2, 3, 4];
    plainArray.add(2, a);
    let res = plainArray.get(2);
    expect(res).assertEqual(a);
  });
                
  /**
   * @tc.name: testAdd004
   * @tc.desc: Add a pair of key value pairs to the PlainArray.
   */
  it("testAdd004", 0, function () {
    let plainArray = new PlainArray();
    let c = {name: "lili", age: "13"};
    plainArray.add(1, c);
    let res = plainArray.get(1);
    expect(res).assertEqual(c);
  });
                
  /**
   * @tc.name: testAdd005
   * @tc.desc: Add a pair of key value pairs to the PlainArray.
   */
  it("testAdd005", 0, function () {
    let plainArray = new PlainArray();
    let c = false;
    plainArray.add(1, c);
    let res = plainArray.get(1);
    expect(res).assertEqual(false);
  });
                
  /**
   * @tc.name: testAdd006
   * @tc.desc: Add a pair of key value pairs to the PlainArray.
   */
  it("testAdd006", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, 3);
    let res = plainArray.get(1);
    expect(res).assertEqual(3);
  });
                
  /**
   * @tc.name: testGet007
   * @tc.desc: Get the corresponding value through the key. For example: plainArray.get(4).
   */
  it("testGet007", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    let res = plainArray.get(4);
    expect(res).assertEqual("D");
    res = plainArray.get(10);
    expect(res).assertEqual(undefined);
  });
                  
  /**
   * @tc.name: testLength008
   * @tc.desc: Get the number of key value pairs in the PlainArray instance. For example: plainArray.length.
   */
  it("testLength008", 0, function () {
    let plainArray = new PlainArray();
    let res = plainArray.length;
    expect(res).assertEqual(0);
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    res = plainArray.length;
    expect(res).assertEqual(5);
  });
                  
  /**
   * @tc.name: testClone009
   * @tc.desc: Clone an PlainArray instance. For example: plainArray.clone().
   */
  it("testClone009", 0, function () {
    let plainArray = new PlainArray();
    let clonePlainarray = plainArray.clone();
    let cloneLength = clonePlainarray.length;
    expect(cloneLength).assertEqual(0);
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    let res = plainArray.clone();
    let arr = [];
    res.forEach((value, index) => {
      arr.push(value);
    });
    let arr1 = ["A", "B", "C", "D", "E"];
    for (let i = 0; i < arr.length; i++) {
      expect(arr[i]).assertEqual(arr1[i]);
    }
  });
                  
  /**
   * @tc.name: testClear010
   * @tc.desc: Clear all key value pairs in PlainArray. For example: plainArray.clear().
   */
  it("testClear010", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    let res = plainArray.length;
    expect(res).assertEqual(5);
    plainArray.clear();
    let res1 = plainArray.length;
    expect(res1).assertEqual(0);
    plainArray.clear();
    let res2 = plainArray.length;
    expect(res2).assertEqual(0);
  });
                  
  /**
   * @tc.name: testHas011
   * @tc.desc: Check whether the PlainArray contains a specified element. For example: plainArray.has(6).
   */
  it("testHas011", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    let res = plainArray.has(6);
    expect(res).assertEqual(false);
    let res1 = plainArray.has(1);
    expect(res1).assertEqual(true);
  });
                  
  /**
   * @tc.name: testGetIndexOfKey012
   * @tc.desc: Find the index of the key value pair according to the corresponding key. 
   * If no key is specified, return -1.
   */
  it("testGetIndexOfKey012", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    let res = plainArray.getIndexOfKey(2);
    expect(res).assertEqual(1);
    res = plainArray.getIndexOfKey(12);
    expect(res).assertEqual(-1);
  });
                  
  /**
   * @tc.name: testGetIndexOfValue013
   * @tc.desc: Find the index of the key value pair according to the corresponding value. 
   * If no key is specified, return -1.
   */
  it("testGetIndexOfValue013", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    let res = plainArray.getIndexOfValue("A");
    expect(res).assertEqual(0);
    res = plainArray.getIndexOfValue("Z");
    expect(res).assertEqual(-1);
  });
                  
  /**
   * @tc.name: testIsEmpty014
   * @tc.desc: Determine whether the PlainArray instance is empty. For example: plainArray.isEmpty().
   */
  it("testIsEmpty014", 0, function () {
    let plainArray = new PlainArray();
    let result = plainArray.length;
    expect(result).assertEqual(0);
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    let res = plainArray.isEmpty();
    expect(res).assertEqual(false);
  });
                  
  /**
   * @tc.name: testGetKeyAt015
   * @tc.desc: Find the key of the key value pair according to the corresponding index. 
   * For example: plainArray.getKeyAt(2).
   */
  it("testGetKeyAt015", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    let res = plainArray.getKeyAt(2);
    expect(res).assertEqual(3);
  });
                  
  /**
   * @tc.name: testReMove016
   * @tc.desc: Delete key value pairs according to key. For example: plainArray.remove(2).
   */
  it("testReMove016", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    let res = plainArray.remove(2);
    expect(res).assertEqual("B");
    let value = plainArray.get(2);
    expect(value).assertEqual(undefined);
    res = plainArray.remove(12);
    expect(res).assertEqual(undefined);
  });
                  
  /**
   * @tc.name: testReMoveAt017
   * @tc.desc: Delete key value pairs according to index. For example: plainArray.removeAt(2).
   */
  it("testReMoveAt017", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    let res = plainArray.removeAt(2);
    expect(res).assertEqual("C");
    let value = plainArray.get(3);
    expect(value).assertEqual(undefined);
  });
                    
  /**
   * @tc.name: testReMoveRangeFrom018
   * @tc.desc: Deletes the specified number of elements from the specified starting index. 
   * For example: plainArray.removeRangeFrom(2, 2).
   */
  it("testReMoveRangeFrom018", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    plainArray.removeRangeFrom(2, 2);
    let keys = [1, 2, 5];
    let values = ["A", "B", "E"];
    for (let i = 0; i < keys.length; i++) {
      expect(values[i]).assertEqual(plainArray.get(keys[i]));
    }
    try {
      plainArray.removeRangeFrom(15, 5);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200001);
      expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 2. Received value is: 15`);
    }
    try {
      plainArray.removeRangeFrom(1, "a");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "size" must be small integer. Received value is: a`);
    }
  });
                    
  /**
   * @tc.name: testSetValueAt019
   * @tc.desc: Modify the value of the key value pair according to the corresponding index. 
   * For example: plainArray.setValueAt(2, "V").
   */
  it("testSetValueAt019", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    plainArray.setValueAt(2, "V");
    let keys = [1, 2, 3, 4, 5];
    let values = ["A", "B", "V", "D", "E"];
    for (let i = 0; i < keys.length; i++) {
      expect(values[i]).assertEqual(plainArray.get(keys[i]));
    }
    try {
      plainArray.setValueAt(-1, "X");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200001);
      expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: -1`);
    }
  });
                    
  /**
   * @tc.name: testToString020
   * @tc.desc: Use "," to splice the elements in the LightWeightMap instance into a string. 
   * For example: plainArray.toString().
   */
  it("testToString020", 0, function () {
    let plainArray = new PlainArray();
    let res1 = plainArray.toString();
    expect(res1).assertEqual("");
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    let res = plainArray.toString();
    expect(res).assertEqual("1:A,2:B,3:C");
  });
                    
  /**
   * @tc.name: testForEach021
   * @tc.desc: Traverse all key value pairs in the PlainArray instance.
   */
  it("testForEach021", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    let arr = [];
    plainArray.forEach((value, index) => {
      arr.push(value);
    });
    let arr1 = ["A", "B", "C", "D", "E"];
    for (let i = 0; i < arr1.length; i++) {
      expect(arr[i]).assertEqual(arr1[i]);
    }
  });
                    
  /**
   * @tc.name: testIterator022
   * @tc.desc: Iterate over all key value pairs in the PlainArray. 
   */
  it("testIterator022", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    let keys = [1, 2, 3, 4, 5];
    let values = ["A", "B", "C", "D", "E"];
    for (let i = 0; i < keys.length; i++) {
      expect(values[i]).assertEqual(plainArray.get(keys[i]));
    }
  });
                    
  /**
   * @tc.name: testGetValueAt023
   * @tc.desc: Get the value of the key value pair according to the corresponding index. 
   * For example: plainArray.getValueAt(2).
   */
  it("testGetValueAt023", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    let res = plainArray.getValueAt(2);
    expect(res).assertEqual("C");
  });
                    
  /**
   * @tc.name: testAdd024
   * @tc.desc: Add a pair of key value pairs to the PlainArray.For example: plainArray.add(1, 3.1).
   */
  it("testAdd024", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, 3.1);
    let res = plainArray.get(1);
    expect(res).assertEqual(3.1);
  });
                      
  /**
   * @tc.name: testAdd025
   * @tc.desc: Add a pair of key value pairs to the PlainArray.For example: plainArray.add(1, null).
   */
  it("testAdd025", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, null);
    let res = plainArray.get(1);
    expect(res).assertEqual(null);
  });
                      
  /**
   * @tc.name: testAdd026
   * @tc.desc: Add a pair of key value pairs to the PlainArray.For example: plainArray.add("a", null).
   */
  it("testAdd026", 0, function () {
    let plainArray = new PlainArray();
    try {
      let res = plainArray.add("a", null);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "key" must be small integer. Received value is: a`);
    }
  });
                      
  /**
   * @tc.name: testGet027
   * @tc.desc: Get the corresponding value through the key. For example: plainArray.get(8).
   */
  it("testGet027", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    let res = plainArray.get(8);
    expect(res).assertEqual(undefined);
  });
                      
  /**
   * @tc.name: testGetIndexOfKey028
   * @tc.desc: Find the index of the key value pair according to the corresponding key. 
   * If no key is specified, return -1.
   */
  it("testGetIndexOfKey028", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    let res = plainArray.getIndexOfKey(9);
    expect(res).assertEqual(-1);
  });
                      
  /**
   * @tc.name: testGetIndexOfValue029
   * @tc.desc: Find the index of the key value pair according to the corresponding value. 
   * If no key is specified, return -1.
   */
  it("testGetIndexOfValue029", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    let res = plainArray.getIndexOfValue("Asad");
    expect(res).assertEqual(-1);
  });
                      
  /**
   * @tc.name: testGetKeyAt030
   * @tc.desc: Find the key of the key value pair according to the corresponding index. 
   * For example: plainArray.getKeyAt(50).
   */
  it("testGetKeyAt030", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    let res = plainArray.getKeyAt(50);
    expect(res).assertEqual(undefined);
  });
                      
  /**
   * @tc.name: testGetValueAt031
   * @tc.desc: Find the value of the key value pair according to the corresponding index. 
   * For example: plainArray.getValueAt(50).
   */
  it("testGetValueAt031", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    try {
      plainArray.getValueAt(50);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200001);
      expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 50`);
    }
  });
                      
  /**
   * @tc.name: testRemove032
   * @tc.desc: Delete key value pairs according to key. For example: plainArray.remove(2).
   */
  it("testRemove032", 0, function () {
    let plainArray = new PlainArray();
    let res = plainArray.remove(2);
    expect(res).assertEqual(undefined);
  });
                      
  /**
   * @tc.name: testRemoveAt033
   * @tc.desc: Delete key value pairs according to index. For example: plainArray.removeAt("a").
   */
  it("testRemoveAt033", 0, function () {
    let plainArray = new PlainArray();
    try {
      let res = plainArray.removeAt("a");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "index" must be small integer. Received value is: a`);
    }
  });
                      
  /**
   * @tc.name: testReMoveRangeFrom034
   * @tc.desc: Deletes the specified number of elements from the specified starting index. 
   * For example: plainArray.removeRangeFrom(0, 5).
   */
  it("testReMoveRangeFrom034", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    plainArray.removeRangeFrom(0, 5);
    let res = plainArray.length;
    expect(res).assertEqual(0);
  });
                      
  /**
   * @tc.name: testSetValueAt035
   * @tc.desc: Modify the value of the key value pair according to the corresponding index. 
   * For example: plainArray.setValueAt(8, "V").
   */
  it("testSetValueAt035", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    try {
      plainArray.setValueAt(8, "V");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200001);
      expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 8`);
    }
  });
                        
  /**
   * @tc.name: testAdd036
   * @tc.desc: Add a pair of key value pairs to the PlainArray.
   */
  it("testAdd036", 0, function () {
    let plainArray = new PlainArray();
    for (let i = 0; i < 100; i++) {
      plainArray.add(i, i + 1);
    }
    let res = plainArray.get(1);
    let res1 = plainArray.length;
    expect(res).assertEqual(2);
    expect(res1).assertEqual(100);
  });
                        
  /**
   * @tc.name: testAdd037
   * @tc.desc: Add a pair of key value pairs to the PlainArray.
   */
  it("testAdd037", 0, function () {
    let plainArray = new PlainArray();
    for (let i = 0; i < 1000; i++) {
      plainArray.add(i, i + 1);
    }
    let res = plainArray.get(99);
    let res1 = plainArray.length;
    expect(res).assertEqual(100);
    expect(res1).assertEqual(1000);
  });
                        
  /**
   * @tc.name: testAdd038
   * @tc.desc: Add a pair of key value pairs to the PlainArray.
   */
  it("testAdd038", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(3, "a");
    plainArray.add(1, "b");
    plainArray.add(2, "c");
    plainArray.add(5, "d");
    plainArray.add(4, "e");
    let res = plainArray.get(2);
    expect(res).assertEqual("c");
  });
                        
  /**
   * @tc.name: testAdd039
   * @tc.desc: Add a pair of key value pairs to the PlainArray.
   */
  it("testAdd039", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "ABCd");
    plainArray.add(2, "~!@#$^&*()_+-*/=.?<>:;|{}[]");
    plainArray.add(3, null);
    plainArray.add(4, undefined);
    plainArray.add(5, []);
    plainArray.add(6, {});
    plainArray.add(7, true);
    plainArray.add(8, 1234);
    plainArray.add(9, 1.234);
    plainArray.add(10, -1234);
    let res = plainArray.get(2);
    expect(res).assertEqual("~!@#$^&*()_+-*/=.?<>:;|{}[]");
  });
                        
  /**
   * @tc.name: testAdd040
   * @tc.desc: Add a pair of key value pairs to the PlainArray.
   */
  it("testAdd040", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(-2, "b");
    try {
      plainArray.add("a", "c");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "key" must be small integer. Received value is: a`);
    }
    let res = plainArray.get(-2);
    expect(res).assertEqual("b");
  });
                        
  /**
   * @tc.name: testAdd041
   * @tc.desc: Add a pair of key value pairs to the PlainArray.
   */
  it("testAdd041", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, 1);
    plainArray.add(2, "b");
    plainArray.add(3, true);
    plainArray.add(4, [1, 2, 3, 4]);
    plainArray.add(5, { name: "lili", age: "13" });
    plainArray.add(6, undefined);
    plainArray.add(7, null);
    let res = plainArray.get(2);
    expect(res).assertEqual("b");
  });
                        
  /**
   * @tc.name: testIterator042
   * @tc.desc: Iterate over all key value pairs in the PlainArray. 
   */
  it("testIterator042", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    let iters = plainArray[Symbol.iterator]();
    let flag = true;
    for (let i = 0, len = plainArray.length; i < len; i++) {
      let entry = iters.next().value;
      let res = plainArray.get(entry[0]);
      if (res != entry[1]) {
        flag = false;
        break;
      }
    }
    expect(flag).assertEqual(true);
  });
                        
  /**
   * @tc.name: testAdd043
   * @tc.desc: Add a pair of key value pairs to the PlainArray. For example: plainArray.add(1.23, "a").
   */
  it("testAdd043", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(-2, "b");
    try {
      plainArray.add("b", "a");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "key" must be small integer. Received value is: b`);
    }
    let res = plainArray.get(-2);
    expect(res).assertEqual("b");
  });

  /**
   * @tc.name: testHas044
   * @tc.desc: Check whether the PlainArray contains a specified element. For example: plainArray.has("a").
   */
  it("testHas044", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    try {
      plainArray.has("a");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "key" must be small integer. Received value is: a`);
    }
  });

  /**
   * @tc.name: testGet045
   * @tc.desc: Get the corresponding value through the key. For example: plainArray.get("a").
   */
   it("testGet045", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    try {
      plainArray.get("a");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "key" must be small integer. Received value is: a`);
    }
  });

  /**
   * @tc.name: testGetIndexOfKey046
   * @tc.desc: Find the index of the key value pair according to the corresponding key. 
   * If no key is specified, return -1.
   */
  it("testGetIndexOfKey046", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    try {
      plainArray.getIndexOfKey("a");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "key" must be small integer. Received value is: a`);
    }
  });

  /**
   * @tc.name: testGetKeyAt047
   * @tc.desc: Find the key of the key value pair according to the corresponding index. 
   * For example: plainArray.getKeyAt("a").
   */
  it("testGetKeyAt047", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    try {
      plainArray.getKeyAt("a");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "index" must be small integer. Received value is: a`);
    }
  });

  /**
   * @tc.name: testReMoveAt048
   * @tc.desc: Delete key value pairs according to index. For example: plainArray.removeAt(12).
   */
  it("testReMoveAt048", 0, function () {
    let plainArray = new PlainArray();
    plainArray.add(1, "A");
    plainArray.add(2, "B");
    plainArray.add(3, "C");
    plainArray.add(4, "D");
    plainArray.add(5, "E");
    let res = plainArray.removeAt(12);
    expect(res).assertEqual(undefined);
  });
});
}
