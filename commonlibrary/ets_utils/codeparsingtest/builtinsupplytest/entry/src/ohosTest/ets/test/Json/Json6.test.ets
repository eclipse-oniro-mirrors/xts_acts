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

interface HasUppercaseCompare {
  strings: string[];
  filtered: string[];
}

interface Test2_Obj1 {
  name: string;
  age: number;
}

interface AgeDiffCompare {
  people: Test2_Obj1[];
  diffs: number[];
}

interface SumCountCompare {
  numbers: number[];
  sum: number;
  count: number;
}

interface SentenceCompare {
  words: string[];
  sentence: string;
}

interface Test5_Obj1 {
  name: string;
  price: number;
}

interface PriceRangeCompare {
  products: Test5_Obj1[];
  inRange: Test5_Obj1[];
}

interface PercentCompare {
  ratios: number[];
  percentages: string[];
}

interface CharFrequencyCompare {
  strings: string[];
  counts: number[];
}

interface Test8_Obj1 {
  category: string;
}

interface Test8_Obj2 {
  category: string;
  count: number;
}

interface GroupCountCompare {
  items: Test8_Obj1[];
  counts: Test8_Obj2[];
}

interface CumulativeSumCompare {
  numbers: number[];
  sums: number[];
}

interface TruncateCompare {
  strings: string[];
  truncated: string[];
}

interface Test11_Obj1 {
  name: string;
  quantity: number;
}

interface InStockCompare {
  products: Test11_Obj1[];
  inStock: Test11_Obj1[];
}

interface NumberToBoolCompare {
  numbers: number[];
  booleans: boolean[];
}

interface HasSubstringCompare {
  strings: string[];
  hasSub: boolean[];
}

interface Test14_Obj1 {
  id: number;
  amount: number;
}

interface TotalAmountCompare {
  orders: Test14_Obj1[];
  total: number;
}

interface OddEvenClassifyCompare {
  numbers: number[];
  odd: number[];
  even: number[];
}

interface ReversedLengthCompare {
  strings: string[];
  reversed: string[];
}

interface Test17_Obj1 {
  name: string;
  role: string;
}

interface RoleFilterCompare {
  users: Test17_Obj1[];
  admins: Test17_Obj1[];
}

interface SqrtOfSquaresCompare {
  numbers: number[];
  result: number;
}

interface WrapStringsCompare {
  strings: string[];
  wrapped: string[];
}

interface Test20_Obj1 {
  name: string;
  date: string;
}

interface Year2024FilterCompare {
  events: Test20_Obj1[];
  filtered: Test20_Obj1[];
}

interface ThousandsFormatCompare {
  numbers: number[];
  formatted: string[];
}

interface IsEmptyCompare {
  strings: string[];
  isEmpty: boolean[];
}

interface Test23_Obj1 {
  title: string;
  rating: number;
}

interface AvgRatingCompare {
  movies: Test23_Obj1[];
  avg: number;
}

interface PrimeNumbersCompare {
  numbers: number[];
  primes: number[];
}

interface TitleCaseCompare {
  strings: string[];
  titles: string[];
}

interface RotateFirstCharCompare {
  strings: string[];
  rotated: string[];
}

interface GCDCompare {
  numbers: number[];
  gcd: number;
}

interface AnagramCheckCompare {
  stringPairs: [string, string][];
  isAnagram: boolean[];
}

interface PrefixSuffixProductCompare {
  numbers: number[];
  products: number[];
}

interface ConsonantCountCompare {
  strings: string[];
  counts: number[];
}

interface Test30_Obj1 {
  region: string;
  amount: number;
}

interface FilteredMaxCompare {
  sales: Test30_Obj1[];
  westMax: number;
}

interface LCMCompare {
  numbers: number[];
  lcm: number;
}

interface EndsWithCheckCompare {
  strings: string[];
  char: string;
  results: boolean[];
}

interface Test33_Obj1 {
  type: string;
  value: number;
}

interface Test33_Obj2 {
  type: string;
  total: number;
}

interface HexStringCompare {
  numbers: number[];
  hexStrings: string[];
}

interface AsciiConvertCompare {
  codes: number[];
  chars: string[];
}

interface UniqueCharsCompare {
  strings: string[];
  unique: string[];
}

interface Test35_Obj1 {
  name: string;
  price: number;
}

interface BelowAvgPriceCompare {
  products: Test35_Obj1[];
  belowAvg: Test35_Obj1[];
}

interface AdjacentProductCompare {
  numbers: number[];
  products: number[];
}

interface MiddleSubstringCompare {
  strings: string[];
  middles: string[];
}

interface MinValueIndexCompare {
  numbers: number[];
  min: number;
  index: number;
}

interface ReverseCharsCompare {
  strings: string[];
  reversed: string[];
}

interface NaturalLogCompare {
  numbers: number[];
  logs: number[];
}

interface SumOfSquaresCompare {
  numbers: number[];
  sum: number;
}

interface ReplaceSpaceCompare {
  strings: string[];
  replaced: string[];
}

interface ExponentialCompare {
  numbers: number[];
  results: number[];
}

interface LowerCountCompare {
  strings: string[];
  counts: number[];
}

interface Test45_Obj1 {
  name: string;
  date: string;
}

interface DateFormatCompare {
  events: Test45_Obj1[];
  formatted: Test45_Obj1[];
}

interface AboveAvgElementsCompare {
  numbers: number[];
  aboveAvg: number[];
}

interface ProperCaseCompare {
  strings: string[];
  proper: string[];
}

interface SineCompare {
  angles: number[];
  sines: number[];
}

interface IsAlphaCompare {
  strings: string[];
  results: boolean[];
}

interface Test50_Obj1 {
  status: string;
  amount: number;
}

interface FilteredTotalCompare {
  orders: Test50_Obj1[];
  completedTotal: number;
}

interface SumOverMaxCompare {
  numbers: number[];
  ratio: number;
}

interface SpecificCharCountCompare {
  strings: string[];
  char: string;
  counts: number[];
}

interface Test53_Obj1 {
  name: string;
  price: number;
}

interface PriceRangeCountCompare {
  products: Test53_Obj1[];
  range: [number, number];
  count: number;
}

interface SumOfSquareRootsCompare {
  numbers: number[];
  sum: number;
}

interface StartsWithCheckCompare {
  strings: string[];
  prefix: string;
  results: boolean[];
}

interface MonthNameCompare {
  months: number[];
  names: string[];
}

interface Test57_Obj1 {
  title: string;
  rating: number;
}

interface HighRatingFilterCompare {
  movies: Test57_Obj1[];
  threshold: number;
  highRated: Test57_Obj1[];
}

interface CosineCompare {
  angles: number[];
  cosines: number[];
}

interface ReplaceAtPositionCompare {
  strings: string[];
  position: number;
  char: string;
  replaced: string[];
}

interface EvenSquareSumCompare {
  numbers: number[];
  sum: number;
}

interface HasConsecutiveCharsCompare {
  strings: string[];
  results: boolean[];
}

interface Test68_Obj1 {
  name: string;
  date: string;
}

interface DateTopNCompare {
  events: Test68_Obj1[];
  n: number;
  latest: Test68_Obj1[];
}

interface TangentCompare {
  angles: number[];
  tangents: number[];
}

interface NonAlphaCountCompare {
  strings: string[];
  counts: number[];
}

interface AsciiSortCompare {
  strings: string[];
  sorted: string[];
}

interface SumOfAbsCompare {
  numbers: number[];
  sum: number;
}

interface IsNumericCompare {
  strings: string[];
  results: boolean[];
}

interface ExpCompare {
  numbers: number[];
  results: number[];
}

interface SwapFirstLastCompare {
  strings: string[];
  swapped: string[];
}

interface SquareCubeSumCompare {
  numbers: number[];
  results: number[];
}

interface IsEmailCompare {
  strings: string[];
  results: boolean[];
}

interface GeometricMeanCompare {
  numbers: number[];
  mean: number;
}

interface UpperCaseCountCompare {
  strings: string[];
  counts: number[];
}

interface Test74_Obj1 {
  name: string;
  price: number;
}

interface AboveAvgProductsCompare {
  products: Test74_Obj1[];
  aboveAvg: Test74_Obj1[];
}

interface SumOfSquaredDiffsCompare {
  numbers: number[];
  sum: number;
}

interface ContainsSubstringCompare {
  strings: string[];
  substring: string;
  results: boolean[];
}

interface WeekdayNameCompare {
  weekdays: number[];
  names: string[];
}

interface ReverseSortCharsCompare {
  strings: string[];
  sorted: string[];
}

interface SinhCompare {
  numbers: number[];
  results: number[];
}

interface ReplaceSubstringCompare {
  strings: string[];
  from: string;
  to: string;
  replaced: string[];
}

interface OddProductCompare {
  numbers: number[];
  product: number;
}

interface IsPalindromeCompare {
  strings: string[];
  results: boolean[];
}

interface CoshCompare {
  numbers: number[];
  results: number[];
}

interface SpaceCountCompare {
  strings: string[];
  counts: number[];
}

interface HarmonicMeanCompare {
  numbers: number[];
  mean: number;
}

interface AlternateCaseCompare {
  strings: string[];
  alternated: string[];
}

interface AcosCompare {
  numbers: number[];
  results: number[];
}

interface HasDigitCompare {
  strings: string[];
  results: boolean[];
}

interface AsinCompare {
  numbers: number[];
  results: number[];
}

interface CapitalizeWordsCompare {
  strings: string[];
  capitalized: string[];
}

interface WeightedMeanCompare {
  values: number[];
  weights: number[];
  mean: number;
}

interface TanhCompare {
  numbers: number[];
  results: number[];
}

interface SubstringExtractCompare {
  strings: string[];
  start: number;
  length: number;
  extracted: string[];
}

interface RootSumSquaresCompare {
  numbers: number[];
  result: number;
}

interface HasTripleCharsCompare {
  strings: string[];
  results: boolean[];
}

interface AsinhCompare {
  numbers: number[];
  results: number[];
}

interface GeometricStdDevCompare {
  numbers: number[];
  stdDev: number;
}

interface AcoshCompare {
  numbers: number[];
  results: number[];
}

interface Test99_Obj1 {
  type: string;
  amount: number;
}

interface FilteredCumulativeSumCompare {
  transactions: Test99_Obj1[];
  cumulative: number[];
}

interface AtanhCompare {
  numbers: number[];
  results: number[];
}

export default function Json6Test() {
  describe('Json6Test', () => {
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
     * @tc.name   Json6Test001
     * @tc.number SUB_BUILTINS_Json6_TEST_0100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: HasUppercaseCompare = { strings: ["test", "Test", "TEST"], filtered: [] };
      const json = JSON.stringify(obj);
      const parsed: HasUppercaseCompare = JSON.parse(json, (k: string, v: HasUppercaseCompare) => {
        if (k === "") {
          const f: string[] = [];
          v.strings.forEach(s => {
            for (let i = 0; i < s.length; i++) {
              if (s[i] === s[i].toUpperCase() && s[i] !== s[i].toLowerCase()) {
                f.push(s);
                break;
              }
            }
          });
          return { strings: v.strings, filtered: f };
        }
        return v;
      });
      expect(parsed.filtered.length).assertEqual(2);
      expect(parsed.filtered[0]).assertEqual("Test");
    });
    /**
     * @tc.name   Json6Test002
     * @tc.number SUB_BUILTINS_Json6_TEST_0200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.name   Json6Test003
     * @tc.number SUB_BUILTINS_Json6_TEST_0300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.name   Json6Test004
     * @tc.number SUB_BUILTINS_Json6_TEST_0400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SentenceCompare = { words: ["I", "am", "happy"], sentence: "" };
      const json = JSON.stringify(obj);
      const parsed: SentenceCompare = JSON.parse(json, (k: string, v: SentenceCompare) => {
        if (k === "") {
          let s = "";
          for (let i = 0; i < v.words.length; i++) {
            s += v.words[i];
            if (i < v.words.length - 1) {
              s += " ";
            }
          }
          s += ".";
          return { words: v.words, sentence: s };
        }
        return v;
      });
      expect(parsed.sentence).assertEqual("I am happy.");
    });

    /**
     * @tc.name   Json6Test005
     * @tc.number SUB_BUILTINS_Json6_TEST_0500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: PriceRangeCompare = {
        products: [
          { name: "A", price: 15 },
          { name: "B", price: 25 },
          { name: "C", price: 35 }
        ],
        inRange: []
      };
      const json = JSON.stringify(obj);
      const parsed: PriceRangeCompare = JSON.parse(json, (k: string, v: PriceRangeCompare) => {
        if (k === "") {
          const r: Test5_Obj1[] = [];
          v.products.forEach(p => {
            if (p.price >= 20 && p.price <= 30) {
              r.push(p);
            }
          });
          return { products: v.products, inRange: r };
        }
        return v;
      });
      expect(parsed.inRange.length).assertEqual(1);
      expect(parsed.inRange[0].name).assertEqual("B");
      expect(parsed.inRange[0].price).assertEqual(25);
    });

    /**
     * @tc.name   Json6Test006
     * @tc.number SUB_BUILTINS_Json6_TEST_0600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: PercentCompare = { ratios: [0.12, 0.345], percentages: [] };
      const json = JSON.stringify(obj);
      const parsed: PercentCompare = JSON.parse(json, (k: string, v: PercentCompare) => {
        if (k === "") {
          const p: string[] = [];
          v.ratios.forEach(r => {
            p.push(Math.round(r * 100) + "%");
          });
          return { ratios: v.ratios, percentages: p };
        }
        return v;
      });
      expect(parsed.percentages[0]).assertEqual("12%");
      expect(parsed.percentages[1]).assertEqual("35%");
    });

    /**
     * @tc.name   Json6Test007
     * @tc.number SUB_BUILTINS_Json6_TEST_0700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CharFrequencyCompare = { strings: ["apple", "banana"], counts: [] };
      const json = JSON.stringify(obj);
      const parsed: CharFrequencyCompare = JSON.parse(json, (k: string, v: CharFrequencyCompare) => {
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
      expect(parsed.counts[0]).assertEqual(1);
      expect(parsed.counts[1]).assertEqual(3);
    });

    /**
     * @tc.name   Json6Test008
     * @tc.number SUB_BUILTINS_Json6_TEST_0800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: GroupCountCompare = {
        items: [
          { category: "A" },
          { category: "A" },
          { category: "B" }
        ],
        counts: []
      };
      const json = JSON.stringify(obj);
      const parsed: GroupCountCompare = JSON.parse(json, (k: string, v: GroupCountCompare) => {
        if (k === "") {
          const map: Record<string, number> = {};
          v.items.forEach(i => {
            map[i.category] = (map[i.category] || 0) + 1;
          });
          const c: Test8_Obj2[] = [];
          Object.keys(map).forEach(key => {
            c.push({ category: key, count: map[key] });
          });
          return { items: v.items, counts: c };
        }
        return v;
      });
      expect(parsed.counts.length).assertEqual(2);
      expect(parsed.counts.find(item => item.category === "A")?.count).assertEqual(2);
      expect(parsed.counts.find(item => item.category === "B")?.category).assertEqual("B");
    });

    /**
     * @tc.name   Json6Test009
     * @tc.number SUB_BUILTINS_Json6_TEST_0900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CumulativeSumCompare = { numbers: [1, 2, 3], sums: [] };
      const json = JSON.stringify(obj);
      const parsed: CumulativeSumCompare = JSON.parse(json, (k: string, v: CumulativeSumCompare) => {
        if (k === "") {
          const s: number[] = [];
          let total = 0;
          v.numbers.forEach(n => {
            total += n;
            s.push(total);
          });
          return { numbers: v.numbers, sums: s };
        }
        return v;
      });
      expect(parsed.sums[0]).assertEqual(1);
      expect(parsed.sums[1]).assertEqual(3);
      expect(parsed.sums[2]).assertEqual(6);
    });

    /**
     * @tc.name   Json6Test010
     * @tc.number SUB_BUILTINS_Json6_TEST_1000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: TruncateCompare = { strings: ["apple", "cat", "banana"], truncated: [] };
      const json = JSON.stringify(obj);
      const parsed: TruncateCompare = JSON.parse(json, (k: string, v: TruncateCompare) => {
        if (k === "") {
          const t: string[] = [];
          v.strings.forEach(s => {
            t.push(s.substring(0, 3));
          });
          return { strings: v.strings, truncated: t };
        }
        return v;
      });
      expect(parsed.truncated[0]).assertEqual("app");
      expect(parsed.truncated[1]).assertEqual("cat");
    });

    /**
     * @tc.name   Json6Test011
     * @tc.number SUB_BUILTINS_Json6_TEST_1100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: InStockCompare = {
        products: [
          { name: "A", quantity: 5 },
          { name: "B", quantity: 0 },
          { name: "C", quantity: 10 }
        ],
        inStock: []
      };
      const json = JSON.stringify(obj);
      const parsed: InStockCompare = JSON.parse(json, (k: string, v: InStockCompare) => {
        if (k === "") {
          const s: Test11_Obj1[] = [];
          v.products.forEach(p => {
            if (p.quantity > 0) {
              s.push(p);
            }
          });
          return { products: v.products, inStock: s };
        }
        return v;
      });
      expect(parsed.inStock.length).assertEqual(2);
      expect(parsed.inStock[1].name).assertEqual("C");
    });

    /**
     * @tc.name   Json6Test012
     * @tc.number SUB_BUILTINS_Json6_TEST_1200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: NumberToBoolCompare = { numbers: [0, 1, -5, 0], booleans: [] };
      const json = JSON.stringify(obj);
      const parsed: NumberToBoolCompare = JSON.parse(json, (k: string, v: NumberToBoolCompare) => {
        if (k === "") {
          const b: boolean[] = [];
          v.numbers.forEach(n => b.push(n !== 0));
          return { numbers: v.numbers, booleans: b };
        }
        return v;
      });
      expect(parsed.booleans[0]).assertEqual(false);
      expect(parsed.booleans[1]).assertEqual(true);
      expect(parsed.booleans[2]).assertEqual(true);
    });

    /**
     * @tc.name   Json6Test013
     * @tc.number SUB_BUILTINS_Json6_TEST_1300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: HasSubstringCompare = { strings: ["apple", "banana", "grape"], hasSub: [] };
      const json = JSON.stringify(obj);
      const parsed: HasSubstringCompare = JSON.parse(json, (k: string, v: HasSubstringCompare) => {
        if (k === "") {
          const h: boolean[] = [];
          v.strings.forEach(s => h.push(s.includes("ap")));
          return { strings: v.strings, hasSub: h };
        }
        return v;
      });
      expect(parsed.hasSub[0]).assertEqual(true);
      expect(parsed.hasSub[1]).assertEqual(false);
      expect(parsed.hasSub[2]).assertEqual(true);
    });

    /**
     * @tc.name   Json6Test014
     * @tc.number SUB_BUILTINS_Json6_TEST_1400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: TotalAmountCompare = {
        orders: [
          { id: 1, amount: 100 },
          { id: 2, amount: 200 }
        ],
        total: 0
      };
      const json = JSON.stringify(obj);
      const parsed: TotalAmountCompare = JSON.parse(json, (k: string, v: TotalAmountCompare) => {
        if (k === "") {
          let t = 0;
          v.orders.forEach(o => t += o.amount);
          return { orders: v.orders, total: t };
        }
        return v;
      });
      expect(parsed.total).assertEqual(300);
    });

    /**
     * @tc.name   Json6Test015
     * @tc.number SUB_BUILTINS_Json6_TEST_1500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: OddEvenClassifyCompare = { numbers: [1, 2, 3, 4], odd: [], even: [] };
      const json = JSON.stringify(obj);
      const parsed: OddEvenClassifyCompare = JSON.parse(json, (k: string, v: OddEvenClassifyCompare) => {
        if (k === "") {
          const o: number[] = [];
          const e: number[] = [];
          v.numbers.forEach(n => {
            if (n % 2 === 0) {
              e.push(n);
            } else {
              o.push(n);
            }
          });
          return { numbers: v.numbers, odd: o, even: e };
        }
        return v;
      });
      expect(parsed.odd.length).assertEqual(2);
      expect(parsed.even[0]).assertEqual(2);
      expect(parsed.odd[1]).assertEqual(3);
    });

    /**
     * @tc.name   Json6Test016
     * @tc.number SUB_BUILTINS_Json6_TEST_1600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ReversedLengthCompare = { strings: ["abc", "de"], reversed: [] };
      const json = JSON.stringify(obj);
      const parsed: ReversedLengthCompare = JSON.parse(json, (k: string, v: ReversedLengthCompare) => {
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
      expect(parsed.reversed.length).assertEqual(2);
      expect(parsed.reversed[0].length).assertEqual(3);
      expect(parsed.reversed[1]).assertEqual("ed");
    });

    /**
     * @tc.name   Json6Test017
     * @tc.number SUB_BUILTINS_Json6_TEST_1700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: RoleFilterCompare = {
        users: [
          { name: "A", role: "admin" },
          { name: "B", role: "user" },
          { name: "C", role: "admin" }
        ],
        admins: []
      };
      const json = JSON.stringify(obj);
      const parsed: RoleFilterCompare = JSON.parse(json, (k: string, v: RoleFilterCompare) => {
        if (k === "") {
          const a: Test17_Obj1[] = [];
          v.users.forEach(u => {
            if (u.role === "admin") {
              a.push(u);
            }
          });
          return { users: v.users, admins: a };
        }
        return v;
      });
      expect(parsed.admins.length).assertEqual(2);
      expect(parsed.admins[0].name).assertEqual("A");
    });

    /**
     * @tc.name   Json6Test018
     * @tc.number SUB_BUILTINS_Json6_TEST_1800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SqrtOfSquaresCompare = { numbers: [3, 4], result: 0 };
      const json = JSON.stringify(obj);
      const parsed: SqrtOfSquaresCompare = JSON.parse(json, (k: string, v: SqrtOfSquaresCompare) => {
        if (k === "") {
          let sum = 0;
          v.numbers.forEach(n => sum += n * n);
          return { numbers: v.numbers, result: Math.sqrt(sum) };
        }
        return v;
      });
      expect(parsed.result).assertEqual(5);
    });

    /**
     * @tc.name   Json6Test019
     * @tc.number SUB_BUILTINS_Json6_TEST_1900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: WrapStringsCompare = { strings: ["test", "case"], wrapped: [] };
      const json = JSON.stringify(obj);
      const parsed: WrapStringsCompare = JSON.parse(json, (k: string, v: WrapStringsCompare) => {
        if (k === "") {
          const w: string[] = [];
          v.strings.forEach(s => w.push(`[${s}]`));
          return { strings: v.strings, wrapped: w };
        }
        return v;
      });
      expect(parsed.wrapped[0]).assertEqual("[test]");
      expect(parsed.wrapped[1]).assertEqual("[case]");
    });

    /**
     * @tc.name   Json6Test020
     * @tc.number SUB_BUILTINS_Json6_TEST_2000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: Year2024FilterCompare = {
        events: [
          { name: "A", date: "2024-03-01" },
          { name: "B", date: "2023-12-31" },
          { name: "C", date: "2024-05-15" }
        ],
        filtered: []
      };
      const json = JSON.stringify(obj);
      const parsed: Year2024FilterCompare = JSON.parse(json, (k: string, v: Year2024FilterCompare) => {
        if (k === "") {
          const f: Test20_Obj1[] = [];
          v.events.forEach(e => {
            if (e.date.startsWith("2024-")) {
              f.push(e);
            }
          });
          return { events: v.events, filtered: f };
        }
        return v;
      });
      expect(parsed.filtered.length).assertEqual(2);
      expect(parsed.filtered[1].name).assertEqual("C");
    });

    /**
     * @tc.name   Json6Test021
     * @tc.number SUB_BUILTINS_Json6_TEST_2100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ThousandsFormatCompare = { numbers: [1234, 1234567], formatted: [] };
      const json = JSON.stringify(obj);
      const parsed: ThousandsFormatCompare = JSON.parse(json, (k: string, v: ThousandsFormatCompare) => {
        if (k === "") {
          const f: string[] = [];
          v.numbers.forEach(n => {
            let str = n.toString();
            let result = "";
            let count = 0;
            for (let i = str.length - 1; i >= 0; i--) {
              result = str[i] + result;
              count++;
              if (count % 3 === 0 && i !== 0) {
                result = "," + result;
              }
            }
            f.push(result);
          });
          return { numbers: v.numbers, formatted: f };
        }
        return v;
      });
      expect(parsed.formatted[0]).assertEqual("1,234");
      expect(parsed.formatted[1]).assertEqual("1,234,567");
    });

    /**
     * @tc.name   Json6Test022
     * @tc.number SUB_BUILTINS_Json6_TEST_2200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: IsEmptyCompare = { strings: ["", "test", "   "], isEmpty: [] };
      const json = JSON.stringify(obj);
      const parsed: IsEmptyCompare = JSON.parse(json, (k: string, v: IsEmptyCompare) => {
        if (k === "") {
          const e: boolean[] = [];
          v.strings.forEach(s => e.push(s.trim() === ""));
          return { strings: v.strings, isEmpty: e };
        }
        return v;
      });
      expect(parsed.isEmpty[0]).assertEqual(true);
      expect(parsed.isEmpty[1]).assertEqual(false);
      expect(parsed.isEmpty[2]).assertEqual(true);
    });

    /**
     * @tc.name   Json6Test023
     * @tc.number SUB_BUILTINS_Json6_TEST_2300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: AvgRatingCompare = {
        movies: [
          { title: "A", rating: 8 },
          { title: "B", rating: 6 },
          { title: "C", rating: 10 }
        ],
        avg: 0
      };
      const json = JSON.stringify(obj);
      const parsed: AvgRatingCompare = JSON.parse(json, (k: string, v: AvgRatingCompare) => {
        if (k === "") {
          let sum = 0;
          v.movies.forEach(m => sum += m.rating);
          return { movies: v.movies, avg: sum / v.movies.length };
        }
        return v;
      });
      expect(parsed.avg).assertEqual(8);
    });

    /**
     * @tc.name   Json6Test024
     * @tc.number SUB_BUILTINS_Json6_TEST_2400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: PrimeNumbersCompare = { numbers: [2, 4, 5, 9, 11], primes: [] };
      const json = JSON.stringify(obj);
      const parsed: PrimeNumbersCompare = JSON.parse(json, (k: string, v: PrimeNumbersCompare) => {
        if (k === "") {
          const p: number[] = [];
          v.numbers.forEach(n => {
            if (n <= 1) {
              return;
            }
            let isPrime = true;
            for (let i = 2; i < n; i++) {
              if (n % i === 0) {
                isPrime = false;
                break;
              }
            }
            if (isPrime) {
              p.push(n);
            }
          });
          return { numbers: v.numbers, primes: p };
        }
        return v;
      });
      expect(parsed.primes.length).assertEqual(3);
      expect(parsed.primes[0]).assertEqual(2);
      expect(parsed.primes[2]).assertEqual(11);
    });

    /**
     * @tc.name   Json6Test025
     * @tc.number SUB_BUILTINS_Json6_TEST_2500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: TitleCaseCompare = { strings: ["hello world", "typescript is fun"], titles: [] };
      const json = JSON.stringify(obj);
      const parsed: TitleCaseCompare = JSON.parse(json, (k: string, v: TitleCaseCompare) => {
        if (k === "") {
          const t: string[] = [];
          v.strings.forEach(s => {
            const words = s.split(" ");
            const titleWords: string[] = [];
            words.forEach(w => {
              titleWords.push(w.charAt(0).toUpperCase() + w.slice(1).toLowerCase());
            });
            t.push(titleWords.join(" "));
          });
          return { strings: v.strings, titles: t };
        }
        return v;
      });
      expect(parsed.titles[0]).assertEqual("Hello World");
      expect(parsed.titles[1]).assertEqual("Typescript Is Fun");
    });

    /**
     * @tc.name   Json6Test026
     * @tc.number SUB_BUILTINS_Json6_TEST_2600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: RotateFirstCharCompare = { strings: ["apple", "banana"], rotated: [] };
      const json = JSON.stringify(obj);
      const parsed: RotateFirstCharCompare = JSON.parse(json, (k: string, v: RotateFirstCharCompare) => {
        if (k === "") {
          const r: string[] = [];
          v.strings.forEach(s => {
            if (s.length === 0) {
              r.push("");
            } else {
              r.push(s.substring(1) + s.charAt(0));
            }
          });
          return { strings: v.strings, rotated: r };
        }
        return v;
      });
      expect(parsed.rotated[0]).assertEqual("pplea");
      expect(parsed.rotated[1]).assertEqual("ananab");
    });

    /**
     * @tc.name   Json6Test027
     * @tc.number SUB_BUILTINS_Json6_TEST_2700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: GCDCompare = { numbers: [12, 18, 24], gcd: 0 };
      const json = JSON.stringify(obj);
      const parsed: GCDCompare = JSON.parse(json, (k: string, v: GCDCompare) => {
        if (k === "") {
          const gcdTwo = (a: number, b: number): number => {
            while (b !== 0) {
              const temp = b;
              b = a % b;
              a = temp;
            }
            return a;
          };
          let gcd = v.numbers[0];
          for (let i = 1; i < v.numbers.length; i++) {
            gcd = gcdTwo(gcd, v.numbers[i]);
            if (gcd === 1) {
              break;
            }
          }
          return { numbers: v.numbers, gcd: gcd };
        }
        return v;
      });
      expect(parsed.gcd).assertEqual(6);
    });

    /**
     * @tc.name   Json6Test028
     * @tc.number SUB_BUILTINS_Json6_TEST_2800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ConsonantCountCompare = { strings: ["apple", "xyz"], counts: [] };
      const json = JSON.stringify(obj);
      const parsed: ConsonantCountCompare = JSON.parse(json, (k: string, v: ConsonantCountCompare) => {
        if (k === "") {
          const c: number[] = [];
          const vowels = ["a", "e", "i", "o", "u"];
          v.strings.forEach(s => {
            let count = 0;
            for (let i = 0; i < s.length; i++) {
              let isVowel = false;
              for (let j = 0; j < vowels.length; j++) {
                if (s[i].toLowerCase() === vowels[j]) {
                  isVowel = true;
                  break;
                }
              }
              if (!isVowel) {
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
      expect(parsed.counts[1]).assertEqual(3);
    });

    /**
     * @tc.name   Json6Test029
     * @tc.number SUB_BUILTINS_Json6_TEST_2900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: PrefixSuffixProductCompare = { numbers: [1, 2, 3, 4], products: [] };
      const json = JSON.stringify(obj);
      const parsed: PrefixSuffixProductCompare = JSON.parse(json, (k: string, v: PrefixSuffixProductCompare) => {
        if (k === "") {
          const prefix: number[] = [];
          const suffix: number[] = [];
          const p: number[] = [];
          let sum = 0;
          v.numbers.forEach(n => {
            sum += n;
            prefix.push(sum);
          });
          sum = 0;
          for (let i = v.numbers.length - 1; i >= 0; i--) {
            sum += v.numbers[i];
            suffix.unshift(sum);
          }
          for (let i = 0; i < prefix.length; i++) {
            p.push(prefix[i] * suffix[i]);
          }
          return { numbers: v.numbers, products: p };
        }
        return v;
      });
      expect(parsed.products[0]).assertEqual(1 * 10);
      expect(parsed.products[1]).assertEqual(3 * 9);
      expect(parsed.products[2]).assertEqual(6 * 7);
    });

    /**
     * @tc.name   Json6Test030
     * @tc.number SUB_BUILTINS_Json6_TEST_3000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FilteredMaxCompare = {
        sales: [
          { region: "West", amount: 500 },
          { region: "East", amount: 700 },
          { region: "West", amount: 600 }
        ],
        westMax: 0
      };
      const json = JSON.stringify(obj);
      const parsed: FilteredMaxCompare = JSON.parse(json, (k: string, v: FilteredMaxCompare) => {
        if (k === "") {
          let max = 0;
          let hasWest = false;
          v.sales.forEach(s => {
            if (s.region === "West") {
              if (!hasWest) {
                max = s.amount;
                hasWest = true;
              } else if (s.amount > max) {
                max = s.amount;
              }
            }
          });
          return { sales: v.sales, westMax: max };
        }
        return v;
      });
      expect(parsed.westMax).assertEqual(600);
    });

    /**
     * @tc.name   Json6Test031
     * @tc.number SUB_BUILTINS_Json6_TEST_3100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: LCMCompare = { numbers: [4, 6, 8], lcm: 0 };
      const json = JSON.stringify(obj);
      const parsed: LCMCompare = JSON.parse(json, (k: string, v: LCMCompare) => {
        if (k === "") {
          const gcd = (a: number, b: number): number => {
            while (b !== 0) {
              const t = b;
              b = a % b;
              a = t;
            }
            return a;
          };
          const lcmTwo = (a: number, b: number): number => a * b / gcd(a, b);

          let lcm = v.numbers[0];
          for (let i = 1; i < v.numbers.length; i++) {
            lcm = lcmTwo(lcm, v.numbers[i]);
          }
          return { numbers: v.numbers, lcm: lcm };
        }
        return v;
      });
      expect(parsed.lcm).assertEqual(24);
    });

    /**
     * @tc.name   Json6Test032
     * @tc.number SUB_BUILTINS_Json6_TEST_3200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: EndsWithCheckCompare = { strings: ["apple", "banana", "cat"], char: "t", results: [] };
      const json = JSON.stringify(obj);
      const parsed: EndsWithCheckCompare = JSON.parse(json, (k: string, v: EndsWithCheckCompare) => {
        if (k === "") {
          const r: boolean[] = [];
          v.strings.forEach(s => {
            const len = s.length;
            const lastChar = len > 0 ? s.substring(len - 1) : "";
            r.push(lastChar === v.char);
          });
          return { strings: v.strings, char: v.char, results: r };
        }
        return v;
      });
      expect(parsed.results[0]).assertEqual(false);
      expect(parsed.results[2]).assertEqual(true);
    });

    /**
     * @tc.name   Json6Test033
     * @tc.number SUB_BUILTINS_Json6_TEST_3300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: AsciiConvertCompare = { codes: [65, 97, 48], chars: [] };
      const json = JSON.stringify(obj);
      const parsed: AsciiConvertCompare = JSON.parse(json, (k: string, v: AsciiConvertCompare) => {
        if (k === "") {
          const c: string[] = [];
          v.codes.forEach(code => c.push(String.fromCharCode(code)));
          return { codes: v.codes, chars: c };
        }
        return v;
      });
      expect(parsed.chars[0]).assertEqual("A");
      expect(parsed.chars[1]).assertEqual("a");
      expect(parsed.chars[2]).assertEqual("0");
    });

    /**
     * @tc.name   Json6Test034
     * @tc.number SUB_BUILTINS_Json6_TEST_3400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: UniqueCharsCompare = { strings: ["aabcc", "defef"], unique: [] };
      const json = JSON.stringify(obj);
      const parsed: UniqueCharsCompare = JSON.parse(json, (k: string, v: UniqueCharsCompare) => {
        if (k === "") {
          const u: string[] = [];
          v.strings.forEach(s => {
            const chars: string[] = [];
            for (let i = 0; i < s.length; i++) {
              let exists = false;
              for (let j = 0; j < chars.length; j++) {
                if (chars[j] === s[i]) {
                  exists = true;
                  break;
                }
              }
              if (!exists) {
                chars.push(s[i]);
              }
            }
            u.push(chars.join(""));
          });
          return { strings: v.strings, unique: u };
        }
        return v;
      });
      expect(parsed.unique[0]).assertEqual("abc");
      expect(parsed.unique[1]).assertEqual("def");
    });

    /**
     * @tc.name   Json6Test035
     * @tc.number SUB_BUILTINS_Json6_TEST_3500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: BelowAvgPriceCompare = {
        products: [
          { name: "A", price: 10 },
          { name: "B", price: 20 },
          { name: "C", price: 30 }
        ],
        belowAvg: []
      };
      const json = JSON.stringify(obj);
      const parsed: BelowAvgPriceCompare = JSON.parse(json, (k: string, v: BelowAvgPriceCompare) => {
        if (k === "") {
          let sum = 0;
          v.products.forEach(p => sum += p.price);
          const avg = sum / v.products.length;
          const b: Test35_Obj1[] = [];
          v.products.forEach(p => {
            if (p.price < avg) {
              b.push(p);
            }
          });
          return { products: v.products, belowAvg: b };
        }
        return v;
      });
      expect(parsed.belowAvg.length).assertEqual(1);
      expect(parsed.belowAvg[0].name).assertEqual("A");
    });

    /**
     * @tc.name   Json6Test036
     * @tc.number SUB_BUILTINS_Json6_TEST_3600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: AdjacentProductCompare = { numbers: [2, 3, 4, 5], products: [] };
      const json = JSON.stringify(obj);
      const parsed: AdjacentProductCompare = JSON.parse(json, (k: string, v: AdjacentProductCompare) => {
        if (k === "") {
          const p: number[] = [];
          for (let i = 0; i < v.numbers.length - 1; i++) {
            p.push(v.numbers[i] * v.numbers[i + 1]);
          }
          return { numbers: v.numbers, products: p };
        }
        return v;
      });
      expect(parsed.products.length).assertEqual(3);
      expect(parsed.products[0]).assertEqual(6);
      expect(parsed.products[2]).assertEqual(20);
    });

    /**
     * @tc.name   Json6Test037
     * @tc.number SUB_BUILTINS_Json6_TEST_3700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: MiddleSubstringCompare = { strings: ["abcde", "abcdef", "ab"], middles: [] };
      const json = JSON.stringify(obj);
      const parsed: MiddleSubstringCompare = JSON.parse(json, (k: string, v: MiddleSubstringCompare) => {
        if (k === "") {
          const m: string[] = [];
          v.strings.forEach(s => {
            const len = s.length;
            if (len <= 2) {
              m.push("");
            } else {
              m.push(s.substring(1, len - 1));
            }
          });
          return { strings: v.strings, middles: m };
        }
        return v;
      });
      expect(parsed.middles[0]).assertEqual("bcd");
      expect(parsed.middles[1]).assertEqual("bcde");
      expect(parsed.middles[2]).assertEqual("");
    });

    /**
     * @tc.name   Json6Test038
     * @tc.number SUB_BUILTINS_Json6_TEST_3800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: MinValueIndexCompare = { numbers: [5, 2, 7, 2], min: 0, index: -1 };
      const json = JSON.stringify(obj);
      const parsed: MinValueIndexCompare = JSON.parse(json, (k: string, v: MinValueIndexCompare) => {
        if (k === "") {
          let minVal = v.numbers[0];
          let minIdx = 0;
          for (let i = 1; i < v.numbers.length; i++) {
            if (v.numbers[i] < minVal) {
              minVal = v.numbers[i];
              minIdx = i;
            }
          }
          return { numbers: v.numbers, min: minVal, index: minIdx };
        }
        return v;
      });
      expect(parsed.min).assertEqual(2);
      expect(parsed.index).assertEqual(1);
    });

    /**
     * @tc.name   Json6Test039
     * @tc.number SUB_BUILTINS_Json6_TEST_3900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ReverseCharsCompare = { strings: ["hello", "world"], reversed: [] };
      const json = JSON.stringify(obj);
      const parsed: ReverseCharsCompare = JSON.parse(json, (k: string, v: ReverseCharsCompare) => {
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
      expect(parsed.reversed[0]).assertEqual("olleh");
      expect(parsed.reversed[1]).assertEqual("dlrow");
    });

    /**
     * @tc.name   Json6Test040
     * @tc.number SUB_BUILTINS_Json6_TEST_4000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: NaturalLogCompare = { numbers: [1, Math.E, Math.E**2], logs: [] };
      const json = JSON.stringify(obj);
      const parsed: NaturalLogCompare = JSON.parse(json, (k: string, v: NaturalLogCompare) => {
        if (k === "") {
          const l: number[] = [];
          v.numbers.forEach(n => l.push(Math.log(n)));
          return { numbers: v.numbers, logs: l };
        }
        return v;
      });
      expect(parsed.logs[0]).assertEqual(0);
      expect(parsed.logs[1]).assertEqual(1);
      expect(parsed.logs[2]).assertEqual(2);
    });

    /**
     * @tc.name   Json6Test041
     * @tc.number SUB_BUILTINS_Json6_TEST_4100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SumOfSquaresCompare = { numbers: [1, 2, 3], sum: 0 };
      const json = JSON.stringify(obj);
      const parsed: SumOfSquaresCompare = JSON.parse(json, (k: string, v: SumOfSquaresCompare) => {
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
     * @tc.name   Json6Test042
     * @tc.number SUB_BUILTINS_Json6_TEST_4200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ReplaceSpaceCompare = { strings: ["hello world", "typescript is fun"], replaced: [] };
      const json = JSON.stringify(obj);
      const parsed: ReplaceSpaceCompare = JSON.parse(json, (k: string, v: ReplaceSpaceCompare) => {
        if (k === "") {
          const r: string[] = [];
          v.strings.forEach(s => {
            let newStr = "";
            for (let i = 0; i < s.length; i++) {
              newStr += s[i] === " " ? "_" : s[i];
            }
            r.push(newStr);
          });
          return { strings: v.strings, replaced: r };
        }
        return v;
      });
      expect(parsed.replaced[0]).assertEqual("hello_world");
      expect(parsed.replaced[1]).assertEqual("typescript_is_fun");
    });

    /**
     * @tc.name   Json6Test043
     * @tc.number SUB_BUILTINS_Json6_TEST_4300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ExponentialCompare = { numbers: [0, 1, Math.LN2], results: [] };
      const json = JSON.stringify(obj);
      const parsed: ExponentialCompare = JSON.parse(json, (k: string, v: ExponentialCompare) => {
        if (k === "") {
          const r: number[] = [];
          v.numbers.forEach(n => r.push(Math.exp(n)));
          return { numbers: v.numbers, results: r };
        }
        return v;
      });
      expect(parsed.results[0]).assertEqual(1);
      expect(parsed.results[1]).assertEqual(Math.E);
      expect(parsed.results[2]).assertEqual(2);
    });

    /**
     * @tc.name   Json6Test044
     * @tc.number SUB_BUILTINS_Json6_TEST_4400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: LowerCountCompare = { strings: ["AbcDE", "FGhiJ"], counts: [] };
      const json = JSON.stringify(obj);
      const parsed: LowerCountCompare = JSON.parse(json, (k: string, v: LowerCountCompare) => {
        if (k === "") {
          const c: number[] = [];
          v.strings.forEach(s => {
            let count = 0;
            for (let i = 0; i < s.length; i++) {
              const charCode = s.charCodeAt(i);
              if (charCode >= 97 && charCode <= 122) {
                count++;
              }
            }
            c.push(count);
          });
          return { strings: v.strings, counts: c };
        }
        return v;
      });
      expect(parsed.counts[0]).assertEqual(2);
      expect(parsed.counts[1]).assertEqual(2);
    });

    /**
     * @tc.name   Json6Test045
     * @tc.number SUB_BUILTINS_Json6_TEST_4500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: DateFormatCompare = {
        events: [
          { name: "A", date: "2024-03-01" },
          { name: "B", date: "2023-12-31" }
        ],
        formatted: []
      };
      const json = JSON.stringify(obj);
      const parsed: DateFormatCompare = JSON.parse(json, (k: string, v: DateFormatCompare) => {
        if (k === "") {
          const f: Test45_Obj1[] = [];
          v.events.forEach(e => {
            const parts = e.date.split("-");
            const formatted = parts[2] + "/" + parts[1] + "/" + parts[0];
            f.push({ name: e.name, date: formatted } as Test45_Obj1);
          });
          return { events: v.events, formatted: f };
        }
        return v;
      });
      expect(parsed.formatted[0].date).assertEqual("01/03/2024");
      expect(parsed.formatted[1].date).assertEqual("31/12/2023");
    });

    /**
     * @tc.name   Json6Test046
     * @tc.number SUB_BUILTINS_Json6_TEST_4600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: AboveAvgElementsCompare = { numbers: [1, 2, 3, 4, 5], aboveAvg: [] };
      const json = JSON.stringify(obj);
      const parsed: AboveAvgElementsCompare = JSON.parse(json, (k: string, v: AboveAvgElementsCompare) => {
        if (k === "") {
          let sum = 0;
          v.numbers.forEach(n => sum += n);
          const avg = sum / v.numbers.length;
          const a: number[] = [];
          v.numbers.forEach(n => {
            if (n > avg) {
              a.push(n);
            }
          });
          return { numbers: v.numbers, aboveAvg: a };
        }
        return v;
      });
      expect(parsed.aboveAvg.length).assertEqual(2);
      expect(parsed.aboveAvg[0]).assertEqual(4);
      expect(parsed.aboveAvg[1]).assertEqual(5);
    });

    /**
     * @tc.name   Json6Test047
     * @tc.number SUB_BUILTINS_Json6_TEST_4700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ProperCaseCompare = { strings: ["hElLo", "wORLD"], proper: [] };
      const json = JSON.stringify(obj);
      const parsed: ProperCaseCompare = JSON.parse(json, (k: string, v: ProperCaseCompare) => {
        if (k === "") {
          const p: string[] = [];
          v.strings.forEach(s => {
            if (s.length === 0) {
              p.push("");
              return;
            }
            let properStr = s.charAt(0).toUpperCase();
            for (let i = 1; i < s.length; i++) {
              properStr += s.charAt(i).toLowerCase();
            }
            p.push(properStr);
          });
          return { strings: v.strings, proper: p };
        }
        return v;
      });
      expect(parsed.proper[0]).assertEqual("Hello");
      expect(parsed.proper[1]).assertEqual("World");
    });

    /**
     * @tc.name   Json6Test048
     * @tc.number SUB_BUILTINS_Json6_TEST_4800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SineCompare = { angles: [0, Math.PI / 2, Math.PI], sines: [] };
      const json = JSON.stringify(obj);
      const parsed: SineCompare = JSON.parse(json, (k: string, v: SineCompare) => {
        if (k === "") {
          const s: number[] = [];
          v.angles.forEach(a => s.push(Math.sin(a)));
          return { angles: v.angles, sines: s };
        }
        return v;
      });
      expect(parsed.sines[0]).assertEqual(0);
      expect(parsed.sines[1]).assertEqual(1);
      expect(parsed.sines[2]).assertEqual(1.2246467991473532e-16);
    });

    /**
     * @tc.name   Json6Test049
     * @tc.number SUB_BUILTINS_Json6_TEST_4900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: IsAlphaCompare = { strings: ["abc", "a1b", "defg"], results: [] };
      const json = JSON.stringify(obj);
      const parsed: IsAlphaCompare = JSON.parse(json, (k: string, v: IsAlphaCompare) => {
        if (k === "") {
          const r: boolean[] = [];
          v.strings.forEach(s => {
            let isAlpha = true;
            for (let i = 0; i < s.length; i++) {
              const code = s.charCodeAt(i);
              const isUpper = code >= 65 && code <= 90;
              const isLower = code >= 97 && code <= 122;
              if (!isUpper && !isLower) {
                isAlpha = false;
                break;
              }
            }
            r.push(isAlpha);
          });
          return { strings: v.strings, results: r };
        }
        return v;
      });
      expect(parsed.results[0]).assertEqual(true);
      expect(parsed.results[1]).assertEqual(false);
      expect(parsed.results[2]).assertEqual(true);
    });

    /**
     * @tc.name   Json6Test050
     * @tc.number SUB_BUILTINS_Json6_TEST_5000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FilteredTotalCompare = {
        orders: [
          { status: "completed", amount: 100 },
          { status: "pending", amount: 200 },
          { status: "completed", amount: 150 }
        ],
        completedTotal: 0
      };
      const json = JSON.stringify(obj);
      const parsed: FilteredTotalCompare = JSON.parse(json, (k: string, v: FilteredTotalCompare) => {
        if (k === "") {
          let total = 0;
          v.orders.forEach(o => {
            if (o.status === "completed") {
              total += o.amount;
            }
          });
          return { orders: v.orders, completedTotal: total };
        }
        return v;
      });
      expect(parsed.completedTotal).assertEqual(250);
    });

    /**
     * @tc.name   Json6Test051
     * @tc.number SUB_BUILTINS_Json6_TEST_5100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SumOverMaxCompare = { numbers: [1, 2, 3, 4], ratio: 0 };
      const json = JSON.stringify(obj);
      const parsed: SumOverMaxCompare = JSON.parse(json, (k: string, v: SumOverMaxCompare) => {
        if (k === "") {
          let sum = 0;
          let max = v.numbers[0];
          v.numbers.forEach(n => {
            sum += n;
            if (n > max) {
              max = n;
            }
          });
          return { numbers: v.numbers, ratio: sum / max };
        }
        return v;
      });
      expect(parsed.ratio).assertEqual(10 / 4);
    });

    /**
     * @tc.name   Json6Test052
     * @tc.number SUB_BUILTINS_Json6_TEST_5200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SpecificCharCountCompare = { strings: ["apple", "banana", "grape"], char: "a", counts: [] };
      const json = JSON.stringify(obj);
      const parsed: SpecificCharCountCompare = JSON.parse(json, (k: string, v: SpecificCharCountCompare) => {
        if (k === "") {
          const c: number[] = [];
          v.strings.forEach(s => {
            let count = 0;
            for (let i = 0; i < s.length; i++) {
              if (s[i] === v.char) {
                count++;
              }
            }
            c.push(count);
          });
          return { strings: v.strings, char: v.char, counts: c };
        }
        return v;
      });
      expect(parsed.counts[0]).assertEqual(1);
      expect(parsed.counts[1]).assertEqual(3);
      expect(parsed.counts[2]).assertEqual(1);
    });

    /**
     * @tc.name   Json6Test053
     * @tc.number SUB_BUILTINS_Json6_TEST_5300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: PriceRangeCountCompare = {
        products: [
          { name: "A", price: 15 },
          { name: "B", price: 25 },
          { name: "C", price: 35 }
        ],
        range: [20, 30],
        count: 0
      };
      const json = JSON.stringify(obj);
      const parsed: PriceRangeCountCompare = JSON.parse(json, (k: string, v: PriceRangeCountCompare) => {
        if (k === "") {
          let cnt = 0;
          v.products.forEach(p => {
            if (p.price >= v.range[0] && p.price <= v.range[1]) {
              cnt++;
            }
          });
          return { products: v.products, range: v.range, count: cnt };
        }
        return v;
      });
      expect(parsed.count).assertEqual(1);
    });

    /**
     * @tc.name   Json6Test054
     * @tc.number SUB_BUILTINS_Json6_TEST_5400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SumOfSquareRootsCompare = { numbers: [9, 16, 25], sum: 0 };
      const json = JSON.stringify(obj);
      const parsed: SumOfSquareRootsCompare = JSON.parse(json, (k: string, v: SumOfSquareRootsCompare) => {
        if (k === "") {
          let s = 0;
          v.numbers.forEach(n => s += Math.sqrt(n));
          return { numbers: v.numbers, sum: s };
        }
        return v;
      });
      expect(parsed.sum).assertEqual(12);
    });

    /**
     * @tc.name   Json6Test055
     * @tc.number SUB_BUILTINS_Json6_TEST_5500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: StartsWithCheckCompare = { strings: ["apple", "app", "application"], prefix: "app", results: [] };
      const json = JSON.stringify(obj);
      const parsed: StartsWithCheckCompare = JSON.parse(json, (k: string, v: StartsWithCheckCompare) => {
        if (k === "") {
          const r: boolean[] = [];
          const prefixLen = v.prefix.length;
          v.strings.forEach(s => {
            if (s.length < prefixLen) {
              r.push(false);
              return;
            }
            let match = true;
            for (let i = 0; i < prefixLen; i++) {
              if (s[i] !== v.prefix[i]) {
                match = false;
                break;
              }
            }
            r.push(match);
          });
          return { strings: v.strings, prefix: v.prefix, results: r };
        }
        return v;
      });
      expect(parsed.results[0]).assertEqual(true);
      expect(parsed.results[1]).assertEqual(true);
    });

    /**
     * @tc.name   Json6Test056
     * @tc.number SUB_BUILTINS_Json6_TEST_5600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: MonthNameCompare = { months: [1, 6, 12], names: [] };
      const json = JSON.stringify(obj);
      const parsed: MonthNameCompare = JSON.parse(json, (k: string, v: MonthNameCompare) => {
        if (k === "") {
          const monthNames = ["January", "February", "March", "April", "May", "June",
            "July", "August", "September", "October", "November", "December"];
          const n: string[] = [];
          v.months.forEach(m => {
            n.push(monthNames[m - 1]);
          });
          return { months: v.months, names: n };
        }
        return v;
      });
      expect(parsed.names[0]).assertEqual("January");
      expect(parsed.names[1]).assertEqual("June");
      expect(parsed.names[2]).assertEqual("December");
    });

    /**
     * @tc.name   Json6Test057
     * @tc.number SUB_BUILTINS_Json6_TEST_5700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: HighRatingFilterCompare = {
        movies: [
          { title: "A", rating: 7.5 },
          { title: "B", rating: 8.2 },
          { title: "C", rating: 6.9 }
        ],
        threshold: 7.0,
        highRated: []
      };
      const json = JSON.stringify(obj);
      const parsed: HighRatingFilterCompare = JSON.parse(json, (k: string, v: HighRatingFilterCompare) => {
        if (k === "") {
          const h: Test57_Obj1[] = [];
          v.movies.forEach(m => {
            if (m.rating > v.threshold) {
              h.push(m);
            }
          });
          return { movies: v.movies, threshold: v.threshold, highRated: h };
        }
        return v;
      });
      expect(parsed.highRated.length).assertEqual(2);
      expect(parsed.highRated[0].title).assertEqual("A");
    });

    /**
     * @tc.name   Json6Test058
     * @tc.number SUB_BUILTINS_Json6_TEST_5800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CosineCompare = { angles: [0, Math.PI / 2, Math.PI], cosines: [] };
      const json = JSON.stringify(obj);
      const parsed: CosineCompare = JSON.parse(json, (k: string, v: CosineCompare) => {
        if (k === "") {
          const c: number[] = [];
          v.angles.forEach(a => c.push(Math.cos(a)));
          return { angles: v.angles, cosines: c };
        }
        return v;
      });
      expect(parsed.cosines[0]).assertEqual(1);
      expect(parsed.cosines[1]).assertEqual(6.123233995736766e-17);
      expect(parsed.cosines[2]).assertEqual(-1);
    });

    /**
     * @tc.name   Json6Test059
     * @tc.number SUB_BUILTINS_Json6_TEST_5900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ReplaceAtPositionCompare = {
        strings: ["apple", "banana"],
        position: 1,
        char: "*",
        replaced: []
      };
      const json = JSON.stringify(obj);
      const parsed: ReplaceAtPositionCompare = JSON.parse(json, (k: string, v: ReplaceAtPositionCompare) => {
        if (k === "") {
          const r: string[] = [];
          v.strings.forEach(s => {
            if (v.position < 0 || v.position >= s.length) {
              r.push(s);
              return;
            }
            let newStr = "";
            for (let i = 0; i < s.length; i++) {
              newStr += i === v.position ? v.char : s[i];
            }
            r.push(newStr);
          });
          return {
            strings: v.strings,
            position: v.position,
            char: v.char,
            replaced: r
          };
        }
        return v;
      });
      expect(parsed.replaced[0]).assertEqual("a*ple");
      expect(parsed.replaced[1]).assertEqual("b*nana");
    });

    /**
     * @tc.name   Json6Test060
     * @tc.number SUB_BUILTINS_Json6_TEST_6000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: EvenSquareSumCompare = { numbers: [1, 2, 3, 4, 5], sum: 0 };
      const json = JSON.stringify(obj);
      const parsed: EvenSquareSumCompare = JSON.parse(json, (k: string, v: EvenSquareSumCompare) => {
        if (k === "") {
          let s = 0;
          v.numbers.forEach(n => {
            if (n % 2 === 0) {
              s += n * n;
            }
          });
          return { numbers: v.numbers, sum: s };
        }
        return v;
      });
      expect(parsed.sum).assertEqual(20);
    });

    /**
     * @tc.name   Json6Test061
     * @tc.number SUB_BUILTINS_Json6_TEST_6100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: HasConsecutiveCharsCompare = { strings: ["apple", "banana", "test"], results: [] };
      const json = JSON.stringify(obj);
      const parsed: HasConsecutiveCharsCompare = JSON.parse(json, (k: string, v: HasConsecutiveCharsCompare) => {
        if (k === "") {
          const r: boolean[] = [];
          v.strings.forEach(s => {
            let hasConsecutive = false;
            for (let i = 0; i < s.length - 1; i++) {
              if (s[i] === s[i + 1]) {
                hasConsecutive = true;
                break;
              }
            }
            r.push(hasConsecutive);
          });
          return { strings: v.strings, results: r };
        }
        return v;
      });
      expect(parsed.results[0]).assertEqual(true);
      expect(parsed.results[1]).assertEqual(false);
      expect(parsed.results[2]).assertEqual(false);
    });

    /**
     * @tc.name   Json6Test062
     * @tc.number SUB_BUILTINS_Json6_TEST_6200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: DateTopNCompare = {
        events: [
          { name: "B", date: "2024-03-01" },
          { name: "A", date: "2024-04-15" },
          { name: "C", date: "2024-02-20" }
        ],
        n: 2,
        latest: []
      };
      const json = JSON.stringify(obj);
      const parsed: DateTopNCompare = JSON.parse(json, (k: string, v: DateTopNCompare) => {
        if (k === "") {
          const temp: Test68_Obj1[] = [];
          v.events.forEach(e => temp.push(e));
          for (let i = 0; i < temp.length; i++) {
            for (let j = i + 1; j < temp.length; j++) {
              if (temp[i].date < temp[j].date) {
                const t = temp[i];
                temp[i] = temp[j];
                temp[j] = t;
              }
            }
          }
          const l: Test68_Obj1[] = [];
          for (let i = 0; i < Math.min(v.n, temp.length); i++) {
            l.push(temp[i]);
          }

          return { events: v.events, n: v.n, latest: l };
        }
        return v;
      });
      expect(parsed.latest.length).assertEqual(2);
      expect(parsed.latest[0].name).assertEqual("A");
    });

    /**
     * @tc.name   Json6Test063
     * @tc.number SUB_BUILTINS_Json6_TEST_6300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: TangentCompare = { angles: [0, Math.PI / 4, Math.PI / 2 - 0.0001], tangents: [] };
      const json = JSON.stringify(obj);
      const parsed: TangentCompare = JSON.parse(json, (k: string, v: TangentCompare) => {
        if (k === "") {
          const t: number[] = [];
          v.angles.forEach(a => t.push(Math.tan(a)));
          return { angles: v.angles, tangents: t };
        }
        return v;
      });
      expect(parsed.tangents[0]).assertEqual(0);
      expect(parsed.tangents[1]).assertClose(1, 1);
    });

    /**
     * @tc.name   Json6Test064
     * @tc.number SUB_BUILTINS_Json6_TEST_6400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: NonAlphaCountCompare = { strings: ["a1b!", "hello?", "pure"], counts: [] };
      const json = JSON.stringify(obj);
      const parsed: NonAlphaCountCompare = JSON.parse(json, (k: string, v: NonAlphaCountCompare) => {
        if (k === "") {
          const c: number[] = [];
          v.strings.forEach(s => {
            let count = 0;
            for (let i = 0; i < s.length; i++) {
              const code = s.charCodeAt(i);
              const isUpper = code >= 65 && code <= 90;
              const isLower = code >= 97 && code <= 122;
              if (!isUpper && !isLower) {
                count++;
              }
            }
            c.push(count);
          });
          return { strings: v.strings, counts: c };
        }
        return v;
      });
      expect(parsed.counts[0]).assertEqual(2);
      expect(parsed.counts[1]).assertEqual(1);
      expect(parsed.counts[2]).assertEqual(0);
    });

    /**
     * @tc.name   Json6Test065
     * @tc.number SUB_BUILTINS_Json6_TEST_6500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: AsciiSortCompare = { strings: ["cab", "fed"], sorted: [] };
      const json = JSON.stringify(obj);
      const parsed: AsciiSortCompare = JSON.parse(json, (k: string, v: AsciiSortCompare) => {
        if (k === "") {
          const s: string[] = [];
          v.strings.forEach(str => {
            const chars: string[] = [];
            for (let i = 0; i < str.length; i++) {
              chars.push(str[i]);
            }
            for (let i = 0; i < chars.length; i++) {
              for (let j = i + 1; j < chars.length; j++) {
                if (chars[i].charCodeAt(0) > chars[j].charCodeAt(0)) {
                  const temp = chars[i];
                  chars[i] = chars[j];
                  chars[j] = temp;
                }
              }
            }
            s.push(chars.join(""));
          });
          return { strings: v.strings, sorted: s };
        }
        return v;
      });
      expect(parsed.sorted[0]).assertEqual("abc");
      expect(parsed.sorted[1]).assertEqual("def");
    });

    /**
     * @tc.name   Json6Test066
     * @tc.number SUB_BUILTINS_Json6_TEST_6600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SumOfAbsCompare = { numbers: [-1, 2, -3, 4], sum: 0 };
      const json = JSON.stringify(obj);
      const parsed: SumOfAbsCompare = JSON.parse(json, (k: string, v: SumOfAbsCompare) => {
        if (k === "") {
          let s = 0;
          v.numbers.forEach(n => s += Math.abs(n));
          return { numbers: v.numbers, sum: s };
        }
        return v;
      });
      expect(parsed.sum).assertEqual(10);
    });

    /**
     * @tc.name   Json6Test067
     * @tc.number SUB_BUILTINS_Json6_TEST_6700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: IsNumericCompare = { strings: ["123", "12.3", "abc"], results: [] };
      const json = JSON.stringify(obj);
      const parsed: IsNumericCompare = JSON.parse(json, (k: string, v: IsNumericCompare) => {
        if (k === "") {
          const r: boolean[] = [];
          v.strings.forEach(s => {
            let isNum = true;
            let hasDot = false;
            for (let i = 0; i < s.length; i++) {
              const code = s.charCodeAt(i);
              if (code >= 48 && code <= 57) {
                continue;
              }
              if (code === 46 && !hasDot) {
                hasDot = true;
                continue;
              }
              isNum = false;
              break;
            }
            r.push(isNum);
          });
          return { strings: v.strings, results: r };
        }
        return v;
      });
      expect(parsed.results[0]).assertEqual(true);
      expect(parsed.results[1]).assertEqual(true);
      expect(parsed.results[2]).assertEqual(false);
    });

    /**
     * @tc.name   Json6Test068
     * @tc.number SUB_BUILTINS_Json6_TEST_6800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ExpCompare = { numbers: [0, 1, Math.LN2], results: [] };
      const json = JSON.stringify(obj);
      const parsed: ExpCompare = JSON.parse(json, (k: string, v: ExpCompare) => {
        if (k === "") {
          const r: number[] = [];
          v.numbers.forEach(n => r.push(Math.exp(n)));
          return { numbers: v.numbers, results: r };
        }
        return v;
      });
      expect(parsed.results[0]).assertEqual(1);
      expect(parsed.results[1]).assertClose(Math.E, 1);
      expect(parsed.results[2]).assertEqual(2);
    });

    /**
     * @tc.name   Json6Test069
     * @tc.number SUB_BUILTINS_Json6_TEST_6900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SwapFirstLastCompare = { strings: ["apple", "banana", "a"], swapped: [] };
      const json = JSON.stringify(obj);
      const parsed: SwapFirstLastCompare = JSON.parse(json, (k: string, v: SwapFirstLastCompare) => {
        if (k === "") {
          const s: string[] = [];
          v.strings.forEach(str => {
            if (str.length <= 1) {
              s.push(str);
              return;
            }
            const first = str[0];
            const last = str[str.length - 1];
            let middle = "";
            for (let i = 1; i < str.length - 1; i++) {
              middle += str[i];
            }
            s.push(last + middle + first);
          });
          return { strings: v.strings, swapped: s };
        }
        return v;
      });
      expect(parsed.swapped[0]).assertEqual("eppla");
      expect(parsed.swapped[1]).assertEqual("aananb");
    });

    /**
     * @tc.name   Json6Test070
     * @tc.number SUB_BUILTINS_Json6_TEST_7000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SquareCubeSumCompare = { numbers: [2, 3], results: [] };
      const json = JSON.stringify(obj);
      const parsed: SquareCubeSumCompare = JSON.parse(json, (k: string, v: SquareCubeSumCompare) => {
        if (k === "") {
          const r: number[] = [];
          v.numbers.forEach(n => r.push(n * n + n * n * n));
          return { numbers: v.numbers, results: r };
        }
        return v;
      });
      expect(parsed.results[0]).assertEqual(12);
      expect(parsed.results[1]).assertEqual(36);
    });

    /**
     * @tc.name   Json6Test071
     * @tc.number SUB_BUILTINS_Json6_TEST_7100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: IsEmailCompare = { strings: ["test@example.com", "invalid-email", "user@domain"], results: [] };
      const json = JSON.stringify(obj);
      const parsed: IsEmailCompare = JSON.parse(json, (k: string, v: IsEmailCompare) => {
        if (k === "") {
          const r: boolean[] = [];
          v.strings.forEach(s => {
            let hasAt = false;
            let atIndex = -1;
            for (let i = 0; i < s.length; i++) {
              if (s[i] === "@") {
                if (hasAt) {
                  hasAt = false;
                  break;
                }
                hasAt = true;
                atIndex = i;
              }
            }
            const isValid = hasAt && atIndex > 0 && atIndex < s.length - 1;
            r.push(isValid);
          });
          return { strings: v.strings, results: r };
        }
        return v;
      });
      expect(parsed.results[0]).assertEqual(true);
      expect(parsed.results[1]).assertEqual(false);
      expect(parsed.results[2]).assertEqual(true);
    });

    /**
     * @tc.name   Json6Test072
     * @tc.number SUB_BUILTINS_Json6_TEST_7200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: GeometricMeanCompare = { numbers: [2, 8], mean: 0 };
      const json = JSON.stringify(obj);
      const parsed: GeometricMeanCompare = JSON.parse(json, (k: string, v: GeometricMeanCompare) => {
        if (k === "") {
          let product = 1;
          v.numbers.forEach(n => product *= n);
          const mean = Math.pow(product, 1 / v.numbers.length);
          return { numbers: v.numbers, mean: mean };
        }
        return v;
      });
      expect(parsed.mean).assertEqual(4);
    });

    /**
     * @tc.name   Json6Test073
     * @tc.number SUB_BUILTINS_Json6_TEST_7300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: UpperCaseCountCompare = { strings: ["AbCdE", "FGhiJ", "klmno"], counts: [] };
      const json = JSON.stringify(obj);
      const parsed: UpperCaseCountCompare = JSON.parse(json, (k: string, v: UpperCaseCountCompare) => {
        if (k === "") {
          const c: number[] = [];
          v.strings.forEach(s => {
            let count = 0;
            for (let i = 0; i < s.length; i++) {
              const code = s.charCodeAt(i);
              if (code >= 65 && code <= 90) {
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
      expect(parsed.counts[1]).assertEqual(3);
      expect(parsed.counts[2]).assertEqual(0);
    });

    /**
     * @tc.name   Json6Test074
     * @tc.number SUB_BUILTINS_Json6_TEST_7400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: AboveAvgProductsCompare = {
        products: [
          { name: "A", price: 10 },
          { name: "B", price: 20 },
          { name: "C", price: 30 }
        ],
        aboveAvg: []
      };
      const json = JSON.stringify(obj);
      const parsed: AboveAvgProductsCompare = JSON.parse(json, (k: string, v: AboveAvgProductsCompare) => {
        if (k === "") {
          let sum = 0;
          v.products.forEach(p => sum += p.price);
          const avg = sum / v.products.length;
          const a: Test74_Obj1[] = [];
          v.products.forEach(p => {
            if (p.price > avg) {
              a.push(p);
            }
          });
          return { products: v.products, aboveAvg: a };
        }
        return v;
      });
      expect(parsed.aboveAvg.length).assertEqual(1);
      expect(parsed.aboveAvg[0].name).assertEqual("C");
    });

    /**
     * @tc.name   Json6Test075
     * @tc.number SUB_BUILTINS_Json6_TEST_7500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SumOfSquaredDiffsCompare = { numbers: [1, 2, 3, 4], sum: 0 };
      const json = JSON.stringify(obj);
      const parsed: SumOfSquaredDiffsCompare = JSON.parse(json, (k: string, v: SumOfSquaredDiffsCompare) => {
        if (k === "") {
          let sum = 0;
          const avg = v.numbers.reduce((a, b) => a + b, 0) / v.numbers.length;
          v.numbers.forEach(n => sum += Math.pow(n - avg, 2));
          return { numbers: v.numbers, sum: sum };
        }
        return v;
      });
      expect(parsed.sum).assertEqual(5);
    });

    /**
     * @tc.name   Json6Test076
     * @tc.number SUB_BUILTINS_Json6_TEST_7600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ContainsSubstringCompare = { strings: ["apple", "pineapple", "grape"], substring: "app", results: [] };
      const json = JSON.stringify(obj);
      const parsed: ContainsSubstringCompare = JSON.parse(json, (k: string, v: ContainsSubstringCompare) => {
        if (k === "") {
          const r: boolean[] = [];
          const subLen = v.substring.length;
          v.strings.forEach(s => {
            let found = false;
            for (let i = 0; i <= s.length - subLen; i++) {
              let match = true;
              for (let j = 0; j < subLen; j++) {
                if (s[i + j] !== v.substring[j]) {
                  match = false;
                  break;
                }
              }
              if (match) {
                found = true;
                break;
              }
            }
            r.push(found);
          });
          return { strings: v.strings, substring: v.substring, results: r };
        }
        return v;
      });
      expect(parsed.results[0]).assertEqual(true);
      expect(parsed.results[1]).assertEqual(true);
      expect(parsed.results[2]).assertEqual(false);
    });

    /**
     * @tc.name   Json6Test077
     * @tc.number SUB_BUILTINS_Json6_TEST_7700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: WeekdayNameCompare = { weekdays: [0, 3, 6], names: [] };
      const json = JSON.stringify(obj);
      const parsed: WeekdayNameCompare = JSON.parse(json, (k: string, v: WeekdayNameCompare) => {
        if (k === "") {
          const weekdayNames = ["Sunday", "Monday", "Tuesday", "Wednesday",
            "Thursday", "Friday", "Saturday"];
          const n: string[] = [];
          v.weekdays.forEach(d => n.push(weekdayNames[d]));
          return { weekdays: v.weekdays, names: n };
        }
        return v;
      });
      expect(parsed.names[0]).assertEqual("Sunday");
      expect(parsed.names[1]).assertEqual("Wednesday");
      expect(parsed.names[2]).assertEqual("Saturday");
    });

    /**
     * @tc.name   Json6Test078
     * @tc.number SUB_BUILTINS_Json6_TEST_7800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ReverseSortCharsCompare = { strings: ["cab", "fed"], sorted: [] };
      const json = JSON.stringify(obj);
      const parsed: ReverseSortCharsCompare = JSON.parse(json, (k: string, v: ReverseSortCharsCompare) => {
        if (k === "") {
          const s: string[] = [];
          v.strings.forEach(str => {
            const chars: string[] = [];
            for (let i = 0; i < str.length; i++) {
              chars.push(str[i]);
            }
            for (let i = 0; i < chars.length; i++) {
              for (let j = i + 1; j < chars.length; j++) {
                if (chars[i].charCodeAt(0) < chars[j].charCodeAt(0)) {
                  const temp = chars[i];
                  chars[i] = chars[j];
                  chars[j] = temp;
                }
              }
            }
            s.push(chars.join(""));
          });
          return { strings: v.strings, sorted: s };
        }
        return v;
      });
      expect(parsed.sorted[0]).assertEqual("cba");
      expect(parsed.sorted[1]).assertEqual("fed");
    });

    /**
     * @tc.name   Json6Test079
     * @tc.number SUB_BUILTINS_Json6_TEST_7900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SinhCompare = { numbers: [0, Math.log(2 + Math.sqrt(3))], results: [] };
      const json = JSON.stringify(obj);
      const parsed: SinhCompare = JSON.parse(json, (k: string, v: SinhCompare) => {
        if (k === "") {
          const r: number[] = [];
          v.numbers.forEach(n => r.push(Math.sinh(n)));
          return { numbers: v.numbers, results: r };
        }
        return v;
      });
      expect(parsed.results[0]).assertEqual(0);
      expect(parsed.results[1]).assertClose(1.732, 1);
    });

    /**
     * @tc.name   Json6Test080
     * @tc.number SUB_BUILTINS_Json6_TEST_8000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ReplaceSubstringCompare = {
        strings: ["apple", "pineapple"],
        from: "app",
        to: "xyz",
        replaced: []
      };
      const json = JSON.stringify(obj);
      const parsed: ReplaceSubstringCompare = JSON.parse(json, (k: string, v: ReplaceSubstringCompare) => {
        if (k === "") {
          const r: string[] = [];
          const fromLen = v.from.length;
          v.strings.forEach(s => {
            let newStr = "";
            let i = 0;
            while (i <= s.length - fromLen) {
              let match = true;
              for (let j = 0; j < fromLen; j++) {
                if (s[i + j] !== v.from[j]) {
                  match = false;
                  break;
                }
              }
              if (match) {
                newStr += v.to;
                i += fromLen;
              } else {
                newStr += s[i];
                i++;
              }
            }
            while (i < s.length) {
              newStr += s[i];
              i++;
            }
            r.push(newStr);
          });
          return {
            strings: v.strings,
            from: v.from,
            to: v.to,
            replaced: r
          };
        }
        return v;
      });
      expect(parsed.replaced[0]).assertEqual("xyzle");
      expect(parsed.replaced[1]).assertEqual("pinexyzle");
    });

    /**
     * @tc.name   Json6Test081
     * @tc.number SUB_BUILTINS_Json6_TEST_8100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: OddProductCompare = { numbers: [1, 2, 3, 4, 5], product: 1 };
      const json = JSON.stringify(obj);
      const parsed: OddProductCompare = JSON.parse(json, (k: string, v: OddProductCompare) => {
        if (k === "") {
          let p = 1;
          v.numbers.forEach(n => {
            if (n % 2 === 1) {
              p *= n;
            }
          });
          return { numbers: v.numbers, product: p };
        }
        return v;
      });
      expect(parsed.product).assertEqual(15);
    });

    /**
     * @tc.name   Json6Test082
     * @tc.number SUB_BUILTINS_Json6_TEST_8200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: IsPalindromeCompare = { strings: ["madam", "hello", "racecar"], results: [] };
      const json = JSON.stringify(obj);
      const parsed: IsPalindromeCompare = JSON.parse(json, (k: string, v: IsPalindromeCompare) => {
        if (k === "") {
          const r: boolean[] = [];
          v.strings.forEach(s => {
            let isPalin = true;
            for (let i = 0; i < Math.floor(s.length / 2); i++) {
              if (s[i] !== s[s.length - 1 - i]) {
                isPalin = false;
                break;
              }
            }
            r.push(isPalin);
          });
          return { strings: v.strings, results: r };
        }
        return v;
      });
      expect(parsed.results[0]).assertEqual(true);
      expect(parsed.results[1]).assertEqual(false);
      expect(parsed.results[2]).assertEqual(true);
    });

    /**
     * @tc.name   Json6Test083
     * @tc.number SUB_BUILTINS_Json6_TEST_8300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CoshCompare = { numbers: [0, Math.log(1 + Math.sqrt(2))], results: [] };
      const json = JSON.stringify(obj);
      const parsed: CoshCompare = JSON.parse(json, (k: string, v: CoshCompare) => {
        if (k === "") {
          const r: number[] = [];
          v.numbers.forEach(n => r.push(Math.cosh(n)));
          return { numbers: v.numbers, results: r };
        }
        return v;
      });
      expect(parsed.results[0]).assertEqual(1);
      expect(parsed.results[1]).assertClose(1.414, 1);
    });

    /**
     * @tc.name   Json6Test084
     * @tc.number SUB_BUILTINS_Json6_TEST_8400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SpaceCountCompare = { strings: ["hello world", "  test  case  ", "nospaces"], counts: [] };
      const json = JSON.stringify(obj);
      const parsed: SpaceCountCompare = JSON.parse(json, (k: string, v: SpaceCountCompare) => {
        if (k === "") {
          const c: number[] = [];
          v.strings.forEach(s => {
            let count = 0;
            for (let i = 0; i < s.length; i++) {
              if (s[i] === " ") {
                count++;
              }
            }
            c.push(count);
          });
          return { strings: v.strings, counts: c };
        }
        return v;
      });
      expect(parsed.counts[0]).assertEqual(1);
      expect(parsed.counts[1]).assertEqual(6);
      expect(parsed.counts[2]).assertEqual(0);
    });

    /**
     * @tc.name   Json6Test085
     * @tc.number SUB_BUILTINS_Json6_TEST_8500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: HarmonicMeanCompare = { numbers: [2, 3, 6], mean: 0 };
      const json = JSON.stringify(obj);
      const parsed: HarmonicMeanCompare = JSON.parse(json, (k: string, v: HarmonicMeanCompare) => {
        if (k === "") {
          let sum = 0;
          v.numbers.forEach(n => sum += 1 / n);
          const mean = v.numbers.length / sum;
          return { numbers: v.numbers, mean: mean };
        }
        return v;
      });
      expect(parsed.mean).assertEqual(3.0000000000000004);
    });

    /**
     * @tc.name   Json6Test086
     * @tc.number SUB_BUILTINS_Json6_TEST_8600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: AlternateCaseCompare = { strings: ["hello", "world"], alternated: [] };
      const json = JSON.stringify(obj);
      const parsed: AlternateCaseCompare = JSON.parse(json, (k: string, v: AlternateCaseCompare) => {
        if (k === "") {
          const a: string[] = [];
          v.strings.forEach(s => {
            let result = "";
            for (let i = 0; i < s.length; i++) {
              result += i % 2 === 0
                ? s[i].toUpperCase()
                : s[i].toLowerCase();
            }
            a.push(result);
          });
          return { strings: v.strings, alternated: a };
        }
        return v;
      });
      expect(parsed.alternated[0]).assertEqual("HeLlO");
      expect(parsed.alternated[1]).assertEqual("WoRlD");
    });

    /**
     * @tc.name   Json6Test087
     * @tc.number SUB_BUILTINS_Json6_TEST_8700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: AcosCompare = { numbers: [1, 0, -1], results: [] };
      const json = JSON.stringify(obj);
      const parsed: AcosCompare = JSON.parse(json, (k: string, v: AcosCompare) => {
        if (k === "") {
          const r: number[] = [];
          v.numbers.forEach(n => r.push(Math.acos(n)));
          return { numbers: v.numbers, results: r };
        }
        return v;
      });
      expect(parsed.results[0]).assertEqual(0);
      expect(parsed.results[1]).assertClose(Math.PI / 2, 1);
      expect(parsed.results[2]).assertClose(Math.PI, 1);
    });

    /**
     * @tc.name   Json6Test088
     * @tc.number SUB_BUILTINS_Json6_TEST_8800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: HasDigitCompare = { strings: ["abc123", "no digits", "456test"], results: [] };
      const json = JSON.stringify(obj);
      const parsed: HasDigitCompare = JSON.parse(json, (k: string, v: HasDigitCompare) => {
        if (k === "") {
          const r: boolean[] = [];
          v.strings.forEach(s => {
            let hasDigit = false;
            for (let i = 0; i < s.length; i++) {
              const code = s.charCodeAt(i);
              if (code >= 48 && code <= 57) {
                hasDigit = true;
                break;
              }
            }
            r.push(hasDigit);
          });
          return { strings: v.strings, results: r };
        }
        return v;
      });
      expect(parsed.results[0]).assertEqual(true);
      expect(parsed.results[1]).assertEqual(false);
      expect(parsed.results[2]).assertEqual(true);
    });

    /**
     * @tc.name   Json6Test089
     * @tc.number SUB_BUILTINS_Json6_TEST_8900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: AsinCompare = { numbers: [-1, 0, 1], results: [] };
      const json = JSON.stringify(obj);
      const parsed: AsinCompare = JSON.parse(json, (k: string, v: AsinCompare) => {
        if (k === "") {
          const r: number[] = [];
          v.numbers.forEach(n => r.push(Math.asin(n)));
          return { numbers: v.numbers, results: r };
        }
        return v;
      });
      expect(parsed.results[0]).assertClose(-Math.PI / 2, 1);
      expect(parsed.results[1]).assertEqual(0);
      expect(parsed.results[2]).assertClose(Math.PI / 2, 1);
    });

    /**
     * @tc.name   Json6Test090
     * @tc.number SUB_BUILTINS_Json6_TEST_9000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CapitalizeWordsCompare = { strings: ["hello world", "typescript is fun"], capitalized: [] };
      const json = JSON.stringify(obj);
      const parsed: CapitalizeWordsCompare = JSON.parse(json, (k: string, v: CapitalizeWordsCompare) => {
        if (k === "") {
          const c: string[] = [];
          v.strings.forEach(s => {
            let result = "";
            let capitalizeNext = true;
            for (let i = 0; i < s.length; i++) {
              if (s[i] === " ") {
                result += " ";
                capitalizeNext = true;
              } else {
                if (capitalizeNext) {
                  result += s[i].toUpperCase();
                  capitalizeNext = false;
                } else {
                  result += s[i].toLowerCase();
                }
              }
            }
            c.push(result);
          });
          return { strings: v.strings, capitalized: c };
        }
        return v;
      });
      expect(parsed.capitalized[0]).assertEqual("Hello World");
      expect(parsed.capitalized[1]).assertEqual("Typescript Is Fun");
    });

    /**
     * @tc.name   Json6Test091
     * @tc.number SUB_BUILTINS_Json6_TEST_9100
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: WeightedMeanCompare = { values: [10, 20, 30], weights: [1, 2, 3], mean: 0 };
      const json = JSON.stringify(obj);
      const parsed: WeightedMeanCompare = JSON.parse(json, (k: string, v: WeightedMeanCompare) => {
        if (k === "") {
          let weightedSum = 0;
          let weightTotal = 0;
          for (let i = 0; i < v.values.length; i++) {
            weightedSum += v.values[i] * v.weights[i];
            weightTotal += v.weights[i];
          }
          const mean = weightedSum / weightTotal;
          return { values: v.values, weights: v.weights, mean: mean };
        }
        return v;
      });
      expect(parsed.mean).assertEqual(23.333333333333332);
    });

    /**
     * @tc.name   Json6Test092
     * @tc.number SUB_BUILTINS_Json6_TEST_9200
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: TanhCompare = { numbers: [0, Infinity, -Infinity], results: [] };
      const json = JSON.stringify(obj);
      const parsed: TanhCompare = JSON.parse(json, (k: string, v: TanhCompare) => {
        if (k === "") {
          const r: number[] = [];
          v.numbers.forEach(n => r.push(Math.tanh(n)));
          return { numbers: v.numbers, results: r };
        }
        return v;
      });
      expect(parsed.results[0]).assertEqual(0);
      expect(parsed.results[1]).assertEqual(0);
      expect(parsed.results[2]).assertEqual(0);
    });

    /**
     * @tc.name   Json6Test093
     * @tc.number SUB_BUILTINS_Json6_TEST_9300
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SubstringExtractCompare = {
        strings: ["abcdef", "ghijkl"],
        start: 1,
        length: 3,
        extracted: []
      };
      const json = JSON.stringify(obj);
      const parsed: SubstringExtractCompare = JSON.parse(json, (k: string, v: SubstringExtractCompare) => {
        if (k === "") {
          const e: string[] = [];
          v.strings.forEach(s => {
            let result = "";
            for (let i = 0; i < v.length; i++) {
              const pos = v.start + i;
              if (pos >= s.length) {
                break;
              }
              result += s[pos];
            }
            e.push(result);
          });
          return {
            strings: v.strings,
            start: v.start,
            length: v.length,
            extracted: e
          };
        }
        return v;
      });
      expect(parsed.extracted[0]).assertEqual("bcd");
      expect(parsed.extracted[1]).assertEqual("hij");
    });

    /**
     * @tc.name   Json6Test094
     * @tc.number SUB_BUILTINS_Json6_TEST_9400
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: RootSumSquaresCompare = { numbers: [3, 4], result: 0 };
      const json = JSON.stringify(obj);
      const parsed: RootSumSquaresCompare = JSON.parse(json, (k: string, v: RootSumSquaresCompare) => {
        if (k === "") {
          let sum = 0;
          v.numbers.forEach(n => sum += n * n);
          return { numbers: v.numbers, result: Math.sqrt(sum) };
        }
        return v;
      });
      expect(parsed.result).assertEqual(5);
    });

    /**
     * @tc.name   Json6Test095
     * @tc.number SUB_BUILTINS_Json6_TEST_9500
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: HasTripleCharsCompare = { strings: ["aaab", "abbb", "abc"], results: [] };
      const json = JSON.stringify(obj);
      const parsed: HasTripleCharsCompare = JSON.parse(json, (k: string, v: HasTripleCharsCompare) => {
        if (k === "") {
          const r: boolean[] = [];
          v.strings.forEach(s => {
            let hasTriple = false;
            for (let i = 0; i <= s.length - 3; i++) {
              if (s[i] === s[i + 1] && s[i] === s[i + 2]) {
                hasTriple = true;
                break;
              }
            }
            r.push(hasTriple);
          });
          return { strings: v.strings, results: r };
        }
        return v;
      });
      expect(parsed.results[0]).assertEqual(true);
      expect(parsed.results[1]).assertEqual(true);
      expect(parsed.results[2]).assertEqual(false);
    });

    /**
     * @tc.name   Json6Test096
     * @tc.number SUB_BUILTINS_Json6_TEST_9600
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: AsinhCompare = { numbers: [0, 1, -1], results: [] };
      const json = JSON.stringify(obj);
      const parsed: AsinhCompare = JSON.parse(json, (k: string, v: AsinhCompare) => {
        if (k === "") {
          const r: number[] = [];
          v.numbers.forEach(n => r.push(Math.asinh(n)));
          return { numbers: v.numbers, results: r };
        }
        return v;
      });
      expect(parsed.results[0]).assertEqual(0);
      expect(parsed.results[1]).assertClose(Math.log(1 + Math.sqrt(2)), 1);
      expect(parsed.results[2]).assertClose(-Math.log(1 + Math.sqrt(2)), 1);
    });

    /**
     * @tc.name   Json6Test097
     * @tc.number SUB_BUILTINS_Json6_TEST_9700
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: GeometricStdDevCompare = { numbers: [1, 10, 100], stdDev: 0 };
      const json = JSON.stringify(obj);
      const parsed: GeometricStdDevCompare = JSON.parse(json, (k: string, v: GeometricStdDevCompare) => {
        if (k === "") {
          const logs: number[] = [];
          v.numbers.forEach(n => logs.push(Math.log(n)));

          const logMean = logs.reduce((a, b) => a + b, 0) / logs.length;

          const squaredDiffs = logs.map(l => Math.pow(l - logMean, 2));
          const variance = squaredDiffs.reduce((a, b) => a + b, 0) / squaredDiffs.length;
          const logStdDev = Math.sqrt(variance);

          const geoStdDev = Math.exp(logStdDev);

          return { numbers: v.numbers, stdDev: geoStdDev };
        }
        return v;
      });
      expect(parsed.stdDev).assertClose(10, 1);
    });

    /**
     * @tc.name   Json6Test098
     * @tc.number SUB_BUILTINS_Json6_TEST_9800
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: AcoshCompare = { numbers: [1, 2, Math.cosh(1)], results: [] };
      const json = JSON.stringify(obj);
      const parsed: AcoshCompare = JSON.parse(json, (k: string, v: AcoshCompare) => {
        if (k === "") {
          const r: number[] = [];
          v.numbers.forEach(n => r.push(Math.acosh(n)));
          return { numbers: v.numbers, results: r };
        }
        return v;
      });
      expect(parsed.results[0]).assertEqual(0);
      expect(parsed.results[2]).assertEqual(1);
    });

    /**
     * @tc.name   Json6Test099
     * @tc.number SUB_BUILTINS_Json6_TEST_9900
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FilteredCumulativeSumCompare = {
        transactions: [
          { type: "income", amount: 100 },
          { type: "expense", amount: 50 },
          { type: "income", amount: 200 }
        ],
        cumulative: []
      };
      const json = JSON.stringify(obj);
      const parsed: FilteredCumulativeSumCompare = JSON.parse(json, (k: string, v: FilteredCumulativeSumCompare) => {
        if (k === "") {
          const c: number[] = [];
          let sum = 0;
          v.transactions.forEach(t => {
            if (t.type === "income") {
              sum += t.amount;
            }
            c.push(sum);
          });
          return { transactions: v.transactions, cumulative: c };
        }
        return v;
      });
      expect(parsed.cumulative[0]).assertEqual(100);
      expect(parsed.cumulative[1]).assertEqual(100);
      expect(parsed.cumulative[2]).assertEqual(300);
    });

    /**
     * @tc.name   Json6Test100
     * @tc.number SUB_BUILTINS_Json6_TEST_10000
     * @tc.desc   test Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json6Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: AtanhCompare = { numbers: [0, 0.5, -0.5], results: [] };
      const json = JSON.stringify(obj);
      const parsed: AtanhCompare = JSON.parse(json, (k: string, v: AtanhCompare) => {
        if (k === "") {
          const r: number[] = [];
          v.numbers.forEach(n => r.push(Math.atanh(n)));
          return { numbers: v.numbers, results: r };
        }
        return v;
      });
      expect(parsed.results[0]).assertEqual(0);
    });

  })
}

