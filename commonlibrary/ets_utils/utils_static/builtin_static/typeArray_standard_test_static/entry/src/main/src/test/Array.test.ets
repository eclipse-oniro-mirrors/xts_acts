/*
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from "../../../hypium/index";

class C{}
export default function arrayTest() {
  describe("arrayTest", (): void => {
    // afterEach(() => {
    //   await Utils.msSleep(20);
    // })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_0100
     * @tc.name        testConstructor0001
     * @tc.desc        Test the function of the interface Constructor
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testConstructor0001";
      try {
        let element0 = 'app';
        let obj: Array<string> = new Array<string>(element0);
        expect(JSON.stringify(obj)).assertEqual(`["app"]`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_0200
     * @tc.name        testConstructor0002
     * @tc.desc        Test the function of the interface Constructor
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testConstructor0002";
      try {
        let element0 = 'app';
        let obj: Array<string> = new Array<string>(element0);
        expect(JSON.stringify(obj)).assertEqual(`["app"]`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_0300
     * @tc.name        testConstructor0003
     * @tc.desc        Test the function of the interface Constructor
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testConstructor0003";
      try {
        let element0 = 'app0';
        let element1 = 'app1';
        let obj: Array<string> = new Array<string>(element0, element1);
        expect(JSON.stringify(obj)).assertEqual(`["app0","app1"]`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_0400
     * @tc.name        testConstructor0004
     * @tc.desc        Test the function of the interface Constructor
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testConstructor0004";
      try {
        let element0 = 'app0';
        let element1 = 'app1';
        let obj: Array<string> = new Array<string>(element0, element1);
        expect(JSON.stringify(obj)).assertEqual(`["app0","app1"]`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_0500
     * @tc.name        testFrom0001
     * @tc.desc        Test the function of the interface From
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testFrom0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testFrom0001";
      try {
        const set: Set<string> = new Set<string>(["foo", "bar", "baz", "foo"]);
        let obj = Array.from(set);
        expect(JSON.stringify(obj)).assertEqual("[\"foo\",\"bar\",\"baz\"]");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_0600
     * @tc.name        testFrom0002
     * @tc.desc        Test the function of the interface From
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testFrom0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testFrom0002";
      try {
        let obj = Array.from('ABC');
        expect(JSON.stringify(obj)).assertEqual("[\"A\",\"B\",\"C\"]");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_0700
     * @tc.name        testFrom0003
     * @tc.desc        Test the function of the interface From
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testFrom0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testFrom0003";
      try {
        const map = new Map<number, number>([
          [1, 2],
          [2, 4],
          [4, 8],
        ]);
        let obj = Array.from(map);
        expect(JSON.stringify(obj)).assertEqual("[[1,2],[2,4],[4,8]]");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_0800
     * @tc.name        testIsArray0001
     * @tc.desc        Test the function of the interface IsArray
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testIsArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testIsArray0001";
      try {
        let result = Array.isArray(new Array<string>());
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_0900
     * @tc.name        testIsArray0002
     * @tc.desc        Test the function of the interface IsArray
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testIsArray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testIsArray0002";
      try {
        let result = Array.isArray([1]);
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_1000
     * @tc.name        testIsArray0003
     * @tc.desc        Test the function of the interface IsArray
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testIsArray0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testIsArray0003";
      try {
        let result = Array.isArray(new Array<boolean>());
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_1100
     * @tc.name        testIsArray0004
     * @tc.desc        Test the function of the interface IsArray
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testIsArray0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testIsArray0004";
      try {
        let result = Array.isArray(new Array<string>("a", "b", "c", "d"));
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_1200
     * @tc.name        testIsArray0005
     * @tc.desc        Test the function of the interface IsArray
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testIsArray0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testIsArray0005";
      try {
        let result = Array.isArray(new Array<string>(3));
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_1400
     * @tc.name        testIsArray0008
     * @tc.desc        Test the function of the interface IsArray
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testIsArray0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testIsArray0008";
      try {
        let result = Array.isArray(new C());
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('false');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_1500
     * @tc.name        testIsArray0009
     * @tc.desc        Test the function of the interface IsArray
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testIsArray0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testIsArray0009";
      try {
        let result = Array.isArray(null);
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('false');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_1600
     * @tc.name        testIsArray0010
     * @tc.desc        Test the function of the interface IsArray
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testIsArray0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testIsArray0010";
      try {
        let result = Array.isArray(undefined);
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('false');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_1700
     * @tc.name        testIsArray0011
     * @tc.desc        Test the function of the interface IsArray
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testIsArray0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testIsArray0011";
      try {
        let result = Array.isArray(17);
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('false');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_1800
     * @tc.name        testIsArray0012
     * @tc.desc        Test the function of the interface IsArray
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testIsArray0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testIsArray0012";
      try {
        let result = Array.isArray("Array");
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('false');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_1900
     * @tc.name        testIsArray0013
     * @tc.desc        Test the function of the interface IsArray
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testIsArray0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testIsArray0013";
      try {
        let result = Array.isArray(true);
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('false');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_2000
     * @tc.name        testIsArray0014
     * @tc.desc        Test the function of the interface IsArray
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testIsArray0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testIsArray0014";
      try {
        let result = Array.isArray(false);
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('false');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_2100
     * @tc.name        testIsArray0015
     * @tc.desc        Test the function of the interface IsArray
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testIsArray0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testIsArray0015";
      try {
        let result = Array.isArray(new Uint8Array(32));
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('false');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_2300
     * @tc.name        testOf0001
     * @tc.desc        Test the function of the interface Of
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testOf0001";
      try {
        let result = Array.of(1);
        expect(JSON.stringify(result)).assertEqual('[1]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_2400
     * @tc.name        testOf0002
     * @tc.desc        Test the function of the interface Of
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testOf0002";
      try {
        let result = Array.of(1, 2, 3);
        expect(JSON.stringify(result)).assertEqual('[1,2,3]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_2500
     * @tc.name        testOf0003
     * @tc.desc        Test the function of the interface Of
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testOf0003";
      try {
        let result = Array.of(undefined);
        expect(JSON.stringify(result)).assertEqual('[null]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_2600
     * @tc.name        testOf0004
     * @tc.desc        Test the function of the interface Of
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testOf0004";
      try {
        let result = Array.of(null);
        expect(JSON.stringify(result)).assertEqual('[null]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_2700
     * @tc.name        testPrototypeConcat0001
     * @tc.desc        Test the function of the interface PrototypeConcat
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeConcat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeConcat0001";
      try {
        const letters1 = new Array<String>("a", "b", "c");
        const letters2 = new Array<String>("D", "E", "F");
        const alphaNumeric = letters1.concat(letters2);
        console.log(`${TAG} result:` + JSON.stringify(alphaNumeric));
        expect(JSON.stringify(alphaNumeric)).assertEqual('["a","b","c","D","E","F"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_2800
     * @tc.name        testPrototypeConcat0002
     * @tc.desc        Test the function of the interface PrototypeConcat
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeConcat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeConcat0002";
      try {
        const letters1 = new Array<String>("a", "b", "c");
        // const letters2 = [];
        const letters2 = new Array<String>();
        const alphaNumeric = letters1.concat(letters2);
        console.log(`${TAG} result:` + JSON.stringify(alphaNumeric));
        expect(JSON.stringify(alphaNumeric)).assertEqual('["a","b","c"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_2900
     * @tc.name        testPrototypeConcat0003
     * @tc.desc        Test the function of the interface PrototypeConcat
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeConcat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeConcat0003";
      try {
        const letters1 = new Array<string>("a", "b", "c");
        const letters2 = new Array<string>('');
        const alphaNumeric = letters1.concat(letters2);
        console.log(`${TAG} result:` + JSON.stringify(alphaNumeric));
        expect(JSON.stringify(alphaNumeric)).assertEqual('["a","b","c",""]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_3000
     * @tc.name        testPrototypeConcat0004
     * @tc.desc        Test the function of the interface PrototypeConcat
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeConcat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeConcat0004";
      try {
        const num1 = new Array<number>(1, 2, 3);
        const num2 = new Array<number>(4, 5, 6);
        const num3 = new Array<number>(7, 8, 9);
        const numbers = num1.concat(num2, num3);
        console.log(`${TAG} result:` + JSON.stringify(numbers));
        expect(JSON.stringify(numbers)).assertEqual('[1,2,3,4,5,6,7,8,9]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_3100
     * @tc.name        testPrototypeConcat0005
     * @tc.desc        Test the function of the interface PrototypeConcat
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeConcat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeConcat0005";
      try {
        const letters = new Array<string>("a", "b", "c");
        const alphaNumeric = letters.concat(['z'], ['d', 'e']);
        console.log(`${TAG} result:` + JSON.stringify(alphaNumeric));
        expect(JSON.stringify(alphaNumeric)).assertEqual('["a","b","c","z","d","e"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_3200
     * @tc.name        testPrototypeConcat0006
     * @tc.desc        Test the function of the interface PrototypeConcat
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeConcat0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeConcat0006";
      try {
        const num1 = new Array<Number[]|Number>([1]);
        const num2 = new Array<Number[]|Number>(2, 3);
        const obj = (num1 as Array<Number[]|Number>).concat(num2 as Array<Number[]|Number>);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[[1],2,3]');
        expect(obj.length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_3300
     * @tc.name        testPrototypeConcat0007
     * @tc.desc        Test the function of the interface PrototypeConcat
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeConcat0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeConcat0007";
      try {
        const num1 = [1, 2, 3];
        const num2 = [4, 5];
        const obj = num1.concat(num2);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,2,3,4,5]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_3400
     * @tc.name        testPrototypeConcat0008
     * @tc.desc        Test the function of the interface PrototypeConcat
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeConcat0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeConcat0008";
      try {
        const num1 = new Array<Number>(1, 2);
        const num2 = new Array<Number>(3, 4,);
        const obj = num1.concat(num2);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,2,3,4]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_3500
     * @tc.name        testPrototypeCopyWithin0001
     * @tc.desc        Test the function of the interface PrototypeCopyWithin
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeCopyWithin0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeCopyWithin0001";
      try {
        let arr1 = new Array<Number>(1, 2, 3, 4, 5);
        const obj = arr1.copyWithin(-2, 1);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,2,3,2,3]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_3600
     * @tc.name        testPrototypeCopyWithin0002
     * @tc.desc        Test the function of the interface PrototypeCopyWithin
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeCopyWithin0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeCopyWithin0002";
      try {
        let arr1 = new Array<Number>(1, 2, 3, 4, 5);
        const obj = arr1.copyWithin(0, 3);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[4,5,3,4,5]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_3700
     * @tc.name        testPrototypeCopyWithin0003
     * @tc.desc        Test the function of the interface PrototypeCopyWithin
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeCopyWithin0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeCopyWithin0003";
      try {
        let arr1 = new Array<Number>(1, 2, 3, 4, 5);
        const obj = arr1.copyWithin(0, 3, 4);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[4,2,3,4,5]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_3800
     * @tc.name        testPrototypeCopyWithin0004
     * @tc.desc        Test the function of the interface PrototypeCopyWithin
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeCopyWithin0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeCopyWithin0004";
      try {
        let arr1 = new Array<Number>(1, 2, 3, 4, 5);
        const obj = arr1.copyWithin(-2, -3, -1);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,2,3,3,4]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_3900
     * @tc.name        testPrototypeFill0001
     * @tc.desc        Test the function of the interface PrototypeFill
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeFill0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeFill0001";
      try {
        let arr = new Array<Number>(1, 2, 3);
        let obj = arr.fill(4);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[4,4,4]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_4000
     * @tc.name        testPrototypeFill0002
     * @tc.desc        Test the function of the interface PrototypeFill
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeFill0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeFill0002";
      try {
        let arr = new Array<Number>(1, 2, 3);
        let obj = arr.fill(4, 1);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,4,4]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_4100
     * @tc.name        testPrototypeFill0003
     * @tc.desc        Test the function of the interface PrototypeFill
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeFill0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeFill0003";
      try {
        let arr = new Array<Number>(1, 2, 3);
        let obj = arr.fill(4, 1, 2);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,4,3]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_4200
     * @tc.name        testPrototypeFill0004
     * @tc.desc        Test the function of the interface PrototypeFill
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeFill0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeFill0004";
      try {
        let arr = new Array<Number>(1, 2, 3);
        let obj = arr.fill(4, 1, 1);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,2,3]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_4300
     * @tc.name        testPrototypeFill0005
     * @tc.desc        Test the function of the interface PrototypeFill
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeFill0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeFill0005";
      try {
        let arr = new Array<Number>(1, 2, 3);
        let obj = arr.fill(4, 3, 3);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,2,3]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_4400
     * @tc.name        testPrototypeFill0006
     * @tc.desc        Test the function of the interface PrototypeFill
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeFill0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeFill0006";
      try {
        let arr = new Array<Number>(1, 2, 3);
        let obj = arr.fill(4, -3, -2);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[4,2,3]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_4500
     * @tc.name        testPrototypeFill0007
     * @tc.desc        Test the function of the interface PrototypeFill
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeFill0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeFill0007";
      try {
        let arr = new Array<Number>(1, 2, 3);
        let obj = arr.fill(4, NaN.toInt(), NaN.toInt());
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,2,3]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_4600
     * @tc.name        testPrototypeFill0008
     * @tc.desc        Test the function of the interface PrototypeFill
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeFill0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeFill0008";
      try {
        let arr = new Array<Number>(1, 2, 3);
        let obj = arr.fill(4, 3, 5);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,2,3]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_4700
     * @tc.name        testPrototypeFill0009
     * @tc.desc        Test the function of the interface PrototypeFill
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeFill0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeFill0009";
      try {
        let arr = new Array<Number>(3);
        let obj = arr.fill(4);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[4,4,4]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_4800
     * @tc.name        testPrototypeFill0010
     * @tc.desc        Test the function of the interface PrototypeFill
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeFill0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeFill0010";
      try {
        let arr = new Array<Number>(1, 2, 3);
        let obj = arr.fill(4, undefined, undefined);
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[4,4,4]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_4900
     * @tc.name        testPrototypeFind0001
     * @tc.desc        Test the function of the interface PrototypeFind
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeFind0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeFind0001";
      try {
        const array1 = new Array<Number>(11, 12);
        const found = array1.find((element) => element > 10);
        console.log(`${TAG} result:` + JSON.stringify(found));
        expect(JSON.stringify(found)).assertEqual('11');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_5000
     * @tc.name        testPrototypeFind0002
     * @tc.desc        Test the function of the interface PrototypeFind
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeFind0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeFind0002";
      try {
        const array1 = new Array<Number>(10, 12, 14);
        const found = array1.find((element) => element > 10);
        console.log(`${TAG} result:` + JSON.stringify(found));
        expect(JSON.stringify(found)).assertEqual('12');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_5100
     * @tc.name        testPrototypeFind0003
     * @tc.desc        Test the function of the interface PrototypeFind
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeFind0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeFind0003";
      try {
        const array1 = new Array<Number>(10, 12, 14, 255);
        const found = array1.find((element) => element > 100);
        console.log(`${TAG} result:` + JSON.stringify(found));
        expect(JSON.stringify(found)).assertEqual('255');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_5200
     * @tc.name        testPrototypeFlat0001
     * @tc.desc        Test the function of the interface PrototypeFlat
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeFlat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeFlat0001";
      try {
        const arr1 = new Array<number | number[]>(0, 1, 2, [3, 4]);
        const obj = arr1.flat();
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[0,1,2,3,4]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_5300
     * @tc.name        testPrototypeFlat0002
     * @tc.desc        Test the function of the interface PrototypeFlat
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeFlat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeFlat0002";
      try {
        const arr2 = new Array<Number | (Number | Number[])[]>(1, 2, [3, 4, [5, 6]]);
        let obj = arr2.flat();
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,2,3,4,[5,6]]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_5400
     * @tc.name        testPrototypeFlat0003
     * @tc.desc        Test the function of the interface PrototypeFlat
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeFlat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeFlat0003";
      try {
        const arr3 = new Array<Number | (Number | Number[])[]>(1, 2, [3, 4, [5, 6]]);
        let obj = arr3.flat(2);
        console.log(`${TAG} result:` + JSON.stringify(arr3.flat(2)));
        expect(JSON.stringify(arr3.flat(2))).assertEqual('[1,2,3,4,5,6]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_5600
     * @tc.name        testPrototypeFlat0005
     * @tc.desc        Test the function of the interface PrototypeFlat
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeFlat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeFlat0005";
      try {
        const arr5: (number | undefined)[] = [1, 2,3 , 4, 5];
        let obj = arr5.flat();
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,2,3,4,5]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_5700
     * @tc.name        testPrototypeFlat0006
     * @tc.desc        Test the function of the interface PrototypeFlat
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeFlat0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeFlat0006";
      try {
        const arr5: (number | undefined | (string[] | undefined[]))[] = [1,2 , 3, ["a", "b", "c"]];
        let obj = arr5.flat();
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,2,3,"a","b","c"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_5800
     * @tc.name        testPrototypeFlat0007
     * @tc.desc        Test the function of the interface PrototypeFlat
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeFlat0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeFlat0007";
      try {
        const array2: (number | undefined | (string | undefined | (string | null)[])[])[] = [1,2 , 3, ["a","b" , ["d",null , "e"]]];
        let obj = array2.flat();
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,2,3,"a","b",["d",null,"e"]]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_6000
     * @tc.name        testPrototypeFlat0009
     * @tc.desc        Test the function of the interface PrototypeFlat
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeFlat0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeFlat0009";
      try {
        const array2 = new Array<Number | undefined>(1, undefined, 3);
        let obj = array2.flat();
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[1,null,3]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_6100
     * @tc.name        testPrototypeFlat0010
     * @tc.desc        Test the function of the interface PrototypeFlat
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeFlat0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeFlat0010";
      try {
        const array2 = new Array<undefined>(undefined, undefined, undefined);
        let obj = array2.flat();
        console.log(`${TAG} result:` + JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual('[null,null,null]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_6200
     * @tc.name        testPrototypeFlatMap0001
     * @tc.desc        Test the function of the interface PrototypeFlatMap
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeFlatMap0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeFlatMap0001";
      try {
        const arr1 = new Array<number>(1, 2, 1);
        const result = arr1.flatMap((num) => (num === 2 ? [2, 2] : 1));
        expect(JSON.stringify(result)).assertEqual('[1,2,2,1]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_6300
     * @tc.name        testPrototypeFlatMap0002
     * @tc.desc        Test the function of the interface PrototypeFlatMap
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeFlatMap0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeFlatMap0002";
      try {
        const arr1 = new Array<Number | undefined>(1,2 , 1);
        const result = arr1.flatMap((num) => (num === 2 ? [2, 2] : 1));
        expect(JSON.stringify(result)).assertEqual('[1,2,2,1]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_6400
     * @tc.name        testPrototypeFlatMap0003
     * @tc.desc        Test the function of the interface PrototypeFlatMap
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeFlatMap0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeFlatMap0003";
      try {
        const arr1 = new Array<Number | undefined>(1, undefined, 1);
        const result = arr1.flatMap((num) => (num === 2 ? [2, 2] : 1));
        expect(JSON.stringify(result)).assertEqual('[1,1,1]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_6500
     * @tc.name        testPrototypeIncludes0001
     * @tc.desc        Test the function of the interface PrototypeIncludes
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeIncludes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeIncludes0001";
      try {
        const array1 = new Array<Number>(1, 2, 3);
        const result = array1.includes(2);
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_6600
     * @tc.name        testPrototypeIncludes0002
     * @tc.desc        Test the function of the interface PrototypeIncludes
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeIncludes0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeIncludes0002";
      try {
        let array1 = new Array<Number>(1, 2, 3);
        let value = array1.includes(2.1);
        console.log(`${TAG} result:` + value);
        expect(String(value)).assertEqual('false');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_6700
     * @tc.name        testPrototypeIncludes0003
     * @tc.desc        Test the function of the interface PrototypeIncludes
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeIncludes0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeIncludes0003";
      try {
        let array1 = new Array<Number>(1, 2, 3);
        let value = array1.includes(1, 2);
        console.log(`${TAG} result:` + value);
        expect(String(value)).assertEqual('false');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_6800
     * @tc.name        testPrototypeIncludes0004
     * @tc.desc        Test the function of the interface PrototypeIncludes
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeIncludes0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeIncludes0004";
      try {
        let array1 = new Array<Number>(1, 2, 3);
        let value = array1.includes(-1);
        console.log(`${TAG} result:` + value);
        expect(String(value)).assertEqual('false');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_6900
     * @tc.name        testPrototypeIncludes0005
     * @tc.desc        Test the function of the interface PrototypeIncludes
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeIncludes0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeIncludes0005";
      try {
        let array1 = new Array<Number>(1, 2, 3);
        let value = array1.includes(-1, -2);
        console.log(`${TAG} result:` + value);
        expect(String(value)).assertEqual('false');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_7000
     * @tc.name        testPrototypeIncludes0006
     * @tc.desc        Test the function of the interface PrototypeIncludes
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeIncludes0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeIncludes0006";
      try {
        let array1 = [1, 2, NaN];
        let value = array1.includes(NaN);
        console.log(`${TAG} result:` + value);
       expect(String(value)).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_7100
     * @tc.name        testPrototypeIncludes0007
     * @tc.desc        Test the function of the interface PrototypeIncludes
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeIncludes0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeIncludes0007";
      try {
        let array1 = new Array<string>('1', '2', '3');
        let value = array1.includes('3');
        console.log(`${TAG} result:` + value);
        expect(String(value)).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_7200
     * @tc.name        testPrototypeIncludes0008
     * @tc.desc        Test the function of the interface PrototypeIncludes
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeIncludes0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeIncludes0008";
      try {
        const arr = new Array<string>("a", "b", "c");
        let value = arr.includes("c", 3);
        console.log(`${TAG} result:` + value);
        expect(String(value)).assertEqual('false');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_7300
     * @tc.name        testPrototypeIncludes0009
     * @tc.desc        Test the function of the interface PrototypeIncludes
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeIncludes0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeIncludes0009";
      try {
        const arr = new Array<string>("a", "b", "c");
        let value = arr.includes("c", 100);
        console.log(`${TAG} result:` + value);
        expect(String(value)).assertEqual('false');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_7400
     * @tc.name        testPrototypeIncludes0010
     * @tc.desc        Test the function of the interface PrototypeIncludes
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeIncludes0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeIncludes0010";
      try {
        const arr = new Array<string>("a", "b", "c");
        let value = arr.includes("c", 3);
        console.log(`${TAG} result:` + value);
        expect(String(value)).assertEqual('false');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_7500
     * @tc.name        testPrototypeIncludes0011
     * @tc.desc        Test the function of the interface PrototypeIncludes
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeIncludes0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeIncludes0011";
      try {
        const arr = new Array<string>("a", "b", "c");
        let value = arr.includes("c", 100);
        console.log(`${TAG} result:` + value);
        expect(String(value)).assertEqual('false');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_7600
     * @tc.name        testPrototypeIncludes0012
     * @tc.desc        Test the function of the interface PrototypeIncludes
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeIncludes0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeIncludes0012";
      try {
        const arr = new Array<string>("a", "b", "c");
        let value = arr.includes("a", -100);
        console.log(`${TAG} result:` + value);
        expect(String(value)).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_7700
     * @tc.name        testPrototypeIncludes0013
     * @tc.desc        Test the function of the interface PrototypeIncludes
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeIncludes0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeIncludes0013";
      try {
        const arr = new Array<string>("a", "b", "c");
        let value = arr.includes("b", -100);
        console.log(`${TAG} result:` + value);
        expect(String(value)).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_7800
     * @tc.name        testPrototypeIncludes0014
     * @tc.desc        Test the function of the interface PrototypeIncludes
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeIncludes0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeIncludes0014";
      try {
        const arr = new Array<string>("a", "b", "c");
        let value = arr.includes("c", -100);
        console.log(`${TAG} result:` + value);
        expect(String(value)).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_7900
     * @tc.name        testPrototypeIncludes0015
     * @tc.desc        Test the function of the interface PrototypeIncludes
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeIncludes0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeIncludes0015";
      try {
        const arr = new Array<string>("a", "b", "c");
        let value = arr.includes("a", -2);
        console.log(`${TAG} result:` + value);
        expect(String(value)).assertEqual('false');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_8000
     * @tc.name        testPrototypeIndexOf0001
     * @tc.desc        Test the function of the interface PrototypeIndexOf
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeIndexOf0001";
      try {
        const array = new Array<Number>(2, 9, 9);
        const result = array.indexOf(2);
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_8100
     * @tc.name        testPrototypeIndexOf0002
     * @tc.desc        Test the function of the interface PrototypeIndexOf
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeIndexOf0002";
      try {
        const array = new Array<Number>(2, 9, 9);
        const result = array.indexOf(7);
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('-1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_8200
     * @tc.name        testPrototypeIndexOf0003
     * @tc.desc        Test the function of the interface PrototypeIndexOf
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeIndexOf0003";
      try {
        const array = new Array<Number>(2, 9, 9);
        const result = array.indexOf(9, 2);
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('2');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_8300
     * @tc.name        testPrototypeIndexOf0004
     * @tc.desc        Test the function of the interface PrototypeIndexOf
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeIndexOf0004";
      try {
        const array = new Array<Number>(2, 9, 9);
        const result = array.indexOf(2, -1);
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('-1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_8400
     * @tc.name        testPrototypeIndexOf0005
     * @tc.desc        Test the function of the interface PrototypeIndexOf
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeIndexOf0005";
      try {
        const array = new Array<Number>(2, 9, 9);
        const result = array.indexOf(2, -3);
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_8500
     * @tc.name        testPrototypeIndexOf0006
     * @tc.desc        Test the function of the interface PrototypeIndexOf
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeIndexOf0006";
      try {
        const array = [NaN];
        const result = array.indexOf(NaN);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_8600
     * @tc.name        testPrototypeIndexOf0007
     * @tc.desc        Test the function of the interface PrototypeIndexOf
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeIndexOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeIndexOf0007";
      try {
        const array = new Array<string>('apple', 'banana', 'cat');
        const result = array.indexOf('1');
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('-1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_8700
     * @tc.name        testPrototypeIndexOf0008
     * @tc.desc        Test the function of the interface PrototypeIndexOf
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeIndexOf0008";
      try {
        const array = new Array<string>('apple', 'banana', 'cat');
        const result = array.indexOf('apple');
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_8800
     * @tc.name        testPrototypeIndexOf0009
     * @tc.desc        Test the function of the interface PrototypeIndexOf
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeIndexOf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeIndexOf0009";
      try {
        const array = new Array<string>('apple', 'banana', 'cat');
        const result = array.indexOf('abc', 2);
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('-1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_8900
     * @tc.name        testPrototypeIndexOf0010
     * @tc.desc        Test the function of the interface PrototypeIndexOf
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeIndexOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeIndexOf0010";
      try {
        const array = new Array<string>('apple', 'banana', 'cat');
        const result = array.indexOf('apple', 0);
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_9000
     * @tc.name        testPrototypeIndexOf0011
     * @tc.desc        Test the function of the interface PrototypeIndexOf
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeIndexOf0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeIndexOf0011";
      try {
        const array = new Array<string>('apple', 'banana', 'cat');
        const result = array.indexOf('banana', 2);
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('-1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_9100
     * @tc.name        testPrototypeJoin0001
     * @tc.desc        Test the function of the interface PrototypeJoin
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeJoin0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeJoin0001";
      try {
        const array = new Array<string>("Wind", "Water", "Fire");
        const result = array.join();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual('Wind,Water,Fire');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_9200
     * @tc.name        testPrototypeJoin0002
     * @tc.desc        Test the function of the interface PrototypeJoin
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeJoin0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeJoin0002";
      try {
        const array = new Array<string>("Wind", "Water", "Fire");
        const result = array.join(", ");
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual('Wind, Water, Fire');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_9300
     * @tc.name        testPrototypeJoin0003
     * @tc.desc        Test the function of the interface PrototypeJoin
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeJoin0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeJoin0003";
      try {
        const array = new Array<string>("Wind", "Water", "Fire");
        const result = array.join(" + ");
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual('Wind + Water + Fire');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_9400
     * @tc.name        testPrototypeJoin0004
     * @tc.desc        Test the function of the interface PrototypeJoin
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeJoin0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeJoin0004";
      try {
        const array = new Array<string>("Wind", "Water", "Fire");
        const result = array.join("");
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual('WindWaterFire');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_9500
     * @tc.name        testPrototypeJoin0005
     * @tc.desc        Test the function of the interface PrototypeJoin
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeJoin0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeJoin0005";
      try {
        const array = new Array<Number>(1, 2, 3);
        const result = array.join();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_9600
     * @tc.name        testPrototypeJoin0006
     * @tc.desc        Test the function of the interface PrototypeJoin
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeJoin0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeJoin0006";
      try {
        const array = new Array<Number>(1, 2, 3);
        const result = array.join(", ");
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual('1, 2, 3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_97000
     * @tc.name        testPrototypeJoin0007
     * @tc.desc        Test the function of the interface PrototypeJoin
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeJoin0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeJoin0007";
      try {
        const array = new Array<Number>(1, 2, 3);
        const result = array.join(" + ");
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual('1 + 2 + 3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_98000
     * @tc.name        testPrototypeJoin0008
     * @tc.desc        Test the function of the interface PrototypeJoin
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeJoin0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeJoin0008";
      try {
        const array = new Array<Number>(1, 2, 3);
        const result = array.join("");
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual('123');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_99000
     * @tc.name        testPrototypeJoin0009
     * @tc.desc        Test the function of the interface PrototypeJoin
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeJoin0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeJoin0009";
      try {
        const array = new Array<Number | undefined>(1, undefined, 3);
        const result = array.join();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual('1,,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_100000
     * @tc.name        testPrototypeKeys0001
     * @tc.desc        Test the function of the interface PrototypeKeys.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeKeys0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeKeys0001";
      try {
        const arr = new Array<string>("a", "b", "c");
        const sparseKeys = Object.keys(arr);
        console.log(`${TAG} result:` + JSON.stringify(sparseKeys));
        expect(JSON.stringify(sparseKeys)).assertEqual('["0","1","2"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_101000
     * @tc.name        testPrototypeKeys0002
     * @tc.desc        Test the function of the interface PrototypeKeys.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeKeys0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeKeys0002";
      try {
        const arr = new Array<string>("a", "", "c");
        const sparseKeys = Object.keys(arr);
        console.log(`${TAG} result:` + JSON.stringify(sparseKeys));
        expect(JSON.stringify(sparseKeys)).assertEqual('["0","1","2"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_102000
     * @tc.name        testPrototypeKeys0003
     * @tc.desc        Test the function of the interface PrototypeKeys.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeKeys0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeKeys0003";
      try {
        const arr = ["a","b" , "c"];
        const sparseKeys = Object.keys(arr);
        console.log(`${TAG} result:` + JSON.stringify(sparseKeys));
        expect(JSON.stringify(sparseKeys)).assertEqual('["0","1","2"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_103000
     * @tc.name        testPrototypeKeys0004
     * @tc.desc        Test the function of the interface PrototypeKeys.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeKeys0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeKeys0004";
      try {
        const arr = new Array<string | undefined>("a", undefined, "c");
        const sparseKeys = Object.keys(arr);
        console.log(`${TAG} result:` + JSON.stringify(sparseKeys));
        expect(JSON.stringify(sparseKeys)).assertEqual('["0","1","2"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_104000
     * @tc.name        testPrototypeLastIndexOf0001
     * @tc.desc        Test the function of the interface PrototypeLastIndexOf.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeLastIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeLastIndexOf0001";
      try {
        const numbers = new Array<Number>(2, 5, 9, 2);
        const result = numbers.lastIndexOf(2);
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_105000
     * @tc.name        testPrototypeLastIndexOf0002
     * @tc.desc        Test the function of the interface PrototypeLastIndexOf.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeLastIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeLastIndexOf0002";
      try {
        const numbers = new Array<Number>(2, 5, 9, 2);
        const result = numbers.lastIndexOf(2.5);
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('-1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_106000
     * @tc.name        testPrototypeLastIndexOf0003
     * @tc.desc        Test the function of the interface PrototypeLastIndexOf.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeLastIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeLastIndexOf0003";
      try {
        const numbers = new Array<Number>(2, 5, 9, 2);
        const result = numbers.lastIndexOf(7);
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('-1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_107000
     * @tc.name        testPrototypeLastIndexOf0004
     * @tc.desc        Test the function of the interface PrototypeLastIndexOf.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeLastIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeLastIndexOf0004";
      try {
        const numbers = new Array<Number>(2, 5, 9, 2);
        const result = numbers.lastIndexOf(2, 3);
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_108000
     * @tc.name        testPrototypeLastIndexOf0005
     * @tc.desc        Test the function of the interface PrototypeLastIndexOf.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeLastIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeLastIndexOf0005";
      try {
        const numbers = new Array<Number>(2, 5, 9, 2);
        const result = numbers.lastIndexOf(2, 2);
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_109000
     * @tc.name        testPrototypeLastIndexOf0006
     * @tc.desc        Test the function of the interface PrototypeLastIndexOf.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeLastIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeLastIndexOf0006";
      try {
        const numbers = new Array<Number>(2, 5, 9, 2);
        const result = numbers.lastIndexOf(2, -2);
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_111000
     * @tc.name        testPrototypeLastIndexOf0008
     * @tc.desc        Test the function of the interface PrototypeLastIndexOf.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeLastIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeLastIndexOf0008";
      try {
        const numbers = new Array<Number>(2, 5, 9, 2);
        const result = numbers.lastIndexOf(-1);
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('-1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_112000
     * @tc.name        testPrototypeLastIndexOf0009
     * @tc.desc        Test the function of the interface PrototypeLastIndexOf.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeLastIndexOf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeLastIndexOf0009";
      try {
        const numbers = new Array<Number>(2, 5, 9, 2);
        const result = numbers.lastIndexOf(500);
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('-1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_113000
     * @tc.name        testPrototypeLastIndexOf0010
     * @tc.desc        Test the function of the interface PrototypeLastIndexOf.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testPrototypeLastIndexOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testPrototypeLastIndexOf0010";
      try {
        const numbers = new Array<Number>(2, 5, 9, 2);
        const result = numbers.lastIndexOf(NaN);
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
  })
}