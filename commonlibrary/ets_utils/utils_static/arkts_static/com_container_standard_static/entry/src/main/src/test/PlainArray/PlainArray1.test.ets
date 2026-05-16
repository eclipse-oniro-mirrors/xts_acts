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
import PlainArray from '@ohos.util.PlainArray';
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

export default function PlainArrayTest1() {
  describe("PlainArrayTest1", (): void => {
    afterEach(() => {
      await Utils.msSleep(10)
    })

    /**
     * @tc.name   testPlainArray001
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_0100
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPlainArray001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      try {
        let plainArray = new PlainArray<string>();
      } catch (err) {
        err = err as BusinessError;
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200012);
        expect(err.message).assertEqual("The PlainArray's constructor cannot be directly invoked");
      }
    });

    /**
     * @tc.name   testPlainArray002
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_0200
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPlainArray002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      let res = plainArray.get(1);
      expect(res).assertEqual("A");
    });

    /**
     * @tc.name   testPlainArray003
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_0300
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPlainArray003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let plainArray = new PlainArray<Array<number>>();
      let a = new Array<number>(1, 2, 3, 4);
      plainArray.add(2, a);
      let res = plainArray.get(2);
      expect(JSON.stringify(res)).assertEqual(JSON.stringify(a));
    });

    /**
     * @tc.name   testPlainArray004
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_0400
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPlainArray004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let plainArray = new PlainArray<InfoC>();
      let c = new InfoC();
      plainArray.add(1, c);
      let res = plainArray.get(1);
      expect(JSON.stringify(res)).assertEqual(JSON.stringify(c));
    });

    /**
     * @tc.name   testPlainArray005
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_0500
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPlainArray005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let plainArray = new PlainArray<boolean>();
      let c = false;
      plainArray.add(1, c);
      let res = plainArray.get(1);
      expect(String(res)).assertEqual('false');
    });

    /**
     * @tc.name   testPlainArray006
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_0600
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPlainArray006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let plainArray = new PlainArray<number>();
      plainArray.add(1, 3);
      let res = plainArray.get(1);
      expect(String(res)).assertEqual('3');
    });

    /**
     * @tc.name   testPlainArray007
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_0700
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPlainArray007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.get(4);
      expect(res).assertEqual("D");
      res = plainArray.get(10);
      expect(String(res)).assertEqual('undefined');
    });

    /**
     * @tc.name   testPlainArray008
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_0800
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPlainArray008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let plainArray = new PlainArray<string>();
      let res = plainArray.length;
      expect(String(res)).assertEqual('0');
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      res = plainArray.length;
      expect(String(res)).assertEqual('5');
    });

    /**
     * @tc.name   testPlainArray009
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_0900
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPlainArray009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let plainArray = new PlainArray<string>();
      let clonePlainarray = plainArray.clone();
      let cloneLength = clonePlainarray.length;
      expect(String(cloneLength)).assertEqual('0');
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.clone();
      let arr = new Array<string>();
      res.forEach((value, index) => {
        arr.push(value);
      });
      let arr1 = new Array<string>("A", "B", "C", "D", "E");
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(arr1[i]);
      }
    });

    /**
     * @tc.name   testPlainArray010
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_1000
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPlainArray010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.length;
      expect(String(res)).assertEqual('5');
      plainArray.clear();
      let res1 = plainArray.length;
      expect(String(res1)).assertEqual('0');
      plainArray.clear();
      let res2 = plainArray.length;
      expect(String(res2)).assertEqual('0');
    });

    /**
     * @tc.name   testPlainArray011
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_1100
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPlainArray011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.has(6);
      expect(String(res)).assertEqual('false');
      let res1 = plainArray.has(1);
      expect(String(res1)).assertEqual('true');
    });

    /**
     * @tc.name   testPlainArray012
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_1200
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPlainArray012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.getIndexOfKey(2);
      expect(String(res)).assertEqual('1');
      res = plainArray.getIndexOfKey(12);
      expect(String(res)).assertEqual('-1');
    });

    /**
     * @tc.name   testPlainArray013
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_1300
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPlainArray013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.getIndexOfValue("A");
      expect(String(res)).assertEqual('0');
      res = plainArray.getIndexOfValue("Z");
      expect(String(res)).assertEqual('-1');
    });

    /**
     * @tc.name   testPlainArray014
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_1400
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPlainArray014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let plainArray = new PlainArray<string>();
      let result = plainArray.length;
      expect(String(result)).assertEqual('0');
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.isEmpty();
      expect(String(res)).assertEqual('false');
    });

    /**
     * @tc.name   testPlainArray015
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_1500
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPlainArray015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.getKeyAt(2);
      expect(String(res)).assertEqual('3');
    });

    /**
     * @tc.name   testPlainArray016
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_1600
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPlainArray016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.remove(2);
      expect(res).assertEqual("B");
      let value = plainArray.get(2);
      expect(String(value)).assertEqual('undefined');
      res = plainArray.remove(12);
      expect(String(res)).assertEqual('undefined');
    });

    /**
     * @tc.name   testPlainArray017
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_1700
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPlainArray017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.removeAt(2);
      expect(res).assertEqual("C");
      let value = plainArray.get(3);
      expect(String(value)).assertEqual('undefined');
    });

    /**
     * @tc.name   testPlainArray018
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_1800
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPlainArray018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      plainArray.removeRangeFrom(2, 2);
      let keys = new Array<number>(1, 2, 5);
      let values = new Array<string>("A", "B", "E");
      for (let i = 0; i < keys.length; i++) {
        expect(values[i]).assertEqual(plainArray.get(keys[i] as int));
      }
      try {
        plainArray.removeRangeFrom(15, 5);
        expect(true).assertEqual(false);
      } catch (err) {
        err = err as BusinessError;
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 2. Received value is: 15`);
      }
    });

    /**
     * @tc.name   testPlainArray019
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_1900
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPlainArray019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      plainArray.setValueAt(2, "V");
      let keys = new Array<number>(1, 2, 3, 4, 5);
      let values = new Array<string>("A", "B", "V", "D", "E");
      for (let i = 0; i < keys.length; i++) {
        expect(values[i]).assertEqual(plainArray.get(keys[i] as int));
      }
      try {
        plainArray.setValueAt(-1, "X");
        expect(true).assertEqual(false);
      } catch (err) {
        err = err as BusinessError;
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: -1`);
      }
    });

    /**
     * @tc.name   testPlainArray020
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_2000
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPlainArray020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let plainArray = new PlainArray<string>();
      let res1 = plainArray.toString();
      expect(res1).assertEqual("");
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      let res = plainArray.toString();
      expect(res).assertEqual("1:A,2:B,3:C");
    });

    /**
     * @tc.name   testPlainArray021
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_2100
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPlainArray021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let arr = new Array<string>();
      plainArray.forEach((value, index) => {
        arr.push(value);
      });
      let arr1 = new Array<string>("A", "B", "C", "D", "E");
      for (let i = 0; i < arr1.length; i++) {
        expect(arr[i]).assertEqual(arr1[i]);
      }
    });

    /**
     * @tc.name   testPlainArray022
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_2200
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPlainArray022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let keys = new Array<number>(1, 2, 3, 4, 5);
      let values = new Array<string>("A", "B", "C", "D", "E");
      for (let i = 0; i < keys.length; i++) {
        expect(values[i]).assertEqual(plainArray.get(keys[i] as int));
      }
    });

    /**
     * @tc.name   testPlainArray023
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_2300
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPlainArray023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.getValueAt(2);
      expect(res).assertEqual("C");
    });

    /**
     * @tc.name   testPlainArray024
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_2400
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPlainArray024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let plainArray = new PlainArray<number>();
      plainArray.add(1, 3.1);
      let res = plainArray.get(1);
      expect(String(res)).assertEqual('3.1');
    });

    /**
     * @tc.name   testPlainArray025
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_2500
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPlainArray025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let plainArray = new PlainArray<null>();
      plainArray.add(1, null);
      let res = plainArray.get(1);
      expect(String(res)).assertEqual('null');
    });

    /**
     * @tc.name   testPlainArray027
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_2700
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPlainArray027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.get(8);
      expect(String(res)).assertEqual('undefined');
    });

    /**
     * @tc.name   testPlainArray028
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_2800
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPlainArray028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.getIndexOfKey(9);
      expect(String(res)).assertEqual('-1');
    });

    /**
     * @tc.name   testPlainArray029
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_2900
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPlainArray029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.getIndexOfValue("Asad");
      expect(String(res)).assertEqual('-1');
    });

    /**
     * @tc.name   testPlainArray030
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_3000
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPlainArray030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.getKeyAt(50);
      expect(String(res)).assertEqual('-1');
    });

    /**
     * @tc.name   testPlainArray031
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_3100
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPlainArray031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      try {
        plainArray.getValueAt(50);
        expect(true).assertEqual(false);
      } catch (err) {
        err = err as BusinessError;
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 50`);
      }
    });

    /**
     * @tc.name   testPlainArray032
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_3200
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPlainArray032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let plainArray = new PlainArray<string>();
      let res = plainArray.remove(2);
      expect(String(res)).assertEqual('undefined');
    });


    /**
     * @tc.name   testPlainArray034
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_3400
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPlainArray034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      plainArray.removeRangeFrom(0, 5);
      let res = plainArray.length;
      expect(String(res)).assertEqual('0');
    });

    /**
     * @tc.name   testPlainArray035
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_3500
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPlainArray035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      try {
        plainArray.setValueAt(8, "V");
        expect(true).assertEqual(false);
      } catch (err) {
        err = err as BusinessError;
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 8`);
      }
    });

    /**
     * @tc.name   testPlainArray036
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_3600
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPlainArray036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let plainArray = new PlainArray<number>();
      for (let i = 0; i < 100; i++) {
        plainArray.add(i, i + 1);
      }
      let res = plainArray.get(1);
      let res1 = plainArray.length;
      expect(String(res)).assertEqual('2');
      expect(String(res1)).assertEqual('100');
    });

    /**
     * @tc.name   testPlainArray037
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_3700
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPlainArray037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let plainArray = new PlainArray<number>();
      for (let i = 0; i < 1000; i++) {
        plainArray.add(i, i + 1);
      }
      let res = plainArray.get(99);
      let res1 = plainArray.length;
      expect(String(res)).assertEqual('100');
      expect(String(res1)).assertEqual('1000');
    });

    /**
     * @tc.name   testPlainArray038
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_3800
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPlainArray038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let plainArray = new PlainArray<string>();
      plainArray.add(3, "a");
      plainArray.add(1, "b");
      plainArray.add(2, "c");
      plainArray.add(5, "d");
      plainArray.add(4, "e");
      let res = plainArray.get(2);
      expect(res).assertEqual("c");
    });

    /**
     * @tc.name   testPlainArray039
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_3900
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPlainArray039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let plainArray = new PlainArray<number | string | null | undefined | object | boolean | Array<number>>();
      plainArray.add(1, "ABCd");
      plainArray.add(2, "~!@#$^&*()_+-*/=.?<>:;|{}[]");
      plainArray.add(3, null);
      plainArray.add(4, undefined);
      plainArray.add(5, new Array<number>());
      plainArray.add(6, {});
      plainArray.add(7, true);
      plainArray.add(8, 1234);
      plainArray.add(9, 1.234);
      plainArray.add(10, -1234);
      let res = plainArray.get(2);
      expect(res).assertEqual("~!@#$^&*()_+-*/=.?<>:;|{}[]");
    });

    /**
     * @tc.name   testPlainArray041
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_4100
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPlainArray041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let plainArray = new PlainArray<number | string | boolean | InfoC | undefined | null | Array<number>>();
      plainArray.add(1, 1);
      plainArray.add(2, "b");
      plainArray.add(3, true);
      plainArray.add(4, new Array<number>(1, 2, 3, 4));
      plainArray.add(5, new InfoC("lili", "13"));
      plainArray.add(6, undefined);
      plainArray.add(7, null);
      let res = plainArray.get(2);
      expect(res).assertEqual("b");
    });

    /**
     * @tc.name   testPlainArray042
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_4200
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPlainArray042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let iters = plainArray.$_iterator();
      let flag = true;
      for (let i = 0, len = plainArray.length; i < len; i++) {
        let entry = iters.next().value!;
        let res = plainArray.get(entry[0]);
        if (res != entry[1]) {
          flag = false;
          break;
        }
      }
      expect(String(flag)).assertEqual('true');
    });


    /**
     * @tc.name   testPlainArray048
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAY_4800
     * @tc.desc   Test the function By PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPlainArray048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.removeAt(12);
      expect(String(res)).assertEqual('undefined');
    });
  });
}
