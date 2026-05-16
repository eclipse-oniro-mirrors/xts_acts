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

export default function Ason6Test() {
  describe('Ason6Test', () => {
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
     * @tc.number SUB_BUILTINS_Ason6_TEST_0100
     * @tc.name Ason6Test001
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: HasUppercaseCompare = { strings: ["test", "Test", "TEST"], filtered: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const f: string[] = [];
        
      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      strings.forEach(s => {
        for (let i = 0; i < s.length; i++) {
          if (s[i] === s[i].toUpperCase() && s[i] !== s[i].toLowerCase()) {
            f.push(s);
            break;
          }
        }
      });

        
      const result: HasUppercaseCompare = {
        strings: strings,
        filtered: f
      };

      expect(result.filtered.length).assertEqual(2);
      expect(result.filtered[0]).assertEqual("Test");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_0200
     * @tc.name Ason6Test002
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: AgeDiffCompare = {
        people: [{ name: "A", age: 25 }, { name: "B", age: 30 }],
        diffs: []
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const d: number[] = [];
      const parsedObj = parsed as Record<string, Object>;
      const people = parsedObj["people"] as Test2_Obj1[];
      if (people.length >= 2) {
        d.push(Math.abs(people[0].age - people[1].age));
      }

        
      const result: AgeDiffCompare = {
        people: people,
        diffs: d
      };

      expect(result.diffs.length).assertEqual(1);
      expect(result.diffs[0]).assertEqual(5);
    });
    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_0300
     * @tc.name Ason6Test003
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: SumCountCompare = { numbers: [1, 2, 3], sum: 0, count: 0 };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      let s = 0;
      numbers.forEach(n => s += n);

        
      const result: SumCountCompare = {
        numbers: numbers,
        sum: s,
        count: numbers.length
      };

      expect(result.sum).assertEqual(6);
      expect(result.count).assertEqual(3);
    });


    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_0400
     * @tc.name Ason6Test004
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: SentenceCompare = { words: ["I", "am", "happy"], sentence: "" };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const words = parsedObj["words"] as string[];
      let s = "";
      for (let i = 0; i < words.length; i++) {
        s += words[i];
        if (i < words.length - 1) {
          s += " ";
        }
      }
      s += ".";

        
      const result: SentenceCompare = {
        words: words,
        sentence: s
      };

      expect(result.sentence).assertEqual("I am happy.");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_0500
     * @tc.name Ason6Test005
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: PriceRangeCompare = {
        products: [
          { name: "A", price: 15 },
          { name: "B", price: 25 },
          { name: "C", price: 35 }
        ],
        inRange: []
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const products = parsedObj["products"] as Test5_Obj1[];
      const r: Test5_Obj1[] = [];
      products.forEach(p => {
        if (p.price >= 20 && p.price <= 30) {
          r.push(p);
        }
      });

        
      const result: PriceRangeCompare = {
        products: products,
        inRange: r
      };

      expect(result.inRange.length).assertEqual(1);
      expect(result.inRange[0].name).assertEqual("B");
      expect(result.inRange[0].price).assertEqual(25);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_0600
     * @tc.name Ason6Test006
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: PercentCompare = { ratios: [0.12, 0.345], percentages: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const ratios = parsedObj["ratios"] as number[];
      const p: string[] = [];
      ratios.forEach(r => {
        p.push(Math.round(r * 100) + "%");
      });

        
      const result: PercentCompare = {
        ratios: ratios,
        percentages: p
      };

      expect(result.percentages[0]).assertEqual("12%");
      expect(result.percentages[1]).assertEqual("35%");
    });


    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_0700
     * @tc.name Ason6Test007
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: CharFrequencyCompare = { strings: ["apple", "banana"], counts: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const c: number[] = [];
      strings.forEach(s => {
        let count = 0;
        for (let i = 0; i < s.length; i++) {
          if (s[i] === "a") {
            count++;
          }
        }
        c.push(count);
      });

        
      const result: CharFrequencyCompare = {
        strings: strings,
        counts: c
      };

      expect(result.counts[0]).assertEqual(1);
      expect(result.counts[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_0800
     * @tc.name Ason6Test008
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: GroupCountCompare = {
        items: [
          { category: "A" },
          { category: "A" },
          { category: "B" }
        ],
        counts: []
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

      const parsedObj = parsed as Record<string, Object>;
      const items = parsedObj["items"] as Test8_Obj1[];
      const map: Record<string, number> = {};
      items.forEach(i => {
        map[i.category] = (map[i.category] || 0) + 1;
      });
      const c: Test8_Obj2[] = [];
      Object.keys(map).forEach(key => {
        c.push({ category: key, count: map[key] });
      });

        
      const result: GroupCountCompare = {
        items: items,
        counts: c
      };

      expect(result.counts.length).assertEqual(2);
      expect(result.counts.find(item => item.category === "A")?.count).assertEqual(2);
      expect(result.counts.find(item => item.category === "B")?.category).assertEqual("B");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_0900
     * @tc.name Ason6Test009
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: CumulativeSumCompare = { numbers: [1, 2, 3], sums: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const s: number[] = [];
      let total = 0;
      numbers.forEach(n => {
        total += n;
        s.push(total);
      });

        
      const result: CumulativeSumCompare = {
        numbers: numbers,
        sums: s
      };

      expect(result.sums[0]).assertEqual(1);
      expect(result.sums[1]).assertEqual(3);
      expect(result.sums[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_1000
     * @tc.name Ason6Test010
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: TruncateCompare = { strings: ["apple", "cat", "banana"], truncated: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const t: string[] = [];
      strings.forEach(s => {
        t.push(s.substring(0, 3));
      });

        
      const result: TruncateCompare = {
        strings: strings,
        truncated: t
      };

      expect(result.truncated[0]).assertEqual("app");
      expect(result.truncated[1]).assertEqual("cat");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_1100
     * @tc.name Ason6Test011
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: InStockCompare = {
        products: [
          { name: "A", quantity: 5 },
          { name: "B", quantity: 0 },
          { name: "C", quantity: 10 }
        ],
        inStock: []
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const products = parsedObj["products"] as Test11_Obj1[];
      const s: Test11_Obj1[] = [];
      products.forEach(p => {
        if (p.quantity > 0) {
          s.push(p);
        }
      });

        
      const result: InStockCompare = {
        products: products,
        inStock: s
      };

      expect(result.inStock.length).assertEqual(2);
      expect(result.inStock[1].name).assertEqual("C");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_1200
     * @tc.name Ason6Test012
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: NumberToBoolCompare = { numbers: [0, 1, -5, 0], booleans: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const b: boolean[] = [];
      numbers.forEach(n => b.push(n !== 0));

        
      const result: NumberToBoolCompare = {
        numbers: numbers,
        booleans: b
      };

      expect(result.booleans[0]).assertEqual(false);
      expect(result.booleans[1]).assertEqual(true);
      expect(result.booleans[2]).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_1300
     * @tc.name Ason6Test013
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: HasSubstringCompare = { strings: ["apple", "banana", "grape"], hasSub: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const h: boolean[] = [];
      strings.forEach(s => h.push(s.includes("ap")));

        
      const result: HasSubstringCompare = {
        strings: strings,
        hasSub: h
      };

      expect(result.hasSub[0]).assertEqual(true);
      expect(result.hasSub[1]).assertEqual(false);
      expect(result.hasSub[2]).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_1400
     * @tc.name Ason6Test014
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: TotalAmountCompare = {
        orders: [
          { id: 1, amount: 100 },
          { id: 2, amount: 200 }
        ],
        total: 0
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const orders = parsedObj["orders"] as Test14_Obj1[];
      let t = 0;
      orders.forEach(o => t += o.amount);

        
      const result: TotalAmountCompare = {
        orders: orders,
        total: t
      };

      expect(result.total).assertEqual(300);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_1500
     * @tc.name Ason6Test015
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: OddEvenClassifyCompare = { numbers: [1, 2, 3, 4], odd: [], even: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const o: number[] = [];
      const e: number[] = [];
      numbers.forEach(n => {
        if (n % 2 === 0) {
          e.push(n);
        } else {
          o.push(n);
        }
      });

        
      const result: OddEvenClassifyCompare = {
        numbers: numbers,
        odd: o,
        even: e
      };

      expect(result.odd.length).assertEqual(2);
      expect(result.even[0]).assertEqual(2);
      expect(result.odd[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_1600
     * @tc.name Ason6Test016
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: ReversedLengthCompare = { strings: ["abc", "de"], reversed: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const r: string[] = [];
      strings.forEach(s => {
        let rev = "";
        for (let i = s.length - 1; i >= 0; i--) {
          rev += s[i];
        }
        r.push(rev);
      });

        
      const result: ReversedLengthCompare = {
        strings: strings,
        reversed: r
      };

      expect(result.reversed.length).assertEqual(2);
      expect(result.reversed[0].length).assertEqual(3);
      expect(result.reversed[1]).assertEqual("ed");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_1700
     * @tc.name Ason6Test017
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: RoleFilterCompare = {
        users: [
          { name: "A", role: "admin" },
          { name: "B", role: "user" },
          { name: "C", role: "admin" }
        ],
        admins: []
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const users = parsedObj["users"] as Test17_Obj1[];
      const a: Test17_Obj1[] = [];
      users.forEach(u => {
        if (u.role === "admin") {
          a.push(u);
        }
      });

        
      const result: RoleFilterCompare = {
        users: users,
        admins: a
      };

      expect(result.admins.length).assertEqual(2);
      expect(result.admins[0].name).assertEqual("A");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_1800
     * @tc.name Ason6Test018
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: SqrtOfSquaresCompare = { numbers: [3, 4], result: 0 };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      let sum = 0;
      numbers.forEach(n => sum += n * n);

        
      const result: SqrtOfSquaresCompare = {
        numbers: numbers,
        result: Math.sqrt(sum)
      };

      expect(result.result).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_1900
     * @tc.name Ason6Test019
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: WrapStringsCompare = { strings: ["test", "case"], wrapped: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const w: string[] = [];
      strings.forEach(s => w.push(`[${s}]`));

        
      const result: WrapStringsCompare = {
        strings: strings,
        wrapped: w
      };

      expect(result.wrapped[0]).assertEqual("[test]");
      expect(result.wrapped[1]).assertEqual("[case]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_2000
     * @tc.name Ason6Test020
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: Year2024FilterCompare = {
        events: [
          { name: "A", date: "2024-03-01" },
          { name: "B", date: "2023-12-31" },
          { name: "C", date: "2024-05-15" }
        ],
        filtered: []
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const events = parsedObj["events"] as Test20_Obj1[];
      const f: Test20_Obj1[] = [];
      events.forEach(e => {
        if (e.date.startsWith("2024-")) {
          f.push(e);
        }
      });

        
      const result: Year2024FilterCompare = {
        events: events,
        filtered: f
      };

      expect(result.filtered.length).assertEqual(2);
      expect(result.filtered[1].name).assertEqual("C");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_2100
     * @tc.name Ason6Test021
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: ThousandsFormatCompare = { numbers: [1234, 1234567], formatted: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const f: string[] = [];
      numbers.forEach(n => {
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

        
      const result: ThousandsFormatCompare = {
        numbers: numbers,
        formatted: f
      };

      expect(result.formatted[0]).assertEqual("1,234");
      expect(result.formatted[1]).assertEqual("1,234,567");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_2200
     * @tc.name Ason6Test022
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: IsEmptyCompare = { strings: ["", "test", "   "], isEmpty: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const e: boolean[] = [];
      strings.forEach(s => e.push(s.trim() === ""));

        
      const result: IsEmptyCompare = {
        strings: strings,
        isEmpty: e
      };

      expect(result.isEmpty[0]).assertEqual(true);
      expect(result.isEmpty[1]).assertEqual(false);
      expect(result.isEmpty[2]).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_2300
     * @tc.name Ason6Test023
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: AvgRatingCompare = {
        movies: [
          { title: "A", rating: 8 },
          { title: "B", rating: 6 },
          { title: "C", rating: 10 }
        ],
        avg: 0
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const movies = parsedObj["movies"] as Test23_Obj1[];
      let sum = 0;
      movies.forEach(m => sum += m.rating);

        
      const result: AvgRatingCompare = {
        movies: movies,
        avg: sum / movies.length
      };

      expect(result.avg).assertEqual(8);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_2400
     * @tc.name Ason6Test024
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: PrimeNumbersCompare = { numbers: [2, 4, 5, 9, 11], primes: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const p: number[] = [];
      numbers.forEach(n => {
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

        
      const result: PrimeNumbersCompare = {
        numbers: numbers,
        primes: p
      };

      expect(result.primes.length).assertEqual(3);
      expect(result.primes[0]).assertEqual(2);
      expect(result.primes[2]).assertEqual(11);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_2500
     * @tc.name Ason6Test025
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: TitleCaseCompare = { strings: ["hello world", "typescript is fun"], titles: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const t: string[] = [];
      strings.forEach(s => {
        const words = s.split(" ");
        const titleWords: string[] = [];
        words.forEach(w => {
          titleWords.push(w.charAt(0).toUpperCase() + w.slice(1).toLowerCase());
        });
        t.push(titleWords.join(" "));
      });

        
      const result: TitleCaseCompare = {
        strings: strings,
        titles: t
      };

      expect(result.titles[0]).assertEqual("Hello World");
      expect(result.titles[1]).assertEqual("Typescript Is Fun");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_2600
     * @tc.name Ason6Test026
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: RotateFirstCharCompare = { strings: ["apple", "banana"], rotated: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const r: string[] = [];
      strings.forEach(s => {
        if (s.length === 0) {
          r.push("");
        } else {
          r.push(s.substring(1) + s.charAt(0));
        }
      });

        
      const result: RotateFirstCharCompare = {
        strings: strings,
        rotated: r
      };

      expect(result.rotated[0]).assertEqual("pplea");
      expect(result.rotated[1]).assertEqual("ananab");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_2700
     * @tc.name Ason6Test027
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: GCDCompare = { numbers: [12, 18, 24], gcd: 0 };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const gcdTwo = (a: number, b: number): number => {
        while (b !== 0) {
          const temp = b;
          b = a % b;
          a = temp;
        }
        return a;
      };
      let gcd = numbers[0];
      for (let i = 1; i < numbers.length; i++) {
        gcd = gcdTwo(gcd, numbers[i]);
        if (gcd === 1) {
          break;
        }
      }

        
      const result: GCDCompare = {
        numbers: numbers,
        gcd: gcd
      };

      expect(result.gcd).assertEqual(6);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_2800
     * @tc.name Ason6Test028
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: ConsonantCountCompare = { strings: ["apple", "xyz"], counts: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const c: number[] = [];
      const vowels = ["a", "e", "i", "o", "u"];
      strings.forEach(s => {
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

        
      const result: ConsonantCountCompare = {
        strings: strings,
        counts: c
      };

      expect(result.counts[0]).assertEqual(3);
      expect(result.counts[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_2900
     * @tc.name Ason6Test029
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: PrefixSuffixProductCompare = { numbers: [1, 2, 3, 4], products: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const prefix: number[] = [];
      const suffix: number[] = [];
      const p: number[] = [];
      let sum = 0;
      numbers.forEach(n => {
        sum += n;
        prefix.push(sum);
      });
      sum = 0;
      for (let i = numbers.length - 1; i >= 0; i--) {
        sum += numbers[i];
        suffix.unshift(sum);
      }
      for (let i = 0; i < prefix.length; i++) {
        p.push(prefix[i] * suffix[i]);
      }

        
      const result: PrefixSuffixProductCompare = {
        numbers: numbers,
        products: p
      };

      expect(result.products[0]).assertEqual(1 * 10);
      expect(result.products[1]).assertEqual(3 * 9);
      expect(result.products[2]).assertEqual(6 * 7);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_3000
     * @tc.name Ason6Test030
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: FilteredMaxCompare = {
        sales: [
          { region: "West", amount: 500 },
          { region: "East", amount: 700 },
          { region: "West", amount: 600 }
        ],
        westMax: 0
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const sales = parsedObj["sales"] as Test30_Obj1[];
      let max = 0;
      let hasWest = false;
      sales.forEach(s => {
        if (s.region === "West") {
          if (!hasWest) {
            max = s.amount;
            hasWest = true;
          } else if (s.amount > max) {
            max = s.amount;
          }
        }
      });

        
      const result: FilteredMaxCompare = {
        sales: sales,
        westMax: max
      };

      expect(result.westMax).assertEqual(600);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_3100
     * @tc.name Ason6Test031
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: LCMCompare = { numbers: [4, 6, 8], lcm: 0 };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const gcd = (a: number, b: number): number => {
        while (b !== 0) {
          const t = b;
          b = a % b;
          a = t;
        }
        return a;
      };
      const lcmTwo = (a: number, b: number): number => a * b / gcd(a, b);

      let lcm = numbers[0];
      for (let i = 1; i < numbers.length; i++) {
        lcm = lcmTwo(lcm, numbers[i]);
      }

        
      const result: LCMCompare = {
        numbers: numbers,
        lcm: lcm
      };

      expect(result.lcm).assertEqual(24);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_3200
     * @tc.name Ason6Test032
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: EndsWithCheckCompare = { strings: ["apple", "banana", "cat"], char: "t", results: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const char = parsedObj["char"] as string;
      const r: boolean[] = [];
      strings.forEach(s => {
        const len = s.length;
        const lastChar = len > 0 ? s.substring(len - 1) : "";
        r.push(lastChar === char);
      });

        
      const result: EndsWithCheckCompare = {
        strings: strings,
        char: char,
        results: r
      };

      expect(result.results[0]).assertEqual(false);
      expect(result.results[2]).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_3300
     * @tc.name Ason6Test033
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: AsciiConvertCompare = { codes: [65, 97, 48], chars: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const codes = parsedObj["codes"] as number[];
      const c: string[] = [];
      codes.forEach(code => c.push(String.fromCharCode(code)));

        
      const result: AsciiConvertCompare = {
        codes: codes,
        chars: c
      };

      expect(result.chars[0]).assertEqual("A");
      expect(result.chars[1]).assertEqual("a");
      expect(result.chars[2]).assertEqual("0");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_3400
     * @tc.name Ason6Test034
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: UniqueCharsCompare = { strings: ["aabcc", "defef"], unique: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const u: string[] = [];
      strings.forEach(s => {
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

        
      const result: UniqueCharsCompare = {
        strings: strings,
        unique: u
      };

      expect(result.unique[0]).assertEqual("abc");
      expect(result.unique[1]).assertEqual("def");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_3500
     * @tc.name Ason6Test035
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: BelowAvgPriceCompare = {
        products: [
          { name: "A", price: 10 },
          { name: "B", price: 20 },
          { name: "C", price: 30 }
        ],
        belowAvg: []
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const products = parsedObj["products"] as Test35_Obj1[];
      let sum = 0;
      products.forEach(p => sum += p.price);
      const avg = sum / products.length;
      const b: Test35_Obj1[] = [];
      products.forEach(p => {
        if (p.price < avg) {
          b.push(p);
        }
      });


      const result: BelowAvgPriceCompare = {
        products: products,
        belowAvg: b
      };

      expect(result.belowAvg.length).assertEqual(1);
      expect(result.belowAvg[0].name).assertEqual("A");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_3600
     * @tc.name Ason6Test036
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: AdjacentProductCompare = { numbers: [2, 3, 4, 5], products: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const p: number[] = [];
      for (let i = 0; i < numbers.length - 1; i++) {
        p.push(numbers[i] * numbers[i + 1]);
      }


      const result: AdjacentProductCompare = {
        numbers: numbers,
        products: p
      };

      expect(result.products.length).assertEqual(3);
      expect(result.products[0]).assertEqual(6);
      expect(result.products[2]).assertEqual(20);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_3700
     * @tc.name Ason6Test037
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: MiddleSubstringCompare = { strings: ["abcde", "abcdef", "ab"], middles: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const m: string[] = [];
      strings.forEach(s => {
        const len = s.length;
        if (len <= 2) {
          m.push("");
        } else {
          m.push(s.substring(1, len - 1));
        }
      });


      const result: MiddleSubstringCompare = {
        strings: strings,
        middles: m
      };

      expect(result.middles[0]).assertEqual("bcd");
      expect(result.middles[1]).assertEqual("bcde");
      expect(result.middles[2]).assertEqual("");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_3800
     * @tc.name Ason6Test038
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: MinValueIndexCompare = { numbers: [5, 2, 7, 2], min: 0, index: -1 };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      let minVal = numbers[0];
      let minIdx = 0;
      for (let i = 1; i < numbers.length; i++) {
        if (numbers[i] < minVal) {
          minVal = numbers[i];
          minIdx = i;
        }
      }


      const result: MinValueIndexCompare = {
        numbers: numbers,
        min: minVal,
        index: minIdx
      };

      expect(result.min).assertEqual(2);
      expect(result.index).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_3900
     * @tc.name Ason6Test039
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: ReverseCharsCompare = { strings: ["hello", "world"], reversed: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const r: string[] = [];
      strings.forEach(s => {
        let rev = "";
        for (let i = s.length - 1; i >= 0; i--) {
          rev += s[i];
        }
        r.push(rev);
      });


      const result: ReverseCharsCompare = {
        strings: strings,
        reversed: r
      };

      expect(result.reversed[0]).assertEqual("olleh");
      expect(result.reversed[1]).assertEqual("dlrow");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_4000
     * @tc.name Ason6Test040
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: NaturalLogCompare = { numbers: [1, Math.E, Math.E**2], logs: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const l: number[] = [];
      numbers.forEach(n => l.push(Math.log(n)));


      const result: NaturalLogCompare = {
        numbers: numbers,
        logs: l
      };

      expect(result.logs[0]).assertEqual(0);
      expect(result.logs[1]).assertEqual(1);
      expect(result.logs[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_4100
     * @tc.name Ason6Test041
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: SumOfSquaresCompare = { numbers: [1, 2, 3], sum: 0 };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      let s = 0;
      numbers.forEach(n => s += n * n);


      const result: SumOfSquaresCompare = {
        numbers: numbers,
        sum: s
      };

      expect(result.sum).assertEqual(14);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_4200
     * @tc.name Ason6Test042
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: ReplaceSpaceCompare = { strings: ["hello world", "typescript is fun"], replaced: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const r: string[] = [];
      strings.forEach(s => {
        let newStr = "";
        for (let i = 0; i < s.length; i++) {
          newStr += s[i] === " " ? "_" : s[i];
        }
        r.push(newStr);
      });


      const result: ReplaceSpaceCompare = {
        strings: strings,
        replaced: r
      };

      expect(result.replaced[0]).assertEqual("hello_world");
      expect(result.replaced[1]).assertEqual("typescript_is_fun");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_4300
     * @tc.name Ason6Test043
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: ExponentialCompare = { numbers: [0, 1, Math.LN2], results: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const r: number[] = [];
      numbers.forEach(n => r.push(Math.exp(n)));


      const result: ExponentialCompare = {
        numbers: numbers,
        results: r
      };

      expect(result.results[0]).assertEqual(1);
      expect(result.results[1]).assertEqual(Math.E);
      expect(result.results[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_4400
     * @tc.name Ason6Test044
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: LowerCountCompare = { strings: ["AbcDE", "FGhiJ"], counts: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const c: number[] = [];
      strings.forEach(s => {
        let count = 0;
        for (let i = 0; i < s.length; i++) {
          const charCode = s.charCodeAt(i);
          if (charCode >= 97 && charCode <= 122) {
            count++;
          }
        }
        c.push(count);
      });


      const result: LowerCountCompare = {
        strings: strings,
        counts: c
      };

      expect(result.counts[0]).assertEqual(2);
      expect(result.counts[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_4500
     * @tc.name Ason6Test045
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: DateFormatCompare = {
        events: [
          { name: "A", date: "2024-03-01" },
          { name: "B", date: "2023-12-31" }
        ],
        formatted: []
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const events = parsedObj["events"] as Test45_Obj1[];
      const f: Test45_Obj1[] = [];
      events.forEach(e => {
        const parts = e.date.split("-");
        const formatted = parts[2] + "/" + parts[1] + "/" + parts[0];
        f.push({ name: e.name, date: formatted } as Test45_Obj1);
      });


      const result: DateFormatCompare = {
        events: events,
        formatted: f
      };

      expect(result.formatted[0].date).assertEqual("01/03/2024");
      expect(result.formatted[1].date).assertEqual("31/12/2023");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_4600
     * @tc.name Ason6Test046
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: AboveAvgElementsCompare = { numbers: [1, 2, 3, 4, 5], aboveAvg: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      let sum = 0;
      numbers.forEach(n => sum += n);
      const avg = sum / numbers.length;
      const a: number[] = [];
      numbers.forEach(n => {
        if (n > avg) {
          a.push(n);
        }
      });


      const result: AboveAvgElementsCompare = {
        numbers: numbers,
        aboveAvg: a
      };

      expect(result.aboveAvg.length).assertEqual(2);
      expect(result.aboveAvg[0]).assertEqual(4);
      expect(result.aboveAvg[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_4700
     * @tc.name Ason6Test047
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: ProperCaseCompare = { strings: ["hElLo", "wORLD"], proper: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const p: string[] = [];
      strings.forEach(s => {
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


      const result: ProperCaseCompare = {
        strings: strings,
        proper: p
      };

      expect(result.proper[0]).assertEqual("Hello");
      expect(result.proper[1]).assertEqual("World");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_4800
     * @tc.name Ason6Test048
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: SineCompare = { angles: [0, Math.PI / 2, Math.PI], sines: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const angles = parsedObj["angles"] as number[];
      const s: number[] = [];
      angles.forEach(a => s.push(Math.sin(a)));


      const result: SineCompare = {
        angles: angles,
        sines: s
      };

      expect(result.sines[0]).assertEqual(0);
      expect(result.sines[1]).assertEqual(1);
      expect(result.sines[2]).assertEqual(1.2246467991473532e-16);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_4900
     * @tc.name Ason6Test049
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: IsAlphaCompare = { strings: ["abc", "a1b", "defg"], results: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const r: boolean[] = [];
      strings.forEach(s => {
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


      const result: IsAlphaCompare = {
        strings: strings,
        results: r
      };

      expect(result.results[0]).assertEqual(true);
      expect(result.results[1]).assertEqual(false);
      expect(result.results[2]).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_5000
     * @tc.name Ason6Test050
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: FilteredTotalCompare = {
        orders: [
          { status: "completed", amount: 100 },
          { status: "pending", amount: 200 },
          { status: "completed", amount: 150 }
        ],
        completedTotal: 0
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const orders = parsedObj["orders"] as Test50_Obj1[];
      let total = 0;
      orders.forEach(o => {
        if (o.status === "completed") {
          total += o.amount;
        }
      });


      const result: FilteredTotalCompare = {
        orders: orders,
        completedTotal: total
      };

      expect(result.completedTotal).assertEqual(250);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_5100
     * @tc.name Ason6Test051
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: SumOverMaxCompare = { numbers: [1, 2, 3, 4], ratio: 0 };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      let sum = 0;
      let max = numbers[0];
      numbers.forEach(n => {
        sum += n;
        if (n > max) {
          max = n;
        }
      });


      const result: SumOverMaxCompare = {
        numbers: numbers,
        ratio: sum / max
      };

      expect(result.ratio).assertEqual(10 / 4);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_5200
     * @tc.name Ason6Test052
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: SpecificCharCountCompare = { strings: ["apple", "banana", "grape"], char: "a", counts: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const char = parsedObj["char"] as string;
      const c: number[] = [];
      strings.forEach(s => {
        let count = 0;
        for (let i = 0; i < s.length; i++) {
          if (s[i] === char) {
            count++;
          }
        }
        c.push(count);
      });


      const result: SpecificCharCountCompare = {
        strings: strings,
        char: char,
        counts: c
      };

      expect(result.counts[0]).assertEqual(1);
      expect(result.counts[1]).assertEqual(3);
      expect(result.counts[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_5300
     * @tc.name Ason6Test053
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: PriceRangeCountCompare = {
        products: [
          { name: "A", price: 15 },
          { name: "B", price: 25 },
          { name: "C", price: 35 }
        ],
        range: [20, 30],
        count: 0
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const products = parsedObj["products"] as Test53_Obj1[];
      const range = parsedObj["range"] as [number, number];
      let cnt = 0;
      products.forEach(p => {
        if (p.price >= range[0] && p.price <= range[1]) {
          cnt++;
        }
      });


      const result: PriceRangeCountCompare = {
        products: products,
        range: range,
        count: cnt
      };

      expect(result.count).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_5400
     * @tc.name Ason6Test054
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: SumOfSquareRootsCompare = { numbers: [9, 16, 25], sum: 0 };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      let s = 0;
      numbers.forEach(n => s += Math.sqrt(n));


      const result: SumOfSquareRootsCompare = {
        numbers: numbers,
        sum: s
      };

      expect(result.sum).assertEqual(12);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_5500
     * @tc.name Ason6Test055
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: StartsWithCheckCompare = { strings: ["apple", "app", "application"], prefix: "app", results: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const prefix = parsedObj["prefix"] as string;
      const r: boolean[] = [];
      const prefixLen = prefix.length;
      strings.forEach(s => {
        if (s.length < prefixLen) {
          r.push(false);
          return;
        }
        let match = true;
        for (let i = 0; i < prefixLen; i++) {
          if (s[i] !== prefix[i]) {
            match = false;
            break;
          }
        }
        r.push(match);
      });


      const result: StartsWithCheckCompare = {
        strings: strings,
        prefix: prefix,
        results: r
      };

      expect(result.results[0]).assertEqual(true);
      expect(result.results[1]).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_5600
     * @tc.name Ason6Test056
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: MonthNameCompare = { months: [1, 6, 12], names: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const months = parsedObj["months"] as number[];
      const monthNames = ["January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"];
      const n: string[] = [];
      months.forEach(m => {
        n.push(monthNames[m - 1]);
      });


      const result: MonthNameCompare = {
        months: months,
        names: n
      };

      expect(result.names[0]).assertEqual("January");
      expect(result.names[1]).assertEqual("June");
      expect(result.names[2]).assertEqual("December");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_5700
     * @tc.name Ason6Test057
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: HighRatingFilterCompare = {
        movies: [
          { title: "A", rating: 7.5 },
          { title: "B", rating: 8.2 },
          { title: "C", rating: 6.9 }
        ],
        threshold: 7.0,
        highRated: []
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const movies = parsedObj["movies"] as Test57_Obj1[];
      const threshold = parsedObj["threshold"] as number;
      const h: Test57_Obj1[] = [];
      movies.forEach(m => {
        if (m.rating > threshold) {
          h.push(m);
        }
      });


      const result: HighRatingFilterCompare = {
        movies: movies,
        threshold: threshold,
        highRated: h
      };

      expect(result.highRated.length).assertEqual(2);
      expect(result.highRated[0].title).assertEqual("A");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_5800
     * @tc.name Ason6Test058
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: CosineCompare = { angles: [0, Math.PI / 2, Math.PI], cosines: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const angles = parsedObj["angles"] as number[];
      const c: number[] = [];
      angles.forEach(a => c.push(Math.cos(a)));


      const result: CosineCompare = {
        angles: angles,
        cosines: c
      };

      expect(result.cosines[0]).assertEqual(1);
      expect(result.cosines[1]).assertEqual(6.123233995736766e-17);
      expect(result.cosines[2]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_5900
     * @tc.name Ason6Test059
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: ReplaceAtPositionCompare = {
        strings: ["apple", "banana"],
        position: 1,
        char: "*",
        replaced: []
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const position = parsedObj["position"] as number;
      const char = parsedObj["char"] as string;
      const r: string[] = [];
      strings.forEach(s => {
        if (position < 0 || position >= s.length) {
          r.push(s);
          return;
        }
        let newStr = "";
        for (let i = 0; i < s.length; i++) {
          newStr += i === position ? char : s[i];
        }
        r.push(newStr);
      });


      const result: ReplaceAtPositionCompare = {
        strings: strings,
        position: position,
        char: char,
        replaced: r
      };

      expect(result.replaced[0]).assertEqual("a*ple");
      expect(result.replaced[1]).assertEqual("b*nana");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_6000
     * @tc.name Ason6Test060
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: EvenSquareSumCompare = { numbers: [1, 2, 3, 4, 5], sum: 0 };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      let s = 0;
      numbers.forEach(n => {
        if (n % 2 === 0) {
          s += n * n;
        }
      });


      const result: EvenSquareSumCompare = {
        numbers: numbers,
        sum: s
      };

      expect(result.sum).assertEqual(20);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_6100
     * @tc.name Ason6Test061
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: HasConsecutiveCharsCompare = { strings: ["apple", "banana", "test"], results: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const r: boolean[] = [];
      strings.forEach(s => {
        let hasConsecutive = false;
        for (let i = 0; i < s.length - 1; i++) {
          if (s[i] === s[i + 1]) {
            hasConsecutive = true;
            break;
          }
        }
        r.push(hasConsecutive);
      });


      const result: HasConsecutiveCharsCompare = {
        strings: strings,
        results: r
      };

      expect(result.results[0]).assertEqual(true);
      expect(result.results[1]).assertEqual(false);
      expect(result.results[2]).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_6200
     * @tc.name Ason6Test062
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: DateTopNCompare = {
        events: [
          { name: "B", date: "2024-03-01" },
          { name: "A", date: "2024-04-15" },
          { name: "C", date: "2024-02-20" }
        ],
        n: 2,
        latest: []
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const events = parsedObj["events"] as Test68_Obj1[];
      const n = parsedObj["n"] as number;
      const temp: Test68_Obj1[] = [];
      events.forEach(e => temp.push(e));
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
      for (let i = 0; i < Math.min(n, temp.length); i++) {
        l.push(temp[i]);
      }


      const result: DateTopNCompare = {
        events: events,
        n: n,
        latest: l
      };

      expect(result.latest.length).assertEqual(2);
      expect(result.latest[0].name).assertEqual("A");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_6300
     * @tc.name Ason6Test063
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: TangentCompare = { angles: [0, Math.PI / 4, Math.PI / 2 - 0.0001], tangents: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const angles = parsedObj["angles"] as number[];
      const t: number[] = [];
      angles.forEach(a => t.push(Math.tan(a)));


      const result: TangentCompare = {
        angles: angles,
        tangents: t
      };

      expect(result.tangents[0]).assertEqual(0);
      expect(result.tangents[1]).assertClose(1, 1);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_6400
     * @tc.name Ason6Test064
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: NonAlphaCountCompare = { strings: ["a1b!", "hello?", "pure"], counts: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const c: number[] = [];
      strings.forEach(s => {
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


      const result: NonAlphaCountCompare = {
        strings: strings,
        counts: c
      };

      expect(result.counts[0]).assertEqual(2);
      expect(result.counts[1]).assertEqual(1);
      expect(result.counts[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_6500
     * @tc.name Ason6Test065
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: AsciiSortCompare = { strings: ["cab", "fed"], sorted: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const s: string[] = [];
      strings.forEach(str => {
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


      const result: AsciiSortCompare = {
        strings: strings,
        sorted: s
      };

      expect(result.sorted[0]).assertEqual("abc");
      expect(result.sorted[1]).assertEqual("def");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_6600
     * @tc.name Ason6Test066
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: SumOfAbsCompare = { numbers: [-1, 2, -3, 4], sum: 0 };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      let s = 0;
      numbers.forEach(n => s += Math.abs(n));


      const result: SumOfAbsCompare = {
        numbers: numbers,
        sum: s
      };

      expect(result.sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_6700
     * @tc.name Ason6Test067
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: IsNumericCompare = { strings: ["123", "12.3", "abc"], results: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const r: boolean[] = [];
      strings.forEach(s => {
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


      const result: IsNumericCompare = {
        strings: strings,
        results: r
      };

      expect(result.results[0]).assertEqual(true);
      expect(result.results[1]).assertEqual(true);
      expect(result.results[2]).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_6800
     * @tc.name Ason6Test068
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: ExpCompare = { numbers: [0, 1, Math.LN2], results: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const r: number[] = [];
      numbers.forEach(n => r.push(Math.exp(n)));


      const result: ExpCompare = {
        numbers: numbers,
        results: r
      };

      expect(result.results[0]).assertEqual(1);
      expect(result.results[1]).assertClose(Math.E, 1);
      expect(result.results[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_6900
     * @tc.name Ason6Test069
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: SwapFirstLastCompare = { strings: ["apple", "banana", "a"], swapped: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const s: string[] = [];
      strings.forEach(str => {
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


      const result: SwapFirstLastCompare = {
        strings: strings,
        swapped: s
      };

      expect(result.swapped[0]).assertEqual("eppla");
      expect(result.swapped[1]).assertEqual("aananb");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_7000
     * @tc.name Ason6Test070
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: SquareCubeSumCompare = { numbers: [2, 3], results: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const r: number[] = [];
      numbers.forEach(n => r.push(n * n + n * n * n));


      const result: SquareCubeSumCompare = {
        numbers: numbers,
        results: r
      };

      expect(result.results[0]).assertEqual(12);
      expect(result.results[1]).assertEqual(36);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_7100
     * @tc.name Ason6Test071
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: IsEmailCompare = { strings: ["test@example.com", "invalid-email", "user@domain"], results: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const r: boolean[] = [];
      strings.forEach(s => {
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


      const result: IsEmailCompare = {
        strings: strings,
        results: r
      };

      expect(result.results[0]).assertEqual(true);
      expect(result.results[1]).assertEqual(false);
      expect(result.results[2]).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_7200
     * @tc.name Ason6Test072
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: GeometricMeanCompare = { numbers: [2, 8], mean: 0 };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      let product = 1;
      numbers.forEach(n => product *= n);
      const mean = Math.pow(product, 1 / numbers.length);


      const result: GeometricMeanCompare = {
        numbers: numbers,
        mean: mean
      };

      expect(result.mean).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_7300
     * @tc.name Ason6Test073
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: UpperCaseCountCompare = { strings: ["AbCdE", "FGhiJ", "klmno"], counts: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const c: number[] = [];
      strings.forEach(s => {
        let count = 0;
        for (let i = 0; i < s.length; i++) {
          const code = s.charCodeAt(i);
          if (code >= 65 && code <= 90) {
            count++;
          }
        }
        c.push(count);
      });


      const result: UpperCaseCountCompare = {
        strings: strings,
        counts: c
      };

      expect(result.counts[0]).assertEqual(3);
      expect(result.counts[1]).assertEqual(3);
      expect(result.counts[2]).assertEqual(0);
    });


    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_7400
     * @tc.name Ason6Test074
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: AboveAvgProductsCompare = {
        products: [
          { name: "A", price: 10 },
          { name: "B", price: 20 },
          { name: "C", price: 30 }
        ],
        aboveAvg: []
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const products = parsedObj["products"] as Test74_Obj1[];
      let sum = 0;
      products.forEach(p => sum += p.price);
      const avg = sum / products.length;
      const a: Test74_Obj1[] = [];
      products.forEach(p => {
        if (p.price > avg) {
          a.push(p);
        }
      });


      const result: AboveAvgProductsCompare = {
        products: products,
        aboveAvg: a
      };

      expect(result.aboveAvg.length).assertEqual(1);
      expect(result.aboveAvg[0].name).assertEqual("C");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_7500
     * @tc.name Ason6Test075
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: SumOfSquaredDiffsCompare = { numbers: [1, 2, 3, 4], sum: 0 };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      let sum = 0;
      const avg = numbers.reduce((a, b) => a + b, 0) / numbers.length;
      numbers.forEach(n => sum += Math.pow(n - avg, 2));


      const result: SumOfSquaredDiffsCompare = {
        numbers: numbers,
        sum: sum
      };

      expect(result.sum).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_7600
     * @tc.name Ason6Test076
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: ContainsSubstringCompare = { strings: ["apple", "pineapple", "grape"], substring: "app", results: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const substring = parsedObj["substring"] as string;
      const r: boolean[] = [];
      const subLen = substring.length;
      strings.forEach(s => {
        let found = false;
        for (let i = 0; i <= s.length - subLen; i++) {
          let match = true;
          for (let j = 0; j < subLen; j++) {
            if (s[i + j] !== substring[j]) {
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


      const result: ContainsSubstringCompare = {
        strings: strings,
        substring: substring,
        results: r
      };

      expect(result.results[0]).assertEqual(true);
      expect(result.results[1]).assertEqual(true);
      expect(result.results[2]).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_7700
     * @tc.name Ason6Test077
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: WeekdayNameCompare = { weekdays: [0, 3, 6], names: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const weekdays = parsedObj["weekdays"] as number[];
      const weekdayNames = ["Sunday", "Monday", "Tuesday", "Wednesday",
        "Thursday", "Friday", "Saturday"];
      const n: string[] = [];
      weekdays.forEach(d => n.push(weekdayNames[d]));


      const result: WeekdayNameCompare = {
        weekdays: weekdays,
        names: n
      };

      expect(result.names[0]).assertEqual("Sunday");
      expect(result.names[1]).assertEqual("Wednesday");
      expect(result.names[2]).assertEqual("Saturday");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_7800
     * @tc.name Ason6Test078
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: ReverseSortCharsCompare = { strings: ["cab", "fed"], sorted: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const s: string[] = [];
      strings.forEach(str => {
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


      const result: ReverseSortCharsCompare = {
        strings: strings,
        sorted: s
      };

      expect(result.sorted[0]).assertEqual("cba");
      expect(result.sorted[1]).assertEqual("fed");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_7900
     * @tc.name Ason6Test079
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: SinhCompare = { numbers: [0, Math.log(2 + Math.sqrt(3))], results: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const r: number[] = [];
      numbers.forEach(n => r.push(Math.sinh(n)));


      const result: SinhCompare = {
        numbers: numbers,
        results: r
      };

      expect(result.results[0]).assertEqual(0);
      expect(result.results[1]).assertClose(1.732, 1);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_8000
     * @tc.name Ason6Test080
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: ReplaceSubstringCompare = {
        strings: ["apple", "pineapple"],
        from: "app",
        to: "xyz",
        replaced: []
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const from = parsedObj["from"] as string;
      const to = parsedObj["to"] as string;
      const r: string[] = [];
      const fromLen = from.length;
      strings.forEach(s => {
        let newStr = "";
        let i = 0;
        while (i <= s.length - fromLen) {
          let match = true;
          for (let j = 0; j < fromLen; j++) {
            if (s[i + j] !== from[j]) {
              match = false;
              break;
            }
          }
          if (match) {
            newStr += to;
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


      const result: ReplaceSubstringCompare = {
        strings: strings,
        from: from,
        to: to,
        replaced: r
      };

      expect(result.replaced[0]).assertEqual("xyzle");
      expect(result.replaced[1]).assertEqual("pinexyzle");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_8100
     * @tc.name Ason6Test081
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: OddProductCompare = { numbers: [1, 2, 3, 4, 5], product: 1 };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      let p = 1;
      numbers.forEach(n => {
        if (n % 2 === 1) {
          p *= n;
        }
      });


      const result: OddProductCompare = {
        numbers: numbers,
        product: p
      };

      expect(result.product).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_8200
     * @tc.name Ason6Test082
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: IsPalindromeCompare = { strings: ["madam", "hello", "racecar"], results: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const r: boolean[] = [];
      strings.forEach(s => {
        let isPalin = true;
        for (let i = 0; i < Math.floor(s.length / 2); i++) {
          if (s[i] !== s[s.length - 1 - i]) {
            isPalin = false;
            break;
          }
        }
        r.push(isPalin);
      });


      const result: IsPalindromeCompare = {
        strings: strings,
        results: r
      };

      expect(result.results[0]).assertEqual(true);
      expect(result.results[1]).assertEqual(false);
      expect(result.results[2]).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_8300
     * @tc.name Ason6Test083
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: CoshCompare = { numbers: [0, Math.log(1 + Math.sqrt(2))], results: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const r: number[] = [];
      numbers.forEach(n => r.push(Math.cosh(n)));


      const result: CoshCompare = {
        numbers: numbers,
        results: r
      };

      expect(result.results[0]).assertEqual(1);
      expect(result.results[1]).assertClose(1.414, 1);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_8400
     * @tc.name Ason6Test084
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: SpaceCountCompare = { strings: ["hello world", "  test  case  ", "nospaces"], counts: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const c: number[] = [];
      strings.forEach(s => {
        let count = 0;
        for (let i = 0; i < s.length; i++) {
          if (s[i] === " ") {
            count++;
          }
        }
        c.push(count);
      });


      const result: SpaceCountCompare = {
        strings: strings,
        counts: c
      };

      expect(result.counts[0]).assertEqual(1);
      expect(result.counts[1]).assertEqual(6);
      expect(result.counts[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_8500
     * @tc.name Ason6Test085
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: HarmonicMeanCompare = { numbers: [2, 3, 6], mean: 0 };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      let sum = 0;
      numbers.forEach(n => sum += 1 / n);
      const mean = numbers.length / sum;


      const result: HarmonicMeanCompare = {
        numbers: numbers,
        mean: mean
      };

      expect(result.mean).assertEqual(3.0000000000000004);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_8600
     * @tc.name Ason6Test086
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: AlternateCaseCompare = { strings: ["hello", "world"], alternated: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const a: string[] = [];
      strings.forEach(s => {
        let result = "";
        for (let i = 0; i < s.length; i++) {
          result += i % 2 === 0
            ? s[i].toUpperCase()
            : s[i].toLowerCase();
        }
        a.push(result);
      });


      const result: AlternateCaseCompare = {
        strings: strings,
        alternated: a
      };

      expect(result.alternated[0]).assertEqual("HeLlO");
      expect(result.alternated[1]).assertEqual("WoRlD");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_8700
     * @tc.name Ason6Test087
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: AcosCompare = { numbers: [1, 0, -1], results: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const r: number[] = [];
      numbers.forEach(n => r.push(Math.acos(n)));


      const result: AcosCompare = {
        numbers: numbers,
        results: r
      };

      expect(result.results[0]).assertEqual(0);
      expect(result.results[1]).assertClose(Math.PI / 2, 1);
      expect(result.results[2]).assertClose(Math.PI, 1);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_8800
     * @tc.name Ason6Test088
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: HasDigitCompare = { strings: ["abc123", "no digits", "456test"], results: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const r: boolean[] = [];
      strings.forEach(s => {
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


      const result: HasDigitCompare = {
        strings: strings,
        results: r
      };

      expect(result.results[0]).assertEqual(true);
      expect(result.results[1]).assertEqual(false);
      expect(result.results[2]).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_8900
     * @tc.name Ason6Test089
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: AsinCompare = { numbers: [-1, 0, 1], results: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const r: number[] = [];
      numbers.forEach(n => r.push(Math.asin(n)));


      const result: AsinCompare = {
        numbers: numbers,
        results: r
      };

      expect(result.results[0]).assertClose(-Math.PI / 2, 1);
      expect(result.results[1]).assertEqual(0);
      expect(result.results[2]).assertClose(Math.PI / 2, 1);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_9000
     * @tc.name Ason6Test090
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: CapitalizeWordsCompare = { strings: ["hello world", "typescript is fun"], capitalized: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const c: string[] = [];
      strings.forEach(s => {
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


      const result: CapitalizeWordsCompare = {
        strings: strings,
        capitalized: c
      };

      expect(result.capitalized[0]).assertEqual("Hello World");
      expect(result.capitalized[1]).assertEqual("Typescript Is Fun");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_9100
     * @tc.name Ason6Test091
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: WeightedMeanCompare = { values: [10, 20, 30], weights: [1, 2, 3], mean: 0 };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const values = parsedObj["values"] as number[];
      const weights = parsedObj["weights"] as number[];
      let weightedSum = 0;
      let weightTotal = 0;
      for (let i = 0; i < values.length; i++) {
        weightedSum += values[i] * weights[i];
        weightTotal += weights[i];
      }
      const mean = weightedSum / weightTotal;


      const result: WeightedMeanCompare = {
        values: values,
        weights: weights,
        mean: mean
      };

      expect(result.mean).assertEqual(23.333333333333332);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_9200
     * @tc.name Ason6Test092
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: TanhCompare = { numbers: [0, Infinity, -Infinity], results: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const r: number[] = [];
      numbers.forEach(n => r.push(Math.tanh(n)));


      const result: TanhCompare = {
        numbers: numbers,
        results: r
      };

      expect(result.results[0]).assertEqual(0);
      expect(result.results[1]).assertEqual(0);
      expect(result.results[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_9300
     * @tc.name Ason6Test093
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: SubstringExtractCompare = {
        strings: ["abcdef", "ghijkl"],
        start: 1,
        length: 3,
        extracted: []
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const start = parsedObj["start"] as number;
      const length = parsedObj["length"] as number;
      const e: string[] = [];
      strings.forEach(s => {
        let result = "";
        for (let i = 0; i < length; i++) {
          const pos = start + i;
          if (pos >= s.length) {
            break;
          }
          result += s[pos];
        }
        e.push(result);
      });


      const result: SubstringExtractCompare = {
        strings: strings,
        start: start,
        length: length,
        extracted: e
      };

      expect(result.extracted[0]).assertEqual("bcd");
      expect(result.extracted[1]).assertEqual("hij");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_9400
     * @tc.name Ason6Test094
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: RootSumSquaresCompare = { numbers: [3, 4], result: 0 };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      let sum = 0;
      numbers.forEach(n => sum += n * n);


      const result: RootSumSquaresCompare = {
        numbers: numbers,
        result: Math.sqrt(sum)
      };

      expect(result.result).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_9500
     * @tc.name Ason6Test095
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: HasTripleCharsCompare = { strings: ["aaab", "abbb", "abc"], results: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const r: boolean[] = [];
      strings.forEach(s => {
        let hasTriple = false;
        for (let i = 0; i <= s.length - 3; i++) {
          if (s[i] === s[i + 1] && s[i] === s[i + 2]) {
            hasTriple = true;
            break;
          }
        }
        r.push(hasTriple);
      });


      const result: HasTripleCharsCompare = {
        strings: strings,
        results: r
      };

      expect(result.results[0]).assertEqual(true);
      expect(result.results[1]).assertEqual(true);
      expect(result.results[2]).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_9600
     * @tc.name Ason6Test096
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: AsinhCompare = { numbers: [0, 1, -1], results: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const r: number[] = [];
      numbers.forEach(n => r.push(Math.asinh(n)));


      const result: AsinhCompare = {
        numbers: numbers,
        results: r
      };

      expect(result.results[0]).assertEqual(0);
      expect(result.results[1]).assertClose(Math.log(1 + Math.sqrt(2)), 1);
      expect(result.results[2]).assertClose(-Math.log(1 + Math.sqrt(2)), 1);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_9700
     * @tc.name Ason6Test097
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: GeometricStdDevCompare = { numbers: [1, 10, 100], stdDev: 0 };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const logs: number[] = [];
      numbers.forEach(n => logs.push(Math.log(n)));

      const logMean = logs.reduce((a, b) => a + b, 0) / logs.length;

      const squaredDiffs = logs.map(l => Math.pow(l - logMean, 2));
      const variance = squaredDiffs.reduce((a, b) => a + b, 0) / squaredDiffs.length;
      const logStdDev = Math.sqrt(variance);

      const geoStdDev = Math.exp(logStdDev);


      const result: GeometricStdDevCompare = {
        numbers: numbers,
        stdDev: geoStdDev
      };

      expect(result.stdDev).assertClose(10, 1);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_9800
     * @tc.name Ason6Test098
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: AcoshCompare = { numbers: [1, 2, Math.cosh(1)], results: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const r: number[] = [];
      numbers.forEach(n => r.push(Math.acosh(n)));


      const result: AcoshCompare = {
        numbers: numbers,
        results: r
      };

      expect(result.results[0]).assertEqual(0);
      expect(result.results[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_9900
     * @tc.name Ason6Test099
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: FilteredCumulativeSumCompare = {
        transactions: [
          { type: "income", amount: 100 },
          { type: "expense", amount: 50 },
          { type: "income", amount: 200 }
        ],
        cumulative: []
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const transactions = parsedObj["transactions"] as Test99_Obj1[];
      const c: number[] = [];
      let sum = 0;
      transactions.forEach(t => {
        if (t.type === "income") {
          sum += t.amount;
        }
        c.push(sum);
      });


      const result: FilteredCumulativeSumCompare = {
        transactions: transactions,
        cumulative: c
      };

      expect(result.cumulative[0]).assertEqual(100);
      expect(result.cumulative[1]).assertEqual(100);
      expect(result.cumulative[2]).assertEqual(300);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason6_TEST_10000
     * @tc.name Ason6Test100
     * @tc.desc test Ason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason6Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: AtanhCompare = { numbers: [0, 0.5, -0.5], results: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;


      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const r: number[] = [];
      numbers.forEach(n => r.push(Math.atanh(n)));


      const result: AtanhCompare = {
        numbers: numbers,
        results: r
      };

      expect(result.results[0]).assertEqual(0);
    });

  })
}

