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

import { describe, expect, it } from '@ohos/hypium'
import math from 'libmathndk.so'

export default function mathNdkTest() {
  describe('MuslMathTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLROUND_0100
     * @tc.name       : testMuslMathLLround001
     * @tc.desc       : test llround
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLround001', 0, async (done: Function) => {
      let result: number = math.llround(0);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLROUND_0200
     * @tc.name       : testMuslMathLLround002
     * @tc.desc       : test llround
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLround002', 0, async (done: Function) => {
      let result: number = math.llround(0.5);
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLROUND_0300
     * @tc.name       : testMuslMathLLround003
     * @tc.desc       : test llround
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLround003', 0, async (done: Function) => {
      let result: number = math.llround(0.4);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLROUND_0400
     * @tc.name       : testMuslMathLLround004
     * @tc.desc       : test llround
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLround004', 0, async (done: Function) => {
      let result: number = math.llround(-0.5);
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLROUND_0500
     * @tc.name       : testMuslMathLLround005
     * @tc.desc       : test llround
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLround005', 0, async (done: Function) => {
      let result: number = math.llround(-0.4);
      expect(result).assertEqual(0);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLROUNDF_0100
     * @tc.name       : testMuslMathLLroundF001
     * @tc.desc       : test llroundf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLroundF001', 0, async (done: Function) => {
      let result: number = math.llroundF(0);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLROUNDF_0200
     * @tc.name       : testMuslMathLLroundF002
     * @tc.desc       : test llroundf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLroundF002', 0, async (done: Function) => {
      let result: number = math.llroundF(0.5);
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLROUNDF_0300
     * @tc.name       : testMuslMathLLroundF003
     * @tc.desc       : test llroundf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLroundF003', 0, async (done: Function) => {
      let result: number = math.llroundF(0.4);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLROUNDF_0400
     * @tc.name       : testMuslMathLLroundF004
     * @tc.desc       : test llroundf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLroundF004', 0, async (done: Function) => {
      let result: number = math.llroundF(-0.5);
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLROUNDF_0500
     * @tc.name       : testMuslMathLLroundF005
     * @tc.desc       : test llroundf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLroundF005', 0, async (done: Function) => {
      let result: number = math.llroundF(-0.4);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLROUNDL_0100
     * @tc.name       : testMuslMathLLroundL001
     * @tc.desc       : test llroundl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLroundL001', 0, async (done: Function) => {
      let result: number = math.llroundL(0);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLROUNDL_0200
     * @tc.name       : testMuslMathLLroundL002
     * @tc.desc       : test llroundl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLroundL002', 0, async (done: Function) => {
      let result: number = math.llroundL(0.5);
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLROUNDL_0300
     * @tc.name       : testMuslMathLLroundL003
     * @tc.desc       : test llroundl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLroundL003', 0, async (done: Function) => {
      let result: number = math.llroundL(0.4);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLROUNDL_0400
     * @tc.name       : testMuslMathLLroundL004
     * @tc.desc       : test llroundl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLroundL004', 0, async (done: Function) => {
      let result: number = math.llroundL(-0.5);
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLROUNDL_0500
     * @tc.name       : testMuslMathLLroundL005
     * @tc.desc       : test llroundl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLroundL005', 0, async (done: Function) => {
      let result: number = math.llroundL(-0.4);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLRINT_0100
     * @tc.name       : testMuslMathLLrint001
     * @tc.desc       : test llrint
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLrint001', 0, async (done: Function) => {
      let result: number = math.llrint(0);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLRINT_0200
     * @tc.name       : testMuslMathLLrint002
     * @tc.desc       : test llrint
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLrint002', 0, async (done: Function) => {
      let result: number = math.llrint(0.5);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLRINT_0300
     * @tc.name       : testMuslMathLLrint003
     * @tc.desc       : test llrint
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLrint003', 0, async (done: Function) => {
      let result: number = math.llrint(0.4);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLRINT_0400
     * @tc.name       : testMuslMathLLrint004
     * @tc.desc       : test llrint
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLrint004', 0, async (done: Function) => {
      let result: number = math.llrint(-0.5);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLRINT_0500
     * @tc.name       : testMuslMathLLrint005
     * @tc.desc       : test llrint
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLrint005', 0, async (done: Function) => {
      let result: number = math.llrint(-0.4);
      expect(result).assertEqual(0);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLRINTF_0100
     * @tc.name       : testMuslMathLLrintF001
     * @tc.desc       : test llrintf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLrintF001', 0, async (done: Function) => {
      let result: number = math.llrintF(0);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLRINTF_0200
     * @tc.name       : testMuslMathLLrintF002
     * @tc.desc       : test llrintf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLrintF002', 0, async (done: Function) => {
      let result: number = math.llrintF(0.5);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLRINTF_0300
     * @tc.name       : testMuslMathLLrintF003
     * @tc.desc       : test llrintf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLrintF003', 0, async (done: Function) => {
      let result: number = math.llrintF(0.4);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLRINTF_0400
     * @tc.name       : testMuslMathLLrintF004
     * @tc.desc       : test llrintf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLrintF004', 0, async (done: Function) => {
      let result: number = math.llrintF(-0.5);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLRINTF_0500
     * @tc.name       : testMuslMathLLrintF005
     * @tc.desc       : test llrintf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLrintF005', 0, async (done: Function) => {
      let result: number = math.llrintF(-0.4);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLRINTL_0100
     * @tc.name       : testMuslMathLLrintL001
     * @tc.desc       : test llrintl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLrintL001', 0, async (done: Function) => {
      let result: number = math.llrintL(0);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLRINTL_0200
     * @tc.name       : testMuslMathLLrintL002
     * @tc.desc       : test llrintl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLrintL002', 0, async (done: Function) => {
      let result: number = math.llrintL(0.5);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLRINTL_0300
     * @tc.name       : testMuslMathLLrintL003
     * @tc.desc       : test llrintl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLrintL003', 0, async (done: Function) => {
      let result: number = math.llrintL(0.4);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLRINTL_0400
     * @tc.name       : testMuslMathLLrintL004
     * @tc.desc       : test llrintl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLrintL004', 0, async (done: Function) => {
      let result: number = math.llrintL(-0.5);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LLRINTL_0500
     * @tc.name       : testMuslMathLLrintL005
     * @tc.desc       : test llrintl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLLrintL005', 0, async (done: Function) => {
      let result: number = math.llrintL(-0.4);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMA_R_0100
     * @tc.name       : testMuslMathLgammaR001
     * @tc.desc       : test lgamma_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgammaR001', 0, async (done: Function) => {
      let result: number = math.lgammaR(0.5);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(0.572365));
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMA_R_0200
     * @tc.name       : testMuslMathLgammaR002
     * @tc.desc       : test lgamma_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgammaR002', 0, async (done: Function) => {
      let result: number = math.lgammaR(math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMA_R_0300
     * @tc.name       : testMuslMathLgammaR003
     * @tc.desc       : test lgamma_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgammaR003', 0, async (done: Function) => {
      let result: number = math.lgammaR(1);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(0.0));
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMA_R_0400
     * @tc.name       : testMuslMathLgammaR004
     * @tc.desc       : test lgamma_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgammaR004', 0, async (done: Function) => {
      let result: number = math.lgammaR(2);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(0.0));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMA_R_0500
     * @tc.name       : testMuslMathLgammaR005
     * @tc.desc       : test lgamma_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgammaR005', 0, async (done: Function) => {
      let result: number = math.lgammaR(-1);
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMAF_R_0100
     * @tc.name       : testMuslMathLgammafR001
     * @tc.desc       : test lgammaf_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgammafR001', 0, async (done: Function) => {
      let result: number = math.lgammafR(0.5);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(0.572365));
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMAF_R_0200
     * @tc.name       : testMuslMathLgammafR002
     * @tc.desc       : test lgammaf_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgammafR002', 0, async (done: Function) => {
      let result: number = math.lgammafR(math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMAF_R_0300
     * @tc.name       : testMuslMathLgammafR003
     * @tc.desc       : test lgammaf_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgammafR003', 0, async (done: Function) => {
      let result: number = math.lgammafR(1);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(0.0));
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMAF_R_0400
     * @tc.name       : testMuslMathLgammafR004
     * @tc.desc       : test lgammaf_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgammafR004', 0, async (done: Function) => {
      let result: number = math.lgammafR(2);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(0.0));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMAF_R_0500
     * @tc.name       : testMuslMathLgammafR005
     * @tc.desc       : test lgammaf_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgammafR005', 0, async (done: Function) => {
      let result: number = math.lgammafR(-1);
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMAL_R_0100
     * @tc.name       : testMuslMathLgammalR001
     * @tc.desc       : test lgammal_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgammalR001', 0, async (done: Function) => {
      let result: number = math.lgammalR(0.5);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(0.572365));
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMAL_R_0200
     * @tc.name       : testMuslMathLgammalR002
     * @tc.desc       : test lgammal_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgammalR002', 0, async (done: Function) => {
      let result: number = math.lgammalR(math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMAL_R_0300
     * @tc.name       : testMuslMathLgammalR003
     * @tc.desc       : test lgammal_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgammalR003', 0, async (done: Function) => {
      let result: number = math.lgammalR(1);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(0.0));
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMAL_R_0400
     * @tc.name       : testMuslMathLgammalR004
     * @tc.desc       : test lgammal_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgammalR004', 0, async (done: Function) => {
      let result: number = math.lgammalR(2);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(0.0));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMAL_R_0500
     * @tc.name       : testMuslMathLgammalR005
     * @tc.desc       : test lgammal_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgammalR005', 0, async (done: Function) => {
      let result: number = math.lgammalR(-1);
      expect(result).assertEqual(-1);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMA_0100
     * @tc.name       : testMuslMathLgamma001
     * @tc.desc       : test lgamma
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgamma001', 0, async (done: Function) => {
      let result: number = math.lgamma(0.5);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(0.572365));
      done()
    });
    /**
     * @tc.number     :  SUB_THIRDPARTY_MUSL_MATH_LGAMMA_0200
     * @tc.name       : testMuslMathLgamma002
     * @tc.desc       : test lgamma
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgamma002', 0, async (done: Function) => {
      let result: number = math.lgamma(math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMA_0300
     * @tc.name       : testMuslMathLgamma003
     * @tc.desc       : test lgamma
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgamma003', 0, async (done: Function) => {
      let result: number = math.lgamma(1);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(0.0));
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMA_0400
     * @tc.name       : testMuslMathLgamma004
     * @tc.desc       : test lgamma
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgamma004', 0, async (done: Function) => {
      let result: number = math.lgamma(2);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(0.0));
      done()
    });

    /**
     * @tc.number     :  SUB_THIRDPARTY_MUSL_MATH_LGAMMA_0500
     * @tc.name       : testMuslMathLgamma005
     * @tc.desc       : test lgamma
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgamma005', 0, async (done: Function) => {
      let result: number = math.lgamma(-1);
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMAF_0100
     * @tc.name       : testMuslMathLgammaf001
     * @tc.desc       : test lgammaf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgammaf001', 0, async (done: Function) => {
      let result: number = math.lgammaf(0.5);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(0.572365));
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMAF_0200
     * @tc.name       : testMuslMathLgammaf002
     * @tc.desc       : test lgammaf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgammaf002', 0, async (done: Function) => {
      let result: number = math.lgammaf(math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMAF_0300
     * @tc.name       : testMuslMathLgammaf003
     * @tc.desc       : test lgammaf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgammaf003', 0, async (done: Function) => {
      let result: number = math.lgammaf(1);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(0.0));
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMAF_0400
     * @tc.name       : testMuslMathLgammaf004
     * @tc.desc       : test lgammaf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgammaf004', 0, async (done: Function) => {
      let result: number = math.lgammaf(2);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(0.0));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMAF_0500
     * @tc.name       : testMuslMathLgammaf005
     * @tc.desc       : test lgammaf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgammaf005', 0, async (done: Function) => {
      let result: number = math.lgammaf(-1);
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMAL_0100
     * @tc.name       : testMuslMathLgammal001
     * @tc.desc       : test lgammal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgammal001', 0, async (done: Function) => {
      let result: number = math.lgammal(0.5);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(0.572365));
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMAL_0200
     * @tc.name       : testMuslMathLgammal002
     * @tc.desc       : test lgammal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgammal002', 0, async (done: Function) => {
      let result: number = math.lgammal(math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMAL_0300
     * @tc.name       : testMuslMathLgammal003
     * @tc.desc       : test lgammal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgammal003', 0, async (done: Function) => {
      let result: number = math.lgammal(1);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(0.0));
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMAL_0400
     * @tc.name       : testMuslMathLgammal004
     * @tc.desc       : test lgammal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgammal004', 0, async (done: Function) => {
      let result: number = math.lgammal(2);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(0.0));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LGAMMAL_0500
     * @tc.name       : testMuslMathLgammal005
     * @tc.desc       : test lgammal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLgammal005', 0, async (done: Function) => {
      let result: number = math.lgammal(-1);
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LDEXP_0100
     * @tc.name       : testMuslMathLdexp001
     * @tc.desc       : test ldexp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathLdexp001', 0, async (done: Function) => {
      let result: number = math.ldexp(2.3, 3);
      expect(result).assertEqual(18.4);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LDEXP_0200
     * @tc.name       : testMuslMathLdexp002
     * @tc.desc       : test Ldexp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathLdexp002', 0, async (done: Function) => {
      let result: number = math.ldexp(Math.sqrt(-1), 2);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LDEXP_0300
     * @tc.name       : testMuslMathLdexp003
     * @tc.desc       : test Ldexp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathLdexp003', 0, async (done: Function) => {
      let result: number = math.ldexp(2.3, 0);
      expect(result).assertEqual(2.3);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LDEXPF_0100
     * @tc.name       : testMuslMathLdexpf001
     * @tc.desc       : test Ldexpf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathLdexpf001', 0, async (done: Function) => {
      let result: number = math.ldexpf(2.3, 3);
      expect(result.toFixed(1)).assertEqual(JSON.stringify(18.4));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LDEXPF_0200
     * @tc.name       : testMuslMathLdexpf002
     * @tc.desc       : test Ldexpf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathLdexpf002', 0, async (done: Function) => {
      let result: number = math.ldexpf(Math.sqrt(-1), 2);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LDEXPF_0300
     * @tc.name       : testMuslMathLdexpf003
     * @tc.desc       : test Ldexpf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathLdexpf003', 0, async (done: Function) => {
      let result: number = math.ldexpf(2.3, 0);
      expect(result.toFixed(1)).assertEqual(JSON.stringify(2.3));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LDEXPL_0100
     * @tc.name       : testMuslMathLdexpl001
     * @tc.desc       : test Ldexpl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathLdexpl001', 0, async (done: Function) => {
      let result: number = math.ldexpl(2.3, 3);
      expect(result).assertEqual(18.4);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LDEXPL_0200
     * @tc.name       : testMuslMathLdexpl002
     * @tc.desc       : test Ldexpl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathLdexpl002', 0, async (done: Function) => {
      let result: number = math.ldexpl(Math.sqrt(-1), 2);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LDEXPL_0300
     * @tc.name       : testMuslMathLdexpl003
     * @tc.desc       : test Ldexpl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathLdexpl003', 0, async (done: Function) => {
      let result: number = math.ldexpl(2.3, 0);
      expect(result).assertEqual(2.3);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_J0_0100
     * @tc.name       : testMuslMathJ0001
     * @tc.desc       : test J0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathJ0001', 0, async (done: Function) => {
      let result: number = math.j0(1);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(0.765198));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_J0_0200
     * @tc.name       : testMuslMathJ0002
     * @tc.desc       : test J0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathJ0002', 0, async (done: Function) => {
      let result: number = math.j0(Math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_J0_0300
     * @tc.name       : testMuslMathJ0003
     * @tc.desc       : test J0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathJ0003', 0, async (done: Function) => {
      let result: number = math.j0(1.7976931348623157e+309);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_J0F_0100
     * @tc.name       : testMuslMathJ0f001
     * @tc.desc       : test J0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathJ0f001', 0, async (done: Function) => {
      let result: number = math.j0f(1);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(0.765198));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_J0F_0200
     * @tc.name       : testMuslMathJ0f002
     * @tc.desc       : test J0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathJ0f002', 0, async (done: Function) => {
      let result: number = math.j0f(Math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_J0F_0300
     * @tc.name       : testMuslMathJ0f003
     * @tc.desc       : test J0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathJ0f003', 0, async (done: Function) => {
      let result: number = math.j0f(1.7976931348623157e+309);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_J1_0100
     * @tc.name       : testMuslMathJ1001
     * @tc.desc       : test J1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathJ1001', 0, async (done: Function) => {
      let result: number = math.j1(1);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(0.440051));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_J1_0200
     * @tc.name       : testMuslMathJ1002
     * @tc.desc       : test J1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathJ1002', 0, async (done: Function) => {
      let result: number = math.j1(Math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_J1_0300
     * @tc.name       : testMuslMathJ1003
     * @tc.desc       : test J1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathJ1003', 0, async (done: Function) => {
      let result: number = math.j1(1.7976931348623157e+309);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_J1F_0100
     * @tc.name       : testMuslMathJ1f001
     * @tc.desc       : test J1f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathJ1f001', 0, async (done: Function) => {
      let result: number = math.j1f(1);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(0.440051));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_J1F_0200
     * @tc.name       : testMuslMathJ1f002
     * @tc.desc       : test J1f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathJ1f002', 0, async (done: Function) => {
      let result: number = math.j1f(Math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_J1F_0300
     * @tc.name       : testMuslMathJ1f003
     * @tc.desc       : test J1f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathJ1f003', 0, async (done: Function) => {
      let result: number = math.j1f(1.7976931348623157e+309);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_JN_0100
     * @tc.name       : testMuslMathJn001
     * @tc.desc       : test Jn
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathJn001', 0, async (done: Function) => {
      let result: number = math.jn(2, 1);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(0.114903));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_JN_0200
     * @tc.name       : testMuslMathJn002
     * @tc.desc       : test Jn
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathJn002', 0, async (done: Function) => {
      let result: number = math.jn(2, Math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_JN_0300
     * @tc.name       : testMuslMathJn003
     * @tc.desc       : test Jn
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathJn003', 0, async (done: Function) => {
      let result: number = math.jn(2, 1.7976931348623157e+309);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_JNF_0100
     * @tc.name       : testMuslMathJnf001
     * @tc.desc       : test Jnf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathJnf001', 0, async (done: Function) => {
      let result: number = math.jnf(2, 1);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(0.114903));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_JNF_0200
     * @tc.name       : testMuslMathJnf002
     * @tc.desc       : test Jnf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathJnf002', 0, async (done: Function) => {
      let result: number = math.jnf(2, Math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_JNF_0300
     * @tc.name       : testMuslMathJnf003
     * @tc.desc       : test Jnf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathJnf003', 0, async (done: Function) => {
      let result: number = math.jnf(2, 1.7976931348623157e+309);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_REMAINDER_0100
     * @tc.name       : testMuslMathRemainder001
     * @tc.desc       : test remainder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRemainder001', 0, async (done: Function) => {
      let param = 6.0;
      let param2 = 3.0;
      let result: number = math.remainder(param, param2);
      console.info("Test remainder result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_REMAINDER_0200
     * @tc.name       : testMuslMathRemainder002
     * @tc.desc       : test rmainder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRemainder002', 0, async (done: Function) => {
      let param = 5.0;
      let param2 = 0;
      let result: number = math.remainder(param, param2);
      console.info("Test remainder result = " + JSON.stringify(result));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_REMAINDER_0300
     * @tc.name       : testMuslMathRemainder003
     * @tc.desc       : text remainder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRemainder003', 0, async (done: Function) => {
      let param = 18;
      let param2 = 4;
      let result: number = math.remainder(param, param2);
      console.info("Test remainder result = " + JSON.stringify(result));
      expect(result).assertEqual(2);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_REMAINDERF_0100
     * @tc.name       : testMuslMathRemainderf001
     * @tc.desc       : test remainderf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRemainderf001', 0, async (done: Function) => {
      let param = 6;
      let param2 = 2;
      let result: number = math.remainderf(param, param2);
      console.info("Test remainderf result = " + JSON.stringify(result));
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_REMAINDERF_0200
     * @tc.name       : testMuslMathRemainderf002
     * @tc.desc       : test remainderf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRemainderf002', 0, async (done: Function) => {
      let param = 5;
      let param2 = 0;
      let result: number = math.remainderf(param, param2);
      console.info("Test remainderf result = " + JSON.stringify(result));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_REMAINDERF_0300
     * @tc.name       : testMuslMathRemainderf003
     * @tc.desc       : test remainderf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRemainderf003', 0, async (done: Function) => {
      let param = 18;
      let param2 = 4;
      let result: number = math.remainderf(param, param2);
      console.info("Test remainderf result = " + JSON.stringify(result));
      expect(result).assertEqual(2);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_REMAINDERL_0100
     * @tc.name       : testMuslMathRemainderl001
     * @tc.desc       : test remainderl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRemainderl001', 0, async (done: Function) => {
      let param = 12.0;
      let param2 = 2;
      let result: number = math.remainderl(param, param2);
      console.info("Test remainderl result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_REMAINDERL_0200
     * @tc.name       : testMuslMathRemainderl002
     * @tc.desc       : test remainderl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRemainderl002', 0, async (done: Function) => {
      let param = 0;
      let param2 = 0;
      let result: number = math.remainderl(param, param2);
      console.info("Test remainderl result = " + JSON.stringify(result));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_REMAINDERL_0300
     * @tc.name       : testMuslMathRemainderl003
     * @tc.desc       : test remainderl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRemainderl003', 0, async (done: Function) => {
      let param = 18;
      let param2 = 4;
      let result: number = math.remainderl(param, param2);
      console.info("Test remainderl result = " + JSON.stringify(result));
      expect(result).assertEqual(2);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_REMQUO_0100
     * @tc.name       : testMuslMathRemquo001
     * @tc.desc       : test remquo
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRemquo001', 0, async (done: Function) => {
      let param = 12.5;
      let param2 = 2;
      let param3 = 1;
      let result: number = math.remquo(param, param2, param3);
      console.info("Test remquo result = " + JSON.stringify(result));
      expect(result).assertEqual(0.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_REMQUO_0200
     * @tc.name       : testMuslMathRemquo002
     * @tc.desc       : test remquo
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRemquo002', 0, async (done: Function) => {
      let param = 12;
      let param2 = 0;
      let param3 = 1;
      let result: number = math.remquo(param, param2, param3);
      console.info("Test remquo result = " + JSON.stringify(result));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_REMQUO_0300
     * @tc.name       : testMuslMathRemquo003
     * @tc.desc       : test remquo
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRemquo003', 0, async (done: Function) => {
      let param = -12.5;
      let param2 = 2;
      let param3 = 1;
      let result: number = math.remquo(param, param2, param3);
      console.info("Test remquo result = " + JSON.stringify(result));
      expect(result).assertEqual(-0.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_REMQUOF_0100
     * @tc.name       : testMuslMathRemquof001
     * @tc.desc       : test remquof
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRemquof001', 0, async (done: Function) => {
      let param = 14.5;
      let param2 = 2;
      let param3 = 1;
      let result: number = math.remquof(param, param2, param3);
      console.info("Test remquof result = " + JSON.stringify(result));
      expect(result).assertEqual(0.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_REMQUOF_0200
     * @tc.name       : testMuslMathRemquof002
     * @tc.desc       : test remquof
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRemquof002', 0, async (done: Function) => {
      let param = 16.0;
      let param2 = 0;
      let param3 = 1;
      let result: number = math.remquof(param, param2, param3);
      console.info("Test remquof result = " + JSON.stringify(result));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_REMQUOF_0300
     * @tc.name       : testMuslMathRemquof003
     * @tc.desc       : test remquof
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRemquof003', 0, async (done: Function) => {
      let param = -16.5;
      let param2 = 2;
      let param3 = 1;
      let result: number = math.remquof(param, param2, param3);
      console.info("Test remquof result = " + JSON.stringify(result));
      expect(result).assertEqual(-0.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_REMQUOL_0100
     * @tc.name       : testMuslMathRemquol001
     * @tc.desc       : test remquol
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRemquol001', 0, async (done: Function) => {
      let param = 16.5;
      let param2 = 2;
      let param3 = 1;
      let result: number = math.remquol(param, param2, param3);
      console.info("Test remquol result = " + JSON.stringify(result));
      expect(result).assertEqual(0.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_REMQUOL_0200
     * @tc.name       : testMuslMathRemquol002
     * @tc.desc       : test remquol
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRemquol002', 0, async (done: Function) => {
      let param = 12.5;
      let param2 = 0;
      let param3 = 1;
      let result: number = math.remquol(param, param2, param3);
      console.info("Test remquol result = " + JSON.stringify(result));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_REMQUOL_0300
     * @tc.name       : testMuslMathRemquol003
     * @tc.desc       : test remquol
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRemquol003', 0, async (done: Function) => {
      let param = -12.5;
      let param2 = 2;
      let param3 = 1;
      let result: number = math.remquol(param, param2, param3);
      console.info("Test remquol result = " + JSON.stringify(result));
      expect(result).assertEqual(-0.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_RINT_0100
     * @tc.name       : testMuslMathRint001
     * @tc.desc       : test rint
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRint001', 0, async (done: Function) => {
      let param = 11.87;
      let result: number = math.rint(param);
      console.info("Test rint result = " + JSON.stringify(result));
      expect(result).assertEqual(12);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_RINT_0200
     * @tc.name       : testMuslMathRint002
     * @tc.desc       : test rint
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRint002', 0, async (done: Function) => {
      let param = -11.87;
      let result: number = math.rint(param);
      console.info("Test rint result = " + JSON.stringify(result));
      expect(result).assertEqual(-12);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_RINT_0300
     * @tc.name       : testMuslMathRint003
     * @tc.desc       : test rint
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRint003', 0, async (done: Function) => {
      let param = 11.2;
      let result: number = math.rint(param);
      console.info("Test rint result = " + JSON.stringify(result));
      expect(result).assertEqual(11);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_RINTF_0100
     * @tc.name       : testMuslMathRintf001
     * @tc.desc       : test rintf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRintf001', 0, async (done: Function) => {
      let param = 11.87;
      let result: number = math.rintf(param);
      console.info("Test rintf result = " + JSON.stringify(result));
      expect(result).assertEqual(12);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_RINTF_0200
     * @tc.name       : testMuslMathRintf002
     * @tc.desc       : test rintf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRintf002', 0, async (done: Function) => {
      let param = -11.87;
      let result: number = math.rintf(param);
      console.info("Test rintF result = " + JSON.stringify(result));
      expect(result).assertEqual(-12);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_RINTF_0300
     * @tc.name       : testMuslMathRintf003
     * @tc.desc       : test rintf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRintf003', 0, async (done: Function) => {
      let param = 11.2;
      let result: number = math.rintf(param);
      console.info("Test rintf result = " + JSON.stringify(result));
      expect(result).assertEqual(11);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_RINTL_0100
     * @tc.name       : testMuslMathRintl001
     * @tc.desc       : test rintf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRintl001', 0, async (done: Function) => {
      let param = 11.87;
      let result: number = math.rintl(param);
      console.info("Test rintl result = " + JSON.stringify(result));
      expect(result).assertEqual(12);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_RINTL_0200
     * @tc.name       : testMuslMathRintl002
     * @tc.desc       : test rintl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRintl002', 0, async (done: Function) => {
      let param = -11.87;
      let result: number = math.rintl(param);
      console.info("Test rintl result = " + JSON.stringify(result));
      expect(result).assertEqual(-12);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_RINTL_0300
     * @tc.name       : testMuslMathRintl003
     * @tc.desc       : test rintl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRintl003', 0, async (done: Function) => {
      let param = 11.2;
      let result: number = math.rintl(param);
      console.info("Test rintl result = " + JSON.stringify(result));
      expect(result).assertEqual(11);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ROUND_0100
     * @tc.name       : testMuslMathRound001
     * @tc.desc       : test round
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRound001', 0, async (done: Function) => {
      let param = 11.87;
      let result: number = math.round(param);
      console.info("Test round result = " + JSON.stringify(result));
      expect(result).assertEqual(12);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ROUND_0200
     * @tc.name       : testMuslMathRound002
     * @tc.desc       : test round
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRound002', 0, async (done: Function) => {
      let param = -11.87;
      let result: number = math.round(param);
      console.info("Test round result = " + JSON.stringify(result));
      expect(result).assertEqual(-12);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ROUND_0300
     * @tc.name       : testMuslMathRound003
     * @tc.desc       : test round
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRound003', 0, async (done: Function) => {
      let param = 11.2;
      let result: number = math.round(param);
      console.info("Test round result = " + JSON.stringify(result));
      expect(result).assertEqual(11);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ROUNDF_0100
     * @tc.name       : testMuslMathRoundf001
     * @tc.desc       : test roundf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRoundf001', 0, async (done: Function) => {
      let param = 11.87;
      let result: number = math.roundf(param);
      console.info("Test roundf result = " + JSON.stringify(result));
      expect(result).assertEqual(12);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ROUNDF_0200
     * @tc.name       : testMuslMathRoundf002
     * @tc.desc       : test roundf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRoundf002', 0, async (done: Function) => {
      let param = -11.87;
      let result: number = math.roundf(param);
      console.info("Test roundf result = " + JSON.stringify(result));
      expect(result).assertEqual(-12);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ROUNDF_0300
     * @tc.name       : testMuslMathRoundf003
     * @tc.desc       : test roundf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRoundf003', 0, async (done: Function) => {
      let param = 11.2;
      let result: number = math.roundf(param);
      console.info("Test roundf result = " + JSON.stringify(result));
      expect(result).assertEqual(11);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ROUNDL_0100
     * @tc.name       : testMuslMathRoundl001
     * @tc.desc       : test roundl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRoundl001', 0, async (done: Function) => {
      let param = 11.87;
      let result: number = math.roundl(param);
      console.info("Test roundl result = " + JSON.stringify(result));
      expect(result).assertEqual(12);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ROUNDL_0200
     * @tc.name       : testMuslMathRoundl002
     * @tc.desc       : test roundl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRoundl002', 0, async (done: Function) => {
      let param = -11.87;
      let result: number = math.roundl(param);
      console.info("Test roundl result = " + JSON.stringify(result));
      expect(result).assertEqual(-12);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ROUNDL_0300
     * @tc.name       : testMuslMathRoundl003
     * @tc.desc       : test roundl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathRoundl003', 0, async (done: Function) => {
      let param = 11.2;
      let result: number = math.roundl(param);
      console.info("Test roundL result = " + JSON.stringify(result));
      expect(result).assertEqual(11);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALBLN_0100
     * @tc.name       : testMuslMathScalbln001
     * @tc.desc       : test scalbln
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalbln001', 0, async (done: Function) => {
      let param = 12;
      let param2 = 1;
      let result: number = math.scalbln(param, param2);
      console.info("Test scalbln result = " + JSON.stringify(result));
      expect(result).assertEqual(24);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALBLN_0200
     * @tc.name       : testMuslMathScalbln002
     * @tc.desc       : test scalbln
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalbln002', 0, async (done: Function) => {
      let param = 200 / 0;
      let param2 = 0;
      let result: number = math.scalbln(param, param2);
      console.info("Test scalbln result = " + JSON.stringify(result));
      expect(result).assertEqual(200 / 0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALBLN_0300
     * @tc.name       : testMuslMathScalbln003
     * @tc.desc       : test scalbln
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalbln003', 0, async (done: Function) => {
      let param = 200 / -0;
      let param2 = 0;
      let result: number = math.scalbln(param, param2);
      console.info("Test scalbln result = " + JSON.stringify(result));
      expect(result).assertEqual(200 / -0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TAN_0100
     * @tc.name       : testMuslMathTan001
     * @tc.desc       : test tan
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTan001', 0, async (done: Function) => {
      let a: number = Math.sqrt(-1);
      let result: number = math.tan(a);
      console.info("Test tan result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TAN_0200
     * @tc.name       : testMuslMathTan002
     * @tc.desc       : test tan
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTan002', 0, async (done: Function) => {
      let a: number = 0;
      let result: number = math.tan(a);
      console.info("Test tan result= " + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TAN_0300
     * @tc.name       : testMuslMathTan003
     * @tc.desc       : test tan
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTan003', 0, async (done: Function) => {
      let a: number = 200 / -0;
      let result: number = math.tan(a);
      console.info("Test tan result= " + result)
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TAN_0400
     * @tc.name       : testMuslMathTan004
     * @tc.desc       : test tan
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTan004', 0, async (done: Function) => {
      let a: number = 200 / 0;
      let result: number = math.tan(a);
      console.info("Test tan result= " + result)
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TANF_0100
     * @tc.name       : testMuslMathTanf001
     * @tc.desc       : test tanf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTanf001', 0, async (done: Function) => {
      let a: number = Math.sqrt(-1);
      let result: number = math.tanf(a);
      console.info("Test tanf result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TANF_0200
     * @tc.name       : testMuslMathTanf002
     * @tc.desc       : test tanf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTanf002', 0, async (done: Function) => {
      let a: number = 0;
      let result: number = math.tanf(a);
      console.info("Test tanf result= " + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TANF_0300
     * @tc.name       : testMuslMathTanf003
     * @tc.desc       : test tanf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTanf003', 0, async (done: Function) => {
      let a: number = 200 / -0;
      let result: number = math.tanf(a);
      console.info("Test tanf result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TANF_0400
     * @tc.name       : testMuslMathTanf004
     * @tc.desc       : test tanf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTanf004', 0, async (done: Function) => {
      let a: number = 200 / 0;
      let result: number = math.tanf(a);
      console.info("Test tanf result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TANH_0100
     * @tc.name       : testMuslMathTanh001
     * @tc.desc       : test tanh
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTanh001', 0, async (done: Function) => {
      let a: number = 0;
      let result: number = math.tanh(a);
      console.info("Test tanh result= " + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TANH_0200
     * @tc.name       : testMuslMathTanh002
     * @tc.desc       : test tanh
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTanh002', 0, async (done: Function) => {
      let a: number = Math.sqrt(-1);
      ;
      let result: number = math.tanh(a);
      console.info("Test tanh result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TANH_0300
     * @tc.name       : testMuslMathTanh003
     * @tc.desc       : test tanh
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTanh003', 0, async (done: Function) => {
      let a: number = 200 / 0;
      let result: number = math.tanh(a);
      console.info("Test tanh result= " + result);
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TANH_0400
     * @tc.name       : testMuslMathTanh004
     * @tc.desc       : test tanh
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTanh004', 0, async (done: Function) => {
      let a: number = 200 / -0;
      let result: number = math.tanh(a);
      console.info("Test tanh result= " + result);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TANHF_0100
     * @tc.name       : testMuslMathTanhf001
     * @tc.desc       : test tanhf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTanhf001', 0, async (done: Function) => {
      let a: number = 0;
      let result: number = math.tanhf(a);
      console.info("Test tanhf result= " + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TANHF_0200
     * @tc.name       : testMuslMathTanhf002
     * @tc.desc       : test tanhf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTanhf002', 0, async (done: Function) => {
      let a: number = Math.sqrt(-1);
      let result: number = math.tanhf(a);
      console.info("Test tanhf result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TANHF_0300
     * @tc.name       : testMuslMathTanhf003
     * @tc.desc       : test tanhf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTanhf003', 0, async (done: Function) => {
      let a: number = 200 / 0;
      let result: number = math.tanhf(a);
      console.info("Test tanhf result= " + result);
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TANHF_0400
     * @tc.name       : testMuslMathTanhf004
     * @tc.desc       : test tanhf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTanhf004', 0, async (done: Function) => {
      let a: number = 200 / -0;
      let result: number = math.tanhf(a);
      console.info("Test tanhf result= " + result);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TANHL_0100
     * @tc.name       : testMuslMathTanhl001
     * @tc.desc       : test tanhl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTanhl001', 0, async (done: Function) => {
      let a: number = 0;
      let result: number = math.tanhl(a);
      console.info("Test tanhl result= " + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TANHL_0200
     * @tc.name       : testMuslMathTanhl002
     * @tc.desc       : test tanhl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTanhl002', 0, async (done: Function) => {
      let a: number = Math.sqrt(-1);
      let result: number = math.tanhl(a);
      console.info("Test tanhl result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TANHL_0300
     * @tc.name       : testMuslMathTanhl003
     * @tc.desc       : test tanhl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTanhl003', 0, async (done: Function) => {
      let a: number = 200 / 0;
      let result: number = math.tanhl(a);
      console.info("Test tanhl result= " + result);
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TANHL_0400
     * @tc.name       : testMuslMathTanhl004
     * @tc.desc       : test tanhl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTanhl004', 0, async (done: Function) => {
      let a: number = 200 / -0;
      let result: number = math.tanhl(a);
      console.info("Test tanhl result= " + result);
      expect(result).assertEqual(-1)
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TANL_0100
     * @tc.name       : testMuslMathTanl001
     * @tc.desc       : test tanl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTanl001', 0, async (done: Function) => {
      let a: number = 0;
      let result: number = math.tanl(a);
      console.info("Test tanl result= " + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TANL_0200
     * @tc.name       : testMuslMathTanl002
     * @tc.desc       : test tanl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTanl002', 0, async (done: Function) => {
      let a: number = Math.sqrt(-1);
      let result: number = math.tanl(a);
      console.info("Test tanl result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TANL_0300
     * @tc.name       : testMuslMathTanl003
     * @tc.desc       : test tanl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTanl003', 0, async (done: Function) => {
      let a: number = 200 / 0;
      let result: number = math.tanl(a);
      console.info("Test tanl result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TANL_0400
     * @tc.name       : testMuslMathTanl004
     * @tc.desc       : test tanl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTanl004', 0, async (done: Function) => {
      let a: number = 200 / -0;
      let result: number = math.tanl(a);
      console.info("Test tanl result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TGAMMA_0100
     * @tc.name       : testMuslMathTgamma001
     * @tc.desc       : test tgamma
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTgamma001', 0, async (done: Function) => {
      let a: number = -1;
      let result: number = math.tgamma(a);
      console.info("Test tgamma result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TGAMMA_0200
     * @tc.name       : testMuslMathTgamma002
     * @tc.desc       : test tgamma
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTgamma002', 0, async (done: Function) => {
      let a: number = 200 / 0;
      let result: number = math.tgamma(a);
      console.info("Test tgamma result= " + result);
      expect(result).assertEqual(200 / 0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TGAMMA_0300
     * @tc.name       : testMuslMathTgamma003
     * @tc.desc       : test tgamma
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTgamma003', 0, async (done: Function) => {
      let a: number = 200 / -0;
      let result: number = math.tgamma(a);
      console.info("Test tgamma result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TGAMMAF_0100
     * @tc.name       : testMuslMathTgammaf001
     * @tc.desc       : test tgammaf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTgammaf001', 0, async (done: Function) => {
      let a: number = -1;
      let result: number = math.tgammaf(a);
      console.info("Test tgammaf result= " + result)
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TGAMMAF_0200
     * @tc.name       : testMuslMathTgammaf002
     * @tc.desc       : test tgammaf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTgammaf002', 0, async (done: Function) => {
      let a: number = 200 / 0;
      let result: number = math.tgammaf(a);
      console.info("Test tgammaf data= " + result);
      expect(result).assertEqual(200 / 0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TGAMMAF_0300
     * @tc.name       : testMuslMathTgammaf003
     * @tc.desc       : test tgammaf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTgammaf003', 0, async (done: Function) => {
      let a: number = 200 / -0;
      let result: number = math.tgammaf(a);
      console.info("Test tgammaf result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TGAMMAL_0100
     * @tc.name       : testMuslMathTgammal001
     * @tc.desc       : test tgammal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTgammal001', 0, async (done: Function) => {
      let a: number = -1;
      let result: number = math.tgammal(a);
      console.info("Test tgammal result= " + result)
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TGAMMAL_0200
     * @tc.name       : testMuslMathTgammal002
     * @tc.desc       : test tgammal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTgammal002', 0, async (done: Function) => {
      let a: number = 200 / 0;
      let result: number = math.tgammal(a);
      console.info("Test tgammal result= " + result);
      expect(result).assertEqual(200 / 0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TGAMMAL_0300
     * @tc.name       : testMuslMathTgammal003
     * @tc.desc       : test tgammal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTgammal003', 0, async (done: Function) => {
      let a: number = 200 / -0;
      let result: number = math.tgammal(a);
      console.info("Test tgammal result= " + result);
      expect(result).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALBN_0100
     * @tc.name       : testMuslMathScalbn001
     * @tc.desc       : test scalbn
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalbn001', 0, async (done: Function) => {
      let b = 7
      let c = -4
      let a: number = math.scalbn(b, c);
      expect(a).assertEqual(0.4375);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALBN_0200
     * @tc.name       : testMuslMathScalbn002
     * @tc.desc       : test scalbn
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalbn002', 0, async (done: Function) => {
      let b = -1 / 0
      let c = -1
      let a: number = math.scalbn(b, c);
      expect(a).assertEqual(-1 / 0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALBN_0300
     * @tc.name       : testMuslMathScalbn003
     * @tc.desc       : test scalbn
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalbn003', 0, async (done: Function) => {
      let b = 1
      let c = -1074
      let a: number = math.scalbn(b, c);

      expect(a).assertEqual(4.94066e-324);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALBN_0400
     * @tc.name       : testMuslMathScalbn004
     * @tc.desc       : test scalbn
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalbn004', 0, async (done: Function) => {
      let b = 1
      let c = 1024
      let a: number = math.scalbn(b, c);
      expect(a).assertEqual(1 / 0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALBLNL_0100
     * @tc.name       : testMuslMathScalblnl001
     * @tc.desc       : test scalblnl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalblnl001', 0, async (done: Function) => {
      let b = 7
      let c = -4
      let a: number = math.scalblnl(b, c);
      expect(a).assertEqual(0.4375);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALBLNL_0200
     * @tc.name       : testMuslMathScalblnl002
     * @tc.desc       : test scalblnl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalblnl002', 0, async (done: Function) => {
      let b = -1 / 0
      let c = -1
      let a: number = math.scalblnl(b, c);
      expect(a).assertEqual(-1 / 0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALBLNL_0300
     * @tc.name       : testMuslMathScalblnl003
     * @tc.desc       : test scalblnl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalblnl003', 0, async (done: Function) => {
      let b = 1
      let c = -1074
      let a: number = math.scalblnl(b, c);
      expect(a).assertEqual(4.94066e-324);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALBLNL_0400
     * @tc.name       : testMuslMathScalblnl004
     * @tc.desc       : test scalblnl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalblnl004', 0, async (done: Function) => {
      let b = 1
      let c = 1024
      let a: number = math.scalblnl(b, c);
      expect(a).assertEqual(1 / 0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALBLNF_0100
     * @tc.name       : testMuslMathScalblnf001
     * @tc.desc       : test scalblnf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalblnf001', 0, async (done: Function) => {
      let b = 7
      let c = -4
      let a: number = math.scalblnf(b, c);
      expect(a).assertEqual(0.4375);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALBLNF_0200
     * @tc.name       : testMuslMathScalblnf002
     * @tc.desc       : test scalblnf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalblnf002', 0, async (done: Function) => {
      let b = -1 / 0
      let c = -1
      let a: number = math.scalblnf(b, c);
      expect(a).assertEqual(-1 / 0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALBLNF_0300
     * @tc.name       : testMuslMathScalblnf003
     * @tc.desc       : test  scalblnf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalblnf003', 0, async (done: Function) => {
      let b = 1
      let c = -1074
      let a: number = math.scalblnf(b, c);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALBLNF_0400
     * @tc.name       : testMuslMathScalblnf004
     * @tc.desc       : test scalblnf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalblnf004', 0, async (done: Function) => {
      let b = 1
      let c = 1024
      let a: number = math.scalblnf(b, c);
      expect(a).assertEqual(1 / 0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALBNF_0100
     * @tc.name       : testMuslMathScalbnf001
     * @tc.desc       : test scalbnf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalbnf001', 0, async (done: Function) => {
      let b = 7
      let c = -4
      let a: number = math.scalbnf(b, c);
      expect(a).assertEqual(0.4375);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALBNF_0200
     * @tc.name       : testMuslMathScalbnf002
     * @tc.desc       : test scalbnf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalbnf002', 0, async (done: Function) => {
      let b = -1 / 0
      let c = -1
      let a: number = math.scalbnf(b, c);
      expect(a).assertEqual(-1 / 0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALBNF_0300
     * @tc.name       : testMuslMathScalbnf003
     * @tc.desc       : test scalbnf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalbnf003', 0, async (done: Function) => {
      let b = 1
      let c = -1074
      let a: number = math.scalbnf(b, c);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALBNF_0400
     * @tc.name       : testMuslMathScalbnf004
     * @tc.desc       : test scalbnf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalbnf004', 0, async (done: Function) => {
      let b = 1
      let c = 1024
      let a: number = math.scalbnf(b, c);
      expect(a).assertEqual(1 / 0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALBNL_0100
     * @tc.name       : testMuslMathScalbnl001
     * @tc.desc       : test scalbnl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalbnl001', 0, async (done: Function) => {
      let b = 7
      let c = -4
      let a: number = math.scalbnl(b, c);
      expect(a).assertEqual(0.4375);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALBNL_0200
     * @tc.name       : testMuslMathScalbnl002
     * @tc.desc       : test scalbnl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalbnl002', 0, async (done: Function) => {
      let b = -1 / 0
      let c = -1
      let a: number = math.scalbnl(b, c);
      expect(a).assertEqual(-1 / 0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALBNL_0300
     * @tc.name       : testMuslMathScalbnl003
     * @tc.desc       : test scalbnl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalbnl003', 0, async (done: Function) => {
      let b = 1
      let c = -1074
      let a: number = math.scalbnl(b, c);
      expect(a).assertEqual(4.94066e-324);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALBNL_0400
     * @tc.name       : testMuslMathScalbnl004
     * @tc.desc       : test scalbnl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalbnl004', 0, async (done: Function) => {
      let b = 1
      let c = 1024
      let a: number = math.scalbnl(b, c);
      expect(a).assertEqual(1 / 0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ASIN_0100
     * @tc.name       : testMuslMathASin001
     * @tc.desc       : test ASin
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathASin001', 0, async (done: Function) => {
      let resultTrue: number = 1;
      let Param = 1 / 2;
      let result: number = math.aSin(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ASIN_0200
     * @tc.name       : testMuslMathASin002
     * @tc.desc       : test ASin
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathASin002', 0, async (done: Function) => {
      let resultTrue: number = 1;
      let Param = 0;
      let result: number = math.aSin(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ASIN_0300
     * @tc.name       : testMuslMathASin003
     * @tc.desc       : test ASin
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathASin003', 0, async (done: Function) => {
      let resultTrue: number = 1;
      let Param = -1 / 2;
      let result: number = math.aSin(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ASIN_0400
     * @tc.name       : testMuslMathASin004
     * @tc.desc       : test ASin
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathASin004', 0, async (done: Function) => {
      let Param = 3;
      let result: number = math.aSin(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ASINF_0100
     * @tc.name       : testMuslMathASinF001
     * @tc.desc       : test ASinF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathASinF001', 0, async (done: Function) => {
      let resultTrue: number = 1;
      let Param = 1 / 2;
      let result: number = math.aSinF(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ASINF_0200
     * @tc.name       : testMuslMathASinF002
     * @tc.desc       : test ASinF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathASinF002', 0, async (done: Function) => {
      let resultTrue: number = 1;
      let Param = 0;
      let result: number = math.aSinF(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ASINF_0300
     * @tc.name       : testMuslMathASinF003
     * @tc.desc       : test ASinF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathASinF003', 0, async (done: Function) => {
      let resultTrue: number = 1;
      let Param = -1 / 2;
      let result: number = math.aSinF(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ASINF_0400
     * @tc.name       : testMuslMathASinF004
     * @tc.desc       : test ASinF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathASinF004', 0, async (done: Function) => {
      let Param = 3;
      let result: number = math.aSinF(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ASINL_0100
     * @tc.name       : testMuslMathASinL001
     * @tc.desc       : test ASinL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathASinL001', 0, async (done: Function) => {
      let resultTrue: number = 1;
      let Param = 1 / 2;
      let result: number = math.aSinL(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ASINL_0200
     * @tc.name       : testMuslMathASinL002
     * @tc.desc       : test ASinL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathASinL002', 0, async (done: Function) => {
      let resultTrue: number = 1;
      let Param = 0;
      let result: number = math.aSinL(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ASINL_0300
     * @tc.name       : testMuslMathASinL003
     * @tc.desc       : test ASinL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathASinL003', 0, async (done: Function) => {
      let resultTrue: number = 1;
      let Param = -1 / 2;
      let result: number = math.aSinL(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ASINL_0400
     * @tc.name       : testMuslMathASinL004
     * @tc.desc       : test ASinL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathASinL004', 0, async (done: Function) => {
      let Param = 3;
      let result: number = math.aSinL(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ASINH_0100
     * @tc.name       : testMuslMathASinH001
     * @tc.desc       : test ASinH
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathASinH001', 0, async (done: Function) => {
      let resultTrue: number = 0.88;
      let Param = 1;
      let result: number = Math.floor(math.aSinH(Param) * 100) / 100;
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ASINH_0200
     * @tc.name       : testMuslMathASinH002
     * @tc.desc       : test ASinH
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathASinH002', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let Param = 0;
      let result: number = math.aSinH(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ASINH_0300
     * @tc.name       : testMuslMathASinH003
     * @tc.desc       : test ASinH
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathASinH003', 0, async (done: Function) => {
      let resultTrue: number = -0.89;
      let Param = -1;
      let result: number = Math.floor(math.aSinH(Param) * 100) / 100;
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ASINH_0400
     * @tc.name       : testMuslMathASinH004
     * @tc.desc       : test ASinH
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathASinH004', 0, async (done: Function) => {
      let result: number = math.aSinH(Math.sqrt(-1));
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ASINHF_0100
     * @tc.name       : testMuslMathASinHF001
     * @tc.desc       : test ASinHF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathASinHF001', 0, async (done: Function) => {
      let resultTrue: number = 0.88;
      let Param = 1;
      let result: number = Math.floor(math.aSinHF(Param) * 100) / 100;
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ASINHF_0200
     * @tc.name       : testMuslMathASinHF002
     * @tc.desc       : test ASinHF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathASinHF002', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let Param = 0;
      let result: number = math.aSinHF(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ASINHF_0300
     * @tc.name       : testMuslMathASinHF003
     * @tc.desc       : test ASinHF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathASinHF003', 0, async (done: Function) => {
      let resultTrue: number = -0.89;
      let Param = -1;
      let result: number = Math.floor(math.aSinHF(Param) * 100) / 100;
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ASINHF_0400
     * @tc.name       : testMuslMathASinHF004
     * @tc.desc       : test ASinHF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathASinHF004', 0, async (done: Function) => {
      let result: number = math.aSinHF(Math.sqrt(-1));
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ASINHL_0100
     * @tc.name       : testMuslMathASinHL001
     * @tc.desc       : test ASinHL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathASinHL001', 0, async (done: Function) => {
      let resultTrue: number = 0.88;
      let Param = 1;
      let result: number = Math.floor(math.aSinHL(Param) * 100) / 100;
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ASINHL_0200
     * @tc.name       : testMuslMathASinHL002
     * @tc.desc       : test ASinHL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathASinHL002', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let Param = 0;
      let result: number = math.aSinHL(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ASINHL_0300
     * @tc.name       : testMuslMathASinHL003
     * @tc.desc       : test ASinHL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathASinHL003', 0, async (done: Function) => {
      let resultTrue: number = -0.89;
      let Param = -1;
      let result: number = Math.floor(math.aSinHL(Param) * 100) / 100;
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ASINHL_0400
     * @tc.name       : testMuslMathASinHL004
     * @tc.desc       : test ASinHL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathASinHL004', 0, async (done: Function) => {
      let result: number = math.aSinHL(Math.sqrt(-1));
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOS_0100
     * @tc.name       : testMuslMathACos001
     * @tc.desc       : test ACos
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACos001', 0, async (done: Function) => {
      let resultTrue: number = Math.PI;
      let Param = -1;
      let result: number = math.aCos(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOS_0200
     * @tc.name       : testMuslMathACos002
     * @tc.desc       : test ACos
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACos002', 0, async (done: Function) => {
      let resultTrue: number = Math.PI / 2;
      let Param = 0;
      let result: number = math.aCos(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOS_0300
     * @tc.name       : testMuslMathACos003
     * @tc.desc       : test ACos
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACos003', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let Param = 1;
      let result: number = math.aCos(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOS_0400
     * @tc.name       : testMuslMathACos004
     * @tc.desc       : test ACos
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACos004', 0, async (done: Function) => {
      let Param = 3;
      let result: number = math.aCos(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOS_0500
     * @tc.name       : testMuslMathACos005
     * @tc.desc       : test ACos
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACos005', 0, async (done: Function) => {
      let Param = Math.sqrt(-1);
      let result: number = math.aCos(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOS_0600
     * @tc.name       : testMuslMathACos006
     * @tc.desc       : test ACos
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACos006', 0, async (done: Function) => {
      let Param = 1.0 / 0.0;
      let result: number = math.aCos(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSF_0100
     * @tc.name       : testMuslMathACosF001
     * @tc.desc       : test ACosF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosF001', 0, async (done: Function) => {
      let resultTrue: number = 3.14;
      let Param = -1;
      let result: number = Math.floor(math.aCosF(Param) * 100) / 100;
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSF_0200
     * @tc.name       : testMuslMathACosF002
     * @tc.desc       : test ACosF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosF002', 0, async (done: Function) => {
      let resultTrue: string = (Math.PI / 2).toFixed(2);
      let Param = 0;
      let result: string = (math.aCosF(Param)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSF_0300
     * @tc.name       : testMuslMathACosF003
     * @tc.desc       : test ACosF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosF003', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let Param = 1;
      let result: number = math.aCosF(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSF_0400
     * @tc.name       : testMuslMathACosF004
     * @tc.desc       : test ACosF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosF004', 0, async (done: Function) => {
      let Param = 3;
      let result: number = math.aCosF(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSF_0500
     * @tc.name       : testMuslMathACosF005
     * @tc.desc       : test ACosF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosF005', 0, async (done: Function) => {
      let Param = Math.sqrt(-1);
      let result: number = math.aCosF(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSF_0600
     * @tc.name       : testMuslMathACosF006
     * @tc.desc       : test ACosF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosF006', 0, async (done: Function) => {
      let Param = 1.0 / 0.0;
      let result: number = math.aCosF(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSL_0100
     * @tc.name       : testMuslMathACosL001
     * @tc.desc       : test ACosL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosL001', 0, async (done: Function) => {
      let resultTrue: number = Math.PI;
      let Param = -1;
      let result: number = math.aCosL(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSL_0200
     * @tc.name       : testMuslMathACosL002
     * @tc.desc       : test ACosL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosL002', 0, async (done: Function) => {
      let resultTrue: number = Math.PI / 2;
      let Param = 0;
      let result: number = math.aCosL(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSL_0300
     * @tc.name       : testMuslMathACosL003
     * @tc.desc       : test ACosL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosL003', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let Param = 1;
      let result: number = math.aCosL(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSL_0400
     * @tc.name       : testMuslMathACosL004
     * @tc.desc       : test ACosL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosL004', 0, async (done: Function) => {
      let Param = 3;
      let result: number = math.aCosL(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSL_0500
     * @tc.name       : testMuslMathACosL005
     * @tc.desc       : test ACosL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosL005', 0, async (done: Function) => {
      let Param = Math.sqrt(-1);
      let result: number = math.aCosL(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSL_0600
     * @tc.name       : testMuslMathACosL006
     * @tc.desc       : test ACosL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosL006', 0, async (done: Function) => {
      let Param = 1.0 / 0.0;
      let result: number = math.aCosL(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSH_0100
     * @tc.name       : testMuslMathACosH001
     * @tc.desc       : test ACosH
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosH001', 0, async (done: Function) => {
      let Param = -1;
      let result: number = math.aCosH(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSH_0200
     * @tc.name       : testMuslMathACosH002
     * @tc.desc       : test ACosH
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosH002', 0, async (done: Function) => {
      let Param = 0;
      let result: number = math.aCosH(Param);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSH_0300
     * @tc.name       : testMuslMathACosH003
     * @tc.desc       : test ACosH
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosH003', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let Param = 1;
      let result: number = math.aCosH(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSH_0400
     * @tc.name       : testMuslMathACosH004
     * @tc.desc       : test ACosH
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosH004', 0, async (done: Function) => {
      let Param = -3;
      let result: number = math.aCosH(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSH_0500
     * @tc.name       : testMuslMathACosH005
     * @tc.desc       : test ACosH
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosH005', 0, async (done: Function) => {
      let Param = Math.sqrt(-1);
      let result: number = math.aCosH(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSH_0600
     * @tc.name       : testMuslMathACosH006
     * @tc.desc       : test ACosH
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosH006', 0, async (done: Function) => {
      let Param = 1.0 / 0.0;
      let result: number = math.aCosH(Param);
      expect(result).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSHF_0100
     * @tc.name       : testMuslMathACosHF001
     * @tc.desc       : test ACosHF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosHF001', 0, async (done: Function) => {
      let Param = -1;
      let result: number = math.aCosHF(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSHF_0200
     * @tc.name       : testMuslMathACosHF002
     * @tc.desc       : test ACosHF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosHF002', 0, async (done: Function) => {
      let Param = 0;
      let result: number = math.aCosHF(Param);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSHF_0300
     * @tc.name       : testMuslMathACosHF003
     * @tc.desc       : test ACosHF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosHF003', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let Param = 1;
      let result: number = math.aCosHF(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSHF_0400
     * @tc.name       : testMuslMathACosHF004
     * @tc.desc       : test ACosHF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosHF004', 0, async (done: Function) => {
      let Param = -3;
      let result: number = math.aCosHF(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSHF_0500
     * @tc.name       : testMuslMathACosHF005
     * @tc.desc       : test ACosHF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosHF005', 0, async (done: Function) => {
      let Param = Math.sqrt(-1);
      let result: number = math.aCosHF(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSHF_0600
     * @tc.name       : testMuslMathACosHF006
     * @tc.desc       : test ACosHF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosHF006', 0, async (done: Function) => {
      let Param = 1.0 / 0.0;
      let result: number = math.aCosHF(Param);
      expect(result).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSHL_0100
     * @tc.name       : testMuslMathACosHL001
     * @tc.desc       : test ACosHL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosHL001', 0, async (done: Function) => {
      let Param = -1;
      let result: number = math.aCosHL(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSHL_0200
     * @tc.name       : testMuslMathACosHL002
     * @tc.desc       : test ACosHL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosHL002', 0, async (done: Function) => {
      let Param = 0;
      let result: number = math.aCosHL(Param);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSHL_0300
     * @tc.name       : testMuslMathACosHL003
     * @tc.desc       : test ACosHL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosHL003', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let Param = 1;
      let result: number = math.aCosHL(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSHL_0400
     * @tc.name       : testMuslMathACosHL004
     * @tc.desc       : test ACosHL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosHL004', 0, async (done: Function) => {
      let Param = -3;
      let result: number = math.aCosHL(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSHL_0500
     * @tc.name       : testMuslMathACosHL005
     * @tc.desc       : test ACosHL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosHL005', 0, async (done: Function) => {
      let Param = Math.sqrt(-1);
      let result: number = math.aCosHL(Param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ACOSHL_0600
     * @tc.name       : testMuslMathACosHL006
     * @tc.desc       : test ACosHL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathACosHL006', 0, async (done: Function) => {
      let Param = 1.0 / 0.0;
      let result: number = math.aCosHL(Param);
      expect(result).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN_0100
     * @tc.name       : testMuslMathATan001
     * @tc.desc       : test ATan
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan001', 0, async (done: Function) => {
      let resultTrue: number = 1;
      let Param = -1;
      let result: number = math.aTan(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN_0200
     * @tc.name       : testMuslMathATan002
     * @tc.desc       : test ATan
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan002', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let param = 0;
      let result: number = math.aTan(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN_0300
     * @tc.name       : testMuslMathATan003
     * @tc.desc       : test ATan
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan003', 0, async (done: Function) => {
      let resultTrue: number = 1;
      let param = 1;
      let result: number = math.aTan(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN_0400
     * @tc.name       : testMuslMathATan004
     * @tc.desc       : test ATan
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan004', 0, async (done: Function) => {
      let resultTrue: number = Math.PI / 2;
      let param = 1.0 / 0.0;
      let result: number = math.aTan(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN_0500
     * @tc.name       : testMuslMathATan005
     * @tc.desc       : test ATan
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan005', 0, async (done: Function) => {
      let param = Math.sqrt(-1);
      let result: number = math.aTan(param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN_0600
     * @tc.name       : testMuslMathATan006
     * @tc.desc       : test ATan
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan006', 0, async (done: Function) => {
      let resultTrue: number = -Math.PI / 2;
      let param = -1.0 / 0.0;
      let result: number = math.aTan(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATANF_0100
     * @tc.name       : testMuslMathATanF001
     * @tc.desc       : test ATanF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATanF001', 0, async (done: Function) => {
      let resultTrue: number = 1;
      let Param = -1;
      let result: number = math.aTanF(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATANF_0200
     * @tc.name       : testMuslMathATanF002
     * @tc.desc       : test ATanF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATanF002', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let param = 0;
      let result: number = math.aTanF(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATANF_0300
     * @tc.name       : testMuslMathATanF003
     * @tc.desc       : test ATanF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATanF003', 0, async (done: Function) => {
      let resultTrue: number = 1;
      let param = 1;
      let result: number = math.aTanF(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATANF_0400
     * @tc.name       : testMuslMathATanF004
     * @tc.desc       : test ATanF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATanF004', 0, async (done: Function) => {
      let resultTrue: string = (Math.PI / 2).toFixed(2);
      let param = 1.0 / 0.0;
      let result: string = (math.aTanF(param)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATANF_0500
     * @tc.name       : testMuslMathATanF005
     * @tc.desc       : test ATanF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATanF005', 0, async (done: Function) => {
      let param = Math.sqrt(-1);
      let result: number = math.aTanF(param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATANF_0600
     * @tc.name       : testMuslMathATanF006
     * @tc.desc       : test ATanF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATanF006', 0, async (done: Function) => {
      let resultTrue: string = (-Math.PI / 2).toFixed(2);
      let param = -1.0 / 0.0;
      let result: string = (math.aTanF(param)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATANL_0100
     * @tc.name       : testMuslMathATanL001
     * @tc.desc       : test ATanL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATanL001', 0, async (done: Function) => {
      let resultTrue: number = 1;
      let Param = -1;
      let result: number = math.aTanL(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATANL_0200
     * @tc.name       : testMuslMathATanL002
     * @tc.desc       : test ATanL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATanL002', 0, async (done: Function) => {
      let resultTrue: number = 1;
      let param = 0;
      let result: number = math.aTanL(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATANL_0300
     * @tc.name       : testMuslMathATanL003
     * @tc.desc       : test ATanL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATanL003', 0, async (done: Function) => {
      let resultTrue: number = 1;
      let param = 1;
      let result: number = math.aTanL(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATANL_0400
     * @tc.name       : testMuslMathATanL004
     * @tc.desc       : test ATanL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATanL004', 0, async (done: Function) => {
      let resultTrue: string = (Math.PI / 2).toFixed(2);
      let param = 1.0 / 0.0;
      let result: string = (math.aTanL(param)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATANL_0500
     * @tc.name       : testMuslMathATanL005
     * @tc.desc       : test ATanL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATanL005', 0, async (done: Function) => {
      let param = Math.sqrt(-1);
      let result: number = math.aTanL(param);
      expect(result).assertNaN;
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATANL_0600
     * @tc.name       : testMuslMathATanL006
     * @tc.desc       : test ATanL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATanL006', 0, async (done: Function) => {
      let resultTrue: string = (-Math.PI / 2).toFixed(2);
      let param = -1.0 / 0.0;
      let result: string = (math.aTanL(param)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2_0100
     * @tc.name       : testMuslMathATan2001
     * @tc.desc       : test ATan2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2001', 0, async (done: Function) => {
      let resultTrue: string = (Math.PI).toFixed(2);
      let Param0 = 0;
      let Param1 = -1;
      let result: string = (math.aTan2(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2_0200
     * @tc.name       : testMuslMathATan2002
     * @tc.desc       : test ATan2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2002', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 0;
      let Param1 = 1;
      let result: number = math.aTan2(Param0, Param1);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2_0300
     * @tc.name       : testMuslMathATan2003
     * @tc.desc       : test ATan2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2003', 0, async (done: Function) => {
      let resultTrue: string = (-Math.PI / 2).toFixed(2);
      let Param0 = -1;
      let Param1 = 0;
      let result: string = (math.aTan2(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2_0400
     * @tc.name       : testMuslMathATan2004
     * @tc.desc       : test ATan2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2004', 0, async (done: Function) => {
      let resultTrue: string = (Math.PI / 2).toFixed(2);
      let Param0 = 1;
      let Param1 = 0;
      let result: string = (math.aTan2(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2_0500
     * @tc.name       : testMuslMathATan2005
     * @tc.desc       : test ATan2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2005', 0, async (done: Function) => {
      let Param0 = Math.sqrt(-1);
      let Param1 = -1;
      let result: number = math.aTan2(Param0, Param1);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2_0600
     * @tc.name       : testMuslMathATan2006
     * @tc.desc       : test ATan2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2006', 0, async (done: Function) => {
      let Param0 = 0;
      let Param1 = 0;
      let result: Number = math.aTan2(Param0, Param1);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2_0700
     * @tc.name       : testMuslMathATan2007
     * @tc.desc       : test ATan2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2007', 0, async (done: Function) => {
      let resultTrue: number = Math.PI / 4;
      let Param0 = 1.0 / 0.0;
      let Param1 = 1.0 / 0.0;
      let result: number = math.aTan2(Param0, Param1);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2_0800
     * @tc.name       : testMuslMathATan2008
     * @tc.desc       : test ATan2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2008', 0, async (done: Function) => {
      let resultTrue: string = (Math.PI * 3 / 4).toFixed(2);
      let Param0 = 1.0 / 0.0;
      let Param1 = -1.0 / 0.0;
      let result: string = (math.aTan2(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2_0900
     * @tc.name       : testMuslMathATan2009
     * @tc.desc       : test ATan2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2009', 0, async (done: Function) => {
      let resultTrue: string = (-Math.PI / 4).toFixed(2);
      let Param0 = -1.0 / 0.0;
      let Param1 = 1.0 / 0.0;
      let result: string = (math.aTan2(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2_1000
     * @tc.name       : testMuslMathATan2010
     * @tc.desc       : test ATan2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2010', 0, async (done: Function) => {
      let resultTrue: number = -3 * Math.PI / 4;
      let Param0 = -1.0 / 0.0;
      let Param1 = -1.0 / 0.0;
      let result: number = math.aTan2(Param0, Param1);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2F_0100
     * @tc.name       : testMuslMathATan2F001
     * @tc.desc       : test ATan2F
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2F001', 0, async (done: Function) => {
      let resultTrue: string = (Math.PI).toFixed(2);
      let Param0 = 0;
      let Param1 = -1;
      let result: string = (math.aTan2F(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2F_0200
     * @tc.name       : testMuslMathATan2F002
     * @tc.desc       : test ATan2F
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2F002', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 0;
      let Param1 = 1;
      let result: number = math.aTan2F(Param0, Param1);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2F_0300
     * @tc.name       : testMuslMathATan2F003
     * @tc.desc       : test ATan2F
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2F003', 0, async (done: Function) => {
      let resultTrue: string = (-Math.PI / 2).toFixed(2);
      let Param0 = -1;
      let Param1 = 0;
      let result: string = (math.aTan2F(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2F_0400
     * @tc.name       : testMuslMathATan2F004
     * @tc.desc       : test ATan2F
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2F004', 0, async (done: Function) => {
      let resultTrue: string = (Math.PI / 2).toFixed(2);
      let Param0 = 1;
      let Param1 = 0;
      let result: string = (math.aTan2F(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2F_0500
     * @tc.name       : testMuslMathATan2F005
     * @tc.desc       : test ATan2F
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2F005', 0, async (done: Function) => {
      let Param0 = Math.sqrt(-1);
      let Param1 = -1;
      let result: number = math.aTan2F(Param0, Param1);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2F_0600
     * @tc.name       : testMuslMathATan2F006
     * @tc.desc       : test ATan2F
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2F006', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 0;
      let Param1 = 0;
      let result: number = math.aTan2F(Param0, Param1);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2F_0700
     * @tc.name       : testMuslMathATan2F007
     * @tc.desc       : test ATan2F
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2F007', 0, async (done: Function) => {
      let resultTrue: string = (Math.PI / 4).toFixed(2);
      let Param0 = 1.0 / 0.0;
      let Param1 = 1.0 / 0.0;
      let result: string = (math.aTan2F(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2F_0800
     * @tc.name       : testMuslMathATan2F008
     * @tc.desc       : test ATan2F
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2F008', 0, async (done: Function) => {
      let resultTrue: string = (Math.PI * 3 / 4).toFixed(2);
      let Param0 = 1.0 / 0.0;
      let Param1 = -1.0 / 0.0;
      let result: string = (math.aTan2F(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2F_0900
     * @tc.name       : testMuslMathATan2F009
     * @tc.desc       : test ATan2F
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2F009', 0, async (done: Function) => {
      let resultTrue: string = (-Math.PI / 4).toFixed(2);
      let Param0 = -1.0 / 0.0;
      let Param1 = 1.0 / 0.0;
      let result: string = (math.aTan2F(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2F_1000
     * @tc.name       : testMuslMathATan2F010
     * @tc.desc       : test ATan2F
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2F010', 0, async (done: Function) => {
      let resultTrue: string = (-3 * Math.PI / 4).toFixed(2);
      let Param0 = -1.0 / 0.0;
      let Param1 = -1.0 / 0.0;
      let result: string = (math.aTan2F(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2L_0100
     * @tc.name       : testMuslMathATan2L001
     * @tc.desc       : test ATan2L
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2L001', 0, async (done: Function) => {
      let resultTrue: string = (Math.PI).toFixed(2);
      let Param0 = 0;
      let Param1 = -1;
      let result: string = (math.aTan2L(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2L_0200
     * @tc.name       : testMuslMathATan2L002
     * @tc.desc       : test ATan2L
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2L002', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 0;
      let Param1 = 1;
      let result: number = math.aTan2L(Param0, Param1);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2L_0300
     * @tc.name       : testMuslMathATan2L003
     * @tc.desc       : test ATan2L
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2L003', 0, async (done: Function) => {
      let resultTrue: string = (-Math.PI / 2).toFixed(2);
      let Param0 = -1;
      let Param1 = 0;
      let result: string = (math.aTan2L(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2L_0400
     * @tc.name       : testMuslMathATan2L004
     * @tc.desc       : test ATan2L
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2L004', 0, async (done: Function) => {
      let resultTrue: string = (Math.PI / 2).toFixed(2);
      let Param0 = 1;
      let Param1 = 0;
      let result: string = (math.aTan2L(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COS_0100
     * @tc.name       : testMuslMathCos001
     * @tc.desc       : test cos
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCos001', 0, async (done: Function) => {
      let a: number = 60;
      let result: number = 0.50;
      let data: Number = math.cos(a);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COS_0200
     * @tc.name       : testMuslMathCos002
     * @tc.desc       : test cos
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCos002', 0, async (done: Function) => {
      let a: number = 0;
      let result: number = 1.00;
      let data: Number = math.cos(a);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COS_0300
     * @tc.name       : testMuslMathCos003
     * @tc.desc       : test cos
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCos003', 0, async (done: Function) => {
      let a: number = 90;
      let result: number = 0.00;
      let data: Number = math.cos(a);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ERF_0100
     * @tc.name       : testMuslMathErf001
     * @tc.desc       : test erf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathErf001', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ERF_0200
     * @tc.name       : testMuslMathErf002
     * @tc.desc       : test erf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathErf002', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ERF_0300
     * @tc.name       : testMuslMathErf003
     * @tc.desc       : test erf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathErf003', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ERF_0400
     * @tc.name       : testMuslMathErf004
     * @tc.desc       : test erf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathErf004', 0, async (done: Function) => {
      let a: number = 0;
      let data: Number = math.erf(a);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COPYSIGN_0100
     * @tc.name       : testMuslMathCopySign001
     * @tc.desc       : test copysign
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCopySign001', 0, async (done: Function) => {
      let a: number = 11;
      let b = -2;
      let data: Number = math.copysign(a, b);
      expect(data).assertEqual(-11);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COPYSIGN_0200
     * @tc.name       : testMuslMathCopySign002
     * @tc.desc       : test copysign
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCopySign002', 0, async (done: Function) => {
      let a: number = -11;
      let b = -2;
      let data: Number = math.copysign(a, b);
      expect(data).assertEqual(-11);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COPYSIGN_0300
     * @tc.name       : testMuslMathCopySign003
     * @tc.desc       : test copysign
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCopySign003', 0, async (done: Function) => {
      let a: number = -11;
      let b = 2;
      let data: Number = math.copysign(a, b);
      expect(data).assertEqual(11);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXP_0100
     * @tc.name       : testMuslMathExp001
     * @tc.desc       : test exp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathExp001', 0, async (done: Function) => {
      let a: number = -1;
      let result: number = 0.367879;
      let data: Number = math.exp(a);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXP_0200
     * @tc.name       : testMuslMathExp002
     * @tc.desc       : test exp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathExp002', 0, async (done: Function) => {
      let a: number = 0;
      let data: Number = math.exp(a);
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FABS_0100
     * @tc.name       : testMuslMathFabs001
     * @tc.desc       : test fabs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFabs001', 0, async (done: Function) => {
      let a: number = 7.5;
      let data: Number = math.fabs(a);
      expect(data).assertEqual(7.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FDIM_0100
     * @tc.name       : testMuslMathFDim001
     * @tc.desc       : test fdim
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFDim001', 0, async (done: Function) => {
      let a: number = 7.5;
      let b = 2.3;
      let data: Number = math.fdim(a, b);
      expect(data).assertEqual(5.2);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FDIM_0200
     * @tc.name       : testMuslMathFDim002
     * @tc.desc       : test fdim
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFDim002', 0, async (done: Function) => {
      let a: number = 1.5;
      let b = 2.3;
      let data: Number = math.fdim(a, b);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FDIM_0300
     * @tc.name       : testMuslMathFDim003
     * @tc.desc       : test fdim
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFDim003', 0, async (done: Function) => {
      let a: number = 1.5;
      let b = -3.57;
      let data: Number = math.fdim(a, b);
      expect(data).assertEqual(5.07);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FLOOR_0100
     * @tc.name       : testMuslMathFloor001
     * @tc.desc       : test floor
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFloor001', 0, async (done: Function) => {
      let a: number = 1.5;
      let data: Number = math.floor(a);
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FLOOR_0200
     * @tc.name       : testMuslMathFloor002
     * @tc.desc       : test floor
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFloor002', 0, async (done: Function) => {
      let a: number = -10.5;
      let data: Number = math.floor(a);
      expect(data).assertEqual(-11);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMA_0100
     * @tc.name       : testMuslMathFma001
     * @tc.desc       : test fma
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFma001', 0, async (done: Function) => {
      let a: number = 1.5;
      let b = 2;
      let c = 2.5;
      let data: Number = math.fma(a, b, c);
      expect(data).assertEqual(5.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMA_0200
     * @tc.name       : testMuslMathFma002
     * @tc.desc       : test fma
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFma002', 0, async (done: Function) => {
      let a: number = -1.5;
      let b = 2;
      let c = 2.5;
      let data: Number = math.fma(a, b, c);
      expect(data).assertEqual(-0.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAX_0100
     * @tc.name       : testMuslMathFMax001
     * @tc.desc       : test fmax
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFMax001', 0, async (done: Function) => {
      let a: number = -1.5;
      let b = 2;
      let data: Number = math.fmax(a, b);
      expect(data).assertEqual(2);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAX_0200
     * @tc.name       : testMuslMathFMax002
     * @tc.desc       : test fmax
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFMax002', 0, async (done: Function) => {
      let a: number = 1.5;
      let b = 1.5;
      let data: Number = math.fmax(a, b);
      expect(data).assertEqual(1.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAX_0300
     * @tc.name       : testMuslMathFMax003
     * @tc.desc       : test fmax
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFMax003', 0, async (done: Function) => {
      let a: number = 1.5;
      let b = 1;
      let data: Number = math.fmax(a, b);
      expect(data).assertEqual(1.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMIN_0100
     * @tc.name       : testMuslMathFmin001
     * @tc.desc       : test fmin
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmin001', 0, async (done: Function) => {
      let a: number = -1.5;
      let b = 2;
      let data: Number = math.fmin(a, b);
      expect(data).assertEqual(-1.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMIN_0200
     * @tc.name       : testMuslMathFmin002
     * @tc.desc       : test fmin
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmin002', 0, async (done: Function) => {
      let a: number = 0;
      let b = 0;
      let data: Number = math.fmin(a, b);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMIN_0300
     * @tc.name       : testMuslMathFmin003
     * @tc.desc       : test fmin
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmin003', 0, async (done: Function) => {
      let a: number = 1.56;
      let b = 0;
      let data: Number = math.fmin(a, b);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMOD_0100
     * @tc.name       : testMuslMathFmod001
     * @tc.desc       : test fmod
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmod001', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMOD_0200
     * @tc.name       : testMuslMathFmod002
     * @tc.desc       : test fmod
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmod002', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMOD_0300
     * @tc.name       : testMuslMathFmod003
     * @tc.desc       : test fmod
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmod003', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMOD_0400
     * @tc.name       : testMuslMathFmod004
     * @tc.desc       : test fmod
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmod004', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FABSF_0100
     * @tc.name       : testMuslMathFAbsF001
     * @tc.desc       : test fabsf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFAbsF001', 0, async (done: Function) => {
      let a: number = -7.5;
      let data: Number = math.fabsf(a);
      expect(data).assertEqual(7.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSH_0100
     * @tc.name       : testMuslMathCosh001
     * @tc.desc       : test cosh
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCosh001', 0, async (done: Function) => {
      let a: number = 90;
      let result: number = 2.50918;
      let data: Number = math.cosh(a);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSH_0200
     * @tc.name       : testMuslMathCosh002
     * @tc.desc       : test cosh
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCosh002', 0, async (done: Function) => {
      let a: number = 0;
      let result: number = 1;
      let data: Number = math.cosh(a);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSH_0300
     * @tc.name       : testMuslMathCosh003
     * @tc.desc       : test cosh
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCosh003', 0, async (done: Function) => {
      let a: number = -30;
      let result: number = 1.14023;
      let data: Number = math.cosh(a);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXP2_0100
     * @tc.name       : testMuslMathExp2001
     * @tc.desc       : test exp2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathExp2001', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXP2_0200
     * @tc.name       : testMuslMathExp2002
     * @tc.desc       : test exp2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathExp2002', 0, async (done: Function) => {
      let a: number = 1.0 / 0.0;
      let data: Number = math.exp2(a);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXP2_0300
     * @tc.name       : testMuslMathExp2003
     * @tc.desc       : test exp2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathExp2003', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPM1_0100
     * @tc.name       : testMuslMathExpM1001
     * @tc.desc       : test expm1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathExpM1001', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPM1_0200
     * @tc.name       : testMuslMathExpM1002
     * @tc.desc       : test expm1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathExpM1002', 0, async (done: Function) => {
      let a: number = 1.0 / 0.0;
      let data: Number = math.expm1(a);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPM1_0300
     * @tc.name       : testMuslMathExpM1003
     * @tc.desc       : test expm1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathExpM1003', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMODF_0100
     * @tc.name       : testMuslMathFmodF001
     * @tc.desc       : test fmodf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmodF001', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMODF_0200
     * @tc.name       : testMuslMathFmodF002
     * @tc.desc       : test fmodf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmodF002', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMODF_0300
     * @tc.name       : testMuslMathFmodF003
     * @tc.desc       : test fmodf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmodF003', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMODL_0100
     * @tc.name       : testMuslMathFmodL001
     * @tc.desc       : test fmodl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmodL001', 0, async (done: Function) => {
      let a: number = 9.6;
      let b = 4.75;
      let result: number = 0.1;
      let data: Number = math.fmodl(a, b);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMODL_0200
     * @tc.name       : testMuslMathFmodL002
     * @tc.desc       : test fmodl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmodL002', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMODL_0300
     * @tc.name       : testMuslMathFmodL003
     * @tc.desc       : test fmodl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmodL003', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMINF_0100
     * @tc.name       : testMuslMathFMinF001
     * @tc.desc       : test fminf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFMinF001', 0, async (done: Function) => {
      let a: number = -1.5;
      let b = 2;
      let data: Number = math.fminf(a, b);
      expect(data).assertEqual(-1.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMINF_0200
     * @tc.name       : testMuslMathFMinF002
     * @tc.desc       : test fminf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFMinF002', 0, async (done: Function) => {
      let a: number = 0;
      let b = 0;
      let data: Number = math.fminf(a, b);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMINF_0300
     * @tc.name       : testMuslMathFMinF003
     * @tc.desc       : test fminf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFMinF003', 0, async (done: Function) => {
      let a: number = 1.56;
      let b = 0;
      let data: Number = math.fminf(a, b);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMINL_0100
     * @tc.name       : testMuslMathFMinL001
     * @tc.desc       : test fminl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFMinL001', 0, async (done: Function) => {
      let a: number = -1.5;
      let b = 2;
      let data: Number = math.fminl(a, b);
      expect(data).assertEqual(-1.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMINL_0200
     * @tc.name       : testMuslMathFMinL002
     * @tc.desc       : test fminl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFMinL002', 0, async (done: Function) => {
      let a: number = 0;
      let b = 0;
      let data: Number = math.fminl(a, b);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMINL_0300
     * @tc.name       : testMuslMathFMinL003
     * @tc.desc       : test fminl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFMinL003', 0, async (done: Function) => {
      let a: number = 1.56;
      let b = 0;
      let data: Number = math.fminl(a, b);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAXF_0100
     * @tc.name       : testMuslMathFMaxF001
     * @tc.desc       : test fmaxf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFMaxF001', 0, async (done: Function) => {
      let a: number = -1.5;
      let b = 2;
      let data: Number = math.fmaxf(a, b);
      expect(data).assertEqual(2);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAXF_0200
     * @tc.name       : testMuslMathFMaxF002
     * @tc.desc       : test fmaxf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFMaxF002', 0, async (done: Function) => {
      let a: number = 1.5;
      let b = 1.5;
      let data: Number = math.fmaxf(a, b);
      expect(data).assertEqual(1.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAXF_0300
     * @tc.name       : testMuslMathFMaxF003
     * @tc.desc       : test fmaxf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFMaxF003', 0, async (done: Function) => {
      let a: number = 1.5;
      let b = 1;
      let data: Number = math.fmaxf(a, b);
      expect(data).assertEqual(1.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAXL_0100
     * @tc.name       : testMuslMathFMaxL001
     * @tc.desc       : test fmaxl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFMaxL001', 0, async (done: Function) => {
      let a: number = -1.5;
      let b = 2;
      let data: Number = math.fmaxl(a, b);
      expect(data).assertEqual(2);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAXL_0200
     * @tc.name       : testMuslMathFMaxL002
     * @tc.desc       : test fmaxl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFMaxL002', 0, async (done: Function) => {
      let a: number = 1.5;
      let b = 1.5;
      let data: Number = math.fmaxl(a, b);
      expect(data).assertEqual(1.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAXL_0300
     * @tc.name       : testMuslMathFMaxL003
     * @tc.desc       : test fmaxl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFMaxL003', 0, async (done: Function) => {
      let a: number = 1.5;
      let b = 1;
      let data: Number = math.fmaxl(a, b);
      expect(data).assertEqual(1.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAF_0100
     * @tc.name       : testMuslMathFmaF001
     * @tc.desc       : test fmaf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmaF001', 0, async (done: Function) => {
      let a: number = 1.5;
      let b = 2;
      let c = 2.5;
      let data: Number = math.fmaf(a, b, c);
      expect(data).assertEqual(5.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAF_0200
     * @tc.name       : testMuslMathFmaF002
     * @tc.desc       : test fmaf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmaF002', 0, async (done: Function) => {
      let a: number = -1.5;
      let b = 2;
      let c = 2.5;
      let data: Number = math.fmaf(a, b, c);
      expect(data).assertEqual(-0.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAL_0100
     * @tc.name       : testMuslMathFmaL001
     * @tc.desc       : test fmal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmaL001', 0, async (done: Function) => {
      let a: number = 1.5;
      let b = 2;
      let c = 2.5;
      let data: Number = math.fmal(a, b, c);
      expect(data).assertEqual(5.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAL_0200
     * @tc.name       : testMuslMathFmaL002
     * @tc.desc       : test fmal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmaL002', 0, async (done: Function) => {
      let a: number = -1.5;
      let b = 2;
      let c = 2.5;
      let data: Number = math.fmal(a, b, c);
      expect(data).assertEqual(-0.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FLOORF_0100
     * @tc.name       : testMuslMathFloorF001
     * @tc.desc       : test floorf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFloorF001', 0, async (done: Function) => {
      let a: number = 1.5;
      let result: number = 1;
      let data: Number = math.floorf(a);
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FLOORF_0200
     * @tc.name       : testMuslMathFloorF002
     * @tc.desc       : test floorf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFloorF002', 0, async (done: Function) => {
      let a: number = -10.5;
      let result: number = -11;
      let data: Number = math.floorf(a);
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FLOORL_0100
     * @tc.name       : testMuslMathFloorL001
     * @tc.desc       : test floorl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFloorL001', 0, async (done: Function) => {
      let a: number = 1.5;
      let result: number = 1;
      let data: Number = math.floorl(a);
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FLOORL_0200
     * @tc.name       : testMuslMathFloorL002
     * @tc.desc       : test floorl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFloorL002', 0, async (done: Function) => {
      let a: number = -10.5;
      let result: number = -11;
      let data: Number = math.floorl(a);
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FDIMF_0100
     * @tc.name       : testMuslMathFDimF001
     * @tc.desc       : test fdimf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFDimF001', 0, async (done: Function) => {
      let a: number = 7.5;
      let b = 2.3;
      let result: number = 5.199;
      let data: Number = math.fdimf(a, b);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FDIMF_0200
     * @tc.name       : testMuslMathFDimF002
     * @tc.desc       : test fdimf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFDimF002', 0, async (done: Function) => {
      let a: number = 1.5;
      let b = 2.3;
      let result: number = 0;
      let data: Number = math.fdimf(a, b);
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FDIMF_0300
     * @tc.name       : testMuslMathFDimF003
     * @tc.desc       : test fdimf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFDimF003', 0, async (done: Function) => {
      let a: number = 1.5;
      let b = -3.57;
      let result: number = 5.069;
      let data: Number = math.fdimf(a, b);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FDIML_0100
     * @tc.name       : testMuslMathFDimL001
     * @tc.desc       : test fdiml
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFDimL001', 0, async (done: Function) => {
      let a: number = 7.5;
      let b = 2.3;
      let data: Number = math.fdiml(a, b);
      expect(data).assertEqual(5.2);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FDIML_0200
     * @tc.name       : testMuslMathFDimL002
     * @tc.desc       : test fdiml
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFDimL002', 0, async (done: Function) => {
      let a: number = 1.5;
      let b = 2.3;
      let data: Number = math.fdiml(a, b);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FDIML_0300
     * @tc.name       : testMuslMathFDimL003
     * @tc.desc       : test fdiml
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFDimL003', 0, async (done: Function) => {
      let a: number = 1.5;
      let b = -3.57;
      let data: Number = math.fdiml(a, b);
      expect(data).assertEqual(5.07);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FABSL_0100
     * @tc.name       : testMuslMathFAbsL001
     * @tc.desc       : test fabsl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFAbsL001', 0, async (done: Function) => {
      let a: number = 7.5;
      let data: Number = math.fabsl(a);
      expect(data).assertEqual(7.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CEIL_0100
     * @tc.name       : testMuslMathCeil001
     * @tc.desc       : test ceil
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCeil001', 0, async (done: Function) => {
      let a: number = -7.5;
      let data: Number = math.ceil(a);
      expect(data).assertEqual(-7);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CEIL_0200
     * @tc.name       : testMuslMathCeil002
     * @tc.desc       : test ceil
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCeil002', 0, async (done: Function) => {
      let a: number = 1.1;
      let data: Number = math.ceil(a);
      expect(data).assertEqual(2);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CEILF_0100
     * @tc.name       : testMuslMathCeilF001
     * @tc.desc       : test ceilf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCeilF001', 0, async (done: Function) => {
      let a: number = -7.5;
      let data: Number = math.ceilf(a);
      expect(data).assertEqual(-7);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CEILF_0200
     * @tc.name       : testMuslMathCeilF002
     * @tc.desc       : test ceilf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCeilF002', 0, async (done: Function) => {
      let a: number = 1.1;
      let data: Number = math.ceilf(a);
      expect(data).assertEqual(2);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CEILL_0100
     * @tc.name       : testMuslMathCeilL001
     * @tc.desc       : test ceill
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCeilL001', 0, async (done: Function) => {
      let a: number = -7.5;
      let data: Number = math.ceill(a);
      expect(data).assertEqual(-7);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CEILL_0200
     * @tc.name       : testMuslMathCeilL002
     * @tc.desc       : test ceill
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCeilL002', 0, async (done: Function) => {
      let a: number = 1.1;
      let data: Number = math.ceill(a);
      expect(data).assertEqual(2);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPM1F_0100
     * @tc.name       : testMuslMathExpM1f001
     * @tc.desc       : test expm1f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathExpM1f001', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPM1F_0200
     * @tc.name       : testMuslMathExpM1f002
     * @tc.desc       : test expm1f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathExpM1f002', 0, async (done: Function) => {
      let a: number = 1.0 / 0.0;
      let data: Number = math.expm1f(a);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPM1F_0300
     * @tc.name       : testMuslMathExpM1f003
     * @tc.desc       : test expm1f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathExpM1f003', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LOG_0100
     * @tc.name       : testMuslMathLog001
     * @tc.desc       : test Log
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathLog001', 0, async (done: Function) => {
      let result: number = math.log(10);
      console.info("math.log result = " + result);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(2.302585))
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LOG10_0100
     * @tc.name       : testMuslMathLog10001
     * @tc.desc       : test Log10
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathLog10001', 0, async (done: Function) => {
      let result: number = math.log10(10);
      console.info("math.log10 result = " + result);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(1))
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LOG10F_0100
     * @tc.name       : testMuslMathLog10f001
     * @tc.desc       : test Log10f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathLog10f001', 0, async (done: Function) => {
      let result: number = math.log10f(10);
      console.info("math.log10f result = " + result);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(1))
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LOG10L_0100
     * @tc.name       : testMuslMathLog10l001
     * @tc.desc       : test Log10l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathLog10l001', 0, async (done: Function) => {
      let result: number = math.log10l(10);
      console.info("math.log10l result = " + result);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(1))
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LOG1P_0100
     * @tc.name       : testMuslMathLog1p001
     * @tc.desc       : test Log1p
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathLog1p001', 0, async (done: Function) => {
      let result: number = math.log1p(1.0);
      console.info("math.log1p result = " + result);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(0.693147))
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LOG1PF_0100
     * @tc.name       : testMuslMathLog1pf001
     * @tc.desc       : test Log1pf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathLog1pf001', 0, async (done: Function) => {
      let result: number = math.log1pf(1.0);
      console.info("math.log1pf result = " + result);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(0.693147))
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LOG1PL_0100
     * @tc.name       : testMuslMathLog1pl001
     * @tc.desc       : test Log1pl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathLog1pl001', 0, async (done: Function) => {
      let result: number = math.log1pl(1.0);
      console.info("math.log1pl result = " + result);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(0.693147))
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LOG2_0100
     * @tc.name       : testMuslMathLog2001
     * @tc.desc       : test Log2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathLog2001', 0, async (done: Function) => {
      let result: number = math.log2(4);
      console.info("math.log2 result = " + result);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(2))
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LOG2F_0100
     * @tc.name       : testMuslMathLog2f001
     * @tc.desc       : test Log2f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathLog2f001', 0, async (done: Function) => {
      let result: number = math.log2f(4);
      console.info("math.log2f result = " + result);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(2))
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LOG2L_0100
     * @tc.name       : testMuslMathLog2l001
     * @tc.desc       : test Log2l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathLog2l001', 0, async (done: Function) => {
      let result: number = math.log2l(4);
      console.info("math.log2l result = " + result);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(2))
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LOGB_0100
     * @tc.name       : testMuslMathLogB001
     * @tc.desc       : test LogB
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathLogB001', 0, async (done: Function) => {
      let result: number = math.logB(8);
      console.info("math.logB result = " + result);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(3))
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LOGBF_0100
     * @tc.name       : testMuslMathLogBf001
     * @tc.desc       : test LogBf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathLogBf001', 0, async (done: Function) => {
      let result: number = math.logBf(8);
      console.info("math.logBf result = " + result);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(3))
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LOGBL_0100
     * @tc.name       : testMuslMathLogBl001
     * @tc.desc       : test LogBl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathLogBl001', 0, async (done: Function) => {
      let result: number = math.logBl(8);
      console.info("math.logBl result = " + result);
      expect(result.toFixed(0)).assertEqual(JSON.stringify(3))
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LOGF_0100
     * @tc.name       : testMuslMathLogF001
     * @tc.desc       : test LogF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathLogF001', 0, async (done: Function) => {
      let result: number = math.logF(8);
      console.info("math.logF result = " + result);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(2.079442))
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LOGL_0100
     * @tc.name       : testMuslMathLogL001
     * @tc.desc       : test LogL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathLogL001', 0, async (done: Function) => {
      let result: number = math.logL(8);
      console.info("math.logL result = " + result);
      expect(result.toFixed(6)).assertEqual(JSON.stringify(2.079442))
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SIN_0100
     * @tc.name       : testMuslMathSin001
     * @tc.desc       : test sin
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSin001', 0, async (done: Function) => {
      let b = 90;
      let c = 0.89
      let a: number = math.sin(b);
      expect(Number(a).toFixed(2)).assertEqual(c.toString());
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SIN_0200
     * @tc.name       : testMuslMathSin002
     * @tc.desc       : test sin
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSin002', 0, async (done: Function) => {
      let b = 100 / 0;
      let a: number = math.sin(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SIN_0300
     * @tc.name       : testMuslMathSin003
     * @tc.desc       : test sin
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSin003', 0, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sin(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SINF_0100
     * @tc.name       : testMuslMathSinf001
     * @tc.desc       : test sinf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSinf001', 0, async (done: Function) => {
      let b = 90;
      let c = 0.89
      let a: number = math.sinf(b);
      expect(Number(a).toFixed(2)).assertEqual(c.toString());
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SINF_0200
     * @tc.name       : testMuslMathSinf002
     * @tc.desc       : test sinf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSinf002', 0, async (done: Function) => {
      let b = 100 / 0;
      let a: number = math.sinf(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SINF_0300
     * @tc.name       : testMuslMathSinf003
     * @tc.desc       : test sinf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSinf003', 0, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sinf(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SINL_0100
     * @tc.name       : testMuslMathSinl001
     * @tc.desc       : test sinl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSinl001', 0, async (done: Function) => {
      let b = 90;
      let c = 0.89
      let a: number = math.sinl(b);
      expect(Number(a).toFixed(2)).assertEqual(c.toString());
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SINL_0200
     * @tc.name       : testMuslMathSinl002
     * @tc.desc       : test sinl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSinl002', 0, async (done: Function) => {
      let b = 100 / 0;
      let a: number = math.sinl(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SINL_0300
     * @tc.name       : testMuslMathSinl003
     * @tc.desc       : test sinl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSinl003', 0, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sinl(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SINH_0100
     * @tc.name       : testMuslMathSinh001
     * @tc.desc       : test sinh
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSinh001', 0, async (done: Function) => {
      let b = 0;
      let c = 0;
      let a: number = math.sinh(b);
      expect(a).assertEqual(c);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SINH_0200
     * @tc.name       : testMuslMathSinh002
     * @tc.desc       : test sinh
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSinh002', 0, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sinh(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SINH_0300
     * @tc.name       : testMuslMathSinh003
     * @tc.desc       : test sinh
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSinh003', 0, async (done: Function) => {
      let c = 0;
      let a: number = math.sinh(c);
      let b = (a != null)
      expect(b).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SINHF_0100
     * @tc.name       : testMuslMathSinhf001
     * @tc.desc       : test sinhf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSinhf001', 0, async (done: Function) => {
      let b = 0;
      let c = 0
      let a: number = math.sinhf(b);
      expect(a).assertEqual(c);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SINHF_0200
     * @tc.name       : testMuslMathSinhf002
     * @tc.desc       : test sinhf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSinhf002', 0, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sinhf(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SINHF_0300
     * @tc.name       : testMuslMathSinhf003
     * @tc.desc       : test sinhf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSinhf003', 0, async (done: Function) => {
      let b = 180;
      let a: number = math.sinhf(b);
      expect(a).assertEqual(100 / 0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SINHL_0100
     * @tc.name       : testMuslMathSinhl001
     * @tc.desc       : test sinhl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSinhl001', 0, async (done: Function) => {
      let b = 0;
      let c = 0
      let a: number = math.sinhl(b);
      expect(a).assertEqual(c);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SINHL_0200
     * @tc.name       : testMuslMathSinhl002
     * @tc.desc       : test sinhl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSinhl002', 0, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sinhl(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SINHL_0300
     * @tc.name       : testMuslMathSinhl003
     * @tc.desc       : test sinhl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSinhl003', 0, async (done: Function) => {
      let b = 100 / 0;
      let a: number = math.sinhl(b);
      expect(a).assertEqual(100 / 0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SQRT_0100
     * @tc.name       : testMuslMathSqrt001
     * @tc.desc       : test sqrt
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSqrt001', 0, async (done: Function) => {
      let b = 9;
      let c = 3
      let a: number = math.sqrt(b);
      expect(a).assertEqual(c);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SQRT_0200
     * @tc.name       : testMuslMathSqrt002
     * @tc.desc       : test sqrt
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSqrt002', 0, async (done: Function) => {
      let b = 100 / 0;
      let a: number = math.sqrt(b);
      expect(a).assertEqual(100 / 0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SQRT_0300
     * @tc.name       : testMuslMathSqrt003
     * @tc.desc       : test sqrt
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSqrt003', 0, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sqrt(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SQRT_0400
     * @tc.name       : testMuslMathSqrt004
     * @tc.desc       : test sqrt
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSqrt004', 0, async (done: Function) => {
      let b = -1;
      let a: number = math.sqrt(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SQRTF_0100
     * @tc.name       : testMuslMathSqrtf001
     * @tc.desc       : test sqrtf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSqrtf001', 0, async (done: Function) => {
      let b = 25.00;
      let c = 5.0
      let a: number = math.sqrtf(b);
      expect(a).assertEqual(c);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SQRTF_0200
     * @tc.name       : testMuslMathSqrtf002
     * @tc.desc       : test sqrtf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSqrtf002', 0, async (done: Function) => {
      let b = 100 / 0;
      let a: number = math.sqrtf(b);
      expect(a).assertEqual(100 / 0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SQRTF_0300
     * @tc.name       : testMuslMathSqrtf003
     * @tc.desc       : test sqrtf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSqrtf003', 0, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sqrtf(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SQRTF_0400
     * @tc.name       : testMuslMathSqrtf004
     * @tc.desc       : test sqrtf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSqrtf004', 0, async (done: Function) => {
      let b = -1;
      let a: number = math.sqrtf(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SQRTL_0100
     * @tc.name       : testMuslMathSqrtl001
     * @tc.desc       : test sqrtl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSqrtl001', 0, async (done: Function) => {
      let b = 900;
      let c = 30
      let a: number = math.sqrtl(b);
      expect(a).assertEqual(c);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SQRTL_0200
     * @tc.name       : testMuslMathSqrtl002
     * @tc.desc       : test sqrtl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSqrtl002', 0, async (done: Function) => {
      let b = +100 / 0;
      let a: number = math.sqrtl(b);
      expect(a).assertEqual(+100 / 0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SQRTL_0300
     * @tc.name       : testMuslMathSqrtl003
     * @tc.desc       : test sqrtl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSqrtl003', 0, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sqrtl(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SQRTL_0400
     * @tc.name       : testMuslMathSqrtl004
     * @tc.desc       : test sqrtl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSqrtl004', 0, async (done: Function) => {
      let b = -1;
      let a: number = math.sqrtl(b);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COS_0400
     * @tc.name       : testMuslMathCos004
     * @tc.desc       : test cos
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCos004', 0, async (done: Function) => {
      let firstParam = -30;
      let result: number = 0.87;
      let data: Number = math.cos(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COS_0500
     * @tc.name       : testMuslMathCos005
     * @tc.desc       : test cos
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCos005', 0, async (done: Function) => {
      let firstParam = 0.99;
      let result: number = 1.00;
      let data: Number = math.cos(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COS_0600
     * @tc.name       : testMuslMathCos006
     * @tc.desc       : test cos
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCos006', 0, async (done: Function) => {
      let firstParam = 179.99;
      let result: number = -1.00;
      let data: Number = math.cos(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COS_0700
     * @tc.name       : testMuslMathCos007
     * @tc.desc       : test cos
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCos007', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: Number = math.cos(firstParam);
      expect(data).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COS_0800
     * @tc.name       : testMuslMathCos008
     * @tc.desc       : test cos
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCos008', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: Number = math.cos(firstParam);
      expect(data).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ERF_0500
     * @tc.name       : testMuslMathErf005
     * @tc.desc       : test erf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathErf005', 0, async (done: Function) => {
      let firstParam = 1;
      let result: number = 0.8427;
      let data: Number = math.erf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ERF_0600
     * @tc.name       : testMuslMathErf006
     * @tc.desc       : test erf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathErf006', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let result: number = 1;
      let data: Number = math.erf(firstParam);
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ERF_0700
     * @tc.name       : testMuslMathErf007
     * @tc.desc       : test erf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathErf007', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let result: number = -1;
      let data: Number = math.erf(firstParam);
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COPYSIGN_0400
     * @tc.name       : testMuslMathCopySign004
     * @tc.desc       : test copysign
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCopySign004', 0, async (done: Function) => {
      let firstParam = 11;
      let secondParam = 2;
      let data: Number = math.copysign(firstParam, secondParam);
      expect(data).assertEqual(11);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COPYSIGN_0500
     * @tc.name       : testMuslMathCopySign005
     * @tc.desc       : test copysign
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCopySign005', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = -2;
      let data: Number = math.copysign(firstParam, secondParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COPYSIGN_0600
     * @tc.name       : testMuslMathCopySign006
     * @tc.desc       : test copysign
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCopySign006', 0, async (done: Function) => {
      let firstParam = 11;
      let secondParam = -1.0 / 0.0;
      let data: Number = math.copysign(firstParam, secondParam);
      expect(data).assertEqual(-11);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXP_0300
     * @tc.name       : testMuslMathExp003
     * @tc.desc       : test exp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathExp003', 0, async (done: Function) => {
      let firstParam = 1;
      let result: number = 2.71828;
      let data: Number = math.exp(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXP_0400
     * @tc.name       : testMuslMathExp004
     * @tc.desc       : test exp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathExp004', 0, async (done: Function) => {
      let firstParam = 1.19;
      let result: number = 3.28708;
      let data: Number = math.exp(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXP_0500
     * @tc.name       : testMuslMathExp005
     * @tc.desc       : test exp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathExp005', 0, async (done: Function) => {
      let firstParam = -1.19;
      let result: number = 0.30422;
      let data: Number = math.exp(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXP_0600
     * @tc.name       : testMuslMathExp006
     * @tc.desc       : test exp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathExp006', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let result: number = 0;
      let data: Number = math.exp(firstParam);
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXP_0700
     * @tc.name       : testMuslMathExp007
     * @tc.desc       : test exp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathExp007', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: Number = math.exp(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FABS_0200
     * @tc.name       : testMuslMathFabs002
     * @tc.desc       : test fabs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFabs002', 0, async (done: Function) => {
      let firstParam = -7.5;
      let data: Number = math.fabs(firstParam);
      expect(data).assertEqual(7.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FABS_0300
     * @tc.name       : testMuslMathFabs003
     * @tc.desc       : test fabs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFabs003', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: Number = math.fabs(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FABS_0400
     * @tc.name       : testMuslMathFabs004
     * @tc.desc       : test fabs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFabs004', 0, async (done: Function) => {
      let firstParam = -0;
      let data: Number = math.fabs(firstParam);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FDIM_0400
     * @tc.name       : testMuslMathFDim004
     * @tc.desc       : test fdim
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFDim004', 0, async (done: Function) => {
      let firstParam = 0;
      let secondParam = 0;
      let data: Number = math.fdim(firstParam, secondParam);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FDIM_0500
     * @tc.name       : testMuslMathFDim005
     * @tc.desc       : test fdim
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFDim005', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = -1.0 / 0.0;
      let data: Number = math.fdim(firstParam, secondParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FLOOR_0300
     * @tc.name       : testMuslMathFloor003
     * @tc.desc       : test floor
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFloor003', 0, async (done: Function) => {
      let firstParam = 0;
      let data: Number = math.floor(firstParam);
      expect(data).assertEqual(firstParam);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FLOOR_0400
     * @tc.name       : testMuslMathFloor004
     * @tc.desc       : test floor
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFloor004', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: Number = math.floor(firstParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FLOOR_0500
     * @tc.name       : testMuslMathFloor005
     * @tc.desc       : test floor
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFloor005', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: Number = math.floor(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMA_0300
     * @tc.name       : testMuslMathFma003
     * @tc.desc       : test fma
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFma003', 0, async (done: Function) => {
      let firstParam = 0;
      let secondParam = 2;
      let thirdParam = 2.5;
      let data: Number = math.fma(firstParam, secondParam, thirdParam);
      expect(data).assertEqual(2.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMA_0400
     * @tc.name       : testMuslMathFma004
     * @tc.desc       : test fma
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFma004', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = 2;
      let thirdParam = 2.5;
      let data: Number = math.fma(firstParam, secondParam, thirdParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMA_0500
     * @tc.name       : testMuslMathFma005
     * @tc.desc       : test fma
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFma005', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let secondParam = 2;
      let thirdParam = 2.5;
      let data: Number = math.fma(firstParam, secondParam, thirdParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMA_0600
     * @tc.name       : testMuslMathFma006
     * @tc.desc       : test fma
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFma006', 0, async (done: Function) => {
      let firstParam = 2.5;
      let secondParam = 2;
      let thirdParam = -1.0 / 0.0;
      let data: Number = math.fma(firstParam, secondParam, thirdParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMA_0700
     * @tc.name       : testMuslMathFma007
     * @tc.desc       : test fma
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFma007', 0, async (done: Function) => {
      let firstParam = 2.5;
      let secondParam = 2;
      let thirdParam = 1.0 / 0.0;
      let data: Number = math.fma(firstParam, secondParam, thirdParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAX_0400
     * @tc.name       : testMuslMathFMax004
     * @tc.desc       : test fmax
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFMax004', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = 1.0 / 0.0;
      let data: Number = math.fmax(firstParam, secondParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAX_0500
     * @tc.name       : testMuslMathFMax005
     * @tc.desc       : test fmax
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFMax005', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let secondParam = -1.0 / 0.0;
      let data: Number = math.fmax(firstParam, secondParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMIN_0400
     * @tc.name       : testMuslMathFmin004
     * @tc.desc       : test fmin
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmin004', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = 1.0 / 0.0;
      let data: Number = math.fmin(firstParam, secondParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMIN_0500
     * @tc.name       : testMuslMathFmin005
     * @tc.desc       : test fmin
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmin005', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let secondParam = -1.0 / 0.0;
      let data: Number = math.fmin(firstParam, secondParam);
      expect(data).assertNegUnlimited()
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMOD_0500
     * @tc.name       : testMuslMathFmod005
     * @tc.desc       : test fmod
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmod005', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = -3;
      let data: Number = math.fmod(firstParam, secondParam);
      expect(data).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMOD_0600
     * @tc.name       : testMuslMathFmod006
     * @tc.desc       : test fmod
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmod006', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let secondParam = -3;
      let data: Number = math.fmod(firstParam, secondParam);
      expect(data).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMOD_0700
     * @tc.name       : testMuslMathFmod007
     * @tc.desc       : test fmod
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmod007', 0, async (done: Function) => {
      let firstParam = 12.19;
      let secondParam = -1.0 / 0.0;
      let result: number = 12.19;
      let data: Number = math.fmod(firstParam, secondParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FABSF_0200
     * @tc.name       : testMuslMathFAbsF002
     * @tc.desc       : test fabsf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFAbsF002', 0, async (done: Function) => {
      let firstParam = 7.5;
      let data: Number = math.fabsf(firstParam);
      expect(data).assertEqual(7.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FABSF_0300
     * @tc.name       : testMuslMathFAbsF003
     * @tc.desc       : test fabsf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFAbsF003', 0, async (done: Function) => {
      let firstParam = -0;
      let data: Number = math.fabsf(firstParam);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FABSF_0400
     * @tc.name       : testMuslMathFAbsF004
     * @tc.desc       : test fabsf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFAbsF004', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: Number = math.fabsf(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSH_0400
     * @tc.name       : testMuslMathCosh004
     * @tc.desc       : test cosh
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCosh004', 0, async (done: Function) => {
      let firstParam = -60;
      let result: number = 1.60;
      let data: Number = math.cosh(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSH_0500
     * @tc.name       : testMuslMathCosh005
     * @tc.desc       : test cosh
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCosh005', 0, async (done: Function) => {
      let firstParam = 0.99;
      let result: number = 1.00;
      let data: Number = math.cosh(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSH_0600
     * @tc.name       : testMuslMathCosh006
     * @tc.desc       : test cosh
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCosh006', 0, async (done: Function) => {
      let firstParam = 179.99;
      let result: number = 11.59;
      let data: Number = math.cosh(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSH_0700
     * @tc.name       : testMuslMathCosh007
     * @tc.desc       : test cosh
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCosh007', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: Number = math.cosh(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSH_0800
     * @tc.name       : testMuslMathCosh008
     * @tc.desc       : test cosh
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCosh008', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: Number = math.cosh(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXP2_0400
     * @tc.name       : testMuslMathExp2004
     * @tc.desc       : test exp2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathExp2004', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXP2_0500
     * @tc.name       : testMuslMathExp2005
     * @tc.desc       : test exp2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathExp2005', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPM1_0400
     * @tc.name       : testMuslMathExpM1004
     * @tc.desc       : test expm1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathExpM1004', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPM1_0500
     * @tc.name       : testMuslMathExpM1005
     * @tc.desc       : test expm1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathExpM1005', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPM1_0600
     * @tc.name       : testMuslMathExpM1006
     * @tc.desc       : test expm1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathExpM1006', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPM1_0700
     * @tc.name       : testMuslMathExpM1007
     * @tc.desc       : test expm1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathExpM1007', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMODF_0400
     * @tc.name       : testMuslMathFmodF004
     * @tc.desc       : test fmodf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmodF004', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = 3.5;
      let data: Number = math.fmodf(firstParam, secondParam);
      expect(data).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMODF_0500
     * @tc.name       : testMuslMathFmodF005
     * @tc.desc       : test fmodf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmodF005', 0, async (done: Function) => {
      let firstParam = -4.7;
      let secondParam = -2.3;
      let result: number = -0.10;
      let data: Number = math.fmodf(firstParam, secondParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMODF_0600
     * @tc.name       : testMuslMathFmodF006
     * @tc.desc       : test fmodf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmodF006', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMODF_0700
     * @tc.name       : testMuslMathFmodF007
     * @tc.desc       : test fmodf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmodF007', 0, async (done: Function) => {
      let firstParam = 4.7;
      let secondParam = -1.0 / 0.0;
      let result: number = 4.7;
      let data: Number = math.fmodf(firstParam, secondParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMODL_0400
     * @tc.name       : testMuslMathFmodL004
     * @tc.desc       : test fmodl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmodL004', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = 3.5;
      let data: Number = math.fmodl(firstParam, secondParam);
      expect(data).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMODL_0500
     * @tc.name       : testMuslMathFmodL005
     * @tc.desc       : test fmodl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmodL005', 0, async (done: Function) => {
      let firstParam = -4.7;
      let secondParam = -2.3;
      let result: number = -0.10;
      let data: Number = math.fmodl(firstParam, secondParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMODL_0600
     * @tc.name       : testMuslMathFmodL006
     * @tc.desc       : test fmodl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmodL006', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMODL_0700
     * @tc.name       : testMuslMathFmodL007
     * @tc.desc       : test fmodl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmodL007', 0, async (done: Function) => {
      let firstParam = 4.7;
      let secondParam = -1.0 / 0.0;
      let result: number = 4.7;
      let data: Number = math.fmodl(firstParam, secondParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMINF_0400
     * @tc.name       : testMuslMathFMinF004
     * @tc.desc       : test fminf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFMinF004', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = 1.0 / 0.0;
      let data: Number = math.fminf(firstParam, secondParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMINF_0500
     * @tc.name       : testMuslMathFMinF005
     * @tc.desc       : test fminf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFMinF005', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let secondParam = -1.0 / 0.0;
      let data: Number = math.fminf(firstParam, secondParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMINL_0400
     * @tc.name       : testMuslMathFMinL004
     * @tc.desc       : test fminl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFMinL004', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = 1.0 / 0.0;
      let data: Number = math.fminl(firstParam, secondParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMINL_0500
     * @tc.name       : testMuslMathFMinL005
     * @tc.desc       : test fminl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFMinL005', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let secondParam = -1.0 / 0.0;
      let data: Number = math.fminl(firstParam, secondParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAXF_0400
     * @tc.name       : testMuslMathFMaxF004
     * @tc.desc       : test fmaxf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFMaxF004', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = 1.0 / 0.0;
      let data: Number = math.fmaxf(firstParam, secondParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAXF_0500
     * @tc.name       : testMuslMathFMaxF005
     * @tc.desc       : test fmaxf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFMaxF005', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let secondParam = -1.0 / 0.0;
      let data: Number = math.fmaxf(firstParam, secondParam);
      expect(data).assertNegUnlimited()
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAXL_0400
     * @tc.name       : testMuslMathFMaxL004
     * @tc.desc       : test fmaxl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFMaxL004', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = 1.0 / 0.0;
      let data: Number = math.fmaxl(firstParam, secondParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAXL_0500
     * @tc.name       : testMuslMathFMaxL005
     * @tc.desc       : test fmaxl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFMaxL005', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let secondParam = -1.0 / 0.0;
      let data: Number = math.fmaxl(firstParam, secondParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAF_0300
     * @tc.name       : testMuslMathFmaF003
     * @tc.desc       : test fmaf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmaF003', 0, async (done: Function) => {
      let firstParam = 0;
      let secondParam = 2;
      let thirdParam = 2.5;
      let data: Number = math.fmaf(firstParam, secondParam, thirdParam);
      expect(data).assertEqual(2.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAF_0400
     * @tc.name       : testMuslMathFmaF004
     * @tc.desc       : test fmaf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmaF004', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = 2;
      let thirdParam = 2.5;
      let data: Number = math.fmaf(firstParam, secondParam, thirdParam);
      expect(data).assertPosUnlimited()
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAF_0500
     * @tc.name       : testMuslMathFmaF005
     * @tc.desc       : test fmaf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmaF005', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let secondParam = 2;
      let thirdParam = 2.5;
      let data: Number = math.fmaf(firstParam, secondParam, thirdParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAF_0600
     * @tc.name       : testMuslMathFmaF006
     * @tc.desc       : test fmaf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmaF006', 0, async (done: Function) => {
      let firstParam = 2.5;
      let secondParam = 2;
      let thirdParam = -1.0 / 0.0;
      let data: Number = math.fmaf(firstParam, secondParam, thirdParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAF_0700
     * @tc.name       : testMuslMathFmaF007
     * @tc.desc       : test fmaf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmaF007', 0, async (done: Function) => {
      let firstParam = 2.5;
      let secondParam = 2;
      let thirdParam = 1.0 / 0.0;
      let data: Number = math.fmaf(firstParam, secondParam, thirdParam);
      expect(data).assertPosUnlimited()
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAL_0300
     * @tc.name       : testMuslMathFmaL003
     * @tc.desc       : test fmal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmaL003', 0, async (done: Function) => {
      let firstParam = 0;
      let secondParam = 2;
      let thirdParam = 2.5;
      let data: Number = math.fmal(firstParam, secondParam, thirdParam);
      expect(data).assertEqual(2.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAL_0400
     * @tc.name       : testMuslMathFmaL004
     * @tc.desc       : test fmal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmaL004', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = 2;
      let thirdParam = 2.5;
      let data: Number = math.fmal(firstParam, secondParam, thirdParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAL_0500
     * @tc.name       : testMuslMathFmaL005
     * @tc.desc       : test fmal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmaL005', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let secondParam = 2;
      let thirdParam = 2.5;
      let data: Number = math.fmal(firstParam, secondParam, thirdParam);
      expect(data).assertNegUnlimited()
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAL_0600
     * @tc.name       : testMuslMathFmaL006
     * @tc.desc       : test fmal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmaL006', 0, async (done: Function) => {
      let firstParam = 2.5;
      let secondParam = 2;
      let thirdParam = -1.0 / 0.0;
      let data: Number = math.fmal(firstParam, secondParam, thirdParam);
      expect(data).assertNegUnlimited()
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FMAL_0700
     * @tc.name       : testMuslMathFmaL007
     * @tc.desc       : test fmal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFmaL007', 0, async (done: Function) => {
      let firstParam = 2.5;
      let secondParam = 2;
      let thirdParam = 1.0 / 0.0;
      let data: Number = math.fmal(firstParam, secondParam, thirdParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FLOORF_0300
     * @tc.name       : testMuslMathFloorF003
     * @tc.desc       : test floorf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFloorF003', 0, async (done: Function) => {
      let firstParam = 0;
      let result: number = 0;
      let data: Number = math.floorf(firstParam);
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FLOORF_0400
     * @tc.name       : testMuslMathFloorF004
     * @tc.desc       : test floorf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFloorF004', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: Number = math.floorf(firstParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FLOORF_0500
     * @tc.name       : testMuslMathFloorF005
     * @tc.desc       : test floorf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFloorF005', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: Number = math.floorf(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FLOORL_0300
     * @tc.name       : testMuslMathFloorL003
     * @tc.desc       : test floorl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFloorL003', 0, async (done: Function) => {
      let firstParam = 0;
      let result: number = 0;
      let data: Number = math.floorl(firstParam);
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FLOORL_0400
     * @tc.name       : testMuslMathFloorL004
     * @tc.desc       : test floorl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFloorL004', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: Number = math.floorl(firstParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FLOORL_0500
     * @tc.name       : testMuslMathFloorL005
     * @tc.desc       : test floorl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFloorL005', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: Number = math.floorl(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FDIMF_0400
     * @tc.name       : testMuslMathFDimF004
     * @tc.desc       : test fdimf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFDimF004', 0, async (done: Function) => {
      let firstParam = 0;
      let secondParam = 0;
      let data: Number = math.fdimf(firstParam, secondParam);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FDIMF_0500
     * @tc.name       : testMuslMathFDimF005
     * @tc.desc       : test fdimf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFDimF005', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = -1.0 / 0.0;
      let data: Number = math.fdimf(firstParam, secondParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FDIML_0400
     * @tc.name       : testMuslMathFDimL004
     * @tc.desc       : test fdiml
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFDimL004', 0, async (done: Function) => {
      let firstParam = 0;
      let secondParam = 0;
      let data: Number = math.fdiml(firstParam, secondParam);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FDIML_0500
     * @tc.name       : testMuslMathFDimL005
     * @tc.desc       : test fdiml
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFDimL005', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = -1.0 / 0.0;
      let data: Number = math.fdiml(firstParam, secondParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FABSL_0200
     * @tc.name       : testMuslMathFAbsL002
     * @tc.desc       : test fabsl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFAbsL002', 0, async (done: Function) => {
      let firstParam = -7.5;
      let data: Number = math.fabsl(firstParam);
      expect(data).assertEqual(7.5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FABSL_0300
     * @tc.name       : testMuslMathFAbsL003
     * @tc.desc       : test fabsl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFAbsL003', 0, async (done: Function) => {
      let firstParam = -0;
      let data: Number = math.fabsl(firstParam);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FABSL_0400
     * @tc.name       : testMuslMathFAbsL004
     * @tc.desc       : test fabsl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFAbsL004', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: Number = math.fabsl(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CEIL_0300
     * @tc.name       : testMuslMathCeil003
     * @tc.desc       : test ceil
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCeil003', 0, async (done: Function) => {
      let firstParam = 0;
      let data: Number = math.ceil(firstParam);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CEIL_0400
     * @tc.name       : testMuslMathCeil004
     * @tc.desc       : test ceil
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCeil004', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: Number = math.ceil(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CEIL_0500
     * @tc.name       : testMuslMathCeil005
     * @tc.desc       : test ceil
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCeil005', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: Number = math.ceil(firstParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CEILF_0300
     * @tc.name       : testMuslMathCeilF003
     * @tc.desc       : test ceilf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCeilF003', 0, async (done: Function) => {
      let firstParam = 0;
      let data: Number = math.ceilf(firstParam);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CEILF_0400
     * @tc.name       : testMuslMathCeilF004
     * @tc.desc       : test ceilf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCeilF004', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: Number = math.ceilf(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CEILF_0500
     * @tc.name       : testMuslMathCeilF005
     * @tc.desc       : test ceilf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCeilF005', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: Number = math.ceilf(firstParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CEILL_0300
     * @tc.name       : testMuslMathCeilL003
     * @tc.desc       : test ceill
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCeilL003', 0, async (done: Function) => {
      let firstParam = 0;
      let data: Number = math.ceill(firstParam);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CEILL_0400
     * @tc.name       : testMuslMathCeilL004
     * @tc.desc       : test ceill
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCeilL004', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: Number = math.ceill(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CEILL_0500
     * @tc.name       : testMuslMathCeilL005
     * @tc.desc       : test ceill
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathCeilL005', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: Number = math.ceill(firstParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPM1F_0400
     * @tc.name       : testMuslMathExpM1f004
     * @tc.desc       : test expm1f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathExpM1f004', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPM1F_0500
     * @tc.name       : testMuslMathExpM1f005
     * @tc.desc       : test expm1f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathExpM1f005', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPM1F_0600
     * @tc.name       : testMuslMathExpM1f006
     * @tc.desc       : test expm1f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathExpM1f006', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPM1F_0700
     * @tc.name       : testMuslMathExpM1f007
     * @tc.desc       : test expm1f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathExpM1f007', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2L_0500
     * @tc.name       : testMuslMathATan2L005
     * @tc.desc       : test ATan2L
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2L005', 0, async (done: Function) => {
      let Param0 = Math.sqrt(-1);
      let Param1 = -1;
      let result: number = math.aTan2L(Param0, Param1);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2L_0600
     * @tc.name       : testMuslMathATan2L006
     * @tc.desc       : test ATan2L
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2L006', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 0;
      let Param1 = 0;
      let result: number = math.aTan2L(Param0, Param1);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2L_0700
     * @tc.name       : testMuslMathATan2L007
     * @tc.desc       : test ATan2L
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2L007', 0, async (done: Function) => {
      let resultTrue: string = (Math.PI / 4).toFixed(2);
      let Param0 = 1.0 / 0.0;
      let Param1 = 1.0 / 0.0;
      let result: string = (math.aTan2L(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2L_0800
     * @tc.name       : testMuslMathATan2L008
     * @tc.desc       : test ATan2L
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2L008', 0, async (done: Function) => {
      let resultTrue: string = (Math.PI * 3 / 4).toFixed(2);
      let Param0 = 1.0 / 0.0;
      let Param1 = -1.0 / 0.0;
      let result: string = (math.aTan2L(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2L_0900
     * @tc.name       : testMuslMathATan2L009
     * @tc.desc       : test ATan2L
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2L009', 0, async (done: Function) => {
      let resultTrue: string = (-Math.PI / 4).toFixed(2);
      let Param0 = -1.0 / 0.0;
      let Param1 = 1.0 / 0.0;
      let result: string = (math.aTan2L(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2L_1000
     * @tc.name       : testMuslMathATan2L010
     * @tc.desc       : test ATan2L
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2L010', 0, async (done: Function) => {
      let resultTrue: string = (-3 * Math.PI / 4).toFixed(2);
      let Param0 = -1.0 / 0.0;
      let Param1 = -1.0 / 0.0;
      let result: string = (math.aTan2L(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2L_1100
     * @tc.name       : testMuslMathATan2L011
     * @tc.desc       : test ATan2L
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2L011', 0, async (done: Function) => {
      let resultTrue: string = (-Math.PI / 2).toFixed(2);
      let Param0 = -1.0 / 0.0;
      let Param1 = 2;
      let result: string = (math.aTan2L(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2L_1200
     * @tc.name       : testMuslMathATan2L012
     * @tc.desc       : test ATan2L
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2L012', 0, async (done: Function) => {
      let resultTrue: string = (Math.PI / 2).toFixed(2);
      let Param0 = 1.0 / 0.0;
      let Param1 = 2;
      let result: string = (math.aTan2L(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2L_1300
     * @tc.name       : testMuslMathATan2L013
     * @tc.desc       : test ATan2L
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2L013', 0, async (done: Function) => {
      let resultTrue: string = (Math.PI).toFixed(2);
      let Param0 = 2;
      let Param1 = -1.0 / 0.0;
      let result: string = (math.aTan2L(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2L_1400
     * @tc.name       : testMuslMathATan2L014
     * @tc.desc       : test ATan2L
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2L014', 0, async (done: Function) => {
      let resultTrue: string = (-Math.PI).toFixed(2);
      let Param0 = -2;
      let Param1 = -1.0 / 0.0;
      let result: string = (math.aTan2L(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2L_1500
     * @tc.name       : testMuslMathATan2L015
     * @tc.desc       : test ATan2L
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2L015', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 2;
      let Param1 = 1.0 / 0.0;
      let result: number = math.aTan2L(Param0, Param1);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2F_1100
     * @tc.name       : testMuslMathATan2F011
     * @tc.desc       : test ATan2F
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2F011', 0, async (done: Function) => {
      let resultTrue: string = (-Math.PI / 2).toFixed(2);
      let Param0 = -1.0 / 0.0;
      let Param1 = 2;
      let result: string = (math.aTan2F(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2F_1200
     * @tc.name       : testMuslMathATan2F012
     * @tc.desc       : test ATan2F
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2F012', 0, async (done: Function) => {
      let resultTrue: string = (Math.PI / 2).toFixed(2);
      let Param0 = 1.0 / 0.0;
      let Param1 = 2;
      let result: string = (math.aTan2F(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2F_1300
     * @tc.name       : testMuslMathATan2F013
     * @tc.desc       : test ATan2F
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2F013', 0, async (done: Function) => {
      let resultTrue: string = (Math.PI).toFixed(2);
      let Param0 = 2;
      let Param1 = -1.0 / 0.0;
      let result: string = (math.aTan2F(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2F_1400
     * @tc.name       : testMuslMathATan2F014
     * @tc.desc       : test ATan2F
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2F014', 0, async (done: Function) => {
      let resultTrue: string = (-Math.PI).toFixed(2);
      let Param0 = -2;
      let Param1 = -1.0 / 0.0;
      let result: string = (math.aTan2F(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2F_1500
     * @tc.name       : testMuslMathATan2F015
     * @tc.desc       : test ATan2F
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2F015', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 2;
      let Param1 = 1.0 / 0.0;
      let result: number = math.aTan2F(Param0, Param1);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2_1100
     * @tc.name       : testMuslMathATan2011
     * @tc.desc       : test ATan2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2011', 0, async (done: Function) => {
      let resultTrue: string = (-Math.PI / 2).toFixed(2);
      let Param0 = -1.0 / 0.0;
      let Param1 = 2;
      let result: string = (math.aTan2(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2_1200
     * @tc.name       : testMuslMathATan2012
     * @tc.desc       : test ATan2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2012', 0, async (done: Function) => {
      let resultTrue: string = (Math.PI / 2).toFixed(2);
      let Param0 = 1.0 / 0.0;
      let Param1 = 2;
      let result: string = (math.aTan2(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2_1300
     * @tc.name       : testMuslMathATan2013
     * @tc.desc       : test ATan2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2013', 0, async (done: Function) => {
      let resultTrue: string = (Math.PI).toFixed(2);
      let Param0 = 2;
      let Param1 = -1.0 / 0.0;
      let result: string = (math.aTan2(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2_1400
     * @tc.name       : testMuslMathATan2014
     * @tc.desc       : test ATan2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2014', 0, async (done: Function) => {
      let resultTrue: string = (-Math.PI).toFixed(2);
      let Param0 = -2;
      let Param1 = -1.0 / 0.0;
      let result: string = (math.aTan2(Param0, Param1)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATAN2_1500
     * @tc.name       : testMuslMathATan2015
     * @tc.desc       : test ATan2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATan2015', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 2;
      let Param1 = 1.0 / 0.0;
      let result: number = math.aTan2(Param0, Param1);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATANH_0100
     * @tc.name       : testMuslMathATanH001
     * @tc.desc       : test ATanH
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATanH001', 0, async (done: Function) => {
      let Param0 = 1;
      let result: number = math.aTanH(Param0);
      expect(result).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATANH_0200
     * @tc.name       : testMuslMathATanH002
     * @tc.desc       : test ATanH
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATanH002', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 0;
      let result: number = math.aTanH(Param0);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATANH_0300
     * @tc.name       : testMuslMathATanH003
     * @tc.desc       : test ATanH
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATanH003', 0, async (done: Function) => {
      let Param0 = 3;
      let result: number = math.aTanH(Param0);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATANH_0400
     * @tc.name       : testMuslMathATanH004
     * @tc.desc       : test ATanH
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATanH004', 0, async (done: Function) => {
      let Param0 = -1;
      let result: number = math.aTanH(Param0);
      expect(result).assertNegUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATANH_0500
     * @tc.name       : testMuslMathATanH005
     * @tc.desc       : test ATanH
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATanH005', 0, async (done: Function) => {
      let resultTrue: string = Number(0.55).toFixed(2);
      let Param0 = 1 / 2;
      let result: string = Number(math.aTanH(Param0)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATANHF_0100
     * @tc.name       : testMuslMathATanHF001
     * @tc.desc       : test ATanHF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATanHF001', 0, async (done: Function) => {
      let Param0 = 1;
      let result: number = math.aTanHF(Param0);
      expect(result).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATANHF_0200
     * @tc.name       : testMuslMathATanHF002
     * @tc.desc       : test ATanHF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATanHF002', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 0;
      let result: number = math.aTanHF(Param0);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATANHF_0300
     * @tc.name       : testMuslMathATanHF003
     * @tc.desc       : test ATanHF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATanHF003', 0, async (done: Function) => {
      let Param0 = 3;
      let result: number = math.aTanHF(Param0);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATANHF_0400
     * @tc.name       : testMuslMathATanHF004
     * @tc.desc       : test ATanHF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATanHF004', 0, async (done: Function) => {
      let Param0 = -1;
      let result: number = math.aTanHF(Param0);
      expect(result).assertNegUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATANHF_0500
     * @tc.name       : testMuslMathATanHF005
     * @tc.desc       : test ATanHF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATanHF005', 0, async (done: Function) => {
      let resultTrue: string = Number(0.55).toFixed(2);
      let Param0 = 1 / 2;
      let result: string = Number(math.aTanHF(Param0)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATANHL_0100
     * @tc.name       : testMuslMathATanHL001
     * @tc.desc       : test ATanHL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATanHL001', 0, async (done: Function) => {
      let Param0 = 1;
      let result: number = math.aTanHL(Param0);
      expect(result).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATANHL_0200
     * @tc.name       : testMuslMathATanHL002
     * @tc.desc       : test ATanHL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATanHL002', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 0;
      let result: number = math.aTanHL(Param0);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATANHL_0300
     * @tc.name       : testMuslMathATanHL003
     * @tc.desc       : test ATanHL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATanHL003', 0, async (done: Function) => {
      let Param0 = 3;
      let result: number = math.aTanHL(Param0);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATANHL_0400
     * @tc.name       : testMuslMathATanHL004
     * @tc.desc       : test ATanHL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATanHL004', 0, async (done: Function) => {
      let Param0 = -1;
      let result: number = math.aTanHL(Param0);
      expect(result).assertNegUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ATANHL_0500
     * @tc.name       : testMuslMathATanHL005
     * @tc.desc       : test ATanHL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathATanHL005', 0, async (done: Function) => {
      let resultTrue: string = Number(0.55).toFixed(2);
      let Param0 = 1 / 2;
      let result: string = Number(math.aTanHL(Param0)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_MODF_0100
     * @tc.name       : testMuslMathMODF001
     * @tc.desc       : test modF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathMODF001', 0, async (done: Function) => {
      let Param0 = 1.59;
      let result: number = math.modF(Param0);
      expect(result).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_MODFF_0100
     * @tc.name       : testMuslMathModFf001
     * @tc.desc       : test modFf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathModFf001', 0, async (done: Function) => {
      let Param0 = 1.59;
      let result: number = math.modFf(Param0);
      expect(result).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_MODFL_0100
     * @tc.name       : testMuslMathMODFl001
     * @tc.desc       : test modFl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathMODFl001', 0, async (done: Function) => {
      let Param0 = 1.59;
      let result: number = math.modFl(Param0);
      expect(result).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_MRAND48_0100
     * @tc.name       : testMuslMathMRand48001
     * @tc.desc       : test mrand48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathMRand48001', 0, async (done: Function) => {
      let result: number = math.mRand48();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_POW_0100
     * @tc.name       : testMuslMathPow001
     * @tc.desc       : test pow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathPow001', 0, async (done: Function) => {
      let a: number = 2;
      let b = 3;
      let data: Number = math.pow(a, b);
      console.info("math.pow data = \"" + data + "\"");
      expect(data).assertEqual(8);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_POW_0200
     * @tc.name       : testMuslMathPow002
     * @tc.desc       : test pow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathPow002', 0, async (done: Function) => {

      let a: number = 0.5, b = 0.3;
      let data: Number = math.pow(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data.toFixed(6)).assertEqual(JSON.stringify(0.812252));
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_POW_0300
     * @tc.name       : testMuslMathPow003
     * @tc.desc       : test pow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathPow003', 0, async (done: Function) => {
      let a: number = 0, b = 0;
      let data: Number = math.pow(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_POWF_0100
     * @tc.name       : testMuslMathPowf001
     * @tc.desc       : test powf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathPowf001', 0, async (done: Function) => {
      let a: number = -1, b = -2;
      let data: Number = math.powf(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_POWF_0200
     * @tc.name       : testMuslMathPowf002
     * @tc.desc       : test powf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathPowf002', 0, async (done: Function) => {

      let a: number = 4, b = 2;
      let data: Number = math.powf(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(16);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_POWF_0300
     * @tc.name       : testMuslMathPowf003
     * @tc.desc       : test powf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathPowf003', 0, async (done: Function) => {

      let a: number = 2.12, b = 3.24;
      let data: Number = math.powf(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data.toFixed(6)).assertEqual(JSON.stringify(11.411116));
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_POWL_0100
     * @tc.name       : testMuslMathPowl001
     * @tc.desc       : test powl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathPowl001', 0, async (done: Function) => {

      let a: number = 2.12, b = 3.24;
      let data: Number = math.powl(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data.toFixed(6)).assertEqual(JSON.stringify(11.411118));
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_POWL_0200
     * @tc.name       : testMuslMathPowl002
     * @tc.desc       : test powl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathPowl002', 0, async (done: Function) => {

      let a: number = 0, b = 0;
      let data: Number = math.powl(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_POWL_0300
     * @tc.name       : testMuslMathPowl003
     * @tc.desc       : test powl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathPowl003', 0, async (done: Function) => {
      let a: number = -2, b = 3;
      let data: Number = math.powl(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(-8);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEXTAFTER_0100
     * @tc.name       : testMuslMathNextafter001
     * @tc.desc       : test nextafter
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNextafter001', 0, async (done: Function) => {
      let a: number = 1, b = 1;
      let data: Number = math.nextafter(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEXTAFTER_0200
     * @tc.name       : testMuslMathNextafter002
     * @tc.desc       : test nextafter
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNextafter002', 0, async (done: Function) => {
      let a: number = 1, b = Math.sqrt(-1);
      let data: Number = math.nextafter(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEXTAFTER_0300
     * @tc.name       : testMuslMathNextafter003
     * @tc.desc       : test nextafter
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNextafter003', 0, async (done: Function) => {
      let a: number = 0.0, b = 0.1;
      let data: Number = math.nextafter(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect((data == 5e-324)||(data == 0)||(data == 1.401298464324817e-45)).assertEqual(true);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEXTAFTERF_0100
     * @tc.name       : testMuslMathNextafterf001
     * @tc.desc       : test nextafterf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNextafterf001', 0, async (done: Function) => {
      let a: number = 1, b = 1;
      let data: Number = math.nextafterf(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEXTAFTERF_0200
     * @tc.name       : testMuslMathNextafterf002
     * @tc.desc       : test nextafterf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNextafterf002', 0, async (done: Function) => {
      let a: number = 1, b = Math.sqrt(-1);
      let data: Number = math.nextafterf(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEXTAFTERF_0300
     * @tc.name       : testMuslMathNextafterf003
     * @tc.desc       : test nextafterf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNextafterf003', 0, async (done: Function) => {
      let a: number = 0.0, b = 0.1;
      let data: Number = math.nextafterf(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect((data == 5e-324)||(data == 0)||(data == 1.401298464324817e-45)).assertEqual(true);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEXTAFTERL_0100
     * @tc.name       : testMuslMathNextafterl001
     * @tc.desc       : test nextafterl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNextafterl001', 0, async (done: Function) => {
      let a: number = 1, b = 1;
      let data: Number = math.nextafterl(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEXTAFTERL_0200
     * @tc.name       : testMuslMathNextafterl002
     * @tc.desc       : test nextafterl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNextafterl002', 0, async (done: Function) => {
      let a: number = 1, b = Math.sqrt(-1);
      let data: Number = math.nextafterl(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEXTAFTERL_0300
     * @tc.name       : testMuslMathNextafterl003
     * @tc.desc       : test nextafterl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNextafterl003', 0, async (done: Function) => {
      let a: number = 0.0, b = 0.1;
      let data: Number = math.nextafterl(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect((data == 5e-324)||(data == 0)||(data == 1.401298464324817e-45)).assertEqual(true);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEARBYINT_0100
     * @tc.name       : testMuslMathNearbyint001
     * @tc.desc       : test nearbyint
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNearbyint001', 0, async (done: Function) => {
      let a: number = 2.2;
      let data: Number = math.nearbyint(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(2);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEARBYINT_0200
     * @tc.name       : testMuslMathNearbyint002
     * @tc.desc       : test nearbyint
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNearbyint002', 0, async (done: Function) => {
      let a: number = 2.6;
      let data: Number = math.nearbyint(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(3);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEARBYINT_0300
     * @tc.name       : testMuslMathNearbyint003
     * @tc.desc       : test nearbyint
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNearbyint003', 0, async (done: Function) => {
      let a: number = -2.2;
      let data: Number = math.nearbyint(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(-2);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEARBYINT_0400
     * @tc.name       : testMuslMathNearbyint004
     * @tc.desc       : test nearbyint
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNearbyint004', 0, async (done: Function) => {
      let a: number = -2.6;
      let data: Number = math.nearbyint(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(-3);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEARBYINT_0500
     * @tc.name       : testMuslMathNearbyint005
     * @tc.desc       : test nearbyint
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNearbyint005', 0, async (done: Function) => {
      let a: number = Math.sqrt(-1);
      let data: Number = math.nearbyint(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEARBYINTF_0100
     * @tc.name       : testMuslMathNearbyintf001
     * @tc.desc       : test nearbyintf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNearbyintf001', 0, async (done: Function) => {
      let a: number = 2.26;
      let data: Number = math.nearbyintf(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(2);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEARBYINTF_0200
     * @tc.name       : testMuslMathNearbyintf002
     * @tc.desc       : test nearbyintf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNearbyintf002', 0, async (done: Function) => {
      let a: number = 2.66;
      let data: Number = math.nearbyintf(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(3);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEARBYINTF_0300
     * @tc.name       : testMuslMathNearbyintf003
     * @tc.desc       : test nearbyintf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNearbyintf003', 0, async (done: Function) => {
      let a: number = -2.29;
      let data: Number = math.nearbyintf(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(-2);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEARBYINTF_0400
     * @tc.name       : testMuslMathNearbyintf004
     * @tc.desc       : test nearbyintf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNearbyintf004', 0, async (done: Function) => {
      let a: number = -2.62;
      let data: Number = math.nearbyintf(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(-3);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEARBYINTF_0500
     * @tc.name       : testMuslMathNearbyintf005
     * @tc.desc       : test nearbyintf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNearbyintf005', 0, async (done: Function) => {
      let a: number = Math.sqrt(-1);
      let data: Number = math.nearbyintf(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEARBYINTL_0100
     * @tc.name       : testMuslMathNearbyintl001
     * @tc.desc       : test nearbyintl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNearbyintl001', 0, async (done: Function) => {
      let a: number = 2.26;
      let data: Number = math.nearbyintl(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(2);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEARBYINTL_0200
     * @tc.name       : testMuslMathNearbyintl002
     * @tc.desc       : test nearbyintl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNearbyintl002', 0, async (done: Function) => {
      let a: number = 2.66;
      let data: Number = math.nearbyintl(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(3);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEARBYINTL_0300
     * @tc.name       : testMuslMathNearbyintl003
     * @tc.desc       : test nearbyintl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNearbyintl003', 0, async (done: Function) => {
      let a: number = -2.29;
      let data: Number = math.nearbyintl(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(-2);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEARBYINTL_0400
     * @tc.name       : testMuslMathNearbyintl004
     * @tc.desc       : test nearbyintl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNearbyintl004', 0, async (done: Function) => {
      let a: number = -2.62;
      let data: Number = math.nearbyintl(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(-3);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEARBYINTL_0500
     * @tc.name       : testMuslMathNearbyintl005
     * @tc.desc       : test nearbyintl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNearbyintl005', 0, async (done: Function) => {
      let a: number = Math.sqrt(-1);
      let data: Number = math.nearbyintl(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NAN_0100
     * @tc.name       : testMuslMathNan001
     * @tc.desc       : test nan
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNan001', 0, async (done: Function) => {
      let a: string = "adc";
      let data: number = math.nan(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NAN_0200
     * @tc.name       : testMuslMathNan002
     * @tc.desc       : test nan
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNan002', 0, async (done: Function) => {
      let a: string = "123";
      let data: Number = math.nan(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NAN_0300
     * @tc.name       : testMuslMathNan003
     * @tc.desc       : test nan
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNan003', 0, async (done: Function) => {
      let a: string = "abc123";
      let data: Number = math.nan(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NANF_0100
     * @tc.name       : testMuslMathNanf001
     * @tc.desc       : test nanf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNanf001', 0, async (done: Function) => {
      let a: string = "123";
      let data: Number = math.nanf(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NANF_0200
     * @tc.name       : testMuslMathNanf002
     * @tc.desc       : test nanf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNanf002', 0, async (done: Function) => {
      let a: string = "abc";
      let data: number = math.nanf(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NANF_0300
     * @tc.name       : testMuslMathNanf003
     * @tc.desc       : test nanf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNanf003', 0, async (done: Function) => {
      let a: string = "abc123";
      let data: number = math.nanf(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NANL_0100
     * @tc.name       : testMuslMathNanl001
     * @tc.desc       : test nanl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNanl001', 0, async (done: Function) => {
      let a: string = "abc";
      let data: number = math.nanl(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NANL_0200
     * @tc.name       : testMuslMathNanl002
     * @tc.desc       : test nanl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNanl002', 0, async (done: Function) => {
      let a: string = "123";
      let data: Number = math.nanl(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NANL_0300
     * @tc.name       : testMuslMathNanl003
     * @tc.desc       : test nanl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNanl003', 0, async (done: Function) => {
      let a: string = "abc123";
      let data: Number = math.nanl(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEXTTOWARD_0100
     * @tc.name       : testMuslMathNexttoward001
     * @tc.desc       : test nexttoward
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNexttoward001', 0, async (done: Function) => {
      let a: number = 1;
      let b = 1;
      let data: Number = math.nextToward(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEXTTOWARD_0200
     * @tc.name       : testMuslMathNexttoward002
     * @tc.desc       : test nexttoward
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNexttoward002', 0, async (done: Function) => {
      let a: number = 1;
      let b = Math.sqrt(-1);
      let data: Number = math.nextToward(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEXTTOWARD_0300
     * @tc.name       : testMuslMathNexttoward003
     * @tc.desc       : test nexttoward
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNexttoward003', 0, async (done: Function) => {
      let a: number = 0;
      let b = 0.1;
      let data: Number = math.nextToward(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect((data == 5e-324)||(data == 0)||(data == 1.401298464324817e-45)).assertEqual(true);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEXTTOWARDF_0100
     * @tc.name       : testMuslMathNexttowardF001
     * @tc.desc       : test nexttowarf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNexttowardF001', 0, async (done: Function) => {
      let a: number = 1;
      let b = 1;
      let data: Number = math.nextTowardF(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEXTTOWARDF_0200
     * @tc.name       : testMuslMathNexttowardF002
     * @tc.desc       : test nexttowarf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNexttowardF002', 0, async (done: Function) => {
      let a: number = 1;
      let b = Math.sqrt(-1);
      let data: Number = math.nextTowardF(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEXTTOWARDF_0300
     * @tc.name       : testMuslMathNexttowardF003
     * @tc.desc       : test nexttowarf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNexttowardF003', 0, async (done: Function) => {
      let a: number = 0;
      let b = 0.1;
      let data: Number = math.nextTowardF(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect((data == 5e-324)||(data == 0)||(data == 1.401298464324817e-45)).assertEqual(true);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEXTTOWARDL_0100
     * @tc.name       : testMuslMathNexttowardL001
     * @tc.desc       : test nexttowarl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNexttowardL001', 0, async (done: Function) => {
      let a: number = 1;
      let b = 1;
      let data: Number = math.nextTowardL(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEXTTOWARDL_0200
     * @tc.name       : testMuslMathNexttowardL002
     * @tc.desc       : test nexttowarl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNexttowardL002', 0, async (done: Function) => {
      let a: number = 1;
      let b = Math.sqrt(-1);
      let data: Number = math.nextTowardL(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertNaN();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_NEXTTOWARDL_0300
     * @tc.name       : testMuslMathNexttowardL003
     * @tc.desc       : test nexttowarl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathNexttowardL003', 0, async (done: Function) => {
      let a: number = 0;
      let b = 0.1;
      let data: Number = math.nextTowardL(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect((data == 5e-324)||(data == 0)||(data == 1.401298464324817e-45)).assertEqual(true);
      done();
    });


    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_LRINT_0100
     * @tc.name     : testMuslMathLRint001
     * @tc.desc     : test lRint
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathLRint001', 0, async (done: Function) => {
      let param = 3.7;
      let result: number = math.lRint(param);
      console.info("Test lRint result = " + JSON.stringify(result));
      expect(result).assertEqual(4);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_ MUSL_MATH_LRINT_0200
     * @tc.name     : testMuslMathLRint002
     * @tc.desc     : test lRint
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathLRint002', 0, async (done: Function) => {
      let param = -1.1;
      let result: number = math.lRint(param);
      console.info("Test lRint result = " + JSON.stringify(result));
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_LRINT_0300
     * @tc.name     : testMuslMathLRint003
     * @tc.desc     : test lRint
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathLRint003', 0, async (done: Function) => {
      let param = 0.3;
      let result: number = math.lRint(param);
      console.info("Test lRint result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_LRINTF_0100
     * @tc.name     : testMuslMathLRintf001
     * @tc.desc     : test lRintf
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathLRintf001', 0, async (done: Function) => {
      let param = 11.8;
      let result: number = math.lRintf(param);
      console.info("Test lRintf result = " + JSON.stringify(result));
      expect(result).assertEqual(12);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_LRINTF_0200
     * @tc.name     : testMuslMathLRintf002
     * @tc.desc     : test lRintf
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathLRintf002', 0, async (done: Function) => {
      let param = -5.1;
      let result: number = math.lRintf(param);
      console.info("Test lRintF result = " + JSON.stringify(result));
      expect(result).assertEqual(-5);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_LRINTF_0300
     * @tc.name     : testMuslMathLRintf003
     * @tc.desc     : test lRintf
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathLRintf003', 0, async (done: Function) => {
      let param = 0.6;
      let result: number = math.lRintf(param);
      console.info("Test lRintf result = " + JSON.stringify(result));
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_LRINTL_0100
     * @tc.name     : testMuslMathLRintl001
     * @tc.desc     : test lRintl
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathLRintl001', 0, async (done: Function) => {
      let param = 5.1;
      let result: number = math.lRintl(param);
      console.info("Test lRintl result = " + JSON.stringify(result));
      expect(result).assertEqual(5);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_LRINTL_0200
     * @tc.name     : testMuslMathLRintl002
     * @tc.desc     : test lRintl
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathLRintl002', 0, async (done: Function) => {
      let param = -0.6;
      let result: number = math.lRintl(param);
      console.info("Test lRintl result = " + JSON.stringify(result));
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number   :SUB_THIRDPARTY_MUSL_MATH_LRINTL_0300
     * @tc.name     : testMuslMathLRintl003
     * @tc.desc     : test lRintl
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathLRintl003', 0, async (done: Function) => {
      let param = (4.6);
      let result: number = math.lRintl(param);
      console.info("Test lRintl result = " + JSON.stringify(result));
      expect(result).assertEqual(5);
      done()
    });


    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_LROUND_0100
     * @tc.name     : testMuslMathLRound001
     * @tc.desc     : test lround
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathLRound001', 0, async (done: Function) => {
      let param = 5.1;
      let result: number = math.lRound(param);
      expect(result).assertEqual(5);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_LROUND_0200
     * @tc.name     : testMuslMathLRound002
     * @tc.desc     : test lRound
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathLRound002', 0, async (done: Function) => {
      let param = -1.1;
      let result: number = math.lRound(param);
      console.info("Test lRound result = " + JSON.stringify(result));
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_LROUND_0300
     * @tc.name     : testMuslMathLRound003
     * @tc.desc     : test lRound
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathLRound003', 0, async (done: Function) => {
      let param = 11.2;
      let result: number = math.lRound(param);
      console.info("Test lRound result = " + JSON.stringify(result));
      expect(result).assertEqual(11);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_LROUNDF_0100
     * @tc.name     : testMuslMathLRoundf001
     * @tc.desc     : test lRoundf
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathLRoundf001', 0, async (done: Function) => {
      let param = 11.87;
      let result: number = math.lRoundf(param);
      console.info("Test lRoundf result = " + JSON.stringify(result));
      expect(result).assertEqual(12);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_LROUNDF_0200
     * @tc.name     : testMuslMathLRoundf002
     * @tc.desc     : test lRoundf
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathLRoundf002', 0, async (done: Function) => {
      let param = -11.1;
      let result: number = math.lRoundf(param);
      console.info("Test lRoundf result = " + JSON.stringify(result));
      expect(result).assertEqual(-11);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_LROUNDF_0300
     * @tc.name     : testMuslMathLRoundF003
     * @tc.desc     : test lRoundf
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathLRoundF003', 0, async (done: Function) => {
      let param = 11.5;
      let result: number = math.lRoundf(param);
      console.info("Test lRoundf result = " + JSON.stringify(result));
      expect(result).assertEqual(12);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_LROUNDL_0100
     * @tc.name     : testMuslMathLRoundl001
     * @tc.desc     : test lRoundl
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathLRoundl001', 0, async (done: Function) => {
      let param = 11.87;
      let result: number = math.lRoundl(param);
      console.info("Test lRoundl result = " + JSON.stringify(result));
      expect(result).assertEqual(12);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_LROUNDL_0200
     * @tc.name     : testMuslMathLRoundl002
     * @tc.desc     : test lRoundl
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathLRoundl002', 0, async (done: Function) => {
      let param = -1.1;
      let result: number = math.lRoundl(param);
      console.info("Test lRoundl result = " + JSON.stringify(result));
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_LROUNDL_0300
     * @tc.name     : testMuslMathLRoundl003
     * @tc.desc     : test lRoundl
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathLRoundl003', 0, async (done: Function) => {
      let param = 11.2;
      let result: number = math.lRoundl(param);
      console.info("Test lRoundL result = " + JSON.stringify(result));
      expect(result).assertEqual(11);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_ILOGB_0100
     * @tc.name     : testMuslMathILogb001
     * @tc.desc     : test ilogb
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathILogb001', 0, async (done: Function) => {
      let param = 16.81;
      let result: number = math.ilogb(param);
      expect(result).assertEqual(4);
      done()
    });
    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_ILOGB_0200
     * @tc.name     : testMuslMathILogb002
     * @tc.desc     : test ilogb
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathILogb002', 0, async (done: Function) => {
      let param = 0.19;
      let result: number = math.ilogb(param);
      console.info("Test ILogb result = " + JSON.stringify(result));
      expect(result).assertEqual(-3);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_ILOGBF_0100
     * @tc.name     : testMuslMathILogbf001
     * @tc.desc     : test ilogbf
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathILogbf001', 0, async (done: Function) => {
      let param = 8.00;
      let result: number = math.ilogbf(param);
      console.info("Test ILogb result = " + JSON.stringify(result));
      expect(result).assertEqual(3);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_ILOGBF_0200
     * @tc.name     : testMuslMathILogbf002
     * @tc.desc     : test ilogbf
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathILogbf002', 0, async (done: Function) => {
      let param = 0.19;
      let result: number = math.ilogbf(param);
      console.info("Test ILogb result = " + JSON.stringify(result));
      expect(result).assertEqual(-3);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_ILOGBL_0100
     * @tc.name     : testMuslMathILogbl001
     * @tc.desc     : test ilogbl
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathILogbl001', 0, async (done: Function) => {
      let param = 17.0;
      let result: number = math.ilogbl(param);
      console.info("Test ILogb result = " + JSON.stringify(result));
      expect(result).assertEqual(4);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_ILOGBL_0200
     * @tc.name     : testMuslMathILogbl002
     * @tc.desc     : test ilogbl
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathILogbl002', 0, async (done: Function) => {
      let param = 0.19;
      let result: number = math.ilogbl(param);
      console.info("Test ILogb result = " + JSON.stringify(result));
      expect(result).assertEqual(-3);
      done()
    });


    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_HYPOT_0100
     * @tc.name     : testMuslMathHYpot001
     * @tc.desc     : test hypot
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathHYpot001', 0, async (done: Function) => {
      let x = 3;
      let y = 4;
      let result: number = math.hypot(x, y);
      expect(result).assertEqual(5);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_HYPOT_0200
     * @tc.name     : testMuslMathHYpot002
     * @tc.desc     : test hypot
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathHYpot002', 0, async (done: Function) => {
      let x = 9;
      let y = 12;
      let result: number = math.hypot(x, y);
      expect(result).assertEqual(15);
      done()
    });


    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_HYPOTF_0100
     * @tc.name     : testMuslMathhypotf001
     * @tc.desc     : test hypotf
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathhypotf001', 0, async (done: Function) => {
      let x = 6;
      let y = 8;
      let result: number = math.hypotf(x, y);
      expect(result).assertEqual(10);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_HYPOTF_0200
     * @tc.name     : testMuslMathhypotf002
     * @tc.desc     : test hypotf
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathhypotf002', 0, async (done: Function) => {
      let x = 8;
      let y = 15;
      let result: number = math.hypotf(x, y);
      expect(result).assertEqual(17);
      done()
    });
    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_HYPOTL_0100
     * @tc.name     : testMuslMathHYpotl001
     * @tc.desc     : test hypotl
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathHYpotl001', 0, async (done: Function) => {
      let x = 7;
      let y = 24;
      let result: number = math.hypotl(x, y);
      expect(result).assertEqual(25);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_HYPOTL_0200
     * @tc.name     : testMuslMathHYpotl002
     * @tc.desc     : test hypotl
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathHYpotl002', 0, async (done: Function) => {
      let x = 65;
      let y = 72;
      let result: number = math.hypotl(x, y);
      expect(result).assertEqual(97);
      done()
    });
    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MATH_SIGNGAM_0100
     * @tc.name     : testMuslMathSignGam001
     * @tc.desc     : test signgam
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslMathSignGam001', 0, async (done: Function) => {
      let x = 0.5;
      let result: number = math.signGam(x);
      expect(result).assertEqual(1);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_YN_0100
     * @tc.name       : testMuslMathYn001
     * @tc.desc       : test yn
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathYn001', 0, async (done: Function) => {
      let result: number = math.yn();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_YNF_0100
     * @tc.name       : testMuslMathYnf001
     * @tc.desc       : test ynf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathYnf001', 0, async (done: Function) => {
      let result: number = math.ynf();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SINCOSL_0100
     * @tc.name       : testMuslMathSincosl001
     * @tc.desc       : test sincosl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSincosl001', 0, async (done: Function) => {
      let b = 90;
      let c = 0.89
      let a: number = math.sincosl(b, 1);
      expect(Number(a).toFixed(2)).assertEqual(c.toString());
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SINCOSL_0200
     * @tc.name       : testMuslMathSincosl002
     * @tc.desc       : test sincosl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSincosl002', 0, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sincosl(b, 1);
      expect(a).assertNaN();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SINCOSL_0300
     * @tc.name       : testMuslMathSincosl003
     * @tc.desc       : test sincosl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSincosl003', 0, async (done: Function) => {
      let b = 90;
      let c = -0.45
      let a: number = math.sincosl(b, 2);
      expect(Number(a).toFixed(2)).assertEqual(c.toString());
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SINCOSL_0400
     * @tc.name       : testMuslMathSincosl004
     * @tc.desc       : test sincosl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSincosl004', 0, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sincosl(b, 2);
      expect(a).assertNaN();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SINCOS_0100
     * @tc.name       : testMuslMathSincos001
     * @tc.desc       : test sincos
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSincos001', 0, async (done: Function) => {
      let b = 90;
      let c = 0.89
      let a: number = math.sincos(b, 1);
      expect(Number(a).toFixed(2)).assertEqual(c.toString());
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SINCOS_0200
     * @tc.name       : testMuslMathSincos002
     * @tc.desc       : test sincos
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSincos002', 0, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sincos(b, 1);
      expect(a).assertNaN();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SINCOS_0300
     * @tc.name       : testMuslMathSincos003
     * @tc.desc       : test sincos
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSincos003', 0, async (done: Function) => {
      let b = 90;
      let c = -0.45
      let a: number = math.sincos(b, 2);
      expect(Number(a).toFixed(2)).assertEqual(c.toString());
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SINCOS_0400
     * @tc.name       : testMuslMathSincos004
     * @tc.desc       : test sincos
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSincos004', 0, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sincos(b, 2);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SINCOSF_0100
     * @tc.name       : testMuslMathSincosf001
     * @tc.desc       : test sincosf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSincosf001', 0, async (done: Function) => {
      let b = 90;
      let c = 0.89
      let a: number = math.sincosf(b, 1);
      expect(Number(a).toFixed(2)).assertEqual(c.toString());
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SINCOSF_0200
     * @tc.name       : testMuslMathSincosf002
     * @tc.desc       : test sincosf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSincosf002', 0, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sincosf(b, 1);
      expect(a).assertNaN();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SINCOSF_0300
     * @tc.name       : testMuslMathSincosf003
     * @tc.desc       : test sincosf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSincosf003', 0, async (done: Function) => {
      let b = 90;
      let c = -0.45
      let a: number = math.sincosf(b, 2);
      expect(Number(a).toFixed(2)).assertEqual(c.toString());
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SINCOSF_0400
     * @tc.name       : testMuslMathSincosf004
     * @tc.desc       : test sincosf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSincosf004', 0, async (done: Function) => {
      let b = Math.sqrt(-1);
      let a: number = math.sincosf(b, 2);
      expect(a).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SIGNIFICAND_0100
     * @tc.name       : testMuslMathSignificand001
     * @tc.desc       : test significand
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSignificand001', 0, async (done: Function) => {
      let b = 0.0
      let a: number = math.significand(b);
      expect(a).assertEqual(0.0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SIGNIFICAND_0200
     * @tc.name       : testMuslMathSignificand002
     * @tc.desc       : test significand
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSignificand002', 0, async (done: Function) => {
      let b = 1 / 0
      let a: number = math.significand(b);
      expect(a).assertEqual(1 / 0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SIGNIFICAND_0300
     * @tc.name       : testMuslMathSignificand003
     * @tc.desc       : test significand
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSignificand003', 0, async (done: Function) => {
      let b = 12.25
      let a: number = math.significand(b);
      expect(a).assertEqual(1.53125);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SIGNIFICANDF_0100
     * @tc.name       : testMuslMathSignificandf001
     * @tc.desc       : test significandf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSignificandf001', 0, async (done: Function) => {
      let b = 0.0
      let a: number = math.significandf(b);
      expect(a).assertEqual(0.0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SIGNIFICANDF_0200
     * @tc.name       : testMuslMathSignificandf002
     * @tc.desc       : test significandf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSignificandf002', 0, async (done: Function) => {
      let b = 1 / 0
      let a: number = math.significandf(b);
      expect(a).assertEqual(1 / 0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SIGNIFICANDF_0300
     * @tc.name       : testMuslMathSignificandf003
     * @tc.desc       : test significandf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathSignificandf003', 0, async (done: Function) => {
      let b = 12.25
      let a: number = math.significandf(b);
      expect(a).assertEqual(1.53125);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALB_0100
     * @tc.name       : testMuslMathScalb001
     * @tc.desc       : test scalb
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalb001', 0, async (done: Function) => {
      let param = 12;
      let param2 = 1;
      let result: number = math.scalb(param, param2);
      console.info("Test scalb result = " + JSON.stringify(result));
      expect(result).assertEqual(24);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALB_0200
     * @tc.name       : testMuslMathScalb002
     * @tc.desc       : test scalb
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalb002', 0, async (done: Function) => {
      let param = 200 / 0;
      let param2 = 0;
      let result: number = math.scalb(param, param2);
      console.info("Test scalb result = " + JSON.stringify(result));
      expect(result).assertEqual(200 / 0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALB_0300
     * @tc.name       : testMuslMathScalb003
     * @tc.desc       : test scalb
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalb003', 0, async (done: Function) => {
      let param = 200 / -0;
      let param2 = 0;
      let result: number = math.scalb(param, param2);
      console.info("Test scalb result = " + JSON.stringify(result));
      expect(result).assertEqual(200 / -0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALBF_0100
     * @tc.name       : testMuslMathScalbf001
     * @tc.desc       : test scalbf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalbf001', 0, async (done: Function) => {
      let param = 12;
      let param2 = 1;
      let result: number = math.scalbf(param, param2);
      console.info("Test scalbf result = " + JSON.stringify(result));
      expect(result).assertEqual(24);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALBF_0200
     * @tc.name       : testMuslMathScalbf002
     * @tc.desc       : test scalbf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalbf002', 0, async (done: Function) => {
      let param = 200 / 0;
      let param2 = 0;
      let result: number = math.scalbf(param, param2);
      console.info("Test scalbf result = " + JSON.stringify(result));
      expect(result).assertEqual(200 / 0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SCALBF_0300
     * @tc.name       : testMuslMathScalbf003
     * @tc.desc       : test scalbf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathScalbf003', 0, async (done: Function) => {
      let param = 200 / -0;
      let param2 = 0;
      let result: number = math.scalbf(param, param2);
      console.info("Test scalbf result = " + JSON.stringify(result));
      expect(result).assertEqual(200 / -0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TRUNC_0100
     * @tc.name       : testMuslMathTrunc001
     * @tc.desc       : test trunc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTrunc001', 0, async (done: Function) => {
      let param = 12;
      let result: number = math.trunc(param);
      console.info("Test trunc result = " + JSON.stringify(result));
      expect(result).assertEqual(12);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TRUNC_0200
     * @tc.name       : testMuslMathTrunc002
     * @tc.desc       : test trunc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTrunc002', 0, async (done: Function) => {
      let param = 10.25;
      let result: number = math.trunc(param);
      console.info("Test trunc result = " + JSON.stringify(result));
      expect(result).assertEqual(10);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TRUNC_0300
     * @tc.name       : testMuslMathTrunc003
     * @tc.desc       : test trunc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTrunc003', 0, async (done: Function) => {
      let param = 200 / 0;
      let result: number = math.trunc(param);
      console.info("Test trunc result = " + JSON.stringify(result));
      expect(result).assertEqual(200 / 0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TRUNC_0400
     * @tc.name       : testMuslMathTrunc004
     * @tc.desc       : test trunc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTrunc004', 0, async (done: Function) => {
      let param = Math.sqrt(-1);
      let result: number = math.trunc(param);
      console.info("Test trunc result = " + JSON.stringify(result));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TRUNCF_0100
     * @tc.name       : testMuslMathTruncf001
     * @tc.desc       : test truncf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTruncf001', 0, async (done: Function) => {
      let param = 12;
      let result: number = math.truncf(param);
      console.info("Test truncf result = " + JSON.stringify(result));
      expect(result).assertEqual(12);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TRUNCF_0200
     * @tc.name       : testMuslMathTruncf002
     * @tc.desc       : test truncf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTruncf002', 0, async (done: Function) => {
      let param = 10.25;
      let result: number = math.truncf(param);
      console.info("Test truncf result = " + JSON.stringify(result));
      expect(result).assertEqual(10);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TRUNCF_0300
     * @tc.name       : testMuslMathTruncf003
     * @tc.desc       : test truncf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTruncf003', 0, async (done: Function) => {
      let param = 200 / 0;
      let result: number = math.truncf(param);
      console.info("Test trunc result = " + JSON.stringify(result));
      expect(result).assertEqual(200 / 0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TRUNCF_0400
     * @tc.name       : testMuslMathTruncf004
     * @tc.desc       : test truncf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTruncf004', 0, async (done: Function) => {
      let param = Math.sqrt(-1);
      let result: number = math.truncf(param);
      console.info("Test truncf result = " + JSON.stringify(result));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TRUNCL_0100
     * @tc.name       : testMuslMathTruncl001
     * @tc.desc       : test truncl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTruncl001', 0, async (done: Function) => {
      let param = 12;
      let result: number = math.truncl(param);
      console.info("Test truncl result = " + JSON.stringify(result));
      expect(result).assertEqual(12);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TRUNCL_0200
     * @tc.name       : testMuslMathTruncl002
     * @tc.desc       : test truncl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTruncl002', 0, async (done: Function) => {
      let param = 10.25;
      let result: number = math.truncl(param);
      console.info("Test truncl result = " + JSON.stringify(result));
      expect(result).assertEqual(10);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TRUNCL_0300
     * @tc.name       : testMuslMathTruncl003
     * @tc.desc       : test truncl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTruncl003', 0, async (done: Function) => {
      let param = 200 / 0;
      let result: number = math.truncl(param);
      console.info("Test truncl result = " + JSON.stringify(result));
      expect(result).assertEqual(200 / 0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_TRUNCL_0400
     * @tc.name       : testMuslMathTruncl004
     * @tc.desc       : test truncl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathTruncl004', 0, async (done: Function) => {
      let param = Math.sqrt(-1);
      let result: number = math.truncl(param);
      console.info("Test truncfl result = " + JSON.stringify(result));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_Y0_0100
     * @tc.name       : testMuslMathY0001
     * @tc.desc       : test y0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathY0001', 0, async (done: Function) => {
      let param = Math.sqrt(-1);
      let result: number = math.y0(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_Y0F_0100
     * @tc.name       : testMuslMathY0f001
     * @tc.desc       : test y0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathY0f001', 0, async (done: Function) => {
      let param = Math.sqrt(-1);
      let result: number = math.y0f(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_Y1_0100
     * @tc.name       : testMuslMathY1001
     * @tc.desc       : test y1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathY1001', 0, async (done: Function) => {
      let param = Math.sqrt(-1);
      let result: number = math.y1(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_Y1F_0100
     * @tc.name       : testMuslMathY1f001
     * @tc.desc       : test y1f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathY1f001', 0, async (done: Function) => {
      let param = Math.sqrt(-1);
      let result: number = math.y1f(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CBRT_0100
     * @tc.name       : testMuslMathCbrt001
     * @tc.desc       : test cbrt
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCbrt001', 0, async (done: Function) => {
      let resultTrue: string = Number(-1.00).toFixed(2);
      let Param0 = -1;
      let result: string = Number(math.cbrt(Param0)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CBRT_0200
     * @tc.name       : testMuslMathCbrt002
     * @tc.desc       : test cbrt
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCbrt002', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 0;
      let result: number = math.cbrt(Param0);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CBRT_0300
     * @tc.name       : testMuslMathCbrt003
     * @tc.desc       : test cbrt
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCbrt003', 0, async (done: Function) => {
      let resultTrue: string = Number(1.00).toFixed(2);
      let Param0 = 1;
      let result: string = Number(math.cbrt(Param0)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CBRT_0400
     * @tc.name       : testMuslMathCbrt004
     * @tc.desc       : test cbrt
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCbrt004', 0, async (done: Function) => {
      let result: number = math.cbrt(Math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CBRT_0500
     * @tc.name       : testMuslMathCbrt005
     * @tc.desc       : test cbrt
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCbrt005', 0, async (done: Function) => {
      let Param0 = 1.0 / 0.0;
      let result: number = math.cbrt(Param0);
      expect(result).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CBRT_0600
     * @tc.name       : testMuslMathCbrt006
     * @tc.desc       : test cbrt
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCbrt006', 0, async (done: Function) => {
      let Param0 = -1.0 / 0.0;
      let result: number = math.cbrt(Param0);
      expect(result).assertNegUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CBRTF_0100
     * @tc.name       : testMuslMathCbrtF001
     * @tc.desc       : test cbrtF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCbrtF001', 0, async (done: Function) => {
      let resultTrue: string = Number(-1.00).toFixed(2);
      let Param0 = -1;
      let result: string = Number(math.cbrtf(Param0)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CBRTF_0200
     * @tc.name       : testMuslMathCbrtF002
     * @tc.desc       : test cbrtF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCbrtF002', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 0;
      let result: number = math.cbrtf(Param0);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CBRTF_0300
     * @tc.name       : testMuslMathCbrtF003
     * @tc.desc       : test cbrtF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCbrtF003', 0, async (done: Function) => {
      let resultTrue: string = Number(1.00).toFixed(2);
      let Param0 = 1;
      let result: string = Number(math.cbrtf(Param0)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CBRTF_0400
     * @tc.name       : testMuslMathCbrtF004
     * @tc.desc       : test cbrtF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCbrtF004', 0, async (done: Function) => {
      let result: number = math.cbrtf(Math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CBRTF_0500
     * @tc.name       : testMuslMathCbrtF005
     * @tc.desc       : test cbrtF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCbrtF005', 0, async (done: Function) => {
      let Param0 = 1.0 / 0.0;
      let result: number = math.cbrtf(Param0);
      expect(result).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CBRTF_0600
     * @tc.name       : testMuslMathCbrtF006
     * @tc.desc       : test cbrtF
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCbrtF006', 0, async (done: Function) => {
      let Param0 = -1.0 / 0.0;
      let result: number = math.cbrtf(Param0);
      expect(result).assertNegUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CBRTL_0100
     * @tc.name       : testMuslMathCbrtL001
     * @tc.desc       : test cbrtL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCbrtL001', 0, async (done: Function) => {
      let resultTrue: string = Number(-1.00).toFixed(2);
      let Param0 = -1;
      let result: string = Number(math.cbrtl(Param0)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CBRTL_0200
     * @tc.name       : testMuslMathCbrtL002
     * @tc.desc       : test cbrtL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCbrtL002', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let Param0 = 0;
      let result: number = math.cbrtl(Param0);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CBRTL_0300
     * @tc.name       : testMuslMathCbrtL003
     * @tc.desc       : test cbrtL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCbrtL003', 0, async (done: Function) => {
      let resultTrue: string = Number(1.00).toFixed(2);
      let Param0 = 1;
      let result: string = Number(math.cbrtl(Param0)).toFixed(2);
      expect(result).assertEqual(resultTrue);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CBRTL_0400
     * @tc.name       : testMuslMathCbrtL004
     * @tc.desc       : test cbrtL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCbrtL004', 0, async (done: Function) => {
      let result: number = math.cbrtl(Math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CBRTL_0500
     * @tc.name       : testMuslMathCbrtL005
     * @tc.desc       : test cbrtL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCbrtL005', 0, async (done: Function) => {
      let Param0 = 1.0 / 0.0;
      let result: number = math.cbrtl(Param0);
      expect(result).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_CBRTL_0600
     * @tc.name       : testMuslMathCbrtL006
     * @tc.desc       : test cbrtL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCbrtL006', 0, async (done: Function) => {
      let Param0 = -1.0 / 0.0;
      let result: number = math.cbrtl(Param0);
      expect(result).assertNegUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FREXP_0100
     * @tc.name       : testMuslMathFrexp001
     * @tc.desc       : test frexp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathFrexp001', 0, async (done: Function) => {
      let resultTrue: number = -0.5;
      let Param0 = -1;
      let result: number = math.frexp(Param0);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FREXP_0200
     * @tc.name       : testMuslMathFrexp002
     * @tc.desc       : test frexp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathFrexp002', 0, async (done: Function) => {
      let Param0 = Math.sqrt(-1);
      let result: number = math.frexp(Param0);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FREXP_0300
     * @tc.name       : testMuslMathFrexp003
     * @tc.desc       : test frexp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathFrexp003', 0, async (done: Function) => {
      let resultTrue: number = 0.5;
      let Param0 = 1;
      let result: number = math.frexp(Param0);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FREXP_0400
     * @tc.name       : testMuslMathFrexp004
     * @tc.desc       : test frexp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathFrexp004', 0, async (done: Function) => {
      let result: number = math.frexp(Math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FREXP_0500
     * @tc.name       : testMuslMathFrexp005
     * @tc.desc       : test frexp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathFrexp005', 0, async (done: Function) => {
      let Param0 = 1.0 / 0.0;
      let result: number = math.frexp(Param0);
      expect(result).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FREXP_0600
     * @tc.name       : testMuslMathFrexp006
     * @tc.desc       : test frexp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathFrexp006', 0, async (done: Function) => {
      let Param0 = -1.0 / 0.0;
      let result: number = math.frexp(Param0);
      expect(result).assertNegUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FREXPL_0100
     * @tc.name       : testMuslMathFrexpl001
     * @tc.desc       : test frexpl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathFrexpl001', 0, async (done: Function) => {
      let resultTrue: number = -0.5;
      let Param0 = -1;
      let result: number = math.frexpl(Param0);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FREXPL_0200
     * @tc.name       : testMuslMathFrexpl002
     * @tc.desc       : test frexpl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathFrexpl002', 0, async (done: Function) => {
      let Param0 = Math.sqrt(-1);
      let result: number = math.frexpl(Param0);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FREXPL_0300
     * @tc.name       : testMuslMathFrexpl003
     * @tc.desc       : test frexpl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathFrexpl003', 0, async (done: Function) => {
      let resultTrue: number = 0.5;
      let Param0 = 1;
      let result: number = math.frexpl(Param0);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FREXPL_0400
     * @tc.name       : testMuslMathFrexpl004
     * @tc.desc       : test frexpl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathFrexpl004', 0, async (done: Function) => {
      let result: number = math.frexpl(Math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FREXPL_0500
     * @tc.name       : testMuslMathFrexpl005
     * @tc.desc       : test frexpl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathFrexpl005', 0, async (done: Function) => {
      let Param0 = 1.0 / 0.0;
      let result: number = math.frexpl(Param0);
      expect(result).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FREXPL_0600
     * @tc.name       : testMuslMathFrexpl006
     * @tc.desc       : test frexpl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathFrexpl006', 0, async (done: Function) => {
      let Param0 = -1.0 / 0.0;
      let result: number = math.frexpl(Param0);
      expect(result).assertNegUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FREXPF_0100
     * @tc.name       : testMuslMathFrexpf001
     * @tc.desc       : test frexpf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathFrexpf001', 0, async (done: Function) => {
      let resultTrue: number = -0.5;
      let Param0 = -1;
      let result: number = math.frexpf(Param0);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FREXPF_0200
     * @tc.name       : testMuslMathFrexpf002
     * @tc.desc       : test frexpf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathFrexpf002', 0, async (done: Function) => {
      let Param0 = Math.sqrt(-1);
      let result: number = math.frexpf(Param0);
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FREXPF_0300
     * @tc.name       : testMuslMathFrexpf003
     * @tc.desc       : test frexpf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathFrexpf003', 0, async (done: Function) => {
      let resultTrue: number = 0.5;
      let Param0 = 1;
      let result: number = math.frexpf(Param0);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FREXPF_0400
     * @tc.name       : testMuslMathFrexpf004
     * @tc.desc       : test frexpf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathFrexpf004', 0, async (done: Function) => {
      let result: number = math.frexpf(Math.sqrt(-1));
      expect(result).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FREXPF_0500
     * @tc.name       : testMuslMathFrexpf005
     * @tc.desc       : test frexpf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathFrexpf005', 0, async (done: Function) => {
      let Param0 = 1.0 / 0.0;
      let result: number = math.frexpf(Param0);
      expect(result).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FREXPF_0600
     * @tc.name       : testMuslMathFrexpf006
     * @tc.desc       : test frexpf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathFrexpf006', 0, async (done: Function) => {
      let Param0 = -1.0 / 0.0;
      let result: number = math.frexpf(Param0);
      expect(result).assertNegUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FPCLASSIFYL_0100
     * @tc.name       : testMuslMathFpclassifyl001
     * @tc.desc       : test __fpclassifyl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathFpclassifyl001', 0, async (done: Function) => {
      let resultTrue: number = 2;
      let Param = 0;
      let result: number = math.fpclassifyl(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FPCLASSIFYF_0100
     * @tc.name       : testMuslMathFpclassifyf001
     * @tc.desc       : test __fpclassifyf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathFpclassifyf001', 0, async (done: Function) => {
      let resultTrue: number = 2;
      let Param = 0;
      let result: number = math.fpclassifyf(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FPCLASSIFY_0100
     * @tc.name       : testMuslMathFpclassify001
     * @tc.desc       : test __fpclassify
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathFpclassify001', 0, async (done: Function) => {
      let resultTrue: number = 2;
      let Param = 0;
      let result: number = math.fpclassify(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SIGNBIT_0100
     * @tc.name       : testMuslMathSignbit001
     * @tc.desc       : test __signbit
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathSignbit001', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let Param = 1;
      let result: number = math.signbit(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SIGNBITF_0100
     * @tc.name       : testMuslMathSignbitf001
     * @tc.desc       : test __signbitf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathSignbitf001', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let Param = 1;
      let result: number = math.signbitf(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_SIGNBITL_0100
     * @tc.name       : testMuslMathSignbitl001
     * @tc.desc       : test __signbitl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathSignbitl001', 0, async (done: Function) => {
      let resultTrue: number = 0;
      let Param = 1;
      let result: number = math.signbitl(Param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPM1L_0700
     * @tc.name       : testMuslMathExpM1l007
     * @tc.desc       : test expm1l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExpM1l007', 0, async (done: Function) => {
      let firstParam = 1.9;
      let result = false;
      let data = math.expm1l(firstParam);
      if (data >= -1) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPM1L_0100
     * @tc.name       : testMuslMathExpM1l001
     * @tc.desc       : test expm1l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExpM1l001', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPM1L_0200
     * @tc.name       : testMuslMathExpM1l002
     * @tc.desc       : test expm1l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExpM1l002', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data:number = math.expm1l(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPM1L_0300
     * @tc.name       : testMuslMathExpM1l003
     * @tc.desc       : test expm1l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExpM1l003', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPM1L_0400
     * @tc.name       : testMuslMathExpM1l004
     * @tc.desc       : test expm1l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExpM1l004', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPM1L_0500
     * @tc.name       : testMuslMathExpM1l005
     * @tc.desc       : test expm1l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExpM1l005', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPL_0100
     * @tc.name       : testMuslMathExpL001
     * @tc.desc       : test expl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExpL001', 0, async (done: Function) => {
      let firstParam: number = -1;
      let result = 0.367879;
      let data:number = math.expl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPL_0200
     * @tc.name       : testMuslMathExpL002
     * @tc.desc       : test expl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExpL002', 0, async (done: Function) => {
      let firstParam: number = 0;
      let data:number = math.expl(firstParam);
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPL_0300
     * @tc.name       : testMuslMathExpL003
     * @tc.desc       : test expl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExpL003', 0, async (done: Function) => {
      let firstParam: number = 1;
      let result: number = 2.718;
      let data:number = math.expl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPL_0400
     * @tc.name       : testMuslMathExpL004
     * @tc.desc       : test expl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExpL004', 0, async (done: Function) => {
      let firstParam: number = 1.19;
      let result: number = 3.287;
      let data:number = math.expl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPL_0500
     * @tc.name       : testMuslMathExpL005
     * @tc.desc       : test expl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExpL005', 0, async (done: Function) => {
      let firstParam: number = -1.19;
      let result: number = 0.304;
      let data:number = math.expl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPL_0600
     * @tc.name       : testMuslMathExpL006
     * @tc.desc       : test expl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExpL006', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data:number = math.expl(firstParam);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPL_0700
     * @tc.name       : testMuslMathExpL007
     * @tc.desc       : test expl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExpL007', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data:number = math.expl(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPF_0100
     * @tc.name       : testMuslMathExpF001
     * @tc.desc       : test expf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExpF001', 0, async (done: Function) => {
      let firstParam: number = -1;
      let result: number = 0.367879;
      let data:number = math.expf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPF_0200
     * @tc.name       : testMuslMathExpF002
     * @tc.desc       : test expf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExpF002', 0, async (done: Function) => {
      let firstParam: number = 0;
      let data:number = math.expf(firstParam);
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPF_0300
     * @tc.name       : testMuslMathExpF003
     * @tc.desc       : test expf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExpF003', 0, async (done: Function) => {
      let firstParam: number = 1;
      let result: number = 2.718;
      let data:number = math.expf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPF_0400
     * @tc.name       : testMuslMathExpF004
     * @tc.desc       : test expf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExpF004', 0, async (done: Function) => {
      let firstParam: number = 1.19;
      let result: number = 3.287;
      let data:number = math.expf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPF_0500
     * @tc.name       : testMuslMathExpF005
     * @tc.desc       : test expf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExpF005', 0, async (done: Function) => {
      let firstParam: number = -1.19;
      let result: number = 0.304;
      let data:number = math.expf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPF_0600
     * @tc.name       : testMuslMathExpF006
     * @tc.desc       : test expf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExpF006', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data:number = math.expf(firstParam);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPF_0700
     * @tc.name       : testMuslMathExpF007
     * @tc.desc       : test expf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExpF007', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data:number = math.expf(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXP2L_0100
     * @tc.name       : testMuslMathExp2l001
     * @tc.desc       : test exp2l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExp2l001', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXP2L_0200
     * @tc.name       : testMuslMathExp2l002
     * @tc.desc       : test exp2l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExp2l002', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data:number = math.exp2l(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXP2L_0300
     * @tc.name       : testMuslMathExp2l003
     * @tc.desc       : test exp2l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExp2l003', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXP2L_0400
     * @tc.name       : testMuslMathExp2l004
     * @tc.desc       : test exp2l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExp2l004', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXP2L_0500
     * @tc.name       : testMuslMathExp2l005
     * @tc.desc       : test exp2l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExp2l005', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXP2F_0100
     * @tc.name       : testMuslMathExp2f001
     * @tc.desc       : test exp2f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExp2f001', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXP2F_0200
     * @tc.name       : testMuslMathExp2f002
     * @tc.desc       : test exp2f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExp2f002', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data:number = math.exp2f(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXP2F_0300
     * @tc.name       : testMuslMathExp2f003
     * @tc.desc       : test exp2f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExp2f003', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXP2F_0400
     * @tc.name       : testMuslMathExp2f004
     * @tc.desc       : test exp2f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExp2f004', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXP2F_0500
     * @tc.name       : testMuslMathExp2f005
     * @tc.desc       : test exp2f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExp2f005', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ERFF_0100
     * @tc.name       : testMuslMathErfF001
     * @tc.desc       : test erff
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathErfF001', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ERFL_0100
     * @tc.name       : testMuslMathErfL001
     * @tc.desc       : test erfl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathErfL001', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ERFCL_0100
     * @tc.name       : testMuslMathErfCl001
     * @tc.desc       : test erfcl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathErfCl001', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data:number = math.erfcl(firstParam);
      let result = 2;
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ERFCL_0200
     * @tc.name       : testMuslMathErfCl002
     * @tc.desc       : test erfcl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathErfCl002', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data:number = math.erfcl(firstParam);
      let result = 0;
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ERFCL_0300
     * @tc.name       : testMuslMathErfCl003
     * @tc.desc       : test erfcl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathErfCl003', 0, async (done: Function) => {
      let firstParam: number = 1.0;
      let data:number = math.erfcl(firstParam);
      let result = 0.16;
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ERFCL_0400
     * @tc.name       : testMuslMathErfCl004
     * @tc.desc       : test erfcl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathErfCl004', 0, async (done: Function) => {
      let firstParam: number = 0;
      let data:number = math.erfcl(firstParam);
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ERFCL_0500
     * @tc.name       : testMuslMathErfCl005
     * @tc.desc       : test erfcl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathErfCl005', 0, async (done: Function) => {
      let firstParam: number = -1.9;
      let result: number = 1.992;
      let data:number = math.erfcl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ERFCF_0100
     * @tc.name       : testMuslMathErfCf001
     * @tc.desc       : test erfcf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathErfCf001', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data:number = math.erfcf(firstParam);
      let result = 2;
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ERFCF_0200
     * @tc.name       : testMuslMathErfCf002
     * @tc.desc       : test erfcf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathErfCf002', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let result = 0;
      let data:number = math.erfcf(firstParam);
      expect(data).assertEqual(result);
      done()
    });

/**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COPYSIGNF_0100
     * @tc.name       : testMuslMathCopySignF001
     * @tc.desc       : test copysignf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCopySignF001', 0, async (done: Function) => {
      let firstParam = 11;
      let secondParam = -2;
      let data: number = math.copysignf(firstParam, secondParam);
      expect(data).assertEqual(-11);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COPYSIGNF_0200
     * @tc.name       : testMuslMathCopySignF002
     * @tc.desc       : test copysignf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCopySignF002', 0, async (done: Function) => {
      let firstParam = -11;
      let secondParam = -2;
      let data: number = math.copysignf(firstParam, secondParam);
      expect(data).assertEqual(-11);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COPYSIGNF_0300
     * @tc.name       : testMuslMathCopySignF003
     * @tc.desc       : test copysignf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCopySignF003', 0, async (done: Function) => {
      let firstParam = -11;
      let secondParam = 2;
      let data: number = math.copysignf(firstParam, secondParam);
      expect(data).assertEqual(11);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COPYSIGNF_0400
     * @tc.name       : testMuslMathCopySignF004
     * @tc.desc       : test copysignf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCopySignF004', 0, async (done: Function) => {
      let firstParam = 11;
      let secondParam = 2;
      let data: number = math.copysignf(firstParam, secondParam);
      expect(data).assertEqual(11);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COPYSIGNF_0500
     * @tc.name       : testMuslMathCopySignF005
     * @tc.desc       : test copysignf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCopySignF005', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = -2;
      let data: number = math.copysignf(firstParam, secondParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COPYSIGNF_0600
     * @tc.name       : testMuslMathCopySignF006
     * @tc.desc       : test copysignf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCopySignF006', 0, async (done: Function) => {
      let firstParam = 11;
      let secondParam = -1.0 / 0.0;
      let data: number = math.copysignf(firstParam, secondParam);
      expect(data).assertEqual(-11);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COPYSIGNL_0100
     * @tc.name       : testMuslMathCopySignL001
     * @tc.desc       : test copysignl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCopySignL001', 0, async (done: Function) => {
      let firstParam = 11;
      let secondParam = -2;
      let data: number = math.copysignl(firstParam, secondParam);
      expect(data).assertEqual(-11);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COPYSIGNL_0200
     * @tc.name       : testMuslMathCopySignL002
     * @tc.desc       : test copysignl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCopySignL002', 0, async (done: Function) => {
      let firstParam = -11;
      let secondParam = -2;
      let data: number = math.copysignl(firstParam, secondParam);
      expect(data).assertEqual(-11);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COPYSIGNL_0300
     * @tc.name       : testMuslMathCopySignL003
     * @tc.desc       : test copysignl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCopySignL003', 0, async (done: Function) => {
      let firstParam = -11;
      let secondParam = 2;
      let data: number = math.copysignl(firstParam, secondParam);
      expect(data).assertEqual(11);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COPYSIGNL_0400
     * @tc.name       : testMuslMathCopySignL004
     * @tc.desc       : test copysignl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCopySignL004', 0, async (done: Function) => {
      let firstParam = 11;
      let secondParam = 2;
      let data: number = math.copysignl(firstParam, secondParam);
      expect(data).assertEqual(11);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COPYSIGNL_0500
     * @tc.name       : testMuslMathCopySignL005
     * @tc.desc       : test copysignl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCopySignL005', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let secondParam = -2;
      let data: number = math.copysignl(firstParam, secondParam);
      expect(data).assertNegUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COPYSIGNL_0600
     * @tc.name       : testMuslMathCopySignL006
     * @tc.desc       : test copysignl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCopySignL006', 0, async (done: Function) => {
      let firstParam = 11;
      let secondParam = -1.0 / 0.0;
      let data: number = math.copysignl(firstParam, secondParam);
      expect(data).assertEqual(-11);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSF_0100
     * @tc.name       : testMuslMathCosF001
     * @tc.desc       : test cosf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCosF001', 0, async (done: Function) => {
      let firstParam = 60;
      let result = 0.50;
      let data: number = math.cosf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSF_0200
     * @tc.name       : testMuslMathCosF002
     * @tc.desc       : test cosf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCosF002', 0, async (done: Function) => {
      let firstParam = 0;
      let result = 1.00;
      let data: number = math.cosf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSF_0300
     * @tc.name       : testMuslMathCosF003
     * @tc.desc       : test cosf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCosF003', 0, async (done: Function) => {
      let firstParam = 90;
      let result = -0.00;
      let data: number = math.cosf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSF_0400
     * @tc.name       : testMuslMathCosF004
     * @tc.desc       : test cosf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCosF004', 0, async (done: Function) => {
      let firstParam = -30;
      let result = 0.87;
      let data: number = math.cosf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSF_0500
     * @tc.name       : testMuslMathCosF005
     * @tc.desc       : test cosf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCosF005', 0, async (done: Function) => {
      let firstParam = 0.99;
      let result = 1.00;
      let data: number = math.cosf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSF_0600
     * @tc.name       : testMuslMathCosF006
     * @tc.desc       : test cosf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCosF006', 0, async (done: Function) => {
      let firstParam = 179.99;
      let result = -1.00;
      let data: number = math.cosf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSF_0700
     * @tc.name       : testMuslMathCosF007
     * @tc.desc       : test cosf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCosF007', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: number = math.cosf(firstParam);
      expect(data).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSF_0800
     * @tc.name       : testMuslMathCosF008
     * @tc.desc       : test cosf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCosF008', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: number = math.cosf(firstParam);
      expect(data).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSL_0100
     * @tc.name       : testMuslMathCosL001
     * @tc.desc       : test cosl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCosL001', 0, async (done: Function) => {
      let firstParam = 60;
      let result = 0.50;
      let data: number = math.cosl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSL_0200
     * @tc.name       : testMuslMathCosL002
     * @tc.desc       : test cosl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCosL002', 0, async (done: Function) => {
      let firstParam = 0;
      let result = 1.00;
      let data: number = math.cosl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSL_0300
     * @tc.name       : testMuslMathCosL003
     * @tc.desc       : test cosl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCosL003', 0, async (done: Function) => {
      let firstParam = 90;
      let result = 0.00;
      let data: number = math.cosl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSL_0400
     * @tc.name       : testMuslMathCosL004
     * @tc.desc       : test cosl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCosL004', 0, async (done: Function) => {
      let firstParam = -30;
      let result = 0.87;
      let data: number = math.cosl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSL_0500
     * @tc.name       : testMuslMathCosL005
     * @tc.desc       : test cosl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCosL005', 0, async (done: Function) => {
      let firstParam = 0.99;
      let result = 1.00;
      let data: number = math.cosl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSL_0600
     * @tc.name       : testMuslMathCosL006
     * @tc.desc       : test cosl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCosL006', 0, async (done: Function) => {
      let firstParam = 179.99;
      let result = -1.00;
      let data: number = math.cosl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSL_0700
     * @tc.name       : testMuslMathCosL007
     * @tc.desc       : test cosl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCosL007', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: number = math.cosl(firstParam);
      expect(data).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSL_0800
     * @tc.name       : testMuslMathCosL008
     * @tc.desc       : test cosl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCosL008', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: number = math.cosl(firstParam);
      expect(data).assertNaN();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSHF_0100
     * @tc.name       : testMuslMathCoshF001
     * @tc.desc       : test coshf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCoshF001', 0, async (done: Function) => {
      let firstParam = 90;
      let result = 2.50918;
      let data: number = math.coshf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSHF_0200
     * @tc.name       : testMuslMathCoshF002
     * @tc.desc       : test coshf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCoshF002', 0, async (done: Function) => {
      let firstParam = 0;
      let result = 1;
      let data: number = math.coshf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSHF_0300
     * @tc.name       : testMuslMathCoshF003
     * @tc.desc       : test coshf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCoshF003', 0, async (done: Function) => {
      let firstParam = -30;
      let result = 1.14023;
      let data: number = math.coshf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSHF_0400
     * @tc.name       : testMuslMathCoshF004
     * @tc.desc       : test coshf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCoshF004', 0, async (done: Function) => {
      let firstParam = -60;
      let result = 1.60;
      let data: number = math.coshf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSHF_0500
     * @tc.name       : testMuslMathCoshF005
     * @tc.desc       : test coshf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCoshF005', 0, async (done: Function) => {
      let firstParam = 0.99;
      let result = 1.00;
      let data: number = math.coshf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSHF_0600
     * @tc.name       : testMuslMathCoshF006
     * @tc.desc       : test coshf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCoshF006', 0, async (done: Function) => {
      let firstParam = 179.99;
      let result = 11.59;
      let data: number = math.coshf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSHF_0700
     * @tc.name       : testMuslMathCoshF007
     * @tc.desc       : test coshf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCoshF007', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: number = math.coshf(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSHF_0800
     * @tc.name       : testMuslMathCoshF008
     * @tc.desc       : test coshf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCoshF008', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: number = math.coshf(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSHL_0100
     * @tc.name       : testMuslMathCoshL001
     * @tc.desc       : test coshl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCoshL001', 0, async (done: Function) => {
      let firstParam = 90;
      let result = 2.50918;
      let data: number = math.coshl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSHL_0200
     * @tc.name       : testMuslMathCoshL002
     * @tc.desc       : test coshl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCoshL002', 0, async (done: Function) => {
      let firstParam = 0;
      let result = 1;
      let data: number = math.coshl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSHL_0300
     * @tc.name       : testMuslMathCoshL003
     * @tc.desc       : test coshl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCoshL003', 0, async (done: Function) => {
      let firstParam = -30;
      let result = 1.14023;
      let data: number = math.coshl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSHL_0400
     * @tc.name       : testMuslMathCoshL004
     * @tc.desc       : test coshl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCoshL004', 0, async (done: Function) => {
      let firstParam = -60;
      let result = 1.60;
      let data: number = math.coshl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSHL_0500
     * @tc.name       : testMuslMathCoshL005
     * @tc.desc       : test coshl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCoshL005', 0, async (done: Function) => {
      let firstParam = 0.99;
      let result = 1.00;
      let data: number = math.coshl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSHL_0600
     * @tc.name       : testMuslMathCoshL006
     * @tc.desc       : test coshl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCoshL006', 0, async (done: Function) => {
      let firstParam = 179.99;
      let result = 11.59;
      let data: number = math.coshl(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSHL_0700
     * @tc.name       : testMuslMathCoshL007
     * @tc.desc       : test coshl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCoshL007', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: number = math.coshl(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_COSHL_0800
     * @tc.name       : testMuslMathCoshL008
     * @tc.desc       : test coshl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathCoshL008', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: number = math.coshl(firstParam);
      expect(data).assertPosUnlimited();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ERFC_0100
     * @tc.name       : testMuslMathErfC001
     * @tc.desc       : test erfc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathErfC001', 0, async (done: Function) => {
      let firstParam = -1.0 / 0.0;
      let data: number = math.erfc(firstParam);
      let result = 2;
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ERFC_0200
     * @tc.name       : testMuslMathErfC002
     * @tc.desc       : test erfc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathErfC002', 0, async (done: Function) => {
      let firstParam = 1.0 / 0.0;
      let data: number = math.erfc(firstParam);
      let result = 0;
      expect(data).assertEqual(result);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ERFC_0300
     * @tc.name       : testMuslMathErfC003
     * @tc.desc       : test erfc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathErfC003', 0, async (done: Function) => {
      let firstParam = 1.0;
      let data: number = math.erfc(firstParam);
      let result = 0.16;
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ERFC_0400
     * @tc.name       : testMuslMathErfC004
     * @tc.desc       : test erfc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathErfC004', 0, async (done: Function) => {
      let firstParam = 0;
      let data: number = math.erfc(firstParam);
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ERFC_0500
     * @tc.name       : testMuslMathErfC005
     * @tc.desc       : test erfc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathErfC005', 0, async (done: Function) => {
      let firstParam = -1.9;
      let result = 1.992;
      let data: number = math.erfc(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ERFCF_0300
     * @tc.name       : testMuslMathErfCf003
     * @tc.desc       : test erfcf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathErfCf003', 0, async (done: Function) => {
      let firstParam = 1.0;
      let data: number = math.erfcf(firstParam);
      let result = 0.16;
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ERFCF_0400
     * @tc.name       : testMuslMathErfCf004
     * @tc.desc       : test erfcf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathErfCf004', 0, async (done: Function) => {
      let firstParam = 0;
      let data: number = math.erfcf(firstParam);
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_ERFCF_0500
     * @tc.name       : testMuslMathErfCf005
     * @tc.desc       : test erfcf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathErfCf005', 0, async (done: Function) => {
      let firstParam = -1.9;
      let result = 1.992;
      let data: number = math.erfcf(firstParam);
      expect(Number(data).toFixed(2)).assertEqual(Number(result).toFixed(2));
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_EXPM1L_0600
     * @tc.name       : testMuslMathExpM1l006
     * @tc.desc       : test expm1l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMathExpM1l006', 0, async (done: Function) => {
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