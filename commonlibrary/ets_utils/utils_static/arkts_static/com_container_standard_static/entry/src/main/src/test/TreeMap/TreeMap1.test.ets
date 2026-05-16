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

import TreeMap from '@ohos.util.TreeMap';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Level,
  Size
} from '../../../../hypium/index';
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

export default function TreeMapTest1() {
  describe("TreeMapTest1", (): void => {
    afterEach(() => {
      await Utils.msSleep(10)
    })

    /**
     * @tc.name   testTreeMap001
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_0100
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeMap001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      try {
        let treeMap = new TreeMap<number, number>();
        expect(String(treeMap != undefined)).assertEqual('true');
      } catch (err) {
        if (err instanceof BusinessError) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200012);
          expect(err.message).assertEqual("The TreeMap's constructor cannot be directly invoked");
        }
      }
    });

    /**
     * @tc.name   testTreeMap002
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_0200
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeMap002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      try {
        let treeMap = new TreeMap<string, number>((a: string, b: string): number => {
          return a.localeCompare(b)
        });
        expect(String(treeMap != undefined)).assertEqual('true');
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
        if (err instanceof BusinessError) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200012);
          expect(err.message).assertEqual("The TreeMap's constructor cannot be directly invoked");
        }
      }
    });

    /**
     * @tc.name   testTreeMap003
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_0300
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeMap003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "四");
      let res = treeMap.get(0);
      expect(res).assertEqual("四");
    });

    /**
     * @tc.name   testTreeMap004
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_0400
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeMap004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let treeMap = new TreeMap<number, number>();
      treeMap.set(0, 8);
      let res = treeMap.get(0);
      expect(String(res)).assertEqual('8');
    });

    /**
     * @tc.name   testTreeMap005
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_0500
     * @tc.desc   Test the function By TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeMap005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let treeMap = new TreeMap<number, Array<number>>();
      let a = new Array<number>(1, 2, 3, 4);
      treeMap.set(0, a);
      let res = treeMap.get(0);
      expect(String(res)).assertEqual(String(a));
    });

    /**
     * @tc.name   testTreeMap006
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_0600
     * @tc.desc   Test the function By TreeMap. Add a pair of key value pairs to the TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeMap006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let treeMap = new TreeMap<number, InfoC>();
      let a = new InfoC("lala", "13");
      treeMap.set(0, a);
      let res = treeMap.get(0);
      expect(JSON.stringify(res)).assertEqual(JSON.stringify(a));
    });

    /**
     * @tc.name   testSet006
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_0700
     * @tc.desc   Test the function By TreeMap. Add a pair of key value pairs to the TreeMap. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(2, "*");
      let res = treeMap.get(2);
      expect(res).assertEqual("*");
    });

    /**
     * @tc.name   testTreeMap008
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_0800
     * @tc.desc   Test the function By TreeMap. Add a pair of key value pairs to the TreeMap. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeMap008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let treeMap = new TreeMap<number, number>();
      treeMap.set(-2, 3.14);
      let res = treeMap.get(-2);
      expect(String(res)).assertEqual('3.14');
    });

    /**
     * @tc.name   testTreeMap009
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_0900
     * @tc.desc   Test the function By TreeMap. Add a pair of key value pairs to the TreeMap. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeMap009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let treeMap = new TreeMap<number, boolean>();
      treeMap.set(100, true);
      let res = treeMap.get(100);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testTreeMap010
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_1000
     * @tc.desc   Test the function By TreeMap. Add a pair of key value pairs to the TreeMap. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeMap010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(100, "");
      let res = treeMap.get(100);
      expect(res).assertEqual("");
    });

    /**
     * @tc.name   testTreeMap011
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_1100
     * @tc.desc   Test the function By TreeMap. Add a pair of key value pairs to the TreeMap. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeMap011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let treeMap = new TreeMap<string, string>();
      treeMap.set("a", "四");
      let res = treeMap.get("a");
      expect(res).assertEqual("四");
    });

    /**
     * @tc.name   testTreeMap012
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_1200
     * @tc.desc   Test the function By TreeMap. Add a pair of key value pairs to the TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeMap012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let treeMap = new TreeMap<number, number>();
      for (let i = 0; i < 10000; i++) {
        treeMap.set(0, 8);
      }
      let res = treeMap.get(0);
      expect(String(res)).assertEqual('8');
      expect(String(treeMap.length)).assertEqual('1');
    });

    /**
     * @tc.name   testTreeMap013
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_1300
     * @tc.desc   Test the function By TreeMap. Determine whether the TreeMap contains the specified key. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTreeMap013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      let res = treeMap.hasKey(1);
      expect(String(res)).assertEqual('true');
      let res1 = treeMap.hasKey(6);
      expect(String(res1)).assertEqual('false');
    });

    /**
     * @tc.name   testTreeMap014
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_1400
     * @tc.desc   Test the function By TreeMap. Determine whether the TreeMap contains the specified Value. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeMap014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      let res = treeMap.hasValue("a");
      expect(String(res)).assertEqual('true');
      let res1 = treeMap.hasValue("d");
      expect(String(res1)).assertEqual('false');
    });

    /**
     * @tc.name   testTreeMap015
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_1500
     * @tc.desc   Test the function By TreeMap. Get the corresponding value through the key. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeMap015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      let res = treeMap.get(1);
      expect(res).assertEqual("b");
    });

    /**
     * @tc.name   testTreeMap016
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_1600
     * @tc.desc   Test the function By TreeMap. Get the corresponding value through the key. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeMap016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
      let res = treeMap.get(1);
      expect(String(res)).assertEqual('undefined');
    });

    /**
     * @tc.name   testTreeMap017
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_1700
     * @tc.desc   Test the function By TreeMap. Get the corresponding value through the key. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeMap017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.clear();
      expect(String(treeMap.length)).assertEqual('0');
      let res = treeMap.get(0);
      expect(String(res)).assertEqual('undefined');
    });

    /**
     * @tc.name   testTreeMap018
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_1800
     * @tc.desc   Test the function By TreeMap. Get the key that ranks first in the TreeMap instance. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeMap018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      let res = treeMap.getFirstKey();
      expect(String(res)).assertEqual('0');
    });

    /**
     * @tc.name   testTreeMap019
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_1900
     * @tc.desc   Test the function By TreeMap. Get the key that ranks first in the TreeMap instance. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeMap019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
      try {
        let res = treeMap.getFirstKey();
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.message).assertEqual("Container is empty");
      }
    });

    /**
     * @tc.name   testTreeMap020
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_2000
     * @tc.desc   Test the function By TreeMap. Get the last sorted key in the TreeMap instance. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeMap020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      let res = treeMap.getLastKey();
      expect(String(res)).assertEqual('2');
    });

    /**
     * @tc.name   testTreeMap021
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_2100
     * @tc.desc   Test the function By TreeMap. Get the last sorted key in the TreeMap instance. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeMap021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
      try {
        let res = treeMap.getLastKey();
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.message).assertEqual("Container is empty");
      }
    });

    /**
     * @tc.name   testTreeMap022
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_2200
     * @tc.desc   Test the function By TreeMap. Copy key value pairs from one HashMap to another. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeMap022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      let treeMap1 = new TreeMap<number, string>();
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
     * @tc.name   testTreeMap023
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_2300
     * @tc.desc   Test the function By TreeMap. Delete key value pairs according to key. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeMap023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      let res = treeMap.remove(1);
      expect(res).assertEqual("b");
    });

    /**
     * @tc.name   testTreeMap024
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_2400
     * @tc.desc   Test the function By TreeMap. Delete key value pairs according to key. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeMap024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      let res = treeMap.remove(1);
      expect(String(res)).assertEqual('undefined');
    });

    /**
     * @tc.name   testTreeMap025
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_2500
     * @tc.desc   Test the function By TreeMap. Clear all key value pairs in TreeMap. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeMap025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      treeMap.clear();
      let res = treeMap.length;
      expect(String(res)).assertEqual('0');
    });

    /**
     * @tc.name   testTreeMap026
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_2600
     * @tc.desc   Test the function By TreeMap. Clear all key value pairs in TreeMap. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeMap026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      treeMap.clear();
      let res = treeMap.length;
      expect(String(res)).assertEqual('0');
      treeMap.set(3, "d");
      let va = treeMap.get(3);
      expect(va).assertEqual("d");
    });

    /**
     * @tc.name   testTreeMap027
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_2700
     * @tc.desc   Test the function By TreeMap. Get a key that is a little lower than the specified key sort.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeMap027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      treeMap.set(3, "d");
      treeMap.set(4, "g");
      let res = treeMap.getLowerKey(2);
      expect(String(res)).assertEqual('1');
    });

    /**
     * @tc.name   testTreeMap028
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_2800
     * @tc.desc   Test the function By TreeMap. Get a key that is a little lower than the specified key sort. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeMap028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
      try {
        let res = treeMap.getLowerKey(2);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.message).assertEqual("Container is empty");
      }
    });

    /**
     * @tc.name   testTreeMap029
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_2900
     * @tc.desc   Test the function By TreeMap. Get a key that is a little higher than the specified key sort. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeMap029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      treeMap.set(3, "d");
      treeMap.set(4, "g");
      let res = treeMap.getHigherKey(2);
      expect(String(res)).assertEqual('3');
    });

    /**
     * @tc.name   testTreeMap030
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_3000
     * @tc.desc   Test the function By TreeMap. Get a key that is a little higher than the specified key sort. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeMap030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
      try {
        let res = treeMap.getHigherKey(2);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.message).assertEqual("Container is empty");
      }
    });

    /**
     * @tc.name   testTreeMap031
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_3100
     * @tc.desc   Test the function By TreeMap. Get a collection of all the keys in the TreeMap. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeMap031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      treeMap.set(3, "d");
      treeMap.set(4, "g");
      let res = treeMap.keys();
      expect(String(res.next().value)).assertEqual('0');
      expect(String(res.next().value)).assertEqual('1');
      expect(String(res.next().value)).assertEqual('2');
      expect(String(res.next().value)).assertEqual('3');
      expect(String(res.next().value)).assertEqual('4');
    });

    /**
     * @tc.name   testTreeMap032
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_3200
     * @tc.desc   Test the function By TreeMap. Get a collection of all the values in the TreeMap. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeMap032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
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
     * @tc.name   testTreeMap033
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_3300
     * @tc.desc   Test the function By TreeMap. Modify the corresponding value according to the specified key. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeMap033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
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
     * @tc.name   testTreeMap034
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_3400
     * @tc.desc   Test the function By TreeMap. Modify the corresponding value according to the specified key. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeMap034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      let res = treeMap.replace(2, "B");
      expect(String(res)).assertEqual('false');
      let res1 = treeMap.get(2);
      expect(String(res1)).assertEqual('undefined');
    });

    /**
     * @tc.name   testTreeMap035
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_3500
     * @tc.desc   Test the function By TreeMap. Get the number of key value pairs in the TreeMap instance. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTreeMap035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      treeMap.set(3, "d");
      treeMap.set(4, "g");
      let res = treeMap.length;
      expect(String(res)).assertEqual('5');
    });

    /**
     * @tc.name   testLength036
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_3600
     * @tc.desc   Test the function By TreeMap. Get the number of key value pairs in the TreeMap instance. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testLength036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
      let res = treeMap.length;
      expect(String(res)).assertEqual('0');
    });

    /**
     * @tc.name   testForEach037
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_3700
     * @tc.desc   Test the function By TreeMap. Traverse all key value pairs in the TreeMap instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testForEach037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      treeMap.set(3, "d");
      treeMap.set(4, "g");
      let arr1 = new Array<string>();
      let arr2 = new Array<number>();
      treeMap.forEach((value, key) => {
        arr1.push(value);
      });
      treeMap.forEach((value, key) => {
        arr2.push(key);
      });
      let arr = new Array<string>("a", "b", "c", "d", "g");
      for (let i = 0; i < arr1.length; i++) {
        expect(String(arr[i])).assertEqual(String(arr1[i]));
      }
      let arr3 = new Array<number>(0, 1, 2, 3, 4);
      for (let i = 0; i < arr3.length; i++) {
        expect(String(arr3[i])).assertEqual(String(arr2[i]));
      }
    });

    /**
     * @tc.name   testEntries038
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_3800
     * @tc.desc   Test the function By TreeMap. Get all key value pairs collection in TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testEntries038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      treeMap.set(3, "d");
      treeMap.set(4, "g");
      let entries = treeMap.entries();
      let flag = true;
      for (let i = 0, len = treeMap.length; i < len; i++) {
        let entry = entries.next().value!;
        let res = treeMap.get(entry[0]);
        if (res != entry[1]) {
          flag = false;
          break;
        }
      }
      expect(String(flag)).assertEqual('true');
    });

    /**
     * @tc.name   testIterator039
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_3900
     * @tc.desc   Test the function By TreeMap. Traverse all key value pairs in the TreeMap instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIterator039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      treeMap.set(3, "d");
      treeMap.set(4, "g");
      let arr = new Array<string>("0,a", "1,b", "2,c", "3,d", "4,g");
      let iterArr = new Array<string>();
      treeMap.forEach((value, key) => {
        iterArr.push(key + "," + value);
      })
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(iterArr[i]);
      }
    });

    /**
     * @tc.name   testIterator040
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_4000
     * @tc.desc   Test the function By TreeMap. Traverse all key value pairs in the TreeMap instance. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIterator040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      treeMap.set(3, "d");
      treeMap.set(4, "g");
      let iters = treeMap.entries();
      let flag = true;
      for (let i = 0, len = treeMap.length; i < len; i++) {
        let entry = iters.next().value!;
        let res = treeMap.get(entry[0]);
        if (res != entry[1]) {
          flag = false;
          break;
        }
      }
      expect(String(flag)).assertEqual('true');
    });

    /**
     * @tc.name   testIsEmpty041
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_4100
     * @tc.desc   Test the function By TreeMap. Determine whether the TreeMap instance is empty. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIsEmpty041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      treeMap.set(3, "d");
      treeMap.set(4, "g");
      let res = treeMap.isEmpty();
      expect(String(res)).assertEqual('false');
      treeMap.clear();
      let res1 = treeMap.isEmpty();
      expect(String(res1)).assertEqual('true');
    });

    /**
     * @tc.name   testIsEmpty043
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP_4200
     * @tc.desc   Test the function By TreeMap. Copy key value pairs from one HashMap to another. For example
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIsEmpty043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      treeMap.set(3, "d");
      treeMap.set(4, "g");
      let iter = treeMap.$_iterator();
      let temp = iter.next();
      let flag = 0;
      while (!temp.done) {
        expect(treeMap.length).assertEqual(5);
        flag++;
        temp = iter.next();
      }
      expect(flag).assertEqual(5)
    });
  });
}
