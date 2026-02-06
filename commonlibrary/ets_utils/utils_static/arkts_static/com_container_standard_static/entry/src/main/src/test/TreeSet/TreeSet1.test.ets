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

import TreeSet from "@ohos.util.TreeSet";
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

export default function TreeSetTest1() {
describe("TreeSetTest1", (): void => {
  afterEach(() => {
    await Utils.msSleep(10)
  })
  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_0100
   * @tc.name       : testTreeSet001
   * @tc.desc       : Test the function By treeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
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
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_0200
   * @tc.name       : testTreeSet002
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  it("testTreeSet002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
    try {
      let treeSet = new TreeSet<string>((a: string, b: string): number => {return a.localeCompare(b)});
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
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_0300
   * @tc.name       : testTreeSet003
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  it("testTreeSet003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
    let treeSet = new TreeSet<string>();
    treeSet.add("四");
    let res = treeSet.has("四");
    expect(String(res)).assertEqual('true');
  });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_0400
   * @tc.name       : testTreeSet004
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  it("testTreeSet004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
    let treeSet = new TreeSet<number>();
    treeSet.add(8);
    let res = treeSet.has(8);
    expect(String(res)).assertEqual('true');
  });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_0500
   * @tc.name       : testTreeSet005
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  it("testTreeSet005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
    let treeSet = new TreeSet<Array<number>>();
    let a = new Array<number>(1, 2, 3, 4);
    treeSet.add(a);
    let res = treeSet.has(a);
    expect(String(res)).assertEqual('true');
  });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_0600
   * @tc.name       : testTreeSet006
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  it("testTreeSet006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
    let treeSet = new TreeSet<string>();
    treeSet.add("*");
    let res = treeSet.has("*");
    expect(String(res)).assertEqual('true');
  });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_0700
   * @tc.name       : testTreeSet007
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  it("testTreeSet007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
    let treeSet = new TreeSet<InfoC>();
    let a = new InfoC("lala", "13岁");
    treeSet.add(a);
    let res = treeSet.has(a);
    expect(String(res)).assertEqual('true');
  });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_0800
   * @tc.name       : testTreeSet008
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  it("testTreeSet008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
    let treeSet = new TreeSet<number>();
    treeSet.add(1.234);
    let res = treeSet.has(1.234);
    expect(String(res)).assertEqual('true');
  });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_0900
   * @tc.name       : testTreeSet009
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  it("testTreeSet009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
    let treeSet = new TreeSet<boolean>();
    treeSet.add(true);
    let res = treeSet.has(true);
    expect(String(res)).assertEqual('true');
  });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_1000
   * @tc.name       : testTreeSet010
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  it("testTreeSet010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
    let treeSet = new TreeSet<string>();
    treeSet.add("");
    let res = treeSet.has("");
    expect(String(res)).assertEqual('true');
  });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_1100
   * @tc.name       : testTreeSet011
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
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
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_1200
   * @tc.name       : testTreeSet012
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
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
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_1300
   * @tc.name       : testTreeSet013
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  it("testTreeSet013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
    let treeSet = new TreeSet<number>();
    let res = treeSet.length;
    expect(String(res)).assertEqual('0');
  });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_1400
   * @tc.name       : testTreeSet014
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
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
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_1500
   * @tc.name       : testTreeSet015
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
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
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_1600
   * @tc.name       : testTreeSet016
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
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
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_1700
   * @tc.name       : testTreeSet017
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  it("testTreeSet017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
    let treeSet = new TreeSet<number>();
    let res = treeSet.getFirstValue();
    expect(String(res)).assertEqual('undefined');
  });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_1800
   * @tc.name       : testTreeSet018
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
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
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_1900
   * @tc.name       : testTreeSet019
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  it("testTreeSet019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let treeSet = new TreeSet<number>();
    let res = treeSet.getLastValue();
    expect(String(res)).assertEqual('undefined');
  });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_2000
   * @tc.name       : testTreeSet020
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
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
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_2100
   * @tc.name       : testTreeSet021
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  it("testTreeSet021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let treeSet = new TreeSet<number>();
    let res = treeSet.getLowerValue(2);
    expect(String(res)).assertEqual('undefined');
  });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_2200
   * @tc.name       : testTreeSet022
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
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
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_2300
   * @tc.name       : testTreeSet023
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  it("testTreeSet023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let treeSet = new TreeSet<number>();
    let res = treeSet.getHigherValue(3);
    expect(String(res)).assertEqual('undefined');
  });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_2400
   * @tc.name       : testTreeSet024
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  // it("testTreeSet024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
  //   let treeSet = new TreeSet<string>();
  //   treeSet.add("a");
  //   treeSet.add("b");
  //   treeSet.add("c");
  //   treeSet.add("d");
  //   treeSet.add("e");
  //   let res = treeSet.popFirst();
  //   expect(res).assertEqual("a");
  // });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_2500
   * @tc.name       : testTreeSet025
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  it("testTreeSet025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let treeSet = new TreeSet<number>();
    let res = treeSet.popFirst();
    expect(String(res)).assertEqual('undefined');
  });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_2600
   * @tc.name       : testTreeSet026
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  // it("testTreeSet026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
  //   let treeSet = new TreeSet<string>();
  //   treeSet.add("a");
  //   treeSet.add("b");
  //   treeSet.add("c");
  //   treeSet.add("d");
  //   treeSet.add("e");
  //   let res = treeSet.popLast();
  //   expect(String(res)).assertEqual("e");
  // });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_2700
   * @tc.name       : testTreeSet027
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  it("testTreeSet027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let treeSet = new TreeSet<number>();
    let res = treeSet.popLast();
    expect(String(res)).assertEqual('undefined');
  });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_2800
   * @tc.name       : testTreeSet028
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
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
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_2900
   * @tc.name       : testTreeSet029
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  it("testTreeSet029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let treeSet = new TreeSet<number>();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    treeSet.clear();
    let res = treeSet.length;
    expect(String(res)).assertEqual('0');
    let res1 = treeSet.popFirst();
    expect(String(res1)).assertEqual('undefined');
  });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_3000
   * @tc.name       : testTreeSet030
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  it("testTreeSet030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let treeSet = new TreeSet<string>();
    treeSet.add("a");
    let res1 = treeSet.isEmpty();
    expect(String(res1)).assertEqual('false');
  });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_3100
   * @tc.name       : testTreeSet031
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  it("testTreeSet031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let treeSet = new TreeSet<string>();
    let res2 = treeSet.isEmpty();
    expect(String(res2)).assertEqual('true');
  });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_3200
   * @tc.name       : testTreeSet032
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
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
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_3300
   * @tc.name       : testTreeSet033
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  it("testTreeSet033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let treeSet = new TreeSet<string>();
    let res = treeSet.remove("c");
    expect(String(res)).assertEqual('false');
  });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_3400
   * @tc.name       : testTreeSet034
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  // it("testTreeSet034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
  //   let treeSet = new TreeSet<string>();
  //   treeSet.add("a");
  //   treeSet.add("b");
  //   treeSet.add("c");
  //   treeSet.add("d");
  //   treeSet.add("g");
  //   let res = treeSet.values();
  //   expect(String(res.next().value)).assertEqual("a");
  //   expect(String(res.next().value)).assertEqual("b");
  //   expect(String(res.next().value)).assertEqual("c");
  //   expect(String(res.next().value)).assertEqual("d");
  //   expect(String(res.next().value)).assertEqual("g");
  // });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_3500
   * @tc.name       : testTreeSet035
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
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
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_3600
   * @tc.name       : testTreeSet036
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
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
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_3700
   * @tc.name       : testTreeSet037
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
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
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_3800
   * @tc.name       : testTreeSet038
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  it("testTreeSet038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let treeSet = new TreeSet<number>();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    treeSet.add(3);
    treeSet.add(4);
    let arr = new Array<[Double, Double]>();
    let res = treeSet.entries();
    let temp: [Double, Double] | undefined = undefined;
    do {
      temp = res.next().value!;
      arr.push(temp);
    } while (temp != undefined);
    let arr1 = [0, 1, 2, 3, 4];
    for (let i = 0; i < arr1.length; i++) {
      expect(arr[i]).assertEqual(arr1[i]);
    }
  });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_3900
   * @tc.name       : testTreeSet039
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  //  it("testTreeSet039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
  //   let treeSet = new TreeSet<string>();
  //   try {
  //     treeSet.add.bind({}, "a")();
  //     expect(true).assertEqual(false);
  //   } catch (err: BusinessError) {
  //     expect(err.name).assertEqual("BusinessError");
  //     expect(err.code).assertEqual(10200011);
  //     expect(err.message).assertEqual(`The add method cannot be bound`);
  //   }
  // });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_4000
   * @tc.name       : testTreeSet040
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  // it('testTreeSet040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
  //   let  treeSet = new TreeSet();
  //   try {
  //     treeSet.clear.bind({}, "a")();
  //     expect(true).assertEqual(false);
  //   } catch (err) {
  //     expect(err.name).assertEqual("BusinessError");
  //     expect(err.code).assertEqual(10200011);
  //     expect(err.message).assertEqual(`The clear method cannot be bound`);
  //   }
  // });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_4100
   * @tc.name       : testTreeSet041
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
//   it('testTreeSet041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
//     let  treeSet = new TreeSet();
//     try {
//       treeSet.getLowerValue.bind({}, "a")();
//       expect(true).assertEqual(false);
//     } catch (err) {
//       expect(err.name).assertEqual("BusinessError");
//       expect(err.code).assertEqual(10200011);
//       expect(err.message).assertEqual(`The getLowerValue method cannot be bound`);
//     }
//   });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_4200
   * @tc.name       : testTreeSet042
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  it('testTreeSet042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let  treeSet = new TreeSet<null>();
    let res = treeSet.getLowerValue(null);
    expect(String(res)).assertEqual('undefined');
  });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_4300
   * @tc.name       : testTreeSet043
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  it('testTreeSet043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let  treeSet = new TreeSet<null>();
    let res = treeSet.getHigherValue(null);
    expect(String(res)).assertEqual('undefined');
  });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_4400
   * @tc.name       : testTreeSet044
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
//   it('testTreeSet044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
//     let  treeSet = new TreeSet();
//     try {
//       treeSet.getHigherValue.bind({}, "a")();
//       expect(true).assertEqual(false);
//     } catch (err) {
//       expect(err.name).assertEqual("BusinessError");
//       expect(err.code).assertEqual(10200011);
//       expect(err.message).assertEqual(`The getHigherValue method cannot be bound`);
//     }
//   });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_4500
   * @tc.name       : testTreeSet045
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
//   it('testTreeSet045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
//     let  treeSet = new TreeSet();
//     try {
//       treeSet.forEach.bind({}, "a")();
//       expect(true).assertEqual(false);
//     } catch (err) {
//       expect(err.name).assertEqual("BusinessError");
//       expect(err.code).assertEqual(10200011);
//       expect(err.message).assertEqual(`The forEach method cannot be bound`);
//     }
//   });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_4600
   * @tc.name       : testTreeSet046
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  // it('testTreeSet046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
  //   let  treeSet = new TreeSet<number>();
  //   try {
  //     treeSet.forEach(11);
  //     expect(true).assertEqual(false);
  //   } catch (err: BusinessError) {
  //     expect(err.name).assertEqual("BusinessError");
  //     expect(err.code).assertEqual(401);
  //     expect(err.message).assertEqual(`The type of "callbackfn" must be callable. Received value is: 11`);
  //   }
  // });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_4700
   * @tc.name       : testTreeSet047
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
//   it('testTreeSet047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
//     let  treeSet = new TreeSet();
//     try {
//       treeSet.values.bind({}, "a")();
//       expect(true).assertEqual(false);
//     } catch (err) {
//       expect(err.name).assertEqual("BusinessError");
//       expect(err.code).assertEqual(10200011);
//       expect(err.message).assertEqual(`The Symbol.iterator method cannot be bound`);
//     }
//   });

  /**
   * @tc.number     : SUB_COMMONLIBRARY_UTIL_TREESET_4800
   * @tc.name       : testTreeSet048
   * @tc.desc       : Test the function By TreeMap.
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 0
   */
  it('testTreeSet048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let  treeSet = new TreeSet<string>();
    treeSet.add("sparrow");
    treeSet.forEach((value, key) => {
      expect(value).assertEqual("sparrow");
      expect(key).assertEqual("sparrow");
    });
  });
});
}
