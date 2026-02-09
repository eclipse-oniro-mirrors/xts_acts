/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import HashMap from '@ohos.util.HashMap';
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

export default function HashMapTest1() {
  describe("HashMapTest1", (): void => {
    afterEach(() => {
      await Utils.msSleep(10)
    })
    /**
     * @tc.name   testHashMap0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_0100
     * @tc.desc   Test the function By HashMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashMap0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      try {
        let hashMap = new HashMap<number, string>();
        expect(String(hashMap != undefined)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200012);
        expect(err.message).assertEqual("The HashMap's constructor cannot be directly invoked");
      }
    });

    /**
     * @tc.name   testHashMap0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_0200
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashMap0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(1, "A");
      let res = hashMap.get(1);
      expect(String(res)).assertEqual("A");
    });

    /**
     * @tc.name   testHashMap0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_0300
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashMap0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashMap = new HashMap<number, number>();
      hashMap.set(1, 2);
      let res = hashMap.get(1);
      expect(String(res)).assertEqual('2');
    });

    /**
     * @tc.name   testHashMap0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_0400
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashMap0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashMap = new HashMap<number, number[]>();
      let c: number[] = [1, 2, 3];
      hashMap.set(1, c);
      let res = hashMap.get(1);
      expect(String(res)).assertEqual(String(c));
    });

    /**
     * @tc.name   testHashMap0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_0500
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashMap0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashMap = new HashMap<number, InfoC>()
      let c = new InfoC()
      hashMap.set(1, c);
      let res = hashMap.get(1);
      expect(res).assertEqual(c);
    });

    /**
     * @tc.name   testHashMap0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_0600
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashMap0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashMap = new HashMap<string, string>();
      hashMap.set("a", "A");
      let res = hashMap.get("a");
      expect(String(res)).assertEqual("A");
    });

    /**
     * @tc.name   testHashMap0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_0700
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashMap0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashMap = new HashMap<string, string>();
      hashMap.set("", "A");
      let res = hashMap.get("");
      expect(String(res)).assertEqual("A");
    });

    /**
     * @tc.name   testHashMap0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_0800
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashMap0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashMap = new HashMap<string, string>();
      hashMap.set("$", "A");
      let res = hashMap.get("$");
      expect(String(res)).assertEqual("A");
    });

    /**
     * @tc.name   testHashMap0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_0900
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashMap0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(3.14, "A");
      let res = hashMap.get(3.14);
      expect(String(res)).assertEqual("A");
    });

    /**
     * @tc.name   testHashMap0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_01000
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashMap0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(0.3, "A");
      let res = hashMap.get(0.3);
      expect(String(res)).assertEqual("A");
    });

    /**
     * @tc.name   testHashMap0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_01100
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashMap0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(-1, "A");
      let res = hashMap.get(-1);
      expect(String(res)).assertEqual("A");
    });

    /**
     * @tc.name   testHashMap0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_01200
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashMap0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashMap = new HashMap<Object, string>();
      let a = new Object();
      hashMap.set(a, "A");
      let res = hashMap.get(a);
      expect(String(res)).assertEqual("A");
    });

    /**
     * @tc.name   testHashMap0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_01300
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashMap0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashMap = new HashMap<number, null>();
      hashMap.set(1, null);
      let res = hashMap.get(1);
      expect(String(res)).assertEqual('null');
    });

    /**
     * @tc.name   testHashMap0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_01400
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashMap0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(1, "$");
      let res = hashMap.get(1);
      expect(String(res)).assertEqual("$");
    });

    /**
     * @tc.name   testHashMap0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_01500
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashMap0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashMap = new HashMap<number, number>();
      hashMap.set(1, 3.14);
      let res = hashMap.get(1);
      expect(String(res)).assertEqual('3.14');
    });

    /**
     * @tc.name   testHashMap0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_01600
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashMap0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashMap = new HashMap<number, number>();
      hashMap.set(1, -1);
      let res = hashMap.get(1);
      expect(String(res)).assertEqual('-1');
    });

    /**
     * @tc.name   testHashMap0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_01700
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashMap0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashMap = new HashMap<number, Object>();
      let a = new Object();
      hashMap.set(1, a);
      let res = hashMap.get(1);
      expect(String(res)).assertEqual(String(a));
    });

    /**
     * @tc.name   testHashMap0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_01800
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashMap0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashMap = new HashMap<number, number>();
      for (let i = 0; i < 100; i++) {
        hashMap.set(1, i);
      }
      let res = hashMap.get(1);
      let res1 = hashMap.length;
      expect(String(res)).assertEqual('99');
      expect(String(res1)).assertEqual('1');
    });

    /**
     * @tc.name   testHashMap0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_01900
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashMap0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashMap = new HashMap<number, number>();
      for (let i = 0; i < 100; i++) {
        hashMap.set(i, 1);
        let res = hashMap.get(i);
        expect(String(res)).assertEqual('1');
      }
      let res1 = hashMap.length;
      expect(String(res1)).assertEqual('100');
    });

    /**
     * @tc.name   testHashMap0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_02000
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashMap0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let res = hashMap.length;
      expect(String(res)).assertEqual('5');
    });

    /**
     * @tc.name   testHashMap0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_02100
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let res = hashMap.hasKey(3);
      expect(String(res)).assertEqual('true');
      let res1 = hashMap.hasKey(8);
      expect(String(res1)).assertEqual('false');
    });

    /**
     * @tc.name   testHashMap0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_02200
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, number>();
      let res = hashMap.hasKey(8);
      expect(String(res)).assertEqual('false');
    });

    /**
     * @tc.name   testHashMap0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_02300
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, string | number>();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let res = hashMap.hasValue("C");
      expect(String(res)).assertEqual('true');
      let res1 = hashMap.hasValue(8);
      expect(String(res1)).assertEqual('false');
    });

    /**
     * @tc.name   testHashMap0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_02400
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, number>();
      for (let i = 0; i < 10; i++) {
        hashMap.set(i, i)
      }
      let ss = Math.floor(Math.random() * 10)
      let res = hashMap.hasKey(ss);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testHashMap0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_02500
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, number>();
      let res = hashMap.hasValue(8);
      expect(String(res)).assertEqual('false');
    });

    /**
     * @tc.name   testHashMap0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_02600
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let res = hashMap.get(3);
      expect(String(res)).assertEqual("C");
    });

    /**
     * @tc.name   testHashMap0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_02700
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, number>();
      let res = hashMap.get(3);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testHashMap0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_02800
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, string | number>();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let hashMap1 = new HashMap<number, string | number>();
      hashMap1.set(1, 1);
      hashMap1.set(2, 2);
      hashMap.setAll(hashMap1);
      let arr = new Array<Array<number | string>>();
      hashMap.forEach((value, key): void => {
        arr.push(new Array<number | string>(key, value))
      })
      arr.sort((a, b) => {
        return ((a[0] as number) - (b[0] as number)).toInt()
      });
      for (let i = 0; i < arr.length; i++) {
        expect(String(arr[i][0])).assertEqual(String(i + 1));
        expect(String(arr[i][1])).assertEqual(String(hashMap.get(i + 1)));
      }
    });

    /**
     * @tc.name   testHashMap0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_02900
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, number>();
      let hashMap1 = new HashMap<number, number>();
      hashMap1.set(1, 1);
      hashMap1.set(2, 2);
      hashMap.setAll(hashMap1);
      let arr = new Array<Array<number>>();
      hashMap.forEach((value, key) => {
        arr.push(new Array<number>(key, value))
      })
      arr.sort((a, b) => {
        return (a[0] - b[0]).toInt()
      });
      for (let i = 0; i < arr.length; i++) {
        expect(String(arr[i])).assertEqual(String([i + 1, (hashMap.get(i + 1)! as int)]));
      }
    });

    /**
     * @tc.name   testHashMap0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_03000
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let res = hashMap.remove(3);
      expect(res).assertEqual("C");
      let res1 = hashMap.length;
      expect(String(res1)).assertEqual('4');
    });

    /**
     * @tc.name   testHashMap0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_03100
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, string>();
      let res = hashMap.remove(3);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testHashMap0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_03200
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let res = hashMap.length;
      expect(String(res)).assertEqual('5');
      hashMap.clear();
      let res1 = hashMap.length;
      expect(String(res1)).assertEqual('0');
    });

    /**
     * @tc.name   testHashMap0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_03300
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, string>();
      hashMap.clear();
      let res = hashMap.length;
      expect(String(res)).assertEqual('0');
    });

    /**
     * @tc.name   testHashMap0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_03400
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let res = hashMap.keys();
      for (let i = 0; i < hashMap.length; i++) {
        let result = hashMap.hasKey(res.next().value!);
        expect(String(result)).assertEqual('true');
      }
    });

    /**
     * @tc.name   testHashMap0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_03500
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let res = hashMap.values();
      for (let i = 0; i < hashMap.length; i++) {
        let has = hashMap.hasValue(res.next().value!);
        expect(String(has)).assertEqual('true');
      }
    });

    /**
     * @tc.name   testHashMap0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_03600
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let res = hashMap.replace(2, "G");
      expect(String(res)).assertEqual('true');
      expect(hashMap.get(2)).assertEqual("G");
    });

    /**
     * @tc.name   testHashMap0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_03700
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, string>();
      let res = hashMap.replace(2, "G");
      expect(String(res)).assertEqual('false');
    });

    /**
     * @tc.name   testHashMap0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_03800
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let vals = new Array<string>();
      let keys = new Array<number>();
      hashMap.forEach((value, key) => {
        keys.push(key);
        vals.push(value);
      });
      for (let i = 0; i < keys.length; i++) {
        let has = hashMap.hasKey(keys[i]);
        expect(String(has)).assertEqual('true');
      }
      for (let i = 0; i < vals.length; i++) {
        let has = hashMap.hasValue(vals[i]);
        expect(String(has)).assertEqual('true');
      }
    });

    /**
     * @tc.name   testHashMap0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_03900
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, string>();
      let arr = new Array<Object>();
      hashMap.forEach((item, index) => {
        arr.push(item);
      });
      expect(String(arr.length)).assertEqual('0');
    });

    /**
     * @tc.name   testHashMap0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_04000
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let arr = new Array<Array<number | string>>();
      hashMap.forEach((value, key) => {
        arr.push(new Array<number | string>(key, value))
      })
      arr.sort((a, b) => {
        return ((a[0] as number) - (b[0] as number)).toInt()
      });
      for (let i = 0; i < arr.length; i++) {
        expect(String(arr[i][0])).assertEqual(String(i + 1));
        expect(String(arr[i][1])).assertEqual(String(hashMap.get(i + 1)));
      }
    });

    /**
     * @tc.name   testHashMap0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_04100
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, string>();
      let arr = new Array<Object>();
      for (let item of hashMap) {
        arr.push(item);
      }
      expect(String(arr.length)).assertEqual('0');
    });

    /**
     * @tc.name   testHashMap0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_04200
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let res = hashMap.entries();
      let arr = new Array<Array<number | string>>();
      for (let i = 0; i < hashMap.length; i++) {
        let obj = res.next().value!;
        arr.push(new Array<number | string>(obj[0], obj[1]));
      }
      arr.sort((a, b) => {
        return ((a[0] as number) - (b[0] as number)).toInt()
      });
      for (let i = 0; i < arr.length; i++) {
        expect(String(arr[i][0])).assertEqual(String(i + 1));
        expect(String(arr[i][1])).assertEqual(hashMap.get(i + 1));
      }
    });

    /**
     * @tc.name   testHashMap0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_04300
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, string>();
      let res = hashMap.entries();
      expect('undefined').assertEqual(String(res.next().value));
    });

    /**
     * @tc.name   testHashMap0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_04400
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let res = hashMap.length;
      let res1 = hashMap.isEmpty();
      expect(String(res)).assertEqual('5');
      expect(String(res1)).assertEqual('false');
    });

    /**
     * @tc.name   testHashMap0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_04500
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      hashMap.clear();
      let res = hashMap.length;
      let res1 = hashMap.isEmpty();
      expect(String(res)).assertEqual('0');
      expect(String(res1)).assertEqual('true');
    });

    /**
     * @tc.name   testHashMap0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_04600
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, string>();
      let res = hashMap.entries();
      expect('undefined').assertEqual(String(res.next().value));
    });

    /**
     * @tc.name   testHashMap0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_04700
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let iters = hashMap.entries();
      let flag = true;
      for (let i = 0, len = hashMap.length; i < len; i++) {
        let entry = iters.next().value!;
        let res = hashMap.get(entry[0]);
        if (res != entry[1]) {
          flag = false;
          break;
        }
      }
      expect(String(flag)).assertEqual('true');
    });

    /**
     * @tc.name   testHashMap0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_05000
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashMap0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number, number>();
      hashMap.set(1, 1);
      hashMap.set(2, 2);
      let newHashmap = new HashMap<number, number>();
      newHashmap.setAll(hashMap);
      expect(String(newHashmap.length)).assertEqual('2');
      let vals = new Array<number>();
      let keys = new Array<number>();
      newHashmap.forEach((value, key) => {
        keys.push(key);
        vals.push(value);
      });
      for (let i = 0; i < keys.length; i++) {
        let has = newHashmap.hasKey(i + 1);
        expect(String(has)).assertEqual('true');
      }
      for (let i = 0; i < vals.length; i++) {
        let has = newHashmap.hasKey(i + 1);
        expect(String(has)).assertEqual('true');
      }
    })


    /**
     * @tc.name   testHashMap0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_05200
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashMap0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<string, string>();
      let a = hashMap.isEmpty();
      expect(a).assertEqual(true);
    });
    /**
     * @tc.name   testHashMap0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_05300
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashMap0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<string, string>();
      hashMap.set("1", "2")
      let c = hashMap.isEmpty();
      expect(c).assertEqual(false);
    });

    /**
     * @tc.name   testHashMap0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_05400
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashMap0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<string, string>();
      try {
        hashMap.set("name", "jenny");
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(10200011);
      }
    });

    /**
     * @tc.name   testHashMap0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAP_05500
     * @tc.desc   Test the function By HashMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHashMap0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashMap = new HashMap<number | undefined, number>();
      try {
        hashMap.set(undefined, 11);
        expect(true).assertEqual(false);
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(401);
      }
    });
  });
}

class InfoC {
  name: string
  age: string

  constructor(name: string = "lili", age: string = "13") {
    this.name = name
    this.age = age
  }
}