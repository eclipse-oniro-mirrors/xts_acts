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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

interface Test3_Obj1 {
  value: string;
}

interface RootNestedReplaceObj {
  container: Test3_Obj1;
}

interface Test3_Obj3 {
  value: number;
}

interface Test3_Obj2 {
  container: Test3_Obj3;
}

interface TypePreserveObj {
  num: number;
  str: string;
  bool?: boolean;
  nil?: null;
}

interface Test6_Obj2 {
  c: number;
}

interface Test6_Obj1 {
  b: Test6_Obj2;
}

interface DeepKeyConflictObj {
  a: Test6_Obj1;
}

interface Test10_Obj2 {
  city: string;
  street?: string;
}

interface Test10_Obj1 {
  address: Test10_Obj2;
}

interface PathFilterObj {
  user: Test10_Obj1;
}

interface Test11_Obj1 {
  id: number;
  active: boolean;
}

interface ArrWithObj {
  items: Test11_Obj1[];
}

interface Test14_Obj1 {
  a: number;
  b: number;
}

interface Test14_Obj2 extends Test14_Obj1 {
  sum: number;
}

interface StrTruncateObj {
  short: string;
  long: string;
}

interface Test17_Obj1 {
  id: number;
  value: number;
}

interface FilteredObjArr {
  data: Test17_Obj1[];
}

interface Test19_Obj1 {
  level2: string;
}

interface NestedNewlineObj {
  level1: Test19_Obj1;
}

interface RenamePropObj {
  newKey: string;
}

interface Test20_Obj1 {
  oldKey: string;
}

interface Test20_Obj2 {
  temp: string;
}

type SpecialCharArr = (string | string[])[];

interface Test24_Obj1 {
  id: number;
}

interface EmptyObjFilter {
  valid: Test24_Obj1;
  empty?: Record<string, never>;
}

interface CharTypeCountCompare {
  strings: string[];
  typesCount: number[];
}

type Status = "active" | "inactive" | "pending";

interface StatusMapObj {
  status: Status;
}

interface Test27_Obj1 {
  status: number;
}

interface MultiLangObj {
  en: string;
  zh: string;
  ja: string;
}

interface ProductCompare {
  numbers: number[];
  product: number;
}

type NestedNumberArray = number | NestedNumberArray[];

interface SensitiveDataObj {
  username: string;
  password?: string;
  email: string;
}

interface Test35_Obj2 {
  token?: string;
  role: string;
}

interface Test35_Obj1 {
  name: string;
  auth: Test35_Obj2;
}

interface DeepSensitiveObj {
  user: Test35_Obj1;
}

interface Test37_Obj1 {
  id: number;
  name: string;
  age: number;
}

interface MergedObj {
  fullInfo: Test37_Obj1;
}

interface Test37_Obj2 {
  id: number;
  name: string;
  age: number;
}

interface Test39_Obj1 {
  event: string;
  time: number;
}

interface DateToTimestampObj {
  logs: Test39_Obj1[];
}

interface Test39_Obj3 {
  event: string;
  time: string;
}

interface Test39_Obj2 {
  logs: Test39_Obj3[];
}

interface ValidatedObj {
  score: number;
}

type UserMapArray = Map<string, string>[];

interface Test44_Obj1 {
  id: string;
  name: string;
}

interface Test45_Obj1 {
  id: number;
  name: string;
}

interface UniqueObjArr {
  items: Test45_Obj1[];
}

interface Test45_Obj2 {
  id: number;
}

interface EncryptedObj {
  username: string;
  email: string;
}

interface FrequencyObj {
  frequency: Record<number, number>;
}

interface Test50_Obj2 {
  key232: number;
}

interface Test50_Obj1 {
  key401: string;
  level2: Test50_Obj2;
}

interface DeepSpecialCharObj {
  level1: Test50_Obj1;
}

interface EmptyArrFilterObj {
  valid: number[];
  empty?: never[];
}

interface ExtractNumbersSumCompare {
  strings: string[];
  sum: number;
}

enum EnumStatus {
  Active = "ACTIVE",
  Inactive = "INACTIVE"
}

interface EnumMapObj {
  enumStatus: EnumStatus;
}

interface MultiPunctObj {
  en: string;
  de: string;
  fr: string;
}

interface PropLimitObj {
  a: number;
  b: number;
  c?: number;
}

interface MatrixObj {
  rows: number;
  cols: number;
  data: number[][];
}

interface LengthValidatedObj {
  codes: string[];
}

interface Test59_Obj2 {
  valid: string;
  empty?: Record<string, never>;
}

interface Test59_Obj1 {
  level2: Test59_Obj2;
}

interface DeepEmptyFilterObj {
  level1: Test59_Obj1;
}

interface Test60_Obj1 {
  id: number;
  name: string;
  password?: string;
}

interface ArrSensitiveObj {
  users: Test60_Obj1[];
}

interface Test61_Obj1 {
  id: number;
  name: string;
}

interface Test61_Obj2 {
  email: string;
}

interface RestructuredObj {
  user: Test61_Obj1;
  contact: Test61_Obj2;
}

interface NumToStringObj {
  a: string;
  b: string;
  c: string;
}

interface Test64_Obj3 {
  name: string;
  time: Date;
}

interface Test64_Obj2 {
  events: Test64_Obj3[];
}

interface DeepDateObj {
  logs: Test64_Obj2[];
}

interface FilteredArrObj {
  numbers: number[];
}


interface MaskedObj {
  phone: string;
  email: string;
}

interface StatsObj {
  data: number[];
  sum: number;
  avg: number;
  max: number;
}

type DeepSpecialArr = (string | string[][])[];

interface Test73_Obj2 {
  valid: number[];
  empty?: never[];
}

interface Test73_Obj1 {
  level2: Test73_Obj2[];
}

interface DeepEmptyArrFilterObj {
  level1: Test73_Obj1;
}

interface CircularSafeObj {
  name: string;
  parent?: CircularSafeObj;
}

interface MixedTypeKeyObj {
  a: string;
}

type MultiLangArr = (string | string[])[];

interface Test78_Obj2 {
  level3?: string;
}

interface Test78_Obj1 {
  level2: Test78_Obj2;
}

interface FirstGreaterCompare {
  numbers: number[];
  target: number;
  result: number | null;
}

interface TransposedMatrixObj {
  transposed: number[][];
}

interface StdDevCompare {
  numbers: number[];
  stdDev: number;
}

interface RemoveElementCompare {
  strings: string[];
  cleaned: string[];
}

interface SpecialNumFilterObj {
  nan: null;
  inf: null;
  normal: number;
}

interface Test83_Obj2 {
  inf: null;
  num: number;
}

interface Test83_Obj1 {
  nan: null;
  level2: Test83_Obj2;
}

interface DeepSpecialNumObj {
  level1: Test83_Obj1;
}

interface GradeConvertCompare {
  scores: number[];
  grades: string[];
}


interface StrLengthFilterObj {
  long: string;
  short?: string;
}

interface Test87_Obj2 {
  value: number;
}

interface Test87_Obj1 {
  items: Test87_Obj2[];
  total: number;
}

interface DeepAggregateObj {
  groups: Test87_Obj1[];
}

interface EmptyStrArrFilterObj {
  tags: string[];
}

interface PalindromeCheckCompare {
  strings: string[];
  isPalindrome: boolean[];
}

interface MaxSubarrayCompare {
  numbers: number[];
  maxSum: number;
}

interface SubstringConcatCompare {
  strings: string[];
  result: string;
}


interface KeywordArrObj {
  values: (boolean | null)[];
}

interface Test96_Obj2 {
  cxToAd: number;
}

interface Test96_Obj1 {
  axToBb: string;
  nested: Test96_Obj2;
}

interface MathSymbolObj {
  formulas: Test96_Obj1;
}

interface Test97_Obj1 {
  level2: string[];
}

interface DeepEmptyStrFilterObj {
  level1: Test97_Obj1[];
}

type NestedSetArr = (number | Set<number> | NestedSetArr)[];

enum Priority {
  Low = 1,
  Medium = 2,
  High = 3
}

interface Test99_Obj2 {
  name: string;
  priority: Priority;
}

interface PriorityMapObj {
  tasks: Test99_Obj2[];
}

interface MultiBracketObj {
  text: string;
}

interface ValueClampObj {
  score: number;
  age: number;
}

interface Flatten3DObj {
  flattened: number[];
}

type DeepZeroWidthArr = (string | string[][])[];

interface Test104_Obj2 {
  valid: string;
  undef?: undefined;
}

interface Test104_Obj1 {
  level2: Test104_Obj2;
}

interface DeepUndefinedFilterObj {
  level1: Test104_Obj1;
}

interface MultiReplaceCompare {
  strings: string[];
  replaced: string[];
}

class Product {
  public id: number;
  public name: string;
  public price: number;

  constructor(id: number, name: string, price: number) {
    this.id = id;
    this.name = name;
    this.price = price;
  }

  getTax(): number {
    return this.price * 0.1;
  }
}

interface ProductObj {
  item: Product;
}

interface VowelRatioCompare {
  strings: string[];
  ratios: number[];
}

interface Test109_Obj1 {
  id: string;
  age: number;
}

interface DeepPropConvertObj {
  users: Test109_Obj1[];
}

interface Test110_Obj1 {
  id: number;
  name: string;
}

interface UniqueDeepObjArr {
  items: Test110_Obj1[];
}

interface AbsoluteDiffsCompare {
  numbers: number[];
  diffs: number[];
}

interface Test113_Obj1 {
  value: number;
}

interface SumAvgCompare {
  data: Test113_Obj1[];
  sum: number;
  avg: number;
}

type MixedSpecialArr = (string | string[][])[];

interface PartialMaskObj {
  cardNumber: string;
  phone: string;
}

interface Test116_Obj1 {
  id: number;
  diff: number;
}

interface DiffObj {
  changes: Test116_Obj1[];
}

interface Test117_Obj2 {
  formula: string;
  variables: string[];
}

interface Test117_Obj1 {
  linear: string;
  quadratic: Test117_Obj2;
}

interface MathFormulaObj {
  equations: Test117_Obj1;
}

interface Test118_Obj2 {
  valid: number[];
  empty: never[];
}

interface Test118_Obj1 {
  level2: Test118_Obj2[];
}

interface DeepEmptyArrCleanObj {
  level1: Test118_Obj1;
}

interface BinaryOneCountCompare {
  numbers: number[];
  counts: number[];
}

interface VowelSortCompare {
  words: string[];
  sorted: string[];
}

interface MultiQuoteObj {
  text: string;
}

interface FrequencyDistObj {
  distribution: Record<string, number>;
}

interface Test124_Obj2 {
  keyx: number;
}

interface Test124_Obj1 {
  keyy: string;
  level2: Test124_Obj2;
}

interface DeepZeroWidthObj {
  level1: Test124_Obj1;
}

interface Test125_Obj2 {
  valid: string;
  empty: string;
}

interface Test125_Obj1 {
  level2: Test125_Obj2;
}

interface DeepEmptyStrCleanObj {
  level1: Test125_Obj1;
}

interface Test126_Obj2 {
  sku: string;
}

interface Test126_Obj1 {
  id: number;
  details: Test126_Obj2;
}

interface DeepUniqueObjArr {
  products: Test126_Obj1[];
}

interface Test128_Obj1 {
  message: string;
  timestamp: number;
}

interface ApiResponse {
  code: number;
  data: Test128_Obj1;
}

interface RegexFilterObj {
  email: string;
  phone?: string;
}

interface UpperCountCompare {
  strings: string[];
  counts: number[];
}

interface CubeRootCompare {
  numbers: number[];
  roots: number[];
}

interface FibIndexCompare {
  indices: number[];
  fibValues: number[];
}

interface Test132_Obj1 {
  id: number;
  name: string;
}

interface ValidObjFilterArr {
  users: Test132_Obj1[];
}

interface Test133_Obj2 {
  active: boolean;
}

interface Test133_Obj1 {
  id: number;
  details: Test133_Obj2;
}

interface SetToObjArrDeep {
  items: Test133_Obj1[];
}

interface Test134_Obj1 {
  category: string;
}

interface UniquePropsCompare {
  items: Test134_Obj1[];
  uniqueCategories: string[];
}

interface Test135_Obj1 {
  text: string;
}

interface NestedControlCharObj {
  level1: Test135_Obj1;
}


interface FirstLettersConcatCompare {
  words: string[];
  acronym: string;
}

interface Test137_Obj2 {
  CO2: number;
}

interface Test137_Obj1 {
  H2O: string;
  nested: Test137_Obj2;
}

interface ChemicalSymbolObj {
  elements: Test137_Obj1;
}

interface Test138_Obj2 {
  num: number;
}

interface Test138_Obj1 {
  values: Test138_Obj2[];
}

interface ValidNumberFilterObj {
  level1: Test138_Obj1;
}

interface RawData {
  user_id: number;
  user_name: string;
  user_email: string;
}

interface UserDTO {
  id: number;
  name: string;
  email: string;
}

interface Test142_Obj1 {
  value: string;
}

interface Test142_Obj2 {
  id: number;
}

interface ObjectOnlyObj {
  nested: Test142_Obj1;
  otherObj?: Test142_Obj2;
  str?: string;
}

interface Test143_Obj1 {
  action: string;
  time: string;
}

interface FormattedDateObj {
  logs: Test143_Obj1[];
}

interface FactorialCompare {
  numbers: number[];
  results: number[];
}

interface RemoveVowelsCompare {
  strings: string[];
  consonants: string[];
}

interface TwoSumCompare {
  numbers: number[];
  target: number;
  indices: number[];
}

type ThreeDimSpecialArr = (string | string[][] | string[][][])[];

interface MovingAvgCompare {
  numbers: number[];
  window: number;
  averages: number[];
}


interface CharCountSortCompare {
  strings: string[];
  sorted: string[];
}

interface Test139_Obj2 {
  Dx23: number;
}

interface Test139_Obj1 {
  Cx23: string;
  nested: Test139_Obj2;
}

interface MusicSymbolObj {
  notes: Test139_Obj1;
}

interface Test53_Obj1 {
  enumStatus: string;
}

interface Test62_Obj3 {
  user_id: number;
  user_name: string;
  contact_email: string;
}

interface Test63_Obj1 {
  a: number;
  b: number;
  c: number;
}

interface Test64_Obj5 {
  name: string;
  time: string;
}

interface Test64_Obj4 {
  events: Test64_Obj5[];
}

interface Test64_Obj1 {
  logs: Test64_Obj4[];
}

interface Test68_Obj2 {
  name: string;
  price: number;
  inStock: boolean;
}

interface Test68_Obj1 {
  name: string;
  price: number;
  inStock: boolean;
}

interface MultiFilterCompare {
  products: Test68_Obj2[];
  filtered: Test68_Obj1[];
}

interface Test62_Obj1 {
  id: number;
  name: string;
}

interface Test62_Obj2 {
  email: string;
}

interface Test82_Obj1 {
  nan: number;
  inf: number;
  normal: number;
}

interface Test83_Obj5 {
  inf: number;
  num: number;
}

interface Test83_Obj4 {
  nan: number;
  level2: Test83_Obj5;
}

interface Test83_Obj3 {
  level1: Test83_Obj4;
}

interface Test87_Obj4 {
  value: number;
}

interface Test87_Obj3 {
  items: Test87_Obj4[];
}

interface Test87_Obj5 {
  groups: Test87_Obj3[];
}

interface FibonacciCompare {
  count: number[];
  sequence: number[];
}


interface Test99_Obj3 {
  name: string;
  priority: string;
}

interface Test99_Obj1 {
  tasks: Test99_Obj3[];
}

interface Test107_Obj1 {
  id: number;
  name: string;
  price: number;
}

interface Test109_Obj3 {
  id: number;
  age: number;
}

interface Test109_Obj2 {
  users: Test109_Obj3[];
}

interface Test111_Obj3 {
  id: number;
}

interface Test112_Obj1 {
  id: number;
  name: string;
}


interface Test116_Obj3 {
  id: number;
  old: number;
  new: number;
}

interface Test116_Obj2 {
  items: Test116_Obj3[];
}

interface Test130_Obj6 {
  salary: number;
}

interface Test130_Obj5 {
  employees: Test130_Obj6[];
}

interface Test130_Obj4 {
  departments: Test130_Obj5[];
}

interface Test133_Obj4 {
  active: boolean;
}

interface Test133_Obj3 {
  id: number;
  details: Test133_Obj4;
}


interface Test143_Obj3 {
  action: string;
  time: number;
}

interface Test143_Obj2 {
  logs: Test143_Obj3[];
}


export default function Json4Test() {

  describe('Json4Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      await sleep(20);
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
        JSON.parse(invalidJson);
      } catch (error) {
        hasError = error instanceof SyntaxError;
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
      const parsedStr: string = JSON.parse(jsonStr);

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
      const originalObj: Test3_Obj2 = {
        container: { value: 123 }
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: RootNestedReplaceObj = JSON.parse(jsonStr, (key, value: string) => {
        if (key === "container") {
          return { value: "replaced" };
        }
        return value;
      });

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

      try {
        JSON.parse(invalidJson);
      } catch (error) {
        hasError = error instanceof SyntaxError;
      }

      expect(hasError).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test005
     * @tc.number SUB_BUILTINS_Json4_TEST_0500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: TypePreserveObj = {
        num: 10,
        str: "test",
        bool: true,
        nil: null
      };
      const jsonStr: string = JSON.stringify(originalObj, (value: string) =>
      typeof value === "number" || typeof value === "string" ? value : undefined
      );
      const parsedObj: TypePreserveObj = JSON.parse(jsonStr);

      expect(parsedObj.num).assertEqual(undefined);
      expect(parsedObj.str).assertEqual(undefined);
      expect(parsedObj.bool).assertEqual(undefined);
      expect(parsedObj.nil).assertEqual(undefined);
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
      const parsedObj: DeepKeyConflictObj = JSON.parse(jsonStr);
      expect(parsedObj.a.b.c).assertEqual(2);
    });

    /**
     * @tc.name   Json4Test007
     * @tc.number SUB_BUILTINS_Json4_TEST_0700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "Start\u0000End";
      const jsonStr: string = JSON.stringify(originalStr);
      const parsedStr: string = JSON.parse(jsonStr);
      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("\u0000")).assertEqual(true);
      expect(parsedStr.length).assertEqual(9);
    });

    /**
     * @tc.name   Json4Test008
     * @tc.number SUB_BUILTINS_Json4_TEST_0800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: [string, number][] = [["a", 1], ["b", 2]];
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedMap: Map<string, number> = JSON.parse(jsonStr, (key, value: [string, number][]) =>
      key === "" ? new Map(value as [string, number][]) : value
      );

      expect(parsedMap instanceof Map).assertEqual(true);
      expect(parsedMap.get("a")).assertEqual(1);
      expect(parsedMap.get("b")).assertEqual(2);
    });

    /**
     * @tc.name   Json4Test010
     * @tc.number SUB_BUILTINS_Json4_TEST_1000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: PathFilterObj = {
        user: { address: { city: "Beijing", street: "Main St" } }
      };

      const jsonStr: string = JSON.stringify(originalObj, (key: string, value: string) => {
        if (key === "street") {
          return undefined;
        }
        return value;
      });
      const parsedObj: PathFilterObj = JSON.parse(jsonStr) as PathFilterObj;
      expect(parsedObj.user.address.city).assertEqual("Beijing");
      expect(parsedObj.user.address.street).assertEqual(undefined);
    });

    /**
     * @tc.name   Json4Test011
     * @tc.number SUB_BUILTINS_Json4_TEST_1100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: ArrWithObj = {
        items: [{ id: 1, active: false }, { id: 2, active: false }]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: ArrWithObj = JSON.parse(jsonStr, (key: string, value: Test11_Obj1) => {
        if (typeof value === "object" && value !== null && !Array.isArray(value) && value.active) {
          const obj = value as Test11_Obj1;
          return { id: obj.id, active: true };
        }
        return value;
      });
      expect(parsedObj.items[0].active).assertEqual(false);
      expect(parsedObj.items[1].active).assertEqual(false);
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
      try {
        JSON.parse(invalidJson);
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
      const parsedStr: string = JSON.parse(jsonStr);

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
      const originalObj: Test14_Obj1 = { a: 5, b: 10 };
      const jsonStr: string = JSON.stringify(originalObj);
      let values: Test14_Obj1 = {
        a: 0,
        b: 0
      };
      const parsedObj: Test14_Obj2 = JSON.parse(jsonStr, (key: string, value: number | Test14_Obj1) => {
        if (key === "a") {
          values.a = value as number;
        }
        if (key === "b") {
          values.b = value as number;
        }
        if (key === "") {
          const obj = value as Test14_Obj1;
          return { a: obj.a, b: obj.b, sum: values.a + values.b };
        }
        return value;
      });
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
      try {
        JSON.parse(invalidJson);
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
        short: "hello",
        long: "this is a very long string"
      };
      const jsonStr: string = JSON.stringify(originalObj, (key, value: string) =>
      typeof value === "string" && value.length > 10 ? value.slice(0, 10) : value
      );
      const parsedObj: StrTruncateObj = JSON.parse(jsonStr);

      expect(parsedObj.short).assertEqual("hello");
      expect(parsedObj.long).assertEqual("this is a ");
      expect(parsedObj.long.length).assertEqual(10);
    });

    /**
     * @tc.name   Json4Test017
     * @tc.number SUB_BUILTINS_Json4_TEST_1700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: FilteredObjArr = {
        data: [{ id: 1, value: 5 }, { id: 2, value: 15 }, { id: 3, value: 8 }]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: FilteredObjArr = JSON.parse(jsonStr, (key: string, value: Array<Test17_Obj1>) => {
        if (key === "data" && Array.isArray(value)) {
          return (value as Test17_Obj1[]).filter(item => item.value > 10);
        }
        return value;
      });

      expect(parsedObj.data.length).assertEqual(1);
      expect(parsedObj.data[0].id).assertEqual(2);
      expect(parsedObj.data[0].value).assertEqual(15);
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

      try {
        JSON.parse(invalidJson);
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
      const parsedObj: NestedNewlineObj = JSON.parse(jsonStr);

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
      const originalObj: Test20_Obj1 = { oldKey: "value" };
      const jsonStr: string = JSON.stringify(originalObj, (key, value: Test20_Obj2) => {
        if (key === "oldKey") {
          return { temp: value };
        }
        if (key === "") {
          return { newKey: (value as Test20_Obj2).temp };
        }
        return value;
      });
      const parsedObj: RenamePropObj = JSON.parse(jsonStr);

      expect(parsedObj.newKey).assertEqual(undefined);
      expect(Object.keys(parsedObj).includes("newKey")).assertEqual(false);
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
      const parsedArr: number[] = JSON.parse(jsonStr, (key, value: string) =>
      key !== "" && typeof value === "string" ? parseInt(value, 10) : value
      );

      expect(parsedArr[0]).assertEqual(10);
      expect(parsedArr[1]).assertEqual(20);
      expect(typeof parsedArr[0]).assertEqual("number");
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
        JSON.parse(invalidJson);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('SyntaxError');
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
      const parsedArr: SpecialCharArr = JSON.parse(jsonStr);

      expect((parsedArr[0] as string[])[0]).assertEqual("!@#");
      expect((parsedArr[1] as string[])[1]).assertEqual("[]{}");
    });

    /**
     * @tc.name   Json4Test024
     * @tc.number SUB_BUILTINS_Json4_TEST_2400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: EmptyObjFilter = {
        valid: { id: 1 },
        empty: {}
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: EmptyObjFilter = JSON.parse(jsonStr, (key, value: object) =>
      typeof value === "object" && value !== null && Object.keys(value).length === 0
        ? undefined
        : value
      );
      expect(parsedObj.valid.id).assertEqual(1);
      expect(parsedObj.empty).assertEqual(undefined);
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

      try {
        JSON.parse(invalidJson);
      } catch (error) {
        hasError = error instanceof SyntaxError;
      }

      expect(hasError).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test026
     * @tc.number SUB_BUILTINS_Json4_TEST_2600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CharTypeCountCompare = { strings: ["aab1", "abc", "aaa"], typesCount: [] };
      const json = JSON.stringify(obj);
      const parsed: CharTypeCountCompare = JSON.parse(json, (k: string, v: CharTypeCountCompare) => {
        if (k === "") {
          const c: number[] = [];
          v.strings.forEach(s => {
            const chars: string[] = [];
            for (let i = 0; i < s.length; i++) {
              if (!chars.includes(s[i])) {
                chars.push(s[i]);
              }
            }
            c.push(chars.length);
          });
          return { strings: v.strings, typesCount: c };
        }
        return v;
      });
      expect(parsed.typesCount[0]).assertEqual(3);
      expect(parsed.typesCount[1]).assertEqual(3);
      expect(parsed.typesCount[2]).assertEqual(1);
    });

    /**
     * @tc.name   Json4Test027
     * @tc.number SUB_BUILTINS_Json4_TEST_2700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test27_Obj1 = { status: 1 };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: StatusMapObj = JSON.parse(jsonStr, (key, value: number) => {
        if (key === "status") {
          const map: Record<number, Status> = { 0: "inactive", 1: "active", 2: "pending" };
          return map[value as number] || "inactive";
        }
        return value;
      });

      expect(parsedObj.status).assertEqual("active");
      expect(["active", "inactive", "pending"].includes(parsedObj.status)).assertEqual(true);
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

      try {
        JSON.parse(invalidJson);
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
      const parsedObj: MultiLangObj = JSON.parse(jsonStr);

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
      const jsonStr: string = JSON.stringify(originalArr, (key, value: Array<number>) => {
        if (key === "" && Array.isArray(value) && value.length > 3) {
          return value.slice(0, 3);
        }
        return value;
      });
      const parsedArr: number[] = JSON.parse(jsonStr);

      expect(parsedArr.length).assertEqual(3);
      expect(parsedArr[0]).assertEqual(1);
      expect(parsedArr[2]).assertEqual(3);
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
      const parsed: ProductCompare = JSON.parse(json, (k: string, v: ProductCompare) => {
        if (k === "") {
          let p = 1;
          v.numbers.forEach(n => p *= n);
          return { numbers: v.numbers, product: p };
        }
        return v;
      });
      expect(parsed.product).assertEqual(24);
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
      try {
        JSON.parse(invalidJson);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("SyntaxError");
        expect(error.message).assertContain("");
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
      const parsedStr: string = JSON.parse(jsonStr);

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("\u200C")).assertEqual(true);
      expect(parsedStr.length).assertEqual(3);
    });

    /**
     * @tc.name   Json4Test034
     * @tc.number SUB_BUILTINS_Json4_TEST_3400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: SensitiveDataObj = {
        username: "user123",
        password: "secret",
        email: "user@example.com"
      };
      const jsonStr: string = JSON.stringify(originalObj, (key, value: string) =>
      key === "password" ? undefined : value
      );
      const parsedObj: SensitiveDataObj = JSON.parse(jsonStr);

      expect(parsedObj.username).assertEqual("user123");
      expect(parsedObj.password).assertEqual(undefined);
      expect(parsedObj.email).assertEqual("user@example.com");
    });

    /**
     * @tc.name   Json4Test035
     * @tc.number SUB_BUILTINS_Json4_TEST_3500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: DeepSensitiveObj = {
        user: {
          name: "admin",
          auth: { token: "secret-token", role: "admin" }
        }
      };
      const jsonStr: string = JSON.stringify(originalObj, (key, value: string) =>
      key === "token" ? undefined : value
      );
      const parsedObj: DeepSensitiveObj = JSON.parse(jsonStr);

      expect(parsedObj.user.name).assertEqual("admin");
      expect(parsedObj.user.auth.token).assertEqual(undefined);
      expect(parsedObj.user.auth.role).assertEqual("admin");
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
      const parsedArr: string[] = JSON.parse(jsonStr);

      expect(parsedArr[0]).assertEqual("\x01Start");
      expect(parsedArr[1]).assertEqual("End\x04");
      expect(parsedArr[0].charCodeAt(0)).assertEqual(1);
    });

    /**
     * @tc.name   Json4Test037
     * @tc.number SUB_BUILTINS_Json4_TEST_3700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test37_Obj2 = {
        id: 10,
        name: "Anna",
        age: 30
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: MergedObj = JSON.parse(jsonStr, (key, value: string) => {
        if (key === "") {
          return { fullInfo: value };
        }
        return value;
      });

      expect(parsedObj.fullInfo.id).assertEqual(10);
      expect(parsedObj.fullInfo.name).assertEqual("Anna");
      expect(parsedObj.fullInfo.age).assertEqual(30);
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
      try {
        JSON.parse(invalidJson);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("SyntaxError");
        expect(error.message).assertContain("Unexpected Object Prop in JSON");
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
      const parsedObj: DateToTimestampObj = JSON.parse(jsonStr, (key, value: string) => {
        if (key === "time") {
          return new Date(value as string).getTime();
        }
        return value;
      });

      expect(parsedObj.logs[0].time).assertEqual(1704067200000);
      expect(parsedObj.logs[1].time).assertEqual(1704070800000);
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
      try {
        JSON.parse(invalidJson);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("SyntaxError");
        expect(error.message).assertContain("Unexpected Text in JSON: Invalid Token");
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
      const parsedStr: string = JSON.parse(jsonStr);
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

      validResult = JSON.parse(validJson, (key, value: number) => {
        if (key === "score" && (value as number) > 100) {
          throw new Error("Score cannot exceed 100");
        }
        return value;
      });
      try {
        JSON.parse(invalidJson, (key, value: number) => {
          if (key === "score" && (value as number) > 100) {
            throw new Error("Score cannot exceed 100");
          }
          return value;
        });
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
        JSON.parse(invalidJson);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("SyntaxError");
        expect(error.message).assertContain("Unexpected Array in JSON");
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
      const parsed: CubeRootCompare = JSON.parse(json, (k: string, v: CubeRootCompare) => {
        if (k === "") {
          const r: number[] = [];
          v.numbers.forEach(n => r.push(Math.cbrt(n)));
          return { numbers: v.numbers, roots: r };
        }
        return v;
      });
      expect(parsed.roots[0]).assertEqual(2);
      expect(parsed.roots[1]).assertEqual(3);
    });

    /**
     * @tc.name   Json4Test045
     * @tc.number SUB_BUILTINS_Json4_TEST_4500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: UniqueObjArr = {
        items: [
          { id: 1, name: "A" },
          { id: 2, name: "B" },
          { id: 1, name: "A" }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: UniqueObjArr = JSON.parse(jsonStr, (key, value: Test45_Obj2[]) => {
        if (key === "items") {
          const seen = new Set<number>();
          return (value as Test45_Obj2[]).filter(item => {
            if (seen.has(item.id)) {
              return false;
            }
            seen.add(item.id);
            return true;
          });
        }
        return value;
      });

      expect(parsedObj.items.length).assertEqual(2);
      expect(JSON.stringify(parsedObj.items.map(i => i.id))).assertEqual(JSON.stringify([1, 2]));
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
      try {
        JSON.parse(invalidJson);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("SyntaxError");
        expect(error.message).assertContain("Unexpected Text in JSON: Invalid Token");
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
      const parsedStr: string = JSON.parse(jsonStr);

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.split(/\r?\n/).length).assertEqual(3);
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
      const jsonStr: string = JSON.stringify(originalObj, (key, value: string) =>
      key === "email" ? (value as string).split("").reverse().join("") : value
      );
      const parsedObj: EncryptedObj = JSON.parse(jsonStr, (key, value: string) =>
      key === "email" ? (value as string).split("").reverse().join("") : value
      );

      expect(parsedObj.email).assertEqual("user@example.com");
      expect(JSON.parse(jsonStr).email).assertEqual("moc.elpmaxe@resu");
    });

    /**
     * @tc.name   Json4Test049
     * @tc.number SUB_BUILTINS_Json4_TEST_4900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: number[] = [1, 2, 2, 3, 3, 3];
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedObj: FrequencyObj = JSON.parse(jsonStr, (key, value: number[]) => {
        if (key === "") {
          const freq: Record<number, number> = {};
          (value as number[]).forEach(num => {
            freq[num] = (freq[num] || 0) + 1;
          });
          return { frequency: freq };
        }
        return value;
      });

      expect(parsedObj.frequency[1]).assertEqual(1);
      expect(parsedObj.frequency[2]).assertEqual(2);
      expect(parsedObj.frequency[3]).assertEqual(3);
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
      const parsedObj: DeepSpecialCharObj = JSON.parse(jsonStr);

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
      const parsedObj: EmptyArrFilterObj = JSON.parse(jsonStr, (key, value: Array<number>) =>
      Array.isArray(value) && value.length === 0 ? undefined : value
      );

      expect(parsedObj.valid.length).assertEqual(2);
      expect(parsedObj.empty).assertEqual(undefined);
    });

    /**
     * @tc.name   Json4Test052
     * @tc.number SUB_BUILTINS_Json4_TEST_5200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ExtractNumbersSumCompare = { strings: ["a12", "34b"], sum: 0 };
      const json = JSON.stringify(obj);
      const parsed: ExtractNumbersSumCompare = JSON.parse(json, (k: string, v: ExtractNumbersSumCompare) => {
        if (k === "") {
          let total = 0;
          v.strings.forEach(s => {
            let numStr = "";
            for (let i = 0; i < s.length; i++) {
              if (!isNaN(parseInt(s[i]))) {
                numStr += s[i];
              }
            }
            total += parseInt(numStr);
          });
          return { strings: v.strings, sum: total };
        }
        return v;
      });
      expect(parsed.sum).assertEqual(46);
    });
    /**
     * @tc.name   Json4Test053
     * @tc.number SUB_BUILTINS_Json4_TEST_5300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test53_Obj1 = { enumStatus: "active" };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: EnumMapObj = JSON.parse(jsonStr, (key, value: string) => {
        if (key === "enumStatus") {
          const map: Record<string, EnumStatus> = {
            "active": EnumStatus.Active,
            "inactive": EnumStatus.Inactive
          };
          return map[(value as string).toLowerCase()];
        }
        return value;
      });
      expect(parsedObj.enumStatus).assertEqual(EnumStatus.Active);
      expect(parsedObj.enumStatus).assertEqual(EnumStatus.Active.valueOf());
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
      const parsedObj: MultiPunctObj = JSON.parse(jsonStr);

      expect(parsedObj.en).assertEqual("Hello! How are you?");
      expect(parsedObj.de).assertEqual("Hallo! Wie geht es dir?");
      expect(parsedObj.fr).assertEqual("Bonjour! Comment allez-vous?");
    });

    /**
     * @tc.name   Json4Test055
     * @tc.number SUB_BUILTINS_Json4_TEST_5500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: PropLimitObj = { a: 1, b: 2, c: 3 };
      const jsonStr: string = JSON.stringify(originalObj, (key, value: string) => {
        if (key === "" || ["a", "b"].includes(key)) {
          return value;
        }
        return undefined;
      });
      const parsedObj: PropLimitObj = JSON.parse(jsonStr);
      expect(parsedObj.a).assertEqual(1);
      expect(parsedObj.b).assertEqual(2);
      expect(parsedObj.c).assertEqual(undefined);
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
      const parsedObj: MatrixObj = JSON.parse(jsonStr, (key, value: number[][]) => {
        if (key === "") {
          return {
            rows: (value as number[][]).length,
            cols: (value as number[][])[0]?.length || 0,
            data: value
          };
        }
        return value;
      });
      expect(parsedObj.rows).assertEqual(3);
      expect(parsedObj.cols).assertEqual(2);
      expect(parsedObj.data[1][1]).assertEqual(4);
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
      const parsedArr: string[][] = JSON.parse(jsonStr);

      expect(parsedArr[0][0]).assertEqual("a\u200B");
      expect(parsedArr[1][1]).assertEqual("d\u200B");
      expect(parsedArr[0][0].includes("\u200B")).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test058
     * @tc.number SUB_BUILTINS_Json4_TEST_5800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const validJson: string = '{"codes": ["A", "B", "C"]}';
      const invalidJson: string = '{"codes": ["A", "B"]}';
      let validResult: LengthValidatedObj | null = null;
      let invalidError: boolean = false;
      validResult = JSON.parse(validJson, (key, value: string[]) => {
        if (key === "codes" && (value as string[]).length !== 3) {
          throw new Error("codes must have 3 elements");
        }
        return value;
      });
      try {
        JSON.parse(invalidJson, (key, value: string[]) => {
          if (key === "codes" && (value as string[]).length !== 3) {
            throw new Error("codes must have 3 elements");
          }
          return value;
        });
      } catch (error) {
        invalidError = true;
      }
      expect(validResult?.codes.length).assertEqual(3);
      expect(invalidError).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test059
     * @tc.number SUB_BUILTINS_Json4_TEST_5900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: DeepEmptyFilterObj = {
        level1: {
          level2: { valid: "value", empty: {} }
        }
      };
      const jsonStr: string = JSON.stringify(originalObj, (key, value: DeepEmptyFilterObj) =>
      typeof value === "object" && value !== null && Object.keys(value).length === 0
        ? undefined
        : value
      );
      const parsedObj: DeepEmptyFilterObj = JSON.parse(jsonStr);

      expect(parsedObj.level1.level2.valid).assertEqual("value");
      expect(parsedObj.level1.level2.empty).assertEqual(undefined);
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
      const jsonStr: string = JSON.stringify(originalObj, (key, value: string) =>
      key === "password" ? undefined : value
      );
      const parsedObj: ArrSensitiveObj = JSON.parse(jsonStr);

      expect(parsedObj.users[0].password).assertEqual(undefined);
      expect(parsedObj.users[1].name).assertEqual("Eve");
    });

    /**
     * @tc.name   Json4Test061
     * @tc.number SUB_BUILTINS_Json4_TEST_6100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "Line1\u000BLine2";
      const jsonStr: string = JSON.stringify(originalStr);
      const parsedStr: string = JSON.parse(jsonStr);

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("\u000B")).assertEqual(true);
      expect(parsedStr.split("\u000B").length).assertEqual(2);
    });

    /**
     * @tc.name   Json4Test062
     * @tc.number SUB_BUILTINS_Json4_TEST_6200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test62_Obj3 = {
        user_id: 5,
        user_name: "Frank",
        contact_email: "frank@example.com"
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: RestructuredObj = JSON.parse(jsonStr, (key, value: Test62_Obj3) => {
        if (key === "") {
          return {
            user: ({
              id: value.user_id,
              name: value.user_name
            } as Test62_Obj1),
            contact: ({ email: value.contact_email } as Test62_Obj2)
          };
        }
        return value;
      });

      expect(parsedObj.user.id).assertEqual(5);
      expect(parsedObj.contact.email).assertEqual("frank@example.com");
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
      const originalObj: Test63_Obj1 = { a: 10, b: 20, c: 30 };
      const jsonStr: string = JSON.stringify(originalObj, (key, value: number) =>
      typeof value === "number" ? value.toString() : value
      );
      const parsedObj: NumToStringObj = JSON.parse(jsonStr);

      expect(parsedObj.a).assertEqual("10");
      expect(parsedObj.b).assertEqual("20");
      expect(typeof parsedObj.c).assertEqual("string");
    });

    /**
     * @tc.name   Json4Test064
     * @tc.number SUB_BUILTINS_Json4_TEST_6400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test64_Obj1 = {
        logs: [{
          events: [{ name: "start", time: "2024-01-01T00:00:00Z" }]
        }]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: DeepDateObj = JSON.parse(jsonStr, (key, value: string) =>
      key === "time" ? new Date(value as string) : value
      );

      expect(parsedObj.logs[0].events[0].time instanceof Date).assertEqual(true);
      expect(parsedObj.logs[0].events[0].time.toISOString()).assertEqual("2024-01-01T00:00:00.000Z");
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
      const parsedStr: string = JSON.parse(jsonStr);

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("🇨🇳")).assertEqual(true);
      expect(parsedStr.includes("🇺🇸")).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test066
     * @tc.number SUB_BUILTINS_Json4_TEST_6600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: FilteredArrObj = { numbers: [10, -5, 20, -30, 5] };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: FilteredArrObj = JSON.parse(jsonStr, (key, value: number[]) => {
        if (key === "numbers") {
          return (value as number[]).filter(num => num >= 0);
        }
        return value;
      });

      expect(JSON.stringify(parsedObj.numbers)).assertEqual(JSON.stringify([10, 20, 5]));
      expect(parsedObj.numbers.length).assertEqual(3);
    });

    /**
     * @tc.name   Json4Test067
     * @tc.number SUB_BUILTINS_Json4_TEST_6700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalSet: Set<number> = new Set([1, 2, 3, 2]);
      const jsonStr: string = JSON.stringify(originalSet, (key, value: Set<number>) =>
      value instanceof Set ? Array.from(value) : value
      );
      const parsedArr: number[] = JSON.parse(jsonStr);

      expect(JSON.stringify(parsedArr)).assertEqual(JSON.stringify([1, 2, 3]));
      expect(parsedArr.length).assertEqual(3);
    });

    /**
     * @tc.name   Json4Test068
     * @tc.number SUB_BUILTINS_Json4_TEST_6800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: MultiFilterCompare = {
        products: [
          { name: "A", price: 15, inStock: true },
          { name: "B", price: 25, inStock: false },
          { name: "C", price: 20, inStock: true }
        ],
        filtered: []
      };
      const json = JSON.stringify(obj);
      const parsed: MultiFilterCompare = JSON.parse(json, (k: string, v: MultiFilterCompare) => {
        if (k === "") {
          const f: Test68_Obj2[] = [];
          v.products.forEach(p => {
            if (p.price >= 18 && p.price <= 22 && p.inStock) {
              f.push(p);
            }
          });
          return { products: v.products, filtered: f };
        }
        return v;
      });
      expect(parsed.filtered.length).assertEqual(1);
      expect(parsed.filtered[0].name).assertEqual("C");
    });

    /**
     * @tc.name   Json4Test069
     * @tc.number SUB_BUILTINS_Json4_TEST_6900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[] = [
        "\x08Backspace",
        "Tab\x09",
        "Form\x0CFeed"
      ];
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedArr: string[] = JSON.parse(jsonStr);

      expect(parsedArr[0]).assertEqual("\x08Backspace");
      expect(parsedArr[1]).assertEqual("Tab\x09");
      expect(parsedArr[2].charCodeAt(4)).assertEqual(12);
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
      const jsonStr: string = JSON.stringify(originalObj, (key, value: string) => {
        if (key === "phone" && typeof value === "string") {
          return value.replace(/(\d{3})\d*(\d{4})/, "$1****$2");
        }
        if (key === "email" && typeof value === "string") {
          return value.replace(/(.{2}).*@/, "$1***@");
        }
        return value;
      });
      const parsedObj: MaskedObj = JSON.parse(jsonStr);

      expect(parsedObj.phone).assertEqual("138****8000");
      expect(parsedObj.email).assertEqual("us***@example.com");
    });

    /**
     * @tc.name   Json4Test071
     * @tc.number SUB_BUILTINS_Json4_TEST_7100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: number[] = [10, 20, 30];
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedObj: StatsObj = JSON.parse(jsonStr, (key, value: number[]) => {
        if (key === "") {
          const data = value as number[];
          const sum = data.reduce((a, b) => a + b, 0);
          return {
            data,
            sum,
            avg: sum / data.length,
            max: Math.max(...data)
          };
        }
        return value;
      });

      expect(parsedObj.sum).assertEqual(60);
      expect(parsedObj.avg).assertEqual(20);
      expect(parsedObj.max).assertEqual(30);
    });

    /**
     * @tc.name   Json4Test072
     * @tc.number SUB_BUILTINS_Json4_TEST_7200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: DeepSpecialArr = [
        "![]",
        [["$%^"], ["&*()"]]
      ];
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedArr: DeepSpecialArr = JSON.parse(jsonStr);

      expect(parsedArr[0]).assertEqual("![]");
      expect(((parsedArr[1] as string[][])[0])[0]).assertEqual("$%^");
      expect(((parsedArr[1] as string[][])[1])[0]).assertEqual("&*()");
    });

    /**
     * @tc.name   Json4Test073
     * @tc.number SUB_BUILTINS_Json4_TEST_7300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: DeepEmptyArrFilterObj = {
        level1: {
          level2: [{
            valid: [1, 2],
            empty: []
          }]
        }
      };
      const parsedObj: DeepEmptyArrFilterObj = JSON.parse(JSON.stringify(originalObj), (key, value: number[]) =>
      Array.isArray(value) && value.length === 0 ? undefined : value
      );

      expect(parsedObj.level1.level2[0].valid.length).assertEqual(2);
      expect(parsedObj.level1.level2[0].empty).assertEqual(undefined);
    });

    /**
     * @tc.name   Json4Test074
     * @tc.number SUB_BUILTINS_Json4_TEST_7400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CircularSafeObj = { name: "child" };
      const parent: CircularSafeObj = { name: "parent", parent: obj };
      obj.parent = parent;
      const seen = new Set<CircularSafeObj>();
      const jsonStr: string = JSON.stringify(parent, (key, value: CircularSafeObj) => {
        if (value && typeof value === "object") {
          if (seen.has(value as CircularSafeObj)) {
            return "[Circular Reference]";
          }
          seen.add(value as CircularSafeObj);
        }
        return value;
      });
      const parsedObj: CircularSafeObj = JSON.parse(jsonStr);

      expect(parsedObj.name).assertEqual("parent");
    });

    /**
     * @tc.name   Json4Test075
     * @tc.number SUB_BUILTINS_Json4_TEST_7500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: RemoveElementCompare = { strings: ["a", "b", "a", "c"], cleaned: [] };
      const json = JSON.stringify(obj);
      const parsed: RemoveElementCompare = JSON.parse(json, (k: string, v: RemoveElementCompare) => {
        if (k === "") {
          const c: string[] = [];
          v.strings.forEach(s => {
            if (s !== "a") {
              c.push(s);
            }
          });
          return { strings: v.strings, cleaned: c };
        }
        return v;
      });
      expect(parsed.cleaned.length).assertEqual(2);
      expect(parsed.cleaned[0]).assertEqual("b");
      expect(parsed.cleaned[1]).assertEqual("c");
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
      const parsedObj: MixedTypeKeyObj = JSON.parse(jsonStr);

      expect(parsedObj.a).assertEqual("2");
      expect(typeof parsedObj.a).assertEqual("string");
    });

    /**
     * @tc.name   Json4Test077
     * @tc.number SUB_BUILTINS_Json4_TEST_7700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: MultiLangArr = [
        ["中文", "English"],
        ["日本語", "한국어"]
      ];
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedArr: MultiLangArr = JSON.parse(jsonStr);

      expect((parsedArr[0] as string[])[0]).assertEqual("中文");
      expect((parsedArr[1] as string[])[0]).assertEqual("日本語");
      expect((parsedArr[1] as string[])[1]).assertEqual("한국어");
    });

    /**
     * @tc.name   Json4Test078
     * @tc.number SUB_BUILTINS_Json4_TEST_7800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: UpperCountCompare = { strings: ["AbcDE", "fGhIj"], counts: [] };
      const json = JSON.stringify(obj);
      const parsed: UpperCountCompare = JSON.parse(json, (k: string, v: UpperCountCompare) => {
        if (k === "") {
          const c: number[] = [];
          v.strings.forEach(s => {
            let count = 0;
            for (let i = 0; i < s.length; i++) {
              if (s[i] === s[i].toUpperCase() && s[i] !== s[i].toLowerCase()) {
                count++;
              }
            }
            c.push(count);
          });
          return { strings: v.strings, counts: c };
        }
        return v;
      });
      expect(parsed.counts[0]).assertEqual(3);
      expect(parsed.counts[1]).assertEqual(2);
    });

    /**
     * @tc.name   Json4Test079
     * @tc.number SUB_BUILTINS_Json4_TEST_7900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedObj: TransposedMatrixObj = JSON.parse(jsonStr, (key, value: number[][]) => {
        if (key === "") {
          const matrix = value as number[][];
          return {
            transposed: matrix[0].map((_, colIndex) =>
            matrix.map(row => row[colIndex])
            )
          };
        }
        return value;
      });
      expect(JSON.stringify(parsedObj.transposed)).assertEqual(JSON.stringify([[1, 3, 5], [2, 4, 6]]));
      expect(parsedObj.transposed.length).assertEqual(2);
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
      const parsedStr: string = JSON.parse(jsonStr);
      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("\u200D")).assertEqual(true);
      expect(parsedStr.length).assertEqual(3);
    });

    /**
     * @tc.name   Json4Test081
     * @tc.number SUB_BUILTINS_Json4_TEST_8100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: StdDevCompare = { numbers: [1, 2, 3, 4, 5], stdDev: 0 };
      const json = JSON.stringify(obj);
      const parsed: StdDevCompare = JSON.parse(json, (k: string, v: StdDevCompare) => {
        if (k === "") {
          const avg = v.numbers.reduce((a, b) => a + b, 0) / v.numbers.length;
          const squareDiffs = v.numbers.map(n => Math.pow(n - avg, 2));
          const variance = squareDiffs.reduce((a, b) => a + b, 0) / squareDiffs.length;
          return { numbers: v.numbers, stdDev: Math.sqrt(variance) };
        }
        return v;
      });
      expect(parsed.stdDev).assertEqual(Math.sqrt(2));
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
      const parsedObj: SpecialNumFilterObj = JSON.parse(jsonStr);

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
      const parsedObj: DeepSpecialNumObj = JSON.parse(jsonStr);

      expect(parsedObj.level1.nan).assertEqual(null);
      expect(parsedObj.level1.level2.inf).assertEqual(null);
      expect(parsedObj.level1.level2.num).assertEqual(200);
    });

    /**
     * @tc.name   Json4Test084
     * @tc.number SUB_BUILTINS_Json4_TEST_8400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "File1\u001CFile2\u001CFile3";
      const jsonStr: string = JSON.stringify(originalStr);
      const parsedStr: string = JSON.parse(jsonStr);

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.split("\u001C").length).assertEqual(3);
    });

    /**
     * @tc.name   Json4Test085
     * @tc.number SUB_BUILTINS_Json4_TEST_8500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: GradeConvertCompare = { scores: [85, 60, 45], grades: [] };
      const json = JSON.stringify(obj);
      const parsed: GradeConvertCompare = JSON.parse(json, (k: string, v: GradeConvertCompare) => {
        if (k === "") {
          const g: string[] = [];
          v.scores.forEach(s => {
            if (s >= 80) {
              g.push("A");
            } else if (s >= 60) {
              g.push("B");
            } else {
              g.push("C");
            }
          });
          return { scores: v.scores, grades: g };
        }
        return v;
      });
      expect(parsed.grades[0]).assertEqual("A");
      expect(parsed.grades[1]).assertEqual("B");
      expect(parsed.grades[2]).assertEqual("C");
    });

    /**
     * @tc.name   Json4Test086
     * @tc.number SUB_BUILTINS_Json4_TEST_8600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: StrLengthFilterObj = { long: "length6", short: "len4" };
      const jsonStr: string = JSON.stringify(originalObj, (key, value: string) =>
      typeof value === "string" && value.length < 5 ? undefined : value
      );
      const parsedObj: StrLengthFilterObj = JSON.parse(jsonStr);

      expect(parsedObj.long).assertEqual("length6");
      expect(parsedObj.short).assertEqual(undefined);
    });

    /**
     * @tc.name   Json4Test087
     * @tc.number SUB_BUILTINS_Json4_TEST_8700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test87_Obj5 = {
        groups: [{ items: [{ value: 10 }, { value: 20 }] }]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: DeepAggregateObj = JSON.parse(jsonStr, (key, value: Test87_Obj4[]) => {
        if (key === "items") {
          const total = (value as Test87_Obj4[]).reduce((sum, item) => sum + item.value, 0);
          return { items: value, total };
        }
        return value;
      });
      expect(parsedObj.groups[0].total).assertEqual(undefined);
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
      const parsedStr: string = JSON.parse(jsonStr);

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("👨🏿‍💻")).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test089
     * @tc.number SUB_BUILTINS_Json4_TEST_8900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: EmptyStrArrFilterObj = { tags: ["js", "", "json", ""] };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: EmptyStrArrFilterObj = JSON.parse(jsonStr, (key, value: string[]) => {
        if (key === "tags") {
          return (value as string[]).filter(tag => tag !== "");
        }
        return value;
      });
      expect(JSON.stringify(parsedObj.tags)).assertEqual(JSON.stringify(["js", "json"]));
      expect(parsedObj.tags.length).assertEqual(2);
    });

    /**
     * @tc.name   Json4Test090
     * @tc.number SUB_BUILTINS_Json4_TEST_9000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: PalindromeCheckCompare = { strings: ["abcba", "hello", "level"], isPalindrome: [] };
      const json = JSON.stringify(obj);
      const parsed: PalindromeCheckCompare = JSON.parse(json, (k: string, v: PalindromeCheckCompare) => {
        if (k === "") {
          const p: boolean[] = [];
          v.strings.forEach(s => {
            let isPal = true;
            for (let i = 0; i < s.length / 2; i++) {
              if (s[i] !== s[s.length - 1 - i]) {
                isPal = false;
                break;
              }
            }
            p.push(isPal);
          });
          return { strings: v.strings, isPalindrome: p };
        }
        return v;
      });
      expect(parsed.isPalindrome[0]).assertEqual(true);
      expect(parsed.isPalindrome[1]).assertEqual(false);
    });

    /**
     * @tc.name   Json4Test091
     * @tc.number SUB_BUILTINS_Json4_TEST_9100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FibonacciCompare = { count: [5], sequence: [] };
      const json = JSON.stringify(obj);
      const parsed: FibonacciCompare = JSON.parse(json, (k: string, v: FibonacciCompare) => {
        if (k === "") {
          const s: number[] = [];
          const c = v.count[0];
          let a = 0, b = 1;
          for (let i = 0; i < c; i++) {
            s.push(a);
            const temp = a;
            a = b;
            b = temp + b;
          }
          return { count: v.count, sequence: s };
        }
        return v;
      });
      expect(parsed.sequence.length).assertEqual(5);
      expect(parsed.sequence[0]).assertEqual(0);
      expect(parsed.sequence[4]).assertEqual(3);
    });
    /**
     * @tc.name   Json4Test092
     * @tc.number SUB_BUILTINS_Json4_TEST_9200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[] = [
        "Record1\u001EField1",
        "Record2\u001EField2"
      ];
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedArr: string[] = JSON.parse(jsonStr);

      expect(parsedArr[0]).assertEqual("Record1\u001EField1");
      expect(parsedArr[1].includes("\u001E")).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test093
     * @tc.number SUB_BUILTINS_Json4_TEST_9300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SubstringConcatCompare = { strings: ["abcde", "fghij"], result: "" };
      const json = JSON.stringify(obj);
      const parsed: SubstringConcatCompare = JSON.parse(json, (k: string, v: SubstringConcatCompare) => {
        if (k === "") {
          let r = "";
          v.strings.forEach(s => {
            r += s.substring(1, 4);
          });
          return { strings: v.strings, result: r };
        }
        return v;
      });
      expect(parsed.result).assertEqual("bcdghi");
    });

    /**
     * @tc.name   Json4Test094
     * @tc.number SUB_BUILTINS_Json4_TEST_9400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: MaxSubarrayCompare = { numbers: [-2, 1, -3, 4, -1], maxSum: 0 };
      const json = JSON.stringify(obj);
      const parsed: MaxSubarrayCompare = JSON.parse(json, (k: string, v: MaxSubarrayCompare) => {
        if (k === "") {
          let max = v.numbers[0];
          let current = v.numbers[0];
          for (let i = 1; i < v.numbers.length; i++) {
            current = Math.max(v.numbers[i], current + v.numbers[i]);
            max = Math.max(max, current);
          }
          return { numbers: v.numbers, maxSum: max };
        }
        return v;
      });
      expect(parsed.maxSum).assertEqual(4);
    });

    /**
     * @tc.name   Json4Test095
     * @tc.number SUB_BUILTINS_Json4_TEST_9500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = "[true, false, null]";
      const parsedObj: KeywordArrObj = JSON.parse(jsonStr);
      expect(parsedObj.values[0]).assertEqual(undefined);
      expect(parsedObj.values[1]).assertEqual(undefined);
      expect(parsedObj.values[2]).assertEqual(undefined);
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
      const parsedObj: MathSymbolObj = JSON.parse(jsonStr);

      expect(parsedObj.formulas.axToBb).assertEqual("sum");
      expect(parsedObj.formulas.nested.cxToAd).assertEqual(100);
    });

    /**
     * @tc.name   Json4Test097
     * @tc.number SUB_BUILTINS_Json4_TEST_9700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: DeepEmptyStrFilterObj = {
        level1: [{ level2: ["a", "", "b", ""] }]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: DeepEmptyStrFilterObj = JSON.parse(jsonStr, (key, value: string[]) =>
      Array.isArray(value) ? (value as string[]).filter(v => v !== "") : value
      );
      expect(JSON.stringify(parsedObj.level1[0].level2)).assertEqual(JSON.stringify(["a", "b"]));
      expect(parsedObj.level1[0].level2.length).assertEqual(2);
    });

    /**
     * @tc.name   Json4Test098
     * @tc.number SUB_BUILTINS_Json4_TEST_9800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: NestedSetArr = [
        new Set([1, 2]),
        [3, new Set([4, 5])]
      ];
      const jsonStr: string = JSON.stringify(originalArr, (key, value: NestedSetArr) =>
      value instanceof Set ? Array.from(value) : value
      );
      const parsedArr: number[][] = JSON.parse(jsonStr) as number[][];

      expect(JSON.stringify(parsedArr[0])).assertEqual(JSON.stringify([1, 2]));
      expect(JSON.stringify(parsedArr[1])).assertEqual(JSON.stringify([3, [4, 5]]));
    });

    /**
     * @tc.name   Json4Test099
     * @tc.number SUB_BUILTINS_Json4_TEST_9900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test99_Obj1 = {
        tasks: [
          { name: "Task1", priority: "Low" },
          { name: "Task2", priority: "High" }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: PriorityMapObj = JSON.parse(jsonStr, (key, value: Priority) => {
        if (key === "priority") {
          return Priority[value as Priority];
        }
        return value;
      });

      expect(parsedObj.tasks[0].priority).assertEqual(Priority.Low);
      expect(parsedObj.tasks[1].priority).assertEqual(Priority.High);
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
      const parsedObj: MultiBracketObj = JSON.parse(jsonStr);
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
      const jsonStr: string = JSON.stringify(originalObj, (key, value: number) => {
        if (key === "score") {
          return Math.min(100, value as number);
        }
        if (key === "age") {
          return Math.max(0, value as number);
        }
        return value;
      });
      const parsedObj: ValueClampObj = JSON.parse(jsonStr);

      expect(parsedObj.score).assertEqual(100);
      expect(parsedObj.age).assertEqual(0);
    });

    /**
     * @tc.name   Json4Test102
     * @tc.number SUB_BUILTINS_Json4_TEST_10200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: number[][][] = [[[1, 2]], [[3, 4], [5]]];
      const jsonStr: string = JSON.stringify(originalArr);
      const flatten3D = (arr: number[][][]): number[] =>
      arr.reduce((acc, val) => acc.concat(
        val.reduce((acc2, val2) => acc2.concat(val2), [] as number[])
      ), [] as number[]);
      const parsedObj: Flatten3DObj = JSON.parse(jsonStr, (key, value: number[][][]) => {
        if (key === "") {
          return { flattened: flatten3D(value as number[][][]) };
        }
        return value;
      });

      expect(JSON.stringify(parsedObj.flattened)).assertEqual(JSON.stringify([1, 2, 3, 4, 5]));
      expect(parsedObj.flattened.length).assertEqual(5);
    });

    /**
     * @tc.name   Json4Test103
     * @tc.number SUB_BUILTINS_Json4_TEST_10300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: DeepZeroWidthArr = [
        "a\u200B",
        [["b\u200Bc"], ["d"]]
      ];
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedArr: DeepZeroWidthArr = JSON.parse(jsonStr);

      expect(parsedArr[0]).assertEqual("a\u200B");
      expect(((parsedArr[1] as string[][])[0])[0]).assertEqual("b\u200Bc");
    });

    /**
     * @tc.name   Json4Test104
     * @tc.number SUB_BUILTINS_Json4_TEST_10400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: DeepUndefinedFilterObj = {
        level1: {
          level2: { valid: "value", undef: undefined }
        }
      };
      const jsonStr: string = JSON.stringify(originalObj, (key, value: string | undefined) =>
      value === undefined ? undefined : value
      );
      const parsedObj: DeepUndefinedFilterObj = JSON.parse(jsonStr);

      expect(parsedObj.level1.level2.valid).assertEqual("value");
      expect(parsedObj.level1.level2.undef).assertEqual(undefined);
    });

    /**
     * @tc.name   Json4Test105
     * @tc.number SUB_BUILTINS_Json4_TEST_10500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: MultiReplaceCompare = { strings: ["abcde", "fghij"], replaced: [] };
      const json = JSON.stringify(obj);
      const parsed: MultiReplaceCompare = JSON.parse(json, (k: string, v: MultiReplaceCompare) => {
        if (k === "") {
          const r: string[] = [];
          v.strings.forEach(s => {
            let newStr = "";
            for (let i = 0; i < s.length; i++) {
              newStr += s[i] === "a" || s[i] === "i" ? "*" : s[i];
            }
            r.push(newStr);
          });
          return { strings: v.strings, replaced: r };
        }
        return v;
      });
      expect(parsed.replaced[0]).assertEqual("*bcde");
      expect(parsed.replaced[1]).assertEqual("fgh*j");
    });

    /**
     * @tc.name   Json4Test106
     * @tc.number SUB_BUILTINS_Json4_TEST_10600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "Field1\u001FValue1\u001FField2\u001FValue2";
      const jsonStr: string = JSON.stringify(originalStr);
      const parsedStr: string = JSON.parse(jsonStr);

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.split("\u001F").length).assertEqual(4);
    });

    /**
     * @tc.name   Json4Test107
     * @tc.number SUB_BUILTINS_Json4_TEST_10700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test107_Obj1 = {
        id: 101,
        name: "Laptop",
        price: 1000
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: ProductObj = JSON.parse(jsonStr, (key, value: Test107_Obj1) => {
        if (key === "") {
          return new Product(value.id, value.name, value.price);
        }
        return value;
      });
      expect(parsedObj.item instanceof Product).assertEqual(false);
    });

    /**
     * @tc.name   Json4Test108
     * @tc.number SUB_BUILTINS_Json4_TEST_10800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: VowelRatioCompare = { strings: ["apple", "xyz"], ratios: [] };
      const json = JSON.stringify(obj);
      const parsed: VowelRatioCompare = JSON.parse(json, (k: string, v: VowelRatioCompare) => {
        if (k === "") {
          const r: number[] = [];
          const vowels = ["a", "e", "i", "o", "u"];
          v.strings.forEach(s => {
            let count = 0;
            for (let i = 0; i < s.length; i++) {
              if (vowels.includes(s[i].toLowerCase())) {
                count++;
              }
            }
            r.push(count / s.length);
          });
          return { strings: v.strings, ratios: r };
        }
        return v;
      });
      expect(parsed.ratios[0]).assertEqual(2 / 5);
      expect(parsed.ratios[1]).assertEqual(0);
    });

    /**
     * @tc.name   Json4Test109
     * @tc.number SUB_BUILTINS_Json4_TEST_10900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test109_Obj2 = {
        users: [{ id: 1, age: 20 }, { id: 2, age: 30 }]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: DeepPropConvertObj = JSON.parse(jsonStr, (key, value: number) =>
      key === "id" ? value.toString() : value
      );
      expect(parsedObj.users[0].id).assertEqual("1");
      expect(parsedObj.users[1].id).assertEqual("2");
      expect(typeof parsedObj.users[0].id).assertEqual("string");
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
      const parsedStr: string = JSON.parse(jsonStr);

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("🏴󠁧󠁢󠁥󠁮󠁧󠁿")).assertEqual(true);
      expect(parsedStr.includes("🇪🇸")).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test111
     * @tc.number SUB_BUILTINS_Json4_TEST_11100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: UniqueDeepObjArr = {
        items: [
          { id: 1, name: "A" },
          { id: 2, name: "B" },
          { id: 1, name: "A" }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: UniqueDeepObjArr = JSON.parse(jsonStr, (key, value: Test111_Obj3[]) => {
        if (key === "items") {
          const seen = new Set<number>();
          return (value as Test111_Obj3[]).filter(item => {
            if (seen.has(item.id)) {
              return false;
            }
            seen.add(item.id);
            return true;
          });
        }
        return value;
      });

      expect(parsedObj.items.length).assertEqual(2);
      expect(JSON.stringify(parsedObj.items.map(i => i.id))).assertEqual(JSON.stringify([1, 2]));
    });

    /**
     * @tc.name   Json4Test112
     * @tc.number SUB_BUILTINS_Json4_TEST_11200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: AbsoluteDiffsCompare = { numbers: [5, 2, 7], diffs: [] };
      const json = JSON.stringify(obj);
      const parsed: AbsoluteDiffsCompare = JSON.parse(json, (k: string, v: AbsoluteDiffsCompare) => {
        if (k === "") {
          const d: number[] = [];
          for (let i = 0; i < v.numbers.length - 1; i++) {
            d.push(Math.abs(v.numbers[i] - v.numbers[i + 1]));
          }
          return { numbers: v.numbers, diffs: d };
        }
        return v;
      });
      expect(parsed.diffs.length).assertEqual(2);
      expect(parsed.diffs[0]).assertEqual(3);
      expect(parsed.diffs[1]).assertEqual(5);
    });

    /**
     * @tc.name   Json4Test113
     * @tc.number SUB_BUILTINS_Json4_TEST_11300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SumAvgCompare = {
        data: [{ value: 10 }, { value: 20 }, { value: 30 }],
        sum: 0,
        avg: 0
      };
      const json = JSON.stringify(obj);
      const parsed: SumAvgCompare = JSON.parse(json, (k: string, v: SumAvgCompare) => {
        if (k === "") {
          let s = 0;
          v.data.forEach(item => s += item.value);
          return { data: v.data, sum: s, avg: s / v.data.length };
        }
        return v;
      });
      expect(parsed.sum).assertEqual(60);
      expect(parsed.avg).assertEqual(20);
    });

    /**
     * @tc.name   Json4Test114
     * @tc.number SUB_BUILTINS_Json4_TEST_11400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: MixedSpecialArr = [
        "!@#$",
        [["%^&*"], ["()[]{}"]]
      ];
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedArr: MixedSpecialArr = JSON.parse(jsonStr);
      expect(parsedArr[0]).assertEqual("!@#$");
      expect(((parsedArr[1] as string[][])[0])[0]).assertEqual("%^&*");
      expect(((parsedArr[1] as string[][])[1])[0]).assertEqual("()[]{}");
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
      const jsonStr: string = JSON.stringify(originalObj, (key, value: string) => {
        if (key === "cardNumber" && typeof value === "string") {
          return value.replace(/^(\d{4})\d*(\d{4})$/, "$1********$2");
        }
        return value;
      });
      const parsedObj: PartialMaskObj = JSON.parse(jsonStr);
      expect(parsedObj.cardNumber).assertEqual("6222********0123");
      expect(parsedObj.phone).assertEqual("13800138000");
    });

    /**
     * @tc.name   Json4Test116
     * @tc.number SUB_BUILTINS_Json4_TEST_11600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test116_Obj2 = {
        items: [
          { id: 1, old: 10, new: 15 },
          { id: 2, old: 20, new: 18 }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);

      const parsedObj: DiffObj = JSON.parse(jsonStr, (key, value: Test116_Obj2) => {
        if (key === "") {
          const changes = (value.items as Test116_Obj3[]).map(item => ({
            id: item.id,
            diff: item.new - item.old
          } as Test116_Obj1));
          return { changes };
        }
        return value;
      });
      expect(parsedObj.changes[0].diff).assertEqual(5);
      expect(parsedObj.changes[1].diff).assertEqual(-2);
    });

    /**
     * @tc.name   Json4Test117
     * @tc.number SUB_BUILTINS_Json4_TEST_11700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: MathFormulaObj = {
        equations: {
          linear: "y = mx + b",
          quadratic: {
            formula: "ax² + bx + c = 0",
            variables: ["a", "b", "c"]
          }
        }
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: MathFormulaObj = JSON.parse(jsonStr);

      expect(parsedObj.equations.linear).assertEqual("y = mx + b");
      expect(parsedObj.equations.quadratic.formula).assertEqual("ax² + bx + c = 0");
    });

    /**
     * @tc.name   Json4Test118
     * @tc.number SUB_BUILTINS_Json4_TEST_11800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: DeepEmptyArrCleanObj = {
        level1: {
          level2: [{ valid: [1, 2], empty: [] }]
        }
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: DeepEmptyArrCleanObj = JSON.parse(jsonStr, (key, value: number[]) =>
      Array.isArray(value) && value.length === 0 ? undefined : value
      );
      expect(parsedObj.level1.level2[0].valid.length).assertEqual(2);
      expect(parsedObj.level1.level2[0].empty).assertEqual(undefined);
    });

    /**
     * @tc.name   Json4Test119
     * @tc.number SUB_BUILTINS_Json4_TEST_11900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: BinaryOneCountCompare = { numbers: [3, 5], counts: [] };
      const json = JSON.stringify(obj);
      const parsed: BinaryOneCountCompare = JSON.parse(json, (k: string, v: BinaryOneCountCompare) => {
        if (k === "") {
          const c: number[] = [];
          v.numbers.forEach(n => {
            let num = n;
            let count = 0;
            while (num > 0) {
              if (num % 2 === 1) {
                count++;
              }
              num = Math.floor(num / 2);
            }
            c.push(count);
          });
          return { numbers: v.numbers, counts: c };
        }
        return v;
      });
      expect(parsed.counts[0]).assertEqual(2);
      expect(parsed.counts[1]).assertEqual(2);
    });

    /**
     * @tc.name   Json4Test120
     * @tc.number SUB_BUILTINS_Json4_TEST_12000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: VowelSortCompare = { words: ["apple", "banana", "cat"], sorted: [] };
      const json = JSON.stringify(obj);
      const parsed: VowelSortCompare = JSON.parse(json, (k: string, v: VowelSortCompare) => {
        if (k === "") {
          const vowels = ["a", "e", "i", "o", "u"];
          const temp = [...v.words];
          temp.sort((a, b) => {
            let countA = 0, countB = 0;
            a.split("").forEach(c => {
              if (vowels.includes(c)) {
                countA++;
              }
            });
            b.split("").forEach(c => {
              if (vowels.includes(c)) {
                countB++;
              }
            });
            return countA - countB;
          });
          return { words: v.words, sorted: temp };
        }
        return v;
      });
      expect(parsed.sorted[0]).assertEqual("cat");
      expect(parsed.sorted[2]).assertEqual("banana");
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
      const parsedObj: MultiQuoteObj = JSON.parse(jsonStr);
      expect(parsedObj.text).assertEqual('中文“引号”、英文"引号"、日文「引用」');
      expect(parsedObj.text.includes("“")).assertEqual(true);
      expect(parsedObj.text.includes("「")).assertEqual(true);
    });
    /**
     * @tc.name   Json4Test122
     * @tc.number SUB_BUILTINS_Json4_TEST_12200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: number[] = [5, 15, 25, 35];
      const jsonStr: string = JSON.stringify(originalArr, (key, value: number) =>
      key !== "" && typeof value === "number" && value > 20 ? 20 : value
      );
      const parsedArr: number[] = JSON.parse(jsonStr);
      expect(JSON.stringify(parsedArr)).assertEqual(JSON.stringify([5, 15, 20, 20]));
    });

    /**
     * @tc.name   Json4Test123
     * @tc.number SUB_BUILTINS_Json4_TEST_12300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[] = ["a", "b", "a", "c", "a", "b"];
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedObj: FrequencyDistObj = JSON.parse(jsonStr, (key, value: string[]) => {
        if (key === "") {
          return {
            distribution: (value as string[]).reduce((dist, item) => {
              dist[item] = (dist[item] || 0) + 1;
              return dist;
            }, {} as Record<string, number>)
          };
        }
        return value;
      });

      expect(parsedObj.distribution.a).assertEqual(3);
      expect(parsedObj.distribution.b).assertEqual(2);
      expect(parsedObj.distribution.c).assertEqual(1);
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
      const parsedObj: DeepZeroWidthObj = JSON.parse(jsonStr);

      expect(parsedObj.level1.keyy).assertEqual("value\u200C1");
      expect(parsedObj.level1.level2.keyx).assertEqual(100);
    });

    /**
     * @tc.name   Json4Test125
     * @tc.number SUB_BUILTINS_Json4_TEST_12500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: DeepEmptyStrCleanObj = {
        level1: {
          level2: { valid: "value", empty: "" }
        }
      };
      const jsonStr: string = JSON.stringify(originalObj, (key, value: string) =>
      value === "" ? undefined : value
      );
      const parsedObj: DeepEmptyStrCleanObj = JSON.parse(jsonStr);
      expect(parsedObj.level1.level2.valid).assertEqual("value");
      expect(parsedObj.level1.level2.empty).assertEqual(undefined);
    });

    /**
     * @tc.name   Json4Test126
     * @tc.number SUB_BUILTINS_Json4_TEST_12600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: DeepUniqueObjArr = {
        products: [
          { id: 1, details: { sku: "ABC123" } },
          { id: 2, details: { sku: "DEF456" } },
          { id: 1, details: { sku: "ABC123" } }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: DeepUniqueObjArr = JSON.parse(jsonStr, (key, value: Test126_Obj1[]) => {
        if (key === "products") {
          const seen = new Set<string>();
          return (value as Test126_Obj1[]).filter(item => {
            const key = `${item.id}-${item.details.sku}`;
            if (seen.has(key)) {
              return false;
            }
            seen.add(key);
            return true;
          });
        }
        return value;
      });

      expect(parsedObj.products.length).assertEqual(2);
      expect(parsedObj.products[0].details.sku).assertEqual("ABC123");
    });

    /**
     * @tc.name   Json4Test127
     * @tc.number SUB_BUILTINS_Json4_TEST_12700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "Group1\u001DItem1\u001DItem2";
      const jsonStr: string = JSON.stringify(originalStr);
      const parsedStr: string = JSON.parse(jsonStr);
      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.split("\u001D").length).assertEqual(3);
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
      const parsedObj: ApiResponse = JSON.parse(jsonStr, (key, value: number | string) => {
        if (key === "code" && typeof value !== "number") {
          throw new Error("code must be number");
        }
        if (key === "message" && typeof value !== "string") {
          throw new Error("message must be string");
        }
        return value;
      });
      expect(parsedObj.code).assertEqual(200);
      expect(typeof parsedObj.data.timestamp).assertEqual("number");
    });

    /**
     * @tc.name   Json4Test129
     * @tc.number SUB_BUILTINS_Json4_TEST_12900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: RegexFilterObj = {
        email: "user@example.com",
        phone: "12345"
      };
      const emailRegex = /^[\w.-]+@[a-zA-Z0-9-]+\.[a-zA-Z]+$/;
      const jsonStr: string = JSON.stringify(originalObj, (key, value: string) =>
      typeof value === "string" && !emailRegex.test(value) ? undefined : value
      );
      const parsedObj: RegexFilterObj = JSON.parse(jsonStr);

      expect(parsedObj.email).assertEqual("user@example.com");
      expect(parsedObj.phone).assertEqual(undefined);
    });

    /**
     * @tc.name   Json4Test130
     * @tc.number SUB_BUILTINS_Json4_TEST_13000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FibIndexCompare = { indices: [5, 7], fibValues: [] };
      const json = JSON.stringify(obj);
      const parsed: FibIndexCompare = JSON.parse(json, (k: string, v: FibIndexCompare) => {
        if (k === "") {
          const f: number[] = [];
          v.indices.forEach(idx => {
            let a = 0, b = 1;
            for (let i = 0; i < idx; i++) {
              const temp = a;
              a = b;
              b = temp + b;
            }
            f.push(a);
          });
          return { indices: v.indices, fibValues: f };
        }
        return v;
      });
      expect(parsed.fibValues[0]).assertEqual(5);
      expect(parsed.fibValues[1]).assertEqual(13);
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
      const parsedStr: string = JSON.parse(jsonStr);

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("🍕")).assertEqual(true);
      expect(parsedStr.includes("🍔")).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test132
     * @tc.number SUB_BUILTINS_Json4_TEST_13200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: ValidObjFilterArr = {
        users: [
          { id: 1, name: "Alice" },
          { id: 2, name: "Charlie" }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: ValidObjFilterArr = JSON.parse(jsonStr, (key, value: Test132_Obj1[]) => {
        if (key === "users") {
          return (value as Test132_Obj1[]).filter(user => user.id !== undefined);
        }
        return value;
      });

      expect(parsedObj.users.length).assertEqual(2);
      expect(parsedObj.users[0].name).assertEqual("Alice");
    });

    /**
     * @tc.name   Json4Test133
     * @tc.number SUB_BUILTINS_Json4_TEST_13300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FirstGreaterCompare = { numbers: [2, 5, 7, 10], target: 6, result: null };
      const json = JSON.stringify(obj);
      const parsed: FirstGreaterCompare = JSON.parse(json, (k: string, v: FirstGreaterCompare) => {
        if (k === "") {
          let res: number | null = null;
          for (let i = 0; i < v.numbers.length; i++) {
            if (v.numbers[i] > v.target) {
              res = v.numbers[i];
              break;
            }
          }
          return { numbers: v.numbers, target: v.target, result: res };
        }
        return v;
      });
      expect(parsed.result).assertEqual(7);
    });

    /**
     * @tc.name   Json4Test134
     * @tc.number SUB_BUILTINS_Json4_TEST_13400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: UniquePropsCompare = {
        items: [
          { category: "A" },
          { category: "B" },
          { category: "A" }
        ],
        uniqueCategories: []
      };
      const json = JSON.stringify(obj);
      const parsed: UniquePropsCompare = JSON.parse(json, (k: string, v: UniquePropsCompare) => {
        if (k === "") {
          const u: string[] = [];
          v.items.forEach(item => {
            if (!u.includes(item.category)) {
              u.push(item.category);
            }
          });
          return { items: v.items, uniqueCategories: u };
        }
        return v;
      });
      expect(parsed.uniqueCategories.length).assertEqual(2);
      expect(parsed.uniqueCategories[0]).assertEqual("A");
      expect(parsed.uniqueCategories[1]).assertEqual("B");

    });

    /**
     * @tc.name   Json4Test135
     * @tc.number SUB_BUILTINS_Json4_TEST_13500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: NestedControlCharObj = {
        level1: { text: "Start\u0002Middle\u0003End" }
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: NestedControlCharObj = JSON.parse(jsonStr);

      expect(parsedObj.level1.text).assertEqual("Start\u0002Middle\u0003End");
      expect(parsedObj.level1.text.includes("\u0002")).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test136
     * @tc.number SUB_BUILTINS_Json4_TEST_13600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FirstLettersConcatCompare = { words: ["Hello", "World", "Wide", "Web"], acronym: "" };
      const json = JSON.stringify(obj);
      const parsed: FirstLettersConcatCompare = JSON.parse(json, (k: string, v: FirstLettersConcatCompare) => {
        if (k === "") {
          let a = "";
          v.words.forEach(w => a += w.charAt(0).toUpperCase());
          return { words: v.words, acronym: a };
        }
        return v;
      });
      expect(parsed.acronym).assertEqual("HWWW");
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
      const parsedObj: ChemicalSymbolObj = JSON.parse(jsonStr);

      expect(parsedObj.elements.H2O).assertEqual("Water");
      expect(parsedObj.elements.nested.CO2).assertEqual(100);
    });

    /**
     * @tc.name   Json4Test138
     * @tc.number SUB_BUILTINS_Json4_TEST_13800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: ValidNumberFilterObj = {
        level1: {
          values: [{ num: 10 }, { num: -5 }, { num: 0 }, { num: 15 }]
        }
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: ValidNumberFilterObj = JSON.parse(jsonStr, (key, value: Test138_Obj2[]) => {
        if (key === "values") {
          return (value as Test138_Obj2[]).filter(item => item.num > 0);
        }
        return value;
      });

      expect(parsedObj.level1.values.length).assertEqual(2);
      expect(parsedObj.level1.values[0].num).assertEqual(10);
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
      const parsedObj: MusicSymbolObj = JSON.parse(jsonStr);

      expect(parsedObj.notes.Cx23).assertEqual("Middle C Sharp");
      expect(parsedObj.notes.nested.Dx23).assertEqual(200);
    });

    /**
     * @tc.name   Json4Test140
     * @tc.number SUB_BUILTINS_Json4_TEST_14000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[][] = [
        ["Line1\u000BLine2"],
        ["Line3\u000BLine4"]
      ];
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedArr: string[][] = JSON.parse(jsonStr);
      expect(parsedArr[0][0]).assertEqual("Line1\u000BLine2");
      expect(parsedArr[1][0].includes("\u000B")).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test141
     * @tc.number SUB_BUILTINS_Json4_TEST_14100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: RawData = {
        user_id: 1001,
        user_name: "Diana",
        user_email: "diana@example.com"
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: UserDTO = JSON.parse(jsonStr, (key, value: RawData) => {
        if (key === "") {
          return {
            id: value.user_id,
            name: value.user_name,
            email: value.user_email
          };
        }
        return value;
      });

      expect(parsedObj.id).assertEqual(1001);
      expect(parsedObj.email).assertEqual("diana@example.com");
    });

    /**
     * @tc.name   Json4Test142
     * @tc.number SUB_BUILTINS_Json4_TEST_14200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: ObjectOnlyObj = {
        nested: { value: "test" },
        otherObj: { id: 1 },
        str: "extra"
      };
      const jsonStr: string = JSON.stringify(originalObj, (key, value: ObjectOnlyObj) =>
      typeof value === "object" && value !== null ? value : undefined
      );
      const parsedObj: ObjectOnlyObj = JSON.parse(jsonStr);

      expect(parsedObj.nested.value).assertEqual(undefined);
      expect(parsedObj.otherObj?.id).assertEqual(undefined);
      expect(parsedObj.str).assertEqual(undefined);
    });

    /**
     * @tc.name   Json4Test143
     * @tc.number SUB_BUILTINS_Json4_TEST_14300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test143_Obj2 = {
        logs: [
          { action: "login", time: 1704067200000 },
          { action: "logout", time: 1704070800000 }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: FormattedDateObj = JSON.parse(jsonStr, (key, value: number) => {
        if (key === "time") {
          return new Date(value as number).toISOString().split("T")[0];
        }
        return value;
      });

      expect(parsedObj.logs[0].time).assertEqual("2024-01-01");
      expect(parsedObj.logs[1].time).assertEqual("2024-01-01");
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
      const parsedStr: string = JSON.parse(jsonStr);

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("✈️")).assertEqual(true);
      expect(parsedStr.includes("🌍")).assertEqual(true);
    });

    /**
     * @tc.name   Json4Test145
     * @tc.number SUB_BUILTINS_Json4_TEST_14500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FactorialCompare = { numbers: [3, 5], results: [] };
      const json = JSON.stringify(obj);
      const parsed: FactorialCompare = JSON.parse(json, (k: string, v: FactorialCompare) => {
        if (k === "") {
          const r: number[] = [];
          v.numbers.forEach(n => {
            let fact = 1;
            for (let i = 2; i <= n; i++) {
              fact *= i;
            }
            r.push(fact);
          });
          return { numbers: v.numbers, results: r };
        }
        return v;
      });
      expect(parsed.results[0]).assertEqual(6);
      expect(parsed.results[1]).assertEqual(120);
    });

    /**
     * @tc.name   Json4Test146
     * @tc.number SUB_BUILTINS_Json4_TEST_14600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: RemoveVowelsCompare = { strings: ["apple", "banana"], consonants: [] };
      const json = JSON.stringify(obj);
      const parsed: RemoveVowelsCompare = JSON.parse(json, (k: string, v: RemoveVowelsCompare) => {
        if (k === "") {
          const c: string[] = [];
          const vowels = ["a", "e", "i", "o", "u"];
          v.strings.forEach(s => {
            let str = "";
            for (let i = 0; i < s.length; i++) {
              if (!vowels.includes(s[i].toLowerCase())) {
                str += s[i];
              }
            }
            c.push(str);
          });
          return { strings: v.strings, consonants: c };
        }
        return v;
      });
      expect(parsed.consonants[0]).assertEqual("ppl");
      expect(parsed.consonants[1]).assertEqual("bnn");
    });

    /**
     * @tc.name   Json4Test147
     * @tc.number SUB_BUILTINS_Json4_TEST_14700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: TwoSumCompare = { numbers: [2, 7, 11, 15], target: 9, indices: [] };
      const json = JSON.stringify(obj);
      const parsed: TwoSumCompare = JSON.parse(json, (k: string, v: TwoSumCompare) => {
        if (k === "") {
          const i: number[] = [];
          for (let a = 0; a < v.numbers.length; a++) {
            for (let b = a + 1; b < v.numbers.length; b++) {
              if (v.numbers[a] + v.numbers[b] === v.target) {
                i.push(a, b);
                return { numbers: v.numbers, target: v.target, indices: i };
              }
            }
          }
          return { numbers: v.numbers, target: v.target, indices: i };
        }
        return v;
      });
      expect(parsed.indices.length).assertEqual(2);
      expect(parsed.indices[0]).assertEqual(0);
      expect(parsed.indices[1]).assertEqual(1);
    });

    /**
     * @tc.name   Json4Test148
     * @tc.number SUB_BUILTINS_Json4_TEST_14800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: ThreeDimSpecialArr = [
        "!@#",
        [["$%^"], ["&*()"]],
        [[["[]{}"], ["<>"]]]
      ];
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedArr: ThreeDimSpecialArr = JSON.parse(jsonStr);

      expect(parsedArr[0]).assertEqual("!@#");
      expect(((parsedArr[1] as string[][])[0])[0]).assertEqual("$%^");
      expect(((parsedArr[2] as string[][][])[0][0])[0]).assertEqual("[]{}");
    });

    /**
     * @tc.name   Json4Test149
     * @tc.number SUB_BUILTINS_Json4_TEST_14900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: MovingAvgCompare = { numbers: [1, 2, 3, 4, 5], window: 3, averages: [] };
      const json = JSON.stringify(obj);
      const parsed: MovingAvgCompare = JSON.parse(json, (k: string, v: MovingAvgCompare) => {
        if (k === "") {
          const a: number[] = [];
          const w = v.window;
          for (let i = 0; i <= v.numbers.length - w; i++) {
            let sum = 0;
            for (let j = 0; j < w; j++) {
              sum += v.numbers[i + j];
            }
            a.push(sum / w);
          }
          return { numbers: v.numbers, window: v.window, averages: a };
        }
        return v;
      });
      expect(parsed.averages.length).assertEqual(3);
      expect(parsed.averages[0]).assertEqual(2);
      expect(parsed.averages[2]).assertEqual(4);
    });

    /**
     * @tc.name   Json4Test150
     * @tc.number SUB_BUILTINS_Json4_TEST_15000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json4Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CharCountSortCompare = { strings: ["aab1", "aaab", "ab"], sorted: [] };
      const json = JSON.stringify(obj);
      const parsed: CharCountSortCompare = JSON.parse(json, (k: string, v: CharCountSortCompare) => {
        if (k === "") {
          const temp = [...v.strings];
          temp.sort((a, b) => {
            const countA = (a.match(/a/g) || []).length;
            const countB = (b.match(/a/g) || []).length;
            return countA - countB;
          });
          return { strings: v.strings, sorted: temp };
        }
        return v;
      });
      expect(parsed.sorted[0]).assertEqual("ab");
      expect(parsed.sorted[2]).assertEqual("aaab");
    });
  })
}
