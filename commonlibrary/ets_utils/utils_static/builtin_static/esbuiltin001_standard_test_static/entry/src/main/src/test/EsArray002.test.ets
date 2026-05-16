/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
class A {}
class A_133 {
  valueOf1 = (): number => {
    return 1
  }
  toString1 = (): number => {
    return -2
  }
}
let n_165: number = 0;
class A_165 {
  public toLocaleString(): string {
    n_165++;
    return "";
  }
}
class A_172 {
  valueOf = (): string => {
    return ''
  }
  toString1? = (): string => {
    return ''
  }
}
class AA_172 {
}
class B_172 {
  valueOf = (): string => {
    return ''
  }
  toString1? = (): object => {
    return {} as AA_172
  }
}
class C_172 {
  toString1 = (): string => {
    return ''
  }
}
class D_172 {
  valueOf = (): object => {
    return {} as AA_172
  }
  toString1 = (): string => {
    return ''
  }
}
interface GeneratedTypeLiteralInterface_1 {
  name: string;
  rating: int;
}
export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
export default function EsArrayTest002(){
  describe('EsArrayTest002', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(():void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async ():Promise<void> => {
      await sleep(10);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(():void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(():void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0001
     * @tc.name ESArrayPrototypeTest20001
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20001';
      console.info(`${caseName}, test start`);
      let srcArr: Array<number> = new Array<number>(1, 2, 33, 4, 5);
      let callbackfn = (val: number, idx: int, obj: Array<number>): number => {
        srcArr[2] = 3;
        if (5 < srcArr.length) {
          srcArr[5] = 6;
        }
        return 1;
      }
      let resArr = srcArr.map(callbackfn);

      expect(resArr.length).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0002
     * @tc.name ESArrayPrototypeTest20002
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20002';
      console.info(`${caseName}, test start`);
      let srcArr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
      let callbackfn = (val: number, idx: int, obj: Array<number>): number => {
        srcArr[4] = -1;
        if (val > 0) return 1;
        else return 0;
      }
      let resArr = srcArr.map(callbackfn);

      expect(resArr.length).assertEqual(5);
      expect(resArr[4]).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0003
     * @tc.name ESArrayPrototypeTest20003
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20003';
      console.info(`${caseName}, test start`);
      let callCnt = 0;
      let srcArr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
      let callbackfn = (val: number, idx: int, obj: Array<number>): number => {
        srcArr.length = 2;
        callCnt++;
        return 1;
      }
      let resArr = srcArr.map(callbackfn);

      expect(resArr.length).assertEqual(5);
      expect(callCnt).assertEqual(2);
      expect(resArr.toString()).assertEqual('1,1,,,');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0004
     * @tc.name ESArrayPrototypeTest20004
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20004';
      console.info(`${caseName}, test start`);
      let callCnt = 0;
      let srcArr: Array<number> = new Array<number>(10);
      srcArr[1] = 1;
      srcArr[2] = 2;

      let callbackfn = (val: number | undefined, idx: int, obj: Array<number>): number|undefined => {
        if (1000 < obj.length) {
          obj[1000] = 3;
        }
        if(val) {
          callCnt++;
          return val!;
        }
        return undefined
      }

      let resArr = srcArr.map(callbackfn);

      expect(resArr.length).assertEqual(10);
      expect(callCnt).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0005
     * @tc.name ESArrayPrototypeTest20005
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20005';
      console.info(`${caseName}, test start`);
      let callCnt = 0;
      let srcArr: Array<undefined> = new Array<undefined>(10);
      srcArr[1] = undefined; // explicitly assigning a value

      let callbackfn = (val: undefined, idx: int, obj: Array<undefined>): number => {
        callCnt++;
        return 1;
      }

      let resArr = srcArr.map(callbackfn);

      expect(resArr.length).assertEqual(10);
      expect(callCnt).assertEqual(10);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0006
     * @tc.name ESArrayPrototypeTest20006
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20006';
      console.info(`${caseName}, test start`);
      let kValue: A = {};
      let callbackfn = (val: object, idx: int, obj: Array<object>): boolean => {
        if (idx === 0) {
          return val === kValue;
        }
        return false;
      }

      let arr: Array<object> = new Array<object>(kValue);
      let newArr = arr.map(callbackfn);

      expect(newArr[0]).assertEqual(true);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0007
     * @tc.name ESArrayPrototypeTest20007
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20007';
      console.info(`${caseName}, test start`);
      let bPar = true;
      let bCalled = false;

      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean => {
        bCalled = true;
        if (obj[idx] !== val) {
          bPar = false;
        }
        return bPar;
      }

      let srcArr: Array<number> = new Array<number>(0, 1);
      if (999999 < srcArr.length) {
        srcArr[999999] = -6.6;
      }
      let resArr = srcArr.map(callbackfn);

      expect(bCalled).assertEqual(true);
      expect(bPar).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0008
     * @tc.name ESArrayPrototypeTest20008
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20008';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5);
      let lastIdx = 0;
      let called = 0;
      let result = true;

      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean => {
        called++;
        if (lastIdx !== idx) {
          result = false;
        } else {
          lastIdx++;
        }
        return result;
      }

      arr.map(callbackfn);

      expect(result).assertEqual(true);
      expect(arr.length).assertEqual(called);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0009
     * @tc.name ESArrayPrototypeTest20009
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20009';
      console.info(`${caseName}, test start`);
      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean => {
        if (obj[idx] < 13) {
          //when current position is visited, its previous index should has been visited.
          if (idx !== 0 && typeof obj[idx - 1] === "undefined") {
            return true;
          }
          obj[idx] = 1;
          return false;
        } else {
          return true;
        }
      }

      let srcArr: Array<number> = new Array<number>(11, 12, 13, 14);
      let testResult = srcArr.map(callbackfn);

      expect(testResult.length).assertEqual(4);
      expect(testResult[0]).assertEqual(false);
      expect(testResult[1]).assertEqual(false);
      expect(testResult[2]).assertEqual(true);
      expect(testResult[3]).assertEqual(true);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0010
     * @tc.name ESArrayPrototypeTest20010
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20010';
      console.info(`${caseName}, test start`);
      let callbackfn = (val: number): boolean => {
        return val > 10;
      }
      let srcArr: Array<number> = new Array<number>();
      srcArr.push(11);
      let testResult = srcArr.map(callbackfn);

      expect(testResult[0]).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0011
     * @tc.name ESArrayPrototypeTest20011
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20011';
      console.info(`${caseName}, test start`);
      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean => {
        return true;
      }
      let srcArr: Array<number> = new Array<number>();
      srcArr.push(11);
      let testResult = srcArr.map(callbackfn);

      expect(testResult[0]).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0012
     * @tc.name ESArrayPrototypeTest20012
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20012';
      console.info(`${caseName}, test start`);
      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean => {
        return (val > 10 && obj[idx] === val);
      }

      let srcArr: Array<number> = new Array<number>();
      srcArr.push(11);
      let testResult = srcArr.map(callbackfn);

      expect(testResult[0]).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0013
     * @tc.name ESArrayPrototypeTest20013
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20013';
      console.info(`${caseName}, test start`);
      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean => {
        return true;
      }
      let srcArr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
      srcArr.map(callbackfn);

      expect(srcArr[0]).assertEqual(1);
      expect(srcArr[1]).assertEqual(2);
      expect(srcArr[2]).assertEqual(3);
      expect(srcArr[3]).assertEqual(4);
      expect(srcArr[4]).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0014
     * @tc.name ESArrayPrototypeTest20014
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20014';
      console.info(`${caseName}, test start`);
      let callbackfn = (val: number, idx: int, obj: Array<number>): number => {
        return val + 10;
      }
      let srcArr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
      let resArr = srcArr.map(callbackfn);

      expect(resArr[0]).assertEqual(11);
      expect(resArr[1]).assertEqual(12);
      expect(resArr[2]).assertEqual(13);
      expect(resArr[3]).assertEqual(14);
      expect(resArr[4]).assertEqual(15);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0015
     * @tc.name ESArrayPrototypeTest20015
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20015';
      console.info(`${caseName}, test start`);
      let callCnt = 0;
      let callbackfn = (val: number, idx: int, obj: Array<number>): number => {
        callCnt++;
        return val;
      }
      let srcArr: Array<number> = new Array<number>(1, 2, 3, 4, 5);

      let resArr = srcArr.map(callbackfn);

      expect(callCnt).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0016
     * @tc.name ESArrayPrototypeTest20016
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20016';
      console.info(`${caseName}, test start`);
      let called = 0;
      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean => {
        called++;
        return val > 2;
      }
      let arr: Array<number> = new Array<number>(1, 2, 3, 4);

      arr.map(callbackfn);

      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(called).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0017
     * @tc.name ESArrayPrototypeTest20017
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20017';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>();
      let pop1 = x.pop();
      expect(pop1).assertEqual(undefined);
      expect(x.length).assertEqual(0);

      let x2: Array<number> = new Array<number>(1, 2, 3);
      x2.length = 0;
      let pop2 = x2.pop();
      expect(pop2).assertEqual(undefined);
      expect(x2.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0018
     * @tc.name ESArrayPrototypeTest20018
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20018';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3);
      let pop1 = x.pop();
      expect(Number(pop1)).assertEqual(3);
      expect(x.length).assertEqual(3);
      expect(x[2]).assertEqual(2);

      x = new Array<number>(4);
      x[0] = 0;
      x[3] = 3;
      let pop2 = x.pop();
      expect(Number(pop2)).assertEqual(3);
      expect(x.length).assertEqual(3);

      x.length = 1;
      let pop3 = x.pop();
      expect(Number(pop3)).assertEqual(0);
      expect(x.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0019
     * @tc.name ESArrayPrototypeTest20019
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20019';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>();
      let push1 = x.push(1);
      expect(push1).assertEqual(1);
      expect(x[0]).assertEqual(1);

      let push2 = x.push();
      expect(push2).assertEqual(1);

      let push3 = x.push(-1);
      expect(push3).assertEqual(2);
      expect(x[1]).assertEqual(-1);
      expect(x.length).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0020
     * @tc.name ESArrayPrototypeTest20020
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20020';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>();
      expect(x.length).assertEqual(0);

      x = new Array<number>(1);
      x[0] = 0;
      let push1 = x.push(1, Number.POSITIVE_INFINITY, 2, 3, 4);
      expect(push1).assertEqual(6);
      expect(x[0]).assertEqual(0);
      expect(x[1]).assertEqual(1);
      expect(x[2]).assertEqual(Number.POSITIVE_INFINITY);
      expect(x[3]).assertEqual(2);
      expect(x[4]).assertEqual(3);
      expect(x[5]).assertEqual(4);
      expect(x.length).assertEqual(6);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0021
     * @tc.name ESArrayPrototypeTest20021
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20021';
      console.info(`${caseName}, test start`);
      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        return 1;
      }
      let srcArr: Array<number> = new Array<number>(12, 11);
      expect(srcArr.reduce(callbackfn, 1)).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0022
     * @tc.name ESArrayPrototypeTest20022
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20022';
      console.info(`${caseName}, test start`);
      let accessed = false;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        accessed = true;
        return curVal;
      }
      let arr: Array<number> = new Array<number>(11, 9);

      expect(arr.reduce(callbackfn, 1)).assertEqual(9);
      expect(accessed).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0023
     * @tc.name ESArrayPrototypeTest20023
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20023';
      console.info(`${caseName}, test start`);
      let accessed = false;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        accessed = true;
        return 1;
      }
      let arr: Array<number> = new Array<number>();

      expect(arr.reduce(callbackfn, 3)).assertEqual(3);
      expect(accessed).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0024
     * @tc.name ESArrayPrototypeTest20024
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20024';
      console.info(`${caseName}, test start`);
      let cb = (): number => {
        return 0;
      }
      let arr: Array<number> = new Array<number>();
      expect(arr.reduce(cb, 1)).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0025
     * @tc.name ESArrayPrototypeTest20025
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20025';
      console.info(`${caseName}, test start`);
      let str = "initialValue is present";
      let callbackfn = (): string => {
        return '';
      }
      let arr: Array<number> = new Array<number>();
      expect(arr.reduce(callbackfn, str)).assertEqual(str);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0026
     * @tc.name ESArrayPrototypeTest20026
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20026';
      console.info(`${caseName}, test start`);
      let str = "initialValue is not present";
      let callbackfn = (): string => {
        return '';
      }
      let arr: Array<string> = new Array<string>(str);
      expect(arr.reduce(callbackfn)).assertEqual(str);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0027
     * @tc.name ESArrayPrototypeTest20027
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20027';
      console.info(`${caseName}, test start`);
      let testResult = false;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        if (idx === 1) {
          testResult = (prevVal === 0);
        }
        return 1;
      }
      let arr: Array<number> = new Array<number>(0, 1, 2);
      arr.reduce(callbackfn);

      expect(testResult).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0028
     * @tc.name ESArrayPrototypeTest20028
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20028';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>(1, 2, 33, 4, 5);
      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        arr[2] = 3;
        return prevVal + curVal;
      }
      expect(arr.reduce(callbackfn)).assertEqual(15);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0029
     * @tc.name ESArrayPrototypeTest20029
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20029';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        arr[3] = -2;
        arr[4] = -1;
        return prevVal + curVal;
      }
      expect(arr.reduce(callbackfn)).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0030
     * @tc.name ESArrayPrototypeTest20030
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20030';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        arr.splice(3, 1);
        arr.splice(4, 1);
        return prevVal + curVal;
      }
      expect(arr.reduce(callbackfn)).assertEqual(6);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0031
     * @tc.name ESArrayPrototypeTest20031
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20031';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        arr.length = 2;
        return prevVal + curVal;
      }
      expect(arr.reduce(callbackfn)).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0032
     * @tc.name ESArrayPrototypeTest20032
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20032';
      console.info(`${caseName}, test start`);
      let callCnt = 0;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        callCnt++;
        return 2;
      }
      let arr: Array<number> = new Array<number>();
      arr.push(1);

      expect(arr.reduce(callbackfn)).assertEqual(1);
      expect(callCnt).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0033
     * @tc.name ESArrayPrototypeTest20033
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20033';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>(1, 2, 33, 4, 5);
      let callbackfn = (prevVal: string, curVal: number, idx: int, obj: Array<number>): string => {
        arr[2] = 3;
        return prevVal + curVal;
      }
      expect(arr.reduce(callbackfn, "")).assertEqual("12345");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0034
     * @tc.name ESArrayPrototypeTest20034
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20034';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>();
      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        return 0;
      }
      expect(arr.reduce(callbackfn, 5)).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0035
     * @tc.name ESArrayPrototypeTest20035
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20035';
      console.info(`${caseName}, test start`);
      let threw = false;
      let callCnt = 0;
      let callbackfn = (prevVal: undefined, curVal: undefined, idx: int, obj: Array<undefined>): undefined => {
        callCnt++;
        return curVal;
      }
      let arr: Array<undefined> = new Array<undefined>(10);
      arr[0] = undefined;
      arr[1] = undefined;
      arr.reduce(callbackfn);
      expect(callCnt).assertEqual(9);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0036
     * @tc.name ESArrayPrototypeTest20036
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20036';
      console.info(`${caseName}, test start`);
      let testResult = false;
      let initialValue = 0;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        if (idx === 1) {
          testResult = (curVal === 1);
        }
        return 0;
      }

      let arr: Array<number> = new Array<number>(0, 1);
      arr.reduce(callbackfn, initialValue);

      expect(testResult).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0037
     * @tc.name ESArrayPrototypeTest20037
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20037';
      console.info(`${caseName}, test start`);
      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        if (idx > 0 && obj[idx] === curVal && obj[idx - 1] === prevVal) {
          return curVal;
        } else {
          return 11;
        }
      }
      let arr: Array<number> = new Array<number>(0, 1);

      expect(arr.reduce(callbackfn)).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0038
     * @tc.name ESArrayPrototypeTest20038
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20038';
      console.info(`${caseName}, test start`);
      let bParCorrect = false;
      let initialValue = 5.5;
      let callbackfn = (prevVal: number | boolean | null | object | string, curVal: number | boolean | null | object | string,
        idx: int, obj: Array<number | boolean | null | object | string>): number | boolean | null | object | string => {
        if (idx === 0 && obj[idx] === curVal && prevVal === initialValue)
          return curVal;
        else if (idx > 0 && obj[idx] === curVal && obj[idx - 1] === prevVal)
          return curVal;
        else
          return false;
      }
      let arr = new Array<number | boolean | null | object | string>(0, 1, true, null, new Object(), "five");

      expect( arr.reduce(callbackfn, initialValue)).assertEqual("five");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0039
     * @tc.name ESArrayPrototypeTest20039
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20039';
      console.info(`${caseName}, test start`);
      let bCalled = false;

      let callbackfn = (prevVal: boolean, curVal: number, idx: int, obj: Array<number>): boolean => {
        bCalled = true;
        if (prevVal === true)
          return true;
        else
          return false;
      }

      let arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);

      expect(arr.reduce(callbackfn, true)).assertEqual(true);
      expect(bCalled).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0040
     * @tc.name ESArrayPrototypeTest20040
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20040';
      console.info(`${caseName}, test start`);
      let innerThisCorrect = false;

      let callbackfn = (prevVal: boolean, curVal: number, idx: int, obj: Array<number>): boolean => {
        innerThisCorrect = true;
        return true;
      }

      let arr: Array<number> = new Array<number>();
      arr.push(0);

      arr.reduce(callbackfn, true);

      expect(innerThisCorrect).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0041
     * @tc.name ESArrayPrototypeTest20041
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20041';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>(0, 1, 2);
      let lastIdx = 0;
      let result = true;
      let accessed = false;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        accessed = true;
        if (lastIdx !== idx) {
          result = false;
        } else {
          lastIdx++;
        }
        return 0;
      }

      arr.reduce(callbackfn, 11);

      expect(result).assertEqual(true);
      expect(accessed).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0042
     * @tc.name ESArrayPrototypeTest20042
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20042';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>(11, 12, 13, 14);
      let called = 0;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        if (curVal > 12) {
          obj[idx] = prevVal;
        } else {
          called++;
        }
        return prevVal;
      }

      arr.reduce(callbackfn, 2);

      expect(called).assertEqual(2);
      expect(arr[0]).assertEqual(11);
      expect(arr[1]).assertEqual(12);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0043
     * @tc.name ESArrayPrototypeTest20043
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20043';
      console.info(`${caseName}, test start`);
      let called = 0;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        called++;
        return curVal;
      }

      let arr: Array<number> = new Array<number>(11, 12);
      arr.reduce(callbackfn, 1);

      expect(called).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0044
     * @tc.name ESArrayPrototypeTest20044
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20044';
      console.info(`${caseName}, test start`);
      let result = false;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        result = (prevVal === 1);
        return curVal;
      }

      let arr: Array<number> = new Array<number>();
      arr.push(11);
      arr.reduce(callbackfn, 1);

      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0045
     * @tc.name ESArrayPrototypeTest20045
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20045';
      console.info(`${caseName}, test start`);
      let result = false;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        result = (curVal > 10 && 1 === prevVal);
        return curVal;
      }

      let arr: Array<number> = new Array<number>();
      arr.push(11);
      arr.reduce(callbackfn, 1);

      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0046
     * @tc.name ESArrayPrototypeTest20046
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20046';
      console.info(`${caseName}, test start`);
      let result = false;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        result = (prevVal === 1);
        return curVal;
      }

      let arr: Array<number> = new Array<number>();
      arr.push(11);
      arr.reduce(callbackfn, 1);

      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0047
     * @tc.name ESArrayPrototypeTest20047
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20047';
      console.info(`${caseName}, test start`);
      let result = false;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        result = (prevVal === 1 && obj[idx] === curVal);
        return curVal;
      }

      let arr: Array<number> = new Array<number>();
      arr.push(11);
      arr.reduce(callbackfn, 1);

      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0048
     * @tc.name ESArrayPrototypeTest20048
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20048';
      console.info(`${caseName}, test start`);
      let result = true;
      let accessed = false;
      let preIteration = 1.0;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        accessed = true;
        if (preIteration !== prevVal) {
          result = false;
        }
        preIteration = curVal;
        return curVal;
      }

      let arr: Array<number> = new Array<number>(11, 12, 13);
      arr.reduce(callbackfn, 1);

      expect(result).assertEqual(true);
      expect(accessed).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0049
     * @tc.name ESArrayPrototypeTest20049
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20049';
      console.info(`${caseName}, test start`);
      let called = 0;
      let result = false;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        called++;
        if (idx === 1) {
          result = (prevVal === 11) && curVal === 9;
        }
        return curVal;
      }

      let arr: Array<number> = new Array<number>(11, 9);
      arr.reduce(callbackfn);

      expect(result).assertEqual(true);
      expect(called).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0050
     * @tc.name ESArrayPrototypeTest20050
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20050';
      console.info(`${caseName}, test start`);
      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        return 1;
      }

      let srcArr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
      srcArr.reduce(callbackfn);

      expect(srcArr[0]).assertEqual(1);
      expect(srcArr[1]).assertEqual(2);
      expect(srcArr[2]).assertEqual(3);
      expect(srcArr[3]).assertEqual(4);
      expect(srcArr[4]).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0051
     * @tc.name ESArrayPrototypeTest20051
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20051';
      console.info(`${caseName}, test start`);
      let callbackfn = (prevVal: string, curVal: string, idx: int, obj: Array<string>): string => {
        return prevVal + curVal;
      }

      let srcArr: Array<string> = new Array<string>('1', '2', '3', '4', '5');

      expect(srcArr.reduce(callbackfn, '0')).assertEqual('012345');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0052
     * @tc.name ESArrayPrototypeTest20052
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20052';
      console.info(`${caseName}, test start`);
      let callCnt = 0;

      let callbackfn = (prevVal: string, curVal: string, idx: int, obj: Array<string>): string => {
        callCnt++;
        return curVal;
      }

      let srcArr: Array<string> = new Array<string>('1', '2', '3', '4', '5');

      srcArr.reduce(callbackfn);

      expect(callCnt).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0053
     * @tc.name ESArrayPrototypeTest20053
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20053';
      console.info(`${caseName}, test start`);
      let accessed = false;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        accessed = true;
        return 2;
      }

      let arr: Array<number> = new Array<number>(12, 11);

      expect(arr.reduceRight(callbackfn, 11)).assertEqual(2);
      expect(accessed).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0054
     * @tc.name ESArrayPrototypeTest20054
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20054';
      console.info(`${caseName}, test start`);
      let initialValue = 0;

      let callbackfn = (accum: number, val: number, idx: int, obj: Array<number>): number => {
        accum += val;
        return accum;
      }

      let arr: Array<number> = new Array<number>(11, 9);

      expect(arr.reduceRight(callbackfn, initialValue)).assertEqual(20);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0055
     * @tc.name ESArrayPrototypeTest20055
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20055';
      console.info(`${caseName}, test start`);
      let initialValue = 10;
      let arr: Array<number> = new Array<number>();
      let callbackfn = (): number => {
        return 0;
      }

      expect(arr.reduceRight(callbackfn, initialValue)).assertEqual(initialValue);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0056
     * @tc.name ESArrayPrototypeTest20056
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20056';
      console.info(`${caseName}, test start`);
      let cb = (): number => {
        return 0;
      }
      let arr: Array<number> = new Array<number>();
      expect(arr.reduceRight(cb, 1)).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0057
     * @tc.name ESArrayPrototypeTest20057
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20057';
      console.info(`${caseName}, test start`);
      let str = "initialValue is present";
      let callbackfn = (): string => {
        return '';
      }
      let arr: Array<string> = new Array<string>();
      expect(arr.reduceRight(callbackfn, str)).assertEqual(str);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0058
     * @tc.name ESArrayPrototypeTest20058
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20058';
      console.info(`${caseName}, test start`);
      let str = "initialValue is not present";
      let callbackfn = (): string => {
        return '';
      }
      let arr: Array<string> = new Array<string>(str);
      expect(arr.reduceRight(callbackfn)).assertEqual(str);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0059
     * @tc.name ESArrayPrototypeTest20059
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20059';
      console.info(`${caseName}, test start`);
      let testResult = false;
      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        if (idx === 1) {
          testResult = (prevVal === 2);
        }
        return 0;
      }
      let arr: Array<number> = new Array<number>(0, 1, 2);
      arr.reduceRight(callbackfn);

      expect(testResult).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0060
     * @tc.name ESArrayPrototypeTest20060
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20060';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        arr[3] = -2;
        arr[0] = -1;
        return prevVal + curVal;
      }

      expect(arr.reduceRight(callbackfn)).assertEqual(13);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0061
     * @tc.name ESArrayPrototypeTest20061
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20061';
      console.info(`${caseName}, test start`);
      let arr: Array<number | string> = new Array<number | string>('1', 2, 3, 4, 5);
      let callbackfn = (
        prevVal: number | string,
        curVal: number | string,
        idx: int,
        obj: Array<number | string>
      ): string => {
        arr.splice(1, 1);
        arr.splice(4, 1);
        return String(prevVal) + curVal;
      }
      expect(arr.reduceRight(callbackfn)).assertEqual("54441");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0062
     * @tc.name ESArrayPrototypeTest20062
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20062';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>();
      let callCnt = 0;
      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        callCnt++;
        return 2;
      }
      arr.push(1);

      expect(arr.reduceRight(callbackfn)).assertEqual(1);
      expect(callCnt).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0063
     * @tc.name ESArrayPrototypeTest20063
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20063';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>(10);
      let callbackfn = (prevVal: number, curVal: number|undefined, idx: int, obj: Array<number>): number => { return 0 }

      expect(arr.reduceRight(callbackfn, 5)).assertEqual(0)
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0064
     * @tc.name ESArrayPrototypeTest20064
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20064';
      console.info(`${caseName}, test start`);
      let callCnt = 0;
      let callbackfn = (prevVal: undefined, curVal: undefined, idx: int, obj: Array<undefined>): undefined
      => { callCnt++; return curVal };
      let arr: Array<undefined> = new Array<undefined>(10);
      arr[0] = undefined;
      arr[1] = undefined;
      arr.reduceRight(callbackfn);
      expect(callCnt).assertEqual(9);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0065
     * @tc.name ESArrayPrototypeTest20065
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20065';
      console.info(`${caseName}, test start`);
      let testResult = false;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        if (idx === 1) testResult = (curVal === 1);
        return 0
      }

      let arr: Array<number> = new Array<number>(0, 1, 2);
      arr.reduceRight(callbackfn, 0);

      expect(testResult).assertEqual(true)
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0066
     * @tc.name ESArrayPrototypeTest20066
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20066';
      console.info(`${caseName}, test start`);
      let callbackfn = (prevVal: number | boolean | null | object | string, curVal: number | boolean | null | object | string, idx: int, obj: Array<number | boolean | null | object | string>): number | object => {
        if (idx + 1 < obj.length && obj[idx] === curVal && obj[idx + 1] === prevVal) {
          if (curVal == null || typeof curVal === "object") {
            return 0;
          }
          return curVal!;
        } else {
          return 1;
        }
      }

      let arr: Array<number | boolean | null | object | string> =
        new Array<number | boolean | null | object | string>(0, 1, true, null, new Object(), "five");

      expect(arr.reduceRight(callbackfn)).assertEqual(0)
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0067
     * @tc.name ESArrayPrototypeTest20067
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20067';
      console.info(`${caseName}, test start`);
      let bParCorrect = false;
      let arr = new Array<number | boolean | null | object | string>(0, 1, true, null, new Object(), "five");
      let initialValue = 5.5;
      let callbackfn =
        (prevVal: number | boolean | null | object | string, curVal: number | boolean | null | object | string,
          idx: int, obj: Array<number | boolean | null | object | string>): number | boolean | null | object | string => {
          if (idx === obj.length - 1 && obj[idx] === curVal && prevVal === initialValue) {
            return curVal;
          } else if (idx + 1 < obj.length && obj[idx] === curVal && obj[idx + 1] === prevVal) {
            return curVal;
          } else {
            return false;
          }
        }
      expect(arr.reduceRight(callbackfn, initialValue)).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0068
     * @tc.name ESArrayPrototypeTest20068
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20068';
      console.info(`${caseName}, test start`);
      let bCalled = false;

      let callbackfn = (prevVal: boolean, curVal: number, idx: int, obj: Array<number>): boolean => {
        bCalled = true;
        if (Boolean(prevVal) === true)
          return true;
        else
          return false;
      }

      let arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);

      expect(arr.reduceRight(callbackfn, true)).assertEqual(true);
      expect(bCalled).assertEqual(true);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0069
     * @tc.name ESArrayPrototypeTest20069
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20069';
      console.info(`${caseName}, test start`);
      let innerThisCorrect = false;

      let callbackfn = (prevVal: boolean, curVal: number, idx: int, obj: Array<number>): boolean => {
        innerThisCorrect = true;
        return true;
      }

      let arr: Array<number> = new Array<number>();
      arr.push(0);
      arr.reduceRight(callbackfn, true);

      expect(innerThisCorrect).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0070
     * @tc.name ESArrayPrototypeTest20070
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20070';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5);
      let lastIdx = arr.length - 1;
      let accessed = false;
      let result = true;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        accessed = true;
        if (lastIdx !== idx) {
          result = false;
        } else {
          lastIdx--;
        }
        return 0;
      }

      arr.reduceRight(callbackfn, 1);

      expect(result).assertEqual(true);
      expect(accessed).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0071
     * @tc.name ESArrayPrototypeTest20071
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20071';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>(11, 12, 13, 14);
      let kIndex: Array<number> = new Array<number>();
      let result = true;
      let called = 0;
      let threw = false;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        called++;
        if (typeof kIndex[idx] === "undefined") {
          if (idx !== arr.length - 1 && typeof kIndex[idx + 1] === "undefined") {
            result = false;
          }
          kIndex[idx] = 1;
        } else {
          result = false;
        }
        return 0;
      }
      try {
        arr.reduceRight(callbackfn, 1);
        expect(false).assertTrue();
      } catch (err) {
        if(err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0072
     * @tc.name ESArrayPrototypeTest20072
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20072';
      console.info(`${caseName}, test start`);
      let called = 0;

      let callbackfn = (): number => {
        called++;
        return 1;
      }

      let arr: Array<number> = new Array<number>(11, 12);

      expect(arr.reduceRight(callbackfn, 11)).assertEqual(1);
      expect(called).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0073
     * @tc.name ESArrayPrototypeTest20073
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20073';
      console.info(`${caseName}, test start`);
      let called = 0;

      let callbackfn = (prevVal: number): number => {
        called++;
        return prevVal;
      }

      let arr: Array<number> = new Array<number>(11, 12);

      expect(arr.reduceRight(callbackfn, 100)).assertEqual(100);
      expect(called).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0074
     * @tc.name ESArrayPrototypeTest20074
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20074';
      console.info(`${caseName}, test start`);
      let testResult = false;

      let callbackfn = (prevVal: number, curVal: number): number => {
        if (prevVal === 100) {
          testResult = true;
        }
        return curVal;
      }

      let arr: Array<number> = new Array<number>();
      arr.push(11);

      expect(arr.reduceRight(callbackfn, 100)).assertEqual(11);
      expect(testResult).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0075
     * @tc.name ESArrayPrototypeTest20075
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20075';
      console.info(`${caseName}, test start`);
      let testResult = false;
      let arr: Array<number> = new Array<number>(11, 12, 13);
      let initVal = 6.99;

      let callbackfn = (prevVal: number, curVal: number, idx: int): number => {
        if (idx === 2) {
          testResult = (prevVal === initVal);
        }
        return curVal;
      }

      expect(arr.reduceRight(callbackfn, initVal)).assertEqual(11);
      expect(testResult).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0076
     * @tc.name ESArrayPrototypeTest20076
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20076';
      console.info(`${caseName}, test start`);
      let testResult = false;
      let arr: Array<number> = new Array<number>(11, 12, 13);
      let initVal = 6.99;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        if (idx === 2) {
          testResult = (prevVal === initVal);
        }
        return curVal;
      }

      expect(arr.reduceRight(callbackfn, initVal)).assertEqual(11);
      expect(testResult).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0077
     * @tc.name ESArrayPrototypeTest20077
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20077';
      console.info(`${caseName}, test start`);
      let testResult = true;
      let arr: Array<number> = new Array<number>(11, 12, 13);
      let initVal = 6.99;
      let preResult = initVal;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        if (prevVal !== preResult) {
          testResult = false;
        }
        preResult = curVal;
        return curVal;
      }

      arr.reduceRight(callbackfn, initVal);

      expect(testResult).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0078
     * @tc.name ESArrayPrototypeTest20078
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20078';
      console.info(`${caseName}, test start`);
      let testResult = false;
      let arr: Array<number> = new Array<number>(11, 12);
      let initVal = 6.99;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        if (idx === 1) {
          testResult = (prevVal === initVal);
        }
        return curVal;
      }

      arr.reduceRight(callbackfn, initVal);

      expect(testResult).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0079
     * @tc.name ESArrayPrototypeTest20079
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20079';
      console.info(`${caseName}, test start`);
      let testResult = false;
      let arr: Array<number> = new Array<number>(11, 12, 13);

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        if (idx === 1) {
          testResult = (prevVal === 13);
        }
        return curVal;
      }

      arr.reduceRight(callbackfn);

      expect(testResult).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0080
     * @tc.name ESArrayPrototypeTest20080
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20080';
      console.info(`${caseName}, test start`);
      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        return 1;
      }

      let srcArr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
      srcArr.reduceRight(callbackfn);

      expect(srcArr[0]).assertEqual(1);
      expect(srcArr[1]).assertEqual(2);
      expect(srcArr[2]).assertEqual(3);
      expect(srcArr[3]).assertEqual(4);
      expect(srcArr[4]).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0081
     * @tc.name ESArrayPrototypeTest20081
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20081';
      console.info(`${caseName}, test start`);
      let callbackfn = (prevVal: string, curVal: string, idx: int, obj: Array<string>): string => {
        return String(prevVal) + curVal;
      }

      let srcArr: Array<string> = new Array<string>('1', '2', '3', '4', '5');

      expect(srcArr.reduceRight(callbackfn)).assertEqual('54321');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0082
     * @tc.name ESArrayPrototypeTest20082
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20082';
      console.info(`${caseName}, test start`);
      let callbackfn = (prevVal: string, curVal: string, idx: int, obj: Array<string>): string => {
        return prevVal + curVal;
      }

      let srcArr: Array<string> = new Array<string>('1', '2', '3', '4', '5');

      expect(srcArr.reduceRight(callbackfn, '6')).assertEqual('654321');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0083
     * @tc.name ESArrayPrototypeTest20083
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20083';
      console.info(`${caseName}, test start`);
      let callCnt = 0;

      let callbackfn = (prevVal: string, curVal: string, idx: int, obj: Array<string>): string => {
        callCnt++;
        return '';
      }
      let srcArr: Array<string> = new Array<string>('1', '2', '3', '4', '5');

      srcArr.reduceRight(callbackfn);

      expect(callCnt).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0084
     * @tc.name ESArrayPrototypeTest20084
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20084';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>();
      let reverse1: Array<number> = x.reverse();
      expect(reverse1).assertEqual(x);

      let x2: Array<number> = new Array<number>(1);
      x2[0] = 1;
      let reverse2: Array<number> = x2.reverse();
      expect(reverse2).assertEqual(x2);

      let x3: Array<number> = new Array<number>(1, 2);
      let reverse3: Array<number> = x3.reverse();
      expect(reverse3).assertEqual(x3);

      expect(x3[0]).assertEqual(2);
      expect(x3[1]).assertEqual(1);
      expect(x3.length).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0085
     * @tc.name ESArrayPrototypeTest20085
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20085';
      console.info(`${caseName}, test start`);
      let x1: Array<undefined> = new Array<undefined>();
      let shift1 = x1.shift();
      expect(shift1).assertEqual(undefined);
      expect(x1.length).assertEqual(0);

      let x2: Array<number> = new Array<number>(1, 2, 3);
      x2.length = 0;
      let shift2 = x2.shift();
      expect(shift2).assertEqual(undefined);
      expect(x2.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0086
     * @tc.name ESArrayPrototypeTest20086
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20086';
      console.info(`${caseName}, test start`);
      let x1: Array<number> = new Array<number>(0, 1, 2, 3, 4);
      let shift1 = x1.shift();
      expect(shift1).assertEqual(0);
      expect(x1.length).assertEqual(4);
      expect(x1[0]).assertEqual(1);
      expect(x1[1]).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0087
     * @tc.name ESArrayPrototypeTest20087
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20087';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3, 4);
      let arr = x.slice(0, 3);

      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0088
     * @tc.name ESArrayPrototypeTest20088
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20088';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3, 4);
      let arr = x.slice(3, 3);

      expect(arr.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0089
     * @tc.name ESArrayPrototypeTest20089
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20089';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3, 4);
      let arr = x.slice(4, 3);

      expect(arr.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0090
     * @tc.name ESArrayPrototypeTest20090
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20090';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3, 4);
      let arr = x.slice(5, 5);

      expect(arr.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0091
     * @tc.name ESArrayPrototypeTest20091
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20091';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3, 4);
      let arr = x.slice(3, 5);

      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0092
     * @tc.name ESArrayPrototypeTest20092
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20092';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3, 4);
      let arr = x.slice(2, 4);

      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0093
     * @tc.name ESArrayPrototypeTest20093
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20093';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3, 4);
      let arr = x.slice(3, 6);

      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0094
     * @tc.name ESArrayPrototypeTest20094
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20094';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3, 4);
      let arr = x.slice(-3, 3);

      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0095
     * @tc.name ESArrayPrototypeTest20095
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20095';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3, 4);
      let arr = x.slice(-1, 5);

      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0096
     * @tc.name ESArrayPrototypeTest20096
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20096';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3, 4);
      let arr = x.slice(-5, 1);

      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0097
     * @tc.name ESArrayPrototypeTest20097
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20097';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3, 4);
      let arr = x.slice(-9, 5);

      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(3);
      expect(arr[4]).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0098
     * @tc.name ESArrayPrototypeTest20098
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20098';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3, 4);
      let arr = x.slice(0, -2);

      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0099
     * @tc.name ESArrayPrototypeTest20099
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20099';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3, 4);
      let arr = x.slice(1, -4);

      expect(arr.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0100
     * @tc.name ESArrayPrototypeTest20100
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20100';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3, 4);
      let arr = x.slice(0, -5);

      expect(arr.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0101
     * @tc.name ESArrayPrototypeTest20101
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20101';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3, 4);
      let arr = x.slice(4, -9);

      expect(arr.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0102
     * @tc.name ESArrayPrototypeTest20102
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20102';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3, 4);
      let arr = x.slice(-5, -2);

      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0103
     * @tc.name ESArrayPrototypeTest20103
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20103';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3, 4);
      let arr = x.slice(-3, -1);

      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0104
     * @tc.name ESArrayPrototypeTest20104
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20104';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3, 4);
      let arr = x.slice(-9, -1);

      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0105
     * @tc.name ESArrayPrototypeTest20105
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20105';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3, 4);
      let arr = x.slice(-6, -6);

      expect(arr.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0106
     * @tc.name ESArrayPrototypeTest20106
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20106';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3, 4);
      let arr = x.slice(-2);

      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0107
     * @tc.name ESArrayPrototypeTest20107
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20107';
      console.info(`${caseName}, test start`);
      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean => {
        return val > 10;
      }

      let arr: Array<number> = new Array<number>(9, 11);

      expect(arr.some(callbackfn)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0108
     * @tc.name ESArrayPrototypeTest20108
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20108';
      console.info(`${caseName}, test start`);
      let calledForThree: boolean = false;
      let arr: Array<number> = new Array<number>(1, 2, 0, 4, 5);
      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean => {
        arr[2] = 3;
        if (val !== 3) {
          calledForThree = true;
        }

        return false;
      }

      let val = arr.some(callbackfn);

      expect(calledForThree).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0109
     * @tc.name ESArrayPrototypeTest20109
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20109';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean =>
      {
        arr[4] = 6;
        if (val < 6)
          return false;
        else
          return true;
      }

      expect(arr.some(callbackfn)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0110
     * @tc.name ESArrayPrototypeTest20110
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20110';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>(1, 2, 3, 4, 6);
      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean => {
        arr.length = 3;
        if (val < 4) {
          return false;
        } else {
          return true;
        }
      }

      expect(arr.some(callbackfn)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0111
     * @tc.name ESArrayPrototypeTest20111
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20111';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>(10);
      arr[1] = 1;
      arr[2] = 2;
      let threw = false;
      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean =>
      {
        if (1000 < arr.length) {
          arr[1000] = 5;
        }
        if (val < 5) {
          return false;
        } else {
          return true;
        }
      }
      try{
        arr.some(callbackfn);
        expect(false).assertTrue();
      } catch (err) {
        if(err instanceof ClassCastError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0112
     * @tc.name ESArrayPrototypeTest20112
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20112';
      console.info(`${caseName}, test start`);
      let kValue: A = {};

      let callbackfn = (val: object, idx: int, obj: Array<object>): boolean => {
        if (idx === 0) {
          return kValue === val;
        }
        return false;
      }

      let arr: Array<object> = new Array<object>(kValue);

      expect(arr.some(callbackfn)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0113
     * @tc.name ESArrayPrototypeTest20113
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20113';
      console.info(`${caseName}, test start`);
      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean =>
      {
        if (obj[idx] === val)
          return false;
        else
          return true;
      }

      let arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);

      expect(arr.some(callbackfn)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0114
     * @tc.name ESArrayPrototypeTest20114
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20114';
      console.info(`${caseName}, test start`);
      let callCnt = 0;

      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean =>
      {
        callCnt++;
        if (idx > 5)
          return true;
        else
          return false;
      }

      let arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);

      expect(arr.some(callbackfn)).assertEqual(true);
      expect(callCnt).assertEqual(7);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0115
     * @tc.name ESArrayPrototypeTest20115
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20115';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5);
      let lastIdx = 0;
      let called = 0;

      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean => {
        called++;
        if (lastIdx !== idx) {
          return true;
        } else {
          lastIdx++;
          return false;
        }
      }

      expect(arr.some(callbackfn)).assertEqual(false);
      expect(arr.length).assertEqual(called);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0116
     * @tc.name ESArrayPrototypeTest20116
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20116';
      console.info(`${caseName}, test start`);
      let callbackfn = (): boolean => {
        return true;
      }

      let arr: Array<number> = new Array<number>(11, 12);
      expect(arr.some(callbackfn)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0117
     * @tc.name ESArrayPrototypeTest20117
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20117';
      console.info(`${caseName}, test start`);
      let callbackfn = (val: number): boolean => {
        return val > 10;
      }
      let arr: Array<number> = new Array<number>(11, 12);
      expect(arr.some(callbackfn)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0118
     * @tc.name ESArrayPrototypeTest20118
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20118';
      console.info(`${caseName}, test start`);
      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean =>  {
        return val > 10 && obj[idx] === val;
      }

      let arr: Array<number> = new Array<number>(9, 12);
      expect(arr.some(callbackfn)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0119
     * @tc.name ESArrayPrototypeTest20119
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20119';
      console.info(`${caseName}, test start`);
      let accessed: boolean = false;

      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean => {
        ((val: number, idx: int, obj: Array<number>): number => {
          accessed = true;
          return 0;
        })(val, idx, obj)
        return true;
      }

      let arr: Array<number> = new Array<number>(1);
      arr[0] = 11;

      expect(arr.some(callbackfn)).assertEqual(true);
      expect(accessed).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0120
     * @tc.name ESArrayPrototypeTest20120
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20120';
      console.info(`${caseName}, test start`);
      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean => {
        return Boolean(1);
      }
      let arr: Array<number> = new Array<number>();
      arr.push(11);

      expect(arr.some(callbackfn)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0121
     * @tc.name ESArrayPrototypeTest20121
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20121';
      console.info(`${caseName}, test start`);
      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean => {
        return Boolean(false);
      }
      let arr: Array<number> = new Array<number>();
      arr.push(11);

      expect(arr.some(callbackfn)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0122
     * @tc.name ESArrayPrototypeTest20122
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20122';
      console.info(`${caseName}, test start`);
      let cb = (): boolean => {
        return false
      }
      let arr: Array<number> = new Array<number>(0);
      let i = arr.some(cb);
      expect(i).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0123
     * @tc.name ESArrayPrototypeTest20123
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20123';
      console.info(`${caseName}, test start`);
      let callCnt = 0;

      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean =>
      {
        callCnt++;
        return false;
      }

      let arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);

      expect(arr.some(callbackfn)).assertEqual(false);
      expect(callCnt).assertEqual(10);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0124
     * @tc.name ESArrayPrototypeTest20124
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20124';
      console.info(`${caseName}, test start`);
      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean =>
      {
        return true;
      }
      let arr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
      arr.some(callbackfn);

      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0125
     * @tc.name ESArrayPrototypeTest20125
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20125';
      console.info(`${caseName}, test start`);
      let callCnt = 0;

      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean =>
      {
        callCnt++;
        return false;
      }
      let arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);

      expect(arr.some(callbackfn)).assertEqual(false);
      expect(callCnt).assertEqual(10);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0126
     * @tc.name ESArrayPrototypeTest20126
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20126';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(2);
      x.sort();
      expect(x.length).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0127
     * @tc.name ESArrayPrototypeTest20127
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20127';
      console.info(`${caseName}, test start`);
      let x1: Array<number> = new Array<number>(2);
      x1[1] = 1;
      x1.sort();

      expect(x1.length).assertEqual(2);
      expect(x1[0]).assertEqual(1);

      let x2: Array<number> = new Array<number>(2);
      x2[0] = 1;
      x2.sort();

      expect(x2.length).assertEqual(2);
      expect(x2[0]).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0128
     * @tc.name ESArrayPrototypeTest20128
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20128';
      console.info(`${caseName}, test start`);
      let x: Array<undefined> = new Array<undefined>(undefined, undefined);
      x.sort();

      expect(x.length).assertEqual(2);
      expect(x[0]).assertEqual(undefined);
      expect(x[1]).assertEqual(undefined);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0129
     * @tc.name ESArrayPrototypeTest20129
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20129';
      console.info(`${caseName}, test start`);
      let x: Array<undefined | number> = new Array<undefined | number>(undefined, 1);
      x.sort();

      expect(x.length).assertEqual(2);
      expect(x[0]).assertEqual(1);

      let y = new Array<number | undefined>(1, undefined);
      y.sort();

      expect(y.length).assertEqual(2);
      expect(y[0]).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0130
     * @tc.name ESArrayPrototypeTest20130
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20130';
      console.info(`${caseName}, test start`);
      let myComparefn = (x: number | undefined, y: number | undefined): int => {
        if (x === undefined) {
          return -1;
        }
        if (y === undefined) {
          return 1;
        }
        return 0;
      }

      let x: Array<undefined | number> = new Array<undefined | number>(undefined, 1);
      x.sort(myComparefn);

      expect(x.length).assertEqual(2);
      expect(x[0]).assertEqual(1);
      expect(x[1]).assertEqual(undefined);

      let x1: Array<undefined | number> = new Array<undefined | number>(1, undefined);
      x1.sort(myComparefn);

      expect(x1.length).assertEqual(2);
      expect(x1[0]).assertEqual(1);
      expect(x1[1]).assertEqual(undefined);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0131
     * @tc.name ESArrayPrototypeTest20131
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20131';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(1, 0);
      x.sort();

      expect(x.length).assertEqual(2);
      expect(x[0]).assertEqual(0);
      expect(x[1]).assertEqual(1);

      let x1: Array<number> = new Array<number>(1, 0);
      x1.sort(undefined);

      expect(x1.length).assertEqual(2);
      expect(x1[0]).assertEqual(0);
      expect(x1[1]).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0132
     * @tc.name ESArrayPrototypeTest20132
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20132';
      console.info(`${caseName}, test start`);
      let alphabetR: Array<string> = new Array<string>(
        "ё", "я", "ю", "э", "ь", "ы", "ъ", "щ", "ш", "ч", "ц", "х", "ф", "у", "т", "с", "р",
        "П", "О", "Н", "М", "Л", "К", "Й", "И", "З", "Ж", "Е", "Д", "Г", "В", "Б", "А"
      );
      let alphabet: Array<string> = new Array<string>(
        "А", "Б", "В", "Г", "Д", "Е", "Ж", "З", "И", "Й", "К", "Л", "М", "Н", "О", "П",
        "р", "с", "т", "у", "ф", "х", "ц", "ч", "ш", "щ", "ъ", "ы", "ь", "э", "ю", "я", "ё"
      );

      alphabetR.sort();

      for (let i = 0; i < 26; i++) {
        expect(alphabetR[i]).assertEqual(alphabet[i]);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0133
     * @tc.name ESArrayPrototypeTest20133
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20133';
      console.info(`${caseName}, test start`);
      let obj: A_133 = {
        valueOf1: (): number => {
          return 1;
        },
        toString1: (): number => {
          return -2;
        }
      };
      let alphabetR: Array<undefined | number | string | boolean | object> = new Array<undefined | number | string | boolean | object>(
        undefined, 2, 1, "X", -1, "a", true, obj, NaN, Infinity
      );
      let alphabet: Array<undefined | number | string | boolean | object> = new Array<undefined | number | string | boolean | object>(
        -1, obj, 1, 2, Infinity, NaN, "X", "a", true, undefined
      );

      alphabetR.sort();

      let result = true;
      for (let i = 0; i < 10; i++) {
        if (alphabetR[i] !== alphabet[i]) {
          result = false;
        }
      }

      expect(result).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0134
     * @tc.name ESArrayPrototypeTest20134
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20134';
      console.info(`${caseName}, test start`);
      let alphabetR: Array<string> = new Array<string>(
        "z", "y", "x", "w", "v", "u", "t", "s", "r", "q", "p", "o", "n",
        "M", "L", "K", "J", "I", "H", "G", "F", "E", "D", "C", "B", "A"
      );
      let alphabet: Array<string> = new Array<string>(
        "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
        "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
      );
      let myComparefn = (x: string, y: string): int => {
        let xS = String(x);
        let yS = String(y);
        if (xS < yS) {
          return 1;
        }
        if (xS > yS) {
          return -1;
        }
        return 0;
      }
      alphabet.sort(myComparefn);
      let result = true;
      for (let i = 0; i < 26; i++) {
        if (alphabetR[i] !== alphabet[i]) {
          result = false;
        }
      }
      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0135
     * @tc.name ESArrayPrototypeTest20135
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20135';
      console.info(`${caseName}, test start`);
      let alphabetR: Array<string> = new Array<string>(
        "ё", "я", "ю", "э", "ь", "ы", "ъ", "щ", "ш", "ч", "ц", "х", "ф", "у", "т", "с", "р",
        "П", "О", "Н", "М", "Л", "К", "Й", "И", "З", "Ж", "Е", "Д", "Г", "В", "Б", "А"
      );
      let alphabet: Array<string> = new Array<string>(
        "А", "Б", "В", "Г", "Д", "Е", "Ж", "З", "И", "Й", "К", "Л", "М", "Н", "О", "П",
        "р", "с", "т", "у", "ф", "х", "ц", "ч", "ш", "щ", "ъ", "ы", "ь", "э", "ю", "я", "ё"
      );

      let myComparefn = (x: string, y: string): int => {
        let xS = String(x);
        let yS = String(y);
        if (xS < yS) return 1;
        if (xS > yS) return -1;
        return 0;
      }

      alphabet.sort(myComparefn);

      let result = true;
      for (let i = 0; i < 26; i++) {
        if (alphabetR[i] !== alphabet[i]) result = false;
      }

      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0136
     * @tc.name ESArrayPrototypeTest20136
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20136';
      console.info(`${caseName}, test start`);
      const array: Array<GeneratedTypeLiteralInterface_1> = new Array<GeneratedTypeLiteralInterface_1>(
        { name: 'A', rating: 2 },
        { name: 'B', rating: 3 },
        { name: 'C', rating: 2 },
        { name: 'D', rating: 3 },
        { name: 'E', rating: 3 },
      );
      expect(array.length).assertEqual(5);
      array.sort((a: GeneratedTypeLiteralInterface_1, b: GeneratedTypeLiteralInterface_1) => b.rating - a.rating);
      const reduced = array.reduce((acc: string, element: GeneratedTypeLiteralInterface_1) => acc + element.name, '');
      expect(reduced).assertEqual('BDEAC');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0137
     * @tc.name ESArrayPrototypeTest20137
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20137';
      console.info(`${caseName}, test start`);
      let arrObj: Array<number> = new Array<number>(1, 2, 3);
      let newArrObj: Array<number> = arrObj.splice(-2, 1);

      expect(newArrObj.length).assertEqual(1);
      expect(newArrObj[0]).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0139
     * @tc.name ESArrayPrototypeTest20139
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20139';
      console.info(`${caseName}, test start`);
      let array: Array<string> = new Array<string>("first", "second", "third");

      let result = array.splice(1);

      expect(array.length).assertEqual(1);
      expect(array[0]).assertEqual("first");

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("second");
      expect(result[1]).assertEqual("third");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0140
     * @tc.name ESArrayPrototypeTest20140
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20140';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3);
      let arr: Array<number> = x.splice(0, 3);

      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);

      expect(x.length).assertEqual(1);
      expect(x[0]).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0141
     * @tc.name ESArrayPrototypeTest20141
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20141';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3);
      let arr: Array<number> = x.splice(0, 4);

      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(3);

      expect(x.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0142
     * @tc.name ESArrayPrototypeTest20142
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20142';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3);
      let arr: Array<number> = x.splice(1, 3, 4, 5);

      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);

      expect(x.length).assertEqual(3);
      expect(x[0]).assertEqual(0);
      expect(x[1]).assertEqual(4);
      expect(x[2]).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0143
     * @tc.name ESArrayPrototypeTest20143
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20143';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3);
      let arr: Array<number> = x.splice(0, 5);

      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(3);

      expect(x.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0144
     * @tc.name ESArrayPrototypeTest20144
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20144';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3);
      let arr: Array<number> = x.splice(1, 4, 4, 5);

      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);

      expect(x.length).assertEqual(3);
      expect(x[0]).assertEqual(0);
      expect(x[1]).assertEqual(4);
      expect(x[2]).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0145
     * @tc.name ESArrayPrototypeTest20145
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20145';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1);
      let arr: Array<number> = x.splice(-2, -1);

      expect(arr.length).assertEqual(0);
      expect(x.length).assertEqual(2);
      expect(x[0]).assertEqual(0);
      expect(x[1]).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0146
     * @tc.name ESArrayPrototypeTest20146
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20146';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1);
      let arr: Array<number> = x.splice(-1, -1);

      expect(arr.length).assertEqual(0);
      expect(x.length).assertEqual(2);
      expect(x[0]).assertEqual(0);
      expect(x[1]).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0147
     * @tc.name ESArrayPrototypeTest20147
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20147';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1);
      let arr: Array<number> = x.splice(-2, -1, 2, 3);

      expect(arr.length).assertEqual(0);
      expect(x.length).assertEqual(4);
      expect(x[0]).assertEqual(2);
      expect(x[1]).assertEqual(3);
      expect(x[2]).assertEqual(0);
      expect(x[3]).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0148
     * @tc.name ESArrayPrototypeTest20148
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20148';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1);
      let arr: Array<number> = x.splice(-1, -1, 2, 3);

      expect(arr.length).assertEqual(0);
      expect(x.length).assertEqual(4);
      expect(x[0]).assertEqual(0);
      expect(x[1]).assertEqual(2);
      expect(x[2]).assertEqual(3);
      expect(x[3]).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0149
     * @tc.name ESArrayPrototypeTest20149
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20149';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1);
      let arr: Array<number> = x.splice(-3, -1, 2, 3);

      expect(arr.length).assertEqual(0);
      expect(x.length).assertEqual(4);
      expect(x[0]).assertEqual(2);
      expect(x[1]).assertEqual(3);
      expect(x[2]).assertEqual(0);
      expect(x[3]).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0150
     * @tc.name ESArrayPrototypeTest20150
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20150';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1);
      let arr: Array<number> = x.splice(0, -1);

      expect(arr.length).assertEqual(0);
      expect(x.length).assertEqual(2);
      expect(x[0]).assertEqual(0);
      expect(x[1]).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0151
     * @tc.name ESArrayPrototypeTest20151
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20151';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1);
      let arr: Array<number> = x.splice(0, -1);

      expect(arr.length).assertEqual(0);
      expect(x.length).assertEqual(2);
      expect(x[0]).assertEqual(0);
      expect(x[1]).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0152
     * @tc.name ESArrayPrototypeTest20152
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20152';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1);
      let arr: Array<number> = x.splice(2, -1);

      expect(arr.length).assertEqual(0);
      expect(x.length).assertEqual(2);
      expect(x[0]).assertEqual(0);
      expect(x[1]).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0153
     * @tc.name ESArrayPrototypeTest20153
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20153';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1);
      let arr: Array<number> = x.splice(0, -1, 2, 3);

      expect(arr.length).assertEqual(0);
      expect(x.length).assertEqual(4);
      expect(x[0]).assertEqual(2);
      expect(x[1]).assertEqual(3);
      expect(x[2]).assertEqual(0);
      expect(x[3]).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0154
     * @tc.name ESArrayPrototypeTest20154
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20154';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1);
      let arr: Array<number> = x.splice(2, -1, 2, 3);

      expect(arr.length).assertEqual(0);
      expect(x.length).assertEqual(4);
      expect(x[0]).assertEqual(0);
      expect(x[1]).assertEqual(1);
      expect(x[2]).assertEqual(2);
      expect(x[3]).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0155
     * @tc.name ESArrayPrototypeTest20155
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20155';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1);
      let arr: Array<number> = x.splice(3, -1, 2, 3);

      expect(arr.length).assertEqual(0);
      expect(x.length).assertEqual(4);
      expect(x[0]).assertEqual(0);
      expect(x[1]).assertEqual(1);
      expect(x[2]).assertEqual(2);
      expect(x[3]).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0156
     * @tc.name ESArrayPrototypeTest20156
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20156';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3);
      let arr: Array<number> = x.splice(-4, 3);

      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);

      expect(x.length).assertEqual(1);
      expect(x[0]).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0157
     * @tc.name ESArrayPrototypeTest20157
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20157';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3);
      let arr: Array<number> = x.splice(-4, 3, 4, 5);

      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);

      expect(x.length).assertEqual(3);
      expect(x[0]).assertEqual(4);
      expect(x[1]).assertEqual(5);
      expect(x[2]).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0158
     * @tc.name ESArrayPrototypeTest20158
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20158';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3);
      let arr: Array<number> = x.splice(-5, 4);

      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(3);

      expect(x.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0159
     * @tc.name ESArrayPrototypeTest20159
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20159';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3);
      let arr: Array<number> = x.splice(-3, 3, 4, 5);

      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);

      expect(x.length).assertEqual(3);
      expect(x[0]).assertEqual(0);
      expect(x[1]).assertEqual(4);
      expect(x[2]).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0160
     * @tc.name ESArrayPrototypeTest20160
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20160';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3);
      let arr: Array<number> = x.splice(-9, 5);

      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(3);

      expect(x.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0161
     * @tc.name ESArrayPrototypeTest20161
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20161';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3);
      let arr: Array<number> = x.splice(-3, 4, 4, 5);

      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);

      expect(x.length).assertEqual(3);
      expect(x[0]).assertEqual(0);
      expect(x[1]).assertEqual(4);
      expect(x[2]).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0162
     * @tc.name ESArrayPrototypeTest20162
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20162';
      console.info(`${caseName}, test start`);
      let x: Array<number> = [0, 1, 2, 3];
      let arr: Array<number> = x.splice(1, undefined);

      expect(arr.length).assertEqual(0);
      expect(x.length).assertEqual(4);
      expect(x[1]).assertEqual(1);
      expect(x[2]).assertEqual(2);
      expect(x[3]).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0163
     * @tc.name ESArrayPrototypeTest20163
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20163';
      console.info(`${caseName}, test start`);
      let a: Array<number> = new Array<number>(0, 1, 2);

      a.splice(1, 2, 4);

      expect(a.length).assertEqual( 2);
      expect(a[0]).assertEqual(0);
      expect(a[1]).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0164
     * @tc.name ESArrayPrototypeTest0164
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest0164';
      console.info(`${caseName}, test start`);
      let array: Array<number> = new Array<number>();
      let res = array.toLocaleString();
      expect(res.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0165
     * @tc.name ESArrayPrototypeTest0165
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest0165';
      console.info(`${caseName}, test start`);
      let obj = new A_165();
      let arr: Array<object> = new Array<object>(obj, obj, obj);
      arr.toLocaleString();
      expect(n_165).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0166
     * @tc.name ESArrayPrototypeTest0166
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest0166';
      console.info(`${caseName}, test start`);
      let arr = new Array<number>(1,2,3);
      arr[2] = 42;
      let res = arr.length;
      expect(res).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(42);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0167
     * @tc.name ESArrayPrototypeTest0167
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest0167';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>();
      let res = arr.length;
      expect(res).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0168
     * @tc.name ESArrayPrototypeTest0168
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest0168';
      console.info(`${caseName}, test start`);
      let array: Array<number> = new Array<number>();
      let res = array.toString();
      expect(res.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0169
     * @tc.name ESArrayPrototypeTest0169
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest0169';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>();
      expect(x.toString()).assertEqual(x.join());
      if (x.toString() !== "") {
        expect(x.toString()).assertEqual("");
      }
      x = new Array<number>();
      expect(x.toString()).assertEqual(x.join());
      if (x.toString() !== "") {
        expect(x.toString()).assertEqual("");
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0170
     * @tc.name ESArrayPrototypeTest0170
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest0170';
      console.info(`${caseName}, test start`);
      let x: Array<number | undefined | null> = new Array<number | undefined | null>(0, 1, 2, 3);
      expect(x.toString()).assertEqual(x.join());
      expect(x.toString()).assertEqual("0,1,2,3");
      x = new Array<number | undefined | null>();
      let threw = false;
      try{
        x[0] = 0;
        x[3] = 3;
        expect(false).assertTrue();
      } catch (err) {
        if(err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0171
     * @tc.name ESArrayPrototypeTest0171
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest0171';
      console.info(`${caseName}, test start`);
      let x: Array<string> = new Array<string>("", "", "");
      expect(x.toString()).assertEqual(x.join());
      expect(x.toString()).assertEqual(",,");
      let x1: Array<string> = new Array<string>("\\", "\\", "\\");
      expect(x1.toString()).assertEqual(x1.join());
      expect(x1.toString()).assertEqual("\\,\\,\\");
      let x2: Array<string> = new Array<string>("&", "&", "&");
      expect(x2.toString()).assertEqual(x2.join());
      expect(x2.toString()).assertEqual("&,&,&");
      let x3: Array<boolean> = new Array<boolean>(true, true, true);
      expect(x3.toString()).assertEqual(x3.join());
      expect(x3.toString()).assertEqual("true,true,true");
      let x4: Array<null> = new Array<null>(null, null, null);
      expect(x4.toString()).assertEqual(x4.join());
      expect(x4.toString()).assertEqual(",,");

      let x5: Array<undefined> = new Array<undefined>(undefined, undefined, undefined);
      expect(x5.toString()).assertEqual(x5.join());
      expect(x5.toString()).assertEqual(",,");

      let x6: Array<number> = new Array<number>(Infinity, Infinity, Infinity);
      expect(x6.toString()).assertEqual(x6.join());
      expect(x6.toString()).assertEqual("Infinity,Infinity,Infinity");

      let x7: Array<number> = new Array<number>(NaN, NaN, NaN);
      expect(x7.toString()).assertEqual(x7.join());
      expect(x7.toString()).assertEqual("NaN,NaN,NaN");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0172
     * @tc.name ESArrayPrototypeTest0172
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest0172';
      console.info(`${caseName}, test start`);

      let object1: A_172 = {
        valueOf: (): string => {
          return "+"
        }
      };
      let x1: Array<object> = new Array<object>(object1);
      expect(x1.toString()).assertEqual(x1.join());
      let object2: A_172 = {
        valueOf: (): string => {
          return "+"
        },
        toString1: (): string => {
          return "*"
        }
      };
      let x2: Array<object> = new Array<object>(object2);
      expect(x2.toString()).assertEqual(x2.join());
      let object3: B_172 = {
        valueOf: (): string => {
          return "+"
        },
        toString1: (): object => {
          return {} as AA_172
        }
      };
      let x3: Array<object> = new Array<object>(object3);
      expect(x3.toString()).assertEqual(x3.join());
      let object4: A_172 = {
        valueOf: (): string => {
          throw new Error("error")
        },
        toString1: (): string => {
          return "*"
        }
      };
      let x4: Array<object> = new Array<object>(object4);
      expect(x4.toString()).assertEqual(x4.join());
      let object5: C_172 = {
        toString1: (): string => {
          return "*"
        }
      };
      let x5: Array<object> = new Array<object>(object5);
      expect(x5.toString()).assertEqual(x5.join());
      let object6: D_172 = {
        valueOf: (): object => {
          return {} as AA_172
        },
        toString1: (): string => {
          return "*"
        }
      }
      let x6: Array<object> = new Array<object>(object6);
      expect(x6.toString()).assertEqual(x6.join());
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0173
     * @tc.name ESArrayPrototypeTest0173
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest0173';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>();
      let unshift3 = x.unshift(1);
      expect(unshift3).assertEqual(1);
      expect(x[0]).assertEqual(1);
      let unshift2 = x.unshift(-1);
      expect(unshift2).assertEqual(2);
      expect(x[1]).assertEqual(1);
      expect(x.length).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0174
     * @tc.name ESArrayPrototypeTest0174
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest0174';
      console.info(`${caseName}, test start`);
      let x: Array<number | boolean | string> = new Array<number | boolean | string>();
      expect(x.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0175
     * @tc.name ESArrayPrototypeTest0175
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest0175';
      console.info(`${caseName}, test start`);
      let array = new Array<string>();
      let iterator = array.values();
      let result: IteratorResult<string>;
      array.push('a');
      result = iterator.next();
      expect(result.done).assertEqual(false);
      expect(result.value).assertEqual('a');
      result = iterator.next();
      expect(result.done).assertEqual(true);
      expect(result.value).assertEqual(undefined);
      array.push('b');
      result = iterator.next();
      expect(result.done).assertEqual(true);
      expect(result.value).assertEqual(undefined);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0176
     * @tc.name ESArrayPrototypeTest0176
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest0176';
      console.info(`${caseName}, test start`);
      let array: Array<string> = new Array<string>('a', 'b', 'c');
      let iterator = array.values();
      let result: IteratorResult<string>;
      result = iterator.next();
      expect(result.value).assertEqual('a');
      expect(result.done).assertEqual(false);
      result = iterator.next();
      expect(result.value).assertEqual('b');
      expect(result.done).assertEqual(false);
      result = iterator.next();
      expect(result.value).assertEqual('c');
      expect(result.done).assertEqual(false);
      result = iterator.next();
      expect(result.value).assertEqual(undefined);
      expect(result.done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

  })
}