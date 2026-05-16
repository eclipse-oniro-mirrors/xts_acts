/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

export default function ArrayTest() {
  describe('ArrayTest', () => {
    /**
     * @tc.name   testConstructor0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_0100
     * @tc.desc   Test the function of the interface Constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testConstructor0001";
      try {
        let element0 = 'app';
        let obj = new Array(element0);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual(`["app"]`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testConstructor0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_0200
     * @tc.desc   Test the function of the interface Constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testConstructor0002";
      try {
        let element0 = 'app';
        let obj = Array(element0);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual(`["app"]`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testConstructor0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_0300
     * @tc.desc   Test the function of the interface Constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testConstructor0003";
      try {
        let element0 = 'app0';
        let element1 = 'app1';
        let obj = Array(element0, element1);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual(`["app0","app1"]`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testConstructor0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_0400
     * @tc.desc   Test the function of the interface Constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testConstructor0004";
      try {
        let element0 = 'app0';
        let element1 = 'app1';
        let obj = new Array(element0, element1);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual(`["app0","app1"]`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testFrom0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_0500
     * @tc.desc   Test the function of the interface From
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFrom0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testFrom0001";
      try {
        const set = new Set(["foo", "bar", "baz", "foo"]);
        let obj = Array.from(set);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual("[\"foo\",\"bar\",\"baz\"]");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testFrom0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_0600
     * @tc.desc   Test the function of the interface From
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFrom0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testFrom0002";
      try {
        let obj = Array.from('ABC');
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual("[\"A\",\"B\",\"C\"]");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testFrom0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_0700
     * @tc.desc   Test the function of the interface From
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFrom0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testFrom0003";
      try {
        const map = new Map([
          [1, 2],
          [2, 4],
          [4, 8],
        ]);
        let obj = Array.from(map);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual("[[1,2],[2,4],[4,8]]");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testIsArray0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_0800
     * @tc.desc   Test the function of the interface IsArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testIsArray0001";
      try {
        let result = Array.isArray([]);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testIsArray0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_0900
     * @tc.desc   Test the function of the interface IsArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsArray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testIsArray0002";
      try {
        let result = Array.isArray([1]);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testIsArray0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_1000
     * @tc.desc   Test the function of the interface IsArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsArray0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testIsArray0003";
      try {
        let result = Array.isArray(new Array());
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testIsArray0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_1100
     * @tc.desc   Test the function of the interface IsArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsArray0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testIsArray0004";
      try {
        let result = Array.isArray(new Array("a", "b", "c", "d"));
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testIsArray0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_1200
     * @tc.desc   Test the function of the interface IsArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsArray0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testIsArray0005";
      try {
        let result = Array.isArray(new Array(3));
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testIsArray0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_1300
     * @tc.desc   Test the function of the interface IsArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsArray0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testIsArray0006";
      try {
        let result = Array.isArray(Array);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testIsArray0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_1400
     * @tc.desc   Test the function of the interface IsArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsArray0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testIsArray0008";
      try {
        let result = Array.isArray({});
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testIsArray0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_1500
     * @tc.desc   Test the function of the interface IsArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsArray0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testIsArray0009";
      try {
        let result = Array.isArray(null);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testIsArray0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_1600
     * @tc.desc   Test the function of the interface IsArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsArray0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testIsArray0010";
      try {
        let result = Array.isArray(undefined);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testIsArray0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_1700
     * @tc.desc   Test the function of the interface IsArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsArray0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testIsArray0011";
      try {
        let result = Array.isArray(17);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testIsArray0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_1800
     * @tc.desc   Test the function of the interface IsArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsArray0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testIsArray0012";
      try {
        let result = Array.isArray("Array");
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testIsArray0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_1900
     * @tc.desc   Test the function of the interface IsArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsArray0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testIsArray0013";
      try {
        let result = Array.isArray(true);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testIsArray0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_2000
     * @tc.desc   Test the function of the interface IsArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIsArray0014";
      try {
        let result = Array.isArray(false);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testIsArray0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_2100
     * @tc.desc   Test the function of the interface IsArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIsArray0015";
      try {
        let result = Array.isArray(new Uint8Array(32));
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testIsArray0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_2200
     * @tc.desc   Test the function of the interface IsArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIsArray0016";
      try {
        let result = Array.isArray({
          __proto__: Array
        });
        console.log(`${TAG} result:` + result)

        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testOf0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_2300
     * @tc.desc   Test the function of the interface Of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testOf0001";
      try {
        let result = Array.of(1);
        expect(JSON.stringify(result)).assertEqual('[1]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testOf0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_2400
     * @tc.desc   Test the function of the interface Of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testOf0002";
      try {
        let result = Array.of(1, 2, 3);
        expect(JSON.stringify(result)).assertEqual('[1,2,3]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testOf0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_2500
     * @tc.desc   Test the function of the interface Of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testOf0003";
      try {
        let result = Array.of(undefined);
        expect(JSON.stringify(result)).assertEqual('[null]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testOf0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_2600
     * @tc.desc   Test the function of the interface Of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testOf0004";
      try {
        let result = Array.of(null);
        expect(JSON.stringify(result)).assertEqual('[null]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeConcat0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_2700
     * @tc.desc   Test the function of the interface PrototypeConcat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeConcat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeConcat0001";
      try {
        const letters1 = ["a", "b", "c"];
        const letters2 = ["D", "E", "F"];
        const alphaNumeric = letters1.concat(letters2);
        console.log(`${TAG} result:` + JSON.stringify(alphaNumeric));
        expect(JSON.stringify(alphaNumeric)).assertEqual('["a","b","c","D","E","F"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeConcat0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_2800
     * @tc.desc   Test the function of the interface PrototypeConcat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeConcat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeConcat0002";
      try {
        const letters1 = ["a", "b", "c"];
        const letters2 = [];
        const alphaNumeric = letters1.concat(letters2);
        console.log(`${TAG} result:` + JSON.stringify(alphaNumeric));
        expect(JSON.stringify(alphaNumeric)).assertEqual('["a","b","c"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeConcat0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_2900
     * @tc.desc   Test the function of the interface PrototypeConcat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeConcat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeConcat0003";
      try {
        const letters1 = ["a", "b", "c"];
        const letters2 = [''];
        const alphaNumeric = letters1.concat(letters2);
        console.log(`${TAG} result:` + JSON.stringify(alphaNumeric));
        expect(JSON.stringify(alphaNumeric)).assertEqual('["a","b","c",""]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeConcat0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_3000
     * @tc.desc   Test the function of the interface PrototypeConcat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeConcat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeConcat0004";
      try {
        const num1 = [1, 2, 3];
        const num2 = [4, 5, 6];
        const num3 = [7, 8, 9];
        const numbers = num1.concat(num2, num3);
        console.log(`${TAG} result:` + JSON.stringify(numbers));
        expect(JSON.stringify(numbers)).assertEqual('[1,2,3,4,5,6,7,8,9]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeConcat0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_3100
     * @tc.desc   Test the function of the interface PrototypeConcat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeConcat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeConcat0005";
      try {
        const letters = ["a", "b", "c"];
        const alphaNumeric = letters.concat('z', ['d', 'e']);
        console.log(`${TAG} result:` + JSON.stringify(alphaNumeric));
        expect(JSON.stringify(alphaNumeric)).assertEqual('["a","b","c","z","d","e"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeConcat0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_3200
     * @tc.desc   Test the function of the interface PrototypeConcat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeConcat0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeConcat0006";
      try {
        const num1 = [[1]];
        const num2 = [2, 3];
        const obj = num1.concat(num2);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[[1],2,3]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeConcat0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_3300
     * @tc.desc   Test the function of the interface PrototypeConcat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeConcat0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeConcat0007";
      try {
        const num1 = [1, , 3];
        const num2 = [4, 5];
        const obj = num1.concat(num2);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,null,3,4,5]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeConcat0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_3400
     * @tc.desc   Test the function of the interface PrototypeConcat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeConcat0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeConcat0008";
      try {
        const num1 = [1, 2];
        const num2 = [3, 4,];
        const obj = num1.concat(num2);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,2,3,4]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeCopyWithin0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_3500
     * @tc.desc   Test the function of the interface PrototypeCopyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeCopyWithin0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeCopyWithin0001";
      try {
        let arr1 = [1, 2, 3, 4, 5];
        const obj = arr1.copyWithin(-2, 1);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,2,3,2,3]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeCopyWithin0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_3600
     * @tc.desc   Test the function of the interface PrototypeCopyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeCopyWithin0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeCopyWithin0002";
      try {
        let arr1 = [1, 2, 3, 4, 5];
        const obj = arr1.copyWithin(0, 3);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[4,5,3,4,5]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeCopyWithin0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_3700
     * @tc.desc   Test the function of the interface PrototypeCopyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeCopyWithin0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeCopyWithin0003";
      try {
        let arr1 = [1, 2, 3, 4, 5];
        const obj = arr1.copyWithin(0, 3, 4);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[4,2,3,4,5]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeCopyWithin0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_3800
     * @tc.desc   Test the function of the interface PrototypeCopyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeCopyWithin0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeCopyWithin0004";
      try {
        let arr1 = [1, 2, 3, 4, 5];
        const obj = arr1.copyWithin(-2, -3, -1);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,2,3,3,4]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeFill0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_3900
     * @tc.desc   Test the function of the interface PrototypeFill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeFill0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFill0001";
      try {
        let arr = [1, 2, 3];
        let obj = arr.fill(4);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[4,4,4]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeFill0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_4000
     * @tc.desc   Test the function of the interface PrototypeFill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeFill0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFill0002";
      try {
        let arr = [1, 2, 3];
        let obj = arr.fill(4, 1);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,4,4]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeFill0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_4100
     * @tc.desc   Test the function of the interface PrototypeFill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeFill0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFill0003";
      try {
        let arr = [1, 2, 3];
        let obj = arr.fill(4, 1, 2);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,4,3]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeFill0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_4200
     * @tc.desc   Test the function of the interface PrototypeFill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeFill0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFill0004";
      try {
        let arr = [1, 2, 3];
        let obj = arr.fill(4, 1, 1);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,2,3]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeFill0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_4300
     * @tc.desc   Test the function of the interface PrototypeFill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeFill0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFill0005";
      try {
        let arr = [1, 2, 3];
        let obj = arr.fill(4, 3, 3);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,2,3]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeFill0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_4400
     * @tc.desc   Test the function of the interface PrototypeFill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeFill0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFill0006";
      try {
        let arr = [1, 2, 3];
        let obj = arr.fill(4, -3, -2);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[4,2,3]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeFill0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_4500
     * @tc.desc   Test the function of the interface PrototypeFill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeFill0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFill0007";
      try {
        let arr = [1, 2, 3];
        let obj = arr.fill(4, NaN, NaN);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,2,3]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeFill0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_4600
     * @tc.desc   Test the function of the interface PrototypeFill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeFill0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFill0008";
      try {
        let arr = [1, 2, 3];
        let obj = arr.fill(4, 3, 5);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,2,3]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeFill0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_4700
     * @tc.desc   Test the function of the interface PrototypeFill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeFill0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFill0009";
      try {
        let arr = [3];
        let obj = arr.fill(4);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[4]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeFill0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_4800
     * @tc.desc   Test the function of the interface PrototypeFill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeFill0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFill0010";
      try {
        let arr = [1, 2, 3];
        let obj = arr.fill(4, undefined, undefined);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[4,4,4]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeFind0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_4900
     * @tc.desc   Test the function of the interface PrototypeFind
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeFind0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFind0001";
      try {
        const array1 = [11, 12];
        const found = array1.find((element) => element > 10);
        console.log(`${TAG} result:` + JSON.stringify(found));
        expect(JSON.stringify(found)).assertEqual('11');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeFind0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_5000
     * @tc.desc   Test the function of the interface PrototypeFind
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeFind0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFind0002";
      try {
        const array1 = [10, 12, 14];
        const found = array1.find((element) => element > 10);
        console.log(`${TAG} result:` + JSON.stringify(found));
        expect(JSON.stringify(found)).assertEqual('12');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeFind0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_5100
     * @tc.desc   Test the function of the interface PrototypeFind
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeFind0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFind0003";
      try {
        const array1 = [10, 12, 14, 255];
        const found = array1.find((element) => element > 100);
        console.log(`${TAG} result:` + JSON.stringify(found));
        expect(JSON.stringify(found)).assertEqual('255');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeFlat0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_5200
     * @tc.desc   Test the function of the interface PrototypeFlat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeFlat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFlat0001";
      try {
        const arr1 = [0, 1, 2, [3, 4]];
        const found = arr1.flat();
        console.log(`${TAG} result:` + JSON.stringify(found));
        expect(JSON.stringify(found)).assertEqual('[0,1,2,3,4]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeFlat0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_5300
     * @tc.desc   Test the function of the interface PrototypeFlat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeFlat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFlat0002";
      try {
        const arr2 = [1, 2, [3, 4, [5, 6]]];
        arr2.flat();
        console.log(`${TAG} result:` + JSON.stringify(arr2.flat()));
        expect(JSON.stringify(arr2.flat())).assertEqual('[1,2,3,4,[5,6]]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeFlat0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_5400
     * @tc.desc   Test the function of the interface PrototypeFlat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeFlat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFlat0003";
      try {
        const arr3 = [1, 2, [3, 4, [5, 6]]];
        arr3.flat(2);
        console.log(`${TAG} result:` + JSON.stringify(arr3.flat(2)));
        expect(JSON.stringify(arr3.flat(2))).assertEqual('[1,2,3,4,5,6]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeFlat0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_5500
     * @tc.desc   Test the function of the interface PrototypeFlat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeFlat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFlat0004";
      try {
        const arr4 = [1, 2, [3, 4, [5, 6, [7, 8, [9, 10]]]]];
        let obj = arr4.flat(Infinity);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,2,3,4,5,6,7,8,9,10]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeFlat0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_5600
     * @tc.desc   Test the function of the interface PrototypeFlat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeFlat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFlat0005";
      try {
        const arr5 = [1, 2, , 4, 5];
        let obj = arr5.flat();
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,2,4,5]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeFlat0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_5700
     * @tc.desc   Test the function of the interface PrototypeFlat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeFlat0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFlat0006";
      try {
        const arr5 = [1, , 3, ["a", , "c"]];
        let obj = arr5.flat();
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,3,"a","c"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeFlat0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_5800
     * @tc.desc   Test the function of the interface PrototypeFlat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeFlat0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFlat0007";
      try {
        const array2 = [1, , 3, ["a", , ["d", , "e"]]];
        let obj = array2.flat();
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,3,"a",["d",null,"e"]]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeFlat0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_5900
     * @tc.desc   Test the function of the interface PrototypeFlat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeFlat0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFlat0008";
      try {
        const array2 = [1, , 3, ["a", , ["d", , "e"]]];
        let obj = array2.flat(2);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,3,"a","d","e"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeFlat0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_6000
     * @tc.desc   Test the function of the interface PrototypeFlat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeFlat0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFlat0009";
      try {
        const array2 = [1, undefined, 3];
        let obj = array2.flat();
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,null,3]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeFlat0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_6100
     * @tc.desc   Test the function of the interface PrototypeFlat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeFlat0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFlat0010";
      try {
        const array2 = [undefined, undefined, undefined];
        let obj = array2.flat();
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[null,null,null]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeFlatMap0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_6200
     * @tc.desc   Test the function of the interface PrototypeFlatMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeFlatMap0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFlatMap0001";
      try {
        const arr1 = [1, 2, 1];
        const result = arr1.flatMap((num) => (num === 2 ? [2, 2] : 1));
        expect(JSON.stringify(result)).assertEqual('[1,2,2,1]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeFlatMap0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_6300
     * @tc.desc   Test the function of the interface PrototypeFlatMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeFlatMap0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFlatMap0002";
      try {
        const arr1 = [1, , 1];
        const result = arr1.flatMap((num) => (num === 2 ? [2, 2] : 1));
        expect(JSON.stringify(result)).assertEqual('[1,1]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeFlatMap0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_6400
     * @tc.desc   Test the function of the interface PrototypeFlatMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeFlatMap0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeFlatMap0003";
      try {
        const arr1 = [1, undefined, 1];
        const result = arr1.flatMap((num) => (num === 2 ? [2, 2] : 1));
        expect(JSON.stringify(result)).assertEqual('[1,1,1]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeIncludes0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_6500
     * @tc.desc   Test the function of the interface PrototypeIncludes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeIncludes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIncludes0001";
      try {
        const array1 = [1, 2, 3];
        const result = array1.includes(2);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeIncludes0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_6600
     * @tc.desc   Test the function of the interface PrototypeIncludes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeIncludes0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIncludes0002";
      try {
        let array1 = [1, 2, 3];
        let value = array1.includes(2.1);
        console.log(`${TAG} result:` + value);
        expect(value).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeIncludes0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_6700
     * @tc.desc   Test the function of the interface PrototypeIncludes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeIncludes0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIncludes0003";
      try {
        let array1 = [1, 2, 3];
        let value = array1.includes(1, 2);
        console.log(`${TAG} result:` + value);
        expect(value).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeIncludes0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_6800
     * @tc.desc   Test the function of the interface PrototypeIncludes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeIncludes0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIncludes0004";
      try {
        let array1 = [1, 2, 3];
        let value = array1.includes(-1);
        console.log(`${TAG} result:` + value);
        expect(value).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeIncludes0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_6900
     * @tc.desc   Test the function of the interface PrototypeIncludes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeIncludes0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIncludes0005";
      try {
        let array1 = [1, 2, 3];
        let value = array1.includes(-1, -2);
        console.log(`${TAG} result:` + value);
        expect(value).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeIncludes0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_7000
     * @tc.desc   Test the function of the interface PrototypeIncludes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeIncludes0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIncludes0006";
      try {
        let array1 = [1, 2, NaN];
        let value = array1.includes(NaN);
        console.log(`${TAG} result:` + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeIncludes0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_7100
     * @tc.desc   Test the function of the interface PrototypeIncludes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeIncludes0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIncludes0007";
      try {
        let array1 = ['1', '2', '3'];
        let value = array1.includes('3');
        console.log(`${TAG} result:` + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeIncludes0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_7200
     * @tc.desc   Test the function of the interface PrototypeIncludes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeIncludes0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIncludes0008";
      try {
        const arr = ["a", "b", "c"];
        let value = arr.includes("c", 3);
        console.log(`${TAG} result:` + value);
        expect(value).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeIncludes0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_7300
     * @tc.desc   Test the function of the interface PrototypeIncludes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeIncludes0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIncludes0009";
      try {
        const arr = ["a", "b", "c"];
        let value = arr.includes("c", 100);
        console.log(`${TAG} result:` + value);
        expect(value).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeIncludes0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_7400
     * @tc.desc   Test the function of the interface PrototypeIncludes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeIncludes0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIncludes0010";
      try {
        const arr = ["a", "b", "c"];
        let value = arr.includes("c", 3);
        console.log(`${TAG} result:` + value);
        expect(value).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeIncludes0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_7500
     * @tc.desc   Test the function of the interface PrototypeIncludes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeIncludes0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIncludes0011";
      try {
        const arr = ["a", "b", "c"];
        let value = arr.includes("c", 100);
        console.log(`${TAG} result:` + value);
        expect(value).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeIncludes0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_7600
     * @tc.desc   Test the function of the interface PrototypeIncludes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeIncludes0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIncludes0012";
      try {
        const arr = ["a", "b", "c"];
        let value = arr.includes("a", -100);
        console.log(`${TAG} result:` + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeIncludes0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_7700
     * @tc.desc   Test the function of the interface PrototypeIncludes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeIncludes0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIncludes0013";
      try {
        const arr = ["a", "b", "c"];
        let value = arr.includes("b", -100);
        console.log(`${TAG} result:` + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeIncludes0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_7800
     * @tc.desc   Test the function of the interface PrototypeIncludes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeIncludes0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIncludes0014";
      try {
        const arr = ["a", "b", "c"];
        let value = arr.includes("c", -100);
        console.log(`${TAG} result:` + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeIncludes0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_7900
     * @tc.desc   Test the function of the interface PrototypeIncludes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeIncludes0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIncludes0015";
      try {
        const arr = ["a", "b", "c"];
        let value = arr.includes("a", -2);
        console.log(`${TAG} result:` + value);
        expect(value).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeIndexOf0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_8000
     * @tc.desc   Test the function of the interface PrototypeIndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIndexOf0001";
      try {
        const array = [2, 9, 9];
        const result = array.indexOf(2);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeIndexOf0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_8100
     * @tc.desc   Test the function of the interface PrototypeIndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIndexOf0002";
      try {
        const array = [2, 9, 9];
        const result = array.indexOf(7);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeIndexOf0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_8200
     * @tc.desc   Test the function of the interface PrototypeIndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIndexOf0003";
      try {
        const array = [2, 9, 9];
        const result = array.indexOf(9, 2);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeIndexOf0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_8300
     * @tc.desc   Test the function of the interface PrototypeIndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIndexOf0004";
      try {
        const array = [2, 9, 9];
        const result = array.indexOf(2, -1);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeIndexOf0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_8400
     * @tc.desc   Test the function of the interface PrototypeIndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIndexOf0005";
      try {
        const array = [2, 9, 9];
        const result = array.indexOf(2, -3);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeIndexOf0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_8500
     * @tc.desc   Test the function of the interface PrototypeIndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIndexOf0006";
      try {
        const array = [NaN];
        const result = array.indexOf(NaN);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeIndexOf0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_8600
     * @tc.desc   Test the function of the interface PrototypeIndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeIndexOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIndexOf0007";
      try {
        const array = ['apple', 'banana', 'cat'];
        const result = array.indexOf('1');
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeIndexOf0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_8700
     * @tc.desc   Test the function of the interface PrototypeIndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIndexOf0008";
      try {
        const array = ['apple', 'banana', 'cat'];
        const result = array.indexOf('apple');
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeIndexOf0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_8800
     * @tc.desc   Test the function of the interface PrototypeIndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeIndexOf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIndexOf0009";
      try {
        const array = ['apple', 'banana', 'cat'];
        const result = array.indexOf('abc', 2);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeIndexOf0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_8900
     * @tc.desc   Test the function of the interface PrototypeIndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeIndexOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIndexOf0010";
      try {
        const array = ['apple', 'banana', 'cat'];
        const result = array.indexOf('apple', 0);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeIndexOf0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_9000
     * @tc.desc   Test the function of the interface PrototypeIndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeIndexOf0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeIndexOf0011";
      try {
        const array = ['apple', 'banana', 'cat'];
        const result = array.indexOf('banana', 2);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeJoin0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_9100
     * @tc.desc   Test the function of the interface PrototypeJoin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeJoin0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeJoin0001";
      try {
        const array = ["Wind", "Water", "Fire"];
        const result = array.join();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual('Wind,Water,Fire');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeJoin0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_9200
     * @tc.desc   Test the function of the interface PrototypeJoin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeJoin0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeJoin0002";
      try {
        const array = ["Wind", "Water", "Fire"];
        const result = array.join(", ");
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual('Wind, Water, Fire');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeJoin0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_9300
     * @tc.desc   Test the function of the interface PrototypeJoin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeJoin0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeJoin0003";
      try {
        const array = ["Wind", "Water", "Fire"];
        const result = array.join(" + ");
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual('Wind + Water + Fire');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeJoin0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_9400
     * @tc.desc   Test the function of the interface PrototypeJoin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeJoin0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeJoin0004";
      try {
        const array = ["Wind", "Water", "Fire"];
        const result = array.join("");
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual('WindWaterFire');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeJoin0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_9500
     * @tc.desc   Test the function of the interface PrototypeJoin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeJoin0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeJoin0005";
      try {
        const array = [1, 2, 3];
        const result = array.join();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeJoin0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_9600
     * @tc.desc   Test the function of the interface PrototypeJoin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeJoin0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeJoin0006";
      try {
        const array = [1, 2, 3];
        const result = array.join(", ");
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual('1, 2, 3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeJoin0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_97000
     * @tc.desc   Test the function of the interface PrototypeJoin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeJoin0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeJoin0007";
      try {
        const array = [1, 2, 3];
        const result = array.join(" + ");
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual('1 + 2 + 3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeJoin0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_98000
     * @tc.desc   Test the function of the interface PrototypeJoin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeJoin0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeJoin0008";
      try {
        const array = [1, 2, 3];
        const result = array.join("");
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual('123');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeJoin0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_99000
     * @tc.desc   Test the function of the interface PrototypeJoin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeJoin0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeJoin0009";
      try {
        const array = [1, undefined, 3];
        const result = array.join();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual('1,,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeKeys0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_100000
     * @tc.desc   Test the function of the interface PrototypeKeys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeKeys0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeKeys0001";
      try {
        const arr = ["a", "b", "c"];
        const sparseKeys = Object.keys(arr);
        console.log(`${TAG} result:` + JSON.stringify(sparseKeys));
        expect(JSON.stringify(sparseKeys)).assertEqual('["0","1","2"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeKeys0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_101000
     * @tc.desc   Test the function of the interface PrototypeKeys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeKeys0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeKeys0002";
      try {
        const arr = ["a", "", "c"];
        const sparseKeys = Object.keys(arr);
        console.log(`${TAG} result:` + JSON.stringify(sparseKeys));
        expect(JSON.stringify(sparseKeys)).assertEqual('["0","1","2"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeKeys0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_102000
     * @tc.desc   Test the function of the interface PrototypeKeys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeKeys0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeKeys0003";
      try {
        const arr = ["a", , "c"];
        const sparseKeys = Object.keys(arr);
        console.log(`${TAG} result:` + JSON.stringify(sparseKeys));
        expect(JSON.stringify(sparseKeys)).assertEqual('["0","2"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeKeys0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_103000
     * @tc.desc   Test the function of the interface PrototypeKeys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeKeys0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeKeys0004";
      try {
        const arr = ["a", undefined, "c"];
        const sparseKeys = Object.keys(arr);
        console.log(`${TAG} result:` + JSON.stringify(sparseKeys));
        expect(JSON.stringify(sparseKeys)).assertEqual('["0","1","2"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeLastIndexOf0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_104000
     * @tc.desc   Test the function of the interface PrototypeLastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeLastIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeLastIndexOf0001";
      try {
        const numbers = [2, 5, 9, 2];
        const result = numbers.lastIndexOf(2);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeLastIndexOf0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_105000
     * @tc.desc   Test the function of the interface PrototypeLastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeLastIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeLastIndexOf0002";
      try {
        const numbers = [2, 5, 9, 2];
        const result = numbers.lastIndexOf(2.5);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeLastIndexOf0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_106000
     * @tc.desc   Test the function of the interface PrototypeLastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeLastIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeLastIndexOf0003";
      try {
        const numbers = [2, 5, 9, 2];
        const result = numbers.lastIndexOf(7);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeLastIndexOf0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_107000
     * @tc.desc   Test the function of the interface PrototypeLastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeLastIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeLastIndexOf0004";
      try {
        const numbers = [2, 5, 9, 2];
        const result = numbers.lastIndexOf(2, 3);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeLastIndexOf0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_108000
     * @tc.desc   Test the function of the interface PrototypeLastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeLastIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeLastIndexOf0005";
      try {
        const numbers = [2, 5, 9, 2];
        const result = numbers.lastIndexOf(2, 2);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeLastIndexOf0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_109000
     * @tc.desc   Test the function of the interface PrototypeLastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeLastIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeLastIndexOf0006";
      try {
        const numbers = [2, 5, 9, 2];
        const result = numbers.lastIndexOf(2, -2);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeLastIndexOf0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_111000
     * @tc.desc   Test the function of the interface PrototypeLastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeLastIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeLastIndexOf0008";
      try {
        const numbers = [2, 5, 9, 2];
        const result = numbers.lastIndexOf(-1);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeLastIndexOf0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_112000
     * @tc.desc   Test the function of the interface PrototypeLastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeLastIndexOf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeLastIndexOf0009";
      try {
        const numbers = [2, 5, 9, 2];
        const result = numbers.lastIndexOf(500);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeLastIndexOf0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_113000
     * @tc.desc   Test the function of the interface PrototypeLastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeLastIndexOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeLastIndexOf0010";
      try {
        const numbers = [2, 5, 9, 2];
        const result = numbers.lastIndexOf(NaN);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeMap0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_114000
     * @tc.desc   Test the function of the interface PrototypeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeMap0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeMap0001";
      try {
        const numbers = [1, 4, 9];
        const roots = numbers.map((num) => Math.sqrt(num));
        console.log(`${TAG} result:` + JSON.stringify(roots));
        expect(JSON.stringify(roots)).assertEqual('[1,2,3]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeMap0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_115000
     * @tc.desc   Test the function of the interface PrototypeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeMap0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeMap0002";
      try {
        let roots = ["1", "2", "3"].map(parseInt);
        let value = JSON.stringify(roots);
        console.log(`${TAG} result:` + value);
        expect(value).assertEqual('[1,null,null]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeMap0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_116000
     * @tc.desc   Test the function of the interface PrototypeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeMap0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeMap0003";
      try {
        const strings = ["10", "10", "10"];
        const obj = strings.map(parseInt);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[10,null,2]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypePop0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_117000
     * @tc.desc   Test the function of the interface PrototypePop.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypePop0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypePop0001";
      try {
        const myFish = ["app", "banana", "cat", "duck"];
        const popped = myFish.pop();
        console.log(`${TAG} result:` + popped + `, length:` + popped?.length);
        expect(popped).assertEqual("duck");
        expect(popped?.length).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypePop0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_118000
     * @tc.desc   Test the function of the interface PrototypePop.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypePop0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypePop0002";
      try {
        const myFish = ["app", , "cat", "duck"];
        const popped = myFish.pop();
        console.log(`${TAG} result:` + popped + `, length:` + popped?.length);
        expect(popped).assertEqual("duck");
        expect(popped?.length).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypePop0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_119000
     * @tc.desc   Test the function of the interface PrototypePop.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypePop0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypePop0003";
      try {
        const myFish = ["app", "", "cat", "duck"];
        const popped = myFish.pop();
        console.log(`${TAG} result:` + popped + `, length:` + popped?.length);
        expect(popped).assertEqual("duck");
        expect(popped?.length).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypePop0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_120000
     * @tc.desc   Test the function of the interface PrototypePop.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypePop0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypePop0004";
      try {
        const myFish = ["app", "banana", "cat", ""];
        const popped = myFish.pop();
        console.log(`${TAG} result:` + popped + `, length:` + popped?.length);
        expect(popped).assertEqual("");
        expect(popped?.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypePop0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_121000
     * @tc.desc   Test the function of the interface PrototypePop.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypePop0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypePop0005";
      try {
        const myFish = ["app", "banana", "cat", undefined];
        const popped = myFish.pop();
        console.log(`${TAG} result:` + popped + `, length:` + popped?.length);
        expect(popped).assertEqual(undefined);
        expect(popped?.length).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypePush0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_122000
     * @tc.desc   Test the function of the interface PrototypePush.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypePush0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypePush0001";
      try {
        const sports = ["soccer", "baseball"];
        const total = sports.push("football", "swimming");
        console.log(`${TAG} result:` + JSON.stringify(sports) + `, length:` + total);
        expect(JSON.stringify(sports)).assertEqual('["soccer","baseball","football","swimming"]');
        expect(total).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypePush0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_123000
     * @tc.desc   Test the function of the interface PrototypePush.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypePush0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypePush0002";
      try {
        const sports = ["soccer", "baseball"];
        const total = sports.push("");
        console.log(`${TAG} result:` + JSON.stringify(sports) + `, length:` + total);
        expect(JSON.stringify(sports)).assertEqual('["soccer","baseball",""]');
        expect(total).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeReduce0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_124000
     * @tc.desc   Test the function of the interface PrototypeReduce.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeReduce0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeReduce0001";
      try {
        const flattened = [
          [0, 1],
          [2, 3],
          [4, 5],
        ].reduce((accumulator, currentValue) => accumulator.concat(currentValue), []);
        console.log(`${TAG} result:` + JSON.stringify(flattened));
        expect(JSON.stringify(flattened)).assertEqual('[0,1,2,3,4,5]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeReduceRight0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_125000
     * @tc.desc   Test the function of the interface PrototypeReduceRight.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeReduceRight0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeReduceRight0001";
      try {
        const array1 = [
          [0, 1],
          [2, 3],
          [4, 5],
        ];
        const result = array1.reduceRight((accumulator, currentValue) =>

        accumulator.concat(currentValue),

        );
        console.log(`${TAG} result:` + JSON.stringify(result));

        expect(JSON.stringify(result)).assertEqual('[4,5,2,3,0,1]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeReduceRight0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_126000
     * @tc.desc   Test the function of the interface PrototypeReduceRight.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeReduceRight0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeReduceRight0002";
      try {
        const sum = [0, 1, 2, 3].reduceRight((a, b) => a + b);
        console.log(`${TAG} result:` + sum);
        expect(sum).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeReverse0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_127000
     * @tc.desc   Test the function of the interface PrototypeReverse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeReverse0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeReverse0001";
      try {
        const items = [1, 2, 3];
        const result = items.reverse();
        expect(JSON.stringify(result)).assertEqual('[3,2,1]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeReverse0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_128000
     * @tc.desc   Test the function of the interface PrototypeReverse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeReverse0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeReverse0002";
      try {
        const items = [1, 2, undefined];
        const result = items.reverse();
        expect(JSON.stringify(result)).assertEqual('[null,2,1]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeReverse0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_129000
     * @tc.desc   Test the function of the interface PrototypeReverse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeReverse0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeReverse0003";
      try {
        const items = [1, , 3];
        const result = items.reverse();
        expect(JSON.stringify(result)).assertEqual('[3,null,1]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeShift0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_130000
     * @tc.desc   Test the function of the interface PrototypeShift.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeShift0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeShift0001";
      try {
        const array1 = [1, 2, 3];
        const result = array1.shift();
        console.log(`${TAG} result:` + JSON.stringify(array1) + `, value:` + result);
        expect(JSON.stringify(array1)).assertEqual('[2,3]');
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeShift0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_131000
     * @tc.desc   Test the function of the interface PrototypeShift.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeShift0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeShift0002";
      try {
        const array1 = [null, 2, 3];
        const result = array1.shift();
        console.log(`${TAG} result:` + JSON.stringify(array1) + `, value:` + result);
        expect(JSON.stringify(array1)).assertEqual('[2,3]');
        expect(result).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeShift0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_132000
     * @tc.desc   Test the function of the interface PrototypeShift.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeShift0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeShift0003";
      try {
        const array1 = [1, null, 3];
        const firstElement = array1.shift();
        console.log(`${TAG} result:` + JSON.stringify(array1) + `, value:` + firstElement);
        expect(JSON.stringify(array1)).assertEqual('[null,3]');
        expect(firstElement).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeShift0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_133000
     * @tc.desc   Test the function of the interface PrototypeShift.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeShift0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeShift0004";
      try {
        const array1 = [null];
        const firstElement = array1.shift();
        console.log(`${TAG} result:` + JSON.stringify(array1) + `, value:` + firstElement);
        expect(JSON.stringify(array1)).assertEqual('[]');
        expect(firstElement).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeShift0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_134000
     * @tc.desc   Test the function of the interface PrototypeShift.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeShift0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeShift0005";
      try {
        const array1 = [];
        const firstElement = array1.shift();
        console.log(`${TAG} result:` + JSON.stringify(array1) + `, value:` + firstElement);
        expect(JSON.stringify(array1)).assertEqual('[]');
        expect(firstElement).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeShift0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_135000
     * @tc.desc   Test the function of the interface PrototypeShift.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeShift0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeShift0006";
      try {
        const array1 = [undefined];
        const firstElement = array1.shift();
        console.log(`${TAG} result:` + JSON.stringify(array1) + `, value:` + firstElement);
        expect(JSON.stringify(array1)).assertEqual('[]');
        expect(firstElement).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSlice0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_136000
     * @tc.desc   Test the function of the interface PrototypeSlice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSlice0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0001";
      try {
        const fruits = ["Banana", "Orange", "Lemon", "Apple", "Mango"];
        const result = fruits.slice(0);
        expect(JSON.stringify(result)).assertEqual('["Banana","Orange","Lemon","Apple","Mango"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSlice0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_137000
     * @tc.desc   Test the function of the interface PrototypeSlice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSlice0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0002";
      try {
        const fruits = ["Banana", "Orange", "Lemon", "Apple", "Mango"];
        const result = fruits.slice(1);
        expect(JSON.stringify(result)).assertEqual('["Orange","Lemon","Apple","Mango"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSlice0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_138000
     * @tc.desc   Test the function of the interface PrototypeSlice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSlice0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0003";
      try {
        const fruits = ["Banana", "Orange", "Lemon", "Apple", "Mango"];
        const result = fruits.slice(6);
        expect(JSON.stringify(result)).assertEqual('[]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSlice0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_139000
     * @tc.desc   Test the function of the interface PrototypeSlice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSlice0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0004";
      try {
        const fruits = ["Banana", "Orange", "Lemon", "Apple", "Mango"];
        const result = fruits.slice(-1);
        expect(JSON.stringify(result)).assertEqual('["Mango"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSlice0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_140000
     * @tc.desc   Test the function of the interface PrototypeSlice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSlice0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0005";
      try {
        const fruits = ["Banana", "Orange", "Lemon", "Apple", "Mango"];
        const result = fruits.slice(2, 4);
        expect(JSON.stringify(result)).assertEqual('["Lemon","Apple"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSlice0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_141000
     * @tc.desc   Test the function of the interface PrototypeSlice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSlice0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0006";
      try {
        const fruits = ["Banana", "Orange", "Lemon", "Apple", "Mango"];
        const result = fruits.slice(1, 5);
        expect(JSON.stringify(result)).assertEqual('["Orange","Lemon","Apple","Mango"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSlice0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_142000
     * @tc.desc   Test the function of the interface PrototypeSlice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSlice0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0007";
      try {
        const fruits = ["Banana", "Orange", "Lemon", "Apple", "Mango"];
        const result = fruits.slice(2, -1);
        expect(JSON.stringify(result)).assertEqual('["Lemon","Apple"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSlice0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_143000
     * @tc.desc   Test the function of the interface PrototypeSlice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSlice0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0008";
      try {
        const fruits = ["Banana", "Orange", "Lemon", "Apple", "Mango"];
        const result = fruits.slice();
        expect(JSON.stringify(result)).assertEqual('["Banana","Orange","Lemon","Apple","Mango"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSlice0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_144000
     * @tc.desc   Test the function of the interface PrototypeSlice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSlice0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0009";
      try {
        const fruits = ["Banana", "Orange", "Lemon", "Apple", "Mango"];
        const result = fruits.slice(undefined);
        expect(JSON.stringify(result)).assertEqual('["Banana","Orange","Lemon","Apple","Mango"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSlice0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_145000
     * @tc.desc   Test the function of the interface PrototypeSlice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSlice0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0010";
      try {
        const fruits = ["Banana", "Orange", "", "Apple", "Mango"];
        const result = fruits.slice(1);
        expect(JSON.stringify(result)).assertEqual('["Orange","","Apple","Mango"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSlice0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_146000
     * @tc.desc   Test the function of the interface PrototypeSlice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSlice0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0011";
      try {
        const fruits = ["Banana", "Orange", "", "Apple", "Mango"];
        const result = fruits.slice(2, 4);
        expect(JSON.stringify(result)).assertEqual('["","Apple"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSlice0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_147000
     * @tc.desc   Test the function of the interface PrototypeSlice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSlice0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0012";
      try {
        const fruits = ["Banana", "Orange", "", "Apple", "Mango"];
        const result = fruits.slice(-1);
        expect(JSON.stringify(result)).assertEqual('["Mango"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSlice0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_148000
     * @tc.desc   Test the function of the interface PrototypeSlice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSlice0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0013";
      try {
        const fruits = ["Banana", "Orange", "", "Apple", "Mango"];
        const result = fruits.slice();
        expect(JSON.stringify(result)).assertEqual('["Banana","Orange","","Apple","Mango"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSlice0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_149000
     * @tc.desc   Test the function of the interface PrototypeSlice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSlice0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0014";
      try {
        const fruits = ["Banana", "Orange", "", "Apple", "Mango"];
        const result = fruits.slice(undefined);
        expect(JSON.stringify(result)).assertEqual('["Banana","Orange","","Apple","Mango"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSlice0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_150000
     * @tc.desc   Test the function of the interface PrototypeSlice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSlice0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0015";
      try {
        const fruits = ["Banana", "Orange", undefined, "Apple", "Mango"];
        const result = fruits.slice(1);
        expect(JSON.stringify(result)).assertEqual('["Orange",null,"Apple","Mango"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSlice0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_151000
     * @tc.desc   Test the function of the interface PrototypeSlice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSlice0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0016";
      try {
        const fruits = ["Banana", "Orange", undefined, "Apple", "Mango"];
        const result = fruits.slice(3, 5);
        expect(JSON.stringify(result)).assertEqual('["Apple","Mango"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSlice0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_152000
     * @tc.desc   Test the function of the interface PrototypeSlice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSlice0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0017";
      try {
        const fruits = ["Banana", "Orange", undefined, "Apple", "Mango"];
        const result = fruits.slice(-2);
        expect(JSON.stringify(result)).assertEqual('["Apple","Mango"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSlice0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_153000
     * @tc.desc   Test the function of the interface PrototypeSlice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSlice0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0018";
      try {
        const fruits = ["Banana", "Orange", undefined, "Apple", "Mango"];
        const result = fruits.slice();
        expect(JSON.stringify(result)).assertEqual('["Banana","Orange",null,"Apple","Mango"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSlice0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_154000
     * @tc.desc   Test the function of the interface PrototypeSlice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSlice0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0019";
      try {
        const fruits = ["Banana", "Orange", undefined, "Apple", "Mango"];
        const result = fruits.slice(undefined);
        expect(JSON.stringify(result)).assertEqual('["Banana","Orange",null,"Apple","Mango"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSlice0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_155000
     * @tc.desc   Test the function of the interface PrototypeSlice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSlice0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0020";
      try {
        const fruits = [, "Orange", "Lemon", "Apple", "Mango"]
        ;
        const result = fruits.slice(1);
        expect(JSON.stringify(result)).assertEqual('["Orange","Lemon","Apple","Mango"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSlice0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_156000
     * @tc.desc   Test the function of the interface PrototypeSlice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSlice0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0021";
      try {
        const fruits = [, "Orange", "Lemon", "Apple", "Mango"]
        ;
        const result = fruits.slice(2, 4);
        expect(JSON.stringify(result)).assertEqual('["Lemon","Apple"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSlice0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_157000
     * @tc.desc   Test the function of the interface PrototypeSlice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSlice0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0022";
      try {
        const fruits = [, "Orange", "Lemon", "Apple", "Mango"]
        ;
        const result = fruits.slice(-1);
        expect(JSON.stringify(result)).assertEqual('["Mango"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSlice0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_158000
     * @tc.desc   Test the function of the interface PrototypeSlice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSlice0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0023";
      try {
        const fruits = [, "Orange", "Lemon", "Apple", "Mango"]
        ;
        const result = fruits.slice();
        expect(JSON.stringify(result)).assertEqual('[null,"Orange","Lemon","Apple","Mango"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSlice0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_159000
     * @tc.desc   Test the function of the interface PrototypeSlice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSlice0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSlice0024";
      try {
        const fruits = [, "Orange", "Lemon", "Apple", "Mango"]
        ;
        const result = fruits.slice(undefined);
        expect(JSON.stringify(result)).assertEqual('[null,"Orange","Lemon","Apple","Mango"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSome0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_160000
     * @tc.desc   Test the function of the interface PrototypeSome.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSome0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSome0001";
      try {
        let array = [1, 2, 3]
        ;
        const result = array.some((x) => x === 1);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSome0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_161000
     * @tc.desc   Test the function of the interface PrototypeSome.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSome0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSome0002";
      try {
        let array = [1, 2, 3]
        ;
        const result = array.some((x) => x === -1);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSome0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_162000
     * @tc.desc   Test the function of the interface PrototypeSome.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSome0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSome0003";
      try {
        let array = [1, 2, 3]
        ;
        const result = array.some((x) => x === undefined);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSome0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_163000
     * @tc.desc   Test the function of the interface PrototypeSome.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSome0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSome0004";
      try {
        let array = [1, , 3];
        const result = array.some((x) => x === 1);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSome0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_164000
     * @tc.desc   Test the function of the interface PrototypeSome.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSome0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSome0005";
      try {
        let array = [1, , 3];
        const result = array.some((x) => x === -2);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSome0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_165000
     * @tc.desc   Test the function of the interface PrototypeSome.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSome0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSome0006";
      try {
        let array = [1, , 3];
        const result = array.some((x) => x === undefined);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSome0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_166000
     * @tc.desc   Test the function of the interface PrototypeSome.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSome0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSome0007";
      try {
        let array = [1, '2', 3]
        ;
        const result = array.some((x) => x === 3);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSome0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_167000
     * @tc.desc   Test the function of the interface PrototypeSome.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSome0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSome0008";
      try {
        let array = [1, '2', 3]
        ;
        const result = array.some((x) => x === undefined);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSome0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_168000
     * @tc.desc   Test the function of the interface PrototypeSome.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSome0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSome0009";
      try {
        let array = [1, '2', 3]
        ;
        const result = array.some((x) => x === -5);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSome0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_169000
     * @tc.desc   Test the function of the interface PrototypeSome.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSome0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSome0010";
      try {
        let array = [1, 2, undefined]
        ;
        const result = array.some((x) => x === 2);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSome0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_170000
     * @tc.desc   Test the function of the interface PrototypeSome.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSome0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSome0011";
      try {
        let array = [1, 2, undefined]
        ;
        const result = array.some((x) => x === -10);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSome0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_171000
     * @tc.desc   Test the function of the interface PrototypeSome.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSome0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSome0012";
      try {
        let array = [1, 2, undefined]
        ;
        const result = array.some((x) => x === undefined);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSort0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_172000
     * @tc.desc   Test the function of the interface PrototypeSome.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSort0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSort0001";
      try {
        const value = ['Cat', 'Duck', 'Zoo', 'Apple', 'Desk'];
        const result = value.sort();
        expect(JSON.stringify(result)).assertEqual('["Apple","Cat","Desk","Duck","Zoo"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSort0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_173000
     * @tc.desc   Test the function of the interface PrototypeSome.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSort0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSort0002";
      try {
        const value = ['Cat', '', 'Zoo', 'Apple', 'Desk'];
        const result = value.sort();
        expect(JSON.stringify(result)).assertEqual('["","Apple","Cat","Desk","Zoo"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSort0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_174000
     * @tc.desc   Test the function of the interface PrototypeSome.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSort0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSort0003";
      try {
        const value = ['Cat', undefined, 'Zoo', 'Apple', 'Desk'];
        const result = value.sort();
        expect(JSON.stringify(result)).assertEqual('["Apple","Cat","Desk","Zoo",null]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSort0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_175000
     * @tc.desc   Test the function of the interface PrototypeSome.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSort0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSort0004";
      try {
        const value = ['Cat', , 'Zoo', 'Apple', 'Desk'];
        const result = value.sort();
        expect(JSON.stringify(result)).assertEqual('["Apple","Cat","Desk","Zoo",null]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSplice0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_176000
     * @tc.desc   Test the function of the interface PrototypeSplice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSplice0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSplice0001";
      try {
        const months = ['Jan', 'March', 'April', 'June'];
        months.splice(1, 0, 'Feb');
        console.log(`${TAG} result:` + JSON.stringify(months));
        expect(JSON.stringify(months)).assertEqual('["Jan","Feb","March","April","June"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSplice0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_177000
     * @tc.desc   Test the function of the interface PrototypeSplice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSplice0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSplice0002";
      try {
        const months = ['Jan', 'March', 'April', 'June'];
        months.splice(4, 1, 'May');
        console.log(`${TAG} result:` + JSON.stringify(months));
        expect(JSON.stringify(months)).assertEqual('["Jan","March","April","June","May"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSplice0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_178000
     * @tc.desc   Test the function of the interface PrototypeSplice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSplice0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSplice0003";
      try {
        const myFish = ["angel", "clown", "mandarin", "sturgeon"];
        myFish.splice(2, 0, "drum");
        console.log(`${TAG} result:` + JSON.stringify(myFish));
        expect(JSON.stringify(myFish)).assertEqual('["angel","clown","drum","mandarin","sturgeon"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSplice0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_179000
     * @tc.desc   Test the function of the interface PrototypeSplice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSplice0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSplice0004";
      try {
        const myFish = ["angel", "clown", "mandarin", "sturgeon"];
        myFish.splice(2, 0, "drum", "guitar");
        console.log(`${TAG} result:` + JSON.stringify(myFish));
        expect(JSON.stringify(myFish)).assertEqual('["angel","clown","drum","guitar","mandarin","sturgeon"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSplice0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_180000
     * @tc.desc   Test the function of the interface PrototypeSplice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSplice0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSplice0005";
      try {
        const myFish = ["clown", "mandarin", "sturgeon"]
        ;
        myFish.splice(0, 0, "angel");
        console.log(`${TAG} result:` + JSON.stringify(myFish));
        expect(JSON.stringify(myFish)).assertEqual('["angel","clown","mandarin","sturgeon"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSplice0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_181000
     * @tc.desc   Test the function of the interface PrototypeSplice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSplice0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSplice0006";
      try {
        const myFish = ["angel", "clown", "mandarin"];
        myFish.splice(myFish.length, 0, "sturgeon");
        console.log(`${TAG} result:` + JSON.stringify(myFish));
        expect(JSON.stringify(myFish)).assertEqual('["angel","clown","mandarin","sturgeon"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSplice0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_182000
     * @tc.desc   Test the function of the interface PrototypeSplice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSplice0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSplice0007";
      try {
        const myFish = ["angel", "clown", "drum", "mandarin", "sturgeon"];
        myFish.splice(3, 1);
        console.log(`${TAG} result:` + JSON.stringify(myFish));
        expect(JSON.stringify(myFish)).assertEqual('["angel","clown","drum","sturgeon"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSplice0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_183000
     * @tc.desc   Test the function of the interface PrototypeSplice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSplice0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSplice0008";
      try {
        const myFish = ["angel", "clown", "drum", "sturgeon"];
        myFish.splice(2, 1, "trumpet");
        console.log(`${TAG} result:` + JSON.stringify(myFish));
        expect(JSON.stringify(myFish)).assertEqual('["angel","clown","trumpet","sturgeon"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSplice0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_184000
     * @tc.desc   Test the function of the interface PrototypeSplice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSplice0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSplice0009";
      try {
        const myFish = ["angel", "clown", "trumpet", "sturgeon"];
        myFish.splice(0, 2, "parrot", "anemone", "blue");
        console.log(`${TAG} result:` + JSON.stringify(myFish));
        expect(JSON.stringify(myFish)).assertEqual('["parrot","anemone","blue","trumpet","sturgeon"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSplice0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_185000
     * @tc.desc   Test the function of the interface PrototypeSplice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSplice0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSplice0010";
      try {
        const myFish = ["parrot", "anemone", "blue", "trumpet", "sturgeon"];
        myFish.splice(2, 2);
        console.log(`${TAG} result:` + JSON.stringify(myFish));
        expect(JSON.stringify(myFish)).assertEqual('["parrot","anemone","sturgeon"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSplice0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_186000
     * @tc.desc   Test the function of the interface PrototypeSplice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSplice0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSplice0011";
      try {
        const myFish = ["angel", "clown", "mandarin", "sturgeon"];
        myFish.splice(-2, 1);
        console.log(`${TAG} result:` + JSON.stringify(myFish));
        expect(JSON.stringify(myFish)).assertEqual('["angel","clown","sturgeon"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSplice0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_187000
     * @tc.desc   Test the function of the interface PrototypeSplice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSplice0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSplice0012";
      try {
        const myFish = ["angel", "clown", "mandarin", "sturgeon"];
        myFish.splice(2);
        console.log(`${TAG} result:` + JSON.stringify(myFish));
        expect(JSON.stringify(myFish)).assertEqual('["angel","clown"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSplice0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_188000
     * @tc.desc   Test the function of the interface PrototypeSplice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSplice0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSplice0013";
      try {
        const arr = [1, , 3, 4, , 6];
        arr.splice(1, 2);
        console.log(`${TAG} result:` + JSON.stringify(arr));
        expect(JSON.stringify(arr)).assertEqual('[1,4,null,6]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeSymboliterator0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_189000
     * @tc.desc   Test the function of the interface Prototype[Symbol.iterator].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeSymboliterator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeSymboliterator0001";
      try {
        const array1 = ['a', 'b', 'c'];
        const iterator1 = array1[Symbol.iterator]();
        expect(JSON.stringify(iterator1.next())).assertEqual('{"value":"a","done":false}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeToLocaleString0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_190000
     * @tc.desc   Test the function of the interface PrototypeToLocaleString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeToLocaleString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeToLocaleString0002";
      try {
        const array1 = [];
        const iterator1 = array1.toLocaleString();
        console.log(`${TAG} result:` + iterator1);
        expect(iterator1).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeToLocaleString0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_191000
     * @tc.desc   Test the function of the interface PrototypeToLocaleString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeToLocaleString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeToLocaleString0003";
      try {
        const array1 = [undefined];
        const iterator1 = array1.toLocaleString();
        console.log(`${TAG} result:` + iterator1);
        expect(iterator1).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeToLocaleString0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_192000
     * @tc.desc   Test the function of the interface PrototypeToLocaleString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeToLocaleString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeToLocaleString0004";
      try {
        const array1 = [null];
        const iterator1 = array1.toLocaleString();
        console.log(`${TAG} result:` + iterator1);
        expect(iterator1).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeToLocaleString0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_193000
     * @tc.desc   Test the function of the interface PrototypeToLocaleString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeToLocaleString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeToLocaleString0005";
      try {
        const array1 = [1];
        const iterator1 = array1.toLocaleString();
        console.log(`${TAG} result:` + iterator1);
        expect(iterator1).assertEqual('1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeToLocaleString0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_194000
     * @tc.desc   Test the function of the interface PrototypeToLocaleString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeToLocaleString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeToLocaleString0006";
      try {
        const array1 = ['Test'];
        const iterator1 = array1.toLocaleString();
        console.log(`${TAG} result:` + iterator1);
        expect(iterator1).assertEqual('Test');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeToString0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_195000
     * @tc.desc   Test the function of the interface PrototypeToString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeToString0001";
      try {
        const array1 = [1, 2, 'a', '1a'];
        const result = array1.toString();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual('1,2,a,1a');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeToString0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_196000
     * @tc.desc   Test the function of the interface PrototypeToString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeToString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeToString0002";
      try {
        const array1 = ['1a'];
        let value = array1.toString();
        console.log(`${TAG} result:` + value);
        expect(value).assertEqual('1a');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeToString0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_197000
     * @tc.desc   Test the function of the interface PrototypeToString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeToString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeToString0003";
      try {
        const array1 = [''];
        let value = array1.toString();
        console.log(`${TAG} result:` + value);
        expect(value).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeToString0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_198000
     * @tc.desc   Test the function of the interface PrototypeToString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeToString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeToString0004";
      try {
        const array1 = [null];
        let value = array1.toString();
        console.log(`${TAG} result:` + value);
        expect(value).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeToString0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_199000
     * @tc.desc   Test the function of the interface PrototypeToString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeToString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeToString0005";
      try {
        const array1 = [undefined];
        let value = array1.toString();
        console.log(`${TAG} result:` + value);
        expect(value).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeUnshift0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_200000
     * @tc.desc   Test the function of the interface PrototypeUnshift.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeUnshift0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeUnshift0001";
      try {
        let arr = [4, 5, 6];
        let value = arr.unshift(1, 2, 3);
        console.log(`${TAG} result:` + JSON.stringify(arr) + 'length:' + value);
        expect(JSON.stringify(arr)).assertEqual('[1,2,3,4,5,6]');
        expect(value).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeUnshift0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_201000
     * @tc.desc   Test the function of the interface PrototypeUnshift.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeUnshift0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeUnshift0002";
      try {
        const arr = [1, 2];
        let value = arr.unshift(0);
        console.log(`${TAG} result:` + JSON.stringify(arr) + 'length:' + value);
        expect(JSON.stringify(arr)).assertEqual('[0,1,2]');
        expect(value).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeUnshift0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_202000
     * @tc.desc   Test the function of the interface PrototypeUnshift.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeUnshift0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeUnshift0003";
      try {
        const arr = [1, 2];
        let value = arr.unshift(-2, -1);
        console.log(`${TAG} result:` + JSON.stringify(arr) + 'length:' + value);
        expect(JSON.stringify(arr)).assertEqual('[-2,-1,1,2]');
        expect(value).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeValues0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_203000
     * @tc.desc   Test the function of the interface PrototypeValues.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeValues0001";
      try {
        const arr = ["a", "b", "c", "d", "e"];
        const iterator = arr.values();
        let val1 = iterator.next();
        expect(JSON.stringify(val1)).assertEqual('{"value":"a","done":false}');
        let val2 = iterator.next();
        expect(JSON.stringify(val2)).assertEqual('{"value":"b","done":false}');
        let val3 = iterator.next();
        expect(JSON.stringify(val3)).assertEqual('{"value":"c","done":false}');
        let val4 = iterator.next();
        expect(JSON.stringify(val4)).assertEqual('{"value":"d","done":false}');
        let val5 = iterator.next();
        expect(JSON.stringify(val5)).assertEqual('{"value":"e","done":false}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeValues0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_204000
     * @tc.desc   Test the function of the interface PrototypeValues.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeValues0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeValues0002";
      try {
        const arr = ["a", undefined, "c", "d", "e"];
        const iterator = arr.values();
        let val1 = iterator.next();
        expect(JSON.stringify(val1)).assertEqual('{"value":"a","done":false}');
        let val2 = iterator.next();
        expect(JSON.stringify(val2)).assertEqual('{"done":false}');
        let val3 = iterator.next();
        expect(JSON.stringify(val3)).assertEqual('{"value":"c","done":false}');
        let val4 = iterator.next();
        expect(JSON.stringify(val4)).assertEqual('{"value":"d","done":false}');
        let val5 = iterator.next();
        expect(JSON.stringify(val5)).assertEqual('{"value":"e","done":false}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeValues0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_205000
     * @tc.desc   Test the function of the interface PrototypeValues.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeValues0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeValues0003";
      try {
        const arr = ["a", null];
        const iterator = arr.values();
        let val1 = iterator.next();
        expect(JSON.stringify(val1)).assertEqual('{"value":"a","done":false}');
        let val2 = iterator.next();
        expect(JSON.stringify(val2)).assertEqual('{"value":null,"done":false}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPrototypeValues0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_206000
     * @tc.desc   Test the function of the interface PrototypeValues.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrototypeValues0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPrototypeValues0004";
      try {
        const arr = [];
        const iterator = arr.values();
        let val1 = iterator.next();
        expect(JSON.stringify(val1)).assertEqual('{"done":true}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
  });
}