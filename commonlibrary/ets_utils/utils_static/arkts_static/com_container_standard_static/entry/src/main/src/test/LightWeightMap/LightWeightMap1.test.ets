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
import LightWeightMap from '@ohos.util.LightWeightMap';
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

class TestAbc {
  abc: number

  constructor(abc: number = 1) {
    this.abc = abc
  }
}

export default function LightWeightMapTest1() {
  describe("LightWeightMapTest1", (): void => {
    afterEach(() => {
      await Utils.msSleep(10)
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_0100
     * @tc.name       : testLightWeightMap0001
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testConstructor001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      try {
        let lightWeightMap = new LightWeightMap<string, number>();
        expect(String(lightWeightMap != undefined)).assertEqual('true');
      } catch (err: BusinessError) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200012);
        expect(err.message).assertEqual("The LightWeightMap's constructor cannot be directly invoked");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_0200
     * @tc.name       : testLightWeightMap0002
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testLightWeightMap0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "A");
      let res = lightWeightMap.hasValue("A");
      expect(String(res)).assertEqual('true');
      let res1 = lightWeightMap.hasKey(1);
      expect(String(res1)).assertEqual('true');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_0300
     * @tc.name       : testLightWeightMap0003
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testLightWeightMap0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightMap = new LightWeightMap<string, string>();
      lightWeightMap.set("a", "A");
      let res = lightWeightMap.hasValue("A");
      expect(String(res)).assertEqual('true');
      let res1 = lightWeightMap.hasKey("a");
      expect(String(res1)).assertEqual('true');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_0400
     * @tc.name       : testLightWeightMap0004
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testLightWeightMap0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightMap = new LightWeightMap<number, number[]>();
      let a = [1, 2, 3, 4];
      lightWeightMap.set(1, a);
      let res = lightWeightMap.hasValue(a);
      expect(String(res)).assertEqual('true');
      let res1 = lightWeightMap.hasKey(1);
      expect(String(res1)).assertEqual('true');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_0500
     * @tc.name       : testLightWeightMap0005
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testLightWeightMap0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {

      let lightWeightMap = new LightWeightMap<number, InfoC>();
      let c = new InfoC();
      lightWeightMap.set(1, c);
      let res = lightWeightMap.hasValue(c);
      expect(String(res)).assertEqual('true');
      let res1 = lightWeightMap.hasKey(1);
      expect(String(res1)).assertEqual('true');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_0600
     * @tc.name       : testLightWeightMap0006
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testLightWeightMap0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "A");
      lightWeightMap.set(2, "B");
      lightWeightMap.set(3, "C");
      lightWeightMap.set(4, "D");
      lightWeightMap.set(5, "E");
      let res = lightWeightMap.get(4);
      expect(String(res)).assertEqual("D");
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_0700
     * @tc.name       : testLightWeightMap0007
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testLightWeightMap0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "A");
      lightWeightMap.set(2, "B");
      lightWeightMap.set(3, "C");
      lightWeightMap.set(4, "D");
      lightWeightMap.set(5, "E");
      let res = lightWeightMap.length;
      expect(String(res)).assertEqual('5');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_0800
     * @tc.name       : testLightWeightMap0008
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testLightWeightMap0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightMap = new LightWeightMap<string, string>();
      lightWeightMap.set("a", "A");
      lightWeightMap.set("b", "B");
      lightWeightMap.set("c", "C");
      lightWeightMap.set("d", "D");
      lightWeightMap.set("e", "E");
      let lightWeightMap1 = new LightWeightMap<string, string>();
      lightWeightMap1.set("a", "A");
      lightWeightMap1.set("d", "D");
      let res = lightWeightMap.hasAll(lightWeightMap1);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_0900
     * @tc.name       : testLightWeightMap0009
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testLightWeightMap0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightMap = new LightWeightMap<string, string>();
      lightWeightMap.set("a", "A");
      lightWeightMap.set("b", "B");
      lightWeightMap.set("c", "C");
      lightWeightMap.set("d", "D");
      lightWeightMap.set("e", "E");
      let res = lightWeightMap.hasKey("a");
      expect(String(res)).assertEqual('true');
      let res1 = lightWeightMap.hasKey("1");
      expect(String(res1)).assertEqual('false');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_00100
     * @tc.name       : testLightWeightMap0010
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testLightWeightMap0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightMap = new LightWeightMap<string, string>();
      lightWeightMap.set("a", "A");
      lightWeightMap.set("b", "B");
      lightWeightMap.set("c", "C");
      lightWeightMap.set("d", "D");
      lightWeightMap.set("e", "E");
      let res = lightWeightMap.hasValue("A");
      expect(String(res)).assertEqual('true');
      let res1 = lightWeightMap.hasValue('1');
      expect(String(res1)).assertEqual('false');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_01100
     * @tc.name       : testLightWeightMap0011
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testLightWeightMap0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightMap = new LightWeightMap<string, string>();
      lightWeightMap.set("a", "A");
      lightWeightMap.set("b", "B");
      lightWeightMap.set("c", "C");
      lightWeightMap.set("d", "D");
      lightWeightMap.set("e", "E");
      lightWeightMap.increaseCapacityTo(3);
      let length = lightWeightMap.length;
      expect(String(length)).assertEqual('5');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_01200
     * @tc.name       : testLightWeightMap0012
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testLightWeightMap0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "A");
      lightWeightMap.set(2, "B");
      lightWeightMap.set(3, "C");
      lightWeightMap.set(4, "D");
      lightWeightMap.set(5, "E");
      let res = lightWeightMap.entries();
      expect(JSON.stringify(res.next().value)).assertEqual('[1,"A"]');
      expect(JSON.stringify(res.next().value)).assertEqual('[2,"B"]');
      expect(JSON.stringify(res.next().value)).assertEqual('[3,"C"]');
      expect(JSON.stringify(res.next().value)).assertEqual('[4,"D"]');
      expect(JSON.stringify(res.next().value)).assertEqual('[5,"E"]');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_01300
     * @tc.name       : testLightWeightMap0013
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testLightWeightMap0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightMap = new LightWeightMap<number, number>();
      let res = lightWeightMap.entries();
      expect(undefined).assertEqual(res.next().value);
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_01400
     * @tc.name       : testLightWeightMap0014
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testLightWeightMap0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "A");
      lightWeightMap.set(2, "B");
      lightWeightMap.set(3, "C");
      lightWeightMap.set(4, "D");
      lightWeightMap.set(5, "E");
      let res = lightWeightMap.getIndexOfKey(2);
      expect(String(res)).assertEqual('1');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_01500
     * @tc.name       : testLightWeightMap0015
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testLightWeightMap0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "A");
      lightWeightMap.set(2, "B");
      lightWeightMap.set(3, "C");
      lightWeightMap.set(4, "D");
      lightWeightMap.set(5, "E");
      let res = lightWeightMap.getIndexOfKey(6);
      expect(String(res)).assertEqual('-1');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_01600
     * @tc.name       : testLightWeightMap0016
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testLightWeightMap0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "A");
      lightWeightMap.set(2, "B");
      lightWeightMap.set(3, "C");
      lightWeightMap.set(4, "D");
      lightWeightMap.set(5, "E");
      lightWeightMap.setValueAt(4, "F");
      let res = lightWeightMap.getIndexOfValue("F");
      expect(String(res)).assertEqual('4');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_01700
     * @tc.name       : testLightWeightMap0017
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testLightWeightMap0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "A");
      lightWeightMap.set(2, "B");
      lightWeightMap.set(3, "C");
      lightWeightMap.set(4, "D");
      lightWeightMap.set(5, "E");
      let res = lightWeightMap.getIndexOfValue("G");
      expect(String(res)).assertEqual('-1');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_01800
     * @tc.name       : testLightWeightMap0018
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testLightWeightMap0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightMap = new LightWeightMap<number, string>();
      let res1 = lightWeightMap.isEmpty();
      expect(String(res1)).assertEqual('true');
      lightWeightMap.set(1, "A");
      lightWeightMap.set(2, "B");
      lightWeightMap.set(3, "C");
      lightWeightMap.set(4, "D");
      lightWeightMap.set(5, "E");
      let res2 = lightWeightMap.isEmpty();
      expect(String(res2)).assertEqual('false');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_01900
     * @tc.name       : testLightWeightMap0019
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testLightWeightMap0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "A");
      lightWeightMap.set(2, "B");
      lightWeightMap.set(3, "C");
      lightWeightMap.set(4, "D");
      lightWeightMap.set(5, "E");
      let res = lightWeightMap.getKeyAt(1);
      expect(String(res)).assertEqual('2');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_02000
     * @tc.name       : testLightWeightMap0020
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testLightWeightMap0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "A");
      lightWeightMap.set(2, "B");
      lightWeightMap.set(3, "C");
      lightWeightMap.set(4, "D");
      lightWeightMap.set(5, "E");
      let res = lightWeightMap.keys();
      expect(String(res.next().value)).assertEqual('1');
      expect(String(res.next().value)).assertEqual('2');
      expect(String(res.next().value)).assertEqual('3');
      expect(String(res.next().value)).assertEqual('4');
      expect(String(res.next().value)).assertEqual('5');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_02100
     * @tc.name       : testLightWeightMap0021
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testLightWeightMap0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "A");
      lightWeightMap.set(2, "B");
      lightWeightMap.set(3, "C");
      lightWeightMap.set(4, "D");
      lightWeightMap.set(5, "E");
      let lightWeightMap1 = new LightWeightMap<number, string>();
      lightWeightMap1.set(6, "A");
      lightWeightMap1.set(7, "B");
      lightWeightMap.setAll(lightWeightMap1);
      for (let i = 1; i < 8; i++) {
        expect(String(lightWeightMap.hasKey(i))).assertEqual('true');
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_02200
     * @tc.name       : testLightWeightMap0022
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testLightWeightMap0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "A");
      lightWeightMap.set(2, "B");
      lightWeightMap.set(3, "C");
      lightWeightMap.set(4, "D");
      lightWeightMap.set(5, "E");
      let res = lightWeightMap.remove(3);
      expect(String(res)).assertEqual("C");
      let res1 = lightWeightMap.hasValue("C");
      expect(String(res1)).assertEqual('false');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_02300
     * @tc.name       : testLightWeightMap0023
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testLightWeightMap0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "A");
      lightWeightMap.set(2, "B");
      lightWeightMap.set(3, "C");
      lightWeightMap.set(4, "D");
      lightWeightMap.set(5, "E");
      let res = lightWeightMap.removeAt(1);
      expect(String(res)).assertEqual('true');
      let res1 = lightWeightMap.hasValue("A");
      expect(String(res1)).assertEqual('true');
      let res2 = lightWeightMap.hasValue("B");
      expect(String(res2)).assertEqual('false');
      let res3 = lightWeightMap.removeAt(10);
      expect(String(res3)).assertEqual('false');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_02400
     * @tc.name       : testLightWeightMap0024
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it("testLightWeightMap0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let lightWeightMap = new LightWeightMap<number, string>();
    //   lightWeightMap.set(1, "A");
    //   lightWeightMap.set(2, "B");
    //   lightWeightMap.set(3, "C");
    //   lightWeightMap.set(4, "D");
    //   lightWeightMap.set(5, "E");
    //   lightWeightMap.clear();
    //   let res = lightWeightMap.length;
    //   expect(String(res)).assertEqual(0);
    //   let isEmpty = lightWeightMap.isEmpty();
    //   expect(String(isEmpty)).assertEqual('true');
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_02500
     * @tc.name       : testLightWeightMap0025
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testLightWeightMap0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "A");
      lightWeightMap.set(2, "B");
      lightWeightMap.set(3, "C");
      lightWeightMap.set(4, "D");
      lightWeightMap.set(5, "E");
      lightWeightMap.setValueAt(0, "a");
      let res = lightWeightMap.get(1);
      expect(String(res)).assertEqual("a");
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_02600
     * @tc.name       : testLightWeightMap0026
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testLightWeightMap0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "A");
      lightWeightMap.set(2, "B");
      lightWeightMap.set(3, "C");
      lightWeightMap.set(4, "D");
      lightWeightMap.set(5, "E");
      let arr = new Array<string>();
      lightWeightMap.forEach((value, index) => {
        arr.push(value);
      });
      let arr1 = ["A", "B", "C", "D", "E"];
      for (let i = 0; i < arr1.length; i++) {
        expect(JSON.stringify(arr[i])).assertEqual(JSON.stringify(arr1[i]));
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_02700
     * @tc.name       : testLightWeightMap0027
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testLightWeightMap0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "A");
      lightWeightMap.set(2, "B");
      lightWeightMap.set(3, "C");
      let res = lightWeightMap.toString();
      expect(String(res)).assertEqual("1:A,2:B,3:C");
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_02800
     * @tc.name       : testLightWeightMap0028
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testLightWeightMap0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "A");
      lightWeightMap.set(2, "B");
      lightWeightMap.set(3, "C");
      lightWeightMap.set(4, "D");
      lightWeightMap.set(5, "E");
      let res = lightWeightMap.values();
      expect(res.next().value).assertEqual("A");
      expect(res.next().value).assertEqual("B");
      expect(res.next().value).assertEqual("C");
      expect(res.next().value).assertEqual("D");
      expect(res.next().value).assertEqual("E");
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_02900
     * @tc.name       : testLightWeightMap0029
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testLightWeightMap0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "A");
      lightWeightMap.set(2, "B");
      lightWeightMap.set(3, "C");
      lightWeightMap.set(4, "D");
      lightWeightMap.set(5, "E");
      let res = lightWeightMap.getValueAt(1);
      expect(res).assertEqual("B");
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_03000
     * @tc.name       : testLightWeightMap0030
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testLightWeightMap0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "A");
      lightWeightMap.set(2, "B");
      lightWeightMap.set(3, "C");
      lightWeightMap.set(4, "D");
      lightWeightMap.set(5, "E");
      let iters = lightWeightMap.entries();
      let flag = true;
      for (let i = 0, len = lightWeightMap.length; i < len; i++) {
        let entry = iters.next().value!;
        let res = lightWeightMap.get(entry[0]);
        if (res != entry[1]) {
          flag = false;
          break;
        }
      }
      expect(String(flag)).assertEqual('true');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_03100
     * @tc.name       : testLightWeightMap0031
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testLightWeightMap0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightMap = new LightWeightMap<number, null>();
      lightWeightMap.set(1, null);
      let res = lightWeightMap.hasValue(null);
      expect(String(res)).assertEqual('true');
      let res1 = lightWeightMap.hasKey(1);
      expect(String(res1)).assertEqual('true');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_03200
     * @tc.name       : testLightWeightMap0032
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testLightWeightMap0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightMap = new LightWeightMap<null, null>();
      lightWeightMap.set(null, null);
      let res = lightWeightMap.hasValue(null);
      expect(String(res)).assertEqual('true');
      let res1 = lightWeightMap.hasKey(null);
      expect(String(res1)).assertEqual('true');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_03300
     * @tc.name       : testLightWeightMap0033
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testLightWeightMap0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightMap = new LightWeightMap<boolean, boolean>();
      lightWeightMap.set(true, false);
      let res = lightWeightMap.hasValue(false);
      expect(String(res)).assertEqual('true');
      let res1 = lightWeightMap.hasKey(true);
      expect(String(res1)).assertEqual('true');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_03400
     * @tc.name       : testLightWeightMap0034
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testLightWeightMap0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightMap = new LightWeightMap<number, number>();
      lightWeightMap.set(1.23, 321);
      let res = lightWeightMap.hasValue(321);
      expect(String(res)).assertEqual('true');
      let res1 = lightWeightMap.hasKey(1.23);
      expect(String(res1)).assertEqual('true');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_03500
     * @tc.name       : testLightWeightMap0035
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testLightWeightMap0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightMap = new LightWeightMap<string, string>();
      lightWeightMap.set("a", "A");
      lightWeightMap.set("b", "B");
      lightWeightMap.set("c", "C");
      lightWeightMap.set("d", "D");
      lightWeightMap.set("e", "E");
      let lightWeightMap1 = new LightWeightMap<string, string>();
      lightWeightMap1.set("a1", "A1");
      lightWeightMap1.set("d1", "D1");
      let res = lightWeightMap.hasAll(lightWeightMap1);
      expect(String(res)).assertEqual('false');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_03600
     * @tc.name       : testLightWeightMap0036
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testLightWeightMap0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightMap = new LightWeightMap<string, string>();
      lightWeightMap.set("a", "A");
      lightWeightMap.set("b", "B");
      lightWeightMap.set("c", "C");
      lightWeightMap.set("d", "D");
      lightWeightMap.set("e", "E");
      let lightWeightMap1 = new LightWeightMap<string, string>();
      lightWeightMap1.set("a", "A1");
      lightWeightMap1.set("d", "D1");
      let res = lightWeightMap.hasAll(lightWeightMap1);
      expect(String(res)).assertEqual('false');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_03700
     * @tc.name       : testLightWeightMap0037
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testLightWeightMap0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightMap = new LightWeightMap<number, number>();
      let res = lightWeightMap.remove(3);
      expect(String(res)).assertEqual('undefined');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_03800
     * @tc.name       : testLightWeightMap0038
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testLightWeightMap0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightMap = new LightWeightMap<number, number>();
      let res = lightWeightMap.removeAt(1);
      expect(String(res)).assertEqual('false');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_03900
     * @tc.name       : testLightWeightMap0039
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it("testLightWeightMap0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let lightWeightMap = new LightWeightMap<string, string>();
    //   lightWeightMap.set("a", "A");
    //   lightWeightMap.set("b", "B");
    //   lightWeightMap.set("c", "C");
    //   lightWeightMap.set("d", "D");
    //   lightWeightMap.set("e", "E");
    //   lightWeightMap.increaseCapacityTo(10)
    //   let res = lightWeightMap.length;
    //   expect(String(res)).assertEqual('10');
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_04000
     * @tc.name       : testLightWeightMap0040
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it("testLightWeightMap0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let lightWeightMap = new LightWeightMap<string, string>();
    //   lightWeightMap.set("a", "A");
    //   lightWeightMap.set("b", "B");
    //   lightWeightMap.set("c", "C");
    //   lightWeightMap.set("d", "D");
    //   lightWeightMap.set("e", "E");
    //   try {
    //     lightWeightMap.increaseCapacityTo("qwe");
    //     expect(true).assertEqual(false);
    //   } catch (err: BusinessError) {
    //     expect(err.name).assertEqual("BusinessError");
    //     expect(err.code).assertEqual(401);
    //     expect(err.message).assertEqual(`The type of "minimumCapacity" must be small integer. Received value is: qwe`);
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_04100
     * @tc.name       : testLightWeightMap0041
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it("testLightWeightMap0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let lightWeightMap = new LightWeightMap<string, string>();
    //   try {
    //     let res = lightWeightMap.removeAt("a");
    //     expect(true).assertEqual(false);
    //   } catch (err: BusinessError) {
    //     expect(err.name).assertEqual("BusinessError");
    //     expect(err.code).assertEqual(401);
    //     expect(err.message).assertEqual(`The type of "index" must be small integer. Received value is: a`);
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_04200
     * @tc.name       : testLightWeightMap0042
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it("testLightWeightMap0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let lightWeightMap = new LightWeightMap<number, string>();
    //   lightWeightMap.set(1, "A");
    //   lightWeightMap.set(2, "B");
    //   lightWeightMap.set(3, "C");
    //   lightWeightMap.set(4, "D");
    //   lightWeightMap.set(5, "E");
    //   try {
    //     let res = lightWeightMap.getValueAt("a");
    //     expect(true).assertEqual(false);
    //   } catch (err: BusinessError) {
    //     expect(err.name).assertEqual("BusinessError");
    //     expect(err.code).assertEqual(401);
    //     expect(err.message).assertEqual(`The type of "index" must be small integer. Received value is: a`);
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_04300
     * @tc.name       : testLightWeightMap0043
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it("testLightWeightMap0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let lightWeightMap = new LightWeightMap();
    //   lightWeightMap.set(1, "A");
    //   lightWeightMap.set(2, "B");
    //   lightWeightMap.set(3, "C");
    //   lightWeightMap.set(4, "D");
    //   lightWeightMap.set(5, "E");
    //   try {
    //     let res = lightWeightMap.getKeyAt("a");
    //     expect(true).assertEqual(false);
    //   } catch (err) {
    //     expect(err.name).assertEqual("BusinessError");
    //     expect(err.code).assertEqual(401);
    //     expect(err.message).assertEqual(`The type of "index" must be small integer. Received value is: a`);
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_04400
     * @tc.name       : testLightWeightMap0044
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testLightWeightMap0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightMap = new LightWeightMap<number, number>();
      let lightWeightMap1 = new LightWeightMap<number, number>();
      let res = lightWeightMap.hasAll(lightWeightMap1);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_04500
     * @tc.name       : testLightWeightMap0045
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testLightWeightMap0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightMap = new LightWeightMap<number, string>();
      for (let i = 0; i < 100; i++) {
        lightWeightMap.set(i, "A");
      }
      let res = lightWeightMap.get(99);
      expect(String(res)).assertEqual("A");
      let res1 = lightWeightMap.length;
      expect(String(res1)).assertEqual('100');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_04600
     * @tc.name       : testLightWeightMap0046
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testLightWeightMap0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightMap = new LightWeightMap<number, number>();
      for (let i = 0; i < 100; i++) {
        lightWeightMap.set(1, i);
      }
      let res = lightWeightMap.get(1);
      expect(String(res)).assertEqual('99');
      let res1 = lightWeightMap.length;
      expect(String(res1)).assertEqual('1');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_04700
     * @tc.name       : testLightWeightMap0047
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it("testLightWeightMap0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   hilog.info(domain, tag,'testSet044')
    //   let lightWeightMap = new LightWeightMap<number, number>();
    //   for (let i = 0; i < 10000; i++) {
    //     lightWeightMap.set(i, i);
    //   }
    //   let res1 = lightWeightMap.length;
    //   expect(String(res1)).assertEqual('10000');
    //   for (let index = 0; index < 10000; index++) {
    //     let resKey = lightWeightMap.hasKey(index);
    //     expect(String(resKey)).assertEqual('true');
    //     let resValue = lightWeightMap.hasValue(index);
    //     expect(String(resValue)).assertEqual('true');
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_04800
     * @tc.name       : testLightWeightMap0048
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it("testLightWeightMap0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let lightWeightMap = new LightWeightMap<number, number>();
    //   for (let i = 0; i < 5000; i++) {
    //     lightWeightMap.set(i, i);
    //   }
    //   for (let i = -1; i > -5001; i--) {
    //     lightWeightMap.set(i, i);
    //   }
    //   let res1 = lightWeightMap.length;
    //   expect(String(res1)).assertEqual('10000');
    //   for (let index = 0; index < 5000; index++) {
    //     let resKey = lightWeightMap.hasKey(index);
    //     expect(String(resKey)).assertEqual('true');
    //     let resValue = lightWeightMap.hasValue(index);
    //     expect(String(resValue)).assertEqual('true');
    //   }
    //   for (let i = -1; i > -5001; i--) {
    //     let resKey = lightWeightMap.hasKey(i);
    //     expect(String(resKey)).assertEqual('true');
    //     let resValue = lightWeightMap.hasValue(i);
    //     expect(String(resValue)).assertEqual('true');
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_04900
     * @tc.name       : testLightWeightMap0049
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testLightWeightMap0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightMap = new LightWeightMap<boolean, number>();
      lightWeightMap.set(true, 0.001);
      let res = lightWeightMap.hasValue(0.001);
      expect(String(res)).assertEqual('true');
      let res1 = lightWeightMap.hasKey(true);
      expect(String(res1)).assertEqual('true');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_05000
     * @tc.name       : testLightWeightMap0050
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testLightWeightMap0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let a = new Array<number>(1, 2, 3, 4)
      let lightWeightMap = new LightWeightMap<Array<number>, number>();
      lightWeightMap.set(a, 1);
      let res = lightWeightMap.hasValue(1);
      expect(String(res)).assertEqual('true');
      let res1 = lightWeightMap.hasKey(a);
      expect(String(res1)).assertEqual('true');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_05100
     * @tc.name       : testLightWeightMap0051
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testLightWeightMap0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightMap = new LightWeightMap<Object, string>();
      let a = new TestAbc();
      lightWeightMap.set(a, "");
      let res = lightWeightMap.hasValue("");
      expect(String(res)).assertEqual('true');
      let res1 = lightWeightMap.hasKey(a);
      expect(res1).assertEqual(true);
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_05200
     * @tc.name       : testLightWeightMap0052
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testLightWeightMap0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "A");
      lightWeightMap.set(2, "B");
      lightWeightMap.set(3, "C");
      lightWeightMap.set(4, "D");
      lightWeightMap.set(5, "E");
      let res = lightWeightMap.get(10);
      expect(String(res)).assertEqual('undefined');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_05300
     * @tc.name       : testLightWeightMap0053
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testLightWeightMap0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightMap = new LightWeightMap<string, string>();
      lightWeightMap.set("a", "A");
      lightWeightMap.set("b", "B");
      lightWeightMap.set("c", "C");
      lightWeightMap.set("d", "D");
      lightWeightMap.set("e", "E");
      let lightWeightMap1 = new LightWeightMap<string, string>();
      lightWeightMap1.set("a", "A");
      lightWeightMap1.set("d", "D1");
      let res = lightWeightMap.hasAll(lightWeightMap1);
      expect(String(res)).assertEqual('false');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_0540
     * @tc.name       : testLightWeightMap0054
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it("testLightWeightMap0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let lightWeightMap = new LightWeightMap<number, Array<number>>();
    //   try {
    //     lightWeightMap.hasAll(new Array<number>(1,2,3));
    //     expect(true).assertEqual(false);
    //   } catch (err: BusinessError) {
    //     expect(err.name).assertEqual("BusinessError");
    //     expect(err.code).assertEqual(401);
    //     expect(err.message).assertEqual(`The type of "map" must be LightWeightMap. Received value is: 1,2,3`);
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_0550
     * @tc.name       : testLightWeightMap0055
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testLightWeightMap0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "A");
      lightWeightMap.set(2, "B");
      lightWeightMap.set(3, "C");
      lightWeightMap.set(4, "D");
      lightWeightMap.set(5, "E");
      try {
        let res = lightWeightMap.getKeyAt(6);
        expect(true).assertEqual(false);
      } catch (err: BusinessError) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 6`);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_0560
     * @tc.name       : testLightWeightMap0056
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it("testLightWeightMap0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let lightWeightMap = new LightWeightMap<number, string>();
    //   lightWeightMap.set(1, "A");
    //   lightWeightMap.set(2, "B");
    //   try {
    //     lightWeightMap.setAll(new Array<number>(1,2,3));
    //     expect(true).assertEqual(false);
    //   } catch (err: BusinessError) {
    //     expect(err.name).assertEqual("BusinessError");
    //     expect(err.code).assertEqual(401);
    //     expect(err.message).assertEqual(`The type of "map" must be LightWeightMap. Received value is: 1,2,3`);
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_0570
     * @tc.name       : testLightWeightMap0057
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it("testLightWeightMap0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let lightWeightMap = new LightWeightMap<number, string>();
    //   lightWeightMap.set(1, "A");
    //   lightWeightMap.set(2, "B");
    //   try {
    //     lightWeightMap.setValueAt("a", "a");
    //     expect(true).assertEqual(false);
    //   } catch (err: BusinessError) {
    //     expect(err.name).assertEqual("BusinessError");
    //     expect(err.code).assertEqual(401);
    //     expect(err.message).assertEqual(`The type of "index" must be small integer. Received value is: a`);
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_0580
     * @tc.name       : testLightWeightMap0058
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testLightWeightMap0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "A");
      lightWeightMap.set(2, "B");
      try {
        lightWeightMap.setValueAt(3, "a");
        expect(true).assertEqual(false);
      } catch (err: BusinessError) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 1. Received value is: 3`);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_0590
     * @tc.name       : testLightWeightMap0059
     * @tc.desc       : Test the function By LightWeightMap.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testLightWeightMap0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "A");
      lightWeightMap.set(2, "B");
      lightWeightMap.set(3, "C");
      lightWeightMap.set(4, "D");
      lightWeightMap.set(5, "E");
      try {
        lightWeightMap.getValueAt(6);
        expect(true).assertEqual(false);
      } catch (err: BusinessError) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 6`);
      }
    });
  });
}
