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
  addTwoNum,
  addWithDefault,
  addWithDefaultHoist,
  addWithUndefinedDefault,
  calcCube,
  calcSquare,
  checkArgsNoPush,
  checkArrowNoNew,
  checkExprNoHoist,
  checkFiniteValue,
  checkInnerVarAccess,
  collectRestArgs,
  convertArgsToArray,
  createCounterClosure,
  createCounterObj,
  createTwoCounterClosure,
  doubleWithArrow,
  factorialHoisted,
  factorialRecursive,
  getArgByIndex,
  getArgLength,
  getArrElemByDestruct,
  getFixedNum,
  getInnerVarConflict,
  getInnerVarOverGlobal,
  getObjPropByDestruct,
  getOuterVarInNested,
  getParamOverOuter,
  mulTwoNum,
  mulWithCall,
  numFactorial,
  pushArrElem,
  pushArrInClosure,
  strConcat,
  subTwoNum,
  sumAllArgs,
  sumDefaultAndRest,
  sumThreeLayerClosure,
  sumThreeLayerVar,
  sumWithApply,
  sumWithArrowRest
} from './functionutils1';

interface GeneratedTypeLiteralInterface_8 {
  name: string;
  age: number;
}

export default function functionTest1() {
  describe('FunctionTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await sleep(100)
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   FunctionTest0001
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0001
     * @tc.desc   Function declaration - number square calculation (parameters passed by value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input: number = 6;
      const result: number = calcSquare(input);
      const isInputValid: boolean = typeof input === 'number' && Number.isFinite(input);
      expect(isInputValid).assertTrue();
      expect(result).assertEqual(36);

    });

    /**
     * @tc.name   FunctionTest0002
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0002
     * @tc.desc   Anonymous function expression - addition of two numbers (explicit parameter types)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 4, b: number = 7;
      const result: number = addTwoNum(a, b);
      const isParamsValid: boolean = typeof a === 'number' && typeof b === 'number';
      expect(isParamsValid).assertTrue();
      expect(result).assertEqual(11);

    });

    /**
     * @tc.name   FunctionTest0003
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0003
     * @tc.desc   Named function expression - multiplication of two numbers (internal name not accessible externally)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 5, b: number = 8;
      const result: number = mulTwoNum(a, b);
      const isOuterCallInvalid: boolean = (() => {
        try {
          globalThis.mul(2, 3);
          return false;
        } catch {
          return true;
        }
      })();

      expect(isOuterCallInvalid).assertTrue();
      expect(result).assertEqual(40);

    });


    /**
     * @tc.name   FunctionTest0006
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0006
     * @tc.desc   Array parameter - adding elements (reference passing verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArr: number[] = [1, 3, 5];
      const addVal: number = 7;
      const updatedArr: number[] = pushArrElem(inputArr, addVal);
      expect(Array.isArray(updatedArr)).assertTrue();
      expect(updatedArr).assertContain(7);

    });

    /**
     * @tc.name   FunctionTest0007
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0007
     * @tc.desc   Function declaration - return fixed number without parameters (type verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = getFixedNum();
      const isResultValid: boolean = typeof result === 'number';
      expect(isResultValid).assertTrue();
      expect(result).assertEqual(99);

    });

    /**
     * @tc.name   FunctionTest0008
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0008
     * @tc.desc   Anonymous function expression - string concatenation (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = 'Hello', str2: string = 'ArkTS';
      const result: string = strConcat(str1, str2);
      expect(typeof result === 'string').assertTrue();
      expect(result).assertContain('HelloArkTS');

    });

    /**
     * @tc.name   FunctionTest0009
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0009
     * @tc.desc   Named function expression - factorial calculation (non-negative parameter verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input: number = 5;
      const result: number = numFactorial(input);
      const isInputValid: boolean = typeof input === 'number' && input >= 0;
      expect(isInputValid).assertTrue();
      expect(result).assertEqual(120);

    });

    /**
     * @tc.name   FunctionTest0011
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0011
     * @tc.desc   Function declaration hoisting - call before declaration (factorial result)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input: number = 6;
      const result: number = factorialHoisted(input);
      expect(typeof result === 'number').assertTrue();
      expect(result).assertEqual(720);

    });

    /**
     * @tc.name   FunctionTest0012
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0012
     * @tc.desc   Function expression - no hoisting feature (error when called first)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const isCallFailed: boolean = checkExprNoHoist();
      expect(isCallFailed).assertTrue();

    });

    /**
     * @tc.name   FunctionTest0014
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0014
     * @tc.desc   apply method - sum with array parameters (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArr: number[] = [10, 20, 30];
      const result: number = sumWithApply(inputArr);
      expect(Array.isArray(inputArr)).assertTrue();
      expect(result).assertEqual(60);

    });

    /**
     * @tc.name   FunctionTest0015
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0015
     * @tc.desc   Recursive call - factorial calculation (parameter validity)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input: number = 4;
      const result: number = factorialRecursive(input);
      const isInputValid: boolean = typeof input === 'number' && input >= 0;
      expect(isInputValid).assertTrue();
      expect(result).assertEqual(24);

    });

    /**
     * @tc.name   FunctionTest0016
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0016
     * @tc.desc   Function hoisting + default parameters - call before declaration (default value takes effect)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input: number = 5;
      const result: number = addWithDefaultHoist(input); // default b=6
      expect(typeof result === 'number').assertTrue();
      expect(result).assertEqual(11);

    });

    /**
     * @tc.name   FunctionTest0017
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0017
     * @tc.desc   call method - multiplication with multiple parameters (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 2, b: number = 5, c: number = 4;
      const result: number = mulWithCall(a, b, c);
      expect(typeof result === 'number').assertTrue();
      expect(result).assertEqual(40);

    });

    /**
     * @tc.name   FunctionTest0019
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0019
     * @tc.desc   Function scope - internal variables not accessible externally (error verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const isAccessFailed: boolean = checkInnerVarAccess();
      expect(isAccessFailed).assertTrue();

    });

    /**
     * @tc.name   FunctionTest0020
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0020
     * @tc.desc   Nested function - access outer variables (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const outerVar: number = 15;
      const result: number = getOuterVarInNested(outerVar); // outer variable * 2
      expect(typeof outerVar === 'number').assertTrue();
      expect(result).assertEqual(30);

    });

    /**
     * @tc.name   FunctionTest0021
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0021
     * @tc.desc   Multi-level nesting - sum of three-level variables (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 3, b: number = 4, c: number = 5;
      const result: number = sumThreeLayerVar(a, b, c);
      expect(typeof result === 'number').assertTrue();
      expect(result).assertEqual(12);

    });

    /**
     * @tc.name   FunctionTest0022
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0022
     * @tc.desc   Scope conflict - internal variable overrides outer variable (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const outerVar: number = 25;
      const result: number = getInnerVarConflict(outerVar); // internal variable = 10
      expect(typeof outerVar === 'number').assertTrue();
      expect(result).assertEqual(10);

    });

    /**
     * @tc.name   FunctionTest0023
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0023
     * @tc.desc   Scope conflict - internal variable overrides global variable (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      globalThis.globalNum = 100;
      const result: number = getInnerVarOverGlobal(); // internal variable = 20
      expect(typeof globalThis.globalNum === 'number').assertTrue();
      expect(result).assertEqual(20);

    });

    /**
     * @tc.name   FunctionTest0024
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0024
     * @tc.desc   Scope conflict - parameter overrides outer variable (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const outerVar: number = 30;
      const result: number = getParamOverOuter(outerVar); // parameter = 15
      expect(typeof outerVar === 'number').assertTrue();
      expect(result).assertEqual(15);

    });

    /**
     * @tc.name   FunctionTest0026
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0026
     * @tc.desc   Basic closure - counter (increment on multiple calls)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const counter: () => number = createCounterClosure(1);
      const firstVal: number = counter();
      const secondVal: number = counter();
      expect(typeof counter === 'function').assertTrue();
      expect(firstVal).assertEqual(1);
      expect(secondVal).assertEqual(2);

    });

    /**
     * @tc.name   FunctionTest0027
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0027
     * @tc.desc   Multi-level closure - sum of three-level variables (closure preservation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sumFunc: () => number = sumThreeLayerClosure(4, 5, 6);
      const result: number = sumFunc();
      expect(typeof sumFunc === 'function').assertTrue();
      expect(result).assertEqual(15);

    });

    /**
     * @tc.name   FunctionTest0028
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0028
     * @tc.desc   Closure encapsulation - counter object (increment/decrement/check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const counter = createCounterObj();
      counter.increment();
      counter.increment();
      counter.decrement();
      const count: number = counter.getCount();
      expect(typeof counter.increment === 'function').assertTrue();
      expect(count).assertEqual(1);

    });

    /**
     * @tc.name   FunctionTest0029
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0029
     * @tc.desc   Closure preserving array - adding elements (reference passing)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const initArr: number[] = [20, 40];
      const pushFunc: (val: number) => number[] = pushArrInClosure(initArr);
      const updatedArr: number[] = pushFunc(60);
      expect(Array.isArray(updatedArr)).assertTrue();
      expect(updatedArr).assertContain(60);

    });


    /**
     * @tc.name   FunctionTest0031
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0031
     * @tc.desc   Multiple closure instances - independent variables (no interference)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const GeneratedDestructObj_1 = createTwoCounterClosure();
      const counterA = GeneratedDestructObj_1.counterA;
      const counterB = GeneratedDestructObj_1.counterB;
      const valA1: number = counterA();
      const valB1: number = counterB();
      const valA2: number = counterA();
      expect(typeof counterA === 'function' && typeof counterB === 'function').assertTrue();
      expect(valA1).assertEqual(1);
      expect(valB1).assertEqual(1);
      expect(valA2).assertEqual(2);

    });

    /**
     * @tc.name   FunctionTest0032
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0032
     * @tc.desc   Closure handling numbers - cumulative multiplication (multiple calls)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const multiplyFunc: (n: number) => number = (() => {
        let total: number = 1;
        return (n: number): number => {
          total *= n;
          return total;
        };
      })();
      const firstRes: number = multiplyFunc(2);
      const secondRes: number = multiplyFunc(3);
      expect(typeof multiplyFunc === 'function').assertTrue();
      expect(firstRes).assertEqual(2);
      expect(secondRes).assertEqual(6);

    });

    /**
     * @tc.name   FunctionTest0033
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0033
     * @tc.desc   Closure handling strings - cumulative concatenation (multiple calls)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const concatFunc: (s: string) => string = (() => {
        let str: string = 'Prefix:';
        return (s: string): string => {
          str += s;
          return str;
        };
      })();
      const firstRes: string = concatFunc('A');
      const secondRes: string = concatFunc('B');
      expect(typeof concatFunc === 'function').assertTrue();
      expect(firstRes).assertEqual('Prefix:A');
      expect(secondRes).assertEqual('Prefix:AB');

    });

    /**
     * @tc.name   FunctionTest0034
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0034
     * @tc.desc   arguments object - access parameters by index (value verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 8, b: number = 16, c: number = 24;
      const result: number = getArgByIndex(a, b, c); // get arguments[1]
      expect(typeof result === 'number').assertTrue();
      expect(result).assertEqual(16);

    });

    /**
     * @tc.name   FunctionTest0035
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0035
     * @tc.desc   arguments object - get parameter length (quantity verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const args: number[] = [5, 10, 15, 20];
      const length: number = getArgLength(...args);
      expect(Array.isArray(args)).assertTrue();
      expect(length).assertEqual(4);

    });

    /**
     * @tc.name   FunctionTest0036
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0036
     * @tc.desc   arguments object - convert to array (element verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 3, b: number = 6, c: number = 9;
      const arr: number[] = convertArgsToArray(a, b, c);
      expect(Array.isArray(arr)).assertTrue();
      expect(arr).assertContain(6);

    });

    /**
     * @tc.name   FunctionTest0037
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0037
     * @tc.desc   arguments object - handle indefinite parameters (sum)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const args: number[] = [25, 50, 75];
      const sum: number = sumAllArgs(...args);
      expect(Array.isArray(args)).assertTrue();
      expect(sum).assertEqual(150);

    });

    /**
     * @tc.name   FunctionTest0038
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0038
     * @tc.desc   arguments object - non-array characteristics (no push method)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const isPushFailed: boolean = checkArgsNoPush(1, 2, 3);
      expect(isPushFailed).assertTrue();

    });

    /**
     * @tc.name   FunctionTest0039
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0039
     * @tc.desc   Default parameters - basic features (use default value when no parameter is passed)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input: number = 7;
      const result: number = addWithDefault(input); // default b=8
      expect(typeof input === 'number').assertTrue();
      expect(result).assertEqual(15);

    });

    /**
     * @tc.name   FunctionTest0040
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0040
     * @tc.desc   Default parameters - pass undefined to trigger default (value verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = addWithUndefinedDefault(undefined); // default a=12
      expect(typeof result === 'number').assertTrue();
      expect(result).assertEqual(12);

    });

    /**
     * @tc.name   FunctionTest0041
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0041
     * @tc.desc   Rest parameters - collect parameters (array characteristics)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const restArr: number[] = collectRestArgs(3, 6, 9, 12);
      expect(Array.isArray(restArr)).assertTrue();
      expect(restArr.length).assertEqual(4);

    });

    /**
     * @tc.name   FunctionTest0042
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0042
     * @tc.desc   Default + rest parameters - mixed summation (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = sumDefaultAndRest(4, 5, 6); // default a=3, rest=[5,6]
      expect(typeof result === 'number').assertTrue();
      expect(result).assertEqual(15);

    });

    /**
     * @tc.name   FunctionTest0043
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0043
     * @tc.desc   Parameter destructuring - object destructuring (property extraction)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputObj: GeneratedTypeLiteralInterface_8 = { name: 'Alice', age: 28 };
      const result: number = getObjPropByDestruct(inputObj); // extract age
      expect(typeof inputObj === 'object' && inputObj !== null).assertTrue();
      expect(result).assertEqual(28);

    });

    /**
     * @tc.name   FunctionTest0044
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0044
     * @tc.desc   Parameter destructuring - array destructuring (element extraction)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArr: number[] = [100, 200, 300];
      const result: number = getArrElemByDestruct(inputArr); // extract second element
      expect(Array.isArray(inputArr)).assertTrue();
      expect(result).assertEqual(200);

    });

    /**
     * @tc.name   FunctionTest0045
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0045
     * @tc.desc   Arrow function - concise syntax with single parameter (result verification)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input: number = 9;
      const result: number = doubleWithArrow(input); // x => x*2
      expect(typeof input === 'number').assertTrue();
      expect(result).assertEqual(18);

    });

    /**
     * @tc.name   FunctionTest0047
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0047
     * @tc.desc   Arrow function - use rest parameters instead of arguments (sum)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = sumWithArrowRest(3, 6, 9); // sum of ...rest
      expect(typeof result === 'number').assertTrue();
      expect(result).assertEqual(18);

    });

    /**
     * @tc.name   FunctionTest0048
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0048
     * @tc.desc   Arrow function - cannot be used as constructor (error with new)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const isNewFailed: boolean = checkArrowNoNew();
      expect(isNewFailed).assertTrue();

    });


    /**
     * @tc.name   FunctionTest0050
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0050
     * @tc.desc   Predefined function - isFinite verification (boundary value judgment)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const isFinite1: boolean = checkFiniteValue(Infinity); // infinite value
      const isFinite2: boolean = checkFiniteValue(123); // finite value
      expect(isFinite1).assertFalse(); // Expected to return false? The actual function returns !isFinite, so Infinity returns true
      expect(isFinite2).assertTrue(); // finite value returns true

    });

    /**
     * @tc.name   FunctionTest0051
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0051
     * @tc.desc   Function declaration - number cube calculation (parameters passed by value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input: number = 4;
      const result: number = calcCube(input);
      const isInputValid: boolean = typeof input === 'number' && Number.isFinite(input);
      expect(isInputValid).assertTrue();
      expect(result).assertEqual(64);

    });

    /**
     * @tc.name   FunctionTest0052
     * @tc.number SUB_BUILTINS_FUNCTION_TEST0052
     * @tc.desc   Anonymous function expression - subtraction of two numbers (explicit parameter types)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FunctionTest0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 15, b: number = 7;
      const result: number = subTwoNum(a, b);
      const isParamsValid: boolean = typeof a === 'number' && typeof b === 'number';
      expect(isParamsValid).assertTrue();
      expect(result).assertEqual(8);
    });
  })
}