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


class SetToKeyMap {
  exists: Record<string, boolean> = new Record<string, boolean>();
}

interface Test2_Obj1 {
  lang: string;
  symbol: string;
}

interface MultiLangArrObj {
  labels: Test2_Obj1[];
}

interface MapEntriesArr {
  entries: [string, number][];
}

interface Test4_Obj1 {
  name: string;
  age: number;
}

interface AgeDiffCompare {
  people: Test4_Obj1[];
  diffs: number[];
}

interface FilteredUser {
  id: number;
  name: string;
}

interface FilteredPropsArr {
  users: FilteredUser[];
}

interface Test5_Obj3 {
  id: number;
  name: string;
  age: number;
  email: string;
}

interface Test5_Obj2 {
  users: Test5_Obj3[];
}

class Test5_Obj1 {
  name: string = "";
  status: string = "";
}

class EmojiNestedObj {
  user: Test5_Obj1 = new Test5_Obj1();
}

class Test7_Obj2 {
  enabled: boolean;
  timeout: number;
}

class Test7_Obj1 {
  theme: string = "";
  layout: string = "";
  nested: Test7_Obj2 = new Test7_Obj2();
}

class DefaultValueDeepObj {
  config: Test7_Obj1 = new Test7_Obj1();
}


interface Test7_Obj4 {
  enabled: boolean;
}

interface Test7_Obj5 {
  theme: string;
  nested: Test7_Obj4;
}

interface Test7_Obj3 {
  config: Test7_Obj5;
}

interface Test8_Obj1 {
  name: string;
  timestamp: number;
  localDate: string;
}

interface LocalizedDateObj {
  events: Test8_Obj1[];
}

interface Test8_Obj3 {
  name: string;
  timestamp: number;
}

interface Test8_Obj2 {
  events: Test8_Obj3[];
}

interface Test9_Obj1 {
  id: number;
  expression: string;
}

interface MathFormulaArrObj {
  formulas: Test9_Obj1[];
}

class Test10_Obj1 {
  withJoiner: string = "";
  withSpace: string = "";
}

class ZeroWidthCharObj {
  text: Test10_Obj1 = new Test10_Obj1();
}

interface CaseConvertArr {
  tags: string[];
}

class Test12_Obj2 {
  enable_ssl: boolean;
  timeout_ms: number;
}

class Test12_Obj1 {
  api_endpoint: string = "";
  max_size: string = "";
  nested: Test12_Obj2 = new Test12_Obj2();
}

class SpecialCharConfigObj {
  settings: Test12_Obj1 = new Test12_Obj1();
}

interface Test14_Obj1 {
  name: string;
  value: string;
}

interface UnitValueObj {
  measurements: Test14_Obj1[];
}

interface ElementFrequencyObj {
  numbers: number[];
  frequency: Record<number, number>;
}

interface Test16_Obj2 {
  score: number;
}

interface Test16_Obj1 {
  values: Test16_Obj2[];
  avgScore: number;
}

interface DeepAvgObj {
  groups: Test16_Obj1[];
}


interface Test16_Obj5 {
  score: number;
}

interface Test16_Obj4 {
  values: Test16_Obj5[];
}

interface Test16_Obj3 {
  groups: Test16_Obj4[];
}

interface Test17_Obj1 {
  emoji: string;
  count: number;
}

interface EmojiArrObj {
  reactions: Test17_Obj1[];
}

interface SumCountCompare {
  numbers: number[];
  sum: number;
  count: number;
}


class Test19_Obj2 {
  age: undefined;
  name: string = "";
}

class Test19_Obj1 {
  metadata: undefined;
  id: number;
  profile: Test19_Obj2 = new Test19_Obj2();
}

class FilteredDeepPropsObj {
  user: Test19_Obj1 = new Test19_Obj1();
}

interface Test19_Obj5 {
  name: string;
  age: number;
  address: string;
}

interface Test19_Obj6 {
  timestamp: number;
}

interface Test19_Obj4 {
  id: number;
  profile: Test19_Obj5;
  metadata: Test19_Obj6;
}

interface Test19_Obj3 {
  user: Test19_Obj4;
}

interface SetUnionObj {
  union: string[];
}

interface Test21_Obj1 {
  sets: Set<string>[];
}

interface Test22_Obj1 {
  lang: string;
  content: string;
}

interface MultiPunctuationObj {
  texts: Test22_Obj1[];
}

interface Test24_Obj1 {
  name: string;
  num: number;
}

interface ScientificNotationObj {
  values: Test24_Obj1[];
}

class Test25_Obj2 {
  combined: string = "";
}

class Test25_Obj1 {
  original: string = "";
  nested: Test25_Obj2 = new Test25_Obj2();
}

class ZeroWidthNonJoinerObj {
  texts: Test25_Obj1 = new Test25_Obj1();
}

class Test26_Obj1 {
  volume: number;
  brightness: number;
}

class ValueRangeCheckObj {
  settings: Test26_Obj1 = new Test26_Obj1();
}

interface Test27_Obj1 {
  name: string;
  regex: string;
}

interface RegexPatternObj {
  patterns: Test27_Obj1[];
}

interface Test28_Obj1 {
  animal: string;
  emoji: string;
}

interface AnimalEmojiObj {
  zoo: Test28_Obj1[];
}

class SetSymmetricDiffObj {
  symmetricDiff: string[] = [];
}

class Test30_Obj1 {
  a: Set<string> = {};
  b: Set<string> = {};
}

interface Test31_Obj1 {
  lang: string;
  text: string;
}

interface GreetingObj {
  greetings: Test31_Obj1[];
}

interface Test31_Obj2 {
  name: string;
  sql: string;
}

interface SqlQueryObj {
  queries: Test31_Obj2[];
}

interface Test32_Obj1 {
  day: string;
  emoji: string;
}

interface WeatherEmojiObj {
  forecasts: Test32_Obj1[];
}

interface Test33_Obj1 {
  lang: string;
  symbol: string;
}

interface MultiLangNumberObj {
  numbers: Test33_Obj1[];
}

interface Test36_Obj1 {
  name: string;
  xml: string;
}

interface XmlTagObj {
  elements: Test36_Obj1[];
}

interface Test37_Obj1 {
  name: string;
  yaml: string;
}

interface YamlContentObj {
  configs: Test37_Obj1[];
}

interface Test38_Obj1 {
  name: string;
  query: string;
}

interface GraphqlQueryObj {
  queries: Test38_Obj1[];
}

interface Test39_Obj1 {
  name: string;
  emoji: string;
}

interface TransportEmojiObj {
  vehicles: Test39_Obj1[];
}

class Test41_Obj1 {
  en: string = "";
  fr: string = "";
  zh: string = "";
}

class MultiLangPunctObj {
  messages: Test41_Obj1 = new Test41_Obj1();
}

interface Test42_Obj1 {
  name: string;
  cmd: string;
}

interface DockerCommandObj {
  commands: Test42_Obj1[];
}

interface Test43_Obj1 {
  name: string;
  code: string;
}

interface JavaAnnotationObj {
  annotations: Test43_Obj1[];
}

interface Test44_Obj1 {
  values: number[];
  maxValue: number;
}

interface DeepMaxObj {
  datasets: Test44_Obj1[];
}

interface Test44_Obj3 {
  values: number[];
}

interface Test44_Obj2 {
  datasets: Test44_Obj3[];
}

interface Test45_Obj1 {
  name: string;
  emoji: string;
}

interface TransportEmojiObj1 {
  vehicles: Test45_Obj1[];
}

interface Test45_Obj2 {
  name: string;
  ounces: number;
}

interface Test45_Obj3 {
  ingredients: Test45_Obj2[];
}

interface Test45_Obj4 {
  name: string;
  ounces: number;
  grams: number;
}

interface OunceToGramObj {
  ingredients: Test45_Obj4[];
}

class PositiveSumObj {
  numbers: number[] = [];
  sum: number;
}

interface UpperCaseArr {
  words: string[];
  upper: string[];
}

interface EvenNumbers {
  data: number[];
  evens: number[];
}

interface AverageObj {
  values: number[];
  avg: number;
}

interface StringLengths {
  texts: string[];
  lengths: number[];
}

interface HourExtract {
  times: string[];
  hours: number[];
}

interface LongStrings {
  strings: string[];
  longs: string[];
}

interface RoundedNumbers {
  nums: number[];
  rounded: number[];
}

class PositiveCount {
  numbers: number[] = [];
  count: number;
}

interface FirstLetters {
  words: string[];
  letters: string[];
}

interface ReversedArr {
  data: string[];
  reversed: string[];
}

interface SquaredNumbers {
  numbers: number[];
  squares: number[];
}

interface SubstringFilter {
  strings: string[];
  filtered: string[];
}

interface YearExtract {
  dates: string[];
  years: number[];
}

interface SumSkipZero {
  values: number[];
  sum: number;
}

interface StringConcat {
  parts: string[];
  combined: string;
}

interface ThresholdFilter {
  numbers: number[];
  above: number[];
}

interface LowerCaseArr {
  words: string[];
  lower: string[];
}

interface ProductObj {
  factors: number[];
  product: number;
}

interface LastElement {
  items: string[];
  last: string;
}

class CharCount {
  text: string = "";
  count: number;
}

interface BinaryNumbers {
  numbers: number[];
  binary: string[];
}

interface Test68_Obj1 {
  id: number;
}

interface FilterObjects {
  items: Test68_Obj1[];
  filtered: Test68_Obj1[];
}

interface ArrayLength {
  data: number[];
  length: number;
}

class StringReplace {
  text: string = "";
  replaced: string = "";
}

interface RangeCheck {
  numbers: number[];
  inRange: number[];
}

interface Test74_Obj1 {
  name: string;
}

interface ExtractProps {
  items: Test74_Obj1[];
  names: string[];
}

interface Test69_Obj2 {
  id: number;
}

interface Test73_Obj2 {
  name: string;
}

interface TrimStrings {
  texts: string[];
  trimmed: string[];
}

interface MaxValue {
  numbers: number[];
  max: number;
}

interface UniqueElements {
  data: number[];
  unique: number[];
}

interface NumToStringArr {
  numbers: number[];
  strings: string[];
}

interface Test78_Obj1 {
  id: number;
  active: boolean;
}

interface FilterActiveUsers {
  users: Test78_Obj1[];
  active: Test78_Obj1[];
}

interface TotalStringLength {
  words: string[];
  total: number;
}

interface ToPercentage {
  values: number[];
  percentages: string[];
}

interface EvenLengthStrings {
  strings: string[];
  even: string[];
}

interface ExtractMonths {
  dates: string[];
  months: string[];
}

interface CubedNumbers {
  numbers: number[];
  cubes: number[];
}

interface CapitalizedWords {
  words: string[];
  capitalized: string[];
}

interface RoundedAverage {
  values: number[];
  avg: number;
}

interface NegativeCount {
  numbers: number[];
  count: number;
}

interface JoinedWithSeparator {
  words: string[];
  joined: string;
}

interface SumOfSquares {
  numbers: number[];
  sum: number;
}

interface Test89_Obj1 {
  id: number;
  amount: number;
}

interface SumByProperty {
  orders: Test89_Obj1[];
  total: number;
}

interface Test90_Obj1 {
  type: string;
  amount: number;
}

interface ConditionalSum {
  transactions: Test90_Obj1[];
  income: number;
}

interface MinValue {
  numbers: number[];
  min: number;
}

interface LowercaseCompare {
  words: string[];
  lowercase: string[];
}

interface EvenCompare {
  numbers: number[];
  evens: number[];
}

interface Test94_Obj1 {
  id: number;
  name: string;
}

interface ExtractIdCompare {
  users: Test94_Obj1[];
  ids: number[];
}

interface SquareCompare {
  numbers: number[];
  squares: number[];
}

interface ConcatCompare {
  parts: string[];
  combined: string[];
}

interface ExtractDayCompare {
  dates: string[];
  days: string[];
}

interface GreaterThanTenCompare {
  numbers: number[];
  result: number[];
}

interface CapitalCompare {
  words: string[];
  capitalized: string[];
}

interface Test100_Obj1 {
  name: string;
  active: boolean;
}

interface ActiveUserCompare {
  users: Test100_Obj1[];
  active: Test100_Obj1[];
}

interface SumToArrayCompare {
  numbers: number[];
  sum: number[];
}

interface ReverseElementsCompare {
  strings: string[];
  reversed: string[];
}

interface DivisibleByFiveCompare {
  numbers: number[];
  result: number[];
}

interface Test104_Obj1 {
  id: number;
}

interface Test104_Obj2 {
  id: number;
  type: string;
}

interface AddPropCompare {
  items: Test104_Obj1[];
  withProp: Test104_Obj2[];
}

interface LengthStatsCompare {
  strings: string[];
  lengths: number[];
}

interface WithUnitCompare {
  values: number[];
  withUnit: string[];
}

interface LongStringsCompare {
  strings: string[];
  longs: string[];
}

interface Test108_Obj1 {
  name: string;
  value: number;
}

interface SortedCompare {
  items: Test108_Obj1[];
  sorted: Test108_Obj1[];
}

interface AbsoluteCompare {
  numbers: number[];
  absolute: number[];
}

interface ReplaceCharCompare {
  strings: string[];
  replaced: string[];
}

interface Test111_Obj1 {
  id: number;
  amount: number;
}

interface SumPropCompare {
  orders: Test111_Obj1[];
  total: number[];
}

interface UniqueCompare {
  numbers: number[];
  unique: number[];
}

interface FirstCharCompare {
  words: string[];
  firstChars: string[];
}

interface BinaryStrCompare {
  numbers: number[];
  binary: string[];
}

interface Test115_Obj1 {
  name: string;
  price: number;
}

interface PriceFilterCompare {
  products: Test115_Obj1[];
  expensive: Test115_Obj1[];
}

interface CubeCompare {
  numbers: number[];
  cubes: number[];
}

interface JoinWithSepCompare {
  words: string[];
  joined: string[];
}

interface FixedTwoCompare {
  numbers: number[];
  fixed: number[];
}

interface SubstrFilterCompare {
  strings: string[];
  filtered: string[];
}

interface Test120_Obj1 {
  id: number;
  price: number;
}

interface UpdatePriceCompare {
  items: Test120_Obj1[];
  updated: Test120_Obj1[];
}

interface MinToArrayCompare {
  numbers: number[];
  min: number[];
}

interface TrimmedCompare {
  strings: string[];
  trimmed: string[];
}

interface OddNumbersCompare {
  numbers: number[];
  odds: number[];
}

interface Test124_Obj1 {
  id: number;
  name: string;
}

interface ExtractNamesCompare {
  employees: Test124_Obj1[];
  names: string[];
}

interface SquareRootCompare {
  numbers: number[];
  roots: number[];
}

interface CapitalFirstCompare {
  words: string[];
  capitalized: string[];
}

interface MonthNameCompare {
  dates: string[];
  months: string[];
}

interface NegativeNumbersCompare {
  numbers: number[];
  negatives: number[];
}

interface UppercaseCompare {
  words: string[];
  uppercase: string[];
}

interface Test130_Obj1 {
  name: string;
  age: number;
}

interface AgeFilterCompare {
  people: Test130_Obj1[];
  adults: Test130_Obj1[];
}

interface DoubleSumCompare {
  numbers: number[];
  doubledSum: number[];
}

interface ReverseArrayCompare {
  strings: string[];
  reversed: string[];
}

interface DivisibleBySevenCompare {
  numbers: number[];
  result: number[];
}

interface Test134_Obj1 {
  name: string;
}

interface Test134_Obj2 {
  name: string;
  index: number;
}

interface AddIndexCompare {
  items: Test134_Obj1[];
  indexed: Test134_Obj2[];
}

interface CharIncludeCountCompare {
  strings: string[];
  counts: number[];
}

interface ScientificCompare {
  numbers: number[];
  scientific: string[];
}

interface OddLengthCompare {
  strings: string[];
  oddLength: string[];
}


interface DivisibleBy15Compare {
  numbers: number[];
  result: number[];
}

interface ReciprocalCompare {
  numbers: number[];
  reciprocals: number[];
}

interface ReplaceSubstrCompare {
  strings: string[];
  replaced: string[];
}

interface UniqueSortedCompare {
  numbers: number[];
  result: number[];
}

interface LastCharCompare {
  words: string[];
  lastChars: string[];
}

interface CelsiusCompare {
  temps: number[];
  formatted: string[];
}

interface Test144_Obj1 {
  name: string;
  email: string;
}

interface ExtractDomainCompare {
  users: Test144_Obj1[];
  domains: string[];
}

interface FourthPowerCompare {
  numbers: number[];
  powers: number[];
}

interface MaskMiddleCompare {
  strings: string[];
  masked: string[];
}

interface FixedOneCompare {
  numbers: number[];
  fixed: number[];
}

interface NoNumbersCompare {
  strings: string[];
  filtered: string[];
}

interface Test149_Obj1 {
  id: number;
  status: string;
}

interface UpdateStatusCompare {
  orders: Test149_Obj1[];
  updated: Test149_Obj1[];
}

interface TripleMaxCompare {
  numbers: number[];
  result: number[];
}

export default function Json5Test() {
  describe('Json5Test', () => {
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

      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   Json5Test003
     * @tc.number SUB_BUILTINS_Json5_TEST_0300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[] = ["$100", "€50", "¥1000", "£20"];
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedArr: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);
      expect(parsedArr[0].asString()).assertEqual("$100");
      expect(parsedArr[1].asString()).assertEqual("€50");
      expect(parsedArr[2].asString()).assertEqual("¥1000");
    });

    /**
     * @tc.name   Json5Test006
     * @tc.number SUB_BUILTINS_Json5_TEST_0600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: EmojiNestedObj = {
        user: {
          name: "😊 Alice",
          status: "🎉 Online"
        }
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: EmojiNestedObj = JSON.parse<EmojiNestedObj>(jsonStr,Class.from<EmojiNestedObj>()) as EmojiNestedObj;

      expect(parsedObj.user.name).assertEqual("😊 Alice");
      expect(parsedObj.user.status).assertEqual("🎉 Online");
    });

    /**
     * @tc.name   Json5Test007
     * @tc.number SUB_BUILTINS_Json5_TEST_0700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: DefaultValueDeepObj = {
        config: {
          theme: "light",
          nested: { enabled: true }
        }
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: DefaultValueDeepObj = JSON.parse<DefaultValueDeepObj>(jsonStr, (key:string, value: Any) => {
        if (key === "layout") {
          return value ?? "grid";
        }
        if (key === "timeout") {
          return value ?? 3000;
        }
        return value;
      },Class.from<DefaultValueDeepObj>()) as DefaultValueDeepObj;
      expect(parsedObj.config.layout).assertEqual("");
      expect(parsedObj.config.nested.timeout).assertEqual(0);
    });

    /**
     * @tc.name   Json5Test010
     * @tc.number SUB_BUILTINS_Json5_TEST_1000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: ZeroWidthCharObj = {
        text: {
          withJoiner: "a\u200Db",
          withSpace: "x\u200By"
        }
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: ZeroWidthCharObj = JSON.parse<ZeroWidthCharObj>(jsonStr,Type.from<ZeroWidthCharObj>()) as ZeroWidthCharObj;

      expect(parsedObj.text.withJoiner).assertEqual("a\u200Db");
      expect(parsedObj.text.withSpace).assertEqual("x\u200By");
    });

    /**
     * @tc.name   Json5Test012
     * @tc.number SUB_BUILTINS_Json5_TEST_1200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: SpecialCharConfigObj = {
        settings: {
          api_endpoint: "https://api.example.com/v1",
          max_size: "10MB",
          nested: { "enable_ssl": true, timeout_ms: 5000 }
        }
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: SpecialCharConfigObj = JSON.parse<SpecialCharConfigObj>(jsonStr, Type.from<SpecialCharConfigObj>()) as SpecialCharConfigObj;

      expect(parsedObj.settings.api_endpoint).assertEqual("https://api.example.com/v1");
      expect(parsedObj.settings.nested.timeout_ms).assertEqual(5000);
    });

    /**
     * @tc.name   Json5Test013
     * @tc.number SUB_BUILTINS_Json5_TEST_1300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalSet: Set<string> = new Set<string>(["b", "a", "c"]);
      const jsonStr: string = JSON.stringify(originalSet, (key:string, value: Any) =>
      value instanceof Set ? Array.from(value) : value
      );
      const parsedArr: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      expect(JSON.stringify(parsedArr[1].asString())).assertEqual(JSON.stringify("a"));
    });

    /**
     * @tc.name   Json5Test020
     * @tc.number SUB_BUILTINS_Json5_TEST_2000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[] = [
        "/home/user/docs/file name.txt",
        "/var/log/app.log",
        "C:\\Program Files\\app.exe"
      ];
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedArr: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      expect(parsedArr[0].asString()).assertEqual("/home/user/docs/file name.txt");
      expect(parsedArr[2].asString()).assertEqual("C:\\Program Files\\app.exe");
    });


    /**
     * @tc.name   Json5Test023
     * @tc.number SUB_BUILTINS_Json5_TEST_2300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[] = [
        "?q=json&page=1&limit=10",
        "?category=books&sort=price&order=asc"
      ];
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedArr: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      expect(parsedArr[0].asString()).assertEqual("?q=json&page=1&limit=10");
      expect(parsedArr[1].asString()).assertEqual("?category=books&sort=price&order=asc");
    });

    /**
     * @tc.name   Json5Test025
     * @tc.number SUB_BUILTINS_Json5_TEST_2500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: ZeroWidthNonJoinerObj = {
        texts: {
          original: "a\u200Cb",
          nested: { combined: "x\u200Cy" }
        }
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: ZeroWidthNonJoinerObj = JSON.parse<ZeroWidthNonJoinerObj>(jsonStr,Class.from<ZeroWidthNonJoinerObj>()) as ZeroWidthNonJoinerObj;
      expect(parsedObj.texts.original).assertEqual("a\u200Cb");
      expect(parsedObj.texts.nested.combined).assertEqual("x\u200Cy");
    });

    /**
     * @tc.name   Json5Test026
     * @tc.number SUB_BUILTINS_Json5_TEST_2600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: ValueRangeCheckObj = {
        settings: { volume: 120, brightness: -10 }
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: ValueRangeCheckObj = JSON.parse<ValueRangeCheckObj>(jsonStr, (key:string, value: Any) => {
        if (key === "volume" || key === "brightness") {
          return Math.max(0, Math.min(100, value as number));
        }
        return value;
      },Type.from<ValueRangeCheckObj>()) as ValueRangeCheckObj;
      expect(parsedObj.settings.volume).assertEqual(100);
      expect(parsedObj.settings.brightness).assertEqual(0);
    });

    /**
     * @tc.name   Json5Test029
     * @tc.number SUB_BUILTINS_Json5_TEST_2900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[] = [
        ".class-name > .child:nth-child(2)",
        "#id-name[data-attr='value']",
        "div:not(.exclude)"
      ];
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedArr: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      expect(parsedArr[0].asString()).assertEqual(".class-name > .child:nth-child(2)");
      expect(parsedArr[1].asString()).assertEqual("#id-name[data-attr='value']");
    });

    /**
     * @tc.name   Json5Test033
     * @tc.number SUB_BUILTINS_Json5_TEST_3300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[] = [
        "npm install --save-dev typescript",
        "git commit -m 'fix: resolve issue'",
        "docker run -p 8080:80 --name app"
      ];
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedArr: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      expect(parsedArr[0].asString()).assertEqual("npm install --save-dev typescript");
      expect(parsedArr[1].asString()).assertEqual("git commit -m 'fix: resolve issue'");
    });


    /**
     * @tc.name   Json5Test040
     * @tc.number SUB_BUILTINS_Json5_TEST_4000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[] = [
        "$.store.book[0].title",
        "$.store.book[*].author",
        "$.store..price"
      ];
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedArr: jsonx.JsonElement = JSON.parseJsonElement(jsonStr, (key: string, value: jsonx.JsonElement) => {
        return value;
      });

      expect(parsedArr[0].asString()).assertEqual("$.store.book[0].title");
      expect(parsedArr[2].asString()).assertEqual("$.store..price");
    });

    /**
     * @tc.name   Json5Test041
     * @tc.number SUB_BUILTINS_Json5_TEST_4100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: MultiLangPunctObj = {
        messages: {
          en: "Hello! How are you?",
          fr: "Bonjour ! Comment allez-vous ?",
          zh: "你好！你怎么样？"
        }
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: MultiLangPunctObj = JSON.parse<MultiLangPunctObj>(jsonStr, (key: string, value: Any) => {
        return value;
      },Type.from<MultiLangPunctObj>()) as MultiLangPunctObj;

      expect(parsedObj.messages.fr).assertEqual("Bonjour ! Comment allez-vous ?");
      expect(parsedObj.messages.zh).assertEqual("你好！你怎么样？");
    });



    /**
     * @tc.name   Json5Test067
     * @tc.number SUB_BUILTINS_Json5_TEST_6700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CharCount = { text: "abac", count: 0 };
      const json = JSON.stringify(obj);
      const parsed: CharCount = JSON.parse<CharCount>(json, (k: string, v: Any) => {
        if (k === "") {
          let c = 0;
          for (let i = 0; i < (v as CharCount).text.length; i++) {
            if ((v as CharCount).text[i] === "a") {
              c++;
            }
          }
          return { text: (v as CharCount).text, count: c } as CharCount;
        }
        return v;
      },Type.from<CharCount>()) as CharCount;
      expect(parsed.count).assertEqual(2);
    });



    /**
     * @tc.name   Json5Test071
     * @tc.number SUB_BUILTINS_Json5_TEST_7100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: StringReplace = { text: "abc", replaced: "" };
      const json = JSON.stringify(obj);
      const parsed: StringReplace = JSON.parse<StringReplace>(json, (k: string, v: Any) => {
        if (k === "") {
          const r = (v as StringReplace).text.replace("a", "x");
          return { text: (v as StringReplace).text, replaced: r } as StringReplace;
        }
        return v;
      },Type.from<StringReplace>()) as StringReplace;
      expect(parsed.replaced).assertEqual("xbc");
    });

  })
}

