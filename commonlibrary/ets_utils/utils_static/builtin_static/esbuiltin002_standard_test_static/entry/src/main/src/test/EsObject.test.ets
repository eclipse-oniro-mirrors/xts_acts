/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import hilog from '@ohos.hilog'
import Utils from './Util.test';
export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
interface I_4 {
  get foo(): string
}
interface I_5 {
  get foo(): string
  set foo(s: string)
}
interface I_6 {
  set foo(s: string)
}
interface O_10 {
  x: number,
  y: number
}
interface A_13 {
  a: number
}
interface A_16 {
  prop1: number,
  prop2: number,
  prop3: number
}
class DateClass {
  prop1: number = 100;
  prop2: string = "prop2";
}
interface O_20 {}
interface O_21 {
  foo: number
}
interface I_22 {
  get foo(): string
}
interface I_23 {
  set foo(s: string)
}
interface I_24 {
  get foo(): string
  set foo(s: string)
}
export default function EsObjectTest(){
  describe('EsObjectTest', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number ES_BUILTINS_OBJECT_0001
     * @tc.name ESObjectTest0001
     * @tc.desc Test ES Builtins-Api in Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESObjectTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESObjectTest0001';
      console.info(`${caseName}, test start`);
      let obj = new Object();
      let to_string_result = '[object ' + 'Object' + ']';
      expect(obj.toString()).assertEqual(to_string_result);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_OBJECT_0002
     * @tc.name ESObjectTest0002
     * @tc.desc Test ES Builtins-Api in Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // it('ESObjectTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
    //   const caseName = 'ESObjectTest0002';
    //   console.info(`${caseName}, test start`);
    //   let target: Record<string, number> = {
    //     'foo': 1
    //   };
    //   let target2: Record<string, number> = {
    //     'a': 2
    //   };
    //   let result = Object.assign(target, target2);
    //   expect(result.foo).assertEqual(1);
    //   expect(result.a).assertEqual(2);
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.number ES_BUILTINS_OBJECT_0003
     * @tc.name ESObjectTest0003
     * @tc.desc Test ES Builtins-Api in Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESObjectTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESObjectTest0003';
      console.info(`${caseName}, test start`);
      let o:Record<string, string> = {}
      expect(Object.hasOwn(o, "foo")).assertEqual(false)
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_OBJECT_0004
     * @tc.name ESObjectTest0004
     * @tc.desc Test ES Builtins-Api in Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESObjectTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESObjectTest0004';
      console.info(`${caseName}, test start`);
      let o: I_4 = {foo: "1"};
      expect(Object.hasOwn(o, "foo")).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_OBJECT_0005
     * @tc.name ESObjectTest0005
     * @tc.desc Test ES Builtins-Api in Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESObjectTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESObjectTest0005';
      console.info(`${caseName}, test start`);
      let o: I_5 = {foo: "1"};
      expect(Object.hasOwn(o, "foo")).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_OBJECT_0006
     * @tc.name ESObjectTest0006
     * @tc.desc Test ES Builtins-Api in Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESObjectTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESObjectTest0006';
      console.info(`${caseName}, test start`);
      let o: I_6 = {foo: "1"};
      expect(Object.hasOwn(o, "foo")).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_OBJECT_0007
     * @tc.name ESObjectTest0007
     * @tc.desc Test ES Builtins-Api in Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESObjectTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESObjectTest0007';
      console.info(`${caseName}, test start`);
      let threw = false;
      try {
        Object.keys(0);
      } catch (e) {
        threw = true;
      }
      expect(threw).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_OBJECT_0008
     * @tc.name ESObjectTest0008
     * @tc.desc Test ES Builtins-Api in Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESObjectTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESObjectTest0008';
      console.info(`${caseName}, test start`);
      let threw = false;
      try {
        Object.keys(true);
      } catch (e) {
        threw = true;
      }
      expect(threw).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_OBJECT_0009
     * @tc.name ESObjectTest0009
     * @tc.desc Test ES Builtins-Api in Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESObjectTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESObjectTest0009';
      console.info(`${caseName}, test start`);
      let threw = false;
      try {
        Object.keys('abc');
      } catch (e) {
        threw = true;
      }
      expect(threw).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_OBJECT_0010
     * @tc.name ESObjectTest0010
     * @tc.desc Test ES Builtins-Api in Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESObjectTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESObjectTest0010';
      console.info(`${caseName}, test start`);
      let o:O_10 = {
        x: 1,
        y: 2
      };
      let a = Object.keys(o);
      expect(Array.isArray(a)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_OBJECT_0011
     * @tc.name ESObjectTest0011
     * @tc.desc Test ES Builtins-Api in Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESObjectTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESObjectTest0011';
      console.info(`${caseName}, test start`);
      let o:O_10 = {
        x: 1,
        y: 2
      };
      let a = Object.keys(o);
      expect(a.length).assertEqual(2);
      expect(a[0]).assertEqual('x');
      expect(a[1]).assertEqual('y');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_OBJECT_0012
     * @tc.name ESObjectTest0012
     * @tc.desc Test ES Builtins-Api in Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESObjectTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESObjectTest0012';
      console.info(`${caseName}, test start`);
      let o = [1, 2];
      let a = Object.keys(o);
      expect(a.length).assertEqual(2);
      expect(a[0]).assertEqual('0');
      expect(a[1]).assertEqual('1');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_OBJECT_0013
     * @tc.name ESObjectTest0013
     * @tc.desc Test ES Builtins-Api in Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESObjectTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESObjectTest0013';
      console.info(`${caseName}, test start`);
      let literal: A_13 = {
        a: 1
      };
      let keysBefore = Object.keys(literal);
      expect(keysBefore[0]).assertEqual('a');
      keysBefore[0] = 'x';
      let keysAfter = Object.keys(literal);
      expect(keysBefore[0]).assertEqual('x');
      expect(keysAfter[0]).assertEqual('a');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_OBJECT_0014
     * @tc.name ESObjectTest0014
     * @tc.desc Test ES Builtins-Api in Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESObjectTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESObjectTest0014';
      console.info(`${caseName}, test start`);
      let obj: Record<string, object> = {};
      let arr = Object.keys(obj);
      expect(arr instanceof Array).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_OBJECT_0015
     * @tc.name ESObjectTest0015
     * @tc.desc Test ES Builtins-Api in Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESObjectTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESObjectTest0015';
      console.info(`${caseName}, test start`);
      let obj = [1, 2, 3, 4, 5];
      let arr = Object.keys(obj);
      let initValue:Number = 0;
      for (let p = 0; p < arr.length; p++) {
        if (arr.hasOwnProperty(p)) {
          expect(arr[p]).assertEqual(initValue.toString());
          initValue++;
        }
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_OBJECT_0016
     * @tc.name ESObjectTest0016
     * @tc.desc Test ES Builtins-Api in Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESObjectTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESObjectTest0016';
      console.info(`${caseName}, test start`);
      let obj:A_16 = {
        prop1: 100,
        prop2: 200,
        prop3: 300
      };
      let array = Object.keys(obj);
      let idx = 0;
      for (let index = 0; index < array.length; index++) {
        if (array.hasOwnProperty(index)) {
          expect(index).assertEqual(idx);
          idx++;
        }
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_OBJECT_0017
     * @tc.name ESObjectTest0017
     * @tc.desc Test ES Builtins-Api in Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESObjectTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESObjectTest0017';
      console.info(`${caseName}, test start`);
      let denseArray = [1, 2, 3];
      let tempArray = new Array<number>();
      for (let p = 0; p < denseArray.length; p++) {
        if (denseArray.hasOwnProperty(p)) tempArray.push(p);
      }
      let returnedArray = Object.keys(denseArray);
      for (let index = 0; index < returnedArray.length; index++) {
        expect(tempArray[index].toString()).assertEqual(returnedArray[index]);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_OBJECT_0018
     * @tc.name ESObjectTest0018
     * @tc.desc Test ES Builtins-Api in Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESObjectTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESObjectTest0018';
      console.info(`${caseName}, test start`);
      let str = new String("abc");
      let tempArray = new Array<number>();
      for (let p = 0; p < str.length; p++) {
        if (str.hasOwnProperty(p)) {
          tempArray.push(p);
        }
      }
      let returnedArray = Object.keys(str);
      for (let index = 0; index < returnedArray.length; index++) {
        expect(tempArray[index].toString()).assertEqual(returnedArray[index]);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_OBJECT_0019
     * @tc.name ESObjectTest0019
     * @tc.desc Test ES Builtins-Api in Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESObjectTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESObjectTest0019';
      console.info(`${caseName}, test start`);
      let obj = new DateClass();
      let array = new Array<string>('prop1', 'prop2')
      let tempArray = new Array<string>();
      for (let p = 0; p < array.length; p++) {
        if (obj.hasOwnProperty(array[p])) {
          tempArray.push(array[p]);
        }
      }
      let returnedArray = Object.keys(obj);
      for (let index = 0; index < returnedArray.length; index++) {
        expect(tempArray[index]).assertEqual(returnedArray[index])
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_OBJECT_0020
     * @tc.name ESObjectTest0020
     * @tc.desc Test ES Builtins-Api in Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESObjectTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESObjectTest0020';
      console.info(`${caseName}, test start`);
      let o:O_20 = {};
      expect(o.hasOwnProperty("foo")).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_OBJECT_0021
     * @tc.name ESObjectTest0021
     * @tc.desc Test ES Builtins-Api in Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESObjectTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESObjectTest0021';
      console.info(`${caseName}, test start`);
      let o : O_21 = {
        foo: 42
      };
      expect(o.hasOwnProperty("foo")).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_OBJECT_0022
     * @tc.name ESObjectTest0022
     * @tc.desc Test ES Builtins-Api in Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESObjectTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESObjectTest0022';
      console.info(`${caseName}, test start`);
      let o: I_22 = {foo: "1"};
      expect(o.hasOwnProperty("foo")).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_OBJECT_0023
     * @tc.name ESObjectTest0023
     * @tc.desc Test ES Builtins-Api in Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESObjectTest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESObjectTest0023';
      console.info(`${caseName}, test start`);
      let o: I_23 = {foo: "1"};
      expect(o.hasOwnProperty("foo")).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_OBJECT_0024
     * @tc.name ESObjectTest0024
     * @tc.desc Test ES Builtins-Api in Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESObjectTest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESObjectTest0024';
      console.info(`${caseName}, test start`);
      let o: I_24 = {foo: "1"};
      expect(o.hasOwnProperty("foo")).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_OBJECT_0025
     * @tc.name ESObjectTest0025
     * @tc.desc Test ES Builtins-Api in Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESObjectTest0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESObjectTest0025';
      console.info(`${caseName}, test start`);
      let trueResult = Object.values(true);
      expect(Array.isArray(trueResult)).assertEqual(true);
      expect(trueResult.length).assertEqual(0);
      let falseResult = Object.values(false);
      expect(Array.isArray(falseResult)).assertEqual(true);
      expect(falseResult.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_OBJECT_0026
     * @tc.name ESObjectTest0026
     * @tc.desc Test ES Builtins-Api in Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESObjectTest0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESObjectTest0026';
      console.info(`${caseName}, test start`);
      expect(Object.values(0).length).assertEqual(0);
      expect(Object.values(-0).length).assertEqual(0);
      expect(Object.values(Infinity).length).assertEqual(0);
      expect(Object.values(-Infinity).length).assertEqual(0);
      expect(Object.values(NaN).length).assertEqual(0);
      expect(Object.values(Math.PI).length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_OBJECT_0027
     * @tc.name ESObjectTest0027
     * @tc.desc Test ES Builtins-Api in Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESObjectTest0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESObjectTest0027';
      console.info(`${caseName}, test start`);
      let result = Object.values('abc');
      expect(Array.isArray(result)).assertEqual(true);
      expect(result.length).assertEqual(3);
      expect(result[0] as string).assertEqual('a');
      expect(result[1] as string).assertEqual('b');
      expect(result[2] as string).assertEqual('c');
      console.info(`${caseName}, test end`);
    });


  })
}
