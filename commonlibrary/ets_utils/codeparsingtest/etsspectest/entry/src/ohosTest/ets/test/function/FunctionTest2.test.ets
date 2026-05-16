/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { sleep } from '../../testability/pages/Utils';
import {
  addWithDefaultHoistMulti,
  addWithDefaultHoistNested,
  calcQuartic,
  checkArgsNoPop,
  checkArgsNoShift,
  checkArrowNoArguments,
  checkArrowNoPrototype,
  checkExprCallAfterDefine,
  checkExprHoistAfterDefine,
  checkInfiniteValue,
  checkInnerVarModify,
  checkInnerVarShadow,
  checkNaNValue,
  collectRestArgsNumStr,
  collectRestArgsStr,
  convertArgsToObj,
  convertArgsToStr,
  createCounterClosureNegStep,
  createCounterClosureStep,
  createCounterObjWithLimit,
  createCounterObjWithReset,
  createFourCounterClosure,
  createThreeCounterClosure,
  divideAllArgs,
  divideWithApply,
  divideWithArrowRest,
  divTwoNum,
  factorialRecursiveWithBase,
  factorialRecursiveWithOffset,
  fibonacciHoisted,
  getArgByIndexLast,
  getArgByIndexRange,
  getArgLengthMax,
  getArgLengthZero,
  getArrMultiElemByDestruct,
  getArrNestedElemByDestruct,
  getFixedArray,
  getFixedBool,
  getInnerVarConflictMulti,
  getInnerVarConflictShadow,
  getInnerVarOverGlobalMulti,
  getInnerVarOverGlobalShadow,
  getObjMultiPropByDestruct,
  getObjNestedPropByDestruct,
  getOuterVarInNestedMulti,
  getOuterVarInNestedShadow,
  modTwoNum,
  multiplyAllArgs,
  multiplyDefaultAndRest,
  multiplyWithApply,
  multiplyWithArrowRest,
  multiplyWithDefault,
  multiplyWithUndefinedDefault,
  numFibonacci,
  numTriangular,
  popArrInClosure,
  powDefaultAndRest,
  powTwoNum,
  powWithDefault,
  powWithUndefinedDefault,
  quadWithArrow,
  shiftArrInClosure,
  sliceArrElem,
  strPadStart,
  strRepeat,
  sumFiveLayerClosure,
  sumFourLayerClosure,
  sumFourLayerVar as sumThreeLayerVar,
  triangularHoisted,
  tripleWithArrow,
  unshiftArrElem,
  updateObjNestedInClosure
} from './functionutils2';

interface GeneratedTypeLiteralInterface_2 {
  id: number;
  name: string;
  age: number;
}

interface User {
  name: string;
}

interface Data {
  user: User;
}

interface InputObj {
  data: Data;
}

interface UserAge {
  age: number;
}

interface UserObj {
  user: UserAge;
}

type CounterFunction = () => number;

interface FourCounters {
  counter1: CounterFunction;
  counter2: CounterFunction;
  counter3: CounterFunction;
  counter4: CounterFunction;
}

export default function functionTest2() {
  describe('FunctionTest2', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   FunctionTest0053
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0053
     * @tc.desc   Named function expression - division of two numbers (non-zero divisor check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 24, b: number = 6;
      const result: number = divTwoNum(a, b);
      const isDivisorValid: boolean = b !== 0;
      expect(isDivisorValid).assertTrue();
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   FunctionTest0056
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0056
     * @tc.desc   Array parameter - add element to the head (reference passing check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArr: number[] = [3, 4, 5];
      const addVal: number = 2;
      const updatedArr: number[] = unshiftArrElem(inputArr, addVal);
      expect(Array.isArray(updatedArr)).assertTrue();
      expect(updatedArr[0]).assertEqual(2);
    });

    /**
     * @tc.name   FunctionTest0057
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0057
     * @tc.desc   Function declaration - return fixed boolean value without parameters (type check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: boolean = getFixedBool();
      const isResultValid: boolean = typeof result === 'boolean';
      expect(isResultValid).assertTrue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   FunctionTest0058
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0058
     * @tc.desc   Anonymous function expression - string repetition (result check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = 'Hi', times: number = 3;
      const result: string = strRepeat(str, times);
      expect(typeof result === 'string').assertTrue();
      expect(result).assertContain('HiHiHi');
    });

    /**
     * @tc.name   FunctionTest0059
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0059
     * @tc.desc   Named function expression - Fibonacci sequence (calculation of nth term)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input: number = 6; // Fibonacci: 1,1,2,3,5,8 (6th term is 8)
      const result: number = numFibonacci(input);
      const isInputValid: boolean = typeof input === 'number' && input >= 1;
      expect(isInputValid).assertTrue();
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name   FunctionTest0061
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0061
     * @tc.desc   Function declaration hoisting - call before declaration (Fibonacci result)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input: number = 7; // 7th term is 13
      const result: number = fibonacciHoisted(input);
      expect(typeof result === 'number').assertTrue();
      expect(result).assertEqual(13);
    });

    /**
     * @tc.name   FunctionTest0062
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0062
     * @tc.desc   Function expression - call after definition (normal execution check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const isCallSuccess: boolean = checkExprHoistAfterDefine();
      expect(isCallSuccess).assertTrue();
    });

    /**
     * @tc.name   FunctionTest0064
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0064
     * @tc.desc   apply method - pass array parameters for multiplication (result check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArr: number[] = [2, 3, 5];
      const result: number = multiplyWithApply(inputArr);
      expect(Array.isArray(inputArr)).assertTrue();
      expect(result).assertEqual(30); // 2*3*5
    });

    /**
     * @tc.name   FunctionTest0065
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0065
     * @tc.desc   Recursive call - factorial with base value (result check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input: number = 4, base: number = 1;
      const result: number = factorialRecursiveWithBase(input, base);
      expect(typeof result === 'number').assertTrue();
      expect(result).assertEqual(24); // 4! *1
    });

    /**
     * @tc.name   FunctionTest0066
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0066
     * @tc.desc   Function hoisting + multiple default parameters - call before declaration (default values take effect)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input: number = 2;
      const result: number = addWithDefaultHoistMulti(input); // default b=3, c=4
      expect(typeof result === 'number').assertTrue();
      expect(result).assertEqual(9); // 2+3+4
    });


    /**
     * @tc.name   FunctionTest0068
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0068
     * @tc.desc   apply method - empty parameters + default values (result check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArr: number[] = [];
      const result: number = multiplyWithApply(inputArr); // default returns 1
      expect(Array.isArray(inputArr)).assertTrue();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   FunctionTest0069
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0069
     * @tc.desc   Function scope - modifying internal variables does not affect external ones (value passing check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const isOuterUnchanged: boolean = checkInnerVarModify();
      expect(isOuterUnchanged).assertTrue();
    });

    /**
     * @tc.name   FunctionTest0070
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0070
     * @tc.desc   Nested function - access multiple external variables (sum check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 2, b: number = 3, c: number = 4;
      const result: number = getOuterVarInNestedMulti(a, b, c);
      expect(typeof result === 'number').assertTrue();
      expect(result).assertEqual(9); //2+3+4
    });

    /**
     * @tc.name   FunctionTest0071
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0071
     * @tc.desc   Multi-level nesting - sum of four-level variables (result check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 1, b: number = 2, c: number = 3;
      const result: number = sumThreeLayerVar(a, b, c);
      expect(typeof result === 'number').assertTrue();
      expect(result).assertEqual(6); //1+2+3
    });

    /**
     * @tc.name   FunctionTest0072
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0072
     * @tc.desc   Scope conflict - multi-level internal variable overriding (innermost takes effect)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const outerVar: number = 100;
      const result: number = getInnerVarConflictMulti(outerVar); // innermost x=10
      expect(typeof outerVar === 'number').assertTrue();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   FunctionTest0073
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0073
     * @tc.desc   Scope conflict - multi-level internal variables override global (innermost takes effect)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      globalThis.globalVal = 200;
      const result: number = getInnerVarOverGlobalMulti(); // innermost globalVal=20
      expect(typeof globalThis.globalVal === 'number').assertTrue();
      expect(result).assertEqual(20);
    });

    /**
     * @tc.name   FunctionTest0074
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0074
     * @tc.desc   Scope - modifying function parameters does not affect external variables (value passing check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let outerVar: number = 5;
      const modifyParam = (x: number): void => {
        x = 10;
      };
      modifyParam(outerVar);
      const isOuterUnchanged: boolean = outerVar === 5;
      expect(isOuterUnchanged).assertTrue();
    });

    /**
     * @tc.name   FunctionTest0076
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0076
     * @tc.desc   Basic closure - specified step counter (increment on multiple calls)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const counter: () => number = createCounterClosureStep(1, 2); // initial 1, step 2
      const firstVal: number = counter();
      const secondVal: number = counter();
      expect(typeof counter === 'function').assertTrue();
      expect(firstVal).assertEqual(1);
      expect(secondVal).assertEqual(3);
    });

    /**
     * @tc.name   FunctionTest0077
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0077
     * @tc.desc   Multi-level closure - sum of four-level variables (closure preservation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sumFunc: () => number = sumFourLayerClosure(2, 3, 4, 5);
      const result: number = sumFunc();
      expect(typeof sumFunc === 'function').assertTrue();
      expect(result).assertEqual(14); //2+3+4+5
    });

    /**
     * @tc.name   FunctionTest0078
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0078
     * @tc.desc   Closure encapsulation - counter with reset function (increment/reset/check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const counter = createCounterObjWithReset();
      counter.increment();
      counter.increment();
      counter.reset();
      const count: number = counter.getCount();
      expect(typeof counter.reset === 'function').assertTrue();
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name   FunctionTest0079
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0079
     * @tc.desc   Closure preserving array - remove last element (reference passing)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const initArr: number[] = [10, 20, 30];
      const popFunc: () => number[] = popArrInClosure(initArr);
      const updatedArr: number[] = popFunc();
      expect(Array.isArray(updatedArr)).assertTrue();
      expect(updatedArr.length).assertEqual(2); // 30 is removed
    });


    /**
     * @tc.name   FunctionTest0081
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0081
     * @tc.desc   Multiple closure instances - three independent counters (no interference)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const GeneratedDestructObj_1 = createThreeCounterClosure();
      const counterX = GeneratedDestructObj_1.counterX;
      const counterY = GeneratedDestructObj_1.counterY;
      const counterZ = GeneratedDestructObj_1.counterZ;
      const valX: number = counterX();
      const valY: number = counterY();
      const valZ: number = counterZ();
      expect(typeof counterX === 'function').assertTrue();
      expect(valX).assertEqual(1);
      expect(valY).assertEqual(1);
      expect(valZ).assertEqual(1);
    });

    /**
     * @tc.name   FunctionTest0082
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0082
     * @tc.desc   Closure handling numbers - decrement counter (multiple calls)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const decrementFunc: () => number = (() => {
        let count: number = 10;
        return (): number => count--;
      })();
      const firstRes: number = decrementFunc();
      const secondRes: number = decrementFunc();
      expect(typeof decrementFunc === 'function').assertTrue();
      expect(firstRes).assertEqual(10);
      expect(secondRes).assertEqual(9);
    });

    /**
     * @tc.name   FunctionTest0083
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0083
     * @tc.desc   Closure handling arrays - filter elements (multiple calls)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const filterFunc: (val: number) => number[] = (() => {
        const arr: number[] = [1, 2, 3];
        return (val: number): number[] => arr.filter(item => item !== val);
      })();
      const firstRes: number[] = filterFunc(2);
      const secondRes: number[] = filterFunc(1);
      expect(typeof filterFunc === 'function').assertTrue();
      expect(firstRes).assertContain(1); // [1,3]
      expect(secondRes).assertContain(3); // [3]
    });

    /**
     * @tc.name   FunctionTest0084
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0084
     * @tc.desc   arguments object - access last parameter by index (value check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 5, b: number = 10, c: number = 15;
      const result: number = getArgByIndexLast(a, b, c); // get arguments[2]
      expect(typeof result === 'number').assertTrue();
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   FunctionTest0085
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0085
     * @tc.desc   arguments object - length is 0 when no parameters (quantity check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const length: number = getArgLengthZero();
      expect(typeof length === 'number').assertTrue();
      expect(length).assertEqual(0);
    });

    /**
     * @tc.name   FunctionTest0086
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0086
     * @tc.desc   arguments object - convert to string (concatenation result)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: string = 'a', b: string = 'b', c: string = 'c';
      const result: string = convertArgsToStr(a, b, c);
      expect(typeof result === 'string').assertTrue();
      expect(result).assertContain('abc');
    });

    /**
     * @tc.name   FunctionTest0087
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0087
     * @tc.desc   arguments object - handle indefinite parameters (multiplication)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const args: number[] = [2, 3, 4];
      const product: number = multiplyAllArgs(...args);
      expect(Array.isArray(args)).assertTrue();
      expect(product).assertEqual(24); //2*3*4
    });

    /**
     * @tc.name   FunctionTest0088
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0088
     * @tc.desc   arguments object - non-array characteristics (no pop method)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const isPopFailed: boolean = checkArgsNoPop(1, 2, 3);
      expect(isPopFailed).assertTrue();
    });

    /**
     * @tc.name   FunctionTest0089
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0089
     * @tc.desc   Default parameters - basic multiplication characteristics (use default when no parameter passed)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input: number = 5;
      const result: number = multiplyWithDefault(input); // default b=6
      expect(typeof input === 'number').assertTrue();
      expect(result).assertEqual(30); //5*6
    });

    /**
     * @tc.name   FunctionTest0090
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0090
     * @tc.desc   Default parameters - passing undefined triggers default for multiplication (value check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = multiplyWithUndefinedDefault(undefined); // default a=4
      expect(typeof result === 'number').assertTrue();
      expect(result).assertEqual(4); //4*1 (default b=1)
    });

    /**
     * @tc.name   FunctionTest0091
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0091
     * @tc.desc   Rest parameters - collect string parameters (array characteristics)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const restArr: string[] = collectRestArgsStr('x', 'y', 'z');
      expect(Array.isArray(restArr)).assertTrue();
      expect(restArr.length).assertEqual(3);
    });

    /**
     * @tc.name   FunctionTest0092
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0092
     * @tc.desc   Default + rest parameters - mixed multiplication (result check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = multiplyDefaultAndRest(2, 3, 4); // default a=1, rest=[3,4]
      expect(typeof result === 'number').assertTrue();
      expect(result).assertEqual(24); //2*3*4
    });

    /**
     * @tc.name   FunctionTest0093
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0093
     * @tc.desc   Parameter destructuring - extract multiple object properties (result check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputObj: GeneratedTypeLiteralInterface_2 = {
        id: 202, name: 'Charlie', age: 25
      };
      const GeneratedDestructObj_1 = getObjMultiPropByDestruct(inputObj);
      const id = GeneratedDestructObj_1.id;
      const age = GeneratedDestructObj_1.age;
      expect(typeof inputObj === 'object' && inputObj !== null).assertTrue();
      expect(id).assertEqual(202);
      expect(age).assertEqual(25);
    });

    /**
     * @tc.name   FunctionTest0094
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0094
     * @tc.desc   Parameter destructuring - extract multiple array elements (result check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArr: number[] = [10, 20, 30, 40];
      const GeneratedDestructObj_1 = getArrMultiElemByDestruct(inputArr);
      const first = GeneratedDestructObj_1.first;
      const third = GeneratedDestructObj_1.third;
      expect(Array.isArray(inputArr)).assertTrue();
      expect(first).assertEqual(10);
      expect(third).assertEqual(30);
    });

    /**
     * @tc.name   FunctionTest0095
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0095
     * @tc.desc   Arrow function - triple calculation with single parameter (result check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input: number = 6;
      const result: number = tripleWithArrow(input); // x => x*3
      expect(typeof input === 'number').assertTrue();
      expect(result).assertEqual(18);
    });


    /**
     * @tc.name   FunctionTest0097
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0097
     * @tc.desc   Arrow function - use rest parameters instead of arguments (multiplication)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = multiplyWithArrowRest(2, 3, 5); // ...rest multiplication
      expect(typeof result === 'number').assertTrue();
      expect(result).assertEqual(30); //2*3*5
    });

    /**
     * @tc.name   FunctionTest0098
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0098
     * @tc.desc   Arrow function - no prototype property (characteristic check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const hasNoPrototype: boolean = checkArrowNoPrototype();
      expect(hasNoPrototype).assertTrue();
    });

    /**
     * @tc.name   FunctionTest0100
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0100
     * @tc.desc   Predefined functions - isNaN vs Number.isNaN check (strictness comparison)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const isNaN1: boolean = checkNaNValue('abc'); // non-strict isNaN (returns true)
      const isNaN2: boolean = Number.isNaN('abc'); // strict isNaN (returns false)
      expect(isNaN1).assertTrue();
      expect(isNaN2).assertFalse();
    });

    /**
     * @tc.name   FunctionTest0101
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0101
     * @tc.desc   Function declaration - Calculate the fourth power of a number (parameters passed by value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input: number = 3;
      const result: number = calcQuartic(input);
      const isInputValid: boolean = typeof input === 'number' && Number.isFinite(input);
      expect(isInputValid).assertTrue();
      expect(result).assertEqual(81); // 3^4
    });

    /**
     * @tc.name   FunctionTest0102
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0102
     * @tc.desc   Anonymous function expression - Modulus of two numbers (explicit parameter types)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 17, b: number = 5;
      const result: number = modTwoNum(a, b);
      const isParamsValid: boolean = typeof a === 'number' && typeof b === 'number' && b !== 0;
      expect(isParamsValid).assertTrue();
      expect(result).assertEqual(2); // 17%5
    });

    /**
     * @tc.name   FunctionTest0103
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0103
     * @tc.desc   Named function expression - Exponentiation of two numbers (non-negative base check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = 4, exponent: number = 3;
      const result: number = powTwoNum(base, exponent);
      const isBaseValid: boolean = base >= 0;
      expect(isBaseValid).assertTrue();
      expect(result).assertEqual(64); // 4^3
    });

    /**
     * @tc.name   FunctionTest0106
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0106
     * @tc.desc   Array parameters - Extract elements (reference passing check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArr: number[] = [1, 2, 3, 4, 5];
      const start: number = 1, end: number = 3;
      const slicedArr: number[] = sliceArrElem(inputArr, start, end);
      expect(Array.isArray(slicedArr)).assertTrue();
      expect(slicedArr).assertContain(2); // [2,3]
    });

    /**
     * @tc.name   FunctionTest0107
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0107
     * @tc.desc   Function declaration - Return fixed array without parameters (type check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number[] = getFixedArray();
      const isResultValid: boolean = Array.isArray(result);
      expect(isResultValid).assertTrue();
      expect(result).assertContain(10); // [5,10,15]
    });

    /**
     * @tc.name   FunctionTest0108
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0108
     * @tc.desc   Anonymous function expression - String padding at the beginning (result check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = '5', length: number = 3, padStr: string = '0';
      const result: string = strPadStart(str, length, padStr);
      expect(typeof result === 'string').assertTrue();
      expect(result).assertEqual('005');
    });

    /**
     * @tc.name   FunctionTest0109
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0109
     * @tc.desc   Named function expression - Triangular number calculation (nth term)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input: number = 5; // Triangular numbers: 1,3,6,10,15 (5th term is 15)
      const result: number = numTriangular(input);
      const isInputValid: boolean = typeof input === 'number' && input >= 1;
      expect(isInputValid).assertTrue();
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   FunctionTest0111
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0111
     * @tc.desc   Function declaration hoisting - Call before declaration (triangular number result)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input: number = 6; // 6th term is 21
      const result: number = triangularHoisted(input);
      expect(typeof result === 'number').assertTrue();
      expect(result).assertEqual(21);
    });

    /**
     * @tc.name   FunctionTest0112
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0112
     * @tc.desc   Function expression - Multiple calls after definition (result consistency)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const GeneratedDestructObj_1 = checkExprCallAfterDefine(4, 2);
      const call1 = GeneratedDestructObj_1.call1;
      const call2 = GeneratedDestructObj_1.call2;
      expect(call1 === call2).assertTrue();
      expect(call1).assertEqual(2); // 4/2
    });

    /**
     * @tc.name   FunctionTest0114
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0114
     * @tc.desc   apply method - Pass array parameters for division (result check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArr: number[] = [20, 4, 5];
      const result: number = divideWithApply(inputArr);
      expect(Array.isArray(inputArr)).assertTrue();
      expect(result).assertEqual(1); // 20/4/5
    });

    /**
     * @tc.name   FunctionTest0115
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0115
     * @tc.desc   Recursive call - Factorial with offset value (result check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input: number = 3, offset: number = 2;
      const result: number = factorialRecursiveWithOffset(input, offset);
      expect(typeof result === 'number').assertTrue();
      expect(result).assertEqual(60); // (3+2)! / 2! = 120/2=60 (offset logic: (n+offset)! / offset!)
    });

    /**
     * @tc.name   FunctionTest0116
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0116
     * @tc.desc   Function hoisting + nested default parameters - Call before declaration (default value takes effect)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input: number = 1;
      const result: number = addWithDefaultHoistNested(input); // Default b={c:2,d:3}, total 1+2+3=6
      expect(typeof result === 'number').assertTrue();
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   FunctionTest0118
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0118
     * @tc.desc   apply method - Nested array parameters (result check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArr: (number | number[])[] = [2, [3, 4]];
      const result: number = divideWithApply(inputArr as number[]);
      expect(Array.isArray(inputArr)).assertTrue();
      expect(result).assertEqual(1 / 6);
    });

    /**
     * @tc.name   FunctionTest0119
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0119
     * @tc.desc   Function scope - Inner variable shadows outer variable (value check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const isShadowed: boolean = checkInnerVarShadow();
      expect(isShadowed).assertTrue();
    });

    /**
     * @tc.name   FunctionTest0120
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0120
     * @tc.desc   Nested function - Access outer variable after shadowing (result check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10, b: number = 20;
      const result: number = getOuterVarInNestedShadow(a, b);
      expect(typeof result === 'number').assertTrue();
      expect(result).assertEqual(30); // After shadowing, inner variables a=5, b=25, total 30
    });

    /**
     * @tc.name   FunctionTest0122
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0122
     * @tc.desc   Scope conflict - Innermost layer takes effect after multi-level shadowing (result check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const outerVar: number = 100;
      const result: number = getInnerVarConflictShadow(outerVar); // Innermost x=5
      expect(typeof outerVar === 'number').assertTrue();
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   FunctionTest0123
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0123
     * @tc.desc   Scope conflict - Multi-level shadowing overrides global (result check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      globalThis.appVal = 500;
      const result: number = getInnerVarOverGlobalShadow(); // Innermost appVal=10
      expect(typeof globalThis.appVal === 'number').assertTrue();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   FunctionTest0124
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0124
     * @tc.desc   Scope - Nested function modifies outer array (reference passing check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const outerArr: number[] = [1, 2, 3];
      const modifyArr = (arr: number[]): void => {
        arr[0] = 10;
      };
      modifyArr(outerArr);
      const isArrChanged: boolean = outerArr[0] === 10;
      expect(isArrChanged).assertTrue();
    });

    /**
     * @tc.name   FunctionTest0126
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0126
     * @tc.desc   Basic closure - Negative step counter (decrement on multiple calls)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const counter: () => number = createCounterClosureNegStep(10, 2); // Initial 10, step -2
      const firstVal: number = counter();
      const secondVal: number = counter();
      expect(typeof counter === 'function').assertTrue();
      expect(firstVal).assertEqual(10);
      expect(secondVal).assertEqual(8);
    });

    /**
     * @tc.name   FunctionTest0127
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0127
     * @tc.desc   Multi-level closure - Sum of five-layer variables (closure preservation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sumFunc: () => number = sumFiveLayerClosure(3, 4, 5, 6, 7);
      const result: number = sumFunc();
      expect(typeof sumFunc === 'function').assertTrue();
      expect(result).assertEqual(25); //3+4+5+6+7
    });

    /**
     * @tc.name   FunctionTest0128
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0128
     * @tc.desc   Closure encapsulation - Counter with upper limit (stop incrementing when exceeding limit)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const counter = createCounterObjWithLimit(5); // Upper limit 5
      counter.increment();
      counter.increment();
      counter.increment(); // Now 3, not exceeding limit
      counter.increment();
      counter.increment();
      counter.increment(); // Now 5, stop incrementing after exceeding limit
      const count: number = counter.getCount();
      expect(typeof counter.increment === 'function').assertTrue();
      expect(count).assertEqual(5);
    });

    /**
     * @tc.name   FunctionTest0129
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0129
     * @tc.desc   Closure preserving array - Remove first element (reference passing)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const initArr: number[] = [10, 20, 30];
      const shiftFunc: () => number[] = shiftArrInClosure(initArr);
      const updatedArr: number[] = shiftFunc();
      expect(Array.isArray(updatedArr)).assertTrue();
      expect(updatedArr[0]).assertEqual(20); // Remove 10, result [20,30]
    });

    /**
     * @tc.name   FunctionTest0130
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0130
     * @tc.desc   Closure preserving object - Modify nested property (reference passing)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const initObj: UserObj = { user: { age: 25 } };
      type UpdateFuncType = (val: number) => UserObj;
      const updateFunc: UpdateFuncType = updateObjNestedInClosure(initObj);
      const updatedObj = updateFunc(5);
      expect(typeof updatedObj === 'object' && updatedObj !== null).assertTrue();
      expect(updatedObj.user.age).assertEqual(30); // 25+5
    });

    /**
     * @tc.name   FunctionTest0131
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0131
     * @tc.desc   Multiple closure instances - Four independent counters (no interference)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const counters: FourCounters = createFourCounterClosure();
      const val1: number = counters.counter1();
      const val2: number = counters.counter2();
      const val3: number = counters.counter3();
      const val4: number = counters.counter4();
      expect(typeof counters.counter1 === 'function').assertTrue();
      expect(val1).assertEqual(1);
      expect(val2).assertEqual(1);
      expect(val3).assertEqual(1);
      expect(val4).assertEqual(1);
    });

    /**
     * @tc.name   FunctionTest0132
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0132
     * @tc.desc   Closure handling numbers - Accumulative sum (multiple calls)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sumFunc: (n: number) => number = (() => {
        let total: number = 0;
        return (n: number): number => {
          total += n;
          return total;
        };
      })();
      const firstRes: number = sumFunc(5);
      const secondRes: number = sumFunc(3);
      expect(typeof sumFunc === 'function').assertTrue();
      expect(firstRes).assertEqual(5);
      expect(secondRes).assertEqual(8);
    });

    /**
     * @tc.name   FunctionTest0134
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0134
     * @tc.desc   arguments object - Access parameters in specified range by index (sum)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 2, b: number = 3, c: number = 4, d: number = 5;
      const result: number = getArgByIndexRange(a, b, c, d, 1, 3); // Take indices 1-3 (3,4,5) for sum
      expect(typeof result === 'number').assertTrue();
      expect(result).assertEqual(12);
    });

    /**
     * @tc.name   FunctionTest0135
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0135
     * @tc.desc   arguments object - Maximum parameter count check (length upper limit)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const args: number[] = new Array(10).fill(1); // 10 parameters
      const length: number = getArgLengthMax(...args);
      expect(Array.isArray(args)).assertTrue();
      expect(length).assertEqual(10);
    });

    /**
     * @tc.name   FunctionTest0136
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0136
     * @tc.desc   arguments object - Convert to key-value pair object (result check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const keys: string[] = ['a', 'b', 'c'];
      const values: number[] = [10, 20, 30];
      const result: Record<string, number> = convertArgsToObj(keys, values);
      expect(typeof result === 'object' && result !== null).assertTrue();
      expect(result.a).assertEqual(10);
    });

    /**
     * @tc.name   FunctionTest0137
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0137
     * @tc.desc   arguments object - Handle indefinite parameters (continuous division)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const args: number[] = [100, 2, 5, 5];
      const result: number = divideAllArgs(...args);
      expect(Array.isArray(args)).assertTrue();
      expect(result).assertEqual(2); // 100/2/5/5
    });

    /**
     * @tc.name   FunctionTest0138
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0138
     * @tc.desc   arguments object - Non-array characteristics (no shift method)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const isShiftFailed: boolean = checkArgsNoShift(1, 2, 3);
      expect(isShiftFailed).assertTrue();
    });

    /**
     * @tc.name   FunctionTest0139
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0139
     * @tc.desc   Default parameters - Basic exponentiation characteristics (use default value when no parameter is passed)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input: number = 3;
      const result: number = powWithDefault(input); // Default exponent=2
      expect(typeof input === 'number').assertTrue();
      expect(result).assertEqual(9); //3^2
    });

    /**
     * @tc.name   FunctionTest0140
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0140
     * @tc.desc   Default parameters - Pass undefined to trigger default for exponentiation (value check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = powWithUndefinedDefault(undefined); // Default base=2, exponent=3
      expect(typeof result === 'number').assertTrue();
      expect(result).assertEqual(8); //2^3
    });

    /**
     * @tc.name   FunctionTest0141
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0141
     * @tc.desc   Rest parameters - Collect mixed number and string parameters (array characteristics)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const restArr: (number | string)[] = collectRestArgsNumStr(1, 'a', 2, 'b');
      expect(Array.isArray(restArr)).assertTrue();
      expect(restArr.length).assertEqual(4);
    });

    /**
     * @tc.name   FunctionTest0142
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0142
     * @tc.desc   Default + rest parameters - Mixed exponentiation (result check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = powDefaultAndRest(2, 3, 2); // Default base=1, rest=[3,2], i.e., 2^(3*2)=2^6=64
      expect(typeof result === 'number').assertTrue();
      expect(result).assertEqual(64);
    });

    /**
     * @tc.name   FunctionTest0143
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0143
     * @tc.desc   Parameter destructuring - Nested object property extraction (result check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputObj: InputObj = {
        data: { user: { name: 'Frank' } }
      };
      const result: string = getObjNestedPropByDestruct(inputObj);
      expect(typeof inputObj === 'object' && inputObj !== null).assertTrue();
      expect(result).assertEqual('Frank');
    });

    /**
     * @tc.name   FunctionTest0144
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0144
     * @tc.desc   Parameter destructuring - Nested array element extraction (result check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const result: number = getArrNestedElemByDestruct(inputArr); // Extract [1,2][1] = 2
      expect(Array.isArray(inputArr)).assertTrue();
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   FunctionTest0145
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0145
     * @tc.desc   Arrow function - Fourth power calculation with single parameter (result check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input: number = 2;
      const result: number = quadWithArrow(input); // x => x**4
      expect(typeof input === 'number').assertTrue();
      expect(result).assertEqual(16); //2^4
    });

    /**
     * @tc.name   FunctionTest0147
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0147
     * @tc.desc   Arrow function - Use rest parameters instead of arguments (continuous division)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = divideWithArrowRest(80, 2, 4, 5); // ...rest continuous division
      expect(typeof result === 'number').assertTrue();
      expect(result).assertEqual(2); //80/2/4/5
    });

    /**
     * @tc.name   FunctionTest0148
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0148
     * @tc.desc   Arrow function - No arguments object (characteristic check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const hasNoArguments: boolean = checkArrowNoArguments(1, 2, 3);
      expect(hasNoArguments).assertFalse();
    });

    /**
     * @tc.name   FunctionTest0150
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0150
     * @tc.desc   Predefined function - isFinite checks for infinite values (boundary judgment)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const isInfinite1: boolean = checkInfiniteValue(Infinity); // Infinite value returns false
      const isInfinite2: boolean = checkInfiniteValue(100); // Finite value returns true
      expect(isInfinite1 === false).assertTrue();
      expect(isInfinite2).assertTrue();
    });
  })
}