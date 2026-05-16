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
import HashSet from '@ohos.util.HashSet';
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

export default function HashSetTest1() {
  describe("HashSetTest1", (): void => {
    afterEach(() => {
      await Utils.msSleep(10)
    })

    /**
     * @tc.name   testHashSet0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0100
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashSet0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      try {
        let hashSet = new HashSet<number>();
      } catch (err) {
        err = err as BusinessError;
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200012);
        expect(err.message).assertEqual("The HashSet's constructor cannot be directly invoked");
      }
    });

    /**
     * @tc.name   testHashSet0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0200
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashSet0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashSet = new HashSet<number>();
      hashSet.add(1);
      let res = hashSet.has(1);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testHashSet0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0100
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashSet0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashSet = new HashSet<string>();
      hashSet.add("b");
      hashSet.add("c");
      hashSet.add("d");
      hashSet.add("a");
      hashSet.add("g");
      let res = hashSet.has("a");
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testHashSet0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0100
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashSet0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashSet = new HashSet<number[]>();
      let c: number[] = [1, 2, 3];
      hashSet.add(c);
      let res = hashSet.has(c);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testHashSet0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0100
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashSet0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashSet = new HashSet<InfoC>();
      let c = new InfoC();
      hashSet.add(c);
      let res = hashSet.has(c);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testHashSet0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0100
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashSet0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashSet = new HashSet<number>();
      hashSet.add(1);
      hashSet.add(2);
      hashSet.add(3);
      hashSet.add(4);
      hashSet.add(5);
      let res = hashSet.length;
      expect(String(res)).assertEqual('5');
    });

    /**
     * @tc.name   testHashSet0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0100
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashSet0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashSet = new HashSet<number>();
      hashSet.add(4);
      hashSet.add(1);
      hashSet.add(3);
      hashSet.add(2);
      hashSet.add(5);
      let res = hashSet.has(1);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testHashSet0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0100
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashSet0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashSet = new HashSet<number>();
      hashSet.add(4);
      hashSet.add(1);
      hashSet.add(3);
      hashSet.add(2);
      hashSet.add(5);
      let res = hashSet.isEmpty();
      expect(String(res)).assertEqual('false');
    });

    /**
     * @tc.name   testHashSet0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0100
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashSet0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashSet = new HashSet<number>();
      hashSet.add(4);
      hashSet.add(1);
      hashSet.add(3);
      hashSet.add(2);
      hashSet.add(5);
      let res = hashSet.remove(1);
      expect(String(res)).assertEqual('true');
      let arr = new Array<number>();
      hashSet.forEach((value, index) => {
        arr.push(value);
      });
      for (let i = 0; i < arr.length; i++) {
        let has = hashSet.has(arr[i]);
        expect(String(has)).assertEqual('true');
      }
    });

    /**
     * @tc.name   testHashSet0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0100
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashSet0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashSet = new HashSet<number>();
      hashSet.add(4);
      hashSet.add(1);
      hashSet.add(3);
      hashSet.add(2);
      hashSet.add(5);
      let res = hashSet.length;
      expect(String(res)).assertEqual('5');
      hashSet.clear();
      let res1 = hashSet.length;
      expect(String(res1)).assertEqual('0');
    });

    /**
     * @tc.name   testHashSet0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0110
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashSet0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashSet = new HashSet<string>();
      hashSet.add("A");
      hashSet.add("B");
      hashSet.add("C");
      hashSet.add("D");
      hashSet.add("E");
      let res = hashSet.values();
      for (let i = 0; i < hashSet.length; i++) {
        let has = hashSet.has(res.next().value!);
        expect(String(has)).assertEqual('true');
      }
    });

    /**
     * @tc.name   testHashSet0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0120
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashSet0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashSet = new HashSet<number>();
      hashSet.add(1);
      hashSet.add(2);
      hashSet.add(3);
      hashSet.add(4);
      hashSet.add(5);
      let arr = new Array<number>();
      hashSet.forEach((value, index) => {
        arr.push(value);
      });
      for (let i = 0; i < arr.length; i++) {
        let has = hashSet.has(arr[i]);
        expect(String(has)).assertEqual('true');
      }
    });

    /**
     * @tc.name   testHashSet0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0130
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHashSet0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashSet = new HashSet<number>();
      hashSet.add(1);
      hashSet.add(2);
      hashSet.add(3);
      hashSet.add(4);
      hashSet.add(5);
      let arr = new Array<number>();
      for (let item of hashSet) {
        arr.push(item);
      }
      for (let i = 0; i < arr.length; i++) {
        let has = hashSet.has(arr[i]);
        expect(String(has)).assertEqual('true');
      }
    });

    /**
     * @tc.name   testHashSet0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0140
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashSet0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashSet = new HashSet<string>();
      hashSet.add("A");
      hashSet.add("B");
      hashSet.add("C");
      hashSet.add("D");
      hashSet.add("E");
      let arr = new Array<string>();
      hashSet.forEach((value, key) => {
        arr.push(value);
      })
      for (let i = 0; i < arr.length; i++) {
        let has: boolean = hashSet.has(arr[i]);
        expect(String(has)).assertEqual('true');
      }
    });

    /**
     * @tc.name   testHashSet0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0150
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashSet0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashSet = new HashSet<number>();
      hashSet.add(1);
      hashSet.add(2);
      hashSet.add(3);
      hashSet.add(4);
      hashSet.add(5);
      let res = hashSet.entries();
      for (let i = 0; i < hashSet.length; i++) {
        let temp = res.next().value!
        let has = hashSet.has(temp[1]);
        expect(has).assertEqual(true);
      }
    });

    /**
     * @tc.name   testHashSet0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0160
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashSet0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashSet = new HashSet<string>();
      hashSet.add("");
      let res = hashSet.has("");
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testHashSet0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0170
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashSet0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashSet = new HashSet<string>();
      hashSet.add("$");
      let res = hashSet.has("$");
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testHashSet0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0180
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashSet0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashSet = new HashSet<number>();
      hashSet.add(1.34);
      let res = hashSet.has(1.34);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testHashSet0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0190
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashSet0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashSet = new HashSet<number>();
      hashSet.add(-1);
      let res = hashSet.has(-1);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testHashSet0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0200
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashSet0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashSet = new HashSet<Object>();
      let a = new Object();
      hashSet.add(a);
      let res = hashSet.has(a);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testHashSet0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0210
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashSet0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashSet = new HashSet<number>();
      for (let i = 0; i < 100; i++) {
        hashSet.add(i);
        let res = hashSet.has(i);
        expect(String(res)).assertEqual('true');
      }
      let res1 = hashSet.length;
      expect(String(res1)).assertEqual('100');
    });

    /**
     * @tc.name   testHashSet0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0220
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashSet0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashSet = new HashSet<number>();
      let i = 0;
      for (let item of hashSet) {
        expect(item).assertEqual(i);
        i++;
      }
    });

    /**
     * @tc.name   testHashSet0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0230
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashSet0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashSet = new HashSet<number>();
      let arr = new Array<number>();
      hashSet.forEach((value, index) => {
        arr.push(value);
      });
      expect(String(arr.length)).assertEqual('0');
    });

    /**
     * @tc.name   testHashSet0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0240
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashSet0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashSet = new HashSet<number>();
      hashSet.add(4);
      hashSet.add(1);
      hashSet.add(3);
      hashSet.add(2);
      hashSet.add(5);
      hashSet.clear();
      let res = hashSet.isEmpty();
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testHashSet0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0250
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashSet0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashSet = new HashSet<number>();
      let res = hashSet.has(1);
      expect(String(res)).assertEqual('false');
    });

    /**
     * @tc.name   testHashSet0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0260
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashSet0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashSet = new HashSet<number>();
      let res = hashSet.remove(1);
      expect(String(res)).assertEqual('false');
    });

    /**
     * @tc.name   testHashSet0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0270
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashSet0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashSet = new HashSet<number>();
      hashSet.clear();
      let res = hashSet.length
      expect(String(res)).assertEqual('0');
    });

    /**
     * @tc.name   testHashSet0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0280
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashSet0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashSet = new HashSet<number>();
      let res = hashSet.entries();
      expect(res.next().value).assertEqual(undefined);
    });

    /**
     * @tc.name   testHashSet0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0290
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashSet0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashSet = new HashSet<number>();
      for (let i = 0; i < 100; i++) {
        let text = hashSet.add(i);
      }
      let arr = new Array<number>();
      hashSet.forEach((value, index) => {
        arr.push(value)
      })
      for (let i = 0; i < 100; i++) {
        let a = arr[i];
        let res = hashSet.has(a);
        expect(String(res)).assertEqual('true');
      }
    });

    /**
     * @tc.name   testHashSet0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0300
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashSet0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashSet = new HashSet<number>();
      for (let i = 0; i < 100; i++) {
        hashSet.add(i);
      }
      let arr = new Array<number>();
      hashSet.forEach((value, index) => {
        arr.push(value);
      });
      for (let i = 0; i < 100; i++) {
        let a = arr[i];
        let res = hashSet.has(a);
        expect(String(res)).assertEqual('true');
      }
    });

    /**
     * @tc.name   testHashSet0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0310
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashSet0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashSet = new HashSet<number>();
      hashSet.add(1);
      hashSet.add(1);
      let has = hashSet.has(1);
      let size = hashSet.length;
      expect(String(has)).assertEqual('true');
      expect(String(size)).assertEqual('1');
    });

    /**
     * @tc.name   testHashSet0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0320
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashSet0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashSet = new HashSet<number>();
      hashSet.add(1);
      hashSet.add(2);
      hashSet.add(3);
      hashSet.add(4);
      hashSet.add(5);
      let res = hashSet.entries();
      let temp: [Double, Double] | undefined = res.next().value;
      let arr = new Array<number>();
      while (temp !== undefined) {
        arr.push(temp[1]);
        temp = res.next().value;
      }
      arr.sort((a, b) => {
        return ((a as number) - (b as number)).toInt()
      });
      let arr1 = new Array<number>(1, 2, 3, 4, 5);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(arr1[i]);
      }
    });

    /**
     * @tc.name   testHashSet0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSET_0380
     * @tc.desc   Test the function By HashSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHashSet0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hashSet = new HashSet<number>();
      hashSet.add(1);
      hashSet.add(2);
      hashSet.add(3);
      hashSet.add(4);
      hashSet.add(5);
      let iter = hashSet.entries();
      let temp = iter.next();
      while (!temp.done) {
        let tempValue = temp.value!
        expect(tempValue[0]).assertEqual(tempValue[1]);
        temp = iter.next();
      }
    });
  });
}
