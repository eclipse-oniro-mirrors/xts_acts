/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import ArrayList from '@ohos.util.ArrayList';
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


class C1 {
  name: string;
  age: string;

  constructor(name: string = "", age: string = "") {
    this.name = name;
    this.age = age;
  }
}

export default function ArraylistTest1() {
  describe("ArraylistTest1", (): void => {
    afterEach(() => {
      await Utils.msSleep(10)
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_0100
     * @tc.name       : testArray0001
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let arrayList = new ArrayList<String>();
        expect(String(arrayList != undefined)).assertEqual('true');
      } catch (err: BusinessError) {
        expect(err.name).assertEqual("BusinessError");
        expect(String(err.code)).assertEqual('10200012');
        expect(err.message).assertEqual("The ArrayList's constructor cannot be directly invoked");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_0200
     * @tc.name       : testArray0002
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String> = new ArrayList<String>();
      arrayList.add("四");
      let res = arrayList.has("四");
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_0300
     * @tc.name       : testArray0003
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<Number> = new ArrayList<Number>();
      arrayList.add(8);
      let res = arrayList.has(8);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_0400
     * @tc.name       : testArray0004
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<Object> = new ArrayList<Object>();
      let a: C1 = {
        name: "lala", age: "13岁"
      };
      arrayList.add(a);
      let res = arrayList.has(a);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_0500
     * @tc.name       : testArray0005
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<Array<Number>> = new ArrayList<Array<Number>>();
      let a: Array<Number> = new Array<Number>(1, 2, 3, 4);
      arrayList.add(a);
      let res = arrayList.has(a);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_0600
     * @tc.name       : testArray0006
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<Boolean> = new ArrayList<Boolean>();
      let a: Boolean = true;
      arrayList.add(a);
      let res = arrayList.has(a);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_0700
     * @tc.name       : testArray0007
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.insert(8, 2);
      let arr: Array<String | Number> = new Array<String | Number>();
      arrayList.forEach((item: String | Number, index) => {
        arr.push(item);
      });
      let a: Array<String | Number> = new Array<String | Number>("四", "三", 8, 1, "a");
      for (let i = 0; i < a.length; i++) {
        expect(String(arr[i])).assertEqual(String(a[i]));
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_0800
     * @tc.name       : testArray0008
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.insert(8, 2);
      let res = arrayList.length;
      expect(String(res)).assertEqual('5');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_0900
     * @tc.name       : testArray0009
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.insert(8, 2);
      let res = arrayList.has(8);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_01000
     * @tc.name       : testArray0010
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      arrayList.add(1);
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.insert(1, 2);
      let res1 = arrayList.getIndexOf(1);
      expect(String(res1)).assertEqual('0');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_01100
     * @tc.name       : testArray0011
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.removeByIndex(2);
      let arr: Array<String | Number> = new Array<String | Number>();
      arrayList.forEach((item: String | Number, index) => {
        arr.push(item);
      });
      let a: Array<String | Number> = new Array<String | Number>("四", "三", "a");
      for (let i = 0; i < a.length; i++) {
        expect(String(arr[i])).assertEqual(String(a[i]));
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_01200
     * @tc.name       : testArray0012
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.remove("三");
      let res = arrayList.has("三");
      expect(String(res)).assertEqual('false');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_01300
     * @tc.name       : testArray0013
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.add(1);
      arrayList.add("b");
      let res = arrayList.getLastIndexOf(1);
      expect(String(res)).assertEqual('4');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_01400
     * @tc.name       : testArray0014
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.add(1);
      arrayList.add("b");
      arrayList.add("c");
      arrayList.add(1);
      arrayList.removeByRange(1, 3);
      let arr: Array<String | Number> = new Array<String | Number>();
      arrayList.forEach((item: String | Number, index) => {
        arr.push(item);
      });
      let a: Array<String | Number> = new Array<String | Number>("四", "a", 1, "b", "c", 1);
      for (let i = 0; i < a.length; i++) {
        expect(String(arr[i])).assertEqual(String(a[i]));
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_01500
     * @tc.name       : testArray0015
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    // it("testArray0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let arrayList: ArrayList<Number> = new ArrayList<Number>();
    //   arrayList.add(4);
    //   arrayList.add(3);
    //   arrayList.add(1);
    //   arrayList.add(2);
    //   arrayList.add(14);
    //   arrayList.replaceAllElements((item, index) => {
    //     return (item = 2 * item);
    //   });
    //   let arr: Array<Number> = new Array<Number>();
    //   arrayList.forEach((item: Number, index) => {
    //     arr.push(item);
    //   });
    //   let a: Array<Number> = new Array<Number>(8, 6, 2, 4, 28);
    //   for (let i = 0; i < a.length; i++) {
    //     expect(String(arr[i])).assertEqual(String(a[i]));
    //   }
    // });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_01600
     * @tc.name       : testArray0016
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<Number> = new ArrayList<Number>();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      let arr: Array<String | Number> = new Array<String | Number>();
      arrayList.forEach((item: String | Number, index) => {
        arr.push(item);
      });
      let a: Array<String | Number> = new Array<String | Number>(4, 3, 1, 2, 14);
      for (let i = 0; i < a.length; i++) {
        expect(String(arr[i])).assertEqual(String(a[i]));
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_01700
     * @tc.name       : testArray0017
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<Number> = new ArrayList<Number>();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      let subArr = arrayList.subArrayList(2, 4);
      let arr: Array<String | Number> = new Array<String | Number>();
      subArr.forEach((item, index) => {
        arr.push(item);
      });
      let a: Array<String | Number> = new Array<String | Number>(1, 2);
      for (let i = 0; i < a.length; i++) {
        expect(String(arr[i])).assertEqual(String(a[i]));
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_01800
     * @tc.name       : testArray0018
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<Number> = new ArrayList<Number>();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      arrayList.clear();
      let res = arrayList.length;
      expect(String(res)).assertEqual('0');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_01900
     * @tc.name       : testArray0019
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<Number> = new ArrayList<Number>();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      let arr = arrayList.convertToArray();
      let a: Array<String | Number> = new Array<String | Number>(4, 3, 1, 2, 14);
      for (let i = 0; i < a.length; i++) {
        expect(String(arr[i])).assertEqual(String(a[i]));
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_02000
     * @tc.name       : testArray0020
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<Number> = new ArrayList<Number>();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      let res = arrayList.clone();
      let arr: Array<String | Number> = new Array<String | Number>();
      res.forEach((item, index) => {
        arr.push(item);
      });
      let a: Array<String | Number> = new Array<String | Number>(4, 3, 1, 2, 14);
      for (let i = 0; i < a.length; i++) {
        expect(String(arr[i])).assertEqual(String(a[i]));
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_02100
     * @tc.name       : testArray0021
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<Number> = new ArrayList<Number>();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      let res = arrayList.getCapacity();
      expect(String(res)).assertEqual('10');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_02200
     * @tc.name       : testArray0022
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number | Array<String | Number>> =
        new ArrayList<String | Number | Array<String | Number>>();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      arrayList.add("a");
      arrayList.add("b");
      arrayList.add("c");
      arrayList.add("d");
      arrayList.add("v");
      let a: Array<String | Number> = new Array<String | Number>(1, 2, 3, 4);
      arrayList.add(a);
      let res = arrayList.getCapacity();
      expect(String(res)).assertEqual('15');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_02300
     * @tc.name       : testArray0023
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      arrayList.increaseCapacityTo(8);
      let res = arrayList.getCapacity();
      expect(String(res)).assertEqual('8');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_02400
     * @tc.name       : testArray0024
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      arrayList.trimToCurrentLength();
      let res = arrayList.getCapacity();
      expect(String(res)).assertEqual('5');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_02500
     * @tc.name       : testArray0025
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number | Array<String | Number>> =
        new ArrayList<String | Number | Array<String | Number>>();
      arrayList.add(8);
      arrayList.add("一");
      arrayList.add("二");
      arrayList.add(5);
      let c: Array<String | Number> = new Array<String | Number>(1, 2, 3, 4);
      arrayList.add(c);
      arrayList.add(6);
      arrayList.add("三");
      arrayList.add("四");
      let arr: Array<String | Number | Array<String | Number>> = new Array<String | Number | Array<String | Number>>();
      for (let item of arrayList) {
        arr.push(item);
      }
      let a: Array<String | Number | Array<String | Number>> =
        new Array<String | Number | Array<String | Number>>(8, "一", "二", 5, c, 6, "三", "四");
      for (let i = 0; i < a.length; i++) {
        expect(String(arr[i])).assertEqual(String(a[i]));
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_02600
     * @tc.name       : testArray0026
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<Number> = new ArrayList<Number>();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      arrayList.sort((a, b) => a - b);
      let arr: Array<Number> = new Array<Number>();
      arrayList.forEach((item: Number, index) => {
        arr.push(item);
      });
      let a: Array<Number> = new Array<Number>(1, 2, 3, 4, 14);
      for (let i = 0; i < a.length; i++) {
        expect(String(arr[i])).assertEqual(String(a[i]));
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_02700
     * @tc.name       : testArray0027
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it("testArray0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
    //   arrayList.add("四");
    //   arrayList.add("三");
    //   arrayList.add(1);
    //   arrayList.add("a");
    //   try {
    //     let res = arrayList.insert(8, -1);
    //     expect('true').assertEqual('false')
    //   } catch (err: BusinessError) {
    //     expect(err.name).assertEqual("BusinessError");
    //     expect(String(err.code)).assertEqual('10200001');
    //     expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: -1`);
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_02800
     * @tc.name       : testArray0028
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it("testArray0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
    //   arrayList.add("四");
    //   arrayList.add("三");
    //   arrayList.add(1);
    //   arrayList.add("a");
    //   try {
    //     let res = arrayList.insert(8, 10);
    //     expect('true').assertEqual('false')
    //   } catch (err: BusinessError) {
    //     expect(err.name).assertEqual("BusinessError");
    //     expect(String(err.code)).assertEqual('10200001');
    //     expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 10`);
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_02900
     * @tc.name       : testArray0029
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it("testArray0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
    //   arrayList.add("四");
    //   arrayList.add("三");
    //   arrayList.add(1);
    //   arrayList.add("a");
    //   try {
    //     let res = arrayList.insert(8, 11);
    //     expect('true').assertEqual('false')
    //   } catch (err: BusinessError) {
    //     expect(err.name).assertEqual("BusinessError");
    //     expect(String(err.code)).assertEqual('10200001');
    //     expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 11`);
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_03000
     * @tc.name       : testArray0030
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      arrayList.clear();
      let res = arrayList.isEmpty();
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_03100
     * @tc.name       : testArray0031
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      let res = arrayList.isEmpty();
      expect(String(res)).assertEqual('false');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_03200
     * @tc.name       : testArray0032
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.insert(8, 2);
      let res = arrayList.has("二");
      expect(String(res)).assertEqual('false');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_03300
     * @tc.name       : testArray0033
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      arrayList.add(1);
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.insert(1, 2);
      let res = arrayList.getIndexOf("A");
      expect(String(res)).assertEqual('-1');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_03400
     * @tc.name       : testArray0034
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      let res = arrayList.remove("A");
      expect(String(res)).assertEqual('false');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_03500
     * @tc.name       : testArray0035
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      arrayList.add(0);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(1);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.forEach((item: String | Number, index) => {
        if (item == 1) {
          arrayList.remove(item);
        }
      });
      let arr: Array<String | Number> = new Array<String | Number>();
      arrayList.forEach((item: String | Number, index) => {
        arr.push(item);
      });
      let a: Array<String | Number> = new Array<String | Number>(0, 2, 3);
      for (let i = 0; i < a.length; i++) {
        expect(String(arr[i])).assertEqual(String(a[i]));
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_03600
     * @tc.name       : testArray0036
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      arrayList.add("a");
      arrayList.add("b");
      arrayList.add("c");
      arrayList.add("a");
      arrayList.add("b");
      try {
        let res = arrayList.removeByIndex(5);
        expect('true').assertEqual('false')
      } catch (err: BusinessError) {
        expect(err.name).assertEqual("BusinessError");
        expect(String(err.code)).assertEqual('10200001');
        expect(err.message)
          .assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 5`);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_03700
     * @tc.name       : testArray0037
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it("testArray0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
    //   arrayList.add("四");
    //   arrayList.add("三");
    //   arrayList.add(1);
    //   arrayList.add("a");
    //   arrayList.add(1);
    //   arrayList.add("b");
    //   arrayList.add("c");
    //   arrayList.add(1);
    //   try {
    //     let res = arrayList.removeByRange(3, 1);
    //     expect('true').assertEqual('false')
    //   } catch (err: BusinessError) {
    //     expect(err.name).assertEqual("BusinessError");
    //     expect(String(err.code)).assertEqual('10200001');
    //     expect(err.message).assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 0. Received value is: 3`);
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_03800
     * @tc.name       : testArray0038
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it("testArray0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
    //   arrayList.add("四");
    //   arrayList.add("三");
    //   arrayList.add(1);
    //   arrayList.add("a");
    //   arrayList.add(1);
    //   try {
    //     let res = arrayList.removeByRange(6, 8);
    //     expect('true').assertEqual('false')
    //   } catch (err: BusinessError) {
    //     expect(err.name).assertEqual("BusinessError");
    //     expect(String(err.code)).assertEqual('10200001');
    //     expect(err.message).assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 4. Received value is: 6`);
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_03900
     * @tc.name       : testArray0039
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.add(1);
      arrayList.add("b");
      arrayList.add("c");
      arrayList.add(1);
      arrayList.removeByRange(0, 8);
      let res = arrayList.length;
      let res1 = arrayList.getLastIndexOf(1);
      expect(String(res)).assertEqual('0');
      expect(String(res1)).assertEqual('-1');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_04000
     * @tc.name       : testArray0001
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      try {
        let subArr = arrayList.subArrayList(4, 2);
        expect('true').assertEqual('false')
      } catch (err: BusinessError) {
        expect(err.name).assertEqual("BusinessError");
        expect(String(err.code)).assertEqual('10200001');
        expect(err.message)
          .assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 1. Received value is: 4`);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_04100
     * @tc.name       : testArray0041
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      let subArr = arrayList.subArrayList(0, 5);
      let arr: Array<String | Number> = new Array<String | Number>();
      arrayList.forEach((item: String | Number, index) => {
        arr.push(item);
      });
      let a: Array<String | Number> = new Array<String | Number>(4, 3, 1, 2, 14);
      for (let i = 0; i < a.length; i++) {
        expect(String(a[i])).assertEqual(String(arr[i]));
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_04200
     * @tc.name       : testArray0042
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      try {
        let subArr = arrayList.subArrayList(6, 9);
        expect('true').assertEqual('false')
      } catch (err: BusinessError) {
        expect(err.name).assertEqual("BusinessError");
        expect(String(err.code)).assertEqual('10200001');
        expect(err.message)
          .assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 4. Received value is: 6`);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_04300
     * @tc.name       : testArray0043
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      arrayList.increaseCapacityTo(-1);
      let res = arrayList.getCapacity();
      expect(String(res)).assertEqual('10');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_04400
     * @tc.name       : testArray0044
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it("testArray0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
    //   arrayList.add(4);
    //   arrayList.add(3);
    //   arrayList.add(1);
    //   arrayList.add(2);
    //   arrayList.add(14);
    //   try {
    //     let res = arrayList.increaseCapacityTo();
    //     expect('true').assertEqual('false')
    //   } catch (err: BusinessError) {
    //     expect(err.name).assertEqual("BusinessError");
    //     expect(String(err.code)).assertEqual('401');
    //     expect(err.message).assertEqual(`The type of "newCapacity" must be number. Received value is: undefined`);
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_04500
     * @tc.name       : testArray0045
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      for (let i = 0; i < 100; i++) {
        arrayList.add(i);
      }
      let res = arrayList.getIndexOf(99);
      let res1 = arrayList.length;
      expect(String(res)).assertEqual('99');
      expect(String(res1)).assertEqual('100');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_4600
     * @tc.name       : testArray0046
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      let a = "*";
      arrayList.add(a);
      let res = arrayList.has(a);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_04700
     * @tc.name       : testArray0047
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      let a = "3.14";
      arrayList.add(a);
      let res = arrayList.has(a);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_04800
     * @tc.name       : testArray0048
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      let a = "";
      arrayList.add(a);
      let res = arrayList.has(a);
      expect(String(res)).assertEqual('true');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_04900
     * @tc.name       : testArray0049
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it("testArray0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
    //   arrayList.add("刘");
    //   arrayList.add("张三");
    //   arrayList.add(1);
    //   arrayList.add(2);
    //   arrayList.add("李四");
    //   arrayList.sort((a, b) => a - b);
    //   let arr: Array<String | Number> = new Array<String | Number>();
    //   arrayList.forEach((item: String | Number, index) => {
    //     arr.push(item);
    //   });
    //   let a: Array<String | Number> = new Array<String | Number>("刘", "张三", 1, 2, "李四");
    //   for (let i = 0; i < a.length; i++) {
    //     expect(String(arr[i])).assertEqual(String(a[i]));
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_05000
     * @tc.name       : testArray0050
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it("testArray0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let arrayList: ArrayList<String> = new ArrayList<String>();
    //   arrayList.add("c");
    //   arrayList.add("a");
    //   arrayList.add("b");
    //   arrayList.add("e");
    //   arrayList.add("d");
    //   arrayList.sort((a, b) => a - b);
    //   let arr: Array<String> = new Array<String>();
    //   arrayList.forEach((item: String, index) => {
    //     arr.push(item);
    //   });
    //   let a: Array<String> = new Array<String>("c", "a", "b", "e", "d");
    //   for (let i = 0; i < a.length; i++) {
    //     expect(String(arr[i])).assertEqual(String(a[i]));
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_05100
     * @tc.name       : testArray0051
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      arrayList.add("刘");
      arrayList.add("张三");
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add("李四");
      let arr: Array<String | Number> = new Array<String | Number>();
      let itr = arrayList.$_iterator();
      let tmp: String | Number | undefined = undefined;
      do {
        tmp = itr.next().value;
        arr.push(tmp as String | Number);
      } while (tmp != undefined);
      let a: Array<String | Number> = new Array<String | Number>("刘", "张三", 1, 2, "李四");
      for (let i = 0; i < a.length; i++) {
        expect(String(arr[i])).assertEqual(String(a[i]));
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_05200
     * @tc.name       : testArray0052
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.add(1);
      arrayList.add("b");
      arrayList.add("c");
      arrayList.add(1);
      try {
        arrayList.removeByRange(0, 9);
        expect('true').assertEqual('false')
      } catch (err: BusinessError) {
        expect(err.name).assertEqual("BusinessError");
        expect(String(err.code)).assertEqual('10200001');
        expect(err.message)
          .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: 9`);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_05300
     * @tc.name       : testArray0053
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it("testArray0053 ", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
    //   try {
    //     arrayList.add.bind({}, "a")()
    //     expect('true').assertEqual('false')
    //   } catch (err: BusinessError) {
    //     expect(err.name).assertEqual("BusinessError");
    //     expect(String(err.code)).assertEqual('10200011');
    //     expect(err.message).assertEqual(`The add method cannot be bound`);
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_05400
     * @tc.name       : testArray0054
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it("testArray0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
    //   arrayList.add(1);
    //   try {
    //     let res = arrayList.insert("a", "b");
    //     expect('true').assertEqual('false')
    //   } catch (err: BusinessError) {
    //     expect(err.name).assertEqual("BusinessError");
    //     expect(String(err.code)).assertEqual('401');
    //     expect(err.message).assertEqual(`The type of "index" must be small integer. Received value is: b`);
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_05500
     * @tc.name       : testArray0055
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it("testArray0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
    //   arrayList.add("a");
    //   arrayList.add("b");
    //   arrayList.add("c");
    //   arrayList.add("a");
    //   arrayList.add("b");
    //   try {
    //     let res = arrayList.removeByIndex("a");
    //     expect('true').assertEqual('false')
    //   } catch (err: BusinessError) {
    //     expect(err.name).assertEqual("BusinessError");
    //     expect(String(err.code)).assertEqual('401');
    //     expect(err.message).assertEqual(`The type of "index" must be small integer. Received value is: a`);
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_05600
     * @tc.name       : testArray0056
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it("testArray0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
    //   arrayList.add(1);
    //   arrayList.add("a");
    //   try {
    //     arrayList.removeByRange("a", 9);
    //     expect('true').assertEqual('false')
    //   } catch (err: BusinessError) {
    //     expect(err.name).assertEqual("BusinessError");
    //     expect(String(err.code)).assertEqual('401');
    //     expect(err.message).assertEqual(`The type of "fromIndex" must be number. Received value is: a`);
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_05700
     * @tc.name       : testArray0057
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it("testArray0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
    //   arrayList.add(4);
    //   arrayList.add(3);
    //   try {
    //     arrayList.replaceAllElements(123);
    //     expect('true').assertEqual('false')
    //   } catch (err: BusinessError) {
    //     expect(err.name).assertEqual("BusinessError");
    //     expect(String(err.code)).assertEqual('401');
    //     expect(err.message).assertEqual(`The type of "callbackfn" must be callable. Received value is: 123`);
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_05800
     * @tc.name       : testArray0058
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it("testArray0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
    //   arrayList.add(4);
    //   arrayList.add(3);
    //   arrayList.add(1);
    //   arrayList.add(2);
    //   arrayList.add(14);
    //   try {
    //     arrayList.subArrayList("a", 2);
    //     expect('true').assertEqual('false')
    //   } catch (err: BusinessError) {
    //     expect(err.name).assertEqual("BusinessError");
    //     expect(String(err.code)).assertEqual('401');
    //     expect(err.message).assertEqual(`The type of "fromIndex" must be number. Received value is: a`);
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_05900
     * @tc.name       : testArray0059
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it('testArray0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
    //   try {
    //     arrayList.has.bind({}, "a")();
    //     expect('true').assertEqual('false')
    //   } catch (err: BusinessError) {
    //     expect(err.name).assertEqual("BusinessError");
    //     expect(String(err.code)).assertEqual('10200011');
    //     expect(err.message).assertEqual(`The has method cannot be bound`);
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_06000
     * @tc.name       : testArray0060
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it('testArray0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
    //   try {
    //     arrayList.removeByIndex.bind({}, "a")();
    //     expect('true').assertEqual('false')
    //   } catch (err: BusinessError) {
    //     expect(err.name).assertEqual("BusinessError");
    //     expect(String(err.code)).assertEqual('10200011');
    //     expect(err.message).assertEqual(`The removeByIndex method cannot be bound`);
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_06100
     * @tc.name       : testArray0061
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it('testArray0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
    //   try {
    //     arrayList.remove.bind({}, "a")();
    //     expect('true').assertEqual('false')
    //   } catch (err: BusinessError) {
    //     expect(err.name).assertEqual("BusinessError");
    //     expect(String(err.code)).assertEqual('10200011');
    //     expect(err.message).assertEqual(`The remove method cannot be bound`);
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_06200
     * @tc.name       : testArray0062
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it('testArray0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
    //   try {
    //     arrayList.forEach.bind({}, "a")();
    //     expect('true').assertEqual('false')
    //   } catch (err: BusinessError) {
    //     expect(err.name).assertEqual("BusinessError");
    //     expect(String(err.code)).assertEqual('10200011');
    //     expect(err.message).assertEqual(`The forEach method cannot be bound`);
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_06300
     * @tc.name       : testArray0063
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it('testArray0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
    //   try {
    //     arrayList.forEach(11);
    //     expect('true').assertEqual('false')
    //   } catch (err: BusinessError) {
    //     expect(err.name).assertEqual("BusinessError");
    //     expect(String(err.code)).assertEqual('401');
    //     expect(err.message).assertEqual(`The type of "callbackfn" must be callable. Received value is: 11`);
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_06400
     * @tc.name       : testArray0064
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it('testArray0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
    //   try {
    //     arrayList.clear.bind({}, "a")();
    //     expect('true').assertEqual('false')
    //   } catch (err: BusinessError) {
    //     expect(err.name).assertEqual("BusinessError");
    //     expect(String(err.code)).assertEqual('10200011');
    //     expect(err.message).assertEqual(`The clear method cannot be bound`);
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_06500
     * @tc.name       : testArray0065
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it('testArray0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
    //   try {
    //     arrayList.isEmpty.bind({}, "a")();
    //     expect('true').assertEqual('false')
    //   } catch (err: BusinessError) {
    //     expect(err.name).assertEqual("BusinessError");
    //     expect(String(err.code)).assertEqual('10200011');
    //     expect(err.message).assertEqual(`The isEmpty method cannot be bound`);
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_ARRAY_06600
     * @tc.name       : testArray0066
     * @tc.desc       : Test the function By ArrayList.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArray0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arrayList: ArrayList<String | Number> = new ArrayList<String | Number>();
      try {
        let res = arrayList.removeByIndex(0);
        expect('true').assertEqual('false')
      } catch (err: BusinessError) {
        expect(err.name).assertEqual("BusinessError");
        expect(String(err.code)).assertEqual('10200001');
        expect(err.message).assertEqual("Container is empty");
      }
    });
  });
}
