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


interface SetToKeyMap {
  exists: Record<string, boolean>;
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

interface Test5_Obj1 {
  name: string;
  status: string;
}

interface EmojiNestedObj {
  user: Test5_Obj1;
}

interface Test7_Obj2 {
  enabled: boolean;
  timeout: number;
}

interface Test7_Obj1 {
  theme: string;
  layout: string;
  nested: Test7_Obj2;
}

interface DefaultValueDeepObj {
  config: Test7_Obj1;
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

interface Test10_Obj1 {
  withJoiner: string;
  withSpace: string;
}

interface ZeroWidthCharObj {
  text: Test10_Obj1;
}

interface CaseConvertArr {
  tags: string[];
}

interface Test12_Obj2 {
  "enable_ssl": boolean;
  timeout_ms: number;
}

interface Test12_Obj1 {
  api_endpoint: string;
  "max_size": string;
  nested: Test12_Obj2;
}

interface SpecialCharConfigObj {
  settings: Test12_Obj1;
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


interface Test19_Obj2 {
  age: undefined;
  name: string;
}

interface Test19_Obj1 {
  metadata: undefined;
  id: number;
  profile: Test19_Obj2;
}

interface FilteredDeepPropsObj {
  user: Test19_Obj1;
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
  number: number;
}

interface ScientificNotationObj {
  values: Test24_Obj1[];
}

interface Test25_Obj2 {
  combined: string;
}

interface Test25_Obj1 {
  original: string;
  nested: Test25_Obj2;
}

interface ZeroWidthNonJoinerObj {
  texts: Test25_Obj1;
}

interface Test26_Obj1 {
  volume: number;
  brightness: number;
}

interface ValueRangeCheckObj {
  settings: Test26_Obj1;
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

interface SetSymmetricDiffObj {
  symmetricDiff: string[];
}

interface Test30_Obj1 {
  a: Set<string>;
  b: Set<string>;
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

interface Test41_Obj1 {
  en: string;
  fr: string;
  zh: string;
}

interface MultiLangPunctObj {
  messages: Test41_Obj1;
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

interface PositiveSumObj {
  numbers: number[];
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
  long: string[];
}

interface RoundedNumbers {
  nums: number[];
  rounded: number[];
}

interface PositiveCount {
  numbers: number[];
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

interface CharCount {
  text: string;
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

interface StringReplace {
  text: string;
  replaced: string;
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
  long: string[];
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
      await sleep(40);
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   Json5Test001
     * @tc.number SUB_BUILTINS_Json5_TEST_0100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      {
        const originalSet: Set<string> = new Set(["apple", "banana", "cherry"]);
        const jsonStr: string = JSON.stringify(originalSet, (key, value: Set<string>) => {
          return value instanceof Set ? Array.from(value) : value;
        });
        const parsedObj: SetToKeyMap = JSON.parse(jsonStr, (key, value: string[]) => {
          if (key === "") {
            return {
              exists: (value as string[]).reduce((map, item) => {
                map[item] = true;
                return map;
              }, {} as Record<string, boolean>)
            };
          }
          return value;
        });
        expect(parsedObj.exists.apple).assertEqual(true);
        expect(parsedObj.exists.banana).assertEqual(true);
        expect(parsedObj.exists.orange).assertEqual(undefined);
      }
    });
    /**
     * @tc.name   Json5Test002
     * @tc.number SUB_BUILTINS_Json5_TEST_0200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: MultiLangArrObj = {
        labels: [
          { lang: "Greek", symbol: "Ω" },
          { lang: "Russian", symbol: "Ё" },
          { lang: "Arabic", symbol: "ض" }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: MultiLangArrObj = JSON.parse(jsonStr);

      expect(parsedObj.labels[0].symbol).assertEqual("Ω");
      expect(parsedObj.labels[1].symbol).assertEqual("Ё");
      expect(parsedObj.labels[2].symbol).assertEqual("ض");
    });

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
      const parsedArr: string[] = JSON.parse(jsonStr);
      expect(parsedArr[0]).assertEqual("$100");
      expect(parsedArr[1]).assertEqual("€50");
      expect(parsedArr[2]).assertEqual("¥1000");
    });

    /**
     * @tc.name   Json5Test004
     * @tc.number SUB_BUILTINS_Json5_TEST_0400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: Map<string, number>[] = [
        new Map([["a", 1], ["b", 2]]),
        new Map([["c", 3]])
      ];
      const jsonStr: string = JSON.stringify(originalArr, (key, value: Map<string, number>[]) =>
      value instanceof Map ? Array.from(value.entries()) : value
      );
      const parsedObj: MapEntriesArr = JSON.parse(jsonStr, (key, value: [string, number][][]) => {
        if (key === "") {
          return {
            entries: (value as [string, number][][]).flatMap(entries => entries)
          };
        }
        return value;
      });

      expect(JSON.stringify(parsedObj.entries)).assertEqual(JSON.stringify([["a", 1], ["b", 2], ["c", 3]]));
    });

    /**
     * @tc.name   Json5Test005
     * @tc.number SUB_BUILTINS_Json5_TEST_0500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test5_Obj2 = {
        users: [
          {
            id: 1,
            name: "Frank",
            age: 25,
            email: "f@x.com"
          },
          {
            id: 2,
            name: "Grace",
            age: 30,
            email: "g@x.com"
          }
        ]
      };
      const filteredObj: FilteredPropsArr = {
        users: originalObj.users.map(user => ({
          id: user.id,
          name: user.name
        } as FilteredUser))
      };
      const jsonStr: string = JSON.stringify(filteredObj);
      const parsedObj: FilteredPropsArr = JSON.parse(jsonStr);
      expect(parsedObj.users[1].name).assertEqual("Grace");
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
      const parsedObj: EmojiNestedObj = JSON.parse(jsonStr);

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
      const originalObj: Test7_Obj3 = {
        config: {
          theme: "light",
          nested: { enabled: true }
        }
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: DefaultValueDeepObj = JSON.parse(jsonStr, (key, value: string) => {
        if (key === "layout") {
          return value ?? "grid";
        }
        if (key === "timeout") {
          return value ?? 3000;
        }
        return value;
      });
      expect(parsedObj.config.layout).assertEqual(undefined);
      expect(parsedObj.config.nested.timeout).assertEqual(undefined);
    });

    /**
     * @tc.name   Json5Test008
     * @tc.number SUB_BUILTINS_Json5_TEST_0800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: AgeDiffCompare = {
        people: [{ name: "A", age: 25 }, { name: "B", age: 30 }],
        diffs: []
      };
      const json = JSON.stringify(obj);
      const parsed: AgeDiffCompare = JSON.parse(json, (k: string, v: AgeDiffCompare) => {
        if (k === "") {
          const d: number[] = [];
          if (v.people.length >= 2) {
            d.push(Math.abs(v.people[0].age - v.people[1].age));
          }
          return { people: v.people, diffs: d };
        }
        return v;
      });
      expect(parsed.diffs.length).assertEqual(1);
      expect(parsed.diffs[0]).assertEqual(5);
    });

    /**
     * @tc.name   Json5Test009
     * @tc.number SUB_BUILTINS_Json5_TEST_0900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: MathFormulaArrObj = {
        formulas: [
          { id: 1, expression: "a² + b² = c²" },
          { id: 2, expression: "E = mc²" }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: MathFormulaArrObj = JSON.parse(jsonStr);

      expect(parsedObj.formulas[0].expression).assertEqual("a² + b² = c²");
      expect(parsedObj.formulas[1].expression).assertEqual("E = mc²");
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
      const parsedObj: ZeroWidthCharObj = JSON.parse(jsonStr);

      expect(parsedObj.text.withJoiner).assertEqual("a\u200Db");
      expect(parsedObj.text.withSpace).assertEqual("x\u200By");
    });

    /**
     * @tc.name   Json5Test011
     * @tc.number SUB_BUILTINS_Json5_TEST_1100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: CaseConvertArr = {
        tags: ["js", "Json", "TypeScript"]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: CaseConvertArr = JSON.parse(jsonStr, (key, value: string[]) => {
        if (key === "tags") {
          return (value as string[]).map(tag => tag.toUpperCase());
        }
        return value;
      });

      expect(JSON.stringify(parsedObj.tags)).assertEqual(JSON.stringify(["JS", "JSON", "TYPESCRIPT"]));
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
          "max_size": "10MB",
          nested: { "enable_ssl": true, timeout_ms: 5000 }
        }
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: SpecialCharConfigObj = JSON.parse(jsonStr);

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
      const originalSet: Set<string> = new Set(["b", "a", "c"]);
      const jsonStr: string = JSON.stringify(originalSet, (key, value: Set<string>) =>
      value instanceof Set ? Array.from(value) : value
      );
      const parsedArr: string[] = JSON.parse(jsonStr);

      expect(JSON.stringify(parsedArr)).assertEqual(JSON.stringify(["b", "a", "c"]));
    });

    /**
     * @tc.name   Json5Test014
     * @tc.number SUB_BUILTINS_Json5_TEST_1400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: UnitValueObj = {
        measurements: [
          { name: "Height", value: "180cm" },
          { name: "Weight", value: "75kg" },
          { name: "Temperature", value: "36.5°C" }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: UnitValueObj = JSON.parse(jsonStr);

      expect(parsedObj.measurements[0].value).assertEqual("180cm");
      expect(parsedObj.measurements[2].value).assertEqual("36.5°C");
    });

    /**
     * @tc.name   Json5Test015
     * @tc.number SUB_BUILTINS_Json5_TEST_1500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: ElementFrequencyObj = {
        numbers: [1, 2, 2, 3, 3, 3, 1],
        frequency: {}
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: ElementFrequencyObj = JSON.parse(jsonStr, (key, value: ElementFrequencyObj) => {
        if (key === "") {
          const freq = (value.numbers as number[]).reduce((map, num) => {
            map[num] = (map[num] || 0) + 1;
            return map;
          }, {} as Record<number, number>);
          const newObj: ElementFrequencyObj = {
            numbers: value.numbers,
            frequency: freq
          };
          return newObj;
        }
        return value;
      });

      expect(parsedObj.frequency[1]).assertEqual(2);
      expect(parsedObj.frequency[3]).assertEqual(3);
    });

    /**
     * @tc.name   Json5Test016
     * @tc.number SUB_BUILTINS_Json5_TEST_1600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test16_Obj3 = {
        groups: [
          { values: [{ score: 80 }, { score: 90 }, { score: 100 }] },
          { values: [{ score: 60 }, { score: 70 }] }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: DeepAvgObj = JSON.parse(jsonStr, (key, value: Test16_Obj5[]) => {
        if (key === "values") {
          const scores = (value as Test16_Obj5[]).map(v => v.score);
          const avg = scores.reduce((a, b) => a + b, 0) / scores.length;
          return { values: value, avgScore: avg };
        }
        return value;
      });

      expect(parsedObj.groups[0].avgScore).assertEqual(undefined);
      expect(parsedObj.groups[1].avgScore).assertEqual(undefined);
    });

    /**
     * @tc.name   Json5Test017
     * @tc.number SUB_BUILTINS_Json5_TEST_1700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: EmojiArrObj = {
        reactions: [
          { emoji: "👍", count: 15 },
          { emoji: "❤️", count: 23 },
          { emoji: "👏", count: 8 }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: EmojiArrObj = JSON.parse(jsonStr);

      expect(parsedObj.reactions[0].emoji).assertEqual("👍");
      expect(parsedObj.reactions[1].count).assertEqual(23);
    });

    /**
     * @tc.name   Json5Test018
     * @tc.number SUB_BUILTINS_Json5_TEST_1800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SumCountCompare = { numbers: [1, 2, 3], sum: 0, count: 0 };
      const json = JSON.stringify(obj);
      const parsed: SumCountCompare = JSON.parse(json, (k: string, v: SumCountCompare) => {
        if (k === "") {
          let s = 0;
          v.numbers.forEach(n => s += n);
          return { numbers: v.numbers, sum: s, count: v.numbers.length };
        }
        return v;
      });
      expect(parsed.sum).assertEqual(6);
      expect(parsed.count).assertEqual(3);
    });

    /**
     * @tc.name   Json5Test019
     * @tc.number SUB_BUILTINS_Json5_TEST_1900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test19_Obj3 = {
        user: {
          id: 5,
          profile: { name: "Hank", age: 35, address: "Street 123" },
          metadata: { timestamp: 123456 }
        }
      };
      const allowedPaths = ["user", "id", "profile", "name"];
      const jsonStr: string = JSON.stringify(originalObj, allowedPaths);
      const parsedObj: FilteredDeepPropsObj = JSON.parse(jsonStr);

      expect(parsedObj.user.profile.age === undefined).assertEqual(true);
      expect(parsedObj.user.metadata === undefined).assertEqual(true);
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
      const parsedArr: string[] = JSON.parse(jsonStr);

      expect(parsedArr[0]).assertEqual("/home/user/docs/file name.txt");
      expect(parsedArr[2]).assertEqual("C:\\Program Files\\app.exe");
    });

    /**
     * @tc.name   Json5Test021
     * @tc.number SUB_BUILTINS_Json5_TEST_2100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sets: Set<string>[] = [
        new Set(["a", "b", "c"]),
        new Set(["b", "c", "d"]),
        new Set(["c", "d", "e"])
      ];
      const originalObj: Test21_Obj1 = { sets };
      const jsonStr: string = JSON.stringify(originalObj, (key, value: Set<string>) => {
        return value instanceof Set ? Array.from(value) : value;
      });

      interface ParsedSets {
        sets: string[][];
      }

      const parsedObj: SetUnionObj = JSON.parse(jsonStr, (key, value: ParsedSets) => {
        if (key === "") {
          const unionSet = new Set<string>();
          value.sets.forEach(arr => arr.forEach(item => unionSet.add(item)));
          return { union: Array.from(unionSet) };
        }
        return value;
      });

      expect(JSON.stringify(parsedObj.union.sort())).assertEqual(JSON.stringify(["a", "b", "c", "d", "e"].sort()));
    });

    /**
     * @tc.name   Json5Test022
     * @tc.number SUB_BUILTINS_Json5_TEST_2200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: MultiPunctuationObj = {
        texts: [
          { lang: "Chinese", content: "你好！这是中文标点。" },
          { lang: "Japanese", content: "こんにちは！日本語の句読点です。" },
          { lang: "French", content: "Bonjour ! Ponctuation française." }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: MultiPunctuationObj = JSON.parse(jsonStr);

      expect(parsedObj.texts[0].content).assertEqual("你好！这是中文标点。");
      expect(parsedObj.texts[1].content).assertEqual("こんにちは！日本語の句読点です。");
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
      const parsedArr: string[] = JSON.parse(jsonStr);

      expect(parsedArr[0]).assertEqual("?q=json&page=1&limit=10");
      expect(parsedArr[1]).assertEqual("?category=books&sort=price&order=asc");
    });

    /**
     * @tc.name   Json5Test024
     * @tc.number SUB_BUILTINS_Json5_TEST_2400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: ScientificNotationObj = {
        values: [
          { name: "Avogadro", number: 6.022e23 },
          { name: "Planck", number: 6.626e-34 }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: ScientificNotationObj = JSON.parse(jsonStr);

      expect(parsedObj.values[0].number).assertEqual(6.022e23);
      expect(parsedObj.values[1].number).assertEqual(6.626e-34);
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
      const parsedObj: ZeroWidthNonJoinerObj = JSON.parse(jsonStr);
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
      const parsedObj: ValueRangeCheckObj = JSON.parse(jsonStr, (key, value: number) => {
        if (key === "volume" || key === "brightness") {
          return Math.max(0, Math.min(100, value as number));
        }
        return value;
      });
      expect(parsedObj.settings.volume).assertEqual(100);
      expect(parsedObj.settings.brightness).assertEqual(0);
    });

    /**
     * @tc.name   Json5Test027
     * @tc.number SUB_BUILTINS_Json5_TEST_2700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: RegexPatternObj = {
        patterns: [
          { name: "Email", regex: "^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)+$" },
          {
            name: "URL",
            regex: "^https?:\\/\\/(www\\.)?[-a-zA-Z0-9@:%._\\+~#=]{1,256}\\.[a-zA-Z0-9()]{1,6}\\b([-a-zA-Z0-9()@:%_\\+.~#?&//=]*)$"
          }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: RegexPatternObj = JSON.parse(jsonStr);

      expect(parsedObj.patterns[0].regex).assertEqual("^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)+$");
    });

    /**
     * @tc.name   Json5Test028
     * @tc.number SUB_BUILTINS_Json5_TEST_2800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: AnimalEmojiObj = {
        zoo: [
          { animal: "Lion", emoji: "🦁" },
          { animal: "Elephant", emoji: "🐘" },
          { animal: "Penguin", emoji: "🐧" }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: AnimalEmojiObj = JSON.parse(jsonStr);

      expect(parsedObj.zoo[0].emoji).assertEqual("🦁");
      expect(parsedObj.zoo[2].animal).assertEqual("Penguin");
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
      const parsedArr: string[] = JSON.parse(jsonStr);

      expect(parsedArr[0]).assertEqual(".class-name > .child:nth-child(2)");
      expect(parsedArr[1]).assertEqual("#id-name[data-attr='value']");
    });

    /**
     * @tc.name   Json5Test030
     * @tc.number SUB_BUILTINS_Json5_TEST_3000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const setA: Set<string> = new Set(["a", "b", "c"]);
      const setB: Set<string> = new Set(["b", "c", "d"]);
      const originalObj: Test30_Obj1 = { a: setA, b: setB };
      const jsonStr: string = JSON.stringify(originalObj, (key, value: Set<string>) =>
      value instanceof Set ? Array.from(value) : value
      );
      const parsedObj: SetSymmetricDiffObj = JSON.parse(jsonStr, (key, value: Test30_Obj1) => {
        if (key === "") {
          const a = new Set(value.a as Set<string>);
          const b = new Set(value.b as Set<string>);
          const diffA = Array.from(a).filter(x => !b.has(x));
          const diffB = Array.from(b).filter(x => !a.has(x));
          return { symmetricDiff: [...diffA, ...diffB] };
        }
        return value;
      });
      expect(JSON.stringify(parsedObj.symmetricDiff)).assertEqual(JSON.stringify(["a", "d"]));
    });

    /**
     * @tc.name   Json5Test031
     * @tc.number SUB_BUILTINS_Json5_TEST_3100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: GreetingObj = {
        greetings: [
          { lang: "Spanish", text: "¡Hola Mundo!" },
          { lang: "German", text: "Hallo Welt!" },
          { lang: "Korean", text: "안녕하세요 세계!" }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: GreetingObj = JSON.parse(jsonStr);

      expect(parsedObj.greetings[0].text).assertEqual("¡Hola Mundo!");
      expect(parsedObj.greetings[2].text).assertEqual("안녕하세요 세계!");
    });

    /**
     * @tc.name   Json5Test032
     * @tc.number SUB_BUILTINS_Json5_TEST_3200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: SqlQueryObj = {
        queries: [
          { name: "Select", sql: "SELECT id, name FROM users WHERE age > 18;" },
          { name: "Insert", sql: "INSERT INTO logs (message) VALUES ('error');" }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: SqlQueryObj = JSON.parse(jsonStr);

      expect(parsedObj.queries[0].sql).assertEqual("SELECT id, name FROM users WHERE age > 18;");
      expect(parsedObj.queries[1].sql).assertEqual("INSERT INTO logs (message) VALUES ('error');");
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
      const parsedArr: string[] = JSON.parse(jsonStr);

      expect(parsedArr[0]).assertEqual("npm install --save-dev typescript");
      expect(parsedArr[1]).assertEqual("git commit -m 'fix: resolve issue'");
    });

    /**
     * @tc.name   Json5Test034
     * @tc.number SUB_BUILTINS_Json5_TEST_3400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: WeatherEmojiObj = {
        forecasts: [
          { day: "Monday", emoji: "☀️" },
          { day: "Tuesday", emoji: "🌧️" },
          { day: "Wednesday", emoji: "❄️" }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: WeatherEmojiObj = JSON.parse(jsonStr);

      expect(parsedObj.forecasts[0].emoji).assertEqual("☀️");
      expect(parsedObj.forecasts[2].day).assertEqual("Wednesday");
    });

    /**
     * @tc.name   Json5Test035
     * @tc.number SUB_BUILTINS_Json5_TEST_3500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: MultiLangNumberObj = {
        numbers: [
          { lang: "Arabic", symbol: "١٢٣" },
          { lang: "Hindi", symbol: "१२३" },
          { lang: "Chinese", symbol: "一二三" }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: MultiLangNumberObj = JSON.parse(jsonStr);

      expect(parsedObj.numbers[0].symbol).assertEqual("١٢٣");
      expect(parsedObj.numbers[2].symbol).assertEqual("一二三");
    });

    /**
     * @tc.name   Json5Test036
     * @tc.number SUB_BUILTINS_Json5_TEST_3600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: XmlTagObj = {
        elements: [
          { name: "Root", xml: "<root xmlns='http://example.com'><child>Text</child></root>" },
          { name: "Data", xml: "<data id='123' active='true'/>" }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: XmlTagObj = JSON.parse(jsonStr);

      expect(parsedObj.elements[0].xml).assertEqual("<root xmlns='http://example.com'><child>Text</child></root>");
      expect(parsedObj.elements[1].xml).assertEqual("<data id='123' active='true'/>");
    });

    /**
     * @tc.name   Json5Test037
     * @tc.number SUB_BUILTINS_Json5_TEST_3700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: YamlContentObj = {
        configs: [
          { name: "App", yaml: "app:\n  name: myapp\n  version: 1.0.0\n  enabled: true" },
          { name: "DB", yaml: "database:\n  host: localhost\n  port: 5432" }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: YamlContentObj = JSON.parse(jsonStr);

      expect(parsedObj.configs[0].yaml).assertEqual("app:\n  name: myapp\n  version: 1.0.0\n  enabled: true");
      expect(parsedObj.configs[1].yaml).assertEqual("database:\n  host: localhost\n  port: 5432");
    });

    /**
     * @tc.name   Json5Test038
     * @tc.number SUB_BUILTINS_Json5_TEST_3800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: GraphqlQueryObj = {
        queries: [
          { name: "Users", query: "query Users($limit: Int) { users(limit: $limit) { id name email } }" },
          { name: "Post", query: "mutation CreatePost($title: String!) { createPost(title: $title) { id } }" }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: GraphqlQueryObj = JSON.parse(jsonStr);

      expect(parsedObj.queries[0].query)
        .assertEqual("query Users($limit: Int) { users(limit: $limit) { id name email } }");
      expect(parsedObj.queries[1].query)
        .assertEqual("mutation CreatePost($title: String!) { createPost(title: $title) { id } }");
    });

    /**
     * @tc.name   Json5Test039
     * @tc.number SUB_BUILTINS_Json5_TEST_3900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: TransportEmojiObj = {
        vehicles: [
          { name: "Car", emoji: "🚗" },
          { name: "Train", emoji: "🚂" },
          { name: "Plane", emoji: "✈️" }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: TransportEmojiObj1 =
        JSON.parse(jsonStr, (key: string, value: string | object | string[] | number) => {
          return value;
        });
      expect(parsedObj.vehicles[0].emoji).assertEqual("🚗");
      expect(parsedObj.vehicles[2].name).assertEqual("Plane");
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
      const parsedArr: string[] = JSON.parse(jsonStr, (key: string, value: string | string[]) => {
        return value;
      });

      expect(parsedArr[0]).assertEqual("$.store.book[0].title");
      expect(parsedArr[2]).assertEqual("$.store..price");
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
      const parsedObj: MultiLangPunctObj = JSON.parse(jsonStr, (key: string, value: Test41_Obj1) => {
        return value;
      });

      expect(parsedObj.messages.fr).assertEqual("Bonjour ! Comment allez-vous ?");
      expect(parsedObj.messages.zh).assertEqual("你好！你怎么样？");
    });

    /**
     * @tc.name   Json5Test042
     * @tc.number SUB_BUILTINS_Json5_TEST_4200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: DockerCommandObj = {
        commands: [
          { name: "Build", cmd: "docker build -t myapp:1.0 -f Dockerfile ." },
          { name: "Run", cmd: "docker run -d -p 80:80 --name app myapp:1.0" }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: DockerCommandObj = JSON.parse(jsonStr, (key: string, value: string | Test42_Obj1[]) => {
        return value;
      });

      expect(parsedObj.commands[0].cmd).assertEqual("docker build -t myapp:1.0 -f Dockerfile .");
      expect(parsedObj.commands[1].cmd).assertEqual("docker run -d -p 80:80 --name app myapp:1.0");
    });

    /**
     * @tc.name   Json5Test043
     * @tc.number SUB_BUILTINS_Json5_TEST_4300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: JavaAnnotationObj = {
        annotations: [
          { name: "Controller", code: "@RestController\n@RequestMapping(\"/api/users\")" },
          { name: "Service", code: "@Service\npublic class UserService {}" }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: JavaAnnotationObj = JSON.parse(jsonStr, (key: string, value: string | Test43_Obj1[]) => {
        return value;
      });

      expect(parsedObj.annotations[0].code).assertEqual("@RestController\n@RequestMapping(\"/api/users\")");
      expect(parsedObj.annotations[1].code).assertEqual("@Service\npublic class UserService {}");
    });

    /**
     * @tc.name   Json5Test044
     * @tc.number SUB_BUILTINS_Json5_TEST_4400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test44_Obj2 = {
        datasets: [
          { values: [5, 2, 8, 1] },
          { values: [10, 3, 7] }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: DeepMaxObj = JSON.parse(jsonStr, (key: string, value: number[]) => {
        if (key === "values" && Array.isArray(value) && value.every(v => typeof v === "number")) {
          const max = Math.max(...value);
          return { values: value, maxValue: max };
        }
        return value;
      });

      expect(parsedObj.datasets[0].maxValue).assertEqual(undefined);
      expect(parsedObj.datasets[1].maxValue).assertEqual(undefined);
    });

    /**
     * @tc.name   Json5Test045
     * @tc.number SUB_BUILTINS_Json5_TEST_4500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: TransportEmojiObj1 = {
        vehicles: [
          { name: "Car", emoji: "🚗" },
          { name: "Train", emoji: "🚂" },
          { name: "Plane", emoji: "✈️" }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: TransportEmojiObj1 =
        JSON.parse(jsonStr, (key: string, value: string | object | string[] | number) => {
          return value;
        });

      expect(parsedObj.vehicles[0].emoji).assertEqual("🚗");
      expect(parsedObj.vehicles[2].name).assertEqual("Plane");
    });

    /**
     * @tc.name   Json5Test046
     * @tc.number SUB_BUILTINS_Json5_TEST_4600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test45_Obj3 = {
        ingredients: [
          { name: "Sugar", ounces: 8 },
          { name: "Flour", ounces: 16 }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj: OunceToGramObj = JSON.parse(jsonStr, (key: string, value: Test45_Obj3) => {
        if (key === "" && typeof value === "object" && value !== null && value.ingredients) {
          return {
            ingredients: value.ingredients.map((ing: Test45_Obj2) => {
              return {
                name: ing.name,
                ounces: ing.ounces,
                grams: Math.round(ing.ounces * 28.35)
              } as Test45_Obj4;
            })
          };
        }
        return value;
      })
      expect(parsedObj.ingredients[0].grams).assertEqual(227);
      expect(parsedObj.ingredients[1].grams).assertEqual(454);
    });

    /**
     * @tc.name   Json5Test047
     * @tc.number SUB_BUILTINS_Json5_TEST_4700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: PositiveSumObj = { numbers: [1, -2, 3], sum: 0 };
      const json = JSON.stringify(obj);
      const parsed: PositiveSumObj = JSON.parse(json, (k: string, v: PositiveSumObj) => {
        if (k === "") {
          let s = 0;
          v.numbers.forEach((n: number) => {
            if (n >= 0) {
              s += n;
            }
          });
          return { numbers: v.numbers, sum: s };
        }
        return v;
      });
      expect(parsed.sum).assertEqual(4);
    });

    /**
     * @tc.name   Json5Test048
     * @tc.number SUB_BUILTINS_Json5_TEST_4800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: UpperCaseArr = { words: ["a", "b"], upper: [] };
      const json = JSON.stringify(obj);
      const parsed: UpperCaseArr = JSON.parse(json, (k: string, v: UpperCaseArr) => {
        if (k === "") {
          const u: string[] = [];
          v.words.forEach((w: string) => u.push(w.toUpperCase()));
          return { words: v.words, upper: u };
        }
        return v;
      });
      expect(JSON.stringify(parsed.upper)).assertEqual(JSON.stringify(["A", "B"]));
    });

    /**
     * @tc.name   Json5Test049
     * @tc.number SUB_BUILTINS_Json5_TEST_4900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: EvenNumbers = { data: [1, 2, 3], evens: [] };
      const json = JSON.stringify(obj);
      const parsed: EvenNumbers = JSON.parse(json, (k: string, v: EvenNumbers) => {
        if (k === "") {
          const e: number[] = [];
          v.data.forEach((n: number) => {
            if (n % 2 === 0) {
              e.push(n);
            }
          });
          return { data: v.data, evens: e };
        }
        return v;
      });
      expect(JSON.stringify(parsed.evens)).assertEqual(JSON.stringify([2]));
    });

    /**
     * @tc.name   Json5Test050
     * @tc.number SUB_BUILTINS_Json5_TEST_5000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: AverageObj = { values: [2, 4, 6], avg: 0 };
      const json = JSON.stringify(obj);
      const parsed: AverageObj = JSON.parse(json, (k: string, v: AverageObj) => {
        if (k === "") {
          let s = 0;
          v.values.forEach((n: number) => s += n);
          return { values: v.values, avg: s / v.values.length };
        }
        return v;
      });
      expect(parsed.avg).assertEqual(4);
    });

    /**
     * @tc.name   Json5Test051
     * @tc.number SUB_BUILTINS_Json5_TEST_5100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: StringLengths = { texts: ["a", "bb"], lengths: [] };
      const json = JSON.stringify(obj);
      const parsed: StringLengths = JSON.parse(json, (k: string, v: StringLengths) => {
        if (k === "") {
          const l: number[] = [];
          v.texts.forEach((t: string) => l.push(t.length));
          return { texts: v.texts, lengths: l };
        }
        return v;
      });
      expect(JSON.stringify(parsed.lengths)).assertEqual(JSON.stringify([1, 2]));
    });

    /**
     * @tc.name   Json5Test052
     * @tc.number SUB_BUILTINS_Json5_TEST_5200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: HourExtract = { times: ["12:30", "15:45"], hours: [] };
      const json = JSON.stringify(obj);
      const parsed: HourExtract = JSON.parse(json, (k: string, v: HourExtract) => {
        if (k === "") {
          const h: number[] = [];
          v.times.forEach((t: string) => h.push(parseInt(t.split(":")[0])));
          return { times: v.times, hours: h };
        }
        return v;
      });
      expect(JSON.stringify(parsed.hours)).assertEqual(JSON.stringify([12, 15]));
    });

    /**
     * @tc.name   Json5Test053
     * @tc.number SUB_BUILTINS_Json5_TEST_5300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: LongStrings = { strings: ["a", "abc"], long: [] };
      const json = JSON.stringify(obj);
      const parsed: LongStrings = JSON.parse(json, (k: string, v: LongStrings) => {
        if (k === "") {
          const l: string[] = [];
          v.strings.forEach((s: string) => {
            if (s.length > 2) {
              l.push(s);
            }
          });
          return { strings: v.strings, long: l };
        }
        return v;
      });
      expect(JSON.stringify(parsed.long)).assertEqual(JSON.stringify(["abc"]));
    });

    /**
     * @tc.name   Json5Test054
     * @tc.number SUB_BUILTINS_Json5_TEST_5400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: RoundedNumbers = { nums: [1.2, 2.8], rounded: [] };
      const json = JSON.stringify(obj);
      const parsed: RoundedNumbers = JSON.parse(json, (k: string, v: RoundedNumbers) => {
        if (k === "") {
          const r: number[] = [];
          v.nums.forEach((n: number) => r.push(Math.round(n)));
          return { nums: v.nums, rounded: r };
        }
        return v;
      });
      expect(JSON.stringify(parsed.rounded)).assertEqual(JSON.stringify([1, 3]));
    });

    /**
     * @tc.name   Json5Test055
     * @tc.number SUB_BUILTINS_Json5_TEST_5500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: PositiveCount = { numbers: [-1, 2, 3], count: 0 };
      const json = JSON.stringify(obj);
      const parsed: PositiveCount = JSON.parse(json, (k: string, v: PositiveCount) => {
        if (k === "") {
          let c = 0;
          v.numbers.forEach((n: number) => {
            if (n > 0) {
              c++;
            }
          });
          return { numbers: v.numbers, count: c };
        }
        return v;
      });
      expect(parsed.count).assertEqual(2);
    });

    /**
     * @tc.name   Json5Test056
     * @tc.number SUB_BUILTINS_Json5_TEST_5600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {

      const obj: FirstLetters = { words: ["apple", "banana"], letters: [] };
      const json = JSON.stringify(obj);
      const parsed: FirstLetters = JSON.parse(json, (k: string, v: FirstLetters) => {
        if (k === "") {
          const l: string[] = [];
          v.words.forEach((w: string) => l.push(w[0]));
          return { words: v.words, letters: l };
        }
        return v;
      });
      expect(JSON.stringify(parsed.letters)).assertEqual(JSON.stringify(["a", "b"]));
    });

    /**
     * @tc.name   Json5Test057
     * @tc.number SUB_BUILTINS_Json5_TEST_5700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ReversedArr = { data: ["a", "b"], reversed: [] };
      const json = JSON.stringify(obj);
      const parsed: ReversedArr = JSON.parse(json, (k: string, v: ReversedArr) => {
        if (k === "") {
          const r: string[] = [];
          for (let i = v.data.length - 1; i >= 0; i--) {
            r.push(v.data[i]);
          }
          return { data: v.data, reversed: r };
        }
        return v;
      });
      expect(JSON.stringify(parsed.reversed)).assertEqual(JSON.stringify(["b", "a"]));
    });

    /**
     * @tc.name   Json5Test058
     * @tc.number SUB_BUILTINS_Json5_TEST_5800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SquaredNumbers = { numbers: [2, 3], squares: [] };
      const json = JSON.stringify(obj);
      const parsed: SquaredNumbers = JSON.parse(json, (k: string, v: SquaredNumbers) => {
        if (k === "") {
          const s: number[] = [];
          v.numbers.forEach((n: number) => s.push(n * n));
          return { numbers: v.numbers, squares: s };
        }
        return v;
      });
      expect(JSON.stringify(parsed.squares)).assertEqual(JSON.stringify([4, 9]));
    });

    /**
     * @tc.name   Json5Test059
     * @tc.number SUB_BUILTINS_Json5_TEST_5900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SubstringFilter = { strings: ["abc", "def"], filtered: [] };
      const json = JSON.stringify(obj);
      const parsed: SubstringFilter = JSON.parse(json, (k: string, v: SubstringFilter) => {
        if (k === "") {
          const f: string[] = [];
          v.strings.forEach((s: string) => {
            if (s.includes("b")) {
              f.push(s);
            }
          });
          return { strings: v.strings, filtered: f };
        }
        return v;
      });
      expect(JSON.stringify(parsed.filtered)).assertEqual(JSON.stringify(["abc"]));
    });

    /**
     * @tc.name   Json5Test060
     * @tc.number SUB_BUILTINS_Json5_TEST_6000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: YearExtract = { dates: ["2020-01-01", "2021-02-02"], years: [] };
      const json = JSON.stringify(obj);
      const parsed: YearExtract = JSON.parse(json, (k: string, v: YearExtract) => {
        if (k === "") {
          const y: number[] = [];
          v.dates.forEach((d: string) => y.push(parseInt(d.split("-")[0])));
          return { dates: v.dates, years: y };
        }
        return v;
      });
      expect(JSON.stringify(parsed.years)).assertEqual(JSON.stringify([2020, 2021]));
    });
    /**
     * @tc.name   Json5Test061
     * @tc.number SUB_BUILTINS_Json5_TEST_6100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SumSkipZero = { values: [1, 0, 2], sum: 0 };
      const json = JSON.stringify(obj);
      const parsed: SumSkipZero = JSON.parse(json, (k: string, v: SumSkipZero) => {
        if (k === "") {
          let s = 0;
          v.values.forEach((n: number) => {
            if (n !== 0) {
              s += n;
            }
          });
          return { values: v.values, sum: s };
        }
        return v;
      });
      expect(parsed.sum).assertEqual(3);
    });

    /**
     * @tc.name   Json5Test062
     * @tc.number SUB_BUILTINS_Json5_TEST_6200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: StringConcat = { parts: ["a", "b"], combined: "" };
      const json = JSON.stringify(obj);
      const parsed: StringConcat = JSON.parse(json, (k: string, v: StringConcat) => {
        if (k === "") {
          let c = "";
          v.parts.forEach((p: string) => c += p);
          return { parts: v.parts, combined: c };
        }
        return v;
      });
      expect(parsed.combined).assertEqual("ab");
    });

    /**
     * @tc.name   Json5Test063
     * @tc.number SUB_BUILTINS_Json5_TEST_6300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ThresholdFilter = { numbers: [5, 10, 15], above: [] };
      const json = JSON.stringify(obj);
      const parsed: ThresholdFilter = JSON.parse(json, (k: string, v: ThresholdFilter) => {
        if (k === "") {
          const a: number[] = [];
          v.numbers.forEach((n: number) => {
            if (n > 10) {
              a.push(n);
            }
          });
          return { numbers: v.numbers, above: a };
        }
        return v;
      });
      expect(JSON.stringify(parsed.above)).assertEqual(JSON.stringify([15]));
    });

    /**
     * @tc.name   Json5Test064
     * @tc.number SUB_BUILTINS_Json5_TEST_6400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: LowerCaseArr = { words: ["A", "B"], lower: [] };
      const json = JSON.stringify(obj);
      const parsed: LowerCaseArr = JSON.parse(json, (k: string, v: LowerCaseArr) => {
        if (k === "") {
          const l: string[] = [];
          v.words.forEach((w: string) => l.push(w.toLowerCase()));
          return { words: v.words, lower: l };
        }
        return v;
      });
      expect(JSON.stringify(parsed.lower)).assertEqual(JSON.stringify(["a", "b"]));
    });

    /**
     * @tc.name   Json5Test065
     * @tc.number SUB_BUILTINS_Json5_TEST_6500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ProductObj = { factors: [2, 3], product: 1 };
      const json = JSON.stringify(obj);
      const parsed: ProductObj = JSON.parse(json, (k: string, v: ProductObj) => {
        if (k === "") {
          let p = 1;
          v.factors.forEach((n: number) => p *= n);
          return { factors: v.factors, product: p };
        }
        return v;
      });
      expect(parsed.product).assertEqual(6);
    });

    /**
     * @tc.name   Json5Test066
     * @tc.number SUB_BUILTINS_Json5_TEST_6600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: LastElement = { items: ["a", "b"], last: "" };
      const json = JSON.stringify(obj);
      const parsed: LastElement = JSON.parse(json, (k: string, v: LastElement) => {
        if (k === "") {
          const l = v.items.length > 0 ? v.items[v.items.length - 1] : "";
          return { items: v.items, last: l };
        }
        return v;
      });
      expect(parsed.last).assertEqual("b");
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
      const parsed: CharCount = JSON.parse(json, (k: string, v: CharCount) => {
        if (k === "") {
          let c = 0;
          for (let i = 0; i < v.text.length; i++) {
            if (v.text[i] === "a") {
              c++;
            }
          }
          return { text: v.text, count: c };
        }
        return v;
      });
      expect(parsed.count).assertEqual(2);
    });

    /**
     * @tc.name   Json5Test068
     * @tc.number SUB_BUILTINS_Json5_TEST_6800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: BinaryNumbers = { numbers: [2, 3], binary: [] };
      const json = JSON.stringify(obj);
      const parsed: BinaryNumbers = JSON.parse(json, (k: string, v: BinaryNumbers) => {
        if (k === "") {
          const b: string[] = [];
          v.numbers.forEach((n: number) => b.push(n.toString(2)));
          return { numbers: v.numbers, binary: b };
        }
        return v;
      });
      expect(JSON.stringify(parsed.binary)).assertEqual(JSON.stringify(["10", "11"]));
    });

    /**
     * @tc.name   Json5Test069
     * @tc.number SUB_BUILTINS_Json5_TEST_6900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FilterObjects = { items: [{ id: 1 }, { id: 2 }], filtered: [] };
      const json = JSON.stringify(obj);
      const parsed: FilterObjects = JSON.parse(json, (k: string, v: FilterObjects) => {
        if (k === "") {
          const f: Test69_Obj2[] = [];
          v.items.forEach((i: Test69_Obj2) => {
            if (i.id > 1) {
              f.push(i);
            }
          });
          return { items: v.items, filtered: f };
        }
        return v;
      });
      expect(JSON.stringify(parsed.filtered)).assertEqual(JSON.stringify([{ id: 2 }]));
    });

    /**
     * @tc.name   Json5Test070
     * @tc.number SUB_BUILTINS_Json5_TEST_7000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ArrayLength = { data: [1, 2, 3], length: 0 };
      const json = JSON.stringify(obj);
      const parsed: ArrayLength = JSON.parse(json, (k: string, v: ArrayLength) => {
        if (k === "") {
          return { data: v.data, length: v.data.length };
        }
        return v;
      });
      expect(parsed.length).assertEqual(3);
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
      const parsed: StringReplace = JSON.parse(json, (k: string, v: StringReplace) => {
        if (k === "") {
          const r = v.text.replace("a", "x");
          return { text: v.text, replaced: r };
        }
        return v;
      });
      expect(parsed.replaced).assertEqual("xbc");
    });

    /**
     * @tc.name   Json5Test072
     * @tc.number SUB_BUILTINS_Json5_TEST_7200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: RangeCheck = { numbers: [5, 15, 25], inRange: [] };
      const json = JSON.stringify(obj);
      const parsed: RangeCheck = JSON.parse(json, (k: string, v: RangeCheck) => {
        if (k === "") {
          const i: number[] = [];
          v.numbers.forEach((n: number) => {
            if (n >= 10 && n <= 20) {
              i.push(n);
            }
          });
          return { numbers: v.numbers, inRange: i };
        }
        return v;
      });
      expect(JSON.stringify(parsed.inRange)).assertEqual(JSON.stringify([15]));
    });

    /**
     * @tc.name   Json5Test073
     * @tc.number SUB_BUILTINS_Json5_TEST_7300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ExtractProps = { items: [{ name: "a" }, { name: "b" }], names: [] };
      const json = JSON.stringify(obj);
      const parsed: ExtractProps = JSON.parse(json, (k: string, v: ExtractProps) => {
        if (k === "") {
          const n: string[] = [];
          v.items.forEach((i: Test73_Obj2) => n.push(i.name));
          return { items: v.items, names: n };
        }
        return v;
      });
      expect(JSON.stringify(parsed.names)).assertEqual(JSON.stringify(["a", "b"]));
    });

    /**
     * @tc.name   Json5Test074
     * @tc.number SUB_BUILTINS_Json5_TEST_7400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: TrimStrings = { texts: [" a ", "b "], trimmed: [] };
      const json = JSON.stringify(obj);
      const parsed: TrimStrings = JSON.parse(json, (k: string, v: TrimStrings) => {
        if (k === "") {
          const t: string[] = [];
          v.texts.forEach((s: string) => t.push(s.trim()));
          return { texts: v.texts, trimmed: t };
        }
        return v;
      });
      expect(JSON.stringify(parsed.trimmed)).assertEqual(JSON.stringify(["a", "b"]));
    });

    /**
     * @tc.name   Json5Test075
     * @tc.number SUB_BUILTINS_Json5_TEST_7500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: MaxValue = { numbers: [3, 1, 4], max: 0 };
      const json = JSON.stringify(obj);
      const parsed: MaxValue = JSON.parse(json, (k: string, v: MaxValue) => {
        if (k === "") {
          let m = v.numbers[0];
          v.numbers.forEach((n: number) => {
            if (n > m) {
              m = n;
            }
          });
          return { numbers: v.numbers, max: m };
        }
        return v;
      });
      expect(parsed.max).assertEqual(4);
    });

    /**
     * @tc.name   Json5Test076
     * @tc.number SUB_BUILTINS_Json5_TEST_7600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: UniqueElements = { data: [1, 2, 2], unique: [] };
      const json = JSON.stringify(obj);
      const parsed: UniqueElements = JSON.parse(json, (k: string, v: UniqueElements) => {
        if (k === "") {
          const u: number[] = [];
          v.data.forEach((n: number) => {
            if (!u.includes(n)) {
              u.push(n);
            }
          });
          return { data: v.data, unique: u };
        }
        return v;
      });
      expect(JSON.stringify(parsed.unique)).assertEqual("[1,2]");
    });

    /**
     * @tc.name   Json5Test077
     * @tc.number SUB_BUILTINS_Json5_TEST_7700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: NumToStringArr = { numbers: [10, 20], strings: [] };
      const json = JSON.stringify(obj);
      const parsed: NumToStringArr = JSON.parse(json, (k: string, v: NumToStringArr | number[] | string[]) => {
        if (k === "") {
          const s: string[] = [];
          ((v as NumToStringArr).numbers as number[]).forEach(n => s.push(n.toString()));
          return { numbers: (v as NumToStringArr).numbers, strings: s };
        }
        return v;
      });
      expect(JSON.stringify(parsed.strings)).assertEqual('["10","20"]');
    });

    /**
     * @tc.name   Json5Test078
     * @tc.number SUB_BUILTINS_Json5_TEST_7800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FilterActiveUsers = {
        users: [{ id: 1, active: true }, { id: 2, active: false }],
        active: []
      };
      const json = JSON.stringify(obj);
      const parsed: FilterActiveUsers = JSON.parse(json, (k: string, v: FilterActiveUsers) => {
        if (k === "") {
          const a: Test78_Obj1[] = [];
          v.users.forEach(u => {
            if (u.active) {
              a.push(u);
            }
          });
          return { users: v.users, active: a };
        }
        return v;
      });
      expect(JSON.stringify(parsed.active)).assertEqual("[{\"id\":1,\"active\":true}]");
    });

    /**
     * @tc.name   Json5Test079
     * @tc.number SUB_BUILTINS_Json5_TEST_7900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: TotalStringLength = { words: ["a", "bc"], total: 0 };
      const json = JSON.stringify(obj);
      const parsed: TotalStringLength = JSON.parse(json, (k: string, v: TotalStringLength) => {
        if (k === "") {
          let t = 0;
          v.words.forEach(w => t += w.length);
          return { words: v.words, total: t };
        }
        return v;
      });
      expect(parsed.total).assertEqual(3);
    });

    /**
     * @tc.name   Json5Test080
     * @tc.number SUB_BUILTINS_Json5_TEST_8000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ToPercentage = { values: [0.1, 0.5], percentages: [] };
      const json = JSON.stringify(obj);
      const parsed: ToPercentage = JSON.parse(json, (k: string, v: ToPercentage) => {
        if (k === "") {
          const p: string[] = [];
          v.values.forEach(n => p.push((n * 100) + "%"));
          return { values: v.values, percentages: p };
        }
        return v;
      });
      expect(JSON.stringify(parsed.percentages)).assertEqual('["10%","50%"]');
    });

    /**
     * @tc.name   Json5Test081
     * @tc.number SUB_BUILTINS_Json5_TEST_8100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: EvenLengthStrings = { strings: ["a", "bb", "ccc"], even: [] };
      const json = JSON.stringify(obj);
      const parsed: EvenLengthStrings = JSON.parse(json, (k: string, v: EvenLengthStrings) => {
        if (k === "") {
          const e: string[] = [];
          v.strings.forEach(s => {
            if (s.length % 2 === 0) {
              e.push(s);
            }
          });
          return { strings: v.strings, even: e };
        }
        return v;
      });
      expect(JSON.stringify(parsed.even)).assertEqual('["bb"]');
    });

    /**
     * @tc.name   Json5Test082
     * @tc.number SUB_BUILTINS_Json5_TEST_8200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ExtractMonths = { dates: ["2024-03-01", "2024-09-15"], months: [] };
      const json = JSON.stringify(obj);
      const parsed: ExtractMonths = JSON.parse(json, (k: string, v: ExtractMonths) => {
        if (k === "") {
          const m: string[] = [];
          v.dates.forEach(d => m.push(d.split("-")[1]));
          return { dates: v.dates, months: m };
        }
        return v;
      });
      expect(JSON.stringify(parsed.months)).assertEqual('["03","09"]');
    });

    /**
     * @tc.name   Json5Test083
     * @tc.number SUB_BUILTINS_Json5_TEST_8300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CubedNumbers = { numbers: [2, 3], cubes: [] };
      const json = JSON.stringify(obj);
      const parsed: CubedNumbers = JSON.parse(json, (k: string, v: CubedNumbers) => {
        if (k === "") {
          const c: number[] = [];
          v.numbers.forEach(n => c.push(n * n * n));
          return { numbers: v.numbers, cubes: c };
        }
        return v;
      });
      expect(JSON.stringify(parsed.cubes)).assertEqual("[8,27]");
    });

    /**
     * @tc.name   Json5Test084
     * @tc.number SUB_BUILTINS_Json5_TEST_8400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CapitalizedWords = { words: ["apple", "banana"], capitalized: [] };
      const json = JSON.stringify(obj);
      const parsed: CapitalizedWords = JSON.parse(json, (k: string, v: CapitalizedWords) => {
        if (k === "") {
          const c: string[] = [];
          v.words.forEach(w => {
            c.push(w.charAt(0).toUpperCase() + w.slice(1));
          });
          return { words: v.words, capitalized: c };
        }
        return v;
      });
      expect(JSON.stringify(parsed.capitalized)).assertEqual('["Apple","Banana"]');
    });

    /**
     * @tc.name   Json5Test085
     * @tc.number SUB_BUILTINS_Json5_TEST_8500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: RoundedAverage = { values: [1, 2, 3, 4], avg: 0 };
      const json = JSON.stringify(obj);
      const parsed: RoundedAverage = JSON.parse(json, (k: string, v: RoundedAverage) => {
        if (k === "") {
          let s = 0;
          v.values.forEach(n => s += n);
          const a = s / v.values.length;
          return { values: v.values, avg: Math.round(a * 10) / 10 };
        }
        return v;
      });
      expect(parsed.avg).assertEqual(2.5);
    });

    /**
     * @tc.name   Json5Test086
     * @tc.number SUB_BUILTINS_Json5_TEST_8600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: NegativeCount = { numbers: [-1, 2, -3], count: 0 };
      const json = JSON.stringify(obj);
      const parsed: NegativeCount = JSON.parse(json, (k: string, v: NegativeCount) => {
        if (k === "") {
          let c = 0;
          v.numbers.forEach(n => {
            if (n < 0) {
              c++;
            }
          });
          return { numbers: v.numbers, count: c };
        }
        return v;
      });
      expect(parsed.count).assertEqual(2);
    });

    /**
     * @tc.name   Json5Test087
     * @tc.number SUB_BUILTINS_Json5_TEST_8700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: JoinedWithSeparator = { words: ["a", "b", "c"], joined: "" };
      const json = JSON.stringify(obj);
      const parsed: JoinedWithSeparator = JSON.parse(json, (k: string, v: JoinedWithSeparator) => {
        if (k === "") {
          let j = "";
          for (let i = 0; i < v.words.length; i++) {
            j += v.words[i];
            if (i < v.words.length - 1) {
              j += "-";
            }
          }
          return { words: v.words, joined: j };
        }
        return v;
      });
      expect(parsed.joined).assertEqual("a-b-c");
    });

    /**
     * @tc.name   Json5Test088
     * @tc.number SUB_BUILTINS_Json5_TEST_8800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SumOfSquares = { numbers: [1, 2, 3], sum: 0 };
      const json = JSON.stringify(obj);
      const parsed: SumOfSquares = JSON.parse(json, (k: string, v: SumOfSquares) => {
        if (k === "") {
          let s = 0;
          v.numbers.forEach(n => s += n * n);
          return { numbers: v.numbers, sum: s };
        }
        return v;
      });
      expect(parsed.sum).assertEqual(14);
    });

    /**
     * @tc.name   Json5Test089
     * @tc.number SUB_BUILTINS_Json5_TEST_8900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SumByProperty = {
        orders: [{ id: 1, amount: 10 }, { id: 2, amount: 20 }],
        total: 0
      };
      const json = JSON.stringify(obj);
      const parsed: SumByProperty = JSON.parse(json, (k: string, v: SumByProperty) => {
        if (k === "") {
          let t = 0;
          v.orders.forEach(o => t += o.amount);
          return { orders: v.orders, total: t };
        }
        return v;
      });
      expect(parsed.total).assertEqual(30);
    });

    /**
     * @tc.name   Json5Test090
     * @tc.number SUB_BUILTINS_Json5_TEST_9000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ConditionalSum = {
        transactions: [{ type: "income", amount: 100 }, { type: "expense", amount: 50 }],
        income: 0
      };
      const json = JSON.stringify(obj);
      const parsed: ConditionalSum = JSON.parse(json, (k: string, v: ConditionalSum) => {
        if (k === "") {
          let i = 0;
          v.transactions.forEach(t => {
            if (t.type === "income") {
              i += t.amount;
            }
          });
          return { transactions: v.transactions, income: i };
        }
        return v;
      });
      expect(parsed.income).assertEqual(100);
    });
    /**
     * @tc.name   Json5Test091
     * @tc.number SUB_BUILTINS_Json5_TEST_9100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: MinValue = { numbers: [3, 1, 4], min: 0 };
      const json = JSON.stringify(obj);
      const parsed: MinValue = JSON.parse(json, (k: string, v: MinValue) => {
        if (k === "") {
          let m = v.numbers[0];
          v.numbers.forEach(n => {
            if (n < m) {
              m = n;
            }
          });
          return { numbers: v.numbers, min: m };
        }
        return v;
      });
      expect(parsed.min).assertEqual(1);
    });

    /**
     * @tc.name   Json5Test092
     * @tc.number SUB_BUILTINS_Json5_TEST_9200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: LowercaseCompare = { words: ["Apple", "BANANA"], lowercase: [] };
      const json = JSON.stringify(obj);
      const parsed: LowercaseCompare = JSON.parse(json, (k: string, v: LowercaseCompare) => {
        if (k === "") {
          const l: string[] = [];
          v.words.forEach(w => l.push(w.toLowerCase()));
          return { words: v.words, lowercase: l };
        }
        return v;
      });
      expect(JSON.stringify(parsed.lowercase)).assertEqual(JSON.stringify(["apple", "banana"]));
    });

    /**
     * @tc.name   Json5Test093
     * @tc.number SUB_BUILTINS_Json5_TEST_9300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: EvenCompare = { numbers: [1, 2, 3, 4], evens: [] };
      const json = JSON.stringify(obj);
      const parsed: EvenCompare = JSON.parse(json, (k: string, v: EvenCompare) => {
        if (k === "") {
          const e: number[] = [];
          v.numbers.forEach(n => {
            if (n % 2 === 0) {
              e.push(n);
            }
          });
          return { numbers: v.numbers, evens: e };
        }
        return v;
      });
      expect(JSON.stringify(parsed.evens)).assertEqual(JSON.stringify([2, 4]));
    });

    /**
     * @tc.name   Json5Test094
     * @tc.number SUB_BUILTINS_Json5_TEST_9400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ExtractIdCompare = {
        users: [{ id: 1, name: "A" }, { id: 2, name: "B" }],
        ids: []
      };
      const json = JSON.stringify(obj);
      const parsed: ExtractIdCompare = JSON.parse(json, (k: string, v: ExtractIdCompare) => {
        if (k === "") {
          const i: number[] = [];
          v.users.forEach(u => i.push(u.id));
          return { users: v.users, ids: i };
        }
        return v;
      });
      expect(JSON.stringify(parsed.ids)).assertEqual(JSON.stringify([1, 2]));
    });

    /**
     * @tc.name   Json5Test095
     * @tc.number SUB_BUILTINS_Json5_TEST_9500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SquareCompare = { numbers: [2, 3, 4], squares: [] };
      const json = JSON.stringify(obj);
      const parsed: SquareCompare = JSON.parse(json, (k: string, v: SquareCompare) => {
        if (k === "") {
          const s: number[] = [];
          v.numbers.forEach(n => s.push(n * n));
          return { numbers: v.numbers, squares: s };
        }
        return v;
      });
      expect(JSON.stringify(parsed.squares)).assertEqual(JSON.stringify([4, 9, 16]));
    });

    /**
     * @tc.name   Json5Test096
     * @tc.number SUB_BUILTINS_Json5_TEST_9600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ConcatCompare = { parts: ["a", "b", "c"], combined: [] };
      const json = JSON.stringify(obj);
      const parsed: ConcatCompare = JSON.parse(json, (k: string, v: ConcatCompare) => {
        if (k === "") {
          const c: string[] = [];
          c.push(v.parts[0] + v.parts[1] + v.parts[2]);
          return { parts: v.parts, combined: c };
        }
        return v;
      });
      expect(JSON.stringify(parsed.combined)).assertEqual(JSON.stringify(["abc"]));
    });

    /**
     * @tc.name   Json5Test097
     * @tc.number SUB_BUILTINS_Json5_TEST_9700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ExtractDayCompare = { dates: ["2024-03-05", "2024-09-12"], days: [] };
      const json = JSON.stringify(obj);
      const parsed: ExtractDayCompare = JSON.parse(json, (k: string, v: ExtractDayCompare) => {
        if (k === "") {
          const d: string[] = [];
          v.dates.forEach(date => d.push(date.split("-")[2]));
          return { dates: v.dates, days: d };
        }
        return v;
      });
      expect(JSON.stringify(parsed.days)).assertEqual(JSON.stringify(["05", "12"]));
    });

    /**
     * @tc.name   Json5Test098
     * @tc.number SUB_BUILTINS_Json5_TEST_9800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: GreaterThanTenCompare = { numbers: [5, 12, 8, 15], result: [] };
      const json = JSON.stringify(obj);
      const parsed: GreaterThanTenCompare = JSON.parse(json, (k: string, v: GreaterThanTenCompare) => {
        if (k === "") {
          const r: number[] = [];
          v.numbers.forEach(n => {
            if (n > 10) {
              r.push(n);
            }
          });
          return { numbers: v.numbers, result: r };
        }
        return v;
      });
      expect(JSON.stringify(parsed.result)).assertEqual(JSON.stringify([12, 15]));
    });

    /**
     * @tc.name   Json5Test099
     * @tc.number SUB_BUILTINS_Json5_TEST_9900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CapitalCompare = { words: ["apple", "banana"], capitalized: [] };
      const json = JSON.stringify(obj);
      const parsed: CapitalCompare = JSON.parse(json, (k: string, v: CapitalCompare) => {
        if (k === "") {
          const c: string[] = [];
          v.words.forEach(w => {
            c.push(w.charAt(0).toUpperCase() + w.slice(1));
          });
          return { words: v.words, capitalized: c };
        }
        return v;
      });
      expect(JSON.stringify(parsed.capitalized)).assertEqual(JSON.stringify(["Apple", "Banana"]));
    });

    /**
     * @tc.name   Json5Test100
     * @tc.number SUB_BUILTINS_Json5_TEST_10000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ActiveUserCompare = {
        users: [{ name: "A", active: true }, { name: "B", active: false }],
        active: []
      };
      const json = JSON.stringify(obj);
      const parsed: ActiveUserCompare = JSON.parse(json, (k: string, v: ActiveUserCompare) => {
        if (k === "") {
          const a: Test100_Obj1[] = [];
          v.users.forEach(u => {
            if (u.active) {
              a.push(u);
            }
          });
          return { users: v.users, active: a };
        }
        return v;
      });
      expect(JSON.stringify(parsed.active)).assertEqual(JSON.stringify([{ name: "A", active: true }]));
    });

    /**
     * @tc.name   Json5Test101
     * @tc.number SUB_BUILTINS_Json5_TEST_10100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SumToArrayCompare = { numbers: [1, 2, 3], sum: [] };
      const json = JSON.stringify(obj);
      const parsed: SumToArrayCompare = JSON.parse(json, (k: string, v: SumToArrayCompare) => {
        if (k === "") {
          let s = 0;
          v.numbers.forEach(n => s += n);
          return { numbers: v.numbers, sum: [s] };
        }
        return v;
      });
      expect(JSON.stringify(parsed.sum)).assertEqual(JSON.stringify([6]));
    });

    /**
     * @tc.name   Json5Test102
     * @tc.number SUB_BUILTINS_Json5_TEST_10200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ReverseElementsCompare = { strings: ["abc", "de"], reversed: [] };
      const json = JSON.stringify(obj);
      const parsed: ReverseElementsCompare = JSON.parse(json, (k: string, v: ReverseElementsCompare) => {
        if (k === "") {
          const r: string[] = [];
          v.strings.forEach(s => {
            let rev = "";
            for (let i = s.length - 1; i >= 0; i--) {
              rev += s[i];
            }
            r.push(rev);
          });
          return { strings: v.strings, reversed: r };
        }
        return v;
      });
      expect(JSON.stringify(parsed.reversed)).assertEqual(JSON.stringify(["cba", "ed"]));
    });

    /**
     * @tc.name   Json5Test103
     * @tc.number SUB_BUILTINS_Json5_TEST_10300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: DivisibleByFiveCompare = { numbers: [5, 12, 15, 7], result: [] };
      const json = JSON.stringify(obj);
      const parsed: DivisibleByFiveCompare = JSON.parse(json, (k: string, v: DivisibleByFiveCompare) => {
        if (k === "") {
          const r: number[] = [];
          v.numbers.forEach(n => {
            if (n % 5 === 0) {
              r.push(n);
            }
          });
          return { numbers: v.numbers, result: r };
        }
        return v;
      });
      expect(JSON.stringify(parsed.result)).assertEqual(JSON.stringify([5, 15]));
    });

    /**
     * @tc.name   Json5Test104
     * @tc.number SUB_BUILTINS_Json5_TEST_10400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: AddPropCompare = { items: [{ id: 1 }, { id: 2 }], withProp: [] };
      const json = JSON.stringify(obj);
      const parsed: AddPropCompare = JSON.parse(json, (k: string, v: AddPropCompare) => {
        if (k === "") {
          const w: Test104_Obj2[] = [];
          v.items.forEach(i => w.push({ id: i.id, type: "test" }));
          return { items: v.items, withProp: w };
        }
        return v;
      });
      expect(JSON.stringify(parsed.withProp))
        .assertEqual(JSON.stringify([{ id: 1, type: "test" }, { id: 2, type: "test" }]));
    });

    /**
     * @tc.name   Json5Test105
     * @tc.number SUB_BUILTINS_Json5_TEST_10500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: LengthStatsCompare = { strings: ["a", "bb", "ccc"], lengths: [] };
      const json = JSON.stringify(obj);
      const parsed: LengthStatsCompare = JSON.parse(json, (k: string, v: LengthStatsCompare) => {
        if (k === "") {
          const l: number[] = [];
          v.strings.forEach(s => l.push(s.length));
          return { strings: v.strings, lengths: l };
        }
        return v;
      });
      expect(JSON.stringify(parsed.lengths)).assertEqual(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.name   Json5Test106
     * @tc.number SUB_BUILTINS_Json5_TEST_10600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: WithUnitCompare = { values: [10, 20], withUnit: [] };
      const json = JSON.stringify(obj);
      const parsed: WithUnitCompare = JSON.parse(json, (k: string, v: WithUnitCompare) => {
        if (k === "") {
          const w: string[] = [];
          v.values.forEach(n => w.push(n + "kg"));
          return { values: v.values, withUnit: w };
        }
        return v;
      });
      expect(JSON.stringify(parsed.withUnit)).assertEqual(JSON.stringify(["10kg", "20kg"]));
    });

    /**
     * @tc.name   Json5Test107
     * @tc.number SUB_BUILTINS_Json5_TEST_10700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: LongStringsCompare = { strings: ["a", "bc", "def"], long: [] };
      const json = JSON.stringify(obj);
      const parsed: LongStringsCompare = JSON.parse(json, (k: string, v: LongStringsCompare) => {
        if (k === "") {
          const l: string[] = [];
          v.strings.forEach(s => {
            if (s.length > 2) {
              l.push(s);
            }
          });
          return { strings: v.strings, long: l };
        }
        return v;
      });
      expect(JSON.stringify(parsed.long)).assertEqual(JSON.stringify(["def"]));
    });

    /**
     * @tc.name   Json5Test108
     * @tc.number SUB_BUILTINS_Json5_TEST_10800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SortedCompare = {
        items: [{ name: "B", value: 2 }, { name: "A", value: 1 }],
        sorted: []
      };
      const json = JSON.stringify(obj);
      const parsed: SortedCompare = JSON.parse(json, (k: string, v: SortedCompare) => {
        if (k === "") {
          const s: Test108_Obj1[] = [];
          for (let i = 0; i < v.items.length; i++) {
            let minIdx = i;
            for (let j = i + 1; j < v.items.length; j++) {
              if (v.items[j].value < v.items[minIdx].value) {
                minIdx = j;
              }
            }
            const temp = v.items[i];
            v.items[i] = v.items[minIdx];
            v.items[minIdx] = temp;
          }
          v.items.forEach(item => s.push(item));
          return { items: v.items, sorted: s };
        }
        return v;
      });
      expect(JSON.stringify(parsed.sorted))
        .assertEqual(JSON.stringify([{ name: "A", value: 1 }, { name: "B", value: 2 }]));
    });

    /**
     * @tc.name   Json5Test109
     * @tc.number SUB_BUILTINS_Json5_TEST_10900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: AbsoluteCompare = { numbers: [-1, 2, -3], absolute: [] };
      const json = JSON.stringify(obj);
      const parsed: AbsoluteCompare = JSON.parse(json, (k: string, v: AbsoluteCompare) => {
        if (k === "") {
          const a: number[] = [];
          v.numbers.forEach(n => a.push(n < 0 ? -n : n));
          return { numbers: v.numbers, absolute: a };
        }
        return v;
      });
      expect(JSON.stringify(parsed.absolute)).assertEqual(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.name   Json5Test110
     * @tc.number SUB_BUILTINS_Json5_TEST_11000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ReplaceCharCompare = { strings: ["a-b", "c-d"], replaced: [] };
      const json = JSON.stringify(obj);
      const parsed: ReplaceCharCompare = JSON.parse(json, (k: string, v: ReplaceCharCompare) => {
        if (k === "") {
          const r: string[] = [];
          v.strings.forEach(s => r.push(s.replace("-", "_")));
          return { strings: v.strings, replaced: r };
        }
        return v;
      });
      expect(JSON.stringify(parsed.replaced)).assertEqual(JSON.stringify(["a_b", "c_d"]));
    });

    /**
     * @tc.name   Json5Test111
     * @tc.number SUB_BUILTINS_Json5_TEST_11100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SumPropCompare = {
        orders: [{ id: 1, amount: 10 }, { id: 2, amount: 20 }],
        total: []
      };
      const json = JSON.stringify(obj);
      const parsed: SumPropCompare = JSON.parse(json, (k: string, v: SumPropCompare) => {
        if (k === "") {
          let t = 0;
          v.orders.forEach(o => t += o.amount);
          return { orders: v.orders, total: [t] };
        }
        return v;
      });
      expect(JSON.stringify(parsed.total)).assertEqual(JSON.stringify([30]));
    });

    /**
     * @tc.name   Json5Test112
     * @tc.number SUB_BUILTINS_Json5_TEST_11200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: UniqueCompare = { numbers: [1, 2, 2, 3], unique: [] };
      const json = JSON.stringify(obj);
      const parsed: UniqueCompare = JSON.parse(json, (k: string, v: UniqueCompare) => {
        if (k === "") {
          const u: number[] = [];
          v.numbers.forEach(n => {
            if (!u.includes(n)) {
              u.push(n);
            }
          });
          return { numbers: v.numbers, unique: u };
        }
        return v;
      });
      expect(JSON.stringify(parsed.unique)).assertEqual(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.name   Json5Test113
     * @tc.number SUB_BUILTINS_Json5_TEST_11300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FirstCharCompare = { words: ["apple", "banana", "cat"], firstChars: [] };
      const json = JSON.stringify(obj);
      const parsed: FirstCharCompare = JSON.parse(json, (k: string, v: FirstCharCompare) => {
        if (k === "") {
          const f: string[] = [];
          v.words.forEach(w => f.push(w.charAt(0)));
          return { words: v.words, firstChars: f };
        }
        return v;
      });
      expect(JSON.stringify(parsed.firstChars)).assertEqual(JSON.stringify(["a", "b", "c"]));
    });

    /**
     * @tc.name   Json5Test114
     * @tc.number SUB_BUILTINS_Json5_TEST_11400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: BinaryStrCompare = { numbers: [3, 5], binary: [] };
      const json = JSON.stringify(obj);
      const parsed: BinaryStrCompare = JSON.parse(json, (k: string, v: BinaryStrCompare) => {
        if (k === "") {
          const b: string[] = [];
          v.numbers.forEach(n => {
            let bin = "";
            let num = n;
            while (num > 0) {
              bin = (num % 2) + bin;
              num = Math.floor(num / 2);
            }
            b.push(bin);
          });
          return { numbers: v.numbers, binary: b };
        }
        return v;
      });
      expect(JSON.stringify(parsed.binary)).assertEqual(JSON.stringify(["11", "101"]));
    });

    /**
     * @tc.name   Json5Test115
     * @tc.number SUB_BUILTINS_Json5_TEST_11500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: PriceFilterCompare = {
        products: [{ name: "A", price: 40 }, { name: "B", price: 60 }],
        expensive: []
      };
      const json = JSON.stringify(obj);
      const parsed: PriceFilterCompare = JSON.parse(json, (k: string, v: PriceFilterCompare) => {
        if (k === "") {
          const e: Test115_Obj1[] = [];
          v.products.forEach(p => {
            if (p.price > 50) {
              e.push(p);
            }
          });
          return { products: v.products, expensive: e };
        }
        return v;
      });
      expect(JSON.stringify(parsed.expensive)).assertEqual(JSON.stringify([{ name: "B", price: 60 }]));
    });

    /**
     * @tc.name   Json5Test116
     * @tc.number SUB_BUILTINS_Json5_TEST_11600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CubeCompare = { numbers: [2, 3], cubes: [] };
      const json = JSON.stringify(obj);
      const parsed: CubeCompare = JSON.parse(json, (k: string, v: CubeCompare) => {
        if (k === "") {
          const c: number[] = [];
          v.numbers.forEach(n => c.push(n * n * n));
          return { numbers: v.numbers, cubes: c };
        }
        return v;
      });
      expect(JSON.stringify(parsed.cubes)).assertEqual(JSON.stringify([8, 27]));
    });

    /**
     * @tc.name   Json5Test117
     * @tc.number SUB_BUILTINS_Json5_TEST_11700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: JoinWithSepCompare = { words: ["a", "b", "c"], joined: [] };
      const json = JSON.stringify(obj);
      const parsed: JoinWithSepCompare = JSON.parse(json, (k: string, v: JoinWithSepCompare) => {
        if (k === "") {
          let j = "";
          for (let i = 0; i < v.words.length; i++) {
            j += v.words[i];
            if (i < v.words.length - 1) {
              j += ",";
            }
          }
          return { words: v.words, joined: [j] };
        }
        return v;
      });
      expect(JSON.stringify(parsed.joined)).assertEqual(JSON.stringify(["a,b,c"]));
    });

    /**
     * @tc.name   Json5Test118
     * @tc.number SUB_BUILTINS_Json5_TEST_11800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FixedTwoCompare = { numbers: [1.234, 5.678], fixed: [] };
      const json = JSON.stringify(obj);
      const parsed: FixedTwoCompare = JSON.parse(json, (k: string, v: FixedTwoCompare) => {
        if (k === "") {
          const f: number[] = [];
          v.numbers.forEach(n => f.push(Math.round(n * 100) / 100));
          return { numbers: v.numbers, fixed: f };
        }
        return v;
      });
      expect(JSON.stringify(parsed.fixed)).assertEqual(JSON.stringify([1.23, 5.68]));
    });

    /**
     * @tc.name   Json5Test119
     * @tc.number SUB_BUILTINS_Json5_TEST_11900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SubstrFilterCompare = { strings: ["apple", "banana", "grape"], filtered: [] };
      const json = JSON.stringify(obj);
      const parsed: SubstrFilterCompare = JSON.parse(json, (k: string, v: SubstrFilterCompare) => {
        if (k === "") {
          const f: string[] = [];
          v.strings.forEach(s => {
            if (s.includes("ap")) {
              f.push(s);
            }
          });
          return { strings: v.strings, filtered: f };
        }
        return v;
      });
      expect(JSON.stringify(parsed.filtered)).assertEqual(JSON.stringify(["apple", "grape"]));
    });

    /**
     * @tc.name   Json5Test120
     * @tc.number SUB_BUILTINS_Json5_TEST_12000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: UpdatePriceCompare = {
        items: [{ id: 1, price: 100 }, { id: 2, price: 200 }],
        updated: []
      };
      const json = JSON.stringify(obj);
      const parsed: UpdatePriceCompare = JSON.parse(json, (k: string, v: UpdatePriceCompare) => {
        if (k === "") {
          const u: Test120_Obj1[] = [];
          v.items.forEach(i => u.push({ id: i.id, price: i.price * 0.9 }));
          return { items: v.items, updated: u };
        }
        return v;
      });
      expect(JSON.stringify(parsed.updated)).assertEqual(JSON.stringify([{ id: 1, price: 90 }, { id: 2, price: 180 }]));
    });
    /**
     * @tc.name   Json5Test121
     * @tc.number SUB_BUILTINS_Json5_TEST_12100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: MinToArrayCompare = { numbers: [5, 2, 8, 1], min: [] };
      const json = JSON.stringify(obj);
      const parsed: MinToArrayCompare = JSON.parse(json, (k: string, v: MinToArrayCompare) => {
        if (k === "") {
          let m = v.numbers[0];
          v.numbers.forEach(n => {
            if (n < m) {
              m = n;
            }
          });
          return { numbers: v.numbers, min: [m] };
        }
        return v;
      });
      expect(JSON.stringify(parsed.min)).assertEqual(JSON.stringify([1]));
    });

    /**
     * @tc.name   Json5Test122
     * @tc.number SUB_BUILTINS_Json5_TEST_12200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: TrimmedCompare = { strings: ["  a ", "b  ", "  c  "], trimmed: [] };
      const json = JSON.stringify(obj);
      const parsed: TrimmedCompare = JSON.parse(json, (k: string, v: TrimmedCompare) => {
        if (k === "") {
          const t: string[] = [];
          v.strings.forEach(s => {
            let trim = "";
            let start = 0;
            let end = s.length - 1;
            while (start <= end && s[start] === " ") {
              start++;
            }
            while (end >= start && s[end] === " ") {
              end--;
            }
            for (let i = start; i <= end; i++) {
              trim += s[i];
            }
            t.push(trim);
          });
          return { strings: v.strings, trimmed: t };
        }
        return v;
      });
      expect(JSON.stringify(parsed.trimmed)).assertEqual(JSON.stringify(["a", "b", "c"]));
    });

    /**
     * @tc.name   Json5Test123
     * @tc.number SUB_BUILTINS_Json5_TEST_12300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: OddNumbersCompare = { numbers: [1, 2, 3, 4, 5], odds: [] };
      const json = JSON.stringify(obj);
      const parsed: OddNumbersCompare = JSON.parse(json, (k: string, v: OddNumbersCompare) => {
        if (k === "") {
          const o: number[] = [];
          v.numbers.forEach(n => {
            if (n % 2 !== 0) {
              o.push(n);
            }
          });
          return { numbers: v.numbers, odds: o };
        }
        return v;
      });
      expect(JSON.stringify(parsed.odds)).assertEqual(JSON.stringify([1, 3, 5]));
    });

    /**
     * @tc.name   Json5Test124
     * @tc.number SUB_BUILTINS_Json5_TEST_12400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ExtractNamesCompare = {
        employees: [{ id: 1, name: "Alice" }, { id: 2, name: "Bob" }],
        names: []
      };
      const json = JSON.stringify(obj);
      const parsed: ExtractNamesCompare = JSON.parse(json, (k: string, v: ExtractNamesCompare) => {
        if (k === "") {
          const n: string[] = [];
          v.employees.forEach(e => n.push(e.name));
          return { employees: v.employees, names: n };
        }
        return v;
      });
      expect(JSON.stringify(parsed.names)).assertEqual(JSON.stringify(["Alice", "Bob"]));
    });

    /**
     * @tc.name   Json5Test125
     * @tc.number SUB_BUILTINS_Json5_TEST_12500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SquareRootCompare = { numbers: [4, 9, 16], roots: [] };
      const json = JSON.stringify(obj);
      const parsed: SquareRootCompare = JSON.parse(json, (k: string, v: SquareRootCompare) => {
        if (k === "") {
          const r: number[] = [];
          v.numbers.forEach(n => r.push(Math.sqrt(n)));
          return { numbers: v.numbers, roots: r };
        }
        return v;
      });
      expect(JSON.stringify(parsed.roots)).assertEqual(JSON.stringify([2, 3, 4]));
    });

    /**
     * @tc.name   Json5Test126
     * @tc.number SUB_BUILTINS_Json5_TEST_12600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CapitalFirstCompare = { words: ["hello", "world"], capitalized: [] };
      const json = JSON.stringify(obj);
      const parsed: CapitalFirstCompare = JSON.parse(json, (k: string, v: CapitalFirstCompare) => {
        if (k === "") {
          const c: string[] = [];
          v.words.forEach(w => {
            c.push(w.charAt(0).toUpperCase() + w.slice(1));
          });
          return { words: v.words, capitalized: c };
        }
        return v;
      });
      expect(parsed.capitalized.length).assertEqual(2);
      expect(parsed.capitalized[0]).assertEqual("Hello");
      expect(parsed.capitalized[1]).assertEqual("World");
    });

    /**
     * @tc.name   Json5Test127
     * @tc.number SUB_BUILTINS_Json5_TEST_12700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: MonthNameCompare = { dates: ["2024-01-05", "2024-03-12"], months: [] };
      const json = JSON.stringify(obj);
      const parsed: MonthNameCompare = JSON.parse(json, (k: string, v: MonthNameCompare) => {
        if (k === "") {
          const m: string[] = [];
          const names = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
          v.dates.forEach(date => {
            const month = parseInt(date.split("-")[1]) - 1;
            m.push(names[month]);
          });
          return { dates: v.dates, months: m };
        }
        return v;
      });
      expect(JSON.stringify(parsed.months)).assertEqual(JSON.stringify(["Jan", "Mar"]));
    });

    /**
     * @tc.name   Json5Test128
     * @tc.number SUB_BUILTINS_Json5_TEST_12800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: NegativeNumbersCompare = { numbers: [-1, 2, -3, 4], negatives: [] };
      const json = JSON.stringify(obj);
      const parsed: NegativeNumbersCompare = JSON.parse(json, (k: string, v: NegativeNumbersCompare) => {
        if (k === "") {
          const n: number[] = [];
          v.numbers.forEach(num => {
            if (num < 0) {
              n.push(num);
            }
          });
          return { numbers: v.numbers, negatives: n };
        }
        return v;
      });
      expect(JSON.stringify(parsed.negatives)).assertEqual(JSON.stringify([-1, -3]));
    });

    /**
     * @tc.name   Json5Test129
     * @tc.number SUB_BUILTINS_Json5_TEST_12900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: UppercaseCompare = { words: ["apple", "Banana"], uppercase: [] };
      const json = JSON.stringify(obj);
      const parsed: UppercaseCompare = JSON.parse(json, (k: string, v: UppercaseCompare) => {
        if (k === "") {
          const u: string[] = [];
          v.words.forEach(w => u.push(w.toUpperCase()));
          return { words: v.words, uppercase: u };
        }
        return v;
      });
      expect(JSON.stringify(parsed.uppercase)).assertEqual(JSON.stringify(["APPLE", "BANANA"]));
    });

    /**
     * @tc.name   Json5Test130
     * @tc.number SUB_BUILTINS_Json5_TEST_13000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: AgeFilterCompare = {
        people: [{ name: "A", age: 25 }, { name: "B", age: 35 }],
        adults: []
      };
      const json = JSON.stringify(obj);
      const parsed: AgeFilterCompare = JSON.parse(json, (k: string, v: AgeFilterCompare) => {
        if (k === "") {
          const a: Test130_Obj1[] = [];
          v.people.forEach(p => {
            if (p.age > 30) {
              a.push(p);
            }
          });
          return { people: v.people, adults: a };
        }
        return v;
      });
      expect(JSON.stringify(parsed.adults)).assertEqual(JSON.stringify([{ name: "B", age: 35 }]));
    });

    /**
     * @tc.name   Json5Test131
     * @tc.number SUB_BUILTINS_Json5_TEST_13100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: DoubleSumCompare = { numbers: [1, 2, 3], doubledSum: [] };
      const json = JSON.stringify(obj);
      const parsed: DoubleSumCompare = JSON.parse(json, (k: string, v: DoubleSumCompare) => {
        if (k === "") {
          let s = 0;
          v.numbers.forEach(n => s += n);
          return { numbers: v.numbers, doubledSum: [s * 2] };
        }
        return v;
      });
      expect(JSON.stringify(parsed.doubledSum)).assertEqual(JSON.stringify([12]));
    });

    /**
     * @tc.name   Json5Test132
     * @tc.number SUB_BUILTINS_Json5_TEST_13200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ReverseArrayCompare = { strings: ["a", "b", "c"], reversed: [] };
      const json = JSON.stringify(obj);
      const parsed: ReverseArrayCompare = JSON.parse(json, (k: string, v: ReverseArrayCompare) => {
        if (k === "") {
          const r: string[] = [];
          for (let i = v.strings.length - 1; i >= 0; i--) {
            r.push(v.strings[i]);
          }
          return { strings: v.strings, reversed: r };
        }
        return v;
      });
      expect(JSON.stringify(parsed.reversed)).assertEqual(JSON.stringify(["c", "b", "a"]));
    });

    /**
     * @tc.name   Json5Test133
     * @tc.number SUB_BUILTINS_Json5_TEST_13300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: DivisibleBySevenCompare = { numbers: [7, 14, 20, 21], result: [] };
      const json = JSON.stringify(obj);
      const parsed: DivisibleBySevenCompare = JSON.parse(json, (k: string, v: DivisibleBySevenCompare) => {
        if (k === "") {
          const r: number[] = [];
          v.numbers.forEach(n => {
            if (n % 7 === 0) {
              r.push(n);
            }
          });
          return { numbers: v.numbers, result: r };
        }
        return v;
      });
      expect(JSON.stringify(parsed.result)).assertEqual(JSON.stringify([7, 14, 21]));
    });

    /**
     * @tc.name   Json5Test134
     * @tc.number SUB_BUILTINS_Json5_TEST_13400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: AddIndexCompare = { items: [{ name: "A" }, { name: "B" }], indexed: [] };
      const json = JSON.stringify(obj);
      const parsed: AddIndexCompare = JSON.parse(json, (k: string, v: AddIndexCompare) => {
        if (k === "") {
          const i: Test134_Obj2[] = [];
          for (let idx = 0; idx < v.items.length; idx++) {
            i.push({ name: v.items[idx].name, index: idx });
          }
          return { items: v.items, indexed: i };
        }
        return v;
      });
      expect(JSON.stringify(parsed.indexed))
        .assertEqual(JSON.stringify([{ name: "A", index: 0 }, { name: "B", index: 1 }]));
    });

    /**
     * @tc.name   Json5Test135
     * @tc.number SUB_BUILTINS_Json5_TEST_13500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CharIncludeCountCompare = { strings: ["apple", "banana", "grape"], counts: [] };
      const json = JSON.stringify(obj);
      const parsed: CharIncludeCountCompare = JSON.parse(json, (k: string, v: CharIncludeCountCompare) => {
        if (k === "") {
          const c: number[] = [];
          v.strings.forEach(s => {
            let count = 0;
            for (let i = 0; i < s.length; i++) {
              if (s[i] === "a") {
                count++;
              }
            }
            c.push(count);
          });
          return { strings: v.strings, counts: c };
        }
        return v;
      });
      expect(JSON.stringify(parsed.counts)).assertEqual(JSON.stringify([1, 3, 1]));
    });

    /**
     * @tc.name   Json5Test136
     * @tc.number SUB_BUILTINS_Json5_TEST_13600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ScientificCompare = { numbers: [1000, 0.001], scientific: [] };
      const json = JSON.stringify(obj);
      const parsed: ScientificCompare = JSON.parse(json, (k: string, v: ScientificCompare) => {
        if (k === "") {
          const s: string[] = [];
          v.numbers.forEach(n => s.push(n.toExponential()));
          return { numbers: v.numbers, scientific: s };
        }
        return v;
      });
      expect(JSON.stringify(parsed.scientific)).assertEqual(JSON.stringify(["1e+3", "1e-3"]));
    });

    /**
     * @tc.name   Json5Test137
     * @tc.number SUB_BUILTINS_Json5_TEST_13700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: OddLengthCompare = { strings: ["a", "bb", "ccc", "dddd"], oddLength: [] };
      const json = JSON.stringify(obj);
      const parsed: OddLengthCompare = JSON.parse(json, (k: string, v: OddLengthCompare) => {
        if (k === "") {
          const o: string[] = [];
          v.strings.forEach(s => {
            if (s.length % 2 !== 0) {
              o.push(s);
            }
          });
          return { strings: v.strings, oddLength: o };
        }
        return v;
      });
      expect(JSON.stringify(parsed.oddLength)).assertEqual(JSON.stringify(["a", "ccc"]));
    });

    /**
     * @tc.name   Json5Test138
     * @tc.number SUB_BUILTINS_Json5_TEST_13800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: DivisibleBy15Compare = { numbers: [10, 15, 30, 25], result: [] };
      const json = JSON.stringify(obj);
      const parsed: DivisibleBy15Compare = JSON.parse(json, (k: string, v: DivisibleBy15Compare) => {
        if (k === "") {
          const r: number[] = [];
          v.numbers.forEach(n => {
            if (n % 3 === 0 && n % 5 === 0) {
              r.push(n);
            }
          });
          return { numbers: v.numbers, result: r };
        }
        return v;
      });
      expect(parsed.result.length).assertEqual(2);
      expect(parsed.result[0]).assertEqual(15);
      expect(parsed.result[1]).assertEqual(30);
    });

    /**
     * @tc.name   Json5Test139
     * @tc.number SUB_BUILTINS_Json5_TEST_13900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ReciprocalCompare = { numbers: [2, 3, 4], reciprocals: [] };
      const json = JSON.stringify(obj);
      const parsed: ReciprocalCompare = JSON.parse(json, (k: string, v: ReciprocalCompare) => {
        if (k === "") {
          const r: number[] = [];
          v.numbers.forEach(n => r.push(1 / n));
          return { numbers: v.numbers, reciprocals: r };
        }
        return v;
      });
      expect(JSON.stringify(parsed.reciprocals)).assertEqual(JSON.stringify([0.5, 0.3333333333333333, 0.25]));
    });

    /**
     * @tc.name   Json5Test140
     * @tc.number SUB_BUILTINS_Json5_TEST_14000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ReplaceSubstrCompare = { strings: ["cat", "catch", "category"], replaced: [] };
      const json = JSON.stringify(obj);
      const parsed: ReplaceSubstrCompare = JSON.parse(json, (k: string, v: ReplaceSubstrCompare) => {
        if (k === "") {
          const r: string[] = [];
          v.strings.forEach(s => r.push(s.replace("cat", "dog")));
          return { strings: v.strings, replaced: r };
        }
        return v;
      });
      expect(JSON.stringify(parsed.replaced)).assertEqual(JSON.stringify(["dog", "dogch", "dogegory"]));
    });

    /**
     * @tc.name   Json5Test141
     * @tc.number SUB_BUILTINS_Json5_TEST_14100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: UniqueSortedCompare = { numbers: [3, 1, 2, 2, 3], result: [] };
      const json = JSON.stringify(obj);
      const parsed: UniqueSortedCompare = JSON.parse(json, (k: string, v: UniqueSortedCompare) => {
        if (k === "") {
          const u: number[] = [];
          v.numbers.forEach(n => {
            if (!u.includes(n)) {
              u.push(n);
            }
          });
          for (let i = 0; i < u.length; i++) {
            for (let j = i + 1; j < u.length; j++) {
              if (u[i] > u[j]) {
                const t = u[i];
                u[i] = u[j];
                u[j] = t;
              }
            }
          }
          return { numbers: v.numbers, result: u };
        }
        return v;
      });
      expect(JSON.stringify(parsed.result)).assertEqual(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.name   Json5Test142
     * @tc.number SUB_BUILTINS_Json5_TEST_14200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: LastCharCompare = { words: ["apple", "banana", "cat"], lastChars: [] };
      const json = JSON.stringify(obj);
      const parsed: LastCharCompare = JSON.parse(json, (k: string, v: LastCharCompare) => {
        if (k === "") {
          const l: string[] = [];
          v.words.forEach(w => l.push(w[w.length - 1]));
          return { words: v.words, lastChars: l };
        }
        return v;
      });
      expect(JSON.stringify(parsed.lastChars)).assertEqual(JSON.stringify(["e", "a", "t"]));
    });

    /**
     * @tc.name   Json5Test143
     * @tc.number SUB_BUILTINS_Json5_TEST_14300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CelsiusCompare = { temps: [20, 30], formatted: [] };
      const json = JSON.stringify(obj);
      const parsed: CelsiusCompare = JSON.parse(json, (k: string, v: CelsiusCompare) => {
        if (k === "") {
          const f: string[] = [];
          v.temps.forEach(t => f.push(t + "°C"));
          return { temps: v.temps, formatted: f };
        }
        return v;
      });
      expect(parsed.formatted[0]).assertEqual("20°C");
      expect(parsed.formatted[1]).assertEqual("30°C");
    });

    /**
     * @tc.name   Json5Test144
     * @tc.number SUB_BUILTINS_Json5_TEST_14400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ExtractDomainCompare = {
        users: [
          { name: "A", email: "a@example.com" },
          { name: "B", email: "b@test.org" }
        ],
        domains: []
      };
      const json = JSON.stringify(obj);
      const parsed: ExtractDomainCompare = JSON.parse(json, (k: string, v: ExtractDomainCompare) => {
        if (k === "") {
          const d: string[] = [];
          v.users.forEach(u => {
            d.push(u.email.split("@")[1]);
          });
          return { users: v.users, domains: d };
        }
        return v;
      });
      expect(parsed.domains[0]).assertEqual("example.com");
      expect(parsed.domains[1]).assertEqual("test.org");
    });

    /**
     * @tc.name   Json5Test145
     * @tc.number SUB_BUILTINS_Json5_TEST_14500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FourthPowerCompare = { numbers: [2, 3], powers: [] };
      const json = JSON.stringify(obj);
      const parsed: FourthPowerCompare = JSON.parse(json, (k: string, v: FourthPowerCompare) => {
        if (k === "") {
          const p: number[] = [];
          v.numbers.forEach(n => p.push(n * n * n * n));
          return { numbers: v.numbers, powers: p };
        }
        return v;
      });
      expect(JSON.stringify(parsed.powers)).assertEqual(JSON.stringify([16, 81]));
    });

    /**
     * @tc.name   Json5Test146
     * @tc.number SUB_BUILTINS_Json5_TEST_14600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: MaskMiddleCompare = { strings: ["apple", "banana", "cat"], masked: [] };
      const json = JSON.stringify(obj);
      const parsed: MaskMiddleCompare = JSON.parse(json, (k: string, v: MaskMiddleCompare) => {
        if (k === "") {
          const m: string[] = [];
          v.strings.forEach(s => {
            if (s.length <= 2) {
              m.push(s);
            } else {
              let masked = s[0];
              for (let i = 1; i < s.length - 1; i++) {
                masked += "*";
              }
              masked += s[s.length - 1];
              m.push(masked);
            }
          });
          return { strings: v.strings, masked: m };
        }
        return v;
      });
      expect(JSON.stringify(parsed.masked)).assertEqual(JSON.stringify(["a***e", "b****a", "c*t"]));
    });

    /**
     * @tc.name   Json5Test147
     * @tc.number SUB_BUILTINS_Json5_TEST_14700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FixedOneCompare = { numbers: [1.23, 4.567], fixed: [] };
      const json = JSON.stringify(obj);
      const parsed: FixedOneCompare = JSON.parse(json, (k: string, v: FixedOneCompare) => {
        if (k === "") {
          const f: number[] = [];
          v.numbers.forEach(n => f.push(Math.round(n * 10) / 10));
          return { numbers: v.numbers, fixed: f };
        }
        return v;
      });
      expect(JSON.stringify(parsed.fixed)).assertEqual(JSON.stringify([1.2, 4.6]));
    });

    /**
     * @tc.name   Json5Test148
     * @tc.number SUB_BUILTINS_Json5_TEST_14800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: NoNumbersCompare = { strings: ["abc", "d1e", "fgh"], filtered: [] };
      const json = JSON.stringify(obj);
      const parsed: NoNumbersCompare = JSON.parse(json, (k: string, v: NoNumbersCompare) => {
        if (k === "") {
          const f: string[] = [];
          v.strings.forEach(s => {
            let hasNum = false;
            for (let i = 0; i < s.length; i++) {
              if (!isNaN(parseInt(s[i]))) {
                hasNum = true;
                break;
              }
            }
            if (!hasNum) {
              f.push(s);
            }
          });
          return { strings: v.strings, filtered: f };
        }
        return v;
      });
      expect(JSON.stringify(parsed.filtered)).assertEqual(JSON.stringify(["abc", "fgh"]));
    });

    /**
     * @tc.name   Json5Test149
     * @tc.number SUB_BUILTINS_Json5_TEST_14900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: UpdateStatusCompare = {
        orders: [{ id: 1, status: "pending" }, { id: 2, status: "pending" }],
        updated: []
      };
      const json = JSON.stringify(obj);
      const parsed: UpdateStatusCompare = JSON.parse(json, (k: string, v: UpdateStatusCompare) => {
        if (k === "") {
          const u: Test149_Obj1[] = [];
          v.orders.forEach(o => u.push({ id: o.id, status: "shipped" }));
          return { orders: v.orders, updated: u };
        }
        return v;
      });
      expect(JSON.stringify(parsed.updated))
        .assertEqual(JSON.stringify([{ id: 1, status: "shipped" }, { id: 2, status: "shipped" }]));
    });

    /**
     * @tc.name   Json5Test150
     * @tc.number SUB_BUILTINS_Json5_TEST_15000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json5Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: TripleMaxCompare = { numbers: [5, 8, 3, 10], result: [] };
      const json = JSON.stringify(obj);
      const parsed: TripleMaxCompare = JSON.parse(json, (k: string, v: TripleMaxCompare) => {
        if (k === "") {
          let m = v.numbers[0];
          v.numbers.forEach(n => {
            if (n > m) {
              m = n;
            }
          });
          return { numbers: v.numbers, result: [m * 3] };
        }
        return v;
      });
      expect(JSON.stringify(parsed.result)).assertEqual(JSON.stringify([30]));
    });
  })
}

