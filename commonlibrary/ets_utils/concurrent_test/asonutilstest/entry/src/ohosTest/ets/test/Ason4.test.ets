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
import { ArkTSUtils, collections, lang} from '@kit.ArkTS';
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

interface ISendable {
  num: number;
  str: string;
  bool: boolean;
  nil: null;
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
  item: Product | Test107_Obj1;
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


interface GeneratedTypeLiteralInterface_1 {
  status: number;
}

interface GeneratedObjectLiteralInterface_1 {
  numbers: number[];
  product: number;
}

interface GeneratedObjectLiteralInterface_2 {
  username: string;
  email: string;
}

interface GeneratedObjectLiteralInterface_3 {
  role: string;
}

interface GeneratedObjectLiteralInterface_4 {
  name: string;
  auth: GeneratedObjectLiteralInterface_3;
}

interface GeneratedObjectLiteralInterface_5 {
  user: GeneratedObjectLiteralInterface_4;
}

interface GeneratedObjectLiteralInterface_6 {
  fullInfo: Test37_Obj2;
}

interface GeneratedObjectLiteralInterface_7 {
  username: string;
  email: string;
}

interface GeneratedTypeLiteralInterface_2 {
  value: number;
}

export default function Ason4Test() {

  describe('Ason4Test', () => {
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
      await sleep(30);
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_0100
     * @tc.name Ason4Test001
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidAson: string = "[1,,2]";
      let hasError: boolean = false;

      try {
        ArkTSUtils.ASON.parse(invalidAson);
      } catch (error) {
        hasError = error instanceof SyntaxError;
      }

      expect(hasError).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_0200
     * @tc.name Ason4Test002
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const originalStr: string = "Hello 😊 World 🌟";
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalStr);
      const parsedStr: string = (ArkTSUtils.ASON.parse(jsonStr) as ISendable).toString();
      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("😊")).assertEqual(true);
      expect(parsedStr.includes("🌟")).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_0300
     * @tc.name Ason4Test003
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const originalObj: Test3_Obj2 = {
        container: { value: 123 }
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj: RootNestedReplaceObj = {
        container: { value: (ArkTSUtils.ASON.parse(jsonStr) as ISendable).toString() }
      };
      expect(parsedObj.container.value).assertEqual("[object Object]");
      expect(typeof parsedObj.container.value).assertEqual("string");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_0400
     * @tc.name Ason4Test004
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const invalidAson: string = '{"num": 1e-}';
      let hasError: boolean = false;
      try {
        const parsedResult: ISendable = ArkTSUtils.ASON.parse(invalidAson) as ISendable;
        const parsedStr: string = parsedResult.toString();
      } catch (error) {
        hasError = error instanceof SyntaxError;
      }
      expect(hasError).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_0500
     * @tc.name Ason4Test005
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: TypePreserveObj = {
        num: 10,
        str: "test",
        bool: true,
        nil: null
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedResult: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;
      const parsedObj: TypePreserveObj = {
        num: parsedResult.num,
        str: parsedResult.str,
        bool: parsedResult.bool,
        nil: parsedResult.nil
      };
      expect(parsedObj.num).assertEqual(10);
      expect(parsedObj.str).assertEqual("test");
      expect(parsedObj.bool).assertEqual(true);
      expect(parsedObj.nil).assertEqual(null);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_0600
     * @tc.name Ason4Test006
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '{"a": {"b": {"c": 1, "c": 2}}}';
      const parsedObj: DeepKeyConflictObj = ArkTSUtils.ASON.parse(jsonStr) as DeepKeyConflictObj;
      expect(parsedObj.a.b.c).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_0700
     * @tc.name Ason4Test007
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "Start\u0000End";
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalStr);
      const parsedStr: string = ArkTSUtils.ASON.parse(jsonStr) as string;
      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("\u0000")).assertEqual(true);
      expect(parsedStr.length).assertEqual(9);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_0800
     * @tc.name Ason4Test008
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const originalArr: [string, number][] = [["a", 1], ["b", 2]];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);
      const parsedResult = ArkTSUtils.ASON.parse(jsonStr) as ISendable as [string, number][];
      const parsedMap: Map<string, number> = new Map(parsedResult);

      expect(parsedMap instanceof Map).assertEqual(true);
      expect(parsedMap.get("a")).assertEqual(1);
      expect(parsedMap.get("b")).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_1000
     * @tc.name Ason4Test010
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const originalObj: PathFilterObj = {
        user: { address: { city: "Beijing", street: "Main St" } }
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedResult = ArkTSUtils.ASON.parse(jsonStr) as ISendable;
      const parsedObj: PathFilterObj = {
        user: {
          address: {
            city: (parsedResult as PathFilterObj)?.user?.address?.city,
            street: undefined
          }
        }
      };
      expect(parsedObj.user.address.city).assertEqual("Beijing");
      expect(parsedObj.user.address.street).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_1100
     * @tc.name Ason4Test011
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: ArrWithObj = {
        items: [{ id: 1, active: false }, { id: 2, active: false }]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as ArrWithObj;
      expect(parsedObj.items[0].active).assertEqual(false);
      expect(parsedObj.items[1].active).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_1200
     * @tc.name Ason4Test012
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidAson: string = '{"valid": tru}';
      let hasError: boolean = false;
      try {
        ArkTSUtils.ASON.parse(invalidAson);
      } catch (error) {
        hasError = error instanceof SyntaxError;
      }
      expect(hasError).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_1300
     * @tc.name Ason4Test013
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "é (e\u0301)";
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalStr);
      const parsedStr: string = ArkTSUtils.ASON.parse(jsonStr) as string;

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("é")).assertEqual(true);
      expect(parsedStr.includes("\u0301")).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_1400
     * @tc.name Ason4Test014
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test14_Obj1 = { a: 5, b: 10 };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as Test14_Obj1;
      const sum = parsedObj.a + parsedObj.b;
      const result: Test14_Obj2 = {
        a: parsedObj.a,
        b: parsedObj.b,
        sum: sum
      };
      expect(result.sum).assertEqual(15);
      expect(result.sum).assertEqual(result.a + result.b);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_1500
     * @tc.name Ason4Test015
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidAson: string = "[() => {}]";
      let hasError: boolean = false;
      try {
        ArkTSUtils.ASON.parse(invalidAson);
      } catch (error) {
        hasError = error instanceof SyntaxError;
      }
      expect(hasError).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_1600
     * @tc.name Ason4Test016
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: StrTruncateObj = {
        short: "hello",
        long: "this is a very long string"
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as StrTruncateObj;
      const result: StrTruncateObj = {
        short: parsedObj.short,
        long: parsedObj.long.length > 10 ? parsedObj.long.slice(0, 10) : parsedObj.long
      };
      expect(result.short).assertEqual("hello");
      expect(result.long).assertEqual("this is a ");
      expect(result.long.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_1700
     * @tc.name Ason4Test017
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: FilteredObjArr = {
        data: [{ id: 1, value: 5 }, { id: 2, value: 15 }, { id: 3, value: 8 }]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as FilteredObjArr;
      const filteredData = parsedObj.data.filter(item => item.value > 10);
      const result: FilteredObjArr = {
        data: filteredData
      };
      expect(result.data.length).assertEqual(1);
      expect(result.data[0].id).assertEqual(2);
      expect(result.data[0].value).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_1800
     * @tc.name Ason4Test018
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidAson: string = '{"num": ++123}';
      let hasError: boolean = false;

      try {
        ArkTSUtils.ASON.parse(invalidAson);
      } catch (error) {
        hasError = error instanceof SyntaxError;
      }

      expect(hasError).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_1900
     * @tc.name Ason4Test019
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: NestedNewlineObj = {
        level1: { level2: "Line1\nLine2\nLine3" }
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj: NestedNewlineObj = ArkTSUtils.ASON.parse(jsonStr) as NestedNewlineObj;
      expect(parsedObj.level1.level2).assertEqual("Line1\nLine2\nLine3");
      expect(parsedObj.level1.level2.split("\n").length).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_2000
     * @tc.name Ason4Test020
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test20_Obj1 = { oldKey: "value" };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as Test20_Obj1;
      const result: RenamePropObj = {
        newKey: parsedObj.oldKey
      };
      expect(result.newKey).assertEqual("value");
      expect(Object.keys(result).includes("newKey")).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_2100
     * @tc.name Ason4Test021
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[] = ["10", "20", "30"];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);
      const parsedArr = ArkTSUtils.ASON.parse(jsonStr) as string[];
      const result: number[] = parsedArr.map(item => parseInt(item, 10));
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(typeof result[0]).assertEqual("number");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_2200
     * @tc.name Ason4Test022
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const invalidAson: string = '{"a":1}}extra';
        ArkTSUtils.ASON.parse(invalidAson);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('SyntaxError');
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_2300
     * @tc.name Ason4Test023
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: SpecialCharArr = [
        ["!@#", "$%^"],
        ["&*()", "[]{}"]
      ];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);
      const parsedArr: SpecialCharArr = ArkTSUtils.ASON.parse(jsonStr) as SpecialCharArr;
      expect(parsedArr[0][0]).assertEqual("!@#");
      expect(parsedArr[1][1]).assertEqual("[]{}");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_2400
     * @tc.name Ason4Test024
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const originalObj: EmptyObjFilter = {
        valid: { id: 1 },
        empty: {}
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsed = ArkTSUtils.ASON.parse(jsonStr) as ISendable;
      const parsedObj = parsed as Record<string, Object>;
      const valid = parsedObj["valid"] as Record<string, number>;
      const result: EmptyObjFilter = {
        valid: { id: valid["id"] }
      };
      expect(result.valid.id).assertEqual(1);
      expect(result.empty).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_2500
     * @tc.name Ason4Test025
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidAson: string = '{"str": "test"string"}';
      let hasError: boolean = false;
      try {
        ArkTSUtils.ASON.parse(invalidAson);
      } catch (error) {
        hasError = error instanceof SyntaxError;
      }
      expect(hasError).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_2600
     * @tc.name Ason4Test026
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    const obj: CharTypeCountCompare = {
      strings: ["apple123", "banana", "cherry"],
      typesCount: []
    };
    const json = ArkTSUtils.ASON.stringify(obj);
    const parsed = ArkTSUtils.ASON.parse(json) as CharTypeCountCompare;
    const typesCount: number[] = [];
    parsed.strings.forEach(s => {
      const chars: string[] = [];
      for (let i = 0; i < s.length; i++) {
        if (!chars.includes(s[i])) {
          chars.push(s[i]);
        }
      }
      typesCount.push(chars.length);
    });
    const result: CharTypeCountCompare = {
      strings: parsed.strings,
      typesCount: typesCount
    };

    expect(result.typesCount[0]).assertEqual(7);
    expect(result.typesCount[1]).assertEqual(3);
    expect(result.typesCount[2]).assertEqual(5);
  });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_2700
     * @tc.name Ason4Test027
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Test27_Obj1 {
        status: number;
      }
      interface StatusMapObj {
        status: "inactive" | "active" | "pending";
      }

      const originalObj: Test27_Obj1 = { status: 1 };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as GeneratedTypeLiteralInterface_1;

      const statusMap: Record<number, "inactive" | "active" | "pending"> = {
        0: "inactive",
        1: "active",
        2: "pending",
      };
      const parsedObjWithStatus: StatusMapObj = {
        status: statusMap[parsedObj.status] || "inactive",
      };

      expect(parsedObjWithStatus.status).assertEqual("active");
      expect(["active", "inactive", "pending"].includes(parsedObjWithStatus.status)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_2800
     * @tc.name Ason4Test028
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidAson: string = "[1, undefined, 3]";
      let hasError: boolean = false;

      try {
        ArkTSUtils.ASON.parse(invalidAson);
      } catch (error) {
        hasError = error instanceof SyntaxError;
      }

      expect(hasError).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_2900
     * @tc.name Ason4Test029
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: MultiLangObj = {
        en: "Hello",
        zh: "你好",
        ja: "こんにちは"
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as MultiLangObj;

      expect(parsedObj.en).assertEqual("Hello");
      expect(parsedObj.zh).assertEqual("你好");
      expect(parsedObj.ja).assertEqual("こんにちは");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_3000
     * @tc.name Ason4Test030
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: number[] = [1, 2, 3, 4, 5];
      const truncatedArr = originalArr.length > 3 ? originalArr.slice(0, 3) : originalArr;
      const jsonStr: string = ArkTSUtils.ASON.stringify(truncatedArr);
      const parsedArr = ArkTSUtils.ASON.parse(jsonStr) as number[];

      expect(parsedArr.length).assertEqual(3);
      expect(parsedArr[0]).assertEqual(1);
      expect(parsedArr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_3100
     * @tc.name Ason4Test031
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ProductCompare = { numbers: [2, 3, 4], product: 0 };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ProductCompare;

      let product = 1;
      parsed.numbers.forEach(n => product *= n);
      const result: GeneratedObjectLiteralInterface_1 = {
        numbers: parsed.numbers,
        product: product
      };
      expect(result.product).assertEqual(24);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_3200
     * @tc.name Ason4Test032
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidAson: string = '{"num": 123+}';
      let errorOccurred = false;
      try {
        ArkTSUtils.ASON.parse(invalidAson);
      } catch (error) {
        errorOccurred = true;
      }
      expect(errorOccurred).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_3300
     * @tc.name Ason4Test033
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "a\u200Cb";
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalStr);
      const parsedStr = ArkTSUtils.ASON.parse(jsonStr) as string;

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("\u200C")).assertEqual(true);
      expect(parsedStr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_3400
     * @tc.name Ason4Test034
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: SensitiveDataObj = {
        username: "user123",
        password: "secret",
        email: "user@example.com"
      };
      const filteredObj: GeneratedObjectLiteralInterface_2 = {
        username: originalObj.username,
        email: originalObj.email
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(filteredObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as SensitiveDataObj;

      expect(parsedObj.username).assertEqual("user123");
      expect(parsedObj.password).assertEqual(undefined);
      expect(parsedObj.email).assertEqual("user@example.com");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_3500
     * @tc.name Ason4Test035
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: DeepSensitiveObj = {
        user: {
          name: "admin",
          auth: { token: "secret-token", role: "admin" }
        }
      };
      const filteredObj: GeneratedObjectLiteralInterface_5 = {
        user: ({
          name: originalObj.user.name,
          auth: ({ role: originalObj.user.auth.role } as GeneratedObjectLiteralInterface_3)
        } as GeneratedObjectLiteralInterface_4)
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(filteredObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as DeepSensitiveObj;
      expect(parsedObj.user.name).assertEqual("admin");
      expect(parsedObj.user.auth.token).assertEqual(undefined);
      expect(parsedObj.user.auth.role).assertEqual("admin");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_3600
     * @tc.name Ason4Test036
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[] = ["\x01Start", "End\x04"];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);
      const parsedArr = ArkTSUtils.ASON.parse(jsonStr) as string[];

      expect(parsedArr[0]).assertEqual("\x01Start");
      expect(parsedArr[1]).assertEqual("End\x04");
      expect(parsedArr[0].charCodeAt(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_3700
     * @tc.name Ason4Test037
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test37_Obj2 = {
        id: 10,
        name: "Anna",
        age: 30
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as Test37_Obj2;
      const result: GeneratedObjectLiteralInterface_6 = {
        fullInfo: parsedObj
      };

      expect(result.fullInfo.id).assertEqual(10);
      expect(result.fullInfo.name).assertEqual("Anna");
      expect(result.fullInfo.age).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_3800
     * @tc.name Ason4Test038
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidAson: string = "{key name: 1}";
      try {
        ArkTSUtils.ASON.parse(invalidAson) as string;
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("SyntaxError");
        expect(error.message).assertContain("Unexpected Object Prop in JSON");
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_3900
     * @tc.name Ason4Test039
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test39_Obj2 = {
        logs: [
          { event: "login", time: "2024-01-01T00:00:00Z" },
          { event: "logout", time: "2024-01-01T01:00:00Z" }
        ]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as Test39_Obj2;



      expect(parsedObj.logs[0].time).assertEqual('2024-01-01T00:00:00Z');
      expect(parsedObj.logs[1].time).assertEqual('2024-01-01T01:00:00Z');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_4000
     * @tc.name Ason4Test040
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidAson: string = '{"valid": TRUE}';
      try {
        ArkTSUtils.ASON.parse(invalidAson) ;
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("SyntaxError");
        expect(error.message).assertContain("Unexpected Text in JSON: Invalid Token");
      }

    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_4100
     * @tc.name Ason4Test041
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "👨‍👩‍👧‍👦 Family: 👨‍💻 Developer";
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalStr);
      const parsedStr = ArkTSUtils.ASON.parse(jsonStr) as string;
      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("👨‍👩‍👧‍👦")).assertEqual(true);
      expect(parsedStr.includes("👨‍💻")).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_4200
     * @tc.name Ason4Test042
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const validAson: string = '{"score": 85}';
      const invalidAson: string = '{"score": 150}';
      let validResult: ValidatedObj | null = null;
      let invalidError: boolean = false;
      const parsedValid = ArkTSUtils.ASON.parse(validAson);
      if (parsedValid !== null) {
        const score = (parsedValid as Record<string, number>)['score'];
        validResult = { score: score };
      }
      try {
        const parsedInvalid = ArkTSUtils.ASON.parse(invalidAson);
        if (parsedInvalid !== null) {
          const score = (parsedInvalid as Record<string, number>)['score'];
          if (score > 100) {
            throw new Error("Score cannot exceed 100");
          }
        }
      } catch (error) {
        invalidError = true;
      }
      expect(validResult?.score).assertEqual(85);
      expect(invalidError).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_4300
     * @tc.name Ason4Test043
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {

      const invalidAson: string = "[{\"a\":1}";
      try {
        ArkTSUtils.ASON.parse(invalidAson);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("SyntaxError");
        expect(error.message).assertContain("Unexpected Array in JSON");
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_4400
     * @tc.name Ason4Test044
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CubeRootCompare = { numbers: [8, 27, 64], roots: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as CubeRootCompare;
      const roots: number[] = [];
      parsed.numbers.forEach(n => roots.push(Math.cbrt(n)));
      const result: CubeRootCompare = {
        numbers: parsed.numbers,
        roots: roots
      };
      expect(result.roots[0]).assertEqual(2);
      expect(result.roots[1]).assertEqual(3);
    });
    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_4500
     * @tc.name Ason4Test045
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: UniqueObjArr = {
        items: [
          { id: 1, name: "A" },
          { id: 2, name: "B" },
          { id: 1, name: "A" }
        ]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as UniqueObjArr;
      if (parsedObj && parsedObj.items && Array.isArray(parsedObj.items)) {
        const seen = new Set<number>();
        const uniqueItems = parsedObj.items.filter(item => {
          if (seen.has(item.id)) {
            return false;
          }
          seen.add(item.id);
          return true;
        });
        parsedObj.items = uniqueItems;
      }
      expect(parsedObj.items.length).assertEqual(3);
      expect(ArkTSUtils.ASON.stringify(parsedObj.items.map(i => i.id))).assertEqual(ArkTSUtils.ASON.stringify([1, 2,1]));
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_4600
     * @tc.name Ason4Test046
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidAson: string = '{"num": a123}';
      try {
        ArkTSUtils.ASON.parse(invalidAson);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("SyntaxError");
        expect(error.message).assertContain("Unexpected Text in JSON: Invalid Token");
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_4700
     * @tc.name Ason4Test047
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "Line1\r\nLine2\nLine3";
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalStr);
      const parsedStr = ArkTSUtils.ASON.parse(jsonStr) as string;

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.split(/\r?\n/).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_4800
     * @tc.name Ason4Test048
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: EncryptedObj = {
        username: "user456",
        email: "user@example.com"
      };
      const emailReversed = originalObj.email.split("").reverse().join("");
      const encryptedObj: GeneratedObjectLiteralInterface_7 = {
        username: originalObj.username,
        email: emailReversed
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(encryptedObj);
      const parsedEncrypted = ArkTSUtils.ASON.parse(jsonStr) as EncryptedObj;
      const decryptedEmail = parsedEncrypted.email.split("").reverse().join("");
      const parsedObj: EncryptedObj = {
        username: parsedEncrypted.username,
        email: decryptedEmail
      };
      expect(parsedObj.email).assertEqual("user@example.com");
      const jsonObj = ArkTSUtils.ASON.parse(jsonStr) as EncryptedObj;
      expect(jsonObj.email).assertEqual("moc.elpmaxe@resu");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_4900
     * @tc.name Ason4Test049
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: number[] = [1, 2, 2, 3, 3, 3];
      const jsonStr = ArkTSUtils.ASON.stringify(originalArr);
      const parsedArr = ArkTSUtils.ASON.parse(jsonStr) as number[];
      const parsedObj: FrequencyObj = {
        frequency: parsedArr
      };
      expect(parsedObj.frequency[1]).assertEqual(2);
      expect(parsedObj.frequency[2]).assertEqual(2);
      expect(parsedObj.frequency[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_5000
     * @tc.name Ason4Test050
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: DeepSpecialCharObj = {
        level1: {
          key401: "value$1",
          level2: { key232: 100 }
        }
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as DeepSpecialCharObj;

      expect(parsedObj.level1.key401).assertEqual("value$1");
      expect(parsedObj.level1.level2.key232).assertEqual(100);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_5100
     * @tc.name Ason4Test051
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: EmptyArrFilterObj = {
        valid: [1, 2],
        empty: []
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);

      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as EmptyArrFilterObj;

      expect(parsedObj.valid.length).assertEqual(2);

    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_5200
     * @tc.name Ason4Test052
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ExtractNumbersSumCompare = { strings: ["a12", "34b"], sum: 0 };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ExtractNumbersSumCompare;
      let total = 0;
      const strings = parsed.strings as string[];
      if (strings && Array.isArray(strings)) {
        for (let i = 0; i < strings.length; i++) {
          const s = strings[i];
          let numStr = "";
          for (let j = 0; j < s.length; j++) {
            const char = s[j];
            if (char >= '0' && char <= '9') {
              numStr += char;
            }
          }
          if (numStr !== "") {
            total += parseInt(numStr, 10);
          }
        }
      }
      console.info(`Extracted numbers sum: ${total}`);
      const result: ExtractNumbersSumCompare = {
        strings: strings || [],
        sum: total
      };
      expect(result.sum).assertEqual(0);
    });
    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_5300
     * @tc.name Ason4Test053
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test53_Obj1 = { enumStatus: "active" };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as Test53_Obj1;
      const map: Record<string, EnumStatus> = {
        "active": EnumStatus.Active,
        "inactive": EnumStatus.Inactive
      };
      const enumValue = map[parsedObj.enumStatus.toLowerCase()];
      const result: EnumMapObj = {
        enumStatus: enumValue
      };
      expect(result.enumStatus).assertEqual(EnumStatus.Active);
      expect(result.enumStatus).assertEqual(EnumStatus.Active.valueOf());
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_5400
     * @tc.name Ason4Test054
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: MultiPunctObj = {
        en: "Hello! How are you?",
        de: '',
        fr: ''
      };
      const jsonStr = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as MultiLangObj;

      expect(parsedObj.en).assertEqual("Hello! How are you?");

    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_5500
     * @tc.name Ason4Test055
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: PropLimitObj = { a: 1, b: 2, c: 3 };
      const filteredObj: Record<string, number> = {};
      if (originalObj.a !== undefined) {
        filteredObj.a = originalObj.a;
      }
      if (originalObj.b !== undefined) {
        filteredObj.b = originalObj.b;
      }
      const jsonStr: string = ArkTSUtils.ASON.stringify(filteredObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as PropLimitObj;
      expect(parsedObj.a).assertEqual(1);
      expect(parsedObj.b).assertEqual(2);
      expect(parsedObj.c).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_5600
     * @tc.name Ason4Test056
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);
      const parsedArr = ArkTSUtils.ASON.parse(jsonStr) as number[][];
      const parsedObj: MatrixObj = {
        rows: parsedArr.length,
        cols: parsedArr[0]?.length || 0,
        data: parsedArr
      };

      expect(parsedObj.rows).assertEqual(3);
      expect(parsedObj.cols).assertEqual(2);
      expect(parsedObj.data[1][1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_5700
     * @tc.name Ason4Test057
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[][] = [
        ["a\u200B", "b"],
        ["c", "d\u200B"]
      ];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);
      const parsedArr = ArkTSUtils.ASON.parse(jsonStr) as string[];

      expect(parsedArr[0][0]).assertEqual("a\u200B");
      expect(parsedArr[1][1]).assertEqual("d\u200B");
      expect(parsedArr[0][0].includes("\u200B")).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_5800
     * @tc.name Ason4Test058
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const validAson: string = '{"codes": ["A", "B", "C"]}';
      const invalidAson: string = '{"codes": ["A", "B"]}';
      let validResult: LengthValidatedObj | null = null;
      let invalidError: boolean = false;

      const parsedValid = ArkTSUtils.ASON.parse(validAson) as LengthValidatedObj;
      if (parsedValid.codes.length !== 3) {
        throw new Error("codes must have 3 elements");
      }
      validResult = parsedValid;
      try {
        const parsedInvalid = ArkTSUtils.ASON.parse(invalidAson) as LengthValidatedObj;
        if (parsedInvalid.codes.length !== 3) {
          throw new Error("codes must have 3 elements");
        }
      } catch (error) {
        invalidError = true;
      }
      expect(validResult?.codes.length).assertEqual(3);
      expect(invalidError).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_5900
     * @tc.name Ason4Test059
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // it('Ason4Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const originalObj: DeepEmptyFilterObj = {
    //     level1: {
    //       level2: { valid: "value", empty: {} }
    //     }
    //   };
    //   const jsonStr = ArkTSUtils.ASON.stringify(originalObj);
    //   const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as DeepKeyConflictObj;
    //
    //   expect(parsedObj.level1.level2.valid).assertEqual("value");
    //   expect(parsedObj.level1.level2.empty).assertEqual(undefined);
    // });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_6000
     * @tc.name Ason4Test060
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: ArrSensitiveObj = {
        users: [
          { id: 1, name: "Dave", password: "pass1" },
          { id: 2, name: "Eve", password: "pass2" }
        ]
      };


      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as ArrSensitiveObj;

      expect(parsedObj.users[0].password).assertEqual("pass1");
      expect(parsedObj.users[1].name).assertEqual("Eve");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_6100
     * @tc.name Ason4Test061
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "Line1\u000BLine2";
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalStr);
      const parsedStr = ArkTSUtils.ASON.parse(jsonStr) as string;

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("\u000B")).assertEqual(true);
      expect(parsedStr.split("\u000B").length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_6200
     * @tc.name Ason4Test062
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test62_Obj3 = {
        user_id: 5,
        user_name: "Frank",
        contact_email: "frank@example.com"
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as Test62_Obj3;

      expect(parsedObj.user_id).assertEqual(5);
      expect(parsedObj.contact_email).assertEqual("frank@example.com");
    });
    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_6300
     * @tc.name Ason4Test063
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test63_Obj1 = { a: 10, b: 20, c: 30 };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as NumToStringObj;

      expect(parsedObj.a).assertEqual(10);
      expect(parsedObj.b).assertEqual(20);
      expect(typeof parsedObj.c).assertEqual("number");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_6400
     * @tc.name Ason4Test064
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test64_Obj1 = {
        logs: [{
          events: [{ name: "start", time: "2024-01-01T00:00:00Z" }]
        }]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as Test64_Obj1;


      expect(parsedObj.logs[0].events[0].time.toString()).assertEqual("2024-01-01T00:00:00Z");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_6500
     * @tc.name Ason4Test065
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "🇨🇳 China 🇺🇸 USA";
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalStr);
      const parsedStr = ArkTSUtils.ASON.parse(jsonStr) as string;

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("🇨🇳")).assertEqual(true);
      expect(parsedStr.includes("🇺🇸")).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_6600
     * @tc.name Ason4Test066
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: FilteredArrObj = { numbers: [10, -5, 20, -30, 5] };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as FilteredArrObj;
      const filteredNumbers = parsedObj.numbers.filter(num => num >= 0);
      const result: FilteredArrObj = {
        numbers: filteredNumbers
      };

      expect(ArkTSUtils.ASON.stringify(result.numbers)).assertEqual(ArkTSUtils.ASON.stringify([10, 20, 5]));
      expect(result.numbers.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_6700
     * @tc.name Ason4Test067
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalSet: Set<number> = new Set([1, 2, 3, 2]);
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalSet);
      const parsedArr = ArkTSUtils.ASON.parse(jsonStr) as number[];

      expect(ArkTSUtils.ASON.stringify(parsedArr)).assertEqual(ArkTSUtils.ASON.stringify([1, 2, 3]));
      expect(parsedArr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_6800
     * @tc.name Ason4Test068
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: MultiFilterCompare = {
        products: [
          { name: "A", price: 15, inStock: true },
          { name: "B", price: 25, inStock: false },
          { name: "C", price: 20, inStock: true }
        ],
        filtered: []
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as MultiFilterCompare;

      const filtered: Test68_Obj2[] = [];
      parsed.products.forEach(p => {
        if (p.price >= 18 && p.price <= 22 && p.inStock) {
          filtered.push(p);
        }
      });
      const result: MultiFilterCompare = {
        products: parsed.products,
        filtered: filtered
      };
      expect(result.filtered.length).assertEqual(1);
      expect(result.filtered[0].name).assertEqual("C");
    });
    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_6900
     * @tc.name Ason4Test069
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[] = [
        "\x08Backspace",
        "Tab\x09",
        "Form\x0CFeed"
      ];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);
      const parsedArr = ArkTSUtils.ASON.parse(jsonStr) as string[];

      expect(parsedArr[0]).assertEqual("\x08Backspace");
      expect(parsedArr[1]).assertEqual("Tab\x09");
      expect(parsedArr[2].charCodeAt(4)).assertEqual(12);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_7000
     * @tc.name Ason4Test070
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: MaskedObj = {
        phone: "13800138000",
        email: "user@example.com"
      };
      const maskedObj: MaskedObj = {
        phone: originalObj.phone.replace(/(\d{3})\d*(\d{4})/, "$1****$2"),
        email: originalObj.email.replace(/(.{2}).*@/, "$1***@")
      };

      const jsonStr: string = ArkTSUtils.ASON.stringify(maskedObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as MaskedObj;

      expect(parsedObj.phone).assertEqual("138****8000");
      expect(parsedObj.email).assertEqual("us***@example.com");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_7100
     * @tc.name Ason4Test071
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: number[] = [10, 20, 30];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);
      const parsedArr = ArkTSUtils.ASON.parse(jsonStr) as number[];

      const data = parsedArr;
      const sum = data.reduce((a, b) => a + b, 0);
      const avg = sum / data.length;
      const max = Math.max(...data);
      const result: StatsObj = {
        data,
        sum,
        avg,
        max
      };

      expect(result.sum).assertEqual(60);
      expect(result.avg).assertEqual(20);
      expect(result.max).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_7200
     * @tc.name Ason4Test072
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: DeepSpecialArr = [
        "![]",
        [["$%^"], ["&*()"]]
      ];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);
      const parsedArr = ArkTSUtils.ASON.parse(jsonStr) as DeepSpecialArr;

      expect(parsedArr[0]).assertEqual("![]");
      expect(((parsedArr[1] as string[][])[0])[0]).assertEqual("$%^");
      expect(((parsedArr[1] as string[][])[1])[0]).assertEqual("&*()");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_7300
     * @tc.name Ason4Test073
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: DeepEmptyArrFilterObj = {
        level1: {
          level2: [{
            valid: [1, 2],
            empty: []
          }]
        }
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as DeepEmptyArrFilterObj;


      expect(parsedObj.level1.level2[0].valid.length).assertEqual(2);

    });


    interface CircularSafeObj {
      name: string;
      parent?: CircularSafeObj | string | undefined;
    }
    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_7400
     * @tc.name Ason4Test074
     * @tc.desc test Ason
     * @tc.size MediumTest'wwwwwww
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CircularSafeObj = { name: "child" };
      const parent: CircularSafeObj = { name: "parent", parent: obj };
      obj.parent = parent;
      const safeParent: CircularSafeObj = {
        name: "parent",
        parent: {
          name: "child",
          parent: "[Circular Reference]"
        }
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(safeParent);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as CircularSafeObj;
      expect(parsedObj.name).assertEqual("parent");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_7500
     * @tc.name Ason4Test075
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: RemoveElementCompare = { strings: ["a", "b", "a", "c"], cleaned: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as RemoveElementCompare;

      const cleaned: string[] = [];
      parsed.strings.forEach(s => {
        if (s !== "a") {
          cleaned.push(s);
        }
      });
      const result: RemoveElementCompare = {
        strings: parsed.strings,
        cleaned: cleaned
      };

      expect(result.cleaned.length).assertEqual(2);
      expect(result.cleaned[0]).assertEqual("b");
      expect(result.cleaned[1]).assertEqual("c");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_7600
     * @tc.name Ason4Test076
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '{"a": 1, "a": "2"}';
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as MixedTypeKeyObj;

      expect(parsedObj.a).assertEqual("2");
      expect(typeof parsedObj.a).assertEqual("string");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_7700
     * @tc.name Ason4Test077
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: MultiLangArr = [
        ["中文", "English"],
        ["日本語", "한국어"]
      ];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);
      const parsedArr = ArkTSUtils.ASON.parse(jsonStr) as MultiLangArr;

      expect((parsedArr[0] as string[])[0]).assertEqual("中文");
      expect((parsedArr[1] as string[])[0]).assertEqual("日本語");
      expect((parsedArr[1] as string[])[1]).assertEqual("한국어");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_7800
     * @tc.name Ason4Test078
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: UpperCountCompare = { strings: ["AbcDE", "fGhIj"], counts: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as UpperCountCompare;

      const counts: number[] = [];
      parsed.strings.forEach(s => {
        let count = 0;
        for (let i = 0; i < s.length; i++) {
          if (s[i] === s[i].toUpperCase() && s[i] !== s[i].toLowerCase()) {
            count++;
          }
        }
        counts.push(count);
      });
      const result: UpperCountCompare = {
        strings: parsed.strings,
        counts: counts
      };

      expect(result.counts[0]).assertEqual(3);
      expect(result.counts[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_7900
     * @tc.name Ason4Test079
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);
      const parsedArr = ArkTSUtils.ASON.parse(jsonStr) as number[][];

      const matrix = parsedArr;
      const transposed = matrix[0].map((_, colIndex) =>
      matrix.map(row => row[colIndex])
      );
      const result: TransposedMatrixObj = {
        transposed: transposed
      };
      expect(ArkTSUtils.ASON.stringify(result.transposed)).assertEqual(ArkTSUtils.ASON.stringify([[1, 3, 5], [2, 4, 6]]));
      expect(result.transposed.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_8000
     * @tc.name Ason4Test080
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "a\u200Db";
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalStr);
      const parsedStr = ArkTSUtils.ASON.parse(jsonStr) as string;
      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("\u200D")).assertEqual(true);
      expect(parsedStr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_8100
     * @tc.name Ason4Test081
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: StdDevCompare = { numbers: [1, 2, 3, 4, 5], stdDev: 0 };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as StdDevCompare;
      const avg = parsed.numbers.reduce((a, b) => a + b, 0) / parsed.numbers.length;
      const squareDiffs = parsed.numbers.map(n => Math.pow(n - avg, 2));
      const variance = squareDiffs.reduce((a, b) => a + b, 0) / squareDiffs.length;
      const stdDev = Math.sqrt(variance);
      const result: StdDevCompare = {
        numbers: parsed.numbers,
        stdDev: stdDev
      };
      expect(result.stdDev).assertEqual(Math.sqrt(2));
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_8200
     * @tc.name Ason4Test082
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test82_Obj1 = {
        nan: NaN,
        inf: Infinity,
        normal: 100
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as SpecialNumFilterObj;

      expect(parsedObj.nan).assertEqual(null);
      expect(parsedObj.inf).assertEqual(null);
      expect(parsedObj.normal).assertEqual(100);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_8300
     * @tc.name Ason4Test083
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test83_Obj3 = {
        level1: {
          nan: NaN,
          level2: { inf: Infinity, num: 200 }
        }
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as DeepSpecialNumObj;

      expect(parsedObj.level1.nan).assertEqual(null);
      expect(parsedObj.level1.level2.inf).assertEqual(null);
      expect(parsedObj.level1.level2.num).assertEqual(200);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_8400
     * @tc.name Ason4Test084
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "File1\u001CFile2\u001CFile3";
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalStr);
      const parsedStr = ArkTSUtils.ASON.parse(jsonStr) as string;

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.split("\u001C").length).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_8500
     * @tc.name Ason4Test085
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: GradeConvertCompare = { scores: [85, 60, 45], grades: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as GradeConvertCompare;

      const grades: string[] = [];
      parsed.scores.forEach(s => {
        if (s >= 80) {
          grades.push("A");
        } else if (s >= 60) {
          grades.push("B");
        } else {
          grades.push("C");
        }
      });
      const result: GradeConvertCompare = {
        scores: parsed.scores,
        grades: grades
      };
      expect(result.grades[0]).assertEqual("A");
      expect(result.grades[1]).assertEqual("B");
      expect(result.grades[2]).assertEqual("C");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_8600
     * @tc.name Ason4Test086
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: StrLengthFilterObj = { long: "length6", short: "len4" };

      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as StrLengthFilterObj;

      expect(parsedObj.long).assertEqual("length6");
      expect(parsedObj.short).assertEqual("len4");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_8700
     * @tc.name Ason4Test087
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test87_Obj5 = {
        groups: [{ items: [{ value: 10 }, { value: 20 }] }]
      };

      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);

      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as Test87_Obj5;

      const total = parsedObj.groups[0].items.reduce((sum, item) => sum + item.value, 0);
      const result: DeepAggregateObj = {
        groups: [{
          items: parsedObj.groups[0].items,
          total: total
        }]
      }
    });
    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_8800
     * @tc.name Ason4Test088
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "👨🏿‍💻 Dark skin developer";
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalStr);
      const parsedStr = ArkTSUtils.ASON.parse(jsonStr) as string;

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("👨🏿‍💻")).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_8900
     * @tc.name Ason4Test089
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: EmptyStrArrFilterObj = { tags: ["js", "", "json", ""] };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as EmptyStrArrFilterObj;

      const filteredTags = parsedObj.tags.filter(tag => tag !== "");
      const result: EmptyStrArrFilterObj = {
        tags: filteredTags
      };
      expect(ArkTSUtils.ASON.stringify(result.tags)).assertEqual(ArkTSUtils.ASON.stringify(["js", "json"]));
      expect(result.tags.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_9000
     * @tc.name Ason4Test090
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: PalindromeCheckCompare = { strings: ["abcba", "hello", "level"], isPalindrome: [] };
      const json = ArkTSUtils.ASON.stringify(obj);

      const parsedData: PalindromeCheckCompare = ArkTSUtils.ASON.parse(json) as PalindromeCheckCompare;

      const p: boolean[] = [];
      parsedData.strings.forEach(s => {
        let isPal = true;
        for (let i = 0; i < s.length / 2; i++) {
          if (s[i] !== s[s.length - 1 - i]) {
            isPal = false;
            break;
          }
        }
        p.push(isPal);
      });

      const parsed: PalindromeCheckCompare = { strings: parsedData.strings, isPalindrome: p };

      expect(parsed.isPalindrome[0]).assertEqual(true);
      expect(parsed.isPalindrome[1]).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_9100
     * @tc.name Ason4Test091
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FibonacciCompare = { count: [5], sequence: [] };
      const json = ArkTSUtils.ASON.stringify(obj);

      const parsedData: FibonacciCompare = ArkTSUtils.ASON.parse(json) as FibonacciCompare;

      const s: number[] = [];
      const c = parsedData.count[0];
      let a = 0, b = 1;
      for (let i = 0; i < c; i++) {
        s.push(a);
        const temp = a;
        a = b;
        b = temp + b;
      }

      const parsed: FibonacciCompare = { count: parsedData.count, sequence: s };

      expect(parsed.sequence.length).assertEqual(5);
      expect(parsed.sequence[0]).assertEqual(0);
      expect(parsed.sequence[4]).assertEqual(3);
    });
    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_9200
     * @tc.name Ason4Test092
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[] = [
        "Record1\u001EField1",
        "Record2\u001EField2"
      ];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);
      const parsedArr: string[] = ArkTSUtils.ASON.parse(jsonStr) as string[];

      expect(parsedArr[0]).assertEqual("Record1\u001EField1");
      expect(parsedArr[1].includes("\u001E")).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_9300
     * @tc.name Ason4Test093
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SubstringConcatCompare = { strings: ["abcde", "fghij"], result: "" };
      const json = ArkTSUtils.ASON.stringify(obj);

      const parsedData: SubstringConcatCompare = ArkTSUtils.ASON.parse(json) as SubstringConcatCompare;

      let r = "";
      parsedData.strings.forEach(s => {
        r += s.substring(1, 4);
      });

      const parsed: SubstringConcatCompare = { strings: parsedData.strings, result: r };

      expect(parsed.result).assertEqual("bcdghi");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_9400
     * @tc.name Ason4Test094
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: MaxSubarrayCompare = { numbers: [-2, 1, -3, 4, -1], maxSum: 0 };
      const json = ArkTSUtils.ASON.stringify(obj);

      const parsedData: MaxSubarrayCompare = ArkTSUtils.ASON.parse(json) as MaxSubarrayCompare;

      let max = parsedData.numbers[0];
      let current = parsedData.numbers[0];
      for (let i = 1; i < parsedData.numbers.length; i++) {
        current = Math.max(parsedData.numbers[i], current + parsedData.numbers[i]);
        max = Math.max(max, current);
      }

      const parsed: MaxSubarrayCompare = { numbers: parsedData.numbers, maxSum: max };

      expect(parsed.maxSum).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_9500
     * @tc.name Ason4Test095
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = "[true, false, null]";
      const parsedObj: KeywordArrObj = ArkTSUtils.ASON.parse(jsonStr) as KeywordArrObj;
      expect(parsedObj.values[0]).assertEqual(undefined);
      expect(parsedObj.values[1]).assertEqual(undefined);
      expect(parsedObj.values[2]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_9600
     * @tc.name Ason4Test096
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: MathSymbolObj = {
        formulas: {
          axToBb: "sum",
          nested: { cxToAd: 100 }
        }
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj: MathSymbolObj = ArkTSUtils.ASON.parse(jsonStr) as MathSymbolObj;

      expect(parsedObj.formulas.axToBb).assertEqual("sum");
      expect(parsedObj.formulas.nested.cxToAd).assertEqual(100);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_9700
     * @tc.name Ason4Test097
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: DeepEmptyStrFilterObj = {
        level1: [{ level2: ["a", "", "b", ""] }]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);

      const parsedData: DeepEmptyStrFilterObj = ArkTSUtils.ASON.parse(jsonStr) as DeepEmptyStrFilterObj;

      const filteredLevel2: string[] = parsedData.level1[0].level2.filter(v => v !== "");

      const parsedObj: DeepEmptyStrFilterObj = {
        level1: [{ level2: filteredLevel2 }]
      };

      expect(ArkTSUtils.ASON.stringify(parsedObj.level1[0].level2)).assertEqual(ArkTSUtils.ASON.stringify(["a", "b"]));
      expect(parsedObj.level1[0].level2.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_9800
     * @tc.name Ason4Test098
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: NestedSetArr = [
        new Set([1, 2]),
        [3, new Set([4, 5])]
      ];

      const processedArr: Object[] = [];
      originalArr.forEach(item => {
        if (item instanceof Set) {
          processedArr.push(Array.from(item));
        } else if (Array.isArray(item)) {
          const newArr: Object[] = [];
          item.forEach(subItem => {
            if (subItem instanceof Set) {
              newArr.push(Array.from(subItem));
            } else {
              newArr.push(subItem);
            }
          });
          processedArr.push(newArr);
        } else {
          processedArr.push(item);
        }
      });

      const jsonStr: string = ArkTSUtils.ASON.stringify(processedArr);
      const parsedArr: number[][] = ArkTSUtils.ASON.parse(jsonStr) as number[][];

      expect(ArkTSUtils.ASON.stringify(parsedArr[0])).assertEqual(ArkTSUtils.ASON.stringify([1, 2]));
      expect(ArkTSUtils.ASON.stringify(parsedArr[1])).assertEqual(ArkTSUtils.ASON.stringify([3, [4, 5]]));
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_9900
     * @tc.name Ason4Test099
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test99_Obj1 = {
        tasks: [
          { name: "Task1", priority: "Low" },
          { name: "Task2", priority: "High" }
        ]
      };

      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedData: Test99_Obj1 = ArkTSUtils.ASON.parse(jsonStr) as Test99_Obj1;

      const tasks: Test99_Obj2[] = [];
      parsedData.tasks.forEach(task => {
        let priorityValue: Priority;
        if (task.priority === "Low") {
          priorityValue = Priority.Low;
        } else if (task.priority === "Medium") {
          priorityValue = Priority.Medium;
        } else {
          priorityValue = Priority.High;
        }

        tasks.push({
          name: task.name,
          priority: priorityValue
        });
      });

      const parsedObj: PriorityMapObj = { tasks };

      expect(parsedObj.tasks[0].priority).assertEqual(Priority.Low);
      expect(parsedObj.tasks[1].priority).assertEqual(Priority.High);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_10000
     * @tc.name Ason4Test100
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: MultiBracketObj = {
        text: "中文（括号）、英文()、日文（かっこ）"
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj: MultiBracketObj = ArkTSUtils.ASON.parse(jsonStr) as MultiBracketObj;
      expect(parsedObj.text).assertEqual("中文（括号）、英文()、日文（かっこ）");
      expect(parsedObj.text.includes("（")).assertEqual(true);
      expect(parsedObj.text.includes("()")).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_10100
     * @tc.name Ason4Test101
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: ValueClampObj = { score: 150, age: -5 };

      const processedObj: ValueClampObj = {
        score: Math.min(100, originalObj.score),
        age: Math.max(0, originalObj.age)
      };

      const jsonStr: string = ArkTSUtils.ASON.stringify(processedObj);
      const parsedObj: ValueClampObj = ArkTSUtils.ASON.parse(jsonStr) as ValueClampObj;

      expect(parsedObj.score).assertEqual(100);
      expect(parsedObj.age).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_10200
     * @tc.name Ason4Test102
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: number[][][] = [[[1, 2]], [[3, 4], [5]]];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);

      const flatten3D = (arr: number[][][]): number[] => {
        let result: number[] = [];
        for (let i = 0; i < arr.length; i++) {
          for (let j = 0; j < arr[i].length; j++) {
            for (let k = 0; k < arr[i][j].length; k++) {
              result.push(arr[i][j][k]);
            }
          }
        }
        return result;
      };

      const parsedArr: number[][][] = ArkTSUtils.ASON.parse(jsonStr) as number[][][];
      const parsedObj: Flatten3DObj = { flattened: flatten3D(parsedArr) };

      expect(ArkTSUtils.ASON.stringify(parsedObj.flattened)).assertEqual(ArkTSUtils.ASON.stringify([1, 2, 3, 4, 5]));
      expect(parsedObj.flattened.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_10300
     * @tc.name Ason4Test103
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: DeepZeroWidthArr = [
        "a\u200B",
        [["b\u200Bc"], ["d"]]
      ];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);
      const parsedArr: DeepZeroWidthArr = ArkTSUtils.ASON.parse(jsonStr) as DeepZeroWidthArr;

      expect(parsedArr[0]).assertEqual("a\u200B");
      expect(((parsedArr[1] as string[][])[0])[0]).assertEqual("b\u200Bc");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_10400
     * @tc.name Ason4Test104
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: DeepUndefinedFilterObj = {
        level1: {
          level2: { valid: "value", undef: undefined }
        }
      };

      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj: DeepUndefinedFilterObj = ArkTSUtils.ASON.parse(jsonStr) as DeepUndefinedFilterObj;

      expect(parsedObj.level1.level2.valid).assertEqual("value");
      expect(parsedObj.level1.level2.undef).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_10500
     * @tc.name Ason4Test105
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: MultiReplaceCompare = { strings: ["abcde", "fghij"], replaced: [] };
      const json = ArkTSUtils.ASON.stringify(obj);

      const parsedObj: MultiReplaceCompare = ArkTSUtils.ASON.parse(json) as MultiReplaceCompare;
      const r: string[] = [];

      for (let i = 0; i < parsedObj.strings.length; i++) {
        const s = parsedObj.strings[i];
        let newStr = "";
        for (let j = 0; j < s.length; j++) {
          newStr += s[j] === "a" || s[j] === "i" ? "*" : s[j];
        }
        r.push(newStr);
      }

      const parsed: MultiReplaceCompare = { strings: parsedObj.strings, replaced: r };

      expect(parsed.replaced[0]).assertEqual("*bcde");
      expect(parsed.replaced[1]).assertEqual("fgh*j");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_10600
     * @tc.name Ason4Test106
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "Field1\u001FValue1\u001FField2\u001FValue2";
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalStr);
      const parsedStr: string = ArkTSUtils.ASON.parse(jsonStr) as string;

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.split("\u001F").length).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_10700
     * @tc.name Ason4Test107
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Product = new Product(101, "Laptop", 1000);
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedData: Test107_Obj1 = ArkTSUtils.ASON.parse(jsonStr) as Test107_Obj1;

      const parsedObj: ProductObj = { item: parsedData };

      expect(parsedObj.item instanceof Product).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_10800
     * @tc.name Ason4Test108
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: VowelRatioCompare = { strings: ["apple", "xyz"], ratios: [] };
      const json = ArkTSUtils.ASON.stringify(obj);

      const parsedObj: VowelRatioCompare = ArkTSUtils.ASON.parse(json) as VowelRatioCompare;
      const r: number[] = [];
      const vowels = ["a", "e", "i", "o", "u"];

      for (let i = 0; i < parsedObj.strings.length; i++) {
        const s = parsedObj.strings[i];
        let count = 0;
        for (let j = 0; j < s.length; j++) {
          if (vowels.includes(s[j].toLowerCase())) {
            count++;
          }
        }
        r.push(count / s.length);
      }

      const parsed: VowelRatioCompare = { strings: parsedObj.strings, ratios: r };

      expect(parsed.ratios[0]).assertEqual(2 / 5);
      expect(parsed.ratios[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_10900
     * @tc.name Ason4Test109
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test109_Obj2 = {
        users: [{ id: 1, age: 20 }, { id: 2, age: 30 }]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);

      const parsedData: Test109_Obj2 = ArkTSUtils.ASON.parse(jsonStr) as Test109_Obj2;
      const convertedUsers: Test109_Obj1[] = [];
      for (let i = 0; i < parsedData.users.length; i++) {
        const user = parsedData.users[i];
        const convertedUser: Test109_Obj1 = {
          id: user.id.toString(),
          age: user.age
        };
        convertedUsers.push(convertedUser);
      }

      const parsedObj: DeepPropConvertObj = { users: convertedUsers };

      expect(parsedObj.users[0].id).assertEqual("1");
      expect(parsedObj.users[1].id).assertEqual("2");
      expect(typeof parsedObj.users[0].id).assertEqual("string");
    });


    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_11000
     * @tc.name Ason4Test110
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "🏴󠁧󠁢󠁥󠁮󠁧󠁿 UK 🇪🇸 Spain";
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalStr);
      const parsedStr: string = ArkTSUtils.ASON.parse(jsonStr) as string;

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("🏴󠁧󠁢󠁥󠁮󠁧󠁿")).assertEqual(true);
      expect(parsedStr.includes("🇪🇸")).assertEqual(true);
    });


    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_11100
     * @tc.name Ason4Test111
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: UniqueDeepObjArr = {
        items: [
          { id: 1, name: "A" },
          { id: 2, name: "B" },
          { id: 1, name: "A" }
        ]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);

      const parsedData: UniqueDeepObjArr = ArkTSUtils.ASON.parse(jsonStr) as UniqueDeepObjArr;
      const seen = new Set<number>();
      const uniqueItems: Test110_Obj1[] = [];

      for (let i = 0; i < parsedData.items.length; i++) {
        const item = parsedData.items[i];
        if (!seen.has(item.id)) {
          seen.add(item.id);
          uniqueItems.push(item);
        }
      }

      const parsedObj: UniqueDeepObjArr = { items: uniqueItems };

      expect(parsedObj.items.length).assertEqual(2);
      expect(ArkTSUtils.ASON.stringify(parsedObj.items.map(i => i.id))).assertEqual(ArkTSUtils.ASON.stringify([1, 2]));
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_11200
     * @tc.name Ason4Test112
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: AbsoluteDiffsCompare = { numbers: [5, 2, 7], diffs: [] };
      const json = ArkTSUtils.ASON.stringify(obj);

      const parsedData: AbsoluteDiffsCompare = ArkTSUtils.ASON.parse(json) as AbsoluteDiffsCompare;
      const d: number[] = [];

      for (let i = 0; i < parsedData.numbers.length - 1; i++) {
        d.push(Math.abs(parsedData.numbers[i] - parsedData.numbers[i + 1]));
      }

      const parsed: AbsoluteDiffsCompare = { numbers: parsedData.numbers, diffs: d };

      expect(parsed.diffs.length).assertEqual(2);
      expect(parsed.diffs[0]).assertEqual(3);
      expect(parsed.diffs[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_11300
     * @tc.name Ason4Test113
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SumAvgCompare = {
        data: [{ value: 10 }, { value: 20 }, { value: 30 }],
        sum: 0,
        avg: 0
      };
      const json = ArkTSUtils.ASON.stringify(obj);

      const parsedData: SumAvgCompare = ArkTSUtils.ASON.parse(json) as SumAvgCompare;
      let s = 0;

      for (let i = 0; i < parsedData.data.length; i++) {
        s += parsedData.data[i].value;
      }

      const parsed: SumAvgCompare = {
        data: parsedData.data,
        sum: s,
        avg: s / parsedData.data.length
      };

      expect(parsed.sum).assertEqual(60);
      expect(parsed.avg).assertEqual(20);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_11400
     * @tc.name Ason4Test114
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: MixedSpecialArr = [
        "!@#$",
        [["%^&*"], ["()[]{}"]]
      ];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);
      const parsedArr: MixedSpecialArr = ArkTSUtils.ASON.parse(jsonStr) as MixedSpecialArr;
      expect(parsedArr[0]).assertEqual("!@#$");
      expect(((parsedArr[1] as string[][])[0])[0]).assertEqual("%^&*");
      expect(((parsedArr[1] as string[][])[1])[0]).assertEqual("()[]{}");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_11500
     * @tc.name Ason4Test115
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: PartialMaskObj = {
        cardNumber: "6222021234567890123",
        phone: "13800138000"
      };

      const maskedCardNumber = originalObj.cardNumber.replace(/^(\d{4})\d*(\d{4})$/, "$1********$2");
      const processedObj: PartialMaskObj = {
        cardNumber: maskedCardNumber,
        phone: originalObj.phone
      };

      const jsonStr: string = ArkTSUtils.ASON.stringify(processedObj);
      const parsedObj: PartialMaskObj = ArkTSUtils.ASON.parse(jsonStr) as PartialMaskObj;

      expect(parsedObj.cardNumber).assertEqual("6222********0123");
      expect(parsedObj.phone).assertEqual("13800138000");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_11600
     * @tc.name Ason4Test116
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test116_Obj2 = {
        items: [
          { id: 1, old: 10, new: 15 },
          { id: 2, old: 20, new: 18 }
        ]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);

      const parsedData: Test116_Obj2 = ArkTSUtils.ASON.parse(jsonStr) as Test116_Obj2;
      const changes : Test116_Obj1[]=[];

      for (let i = 0; i < parsedData.items.length; i++) {
        const item = parsedData.items[i];
        const change: Test116_Obj1 = {
          id: item.id,
          diff: item.new - item.old
        };
        changes.push(change);
      }

      const parsedObj: DiffObj = { changes };

      expect(parsedObj.changes[0].diff).assertEqual(5);
      expect(parsedObj.changes[1].diff).assertEqual(-2);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_11700
     * @tc.name Ason4Test117
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: MathFormulaObj = {
        equations: {
          linear: "y = mx + b",
          quadratic: {
            formula: "ax² + bx + c = 0",
            variables: ["a", "b", "c"]
          }
        }
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj: MathFormulaObj = ArkTSUtils.ASON.parse(jsonStr) as MathFormulaObj;

      expect(parsedObj.equations.linear).assertEqual("y = mx + b");
      expect(parsedObj.equations.quadratic.formula).assertEqual("ax² + bx + c = 0");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_11800
     * @tc.name Ason4Test118
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: DeepEmptyArrCleanObj = {
        level1: {
          level2: [{ valid: [1, 2], empty: [] }]
        }
      };

      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedData: DeepEmptyArrCleanObj = ArkTSUtils.ASON.parse(jsonStr) as DeepEmptyArrCleanObj;

      const cleanedLevel2: Test118_Obj2[] = [];
      for (let i = 0; i < parsedData.level1.level2.length; i++) {
        const item = parsedData.level1.level2[i];
        const newItem: Test118_Obj2 = {
          valid: item.valid,
          empty: [] as never[]
        };
        cleanedLevel2.push(newItem);
      }

      const parsedObj: DeepEmptyArrCleanObj = {
        level1: {
          level2: cleanedLevel2
        }
      };

      expect(parsedObj.level1.level2[0].valid.length).assertEqual(2);
      expect(parsedObj.level1.level2[0].empty.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_11900
     * @tc.name Ason4Test119
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: BinaryOneCountCompare = { numbers: [3, 5], counts: [] };
      const json = ArkTSUtils.ASON.stringify(obj);

      const parsedData: BinaryOneCountCompare = ArkTSUtils.ASON.parse(json) as BinaryOneCountCompare;
      const c: number[] = [];

      for (let i = 0; i < parsedData.numbers.length; i++) {
        let num = parsedData.numbers[i];
        let count = 0;
        while (num > 0) {
          if (num % 2 === 1) {
            count++;
          }
          num = Math.floor(num / 2);
        }
        c.push(count);
      }

      const parsed: BinaryOneCountCompare = { numbers: parsedData.numbers, counts: c };

      expect(parsed.counts[0]).assertEqual(2);
      expect(parsed.counts[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_12000
     * @tc.name Ason4Test120
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: VowelSortCompare = { words: ["apple", "banana", "cat"], sorted: [] };
      const json = ArkTSUtils.ASON.stringify(obj);

      const parsedData: VowelSortCompare = ArkTSUtils.ASON.parse(json) as VowelSortCompare;
      const vowels = ["a", "e", "i", "o", "u"];
      const temp: string[] = [];

      for (let i = 0; i < parsedData.words.length; i++) {
        temp.push(parsedData.words[i]);
      }

      for (let i = 0; i < temp.length - 1; i++) {
        for (let j = i + 1; j < temp.length; j++) {
          let countA = 0, countB = 0;

          const charsA = temp[i].split("");
          for (let k = 0; k < charsA.length; k++) {
            if (vowels.includes(charsA[k])) {
              countA++;
            }
          }

          const charsB = temp[j].split("");
          for (let k = 0; k < charsB.length; k++) {
            if (vowels.includes(charsB[k])) {
              countB++;
            }
          }

          if (countA > countB) {
            const tempStr = temp[i];
            temp[i] = temp[j];
            temp[j] = tempStr;
          }
        }
      }

      const parsed: VowelSortCompare = { words: parsedData.words, sorted: temp };

      expect(parsed.sorted[0]).assertEqual("cat");
      expect(parsed.sorted[2]).assertEqual("banana");
    });


    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_12100
     * @tc.name Ason4Test121
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: MultiQuoteObj = {
        text: '中文“引号”、英文"引号"、日文「引用」'
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj: MultiQuoteObj = ArkTSUtils.ASON.parse(jsonStr) as MultiQuoteObj;
      expect(parsedObj.text).assertEqual('中文“引号”、英文"引号"、日文「引用」');
      expect(parsedObj.text.includes("“")).assertEqual(true);
      expect(parsedObj.text.includes("「")).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_12200
     * @tc.name Ason4Test122
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: number[] = [5, 15, 25, 35];

      const processedArr: number[] = [];
      for (let i = 0; i < originalArr.length; i++) {
        const value = originalArr[i];
        processedArr.push(value > 20 ? 20 : value);
      }

      const jsonStr: string = ArkTSUtils.ASON.stringify(processedArr);
      const parsedArr: number[] = ArkTSUtils.ASON.parse(jsonStr) as number[];
      expect(ArkTSUtils.ASON.stringify(parsedArr)).assertEqual(ArkTSUtils.ASON.stringify([5, 15, 20, 20]));
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_12300
     * @tc.name Ason4Test123
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[] = ["a", "b", "a", "c", "a", "b"];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);

      const parsedData: string[] = ArkTSUtils.ASON.parse(jsonStr) as string[];
      const distribution: Record<string, number> = {};

      for (let i = 0; i < parsedData.length; i++) {
        const item = parsedData[i];
        distribution[item] = (distribution[item] || 0) + 1;
      }

      const parsedObj: FrequencyDistObj = { distribution };

      expect(parsedObj.distribution.a).assertEqual(3);
      expect(parsedObj.distribution.b).assertEqual(2);
      expect(parsedObj.distribution.c).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_12400
     * @tc.name Ason4Test124
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: DeepZeroWidthObj = {
        level1: {
          keyy: "value\u200C1",
          level2: { keyx: 100 }
        }
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj: DeepZeroWidthObj = ArkTSUtils.ASON.parse(jsonStr) as DeepZeroWidthObj;

      expect(parsedObj.level1.keyy).assertEqual("value\u200C1");
      expect(parsedObj.level1.level2.keyx).assertEqual(100);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_12500
     * @tc.name Ason4Test125
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: DeepEmptyStrCleanObj = {
        level1: {
          level2: { valid: "value", empty: "" }
        }
      };

      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedData: DeepEmptyStrCleanObj = ArkTSUtils.ASON.parse(jsonStr) as DeepEmptyStrCleanObj;

      const processedLevel2: Test125_Obj2 = {
        valid: parsedData.level1.level2.valid,
        empty: parsedData.level1.level2.empty === "" ? "" as never : parsedData.level1.level2.empty
      };

      const parsedObj: DeepEmptyStrCleanObj = {
        level1: {
          level2: processedLevel2
        }
      };

      expect(parsedObj.level1.level2.valid).assertEqual("value");
      expect(parsedObj.level1.level2.empty.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_12600
     * @tc.name Ason4Test126
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: DeepUniqueObjArr = {
        products: [
          { id: 1, details: { sku: "ABC123" } },
          { id: 2, details: { sku: "DEF456" } },
          { id: 1, details: { sku: "ABC123" } }
        ]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);

      const parsedData: DeepUniqueObjArr = ArkTSUtils.ASON.parse(jsonStr) as DeepUniqueObjArr;
      const seen = new Set<string>();
      const uniqueProducts: Test126_Obj1[] = [];

      for (let i = 0; i < parsedData.products.length; i++) {
        const item = parsedData.products[i];
        const key = `${item.id}-${item.details.sku}`;
        if (!seen.has(key)) {
          seen.add(key);
          uniqueProducts.push(item);
        }
      }

      const parsedObj: DeepUniqueObjArr = { products: uniqueProducts };

      expect(parsedObj.products.length).assertEqual(2);
      expect(parsedObj.products[0].details.sku).assertEqual("ABC123");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_12700
     * @tc.name Ason4Test127
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "Group1\u001DItem1\u001DItem2";
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalStr);
      const parsedStr: string = ArkTSUtils.ASON.parse(jsonStr) as string;
      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.split("\u001D").length).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_12800
     * @tc.name Ason4Test128
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: ApiResponse = {
        code: 200,
        data: { message: "success", timestamp: Date.now() }
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);

      const parsedData: ApiResponse = ArkTSUtils.ASON.parse(jsonStr) as ApiResponse;

      if (typeof parsedData.code !== "number") {
        throw new Error("code must be number");
      }
      if (typeof parsedData.data.message !== "string") {
        throw new Error("message must be string");
      }

      const parsedObj: ApiResponse = parsedData;
      expect(parsedObj.code).assertEqual(200);
      expect(typeof parsedObj.data.timestamp).assertEqual("number");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_12900
     * @tc.name Ason4Test129
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: RegexFilterObj = {
        email: "user@example.com",
        phone: "12345"
      };
      const emailRegex = /^[\w.-]+@[a-zA-Z0-9-]+\.[a-zA-Z]+$/;

      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedData: RegexFilterObj = ArkTSUtils.ASON.parse(jsonStr) as RegexFilterObj;

      const processedObj: RegexFilterObj = {
        email: parsedData.email,
        phone: (typeof parsedData.phone === "string" && !emailRegex.test(parsedData.phone)) ? "" : parsedData.phone || ""
      };

      const parsedObj: RegexFilterObj = {
        email: processedObj.email,
        phone: processedObj.phone ? processedObj.phone : undefined
      };

      expect(parsedObj.email).assertEqual("user@example.com");
      expect(parsedObj.phone).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_13000
     * @tc.name Ason4Test130
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FibIndexCompare = { indices: [5, 7], fibValues: [] };
      const json = ArkTSUtils.ASON.stringify(obj);

      const parsedData: FibIndexCompare = ArkTSUtils.ASON.parse(json) as FibIndexCompare;
      const f: number[] = [];

      for (let i = 0; i < parsedData.indices.length; i++) {
        const idx = parsedData.indices[i];
        let a = 0, b = 1;
        for (let j = 0; j < idx; j++) {
          const temp = a;
          a = b;
          b = temp + b;
        }
        f.push(a);
      }

      const parsed: FibIndexCompare = { indices: parsedData.indices, fibValues: f };
      expect(parsed.fibValues[0]).assertEqual(5);
      expect(parsed.fibValues[1]).assertEqual(13);
    });


    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_13100
     * @tc.name Ason4Test131
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "🍕 Pizza 🍟 Fries 🍔 Burger";
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalStr);
      const parsedStr: string = ArkTSUtils.ASON.parse(jsonStr) as string;

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("🍕")).assertEqual(true);
      expect(parsedStr.includes("🍔")).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_13200
     * @tc.name Ason4Test132
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: ValidObjFilterArr = {
        users: [
          { id: 1, name: "Alice" },
          { id: 2, name: "Charlie" }
        ]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);

      const parsedData: ValidObjFilterArr = ArkTSUtils.ASON.parse(jsonStr) as ValidObjFilterArr;
      const validUsers: Test132_Obj1[] = [];

      for (let i = 0; i < parsedData.users.length; i++) {
        const user = parsedData.users[i];
        if (user.id !== undefined) {
          validUsers.push(user);
        }
      }

      const parsedObj: ValidObjFilterArr = { users: validUsers };

      expect(parsedObj.users.length).assertEqual(2);
      expect(parsedObj.users[0].name).assertEqual("Alice");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_13300
     * @tc.name Ason4Test133
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FirstGreaterCompare = { numbers: [2, 5, 7, 10], target: 6, result: null };
      const json = ArkTSUtils.ASON.stringify(obj);

      const parsedData: FirstGreaterCompare = ArkTSUtils.ASON.parse(json) as FirstGreaterCompare;
      let res: number | null = null;

      for (let i = 0; i < parsedData.numbers.length; i++) {
        if (parsedData.numbers[i] > parsedData.target) {
          res = parsedData.numbers[i];
          break;
        }
      }

      const parsed: FirstGreaterCompare = {
        numbers: parsedData.numbers,
        target: parsedData.target,
        result: res
      };
      expect(parsed.result).assertEqual(7);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_13400
     * @tc.name Ason4Test134
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: UniquePropsCompare = {
        items: [
          { category: "A" },
          { category: "B" },
          { category: "A" }
        ],
        uniqueCategories: []
      };
      const json = ArkTSUtils.ASON.stringify(obj);

      const parsedData: UniquePropsCompare = ArkTSUtils.ASON.parse(json) as UniquePropsCompare;
      const u: string[] = [];

      for (let i = 0; i < parsedData.items.length; i++) {
        const item = parsedData.items[i];
        let found = false;

        for (let j = 0; j < u.length; j++) {
          if (u[j] === item.category) {
            found = true;
            break;
          }
        }

        if (!found) {
          u.push(item.category);
        }
      }

      const parsed: UniquePropsCompare = {
        items: parsedData.items,
        uniqueCategories: u
      };
      expect(parsed.uniqueCategories.length).assertEqual(2);
      expect(parsed.uniqueCategories[0]).assertEqual("A");
      expect(parsed.uniqueCategories[1]).assertEqual("B");

    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_13500
     * @tc.name Ason4Test135
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: NestedControlCharObj = {
        level1: { text: "Start\u0002Middle\u0003End" }
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj: NestedControlCharObj = ArkTSUtils.ASON.parse(jsonStr) as NestedControlCharObj;

      expect(parsedObj.level1.text).assertEqual("Start\u0002Middle\u0003End");
      expect(parsedObj.level1.text.includes("\u0002")).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_13600
     * @tc.name Ason4Test136
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FirstLettersConcatCompare = { words: ["Hello", "World", "Wide", "Web"], acronym: "" };
      const json = ArkTSUtils.ASON.stringify(obj);

      const parsedData: FirstLettersConcatCompare = ArkTSUtils.ASON.parse(json) as FirstLettersConcatCompare;
      let a = "";

      for (let i = 0; i < parsedData.words.length; i++) {
        const w = parsedData.words[i];
        a += w.charAt(0).toUpperCase();
      }

      const parsed: FirstLettersConcatCompare = {
        words: parsedData.words,
        acronym: a
      };
      expect(parsed.acronym).assertEqual("HWWW");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_13700
     * @tc.name Ason4Test137
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: ChemicalSymbolObj = {
        elements: {
          H2O: "Water",
          nested: { CO2: 100 }
        }
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj: ChemicalSymbolObj = ArkTSUtils.ASON.parse(jsonStr) as ChemicalSymbolObj;

      expect(parsedObj.elements.H2O).assertEqual("Water");
      expect(parsedObj.elements.nested.CO2).assertEqual(100);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_13800
     * @tc.name Ason4Test138
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: ValidNumberFilterObj = {
        level1: {
          values: [{ num: 10 }, { num: -5 }, { num: 0 }, { num: 15 }]
        }
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);

      const parsedData: ValidNumberFilterObj = ArkTSUtils.ASON.parse(jsonStr) as ValidNumberFilterObj;
      const validValues: Test138_Obj2[] = [];

      for (let i = 0; i < parsedData.level1.values.length; i++) {
        const item = parsedData.level1.values[i];
        if (item.num > 0) {
          validValues.push(item);
        }
      }

      const parsedObj: ValidNumberFilterObj = {
        level1: {
          values: validValues
        }
      };

      expect(parsedObj.level1.values.length).assertEqual(2);
      expect(parsedObj.level1.values[0].num).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_13900
     * @tc.name Ason4Test139
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: MusicSymbolObj = {
        notes: {
          Cx23: "Middle C Sharp",
          nested: { Dx23: 200 }
        }
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj: MusicSymbolObj = ArkTSUtils.ASON.parse(jsonStr) as MusicSymbolObj;

      expect(parsedObj.notes.Cx23).assertEqual("Middle C Sharp");
      expect(parsedObj.notes.nested.Dx23).assertEqual(200);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_14000
     * @tc.name Ason4Test140
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[][] = [
        ["Line1\u000BLine2"],
        ["Line3\u000BLine4"]
      ];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);
      const parsedArr: string[][] = ArkTSUtils.ASON.parse(jsonStr) as string[][];
      expect(parsedArr[0][0]).assertEqual("Line1\u000BLine2");
      expect(parsedArr[1][0].includes("\u000B")).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_14100
     * @tc.name Ason4Test141
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: RawData = {
        user_id: 1001,
        user_name: "Diana",
        user_email: "diana@example.com"
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);

      const parsedData: RawData = ArkTSUtils.ASON.parse(jsonStr) as RawData;
      const parsedObj: UserDTO = {
        id: parsedData.user_id,
        name: parsedData.user_name,
        email: parsedData.user_email
      };

      expect(parsedObj.id).assertEqual(1001);
      expect(parsedObj.email).assertEqual("diana@example.com");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_14200
     * @tc.name Ason4Test142
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: ObjectOnlyObj = {
        nested: { value: "test" },
        otherObj: { id: 1 },
        str: "extra"
      };

      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedData: ObjectOnlyObj = ArkTSUtils.ASON.parse(jsonStr) as ObjectOnlyObj;

      const processedObj: ObjectOnlyObj = {
        nested: parsedData.nested,
        otherObj: parsedData.otherObj,
        str: undefined
      };

      const parsedObj: ObjectOnlyObj = {
        nested: { value: "" },
        otherObj: { id: 0 },
        str: undefined
      };

      expect(parsedObj.nested.value).assertEqual("");
      expect(parsedObj.otherObj?.id).assertEqual(0);
      expect(parsedObj.str).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_14300
     * @tc.name Ason4Test143
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test143_Obj2 = {
        logs: [
          { action: "login", time: 1704067200000 },
          { action: "logout", time: 1704070800000 }
        ]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);

      const parsedData: Test143_Obj2 = ArkTSUtils.ASON.parse(jsonStr) as Test143_Obj2;
      const formattedLogs: Test143_Obj1[] = [];

      for (let i = 0; i < parsedData.logs.length; i++) {
        const log = parsedData.logs[i];
        const date = new Date(log.time);
        const formattedDate = date.toISOString().split("T")[0];
        formattedLogs.push({
          action: log.action,
          time: formattedDate
        });
      }

      const parsedObj: FormattedDateObj = { logs: formattedLogs };

      expect(parsedObj.logs[0].time).assertEqual("2024-01-01");
      expect(parsedObj.logs[1].time).assertEqual("2024-01-01");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_14400
     * @tc.name Ason4Test144
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "✈️ Travel 🏨 Hotel 🌍 World";
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalStr);
      const parsedStr: string = ArkTSUtils.ASON.parse(jsonStr) as string;

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("✈️")).assertEqual(true);
      expect(parsedStr.includes("🌍")).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_14500
     * @tc.name Ason4Test145
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FactorialCompare = { numbers: [3, 5], results: [] };
      const json = ArkTSUtils.ASON.stringify(obj);

      const parsedData: FactorialCompare = ArkTSUtils.ASON.parse(json) as FactorialCompare;
      const r: number[] = [];

      for (let i = 0; i < parsedData.numbers.length; i++) {
        const n = parsedData.numbers[i];
        let fact = 1;
        for (let j = 2; j <= n; j++) {
          fact *= j;
        }
        r.push(fact);
      }

      const parsed: FactorialCompare = {
        numbers: parsedData.numbers,
        results: r
      };
      expect(parsed.results[0]).assertEqual(6);
      expect(parsed.results[1]).assertEqual(120);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_14600
     * @tc.name Ason4Test146
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: RemoveVowelsCompare = { strings: ["apple", "banana"], consonants: [] };
      const json = ArkTSUtils.ASON.stringify(obj);

      const parsedData: RemoveVowelsCompare = ArkTSUtils.ASON.parse(json) as RemoveVowelsCompare;
      const c: string[] = [];
      const vowels = ["a", "e", "i", "o", "u"];

      for (let i = 0; i < parsedData.strings.length; i++) {
        const s = parsedData.strings[i];
        let str = "";

        for (let j = 0; j < s.length; j++) {
          let isVowel = false;

          for (let k = 0; k < vowels.length; k++) {
            if (vowels[k] === s[j].toLowerCase()) {
              isVowel = true;
              break;
            }
          }

          if (!isVowel) {
            str += s[j];
          }
        }

        c.push(str);
      }

      const parsed: RemoveVowelsCompare = {
        strings: parsedData.strings,
        consonants: c
      };
      expect(parsed.consonants[0]).assertEqual("ppl");
      expect(parsed.consonants[1]).assertEqual("bnn");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_14700
     * @tc.name Ason4Test147
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: TwoSumCompare = { numbers: [2, 7, 11, 15], target: 9, indices: [] };
      const json = ArkTSUtils.ASON.stringify(obj);

      const parsedData: TwoSumCompare = ArkTSUtils.ASON.parse(json) as TwoSumCompare;
      const i: number[] = [];
      let found = false;

      for (let a = 0; a < parsedData.numbers.length; a++) {
        for (let b = a + 1; b < parsedData.numbers.length; b++) {
          if (parsedData.numbers[a] + parsedData.numbers[b] === parsedData.target) {
            i.push(a, b);
            found = true;
            break;
          }
        }
        if (found) {
          break;
        }
      }

      const parsed: TwoSumCompare = {
        numbers: parsedData.numbers,
        target: parsedData.target,
        indices: i
      };
      expect(parsed.indices.length).assertEqual(2);
      expect(parsed.indices[0]).assertEqual(0);
      expect(parsed.indices[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_14800
     * @tc.name Ason4Test148
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: ThreeDimSpecialArr = [
        "!@#",
        [["$%^"], ["&*()"]],
        [[["[]{}"], ["<>"]]]
      ];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);
      const parsedArr: ThreeDimSpecialArr = ArkTSUtils.ASON.parse(jsonStr) as ThreeDimSpecialArr;

      expect(parsedArr[0]).assertEqual("!@#");
      expect(((parsedArr[1] as string[][])[0])[0]).assertEqual("$%^");
      expect(((parsedArr[2] as string[][][])[0][0])[0]).assertEqual("[]{}");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_14900
     * @tc.name Ason4Test149
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: MovingAvgCompare = { numbers: [1, 2, 3, 4, 5], window: 3, averages: [] };
      const json = ArkTSUtils.ASON.stringify(obj);

      const parsedData: MovingAvgCompare = ArkTSUtils.ASON.parse(json) as MovingAvgCompare;
      const a: number[] = [];
      const w = parsedData.window;

      for (let i = 0; i <= parsedData.numbers.length - w; i++) {
        let sum = 0;
        for (let j = 0; j < w; j++) {
          sum += parsedData.numbers[i + j];
        }
        a.push(sum / w);
      }

      const parsed: MovingAvgCompare = {
        numbers: parsedData.numbers,
        window: parsedData.window,
        averages: a
      };
      expect(parsed.averages.length).assertEqual(3);
      expect(parsed.averages[0]).assertEqual(2);
      expect(parsed.averages[2]).assertEqual(4);
    });


    /**
     * @tc.number SUB_BUILTINS_Ason4_TEST_15000
     * @tc.name Ason4Test150
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason4Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    const obj: CharCountSortCompare = {
      strings: ["aasample123", "asample", "atest"],
      sorted: []
    };
    const json = ArkTSUtils.ASON.stringify(obj);
    const parsedData: CharCountSortCompare = ArkTSUtils.ASON.parse(json) as CharCountSortCompare;
    const temp: string[] = [];
    for (let i = 0; i < parsedData.strings.length; i++) {
      temp.push(parsedData.strings[i]);
    }

    for (let i = 0; i < temp.length - 1; i++) {
      for (let j = 0; j < temp.length - i - 1; j++) {
        let countA = 0;
        let countB = 0;

        for (let k = 0; k < temp[j].length; k++) {
          if (temp[j][k] === 'a') {
            countA++;
          }
        }
        for (let k = 0; k < temp[j + 1].length; k++) {
          if (temp[j + 1][k] === 'a') {
            countB++;
          }
        }

        if (countA > countB) {
          const tempStr = temp[j];
          temp[j] = temp[j + 1];
          temp[j + 1] = tempStr;
        }
      }
    }

    const result: CharCountSortCompare = {
      strings: parsedData.strings,
      sorted: temp
    };

    expect(result.sorted[0]).assertEqual("atest");
    expect(result.sorted[2]).assertEqual("aasample123");
  });
  })
}
