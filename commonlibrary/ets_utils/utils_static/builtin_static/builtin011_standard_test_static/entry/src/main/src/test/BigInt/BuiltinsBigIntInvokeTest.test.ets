/*
* Copyright (c) 2026 RKH Corp.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

function init(size: number): string {
  if (size <= 0) {
    return '[]';
  }
  const item = '{"a":1},';
  const repeatCount = Math.floor((size - 2) / item.length);
  let ans = '[';
  for (let i = 0; i < repeatCount && ans.length < size - 10; i++) {
    ans += item;
  }
  ans += '{"a":1}]';
  return ans;
}

export default function BuiltinsBigIntInvokeTest(): void {
  describe("BuiltinsBigIntInvokeTest", () => {
    beforeAll(() => {})
    beforeEach(async () => {
      await Utils.msSleep(100);
    })
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name    builtinsBigIntInvokeTest0100
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_0100
     * @tc.desc    Verify $_invoke with zero (Level0 smoke test)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBigIntInvokeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigInt = new BigInt(0);
      const result = BigInt.$_invoke(bigInt);
      expect(result.equals(bigInt)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest0200
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_0200
     * @tc.desc    Verify $_invoke with simple positive integer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt(10);
      const result = BigInt.$_invoke(bigInt);
      expect(result.equals(bigInt)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest0300
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_0300
     * @tc.desc    Verify $_invoke with simple negative integer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt(-10);
      const result = BigInt.$_invoke(bigInt);
      expect(result.equals(bigInt)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest0400
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_0400
     * @tc.desc    Verify $_invoke with positive one
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt(1);
      const result = BigInt.$_invoke(bigInt);
      expect(result.equals(bigInt)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest0500
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_0500
     * @tc.desc    Verify $_invoke with negative one
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt(-1);
      const result = BigInt.$_invoke(bigInt);
      expect(result.equals(bigInt)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest0600
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_0600
     * @tc.desc    Verify $_invoke with large value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt("1000000000000000000000000");
      const result = BigInt.$_invoke(bigInt);
      expect(result.equals(bigInt)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest0700
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_0700
     * @tc.desc    Verify $_invoke with max safe integer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBigIntInvokeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bigInt = new BigInt(9007199254740991);
      const result = BigInt.$_invoke(bigInt);
      expect(result.equals(bigInt)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest0800
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_0800
     * @tc.desc    Verify $_invoke with hex value 0xdecafafecacefade
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt("0xdecafafecacefade");
      const result = BigInt.$_invoke(bigInt);
      expect(result.equals(bigInt)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest0900
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_0900
     * @tc.desc    Verify $_invoke with very large negative value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBigIntInvokeTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bigInt = new BigInt("-1000000000000000000000000");
      const result = BigInt.$_invoke(bigInt);
      expect(result.equals(bigInt)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest1000
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_1000
     * @tc.desc    Verify $_invoke with large hex value 0xffffffffffffffff
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBigIntInvokeTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bigInt = new BigInt("0xffffffffffffffff");
      const result = BigInt.$_invoke(bigInt);
      expect(result.equals(bigInt)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest1100
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_1100
     * @tc.desc    Verify $_invoke with boolean true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = BigInt.$_invoke(true);
      const expected = new BigInt(1);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest1200
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_1200
     * @tc.desc    Verify $_invoke with boolean false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = BigInt.$_invoke(false);
      const expected = new BigInt(0);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest1300
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_1300
     * @tc.desc    Verify $_invoke with number 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = BigInt.$_invoke(0);
      const expected = new BigInt(0);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest1400
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_1400
     * @tc.desc    Verify $_invoke with NaN throws RangeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let threwException = "";
      try { BigInt.$_invoke(NaN); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("RangeError");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest1500
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_1500
     * @tc.desc    Verify $_invoke with empty string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = BigInt.$_invoke("");
      const expected = new BigInt(0);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest1600
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_1600
     * @tc.desc    Verify $_invoke with !'s' (false value)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = BigInt.$_invoke(!'s');
      const expected = new BigInt(0);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest1700
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_1700
     * @tc.desc    Verify $_invoke with !0 (true value)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = BigInt.$_invoke(!0);
      const expected = new BigInt(1);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest1800
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_1800
     * @tc.desc    Verify $_invoke with -0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = BigInt.$_invoke(-0);
      const expected = new BigInt(0);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest1900
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_1900
     * @tc.desc    Verify $_invoke with Infinity throws RangeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let threwException = "";
      try { BigInt.$_invoke(Infinity); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("RangeError");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest2000
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_2000
     * @tc.desc    Verify $_invoke with -Infinity throws RangeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let threwException = "";
      try { BigInt.$_invoke(-Infinity); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("RangeError");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest2100
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_2100
     * @tc.desc    Verify $_invoke with Math.floor(1.5)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = BigInt.$_invoke(Math.floor(1.5));
      const expected = new BigInt(1);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest2200
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_2200
     * @tc.desc    Verify $_invoke with Number.MAX_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = BigInt.$_invoke(Number.MAX_VALUE);
      const expected = new BigInt(1.7976931348623157e+308);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest2300
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_2300
     * @tc.desc    Verify $_invoke with Number.MIN_VALUE throws RangeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let threwException = "";
      try { BigInt.$_invoke(Number.MIN_VALUE); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("RangeError");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest2400
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_2400
     * @tc.desc    Verify $_invoke with Number.EPSILON throws RangeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let threwException = "";
      try { BigInt.$_invoke(Number.EPSILON); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("RangeError");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest2500
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_2500
     * @tc.desc    Verify $_invoke with byte min value -128
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = BigInt.$_invoke(-128);
      const expected = new BigInt(-128);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest2600
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_2600
     * @tc.desc    Verify $_invoke with byte max value 127
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = BigInt.$_invoke(127);
      const expected = new BigInt(127);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest2700
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_2700
     * @tc.desc    Verify $_invoke with short min value -32768
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = BigInt.$_invoke(-32768);
      const expected = new BigInt(-32768);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest2800
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_2800
     * @tc.desc    Verify $_invoke with short max value 32767
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = BigInt.$_invoke(32767);
      const expected = new BigInt(32767);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest2900
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_2900
     * @tc.desc    Verify $_invoke with int min value -2147483648
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = BigInt.$_invoke(-2147483648);
      const expected = new BigInt(-2147483648);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest3000
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_3000
     * @tc.desc    Verify $_invoke with int max value 2147483647
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = BigInt.$_invoke(2147483647);
      const expected = new BigInt(2147483647);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest3100
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_3100
     * @tc.desc    Verify $_invoke with long min value -9223372036854775808
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = BigInt.$_invoke(-9223372036854775808);
      const expected = new BigInt(-9223372036854775808);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest3200
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_3200
     * @tc.desc    Verify $_invoke with long max value 9223372036854775807
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = BigInt.$_invoke(9223372036854775807);
      const expected = new BigInt(9223372036854775807);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest3300
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_3300
     * @tc.desc    Verify $_invoke with char max value 65535
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = BigInt.$_invoke(65535);
      const expected = new BigInt(65535);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest3400
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_3400
     * @tc.desc    Verify $_invoke with double 123.456 throws RangeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let threwException = "";
      try { BigInt.$_invoke(123.456); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("RangeError");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest3500
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_3500
     * @tc.desc    Verify $_invoke with special characters throws Error
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let threwException = "";
      try { BigInt.$_invoke(' !"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~'); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("Error");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest3600
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_3600
     * @tc.desc    Verify $_invoke with ASCII characters throws Error
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let threwException = "";
      try { BigInt.$_invoke(' !"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~'); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("Error");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest3700
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_3700
     * @tc.desc    Verify $_invoke with repeated special chars throws Error
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let threwException = "";
      try { BigInt.$_invoke('!!""##$$%%&&\'\'(()))**++,,--..//::;;<<==>>??@@[[\\]]^^__``{{||}}~~'); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("Error");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest3800
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_3800
     * @tc.desc    Verify $_invoke with escape characters throws Error
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let threwException = "";
      try { BigInt.$_invoke('\a\b\f\n\r\t\v\\\'\"\?\0'); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("Error");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest3900
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_3900
     * @tc.desc    Verify $_invoke with unicode emoji throws Error
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let threwException = "";
      try { BigInt.$_invoke('\ud83d\udc46\ud83d\udc7f\ud83d\udc40\ud83d\udcaf\ud83c\udf85\ud83d\ude3c\ud83d\udd27\ud83d\udc87\ud83e\udd3c\u200d\u2642\ufe0f\ud83d\udee2\ud83c\udc04\ud83c\udff4'); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("Error");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest4000
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_4000
     * @tc.desc    Verify $_invoke with invalid unicode throws Error
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let threwException = "";
      try { BigInt.$_invoke('\udc04\ud83d\udff4'); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("Error");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest4100
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_4100
     * @tc.desc    Verify $_invoke with string "0"
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = BigInt.$_invoke("0");
      const expected = new BigInt(0);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest4200
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_4200
     * @tc.desc    Verify $_invoke with string "NaN" throws Error
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let threwException = "";
      try { BigInt.$_invoke("NaN"); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("Error");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest4300
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_4300
     * @tc.desc    Verify tree string throws Error and numeric string succeeds
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBigIntInvokeTest4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const treeString = init(1000);
      const normalString = "1234567890".repeat(100);
      let threwException1 = false, errorName1 = "";
      try { BigInt.$_invoke(treeString); } catch (e) { threwException1 = true; errorName1 = e.name; }
      let threwException2 = false, result2: BigInt | null = null;
      try { result2 = BigInt.$_invoke(normalString); } catch (e) { threwException2 = true; }
      expect(threwException1).assertTrue();
      expect(errorName1).assertEqual("Error");
      expect(threwException2).assertFalse();
      expect(result2 !== null).assertTrue();
      expect(result2!.toString()).assertEqual("1234567890".repeat(100));
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest4400
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_4400
     * @tc.desc    Verify $_invoke with slice string consistency
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBigIntInvokeTest4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const str = "{k1:value1,k2:value2}";
      let allCorrectError = true;
      for (let i = 0; i < 10; i++) {
        const resultStr = str.substring(0, str.length - 2);
        let errorName = "";
        try { BigInt.$_invoke(resultStr); } catch (e) { errorName = e.name; }
        if (errorName !== "Error") { allCorrectError = false; break; }
      }
      expect(allCorrectError).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest4500
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_4500
     * @tc.desc    Verify $_invoke with large string throws Error
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsBigIntInvokeTest4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const str = "a".repeat(1000000);
      let threwException = "";
      try { BigInt.$_invoke(str); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("Error");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest4600
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_4600
     * @tc.desc    Verify $_invoke with GC behavior
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsBigIntInvokeTest4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      let largeStr: string | null = "1".repeat(1000);
      let threwException = "";
      try { const result = BigInt.$_invoke(largeStr); expect(result !== null).assertTrue(); } catch (e) { threwException = e.name; }
      largeStr = null;
      expect(threwException).assertEqual("");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest4700
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_4700
     * @tc.desc    Verify $_invoke with BigInt object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigIntObj = new BigInt(123);
      const result = BigInt.$_invoke(bigIntObj);
      const expected = new BigInt(123);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest4800
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_4800
     * @tc.desc    Verify $_invoke with negative BigInt object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigIntObj = new BigInt(-456);
      const result = BigInt.$_invoke(bigIntObj);
      const expected = new BigInt(-456);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest4900
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_4900
     * @tc.desc    Verify $_invoke with Number object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numberObj = new Number(456);
      const result = BigInt.$_invoke(numberObj);
      const expected = new BigInt(456);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest5000
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_5000
     * @tc.desc    Verify $_invoke with negative Number object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numberObj = new Number(-789);
      const result = BigInt.$_invoke(numberObj);
      const expected = new BigInt(-789);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest5100
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_5100
     * @tc.desc    Verify $_invoke with Number(NaN) throws RangeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numberObj = new Number(NaN);
      let threwException = "";
      try { BigInt.$_invoke(numberObj); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("RangeError");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest5200
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_5200
     * @tc.desc    Verify $_invoke with Number(Infinity) throws RangeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numberObj = new Number(Infinity);
      let threwException = "";
      try { BigInt.$_invoke(numberObj); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("RangeError");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest5300
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_5300
     * @tc.desc    Verify $_invoke with Number(-Infinity) throws RangeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest5300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numberObj = new Number(-Infinity);
      let threwException = "";
      try { BigInt.$_invoke(numberObj); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("RangeError");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest5400
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_5400
     * @tc.desc    Verify $_invoke with Number(Math.floor(1.5))
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest5400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numberObj = new Number(Math.floor(1.5));
      const result = BigInt.$_invoke(numberObj);
      const expected = new BigInt(1);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest5500
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_5500
     * @tc.desc    Verify $_invoke with Number(Number.MAX_VALUE)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest5500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numberObj = new Number(Number.MAX_VALUE);
      const result = BigInt.$_invoke(numberObj);
      const expected = new BigInt(1.7976931348623157e+308);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest5600
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_5600
     * @tc.desc    Verify $_invoke with Number(Number.MIN_VALUE) throws RangeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest5600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numberObj = new Number(Number.MIN_VALUE);
      let threwException = "";
      try { BigInt.$_invoke(numberObj); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("RangeError");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest5700
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_5700
     * @tc.desc    Verify $_invoke with Number(Number.EPSILON) throws RangeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest5700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numberObj = new Number(Number.EPSILON);
      let threwException = "";
      try { BigInt.$_invoke(numberObj); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("RangeError");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest5800
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_5800
     * @tc.desc    Verify $_invoke with Number(-128)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest5800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numberObj = new Number(-128);
      const result = BigInt.$_invoke(numberObj);
      const expected = new BigInt(-128);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest5900
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_5900
     * @tc.desc    Verify $_invoke with Number(127)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest5900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numberObj = new Number(127);
      const result = BigInt.$_invoke(numberObj);
      const expected = new BigInt(127);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest6000
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_6000
     * @tc.desc    Verify $_invoke with Number(-32768)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest6000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numberObj = new Number(-32768);
      const result = BigInt.$_invoke(numberObj);
      const expected = new BigInt(-32768);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest6100
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_6100
     * @tc.desc    Verify $_invoke with Number(32767)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest6100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numberObj = new Number(32767);
      const result = BigInt.$_invoke(numberObj);
      const expected = new BigInt(32767);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest6200
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_6200
     * @tc.desc    Verify $_invoke with Number(-2147483648)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest6200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numberObj = new Number(-2147483648);
      const result = BigInt.$_invoke(numberObj);
      const expected = new BigInt(-2147483648);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest6300
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_6300
     * @tc.desc    Verify $_invoke with Number(2147483647)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest6300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numberObj = new Number(2147483647);
      const result = BigInt.$_invoke(numberObj);
      const expected = new BigInt(2147483647);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest6400
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_6400
     * @tc.desc    Verify $_invoke with Number(-9223372036854775808)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest6400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numberObj = new Number(-9223372036854775808);
      const result = BigInt.$_invoke(numberObj);
      const expected = new BigInt(-9223372036854775808);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest6500
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_6500
     * @tc.desc    Verify $_invoke with Number(9007199254740991)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest6500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numberObj = new Number(9007199254740991);
      const result = BigInt.$_invoke(numberObj);
      const expected = new BigInt("9007199254740991");
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest6600
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_6600
     * @tc.desc    Verify $_invoke with Number(65535)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest6600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numberObj = new Number(65535);
      const result = BigInt.$_invoke(numberObj);
      const expected = new BigInt(65535);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest6700
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_6700
     * @tc.desc    Verify $_invoke with Number(123.456) throws RangeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest6700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numberObj = new Number(123.456);
      let threwException = "";
      try { BigInt.$_invoke(numberObj); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("RangeError");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest6800
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_6800
     * @tc.desc    Verify $_invoke with String("undefined") throws Error
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest6800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const stringObj = new String("undefined");
      let threwException = "";
      try { BigInt.$_invoke(stringObj); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("Error");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest6900
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_6900
     * @tc.desc    Verify $_invoke with String("NaN") throws Error
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest6900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const stringObj = new String("NaN");
      let threwException = "";
      try { BigInt.$_invoke(stringObj); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("Error");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest7000
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_7000
     * @tc.desc    Verify $_invoke with String special chars throws Error
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest7000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const stringObj = new String("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
      let threwException = "";
      try { BigInt.$_invoke(stringObj); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("Error");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest7100
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_7100
     * @tc.desc    Verify $_invoke with String ASCII chars throws Error
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest7100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const stringObj = new String("!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
      let threwException = "";
      try { BigInt.$_invoke(stringObj); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("Error");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest7200
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_7200
     * @tc.desc    Verify $_invoke with String repeated special chars throws Error
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest7200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const stringObj = new String("!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
      let threwException = "";
      try { BigInt.$_invoke(stringObj); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("Error");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest7300
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_7300
     * @tc.desc    Verify $_invoke with String escape chars throws Error
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest7300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const stringObj = new String("\\a\\b\\f\\n\\r\\t\\v\\\\\\'\\?\\0\\123\\x41");
      const string2 = new String('\\"');
      let threwException = "";
      try { BigInt.$_invoke(string2); BigInt.$_invoke(stringObj); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("Error");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest7400
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_7400
     * @tc.desc    Verify $_invoke with String unicode emoji throws Error
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest7400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const stringObj = new String("\ud83d\udc46\ud83d\udc7f\ud83d\udc40\ud83d\udcaf\ud83c\udf85\ud83d\ude3c\ud83d\udd27\ud83d\udc87\ud83e\udd3c\u200d\u2642\ufe0f\ud83d\udee2\ud83c\udc04\ud83c\udff4");
      let threwException = "";
      try { BigInt.$_invoke(stringObj); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("Error");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest7500
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_7500
     * @tc.desc    Verify $_invoke with String invalid unicode throws Error
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest7500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const stringObj = new String("\udc04\ud83d\udff4");
      let threwException = "";
      try { BigInt.$_invoke(stringObj); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("Error");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest7600
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_7600
     * @tc.desc    Verify $_invoke with String tree string throws Error
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest7600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const treeString = init(1000);
      const stringObj = new String(treeString);
      let threwException = "";
      try { BigInt.$_invoke(stringObj); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("Error");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest7700
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_7700
     * @tc.desc    Verify $_invoke with String slice string throws Error
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest7700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const str = "{k1:value1,k2:value2}";
      const resultStr = str.substring(0, str.length - 2);
      const stringObj = new String(resultStr);
      for (let i = 0; i < 10; i++) {
        let threwException = "";
        try { BigInt.$_invoke(stringObj); } catch (e) { threwException = e.name; }
        expect(threwException).assertEqual("Error");
      }
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest7800
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_7800
     * @tc.desc    Verify $_invoke with large String throws Error
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest7800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const largeStr = "a".repeat(1000000);
      const stringObj = new String(largeStr);
      let threwException = "";
      try { BigInt.$_invoke(stringObj); } catch (e) { threwException = e.name; }
      expect(threwException).assertEqual("Error");
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest7900
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_7900
     * @tc.desc    Verify $_invoke with String GC behavior
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest7900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let largeStr = "a".repeat(1000000);
      let stringObj = new String(largeStr);
      largeStr = "";
      stringObj = new String("");
      const result = BigInt.$_invoke(stringObj);
      const expected = new BigInt(0);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest8000
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_8000
     * @tc.desc    Verify $_invoke with Boolean(true)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest8000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const booleanObj = new Boolean(true);
      const result = BigInt.$_invoke(booleanObj);
      const expected = new BigInt(1);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest8100
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_8100
     * @tc.desc    Verify $_invoke with Boolean(false)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest8100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const booleanObj = new Boolean(false);
      const result = BigInt.$_invoke(booleanObj);
      const expected = new BigInt(0);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest8200
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_8200
     * @tc.desc    Verify $_invoke with Boolean(0)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest8200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const booleanObj = new Boolean(0);
      const result = BigInt.$_invoke(booleanObj);
      const expected = new BigInt(0);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest8300
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_8300
     * @tc.desc    Verify $_invoke with Boolean(NaN)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest8300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const booleanObj = new Boolean(NaN);
      const result = BigInt.$_invoke(booleanObj);
      const expected = new BigInt(0);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest8400
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_8400
     * @tc.desc    Verify $_invoke with Boolean("")
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest8400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const booleanObj = new Boolean("");
      const result = BigInt.$_invoke(booleanObj);
      const expected = new BigInt(0);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest8500
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_8500
     * @tc.desc    Verify $_invoke with Boolean(null)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest8500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const booleanObj = new Boolean(null);
      const result = BigInt.$_invoke(booleanObj);
      const expected = new BigInt(0);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest8600
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_8600
     * @tc.desc    Verify $_invoke with Boolean(undefined)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest8600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const booleanObj = new Boolean(undefined);
      const result = BigInt.$_invoke(booleanObj);
      const expected = new BigInt(0);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest8700
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_8700
     * @tc.desc    Verify $_invoke with Boolean(!'s')
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest8700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const booleanObj = new Boolean(!'s');
      const result = BigInt.$_invoke(booleanObj);
      const expected = new BigInt(0);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntInvokeTest8800
     * @tc.number  SUB_BUILTINS_BIGINT_INVOKE_TEST_8800
     * @tc.desc    Verify $_invoke with Boolean(!0)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntInvokeTest8800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const booleanObj = new Boolean(!0);
      const result = BigInt.$_invoke(booleanObj);
      const expected = new BigInt(1);
      expect(result.equals(expected)).assertTrue();
    });
  });
}