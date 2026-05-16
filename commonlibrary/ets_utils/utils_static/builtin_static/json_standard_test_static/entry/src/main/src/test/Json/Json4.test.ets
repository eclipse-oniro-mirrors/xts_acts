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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

class Test3_Obj1 {
  value: string = '';
}

class RootNestedReplaceObj {
  container: Test3_Obj1 = { value: '' };
}

class Test3_Obj3 {
  value: number;
}

class Test3_Obj2 {
  container: Test3_Obj3 = { value: 1 };
}

class TypePreserveObj {
  num: number;
  str: string = '';
  bool?: boolean = false;
  nil?: null;
}

class Test6_Obj2 {
  c: number;
}

class Test6_Obj1 {
  b: Test6_Obj2 = { c: 1 };
}

class DeepKeyConflictObj {
  a: Test6_Obj1 = { b: { c: 1 } };
}

class Test10_Obj2 {
  city: string = '';
  street?: string = '';
}

class Test10_Obj1 {
  address: Test10_Obj2 = { city: '', street: '' };
}

class PathFilterObj {
  user: Test10_Obj1 = { address: { city: '', street: '' } };
}

class Test11_Obj1 {
  id: number;
  active: boolean = false;
}

class ArrWithObj {
  items: Test11_Obj1[] = [];
}

class Test14_Obj1 {
  a: number;
  b: number;
}

class Test14_Obj2 extends Test14_Obj1 {
  sum: number;
}

class StrTruncateObj {
  shortTest: string = '';
  longTest: string = '';
}

class Test17_Obj1 {
  id: number;
  value: number;
}

class FilteredObjArr {
  data: Test17_Obj1[] = [];
}

class Test19_Obj1 {
  level2: string = '';
}

class NestedNewlineObj {
  level1: Test19_Obj1 = { level2: '' };
}

class RenamePropObj {
  newKey: string = '';
}

class Test20_Obj1 {
  oldKey: string = '';
}

class Test20_Obj2 {
  temp: string = '';
}

type SpecialCharArr = (string | string[])[];

class CharTypeCountCompare {
  strings: string[] = [];
  typesCount: number[] = [];
}

class MultiLangObj {
  en: string = '';
  zh: string = '';
  ja: string = '';
}

class ProductCompare {
  numbers: number[] = [];
  product: number;
}

type NestedNumberArray = number | NestedNumberArray[];

class SensitiveDataObj {
  username: string = '';
  password?: string = '';
  email: string = '';
}

class Test35_Obj2 {
  token?: string = '';
  role: string = '';
}

class Test35_Obj1 {
  name: string = '';
  auth: Test35_Obj2 = { token: '', role: '' };
}

class DeepSensitiveObj {
  user: Test35_Obj1 = { name: '', auth: { token: '', role: '' } };
}

class Test39_Obj1 {
  event: string = '';
  time: number;
}

class DateToTimestampObj {
  logs: Test39_Obj1[] = [];
}

class Test39_Obj3 {
  event: string = '';
  time: string = '';
}

class Test39_Obj2 {
  logs: Test39_Obj3[] = [];
}

class ValidatedObj {
  score: number;
}

type UserMapArray = Map<string, string>[];

class Test44_Obj1 {
  id: string = '';
  name: string = '';
}

class Test45_Obj1 {
  id: number;
  name: string = '';
}

class UniqueObjArr {
  items: Test45_Obj1[] = [];
}

class Test45_Obj2 {
  id: number;
}

class EncryptedObj {
  username: string = '';
  email: string = '';
}

class Test50_Obj2 {
  key232: number;
}

class Test50_Obj1 {
  key401: string = '';
  level2: Test50_Obj2 = { key232: 1 };
}

class DeepSpecialCharObj {
  level1: Test50_Obj1 = { key401: '', level2: { key232: 1 } };
}

class EmptyArrFilterObj {
  valid: number[] = [];
  empty?: never[] = [];
}

class ExtractNumbersSumCompare {
  strings: string[] = [];
  sum: number;
}

enum EnumStatus {
  Active = "ACTIVE",
  Inactive = "INACTIVE"
}

class EnumMapObj {
  enumStatus: EnumStatus = EnumStatus.Active;
}

class MultiPunctObj {
  en: string = '';
  de: string = '';
  fr: string = '';
}

class PropLimitObj {
  a: number;
  b: number;
  c?: number;
}

class MatrixObj {
  rows: number;
  cols: number;
  data: number[][] = [];
}

class LengthValidatedObj {
  codes: string[] = [];
}

class Test60_Obj1 {
  id: number;
  name: string = '';
  password?: string = '';
}

class ArrSensitiveObj {
  users: Test60_Obj1[] = [];
}

class Test61_Obj1 {
  id: number;
  name: string = '';
}

class Test61_Obj2 {
  email: string = '';
}

class NumToStringObj {
  a: string = '';
  b: string = '';
  c: string = '';
}

class Test64_Obj3 {
  name: string = '';
  time: Date = new Date();
}

class Test64_Obj2 {
  events: Test64_Obj3[] = [];
}

class DeepDateObj {
  logs: Test64_Obj2[] = [];
}

class FilteredArrObj {
  numbers: number[] = [];
}


class MaskedObj {
  phone: string = '';
  email: string = '';
}

class StatsObj {
  data: number[] = [];
  sum: number;
  avg: number;
  max: number;
}

type DeepSpecialArr = (string | string[][])[];

class Test73_Obj2 {
  valid: number[] = [];
  empty?: never[] = [];
}

class Test73_Obj1 {
  level2: Test73_Obj2[] = [];
}

class DeepEmptyArrFilterObj {
  level1: Test73_Obj1 = { level2: [] };
}

class CircularSafeObj {
  name: string = '';
  parent?: CircularSafeObj;
}

class MixedTypeKeyObj {
  a: string = '';
}

type MultiLangArr = (string | string[])[];

class Test78_Obj2 {
  level3?: string = '';
}

class Test78_Obj1 {
  level2: Test78_Obj2 = { level3: '' };
}

class FirstGreaterCompare {
  numbers: number[] = [];
  target: number;
  result: number | null = 1;
}

class TransposedMatrixObj {
  transposed: number[][] = [];
}

class StdDevCompare {
  numbers: number[] = [];
  stdDev: number;
}

class RemoveElementCompare {
  strings: string[] = [];
  cleaned: string[] = [];
}

class SpecialNumFilterObj {
  nan: null = null;
  inf: null = null;
  normal: number;
}

class Test83_Obj2 {
  inf: null = null;
  num: number;
}

class Test83_Obj1 {
  nan: null = null;
  level2: Test83_Obj2 = { inf: null, num: 1 };
}

class DeepSpecialNumObj {
  level1: Test83_Obj1 = { nan: null, level2: { inf: null, num: 1 } };
}

class GradeConvertCompare {
  scores: number[] = [];
  grades: string[] = [];
}


class StrLengthFilterObj {
  longTest: string = '';
  shortTest?: string = '';
}

class Test87_Obj2 {
  value: number;
}

class Test87_Obj1 {
  items: Test87_Obj2[] = [];
  total: number;
}

class DeepAggregateObj {
  groups: Test87_Obj1[] = [];
}

class EmptyStrArrFilterObj {
  tags: string[] = [];
}

class PalindromeCheckCompare {
  strings: string[] = [];
  isPalindrome: boolean[] = [];
}

class MaxSubarrayCompare {
  numbers: number[] = [];
  maxSum: number;
}

class SubstringConcatCompare {
  strings: string[] = [];
  result: string = '';
}


class KeywordArrObj {
  values: (boolean | null)[] = [];
}

class Test96_Obj2 {
  cxToAd: number;
}

class Test96_Obj1 {
  axToBb: string = '';
  nested: Test96_Obj2 = { cxToAd: 1 };
}

class MathSymbolObj {
  formulas: Test96_Obj1 = { axToBb: '', nested: { cxToAd: 1 } };
}

class Test97_Obj1 {
  level2: string[] = [];
}

class DeepEmptyStrFilterObj {
  level1: Test97_Obj1[] = [];
}

enum Priority {
  Low = 1,
  Medium = 2,
  High = 3
}

class Test99_Obj2 {
  name: string = '';
  priority: Priority = Priority.Low;
}

class PriorityMapObj {
  tasks: Test99_Obj2[] = [];
}

class MultiBracketObj {
  text: string = '';
}

class ValueClampObj {
  score: number;
  age: number;
}

class Flatten3DObj {
  flattened: number[] = [];
}

type DeepZeroWidthArr = (string | string[][])[];

class Test104_Obj2 {
  valid: string = '';
  undef?: undefined = undefined;
}

class Test104_Obj1 {
  level2: Test104_Obj2 = { valid: '', undef: undefined };
}

class DeepUndefinedFilterObj {
  level1: Test104_Obj1 = { level2: { valid: '', undef: undefined } };
}

class MultiReplaceCompare {
  strings: string[] = [];
  replaced: string[] = [];
}

class VowelRatioCompare {
  strings: string[] = [];
  ratios: number[] = [];
}

class Test109_Obj1 {
  id: string = '';
  age: number;
}

class DeepPropConvertObj {
  users: Test109_Obj1[] = [];
}

class Test110_Obj1 {
  id: number;
  name: string = '';
}

class UniqueDeepObjArr {
  items: Test110_Obj1[] = [];
}

class AbsoluteDiffsCompare {
  numbers: number[] = [];
  diffs: number[] = [];
}

class Test113_Obj1 {
  value: number;
}

class SumAvgCompare {
  data: Test113_Obj1[] = [];
  sum: number;
  avg: number;
}

type MixedSpecialArr = (string | string[][])[];

class PartialMaskObj {
  cardNumber: string = '';
  phone: string = '';
}

class Test116_Obj1 {
  id: number;
  diff: number;
}

class DiffObj {
  changes: Test116_Obj1[] = [];
}

class Test117_Obj2 {
  formula: string = '';
  variables: string[] = [];
}

class Test117_Obj1 {
  linear: string = '';
  quadratic: Test117_Obj2 = { formula: '', variables: [] };
}

class MathFormulaObj {
  equations: Test117_Obj1 = { linear: '', quadratic: { formula: '', variables: [] } };
}

class Test118_Obj2 {
  valid: number[] = [];
  empty: never[] = [];
}

class Test118_Obj1 {
  level2: Test118_Obj2[] = [];
}

class DeepEmptyArrCleanObj {
  level1: Test118_Obj1 = { level2: [] };
}

class BinaryOneCountCompare {
  numbers: number[] = [];
  counts: number[] = [];
}

class VowelSortCompare {
  words: string[] = [];
  sorted: string[] = [];
}

class MultiQuoteObj {
  text: string = '';
}

class Test124_Obj2 {
  keyx: number;
}

class Test124_Obj1 {
  keyy: string = '';
  level2: Test124_Obj2 = { keyx: 1 };
}

class DeepZeroWidthObj {
  level1: Test124_Obj1 = { keyy: '', level2: { keyx: 1 } };
}

class Test126_Obj2 {
  sku: string = '';
}

class Test126_Obj1 {
  id: number;
  details: Test126_Obj2 = { sku: '' };
}

class DeepUniqueObjArr {
  products: Test126_Obj1[] = [];
}

class Test128_Obj1 {
  message: string = '';
  timestamp: number;
}

class ApiResponse {
  code: number;
  data: Test128_Obj1 = { message: '', timestamp: 1 };
}

class RegexFilterObj {
  email: string = '';
  phone?: string = '';
}

class UpperCountCompare {
  strings: string[] = [];
  counts: number[] = [];
}

class CubeRootCompare {
  numbers: number[] = [];
  roots: number[] = [];
}

class FibIndexCompare {
  indices: number[] = [];
  fibValues: number[] = [];
}

class Test132_Obj1 {
  id: number;
  name: string = '';
}

class ValidObjFilterArr {
  users: Test132_Obj1[] = [];
}

class Test133_Obj2 {
  active: boolean = false;
}

class Test133_Obj1 {
  id: number;
  details: Test133_Obj2 = { active: false };
}

class SetToObjArrDeep {
  items: Test133_Obj1[] = [];
}

class Test134_Obj1 {
  category: string = '';
}

class UniquePropsCompare {
  items: Test134_Obj1[] = [];
  uniqueCategories: string[] = [];
}

class Test135_Obj1 {
  text: string = '';
}

class NestedControlCharObj {
  level1: Test135_Obj1 = { text: '' };
}


class FirstLettersConcatCompare {
  words: string[] = [];
  acronym: string = '';
}

class Test137_Obj2 {
  CO2: number;
}

class Test137_Obj1 {
  H2O: string = '';
  nested: Test137_Obj2 = { CO2: 0 };
}

class ChemicalSymbolObj {
  elements: Test137_Obj1 = { H2O: '', nested: { CO2: 0 } };
}

class Test138_Obj2 {
  num: number;
}

class Test138_Obj1 {
  values: Test138_Obj2[] = [];
}

class ValidNumberFilterObj {
  level1: Test138_Obj1 = { values: [] };
}

class Test142_Obj1 {
  value: string = '';
}

class Test142_Obj2 {
  id: number;
}

class ObjectOnlyObj {
  nested: Test142_Obj1 = { value: '' };
  otherObj?: Test142_Obj2 = { id: 0 };
  str?: string = '';
}

class Test143_Obj1 {
  action: string = '';
  time: string = '';
}

class FormattedDateObj {
  logs: Test143_Obj1[] = [];
}

class FactorialCompare {
  numbers: number[] = [];
  results: number[] = [];
}

class RemoveVowelsCompare {
  strings: string[] = [];
  consonants: string[] = [];
}

class TwoSumCompare {
  numbers: number[] = [];
  target: number;
  indices: number[] = [];
}

class MovingAvgCompare {
  numbers: number[] = [];
  window: number;
  averages: number[] = [];
}


class CharCountSortCompare {
  strings: string[] = [];
  sorted: string[] = [];
}

class Test139_Obj2 {
  Dx23: number;
}

class Test139_Obj1 {
  Cx23: string = '';
  nested: Test139_Obj2 = { Dx23: 0 };
}

class MusicSymbolObj {
  notes: Test139_Obj1 = { Cx23: '', nested: { Dx23: 0 } };
}

class Test53_Obj1 {
  enumStatus: string = '';
}

class Test63_Obj1 {
  a: number;
  b: number;
  c: number;
}

class Test64_Obj5 {
  name: string = '';
  time: string = '';
}

class Test64_Obj4 {
  events: Test64_Obj5[] = [];
}

class Test64_Obj1 {
  logs: Test64_Obj4[] = [];
}

class Test68_Obj2 {
  name: string = '';
  price: number;
  inStock: boolean = false;
}

class Test68_Obj1 {
  name: string = '';
  price: number;
  inStock: boolean = false;
}

class MultiFilterCompare {
  products: Test68_Obj2[] = [];
  filtered: Test68_Obj1[] = [];
}

class Test82_Obj1 {
  nan: number;
  inf: number;
  normal: number;
}

class Test83_Obj5 {
  inf: number;
  num: number;
}

class Test83_Obj4 {
  nan: number;
  level2: Test83_Obj5 = { inf: 1, num: 1 };
}

class Test83_Obj3 {
  level1: Test83_Obj4 = { nan: 1, level2: { inf: 1, num: 1 } };
}

class Test87_Obj4 {
  value: number;
}

class Test87_Obj3 {
  items: Test87_Obj4[] = [];
}

class Test87_Obj5 {
  groups: Test87_Obj3[] = [];
}

class FibonacciCompare {
  count: number[] = [];
  sequence: number[] = [];
}


class Test99_Obj3 {
  name: string = '';
  priority: string = '';
}

class Test99_Obj1 {
  tasks: Test99_Obj3[] = [];
}

class Test109_Obj3 {
  id: number;
  age: number;
}

class Test109_Obj2 {
  users: Test109_Obj3[] = [];
}

class Test111_Obj3 {
  id: number;
}

class Test112_Obj1 {
  id: number;
  name: string = '';
}


class Test116_Obj3 {
  id: number;
  old: number;
  newTest: number;
}

class Test116_Obj2 {
  items: Test116_Obj3[] = [];
}

class Test130_Obj6 {
  salary: number;
}

class Test130_Obj5 {
  employees: Test130_Obj6[] = [];
}

class Test130_Obj4 {
  departments: Test130_Obj5[] = [];
}

class Test133_Obj4 {
  active: boolean = false;
}

class Test133_Obj3 {
  id: number;
  details: Test133_Obj4 = { active: false };
}


class Test143_Obj3 {
  action: string = '';
  time: number;
}

class Test143_Obj2 {
  logs: Test143_Obj3[] = [];
}

export default function Json4Test() {

  describe('Json4Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
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
     * @tc.name   Json4Test001
     * @tc.number SUB_BUILTINS_Json4_TEST_0100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidJson: string = "[1,,2]";
      let hasError: boolean = false;

      try {
        JSON.parseJsonElement(invalidJson);
      } catch (error) {
        hasError = error instanceof Error;
      }

      expect(hasError).assertEqual(true);
    });
    /**
     * @tc.name   Json4Test002
     * @tc.number SUB_BUILTINS_Json4_TEST_0200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "Hello 😊 World 🌟";
      const jsonStr: string = JSON.stringify(originalStr);
      let typ: Type = Type.of(new String());
      const parsedStr: string = JSON.parse<string>(jsonStr, typ) as string;

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("😊")).assertEqual(true);
      expect(parsedStr.includes("🌟")).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test003
     * @tc.number SUB_BUILTINS_Json4_TEST_0300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: RootNestedReplaceObj = {
        container: { value: '123' }
      };
      const jsonStr: string = JSON.stringify(originalObj);
      let typ: Type = Type.of(new RootNestedReplaceObj());
      const parsedObj: RootNestedReplaceObj = JSON.parse<RootNestedReplaceObj>(jsonStr, (key: string, value: Any) => {
        if (key === "container") {
          return { value: "replaced" } as Test3_Obj1;
        }
        return value;
      }, typ) as RootNestedReplaceObj;

      expect(parsedObj.container.value).assertEqual("replaced");
      expect(typeof parsedObj.container.value).assertEqual("string");
    });

    /**
     * @tc.name   Json4Test004
     * @tc.number SUB_BUILTINS_Json4_TEST_0400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidJson: string = '{"num": 1e-}';
      let hasError: boolean = false;
      let typ: Type = Type.of(new String());
      try {
        JSON.parse<string>(invalidJson, typ) as string;
      } catch (error) {
        hasError = error instanceof Error;
      }

      expect(hasError).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test006
     * @tc.number SUB_BUILTINS_Json4_TEST_0600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '{"a": {"b": {"c": 1, "c": 2}}}';
      let typ: Type = Type.of(new DeepKeyConflictObj());
      const parsedObj: DeepKeyConflictObj = JSON.parse<DeepKeyConflictObj>(jsonStr, typ) as DeepKeyConflictObj;
      expect(parsedObj.a.b.c).assertEqual(2);
    });

    /**
     * @tc.name   Json4Test012
     * @tc.number SUB_BUILTINS_Json4_TEST_1200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidJson: string = '{"valid": tru}';
      let hasError: boolean = false;
      let typ: Type = Type.of(new String());
      try {
        JSON.parse<string>(invalidJson, typ) as string;
      } catch (error) {
        hasError = error instanceof SyntaxError;
      }
      expect(hasError).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test013
     * @tc.number SUB_BUILTINS_Json4_TEST_1300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "é (e\u0301)";
      const jsonStr: string = JSON.stringify(originalStr);
      let typ: Type = Type.of(new String());
      const parsedStr: string = JSON.parse<string>(jsonStr, typ) as string;

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("é")).assertEqual(true);
      expect(parsedStr.includes("\u0301")).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test014
     * @tc.number SUB_BUILTINS_Json4_TEST_1400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test14_Obj2 = { a: 5, b: 10, sum: 0 };
      const jsonStr: string = JSON.stringify(originalObj);
      let values: Test14_Obj2 = {
        a: 0,
        b: 0,
        sum: 0
      };
      let typ: Type = Type.of(new Test14_Obj2());
      const parsedObj: Test14_Obj2 = JSON.parse<Test14_Obj2>(jsonStr, (key: string, value: Any) => {
        if (key === "a") {
          values.a = value as number;
        }
        if (key === "b") {
          values.b = value as number;
        }
        if (key === "") {
          const obj = value as Test14_Obj1;
          return { a: obj.a, b: obj.b, sum: values.a + values.b } as Test14_Obj2;
        }
        return value;
      }, typ) as Test14_Obj2;
      expect(parsedObj.sum).assertEqual(15);
      expect(parsedObj.sum).assertEqual(parsedObj.a + parsedObj.b);
    });

    /**
     * @tc.name   Json4Test015
     * @tc.number SUB_BUILTINS_Json4_TEST_1500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidJson: string = "[() => {}]";
      let hasError: boolean = false;
      let typ: Type = Type.of(new String());
      try {
        JSON.parse<string>(invalidJson, typ) as string;
      } catch (error) {
        hasError = error instanceof SyntaxError;
      }
      expect(hasError).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test016
     * @tc.number SUB_BUILTINS_Json4_TEST_1600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: StrTruncateObj = {
        shortTest: "hello",
        longTest: "this is a very long string"
      };
      const jsonStr: string = JSON.stringify(originalObj,
        (key: string, value: Any) => typeof value === "string" && (value as string).length > 10 ?
          (value as string).slice(0, 10) : value
      );
      let typ: Type = Type.of(new StrTruncateObj());
      const parsedObj: StrTruncateObj = JSON.parse<StrTruncateObj>(jsonStr, typ) as StrTruncateObj;

      expect(parsedObj.shortTest).assertEqual("hello");
      expect(parsedObj.longTest).assertEqual("this is a ");
      expect(parsedObj.longTest.length).assertEqual(10);
    });

    /**
     * @tc.name   Json4Test018
     * @tc.number SUB_BUILTINS_Json4_TEST_1800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidJson: string = '{"num": ++123}';
      let hasError: boolean = false;
      let typ: Type = Type.of(new String());
      try {
        JSON.parse<string>(invalidJson, typ) as string;
      } catch (error) {
        hasError = error instanceof SyntaxError;
      }

      expect(hasError).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test019
     * @tc.number SUB_BUILTINS_Json4_TEST_1900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: NestedNewlineObj = {
        level1: { level2: "Line1\nLine2\nLine3" }
      };
      const jsonStr: string = JSON.stringify(originalObj);
      let typ: Type = Type.of(new NestedNewlineObj());
      const parsedObj: NestedNewlineObj = JSON.parse<NestedNewlineObj>(jsonStr, typ) as NestedNewlineObj;

      expect(parsedObj.level1.level2).assertEqual("Line1\nLine2\nLine3");
      expect(parsedObj.level1.level2.split("\n").length).assertEqual(3);
    });

    /**
     * @tc.name   Json4Test020
     * @tc.number SUB_BUILTINS_Json4_TEST_2000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test20_Obj2 = { temp: "value" };
      const jsonStr: string = JSON.stringify(originalObj, (key: string, value: Any) => {
        if (key === "temp") {
          return { temp: (value as string) } as Test20_Obj2;
        }
        if (key === "") {
          return { newKey: (value as Test20_Obj2).temp } as RenamePropObj;
        }
        return value;
      });
      let typ: Type = Type.of(new RenamePropObj());
      const parsedObj: RenamePropObj = JSON.parse<RenamePropObj>(jsonStr, typ) as RenamePropObj;

      expect(parsedObj.newKey).assertEqual("value");
    });

    /**
     * @tc.name   Json4Test021
     * @tc.number SUB_BUILTINS_Json4_TEST_2100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[] = ["10", "20", "30"];
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedArr: jsonx.JsonElement = JSON.parseJsonElement(jsonStr,
        (key: string, value: jsonx.JsonElement) => key !== "" && typeof value === "string" ?
          jsonx.JsonElement.createDouble(parseInt(value.asString(), 10)) : value);

      expect(parsedArr[0].asString()).assertEqual('10');
      expect(parsedArr[1].asString()).assertEqual('20');
      expect(typeof parsedArr[0].asString()).assertEqual("string");
    });

    /**
     * @tc.name   Json4Test022
     * @tc.number SUB_BUILTINS_Json4_TEST_2200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const invalidJson: string = '{"a":1}}extra';
        let typ: Type = Type.of(new String());
        JSON.parse<string>(invalidJson, typ) as string;
        expect().assertFail();
      } catch (error) {
      }
    });

    /**
     * @tc.name   Json4Test023
     * @tc.number SUB_BUILTINS_Json4_TEST_2300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: SpecialCharArr = [
        ["!@#", "$%^"],
        ["&*()", "[]{}"]
      ];
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedArr: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      expect(parsedArr[0][0].asString()).assertEqual("!@#");
      expect(parsedArr[1][1].asString()).assertEqual("[]{}");
    });

    /**
     * @tc.name   Json4Test025
     * @tc.number SUB_BUILTINS_Json4_TEST_2500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidJson: string = '{"str": "test"string"}';
      let hasError: boolean = false;
      let typ: Type = Type.of(new String());
      try {
        JSON.parse<string>(invalidJson, typ) as string;
      } catch (error) {
        hasError = error instanceof SyntaxError;
      }

      expect(hasError).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test028
     * @tc.number SUB_BUILTINS_Json4_TEST_2800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidJson: string = "[1, undefined, 3]";
      let hasError: boolean = false;
      let typ: Type = Type.of(new String());
      try {
        JSON.parse<string>(invalidJson, typ) as string;
      } catch (error) {
        hasError = error instanceof SyntaxError;
      }

      expect(hasError).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test029
     * @tc.number SUB_BUILTINS_Json4_TEST_2900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: MultiLangObj = {
        en: "Hello",
        zh: "你好",
        ja: "こんにちは"
      };
      const jsonStr: string = JSON.stringify(originalObj);
      let typ: Type = Type.of(new MultiLangObj());
      const parsedObj: MultiLangObj = JSON.parse<MultiLangObj>(jsonStr, typ) as MultiLangObj;

      expect(parsedObj.en).assertEqual("Hello");
      expect(parsedObj.zh).assertEqual("你好");
      expect(parsedObj.ja).assertEqual("こんにちは");
    });

    /**
     * @tc.name   Json4Test030
     * @tc.number SUB_BUILTINS_Json4_TEST_3000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: number[] = [1, 2, 3, 4, 5];
      const jsonStr: string = JSON.stringify(originalArr, (key: string, value: Any) => {
        if (key === "" && Array.isArray(value) && (value as Array<number>).length > 3) {
          return (value as Array<number>).slice(0, 3);
        }
        return value;
      });
      const parsedArr: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      expect(parsedArr.asArray().length).assertEqual(3);
      expect(parsedArr[0].asDouble()).assertEqual(1);
      expect(parsedArr[2].asDouble()).assertEqual(3);
    });

    /**
     * @tc.name   Json4Test031
     * @tc.number SUB_BUILTINS_Json4_TEST_3100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ProductCompare = { numbers: [2, 3, 4], product: 0 };
      const json = JSON.stringify(obj);
      const parsed: jsonx.JsonElement = JSON.parseJsonElement(json, (k: string, v: jsonx.JsonElement) => {
        if (k === "") {
          let p = 1;
          v['numbers'].asArray().forEach((n: jsonx.JsonElement): void => p *= n.asDouble());
          const original = new jsonx.JsonElement({} as Record<string, jsonx.JsonElement>);
          original.setElement("numbers", v['numbers']);
          original.setElement("product", jsonx.JsonElement.createDouble(p));
          return original;
        }
        return v;
      });
      expect(parsed['product'].asDouble()).assertEqual(24);
    });

    /**
     * @tc.name   Json4Test032
     * @tc.number SUB_BUILTINS_Json4_TEST_3200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidJson: string = '{"num": 123+}';
      let typ: Type = Type.of(new String());
      try {
        JSON.parse<string>(invalidJson, typ) as string;
        expect().assertFail();
      } catch (error) {
      }
    });
    /**
     * @tc.name   Json4Test033
     * @tc.number SUB_BUILTINS_Json4_TEST_3300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "a\u200Cb";
      const jsonStr: string = JSON.stringify(originalStr);
      let typ: Type = Type.of(new String());
      const parsedStr: string = JSON.parse<string>(jsonStr, typ) as string;

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("\u200C")).assertEqual(true);
      expect(parsedStr.length).assertEqual(3);
    });

    /**
     * @tc.name   Json4Test036
     * @tc.number SUB_BUILTINS_Json4_TEST_3600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[] = ["\x01Start", "End\x04"];
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedArr: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      expect(parsedArr[0].asString()).assertEqual("\x01Start");
      expect(parsedArr[1].asString()).assertEqual("End\x04");
      expect(parsedArr[0].asString().charCodeAt(0)).assertEqual(1);
    });

    /**
     * @tc.name   Json4Test038
     * @tc.number SUB_BUILTINS_Json4_TEST_3800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidJson: string = "{key name: 1}";
      let typ: Type = Type.of(new String());
      try {
        JSON.parse<string>(invalidJson, typ) as string;
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("SyntaxError");
        expect(error.message).assertContain('Unexpected char "k" at 1:3');
      }
    });

    /**
     * @tc.name   Json4Test039
     * @tc.number SUB_BUILTINS_Json4_TEST_3900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test39_Obj2 = {
        logs: [
          { event: "login", time: "2024-01-01T00:00:00Z" },
          { event: "logout", time: "2024-01-01T01:00:00Z" }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: jsonx.JsonElement = JSON.parseJsonElement(jsonStr, (key: string, value: jsonx.JsonElement) => {
        if (key === "time") {
          return jsonx.JsonElement.createDouble(new Date(value.asString()).getTime());
        }
        return value;
      });

      expect(parsedObj['logs'][0]['time'].asDouble()).assertEqual(1704067200000);
      expect(parsedObj['logs'][1]['time'].asDouble()).assertEqual(1704070800000);
    });

    /**
     * @tc.name   Json4Test040
     * @tc.number SUB_BUILTINS_Json4_TEST_4000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidJson: string = '{"valid": TRUE}';
      let typ: Type = Type.of(new String());
      try {
        JSON.parse<string>(invalidJson, typ) as string;
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("SyntaxError");
        expect(error.message).assertContain('Unexpected char "T" at 1:12');
      }

    });

    /**
     * @tc.name   Json4Test041
     * @tc.number SUB_BUILTINS_Json4_TEST_4100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "👨‍👩‍👧‍👦 Family: 👨‍💻 Developer";
      const jsonStr: string = JSON.stringify(originalStr);
      let typ: Type = Type.of(new String());
      const parsedStr: string = JSON.parse<string>(jsonStr, typ) as string;
      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("👨‍👩‍👧‍👦")).assertEqual(true);
      expect(parsedStr.includes("👨‍💻")).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test042
     * @tc.number SUB_BUILTINS_Json4_TEST_4200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const validJson: string = '{"score": 85}';
      const invalidJson: string = '{"score": 150}';
      let validResult: ValidatedObj | null = null;
      let invalidError: boolean = false;

      let typ: Type = Type.of(new ValidatedObj());
      validResult = JSON.parse<ValidatedObj | null>(validJson, (key: string, value: Any) => {
        if (key === "score" && (value as number) > 100) {
          throw new Error("Score cannot exceed 100");
        }
        return value;
      }, typ) as ValidatedObj | null;
      let typ2: Type = Type.of(new String());
      try {
        JSON.parse<string>(invalidJson, (key: string, value: Any) => {
          if (key === "score" && (value as number) > 100) {
            throw new Error("Score cannot exceed 100");
          }
          return value;
        }, typ2) as string;
      } catch (error) {
        invalidError = true;
      }
      expect(validResult?.score).assertEqual(85);
      expect(invalidError).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test043
     * @tc.number SUB_BUILTINS_Json4_TEST_4300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {

      const invalidJson: string = "[{\"a\":1}";
      try {
        JSON.parseJsonElement(invalidJson);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("Error");
        expect(error.message).assertContain("Unexpected end of input at 0..0");
      }
    });

    /**
     * @tc.name   Json4Test044
     * @tc.number SUB_BUILTINS_Json4_TEST_4400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CubeRootCompare = { numbers: [8, 27, 64], roots: [] };
      const json = JSON.stringify(obj);
      const parsed: jsonx.JsonElement = JSON.parseJsonElement(json, (k: string, v: jsonx.JsonElement) => {
        if (k === "") {
          const r: jsonx.JsonElement[] = [];
          v['numbers'].asArray()
            .forEach((n: jsonx.JsonElement): void => r.push(jsonx.JsonElement.createDouble(Math.cbrt(n.asDouble()))));
          const original = new jsonx.JsonElement({} as Record<string, jsonx.JsonElement>);
          original.setElement("numbers", v['numbers']);
          original.setElement("roots", jsonx.JsonElement.createArray(r));
          return original;
        }
        return v;
      });
      expect(parsed['roots'][0].asDouble()).assertEqual(2);
      expect(parsed['roots'][1].asDouble()).assertEqual(3);
    });

    /**
     * @tc.name   Json4Test046
     * @tc.number SUB_BUILTINS_Json4_TEST_4600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidJson: string = '{"num": a123}';
      let typ: Type = Type.of(new String());
      try {
        JSON.parse<string>(invalidJson, typ) as string;
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("SyntaxError");
        expect(error.message).assertContain('Unexpected char "a" at 1:10');
      }
    });

    /**
     * @tc.name   Json4Test047
     * @tc.number SUB_BUILTINS_Json4_TEST_4700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "Line1\r\nLine2\nLine3";
      const jsonStr: string = JSON.stringify(originalStr);
      let typ: Type = Type.of(new String());
      const parsedStr: string = JSON.parse<string>(jsonStr, typ) as string;

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.split(new RegExp("\\r?\\n")).length).assertEqual(3);
    });

    /**
     * @tc.name   Json4Test048
     * @tc.number SUB_BUILTINS_Json4_TEST_4800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: EncryptedObj = {
        username: "user456",
        email: "user@example.com"
      };
      const jsonStr: string = JSON.stringify(originalObj,
        (key: string, value: Any) => key === "email" ? (value as string).split("").reverse().join("") : value
      );
      let typ: Type = Type.of(new EncryptedObj());
      const parsedObj: EncryptedObj = JSON.parse<EncryptedObj>(jsonStr,
        (key: string, value: Any) => key === "email" ? (value as string).split("").reverse().join("") : value
        , typ) as EncryptedObj;

      expect(parsedObj.email).assertEqual("user@example.com");
      expect((JSON.parse<EncryptedObj>(jsonStr, typ) as EncryptedObj).email).assertEqual("moc.elpmaxe@resu");
    });

    /**
     * @tc.name   Json4Test050
     * @tc.number SUB_BUILTINS_Json4_TEST_5000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: DeepSpecialCharObj = {
        level1: {
          key401: "value$1",
          level2: { key232: 100 }
        }
      };
      const jsonStr: string = JSON.stringify(originalObj);
      let typ: Type = Type.of(new DeepSpecialCharObj());
      const parsedObj: DeepSpecialCharObj = JSON.parse<DeepSpecialCharObj>(jsonStr, typ) as DeepSpecialCharObj;

      expect(parsedObj.level1.key401).assertEqual("value$1");
      expect(parsedObj.level1.level2.key232).assertEqual(100);
    });

    /**
     * @tc.name   Json4Test051
     * @tc.number SUB_BUILTINS_Json4_TEST_5100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: EmptyArrFilterObj = {
        valid: [1, 2],
        empty: []
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: jsonx.JsonElement = JSON.parseJsonElement(jsonStr,
        (key: string, value: jsonx.JsonElement) => value.jsonType === 2 && value.asArray().length === 0 ?
          jsonx.JsonElement.createUndefined() : value
      );

      expect(parsedObj['valid'].asArray().length).assertEqual(2);
      expect(parsedObj['empty'].jsonType).assertEqual(0);
    });

    /**
     * @tc.name   Json4Test054
     * @tc.number SUB_BUILTINS_Json4_TEST_5400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: MultiPunctObj = {
        en: "Hello! How are you?",
        de: "Hallo! Wie geht es dir?",
        fr: "Bonjour! Comment allez-vous?"
      };
      const jsonStr: string = JSON.stringify(originalObj);
      let typ: Type = Type.of(new MultiPunctObj());
      const parsedObj: MultiPunctObj = JSON.parse<MultiPunctObj>(jsonStr, typ) as MultiPunctObj;

      expect(parsedObj.en).assertEqual("Hello! How are you?");
      expect(parsedObj.de).assertEqual("Hallo! Wie geht es dir?");
      expect(parsedObj.fr).assertEqual("Bonjour! Comment allez-vous?");
    });

    /**
     * @tc.name   Json4Test056
     * @tc.number SUB_BUILTINS_Json4_TEST_5600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedObj: jsonx.JsonElement = JSON.parseJsonElement(jsonStr, (key: string, value: jsonx.JsonElement) => {
        if (key === "") {
          const original = new jsonx.JsonElement({} as Record<string, jsonx.JsonElement>);
          original.setElement("rows", jsonx.JsonElement.createDouble(value.asArray().length));
          original.setElement("cols", jsonx.JsonElement.createDouble(value.asArray()[0].asArray().length || 0));
          original.setElement("data", value);
          return original;
        }
        return value;
      });
      expect(parsedObj['rows'].asDouble()).assertEqual(3);
      expect(parsedObj['cols'].asDouble()).assertEqual(2);
      expect(parsedObj['data'][1][1].asDouble()).assertEqual(4);
    });

    /**
     * @tc.name   Json4Test057
     * @tc.number SUB_BUILTINS_Json4_TEST_5700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[][] = [
        ["a\u200B", "b"],
        ["c", "d\u200B"]
      ];
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedArr: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      expect(parsedArr[0][0].asString()).assertEqual("a\u200B");
      expect(parsedArr[1][1].asString()).assertEqual("d\u200B");
      expect(parsedArr[0][0].asString().includes("\u200B")).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test060
     * @tc.number SUB_BUILTINS_Json4_TEST_6000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: ArrSensitiveObj = {
        users: [
          { id: 1, name: "Dave", password: "pass1" },
          { id: 2, name: "Eve", password: "pass2" }
        ]
      };
      const jsonStr: string =
        JSON.stringify(originalObj, (key: string, value: Any) => key === "password" ? undefined : value);
      const parsedObj: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      expect(parsedObj['users'][0].tryGetElement('password')).assertEqual(undefined);
      expect(parsedObj['users'][1]['name'].asString()).assertEqual("Eve");
    });

    /**
     * @tc.name   Json4Test063
     * @tc.number SUB_BUILTINS_Json4_TEST_6300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: NumToStringObj = { a: '10', b: '20', c: '30' };
      const jsonStr: string = JSON.stringify(originalObj,
        (key: string, value: Any) => typeof value === "number" ? (value as NumToStringObj).toString() : value
      );
      let typ: Type = Type.of(new NumToStringObj());
      const parsedObj: NumToStringObj = JSON.parse<NumToStringObj>(jsonStr, typ) as NumToStringObj;

      expect(parsedObj.a).assertEqual("10");
      expect(parsedObj.b).assertEqual("20");
      expect(typeof parsedObj.c).assertEqual("string");
    });

    /**
     * @tc.name   Json4Test065
     * @tc.number SUB_BUILTINS_Json4_TEST_6500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "🇨🇳 China 🇺🇸 USA";
      const jsonStr: string = JSON.stringify(originalStr);
      let typ: Type = Type.of(new String());
      const parsedStr: string = JSON.parse<string>(jsonStr, typ) as string;

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("🇨🇳")).assertEqual(true);
      expect(parsedStr.includes("🇺🇸")).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test070
     * @tc.number SUB_BUILTINS_Json4_TEST_7000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: MaskedObj = {
        phone: "13800138000",
        email: "user@example.com"
      };
      const jsonStr: string = JSON.stringify(originalObj, (key: string, value: Any) => {
        if (key === "phone" && typeof value === "string") {
          return (value as string).replace(new RegExp("(\\d{3})\\d*(\\d{4})"), "$1****$2");
        }
        if (key === "email" && typeof value === "string") {
          return (value as string).replace(new RegExp("(.{2}).*@"), "$1***@");
        }
        return value;
      });
      let typ: Type = Type.of(new MaskedObj());
      const parsedObj: MaskedObj = JSON.parse<MaskedObj>(jsonStr, typ) as MaskedObj;

      expect(parsedObj.phone).assertEqual("138****8000");
      expect(parsedObj.email).assertEqual("us***@example.com");
    });

    /**
     * @tc.name   Json4Test076
     * @tc.number SUB_BUILTINS_Json4_TEST_7600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '{"a": 1, "a": "2"}';
      let typ: Type = Type.of(new MixedTypeKeyObj());
      const parsedObj: MixedTypeKeyObj = JSON.parse<MixedTypeKeyObj>(jsonStr, typ) as MixedTypeKeyObj;

      expect(parsedObj.a).assertEqual("2");
      expect(typeof parsedObj.a).assertEqual("string");
    });

    /**
     * @tc.name   Json4Test080
     * @tc.number SUB_BUILTINS_Json4_TEST_8000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "a\u200Db";
      const jsonStr: string = JSON.stringify(originalStr);
      let typ: Type = Type.of(new String());
      const parsedStr: string = JSON.parse<string>(jsonStr, typ) as string;
      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("\u200D")).assertEqual(true);
      expect(parsedStr.length).assertEqual(3);
    });

    /**
     * @tc.name   Json4Test082
     * @tc.number SUB_BUILTINS_Json4_TEST_8200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test82_Obj1 = {
        nan: NaN,
        inf: Infinity,
        normal: 100
      };
      const jsonStr: string = JSON.stringify(originalObj);
      let typ: Type = Type.of(new SpecialNumFilterObj());
      const parsedObj: SpecialNumFilterObj = JSON.parse<SpecialNumFilterObj>(jsonStr, typ) as SpecialNumFilterObj;

      expect(parsedObj.nan).assertEqual(null);
      expect(parsedObj.inf).assertEqual(null);
      expect(parsedObj.normal).assertEqual(100);
    });

    /**
     * @tc.name   Json4Test083
     * @tc.number SUB_BUILTINS_Json4_TEST_8300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test83_Obj3 = {
        level1: {
          nan: NaN,
          level2: { inf: Infinity, num: 200 }
        }
      };
      const jsonStr: string = JSON.stringify(originalObj);
      let typ: Type = Type.of(new DeepSpecialNumObj());
      const parsedObj: DeepSpecialNumObj = JSON.parse<DeepSpecialNumObj>(jsonStr, typ) as DeepSpecialNumObj;

      expect(parsedObj.level1.nan).assertEqual(null);
      expect(parsedObj.level1.level2.inf).assertEqual(null);
      expect(parsedObj.level1.level2.num).assertEqual(200);
    });

    /**
     * @tc.name   Json4Test088
     * @tc.number SUB_BUILTINS_Json4_TEST_8800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "👨🏿‍💻 Dark skin developer";
      const jsonStr: string = JSON.stringify(originalStr);
      let typ: Type = Type.of(new String());
      const parsedStr: string = JSON.parse<string>(jsonStr, typ) as string;

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("👨🏿‍💻")).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test096
     * @tc.number SUB_BUILTINS_Json4_TEST_9600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: MathSymbolObj = {
        formulas: {
          axToBb: "sum",
          nested: { cxToAd: 100 }
        }
      };
      const jsonStr: string = JSON.stringify(originalObj);
      let typ: Type = Type.of(new MathSymbolObj());
      const parsedObj: MathSymbolObj = JSON.parse<MathSymbolObj>(jsonStr, typ) as MathSymbolObj;

      expect(parsedObj.formulas.axToBb).assertEqual("sum");
      expect(parsedObj.formulas.nested.cxToAd).assertEqual(100);
    });

    /**
     * @tc.name   Json4Test100
     * @tc.number SUB_BUILTINS_Json4_TEST_10000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: MultiBracketObj = {
        text: "中文（括号）、英文()、日文（かっこ）"
      };
      const jsonStr: string = JSON.stringify(originalObj);
      let typ: Type = Type.of(new MultiBracketObj());
      const parsedObj: MultiBracketObj = JSON.parse<MultiBracketObj>(jsonStr, typ) as MultiBracketObj;
      expect(parsedObj.text).assertEqual("中文（括号）、英文()、日文（かっこ）");
      expect(parsedObj.text.includes("（")).assertEqual(true);
      expect(parsedObj.text.includes("()")).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test101
     * @tc.number SUB_BUILTINS_Json4_TEST_10100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: ValueClampObj = { score: 150, age: -5 };
      const jsonStr: string = JSON.stringify(originalObj, (key: string, value: Any) => {
        if (key === "score") {
          return Math.min(100, value as number);
        }
        if (key === "age") {
          return Math.max(0, value as number);
        }
        return value;
      });
      let typ: Type = Type.of(new ValueClampObj());
      const parsedObj: ValueClampObj = JSON.parse<ValueClampObj>(jsonStr, typ) as ValueClampObj;

      expect(parsedObj.score).assertEqual(100);
      expect(parsedObj.age).assertEqual(0);
    });

    /**
     * @tc.name   Json4Test110
     * @tc.number SUB_BUILTINS_Json4_TEST_11000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "🏴󠁧󠁢󠁥󠁮󠁧󠁿 UK 🇪🇸 Spain";
      const jsonStr: string = JSON.stringify(originalStr);
      let typ: Type = Type.of(new String());
      const parsedStr: string = JSON.parse<string>(jsonStr, typ) as string;

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("🏴󠁧󠁢󠁥󠁮󠁧󠁿")).assertEqual(true);
      expect(parsedStr.includes("🇪🇸")).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test115
     * @tc.number SUB_BUILTINS_Json4_TEST_11500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: PartialMaskObj = {
        cardNumber: "6222021234567890123",
        phone: "13800138000"
      };
      const jsonStr: string = JSON.stringify(originalObj, (key: string, value: Any) => {
        if (key === "cardNumber" && typeof value === "string") {
          return (value as string).replace(new RegExp("^(\\d{4})\\d*(\\d{4})$"), "$1********$2");
        }
        return value;
      });
      let typ: Type = Type.of(new PartialMaskObj());
      const parsedObj: PartialMaskObj = JSON.parse<PartialMaskObj>(jsonStr, typ) as PartialMaskObj;
      expect(parsedObj.cardNumber).assertEqual("6222********0123");
      expect(parsedObj.phone).assertEqual("13800138000");
    });

    /**
     * @tc.name   Json4Test121
     * @tc.number SUB_BUILTINS_Json4_TEST_12100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: MultiQuoteObj = {
        text: '中文“引号”、英文"引号"、日文「引用」'
      };
      const jsonStr: string = JSON.stringify(originalObj);
      let typ: Type = Type.of(new MultiQuoteObj());
      const parsedObj: MultiQuoteObj = JSON.parse<MultiQuoteObj>(jsonStr, typ) as MultiQuoteObj;
      expect(parsedObj.text).assertEqual('中文“引号”、英文"引号"、日文「引用」');
      expect(parsedObj.text.includes("“")).assertEqual(true);
      expect(parsedObj.text.includes("「")).assertEqual(true);
    });
  
    /**
     * @tc.name   Json4Test124
     * @tc.number SUB_BUILTINS_Json4_TEST_12400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: DeepZeroWidthObj = {
        level1: {
          keyy: "value\u200C1",
          level2: { keyx: 100 }
        }
      };
      const jsonStr: string = JSON.stringify(originalObj);
      let typ: Type = Type.of(new DeepZeroWidthObj());
      const parsedObj: DeepZeroWidthObj = JSON.parse<DeepZeroWidthObj>(jsonStr, typ) as DeepZeroWidthObj;

      expect(parsedObj.level1.keyy).assertEqual("value\u200C1");
      expect(parsedObj.level1.level2.keyx).assertEqual(100);
    });

    /**
     * @tc.name   Json4Test128
     * @tc.number SUB_BUILTINS_Json4_TEST_12800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: ApiResponse = {
        code: 200,
        data: { message: "success", timestamp: Date.now() }
      };
      const jsonStr: string = JSON.stringify(originalObj);
      let typ: Type = Type.of(new ApiResponse());
      const parsedObj: ApiResponse = JSON.parse<ApiResponse>(jsonStr, (key: string, value: Any) => {
        if (key === "code" && typeof value !== "number") {
          throw new Error("code must be number");
        }
        if (key === "message" && typeof value !== "string") {
          throw new Error("message must be string");
        }
        return value;
      }, typ) as ApiResponse;
      expect(parsedObj.code).assertEqual(200);
      expect(typeof parsedObj.data.timestamp).assertEqual("number");
    });

    /**
     * @tc.name   Json4Test131
     * @tc.number SUB_BUILTINS_Json4_TEST_13100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "🍕 Pizza 🍟 Fries 🍔 Burger";
      const jsonStr: string = JSON.stringify(originalStr);
      let typ: Type = Type.of(new String());
      const parsedStr: string = JSON.parse<string>(jsonStr, typ) as string;

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("🍕")).assertEqual(true);
      expect(parsedStr.includes("🍔")).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test137
     * @tc.number SUB_BUILTINS_Json4_TEST_13700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: ChemicalSymbolObj = {
        elements: {
          H2O: "Water",
          nested: { CO2: 100 }
        }
      };
      const jsonStr: string = JSON.stringify(originalObj);
      let typ: Type = Type.of(new ChemicalSymbolObj());
      const parsedObj: ChemicalSymbolObj = JSON.parse<ChemicalSymbolObj>(jsonStr, typ) as ChemicalSymbolObj;

      expect(parsedObj.elements.H2O).assertEqual("Water");
      expect(parsedObj.elements.nested.CO2).assertEqual(100);
    });

    /**
     * @tc.name   Json4Test139
     * @tc.number SUB_BUILTINS_Json4_TEST_13900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: MusicSymbolObj = {
        notes: {
          Cx23: "Middle C Sharp",
          nested: { Dx23: 200 }
        }
      };
      const jsonStr: string = JSON.stringify(originalObj);
      let typ: Type = Type.of(new MusicSymbolObj());
      const parsedObj: MusicSymbolObj = JSON.parse<MusicSymbolObj>(jsonStr, typ) as MusicSymbolObj;

      expect(parsedObj.notes.Cx23).assertEqual("Middle C Sharp");
      expect(parsedObj.notes.nested.Dx23).assertEqual(200);
    });

    /**
     * @tc.name   Json4Test144
     * @tc.number SUB_BUILTINS_Json4_TEST_14400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "✈️ Travel 🏨 Hotel 🌍 World";
      const jsonStr: string = JSON.stringify(originalStr);
      let typ: Type = Type.of(new String());
      const parsedStr: string = JSON.parse<string>(jsonStr, typ) as string;

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("✈️")).assertEqual(true);
      expect(parsedStr.includes("🌍")).assertEqual(true);
    });

  })
}