/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import TreeSet from '@ohos.util.TreeSet';
import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import { BusinessError } from '@ohos.base';
import Utils from '../Util.test';

class InfoC {
  name: string
  age: string

  constructor(name: string = "lili", age: string = "13") {
    this.name = name
    this.age = age
  }
}

export default function TreeSetTest1() {
  describe("TreeSetTest1", (): void => {
    afterEach(() => {
      await Utils.msSleep(10)
    })
    /**
     * @tc.name   testTreeSet001
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_0100
     * @tc.desc   Test the function By treeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeSet001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      try {
        let treeSet = new TreeSet<string>();
        expect(String(treeSet != undefined)).assertEqual('true');
      } catch (err: BusinessError) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200012);
        expect(err.message).assertEqual("The TreeSet's constructor cannot be directly invoked");
      }
    });

    /**
     * @tc.name   testTreeSet002
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_0200
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeSet002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      try {
        let treeSet = new TreeSet<string>((a: string, b: string): number => {
          return a.localeCompare(b)
        });
        expect(String(treeSet != undefined)).assertEqual('true');
        treeSet.add("a");
        treeSet.add("c");
        treeSet.add("d");
        treeSet.add("b");
        expect(String(treeSet.length)).assertEqual('4');
        let numbers = Array.from(treeSet.values())
        for (let item of numbers) {
          let res = treeSet.remove(item)
          expect(String(res)).assertEqual('true');
        }
      } catch (err: BusinessError) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200012);
        expect(err.message).assertEqual("The TreeMap's constructor cannot be directly invoked");
      }
    });

    /**
     * @tc.name   testTreeSet003
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_0300
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeSet003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let treeSet = new TreeSet<string>();
      treeSet.add("四");
      let res = treeSet.has("四");
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testTreeSet004
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_0400
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeSet004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let treeSet = new TreeSet<number>();
      treeSet.add(8);
      let res = treeSet.has(8);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testTreeSet005
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_0500
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeSet005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let treeSet = new TreeSet<Array<number>>();
      let a = new Array<number>(1, 2, 3, 4);
      treeSet.add(a);
      let res = treeSet.has(a);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testTreeSet006
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_0600
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeSet006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let treeSet = new TreeSet<string>();
      treeSet.add("*");
      let res = treeSet.has("*");
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testTreeSet007
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_0700
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeSet007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let treeSet = new TreeSet<InfoC>();
      let a = new InfoC("lala", "13岁");
      treeSet.add(a);
      let res = treeSet.has(a);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testTreeSet008
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_0800
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeSet008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let treeSet = new TreeSet<number>();
      treeSet.add(1.234);
      let res = treeSet.has(1.234);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testTreeSet009
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_0900
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeSet009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let treeSet = new TreeSet<boolean>();
      treeSet.add(true);
      let res = treeSet.has(true);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testTreeSet010
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_1000
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeSet010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let treeSet = new TreeSet<string>();
      treeSet.add("");
      let res = treeSet.has("");
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testTreeSet011
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_1100
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeSet011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let treeSet = new TreeSet<number>();
      for (let i = 0; i < 10000; i++) {
        treeSet.add(i);
      }
      expect(String(treeSet.length)).assertEqual('10000');
      let res = treeSet.has(8888);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testTreeSet012
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_1200
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeSet012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let treeSet = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(1);
      treeSet.add(2);
      let res = treeSet.length;
      expect(String(res)).assertEqual('3');
    });

    /**
     * @tc.name   testTreeSet013
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_1300
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeSet013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let treeSet = new TreeSet<number>();
      let res = treeSet.length;
      expect(String(res)).assertEqual('0');
    });

    /**
     * @tc.name   testTreeSet014
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_1400
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeSet014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let treeSet = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(1);
      treeSet.add(2);
      let res = treeSet.has(2);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testTreeSet015
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_1500
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeSet015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let treeSet = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(1);
      treeSet.add(2);
      let res1 = treeSet.has(3);
      expect(String(res1)).assertEqual('false');
    });

    /**
     * @tc.name   testTreeSet016
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_1600
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeSet016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let treeSet = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(1);
      treeSet.add(2);
      treeSet.add(3);
      treeSet.add(4);
      let res = treeSet.getFirstValue();
      expect(String(res)).assertEqual('0');
    });

    /**
     * @tc.name   testTreeSet017
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_1700
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeSet017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let treeSet = new TreeSet<number>();
      try {
        let res = treeSet.getFirstValue();
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.message).assertEqual("Container is empty");
      }
    });

    /**
     * @tc.name   testTreeSet018
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_1800
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeSet018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeSet = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(1);
      treeSet.add(2);
      let res = treeSet.getLastValue();
      expect(String(res)).assertEqual('2');
    });

    /**
     * @tc.name   testTreeSet019
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_1900
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeSet019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeSet = new TreeSet<number>();
      try {
        let res = treeSet.getLastValue();
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.message).assertEqual("Container is empty");
      }
    });

    /**
     * @tc.name   testTreeSet020
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_2000
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeSet020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeSet = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(1);
      treeSet.add(2);
      treeSet.add(3);
      treeSet.add(4);
      let res = treeSet.getLowerValue(2);
      expect(String(res)).assertEqual('1');
    });

    /**
     * @tc.name   testTreeSet021
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_2100
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeSet021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeSet = new TreeSet<number>();
      try {
        let res = treeSet.getLowerValue(2);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.message).assertEqual("Container is empty");
      }
    });

    /**
     * @tc.name   testTreeSet022
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_2200
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeSet022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeSet = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(1);
      treeSet.add(2);
      treeSet.add(3);
      treeSet.add(4);
      let res = treeSet.getHigherValue(3);
      expect(String(res)).assertEqual('4');
    });

    /**
     * @tc.name   testTreeSet023
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_2300
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeSet023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeSet = new TreeSet<number>();
      try {
        let res = treeSet.getHigherValue(3);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.message).assertEqual("Container is empty");
      }
    });

    /**
     * @tc.name   testTreeSet024
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_2400
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeSet024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeSet = new TreeSet<string>();
      treeSet.add("a");
      treeSet.add("b");
      treeSet.add("c");
      treeSet.add("d");
      treeSet.add("e");
      let res = treeSet.popFirst();
      expect(res).assertEqual("a");
    });

    /**
     * @tc.name   testTreeSet025
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_2500
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeSet025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeSet = new TreeSet<number>();
      try {
        let res = treeSet.popFirst();
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.message).assertEqual("Container is empty");
      }
    });

    /**
     * @tc.name   testTreeSet026
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_2600
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeSet026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeSet = new TreeSet<string>();
      treeSet.add("a");
      treeSet.add("b");
      treeSet.add("c");
      treeSet.add("d");
      treeSet.add("e");
      let res = treeSet.popLast();
      expect(String(res)).assertEqual("e");
    });

    /**
     * @tc.name   testTreeSet027
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_2700
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeSet027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeSet = new TreeSet<number>();
      try {
        let res = treeSet.popLast();
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.message).assertEqual("Container is empty");
      }
    });

    /**
     * @tc.name   testTreeSet028
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_2800
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeSet028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeSet = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(1);
      treeSet.add(2);
      treeSet.clear();
      let res = treeSet.length;
      expect(String(res)).assertEqual('0');
    });

    /**
     * @tc.name   testTreeSet029
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_2900
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeSet029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeSet = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(1);
      treeSet.add(2);
      treeSet.clear();
      let res = treeSet.length;
      expect(String(res)).assertEqual('0');
      try {
        let res1 = treeSet.popFirst();
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.message).assertEqual("Container is empty");
      }
    });

    /**
     * @tc.name   testTreeSet030
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_3000
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeSet030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeSet = new TreeSet<string>();
      treeSet.add("a");
      let res1 = treeSet.isEmpty();
      expect(String(res1)).assertEqual('false');
    });

    /**
     * @tc.name   testTreeSet031
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_3100
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeSet031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeSet = new TreeSet<string>();
      let res2 = treeSet.isEmpty();
      expect(String(res2)).assertEqual('true');
    });

    /**
     * @tc.name   testTreeSet032
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_3200
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeSet032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeSet = new TreeSet<string>();
      treeSet.add("a");
      treeSet.add("b");
      treeSet.add("c");
      treeSet.add("c");
      treeSet.add("d");
      treeSet.add("g");
      let res1 = treeSet.remove("c");
      expect(String(res1)).assertEqual('true');
      let res2 = treeSet.has("c");
      expect(String(res2)).assertEqual('false');
    });

    /**
     * @tc.name   testTreeSet033
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_3300
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeSet033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeSet = new TreeSet<string>();
      let res = treeSet.remove("c");
      expect(String(res)).assertEqual('false');
    });

    /**
     * @tc.name   testTreeSet034
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_3400
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeSet034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeSet = new TreeSet<string>();
      treeSet.add("a");
      treeSet.add("b");
      treeSet.add("c");
      treeSet.add("d");
      treeSet.add("g");
      let res = treeSet.values();
      expect(String(res.next().value)).assertEqual("a");
      expect(String(res.next().value)).assertEqual("b");
      expect(String(res.next().value)).assertEqual("c");
      expect(String(res.next().value)).assertEqual("d");
      expect(String(res.next().value)).assertEqual("g");
    });

    /**
     * @tc.name   testTreeSet035
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_3500
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeSet035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeSet = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(1);
      treeSet.add(2);
      treeSet.add(3);
      treeSet.add(4);
      let arr1 = new Array<number>();
      treeSet.forEach((value, key) => {
        arr1.push(value);
      });
      let arr = new Array<number>(0, 1, 2, 3, 4);
      for (let i = 0; i < arr1.length; i++) {
        expect(String(arr[i])).assertEqual(String(arr1[i]));
      }
    });

    /**
     * @tc.name   testTreeSet036
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_3600
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeSet036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeSet = new TreeSet<string>();
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
     * @tc.name   testTreeSet037
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_3700
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeSet037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeSet = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(1);
      treeSet.add(2);
      treeSet.add(3);
      treeSet.add(4);
      let arr = new Array<number>();
      for (let item of treeSet) {
        arr.push(item);
      }
      let arr1 = new Array<number>(0, 1, 2, 3, 4);
      for (let i = 0; i < arr1.length; i++) {
        expect(String(arr[i])).assertEqual(String(arr1[i]));
      }
    });

    /**
     * @tc.name   testTreeSet038
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_3800
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeSet038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeSet = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(1);
      treeSet.add(2);
      treeSet.add(3);
      treeSet.add(4);
      let arr = new Array<Double>();
      let res = treeSet.values();
      let temp: Double | undefined = res.next().value;
      while (temp != undefined) {
        arr.push(temp);
        temp = res.next().value;
      }
      let arr1 = [0, 1, 2, 3, 4];
      for (let i = 0; i < arr1.length; i++) {
        expect(arr[i]).assertEqual(arr1[i]);
      }
    });

    /**
     * @tc.name   testTreeSet042
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_4200
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeSet042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeSet = new TreeSet<null>();
      try {
        let res = treeSet.getLowerValue(null);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.message).assertEqual("Container is empty");
      }
    });

    /**
     * @tc.name   testTreeSet043
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_4300
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeSet043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeSet = new TreeSet<null>();
      try {
        let res = treeSet.getHigherValue(null);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.message).assertEqual("Container is empty");
      }
    });

    /**
     * @tc.name   testTreeSet048
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESET_4800
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeSet048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeSet = new TreeSet<string>();
      treeSet.add("sparrow");
      treeSet.forEach((value, key) => {
        expect(value).assertEqual("sparrow");
        expect(key).assertEqual("sparrow");
      });
    });
  });
}
