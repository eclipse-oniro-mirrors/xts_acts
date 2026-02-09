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
import LightWeightSet from '@ohos.util.LightWeightSet';
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

export default function LightWeightSetTest1() {
  describe("LightWeightSetTest1", (): void => {
    afterEach(() => {
      await Utils.msSleep(10)
    })
    /**
     * @tc.name   testLightWeightSet0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0100
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testLightWeightSet0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      try {
        let lightWeightSet = new LightWeightSet<number>();
        expect(String(lightWeightSet != undefined)).assertEqual('true');
      } catch (err) {
        if (err instanceof BusinessError) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200012);
          expect(err.message).assertEqual("The LightWeightSet's constructor cannot be directly invoked");
        }
      }
    });

    /**
     * @tc.name   testLightWeightSet0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0200
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testLightWeightSet0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1);
      let res = lightWeightSet.has(1);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testLightWeightSet0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0300
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testLightWeightSet0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("a");
      let res = lightWeightSet.has("a");
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testLightWeightSet0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0400
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testLightWeightSet0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightSet = new LightWeightSet<Array<number>>();
      let a = new Array<number>(1, 2, 3, 4);
      lightWeightSet.add(a);
      let res = lightWeightSet.has(a);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testLightWeightSet0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0500
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testLightWeightSet0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightSet = new LightWeightSet<InfoC>();
      let c = new InfoC();
      lightWeightSet.add(c);
      let res = lightWeightSet.has(c);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testLightWeightSet0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0600
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testLightWeightSet0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightSet = new LightWeightSet<boolean>();
      let c = false;
      lightWeightSet.add(c);
      let res = lightWeightSet.has(c);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testLightWeightSet0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0700
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testLightWeightSet0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let res = lightWeightSet.length;
      expect(String(res)).assertEqual('5');
    });

    /**
     * @tc.name   testLightWeightSet0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0800
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testLightWeightSet0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let lightWeightSet1 = new LightWeightSet<number>();
      lightWeightSet1.add(6);
      lightWeightSet1.add(7);
      let res1 = lightWeightSet.addAll(lightWeightSet1);
      for (let item of lightWeightSet) {
        console.log("lightWeightSet-----" + item);
      }
      for (let item of lightWeightSet1) {
        console.log("lightWeightSet1-----" + item);
      }
      for (let i = 1; i < 8; i++) {
        expect(String(lightWeightSet.has(i))).assertEqual('true');
      }
      expect(String(res1)).assertEqual('true');
    });

    /**
     * @tc.name   testLightWeightSet0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0900
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testLightWeightSet0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("a");
      lightWeightSet.add("b");
      lightWeightSet.add("c");
      lightWeightSet.add("d");
      lightWeightSet.add("e");
      let lightWeightSet1 = new LightWeightSet<string>();
      lightWeightSet1.add("a");
      lightWeightSet1.add("d");
      let res = lightWeightSet.hasAll(lightWeightSet1);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testLightWeightSet0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0100
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testLightWeightSet0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("a");
      lightWeightSet.add("b");
      lightWeightSet.add("c");
      lightWeightSet.add("e");
      let lightWeightSet1 = new LightWeightSet<string>();
      lightWeightSet1.add("a");
      lightWeightSet1.add("d");
      let res = lightWeightSet.hasAll(lightWeightSet1);
      expect(String(res)).assertEqual('false');
    });

    /**
     * @tc.name   testLightWeightSet0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0110
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testLightWeightSet0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("a");
      lightWeightSet.add("b");
      lightWeightSet.add("c");
      lightWeightSet.add("d");
      lightWeightSet.add("e");
      let res = lightWeightSet.has("a");
      expect(String(res)).assertEqual('true');
      let res1 = lightWeightSet.has('1');
      expect(String(res1)).assertEqual('false');
    });

    /**
     * @tc.name   testLightWeightSet0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0120
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testLightWeightSet0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let res = lightWeightSet.entries();
      expect(JSON.stringify(res.next().value)).assertEqual("[1,1]");
      expect(JSON.stringify(res.next().value)).assertEqual("[2,2]");
      expect(JSON.stringify(res.next().value)).assertEqual("[3,3]");
      expect(JSON.stringify(res.next().value)).assertEqual("[4,4]");
      expect(JSON.stringify(res.next().value)).assertEqual("[5,5]");
    });

    /**
     * @tc.name   testLightWeightSet013
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0130
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testLightWeightSet013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let res = lightWeightSet.getIndexOf(2);
      expect(String(res)).assertEqual('1');
    });

    /**
     * @tc.name   testLightWeightSet0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0140
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testLightWeightSet0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let res = lightWeightSet.isEmpty();
      expect(String(res)).assertEqual('false');
    });

    /**
     * @tc.name   testLightWeightSet0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0150
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testLightWeightSet0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let res = lightWeightSet.remove(1);
      expect(String(res)).assertEqual('1');
      let arr = new Array<number>();
      lightWeightSet.forEach((value, index) => {
        arr.push(value);
      });
      let arr1 = new Array<number>(2, 3, 4, 5);
      for (let i = 0; i < arr.length; i++) {
        expect(String(arr1[i])).assertEqual(String(arr[i]));
      }
    });

    /**
     * @tc.name   testLightWeightSet0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0160
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testLightWeightSet0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let res = lightWeightSet.removeAt(1);
      expect(String(res)).assertEqual('true');
      let arr = new Array<number>();
      lightWeightSet.forEach((value, index) => {
        arr.push(value);
      });
      let arr1 = new Array<number>(1, 3, 4, 5);
      for (let i = 0; i < arr.length; i++) {
        expect(String(arr1[i])).assertEqual(String(arr[i]));
      }
    });

    /**
     * @tc.name   testLightWeightSet0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0170
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testLightWeightSet0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      lightWeightSet.clear();
      let res = lightWeightSet.length;
      expect(String(res)).assertEqual('0');
    });

    /**
     * @tc.name   testLightWeightSet0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0180
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testLightWeightSet0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let arr = new Array<number>();
      lightWeightSet.forEach((value, index) => {
        arr.push(value);
      });
      let arr1 = new Array<number>(1, 2, 3, 4, 5);
      for (let i = 0; i < arr1.length; i++) {
        expect(String(arr[i])).assertEqual(String(arr1[i]));
      }
    });

    /**
     * @tc.name   testLightWeightSet0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0190
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testLightWeightSet0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      let res = lightWeightSet.toString();
      expect(res).assertEqual("1,2,3");
    });

    /**
     * @tc.name   testLightWeightSet0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0200
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testLightWeightSet0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let res = lightWeightSet.toArray();
      let arr1 = new Array<number>(1, 2, 3, 4, 5);
      for (let i = 0; i < arr1.length; i++) {
        expect(String(res[i])).assertEqual(String(arr1[i]));
      }
    });

    /**
     * @tc.name   testLightWeightSet0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0210
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testLightWeightSet0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let res = lightWeightSet.getValueAt(1);
      expect(String(res)).assertEqual('2');
    });

    /**
     * @tc.name   testLightWeightSet0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0220
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testLightWeightSet0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let arr = new Array<number>();
      for (let item of lightWeightSet) {
        let res = arr.push(item);
      }
      let arr1 = new Array<number>(1, 2, 3, 4, 5);
      for (let i = 0; i < arr1.length; i++) {
        expect(String(arr[i])).assertEqual(String(arr1[i]));
      }
    });

    /**
     * @tc.name   testLightWeightSet0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0230
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testLightWeightSet0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let res = lightWeightSet.values();
      expect(String(res.next().value)).assertEqual('1');
      expect(String(res.next().value)).assertEqual('2');
      expect(String(res.next().value)).assertEqual('3');
      expect(String(res.next().value)).assertEqual('4');
      expect(String(res.next().value)).assertEqual('5');
    });

    /**
     * @tc.name   testLightWeightSet0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0240
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testLightWeightSet0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightSet = new LightWeightSet<null>();
      lightWeightSet.add(null);
      let res = lightWeightSet.has(null);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testLightWeightSet0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0250
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testLightWeightSet0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1.23);
      let res1 = lightWeightSet.has(1.23);
      expect(String(res1)).assertEqual('true');
    });

    /**
     * @tc.name   testLightWeightSet0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0260
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testLightWeightSet0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightSet = new LightWeightSet<number | string>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let lightWeightSet1 = new LightWeightSet<number | string>();
      lightWeightSet1.add("a1");
      lightWeightSet1.add("d1");
      let res = lightWeightSet.hasAll(lightWeightSet1);
      expect(String(res)).assertEqual('false');
    });

    /**
     * @tc.name   testLightWeightSet0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0270
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testLightWeightSet0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightSet = new LightWeightSet<number | string>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let lightWeightSet1 = new LightWeightSet<number | string>();
      lightWeightSet1.add(1);
      lightWeightSet1.add("d");
      let res = lightWeightSet.hasAll(lightWeightSet1);
      expect(String(res)).assertEqual('false');
    });

    /**
     * @tc.name   testLightWeightSet0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0280
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testLightWeightSet0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightSet = new LightWeightSet<number>();
      let res = lightWeightSet.remove(3);
      expect(String(res)).assertEqual('undefined');
    });

    /**
     * @tc.name   testLightWeightSet0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0290
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testLightWeightSet0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightSet = new LightWeightSet<number>();
      let res = lightWeightSet.removeAt(1);
      expect(String(res)).assertEqual('false');
    });

    /**
     * @tc.name   testLightWeightSet0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0300
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testLightWeightSet0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      try {
        lightWeightSet.increaseCapacityTo(3);
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual(`The value of "minimumCapacity" is out of range. It must be > 8. Received value is: 3`);
      }
    });

    /**
     * @tc.name   testLightWeightSet0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0330
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testLightWeightSet0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      lightWeightSet.increaseCapacityTo(20);
      let res = lightWeightSet.length;
      expect(res).assertEqual(5);
    });

    /**

    /**
     * @tc.name   testLightWeightSet0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0350
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testLightWeightSet0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      lightWeightSet.clear();
      let res = lightWeightSet.isEmpty();
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testLightWeightSet0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0360
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testLightWeightSet0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightSet = new LightWeightSet<number>();
      for (let i = 0; i < 10000; i++) {
        lightWeightSet.add(i);
      }
      let res = lightWeightSet.getValueAt(9999);
      let res1 = lightWeightSet.length;
      expect(String(res)).assertEqual('9999');
      expect(String(res1)).assertEqual('10000');
    });

    /**
     * @tc.name   testLightWeightSet0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0370
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testLightWeightSet0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("");
      let res = lightWeightSet.has("");
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testLightWeightSet0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0380
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testLightWeightSet0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("$");
      let res = lightWeightSet.has("$");
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.name   testLightWeightSet0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0390
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testLightWeightSet0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let res = lightWeightSet.length;
      lightWeightSet.clear();
      let res1 = lightWeightSet.length;
      expect(String(res)).assertEqual('5');
      expect(String(res1)).assertEqual('0');
    });

    /**
     * @tc.name   testLightWeightSet0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0400
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testLightWeightSet0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightSet = new LightWeightSet<number | string>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let res = lightWeightSet.remove("A");
      expect(String(res)).assertEqual('undefined');
    });


    /**
     * @tc.name   testLightWeightSet0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0410
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testLightWeightSet0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let arr = new Array<Double>();
      let res = lightWeightSet.values();
      let temp: Double | undefined = res.next().value;
      while (temp != undefined) {
        arr.push(temp);
        temp = res.next().value;
      }
      let arr1 = [1, 2, 3, 4, 5];
      for (let i = 0; i < arr1.length; i++) {
        expect(arr[i]).assertEqual(arr1[i]);
      }
    });

    /**
     * @tc.name   testLightWeightSet0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_0460
     * @tc.desc   Test the function By LightWeightSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testLightWeightSet0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let iter = lightWeightSet.entries();
      let temp = iter.next();
      while (!temp.done) {
        let tempValue = temp.value!
        expect(tempValue[0]).assertEqual(tempValue[1]);
        temp = iter.next();
      }
    });
  });
}
