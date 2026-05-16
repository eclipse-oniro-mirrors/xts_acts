/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it , TestType, Size, Level } from "@ohos/hypium"
import Utils from './Utils'
import math from 'libmathndk.so'

export default function mathNdkTest() {
  describe('MuslMathTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslMathLLround001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LLROUND_0100
     * @tc.desc   test llround
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLLround001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.llround(0);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathLLround002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LLROUND_0200
     * @tc.desc   test llround
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLLround002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.llround(0.5);
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslMathLLround003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LLROUND_0300
     * @tc.desc   test llround
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLLround003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.llround(0.4);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathLLround004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LLROUND_0400
     * @tc.desc   test llround
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLLround004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.llround(-0.5);
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslMathLLround005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LLROUND_0500
     * @tc.desc   test llround
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLLround005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.llround(-0.4);
      expect(result).assertEqual(0);
      done()
    });


    /**
     * @tc.name   testMuslMathLLroundF001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LLROUNDF_0100
     * @tc.desc   test llroundf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLLroundF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.llroundF(0);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathLLroundF002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LLROUNDF_0200
     * @tc.desc   test llroundf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLLroundF002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.llroundF(0.5);
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslMathLLroundF003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LLROUNDF_0300
     * @tc.desc   test llroundf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLLroundF003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.llroundF(0.4);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathLLroundF004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LLROUNDF_0400
     * @tc.desc   test llroundf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLLroundF004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.llroundF(-0.5);
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslMathLLroundF005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LLROUNDF_0500
     * @tc.desc   test llroundf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLLroundF005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.llroundF(-0.4);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathLLroundL001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LLROUNDL_0100
     * @tc.desc   test llroundl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLLroundL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.llroundL(0);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathLLroundL002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LLROUNDL_0200
     * @tc.desc   test llroundl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLLroundL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.llroundL(0.5);
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslMathLLroundL003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LLROUNDL_0300
     * @tc.desc   test llroundl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLLroundL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.llroundL(0.4);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathLLroundL004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LLROUNDL_0400
     * @tc.desc   test llroundl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLLroundL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.llroundL(-0.5);
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslMathLLroundL005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LLROUNDL_0500
     * @tc.desc   test llroundl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLLroundL005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.llroundL(-0.4);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathLLrint001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LLRINT_0100
     * @tc.desc   test llrint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLLrint001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.llrint(0);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathLLrint002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LLRINT_0200
     * @tc.desc   test llrint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLLrint002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.llrint(0.5);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathLLrint003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LLRINT_0300
     * @tc.desc   test llrint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLLrint003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.llrint(0.4);
      expect(result).assertEqual(0);
      done()
    });


    /**
     * @tc.name   testMuslMathLLrintF001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LLRINTF_0100
     * @tc.desc   test llrintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLLrintF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.llrintF(0);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathLLrintF002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LLRINTF_0200
     * @tc.desc   test llrintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLLrintF002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.llrintF(0.5);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathLLrintF003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LLRINTF_0300
     * @tc.desc   test llrintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLLrintF003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.llrintF(0.4);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathLLrintL001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LLRINTL_0100
     * @tc.desc   test llrintl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLLrintL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.llrintL(0);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathLLrintL002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LLRINTL_0200
     * @tc.desc   test llrintl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLLrintL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.llrintL(0.5);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathLLrintL003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LLRINTL_0300
     * @tc.desc   test llrintl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLLrintL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.llrintL(0.4);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathLgammaR002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LGAMMA_R_0200
     * @tc.desc   test lgamma_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLgammaR002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.lgammaR(math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });
    /**
     * @tc.name   testMuslMathLgammaR003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LGAMMA_R_0300
     * @tc.desc   test lgamma_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLgammaR003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.lgammaR(1);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(0.0));
      done()
    });
    /**
     * @tc.name   testMuslMathLgammaR004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LGAMMA_R_0400
     * @tc.desc   test lgamma_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLgammaR004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.lgammaR(2);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(0.0));
      done()
    });

    /**
     * @tc.name   testMuslMathLgammafR002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LGAMMAF_R_0200
     * @tc.desc   test lgammaf_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLgammafR002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.lgammafR(math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });
    /**
     * @tc.name   testMuslMathLgammafR003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LGAMMAF_R_0300
     * @tc.desc   test lgammaf_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLgammafR003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.lgammafR(1);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(0.0));
      done()
    });
    /**
     * @tc.name   testMuslMathLgammafR004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LGAMMAF_R_0400
     * @tc.desc   test lgammaf_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLgammafR004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.lgammafR(2);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(0.0));
      done()
    });

    /**
     * @tc.name   testMuslMathLgammalR002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LGAMMAL_R_0200
     * @tc.desc   test lgammal_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLgammalR002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.lgammalR(math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });
    /**
     * @tc.name   testMuslMathLgammalR003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LGAMMAL_R_0300
     * @tc.desc   test lgammal_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLgammalR003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.lgammalR(1);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(0.0));
      done()
    });
    /**
     * @tc.name   testMuslMathLgammalR004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LGAMMAL_R_0400
     * @tc.desc   test lgammal_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLgammalR004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.lgammalR(2);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(0.0));
      done()
    });

    /**
     * @tc.name   testMuslMathLgamma002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LGAMMA_0200
     * @tc.desc   test lgamma
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLgamma002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.lgamma(math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });
    /**
     * @tc.name   testMuslMathLgamma003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LGAMMA_0300
     * @tc.desc   test lgamma
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLgamma003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.lgamma(1);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(0.0));
      done()
    });
    /**
     * @tc.name   testMuslMathLgamma004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LGAMMA_0400
     * @tc.desc   test lgamma
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLgamma004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.lgamma(2);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(0.0));
      done()
    });

    /**
     * @tc.name   testMuslMathLgammaf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LGAMMAF_0200
     * @tc.desc   test lgammaf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLgammaf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.lgammaf(math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathLgammaf003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LGAMMAF_0300
     * @tc.desc   test lgammaf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLgammaf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.lgammaf(1);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(0.0));
      done()
    });
    /**
     * @tc.name   testMuslMathLgammaf004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LGAMMAF_0400
     * @tc.desc   test lgammaf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLgammaf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.lgammaf(2);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(0.0));
      done()
    });

    /**
     * @tc.name   testMuslMathLgammal002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LGAMMAL_0200
     * @tc.desc   test lgammal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLgammal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.lgammal(math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });
    /**
     * @tc.name   testMuslMathLgammal003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LGAMMAL_0300
     * @tc.desc   test lgammal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLgammal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.lgammal(1);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(0.0));
      done()
    });
    /**
     * @tc.name   testMuslMathLgammal004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LGAMMAL_0400
     * @tc.desc   test lgammal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLgammal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.lgammal(2);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(0.0));
      done()
    });

    /**
     * @tc.name   testMuslMathLdexp001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LDEXP_0100
     * @tc.desc   test ldexp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLdexp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.ldexp(2.3, 3);
      expect(result).assertEqual(18.4);
      done()
    });

    /**
     * @tc.name   testMuslMathLdexp002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LDEXP_0200
     * @tc.desc   test Ldexp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLdexp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.ldexp(Math.sqrt(-1), 2);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathLdexp003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LDEXP_0300
     * @tc.desc   test Ldexp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLdexp003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.ldexp(2.3, 0);
      expect(result).assertEqual(2.3);
      done()
    });
    /**
     * @tc.name   testMuslMathLdexpf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LDEXPF_0200
     * @tc.desc   test Ldexpf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLdexpf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.ldexpf(Math.sqrt(-1), 2);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathLdexpl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LDEXPL_0100
     * @tc.desc   test Ldexpl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLdexpl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.ldexpl(2.3, 3);
      expect(result).assertEqual(18.4);
      done()
    });

    /**
     * @tc.name   testMuslMathLdexpl002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LDEXPL_0200
     * @tc.desc   test Ldexpl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLdexpl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.ldexpl(Math.sqrt(-1), 2);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathLdexpl003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LDEXPL_0300
     * @tc.desc   test Ldexpl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLdexpl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.ldexpl(2.3, 0);
      expect(result).assertEqual(2.3);
      done()
    });

    /**
     * @tc.name   testMuslMathJ0002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_J0_0200
     * @tc.desc   test J0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathJ0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.j0(Math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathJ0003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_J0_0300
     * @tc.desc   test J0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathJ0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.j0(1.7976931348623157e+309);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathJ0f002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_J0F_0200
     * @tc.desc   test J0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathJ0f002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.j0f(Math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathJ0f003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_J0F_0300
     * @tc.desc   test J0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathJ0f003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.j0f(1.7976931348623157e+309);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathJ1001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_J1_0100
     * @tc.desc   test J1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathJ1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.j1(1);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(0.440051));
      done()
    });

    /**
     * @tc.name   testMuslMathJ1002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_J1_0200
     * @tc.desc   test J1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathJ1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.j1(Math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathJ1003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_J1_0300
     * @tc.desc   test J1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathJ1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.j1(1.7976931348623157e+309);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathJ1f001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_J1F_0100
     * @tc.desc   test J1f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathJ1f001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.j1f(1);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(0.440051));
      done()
    });

    /**
     * @tc.name   testMuslMathJ1f002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_J1F_0200
     * @tc.desc   test J1f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathJ1f002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.j1f(Math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathJ1f003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_J1F_0300
     * @tc.desc   test J1f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathJ1f003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.j1f(1.7976931348623157e+309);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathJn001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_JN_0100
     * @tc.desc   test Jn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathJn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.jn(2, 1);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(0.114903));
      done()
    });

    /**
     * @tc.name   testMuslMathJn002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_JN_0200
     * @tc.desc   test Jn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathJn002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.jn(2, Math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathJn003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_JN_0300
     * @tc.desc   test Jn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathJn003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.jn(2, 1.7976931348623157e+309);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathJnf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_JNF_0100
     * @tc.desc   test Jnf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathJnf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.jnf(2, 1);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(0.114903));
      done()
    });

    /**
     * @tc.name   testMuslMathJnf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_JNF_0200
     * @tc.desc   test Jnf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathJnf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.jnf(2, Math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathJnf003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_JNF_0300
     * @tc.desc   test Jnf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathJnf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.jnf(2, 1.7976931348623157e+309);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathRemainder001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_REMAINDER_0100
     * @tc.desc   test remainder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRemainder001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 6.0;
      let param2 = 3.0;
      let result: number = math.remainder(param, param2);
      console.info("Test remainder result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathRemainder002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_REMAINDER_0200
     * @tc.desc   test rmainder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRemainder002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 5.0;
      let param2 = 0;
      let result: number = math.remainder(param, param2);
      console.info("Test remainder result = " + JSON.stringify(result));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathRemainder003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_REMAINDER_0300
     * @tc.desc   text remainder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRemainder003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 18;
      let param2 = 4;
      let result: number = math.remainder(param, param2);
      console.info("Test remainder result = " + JSON.stringify(result));
      expect(result).assertEqual(2);
      done()
    });

    /**
     * @tc.name   testMuslMathRemainderf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_REMAINDERF_0100
     * @tc.desc   test remainderf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRemainderf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 6;
      let param2 = 2;
      let result: number = math.remainderf(param, param2);
      console.info("Test remainderf result = " + JSON.stringify(result));
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.name   testMuslMathRemainderf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_REMAINDERF_0200
     * @tc.desc   test remainderf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRemainderf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 5;
      let param2 = 0;
      let result: number = math.remainderf(param, param2);
      console.info("Test remainderf result = " + JSON.stringify(result));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathRemainderf003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_REMAINDERF_0300
     * @tc.desc   test remainderf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRemainderf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 18;
      let param2 = 4;
      let result: number = math.remainderf(param, param2);
      console.info("Test remainderf result = " + JSON.stringify(result));
      expect(result).assertEqual(2);
      done()
    });

    /**
     * @tc.name   testMuslMathRemainderl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_REMAINDERL_0100
     * @tc.desc   test remainderl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRemainderl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 12.0;
      let param2 = 2;
      let result: number = math.remainderl(param, param2);
      console.info("Test remainderl result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathRemainderl002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_REMAINDERL_0200
     * @tc.desc   test remainderl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRemainderl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 0;
      let param2 = 0;
      let result: number = math.remainderl(param, param2);
      console.info("Test remainderl result = " + JSON.stringify(result));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathRemainderl003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_REMAINDERL_0300
     * @tc.desc   test remainderl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRemainderl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 18;
      let param2 = 4;
      let result: number = math.remainderl(param, param2);
      console.info("Test remainderl result = " + JSON.stringify(result));
      expect(result).assertEqual(2);
      done()
    });

    /**
     * @tc.name   testMuslMathRemquo001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_REMQUO_0100
     * @tc.desc   test remquo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRemquo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 12.5;
      let param2 = 2;
      let param3 = 1;
      let result: number = math.remquo(param, param2, param3);
      console.info("Test remquo result = " + JSON.stringify(result));
      expect(result).assertEqual(0.5);
      done()
    });

    /**
     * @tc.name   testMuslMathRemquo002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_REMQUO_0200
     * @tc.desc   test remquo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRemquo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 12;
      let param2 = 0;
      let param3 = 1;
      let result: number = math.remquo(param, param2, param3);
      console.info("Test remquo result = " + JSON.stringify(result));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathRemquo003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_REMQUO_0300
     * @tc.desc   test remquo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRemquo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = -12.5;
      let param2 = 2;
      let param3 = 1;
      let result: number = math.remquo(param, param2, param3);
      console.info("Test remquo result = " + JSON.stringify(result));
      expect(result).assertEqual(-0.5);
      done()
    });

    /**
     * @tc.name   testMuslMathRemquof001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_REMQUOF_0100
     * @tc.desc   test remquof
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRemquof001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 14.5;
      let param2 = 2;
      let param3 = 1;
      let result: number = math.remquof(param, param2, param3);
      console.info("Test remquof result = " + JSON.stringify(result));
      expect(result).assertEqual(0.5);
      done()
    });

    /**
     * @tc.name   testMuslMathRemquof002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_REMQUOF_0200
     * @tc.desc   test remquof
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRemquof002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 16.0;
      let param2 = 0;
      let param3 = 1;
      let result: number = math.remquof(param, param2, param3);
      console.info("Test remquof result = " + JSON.stringify(result));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathRemquof003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_REMQUOF_0300
     * @tc.desc   test remquof
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRemquof003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = -16.5;
      let param2 = 2;
      let param3 = 1;
      let result: number = math.remquof(param, param2, param3);
      console.info("Test remquof result = " + JSON.stringify(result));
      expect(result).assertEqual(-0.5);
      done()
    });

    /**
     * @tc.name   testMuslMathRemquol001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_REMQUOL_0100
     * @tc.desc   test remquol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRemquol001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 16.5;
      let param2 = 2;
      let param3 = 1;
      let result: number = math.remquol(param, param2, param3);
      console.info("Test remquol result = " + JSON.stringify(result));
      expect(result).assertEqual(0.5);
      done()
    });

    /**
     * @tc.name   testMuslMathRemquol002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_REMQUOL_0200
     * @tc.desc   test remquol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRemquol002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 12.5;
      let param2 = 0;
      let param3 = 1;
      let result: number = math.remquol(param, param2, param3);
      console.info("Test remquol result = " + JSON.stringify(result));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathRemquol003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_REMQUOL_0300
     * @tc.desc   test remquol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRemquol003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = -12.5;
      let param2 = 2;
      let param3 = 1;
      let result: number = math.remquol(param, param2, param3);
      console.info("Test remquol result = " + JSON.stringify(result));
      expect(result).assertEqual(-0.5);
      done()
    });

    /**
     * @tc.name   testMuslMathRint001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_RINT_0100
     * @tc.desc   test rint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRint001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 11.87;
      let result: number = math.rint(param);
      console.info("Test rint result = " + JSON.stringify(result));
      expect(result).assertEqual(12);
      done()
    });

    /**
     * @tc.name   testMuslMathRint002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_RINT_0200
     * @tc.desc   test rint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRint002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = -11.87;
      let result: number = math.rint(param);
      console.info("Test rint result = " + JSON.stringify(result));
      expect(result).assertEqual(-12);
      done()
    });

    /**
     * @tc.name   testMuslMathRint003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_RINT_0300
     * @tc.desc   test rint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRint003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 11.2;
      let result: number = math.rint(param);
      console.info("Test rint result = " + JSON.stringify(result));
      expect(result).assertEqual(11);
      done()
    });

    /**
     * @tc.name   testMuslMathRintf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_RINTF_0100
     * @tc.desc   test rintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRintf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 11.87;
      let result: number = math.rintf(param);
      console.info("Test rintf result = " + JSON.stringify(result));
      expect(result).assertEqual(12);
      done()
    });

    /**
     * @tc.name   testMuslMathRintf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_RINTF_0200
     * @tc.desc   test rintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRintf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = -11.87;
      let result: number = math.rintf(param);
      console.info("Test rintF result = " + JSON.stringify(result));
      expect(result).assertEqual(-12);
      done()
    });

    /**
     * @tc.name   testMuslMathRintf003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_RINTF_0300
     * @tc.desc   test rintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRintf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 11.2;
      let result: number = math.rintf(param);
      console.info("Test rintf result = " + JSON.stringify(result));
      expect(result).assertEqual(11);
      done()
    });

    /**
     * @tc.name   testMuslMathRintl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_RINTL_0100
     * @tc.desc   test rintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRintl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 11.87;
      let result: number = math.rintl(param);
      console.info("Test rintl result = " + JSON.stringify(result));
      expect(result).assertEqual(12);
      done()
    });

    /**
     * @tc.name   testMuslMathRintl002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_RINTL_0200
     * @tc.desc   test rintl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRintl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = -11.87;
      let result: number = math.rintl(param);
      console.info("Test rintl result = " + JSON.stringify(result));
      expect(result).assertEqual(-12);
      done()
    });

    /**
     * @tc.name   testMuslMathRintl003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_RINTL_0300
     * @tc.desc   test rintl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRintl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 11.2;
      let result: number = math.rintl(param);
      console.info("Test rintl result = " + JSON.stringify(result));
      expect(result).assertEqual(11);
      done()
    });

    /**
     * @tc.name   testMuslMathRound001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ROUND_0100
     * @tc.desc   test round
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRound001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 11.87;
      let result: number = math.round(param);
      console.info("Test round result = " + JSON.stringify(result));
      expect(result).assertEqual(12);
      done()
    });

    /**
     * @tc.name   testMuslMathRound002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ROUND_0200
     * @tc.desc   test round
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRound002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = -11.87;
      let result: number = math.round(param);
      console.info("Test round result = " + JSON.stringify(result));
      expect(result).assertEqual(-12);
      done()
    });

    /**
     * @tc.name   testMuslMathRound003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ROUND_0300
     * @tc.desc   test round
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRound003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 11.2;
      let result: number = math.round(param);
      console.info("Test round result = " + JSON.stringify(result));
      expect(result).assertEqual(11);
      done()
    });

    /**
     * @tc.name   testMuslMathRoundf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ROUNDF_0100
     * @tc.desc   test roundf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRoundf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 11.87;
      let result: number = math.roundf(param);
      console.info("Test roundf result = " + JSON.stringify(result));
      expect(result).assertEqual(12);
      done()
    });

    /**
     * @tc.name   testMuslMathRoundf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ROUNDF_0200
     * @tc.desc   test roundf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRoundf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = -11.87;
      let result: number = math.roundf(param);
      console.info("Test roundf result = " + JSON.stringify(result));
      expect(result).assertEqual(-12);
      done()
    });

    /**
     * @tc.name   testMuslMathRoundf003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ROUNDF_0300
     * @tc.desc   test roundf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRoundf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 11.2;
      let result: number = math.roundf(param);
      console.info("Test roundf result = " + JSON.stringify(result));
      expect(result).assertEqual(11);
      done()
    });

    /**
     * @tc.name   testMuslMathRoundl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ROUNDL_0100
     * @tc.desc   test roundl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRoundl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 11.87;
      let result: number = math.roundl(param);
      console.info("Test roundl result = " + JSON.stringify(result));
      expect(result).assertEqual(12);
      done()
    });

    /**
     * @tc.name   testMuslMathRoundl002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ROUNDL_0200
     * @tc.desc   test roundl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRoundl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = -11.87;
      let result: number = math.roundl(param);
      console.info("Test roundl result = " + JSON.stringify(result));
      expect(result).assertEqual(-12);
      done()
    });

    /**
     * @tc.name   testMuslMathRoundl003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ROUNDL_0300
     * @tc.desc   test roundl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathRoundl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 11.2;
      let result: number = math.roundl(param);
      console.info("Test roundL result = " + JSON.stringify(result));
      expect(result).assertEqual(11);
      done()
    });

    /**
     * @tc.name   testMuslMathScalbln001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALBLN_0100
     * @tc.desc   test scalbln
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalbln001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 12;
      let param2 = 1;
      let result: number = math.scalbln(param, param2);
      console.info("Test scalbln result = " + JSON.stringify(result));
      expect(result).assertEqual(24);
      done()
    });

    /**
     * @tc.name   testMuslMathScalbln002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALBLN_0200
     * @tc.desc   test scalbln
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalbln002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 200 / 0;
      let param2 = 0;
      let result: number = math.scalbln(param, param2);
      console.info("Test scalbln result = " + JSON.stringify(result));
      expect(result).assertEqual(200 / 0);
      done()
    });

    /**
     * @tc.name   testMuslMathScalbln003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALBLN_0300
     * @tc.desc   test scalbln
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalbln003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 200 / -0;
      let param2 = 0;
      let result: number = math.scalbln(param, param2);
      console.info("Test scalbln result = " + JSON.stringify(result));
      expect(result).assertEqual(200 / -0);
      done()
    });

    /**
     * @tc.name   testMuslMathTan001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TAN_0100
     * @tc.desc   test tan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = Math.sqrt(-1);
      let result: number = math.tan(a);
      console.info("Test tan result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathTan002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TAN_0200
     * @tc.desc   test tan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTan002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 0;
      let result: number = math.tan(a);
      console.info("Test tan result= " + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslMathTan003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TAN_0300
     * @tc.desc   test tan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTan003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 200 / -0;
      let result: number = math.tan(a);
      console.info("Test tan result= " + result)
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathTan004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TAN_0400
     * @tc.desc   test tan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTan004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 200 / 0;
      let result: number = math.tan(a);
      console.info("Test tan result= " + result)
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathTanf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TANF_0100
     * @tc.desc   test tanf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTanf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = Math.sqrt(-1);
      let result: number = math.tanf(a);
      console.info("Test tanf result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathTanf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TANF_0200
     * @tc.desc   test tanf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTanf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 0;
      let result: number = math.tanf(a);
      console.info("Test tanf result= " + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslMathTanf003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TANF_0300
     * @tc.desc   test tanf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTanf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 200 / -0;
      let result: number = math.tanf(a);
      console.info("Test tanf result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathTanf004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TANF_0400
     * @tc.desc   test tanf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTanf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 200 / 0;
      let result: number = math.tanf(a);
      console.info("Test tanf result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathTanh001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TANH_0100
     * @tc.desc   test tanh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTanh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 0;
      let result: number = math.tanh(a);
      console.info("Test tanh result= " + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslMathTanh002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TANH_0200
     * @tc.desc   test tanh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTanh002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = Math.sqrt(-1);
      ;
      let result: number = math.tanh(a);
      console.info("Test tanh result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathTanh003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TANH_0300
     * @tc.desc   test tanh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTanh003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 200 / 0;
      let result: number = math.tanh(a);
      console.info("Test tanh result= " + result);
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslMathTanh004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TANH_0400
     * @tc.desc   test tanh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTanh004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 200 / -0;
      let result: number = math.tanh(a);
      console.info("Test tanh result= " + result);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testMuslMathTanhf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TANHF_0100
     * @tc.desc   test tanhf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTanhf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 0;
      let result: number = math.tanhf(a);
      console.info("Test tanhf result= " + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslMathTanhf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TANHF_0200
     * @tc.desc   test tanhf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTanhf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = Math.sqrt(-1);
      let result: number = math.tanhf(a);
      console.info("Test tanhf result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathTanhf003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TANHF_0300
     * @tc.desc   test tanhf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTanhf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 200 / 0;
      let result: number = math.tanhf(a);
      console.info("Test tanhf result= " + result);
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslMathTanhf004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TANHF_0400
     * @tc.desc   test tanhf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTanhf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 200 / -0;
      let result: number = math.tanhf(a);
      console.info("Test tanhf result= " + result);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testMuslMathTanhl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TANHL_0100
     * @tc.desc   test tanhl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTanhl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 0;
      let result: number = math.tanhl(a);
      console.info("Test tanhl result= " + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslMathTanhl002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TANHL_0200
     * @tc.desc   test tanhl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTanhl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = Math.sqrt(-1);
      let result: number = math.tanhl(a);
      console.info("Test tanhl result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathTanhl003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TANHL_0300
     * @tc.desc   test tanhl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTanhl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 200 / 0;
      let result: number = math.tanhl(a);
      console.info("Test tanhl result= " + result);
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslMathTanhl004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TANHL_0400
     * @tc.desc   test tanhl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTanhl004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 200 / -0;
      let result: number = math.tanhl(a);
      console.info("Test tanhl result= " + result);
      expect(result).assertEqual(-1)
      done();
    });

    /**
     * @tc.name   testMuslMathTanl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TANL_0100
     * @tc.desc   test tanl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTanl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 0;
      let result: number = math.tanl(a);
      console.info("Test tanl result= " + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslMathTanl002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TANL_0200
     * @tc.desc   test tanl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTanl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = Math.sqrt(-1);
      let result: number = math.tanl(a);
      console.info("Test tanl result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathTanl003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TANL_0300
     * @tc.desc   test tanl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTanl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 200 / 0;
      let result: number = math.tanl(a);
      console.info("Test tanl result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathTanl004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TANL_0400
     * @tc.desc   test tanl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTanl004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 200 / -0;
      let result: number = math.tanl(a);
      console.info("Test tanl result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathTgamma001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TGAMMA_0100
     * @tc.desc   test tgamma
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTgamma001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -1;
      let result: number = math.tgamma(a);
      console.info("Test tgamma result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathTgamma002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TGAMMA_0200
     * @tc.desc   test tgamma
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTgamma002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 200 / 0;
      let result: number = math.tgamma(a);
      console.info("Test tgamma result= " + result);
      expect(result).assertEqual(200 / 0);
      done();
    });

    /**
     * @tc.name   testMuslMathTgamma003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TGAMMA_0300
     * @tc.desc   test tgamma
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTgamma003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 200 / -0;
      let result: number = math.tgamma(a);
      console.info("Test tgamma result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathTgammaf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TGAMMAF_0100
     * @tc.desc   test tgammaf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTgammaf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -1;
      let result: number = math.tgammaf(a);
      console.info("Test tgammaf result= " + result)
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathTgammaf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TGAMMAF_0200
     * @tc.desc   test tgammaf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTgammaf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 200 / 0;
      let result: number = math.tgammaf(a);
      console.info("Test tgammaf data= " + result);
      expect(result).assertEqual(200 / 0);
      done();
    });

    /**
     * @tc.name   testMuslMathTgammaf003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TGAMMAF_0300
     * @tc.desc   test tgammaf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTgammaf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 200 / -0;
      let result: number = math.tgammaf(a);
      console.info("Test tgammaf result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathTgammal001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TGAMMAL_0100
     * @tc.desc   test tgammal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTgammal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -1;
      let result: number = math.tgammal(a);
      console.info("Test tgammal result= " + result)
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathTgammal002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TGAMMAL_0200
     * @tc.desc   test tgammal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTgammal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 200 / 0;
      let result: number = math.tgammal(a);
      console.info("Test tgammal result= " + result);
      expect(result).assertEqual(200 / 0);
      done();
    });

    /**
     * @tc.name   testMuslMathTgammal003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TGAMMAL_0300
     * @tc.desc   test tgammal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTgammal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 200 / -0;
      let result: number = math.tgammal(a);
      console.info("Test tgammal result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathScalbn001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALBN_0100
     * @tc.desc   test scalbn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalbn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 7
      let c = -4
      let a: number = math.scalbn(b, c);
      expect(a).assertEqual(0.4375);
      done()
    });

    /**
     * @tc.name   testMuslMathScalbn002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALBN_0200
     * @tc.desc   test scalbn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalbn002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = -1 / 0
      let c = -1
      let a: number = math.scalbn(b, c);
      expect(a).assertEqual(-1 / 0);
      done()
    });

    /**
     * @tc.name   testMuslMathScalbn003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALBN_0300
     * @tc.desc   test scalbn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalbn003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 1
      let c = -1074
      let a: number = math.scalbn(b, c);

      expect(a).assertEqual(4.94066e-324);
      done()
    });

    /**
     * @tc.name   testMuslMathScalbn004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALBN_0400
     * @tc.desc   test scalbn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalbn004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 1
      let c = 1024
      let a: number = math.scalbn(b, c);
      expect(a).assertEqual(1 / 0);
      done()
    });

    /**
     * @tc.name   testMuslMathScalblnl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALBLNL_0100
     * @tc.desc   test scalblnl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalblnl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 7
      let c = -4
      let a: number = math.scalblnl(b, c);
      expect(a).assertEqual(0.4375);
      done()
    });

    /**
     * @tc.name   testMuslMathScalblnl002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALBLNL_0200
     * @tc.desc   test scalblnl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalblnl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = -1 / 0
      let c = -1
      let a: number = math.scalblnl(b, c);
      expect(a).assertEqual(-1 / 0);
      done()
    });

    /**
     * @tc.name   testMuslMathScalblnl003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALBLNL_0300
     * @tc.desc   test scalblnl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalblnl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 1
      let c = -1074
      let a: number = math.scalblnl(b, c);
      expect(a).assertEqual(4.94066e-324);
      done()
    });

    /**
     * @tc.name   testMuslMathScalblnl004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALBLNL_0400
     * @tc.desc   test scalblnl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalblnl004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 1
      let c = 1024
      let a: number = math.scalblnl(b, c);
      expect(a).assertEqual(1 / 0);
      done()
    });

    /**
     * @tc.name   testMuslMathScalblnf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALBLNF_0100
     * @tc.desc   test scalblnf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalblnf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 7
      let c = -4
      let a: number = math.scalblnf(b, c);
      expect(a).assertEqual(0.4375);
      done()
    });

    /**
     * @tc.name   testMuslMathScalblnf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALBLNF_0200
     * @tc.desc   test scalblnf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalblnf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = -1 / 0
      let c = -1
      let a: number = math.scalblnf(b, c);
      expect(a).assertEqual(-1 / 0);
      done()
    });

    /**
     * @tc.name   testMuslMathScalblnf003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALBLNF_0300
     * @tc.desc   test  scalblnf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalblnf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 1
      let c = -1074
      let a: number = math.scalblnf(b, c);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathScalblnf004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALBLNF_0400
     * @tc.desc   test scalblnf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalblnf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 1
      let c = 1024
      let a: number = math.scalblnf(b, c);
      expect(a).assertEqual(1 / 0);
      done()
    });

    /**
     * @tc.name   testMuslMathScalbnf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALBNF_0100
     * @tc.desc   test scalbnf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalbnf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 7
      let c = -4
      let a: number = math.scalbnf(b, c);
      expect(a).assertEqual(0.4375);
      done()
    });

    /**
     * @tc.name   testMuslMathScalbnf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALBNF_0200
     * @tc.desc   test scalbnf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalbnf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = -1 / 0
      let c = -1
      let a: number = math.scalbnf(b, c);
      expect(a).assertEqual(-1 / 0);
      done()
    });

    /**
     * @tc.name   testMuslMathScalbnf003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALBNF_0300
     * @tc.desc   test scalbnf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalbnf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 1
      let c = -1074
      let a: number = math.scalbnf(b, c);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathScalbnf004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALBNF_0400
     * @tc.desc   test scalbnf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalbnf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 1
      let c = 1024
      let a: number = math.scalbnf(b, c);
      expect(a).assertEqual(1 / 0);
      done()
    });

    /**
     * @tc.name   testMuslMathScalbnl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALBNL_0100
     * @tc.desc   test scalbnl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalbnl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 7
      let c = -4
      let a: number = math.scalbnl(b, c);
      expect(a).assertEqual(0.4375);
      done()
    });

    /**
     * @tc.name   testMuslMathScalbnl002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALBNL_0200
     * @tc.desc   test scalbnl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalbnl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = -1 / 0
      let c = -1
      let a: number = math.scalbnl(b, c);
      expect(a).assertEqual(-1 / 0);
      done()
    });

    /**
     * @tc.name   testMuslMathScalbnl003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALBNL_0300
     * @tc.desc   test scalbnl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalbnl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 1
      let c = -1074
      let a: number = math.scalbnl(b, c);
      expect(a).assertEqual(4.94066e-324);
      done()
    });

    /**
     * @tc.name   testMuslMathScalbnl004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALBNL_0400
     * @tc.desc   test scalbnl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalbnl004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 1
      let c = 1024
      let a: number = math.scalbnl(b, c);
      expect(a).assertEqual(1 / 0);
      done()
    });

    /**
     * @tc.name   testMuslMathASin001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ASIN_0100
     * @tc.desc   test ASin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathASin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 1;
      let Param = 1 / 2;
      let result: number = math.aSin(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathASin002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ASIN_0200
     * @tc.desc   test ASin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathASin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 1;
      let Param = 0;
      let result: number = math.aSin(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathASin003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ASIN_0300
     * @tc.desc   test ASin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathASin003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 1;
      let Param = -1 / 2;
      let result: number = math.aSin(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathASin004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ASIN_0400
     * @tc.desc   test ASin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathASin004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param = 3;
      let result: number = math.aSin(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.name   testMuslMathASinF001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ASINF_0100
     * @tc.desc   test ASinF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathASinF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 1;
      let Param = 1 / 2;
      let result: number = math.aSinF(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathASinF002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ASINF_0200
     * @tc.desc   test ASinF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathASinF002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 1;
      let Param = 0;
      let result: number = math.aSinF(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathASinF003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ASINF_0300
     * @tc.desc   test ASinF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathASinF003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 1;
      let Param = -1 / 2;
      let result: number = math.aSinF(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathASinF004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ASINF_0400
     * @tc.desc   test ASinF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathASinF004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param = 3;
      let result: number = math.aSinF(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.name   testMuslMathASinL001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ASINL_0100
     * @tc.desc   test ASinL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathASinL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 1;
      let Param = 1 / 2;
      let result: number = math.aSinL(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathASinL002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ASINL_0200
     * @tc.desc   test ASinL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathASinL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 1;
      let Param = 0;
      let result: number = math.aSinL(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathASinL003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ASINL_0300
     * @tc.desc   test ASinL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathASinL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 1;
      let Param = -1 / 2;
      let result: number = math.aSinL(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathASinL004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ASINL_0400
     * @tc.desc   test ASinL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathASinL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param = 3;
      let result: number = math.aSinL(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.name   testMuslMathASinH001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ASINH_0100
     * @tc.desc   test ASinH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathASinH001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultless: number = 0.881;
      let resultlarger: number = 0.882;
      let Param = 1;
      let result: number = math.aSinH(Param);
      expect(result).assertLarger(resultless);
      expect(result).assertLess(resultlarger);
      done()
    });

    /**
     * @tc.name   testMuslMathASinH002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ASINH_0200
     * @tc.desc   test ASinH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathASinH002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let Param = 0;
      let result: number = math.aSinH(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathASinH003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ASINH_0300
     * @tc.desc   test ASinH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathASinH003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = -0.89;
      let Param = -1;
      let result: number = Math.floor(math.aSinH(Param) * 100) / 100;
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathASinH004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ASINH_0400
     * @tc.desc   test ASinH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathASinH004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.aSinH(Math.sqrt(-1));
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.name   testMuslMathASinHF001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ASINHF_0100
     * @tc.desc   test ASinHF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathASinHF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultless: number = 0.881;
      let resultlarger: number = 0.882;
      let Param = 1;
      let result: number = math.aSinHF(Param);
      expect(result).assertLarger(resultless);
      expect(result).assertLess(resultlarger);
      done()
    });

    /**
     * @tc.name   testMuslMathASinHF002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ASINHF_0200
     * @tc.desc   test ASinHF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathASinHF002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let Param = 0;
      let result: number = math.aSinHF(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathASinHF003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ASINHF_0300
     * @tc.desc   test ASinHF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathASinHF003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = -0.89;
      let Param = -1;
      let result: number = Math.floor(math.aSinHF(Param) * 100) / 100;
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathASinHF004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ASINHF_0400
     * @tc.desc   test ASinHF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathASinHF004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.aSinHF(Math.sqrt(-1));
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.name   testMuslMathASinHL001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ASINHL_0100
     * @tc.desc   test ASinHL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathASinHL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultless: number = 0.881;
      let resultlarger: number = 0.882;
      let Param = 1;
      let result: number = math.aSinHL(Param);
      expect(result).assertLarger(resultless);
      expect(result).assertLess(resultlarger);
      done()
    });

    /**
     * @tc.name   testMuslMathASinHL002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ASINHL_0200
     * @tc.desc   test ASinHL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathASinHL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let Param = 0;
      let result: number = math.aSinHL(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathASinHL003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ASINHL_0300
     * @tc.desc   test ASinHL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathASinHL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = -0.89;
      let Param = -1;
      let result: number = Math.floor(math.aSinHL(Param) * 100) / 100;
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathASinHL004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ASINHL_0400
     * @tc.desc   test ASinHL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathASinHL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.aSinHL(Math.sqrt(-1));
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.name   testMuslMathACos001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOS_0100
     * @tc.desc   test ACos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACos001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = Math.PI;
      let Param = -1;
      let result: number = math.aCos(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathACos002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOS_0200
     * @tc.desc   test ACos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACos002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = Math.PI / 2;
      let Param = 0;
      let result: number = math.aCos(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathACos003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOS_0300
     * @tc.desc   test ACos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACos003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let Param = 1;
      let result: number = math.aCos(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathACos004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOS_0400
     * @tc.desc   test ACos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACos004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param = 3;
      let result: number = math.aCos(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.name   testMuslMathACos005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOS_0500
     * @tc.desc   test ACos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACos005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param = Math.sqrt(-1);
      let result: number = math.aCos(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.name   testMuslMathACos006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOS_0600
     * @tc.desc   test ACos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACos006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param = 1.0 / 0.0;
      let result: number = math.aCos(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.name   testMuslMathACosF001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSF_0100
     * @tc.desc   test ACosF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultless: number = 3.141;
      let resultlarger: number = 3.142;
      let Param = -1;
      let result: number = math.aCosF(Param);
      expect(result).assertLarger(resultless);
      expect(result).assertLess(resultlarger);
      done()
    });

    /**
     * @tc.name   testMuslMathACosF002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSF_0200
     * @tc.desc   test ACosF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosF002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (Math.PI / 2).toFixed(2);
      let Param = 0;
      let result: string = (math.aCosF(Param)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathACosF003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSF_0300
     * @tc.desc   test ACosF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosF003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let Param = 1;
      let result: number = math.aCosF(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathACosF004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSF_0400
     * @tc.desc   test ACosF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosF004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param = 3;
      let result: number = math.aCosF(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.name   testMuslMathACosF005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSF_0500
     * @tc.desc   test ACosF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosF005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param = Math.sqrt(-1);
      let result: number = math.aCosF(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.name   testMuslMathACosF006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSF_0600
     * @tc.desc   test ACosF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosF006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param = 1.0 / 0.0;
      let result: number = math.aCosF(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.name   testMuslMathACosL001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSL_0100
     * @tc.desc   test ACosL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = Math.PI;
      let Param = -1;
      let result: number = math.aCosL(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathACosL002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSL_0200
     * @tc.desc   test ACosL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = Math.PI / 2;
      let Param = 0;
      let result: number = math.aCosL(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathACosL003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSL_0300
     * @tc.desc   test ACosL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let Param = 1;
      let result: number = math.aCosL(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathACosL004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSL_0400
     * @tc.desc   test ACosL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param = 3;
      let result: number = math.aCosL(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.name   testMuslMathACosL005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSL_0500
     * @tc.desc   test ACosL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosL005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param = Math.sqrt(-1);
      let result: number = math.aCosL(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.name   testMuslMathACosL006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSL_0600
     * @tc.desc   test ACosL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosL006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param = 1.0 / 0.0;
      let result: number = math.aCosL(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.name   testMuslMathACosH001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSH_0100
     * @tc.desc   test ACosH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosH001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param = -1;
      let result: number = math.aCosH(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.name   testMuslMathACosH002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSH_0200
     * @tc.desc   test ACosH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosH002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param = 0;
      let result: number = math.aCosH(Param);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathACosH003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSH_0300
     * @tc.desc   test ACosH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosH003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let Param = 1;
      let result: number = math.aCosH(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathACosH004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSH_0400
     * @tc.desc   test ACosH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosH004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param = -3;
      let result: number = math.aCosH(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.name   testMuslMathACosH005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSH_0500
     * @tc.desc   test ACosH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosH005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param = Math.sqrt(-1);
      let result: number = math.aCosH(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.name   testMuslMathACosH006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSH_0600
     * @tc.desc   test ACosH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosH006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param = 1.0 / 0.0;
      let result: number = math.aCosH(Param);
      expect(result).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathACosHF001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSHF_0100
     * @tc.desc   test ACosHF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosHF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param = -1;
      let result: number = math.aCosHF(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.name   testMuslMathACosHF002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSHF_0200
     * @tc.desc   test ACosHF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosHF002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param = 0;
      let result: number = math.aCosHF(Param);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathACosHF003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSHF_0300
     * @tc.desc   test ACosHF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosHF003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let Param = 1;
      let result: number = math.aCosHF(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathACosHF004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSHF_0400
     * @tc.desc   test ACosHF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosHF004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param = -3;
      let result: number = math.aCosHF(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.name   testMuslMathACosHF005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSHF_0500
     * @tc.desc   test ACosHF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosHF005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param = Math.sqrt(-1);
      let result: number = math.aCosHF(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.name   testMuslMathACosHF006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSHF_0600
     * @tc.desc   test ACosHF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosHF006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param = 1.0 / 0.0;
      let result: number = math.aCosHF(Param);
      expect(result).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathACosHL001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSHL_0100
     * @tc.desc   test ACosHL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosHL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param = -1;
      let result: number = math.aCosHL(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.name   testMuslMathACosHL002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSHL_0200
     * @tc.desc   test ACosHL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosHL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param = 0;
      let result: number = math.aCosHL(Param);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathACosHL003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSHL_0300
     * @tc.desc   test ACosHL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosHL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let Param = 1;
      let result: number = math.aCosHL(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathACosHL004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSHL_0400
     * @tc.desc   test ACosHL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosHL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param = -3;
      let result: number = math.aCosHL(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.name   testMuslMathACosHL005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSHL_0500
     * @tc.desc   test ACosHL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosHL005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param = Math.sqrt(-1);
      let result: number = math.aCosHL(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.name   testMuslMathACosHL006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ACOSHL_0600
     * @tc.desc   test ACosHL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathACosHL006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param = 1.0 / 0.0;
      let result: number = math.aCosHL(Param);
      expect(result).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathATan001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN_0100
     * @tc.desc   test ATan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 1;
      let Param = -1;
      let result: number = math.aTan(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN_0200
     * @tc.desc   test ATan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let param = 0;
      let result: number = math.aTan(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN_0300
     * @tc.desc   test ATan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 1;
      let param = 1;
      let result: number = math.aTan(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN_0400
     * @tc.desc   test ATan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = Math.PI / 2;
      let param = 1.0 / 0.0;
      let result: number = math.aTan(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN_0500
     * @tc.desc   test ATan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = Math.sqrt(-1);
      let result: number = math.aTan(param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.name   testMuslMathATan006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN_0600
     * @tc.desc   test ATan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = -Math.PI / 2;
      let param = -1.0 / 0.0;
      let result: number = math.aTan(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATanF001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATANF_0100
     * @tc.desc   test ATanF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATanF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 1;
      let Param = -1;
      let result: number = math.aTanF(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATanF002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATANF_0200
     * @tc.desc   test ATanF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATanF002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let param = 0;
      let result: number = math.aTanF(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATanF003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATANF_0300
     * @tc.desc   test ATanF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATanF003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 1;
      let param = 1;
      let result: number = math.aTanF(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATanF004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATANF_0400
     * @tc.desc   test ATanF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATanF004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (Math.PI / 2).toFixed(2);
      let param = 1.0 / 0.0;
      let result: string = (math.aTanF(param)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATanF005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATANF_0500
     * @tc.desc   test ATanF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATanF005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = Math.sqrt(-1);
      let result: number = math.aTanF(param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.name   testMuslMathATanF006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATANF_0600
     * @tc.desc   test ATanF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATanF006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (-Math.PI / 2).toFixed(2);
      let param = -1.0 / 0.0;
      let result: string = (math.aTanF(param)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATanL001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATANL_0100
     * @tc.desc   test ATanL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATanL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 1;
      let Param = -1;
      let result: number = math.aTanL(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATanL002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATANL_0200
     * @tc.desc   test ATanL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATanL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 1;
      let param = 0;
      let result: number = math.aTanL(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATanL003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATANL_0300
     * @tc.desc   test ATanL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATanL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 1;
      let param = 1;
      let result: number = math.aTanL(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATanL004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATANL_0400
     * @tc.desc   test ATanL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATanL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (Math.PI / 2).toFixed(2);
      let param = 1.0 / 0.0;
      let result: string = (math.aTanL(param)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATanL005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATANL_0500
     * @tc.desc   test ATanL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATanL005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = Math.sqrt(-1);
      let result: number = math.aTanL(param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.name   testMuslMathATanL006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATANL_0600
     * @tc.desc   test ATanL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATanL006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (-Math.PI / 2).toFixed(2);
      let param = -1.0 / 0.0;
      let result: string = (math.aTanL(param)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2_0100
     * @tc.desc   test ATan2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (Math.PI).toFixed(2);
      let Param0 = 0;
      let Param1 = -1;
      let result: string = (math.aTan2(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2_0200
     * @tc.desc   test ATan2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 0;
      let Param1 = 1;
      let result: number = math.aTan2(Param0, Param1);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2_0300
     * @tc.desc   test ATan2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (-Math.PI / 2).toFixed(2);
      let Param0 = -1;
      let Param1 = 0;
      let result: string = (math.aTan2(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2_0400
     * @tc.desc   test ATan2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (Math.PI / 2).toFixed(2);
      let Param0 = 1;
      let Param1 = 0;
      let result: string = (math.aTan2(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2_0500
     * @tc.desc   test ATan2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = Math.sqrt(-1);
      let Param1 = -1;
      let result: number = math.aTan2(Param0, Param1);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathATan2006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2_0600
     * @tc.desc   test ATan2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = 0;
      let Param1 = 0;
      let result: Number = math.aTan2(Param0, Param1);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2007
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2_0700
     * @tc.desc   test ATan2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = Math.PI / 4;
      let Param0 = 1.0 / 0.0;
      let Param1 = 1.0 / 0.0;
      let result: number = math.aTan2(Param0, Param1);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2008
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2_0800
     * @tc.desc   test ATan2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (Math.PI * 3 / 4).toFixed(2);
      let Param0 = 1.0 / 0.0;
      let Param1 = -1.0 / 0.0;
      let result: string = (math.aTan2(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2009
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2_0900
     * @tc.desc   test ATan2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (-Math.PI / 4).toFixed(2);
      let Param0 = -1.0 / 0.0;
      let Param1 = 1.0 / 0.0;
      let result: string = (math.aTan2(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2010
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2_1000
     * @tc.desc   test ATan2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = -3 * Math.PI / 4;
      let Param0 = -1.0 / 0.0;
      let Param1 = -1.0 / 0.0;
      let result: number = math.aTan2(Param0, Param1);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2F001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2F_0100
     * @tc.desc   test ATan2F
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2F001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (Math.PI).toFixed(2);
      let Param0 = 0;
      let Param1 = -1;
      let result: string = (math.aTan2F(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2F002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2F_0200
     * @tc.desc   test ATan2F
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2F002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 0;
      let Param1 = 1;
      let result: number = math.aTan2F(Param0, Param1);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2F003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2F_0300
     * @tc.desc   test ATan2F
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2F003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (-Math.PI / 2).toFixed(2);
      let Param0 = -1;
      let Param1 = 0;
      let result: string = (math.aTan2F(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2F004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2F_0400
     * @tc.desc   test ATan2F
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2F004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (Math.PI / 2).toFixed(2);
      let Param0 = 1;
      let Param1 = 0;
      let result: string = (math.aTan2F(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2F005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2F_0500
     * @tc.desc   test ATan2F
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2F005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = Math.sqrt(-1);
      let Param1 = -1;
      let result: number = math.aTan2F(Param0, Param1);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathATan2F006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2F_0600
     * @tc.desc   test ATan2F
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2F006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 0;
      let Param1 = 0;
      let result: number = math.aTan2F(Param0, Param1);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2F007
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2F_0700
     * @tc.desc   test ATan2F
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2F007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (Math.PI / 4).toFixed(2);
      let Param0 = 1.0 / 0.0;
      let Param1 = 1.0 / 0.0;
      let result: string = (math.aTan2F(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2F008
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2F_0800
     * @tc.desc   test ATan2F
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2F008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (Math.PI * 3 / 4).toFixed(2);
      let Param0 = 1.0 / 0.0;
      let Param1 = -1.0 / 0.0;
      let result: string = (math.aTan2F(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2F009
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2F_0900
     * @tc.desc   test ATan2F
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2F009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (-Math.PI / 4).toFixed(2);
      let Param0 = -1.0 / 0.0;
      let Param1 = 1.0 / 0.0;
      let result: string = (math.aTan2F(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2F010
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2F_1000
     * @tc.desc   test ATan2F
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2F010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (-3 * Math.PI / 4).toFixed(2);
      let Param0 = -1.0 / 0.0;
      let Param1 = -1.0 / 0.0;
      let result: string = (math.aTan2F(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2L001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2L_0100
     * @tc.desc   test ATan2L
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2L001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (Math.PI).toFixed(2);
      let Param0 = 0;
      let Param1 = -1;
      let result: string = (math.aTan2L(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2L002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2L_0200
     * @tc.desc   test ATan2L
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2L002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 0;
      let Param1 = 1;
      let result: number = math.aTan2L(Param0, Param1);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2L003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2L_0300
     * @tc.desc   test ATan2L
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2L003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (-Math.PI / 2).toFixed(2);
      let Param0 = -1;
      let Param1 = 0;
      let result: string = (math.aTan2L(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2L004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2L_0400
     * @tc.desc   test ATan2L
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2L004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (Math.PI / 2).toFixed(2);
      let Param0 = 1;
      let Param1 = 0;
      let result: string = (math.aTan2L(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathCos001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COS_0100
     * @tc.desc   test cos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCos001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 60;
      let result: number = 0.50;
      let data: Number = math.cos(a);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCos002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COS_0200
     * @tc.desc   test cos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCos002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 0;
      let result: number = 1.00;
      let data: Number = math.cos(a);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCos003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COS_0300
     * @tc.desc   test cos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCos003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 90;
      let result: number = 0.00;
      let data: Number = math.cos(a);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathErf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ERF_0100
     * @tc.desc   test erf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathErf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 10;
      let data: Number = math.erf(a);
      let result: boolean = false;
      if (data > -1 && data <= 1) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathErf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ERF_0200
     * @tc.desc   test erf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathErf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -10;
      let data: Number = math.erf(a);
      let result: boolean = false;
      if (data >= -1 && data <= 1) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathErf003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ERF_0300
     * @tc.desc   test erf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathErf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.5;
      let data: Number = math.erf(a);
      let result: boolean = false;
      if (data > -1 && data < 1) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathErf004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ERF_0400
     * @tc.desc   test erf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathErf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 0;
      let data: Number = math.erf(a);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathCopySign001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COPYSIGN_0100
     * @tc.desc   test copysign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCopySign001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 11;
      let b = -2;
      let data: Number = math.copysign(a, b);
      expect(data).assertEqual(-11);
      done()
    });

    /**
     * @tc.name   testMuslMathCopySign002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COPYSIGN_0200
     * @tc.desc   test copysign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCopySign002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -11;
      let b = -2;
      let data: Number = math.copysign(a, b);
      expect(data).assertEqual(-11);
      done()
    });

    /**
     * @tc.name   testMuslMathCopySign003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COPYSIGN_0300
     * @tc.desc   test copysign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCopySign003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -11;
      let b = 2;
      let data: Number = math.copysign(a, b);
      expect(data).assertEqual(11);
      done()
    });

    /**
     * @tc.name   testMuslMathExp001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXP_0100
     * @tc.desc   test exp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -1;
      let result: number = 0.367879;
      let data: Number = math.exp(a);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathExp002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXP_0200
     * @tc.desc   test exp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 0;
      let data: Number = math.exp(a);
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslMathFabs001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FABS_0100
     * @tc.desc   test fabs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFabs001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 7.5;
      let data: Number = math.fabs(a);
      expect(data).assertEqual(7.5);
      done()
    });

    /**
     * @tc.name   testMuslMathFDim001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FDIM_0100
     * @tc.desc   test fdim
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFDim001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 7.5;
      let b = 2.3;
      let data: Number = math.fdim(a, b);
      expect(data).assertEqual(5.2);
      done()
    });

    /**
     * @tc.name   testMuslMathFDim002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FDIM_0200
     * @tc.desc   test fdim
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFDim002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.5;
      let b = 2.3;
      let data: Number = math.fdim(a, b);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathFDim003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FDIM_0300
     * @tc.desc   test fdim
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFDim003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.5;
      let b = -3.57;
      let data: Number = math.fdim(a, b);
      expect(data).assertEqual(5.07);
      done()
    });

    /**
     * @tc.name   testMuslMathFloor001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FLOOR_0100
     * @tc.desc   test floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFloor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.5;
      let data: Number = math.floor(a);
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslMathFloor002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FLOOR_0200
     * @tc.desc   test floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFloor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -10.5;
      let data: Number = math.floor(a);
      expect(data).assertEqual(-11);
      done()
    });

    /**
     * @tc.name   testMuslMathFma001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMA_0100
     * @tc.desc   test fma
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFma001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.5;
      let b = 2;
      let c = 2.5;
      let data: Number = math.fma(a, b, c);
      expect(data).assertEqual(5.5);
      done()
    });

    /**
     * @tc.name   testMuslMathFma002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMA_0200
     * @tc.desc   test fma
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFma002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -1.5;
      let b = 2;
      let c = 2.5;
      let data: Number = math.fma(a, b, c);
      expect(data).assertEqual(-0.5);
      done()
    });

    /**
     * @tc.name   testMuslMathFMax001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAX_0100
     * @tc.desc   test fmax
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFMax001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -1.5;
      let b = 2;
      let data: Number = math.fmax(a, b);
      expect(data).assertEqual(2);
      done()
    });

    /**
     * @tc.name   testMuslMathFMax002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAX_0200
     * @tc.desc   test fmax
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFMax002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.5;
      let b = 1.5;
      let data: Number = math.fmax(a, b);
      expect(data).assertEqual(1.5);
      done()
    });

    /**
     * @tc.name   testMuslMathFMax003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAX_0300
     * @tc.desc   test fmax
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFMax003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.5;
      let b = 1;
      let data: Number = math.fmax(a, b);
      expect(data).assertEqual(1.5);
      done()
    });

    /**
     * @tc.name   testMuslMathFmin001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMIN_0100
     * @tc.desc   test fmin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -1.5;
      let b = 2;
      let data: Number = math.fmin(a, b);
      expect(data).assertEqual(-1.5);
      done()
    });

    /**
     * @tc.name   testMuslMathFmin002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMIN_0200
     * @tc.desc   test fmin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 0;
      let b = 0;
      let data: Number = math.fmin(a, b);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathFmin003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMIN_0300
     * @tc.desc   test fmin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmin003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.56;
      let b = 0;
      let data: Number = math.fmin(a, b);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathFmod001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMOD_0100
     * @tc.desc   test fmod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmod001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 7.5;
      let b = 2.1;
      let result: number = 1.1999;
      let data: Number = math.fmod(a, b);
      if (b == 0) {
        expect(data).assertNaN();
      } else if (a < b) {
        result = a;
      }
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathFmod002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMOD_0200
     * @tc.desc   test fmod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmod002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 0;
      let b = 2.1;
      let result: number = 0;
      let data: Number = math.fmod(a, b);
      if (b == 0) {
        expect(data).assertNaN();
      } else if (a < b) {
        result = a;
      }
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathFmod003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMOD_0300
     * @tc.desc   test fmod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmod003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 2.5;
      let b = 0;
      let result: number = 0;
      let data: Number = math.fmod(a, b);
      if (b == 0) {
        expect(data).assertNaN();
      } else if (a < b) {
        result = a;
        expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      }
      done()
    });

    /**
     * @tc.name   testMuslMathFmod004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMOD_0400
     * @tc.desc   test fmod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmod004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 12.19;
      let b = -3;
      let result: number = 0.189999;
      let data: Number = math.fmod(a, b);
      if (b == 0) {
        expect(data).assertNaN();
      } else if (a < b) {
        result = a;
      }
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathFAbsF001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FABSF_0100
     * @tc.desc   test fabsf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFAbsF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -7.5;
      let data: Number = math.fabsf(a);
      expect(data).assertEqual(7.5);
      done()
    });

    /**
     * @tc.name   testMuslMathCosh001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSH_0100
     * @tc.desc   test cosh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCosh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 90;
      let result: number = 2.50918;
      let data: Number = math.cosh(a);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCosh002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSH_0200
     * @tc.desc   test cosh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCosh002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 0;
      let result: number = 1;
      let data: Number = math.cosh(a);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCosh003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSH_0300
     * @tc.desc   test cosh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCosh003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -30;
      let result: number = 1.14023;
      let data: Number = math.cosh(a);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathExp2001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXP2_0100
     * @tc.desc   test exp2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExp2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -1;
      let result: boolean = false;
      let data: Number = math.exp2(a);
      if (data >= 0) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathExp2002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXP2_0200
     * @tc.desc   test exp2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExp2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.0 / 0.0;
      let data: Number = math.exp2(a);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathExp2003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXP2_0300
     * @tc.desc   test exp2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExp2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 4.7;
      let result: boolean = false;
      let data: Number = math.exp2(a);
      if (data >= 0) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathExpM1001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPM1_0100
     * @tc.desc   test expm1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpM1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 4;
      let result: boolean = false;
      let data: Number = math.expm1(a);
      if (data >= -1) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathExpM1002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPM1_0200
     * @tc.desc   test expm1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpM1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.0 / 0.0;
      let data: Number = math.expm1(a);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathExpM1003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPM1_0300
     * @tc.desc   test expm1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpM1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -1;
      let result: boolean = false;
      let data: Number = math.expm1(a);
      if (data >= -1) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathFmodF001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMODF_0100
     * @tc.desc   test fmodf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmodF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 9.6;
      let b = 4.75;
      let result: number = 0.1;
      let data: Number = math.fmodf(a, b);
      if (a > 0) {
        if (b == 0) {
          expect(data).assertNaN();
        } else if (a < b) {
          result = a;
        }
      } else {
        if (b == 0) {
          expect(data).assertNaN();
        } else if (a > b) {
          result = a;
        }
      }
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathFmodF002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMODF_0200
     * @tc.desc   test fmodf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmodF002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 4.7;
      let b = 9.6;
      let result: number = 0;
      let data: Number = math.fmodf(a, b);
      if (a > 0) {
        if (b == 0) {
          expect(data).assertNaN();
        } else if (a < b) {
          result = a;
        }
      } else {
        if (b == 0) {
          expect(data).assertNaN();
        } else if (a > b) {
          result = a;
        }
      }
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathFmodF003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMODF_0300
     * @tc.desc   test fmodf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmodF003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 4.7;
      let b = 0;
      let result: number = 0;
      let data: Number = math.fmodf(a, b);
      if (a > 0) {
        if (b == 0) {
          expect(data).assertNaN();
        } else if (a < b) {
          result = a;
          expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
        }
      } else {
        if (b == 0) {
          expect(data).assertNaN();
        } else if (a > b) {
          result = a;
          expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
        }
      }
      done()
    });

    /**
     * @tc.name   testMuslMathFmodL001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMODL_0100
     * @tc.desc   test fmodl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmodL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 9.6;
      let b = 4.75;
      let result: number = 0.1;
      let data: Number = math.fmodl(a, b);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathFmodL002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMODL_0200
     * @tc.desc   test fmodl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmodL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 4.7;
      let b = 9.6;
      let result: number = 0;
      let data: Number = math.fmodl(a, b);
      if (a > 0) {
        if (b == 0) {
          expect(data).assertNaN();
        } else if (a < b) {
          result = a;
        }
      } else {
        if (b == 0) {
          expect(data).assertNaN();
        } else if (a > b) {
          result = a;
        }
      }
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathFmodL003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMODL_0300
     * @tc.desc   test fmodl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmodL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 4.7;
      let b = 0;
      let result: number = 0;
      let data: Number = math.fmodl(a, b);
      if (a > 0) {
        if (b == 0) {
          expect(data).assertNaN();
        } else if (a < b) {
          result = a;
          expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
        }
      } else {
        if (b == 0) {
          expect(data).assertNaN();
        } else if (a > b) {
          result = a;
          expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
        }
      }
      done()
    });

    /**
     * @tc.name   testMuslMathFMinF001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMINF_0100
     * @tc.desc   test fminf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFMinF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -1.5;
      let b = 2;
      let data: Number = math.fminf(a, b);
      expect(data).assertEqual(-1.5);
      done()
    });

    /**
     * @tc.name   testMuslMathFMinF002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMINF_0200
     * @tc.desc   test fminf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFMinF002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 0;
      let b = 0;
      let data: Number = math.fminf(a, b);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathFMinF003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMINF_0300
     * @tc.desc   test fminf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFMinF003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.56;
      let b = 0;
      let data: Number = math.fminf(a, b);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathFMinL001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMINL_0100
     * @tc.desc   test fminl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFMinL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -1.5;
      let b = 2;
      let data: Number = math.fminl(a, b);
      expect(data).assertEqual(-1.5);
      done()
    });

    /**
     * @tc.name   testMuslMathFMinL002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMINL_0200
     * @tc.desc   test fminl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFMinL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 0;
      let b = 0;
      let data: Number = math.fminl(a, b);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathFMinL003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMINL_0300
     * @tc.desc   test fminl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFMinL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.56;
      let b = 0;
      let data: Number = math.fminl(a, b);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathFMaxF001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAXF_0100
     * @tc.desc   test fmaxf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFMaxF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -1.5;
      let b = 2;
      let data: Number = math.fmaxf(a, b);
      expect(data).assertEqual(2);
      done()
    });

    /**
     * @tc.name   testMuslMathFMaxF002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAXF_0200
     * @tc.desc   test fmaxf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFMaxF002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.5;
      let b = 1.5;
      let data: Number = math.fmaxf(a, b);
      expect(data).assertEqual(1.5);
      done()
    });

    /**
     * @tc.name   testMuslMathFMaxF003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAXF_0300
     * @tc.desc   test fmaxf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFMaxF003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.5;
      let b = 1;
      let data: Number = math.fmaxf(a, b);
      expect(data).assertEqual(1.5);
      done()
    });

    /**
     * @tc.name   testMuslMathFMaxL001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAXL_0100
     * @tc.desc   test fmaxl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFMaxL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -1.5;
      let b = 2;
      let data: Number = math.fmaxl(a, b);
      expect(data).assertEqual(2);
      done()
    });

    /**
     * @tc.name   testMuslMathFMaxL002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAXL_0200
     * @tc.desc   test fmaxl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFMaxL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.5;
      let b = 1.5;
      let data: Number = math.fmaxl(a, b);
      expect(data).assertEqual(1.5);
      done()
    });

    /**
     * @tc.name   testMuslMathFMaxL003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAXL_0300
     * @tc.desc   test fmaxl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFMaxL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.5;
      let b = 1;
      let data: Number = math.fmaxl(a, b);
      expect(data).assertEqual(1.5);
      done()
    });

    /**
     * @tc.name   testMuslMathFmaF001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAF_0100
     * @tc.desc   test fmaf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmaF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.5;
      let b = 2;
      let c = 2.5;
      let data: Number = math.fmaf(a, b, c);
      expect(data).assertEqual(5.5);
      done()
    });

    /**
     * @tc.name   testMuslMathFmaF002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAF_0200
     * @tc.desc   test fmaf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmaF002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -1.5;
      let b = 2;
      let c = 2.5;
      let data: Number = math.fmaf(a, b, c);
      expect(data).assertEqual(-0.5);
      done()
    });

    /**
     * @tc.name   testMuslMathFmaL001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAL_0100
     * @tc.desc   test fmal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmaL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.5;
      let b = 2;
      let c = 2.5;
      let data: Number = math.fmal(a, b, c);
      expect(data).assertEqual(5.5);
      done()
    });

    /**
     * @tc.name   testMuslMathFmaL002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAL_0200
     * @tc.desc   test fmal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmaL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -1.5;
      let b = 2;
      let c = 2.5;
      let data: Number = math.fmal(a, b, c);
      expect(data).assertEqual(-0.5);
      done()
    });

    /**
     * @tc.name   testMuslMathFloorF001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FLOORF_0100
     * @tc.desc   test floorf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFloorF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.5;
      let result: number = 1;
      let data: Number = math.floorf(a);
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.name   testMuslMathFloorF002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FLOORF_0200
     * @tc.desc   test floorf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFloorF002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -10.5;
      let result: number = -11;
      let data: Number = math.floorf(a);
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.name   testMuslMathFloorL001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FLOORL_0100
     * @tc.desc   test floorl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFloorL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.5;
      let result: number = 1;
      let data: Number = math.floorl(a);
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.name   testMuslMathFloorL002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FLOORL_0200
     * @tc.desc   test floorl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFloorL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -10.5;
      let result: number = -11;
      let data: Number = math.floorl(a);
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.name   testMuslMathFDimF001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FDIMF_0100
     * @tc.desc   test fdimf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFDimF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 7.5;
      let b = 2.3;
      let result: number = 5.199;
      let data: Number = math.fdimf(a, b);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathFDimF002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FDIMF_0200
     * @tc.desc   test fdimf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFDimF002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.5;
      let b = 2.3;
      let result: number = 0;
      let data: Number = math.fdimf(a, b);
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.name   testMuslMathFDimF003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FDIMF_0300
     * @tc.desc   test fdimf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFDimF003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.5;
      let b = -3.57;
      let result: number = 5.069;
      let data: Number = math.fdimf(a, b);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathFDimL001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FDIML_0100
     * @tc.desc   test fdiml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFDimL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 7.5;
      let b = 2.3;
      let data: Number = math.fdiml(a, b);
      expect(data).assertEqual(5.2);
      done()
    });

    /**
     * @tc.name   testMuslMathFDimL002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FDIML_0200
     * @tc.desc   test fdiml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFDimL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.5;
      let b = 2.3;
      let data: Number = math.fdiml(a, b);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathFDimL003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FDIML_0300
     * @tc.desc   test fdiml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFDimL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.5;
      let b = -3.57;
      let data: Number = math.fdiml(a, b);
      expect(data).assertEqual(5.07);
      done()
    });

    /**
     * @tc.name   testMuslMathFAbsL001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FABSL_0100
     * @tc.desc   test fabsl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFAbsL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 7.5;
      let data: Number = math.fabsl(a);
      expect(data).assertEqual(7.5);
      done()
    });

    /**
     * @tc.name   testMuslMathCeil001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CEIL_0100
     * @tc.desc   test ceil
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCeil001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -7.5;
      let data: Number = math.ceil(a);
      expect(data).assertEqual(-7);
      done()
    });

    /**
     * @tc.name   testMuslMathCeil002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CEIL_0200
     * @tc.desc   test ceil
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCeil002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.1;
      let data: Number = math.ceil(a);
      expect(data).assertEqual(2);
      done()
    });

    /**
     * @tc.name   testMuslMathCeilF001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CEILF_0100
     * @tc.desc   test ceilf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCeilF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -7.5;
      let data: Number = math.ceilf(a);
      expect(data).assertEqual(-7);
      done()
    });

    /**
     * @tc.name   testMuslMathCeilF002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CEILF_0200
     * @tc.desc   test ceilf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCeilF002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.1;
      let data: Number = math.ceilf(a);
      expect(data).assertEqual(2);
      done()
    });

    /**
     * @tc.name   testMuslMathCeilL001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CEILL_0100
     * @tc.desc   test ceill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCeilL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -7.5;
      let data: Number = math.ceill(a);
      expect(data).assertEqual(-7);
      done()
    });

    /**
     * @tc.name   testMuslMathCeilL002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CEILL_0200
     * @tc.desc   test ceill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCeilL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.1;
      let data: Number = math.ceill(a);
      expect(data).assertEqual(2);
      done()
    });

    /**
     * @tc.name   testMuslMathExpM1f001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPM1F_0100
     * @tc.desc   test expm1f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpM1f001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 4;
      let result: boolean = false;
      let data: Number = math.expm1f(a);
      if (data >= -1) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathExpM1f002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPM1F_0200
     * @tc.desc   test expm1f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpM1f002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1.0 / 0.0;
      let data: Number = math.expm1f(a);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathExpM1f003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPM1F_0300
     * @tc.desc   test expm1f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpM1f003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -1;
      let result: boolean = false;
      let data: Number = math.expm1f(a);
      if (data >= -1) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathLog001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LOG_0100
     * @tc.desc   test Log
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLog001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.log(10);
      console.info("math.log result = " + result);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(2.302585))
      done()
    });

    /**
     * @tc.name   testMuslMathLog10001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LOG10_0100
     * @tc.desc   test Log10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLog10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.log10(10);
      console.info("math.log10 result = " + result);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(1))
      done()
    });

    /**
     * @tc.name   testMuslMathLog10f001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LOG10F_0100
     * @tc.desc   test Log10f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLog10f001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.log10f(10);
      console.info("math.log10f result = " + result);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(1))
      done()
    });

    /**
     * @tc.name   testMuslMathLog10l001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LOG10L_0100
     * @tc.desc   test Log10l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLog10l001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.log10l(10);
      console.info("math.log10l result = " + result);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(1))
      done()
    });

    /**
     * @tc.name   testMuslMathLog1p001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LOG1P_0100
     * @tc.desc   test Log1p
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLog1p001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.log1p(1.0);
      console.info("math.log1p result = " + result);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(0.693147))
      done()
    });

    /**
     * @tc.name   testMuslMathLog1pf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LOG1PF_0100
     * @tc.desc   test Log1pf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLog1pf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.log1pf(1.0);
      console.info("math.log1pf result = " + result);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(0.693147))
      done()
    });

    /**
     * @tc.name   testMuslMathLog1pl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LOG1PL_0100
     * @tc.desc   test Log1pl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLog1pl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.log1pl(1.0);
      console.info("math.log1pl result = " + result);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(0.693147))
      done()
    });

    /**
     * @tc.name   testMuslMathLog2001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LOG2_0100
     * @tc.desc   test Log2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLog2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.log2(4);
      console.info("math.log2 result = " + result);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(2))
      done()
    });

    /**
     * @tc.name   testMuslMathLog2f001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LOG2F_0100
     * @tc.desc   test Log2f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLog2f001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.log2f(4);
      console.info("math.log2f result = " + result);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(2))
      done()
    });

    /**
     * @tc.name   testMuslMathLog2l001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LOG2L_0100
     * @tc.desc   test Log2l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLog2l001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.log2l(4);
      console.info("math.log2l result = " + result);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(2))
      done()
    });

    /**
     * @tc.name   testMuslMathLogB001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LOGB_0100
     * @tc.desc   test LogB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLogB001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.logB(8);
      console.info("math.logB result = " + result);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(3))
      done()
    });

    /**
     * @tc.name   testMuslMathLogBf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LOGBF_0100
     * @tc.desc   test LogBf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLogBf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.logBf(8);
      console.info("math.logBf result = " + result);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(3))
      done()
    });

    /**
     * @tc.name   testMuslMathLogBl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LOGBL_0100
     * @tc.desc   test LogBl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLogBl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.logBl(8);
      console.info("math.logBl result = " + result);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(3))
      done()
    });

    /**
     * @tc.name   testMuslMathLogF001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LOGF_0100
     * @tc.desc   test LogF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLogF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.logF(8);
      console.info("math.logF result = " + result);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(2.079442))
      done()
    });

    /**
     * @tc.name   testMuslMathLogL001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LOGL_0100
     * @tc.desc   test LogL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLogL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.logL(8);
      console.info("math.logL result = " + result);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(2.079442))
      done()
    });

    /**
     * @tc.name   testMuslMathSin001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SIN_0100
     * @tc.desc   test sin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 90;
      let c = 0.89
      let a: number = math.sin(b);
      expect(Number(a).toFixed(2)).assertEqual(c.toString());
      done()
    });

    /**
     * @tc.name   testMuslMathSin002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SIN_0200
     * @tc.desc   test sin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 100 / 0;
      let a: number = math.sin(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathSin003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SIN_0300
     * @tc.desc   test sin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSin003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sin(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathSinf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SINF_0100
     * @tc.desc   test sinf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSinf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 90;
      let c = 0.89
      let a: number = math.sinf(b);
      expect(Number(a).toFixed(2)).assertEqual(c.toString());
      done()
    });

    /**
     * @tc.name   testMuslMathSinf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SINF_0200
     * @tc.desc   test sinf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSinf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 100 / 0;
      let a: number = math.sinf(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathSinf003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SINF_0300
     * @tc.desc   test sinf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSinf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sinf(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathSinl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SINL_0100
     * @tc.desc   test sinl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSinl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 90;
      let c = 0.89
      let a: number = math.sinl(b);
      expect(Number(a).toFixed(2)).assertEqual(c.toString());
      done()
    });

    /**
     * @tc.name   testMuslMathSinl002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SINL_0200
     * @tc.desc   test sinl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSinl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 100 / 0;
      let a: number = math.sinl(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathSinl003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SINL_0300
     * @tc.desc   test sinl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSinl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sinl(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathSinh001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SINH_0100
     * @tc.desc   test sinh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSinh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 0;
      let c = 0;
      let a: number = math.sinh(b);
      expect(a).assertEqual(c);
      done()
    });

    /**
     * @tc.name   testMuslMathSinh002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SINH_0200
     * @tc.desc   test sinh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSinh002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sinh(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathSinh003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SINH_0300
     * @tc.desc   test sinh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSinh003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let c = 0;
      let a: number = math.sinh(c);
      let b = (a != null)
      expect(b).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathSinhf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SINHF_0100
     * @tc.desc   test sinhf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSinhf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 0;
      let c = 0
      let a: number = math.sinhf(b);
      expect(a).assertEqual(c);
      done()
    });

    /**
     * @tc.name   testMuslMathSinhf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SINHF_0200
     * @tc.desc   test sinhf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSinhf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sinhf(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathSinhf003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SINHF_0300
     * @tc.desc   test sinhf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSinhf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 180;
      let a: number = math.sinhf(b);
      expect(a).assertEqual(100 / 0);
      done()
    });

    /**
     * @tc.name   testMuslMathSinhl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SINHL_0100
     * @tc.desc   test sinhl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSinhl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 0;
      let c = 0
      let a: number = math.sinhl(b);
      expect(a).assertEqual(c);
      done()
    });

    /**
     * @tc.name   testMuslMathSinhl002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SINHL_0200
     * @tc.desc   test sinhl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSinhl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sinhl(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathSinhl003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SINHL_0300
     * @tc.desc   test sinhl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSinhl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 100 / 0;
      let a: number = math.sinhl(b);
      expect(a).assertEqual(100 / 0);
      done()
    });

    /**
     * @tc.name   testMuslMathSqrt001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SQRT_0100
     * @tc.desc   test sqrt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSqrt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 9;
      let c = 3
      let a: number = math.sqrt(b);
      expect(a).assertEqual(c);
      done()
    });

    /**
     * @tc.name   testMuslMathSqrt002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SQRT_0200
     * @tc.desc   test sqrt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSqrt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 100 / 0;
      let a: number = math.sqrt(b);
      expect(a).assertEqual(100 / 0);
      done()
    });

    /**
     * @tc.name   testMuslMathSqrt003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SQRT_0300
     * @tc.desc   test sqrt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSqrt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sqrt(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathSqrt004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SQRT_0400
     * @tc.desc   test sqrt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSqrt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = -1;
      let a: number = math.sqrt(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathSqrtf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SQRTF_0100
     * @tc.desc   test sqrtf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSqrtf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 25.00;
      let c = 5.0
      let a: number = math.sqrtf(b);
      expect(a).assertEqual(c);
      done()
    });

    /**
     * @tc.name   testMuslMathSqrtf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SQRTF_0200
     * @tc.desc   test sqrtf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSqrtf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 100 / 0;
      let a: number = math.sqrtf(b);
      expect(a).assertEqual(100 / 0);
      done()
    });

    /**
     * @tc.name   testMuslMathSqrtf003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SQRTF_0300
     * @tc.desc   test sqrtf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSqrtf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sqrtf(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathSqrtf004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SQRTF_0400
     * @tc.desc   test sqrtf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSqrtf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = -1;
      let a: number = math.sqrtf(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathSqrtl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SQRTL_0100
     * @tc.desc   test sqrtl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSqrtl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 900;
      let c = 30
      let a: number = math.sqrtl(b);
      expect(a).assertEqual(c);
      done()
    });

    /**
     * @tc.name   testMuslMathSqrtl002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SQRTL_0200
     * @tc.desc   test sqrtl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSqrtl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = +100 / 0;
      let a: number = math.sqrtl(b);
      expect(a).assertEqual(+100 / 0);
      done()
    });

    /**
     * @tc.name   testMuslMathSqrtl003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SQRTL_0300
     * @tc.desc   test sqrtl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSqrtl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sqrtl(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathSqrtl004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SQRTL_0400
     * @tc.desc   test sqrtl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSqrtl004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = -1;
      let a: number = math.sqrtl(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathCos004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COS_0400
     * @tc.desc   test cos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCos004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -30;
      let result: number = 0.87;
      let data: Number = math.cos(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCos005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COS_0500
     * @tc.desc   test cos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCos005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0.99;
      let result: number = 1.00;
      let data: Number = math.cos(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCos006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COS_0600
     * @tc.desc   test cos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCos006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 179.99;
      let result: number = -1.00;
      let data: Number = math.cos(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCos007
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COS_0700
     * @tc.desc   test cos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCos007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: Number = math.cos(firstParam);
      expect(data).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathCos008
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COS_0800
     * @tc.desc   test cos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCos008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: Number = math.cos(firstParam);
      expect(data).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathErf005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ERF_0500
     * @tc.desc   test erf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathErf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1;
      let result: number = 0.8427;
      let data: Number = math.erf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathErf006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ERF_0600
     * @tc.desc   test erf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathErf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let result: number = 1;
      let data: Number = math.erf(firstParam);
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.name   testMuslMathErf007
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ERF_0700
     * @tc.desc   test erf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathErf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let result: number = -1;
      let data: Number = math.erf(firstParam);
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.name   testMuslMathCopySign004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COPYSIGN_0400
     * @tc.desc   test copysign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCopySign004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 11;
      let secondParam = 2;
      let data: Number = math.copysign(firstParam, secondParam);
      expect(data).assertEqual(11);
      done()
    });

    /**
     * @tc.name   testMuslMathCopySign005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COPYSIGN_0500
     * @tc.desc   test copysign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCopySign005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = -2;
      let data: Number = math.copysign(firstParam, secondParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathCopySign006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COPYSIGN_0600
     * @tc.desc   test copysign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCopySign006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 11;
      let secondParam = -1.0 / 0.0;
      let data: Number = math.copysign(firstParam, secondParam);
      expect(data).assertEqual(-11);
      done()
    });

    /**
     * @tc.name   testMuslMathExp003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXP_0300
     * @tc.desc   test exp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExp003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1;
      let result: number = 2.71828;
      let data: Number = math.exp(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathExp004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXP_0400
     * @tc.desc   test exp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExp004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.19;
      let result: number = 3.28708;
      let data: Number = math.exp(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathExp005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXP_0500
     * @tc.desc   test exp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExp005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.19;
      let result: number = 0.30422;
      let data: Number = math.exp(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathExp006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXP_0600
     * @tc.desc   test exp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExp006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let result: number = 0;
      let data: Number = math.exp(firstParam);
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.name   testMuslMathExp007
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXP_0700
     * @tc.desc   test exp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExp007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: Number = math.exp(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFabs002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FABS_0200
     * @tc.desc   test fabs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFabs002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -7.5;
      let data: Number = math.fabs(firstParam);
      expect(data).assertEqual(7.5);
      done()
    });

    /**
     * @tc.name   testMuslMathFabs003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FABS_0300
     * @tc.desc   test fabs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFabs003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: Number = math.fabs(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFabs004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FABS_0400
     * @tc.desc   test fabs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFabs004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -0;
      let data: Number = math.fabs(firstParam);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathFDim004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FDIM_0400
     * @tc.desc   test fdim
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFDim004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0;
      let secondParam = 0;
      let data: Number = math.fdim(firstParam, secondParam);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathFDim005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FDIM_0500
     * @tc.desc   test fdim
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFDim005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = -1.0 / 0.0;
      let data: Number = math.fdim(firstParam, secondParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFloor003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FLOOR_0300
     * @tc.desc   test floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFloor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0;
      let data: Number = math.floor(firstParam);
      expect(data).assertEqual(firstParam);
      done()
    });

    /**
     * @tc.name   testMuslMathFloor004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FLOOR_0400
     * @tc.desc   test floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFloor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: Number = math.floor(firstParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFloor005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FLOOR_0500
     * @tc.desc   test floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFloor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: Number = math.floor(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFma003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMA_0300
     * @tc.desc   test fma
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFma003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0;
      let secondParam = 2;
      let thirdParam = 2.5;
      let data: Number = math.fma(firstParam, secondParam, thirdParam);
      expect(data).assertEqual(2.5);
      done()
    });

    /**
     * @tc.name   testMuslMathFma004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMA_0400
     * @tc.desc   test fma
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFma004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = 2;
      let thirdParam = 2.5;
      let data: Number = math.fma(firstParam, secondParam, thirdParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFma005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMA_0500
     * @tc.desc   test fma
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFma005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let secondParam = 2;
      let thirdParam = 2.5;
      let data: Number = math.fma(firstParam, secondParam, thirdParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFma006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMA_0600
     * @tc.desc   test fma
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFma006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2.5;
      let secondParam = 2;
      let thirdParam = -1.0 / 0.0;
      let data: Number = math.fma(firstParam, secondParam, thirdParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFma007
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMA_0700
     * @tc.desc   test fma
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFma007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2.5;
      let secondParam = 2;
      let thirdParam = 1.0 / 0.0;
      let data: Number = math.fma(firstParam, secondParam, thirdParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFMax004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAX_0400
     * @tc.desc   test fmax
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFMax004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = 1.0 / 0.0;
      let data: Number = math.fmax(firstParam, secondParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFMax005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAX_0500
     * @tc.desc   test fmax
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFMax005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let secondParam = -1.0 / 0.0;
      let data: Number = math.fmax(firstParam, secondParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFmin004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMIN_0400
     * @tc.desc   test fmin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmin004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = 1.0 / 0.0;
      let data: Number = math.fmin(firstParam, secondParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFmin005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMIN_0500
     * @tc.desc   test fmin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmin005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let secondParam = -1.0 / 0.0;
      let data: Number = math.fmin(firstParam, secondParam);
      expect(data).assertNegUnlimited()
      done()
    });

    /**
     * @tc.name   testMuslMathFmod005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMOD_0500
     * @tc.desc   test fmod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmod005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = -3;
      let data: Number = math.fmod(firstParam, secondParam);
      expect(data).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathFmod006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMOD_0600
     * @tc.desc   test fmod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmod006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let secondParam = -3;
      let data: Number = math.fmod(firstParam, secondParam);
      expect(data).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathFmod007
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMOD_0700
     * @tc.desc   test fmod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmod007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 12.19;
      let secondParam = -1.0 / 0.0;
      let result: number = 12.19;
      let data: Number = math.fmod(firstParam, secondParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathFAbsF002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FABSF_0200
     * @tc.desc   test fabsf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFAbsF002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 7.5;
      let data: Number = math.fabsf(firstParam);
      expect(data).assertEqual(7.5);
      done()
    });

    /**
     * @tc.name   testMuslMathFAbsF003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FABSF_0300
     * @tc.desc   test fabsf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFAbsF003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -0;
      let data: Number = math.fabsf(firstParam);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathFAbsF004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FABSF_0400
     * @tc.desc   test fabsf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFAbsF004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: Number = math.fabsf(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathCosh004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSH_0400
     * @tc.desc   test cosh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCosh004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -60;
      let result: number = 1.60;
      let data: Number = math.cosh(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCosh005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSH_0500
     * @tc.desc   test cosh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCosh005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0.99;
      let result: number = 1.00;
      let data: Number = math.cosh(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCosh006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSH_0600
     * @tc.desc   test cosh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCosh006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 179.99;
      let result: number = 11.59;
      let data: Number = math.cosh(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCosh007
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSH_0700
     * @tc.desc   test cosh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCosh007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: Number = math.cosh(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathCosh008
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSH_0800
     * @tc.desc   test cosh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCosh008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: Number = math.cosh(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathExp2004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXP2_0400
     * @tc.desc   test exp2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExp2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0;
      let result: boolean = false;
      let data: Number = math.exp2(firstParam);
      if (data >= 0) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathExp2005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXP2_0500
     * @tc.desc   test exp2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExp2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let result: boolean = false;
      let data: Number = math.exp2(firstParam);
      if (data >= 0) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathExpM1004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPM1_0400
     * @tc.desc   test expm1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpM1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let result: boolean = false;
      let data: Number = math.expm1(firstParam);
      if (data >= -1) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathExpM1005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPM1_0500
     * @tc.desc   test expm1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpM1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0;
      let result: boolean = false;
      let data: Number = math.expm1(firstParam);
      if (data >= -1) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathExpM1006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPM1_0600
     * @tc.desc   test expm1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpM1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.9;
      let result: boolean = false;
      let data: Number = math.expm1(firstParam);
      if (data >= -1) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathExpM1007
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPM1_0700
     * @tc.desc   test expm1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpM1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.9;
      let result: boolean = false;
      let data: Number = math.expm1(firstParam);
      if (data >= -1) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathFmodF004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMODF_0400
     * @tc.desc   test fmodf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmodF004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = 3.5;
      let data: Number = math.fmodf(firstParam, secondParam);
      expect(data).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathFmodF005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMODF_0500
     * @tc.desc   test fmodf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmodF005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -4.7;
      let secondParam = -2.3;
      let result: number = -0.10;
      let data: Number = math.fmodf(firstParam, secondParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathFmodF006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMODF_0600
     * @tc.desc   test fmodf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmodF006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -4.7;
      let secondParam = -9.5;
      let result: number = 0;
      let data: Number = math.fmodf(firstParam, secondParam);
      if (firstParam > 0) {
        if (secondParam == 0) {
          expect(data).assertNaN();
        } else if (firstParam < secondParam) {
          result = firstParam;
          expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
        }
      } else {
        if (secondParam == 0) {
          expect(data).assertNaN();
        } else if (firstParam > secondParam) {
          result = firstParam;
          expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
        }
      }
      done()
    });

    /**
     * @tc.name   testMuslMathFmodF007
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMODF_0700
     * @tc.desc   test fmodf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmodF007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 4.7;
      let secondParam = -1.0 / 0.0;
      let result: number = 4.7;
      let data: Number = math.fmodf(firstParam, secondParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathFmodL004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMODL_0400
     * @tc.desc   test fmodl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmodL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = 3.5;
      let data: Number = math.fmodl(firstParam, secondParam);
      expect(data).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathFmodL005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMODL_0500
     * @tc.desc   test fmodl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmodL005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -4.7;
      let secondParam = -2.3;
      let result: number = -0.10;
      let data: Number = math.fmodl(firstParam, secondParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathFmodL006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMODL_0600
     * @tc.desc   test fmodl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmodL006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -4.7;
      let secondParam = -9.5;
      let result: number = 0;
      let data: Number = math.fmodl(firstParam, secondParam);
      if (firstParam > 0) {
        if (secondParam == 0) {
          expect(data).assertNaN();
        } else if (firstParam < secondParam) {
          result = firstParam;
          expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
        }
      } else {
        if (secondParam == 0) {
          expect(data).assertNaN();
        } else if (firstParam > secondParam) {
          result = firstParam;
          expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
        }
      }
      done()
    });

    /**
     * @tc.name   testMuslMathFmodL007
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMODL_0700
     * @tc.desc   test fmodl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmodL007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 4.7;
      let secondParam = -1.0 / 0.0;
      let result: number = 4.7;
      let data: Number = math.fmodl(firstParam, secondParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathFMinF004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMINF_0400
     * @tc.desc   test fminf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFMinF004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = 1.0 / 0.0;
      let data: Number = math.fminf(firstParam, secondParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFMinF005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMINF_0500
     * @tc.desc   test fminf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFMinF005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let secondParam = -1.0 / 0.0;
      let data: Number = math.fminf(firstParam, secondParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFMinL004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMINL_0400
     * @tc.desc   test fminl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFMinL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = 1.0 / 0.0;
      let data: Number = math.fminl(firstParam, secondParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFMinL005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMINL_0500
     * @tc.desc   test fminl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFMinL005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let secondParam = -1.0 / 0.0;
      let data: Number = math.fminl(firstParam, secondParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFMaxF004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAXF_0400
     * @tc.desc   test fmaxf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFMaxF004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = 1.0 / 0.0;
      let data: Number = math.fmaxf(firstParam, secondParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFMaxF005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAXF_0500
     * @tc.desc   test fmaxf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFMaxF005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let secondParam = -1.0 / 0.0;
      let data: Number = math.fmaxf(firstParam, secondParam);
      expect(data).assertNegUnlimited()
      done()
    });

    /**
     * @tc.name   testMuslMathFMaxL004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAXL_0400
     * @tc.desc   test fmaxl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFMaxL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = 1.0 / 0.0;
      let data: Number = math.fmaxl(firstParam, secondParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFMaxL005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAXL_0500
     * @tc.desc   test fmaxl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFMaxL005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let secondParam = -1.0 / 0.0;
      let data: Number = math.fmaxl(firstParam, secondParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFmaF003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAF_0300
     * @tc.desc   test fmaf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmaF003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0;
      let secondParam = 2;
      let thirdParam = 2.5;
      let data: Number = math.fmaf(firstParam, secondParam, thirdParam);
      expect(data).assertEqual(2.5);
      done()
    });

    /**
     * @tc.name   testMuslMathFmaF004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAF_0400
     * @tc.desc   test fmaf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmaF004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = 2;
      let thirdParam = 2.5;
      let data: Number = math.fmaf(firstParam, secondParam, thirdParam);
      expect(data).assertPosUnlimited()
      done()
    });

    /**
     * @tc.name   testMuslMathFmaF005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAF_0500
     * @tc.desc   test fmaf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmaF005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let secondParam = 2;
      let thirdParam = 2.5;
      let data: Number = math.fmaf(firstParam, secondParam, thirdParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFmaF006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAF_0600
     * @tc.desc   test fmaf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmaF006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2.5;
      let secondParam = 2;
      let thirdParam = -1.0 / 0.0;
      let data: Number = math.fmaf(firstParam, secondParam, thirdParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFmaF007
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAF_0700
     * @tc.desc   test fmaf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmaF007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2.5;
      let secondParam = 2;
      let thirdParam = 1.0 / 0.0;
      let data: Number = math.fmaf(firstParam, secondParam, thirdParam);
      expect(data).assertPosUnlimited()
      done()
    });

    /**
     * @tc.name   testMuslMathFmaL003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAL_0300
     * @tc.desc   test fmal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmaL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0;
      let secondParam = 2;
      let thirdParam = 2.5;
      let data: Number = math.fmal(firstParam, secondParam, thirdParam);
      expect(data).assertEqual(2.5);
      done()
    });

    /**
     * @tc.name   testMuslMathFmaL004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAL_0400
     * @tc.desc   test fmal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmaL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = 2;
      let thirdParam = 2.5;
      let data: Number = math.fmal(firstParam, secondParam, thirdParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFmaL005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAL_0500
     * @tc.desc   test fmal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmaL005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let secondParam = 2;
      let thirdParam = 2.5;
      let data: Number = math.fmal(firstParam, secondParam, thirdParam);
      expect(data).assertNegUnlimited()
      done()
    });

    /**
     * @tc.name   testMuslMathFmaL006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAL_0600
     * @tc.desc   test fmal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmaL006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2.5;
      let secondParam = 2;
      let thirdParam = -1.0 / 0.0;
      let data: Number = math.fmal(firstParam, secondParam, thirdParam);
      expect(data).assertNegUnlimited()
      done()
    });

    /**
     * @tc.name   testMuslMathFmaL007
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FMAL_0700
     * @tc.desc   test fmal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFmaL007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2.5;
      let secondParam = 2;
      let thirdParam = 1.0 / 0.0;
      let data: Number = math.fmal(firstParam, secondParam, thirdParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFloorF003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FLOORF_0300
     * @tc.desc   test floorf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFloorF003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0;
      let result: number = 0;
      let data: Number = math.floorf(firstParam);
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.name   testMuslMathFloorF004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FLOORF_0400
     * @tc.desc   test floorf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFloorF004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: Number = math.floorf(firstParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFloorF005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FLOORF_0500
     * @tc.desc   test floorf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFloorF005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: Number = math.floorf(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFloorL003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FLOORL_0300
     * @tc.desc   test floorl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFloorL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0;
      let result: number = 0;
      let data: Number = math.floorl(firstParam);
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.name   testMuslMathFloorL004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FLOORL_0400
     * @tc.desc   test floorl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFloorL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: Number = math.floorl(firstParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFloorL005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FLOORL_0500
     * @tc.desc   test floorl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFloorL005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: Number = math.floorl(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFDimF004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FDIMF_0400
     * @tc.desc   test fdimf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFDimF004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0;
      let secondParam = 0;
      let data: Number = math.fdimf(firstParam, secondParam);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathFDimF005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FDIMF_0500
     * @tc.desc   test fdimf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFDimF005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = -1.0 / 0.0;
      let data: Number = math.fdimf(firstParam, secondParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFDimL004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FDIML_0400
     * @tc.desc   test fdiml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFDimL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0;
      let secondParam = 0;
      let data: Number = math.fdiml(firstParam, secondParam);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathFDimL005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FDIML_0500
     * @tc.desc   test fdiml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFDimL005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = -1.0 / 0.0;
      let data: Number = math.fdiml(firstParam, secondParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFAbsL002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FABSL_0200
     * @tc.desc   test fabsl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFAbsL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -7.5;
      let data: Number = math.fabsl(firstParam);
      expect(data).assertEqual(7.5);
      done()
    });

    /**
     * @tc.name   testMuslMathFAbsL003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FABSL_0300
     * @tc.desc   test fabsl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFAbsL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -0;
      let data: Number = math.fabsl(firstParam);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathFAbsL004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FABSL_0400
     * @tc.desc   test fabsl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFAbsL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: Number = math.fabsl(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathCeil003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CEIL_0300
     * @tc.desc   test ceil
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCeil003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0;
      let data: Number = math.ceil(firstParam);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathCeil004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CEIL_0400
     * @tc.desc   test ceil
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCeil004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: Number = math.ceil(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathCeil005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CEIL_0500
     * @tc.desc   test ceil
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCeil005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: Number = math.ceil(firstParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathCeilF003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CEILF_0300
     * @tc.desc   test ceilf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCeilF003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0;
      let data: Number = math.ceilf(firstParam);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathCeilF004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CEILF_0400
     * @tc.desc   test ceilf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCeilF004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: Number = math.ceilf(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathCeilF005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CEILF_0500
     * @tc.desc   test ceilf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCeilF005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: Number = math.ceilf(firstParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathCeilL003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CEILL_0300
     * @tc.desc   test ceill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCeilL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0;
      let data: Number = math.ceill(firstParam);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathCeilL004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CEILL_0400
     * @tc.desc   test ceill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCeilL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: Number = math.ceill(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathCeilL005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CEILL_0500
     * @tc.desc   test ceill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCeilL005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: Number = math.ceill(firstParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathExpM1f004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPM1F_0400
     * @tc.desc   test expm1f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpM1f004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let result: boolean = false;
      let data: Number = math.expm1f(firstParam);
      if (data >= -1) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathExpM1f005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPM1F_0500
     * @tc.desc   test expm1f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpM1f005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0;
      let result: boolean = false;
      let data: Number = math.expm1f(firstParam);
      if (data >= -1) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathExpM1f006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPM1F_0600
     * @tc.desc   test expm1f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpM1f006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.9;
      let result: boolean = false;
      let data: Number = math.expm1f(firstParam);
      if (data >= -1) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathExpM1f007
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPM1F_0700
     * @tc.desc   test expm1f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpM1f007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.9;
      let result: boolean = false;
      let data: Number = math.expm1f(firstParam);
      if (data >= -1) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathATan2L005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2L_0500
     * @tc.desc   test ATan2L
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2L005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = Math.sqrt(-1);
      let Param1 = -1;
      let result: number = math.aTan2L(Param0, Param1);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathATan2L006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2L_0600
     * @tc.desc   test ATan2L
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2L006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 0;
      let Param1 = 0;
      let result: number = math.aTan2L(Param0, Param1);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2L007
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2L_0700
     * @tc.desc   test ATan2L
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2L007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (Math.PI / 4).toFixed(2);
      let Param0 = 1.0 / 0.0;
      let Param1 = 1.0 / 0.0;
      let result: string = (math.aTan2L(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2L008
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2L_0800
     * @tc.desc   test ATan2L
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2L008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (Math.PI * 3 / 4).toFixed(2);
      let Param0 = 1.0 / 0.0;
      let Param1 = -1.0 / 0.0;
      let result: string = (math.aTan2L(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2L009
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2L_0900
     * @tc.desc   test ATan2L
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2L009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (-Math.PI / 4).toFixed(2);
      let Param0 = -1.0 / 0.0;
      let Param1 = 1.0 / 0.0;
      let result: string = (math.aTan2L(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2L010
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2L_1000
     * @tc.desc   test ATan2L
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2L010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (-3 * Math.PI / 4).toFixed(2);
      let Param0 = -1.0 / 0.0;
      let Param1 = -1.0 / 0.0;
      let result: string = (math.aTan2L(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2L011
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2L_1100
     * @tc.desc   test ATan2L
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2L011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (-Math.PI / 2).toFixed(2);
      let Param0 = -1.0 / 0.0;
      let Param1 = 2;
      let result: string = (math.aTan2L(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2L012
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2L_1200
     * @tc.desc   test ATan2L
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2L012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (Math.PI / 2).toFixed(2);
      let Param0 = 1.0 / 0.0;
      let Param1 = 2;
      let result: string = (math.aTan2L(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2L013
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2L_1300
     * @tc.desc   test ATan2L
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2L013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (Math.PI).toFixed(2);
      let Param0 = 2;
      let Param1 = -1.0 / 0.0;
      let result: string = (math.aTan2L(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2L014
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2L_1400
     * @tc.desc   test ATan2L
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2L014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (-Math.PI).toFixed(2);
      let Param0 = -2;
      let Param1 = -1.0 / 0.0;
      let result: string = (math.aTan2L(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2L015
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2L_1500
     * @tc.desc   test ATan2L
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2L015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 2;
      let Param1 = 1.0 / 0.0;
      let result: number = math.aTan2L(Param0, Param1);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2F011
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2F_1100
     * @tc.desc   test ATan2F
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2F011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (-Math.PI / 2).toFixed(2);
      let Param0 = -1.0 / 0.0;
      let Param1 = 2;
      let result: string = (math.aTan2F(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2F012
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2F_1200
     * @tc.desc   test ATan2F
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2F012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (Math.PI / 2).toFixed(2);
      let Param0 = 1.0 / 0.0;
      let Param1 = 2;
      let result: string = (math.aTan2F(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2F013
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2F_1300
     * @tc.desc   test ATan2F
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2F013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (Math.PI).toFixed(2);
      let Param0 = 2;
      let Param1 = -1.0 / 0.0;
      let result: string = (math.aTan2F(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2F014
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2F_1400
     * @tc.desc   test ATan2F
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2F014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (-Math.PI).toFixed(2);
      let Param0 = -2;
      let Param1 = -1.0 / 0.0;
      let result: string = (math.aTan2F(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2F015
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2F_1500
     * @tc.desc   test ATan2F
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2F015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 2;
      let Param1 = 1.0 / 0.0;
      let result: number = math.aTan2F(Param0, Param1);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2011
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2_1100
     * @tc.desc   test ATan2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (-Math.PI / 2).toFixed(2);
      let Param0 = -1.0 / 0.0;
      let Param1 = 2;
      let result: string = (math.aTan2(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2012
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2_1200
     * @tc.desc   test ATan2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (Math.PI / 2).toFixed(2);
      let Param0 = 1.0 / 0.0;
      let Param1 = 2;
      let result: string = (math.aTan2(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2013
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2_1300
     * @tc.desc   test ATan2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (Math.PI).toFixed(2);
      let Param0 = 2;
      let Param1 = -1.0 / 0.0;
      let result: string = (math.aTan2(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2014
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2_1400
     * @tc.desc   test ATan2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = (-Math.PI).toFixed(2);
      let Param0 = -2;
      let Param1 = -1.0 / 0.0;
      let result: string = (math.aTan2(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATan2015
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATAN2_1500
     * @tc.desc   test ATan2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATan2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 2;
      let Param1 = 1.0 / 0.0;
      let result: number = math.aTan2(Param0, Param1);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATanH001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATANH_0100
     * @tc.desc   test ATanH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATanH001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = 1;
      let result: number = math.aTanH(Param0);
      expect(result).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathATanH002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATANH_0200
     * @tc.desc   test ATanH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATanH002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 0;
      let result: number = math.aTanH(Param0);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATanH003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATANH_0300
     * @tc.desc   test ATanH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATanH003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = 3;
      let result: number = math.aTanH(Param0);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathATanH004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATANH_0400
     * @tc.desc   test ATanH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATanH004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = -1;
      let result: number = math.aTanH(Param0);
      expect(result).assertNegUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathATanH005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATANH_0500
     * @tc.desc   test ATanH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATanH005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = Number(0.55).toFixed(2);
      let Param0 = 1 / 2;
      let result: string = Number(math.aTanH(Param0)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATanHF001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATANHF_0100
     * @tc.desc   test ATanHF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATanHF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = 1;
      let result: number = math.aTanHF(Param0);
      expect(result).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathATanHF002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATANHF_0200
     * @tc.desc   test ATanHF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATanHF002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 0;
      let result: number = math.aTanHF(Param0);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATanHF003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATANHF_0300
     * @tc.desc   test ATanHF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATanHF003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = 3;
      let result: number = math.aTanHF(Param0);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathATanHF004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATANHF_0400
     * @tc.desc   test ATanHF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATanHF004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = -1;
      let result: number = math.aTanHF(Param0);
      expect(result).assertNegUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathATanHF005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATANHF_0500
     * @tc.desc   test ATanHF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATanHF005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = Number(0.55).toFixed(2);
      let Param0 = 1 / 2;
      let result: string = Number(math.aTanHF(Param0)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATanHL001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATANHL_0100
     * @tc.desc   test ATanHL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATanHL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = 1;
      let result: number = math.aTanHL(Param0);
      expect(result).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathATanHL002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATANHL_0200
     * @tc.desc   test ATanHL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATanHL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 0;
      let result: number = math.aTanHL(Param0);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathATanHL003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATANHL_0300
     * @tc.desc   test ATanHL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATanHL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = 3;
      let result: number = math.aTanHL(Param0);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathATanHL004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATANHL_0400
     * @tc.desc   test ATanHL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATanHL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = -1;
      let result: number = math.aTanHL(Param0);
      expect(result).assertNegUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathATanHL005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ATANHL_0500
     * @tc.desc   test ATanHL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathATanHL005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = Number(0.55).toFixed(2);
      let Param0 = 1 / 2;
      let result: string = Number(math.aTanHL(Param0)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });
    /**
     * @tc.name   testMuslMathMODF001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_MODF_0100
     * @tc.desc   test modF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathMODF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = 1.59;
      let result: number = math.modF(Param0);
      expect(result).assertEqual(1);
      done()
    });
    /**
     * @tc.name   testMuslMathModFf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_MODFF_0100
     * @tc.desc   test modFf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathModFf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = 1.59;
      let result: number = math.modFf(Param0);
      expect(result).assertEqual(1);
      done()
    });
    /**
     * @tc.name   testMuslMathMODFl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_MODFL_0100
     * @tc.desc   test modFl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathMODFl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = 1.59;
      let result: number = math.modFl(Param0);
      expect(result).assertEqual(1);
      done()
    });
    /**
     * @tc.name   testMuslMathMRand48001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_MRAND48_0100
     * @tc.desc   test mrand48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathMRand48001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.mRand48();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathPow001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_POW_0100
     * @tc.desc   test pow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathPow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 2;
      let b = 3;
      let data: Number = math.pow(a, b);
      console.info("math.pow data = \"" + data + "\"");
      expect(data).assertEqual(8);
      done();
    });

    /**
     * @tc.name   testMuslMathPow002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_POW_0200
     * @tc.desc   test pow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathPow002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let a: number = 0.5, b = 0.3;
      let data: Number = math.pow(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data.toFixed(6)).assertEqual(JSON.stringify(0.812252));
      done();
    });

    /**
     * @tc.name   testMuslMathPow003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_POW_0300
     * @tc.desc   test pow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathPow003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 0, b = 0;
      let data: Number = math.pow(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslMathPowf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_POWF_0100
     * @tc.desc   test powf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathPowf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -1, b = -2;
      let data: Number = math.powf(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslMathPowf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_POWF_0200
     * @tc.desc   test powf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathPowf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let a: number = 4, b = 2;
      let data: Number = math.powf(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(16);
      done();
    });

    /**
     * @tc.name   testMuslMathPowf003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_POWF_0300
     * @tc.desc   test powf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathPowf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let a: number = 2.12, b = 3.24;
      let data: Number = math.powf(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data.toFixed(6)).assertEqual(JSON.stringify(11.411116));
      done();
    });

    /**
     * @tc.name   testMuslMathPowl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_POWL_0100
     * @tc.desc   test powl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathPowl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let a: number = 2.12, b = 3.24;
      let data: Number = math.powl(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data.toFixed(6)).assertEqual(JSON.stringify(11.411118));
      done();
    });

    /**
     * @tc.name   testMuslMathPowl002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_POWL_0200
     * @tc.desc   test powl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathPowl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let a: number = 0, b = 0;
      let data: Number = math.powl(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslMathPowl003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_POWL_0300
     * @tc.desc   test powl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathPowl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -2, b = 3;
      let data: Number = math.powl(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(-8);
      done();
    });

    /**
     * @tc.name   testMuslMathNextafter001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEXTAFTER_0100
     * @tc.desc   test nextafter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNextafter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1, b = 1;
      let data: Number = math.nextafter(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslMathNextafter002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEXTAFTER_0200
     * @tc.desc   test nextafter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNextafter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1, b = Math.sqrt(-1);
      let data: Number = math.nextafter(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathNextafter003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEXTAFTER_0300
     * @tc.desc   test nextafter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNextafter003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 0.0, b = 0.1;
      let data: Number = math.nextafter(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect((data == 5e-324)||(data == 0)||(data == 1.401298464324817e-45)).assertEqual(true);
      done();
    });

    /**
     * @tc.name   testMuslMathNextafterf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEXTAFTERF_0100
     * @tc.desc   test nextafterf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNextafterf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1, b = 1;
      let data: Number = math.nextafterf(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslMathNextafterf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEXTAFTERF_0200
     * @tc.desc   test nextafterf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNextafterf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1, b = Math.sqrt(-1);
      let data: Number = math.nextafterf(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathNextafterf003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEXTAFTERF_0300
     * @tc.desc   test nextafterf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNextafterf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 0.0, b = 0.1;
      let data: Number = math.nextafterf(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect((data == 5e-324)||(data == 0)||(data == 1.401298464324817e-45)).assertEqual(true);
      done();
    });

    /**
     * @tc.name   testMuslMathNextafterl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEXTAFTERL_0100
     * @tc.desc   test nextafterl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNextafterl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1, b = 1;
      let data: Number = math.nextafterl(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslMathNextafterl002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEXTAFTERL_0200
     * @tc.desc   test nextafterl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNextafterl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1, b = Math.sqrt(-1);
      let data: Number = math.nextafterl(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathNextafterl003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEXTAFTERL_0300
     * @tc.desc   test nextafterl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNextafterl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 0.0, b = 0.1;
      let data: Number = math.nextafterl(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect((data == 5e-324)||(data == 0)||(data == 1.401298464324817e-45)).assertEqual(true);
      done();
    });

    /**
     * @tc.name   testMuslMathNearbyint001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEARBYINT_0100
     * @tc.desc   test nearbyint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNearbyint001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 2.2;
      let data: Number = math.nearbyint(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(2);
      done();
    });

    /**
     * @tc.name   testMuslMathNearbyint002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEARBYINT_0200
     * @tc.desc   test nearbyint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNearbyint002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 2.6;
      let data: Number = math.nearbyint(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(3);
      done();
    });

    /**
     * @tc.name   testMuslMathNearbyint003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEARBYINT_0300
     * @tc.desc   test nearbyint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNearbyint003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -2.2;
      let data: Number = math.nearbyint(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(-2);
      done();
    });

    /**
     * @tc.name   testMuslMathNearbyint004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEARBYINT_0400
     * @tc.desc   test nearbyint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNearbyint004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -2.6;
      let data: Number = math.nearbyint(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(-3);
      done();
    });

    /**
     * @tc.name   testMuslMathNearbyint005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEARBYINT_0500
     * @tc.desc   test nearbyint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNearbyint005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = Math.sqrt(-1);
      let data: Number = math.nearbyint(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathNearbyintf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEARBYINTF_0100
     * @tc.desc   test nearbyintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNearbyintf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 2.26;
      let data: Number = math.nearbyintf(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(2);
      done();
    });

    /**
     * @tc.name   testMuslMathNearbyintf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEARBYINTF_0200
     * @tc.desc   test nearbyintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNearbyintf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 2.66;
      let data: Number = math.nearbyintf(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(3);
      done();
    });

    /**
     * @tc.name   testMuslMathNearbyintf003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEARBYINTF_0300
     * @tc.desc   test nearbyintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNearbyintf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -2.29;
      let data: Number = math.nearbyintf(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(-2);
      done();
    });

    /**
     * @tc.name   testMuslMathNearbyintf004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEARBYINTF_0400
     * @tc.desc   test nearbyintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNearbyintf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -2.62;
      let data: Number = math.nearbyintf(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(-3);
      done();
    });

    /**
     * @tc.name   testMuslMathNearbyintf005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEARBYINTF_0500
     * @tc.desc   test nearbyintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNearbyintf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = Math.sqrt(-1);
      let data: Number = math.nearbyintf(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathNearbyintl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEARBYINTL_0100
     * @tc.desc   test nearbyintl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNearbyintl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 2.26;
      let data: Number = math.nearbyintl(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(2);
      done();
    });

    /**
     * @tc.name   testMuslMathNearbyintl002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEARBYINTL_0200
     * @tc.desc   test nearbyintl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNearbyintl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 2.66;
      let data: Number = math.nearbyintl(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(3);
      done();
    });

    /**
     * @tc.name   testMuslMathNearbyintl003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEARBYINTL_0300
     * @tc.desc   test nearbyintl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNearbyintl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -2.29;
      let data: Number = math.nearbyintl(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(-2);
      done();
    });

    /**
     * @tc.name   testMuslMathNearbyintl004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEARBYINTL_0400
     * @tc.desc   test nearbyintl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNearbyintl004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = -2.62;
      let data: Number = math.nearbyintl(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(-3);
      done();
    });

    /**
     * @tc.name   testMuslMathNearbyintl005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEARBYINTL_0500
     * @tc.desc   test nearbyintl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNearbyintl005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = Math.sqrt(-1);
      let data: Number = math.nearbyintl(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathNan001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NAN_0100
     * @tc.desc   test nan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: string = "adc";
      let data: number = math.nan(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathNan002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NAN_0200
     * @tc.desc   test nan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNan002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: string = "123";
      let data: Number = math.nan(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathNan003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NAN_0300
     * @tc.desc   test nan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNan003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: string = "abc123";
      let data: Number = math.nan(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathNanf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NANF_0100
     * @tc.desc   test nanf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNanf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: string = "123";
      let data: Number = math.nanf(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathNanf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NANF_0200
     * @tc.desc   test nanf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNanf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: string = "abc";
      let data: number = math.nanf(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathNanf003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NANF_0300
     * @tc.desc   test nanf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNanf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: string = "abc123";
      let data: number = math.nanf(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathNanl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NANL_0100
     * @tc.desc   test nanl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNanl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: string = "abc";
      let data: number = math.nanl(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathNanl002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NANL_0200
     * @tc.desc   test nanl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNanl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: string = "123";
      let data: Number = math.nanl(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathNanl003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NANL_0300
     * @tc.desc   test nanl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNanl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: string = "abc123";
      let data: Number = math.nanl(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathNexttoward001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEXTTOWARD_0100
     * @tc.desc   test nexttoward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNexttoward001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1;
      let b = 1;
      let data: Number = math.nextToward(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslMathNexttoward002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEXTTOWARD_0200
     * @tc.desc   test nexttoward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNexttoward002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1;
      let b = Math.sqrt(-1);
      let data: Number = math.nextToward(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathNexttoward003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEXTTOWARD_0300
     * @tc.desc   test nexttoward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNexttoward003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 0;
      let b = 0.1;
      let data: Number = math.nextToward(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect((data == 5e-324)||(data == 0)||(data == 1.401298464324817e-45)).assertEqual(true);
      done();
    });

    /**
     * @tc.name   testMuslMathNexttowardF001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEXTTOWARDF_0100
     * @tc.desc   test nexttowarf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNexttowardF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1;
      let b = 1;
      let data: Number = math.nextTowardF(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslMathNexttowardF002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEXTTOWARDF_0200
     * @tc.desc   test nexttowarf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNexttowardF002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1;
      let b = Math.sqrt(-1);
      let data: Number = math.nextTowardF(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathNexttowardF003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEXTTOWARDF_0300
     * @tc.desc   test nexttowarf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNexttowardF003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 0;
      let b = 0.1;
      let data: Number = math.nextTowardF(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect((data == 5e-324)||(data == 0)||(data == 1.401298464324817e-45)).assertEqual(true);
      done();
    });

    /**
     * @tc.name   testMuslMathNexttowardL001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEXTTOWARDL_0100
     * @tc.desc   test nexttowarl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNexttowardL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1;
      let b = 1;
      let data: Number = math.nextTowardL(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslMathNexttowardL002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEXTTOWARDL_0200
     * @tc.desc   test nexttowarl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNexttowardL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1;
      let b = Math.sqrt(-1);
      let data: Number = math.nextTowardL(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.name   testMuslMathNexttowardL003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_NEXTTOWARDL_0300
     * @tc.desc   test nexttowarl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathNexttowardL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 0;
      let b = 0.1;
      let data: Number = math.nextTowardL(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect((data == 5e-324)||(data == 0)||(data == 1.401298464324817e-45)).assertEqual(true);
      done();
    });


    /**
     * @tc.name   testMuslMathLRint001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LRINT_0100
     * @tc.desc   test lRint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLRint001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 3.7;
      let result: number = math.lRint(param);
      console.info("Test lRint result = " + JSON.stringify(result));
      expect(result).assertEqual(4);
      done()
    });

    /**
     * @tc.name   testMuslMathLRint002
     * @tc.number SUB_THIRDPARTY_ MUSL_MATH_LRINT_0200
     * @tc.desc   test lRint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLRint002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = -1.1;
      let result: number = math.lRint(param);
      console.info("Test lRint result = " + JSON.stringify(result));
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslMathLRint003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LRINT_0300
     * @tc.desc   test lRint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLRint003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 0.3;
      let result: number = math.lRint(param);
      console.info("Test lRint result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathLRintf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LRINTF_0100
     * @tc.desc   test lRintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLRintf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 11.8;
      let result: number = math.lRintf(param);
      console.info("Test lRintf result = " + JSON.stringify(result));
      expect(result).assertEqual(12);
      done()
    });

    /**
     * @tc.name   testMuslMathLRintf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LRINTF_0200
     * @tc.desc   test lRintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLRintf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = -5.1;
      let result: number = math.lRintf(param);
      console.info("Test lRintF result = " + JSON.stringify(result));
      expect(result).assertEqual(-5);
      done()
    });

    /**
     * @tc.name   testMuslMathLRintf003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LRINTF_0300
     * @tc.desc   test lRintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLRintf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 0.6;
      let result: number = math.lRintf(param);
      console.info("Test lRintf result = " + JSON.stringify(result));
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslMathLRintl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LRINTL_0100
     * @tc.desc   test lRintl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLRintl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 5.1;
      let result: number = math.lRintl(param);
      console.info("Test lRintl result = " + JSON.stringify(result));
      expect(result).assertEqual(5);
      done()
    });

    /**
     * @tc.name   testMuslMathLRintl002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LRINTL_0200
     * @tc.desc   test lRintl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLRintl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = -0.6;
      let result: number = math.lRintl(param);
      console.info("Test lRintl result = " + JSON.stringify(result));
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslMathLRintl003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LRINTL_0300
     * @tc.desc   test lRintl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLRintl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = (4.6);
      let result: number = math.lRintl(param);
      console.info("Test lRintl result = " + JSON.stringify(result));
      expect(result).assertEqual(5);
      done()
    });


    /**
     * @tc.name   testMuslMathLRound001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LROUND_0100
     * @tc.desc   test lround
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLRound001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 5.1;
      let result: number = math.lRound(param);
      expect(result).assertEqual(5);
      done()
    });

    /**
     * @tc.name   testMuslMathLRound002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LROUND_0200
     * @tc.desc   test lRound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLRound002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = -1.1;
      let result: number = math.lRound(param);
      console.info("Test lRound result = " + JSON.stringify(result));
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslMathLRound003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LROUND_0300
     * @tc.desc   test lRound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLRound003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 11.2;
      let result: number = math.lRound(param);
      console.info("Test lRound result = " + JSON.stringify(result));
      expect(result).assertEqual(11);
      done()
    });

    /**
     * @tc.name   testMuslMathLRoundf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LROUNDF_0100
     * @tc.desc   test lRoundf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLRoundf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 11.87;
      let result: number = math.lRoundf(param);
      console.info("Test lRoundf result = " + JSON.stringify(result));
      expect(result).assertEqual(12);
      done()
    });

    /**
     * @tc.name   testMuslMathLRoundf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LROUNDF_0200
     * @tc.desc   test lRoundf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLRoundf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = -11.1;
      let result: number = math.lRoundf(param);
      console.info("Test lRoundf result = " + JSON.stringify(result));
      expect(result).assertEqual(-11);
      done()
    });

    /**
     * @tc.name   testMuslMathLRoundF003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LROUNDF_0300
     * @tc.desc   test lRoundf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLRoundF003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 11.5;
      let result: number = math.lRoundf(param);
      console.info("Test lRoundf result = " + JSON.stringify(result));
      expect(result).assertEqual(12);
      done()
    });

    /**
     * @tc.name   testMuslMathLRoundl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LROUNDL_0100
     * @tc.desc   test lRoundl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLRoundl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 11.87;
      let result: number = math.lRoundl(param);
      console.info("Test lRoundl result = " + JSON.stringify(result));
      expect(result).assertEqual(12);
      done()
    });

    /**
     * @tc.name   testMuslMathLRoundl002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LROUNDL_0200
     * @tc.desc   test lRoundl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLRoundl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = -1.1;
      let result: number = math.lRoundl(param);
      console.info("Test lRoundl result = " + JSON.stringify(result));
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslMathLRoundl003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_LROUNDL_0300
     * @tc.desc   test lRoundl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathLRoundl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 11.2;
      let result: number = math.lRoundl(param);
      console.info("Test lRoundL result = " + JSON.stringify(result));
      expect(result).assertEqual(11);
      done()
    });

    /**
     * @tc.name   testMuslMathILogb001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ILOGB_0100
     * @tc.desc   test ilogb
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathILogb001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 16.81;
      let result: number = math.ilogb(param);
      expect(result).assertEqual(4);
      done()
    });
    /**
     * @tc.name   testMuslMathILogb002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ILOGB_0200
     * @tc.desc   test ilogb
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathILogb002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 0.19;
      let result: number = math.ilogb(param);
      console.info("Test ILogb result = " + JSON.stringify(result));
      expect(result).assertEqual(-3);
      done()
    });

    /**
     * @tc.name   testMuslMathILogbf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ILOGBF_0100
     * @tc.desc   test ilogbf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathILogbf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 8.00;
      let result: number = math.ilogbf(param);
      console.info("Test ILogb result = " + JSON.stringify(result));
      expect(result).assertEqual(3);
      done()
    });

    /**
     * @tc.name   testMuslMathILogbf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ILOGBF_0200
     * @tc.desc   test ilogbf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathILogbf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 0.19;
      let result: number = math.ilogbf(param);
      console.info("Test ILogb result = " + JSON.stringify(result));
      expect(result).assertEqual(-3);
      done()
    });

    /**
     * @tc.name   testMuslMathILogbl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ILOGBL_0100
     * @tc.desc   test ilogbl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathILogbl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 17.0;
      let result: number = math.ilogbl(param);
      console.info("Test ILogb result = " + JSON.stringify(result));
      expect(result).assertEqual(4);
      done()
    });

    /**
     * @tc.name   testMuslMathILogbl002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ILOGBL_0200
     * @tc.desc   test ilogbl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathILogbl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 0.19;
      let result: number = math.ilogbl(param);
      console.info("Test ILogb result = " + JSON.stringify(result));
      expect(result).assertEqual(-3);
      done()
    });


    /**
     * @tc.name   testMuslMathHYpot001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_HYPOT_0100
     * @tc.desc   test hypot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathHYpot001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let x = 3;
      let y = 4;
      let result: number = math.hypot(x, y);
      expect(result).assertEqual(5);
      done()
    });

    /**
     * @tc.name   testMuslMathHYpot002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_HYPOT_0200
     * @tc.desc   test hypot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathHYpot002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let x = 9;
      let y = 12;
      let result: number = math.hypot(x, y);
      expect(result).assertEqual(15);
      done()
    });


    /**
     * @tc.name   testMuslMathhypotf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_HYPOTF_0100
     * @tc.desc   test hypotf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathhypotf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let x = 6;
      let y = 8;
      let result: number = math.hypotf(x, y);
      expect(result).assertEqual(10);
      done()
    });

    /**
     * @tc.name   testMuslMathhypotf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_HYPOTF_0200
     * @tc.desc   test hypotf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathhypotf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let x = 8;
      let y = 15;
      let result: number = math.hypotf(x, y);
      expect(result).assertEqual(17);
      done()
    });
    /**
     * @tc.name   testMuslMathHYpotl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_HYPOTL_0100
     * @tc.desc   test hypotl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathHYpotl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let x = 7;
      let y = 24;
      let result: number = math.hypotl(x, y);
      expect(result).assertEqual(25);
      done()
    });

    /**
     * @tc.name   testMuslMathHYpotl002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_HYPOTL_0200
     * @tc.desc   test hypotl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathHYpotl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let x = 65;
      let y = 72;
      let result: number = math.hypotl(x, y);
      expect(result).assertEqual(97);
      done()
    });
    /**
     * @tc.name   testMuslMathSignGam001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SIGNGAM_0100
     * @tc.desc   test signgam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSignGam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let x = 0.5;
      let result: number = math.signGam(x);
      expect(result).assertEqual(1);
      done()
    });


    /**
     * @tc.name   testMuslMathYn001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_YN_0100
     * @tc.desc   test yn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathYn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.yn();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathYnf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_YNF_0100
     * @tc.desc   test ynf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathYnf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.ynf();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslMathSincosl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SINCOSL_0100
     * @tc.desc   test sincosl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSincosl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 90;
      let c = 0.89
      let a: number = math.sincosl(b, 1);
      expect(Number(a).toFixed(2)).assertEqual(c.toString());
      done()
    });
    /**
     * @tc.name   testMuslMathSincosl002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SINCOSL_0200
     * @tc.desc   test sincosl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSincosl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sincosl(b, 1);
      expect(a).assertNaN();
      done()
    });
    /**
     * @tc.name   testMuslMathSincosl003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SINCOSL_0300
     * @tc.desc   test sincosl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSincosl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 90;
      let c = -0.45
      let a: number = math.sincosl(b, 2);
      expect(Number(a).toFixed(2)).assertEqual(c.toString());
      done()
    });
    /**
     * @tc.name   testMuslMathSincosl004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SINCOSL_0400
     * @tc.desc   test sincosl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSincosl004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sincosl(b, 2);
      expect(a).assertNaN();
      done()
    });
    /**
     * @tc.name   testMuslMathSincos001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SINCOS_0100
     * @tc.desc   test sincos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSincos001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 90;
      let c = 0.89
      let a: number = math.sincos(b, 1);
      expect(Number(a).toFixed(2)).assertEqual(c.toString());
      done()
    });
    /**
     * @tc.name   testMuslMathSincos002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SINCOS_0200
     * @tc.desc   test sincos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSincos002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sincos(b, 1);
      expect(a).assertNaN();
      done()
    });
    /**
     * @tc.name   testMuslMathSincos003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SINCOS_0300
     * @tc.desc   test sincos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSincos003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 90;
      let c = -0.45
      let a: number = math.sincos(b, 2);
      expect(Number(a).toFixed(2)).assertEqual(c.toString());
      done()
    });
    /**
     * @tc.name   testMuslMathSincos004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SINCOS_0400
     * @tc.desc   test sincos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSincos004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sincos(b, 2);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathSincosf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SINCOSF_0100
     * @tc.desc   test sincosf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSincosf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 90;
      let c = 0.89
      let a: number = math.sincosf(b, 1);
      expect(Number(a).toFixed(2)).assertEqual(c.toString());
      done()
    });
    /**
     * @tc.name   testMuslMathSincosf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SINCOSF_0200
     * @tc.desc   test sincosf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSincosf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sincosf(b, 1);
      expect(a).assertNaN();
      done()
    });
    /**
     * @tc.name   testMuslMathSincosf003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SINCOSF_0300
     * @tc.desc   test sincosf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSincosf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 90;
      let c = -0.45
      let a: number = math.sincosf(b, 2);
      expect(Number(a).toFixed(2)).assertEqual(c.toString());
      done()
    });
    /**
     * @tc.name   testMuslMathSincosf004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SINCOSF_0400
     * @tc.desc   test sincosf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSincosf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sincosf(b, 2);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathSignificand001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SIGNIFICAND_0100
     * @tc.desc   test significand
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSignificand001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 0.0
      let a: number = math.significand(b);
      expect(a).assertEqual(0.0);
      done()
    });

    /**
     * @tc.name   testMuslMathSignificand002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SIGNIFICAND_0200
     * @tc.desc   test significand
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSignificand002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 1 / 0
      let a: number = math.significand(b);
      expect(a).assertEqual(1 / 0);
      done()
    });

    /**
     * @tc.name   testMuslMathSignificand003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SIGNIFICAND_0300
     * @tc.desc   test significand
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSignificand003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 12.25
      let a: number = math.significand(b);
      expect(a).assertEqual(1.53125);
      done()
    });

    /**
     * @tc.name   testMuslMathSignificandf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SIGNIFICANDF_0100
     * @tc.desc   test significandf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSignificandf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 0.0
      let a: number = math.significandf(b);
      expect(a).assertEqual(0.0);
      done()
    });

    /**
     * @tc.name   testMuslMathSignificandf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SIGNIFICANDF_0200
     * @tc.desc   test significandf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSignificandf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 1 / 0
      let a: number = math.significandf(b);
      expect(a).assertEqual(1 / 0);
      done()
    });

    /**
     * @tc.name   testMuslMathSignificandf003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SIGNIFICANDF_0300
     * @tc.desc   test significandf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSignificandf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 12.25
      let a: number = math.significandf(b);
      expect(a).assertEqual(1.53125);
      done()
    });

    /**
     * @tc.name   testMuslMathScalb001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALB_0100
     * @tc.desc   test scalb
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalb001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 12;
      let param2 = 1;
      let result: number = math.scalb(param, param2);
      console.info("Test scalb result = " + JSON.stringify(result));
      expect(result).assertEqual(24);
      done()
    });

    /**
     * @tc.name   testMuslMathScalb002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALB_0200
     * @tc.desc   test scalb
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalb002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 200 / 0;
      let param2 = 0;
      let result: number = math.scalb(param, param2);
      console.info("Test scalb result = " + JSON.stringify(result));
      expect(result).assertEqual(200 / 0);
      done()
    });

    /**
     * @tc.name   testMuslMathScalb003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALB_0300
     * @tc.desc   test scalb
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalb003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 200 / -0;
      let param2 = 0;
      let result: number = math.scalb(param, param2);
      console.info("Test scalb result = " + JSON.stringify(result));
      expect(result).assertEqual(200 / -0);
      done()
    });

    /**
     * @tc.name   testMuslMathScalbf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALBF_0100
     * @tc.desc   test scalbf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalbf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 12;
      let param2 = 1;
      let result: number = math.scalbf(param, param2);
      console.info("Test scalbf result = " + JSON.stringify(result));
      expect(result).assertEqual(24);
      done()
    });

    /**
     * @tc.name   testMuslMathScalbf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALBF_0200
     * @tc.desc   test scalbf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalbf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 200 / 0;
      let param2 = 0;
      let result: number = math.scalbf(param, param2);
      console.info("Test scalbf result = " + JSON.stringify(result));
      expect(result).assertEqual(200 / 0);
      done()
    });

    /**
     * @tc.name   testMuslMathScalbf003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SCALBF_0300
     * @tc.desc   test scalbf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathScalbf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 200 / -0;
      let param2 = 0;
      let result: number = math.scalbf(param, param2);
      console.info("Test scalbf result = " + JSON.stringify(result));
      expect(result).assertEqual(200 / -0);
      done()
    });

    /**
     * @tc.name   testMuslMathTrunc001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TRUNC_0100
     * @tc.desc   test trunc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTrunc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 12;
      let result: number = math.trunc(param);
      console.info("Test trunc result = " + JSON.stringify(result));
      expect(result).assertEqual(12);
      done()
    });

    /**
     * @tc.name   testMuslMathTrunc002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TRUNC_0200
     * @tc.desc   test trunc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTrunc002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 10.25;
      let result: number = math.trunc(param);
      console.info("Test trunc result = " + JSON.stringify(result));
      expect(result).assertEqual(10);
      done()
    });

    /**
     * @tc.name   testMuslMathTrunc003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TRUNC_0300
     * @tc.desc   test trunc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTrunc003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 200 / 0;
      let result: number = math.trunc(param);
      console.info("Test trunc result = " + JSON.stringify(result));
      expect(result).assertEqual(200 / 0);
      done()
    });

    /**
     * @tc.name   testMuslMathTrunc004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TRUNC_0400
     * @tc.desc   test trunc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTrunc004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = Math.sqrt(-1);
      let result: number = math.trunc(param);
      console.info("Test trunc result = " + JSON.stringify(result));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathTruncf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TRUNCF_0100
     * @tc.desc   test truncf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTruncf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 12;
      let result: number = math.truncf(param);
      console.info("Test truncf result = " + JSON.stringify(result));
      expect(result).assertEqual(12);
      done()
    });

    /**
     * @tc.name   testMuslMathTruncf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TRUNCF_0200
     * @tc.desc   test truncf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTruncf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 10.25;
      let result: number = math.truncf(param);
      console.info("Test truncf result = " + JSON.stringify(result));
      expect(result).assertEqual(10);
      done()
    });

    /**
     * @tc.name   testMuslMathTruncf003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TRUNCF_0300
     * @tc.desc   test truncf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTruncf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 200 / 0;
      let result: number = math.truncf(param);
      console.info("Test trunc result = " + JSON.stringify(result));
      expect(result).assertEqual(200 / 0);
      done()
    });

    /**
     * @tc.name   testMuslMathTruncf004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TRUNCF_0400
     * @tc.desc   test truncf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTruncf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = Math.sqrt(-1);
      let result: number = math.truncf(param);
      console.info("Test truncf result = " + JSON.stringify(result));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathTruncl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TRUNCL_0100
     * @tc.desc   test truncl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTruncl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 12;
      let result: number = math.truncl(param);
      console.info("Test truncl result = " + JSON.stringify(result));
      expect(result).assertEqual(12);
      done()
    });

    /**
     * @tc.name   testMuslMathTruncl002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TRUNCL_0200
     * @tc.desc   test truncl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTruncl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 10.25;
      let result: number = math.truncl(param);
      console.info("Test truncl result = " + JSON.stringify(result));
      expect(result).assertEqual(10);
      done()
    });

    /**
     * @tc.name   testMuslMathTruncl003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TRUNCL_0300
     * @tc.desc   test truncl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTruncl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 200 / 0;
      let result: number = math.truncl(param);
      console.info("Test truncl result = " + JSON.stringify(result));
      expect(result).assertEqual(200 / 0);
      done()
    });

    /**
     * @tc.name   testMuslMathTruncl004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_TRUNCL_0400
     * @tc.desc   test truncl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathTruncl004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = Math.sqrt(-1);
      let result: number = math.truncl(param);
      console.info("Test truncfl result = " + JSON.stringify(result));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathY0001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_Y0_0100
     * @tc.desc   test y0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathY0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = Math.sqrt(-1);
      let result: number = math.y0(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathY0f001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_Y0F_0100
     * @tc.desc   test y0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathY0f001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = Math.sqrt(-1);
      let result: number = math.y0f(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathY1001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_Y1_0100
     * @tc.desc   test y1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathY1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = Math.sqrt(-1);
      let result: number = math.y1(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathY1f001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_Y1F_0100
     * @tc.desc   test y1f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathY1f001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = Math.sqrt(-1);
      let result: number = math.y1f(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathCbrt001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CBRT_0100
     * @tc.desc   test cbrt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCbrt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = Number(-1.00).toFixed(2);
      let Param0 = -1;
      let result: string = Number(math.cbrt(Param0)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathCbrt002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CBRT_0200
     * @tc.desc   test cbrt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCbrt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 0;
      let result: number = math.cbrt(Param0);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathCbrt003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CBRT_0300
     * @tc.desc   test cbrt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCbrt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = Number(1.00).toFixed(2);
      let Param0 = 1;
      let result: string = Number(math.cbrt(Param0)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });
    /**
     * @tc.name   testMuslMathCbrt004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CBRT_0400
     * @tc.desc   test cbrt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCbrt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.cbrt(Math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathCbrt005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CBRT_0500
     * @tc.desc   test cbrt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCbrt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = 1.0 / 0.0;
      let result: number = math.cbrt(Param0);
      expect(result).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathCbrt006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CBRT_0600
     * @tc.desc   test cbrt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCbrt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = -1.0 / 0.0;
      let result: number = math.cbrt(Param0);
      expect(result).assertNegUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathCbrtF001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CBRTF_0100
     * @tc.desc   test cbrtF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCbrtF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = Number(-1.00).toFixed(2);
      let Param0 = -1;
      let result: string = Number(math.cbrtf(Param0)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathCbrtF002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CBRTF_0200
     * @tc.desc   test cbrtF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCbrtF002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 0;
      let result: number = math.cbrtf(Param0);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathCbrtF003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CBRTF_0300
     * @tc.desc   test cbrtF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCbrtF003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = Number(1.00).toFixed(2);
      let Param0 = 1;
      let result: string = Number(math.cbrtf(Param0)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });
    /**
     * @tc.name   testMuslMathCbrtF004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CBRTF_0400
     * @tc.desc   test cbrtF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCbrtF004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.cbrtf(Math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathCbrtF005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CBRTF_0500
     * @tc.desc   test cbrtF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCbrtF005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = 1.0 / 0.0;
      let result: number = math.cbrtf(Param0);
      expect(result).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathCbrtF006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CBRTF_0600
     * @tc.desc   test cbrtF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCbrtF006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = -1.0 / 0.0;
      let result: number = math.cbrtf(Param0);
      expect(result).assertNegUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathCbrtL001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CBRTL_0100
     * @tc.desc   test cbrtL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCbrtL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = Number(-1.00).toFixed(2);
      let Param0 = -1;
      let result: string = Number(math.cbrtl(Param0)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathCbrtL002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CBRTL_0200
     * @tc.desc   test cbrtL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCbrtL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 0;
      let result: number = math.cbrtl(Param0);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathCbrtL003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CBRTL_0300
     * @tc.desc   test cbrtL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCbrtL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: string = Number(1.00).toFixed(2);
      let Param0 = 1;
      let result: string = Number(math.cbrtl(Param0)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });
    /**
     * @tc.name   testMuslMathCbrtL004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CBRTL_0400
     * @tc.desc   test cbrtL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCbrtL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.cbrtl(Math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathCbrtL005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CBRTL_0500
     * @tc.desc   test cbrtL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCbrtL005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = 1.0 / 0.0;
      let result: number = math.cbrtl(Param0);
      expect(result).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathCbrtL006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_CBRTL_0600
     * @tc.desc   test cbrtL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCbrtL006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = -1.0 / 0.0;
      let result: number = math.cbrtl(Param0);
      expect(result).assertNegUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFrexp001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FREXP_0100
     * @tc.desc   test frexp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFrexp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = -0.5;
      let Param0 = -1;
      let result: number = math.frexp(Param0);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathFrexp002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FREXP_0200
     * @tc.desc   test frexp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFrexp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = Math.sqrt(-1);
      let result: number = math.frexp(Param0);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathFrexp003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FREXP_0300
     * @tc.desc   test frexp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFrexp003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0.5;
      let Param0 = 1;
      let result: number = math.frexp(Param0);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathFrexp004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FREXP_0400
     * @tc.desc   test frexp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFrexp004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.frexp(Math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathFrexp005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FREXP_0500
     * @tc.desc   test frexp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFrexp005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = 1.0 / 0.0;
      let result: number = math.frexp(Param0);
      expect(result).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFrexp006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FREXP_0600
     * @tc.desc   test frexp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFrexp006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = -1.0 / 0.0;
      let result: number = math.frexp(Param0);
      expect(result).assertNegUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFrexpl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FREXPL_0100
     * @tc.desc   test frexpl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFrexpl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = -0.5;
      let Param0 = -1;
      let result: number = math.frexpl(Param0);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathFrexpl002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FREXPL_0200
     * @tc.desc   test frexpl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFrexpl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = Math.sqrt(-1);
      let result: number = math.frexpl(Param0);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathFrexpl003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FREXPL_0300
     * @tc.desc   test frexpl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFrexpl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0.5;
      let Param0 = 1;
      let result: number = math.frexpl(Param0);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathFrexpl004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FREXPL_0400
     * @tc.desc   test frexpl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFrexpl004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.frexpl(Math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathFrexpl005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FREXPL_0500
     * @tc.desc   test frexpl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFrexpl005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = 1.0 / 0.0;
      let result: number = math.frexpl(Param0);
      expect(result).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFrexpl006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FREXPL_0600
     * @tc.desc   test frexpl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFrexpl006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = -1.0 / 0.0;
      let result: number = math.frexpl(Param0);
      expect(result).assertNegUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFrexpf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FREXPF_0100
     * @tc.desc   test frexpf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFrexpf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = -0.5;
      let Param0 = -1;
      let result: number = math.frexpf(Param0);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathFrexpf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FREXPF_0200
     * @tc.desc   test frexpf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFrexpf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = Math.sqrt(-1);
      let result: number = math.frexpf(Param0);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathFrexpf003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FREXPF_0300
     * @tc.desc   test frexpf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFrexpf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0.5;
      let Param0 = 1;
      let result: number = math.frexpf(Param0);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathFrexpf004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FREXPF_0400
     * @tc.desc   test frexpf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFrexpf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = math.frexpf(Math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathFrexpf005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FREXPF_0500
     * @tc.desc   test frexpf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFrexpf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = 1.0 / 0.0;
      let result: number = math.frexpf(Param0);
      expect(result).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFrexpf006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FREXPF_0600
     * @tc.desc   test frexpf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFrexpf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let Param0 = -1.0 / 0.0;
      let result: number = math.frexpf(Param0);
      expect(result).assertNegUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathFpclassifyl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FPCLASSIFYL_0100
     * @tc.desc   test __fpclassifyl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFpclassifyl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 2;
      let Param = 0;
      let result: number = math.fpclassifyl(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathFpclassifyf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FPCLASSIFYF_0100
     * @tc.desc   test __fpclassifyf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFpclassifyf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 2;
      let Param = 0;
      let result: number = math.fpclassifyf(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathFpclassify001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FPCLASSIFY_0100
     * @tc.desc   test __fpclassify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFpclassify001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 2;
      let Param = 0;
      let result: number = math.fpclassify(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathSignbit001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SIGNBIT_0100
     * @tc.desc   test __signbit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSignbit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let Param = 1;
      let result: number = math.signbit(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathSignbitf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SIGNBITF_0100
     * @tc.desc   test __signbitf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSignbitf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let Param = 1;
      let result: number = math.signbitf(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathSignbitl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_SIGNBITL_0100
     * @tc.desc   test __signbitl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathSignbitl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue: number = 0;
      let Param = 1;
      let result: number = math.signbitl(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslMathExpM1l007
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPM1L_0700
     * @tc.desc   test expm1l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpM1l007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.9;
      let result = false;
      let data: number = math.expm1l(firstParam);
      if (data >= -1) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathExpM1l001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPM1L_0100
     * @tc.desc   test expm1l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpM1l001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = 4;
      let result = false;
      let data:number = math.expm1l(firstParam);
      if (data >= -1) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathExpM1l002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPM1L_0200
     * @tc.desc   test expm1l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpM1l002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data:number = math.expm1l(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathExpM1l003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPM1L_0300
     * @tc.desc   test expm1l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpM1l003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = -1;
      let result = false;
      let data:number = math.expm1l(firstParam);
      if (data >= -1) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathExpM1l004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPM1L_0400
     * @tc.desc   test expm1l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpM1l004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let result = false;
      let data:number = math.expm1l(firstParam);
      if (data >= -1) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathExpM1l005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPM1L_0500
     * @tc.desc   test expm1l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpM1l005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = 0;
      let result = false;
      let data:number = math.expm1l(firstParam);
      if (data >= -1) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathExpL001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPL_0100
     * @tc.desc   test expl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = -1;
      let result = 0.367879;
      let data:number = math.expl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathExpL002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPL_0200
     * @tc.desc   test expl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = 0;
      let data:number = math.expl(firstParam);
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslMathExpL003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPL_0300
     * @tc.desc   test expl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = 1;
      let result: number = 2.718;
      let data:number = math.expl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathExpL004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPL_0400
     * @tc.desc   test expl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = 1.19;
      let result: number = 3.287;
      let data:number = math.expl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathExpL005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPL_0500
     * @tc.desc   test expl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpL005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = -1.19;
      let result: number = 0.304;
      let data:number = math.expl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathExpL006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPL_0600
     * @tc.desc   test expl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpL006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data:number = math.expl(firstParam);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathExpL007
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPL_0700
     * @tc.desc   test expl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpL007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data:number = math.expl(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathExpF001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPF_0100
     * @tc.desc   test expf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = -1;
      let result: number = 0.367879;
      let data:number = math.expf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathExpF002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPF_0200
     * @tc.desc   test expf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpF002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = 0;
      let data:number = math.expf(firstParam);
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslMathExpF003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPF_0300
     * @tc.desc   test expf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpF003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = 1;
      let result: number = 2.718;
      let data:number = math.expf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathExpF004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPF_0400
     * @tc.desc   test expf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpF004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = 1.19;
      let result: number = 3.287;
      let data:number = math.expf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathExpF005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPF_0500
     * @tc.desc   test expf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpF005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = -1.19;
      let result: number = 0.304;
      let data:number = math.expf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathExpF006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPF_0600
     * @tc.desc   test expf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpF006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data:number = math.expf(firstParam);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslMathExpF007
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPF_0700
     * @tc.desc   test expf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpF007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data:number = math.expf(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathExp2l001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXP2L_0100
     * @tc.desc   test exp2l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExp2l001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = -1;
      let result = false;
      let data:number = math.exp2l(firstParam);
      if (data >= 0) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathExp2l002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXP2L_0200
     * @tc.desc   test exp2l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExp2l002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data:number = math.exp2l(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathExp2l003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXP2L_0300
     * @tc.desc   test exp2l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExp2l003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = 4.7;
      let result = false;
      let data:number = math.exp2l(firstParam);
      if (data >= 0) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathExp2l004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXP2L_0400
     * @tc.desc   test exp2l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExp2l004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = 0;
      let result = false;
      let data:number = math.exp2l(firstParam);
      if (data >= 0) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathExp2l005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXP2L_0500
     * @tc.desc   test exp2l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExp2l005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let result = false;
      let data:number = math.exp2l(firstParam);
      if (data >= 0) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathExp2f001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXP2F_0100
     * @tc.desc   test exp2f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExp2f001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = -1;
      let result = false;
      let data:number = math.exp2f(firstParam);
      if (data >= 0) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathExp2f002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXP2F_0200
     * @tc.desc   test exp2f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExp2f002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data:number = math.exp2f(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathExp2f003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXP2F_0300
     * @tc.desc   test exp2f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExp2f003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = 4.7;
      let result = false;
      let data:number = math.exp2f(firstParam);
      if (data >= 0) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathExp2f004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXP2F_0400
     * @tc.desc   test exp2f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExp2f004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = 0;
      let result = false;
      let data:number = math.exp2f(firstParam);
      if (data >= 0) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathExp2f005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXP2F_0500
     * @tc.desc   test exp2f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExp2f005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let result = false;
      let data:number = math.exp2f(firstParam);
      if (data >= 0) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathErfF001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ERFF_0100
     * @tc.desc   test erff
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathErfF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = 1;
      let data:number = math.erff(firstParam);
      let result = false;
      if (data > -1 && data <= 1) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathErfL001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ERFL_0100
     * @tc.desc   test erfl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathErfL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = 1;
      let data:number = math.erfl(firstParam);
      let result = false;
      if (data > -1 && data <= 1) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslMathErfCl001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ERFCL_0100
     * @tc.desc   test erfcl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathErfCl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data:number = math.erfcl(firstParam);
      let result = 2;
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.name   testMuslMathErfCl002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ERFCL_0200
     * @tc.desc   test erfcl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathErfCl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data:number = math.erfcl(firstParam);
      let result = 0;
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.name   testMuslMathErfCl003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ERFCL_0300
     * @tc.desc   test erfcl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathErfCl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = 1.0;
      let data:number = math.erfcl(firstParam);
      let result = 0.16;
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathErfCl004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ERFCL_0400
     * @tc.desc   test erfcl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathErfCl004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = 0;
      let data:number = math.erfcl(firstParam);
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslMathErfCl005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ERFCL_0500
     * @tc.desc   test erfcl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathErfCl005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = -1.9;
      let result: number = 1.992;
      let data:number = math.erfcl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathErfCf001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ERFCF_0100
     * @tc.desc   test erfcf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathErfCf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data:number = math.erfcf(firstParam);
      let result = 2;
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.name   testMuslMathErfCf002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ERFCF_0200
     * @tc.desc   test erfcf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathErfCf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let result = 0;
      let data:number = math.erfcf(firstParam);
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.name   testMuslMathCopySignF001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COPYSIGNF_0100
     * @tc.desc   test copysignf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCopySignF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 11;
      let secondParam = -2;
      let data: number = math.copysignf(firstParam, secondParam);
      expect(data).assertEqual(-11);
      done()
    });

    /**
     * @tc.name   testMuslMathCopySignF002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COPYSIGNF_0200
     * @tc.desc   test copysignf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCopySignF002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -11;
      let secondParam = -2;
      let data: number = math.copysignf(firstParam, secondParam);
      expect(data).assertEqual(-11);
      done()
    });

    /**
     * @tc.name   testMuslMathCopySignF003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COPYSIGNF_0300
     * @tc.desc   test copysignf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCopySignF003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -11;
      let secondParam = 2;
      let data: number = math.copysignf(firstParam, secondParam);
      expect(data).assertEqual(11);
      done()
    });

    /**
     * @tc.name   testMuslMathCopySignF004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COPYSIGNF_0400
     * @tc.desc   test copysignf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCopySignF004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 11;
      let secondParam = 2;
      let data: number = math.copysignf(firstParam, secondParam);
      expect(data).assertEqual(11);
      done()
    });

    /**
     * @tc.name   testMuslMathCopySignF005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COPYSIGNF_0500
     * @tc.desc   test copysignf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCopySignF005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = -2;
      let data: number = math.copysignf(firstParam, secondParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathCopySignF006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COPYSIGNF_0600
     * @tc.desc   test copysignf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCopySignF006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 11;
      let secondParam = -1.0 / 0.0;
      let data: number = math.copysignf(firstParam, secondParam);
      expect(data).assertEqual(-11);
      done()
    });

    /**
     * @tc.name   testMuslMathCopySignL001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COPYSIGNL_0100
     * @tc.desc   test copysignl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCopySignL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 11;
      let secondParam = -2;
      let data: number = math.copysignl(firstParam, secondParam);
      expect(data).assertEqual(-11);
      done()
    });

    /**
     * @tc.name   testMuslMathCopySignL002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COPYSIGNL_0200
     * @tc.desc   test copysignl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCopySignL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -11;
      let secondParam = -2;
      let data: number = math.copysignl(firstParam, secondParam);
      expect(data).assertEqual(-11);
      done()
    });

    /**
     * @tc.name   testMuslMathCopySignL003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COPYSIGNL_0300
     * @tc.desc   test copysignl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCopySignL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -11;
      let secondParam = 2;
      let data: number = math.copysignl(firstParam, secondParam);
      expect(data).assertEqual(11);
      done()
    });

    /**
     * @tc.name   testMuslMathCopySignL004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COPYSIGNL_0400
     * @tc.desc   test copysignl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCopySignL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 11;
      let secondParam = 2;
      let data: number = math.copysignl(firstParam, secondParam);
      expect(data).assertEqual(11);
      done()
    });

    /**
     * @tc.name   testMuslMathCopySignL005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COPYSIGNL_0500
     * @tc.desc   test copysignl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCopySignL005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = -2;
      let data: number = math.copysignl(firstParam, secondParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathCopySignL006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COPYSIGNL_0600
     * @tc.desc   test copysignl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCopySignL006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 11;
      let secondParam = -1.0 / 0.0;
      let data: number = math.copysignl(firstParam, secondParam);
      expect(data).assertEqual(-11);
      done()
    });

    /**
     * @tc.name   testMuslMathCosF001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSF_0100
     * @tc.desc   test cosf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCosF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 60;
      let result = 0.50;
      let data: number = math.cosf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCosF002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSF_0200
     * @tc.desc   test cosf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCosF002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0;
      let result = 1.00;
      let data: number = math.cosf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCosF003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSF_0300
     * @tc.desc   test cosf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCosF003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 90;
      let result = "-0.00";
      let data: number = math.cosf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(result);
      done()
    });

    /**
     * @tc.name   testMuslMathCosF004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSF_0400
     * @tc.desc   test cosf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCosF004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -30;
      let result = 0.87;
      let data: number = math.cosf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCosF005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSF_0500
     * @tc.desc   test cosf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCosF005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0.99;
      let result = 1.00;
      let data: number = math.cosf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCosF006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSF_0600
     * @tc.desc   test cosf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCosF006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 179.99;
      let result = -1.00;
      let data: number = math.cosf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCosF007
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSF_0700
     * @tc.desc   test cosf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCosF007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: number = math.cosf(firstParam);
      expect(data).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathCosF008
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSF_0800
     * @tc.desc   test cosf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCosF008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: number = math.cosf(firstParam);
      expect(data).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathCosL001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSL_0100
     * @tc.desc   test cosl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCosL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 60;
      let result = 0.50;
      let data: number = math.cosl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCosL002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSL_0200
     * @tc.desc   test cosl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCosL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0;
      let result = 1.00;
      let data: number = math.cosl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCosL003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSL_0300
     * @tc.desc   test cosl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCosL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 90;
      let result = 0.00;
      let data: number = math.cosl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCosL004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSL_0400
     * @tc.desc   test cosl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCosL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -30;
      let result = 0.87;
      let data: number = math.cosl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCosL005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSL_0500
     * @tc.desc   test cosl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCosL005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0.99;
      let result = 1.00;
      let data: number = math.cosl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCosL006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSL_0600
     * @tc.desc   test cosl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCosL006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 179.99;
      let result = -1.00;
      let data: number = math.cosl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCosL007
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSL_0700
     * @tc.desc   test cosl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCosL007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: number = math.cosl(firstParam);
      expect(data).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathCosL008
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSL_0800
     * @tc.desc   test cosl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCosL008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: number = math.cosl(firstParam);
      expect(data).assertNaN();
      done()
    });

    /**
     * @tc.name   testMuslMathCoshF001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSHF_0100
     * @tc.desc   test coshf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCoshF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 90;
      let result = 2.50918;
      let data: number = math.coshf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCoshF002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSHF_0200
     * @tc.desc   test coshf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCoshF002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0;
      let result = 1;
      let data: number = math.coshf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCoshF003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSHF_0300
     * @tc.desc   test coshf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCoshF003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -30;
      let result = 1.14023;
      let data: number = math.coshf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCoshF004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSHF_0400
     * @tc.desc   test coshf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCoshF004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -60;
      let result = 1.60;
      let data: number = math.coshf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCoshF005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSHF_0500
     * @tc.desc   test coshf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCoshF005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0.99;
      let result = 1.00;
      let data: number = math.coshf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCoshF006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSHF_0600
     * @tc.desc   test coshf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCoshF006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 179.99;
      let result = 11.59;
      let data: number = math.coshf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCoshF007
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSHF_0700
     * @tc.desc   test coshf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCoshF007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: number = math.coshf(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathCoshF008
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSHF_0800
     * @tc.desc   test coshf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCoshF008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: number = math.coshf(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathCoshL001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSHL_0100
     * @tc.desc   test coshl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCoshL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 90;
      let result = 2.50918;
      let data: number = math.coshl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCoshL002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSHL_0200
     * @tc.desc   test coshl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCoshL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0;
      let result = 1;
      let data: number = math.coshl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCoshL003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSHL_0300
     * @tc.desc   test coshl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCoshL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -30;
      let result = 1.14023;
      let data: number = math.coshl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCoshL004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSHL_0400
     * @tc.desc   test coshl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCoshL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -60;
      let result = 1.60;
      let data: number = math.coshl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCoshL005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSHL_0500
     * @tc.desc   test coshl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCoshL005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0.99;
      let result = 1.00;
      let data: number = math.coshl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCoshL006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSHL_0600
     * @tc.desc   test coshl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCoshL006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 179.99;
      let result = 11.59;
      let data: number = math.coshl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathCoshL007
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSHL_0700
     * @tc.desc   test coshl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCoshL007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: number = math.coshl(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathCoshL008
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_COSHL_0800
     * @tc.desc   test coshl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathCoshL008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: number = math.coshl(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.name   testMuslMathErfC001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ERFC_0100
     * @tc.desc   test erfc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathErfC001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: number = math.erfc(firstParam);
      let result = 2;
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.name   testMuslMathErfC002
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ERFC_0200
     * @tc.desc   test erfc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathErfC002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: number = math.erfc(firstParam);
      let result = 0;
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.name   testMuslMathErfC003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ERFC_0300
     * @tc.desc   test erfc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathErfC003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0;
      let data: number = math.erfc(firstParam);
      let result = 0.16;
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathErfC004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ERFC_0400
     * @tc.desc   test erfc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathErfC004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0;
      let data: number = math.erfc(firstParam);
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslMathErfC005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ERFC_0500
     * @tc.desc   test erfc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathErfC005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.9;
      let result = 1.992;
      let data: number = math.erfc(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathErfCf003
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ERFCF_0300
     * @tc.desc   test erfcf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathErfCf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.0;
      let data: number = math.erfcf(firstParam);
      let result = 0.16;
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathErfCf004
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ERFCF_0400
     * @tc.desc   test erfcf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathErfCf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0;
      let data: number = math.erfcf(firstParam);
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslMathErfCf005
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_ERFCF_0500
     * @tc.desc   test erfcf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathErfCf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.9;
      let result = 1.992;
      let data: number = math.erfcf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.name   testMuslMathExpM1l006
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_EXPM1L_0600
     * @tc.desc   test expm1l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathExpM1l006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -1.9;
      let result = false;
      let data: number = math.expm1l(firstParam);
      if (data >= -1) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });
  })
}