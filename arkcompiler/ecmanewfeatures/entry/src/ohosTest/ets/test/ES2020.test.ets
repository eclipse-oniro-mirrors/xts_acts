/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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


import { describe, it, expect } from '@ohos/hypium';
import { test2020_03_ans } from './test2020_03'
import { test2020_04_ans } from './test2020_04'
import { test2020_07_ans } from './test2020_07'
import { test2020_09_ans } from './test2020_09'
import { test2020_10_ans } from './test2020_10'


export default function es2020Test() {
  describe('ES2020Test', () => {
    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ES2020NewFeatures_0001
     * @tc.name      : testDynamicImport
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testDynamicImport', 0, async () => {
      let test2020_01_ans = 0;
      const module = await import("./testModule");
      test2020_01_ans = module.someFunction(test2020_01_ans);
      expect(test2020_01_ans).assertEqual(1);
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ES2020NewFeatures_0002
     * @tc.name      : testImport.Meta
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testImport.Meta', 0, () => {
      // do not support import.meta
      expect(1).assertEqual(1);
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ES2020NewFeatures_0003
     * @tc.name      : testNameSpaceReExporting
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testNameSpaceReExporting', 0, () => {
      expect(test2020_03_ans.someFunction(1)).assertEqual(2);
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ES2020NewFeatures_0004
     * @tc.name      : testOptionalChaining
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testOptionalChaining', 0, () => {
      expect(test2020_04_ans).assertEqual("Universityundefined1undefinedHelloTom");
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ES2020NewFeatures_0005
     * @tc.name      : testNullishCoalescingOperator
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testNullishCoalescingOperator', 0, () => {
      expect(false ?? "some truthy value").assertEqual(false);
      expect(undefined ?? "some truthy value").assertEqual("some truthy value");
      expect(null ?? "some truthy value").assertEqual("some truthy value");
      expect((NaN ?? "some truthy value").toString()).assertEqual("NaN");
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ES2020NewFeatures_0006
     * @tc.name      : testBigInts
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBigInts', 0, () => {
      let oldNum = Number.MAX_SAFE_INTEGER;
      ++oldNum;
      expect(oldNum).assertEqual(9007199254740992);
      ++oldNum;
      expect(oldNum).assertEqual(9007199254740992);
      let newNum = 9007199254740992n;
      ++newNum;
      expect(newNum).assertEqual(9007199254740993n);
      expect(typeof (newNum)).assertEqual("bigint");
      expect(typeof 123n).assertEqual("bigint");
      expect(123n).assertEqual(123n);
      expect(0xFFn).assertEqual(255n);
      expect(0b1101n).assertEqual(13n);
      expect(0o777n).assertEqual(511n);

      const priceInCents = 123_000_000n;
      expect(priceInCents).assertEqual(123000000n);
      expect(123n * 456n).assertEqual(56088n);
      expect(6n + ' apples').assertEqual("6 apples");
      expect(1n / 2n).assertEqual(0n);
      expect(-(-64n)).assertEqual(64n);

      expect(17n <= 17n).assertEqual(true);
      expect(3n > -1n).assertEqual(true);
      expect(3n > -1).assertEqual(true);

      expect(~0b10n).assertEqual(-3n);
      expect(0b1010n | 0b0111n).assertEqual(15n);
      expect(0b1010n & 0b0111n).assertEqual(2n);
      expect(0b1010n | -1n).assertEqual(-1n);
      expect(0b1010n & -1n).assertEqual(10n);
      expect(-1n >> 20n).assertEqual(-1n);

      let res: boolean;
      if (0n) {
        res = true;
      } else {
        res = false;
      }
      expect(res).assertFalse();

      expect(BigInt(false)).assertEqual(0n);
      expect(BigInt(123)).assertEqual(123n);
      expect(BigInt("123")).assertEqual(123n);
      expect(BigInt.asUintN(64, 12345n * 67890n)).assertEqual(838102050n);
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ES2020NewFeatures_0007
     * @tc.name      : testString.prototype.matchAll
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testString.prototype.matchAll', 0, () => {
      expect(test2020_07_ans).assertEqual("foo,bar,baz");
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ES2020NewFeatures_0008
     * @tc.name      : testPromise.allSettled
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPromise.allSettled', 0, () => {
      Promise.allSettled([
        Promise.reject(1),
        Promise.resolve(0),
        Promise.resolve(0)
      ]).then(res => {
        const firstRes = res[0] as PromiseRejectedResult;
        const secondRes = res[1] as PromiseFulfilledResult<Number>;
        const thirdRes = res[1] as PromiseFulfilledResult<Number>;
        expect(firstRes.status).assertEqual("rejected");
        expect(firstRes.reason).assertEqual(1);
        expect(secondRes.status).assertEqual("fulfilled");
        expect(secondRes.value).assertEqual(0);
        expect(thirdRes.status).assertEqual("fulfilled");
        expect(thirdRes.value).assertEqual(0);
      })
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ES2020NewFeatures_0009
     * @tc.name      : testGlobalThis
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testGlobalThis', 0, () => {
      expect(test2020_09_ans).assertEqual("Hello world");
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ES2020NewFeatures_0010
     * @tc.name      : test for...in
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test for...in', 0, () => {
      expect(test2020_10_ans).assertDeepEquals(['1', '2', '3', 'x2', 'x1', '3XX'])
    })
  })
}