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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import hilog from '@ohos.hilog'
import Utils from './Util.test';
export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function EsBigIntTest(){
  describe('EsBigIntTest', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number ES_BUILTINS_BIGINT_0001
     * @tc.name ESBigIntTest0001
     * @tc.desc Test ES Builtins-Api in BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESBigIntTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESBigIntTest0001';
      console.info(`${caseName}, test start`);
      expect(new BigInt("")).assertEqual(0n);
      expect(new BigInt(" ")).assertEqual(0n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_BIGINT_0002
     * @tc.name ESBigIntTest0002
     * @tc.desc Test ES Builtins-Api in BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESBigIntTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESBigIntTest0002';
      console.info(`${caseName}, test start`);
      expect(new BigInt("0b1111")).assertEqual(15n);
      expect(new BigInt("0b10")).assertEqual(2n);
      expect(new BigInt("0b0")).assertEqual(0n);
      expect(new BigInt("0b1")).assertEqual(1n);
      let binaryString = "0b1";
      for (let i = 0; i < 128; i++)
        binaryString += "0";
      expect(new BigInt(binaryString)).assertEqual(340282366920938463463374607431768211456n);
      expect(new BigInt("0B1111")).assertEqual(15n);
      expect(new BigInt("0B10")).assertEqual(2n);
      expect(new BigInt("0B0")).assertEqual(0n);
      expect(new BigInt("0B1")).assertEqual(1n);
      binaryString = "0B1";
      for (let i = 0; i < 128; i++)
        binaryString += "0";
      expect(new BigInt(binaryString)).assertEqual(340282366920938463463374607431768211456n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_BIGINT_0003
     * @tc.name ESBigIntTest0003
     * @tc.desc Test ES Builtins-Api in BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESBigIntTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESBigIntTest0003';
      console.info(`${caseName}, test start`);
      expect(new BigInt("10")).assertEqual(10n);
      expect(new BigInt("18446744073709551616")).assertEqual(18446744073709551616n);
      expect(new BigInt("7")).assertEqual(7n);
      expect(new BigInt("88")).assertEqual(88n);
      expect(new BigInt("900")).assertEqual(900n);
      expect(new BigInt("-10")).assertEqual(-10n);
      expect(new BigInt("-18446744073709551616")).assertEqual(-18446744073709551616n);
      expect(new BigInt("-7")).assertEqual(-7n);
      expect(new BigInt("-88")).assertEqual(-88n);
      expect(new BigInt("-900")).assertEqual(-900n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_BIGINT_0004
     * @tc.name ESBigIntTest0004
     * @tc.desc Test ES Builtins-Api in BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESBigIntTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESBigIntTest0004';
      console.info(`${caseName}, test start`);
      expect(new BigInt("0xa")).assertEqual(10n);
      expect(new BigInt("0xff")).assertEqual(255n);
      expect(new BigInt("0xfabc")).assertEqual(64188n);
      expect(new BigInt("0xfffffffffffffffffff")).assertEqual(75557863725914323419135n);
      expect(new BigInt("0Xa")).assertEqual(10n);
      expect(new BigInt("0Xff")).assertEqual(255n);
      expect(new BigInt("0Xfabc")).assertEqual(64188n);
      expect(new BigInt("0Xfffffffffffffffffff")).assertEqual(75557863725914323419135n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_BIGINT_0005
     * @tc.name ESBigIntTest0005
     * @tc.desc Test ES Builtins-Api in BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESBigIntTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESBigIntTest0005';
      console.info(`${caseName}, test start`);
      expect(new BigInt("0o7")).assertEqual(7n);
      expect(new BigInt("0o10")).assertEqual(8n);
      expect(new BigInt("0o20")).assertEqual(16n);
      expect(new BigInt("0O7")).assertEqual(7n);
      expect(new BigInt("0O10")).assertEqual(8n);
      expect(new BigInt("0O20")).assertEqual(16n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_BIGINT_0006
     * @tc.name ESBigIntTest0006
     * @tc.desc Test ES Builtins-Api in BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESBigIntTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESBigIntTest0006';
      console.info(`${caseName}, test start`);
      let threw = false;
      try {
        BigInt("10n");
        expect(false).assertTrue();
      } catch (e) {
        threw = true;
        expect(threw).assertEqual(true);
        threw = false;
      }

      try {
        BigInt("10x");
        expect(false).assertTrue();
      } catch (e) {
        threw = true;
        expect(threw).assertEqual(true);
        threw = false;
      }

      try {
        BigInt("10b");
        expect(false).assertTrue();
      } catch (e) {
        threw = true;
        expect(threw).assertEqual(true);
        threw = false;
      }

      try {
        BigInt("10.5");
        expect(false).assertTrue();
      } catch (e) {
        threw = true;
        expect(threw).assertEqual(true);
        threw = false;
      }

      try {
        BigInt("0b");
        expect(false).assertTrue();
      } catch (e) {
        threw = true;
        expect(threw).assertEqual(true);
        threw = false;
      }

      try {
        BigInt("-0x1");
        expect(false).assertTrue();
      } catch (e) {
        threw = true;
        expect(threw).assertEqual(true);
        threw = false;
      }

      try {
        BigInt("-0XFFab");
        expect(false).assertTrue();
      } catch (e) {
        threw = true;
        expect(threw).assertEqual(true);
        threw = false;
      }

      try {
        BigInt("000 12");
        expect(false).assertTrue();
      } catch (e) {
        threw = true;
        expect(threw).assertEqual(true);
        threw = false;
      }

      try {
        BigInt("0o");
        expect(false).assertTrue();
      } catch (e) {
        threw = true;
        expect(threw).assertEqual(true);
        threw = false;
      }

      try {
        BigInt("0x");
        expect(false).assertTrue();
      } catch (e) {
        threw = true;
        expect(threw).assertEqual(true);
        threw = false;
      }

      try {
        BigInt("00o");
        expect(false).assertTrue();
      } catch (e) {
        threw = true;
        expect(threw).assertEqual(true);
        threw = false;
      }

      try {
        BigInt("00b");
        expect(false).assertTrue();
      } catch (e) {
        threw = true;
        expect(threw).assertEqual(true);
        threw = false;
      }

      try {
        BigInt("00x");
        expect(false).assertTrue();
      } catch (e) {
        threw = true;
        expect(threw).assertEqual(true);
        threw = false;
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_BIGINT_0007
     * @tc.name ESBigIntTest0007
     * @tc.desc Test ES Builtins-Api in BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESBigIntTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESBigIntTest0007';
      console.info(`${caseName}, test start`);
      expect(new BigInt(Number.MAX_SAFE_INTEGER)).assertEqual(9007199254740991n);
      expect(new BigInt(-Number.MAX_SAFE_INTEGER)).assertEqual(-9007199254740991n);
      expect(new BigInt(Number.MAX_SAFE_INTEGER + 1)).assertEqual(9007199254740992n);
      expect(new BigInt(-Number.MAX_SAFE_INTEGER - 1)).assertEqual(-9007199254740992n);
      expect(new BigInt(Number.MAX_SAFE_INTEGER + 2)).assertEqual(9007199254740992n);
      expect(new BigInt(-Number.MAX_SAFE_INTEGER - 2)).assertEqual(-9007199254740992n);
      expect(new BigInt(Number.MAX_SAFE_INTEGER + 3)).assertEqual(9007199254740994n);
      expect(new BigInt(-Number.MAX_SAFE_INTEGER - 3)).assertEqual(-9007199254740994n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_BIGINT_0008
     * @tc.name ESBigIntTest0008
     * @tc.desc Test ES Builtins-Api in BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESBigIntTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESBigIntTest0008';
      console.info(`${caseName}, test start`);
      expect(new BigInt("18446744073709551616   ")).assertEqual(18446744073709551616n);
      expect(new BigInt("   7   ")).assertEqual(7n);
      expect(new BigInt("   -197   ")).assertEqual(-197n);
      expect(new BigInt("     ")).assertEqual(0n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_BIGINT_0009
     * @tc.name ESBigIntTest0009
     * @tc.desc Test ES Builtins-Api in BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESBigIntTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESBigIntTest0009';
      console.info(`${caseName}, test start`);
      expect(BigInt.asUintN(0, -2n)).assertEqual(0n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_BIGINT_0010
     * @tc.name ESBigIntTest0010
     * @tc.desc Test ES Builtins-Api in BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESBigIntTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESBigIntTest0010';
      console.info(`${caseName}, test start`);
      let getBI = (data: int, ...dataEx: int[]): BigInt =>{
        let bi: BigInt = 0n;
        if (data < 0){
          bi = new BigInt(data & 0x7fffffff) + 2147483648n
        } else {
          bi = new BigInt(data)
        }
        let xishu = 4294967296n;
        for(let i = 0;i < dataEx.length; i++) {
          if(dataEx[i] < 0) {
            let tmp: BigInt = new BigInt(dataEx[i] & 0x7fffffff) + 2147483648n
            bi = tmp * xishu + bi;
          } else {
            bi = new BigInt(dataEx[i]) * xishu + bi;
          }
          xishu *= 4294967296n;
        }
        return bi;
      }
      expect(BigInt.asIntN(0, -2n)).assertEqual(0n);
      expect(BigInt.asIntN(0, -1n)).assertEqual(0n);
      expect(BigInt.asIntN(0, 0n)).assertEqual(0n);
      expect(BigInt.asIntN(0, 1n)).assertEqual(0n);
      expect(BigInt.asIntN(0, 2n)).assertEqual(0n);
      expect(BigInt.asIntN(1, -3n)).assertEqual(-1n);
      expect(BigInt.asIntN(1, -2n)).assertEqual(0n);
      expect(BigInt.asIntN(1, -1n)).assertEqual(-1n);
      expect(BigInt.asIntN(1, 0n)).assertEqual(0n);
      expect(BigInt.asIntN(1, 1n)).assertEqual(-1n);
      expect(BigInt.asIntN(1, 2n)).assertEqual(0n);
      expect(BigInt.asIntN(1, 3n)).assertEqual(-1n);
      expect(BigInt.asIntN(1, -123456789012345678901n)).assertEqual(-1n);
      expect(BigInt.asIntN(1, -123456789012345678900n)).assertEqual(0n);
      expect(BigInt.asIntN(1, 123456789012345678900n)).assertEqual(0n);
      expect(BigInt.asIntN(1, 123456789012345678901n)).assertEqual(-1n);
      expect(BigInt.asIntN(2, -3n)).assertEqual(1n);
      expect(BigInt.asIntN(2, -2n)).assertEqual(-2n);
      expect(BigInt.asIntN(2, -1n)).assertEqual(-1n);
      expect(BigInt.asIntN(2, 0n)).assertEqual(0n);
      expect(BigInt.asIntN(2, 1n)).assertEqual(1n);
      expect(BigInt.asIntN(2, 2n)).assertEqual(-2n);
      expect(BigInt.asIntN(2, 3n)).assertEqual(-1n);
      expect(BigInt.asIntN(2, -123456789012345678901n)).assertEqual(-1n);
      expect(BigInt.asIntN(2, -123456789012345678900n)).assertEqual(0n);
      expect(BigInt.asIntN(2, 123456789012345678900n)).assertEqual(0n);
      expect(BigInt.asIntN(2, 123456789012345678901n)).assertEqual(1n);
      expect(BigInt.asIntN(8, new BigInt(0xab))).assertEqual(new BigInt(-0x55));
      expect(BigInt.asIntN(8, new BigInt(0xabcd))).assertEqual(new BigInt(-0x33));
      expect(BigInt.asIntN(8, new BigInt(0xabcdef) * 256n + 1n)).assertEqual(new BigInt(0x01));
      let bi1: BigInt = getBI(0xcdef0123.toInt(), 0x456789ab, 0xcdef0123.toInt(), 0xab);
      expect(BigInt.asIntN(8, bi1)).assertEqual(new BigInt(0x23));
      bi1 = getBI(0xcdef0183.toInt(), 0x456789ab, 0xcdef0123.toInt(), 0xab);
      expect(BigInt.asIntN(8, bi1)).assertEqual(new BigInt(-0x7d));
      bi1 = getBI(0x89abcdef.toInt(), 0x01234567, 0xabcdef);
      let bi2: BigInt = getBI(0x89abcdef.toInt(), 0x01234567);
      expect(BigInt.asIntN(64, bi1)).assertEqual(bi2);
      bi2 = getBI(0x76543211, 0xfedcba98.toInt());
      expect(BigInt.asIntN(65, bi1)).assertEqual(-bi2);
      bi1 = getBI(0xffffffff.toInt(), 0xffffffff.toInt(), 0xffffffff.toInt(), 0xffffffff.toInt(),
        0xffffffff.toInt(), 0xffffffff.toInt(), 0xcff);
      expect(BigInt.asIntN(200, bi1)).assertEqual(-1n);
      bi2 = getBI(0xffffffff.toInt(), 0xffffffff.toInt(), 0xffffffff.toInt(), 0xffffffff.toInt(),
        0xffffffff.toInt(), 0xffffffff.toInt(), 0xff);
      expect(BigInt.asIntN(201, bi1)).assertEqual(bi2);
      bi1 = getBI(0x3ad5fc54, 0x05650a60, 0x0e55df96, 0x2cffea66, 0xb65fedb3.toInt(), 0xe081df68.toInt(), 0xc89);
      bi2 = getBI(0xc52a03ac.toInt(), 0xfa9af59f.toInt(), 0xf1aa2069.toInt(), 0xd3001599.toInt(),
        0x49a0124c, 0x1f7e2097, 0x76);
      expect(BigInt.asIntN(200, bi1)).assertEqual(-bi2);
      bi2 = getBI(0x3ad5fc54, 0x05650a60, 0x0e55df96, 0x2cffea66, 0xb65fedb3.toInt(), 0xe081df68.toInt(), 0x89);
      expect(BigInt.asIntN(201, bi1)).assertEqual(bi2);
      console.info(`${caseName}, test end`);
    });

    // /**
    //  * @tc.number ES_BUILTINS_BIGINT_0011
    //  * @tc.name ESBigIntTest0011
    //  * @tc.desc Test ES Builtins-Api in BigInt
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level 1
    //  */
    // it('ESBigIntTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
    //   const caseName = 'ESBigIntTest0011';
    //   console.info(`${caseName}, test start`);
    //   expect(typeof BigInt.asIntN).assertEqual('function');
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.number ES_BUILTINS_BIGINT_0012
     * @tc.name ESBigIntTest0012
     * @tc.desc Test ES Builtins-Api in BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESBigIntTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESBigIntTest0012';
      console.info(`${caseName}, test start`);
      expect(BigInt.asIntN(2, 0n)).assertEqual(0n);
      expect(BigInt.asIntN(2, -0n)).assertEqual(0n);
      expect(BigInt.asIntN(3, 10n)).assertEqual(2n);
      expect(BigInt.asIntN(4, 12345678901234567890003n)).assertEqual(3n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_BIGINT_0013
     * @tc.name ESBigIntTest0013
     * @tc.desc Test ES Builtins-Api in BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESBigIntTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESBigIntTest0013';
      console.info(`${caseName}, test start`);
      expect(BigInt.asIntN(0, 1n)).assertEqual(0n);
      expect(BigInt.asIntN(1, 1n)).assertEqual(-1n);
      expect(BigInt.asIntN(-0.9, 1n)).assertEqual(0n);
      expect(BigInt.asIntN(0.9, 1n)).assertEqual(0n);
      expect(BigInt.asIntN(NaN, 1n)).assertEqual(0n);
      expect(BigInt.asIntN(3, 10n)).assertEqual(2n);
      expect(BigInt.asIntN(3.9, 10n)).assertEqual(2n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_BIGINT_0014
     * @tc.name ESBigIntTest0014
     * @tc.desc Test ES Builtins-Api in BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESBigIntTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESBigIntTest0014';
      console.info(`${caseName}, test start`);
      let getBI = (data: int, ...dataEx: int[]): BigInt => {
        let bi: BigInt = 0n;
        if (data < 0) {
          bi = new BigInt(data & 0x7fffffff) + 2147483648n;
      } else {
          bi = new BigInt(data);
      }
      let xishu = 4294967296n;
      for(let i = 0;i < dataEx.length; i++) {
        if(dataEx[i] < 0) {
          let tmp: BigInt = new BigInt(dataEx[i] & 0x7fffffff) + 2147483648n;
          bi = tmp * xishu + bi;
      } else {
          bi = new BigInt(dataEx[i]) * xishu + bi;
      }
        xishu *= 4294967296n;
      }
    return bi;
    }
    expect(BigInt.asUintN(0, -2n)).assertEqual(0n);
    expect(BigInt.asUintN(0, -1n)).assertEqual(0n);
    expect(BigInt.asUintN(0, 0n)).assertEqual(0n);
    expect(BigInt.asUintN(0, 1n)).assertEqual(0n);
    expect(BigInt.asUintN(0, 2n)).assertEqual(0n);
    expect(BigInt.asUintN(1, -3n)).assertEqual(1n);
    expect(BigInt.asUintN(1, -2n)).assertEqual(0n);
    expect(BigInt.asUintN(1, -1n)).assertEqual(1n);
    expect(BigInt.asUintN(1, 0n)).assertEqual(0n);
    expect(BigInt.asUintN(1, 1n)).assertEqual(1n);
    expect(BigInt.asUintN(1, 2n)).assertEqual(0n);
    expect(BigInt.asUintN(1, 3n)).assertEqual(1n);
    expect(BigInt.asUintN(1, -123456789012345678901n)).assertEqual(1n);
    expect(BigInt.asUintN(1, -123456789012345678900n)).assertEqual(0n);
    expect(BigInt.asUintN(1, 123456789012345678900n)).assertEqual(0n);
    expect(BigInt.asUintN(1, 123456789012345678901n)).assertEqual(1n);
    expect(BigInt.asUintN(2, -3n)).assertEqual(1n);
    expect(BigInt.asUintN(2, -2n)).assertEqual(2n);
    expect(BigInt.asUintN(2, -1n)).assertEqual(3n);
    expect(BigInt.asUintN(2, 0n)).assertEqual(0n);
    expect(BigInt.asUintN(2, 1n)).assertEqual(1n);
    expect(BigInt.asUintN(2, 2n)).assertEqual(2n);
    expect(BigInt.asUintN(2, 3n)).assertEqual(3n);
    expect(BigInt.asUintN(2, -123456789012345678901n)).assertEqual(3n);
    expect(BigInt.asUintN(2, -123456789012345678900n)).assertEqual(0n);
    expect(BigInt.asUintN(2, 123456789012345678900n)).assertEqual(0n);
    expect(BigInt.asUintN(2, 123456789012345678901n)).assertEqual(1n);
    expect(BigInt.asUintN(8, new BigInt(0xab))).assertEqual(new BigInt(0xab));
    expect(BigInt.asUintN(8, new BigInt(0xabcd))).assertEqual(new BigInt(0xcd));
    expect(BigInt.asUintN(8, new BigInt(0xabcdef) * 256n + 1n)).assertEqual(new BigInt(0x01));
    let bi1: BigInt = getBI(0xcdef0123.toInt(), 0x456789ab, 0xcdef0123.toInt(), 0xab);
    expect(BigInt.asUintN(8, bi1)).assertEqual(new BigInt(0x23));
    bi1 = getBI(0xcdef0183.toInt(), 0x456789ab, 0xcdef0123.toInt(), 0xab);
    expect(BigInt.asUintN(8, bi1)).assertEqual(new BigInt(0x83));
    bi1 = getBI(0x89abcdef.toInt(), 0x01234567, 0xabcdef);
    let bi2: BigInt = getBI(0x89abcdef.toInt(), 0x01234567);
    expect(BigInt.asUintN(64, bi1)).assertEqual(bi2);
    bi2 = getBI(0x89abcdef.toInt(), 0x01234567, 0x1);
    expect(BigInt.asUintN(65, bi1)).assertEqual(bi2);
    bi1 = getBI(0xffffffff.toInt(), 0xffffffff.toInt(), 0xffffffff.toInt(), 0xffffffff.toInt(),
      0xffffffff.toInt(), 0xffffffff.toInt(), 0xbff);
    bi2 = getBI(0xffffffff.toInt(), 0xffffffff.toInt(), 0xffffffff.toInt(), 0xffffffff.toInt(),
      0xffffffff.toInt(), 0xffffffff.toInt(), 0x0ff);
    expect(BigInt.asUintN(200, bi1)).assertEqual(bi2);
    bi2 = getBI(0xffffffff.toInt(), 0xffffffff.toInt(), 0xffffffff.toInt(), 0xffffffff.toInt(),
      0xffffffff.toInt(), 0xffffffff.toInt(), 0x1ff);
    expect(BigInt.asUintN(201, bi1)).assertEqual(bi2);
    bi1 = getBI(0x3ad5fc54, 0x05650a60, 0x0e55df96, 0x2cffea66, 0xb65fedb3.toInt(), 0xe081df68.toInt(), 0xb89);
    bi2 = getBI(0x3ad5fc54, 0x05650a60, 0x0e55df96, 0x2cffea66, 0xb65fedb3.toInt(), 0xe081df68.toInt(), 0x089);
    expect(BigInt.asUintN(200, bi1)).assertEqual(bi2);
    bi2 = getBI(0x3ad5fc54, 0x05650a60, 0x0e55df96, 0x2cffea66, 0xb65fedb3.toInt(), 0xe081df68.toInt(), 0x189);
    expect(BigInt.asUintN(201, bi1)).assertEqual(bi2);
    console.info(`${caseName}, test end`);
});


    // /**
    //  * @tc.number ES_BUILTINS_BIGINT_0015
    //  * @tc.name ESBigIntTest0015
    //  * @tc.desc Test ES Builtins-Api in BigInt
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level 1
    //  */
    // it('ESBigIntTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
    //   const caseName = 'ESBigIntTest0015';
    //   console.info(`${caseName}, test start`);
    //   expect(typeof BigInt.asUintN).assertEqual('function');
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.number ES_BUILTINS_BIGINT_0016
     * @tc.name ESBigIntTest0016
     * @tc.desc Test ES Builtins-Api in BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESBigIntTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESBigIntTest0016';
      console.info(`${caseName}, test start`);
      expect(BigInt.asUintN(2, 0n)).assertEqual(0n);
      expect(BigInt.asUintN(2, -0n)).assertEqual(0n);
      expect(BigInt.asUintN(3, 10n)).assertEqual(2n);
      expect(BigInt.asUintN(4, 12345678901234567890003n)).assertEqual(3n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_BIGINT_0017
     * @tc.name ESBigIntTest0017
     * @tc.desc Test ES Builtins-Api in BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESBigIntTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESBigIntTest0017';
      console.info(`${caseName}, test start`);
      expect(BigInt.asUintN(0, 1n)).assertEqual(0n);
      expect(BigInt.asUintN(1, 1n)).assertEqual(1n);
      expect(BigInt.asUintN(-0.9, 1n)).assertEqual(0n);
      expect(BigInt.asUintN(0.9, 1n)).assertEqual(0n);
      expect(BigInt.asUintN(NaN, 1n)).assertEqual(0n);
      expect(BigInt.asUintN(3, 10n)).assertEqual(2n);
      expect(BigInt.asUintN(3.9, 10n)).assertEqual(2n);
      console.info(`${caseName}, test end`);
    });
})
}
